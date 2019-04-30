Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C5384102FA
	for <lists+cluster-devel@lfdr.de>; Wed,  1 May 2019 01:03:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 442A036887;
	Tue, 30 Apr 2019 23:03:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0713E1001E63;
	Tue, 30 Apr 2019 23:03:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BD7118089D2;
	Tue, 30 Apr 2019 23:03:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UN3MuJ022953 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 19:03:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 517AF81742; Tue, 30 Apr 2019 23:03:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-20.phx2.redhat.com [10.3.116.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BE407C850
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 23:03:22 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 30 Apr 2019 17:03:01 -0600
Message-Id: <20190430230319.10375-2-rpeterso@redhat.com>
In-Reply-To: <20190430230319.10375-1-rpeterso@redhat.com>
References: <20190430230319.10375-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v3 01/19] gfs2: kthread and remount
	improvements
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 30 Apr 2019 23:03:28 +0000 (UTC)

Before this patch, gfs2 saved the pointers to the two daemon threads
(logd and quotad) in the superblock, but they were never cleared,
even if the threads were stopped (e.g. on remount -o ro). That meant
that certain error conditions (like a withdrawn file system) could
race. For example, xfstests generic/361 caused an IO error during
remount -o ro, which caused the kthreads to be stopped, then the
error flagged. Later, when the test unmounted the file system, it
would try to stop the threads a second time with kthread_stop.

This patch does two things: First, every time it stops the threads
it zeroes out the thread pointer, and also checks whether it's NULL
before trying to stop it. Second, in function gfs2_remount_fs, it
was returning if an error was logged by either of the two functions
for gfs2_make_fs_ro and _rw, which caused it to bypass the online
uevent at the bottom of the function. This removes that bypass in
favor of just running the whole function, then returning the error.
That way, unmounts and remounts won't hang forever.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index a6a325b2a78b..dc4ec1ca3d4e 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -396,6 +396,7 @@ static int init_threads(struct gfs2_sbd *sdp)
 
 fail:
 	kthread_stop(sdp->sd_logd_process);
+	sdp->sd_logd_process = NULL;
 	return error;
 }
 
@@ -453,8 +454,12 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 	freeze_gh.gh_flags |= GL_NOCACHE;
 	gfs2_glock_dq_uninit(&freeze_gh);
 fail_threads:
-	kthread_stop(sdp->sd_quotad_process);
-	kthread_stop(sdp->sd_logd_process);
+	if (sdp->sd_quotad_process)
+		kthread_stop(sdp->sd_quotad_process);
+	sdp->sd_quotad_process = NULL;
+	if (sdp->sd_logd_process)
+		kthread_stop(sdp->sd_logd_process);
+	sdp->sd_logd_process = NULL;
 	return error;
 }
 
@@ -855,8 +860,12 @@ static int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 		return error;
 
 	flush_workqueue(gfs2_delete_workqueue);
-	kthread_stop(sdp->sd_quotad_process);
-	kthread_stop(sdp->sd_logd_process);
+	if (sdp->sd_quotad_process)
+		kthread_stop(sdp->sd_quotad_process);
+	sdp->sd_quotad_process = NULL;
+	if (sdp->sd_logd_process)
+		kthread_stop(sdp->sd_logd_process);
+	sdp->sd_logd_process = NULL;
 
 	gfs2_quota_sync(sdp->sd_vfs, 0);
 	gfs2_statfs_sync(sdp->sd_vfs, 0);
@@ -1273,8 +1282,6 @@ static int gfs2_remount_fs(struct super_block *sb, int *flags, char *data)
 			error = gfs2_make_fs_ro(sdp);
 		else
 			error = gfs2_make_fs_rw(sdp);
-		if (error)
-			return error;
 	}
 
 	sdp->sd_args = args;
@@ -1300,7 +1307,7 @@ static int gfs2_remount_fs(struct super_block *sb, int *flags, char *data)
 	spin_unlock(&gt->gt_spin);
 
 	gfs2_online_uevent(sdp);
-	return 0;
+	return error;
 }
 
 /**
-- 
2.20.1

