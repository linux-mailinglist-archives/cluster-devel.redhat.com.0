Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5051030B
	for <lists+cluster-devel@lfdr.de>; Wed,  1 May 2019 01:03:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5914301E11B;
	Tue, 30 Apr 2019 23:03:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E7E481769;
	Tue, 30 Apr 2019 23:03:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7DFE43FA45;
	Tue, 30 Apr 2019 23:03:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UN3Q17023086 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 19:03:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A51207C850; Tue, 30 Apr 2019 23:03:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-20.phx2.redhat.com [10.3.116.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E6BA81742
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 23:03:26 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 30 Apr 2019 17:03:18 -0600
Message-Id: <20190430230319.10375-19-rpeterso@redhat.com>
In-Reply-To: <20190430230319.10375-1-rpeterso@redhat.com>
References: <20190430230319.10375-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v3 18/19] gfs2: Check for log write
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 30 Apr 2019 23:03:33 +0000 (UTC)

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
 fs/gfs2/glock.c | 44 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 3d1b9bdfd0de..f4129305a815 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -570,8 +570,47 @@ __acquires(&gl->gl_lockref.lock)
 	spin_unlock(&gl->gl_lockref.lock);
 	if (glops->go_sync)
 		glops->go_sync(gl);
+	/**
+	 * Check for an error encountered since we called go_sync. If so, we
+	 * can't withdraw from the glock code because the withdraw code itself
+	 * uses glocks (see function signal_our_withdraw) to change the mount
+	 * to read-only. Most importantly, we must not call dlm to unlock the
+	 * glock until the journal is in a known good state (after journal
+	 * replay) otherwise other nodes may use the object (rgrp or dinode)
+	 * and then later, journal replay will corrupt the file system. The
+	 * best we can do now is wait for the logd daemon to see sd_log_error
+	 * and withdraw, and in the meantime, requeue the work for later.
+	 */
+	if ((glops->go_flags & GLOF_JOURNALED) && sdp->sd_log_error) {
+		gfs2_glock_hold(gl);
+		finish_xmote(gl, LM_OUT_ERROR | LM_ST_UNLOCKED);
+		gfs2_glock_queue_work(gl, GL_GLOCK_DFT_HOLD);
+		goto out;
+	}
 	if (test_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags))
 		glops->go_inval(gl, target == LM_ST_DEFERRED ? 0 : DIO_METADATA);
+	/**
+	 * If the go_inval left some items on the ail, that's a problem. We
+	 * need to withdraw, but we can't, as explained above. Warn about the
+	 * error, dump the glock, then fall through and wait for logd to do
+	 * the withdraw for us.
+	 */
+	if (atomic_read(&gl->gl_ail_count) != 0) {
+		if (!cmpxchg(&sdp->sd_log_error, 0, -EIO)) {
+			gfs2_assert_warn(sdp, !atomic_read(&gl->gl_ail_count));
+			gfs2_dump_glock(NULL, gl);
+		}
+	}
+	/**
+	 * Check for an error encountered while we were doing go_inval, and
+	 * handle it the same way we did for the go_sync case.
+	 */
+	if ((glops->go_flags & GLOF_JOURNALED) && sdp->sd_log_error) {
+		gfs2_glock_hold(gl);
+		finish_xmote(gl, LM_OUT_ERROR | LM_ST_UNLOCKED);
+		gfs2_glock_queue_work(gl, GL_GLOCK_DFT_HOLD);
+		goto out;
+	}
 	clear_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags);
 
 	gfs2_glock_hold(gl);
@@ -583,8 +622,7 @@ __acquires(&gl->gl_lockref.lock)
 		    test_bit(SDF_SKIP_DLM_UNLOCK, &sdp->sd_flags)) {
 			finish_xmote(gl, target);
 			gfs2_glock_queue_work(gl, 0);
-		}
-		else if (ret) {
+		} else if (ret) {
 			fs_err(sdp, "lm_lock ret %d\n", ret);
 			GLOCK_BUG_ON(gl, !gfs2_withdrawn(sdp));
 		}
@@ -592,7 +630,7 @@ __acquires(&gl->gl_lockref.lock)
 		finish_xmote(gl, target);
 		gfs2_glock_queue_work(gl, 0);
 	}
-
+out:
 	spin_lock(&gl->gl_lockref.lock);
 }
 
-- 
2.20.1

