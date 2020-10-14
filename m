Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8D06F28DE21
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 11:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602669535;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H+6u7Xf8S9FMce+rw7gH1zJCLwANytGI4Olc1GTFmEI=;
	b=WYFl/tdL1LtRxdnd9mj5adwznpv16wdf+SsmZwGolEy9o8nkFV2VfEQSdLn61ilZvk78Ap
	K3DbxMOCe8mIvjwD7uoWJ37GB/a0YannSjyVsZ61wktwHY9UVGm5C5PQgP2Xk7NAFldGkR
	4W8Sx6z0hooZB3ftJQpCTxUjvlKjLVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-Qw8Z_2XxNg-it7DlD1p2Ag-1; Wed, 14 Oct 2020 05:58:53 -0400
X-MC-Unique: Qw8Z_2XxNg-it7DlD1p2Ag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28D7D186DD2B;
	Wed, 14 Oct 2020 09:58:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1767255790;
	Wed, 14 Oct 2020 09:58:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F100158136;
	Wed, 14 Oct 2020 09:58:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09E9wgeO001351 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 05:58:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 176E876669; Wed, 14 Oct 2020 09:58:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51D0F7666D;
	Wed, 14 Oct 2020 09:58:41 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Oct 2020 11:58:18 +0200
Message-Id: <20201014095833.1035870-3-agruenba@redhat.com>
In-Reply-To: <20201014095833.1035870-1-agruenba@redhat.com>
References: <20201014095833.1035870-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC 02/17] gfs2: Only use struct gfs2_rbm for
	bitmap manipulations
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

GFS2 uses struct gfs2_rbm to represent a filesystem block number as a
bit position within a resource group.  This representation is used in
the bitmap manipulation code to prevent excessive conversions between
block numbers and bit positions, but also in struct gfs2_blkreserv which
is part of struct gfs2_inode, to mark the start of a reservation.  In
the inode, the bit position representation makes less sense: first, the
start position is used as a block number about as often as a bit
position; second, the bit position representation makes the code
unnecessarily complicated and difficult to read.

Therefore, change struct gfs2_blkreserv to represent the start of a
reservation as a block number instead of a bit position.  (This requires
keeping track of the resource group in gfs2_blkreserv separately.) With
that change, various things can be slightly simplified, and struct
gfs2_rbm can be moved to rgrp.c.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c       |   2 +-
 fs/gfs2/incore.h     |  30 +--------
 fs/gfs2/rgrp.c       | 154 +++++++++++++++++++++++++------------------
 fs/gfs2/trace_gfs2.h |  10 +--
 fs/gfs2/trans.h      |   2 +-
 5 files changed, 101 insertions(+), 97 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 0f69fbd4af66..ff64fa85d3ac 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1547,7 +1547,7 @@ static int sweep_bh_for_rgrps(struct gfs2_inode *ip, struct gfs2_holder *rd_gh,
 
 			/* Must be done with the rgrp glock held: */
 			if (gfs2_rs_active(&ip->i_res) &&
-			    rgd == ip->i_res.rs_rbm.rgd)
+			    rgd == ip->i_res.rs_rgd)
 				gfs2_rs_deltree(&ip->i_res);
 		}
 
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index ca2ec02436ec..fb487e90eac7 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -121,31 +121,6 @@ struct gfs2_rgrpd {
 	struct rb_root rd_rstree;       /* multi-block reservation tree */
 };
 
-struct gfs2_rbm {
-	struct gfs2_rgrpd *rgd;
-	u32 offset;		/* The offset is bitmap relative */
-	int bii;		/* Bitmap index */
-};
-
-static inline struct gfs2_bitmap *rbm_bi(const struct gfs2_rbm *rbm)
-{
-	return rbm->rgd->rd_bits + rbm->bii;
-}
-
-static inline u64 gfs2_rbm_to_block(const struct gfs2_rbm *rbm)
-{
-	BUG_ON(rbm->offset >= rbm->rgd->rd_data);
-	return rbm->rgd->rd_data0 + (rbm_bi(rbm)->bi_start * GFS2_NBBY) +
-		rbm->offset;
-}
-
-static inline bool gfs2_rbm_eq(const struct gfs2_rbm *rbm1,
-			       const struct gfs2_rbm *rbm2)
-{
-	return (rbm1->rgd == rbm2->rgd) && (rbm1->bii == rbm2->bii) &&
-	       (rbm1->offset == rbm2->offset);
-}
-
 enum gfs2_state_bits {
 	BH_Pinned = BH_PrivateStart,
 	BH_Escaped = BH_PrivateStart + 1,
@@ -308,8 +283,9 @@ struct gfs2_qadata { /* quota allocation data */
 */
 
 struct gfs2_blkreserv {
-	struct rb_node rs_node;       /* link to other block reservations */
-	struct gfs2_rbm rs_rbm;       /* Start of reservation */
+	struct rb_node rs_node;       /* node within rd_rstree */
+	struct gfs2_rgrpd *rs_rgd;
+	u64 rs_start;		      /* start of reservation */
 	u32 rs_free;                  /* how many blocks are still free */
 };
 
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 073a9c9cb782..f044430f5c52 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -36,6 +36,24 @@
 #define BFITNOENT ((u32)~0)
 #define NO_BLOCK ((u64)~0)
 
+struct gfs2_rbm {
+	struct gfs2_rgrpd *rgd;
+	u32 offset;		/* The offset is bitmap relative */
+	int bii;		/* Bitmap index */
+};
+
+static inline struct gfs2_bitmap *rbm_bi(const struct gfs2_rbm *rbm)
+{
+	return rbm->rgd->rd_bits + rbm->bii;
+}
+
+static inline u64 gfs2_rbm_to_block(const struct gfs2_rbm *rbm)
+{
+	BUG_ON(rbm->offset >= rbm->rgd->rd_data);
+	return rbm->rgd->rd_data0 + (rbm_bi(rbm)->bi_start * GFS2_NBBY) +
+		rbm->offset;
+}
+
 /*
  * These routines are used by the resource group routines (rgrp.c)
  * to keep track of block allocation.  Each block is represented by two
@@ -175,7 +193,7 @@ static inline u64 gfs2_bit_search(const __le64 *ptr, u64 mask, u8 state)
 
 /**
  * rs_cmp - multi-block reservation range compare
- * @blk: absolute file system block number of the new reservation
+ * @start: start of the new reservation
  * @len: number of blocks in the new reservation
  * @rs: existing reservation to compare against
  *
@@ -183,13 +201,11 @@ static inline u64 gfs2_bit_search(const __le64 *ptr, u64 mask, u8 state)
  *         -1 if the block range is before the start of the reservation
  *          0 if the block range overlaps with the reservation
  */
-static inline int rs_cmp(u64 blk, u32 len, struct gfs2_blkreserv *rs)
+static inline int rs_cmp(u64 start, u32 len, struct gfs2_blkreserv *rs)
 {
-	u64 startblk = gfs2_rbm_to_block(&rs->rs_rbm);
-
-	if (blk >= startblk + rs->rs_free)
+	if (start >= rs->rs_start + rs->rs_free)
 		return 1;
-	if (blk + len - 1 < startblk)
+	if (rs->rs_start >= start + len)
 		return -1;
 	return 0;
 }
@@ -311,13 +327,28 @@ static bool gfs2_rbm_add(struct gfs2_rbm *rbm, u32 blocks)
 	}
 }
 
+static struct gfs2_bitmap *gfs2_block_to_bitmap(struct gfs2_rgrpd *rgd,
+						u64 block)
+{
+	unsigned int delta = (sizeof(struct gfs2_rgrp) -
+			      sizeof(struct gfs2_meta_header)) * GFS2_NBBY;
+	unsigned int rblock, bii;
+
+	if (!rgrp_contains_block(rgd, block))
+		return NULL;
+	rblock = block - rgd->rd_data0;
+	bii = (rblock + delta) / rgd->rd_sbd->sd_blocks_per_bitmap;
+	return rgd->rd_bits + bii;
+}
+
 /**
  * gfs2_unaligned_extlen - Look for free blocks which are not byte aligned
  * @rbm: Position to search (value/result)
  * @n_unaligned: Number of unaligned blocks to check
  * @len: Decremented for each block found (terminate on zero)
  *
- * Returns: true if a non-free block is encountered
+ * Returns: true if a non-free block is encountered or the end of the resource
+ *	    group is reached.
  */
 
 static bool gfs2_unaligned_extlen(struct gfs2_rbm *rbm, u32 n_unaligned, u32 *len)
@@ -604,10 +635,11 @@ static void dump_rs(struct seq_file *seq, const struct gfs2_blkreserv *rs,
 {
 	struct gfs2_inode *ip = container_of(rs, struct gfs2_inode, i_res);
 
-	gfs2_print_dbg(seq, "%s  B: n:%llu s:%llu b:%u f:%u\n", fs_id_buf,
+	gfs2_print_dbg(seq, "%s  B: n:%llu s:%llu f:%u\n",
+		       fs_id_buf,
 		       (unsigned long long)ip->i_no_addr,
-		       (unsigned long long)gfs2_rbm_to_block(&rs->rs_rbm),
-		       rs->rs_rbm.offset, rs->rs_free);
+		       (unsigned long long)rs->rs_start,
+		       rs->rs_free);
 }
 
 /**
@@ -622,30 +654,28 @@ static void __rs_deltree(struct gfs2_blkreserv *rs)
 	if (!gfs2_rs_active(rs))
 		return;
 
-	rgd = rs->rs_rbm.rgd;
+	rgd = rs->rs_rgd;
 	trace_gfs2_rs(rs, TRACE_RS_TREEDEL);
 	rb_erase(&rs->rs_node, &rgd->rd_rstree);
 	RB_CLEAR_NODE(&rs->rs_node);
 
 	if (rs->rs_free) {
-		u64 last_block = gfs2_rbm_to_block(&rs->rs_rbm) +
-				 rs->rs_free - 1;
-		struct gfs2_rbm last_rbm = { .rgd = rs->rs_rbm.rgd, };
+		u64 last_block = rs->rs_start + rs->rs_free - 1;
 		struct gfs2_bitmap *start, *last;
 
 		/* return reserved blocks to the rgrp */
-		BUG_ON(rs->rs_rbm.rgd->rd_reserved < rs->rs_free);
-		rs->rs_rbm.rgd->rd_reserved -= rs->rs_free;
+		BUG_ON(rs->rs_rgd->rd_reserved < rs->rs_free);
+		rs->rs_rgd->rd_reserved -= rs->rs_free;
 		/* The rgrp extent failure point is likely not to increase;
 		   it will only do so if the freed blocks are somehow
 		   contiguous with a span of free blocks that follows. Still,
 		   it will force the number to be recalculated later. */
 		rgd->rd_extfail_pt += rs->rs_free;
 		rs->rs_free = 0;
-		if (gfs2_rbm_from_block(&last_rbm, last_block))
+		start = gfs2_block_to_bitmap(rgd, rs->rs_start);
+		last = gfs2_block_to_bitmap(rgd, last_block);
+		if (!start || !last)
 			return;
-		start = rbm_bi(&rs->rs_rbm);
-		last = rbm_bi(&last_rbm);
 		do
 			clear_bit(GBF_FULL, &start->bi_flags);
 		while (start++ != last);
@@ -661,7 +691,7 @@ void gfs2_rs_deltree(struct gfs2_blkreserv *rs)
 {
 	struct gfs2_rgrpd *rgd;
 
-	rgd = rs->rs_rbm.rgd;
+	rgd = rs->rs_rgd;
 	if (rgd) {
 		spin_lock(&rgd->rd_rsspin);
 		__rs_deltree(rs);
@@ -1464,8 +1494,7 @@ static void rs_insert(struct gfs2_inode *ip)
 	struct rb_node **newn, *parent = NULL;
 	int rc;
 	struct gfs2_blkreserv *rs = &ip->i_res;
-	struct gfs2_rgrpd *rgd = rs->rs_rbm.rgd;
-	u64 fsblock = gfs2_rbm_to_block(&rs->rs_rbm);
+	struct gfs2_rgrpd *rgd = rs->rs_rgd;
 
 	BUG_ON(gfs2_rs_active(rs));
 
@@ -1476,7 +1505,7 @@ static void rs_insert(struct gfs2_inode *ip)
 			rb_entry(*newn, struct gfs2_blkreserv, rs_node);
 
 		parent = *newn;
-		rc = rs_cmp(fsblock, rs->rs_free, cur);
+		rc = rs_cmp(rs->rs_start, rs->rs_free, cur);
 		if (rc > 0)
 			newn = &((*newn)->rb_right);
 		else if (rc < 0)
@@ -1564,7 +1593,7 @@ static void rg_mblk_search(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip,
 
 	ret = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &extlen, ip, true);
 	if (ret == 0) {
-		rs->rs_rbm = rbm;
+		rs->rs_start = gfs2_rbm_to_block(&rbm);
 		rs->rs_free = extlen;
 		rs_insert(ip);
 	} else {
@@ -1609,7 +1638,7 @@ static u64 gfs2_next_unreserved_block(struct gfs2_rgrpd *rgd, u64 block,
 
 	if (n) {
 		while ((rs_cmp(block, length, rs) == 0) && (&ip->i_res != rs)) {
-			block = gfs2_rbm_to_block(&rs->rs_rbm) + rs->rs_free;
+			block = rs->rs_start + rs->rs_free;
 			n = n->rb_right;
 			if (n == NULL)
 				break;
@@ -1946,7 +1975,7 @@ static bool gfs2_rgrp_used_recently(const struct gfs2_blkreserv *rs,
 	u64 tdiff;
 
 	tdiff = ktime_to_ns(ktime_sub(ktime_get_real(),
-                            rs->rs_rbm.rgd->rd_gl->gl_dstamp));
+                            rs->rs_rgd->rd_gl->gl_dstamp));
 
 	return tdiff > (msecs * 1000 * 1000);
 }
@@ -2024,45 +2053,45 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 	if (gfs2_assert_warn(sdp, ap->target))
 		return -EINVAL;
 	if (gfs2_rs_active(rs)) {
-		begin = rs->rs_rbm.rgd;
-	} else if (rs->rs_rbm.rgd &&
-		   rgrp_contains_block(rs->rs_rbm.rgd, ip->i_goal)) {
-		begin = rs->rs_rbm.rgd;
+		begin = rs->rs_rgd;
+	} else if (rs->rs_rgd &&
+		   rgrp_contains_block(rs->rs_rgd, ip->i_goal)) {
+		begin = rs->rs_rgd;
 	} else {
 		check_and_update_goal(ip);
-		rs->rs_rbm.rgd = begin = gfs2_blk2rgrpd(sdp, ip->i_goal, 1);
+		rs->rs_rgd = begin = gfs2_blk2rgrpd(sdp, ip->i_goal, 1);
 	}
 	if (S_ISDIR(ip->i_inode.i_mode) && (ap->aflags & GFS2_AF_ORLOV))
 		skip = gfs2_orlov_skip(ip);
-	if (rs->rs_rbm.rgd == NULL)
+	if (rs->rs_rgd == NULL)
 		return -EBADSLT;
 
 	while (loops < 3) {
 		rg_locked = 1;
 
-		if (!gfs2_glock_is_locked_by_me(rs->rs_rbm.rgd->rd_gl)) {
+		if (!gfs2_glock_is_locked_by_me(rs->rs_rgd->rd_gl)) {
 			rg_locked = 0;
 			if (skip && skip--)
 				goto next_rgrp;
 			if (!gfs2_rs_active(rs)) {
 				if (loops == 0 &&
-				    !fast_to_acquire(rs->rs_rbm.rgd))
+				    !fast_to_acquire(rs->rs_rgd))
 					goto next_rgrp;
 				if ((loops < 2) &&
 				    gfs2_rgrp_used_recently(rs, 1000) &&
-				    gfs2_rgrp_congested(rs->rs_rbm.rgd, loops))
+				    gfs2_rgrp_congested(rs->rs_rgd, loops))
 					goto next_rgrp;
 			}
-			error = gfs2_glock_nq_init(rs->rs_rbm.rgd->rd_gl,
+			error = gfs2_glock_nq_init(rs->rs_rgd->rd_gl,
 						   LM_ST_EXCLUSIVE, flags,
 						   &ip->i_rgd_gh);
 			if (unlikely(error))
 				return error;
 			if (!gfs2_rs_active(rs) && (loops < 2) &&
-			    gfs2_rgrp_congested(rs->rs_rbm.rgd, loops))
+			    gfs2_rgrp_congested(rs->rs_rgd, loops))
 				goto skip_rgrp;
 			if (sdp->sd_args.ar_rgrplvb) {
-				error = update_rgrp_lvb(rs->rs_rbm.rgd);
+				error = update_rgrp_lvb(rs->rs_rgd);
 				if (unlikely(error)) {
 					gfs2_glock_dq_uninit(&ip->i_rgd_gh);
 					return error;
@@ -2071,24 +2100,24 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 		}
 
 		/* Skip unusable resource groups */
-		if ((rs->rs_rbm.rgd->rd_flags & (GFS2_RGF_NOALLOC |
+		if ((rs->rs_rgd->rd_flags & (GFS2_RGF_NOALLOC |
 						 GFS2_RDF_ERROR)) ||
-		    (loops == 0 && ap->target > rs->rs_rbm.rgd->rd_extfail_pt))
+		    (loops == 0 && ap->target > rs->rs_rgd->rd_extfail_pt))
 			goto skip_rgrp;
 
 		if (sdp->sd_args.ar_rgrplvb)
-			gfs2_rgrp_bh_get(rs->rs_rbm.rgd);
+			gfs2_rgrp_bh_get(rs->rs_rgd);
 
 		/* Get a reservation if we don't already have one */
 		if (!gfs2_rs_active(rs))
-			rg_mblk_search(rs->rs_rbm.rgd, ip, ap);
+			rg_mblk_search(rs->rs_rgd, ip, ap);
 
 		/* Skip rgrps when we can't get a reservation on first pass */
 		if (!gfs2_rs_active(rs) && (loops < 1))
 			goto check_rgrp;
 
 		/* If rgrp has enough free space, use it */
-		free_blocks = rgd_free(rs->rs_rbm.rgd, rs);
+		free_blocks = rgd_free(rs->rs_rgd, rs);
 		if (free_blocks >= ap->target ||
 		    (loops == 2 && ap->min_target &&
 		     free_blocks >= ap->min_target)) {
@@ -2097,8 +2126,8 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 		}
 check_rgrp:
 		/* Check for unlinked inodes which can be reclaimed */
-		if (rs->rs_rbm.rgd->rd_flags & GFS2_RDF_CHECK)
-			try_rgrp_unlink(rs->rs_rbm.rgd, &last_unlinked,
+		if (rs->rs_rgd->rd_flags & GFS2_RDF_CHECK)
+			try_rgrp_unlink(rs->rs_rgd, &last_unlinked,
 					ip->i_no_addr);
 skip_rgrp:
 		/* Drop reservation, if we couldn't use reserved rgrp */
@@ -2110,7 +2139,7 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 			gfs2_glock_dq_uninit(&ip->i_rgd_gh);
 next_rgrp:
 		/* Find the next rgrp, and continue looking */
-		if (gfs2_select_rgrp(&rs->rs_rbm.rgd, begin))
+		if (gfs2_select_rgrp(&rs->rs_rgd, begin))
 			continue;
 		if (skip)
 			continue;
@@ -2284,20 +2313,21 @@ static void gfs2_adjust_reservation(struct gfs2_inode *ip,
 {
 	struct gfs2_blkreserv *rs = &ip->i_res;
 	struct gfs2_rgrpd *rgd = rbm->rgd;
-	unsigned rlen;
-	u64 block;
-	int ret;
 
 	spin_lock(&rgd->rd_rsspin);
 	if (gfs2_rs_active(rs)) {
-		if (gfs2_rbm_eq(&rs->rs_rbm, rbm)) {
-			block = gfs2_rbm_to_block(rbm);
-			ret = gfs2_rbm_from_block(&rs->rs_rbm, block + len);
+		u64 start = gfs2_rbm_to_block(rbm);
+
+		if (rs->rs_start == start) {
+			unsigned int rlen;
+
+			rs->rs_start += len;
 			rlen = min(rs->rs_free, len);
 			rs->rs_free -= rlen;
 			rgd->rd_reserved -= rlen;
 			trace_gfs2_rs(rs, TRACE_RS_CLAIM);
-			if (rs->rs_free && !ret)
+			if (rs->rs_start < rgd->rd_data0 + rgd->rd_data &&
+			    rs->rs_free)
 				goto out;
 			/* We used up our block reservation, so we should
 			   reserve more blocks next time. */
@@ -2326,15 +2356,13 @@ static void gfs2_set_alloc_start(struct gfs2_rbm *rbm,
 	u64 goal;
 
 	if (gfs2_rs_active(&ip->i_res)) {
-		*rbm = ip->i_res.rs_rbm;
-		return;
+		goal = ip->i_res.rs_start;
+	} else {
+		if (!dinode && rgrp_contains_block(rbm->rgd, ip->i_goal))
+			goal = ip->i_goal;
+		else
+			goal = rbm->rgd->rd_last_alloc + rbm->rgd->rd_data0;
 	}
-
-	if (!dinode && rgrp_contains_block(rbm->rgd, ip->i_goal))
-		goal = ip->i_goal;
-	else
-		goal = rbm->rgd->rd_last_alloc + rbm->rgd->rd_data0;
-
 	if (WARN_ON_ONCE(gfs2_rbm_from_block(rbm, goal))) {
 		rbm->bii = 0;
 		rbm->offset = 0;
@@ -2357,7 +2385,7 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 {
 	struct gfs2_sbd *sdp = GFS2_SB(&ip->i_inode);
 	struct buffer_head *dibh;
-	struct gfs2_rbm rbm = { .rgd = ip->i_res.rs_rbm.rgd, };
+	struct gfs2_rbm rbm = { .rgd = ip->i_res.rs_rgd, };
 	unsigned int ndata;
 	u64 block; /* block, within the file system scope */
 	int error;
@@ -2589,7 +2617,7 @@ void gfs2_rlist_add(struct gfs2_inode *ip, struct gfs2_rgrp_list *rlist,
 			return;
 		rgd = gfs2_blk2rgrpd(sdp, block, 1);
 	} else {
-		rgd = ip->i_res.rs_rbm.rgd;
+		rgd = ip->i_res.rs_rgd;
 		if (!rgd || !rgrp_contains_block(rgd, block))
 			rgd = gfs2_blk2rgrpd(sdp, block, 1);
 	}
diff --git a/fs/gfs2/trace_gfs2.h b/fs/gfs2/trace_gfs2.h
index e0025258107a..7586c7629497 100644
--- a/fs/gfs2/trace_gfs2.h
+++ b/fs/gfs2/trace_gfs2.h
@@ -602,13 +602,13 @@ TRACE_EVENT(gfs2_rs,
 	),
 
 	TP_fast_assign(
-		__entry->dev		= rs->rs_rbm.rgd->rd_sbd->sd_vfs->s_dev;
-		__entry->rd_addr	= rs->rs_rbm.rgd->rd_addr;
-		__entry->rd_free_clone	= rs->rs_rbm.rgd->rd_free_clone;
-		__entry->rd_reserved	= rs->rs_rbm.rgd->rd_reserved;
+		__entry->dev		= rs->rs_rgd->rd_sbd->sd_vfs->s_dev;
+		__entry->rd_addr	= rs->rs_rgd->rd_addr;
+		__entry->rd_free_clone	= rs->rs_rgd->rd_free_clone;
+		__entry->rd_reserved	= rs->rs_rgd->rd_reserved;
 		__entry->inum		= container_of(rs, struct gfs2_inode,
 						       i_res)->i_no_addr;
-		__entry->start		= gfs2_rbm_to_block(&rs->rs_rbm);
+		__entry->start		= rs->rs_start;
 		__entry->free		= rs->rs_free;
 		__entry->func		= func;
 	),
diff --git a/fs/gfs2/trans.h b/fs/gfs2/trans.h
index 83199ce5a5c5..b812c4958dc4 100644
--- a/fs/gfs2/trans.h
+++ b/fs/gfs2/trans.h
@@ -27,7 +27,7 @@ struct gfs2_glock;
  * block, or all of the blocks in the rg, whichever is smaller */
 static inline unsigned int gfs2_rg_blocks(const struct gfs2_inode *ip, unsigned requested)
 {
-	struct gfs2_rgrpd *rgd = ip->i_res.rs_rbm.rgd;
+	struct gfs2_rgrpd *rgd = ip->i_res.rs_rgd;
 
 	if (requested < rgd->rd_length)
 		return requested + 1;
-- 
2.26.2

