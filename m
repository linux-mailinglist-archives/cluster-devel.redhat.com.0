Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAF0FF16
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Apr 2019 19:48:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D671430832E3;
	Tue, 30 Apr 2019 17:48:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1191717121;
	Tue, 30 Apr 2019 17:48:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07AC765D14;
	Tue, 30 Apr 2019 17:48:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UHmXwx025983 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 13:48:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4AF64148; Tue, 30 Apr 2019 17:48:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from radium.msp.redhat.com (radium.msp.redhat.com [10.15.80.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F3B67013C
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 17:48:31 +0000 (UTC)
From: Abhi Das <adas@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 30 Apr 2019 12:48:30 -0500
Message-Id: <20190430174830.18057-1-adas@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: fix race between gfs2_freeze_func and
	unmount
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Tue, 30 Apr 2019 17:48:56 +0000 (UTC)

gfs2_unfreee() doesn't wait for gfs2_freeze_func() to complete. If a
umount is issued right after unfreeze, it could result in an
inconsistent filesystem because some journal data (statfs update)
wasn't written out.

This patch causes gfs2_unfreeze() to wait for gfs2_freeze_func() to
complete before returning to the user.

Signed-off-by: Abhi Das <adas@redhat.com>
---
 fs/gfs2/incore.h | 1 +
 fs/gfs2/super.c  | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 78c8e761b321..b15755068593 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -621,6 +621,7 @@ enum {
 	SDF_SKIP_DLM_UNLOCK	= 8,
 	SDF_FORCE_AIL_FLUSH     = 9,
 	SDF_AIL1_IO_ERROR	= 10,
+	SDF_FS_FROZEN           = 11,
 };
 
 enum gfs2_freeze_state {
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index a6a325b2a78b..a81d7a5afe39 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -973,8 +973,7 @@ void gfs2_freeze_func(struct work_struct *work)
 	if (error) {
 		printk(KERN_INFO "GFS2: couldn't get freeze lock : %d\n", error);
 		gfs2_assert_withdraw(sdp, 0);
-	}
-	else {
+	} else {
 		atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
 		error = thaw_super(sb);
 		if (error) {
@@ -987,6 +986,8 @@ void gfs2_freeze_func(struct work_struct *work)
 		gfs2_glock_dq_uninit(&freeze_gh);
 	}
 	deactivate_super(sb);
+	clear_bit(SDF_FS_FROZEN, &sdp->sd_flags);
+	wake_up_bit(&sdp->sd_flags, SDF_FS_FROZEN);
 	return;
 }
 
@@ -1029,6 +1030,7 @@ static int gfs2_freeze(struct super_block *sb)
 		msleep(1000);
 	}
 	error = 0;
+	set_bit(SDF_FS_FROZEN, &sdp->sd_flags);
 out:
 	mutex_unlock(&sdp->sd_freeze_mutex);
 	return error;
@@ -1053,7 +1055,7 @@ static int gfs2_unfreeze(struct super_block *sb)
 
 	gfs2_glock_dq_uninit(&sdp->sd_freeze_gh);
 	mutex_unlock(&sdp->sd_freeze_mutex);
-	return 0;
+	return wait_on_bit(&sdp->sd_flags, SDF_FS_FROZEN, TASK_INTERRUPTIBLE);
 }
 
 /**
-- 
2.20.1

