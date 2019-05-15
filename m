Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 277A71FB20
	for <lists+cluster-devel@lfdr.de>; Wed, 15 May 2019 21:40:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F597C00E0DD;
	Wed, 15 May 2019 19:40:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0784F60BF7;
	Wed, 15 May 2019 19:40:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB2461806B0E;
	Wed, 15 May 2019 19:40:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FJckiR029215 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 15:38:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F77360FAE; Wed, 15 May 2019 19:38:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-119.phx2.redhat.com [10.3.116.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B45C60E39
	for <cluster-devel@redhat.com>; Wed, 15 May 2019 19:38:38 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 15 May 2019 14:38:18 -0500
Message-Id: <20190515193818.7642-26-rpeterso@redhat.com>
In-Reply-To: <20190515193818.7642-1-rpeterso@redhat.com>
References: <20190515193818.7642-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v4 PATCH 25/25] gfs2: Check for log write
	errors before telling dlm to unlock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 15 May 2019 19:40:06 +0000 (UTC)

Before this patch, function do_xmote just assumed all the writes
submitted to the journal were finished and successful, and it
called the go_unlock function to release the dlm lock. But if
they're not, and a revoke failed to make its way to the journal,
a journal replay on another node will cause corruption if we
let the go_inval function continue and tell dlm to release the
glock to another node. This patch adds a couple checks for errors
in do_xmote after the calls to go_sync and go_inval. If an error
is found, we cannot withdraw yet, because the withdraw itself
uses glocks to make the file system read-only. Instead, we flag
the error. Later, asserts should cause another node to replay
the journal before continuing, thus protecting rgrp and dinode
glocks and maintaining the integrity of the metadata. Note that
we only need to do this for journaled glocks. System glocks
should be able to progress even under withdrawn conditions.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 38 +++++++++++++++++++++++++++++++++-----
 fs/gfs2/glops.c |  4 +++-
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 7202793056a8..0d3cb4d9de52 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -140,7 +140,7 @@ void gfs2_glock_free(struct gfs2_glock *gl)
 {
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 
-	BUG_ON(test_bit(GLF_REVOKES, &gl->gl_flags));
+	GLOCK_BUG_ON(gl, test_bit(GLF_REVOKES, &gl->gl_flags));
 	rhashtable_remove_fast(&gl_hash_table, &gl->gl_node, ht_parms);
 	smp_mb();
 	wake_up_glock(gl);
@@ -570,11 +570,40 @@ __acquires(&gl->gl_lockref.lock)
 	spin_unlock(&gl->gl_lockref.lock);
 	if (glops->go_sync)
 		glops->go_sync(gl);
-	if (test_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags))
+	if (test_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags)) {
 		glops->go_inval(gl, target == LM_ST_DEFERRED ? 0 : DIO_METADATA);
+		/**
+		 * If the go_inval left some items on the ail, that's a
+		 * problem. We need to withdraw, but we can't, as explained
+		 * above. Warn about the error, dump the glock, then fall
+		 * through and wait for logd to do the withdraw for us.
+		 */
+		if ((atomic_read(&gl->gl_ail_count) != 0) &&
+		    (!cmpxchg(&sdp->sd_log_error, 0, -EIO))) {
+			gfs2_assert_warn(sdp, !atomic_read(&gl->gl_ail_count));
+			gfs2_dump_glock(NULL, gl, true);
+		}
+	}
 	clear_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags);
 
 	gfs2_glock_hold(gl);
+	/**
+	 * Check for an error encountered since we called go_sync and go_inval.
+	 * If so, we can't withdraw from the glock code because the withdraw
+	 * code itself uses glocks (see function signal_our_withdraw) to
+	 * change the mount to read-only. Most importantly, we must not call
+	 * dlm to unlock the glock until the journal is in a known good state
+	 * (after journal replay) otherwise other nodes may use the object
+	 * (rgrp or dinode) and then later, journal replay will corrupt the
+	 * file system. The best we can do here is wait for the logd daemon
+	 * to see sd_log_error and withdraw, and in the meantime, requeue the
+	 * work for later.
+	 */
+	if ((glops->go_flags & GLOF_JOURNALED) && sdp->sd_log_error) {
+		gfs2_glock_queue_work(gl, GL_GLOCK_DFT_HOLD);
+		goto out;
+	}
+
 	if (sdp->sd_lockstruct.ls_ops->lm_lock)	{
 		/* lock_dlm */
 		ret = sdp->sd_lockstruct.ls_ops->lm_lock(gl, target, lck_flags);
@@ -583,8 +612,7 @@ __acquires(&gl->gl_lockref.lock)
 		    test_bit(SDF_SKIP_DLM_UNLOCK, &sdp->sd_flags)) {
 			finish_xmote(gl, target);
 			gfs2_glock_queue_work(gl, 0);
-		}
-		else if (ret) {
+		} else if (ret) {
 			fs_err(sdp, "lm_lock ret %d\n", ret);
 			GLOCK_BUG_ON(gl, !gfs2_withdrawn(sdp));
 		}
@@ -592,7 +620,7 @@ __acquires(&gl->gl_lockref.lock)
 		finish_xmote(gl, target);
 		gfs2_glock_queue_work(gl, 0);
 	}
-
+out:
 	spin_lock(&gl->gl_lockref.lock);
 }
 
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index a5c125e64bf7..3909d335590f 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -295,8 +295,10 @@ static void inode_go_sync(struct gfs2_glock *gl)
 static void inode_go_inval(struct gfs2_glock *gl, int flags)
 {
 	struct gfs2_inode *ip = gfs2_glock2inode(gl);
+	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 
-	gfs2_assert_withdraw(gl->gl_name.ln_sbd, !atomic_read(&gl->gl_ail_count));
+	if (!sdp->sd_log_error)
+		gfs2_assert_withdraw(sdp, !atomic_read(&gl->gl_ail_count));
 
 	if (flags & DIO_METADATA) {
 		struct address_space *mapping = gfs2_glock2aspace(gl);
-- 
2.20.1

