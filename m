Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF251F1CBE
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632178;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nf6KHOQpbnjbXd1ES6IXMdzXv/tfH6t5q3CLlrFyZUo=;
	b=e+3x2959hKSCa9aDrTI2OE9tRz1gpC2hqEpLNknp3RDq+KLAwuRAeO7I/9njnTF4sG7c7V
	j2HWHgoSJzKyGJ1S/4O1IeyNW6WwJBYVRIPRY6Ipiw3ARgJGdS9Ien9CW4xLQAgVqDcWmS
	hKBwnOCnbduRA4Sq5d2gOJozah/EIMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-0Vrv-XN8Mru4mNJ58Fk93w-1; Mon, 08 Jun 2020 12:02:53 -0400
X-MC-Unique: 0Vrv-XN8Mru4mNJ58Fk93w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC5A3108BD0B;
	Mon,  8 Jun 2020 16:02:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D7DC5C1BD;
	Mon,  8 Jun 2020 16:02:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89F87B3490;
	Mon,  8 Jun 2020 16:02:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G19db011831 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:01:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8402889274; Mon,  8 Jun 2020 16:01:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B82DC8927A;
	Mon,  8 Jun 2020 16:01:08 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:36 +0200
Message-Id: <20200608160039.549204-18-agruenba@redhat.com>
In-Reply-To: <20200608160039.549204-1-agruenba@redhat.com>
References: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 17/20] gfs2: Smarter iopen glock waiting
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

When trying to upgrade the iopen glock from a shared to an exclusive lock in
gfs2_evict_inode, abort the wait if there is contention on the corresponding
inode glock: in that case, the inode must still be in active use on another
node, and we're not guaranteed to get the iopen glock anytime soon.

To make this work even better, when we notice contention on the iopen glock and
we can't evict the corresponsing inode and release the iopen glock immediately,
poke the inode glock.  The other node(s) trying to acquire the lock can then
abort instead of timing out.

Thanks to Heinz Mauelshagen for pointing out a locking bug in a previous
version of this patch.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 34 ++++++++++++++++++++++++++++++++--
 fs/gfs2/super.c | 11 ++++++++---
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 7ad06dd49352..71091e35f83d 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -783,6 +783,17 @@ bool gfs2_inode_already_deleted(struct gfs2_glock *gl, u64 generation)
 	return generation <= be64_to_cpu(ri->ri_generation_deleted);
 }
 
+static void gfs2_glock_poke(struct gfs2_glock *gl)
+{
+	int flags = LM_FLAG_TRY_1CB | LM_FLAG_ANY | GL_SKIP;
+	struct gfs2_holder gh;
+	int error;
+
+	error = gfs2_glock_nq_init(gl, LM_ST_SHARED, flags, &gh);
+	if (!error)
+		gfs2_glock_dq(&gh);
+}
+
 static bool gfs2_try_evict(struct gfs2_glock *gl)
 {
 	struct gfs2_inode *ip;
@@ -804,6 +815,8 @@ static bool gfs2_try_evict(struct gfs2_glock *gl)
 		ip = NULL;
 	spin_unlock(&gl->gl_lockref.lock);
 	if (ip) {
+		struct gfs2_glock *inode_gl = NULL;
+
 		gl->gl_no_formal_ino = ip->i_no_formal_ino;
 		set_bit(GIF_DEFERRED_DELETE, &ip->i_flags);
 		d_prune_aliases(&ip->i_inode);
@@ -812,9 +825,16 @@ static bool gfs2_try_evict(struct gfs2_glock *gl)
 		/* If the inode was evicted, gl->gl_object will now be NULL. */
 		spin_lock(&gl->gl_lockref.lock);
 		ip = gl->gl_object;
-		if (ip)
+		if (ip) {
+			inode_gl = ip->i_gl;
+			lockref_get(&inode_gl->gl_lockref);
 			clear_bit(GIF_DEFERRED_DELETE, &ip->i_flags);
+		}
 		spin_unlock(&gl->gl_lockref.lock);
+		if (inode_gl) {
+			gfs2_glock_poke(inode_gl);
+			gfs2_glock_put(inode_gl);
+		}
 		evicted = !ip;
 	}
 	return evicted;
@@ -845,12 +865,22 @@ static void delete_work_func(struct work_struct *work)
 		 * has happened.  Otherwise, if we cause contention on the inode glock
 		 * immediately, the remote node will think that we still have
 		 * the inode in use, and so it will give up waiting.
+		 *
+		 * If we can't evict the inode, signal to the remote node that
+		 * the inode is still in use.  We'll later try to delete the
+		 * inode locally in gfs2_evict_inode.
+		 *
+		 * FIXME: We only need to verify that the remote node has
+		 * deleted the inode because nodes before this remote delete
+		 * rework won't cooperate.  At a later time, when we no longer
+		 * care about compatibility with such nodes, we can skip this
+		 * step entirely.
 		 */
 		if (gfs2_try_evict(gl)) {
 			if (gfs2_queue_delete_work(gl, 5 * HZ))
 				return;
-			goto out;
 		}
+		goto out;
 	}
 
 	inode = gfs2_lookup_by_inum(sdp, no_addr, gl->gl_no_formal_ino,
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index bcb56f13f50a..32d8d26126a1 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1273,8 +1273,12 @@ static bool gfs2_upgrade_iopen_glock(struct inode *inode)
 	 * If there are no other lock holders, we'll get the lock immediately.
 	 * Otherwise, the other nodes holding the lock will be notified about
 	 * our locking request.  If they don't have the inode open, they'll
-	 * evict the cached inode and release the lock.  As a last resort,
-	 * we'll eventually time out.
+	 * evict the cached inode and release the lock.  Otherwise, if they
+	 * poke the inode glock, we'll take this as an indication that they
+	 * still need the iopen glock and that they'll take care of deleting
+	 * the inode when they're done.  As a last resort, if another node
+	 * keeps holding the iopen glock without showing any activity on the
+	 * inode glock, we'll eventually time out.
 	 *
 	 * Note that we're passing the LM_FLAG_TRY_1CB flag to the first
 	 * locking request as an optimization to notify lock holders as soon as
@@ -1293,7 +1297,8 @@ static bool gfs2_upgrade_iopen_glock(struct inode *inode)
 		return false;
 
 	timeout = wait_event_interruptible_timeout(sdp->sd_async_glock_wait,
-		!test_bit(HIF_WAIT, &gh->gh_iflags),
+		!test_bit(HIF_WAIT, &gh->gh_iflags) ||
+		test_bit(GLF_DEMOTE, &ip->i_gl->gl_flags),
 		timeout);
 	if (!test_bit(HIF_HOLDER, &gh->gh_iflags)) {
 		gfs2_glock_dq(gh);
-- 
2.26.2

