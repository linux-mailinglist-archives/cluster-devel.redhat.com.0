Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC4AA3D07
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Aug 2019 19:31:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DC3D300189C;
	Fri, 30 Aug 2019 17:31:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56CF11001938;
	Fri, 30 Aug 2019 17:31:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 696CE2551C;
	Fri, 30 Aug 2019 17:31:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7UHV6sA030300 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Aug 2019 13:31:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5FEE260A97; Fri, 30 Aug 2019 17:31:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-77.phx2.redhat.com [10.3.117.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B85E60872
	for <cluster-devel@redhat.com>; Fri, 30 Aug 2019 17:31:06 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 30 Aug 2019 12:31:02 -0500
Message-Id: <20190830173102.27437-4-rpeterso@redhat.com>
In-Reply-To: <20190830173102.27437-1-rpeterso@redhat.com>
References: <20190830173102.27437-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v4 3/3] gfs2: Use async glocks for
	rename
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 30 Aug 2019 17:31:12 +0000 (UTC)

Because s_vfs_rename_mutex is not cluster-wide, multiple nodes can
reverse the roles of which directories are "old" and which are "new"
for the purposes of rename. This can cause AB-BA deadlocks where two
nodes can lock old-then-new but since their roles are reversed, they
wait for each other.

There can be several layers of directory dependencies across many
nodes.

This patch fixes the problem by acquiring all gfs2_rename's inode
glocks asychronously and waits for all glocks to be acquired.
That way all inodes are locked regardless of the order.

The timeout value for multiple asynchronous glocks is calculated to
be the total of the individual wait times for each glock times two.

Since gfs2_exchange is very similar to gfs2_rename, both functions
are patched in the same way.

A new async glock wait queue, sd_async_glock_wait, keeps a list of
waiters for these events. If gfs2's holder_wake function detects an
async holder, it wakes up any waiters for the event. The waiter
only tests whether any of its requests are still pending.

Since the glocks are sent to dlm asychronously, the wait function
needs to check to see which glocks, if any, were granted.

If a glock is granted by dlm (and therefore held) its minimum hold
time is checked and adjusted as necessary, as other glock grants do.

If the event times out, all glocks held thus far must be dequeued.
Then, if there are any glocks unaccounted for (IOW, glocks stuck in
AB-BA deadlocks) should eventually be granted when the other node
is finished doing its conflicting rename. We need to loop around
and wait for dlm to respond to those lock requests too.
Releasing the held locks frees the other node from its deadlock.
After we release all requests, we return -ESTALE to the caller
(vfs rename) which loops around and retries the request.

    Node1           Node2
    ---------       ---------
1.  Enqueue A       Enqueue B
2.  Enqueue B       Enqueue A
3.  A granted
6.                  B granted
7.  Wait for B
8.                  Wait for A
9.                  A times out (since Node 1 holds A)
10.                 Dequeue B (since it was granted)
11.                 Wait for all requests from DLM
12. B Granted (since Node2 released it in step 10)
13. Rename
14. Dequeue A
15.                 DLM Grants A
16.                 Dequeue A (due to the timeout and since we
                    no longer have B held for our task).
17. Dequeue B
18.                 Return -ESTALE to vfs
19.                 VFS retries the operation, goto step 1.

This release-all-locks / acquire-all-locks may slow it down as both
nodes struggle in the same way and do the same thing. However, it
should only slow down rename and exchange, and only in cases where
there is contention for the same inodes, which ought to be rare.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c      | 94 +++++++++++++++++++++++++++++++++++++++++++-
 fs/gfs2/glock.h      |  6 +++
 fs/gfs2/incore.h     |  1 +
 fs/gfs2/inode.c      | 34 ++++++++++------
 fs/gfs2/ops_fstype.c |  1 +
 5 files changed, 123 insertions(+), 13 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 661350989e98..0290a22ebccf 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -305,6 +305,11 @@ static void gfs2_holder_wake(struct gfs2_holder *gh)
 	clear_bit(HIF_WAIT, &gh->gh_iflags);
 	smp_mb__after_atomic();
 	wake_up_bit(&gh->gh_iflags, HIF_WAIT);
+	if (gh->gh_flags & GL_ASYNC) {
+		struct gfs2_sbd *sdp = gh->gh_gl->gl_name.ln_sbd;
+
+		wake_up(&sdp->sd_async_glock_wait);
+	}
 }
 
 /**
@@ -959,6 +964,91 @@ int gfs2_glock_wait(struct gfs2_holder *gh)
 	return gh->gh_error;
 }
 
+static int glocks_pending(unsigned int num_gh, struct gfs2_holder *ghs)
+{
+	int i;
+
+	for (i = 0; i < num_gh; i++)
+		if (test_bit(HIF_WAIT, &ghs[i].gh_iflags))
+			return 1;
+	return 0;
+}
+
+/**
+ * gfs2_glock_async_wait - wait on multiple asynchronous glock acquisitions
+ * @num_gh: the number of holders in the array
+ * @ghs: the glock holder array
+ *
+ * Returns: 0 on success, meaning all glocks have been granted and are held.
+ *          -ESTALE if the request timed out, meaning all glocks were released,
+ *          and the caller should retry the operation.
+ */
+
+int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs)
+{
+	struct gfs2_sbd *sdp = ghs[0].gh_gl->gl_name.ln_sbd;
+	int i, ret = 0, timeout = 0;
+	unsigned long start_time = jiffies;
+	bool keep_waiting;
+
+	might_sleep();
+	/*
+	 * Total up the (minimum hold time * 2) of all glocks and use that to
+	 * determine the max amount of time we should wait.
+	 */
+	for (i = 0; i < num_gh; i++)
+		timeout += ghs[i].gh_gl->gl_hold_time << 1;
+
+wait_for_dlm:
+	if (!wait_event_timeout(sdp->sd_async_glock_wait,
+				!glocks_pending(num_gh, ghs), timeout))
+		ret = -ESTALE; /* request timed out. */
+
+	/*
+	 * If dlm granted all our requests, we need to adjust the glock
+	 * minimum hold time values according to how long we waited.
+	 *
+	 * If our request timed out, we need to repeatedly release any held
+	 * glocks we acquired thus far to allow dlm to acquire the remaining
+	 * glocks without deadlocking.  We cannot currently cancel outstanding
+	 * glock acquisitions.
+	 *
+	 * The HIF_WAIT bit tells us which requests still need a response from
+	 * dlm.
+	 *
+	 * If dlm sent us any errors, we return the first error we find.
+	 */
+	keep_waiting = false;
+	for (i = 0; i < num_gh; i++) {
+		/* Skip holders we have already dequeued below. */
+		if (!gfs2_holder_queued(&ghs[i]))
+			continue;
+		/* Skip holders with a pending DLM response. */
+		if (test_bit(HIF_WAIT, &ghs[i].gh_iflags)) {
+			keep_waiting = true;
+			continue;
+		}
+
+		if (test_bit(HIF_HOLDER, &ghs[i].gh_iflags)) {
+			if (ret == -ESTALE)
+				gfs2_glock_dq(&ghs[i]);
+			else
+				gfs2_glock_update_hold_time(ghs[i].gh_gl,
+							    start_time);
+		}
+		if (!ret)
+			ret = ghs[i].gh_error;
+	}
+
+	if (keep_waiting)
+		goto wait_for_dlm;
+
+	/*
+	 * At this point, we've either acquired all locks or released them all.
+	 */
+	return ret;
+}
+
 /**
  * handle_callback - process a demote request
  * @gl: the glock
@@ -1025,9 +1115,9 @@ __acquires(&gl->gl_lockref.lock)
 	struct gfs2_holder *gh2;
 	int try_futile = 0;
 
-	BUG_ON(gh->gh_owner_pid == NULL);
+	GLOCK_BUG_ON(gl, gh->gh_owner_pid == NULL);
 	if (test_and_set_bit(HIF_WAIT, &gh->gh_iflags))
-		BUG();
+		GLOCK_BUG_ON(gl, true);
 
 	if (gh->gh_flags & (LM_FLAG_TRY | LM_FLAG_TRY_1CB)) {
 		if (test_bit(GLF_LOCK, &gl->gl_flags))
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index e4e0bed5257c..b8adaf80e4c5 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -190,6 +190,7 @@ extern void gfs2_holder_uninit(struct gfs2_holder *gh);
 extern int gfs2_glock_nq(struct gfs2_holder *gh);
 extern int gfs2_glock_poll(struct gfs2_holder *gh);
 extern int gfs2_glock_wait(struct gfs2_holder *gh);
+extern int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs);
 extern void gfs2_glock_dq(struct gfs2_holder *gh);
 extern void gfs2_glock_dq_wait(struct gfs2_holder *gh);
 extern void gfs2_glock_dq_uninit(struct gfs2_holder *gh);
@@ -260,6 +261,11 @@ static inline bool gfs2_holder_initialized(struct gfs2_holder *gh)
 	return gh->gh_gl;
 }
 
+static inline bool gfs2_holder_queued(struct gfs2_holder *gh)
+{
+	return !list_empty(&gh->gh_list);
+}
+
 /**
  * glock_set_object - set the gl_object field of a glock
  * @gl: the glock
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 7a993d7c022e..6b450065b9d5 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -725,6 +725,7 @@ struct gfs2_sbd {
 	struct gfs2_glock *sd_freeze_gl;
 	struct work_struct sd_freeze_work;
 	wait_queue_head_t sd_glock_wait;
+	wait_queue_head_t sd_async_glock_wait;
 	atomic_t sd_glock_disposal;
 	struct completion sd_locking_init;
 	struct completion sd_wdack;
diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 50eeb15c6f4f..e1e18fb587eb 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -1388,16 +1388,18 @@ static int gfs2_rename(struct inode *odir, struct dentry *odentry,
 	}
 
 	num_gh = 1;
-	gfs2_holder_init(odip->i_gl, LM_ST_EXCLUSIVE, 0, ghs);
+	gfs2_holder_init(odip->i_gl, LM_ST_EXCLUSIVE, GL_ASYNC, ghs);
 	if (odip != ndip) {
-		gfs2_holder_init(ndip->i_gl, LM_ST_EXCLUSIVE, 0, ghs + num_gh);
+		gfs2_holder_init(ndip->i_gl, LM_ST_EXCLUSIVE,GL_ASYNC,
+				 ghs + num_gh);
 		num_gh++;
 	}
-	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, ghs + num_gh);
+	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_ASYNC, ghs + num_gh);
 	num_gh++;
 
 	if (nip) {
-		gfs2_holder_init(nip->i_gl, LM_ST_EXCLUSIVE, 0, ghs + num_gh);
+		gfs2_holder_init(nip->i_gl, LM_ST_EXCLUSIVE, GL_ASYNC,
+				 ghs + num_gh);
 		num_gh++;
 	}
 
@@ -1406,6 +1408,9 @@ static int gfs2_rename(struct inode *odir, struct dentry *odentry,
 		if (error)
 			goto out_gunlock;
 	}
+	error = gfs2_glock_async_wait(num_gh, ghs);
+	if (error)
+		goto out_gunlock;
 
 	if (nip) {
 		/* Grab the resource group glock for unlink flag twiddling.
@@ -1555,7 +1560,8 @@ static int gfs2_rename(struct inode *odir, struct dentry *odentry,
 		gfs2_glock_dq_uninit(&rd_gh);
 
 	while (x--) {
-		gfs2_glock_dq(ghs + x);
+		if (gfs2_holder_queued(ghs + x))
+			gfs2_glock_dq(ghs + x);
 		gfs2_holder_uninit(ghs + x);
 	}
 out_gunlock_r:
@@ -1585,7 +1591,7 @@ static int gfs2_exchange(struct inode *odir, struct dentry *odentry,
 	struct gfs2_inode *oip = GFS2_I(odentry->d_inode);
 	struct gfs2_inode *nip = GFS2_I(ndentry->d_inode);
 	struct gfs2_sbd *sdp = GFS2_SB(odir);
-	struct gfs2_holder ghs[5], r_gh;
+	struct gfs2_holder ghs[4], r_gh;
 	unsigned int num_gh;
 	unsigned int x;
 	umode_t old_mode = oip->i_inode.i_mode;
@@ -1619,15 +1625,16 @@ static int gfs2_exchange(struct inode *odir, struct dentry *odentry,
 	}
 
 	num_gh = 1;
-	gfs2_holder_init(odip->i_gl, LM_ST_EXCLUSIVE, 0, ghs);
+	gfs2_holder_init(odip->i_gl, LM_ST_EXCLUSIVE, GL_ASYNC, ghs);
 	if (odip != ndip) {
-		gfs2_holder_init(ndip->i_gl, LM_ST_EXCLUSIVE, 0, ghs + num_gh);
+		gfs2_holder_init(ndip->i_gl, LM_ST_EXCLUSIVE, GL_ASYNC,
+				 ghs + num_gh);
 		num_gh++;
 	}
-	gfs2_holder_init(oip->i_gl, LM_ST_EXCLUSIVE, 0, ghs + num_gh);
+	gfs2_holder_init(oip->i_gl, LM_ST_EXCLUSIVE, GL_ASYNC, ghs + num_gh);
 	num_gh++;
 
-	gfs2_holder_init(nip->i_gl, LM_ST_EXCLUSIVE, 0, ghs + num_gh);
+	gfs2_holder_init(nip->i_gl, LM_ST_EXCLUSIVE, GL_ASYNC, ghs + num_gh);
 	num_gh++;
 
 	for (x = 0; x < num_gh; x++) {
@@ -1636,6 +1643,10 @@ static int gfs2_exchange(struct inode *odir, struct dentry *odentry,
 			goto out_gunlock;
 	}
 
+	error = gfs2_glock_async_wait(num_gh, ghs);
+	if (error)
+		goto out_gunlock;
+
 	error = -ENOENT;
 	if (oip->i_inode.i_nlink == 0 || nip->i_inode.i_nlink == 0)
 		goto out_gunlock;
@@ -1696,7 +1707,8 @@ static int gfs2_exchange(struct inode *odir, struct dentry *odentry,
 	gfs2_trans_end(sdp);
 out_gunlock:
 	while (x--) {
-		gfs2_glock_dq(ghs + x);
+		if (gfs2_holder_queued(ghs + x))
+			gfs2_glock_dq(ghs + x);
 		gfs2_holder_uninit(ghs + x);
 	}
 out_gunlock_r:
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 4a8e5a7310f0..f3fd5cd9d43f 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -87,6 +87,7 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
 	gfs2_tune_init(&sdp->sd_tune);
 
 	init_waitqueue_head(&sdp->sd_glock_wait);
+	init_waitqueue_head(&sdp->sd_async_glock_wait);
 	atomic_set(&sdp->sd_glock_disposal, 0);
 	init_completion(&sdp->sd_locking_init);
 	init_completion(&sdp->sd_wdack);
-- 
2.21.0

