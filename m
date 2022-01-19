Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6154938CC
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:44:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589093;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jvSomzxTxYQl+LQDa4cflayi4b3E/2chRJQ+Z7lB6gs=;
	b=QLIPGxyn4d/xZfxxtXNjgPrDiPE4DoUqk+/8Kih+GoOXc6MT4lY6rO9Ivnh0Sqgm8q2j9B
	9yZNm5SUzgl5PGG3Td7upGtoiwzU8EM7UHUggPfzdoQ5A3/T9Uv83JQemp8dyM5OMsh9Wm
	7fz4ow08ByOJEs+mGJrndoAyCEnHxhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-oTtsMJLdM_6eDN8hpTSClg-1; Wed, 19 Jan 2022 05:44:45 -0500
X-MC-Unique: oTtsMJLdM_6eDN8hpTSClg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D22E3105251B;
	Wed, 19 Jan 2022 10:44:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2796105914F;
	Wed, 19 Jan 2022 10:44:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B065F4BB7C;
	Wed, 19 Jan 2022 10:44:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAifKj024603 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:44:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CD54778B1D; Wed, 19 Jan 2022 10:44:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF8CA78B10
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:44:34 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:15 +0000
Message-Id: <20220119104316.2489995-21-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 20/21] libgfs2: Namespace improvements -
	constants
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

Use the LGFS2_ prefix for preprocessor #defines.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c | 12 ++++++------
 gfs2/edit/hexedit.c         | 12 ++++++------
 gfs2/fsck/fs_recovery.c     |  4 ++--
 gfs2/fsck/initialize.c      | 20 ++++++++++----------
 gfs2/fsck/rgrepair.c        |  6 +++---
 gfs2/libgfs2/fs_bits.c      |  2 +-
 gfs2/libgfs2/fs_ops.c       | 12 ++++++------
 gfs2/libgfs2/libgfs2.h      | 29 +++++++++++++----------------
 gfs2/libgfs2/rgrp.c         |  6 +++---
 gfs2/libgfs2/structures.c   |  2 +-
 gfs2/libgfs2/super.c        |  4 ++--
 gfs2/mkfs/main_grow.c       | 10 +++++-----
 gfs2/mkfs/main_jadd.c       |  4 ++--
 gfs2/mkfs/main_mkfs.c       | 24 ++++++++++++------------
 gfs2/tune/super.c           |  6 +++---
 15 files changed, 75 insertions(+), 78 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 50df7f5f..104f9812 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -970,7 +970,7 @@ static int next_rg_meta(struct rgrp_tree *rgd, uint64_t *block, int first)
 		bits = &rgd->bits[i];
 		blk = lgfs2_bitfit((uint8_t *)bits->bi_data + bits->bi_offset,
 		                   bits->bi_len, blk, GFS2_BLKST_DINODE);
-		if(blk != BFITNOENT){
+		if(blk != LGFS2_BFITNOENT){
 			*block = blk + (bits->bi_start * GFS2_NBBY) + rgd->rt_data0;
 			break;
 		}
@@ -1132,7 +1132,7 @@ static int process_dirent_info(struct lgfs2_inode *dip, struct lgfs2_sbd *sbp,
 	int de; /* directory entry index */
 	
 	error = lgfs2_dirent_first(dip, bh, &dent);
-	if (error != IS_LEAF && error != IS_DINODE) {
+	if (error != LGFS2_IS_LEAF && error != LGFS2_IS_DINODE) {
 		log_crit(_("Error retrieving directory.\n"));
 		return -1;
 	}
@@ -1576,14 +1576,14 @@ static int init(struct lgfs2_sbd *sbp, struct gfs2_options *opts)
 	/* ---------------------------------------------- */
 	/* Initialize lists and read in the superblock.   */
 	/* ---------------------------------------------- */
-	sbp->jsize = GFS2_DEFAULT_JSIZE;
-	sbp->rgsize = GFS2_DEFAULT_RGSIZE;
-	sbp->qcsize = GFS2_DEFAULT_QCSIZE;
+	sbp->jsize = LGFS2_DEFAULT_JSIZE;
+	sbp->rgsize = LGFS2_DEFAULT_RGSIZE;
+	sbp->qcsize = LGFS2_DEFAULT_QCSIZE;
 	sbp->sd_time = time(NULL);
 	sbp->blks_total = 0;   /* total blocks         - total them up later */
 	sbp->blks_alloced = 0; /* blocks allocated     - total them up later */
 	sbp->dinodes_alloced = 0; /* dinodes allocated - total them up later */
-	sbp->sd_bsize = GFS2_DEFAULT_BSIZE;
+	sbp->sd_bsize = LGFS2_DEFAULT_BSIZE;
 	sbp->rgtree.osi_node = NULL;
 	if (lgfs2_compute_constants(sbp)) {
 		log_crit("%s\n", _("Failed to compute file system constants"));
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index 90140391..9a90587f 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -874,12 +874,12 @@ static void read_superblock(int fd)
 
 	ioctl(fd, BLKFLSBUF, 0);
 	memset(&sbd, 0, sizeof(struct lgfs2_sbd));
-	sbd.sd_bsize = GFS2_DEFAULT_BSIZE;
+	sbd.sd_bsize = LGFS2_DEFAULT_BSIZE;
 	sbd.device_fd = fd;
 	bh = lgfs2_bread(&sbd, 0x10);
-	sbd.jsize = GFS2_DEFAULT_JSIZE;
-	sbd.rgsize = GFS2_DEFAULT_RGSIZE;
-	sbd.qcsize = GFS2_DEFAULT_QCSIZE;
+	sbd.jsize = LGFS2_DEFAULT_JSIZE;
+	sbd.rgsize = LGFS2_DEFAULT_RGSIZE;
+	sbd.qcsize = LGFS2_DEFAULT_QCSIZE;
 	sbd.sd_time = time(NULL);
 	sbd.rgtree.osi_node = NULL;
 	lgfs2_sb_in(&sbd, bh->b_data);
@@ -894,7 +894,7 @@ static void read_superblock(int fd)
 	else
 		sbd.gfs1 = FALSE;
 	if (!sbd.sd_bsize)
-		sbd.sd_bsize = GFS2_DEFAULT_BSIZE;
+		sbd.sd_bsize = LGFS2_DEFAULT_BSIZE;
 	if (lgfs2_get_dev_info(fd, &sbd.dinfo)) {
 		perror(device);
 		exit(-1);
@@ -905,7 +905,7 @@ static void read_superblock(int fd)
 	}
 	if (sbd.gfs1 || (be32_to_cpu(mh->mh_magic) == GFS2_MAGIC &&
 	                 be32_to_cpu(mh->mh_type) == GFS2_METATYPE_SB))
-		block = 0x10 * (GFS2_DEFAULT_BSIZE / sbd.sd_bsize);
+		block = 0x10 * (LGFS2_DEFAULT_BSIZE / sbd.sd_bsize);
 	else {
 		block = starting_blk = 0;
 	}
diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index 45bd213a..f65c4a33 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -683,7 +683,7 @@ int replay_journals(struct lgfs2_sbd *sdp, int preen, int force_check,
 
 	*clean_journals = 0;
 
-	sdp->jsize = GFS2_DEFAULT_JSIZE;
+	sdp->jsize = LGFS2_DEFAULT_JSIZE;
 
 	for(i = 0; i < sdp->md.journals; i++) {
 		if (sdp->md.journal[i]) {
@@ -704,7 +704,7 @@ int replay_journals(struct lgfs2_sbd *sdp, int preen, int force_check,
 		if (!error) {
 			uint64_t jsize = sdp->md.journal[i]->i_size / (1024 * 1024);
 
-			if (sdp->jsize == GFS2_DEFAULT_JSIZE && jsize &&
+			if (sdp->jsize == LGFS2_DEFAULT_JSIZE && jsize &&
 			    jsize != sdp->jsize)
 				sdp->jsize = jsize;
 			error = gfs2_recover_journal(sdp->md.journal[i], i,
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index ec9a8eef..8957ddf9 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -1130,14 +1130,14 @@ static int find_rgs_for_bsize(struct lgfs2_sbd *sdp, uint64_t startblock,
 	uint32_t bsize, bsize2;
 	int found_rg;
 
-	sdp->sd_bsize = GFS2_DEFAULT_BSIZE;
+	sdp->sd_bsize = LGFS2_DEFAULT_BSIZE;
 	max_rg_size = 524288;
 	/* Max RG size is 2GB. Max block size is 4K. 2G / 4K blks = 524288,
 	   So this is traversing 2GB in 4K block increments. */
 	for (blk = startblock; blk < startblock + max_rg_size; blk++) {
 		bh = lgfs2_bread(sdp, blk);
 		found_rg = 0;
-		for (bsize = 0; bsize < GFS2_DEFAULT_BSIZE; bsize += GFS2_BASIC_BLOCK) {
+		for (bsize = 0; bsize < LGFS2_DEFAULT_BSIZE; bsize += GFS2_BASIC_BLOCK) {
 			struct gfs2_meta_header *mhp;
 
 			mhp = (struct gfs2_meta_header *)(bh->b_data + bsize);
@@ -1151,13 +1151,13 @@ static int find_rgs_for_bsize(struct lgfs2_sbd *sdp, uint64_t startblock,
 		if (!found_rg)
 			continue;
 		/* Try all the block sizes in 512 byte multiples */
-		for (bsize2 = GFS2_BASIC_BLOCK; bsize2 <= GFS2_DEFAULT_BSIZE;
+		for (bsize2 = GFS2_BASIC_BLOCK; bsize2 <= LGFS2_DEFAULT_BSIZE;
 		     bsize2 += GFS2_BASIC_BLOCK) {
 			struct gfs2_meta_header *mh;
 			int is_rb;
 
 			rb_addr = (bh->b_blocknr *
-				   (GFS2_DEFAULT_BSIZE / bsize2)) +
+				   (LGFS2_DEFAULT_BSIZE / bsize2)) +
 				(bsize / bsize2) + 1;
 			sdp->sd_bsize = bsize2; /* temporarily */
 			rb_bh = lgfs2_bread(sdp, rb_addr);
@@ -1175,7 +1175,7 @@ static int find_rgs_for_bsize(struct lgfs2_sbd *sdp, uint64_t startblock,
 		}
 		lgfs2_brelse(bh);
 		if (!(*known_bsize)) {
-			sdp->sd_bsize = GFS2_DEFAULT_BSIZE;
+			sdp->sd_bsize = LGFS2_DEFAULT_BSIZE;
 			continue;
 		}
 
@@ -1227,11 +1227,11 @@ static int sb_repair(struct lgfs2_sbd *sdp)
 
 	memset(&fix_md, 0, sizeof(fix_md));
 	/* Step 1 - First we need to determine the correct block size. */
-	sdp->sd_bsize = GFS2_DEFAULT_BSIZE;
+	sdp->sd_bsize = LGFS2_DEFAULT_BSIZE;
 	log_warn(_("Gathering information to repair the gfs2 superblock.  "
 		   "This may take some time.\n"));
 	error = find_rgs_for_bsize(sdp, (GFS2_SB_ADDR * GFS2_BASIC_BLOCK) /
-				   GFS2_DEFAULT_BSIZE, &known_bsize);
+				   LGFS2_DEFAULT_BSIZE, &known_bsize);
 	if (error)
 		return error;
 	if (!known_bsize) {
@@ -1253,7 +1253,7 @@ static int sb_repair(struct lgfs2_sbd *sdp)
 	}
 	/* Step 2 - look for the sytem dinodes */
 	error = peruse_metadata(sdp, (GFS2_SB_ADDR * GFS2_BASIC_BLOCK) /
-				GFS2_DEFAULT_BSIZE);
+				LGFS2_DEFAULT_BSIZE);
 	if (error)
 		return error;
 	if (!sdp->sd_meta_dir.in_addr) {
@@ -1340,7 +1340,7 @@ static int fill_super_block(struct lgfs2_sbd *sdp)
 	log_info( _("Initializing lists...\n"));
 	sdp->rgtree.osi_node = NULL;
 
-	sdp->sd_bsize = GFS2_DEFAULT_BSIZE;
+	sdp->sd_bsize = LGFS2_DEFAULT_BSIZE;
 	if (lgfs2_compute_constants(sdp)) {
 		log_crit("%s\n", _("Failed to compute file system constants"));
 		return FSCK_ERROR;
@@ -1434,7 +1434,7 @@ static int correct_journal_seg_size(struct lgfs2_sbd *sdp)
 	int count;
 	struct gfs_jindex *ji_0, *ji_1;
 	char buf[sizeof(struct gfs_jindex)];
-	unsigned int jsize = GFS2_DEFAULT_JSIZE * 1024 * 1024;
+	unsigned int jsize = LGFS2_DEFAULT_JSIZE * 1024 * 1024;
 
 	count = lgfs2_readi(sdp->md.jiinode, buf, 0, sizeof(struct gfs_jindex));
 	if (count != sizeof(struct gfs_jindex)) {
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index b74eaa4a..2cfc3f5b 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -712,9 +712,9 @@ static uint64_t how_many_rgrps(struct lgfs2_sbd *sdp, struct lgfs2_device *dev)
 		if (bitblocks1 <= 2149 && bitblocksn <= 2149)
 			break;
 
-		sdp->rgsize -= GFS2_DEFAULT_RGSIZE; /* smaller rgs */
+		sdp->rgsize -= LGFS2_DEFAULT_RGSIZE; /* smaller rgs */
 
-		if (sdp->rgsize < GFS2_DEFAULT_RGSIZE) {
+		if (sdp->rgsize < LGFS2_DEFAULT_RGSIZE) {
 			log_err(_("Cannot use the entire device with block size %u bytes.\n"),
 			        sdp->sd_bsize);
 			return 0;
@@ -821,7 +821,7 @@ static int gfs2_rindex_calculate(struct lgfs2_sbd *sdp, int *num_rgs)
 	lgfs2_fix_device_geometry(sdp);
 
 	/* Try all possible rgrp sizes: 2048, 1024, 512, 256, 128, 64, 32 */
-	for (sdp->rgsize = GFS2_DEFAULT_RGSIZE; sdp->rgsize >= 32;
+	for (sdp->rgsize = LGFS2_DEFAULT_RGSIZE; sdp->rgsize >= 32;
 	     sdp->rgsize /= 2) {
 		num_rgrps = how_many_rgrps(sdp, &sdp->device);
 		if (num_rgrps == *num_rgs) {
diff --git a/gfs2/libgfs2/fs_bits.c b/gfs2/libgfs2/fs_bits.c
index a75c1aa5..7bcd34b9 100644
--- a/gfs2/libgfs2/fs_bits.c
+++ b/gfs2/libgfs2/fs_bits.c
@@ -91,7 +91,7 @@ unsigned long lgfs2_bitfit(const unsigned char *buf, const unsigned int len,
 			(64 - 8 * (len & (sizeof(uint64_t) - 1))));
 	/* Didn't find anything, so return */
 	if (tmp == 0)
-		return BFITNOENT;
+		return LGFS2_BFITNOENT;
 	ptr--;
 	bit = ffsll(tmp);
 	bit /= 2;	/* two bits per entry in the bitmap */
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index 9083b811..788509f3 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -123,7 +123,7 @@ static uint64_t find_free_block(struct rgrp_tree *rgd)
 
 		blk = lgfs2_bitfit((uint8_t *)bits->bi_data + bits->bi_offset,
 		                  bits->bi_len, blk, GFS2_BLKST_FREE);
-		if (blk != BFITNOENT) {
+		if (blk != LGFS2_BFITNOENT) {
 			blkno = blk + (bits->bi_start * GFS2_NBBY) + rgd->rt_data0;
 			break;
 		}
@@ -744,10 +744,10 @@ int lgfs2_dirent_first(struct lgfs2_inode *dip, struct lgfs2_buffer_head *bh,
 
 	if (be32_to_cpu(h->mh_type) == GFS2_METATYPE_LF) {
 		*dent = (struct gfs2_dirent *)(bh->b_data + sizeof(struct gfs2_leaf));
-		return IS_LEAF;
+		return LGFS2_IS_LEAF;
 	} else {
 		*dent = (struct gfs2_dirent *)(bh->b_data + sizeof(struct gfs2_dinode));
-		return IS_DINODE;
+		return LGFS2_IS_DINODE;
 	}
 }
 
@@ -783,7 +783,7 @@ static int dirent_alloc(struct lgfs2_inode *dip, struct lgfs2_buffer_head *bh,
 
 	type = lgfs2_dirent_first(dip, bh, &dent);
 
-	if (type == IS_LEAF) {
+	if (type == LGFS2_IS_LEAF) {
 		struct gfs2_leaf *leaf = (struct gfs2_leaf *)bh->b_data;
 		entries = be16_to_cpu(leaf->lf_entries);
 		offset = sizeof(struct gfs2_leaf);
@@ -1590,10 +1590,10 @@ static int leaf_search(struct lgfs2_inode *dip, struct lgfs2_buffer_head *bh,
 
 	type = lgfs2_dirent_first(dip, bh, &dent);
 
-	if (type == IS_LEAF){
+	if (type == LGFS2_IS_LEAF){
 		struct gfs2_leaf *leaf = (struct gfs2_leaf *)bh->b_data;
 		entries = be16_to_cpu(leaf->lf_entries);
-	} else if (type == IS_DINODE)
+	} else if (type == LGFS2_IS_DINODE)
 		entries = dip->i_entries;
 	else
 		return -1;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 1fc04926..625fc017 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -417,19 +417,16 @@ struct lgfs2_metapath {
 };
 
 
-#define GFS2_DEFAULT_BSIZE          (4096)
-#define GFS2_DEFAULT_JSIZE          (128)
-#define GFS2_MAX_JSIZE              (1024)
-#define GFS2_MIN_JSIZE              (8)
-#define GFS2_DEFAULT_RGSIZE         (256)
-#define GFS2_DEFAULT_UTSIZE         (1)
-#define GFS2_DEFAULT_QCSIZE         (1)
-#define GFS2_DEFAULT_LOCKPROTO      "lock_dlm"
-#define GFS2_MIN_GROW_SIZE          (10)
-#define GFS2_EXCESSIVE_RGS          (10000)
-
-#define GFS2_MIN_RGSIZE             (32)
-#define GFS2_MAX_RGSIZE             (2048)
+#define LGFS2_DEFAULT_BSIZE          (4096)
+#define LGFS2_DEFAULT_JSIZE          (128)
+#define LGFS2_MAX_JSIZE              (1024)
+#define LGFS2_MIN_JSIZE              (8)
+#define LGFS2_DEFAULT_RGSIZE         (256)
+#define LGFS2_DEFAULT_QCSIZE         (1)
+#define LGFS2_DEFAULT_LOCKPROTO      "lock_dlm"
+
+#define LGFS2_MIN_RGSIZE             (32)
+#define LGFS2_MAX_RGSIZE             (2048)
 
 #define LGFS2_FS_FORMAT_MIN (1801)
 #define LGFS2_FS_FORMAT_MAX (1802)
@@ -476,7 +473,7 @@ extern int lgfs2_get_dev_info(int fd, struct lgfs2_dev_info *i);
 extern void lgfs2_fix_device_geometry(struct lgfs2_sbd *sdp);
 
 /* fs_bits.c */
-#define BFITNOENT (0xFFFFFFFF)
+#define LGFS2_BFITNOENT (0xFFFFFFFF)
 
 /* functions with blk #'s that are buffer relative */
 extern unsigned long lgfs2_bitfit(const unsigned char *buffer,
@@ -491,8 +488,8 @@ extern int lgfs2_get_bitmap(struct lgfs2_sbd *sdp, uint64_t blkno, struct rgrp_t
 extern int lgfs2_set_bitmap(lgfs2_rgrp_t rg, uint64_t blkno, int state);
 
 /* fs_ops.c */
-#define IS_LEAF     (1)
-#define IS_DINODE   (2)
+#define LGFS2_IS_LEAF   (1)
+#define LGFS2_IS_DINODE (2)
 
 extern void lgfs2_find_metapath(struct lgfs2_inode *ip, uint64_t block, struct lgfs2_metapath *mp);
 extern void lgfs2_lookup_block(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
diff --git a/gfs2/libgfs2/rgrp.c b/gfs2/libgfs2/rgrp.c
index 3ae490e8..3ec56f08 100644
--- a/gfs2/libgfs2/rgrp.c
+++ b/gfs2/libgfs2/rgrp.c
@@ -344,8 +344,8 @@ uint32_t lgfs2_rgrp_align_len(const lgfs2_rgrps_t rgs, uint32_t len)
  */
 uint32_t lgfs2_rgrps_plan(const lgfs2_rgrps_t rgs, uint64_t space, uint32_t tgtsize)
 {
-	uint32_t maxlen = (GFS2_MAX_RGSIZE << 20) / rgs->sdp->sd_bsize;
-	uint32_t minlen = (GFS2_MIN_RGSIZE << 20) / rgs->sdp->sd_bsize;
+	uint32_t maxlen = (LGFS2_MAX_RGSIZE << 20) / rgs->sdp->sd_bsize;
+	uint32_t minlen = (LGFS2_MIN_RGSIZE << 20) / rgs->sdp->sd_bsize;
 	struct rg_spec *spec = rgs->plan->rg_specs;
 
 	/* Apps should already have checked that the rg size is <=
@@ -952,7 +952,7 @@ int lgfs2_rbm_find(struct lgfs2_rbm *rbm, uint8_t state, uint32_t *minext)
 			goto next_bitmap;
 
 		offset = lgfs2_bitfit(buf, bi->bi_len, rbm->offset, state);
-		if (offset == BFITNOENT)
+		if (offset == LGFS2_BFITNOENT)
 			goto next_bitmap;
 
 		rbm->offset = offset;
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index d67c1fc0..d13f67a4 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -506,7 +506,7 @@ unsigned lgfs2_bm_scan(struct rgrp_tree *rgd, unsigned idx, uint64_t *buf, uint8
 	while(blk < (bi->bi_len * GFS2_NBBY)) {
 		blk = lgfs2_bitfit((uint8_t *)bi->bi_data + bi->bi_offset,
 				  bi->bi_len, blk, state);
-		if (blk == BFITNOENT)
+		if (blk == LGFS2_BFITNOENT)
 			break;
 		buf[n++] = blk + (bi->bi_start * GFS2_NBBY) + rgd->rt_data0;
 		blk++;
diff --git a/gfs2/libgfs2/super.c b/gfs2/libgfs2/super.c
index 6af366f7..d42bdb03 100644
--- a/gfs2/libgfs2/super.c
+++ b/gfs2/libgfs2/super.c
@@ -132,7 +132,7 @@ int lgfs2_read_sb(struct lgfs2_sbd *sdp)
 	sdp->fssize = lseek(sdp->device_fd, 0, SEEK_END) / sdp->sd_bsize;
 	sdp->sd_blocks_per_bitmap = (sdp->sd_bsize - sizeof(struct gfs2_meta_header))
 	                             * GFS2_NBBY;
-	sdp->qcsize = GFS2_DEFAULT_QCSIZE;
+	sdp->qcsize = LGFS2_DEFAULT_QCSIZE;
 
 	return 0;
 }
@@ -157,7 +157,7 @@ static int rgd_seems_ok(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd)
 	/* A max rgrp, 2GB, divided into blocksize, divided by blocks/byte
 	   represented in the bitmap, NBBY. Rough approximation only, due to
 	   metadata headers. I'm doing the math this way to avoid overflow. */
-	most_bitmaps_possible = (GFS2_MAX_RGSIZE * 1024 * 256) / sdp->sd_bsize;
+	most_bitmaps_possible = (LGFS2_MAX_RGSIZE * 1024 * 256) / sdp->sd_bsize;
 	if (rgd->rt_length > most_bitmaps_possible)
 		return 0;
 
diff --git a/gfs2/mkfs/main_grow.c b/gfs2/mkfs/main_grow.c
index f3c6d0ba..524efe1b 100644
--- a/gfs2/mkfs/main_grow.c
+++ b/gfs2/mkfs/main_grow.c
@@ -363,10 +363,10 @@ int main(int argc, char *argv[])
 	srandom(time(NULL) ^ getpid());
 
 	memset(sdp, 0, sizeof(struct lgfs2_sbd));
-	sdp->sd_bsize = GFS2_DEFAULT_BSIZE;
+	sdp->sd_bsize = LGFS2_DEFAULT_BSIZE;
 	sdp->rgsize = -1;
-	sdp->jsize = GFS2_DEFAULT_JSIZE;
-	sdp->qcsize = GFS2_DEFAULT_QCSIZE;
+	sdp->jsize = LGFS2_DEFAULT_JSIZE;
+	sdp->qcsize = LGFS2_DEFAULT_QCSIZE;
 	sdp->md.journals = 1;
 	decode_arguments(argc, argv, sdp);
 
@@ -392,7 +392,7 @@ int main(int argc, char *argv[])
 			perror(mnt->mnt_fsname);
 			exit(EXIT_FAILURE);
 		}
-		sdp->sd_bsize = GFS2_DEFAULT_BSIZE;
+		sdp->sd_bsize = LGFS2_DEFAULT_BSIZE;
 		sdp->sd_bsize = sdp->sd_bsize;
 		if (lgfs2_compute_constants(sdp)) {
 			log_crit("%s\n", _("Failed to compute file system constants"));
@@ -454,7 +454,7 @@ int main(int argc, char *argv[])
 			goto out;
 		}
 		fsgrowth = (sdp->device.length - fssize);
-		rgcount = lgfs2_rgrps_plan(rgs, fsgrowth, ((GFS2_MAX_RGSIZE << 20) / sdp->sd_bsize));
+		rgcount = lgfs2_rgrps_plan(rgs, fsgrowth, ((LGFS2_MAX_RGSIZE << 20) / sdp->sd_bsize));
 		if (rgcount == 0) {
 			log_err( _("The calculated resource group size is too small.\n"));
 			log_err( _("%s has not grown.\n"), argv[optind]);
diff --git a/gfs2/mkfs/main_jadd.c b/gfs2/mkfs/main_jadd.c
index 90a216bb..670a75c0 100644
--- a/gfs2/mkfs/main_jadd.c
+++ b/gfs2/mkfs/main_jadd.c
@@ -640,8 +640,8 @@ int main(int argc, char *argv[])
 	srandom(time(NULL) ^ getpid());
 
 	memset(sdp, 0, sizeof(struct lgfs2_sbd));
-	sdp->jsize = GFS2_DEFAULT_JSIZE;
-	sdp->qcsize = GFS2_DEFAULT_QCSIZE;
+	sdp->jsize = LGFS2_DEFAULT_JSIZE;
+	sdp->qcsize = LGFS2_DEFAULT_QCSIZE;
 	opts.journals = 1;
 
 	ret = decode_arguments(argc, argv, sdp, &opts);
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index c7712be8..f72f7e17 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -150,10 +150,10 @@ static void opts_init(struct mkfs_opts *opts)
 	memset(opts, 0, sizeof(*opts));
 	opts->discard = 1;
 	opts->journals = 1;
-	opts->bsize = GFS2_DEFAULT_BSIZE;
-	opts->jsize = GFS2_DEFAULT_JSIZE;
-	opts->qcsize = GFS2_DEFAULT_QCSIZE;
-	opts->rgsize = GFS2_DEFAULT_RGSIZE;
+	opts->bsize = LGFS2_DEFAULT_BSIZE;
+	opts->jsize = LGFS2_DEFAULT_JSIZE;
+	opts->qcsize = LGFS2_DEFAULT_QCSIZE;
+	opts->rgsize = LGFS2_DEFAULT_RGSIZE;
 	opts->lockproto = "lock_dlm";
 	opts->locktable = "";
 	opts->confirm = 1;
@@ -561,10 +561,10 @@ static int choose_blocksize(struct mkfs_opts *opts, unsigned *pbsize)
 	}
 	if (!opts->got_bsize && got_topol) {
 		if (dev->optimal_io_size <= getpagesize() &&
-		    dev->optimal_io_size >= GFS2_DEFAULT_BSIZE)
+		    dev->optimal_io_size >= LGFS2_DEFAULT_BSIZE)
 			bsize = dev->optimal_io_size;
 		else if (dev->physical_sector_size <= getpagesize() &&
-		         dev->physical_sector_size >= GFS2_DEFAULT_BSIZE)
+		         dev->physical_sector_size >= LGFS2_DEFAULT_BSIZE)
 			bsize = dev->physical_sector_size;
 	}
 	/* Block sizes must be a power of two from 512 to 65536 */
@@ -602,7 +602,7 @@ static int opts_check(struct mkfs_opts *opts)
 	if (test_locking(opts) != 0)
 		return -1;
 
-	if (GFS2_MIN_RGSIZE > opts->rgsize || opts->rgsize > GFS2_MAX_RGSIZE) {
+	if (LGFS2_MIN_RGSIZE > opts->rgsize || opts->rgsize > LGFS2_MAX_RGSIZE) {
 		/* Translators: gfs2 file systems are split into equal sized chunks called
 		   resource groups. We're checking that the user gave a valid size for them. */
 		fprintf(stderr, _("Bad resource group size\n"));
@@ -617,7 +617,7 @@ static int opts_check(struct mkfs_opts *opts)
 		fprintf(stderr, _("Number of journals cannot be negative: %d\n"), opts->journals);
 		return -1;
 	}
-	if (opts->jsize < GFS2_MIN_JSIZE || opts->jsize > GFS2_MAX_JSIZE) {
+	if (opts->jsize < LGFS2_MIN_JSIZE || opts->jsize > LGFS2_MAX_JSIZE) {
 		fprintf(stderr, _("Bad journal size\n"));
 		return -1;
 	}
@@ -1028,7 +1028,7 @@ static int create_jindex(struct lgfs2_sbd *sdp, struct mkfs_opts *opts, struct l
  */
 static int default_journal_size(unsigned bsize, uint64_t num_blocks)
 {
-	int min_blocks = (GFS2_MIN_JSIZE << 20) / bsize;
+	int min_blocks = (LGFS2_MIN_JSIZE << 20) / bsize;
 
 	if (num_blocks < 2 * min_blocks)
 		return -1;
@@ -1091,15 +1091,15 @@ static int sbd_init(struct lgfs2_sbd *sdp, struct mkfs_opts *opts, unsigned bsiz
 			return -1;
 		}
 		jsize_mb = (default_jsize * sdp->sd_bsize) >> 20;
-		if (jsize_mb < GFS2_MIN_JSIZE)
-			opts->jsize = GFS2_MIN_JSIZE;
+		if (jsize_mb < LGFS2_MIN_JSIZE)
+			opts->jsize = LGFS2_MIN_JSIZE;
 		else
 			opts->jsize = jsize_mb;
 	} else if ((((opts->jsize * opts->journals) << 20) / sdp->sd_bsize) > (sdp->device.length / 2)) {
 		unsigned max_jsize = (sdp->device.length / 2 * sdp->sd_bsize / opts->journals) >> 20;
 
 		fprintf(stderr, _("gfs2 will not fit on this device.\n"));
-		if (max_jsize >= GFS2_MIN_JSIZE)
+		if (max_jsize >= LGFS2_MIN_JSIZE)
 			fprintf(stderr, _("Maximum size for %u journals on this device is %uMB.\n"),
 			        opts->journals, max_jsize);
 		return -1;
diff --git a/gfs2/tune/super.c b/gfs2/tune/super.c
index 03df530e..ff727fab 100644
--- a/gfs2/tune/super.c
+++ b/gfs2/tune/super.c
@@ -19,12 +19,12 @@ int read_super(struct tunegfs2 *tfs)
 	void *block;
 	int n;
        	tfs->sb_start = GFS2_SB_ADDR << GFS2_BASIC_BLOCK_SHIFT;
-	block = malloc(sizeof(char) * GFS2_DEFAULT_BSIZE);
+	block = malloc(sizeof(char) * LGFS2_DEFAULT_BSIZE);
 	if (!block) {
 		perror("read_super: malloc");
 		return EX_UNAVAILABLE;
 	}
-	n = pread(tfs->fd, block, GFS2_DEFAULT_BSIZE, tfs->sb_start);
+	n = pread(tfs->fd, block, LGFS2_DEFAULT_BSIZE, tfs->sb_start);
 	if (n < 0) {
 		perror("read_super: pread");
 		free(block);
@@ -71,7 +71,7 @@ int print_super(const struct tunegfs2 *tfs)
 int write_super(const struct tunegfs2 *tfs)
 {
 	int n;
-	n = pwrite(tfs->fd, tfs->sb, GFS2_DEFAULT_BSIZE, tfs->sb_start);
+	n = pwrite(tfs->fd, tfs->sb, LGFS2_DEFAULT_BSIZE, tfs->sb_start);
 	if (n < 0) {
 		perror("write_super: pwrite");
 		return EX_IOERR;
-- 
2.34.1

