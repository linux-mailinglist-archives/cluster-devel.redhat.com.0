Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D29224938BC
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:43:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589026;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rUR+b8Vd9rWwfH1qFVFjsjnSdWttcyP0QKNoHT/El4Y=;
	b=UTxtA7ird7zv8pJn7m6wIxX7ZVYQTi+pUFByrjIjV9jBXb1SW/0csctEKBScDLvugmP+6z
	Cd9VkMl31DYnjREIlDezYk5CmKb9oGiH3UK3ONwPf1L6W7ZwGFL28pp4OPlnXURAuHDBqr
	VpAz2BREWFpWH1ZDmpT+gyXjUF7E0nI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-5b_mjdRTNAqHN_jBZl5u8A-1; Wed, 19 Jan 2022 05:43:43 -0500
X-MC-Unique: 5b_mjdRTNAqHN_jBZl5u8A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F8BE83DD21;
	Wed, 19 Jan 2022 10:43:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6EED70D53;
	Wed, 19 Jan 2022 10:43:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C3934CA9B;
	Wed, 19 Jan 2022 10:43:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAhZS1024198 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:43:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 50B007A221; Wed, 19 Jan 2022 10:43:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FEB3795B7
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:43:34 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:42:59 +0000
Message-Id: <20220119104316.2489995-5-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 04/21] libgfs2: Namespace improvements -
	fs_bits.c
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Use the lgfs2_ prefix in libgfs2 interface names.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c |  2 +-
 gfs2/edit/hexedit.c         |  2 +-
 gfs2/edit/savemeta.c        |  4 ++--
 gfs2/fsck/metawalk.c        |  2 +-
 gfs2/fsck/pass5.c           |  4 ++--
 gfs2/fsck/rgrepair.c        |  2 +-
 gfs2/libgfs2/check_rgrp.c   |  2 +-
 gfs2/libgfs2/fs_bits.c      | 22 +++++++++++-----------
 gfs2/libgfs2/fs_ops.c       |  8 ++++----
 gfs2/libgfs2/lang.c         |  2 +-
 gfs2/libgfs2/libgfs2.h      |  9 +++------
 gfs2/libgfs2/rgrp.c         |  8 ++++----
 gfs2/libgfs2/structures.c   |  2 +-
 gfs2/libgfs2/super.c        |  2 +-
 14 files changed, 34 insertions(+), 37 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index bef0cf6f..9bf92ed4 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -968,7 +968,7 @@ static int next_rg_meta(struct rgrp_tree *rgd, uint64_t *block, int first)
 	}
 	for (; i < length; i++){
 		bits = &rgd->bits[i];
-		blk = gfs2_bitfit((uint8_t *)bits->bi_data + bits->bi_offset,
+		blk = lgfs2_bitfit((uint8_t *)bits->bi_data + bits->bi_offset,
 		                   bits->bi_len, blk, GFS2_BLKST_DINODE);
 		if(blk != BFITNOENT){
 			*block = blk + (bits->bi_start * GFS2_NBBY) + rgd->rt_data0;
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index 22e70830..ab5fa933 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -1664,7 +1664,7 @@ static void find_change_block_alloc(int *newval)
 		if (rgd) {
 			gfs2_rgrp_read(&sbd, rgd);
 			if (newval) {
-				if (gfs2_set_bitmap(rgd, ablock, *newval))
+				if (lgfs2_set_bitmap(rgd, ablock, *newval))
 					printf("-1 (block invalid or part of an rgrp).\n");
 				else
 					printf("%d\n", *newval);
diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 3b2152df..1d22df2e 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -804,7 +804,7 @@ static int save_leaf_chain(struct metafd *mfd, struct gfs2_sbd *sdp, char *buf)
 		uint64_t blk = be64_to_cpu(leaf->lf_next);
 		ssize_t r;
 
-		if (gfs2_check_range(sdp, blk) != 0)
+		if (lgfs2_check_range(sdp, blk) != 0)
 			return 0;
 
 		r = pread(sdp->device_fd, buf, sdp->sd_bsize, sdp->sd_bsize * blk);
@@ -1041,7 +1041,7 @@ static char *rgrp_read(struct gfs2_sbd *sdp, uint64_t addr, unsigned blocks)
 	off_t off = addr * sdp->sd_bsize;
 	char *buf;
 
-	if (blocks == 0 || gfs2_check_range(sdp, addr))
+	if (blocks == 0 || lgfs2_check_range(sdp, addr))
 		return NULL;
 
 	buf = calloc(1, len);
diff --git a/gfs2/fsck/metawalk.c b/gfs2/fsck/metawalk.c
index a5b3fe36..a401e792 100644
--- a/gfs2/fsck/metawalk.c
+++ b/gfs2/fsck/metawalk.c
@@ -77,7 +77,7 @@ int check_n_fix_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 	   bitmap state was free (and therefore it no longer is) we have to
 	   subtract to the free space.  If the type changed from dinode to 
 	   data or data to dinode, no change in free space. */
-	gfs2_set_bitmap(rgd, blk, new_state);
+	lgfs2_set_bitmap(rgd, blk, new_state);
 	if (new_state == GFS2_BLKST_FREE) {
 		rgd->rt_free++;
 		rewrite_rgrp = 1;
diff --git a/gfs2/fsck/pass5.c b/gfs2/fsck/pass5.c
index 9b8f8375..976c8641 100644
--- a/gfs2/fsck/pass5.c
+++ b/gfs2/fsck/pass5.c
@@ -69,7 +69,7 @@ static int check_block_status(struct gfs2_sbd *sdp,  struct gfs2_bmap *bl,
 			if (query(_("Do you want to reclaim the block? "
 				   "(y/n) "))) {
 				lgfs2_rgrp_t rg = gfs2_blk2rgrpd(sdp, block);
-				if (gfs2_set_bitmap(rg, block, GFS2_BLKST_FREE))
+				if (lgfs2_set_bitmap(rg, block, GFS2_BLKST_FREE))
 					log_err(_("Unlinked block %"PRIu64" (0x%"PRIx64") bitmap not fixed.\n"),
 					        block, block);
 				else {
@@ -94,7 +94,7 @@ static int check_block_status(struct gfs2_sbd *sdp,  struct gfs2_bmap *bl,
 			if (query(_("Fix bitmap for block %"PRIu64" (0x%"PRIx64")? (y/n) "),
 			          block, block)) {
 				lgfs2_rgrp_t rg = gfs2_blk2rgrpd(sdp, block);
-				if (gfs2_set_bitmap(rg, block, q))
+				if (lgfs2_set_bitmap(rg, block, q))
 					log_err( _("Repair failed.\n"));
 				else
 					log_err( _("Fixed.\n"));
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index 825a6398..6f15d2d4 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -429,7 +429,7 @@ static uint64_t hunt_and_peck(struct gfs2_sbd *sdp, uint64_t blk,
 
 	/* Skip ahead the previous amount: we might get lucky.
 	   If we're close to the end of the device, take the rest. */
-	if (gfs2_check_range(sdp, blk + last_bump))
+	if (lgfs2_check_range(sdp, blk + last_bump))
 		return sdp->fssize - blk;
 
 	bh = lgfs2_bread(sdp, blk + last_bump);
diff --git a/gfs2/libgfs2/check_rgrp.c b/gfs2/libgfs2/check_rgrp.c
index 5178c7a7..2dc2e7be 100644
--- a/gfs2/libgfs2/check_rgrp.c
+++ b/gfs2/libgfs2/check_rgrp.c
@@ -118,7 +118,7 @@ START_TEST(test_rbm_find_lastblock)
 		memset(rg->bits[i].bi_data, 0xff, rgs->sdp->sd_bsize);
 
 	/* ...except the final one */
-	err = gfs2_set_bitmap(rg, rg->rt_data0 + rg->rt_data - 1, GFS2_BLKST_FREE);
+	err = lgfs2_set_bitmap(rg, rg->rt_data0 + rg->rt_data - 1, GFS2_BLKST_FREE);
 	ck_assert_int_eq(err, 0);
 
 	err = lgfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &minext);
diff --git a/gfs2/libgfs2/fs_bits.c b/gfs2/libgfs2/fs_bits.c
index 8399e486..940ebf3c 100644
--- a/gfs2/libgfs2/fs_bits.c
+++ b/gfs2/libgfs2/fs_bits.c
@@ -21,7 +21,7 @@
 #define ALIGN(x,a) (((x)+(a)-1)&~((a)-1))
 
 /**
- * gfs2_bit_search
+ * bit_search
  * @ptr: Pointer to bitmap data
  * @mask: Mask to use (normally 0x55555.... but adjusted for search start)
  * @state: The state we are searching for
@@ -38,7 +38,7 @@
  * single test (on 64 bit arches).
  */
 
-static inline uint64_t gfs2_bit_search(const __le64 *ptr,
+static inline uint64_t bit_search(const __le64 *ptr,
 				       unsigned long long mask,
 				       uint8_t state)
 {
@@ -56,7 +56,7 @@ static inline uint64_t gfs2_bit_search(const __le64 *ptr,
 }
 
 /**
- * gfs2_bitfit - Find a free block in the bitmaps
+ * lgfs2_bitfit - Find a free block in the bitmaps
  * @buffer: the buffer that holds the bitmaps
  * @buflen: the length (in bytes) of the buffer
  * @goal: the block to try to allocate
@@ -64,7 +64,7 @@ static inline uint64_t gfs2_bit_search(const __le64 *ptr,
  *
  * Return: the block number that was allocated
  */
-unsigned long gfs2_bitfit(const unsigned char *buf, const unsigned int len,
+unsigned long lgfs2_bitfit(const unsigned char *buf, const unsigned int len,
 			  unsigned long goal, unsigned char state)
 {
 	uint32_t spoint = (goal << 1) & ((8 * sizeof(uint64_t)) - 1);
@@ -79,10 +79,10 @@ unsigned long gfs2_bitfit(const unsigned char *buf, const unsigned int len,
 
 	/* Mask off bits we don't care about at the start of the search */
 	mask <<= spoint;
-	tmp = gfs2_bit_search(ptr, mask, state);
+	tmp = bit_search(ptr, mask, state);
 	ptr++;
 	while(tmp == 0 && ptr < end) {
-		tmp = gfs2_bit_search(ptr, 0x5555555555555555ULL, state);
+		tmp = bit_search(ptr, 0x5555555555555555ULL, state);
 		ptr++;
 	}
 	/* Mask off any bits which are more than len bytes from the start */
@@ -99,13 +99,13 @@ unsigned long gfs2_bitfit(const unsigned char *buf, const unsigned int len,
 }
 
 /*
- * check_range - check if blkno is within FS limits
+ * lgfs2_check_range - check if blkno is within FS limits
  * @sdp: super block
  * @blkno: block number
  *
  * Returns: 0 if ok, -1 if out of bounds
  */
-int gfs2_check_range(struct gfs2_sbd *sdp, uint64_t blkno)
+int lgfs2_check_range(struct gfs2_sbd *sdp, uint64_t blkno)
 {
 	if((blkno > sdp->fssize) || (blkno <= LGFS2_SB_ADDR(sdp)))
 		return -1;
@@ -113,7 +113,7 @@ int gfs2_check_range(struct gfs2_sbd *sdp, uint64_t blkno)
 }
 
 /*
- * gfs2_set_bitmap
+ * lgfs2_set_bitmap
  * @sdp: super block
  * @blkno: block number relative to file system
  * @state: one of three possible states
@@ -123,7 +123,7 @@ int gfs2_check_range(struct gfs2_sbd *sdp, uint64_t blkno)
  *
  * Returns: 0 on success, -1 on error
  */
-int gfs2_set_bitmap(lgfs2_rgrp_t rgd, uint64_t blkno, int state)
+int lgfs2_set_bitmap(lgfs2_rgrp_t rgd, uint64_t blkno, int state)
 {
 	int           buf;
 	uint32_t        rgrp_block;
@@ -160,7 +160,7 @@ int gfs2_set_bitmap(lgfs2_rgrp_t rgd, uint64_t blkno, int state)
 }
 
 /*
- * gfs2_get_bitmap - get value of FS bitmap
+ * lgfs2_get_bitmap - get value of FS bitmap
  * @sdp: super block
  * @blkno: block number relative to file system
  *
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index 432031e1..077677a4 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -121,7 +121,7 @@ static uint64_t find_free_block(struct rgrp_tree *rgd)
 		unsigned long blk = 0;
 		struct gfs2_bitmap *bits = &rgd->bits[bm];
 
-		blk = gfs2_bitfit((uint8_t *)bits->bi_data + bits->bi_offset,
+		blk = lgfs2_bitfit((uint8_t *)bits->bi_data + bits->bi_offset,
 		                  bits->bi_len, blk, GFS2_BLKST_FREE);
 		if (blk != BFITNOENT) {
 			blkno = blk + (bits->bi_start * GFS2_NBBY) + rgd->rt_data0;
@@ -136,7 +136,7 @@ static int blk_alloc_in_rg(struct gfs2_sbd *sdp, unsigned state, struct rgrp_tre
 	if (blkno == 0)
 		return -1;
 
-	if (gfs2_set_bitmap(rgd, blkno, state))
+	if (lgfs2_set_bitmap(rgd, blkno, state))
 		return -1;
 
 	if (state == GFS2_BLKST_DINODE) {
@@ -1902,7 +1902,7 @@ void lgfs2_free_block(struct gfs2_sbd *sdp, uint64_t block)
 	/* Adjust the free space count for the freed block */
 	rgd = gfs2_blk2rgrpd(sdp, block); /* find the rg for indir block */
 	if (rgd) {
-		gfs2_set_bitmap(rgd, block, GFS2_BLKST_FREE);
+		lgfs2_set_bitmap(rgd, block, GFS2_BLKST_FREE);
 		rgd->rt_free++; /* adjust the free count */
 		if (sdp->gfs1)
 			lgfs2_gfs_rgrp_out(rgd, rgd->bits[0].bi_data);
@@ -1968,7 +1968,7 @@ int lgfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
 		}
 	}
 	rgd = gfs2_blk2rgrpd(sdp, diblock);
-	gfs2_set_bitmap(rgd, diblock, GFS2_BLKST_FREE);
+	lgfs2_set_bitmap(rgd, diblock, GFS2_BLKST_FREE);
 	lgfs2_inode_put(&ip);
 	/* lgfs2_inode_put deallocated the extra block used by the disk inode, */
 	/* so adjust it in the superblock struct */
diff --git a/gfs2/libgfs2/lang.c b/gfs2/libgfs2/lang.c
index 6b5d4449..57849e60 100644
--- a/gfs2/libgfs2/lang.c
+++ b/gfs2/libgfs2/lang.c
@@ -266,7 +266,7 @@ static uint64_t ast_lookup_block_num(struct ast_node *ast, struct gfs2_sbd *sbd)
 		bn = ast_lookup_block_num(ast->ast_left, sbd) + ast->ast_num;
 		break;
 	case AST_EX_ADDRESS:
-		if (gfs2_check_range(sbd, ast->ast_num))
+		if (lgfs2_check_range(sbd, ast->ast_num))
 			break;
 		bn = ast->ast_num;
 		break;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index d4f232ce..c6f0fb9e 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -479,19 +479,16 @@ extern void fix_device_geometry(struct gfs2_sbd *sdp);
 #define BFITNOENT (0xFFFFFFFF)
 
 /* functions with blk #'s that are buffer relative */
-extern unsigned long gfs2_bitfit(const unsigned char *buffer,
+extern unsigned long lgfs2_bitfit(const unsigned char *buffer,
 				 const unsigned int buflen,
 				 unsigned long goal, unsigned char old_state);
 
 /* functions with blk #'s that are rgrp relative */
-extern uint32_t gfs2_blkalloc_internal(struct rgrp_tree *rgd, uint32_t goal,
-				       unsigned char old_state,
-				       unsigned char new_state, int do_it);
-extern int gfs2_check_range(struct gfs2_sbd *sdp, uint64_t blkno);
+extern int lgfs2_check_range(struct gfs2_sbd *sdp, uint64_t blkno);
 
 /* functions with blk #'s that are file system relative */
 extern int lgfs2_get_bitmap(struct gfs2_sbd *sdp, uint64_t blkno, struct rgrp_tree *rgd);
-extern int gfs2_set_bitmap(lgfs2_rgrp_t rg, uint64_t blkno, int state);
+extern int lgfs2_set_bitmap(lgfs2_rgrp_t rg, uint64_t blkno, int state);
 
 extern uint32_t rgblocks2bitblocks(const unsigned int bsize, const uint32_t rgblocks,
                                     uint32_t *ri_data) __attribute__((nonnull(3)));
diff --git a/gfs2/libgfs2/rgrp.c b/gfs2/libgfs2/rgrp.c
index 4a522546..39b8b69b 100644
--- a/gfs2/libgfs2/rgrp.c
+++ b/gfs2/libgfs2/rgrp.c
@@ -193,7 +193,7 @@ uint64_t gfs2_rgrp_read(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
 	off_t offset = rgd->rt_addr * sdp->sd_bsize;
 	char *buf;
 
-	if (length == 0 || gfs2_check_range(sdp, rgd->rt_addr))
+	if (length == 0 || lgfs2_check_range(sdp, rgd->rt_addr))
 		return -1;
 
 	buf = calloc(1, length);
@@ -951,7 +951,7 @@ int lgfs2_rbm_find(struct lgfs2_rbm *rbm, uint8_t state, uint32_t *minext)
 		if ((rbm->rgd->rt_free < *minext) && (state == GFS2_BLKST_FREE))
 			goto next_bitmap;
 
-		offset = gfs2_bitfit(buf, bi->bi_len, rbm->offset, state);
+		offset = lgfs2_bitfit(buf, bi->bi_len, rbm->offset, state);
 		if (offset == BFITNOENT)
 			goto next_bitmap;
 
@@ -1009,13 +1009,13 @@ unsigned lgfs2_alloc_extent(const struct lgfs2_rbm *rbm, int state, const unsign
 	const uint64_t block = lgfs2_rbm_to_block(rbm);
 	unsigned len;
 
-	gfs2_set_bitmap(rbm->rgd, block, state);
+	lgfs2_set_bitmap(rbm->rgd, block, state);
 
 	for (len = 1; len < elen; len++) {
 		int ret = lgfs2_rbm_from_block(&pos, block + len);
 		if (ret || lgfs2_testbit(&pos) != GFS2_BLKST_FREE)
 			break;
-		gfs2_set_bitmap(pos.rgd, block + len, GFS2_BLKST_USED);
+		lgfs2_set_bitmap(pos.rgd, block + len, GFS2_BLKST_USED);
 	}
 	return len;
 }
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index ff4c5522..fc0a59cc 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -504,7 +504,7 @@ unsigned lgfs2_bm_scan(struct rgrp_tree *rgd, unsigned idx, uint64_t *buf, uint8
 	uint32_t blk = 0;
 
 	while(blk < (bi->bi_len * GFS2_NBBY)) {
-		blk = gfs2_bitfit((uint8_t *)bi->bi_data + bi->bi_offset,
+		blk = lgfs2_bitfit((uint8_t *)bi->bi_data + bi->bi_offset,
 				  bi->bi_len, blk, state);
 		if (blk == BFITNOENT)
 			break;
diff --git a/gfs2/libgfs2/super.c b/gfs2/libgfs2/super.c
index b32c89c9..15f89a30 100644
--- a/gfs2/libgfs2/super.c
+++ b/gfs2/libgfs2/super.c
@@ -222,7 +222,7 @@ int rindex_read(struct gfs2_sbd *sdp, uint64_t *rgcount, int *ok)
 			return -1;
 
 		addr = be64_to_cpu(ri.ri_addr);
-		if (gfs2_check_range(sdp, addr) != 0) {
+		if (lgfs2_check_range(sdp, addr) != 0) {
 			*ok = 0;
 			if (prev_rgd == NULL)
 				continue;
-- 
2.34.1

