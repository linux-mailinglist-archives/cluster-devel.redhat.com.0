Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9474938C0
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:43:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589031;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K7o0a3RRarFzm+5E0glaOsUhMHLKiASsh9QL+sB6iQI=;
	b=USHcQypzjNMU/dx8asyhJiFXI2Dyqw9h+bzUG9HpqA+bwEZ7FngJvmAQBIpzyvKZD3vQAe
	L5SnUc7Ed1Sy6vs4Kk3uG5oGfYXfFNfM8sOk9VqFed6QXP1Z0PSnsS1HGQ/CglL2rOlFbW
	EzdJNyeeK6wQYJsYZyMFT73EFH3Jiec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-EAp7lVngOOmRT_7Xu-dOCw-1; Wed, 19 Jan 2022 05:43:43 -0500
X-MC-Unique: EAp7lVngOOmRT_7Xu-dOCw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6696B83DD26;
	Wed, 19 Jan 2022 10:43:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 576481059165;
	Wed, 19 Jan 2022 10:43:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 193194A7C9;
	Wed, 19 Jan 2022 10:43:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAhbxA024222 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:43:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B36CC78B18; Wed, 19 Jan 2022 10:43:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BDC27A22A
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:43:36 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:01 +0000
Message-Id: <20220119104316.2489995-7-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 06/21] libgfs2: Namespace improvements -
	misc.c
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Use the lgfs2_ prefix in libgfs2 interface names.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c | 12 ++++++------
 gfs2/edit/hexedit.c         |  2 +-
 gfs2/fsck/initialize.c      |  2 +-
 gfs2/libgfs2/check_rgrp.c   |  2 +-
 gfs2/libgfs2/gfs2l.c        |  2 +-
 gfs2/libgfs2/libgfs2.h      |  4 ++--
 gfs2/libgfs2/misc.c         |  8 ++++----
 gfs2/mkfs/main_grow.c       |  2 +-
 gfs2/mkfs/main_jadd.c       |  2 +-
 gfs2/mkfs/main_mkfs.c       |  2 +-
 tests/nukerg.c              |  2 +-
 11 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 9bf92ed4..90964ae1 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -1585,7 +1585,7 @@ static int init(struct gfs2_sbd *sbp, struct gfs2_options *opts)
 	sbp->dinodes_alloced = 0; /* dinodes allocated - total them up later */
 	sbp->sd_bsize = GFS2_DEFAULT_BSIZE;
 	sbp->rgtree.osi_node = NULL;
-	if (compute_constants(sbp)) {
+	if (lgfs2_compute_constants(sbp)) {
 		log_crit("%s\n", _("Failed to compute file system constants"));
 		exit(-1);
 	}
@@ -1605,13 +1605,13 @@ static int init(struct gfs2_sbd *sbp, struct gfs2_options *opts)
 		sizeof(uint64_t);
 	sbp->sd_jbsize = sbp->sd_bsize - sizeof(struct gfs2_meta_header);
 	lgfs2_brelse(bh);
-	if (compute_heightsize(sbp->sd_bsize, sbp->sd_heightsize, &sbp->sd_max_height,
+	if (lgfs2_compute_heightsize(sbp->sd_bsize, sbp->sd_heightsize, &sbp->sd_max_height,
 				sbp->sd_bsize, sbp->sd_diptrs, sbp->sd_inptrs)) {
 		log_crit("%s\n", _("Failed to compute file system constants"));
 		exit(-1);
 	}
 
-	if (compute_heightsize(sbp->sd_bsize, sbp->sd_jheightsize, &sbp->sd_max_jheight,
+	if (lgfs2_compute_heightsize(sbp->sd_bsize, sbp->sd_jheightsize, &sbp->sd_max_jheight,
 				sbp->sd_jbsize, sbp->sd_diptrs, sbp->sd_inptrs)) {
 		log_crit("%s\n", _("Failed to compute file system constants"));
 		exit(-1);
@@ -1622,13 +1622,13 @@ static int init(struct gfs2_sbd *sbp, struct gfs2_options *opts)
 	gfs2_inptrs = (sbp->sd_bsize - sizeof(struct gfs2_meta_header)) /
                 sizeof(uint64_t); /* How many ptrs can we fit on a block? */
 	memset(gfs2_heightsize, 0, sizeof(gfs2_heightsize));
-	if (compute_heightsize(sbp->sd_bsize, gfs2_heightsize, &gfs2_max_height,
+	if (lgfs2_compute_heightsize(sbp->sd_bsize, gfs2_heightsize, &gfs2_max_height,
 				sbp->sd_bsize, sbp->sd_diptrs, gfs2_inptrs)) {
 		log_crit("%s\n", _("Failed to compute file system constants"));
 		exit(-1);
 	}
 	memset(gfs2_jheightsize, 0, sizeof(gfs2_jheightsize));
-	if (compute_heightsize(sbp->sd_bsize, gfs2_jheightsize, &gfs2_max_jheight,
+	if (lgfs2_compute_heightsize(sbp->sd_bsize, gfs2_jheightsize, &gfs2_max_jheight,
 				sbp->sd_jbsize, sbp->sd_diptrs, gfs2_inptrs)) {
 		log_crit("%s\n", _("Failed to compute file system constants"));
 		exit(-1);
@@ -2299,7 +2299,7 @@ int main(int argc, char **argv)
 		int jreduce = 0;
 
 		/* Now we've got to treat it as a gfs2 file system */
-		if (compute_constants(&sb2)) {
+		if (lgfs2_compute_constants(&sb2)) {
 			log_crit("%s\n", _("Failed to compute file system constants"));
 			exit(-1);
 		}
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index ab5fa933..ffb714bf 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -899,7 +899,7 @@ static void read_superblock(int fd)
 		perror(device);
 		exit(-1);
 	}
-	if(compute_constants(&sbd)) {
+	if(lgfs2_compute_constants(&sbd)) {
 		fprintf(stderr, "Failed to compute constants.\n");
 		exit(-1);
 	}
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index 63024a87..f1586374 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -1341,7 +1341,7 @@ static int fill_super_block(struct gfs2_sbd *sdp)
 	sdp->rgtree.osi_node = NULL;
 
 	sdp->sd_bsize = GFS2_DEFAULT_BSIZE;
-	if (compute_constants(sdp)) {
+	if (lgfs2_compute_constants(sdp)) {
 		log_crit("%s\n", _("Failed to compute file system constants"));
 		return FSCK_ERROR;
 	}
diff --git a/gfs2/libgfs2/check_rgrp.c b/gfs2/libgfs2/check_rgrp.c
index 2dc2e7be..d2e7b4fb 100644
--- a/gfs2/libgfs2/check_rgrp.c
+++ b/gfs2/libgfs2/check_rgrp.c
@@ -35,7 +35,7 @@ static void mockup_rgrps(void)
 	ck_assert(ftruncate(sdp->device_fd, MOCK_DEV_SIZE) == 0);
 
 	sdp->sd_bsize = 4096;
-	compute_constants(sdp);
+	lgfs2_compute_constants(sdp);
 
 	rgs = lgfs2_rgrps_init(sdp, 0, 0);
 	ck_assert(rgs != NULL);
diff --git a/gfs2/libgfs2/gfs2l.c b/gfs2/libgfs2/gfs2l.c
index 12862507..c31748b0 100644
--- a/gfs2/libgfs2/gfs2l.c
+++ b/gfs2/libgfs2/gfs2l.c
@@ -120,7 +120,7 @@ static int openfs(const char *path, struct gfs2_sbd *sdp)
 	memset(sdp, 0, sizeof(*sdp));
 	sdp->sd_bsize = GFS2_BASIC_BLOCK;
 	sdp->device_fd = fd;
-	ret = compute_constants(sdp);
+	ret = lgfs2_compute_constants(sdp);
 	if (ret != 0) {
 		perror("Bad constants");
 		return 1;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index e74918ab..5eb08baf 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -725,9 +725,9 @@ extern void lgfs2_gfs_rgrp_in(const lgfs2_rgrp_t rg, void *buf);
 extern void lgfs2_gfs_rgrp_out(const lgfs2_rgrp_t rg, void *buf);
 
 /* misc.c */
-extern int compute_heightsize(unsigned bsize, uint64_t *heightsize,
+extern int lgfs2_compute_heightsize(unsigned bsize, uint64_t *heightsize,
 		uint32_t *maxheight, uint32_t bsize1, int diptrs, int inptrs);
-extern int compute_constants(struct gfs2_sbd *sdp);
+extern int lgfs2_compute_constants(struct gfs2_sbd *sdp);
 extern int lgfs2_open_mnt(const char *path, int dirflags, int *dirfd, int devflags, int *devfd, struct mntent **mnt);
 extern int lgfs2_open_mnt_dev(const char *path, int flags, struct mntent **mnt);
 extern int lgfs2_open_mnt_dir(const char *path, int flags, struct mntent **mnt);
diff --git a/gfs2/libgfs2/misc.c b/gfs2/libgfs2/misc.c
index 8f1014ea..6092fa5c 100644
--- a/gfs2/libgfs2/misc.c
+++ b/gfs2/libgfs2/misc.c
@@ -12,7 +12,7 @@
 #define PAGE_SIZE (4096)
 #define DIV_RU(x, y) (((x) + (y) - 1) / (y))
 
-int compute_heightsize(unsigned bsize, uint64_t *heightsize,
+int lgfs2_compute_heightsize(unsigned bsize, uint64_t *heightsize,
 	uint32_t *maxheight, uint32_t bsize1, int diptrs, int inptrs)
 {
 	heightsize[0] = bsize - sizeof(struct gfs2_dinode);
@@ -36,7 +36,7 @@ int compute_heightsize(unsigned bsize, uint64_t *heightsize,
 	return 0;
 }
 
-int compute_constants(struct gfs2_sbd *sdp)
+int lgfs2_compute_constants(struct gfs2_sbd *sdp)
 {
 	sdp->md.next_inum = 1;
 
@@ -55,11 +55,11 @@ int compute_constants(struct gfs2_sbd *sdp)
 	sdp->sd_blocks_per_bitmap = (sdp->sd_bsize - sizeof(struct gfs2_meta_header))
 	                             * GFS2_NBBY;
 
-	if (compute_heightsize(sdp->sd_bsize, sdp->sd_heightsize, &sdp->sd_max_height,
+	if (lgfs2_compute_heightsize(sdp->sd_bsize, sdp->sd_heightsize, &sdp->sd_max_height,
 				sdp->sd_bsize, sdp->sd_diptrs, sdp->sd_inptrs)) {
 		return -1;
 	}
-	if (compute_heightsize(sdp->sd_bsize, sdp->sd_jheightsize, &sdp->sd_max_jheight,
+	if (lgfs2_compute_heightsize(sdp->sd_bsize, sdp->sd_jheightsize, &sdp->sd_max_jheight,
 				sdp->sd_jbsize, sdp->sd_diptrs, sdp->sd_inptrs)) {
 		return -1;
 	}
diff --git a/gfs2/mkfs/main_grow.c b/gfs2/mkfs/main_grow.c
index 9690021b..4ce24c90 100644
--- a/gfs2/mkfs/main_grow.c
+++ b/gfs2/mkfs/main_grow.c
@@ -394,7 +394,7 @@ int main(int argc, char *argv[])
 		}
 		sdp->sd_bsize = GFS2_DEFAULT_BSIZE;
 		sdp->sd_bsize = sdp->sd_bsize;
-		if (compute_constants(sdp)) {
+		if (lgfs2_compute_constants(sdp)) {
 			log_crit("%s\n", _("Failed to compute file system constants"));
 			exit(EXIT_FAILURE);
 		}
diff --git a/gfs2/mkfs/main_jadd.c b/gfs2/mkfs/main_jadd.c
index 0a7f1f33..e11b63f6 100644
--- a/gfs2/mkfs/main_jadd.c
+++ b/gfs2/mkfs/main_jadd.c
@@ -679,7 +679,7 @@ int main(int argc, char *argv[])
 		goto umount_meta;
 	}
 
-	if ((ret = compute_constants(sdp))) {
+	if ((ret = lgfs2_compute_constants(sdp))) {
 		perror(_("Failed to compute file system constants"));
 		goto free_paths;
 	}
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 3b0f5b4e..5a8ede04 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -1064,7 +1064,7 @@ static int sbd_init(struct gfs2_sbd *sdp, struct mkfs_opts *opts, unsigned bsize
 	sdp->sd_bsize_shift = ffs(bsize) - 1;
 	uuid_generate(sdp->sd_uuid);
 
-	if (compute_constants(sdp)) {
+	if (lgfs2_compute_constants(sdp)) {
 		perror(_("Failed to compute file system constants"));
 		return -1;
 	}
diff --git a/tests/nukerg.c b/tests/nukerg.c
index 81424e17..49bbda74 100644
--- a/tests/nukerg.c
+++ b/tests/nukerg.c
@@ -280,7 +280,7 @@ static int fill_super_block(struct gfs2_sbd *sdp)
 {
 	sdp->sd_bsize = GFS2_BASIC_BLOCK;
 
-	if (compute_constants(sdp) != 0) {
+	if (lgfs2_compute_constants(sdp) != 0) {
 		fprintf(stderr, "Failed to compute file system constants.\n");
 		return 1;
 	}
-- 
2.34.1

