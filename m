Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A6E8832CFC7
	for <lists+cluster-devel@lfdr.de>; Thu,  4 Mar 2021 10:37:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-s0eaCanYNtW3_uCXQPRP3g-1; Thu, 04 Mar 2021 04:37:49 -0500
X-MC-Unique: s0eaCanYNtW3_uCXQPRP3g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 321A38143F2;
	Thu,  4 Mar 2021 09:37:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A833660C43;
	Thu,  4 Mar 2021 09:37:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0256C1809C86;
	Thu,  4 Mar 2021 09:37:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1249bZVk009404 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 4 Mar 2021 04:37:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9C19F200BA97; Thu,  4 Mar 2021 09:37:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 972D2200E1F8
	for <cluster-devel@redhat.com>; Thu,  4 Mar 2021 09:37:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EC1A800B32
	for <cluster-devel@redhat.com>; Thu,  4 Mar 2021 09:37:30 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
	(out30-54.freemail.mail.aliyun.com [115.124.30.54]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-33-5t6I3YdFOYWFj2yoOlQmAA-1;
	Thu, 04 Mar 2021 04:37:27 -0500
X-MC-Unique: 5t6I3YdFOYWFj2yoOlQmAA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R881e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
	TI=SMTPD_---0UQMzC4w_1614850643
Received: from
	j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
	fp:SMTPD_---0UQMzC4w_1614850643) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 04 Mar 2021 17:37:23 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: rpeterso@redhat.com
Date: Thu,  4 Mar 2021 17:37:20 +0800
Message-Id: <1614850640-63803-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Yang Li <yang.lee@linux.alibaba.com>,
	linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: make function gfs2_make_fs_ro() to
	void type
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"

It fixes the following warning detected by coccinelle:
./fs/gfs2/super.c:592:5-10: Unneeded variable: "error". Return "0" on
line 628

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 fs/gfs2/ops_fstype.c | 4 +---
 fs/gfs2/super.c      | 9 +++------
 fs/gfs2/super.h      | 2 +-
 fs/gfs2/util.c       | 2 +-
 4 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 74c7d01..aa41360 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1539,9 +1539,7 @@ static int gfs2_reconfigure(struct fs_context *fc)
 			return -EINVAL;
 
 		if (fc->sb_flags & SB_RDONLY) {
-			error = gfs2_make_fs_ro(sdp);
-			if (error)
-				errorfc(fc, "unable to remount read-only");
+			gfs2_make_fs_ro(sdp);
 		} else {
 			error = gfs2_make_fs_rw(sdp);
 			if (error)
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 861ed5f..6e2588f 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -587,9 +587,8 @@ static void gfs2_dirty_inode(struct inode *inode, int flags)
  * Returns: errno
  */
 
-int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
+void gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 {
-	int error = 0;
 	int log_write_allowed = test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
 
 	gfs2_flush_delete_work(sdp);
@@ -625,7 +624,7 @@ int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 	if (!log_write_allowed)
 		sdp->sd_vfs->s_flags |= SB_RDONLY;
 
-	return error;
+	return;
 }
 
 /**
@@ -658,9 +657,7 @@ static void gfs2_put_super(struct super_block *sb)
 	spin_unlock(&sdp->sd_jindex_spin);
 
 	if (!sb_rdonly(sb)) {
-		error = gfs2_make_fs_ro(sdp);
-		if (error)
-			gfs2_io_error(sdp);
+		gfs2_make_fs_ro(sdp);
 	}
 	WARN_ON(gfs2_withdrawing(sdp));
 
diff --git a/fs/gfs2/super.h b/fs/gfs2/super.h
index 08e502d..ec4affb3 100644
--- a/fs/gfs2/super.h
+++ b/fs/gfs2/super.h
@@ -34,7 +34,7 @@ extern int gfs2_lookup_in_master_dir(struct gfs2_sbd *sdp, char *filename,
 				     struct gfs2_inode **ipp);
 
 extern int gfs2_make_fs_rw(struct gfs2_sbd *sdp);
-extern int gfs2_make_fs_ro(struct gfs2_sbd *sdp);
+extern void gfs2_make_fs_ro(struct gfs2_sbd *sdp);
 extern void gfs2_online_uevent(struct gfs2_sbd *sdp);
 extern int gfs2_statfs_init(struct gfs2_sbd *sdp);
 extern void gfs2_statfs_change(struct gfs2_sbd *sdp, s64 total, s64 free,
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 8d3c670..5874331 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -156,7 +156,7 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 				ret = 0;
 		}
 		if (!ret)
-			ret = gfs2_make_fs_ro(sdp);
+			gfs2_make_fs_ro(sdp);
 		gfs2_freeze_unlock(&freeze_gh);
 	}
 
-- 
1.8.3.1

