Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6599B28DE2E
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 11:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602669545;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=doqv5kkzHbUTIAHhj4bqLkVRZod4glohBB3eeA/hUfw=;
	b=VUxs/RhU95SrligWkYvw948Tce0M2bHuv/yqwyrGbMjTj/BBCx6BetEYv+0KkcmY24cu2K
	t5X7t3ECwJ51hjMqnuIMGEY3aexmspZAH0Xmlp3MUi+QiDoTvuJ8+7TAtG5r97A/ohmGN7
	UwMCvAR/yxWGEU4bpPbuECguo1A8pjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-hUtWolDlPzuBRf1zSkTs4g-1; Wed, 14 Oct 2020 05:59:03 -0400
X-MC-Unique: hUtWolDlPzuBRf1zSkTs4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F9351007467;
	Wed, 14 Oct 2020 09:59:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F40CD5D9CD;
	Wed, 14 Oct 2020 09:59:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E130658132;
	Wed, 14 Oct 2020 09:59:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09E9wxuE001484 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 05:58:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A925C7666B; Wed, 14 Oct 2020 09:58:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E336150B44;
	Wed, 14 Oct 2020 09:58:55 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Oct 2020 11:58:28 +0200
Message-Id: <20201014095833.1035870-13-agruenba@redhat.com>
In-Reply-To: <20201014095833.1035870-1-agruenba@redhat.com>
References: <20201014095833.1035870-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC 12/17] gfs2: Add per-reservation reserved
	block accounting
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Add a rs_reserved field to struct gfs2_blkreserv to keep track of the
number of blocks reserved by this particular reservation.  When making a
reservation with gfs2_inplace_reserve, this field is set to somewhere
between ap->min_target and ap->target depending on the number of free
blocks in the resource group.  When allocating blocks with
gfs2_alloc_blocks, rs_reserved is decremented accordingly.  Eventually,
any reserved but not consumed blocks are returned to the resource group
by gfs2_inplace_release.

The reservation tree (rd_rstree) is unaffected by this change: the
reservations it tracks are still advisory, and the sizes of those
reservations (rs_free) are still determined by the tentative allocation
sizes (i_sizehint).  Since rd_reserved now tracks the number of reserved
blocks rather than the number of tentatively reserved blocks, we may end
up with slightly different allocation patterns, though. The
rd_extfail_pt optimization will still cause ill-suited resource groups
to be skipped quickly.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c       |   4 +-
 fs/gfs2/incore.h     |   1 +
 fs/gfs2/lops.c       |   1 +
 fs/gfs2/rgrp.c       | 110 ++++++++++++++++++++++---------------------
 fs/gfs2/trace_gfs2.h |   8 +++-
 5 files changed, 66 insertions(+), 58 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index b39b339feddc..7246aaf86862 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1115,8 +1115,8 @@ static long __gfs2_fallocate(struct file *file, int mode, loff_t offset, loff_t
 			goto out_qunlock;
 
 		/* check if the selected rgrp limits our max_blks further */
-		if (ap.allowed && ap.allowed < max_blks)
-			max_blks = ap.allowed;
+		if (ip->i_res.rs_reserved < max_blks)
+			max_blks = ip->i_res.rs_reserved;
 
 		/* Almost done. Calculate bytes that can be written using
 		 * max_blks. We also recompute max_bytes, data_blocks and
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index fb487e90eac7..6f0790d3f71d 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -287,6 +287,7 @@ struct gfs2_blkreserv {
 	struct gfs2_rgrpd *rs_rgd;
 	u64 rs_start;		      /* start of reservation */
 	u32 rs_free;                  /* how many blocks are still free */
+	u32 rs_reserved;              /* number of reserved blocks */
 };
 
 /*
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index ed1da4323967..f621a021e21b 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -83,6 +83,7 @@ static void maybe_release_space(struct gfs2_bufdata *bd)
 	       bd->bd_bh->b_data + bi->bi_offset, bi->bi_bytes);
 	clear_bit(GBF_FULL, &bi->bi_flags);
 	rgd->rd_free_clone = rgd->rd_free;
+	BUG_ON(rgd->rd_free_clone < rgd->rd_reserved);
 	rgd->rd_extfail_pt = rgd->rd_free;
 }
 
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index c4a19798d3aa..2f6eca015fab 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -646,10 +646,6 @@ static void __rs_deltree(struct gfs2_blkreserv *rs)
 	RB_CLEAR_NODE(&rs->rs_node);
 
 	if (rs->rs_free) {
-		/* return reserved blocks to the rgrp */
-		BUG_ON(rs->rs_rgd->rd_reserved < rs->rs_free);
-		rs->rs_rgd->rd_reserved -= rs->rs_free;
-
 		/* The rgrp extent failure point is likely not to increase;
 		   it will only do so if the freed blocks are somehow
 		   contiguous with a span of free blocks that follows. Still,
@@ -1229,6 +1225,7 @@ static int gfs2_rgrp_bh_get(struct gfs2_rgrpd *rgd)
 		rgrp_set_bitmap_flags(rgd);
 		rgd->rd_flags |= (GFS2_RDF_UPTODATE | GFS2_RDF_CHECK);
 		rgd->rd_free_clone = rgd->rd_free;
+		BUG_ON(rgd->rd_reserved);
 		/* max out the rgrp allocation failure point */
 		rgd->rd_extfail_pt = rgd->rd_free;
 	}
@@ -1278,6 +1275,7 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
 	rgd->rd_free = be32_to_cpu(rgd->rd_rgl->rl_free);
 	rgrp_set_bitmap_flags(rgd);
 	rgd->rd_free_clone = rgd->rd_free;
+	BUG_ON(rgd->rd_reserved);
 	/* max out the rgrp allocation failure point */
 	rgd->rd_extfail_pt = rgd->rd_free;
 	rgd->rd_dinodes = be32_to_cpu(rgd->rd_rgl->rl_dinodes);
@@ -1515,41 +1513,10 @@ static void rs_insert(struct gfs2_inode *ip)
 
 	rb_link_node(&rs->rs_node, parent, newn);
 	rb_insert_color(&rs->rs_node, &rgd->rd_rstree);
-
-	/* Do our rgrp accounting for the reservation */
-	rgd->rd_reserved += rs->rs_free; /* blocks reserved */
 	spin_unlock(&rgd->rd_rsspin);
 	trace_gfs2_rs(rs, TRACE_RS_INSERT);
 }
 
-/**
- * rgd_free - return the number of free blocks we can allocate.
- * @rgd: the resource group
- *
- * This function returns the number of free blocks for an rgrp.
- * That's the clone-free blocks (blocks that are free, not including those
- * still being used for unlinked files that haven't been deleted.)
- *
- * It also subtracts any blocks reserved by someone else, but does not
- * include free blocks that are still part of our current reservation,
- * because obviously we can (and will) allocate them.
- */
-static inline u32 rgd_free(struct gfs2_rgrpd *rgd, struct gfs2_blkreserv *rs)
-{
-	u32 tot_reserved, tot_free;
-
-	if (WARN_ON_ONCE(rgd->rd_reserved < rs->rs_free))
-		return 0;
-	tot_reserved = rgd->rd_reserved - rs->rs_free;
-
-	if (rgd->rd_free_clone < tot_reserved)
-		tot_reserved = 0;
-
-	tot_free = rgd->rd_free_clone - tot_reserved;
-
-	return tot_free;
-}
-
 /**
  * rg_mblk_search - find a group of multiple free blocks to form a reservation
  * @rgd: the resource group descriptor
@@ -1565,7 +1532,7 @@ static void rg_mblk_search(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip,
 	u64 goal;
 	struct gfs2_blkreserv *rs = &ip->i_res;
 	u32 extlen;
-	u32 free_blocks = rgd_free(rgd, rs);
+	u32 blocks_available;
 	int ret;
 	struct inode *inode = &ip->i_inode;
 
@@ -1575,8 +1542,16 @@ static void rg_mblk_search(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip,
 		extlen = max_t(u32, atomic_read(&ip->i_sizehint), ap->target);
 		extlen = max_t(u32, extlen, RGRP_RSRV_MINBLKS);
 	}
-	if ((rgd->rd_free_clone < rgd->rd_reserved) || (free_blocks < extlen))
+
+	spin_lock(&rgd->rd_rsspin);
+	blocks_available = rgd->rd_free_clone - rgd->rd_reserved;
+	if (rgd == rs->rs_rgd)
+		blocks_available += rs->rs_reserved;
+	if (blocks_available < extlen) {
+		spin_unlock(&rgd->rd_rsspin);
 		return;
+	}
+	spin_unlock(&rgd->rd_rsspin);
 
 	/* Find bitmap block that contains bits for goal block */
 	if (rgrp_contains_block(rgd, ip->i_goal))
@@ -2024,8 +1999,7 @@ static inline int fast_to_acquire(struct gfs2_rgrpd *rgd)
  * We try our best to find an rgrp that has at least ap->target blocks
  * available. After a couple of passes (loops == 2), the prospects of finding
  * such an rgrp diminish. At this stage, we return the first rgrp that has
- * at least ap->min_target blocks available. Either way, we set ap->allowed to
- * the number of blocks available in the chosen rgrp.
+ * at least ap->min_target blocks available.
  *
  * Returns: 0 on success,
  *          -ENOMEM if a suitable rgrp can't be found
@@ -2041,7 +2015,9 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 	u64 last_unlinked = NO_BLOCK;
 	u32 target = ap->target;
 	int loops = 0;
-	u32 free_blocks, skip = 0;
+	u32 blocks_available, skip = 0;
+
+	BUG_ON(rs->rs_reserved);
 
 	if (sdp->sd_args.ar_rgrplvb)
 		flags |= GL_SKIP;
@@ -2062,6 +2038,8 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 		return -EBADSLT;
 
 	while (loops < 3) {
+		struct gfs2_rgrpd *rgd;
+
 		rg_locked = 1;
 
 		if (!gfs2_glock_is_locked_by_me(rs->rs_rgd->rd_gl)) {
@@ -2112,11 +2090,19 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 			goto check_rgrp;
 
 		/* If rgrp has enough free space, use it */
-		free_blocks = rgd_free(rs->rs_rgd, rs);
-		if (free_blocks >= target) {
-			ap->allowed = free_blocks;
-			return 0;
+		rgd = rs->rs_rgd;
+		spin_lock(&rgd->rd_rsspin);
+		blocks_available = rgd->rd_free_clone - rgd->rd_reserved;
+		if (blocks_available < target) {
+			spin_unlock(&rgd->rd_rsspin);
+			goto check_rgrp;
 		}
+		rs->rs_reserved = ap->target;
+		if (rs->rs_reserved > blocks_available)
+			rs->rs_reserved = blocks_available;
+		rgd->rd_reserved += rs->rs_reserved;
+		spin_unlock(&rgd->rd_rsspin);
+		return 0;
 check_rgrp:
 		/* Check for unlinked inodes which can be reclaimed */
 		if (rs->rs_rgd->rd_flags & GFS2_RDF_CHECK)
@@ -2169,6 +2155,17 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 
 void gfs2_inplace_release(struct gfs2_inode *ip)
 {
+	struct gfs2_blkreserv *rs = &ip->i_res;
+
+	if (rs->rs_reserved) {
+		struct gfs2_rgrpd *rgd = rs->rs_rgd;
+
+		spin_lock(&rgd->rd_rsspin);
+		BUG_ON(rgd->rd_reserved < rs->rs_reserved);
+		rgd->rd_reserved -= rs->rs_reserved;
+		spin_unlock(&rgd->rd_rsspin);
+		rs->rs_reserved = 0;
+	}
 	if (gfs2_holder_initialized(&ip->i_rgd_gh))
 		gfs2_glock_dq_uninit(&ip->i_rgd_gh);
 }
@@ -2310,7 +2307,8 @@ static void gfs2_adjust_reservation(struct gfs2_inode *ip,
 	struct gfs2_blkreserv *rs = &ip->i_res;
 	struct gfs2_rgrpd *rgd = rbm->rgd;
 
-	spin_lock(&rgd->rd_rsspin);
+	BUG_ON(rs->rs_reserved < len);
+	rs->rs_reserved -= len;
 	if (gfs2_rs_active(rs)) {
 		u64 start = gfs2_rbm_to_block(rbm);
 
@@ -2320,19 +2318,16 @@ static void gfs2_adjust_reservation(struct gfs2_inode *ip,
 			rs->rs_start += len;
 			rlen = min(rs->rs_free, len);
 			rs->rs_free -= rlen;
-			rgd->rd_reserved -= rlen;
 			trace_gfs2_rs(rs, TRACE_RS_CLAIM);
 			if (rs->rs_start < rgd->rd_data0 + rgd->rd_data &&
 			    rs->rs_free)
-				goto out;
+				return;
 			/* We used up our block reservation, so we should
 			   reserve more blocks next time. */
 			atomic_add(RGRP_RSRV_ADDBLKS, &ip->i_sizehint);
 		}
 		__rs_deltree(rs);
 	}
-out:
-	spin_unlock(&rgd->rd_rsspin);
 }
 
 /**
@@ -2386,6 +2381,8 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 	u32 minext = 1;
 	int error = -ENOSPC;
 
+	BUG_ON(ip->i_res.rs_reserved < *nblocks);
+
 	if (gfs2_rs_active(&ip->i_res)) {
 		gfs2_set_alloc_start(&rbm, ip, dinode);
 		error = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &minext, &ip->i_res, false);
@@ -2407,8 +2404,6 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 	gfs2_alloc_extent(&rbm, dinode, nblocks);
 	block = gfs2_rbm_to_block(&rbm);
 	rbm.rgd->rd_last_alloc = block - rbm.rgd->rd_data0;
-	if (gfs2_rs_active(&ip->i_res))
-		gfs2_adjust_reservation(ip, &rbm, *nblocks);
 	if (!dinode) {
 		ip->i_goal = block + *nblocks - 1;
 		error = gfs2_meta_inode_buffer(ip, &dibh);
@@ -2421,12 +2416,20 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 			brelse(dibh);
 		}
 	}
-	if (rbm.rgd->rd_free < *nblocks) {
+	spin_lock(&rbm.rgd->rd_rsspin);
+	gfs2_adjust_reservation(ip, &rbm, *nblocks);
+	if (rbm.rgd->rd_reserved < *nblocks) {
 		fs_warn(sdp, "nblocks=%u\n", *nblocks);
+		spin_unlock(&rbm.rgd->rd_rsspin);
 		goto rgrp_error;
 	}
-
+	BUG_ON(rbm.rgd->rd_reserved < *nblocks);
+	BUG_ON(rbm.rgd->rd_free_clone < *nblocks);
+	BUG_ON(rbm.rgd->rd_free < *nblocks);
+	rbm.rgd->rd_reserved -= *nblocks;
+	rbm.rgd->rd_free_clone -= *nblocks;
 	rbm.rgd->rd_free -= *nblocks;
+	spin_unlock(&rbm.rgd->rd_rsspin);
 	if (dinode) {
 		rbm.rgd->rd_dinodes++;
 		*generation = rbm.rgd->rd_igeneration++;
@@ -2443,7 +2446,6 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 
 	gfs2_quota_change(ip, *nblocks, ip->i_inode.i_uid, ip->i_inode.i_gid);
 
-	rbm.rgd->rd_free_clone -= *nblocks;
 	trace_gfs2_block_alloc(ip, rbm.rgd, block, *nblocks,
 			       dinode ? GFS2_BLKST_DINODE : GFS2_BLKST_USED);
 	*bn = block;
diff --git a/fs/gfs2/trace_gfs2.h b/fs/gfs2/trace_gfs2.h
index 7586c7629497..282fcb1a242f 100644
--- a/fs/gfs2/trace_gfs2.h
+++ b/fs/gfs2/trace_gfs2.h
@@ -598,6 +598,7 @@ TRACE_EVENT(gfs2_rs,
 		__field(	u64,	inum			)
 		__field(	u64,	start			)
 		__field(	u32,	free			)
+		__field(	u32,	reserved		)
 		__field(	u8,	func			)
 	),
 
@@ -610,17 +611,20 @@ TRACE_EVENT(gfs2_rs,
 						       i_res)->i_no_addr;
 		__entry->start		= rs->rs_start;
 		__entry->free		= rs->rs_free;
+		__entry->reserved	= rs->rs_reserved;
 		__entry->func		= func;
 	),
 
-	TP_printk("%u,%u bmap %llu resrv %llu rg:%llu rf:%lu rr:%lu %s f:%lu",
+	TP_printk("%u,%u bmap %llu resrv %llu rg:%llu rf:%lu rr:%lu %s f:%lu r:%lu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
 		  (unsigned long long)__entry->inum,
 		  (unsigned long long)__entry->start,
 		  (unsigned long long)__entry->rd_addr,
 		  (unsigned long)__entry->rd_free_clone,
 		  (unsigned long)__entry->rd_reserved,
-		  rs_func_name(__entry->func), (unsigned long)__entry->free)
+		  rs_func_name(__entry->func),
+		  (unsigned long)__entry->free,
+		  (unsigned long)__entry->reserved)
 );
 
 #endif /* _TRACE_GFS2_H */
-- 
2.26.2

