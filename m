Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9315F27D91
	for <lists+cluster-devel@lfdr.de>; Thu, 23 May 2019 15:05:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A24B88F917;
	Thu, 23 May 2019 13:04:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B248B619E2;
	Thu, 23 May 2019 13:04:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9875A5B427;
	Thu, 23 May 2019 13:04:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4ND4Ol0009875 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 09:04:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E0F076918D; Thu, 23 May 2019 13:04:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-117-25.phx2.redhat.com [10.3.117.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB7726918C
	for <cluster-devel@redhat.com>; Thu, 23 May 2019 13:04:24 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 23 May 2019 08:03:56 -0500
Message-Id: <20190523130421.21003-2-rpeterso@redhat.com>
In-Reply-To: <20190523130421.21003-1-rpeterso@redhat.com>
References: <20190523130421.21003-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v6 01/26] gfs2: kthread and remount
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Thu, 23 May 2019 13:05:08 +0000 (UTC)

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
index fbf6b1fd330b..a468e58fcda4 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -397,6 +397,7 @@ static int init_threads(struct gfs2_sbd *sdp)
 
 fail:
 	kthread_stop(sdp->sd_logd_process);
+	sdp->sd_logd_process = NULL;
 	return error;
 }
 
@@ -454,8 +455,12 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
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
 
@@ -856,8 +861,12 @@ static int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
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
@@ -1276,8 +1285,6 @@ static int gfs2_remount_fs(struct super_block *sb, int *flags, char *data)
 			error = gfs2_make_fs_ro(sdp);
 		else
 			error = gfs2_make_fs_rw(sdp);
-		if (error)
-			return error;
 	}
 
 	sdp->sd_args = args;
@@ -1303,7 +1310,7 @@ static int gfs2_remount_fs(struct super_block *sb, int *flags, char *data)
 	spin_unlock(&gt->gt_spin);
 
 	gfs2_online_uevent(sdp);
-	return 0;
+	return error;
 }
 
 /**
-- 
2.21.0

