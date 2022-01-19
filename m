Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 609AB4938D6
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:46:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589205;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s0jQwapsHZkq71gnF0OcKxT2vR67Brgjmx4qPypkCYU=;
	b=RbXqZhqZV66p8wnO622JUAv1emgJdLhMAUcd2RPdiazeydaeWfQhjdX9zabBQymgo4x6lM
	KzVh13oygUSpnliEMaKvdfnxilvDB4JTwdZTi37PgzkFmTON0OO4YYst+N+39GUG9Gcwy2
	ayOTz26vWv0+8gycV/OjN+7zjgtMp2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-d9t4xKFxNYCyMr9de7-Pww-1; Wed, 19 Jan 2022 05:46:42 -0500
X-MC-Unique: d9t4xKFxNYCyMr9de7-Pww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 408AF1B2C985;
	Wed, 19 Jan 2022 10:46:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30EBB1F31F;
	Wed, 19 Jan 2022 10:46:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DE114A706;
	Wed, 19 Jan 2022 10:46:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAiPxp024508 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:44:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D39CB78B10; Wed, 19 Jan 2022 10:44:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EDCF78B1F
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:44:25 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:07 +0000
Message-Id: <20220119104316.2489995-13-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 12/21] libgfs2: Namespace improvements -
	device_geometry.c
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Use the lgfs2_ prefix in libgfs2 interface names.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/hexedit.c            | 2 +-
 gfs2/fsck/rgrepair.c           | 2 +-
 gfs2/libgfs2/device_geometry.c | 2 +-
 gfs2/libgfs2/gfs2l.c           | 2 +-
 gfs2/libgfs2/libgfs2.h         | 2 +-
 gfs2/mkfs/main_grow.c          | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index fc1b5f4f..3415b41f 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -909,7 +909,7 @@ static void read_superblock(int fd)
 	else {
 		block = starting_blk = 0;
 	}
-	fix_device_geometry(&sbd);
+	lgfs2_fix_device_geometry(&sbd);
 	if(sbd.gfs1) {
 		sbd.sd_inptrs = (sbd.sd_bsize - sizeof(struct gfs_indirect)) /
 			sizeof(uint64_t);
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index 333a77a5..37d20aed 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -818,7 +818,7 @@ static int gfs2_rindex_calculate(struct gfs2_sbd *sdp, int *num_rgs)
 	*num_rgs = sdp->md.riinode->i_size / sizeof(struct gfs2_rindex);
 
 	rgcalc.osi_node = NULL;
-	fix_device_geometry(sdp);
+	lgfs2_fix_device_geometry(sdp);
 
 	/* Try all possible rgrp sizes: 2048, 1024, 512, 256, 128, 64, 32 */
 	for (sdp->rgsize = GFS2_DEFAULT_RGSIZE; sdp->rgsize >= 32;
diff --git a/gfs2/libgfs2/device_geometry.c b/gfs2/libgfs2/device_geometry.c
index cb1ed6d5..86ad84bd 100644
--- a/gfs2/libgfs2/device_geometry.c
+++ b/gfs2/libgfs2/device_geometry.c
@@ -92,7 +92,7 @@ size_check:
  *
  */
 
-void fix_device_geometry(struct gfs2_sbd *sdp)
+void lgfs2_fix_device_geometry(struct gfs2_sbd *sdp)
 {
 	struct device *device = &sdp->device;
 
diff --git a/gfs2/libgfs2/gfs2l.c b/gfs2/libgfs2/gfs2l.c
index a247bed2..b8c4ca41 100644
--- a/gfs2/libgfs2/gfs2l.c
+++ b/gfs2/libgfs2/gfs2l.c
@@ -130,7 +130,7 @@ static int openfs(const char *path, struct gfs2_sbd *sdp)
 		perror("Failed to gather device info");
 		return 1;
 	}
-	fix_device_geometry(sdp);
+	lgfs2_fix_device_geometry(sdp);
 
 	ret = lgfs2_read_sb(sdp);
 	if (ret != 0) {
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index d091e180..39097e68 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -473,7 +473,7 @@ extern uint32_t lgfs2_get_block_type(const char *buf);
 
 /* device_geometry.c */
 extern int lgfs2_get_dev_info(int fd, struct lgfs2_dev_info *i);
-extern void fix_device_geometry(struct gfs2_sbd *sdp);
+extern void lgfs2_fix_device_geometry(struct gfs2_sbd *sdp);
 
 /* fs_bits.c */
 #define BFITNOENT (0xFFFFFFFF)
diff --git a/gfs2/mkfs/main_grow.c b/gfs2/mkfs/main_grow.c
index 298ba2a6..b2959285 100644
--- a/gfs2/mkfs/main_grow.c
+++ b/gfs2/mkfs/main_grow.c
@@ -406,7 +406,7 @@ int main(int argc, char *argv[])
 			fprintf(stderr, _("cannot grow gfs1 filesystem\n"));
 			exit(EXIT_FAILURE);
 		}
-		fix_device_geometry(sdp);
+		lgfs2_fix_device_geometry(sdp);
 		mfs.context = copy_context_opt(mnt);
 		if (mount_gfs2_meta(&mfs, mnt->mnt_dir, (print_level > MSG_NOTICE))) {
 			perror(_("Failed to mount GFS2 meta file system"));
-- 
2.34.1

