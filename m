Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B24926ADC
	for <lists+cluster-devel@lfdr.de>; Wed, 22 May 2019 21:22:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 495F96EF;
	Wed, 22 May 2019 19:22:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8E6F52CD;
	Wed, 22 May 2019 19:22:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E8441806B15;
	Wed, 22 May 2019 19:21:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4MJLca9003893 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 22 May 2019 15:21:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D830D619B4; Wed, 22 May 2019 19:21:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1E5961992;
	Wed, 22 May 2019 19:21:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1BE5FC056899;
	Wed, 22 May 2019 19:21:22 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 086BD217D7;
	Wed, 22 May 2019 19:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558552881;
	bh=Q8UKpjGDb2ITlctwKW2NZ1xpS7H/u4buCDzCXA3hG2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cm5AVTr/ZxxTBnFz5/7cfd82h/r4b5CZEPtTWUuYesGQgpFkYQ9QQLxpndtty9GsG
	RVMtTCvGUj1AoSDBJZt3zNhdpiVwYwbgdHFkKpgFoD6Eg1GNnTrNP3rvikjpYlPfMQ
	0a3ii85ScDKMv+rJvCOyH70dA4F2kuTBJnJx96DA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed, 22 May 2019 15:15:05 -0400
Message-Id: <20190522192115.22666-5-sashal@kernel.org>
In-Reply-To: <20190522192115.22666-1-sashal@kernel.org>
References: <20190522192115.22666-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 22 May 2019 19:21:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Wed, 22 May 2019 19:21:22 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'sashal@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<sashal@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.1 005/375] gfs2: fix race between
	gfs2_freeze_func and unmount
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 22 May 2019 19:22:21 +0000 (UTC)

From: Abhi Das <adas@redhat.com>

[ Upstream commit 8f91821990fd6f170a5dca79697a441181a41b16 ]

As part of the freeze operation, gfs2_freeze_func() is left blocking
on a request to hold the sd_freeze_gl in SH. This glock is held in EX
by the gfs2_freeze() code.

A subsequent call to gfs2_unfreeze() releases the EXclusively held
sd_freeze_gl, which allows gfs2_freeze_func() to acquire it in SH and
resume its operation.

gfs2_unfreeze(), however, doesn't wait for gfs2_freeze_func() to complete.
If a umount is issued right after unfreeze, it could result in an
inconsistent filesystem because some journal data (statfs update) isn't
written out.

Refer to commit 24972557b12c for a more detailed explanation of how
freeze/unfreeze work.

This patch causes gfs2_unfreeze() to wait for gfs2_freeze_func() to
complete before returning to the user.

Signed-off-by: Abhi Das <adas@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/incore.h | 1 +
 fs/gfs2/super.c  | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index cdf07b408f54c..539e8dc5a3f6c 100644
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
index ca71163ff7cfd..360206704a14c 100644
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
+	clear_bit_unlock(SDF_FS_FROZEN, &sdp->sd_flags);
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

