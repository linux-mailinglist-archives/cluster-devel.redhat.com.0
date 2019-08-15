Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B658ECC9
	for <lists+cluster-devel@lfdr.de>; Thu, 15 Aug 2019 15:27:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1BD289AD0;
	Thu, 15 Aug 2019 13:27:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8156569CAC;
	Thu, 15 Aug 2019 13:27:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 423AF2551E;
	Thu, 15 Aug 2019 13:27:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7FDRQSn004935 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 09:27:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 45DEF60F8C; Thu, 15 Aug 2019 13:27:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-77.phx2.redhat.com [10.3.117.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 10A5460CC0
	for <cluster-devel@redhat.com>; Thu, 15 Aug 2019 13:27:25 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 15 Aug 2019 08:27:22 -0500
Message-Id: <20190815132722.1522-3-rpeterso@redhat.com>
In-Reply-To: <20190815132722.1522-1-rpeterso@redhat.com>
References: <20190815132722.1522-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 2/2] gfs2: Use async glocks for rename
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Thu, 15 Aug 2019 13:27:34 +0000 (UTC)

Because s_vfs_rename_mutex is not cluster-wide, multiple nodes can
reverse the roles of which directories are "old" and which are "new"
for the purposes of rename. This can cause deadlocks where two nodes
can lock old-then-new but since their roles are reversed, they wait
for each other.

This patch fixes the problem by acquiring all gfs2_rename's inode
glocks asychronously and waits for all glocks to be acquired.
That way all inodes are locked regardless of the order.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c      | 40 ++++++++++++++++++++++++++++++++++++++++
 fs/gfs2/glock.h      |  1 +
 fs/gfs2/incore.h     |  1 +
 fs/gfs2/inode.c      | 13 +++++++++----
 fs/gfs2/ops_fstype.c |  1 +
 5 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index a27dbd3dec01..3334101c9921 100644
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
@@ -952,6 +957,41 @@ int gfs2_glock_wait(struct gfs2_holder *gh)
 	return gh->gh_error;
 }
 
+static int all_glocks_held(unsigned int num_gh, struct gfs2_holder *ghs)
+{
+	struct gfs2_glock *gl = ghs[0].gh_gl;
+	int i;
+
+	for (i = 0; i < num_gh; i++) {
+		if (test_bit(HIF_WAIT, &ghs[i].gh_iflags) ||
+		    !test_bit(HIF_HOLDER, &ghs[i].gh_iflags) ||
+		    gl->gl_state != ghs[i].gh_state)
+			return 0;
+		if (ghs[i].gh_error)
+			return ghs[i].gh_error;
+	}
+	return 1;
+}
+
+/**
+ * gfs2_glock_async_wait - wait on multiple asynchronous glock acquisitions
+ * @gh: the glock holder
+ *
+ * Returns: 0 on success
+ */
+
+int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs)
+{
+	struct gfs2_glock *gl = ghs[0].gh_gl;
+	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
+
+	might_sleep();
+	if (!wait_event_timeout(sdp->sd_async_glock_wait,
+				all_glocks_held(num_gh, ghs), HZ * 2))
+		return -ESTALE;
+	return 0;
+}
+
 /**
  * handle_callback - process a demote request
  * @gl: the glock
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index e4e0bed5257c..a997c42726a4 100644
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
index 1ced4d0a3b04..cb184d6bed9b 100644
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
 		/* grab the resource lock for unlink flag twiddling 
 		 * this is the case of the target file already existing
@@ -1414,6 +1416,9 @@ static int gfs2_rename(struct inode *odir, struct dentry *odentry,
 		if (error)
 			goto out_gunlock;
 	}
+	error = gfs2_glock_async_wait(num_gh, ghs);
+	if (error)
+		goto out_gunlock;
 
 	if (gfs2_holder_initialized(&rd_gh)) {
 		error = gfs2_glock_nq(&rd_gh);
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

