Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 26D752A1095
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Oct 2020 22:53:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604094800;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IdC+C4maJuuc6dvkPxzB6uWSZvgZuicJWlT01Hoh9ek=;
	b=fB74nVTSYxsIRZrT44y4Vydgx1y75herX5HPi+MIYhDAaOJQrW7vJt6ue3PhX1yeNExEp9
	44PhexWXEaU7wyGkHTkv1q29ZcEBCky5tM1eY6LwK8uxgwr72zIVU7fdLxFrRBSCTuS5Jh
	E1d9NzBmmOZSZRRjuZMw2aoY/KfgBvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-5YgPd9F9PCWHhyXgnjnnRg-1; Fri, 30 Oct 2020 17:53:17 -0400
X-MC-Unique: 5YgPd9F9PCWHhyXgnjnnRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 370A6760E5;
	Fri, 30 Oct 2020 21:53:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2405A60DA0;
	Fri, 30 Oct 2020 21:53:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4C1A58133;
	Fri, 30 Oct 2020 21:53:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ULr904024226 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 17:53:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5CED46E719; Fri, 30 Oct 2020 21:53:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82CD4756A8;
	Fri, 30 Oct 2020 21:53:00 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 30 Oct 2020 22:51:49 +0100
Message-Id: <20201030215152.1567790-15-agruenba@redhat.com>
In-Reply-To: <20201030215152.1567790-1-agruenba@redhat.com>
References: <20201030215152.1567790-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 14/17] gfs2: Add per-reservation reserved
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Add a rs_reserved field to struct gfs2_blkreserv to keep track of the number of
blocks reserved by this particular reservation, and a rd_reserved field to
struct gfs2_rgrpd to keep track of the total number of reserved blocks in the
resource group.  Those blocks are exclusively reserved, as opposed to the
rs_requested / rd_requested blocks which are tracked in the reservation tree
(rd_rstree) and which can be stolen if necessary.

When making a reservation with gfs2_inplace_reserve, rs_reserved is set to
somewhere between ap->min_target and ap->target depending on the number of free
blocks in the resource group.  When allocating blocks with gfs2_alloc_blocks,
rs_reserved is decremented accordingly.  Eventually, any reserved but not
consumed blocks are returned to the resource group by gfs2_inplace_release.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c       |  4 +--
 fs/gfs2/incore.h     |  2 ++
 fs/gfs2/lops.c       |  1 +
 fs/gfs2/rgrp.c       | 80 +++++++++++++++++++++++++++++++++-----------
 fs/gfs2/trace_gfs2.h | 23 +++++++++----
 5 files changed, 82 insertions(+), 28 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 177c4d74ca30..294087516ce0 100644
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
index 0141e011102b..22c000285804 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -107,6 +107,7 @@ struct gfs2_rgrpd {
 	u32 rd_bitbytes;		/* number of bytes in data bitmaps */
 	u32 rd_free;
 	u32 rd_requested;		/* number of blocks in rd_rstree */
+	u32 rd_reserved;		/* number of reserved blocks */
 	u32 rd_free_clone;
 	u32 rd_dinodes;
 	u64 rd_igeneration;
@@ -291,6 +292,7 @@ struct gfs2_blkreserv {
 	struct gfs2_rgrpd *rs_rgd;
 	u64 rs_start;
 	u32 rs_requested;
+	u32 rs_reserved;              /* number of reserved blocks */
 };
 
 /*
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index ed69298dd824..a0ef2b4019a9 100644
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
index 68fabde2eb41..e503c00bd180 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1225,6 +1225,7 @@ static int gfs2_rgrp_bh_get(struct gfs2_rgrpd *rgd)
 		rgrp_set_bitmap_flags(rgd);
 		rgd->rd_flags |= (GFS2_RDF_UPTODATE | GFS2_RDF_CHECK);
 		rgd->rd_free_clone = rgd->rd_free;
+		BUG_ON(rgd->rd_reserved);
 		/* max out the rgrp allocation failure point */
 		rgd->rd_extfail_pt = rgd->rd_free;
 	}
@@ -1274,6 +1275,7 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
 	rgd->rd_free = be32_to_cpu(rgd->rd_rgl->rl_free);
 	rgrp_set_bitmap_flags(rgd);
 	rgd->rd_free_clone = rgd->rd_free;
+	BUG_ON(rgd->rd_reserved);
 	/* max out the rgrp allocation failure point */
 	rgd->rd_extfail_pt = rgd->rd_free;
 	rgd->rd_dinodes = be32_to_cpu(rgd->rd_rgl->rl_dinodes);
@@ -1561,7 +1563,7 @@ static void rg_mblk_search(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip,
 	u64 goal;
 	struct gfs2_blkreserv *rs = &ip->i_res;
 	u32 extlen;
-	u32 free_blocks = rgd_free(rgd, rs);
+	u32 free_blocks, blocks_available;
 	int ret;
 	struct inode *inode = &ip->i_inode;
 
@@ -1571,7 +1573,16 @@ static void rg_mblk_search(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip,
 		extlen = max_t(u32, atomic_read(&ip->i_sizehint), ap->target);
 		extlen = max_t(u32, extlen, RGRP_RSRV_MINBLKS);
 	}
-	if ((rgd->rd_free_clone < rgd->rd_requested) || (free_blocks < extlen))
+
+	spin_lock(&rgd->rd_rsspin);
+	free_blocks = rgd_free(rgd, rs);
+	if (rgd->rd_free_clone < rgd->rd_requested)
+		free_blocks = 0;
+	blocks_available = rgd->rd_free_clone - rgd->rd_reserved;
+	if (rgd == rs->rs_rgd)
+		blocks_available += rs->rs_reserved;
+	spin_unlock(&rgd->rd_rsspin);
+	if (free_blocks < extlen || blocks_available < extlen)
 		return;
 
 	/* Find bitmap block that contains bits for goal block */
@@ -2020,8 +2031,7 @@ static inline int fast_to_acquire(struct gfs2_rgrpd *rgd)
  * We try our best to find an rgrp that has at least ap->target blocks
  * available. After a couple of passes (loops == 2), the prospects of finding
  * such an rgrp diminish. At this stage, we return the first rgrp that has
- * at least ap->min_target blocks available. Either way, we set ap->allowed to
- * the number of blocks available in the chosen rgrp.
+ * at least ap->min_target blocks available.
  *
  * Returns: 0 on success,
  *          -ENOMEM if a suitable rgrp can't be found
@@ -2037,7 +2047,9 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 	u64 last_unlinked = NO_BLOCK;
 	u32 target = ap->target;
 	int loops = 0;
-	u32 free_blocks, skip = 0;
+	u32 free_blocks, blocks_available, skip = 0;
+
+	BUG_ON(rs->rs_reserved);
 
 	if (sdp->sd_args.ar_rgrplvb)
 		flags |= GL_SKIP;
@@ -2058,6 +2070,8 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 		return -EBADSLT;
 
 	while (loops < 3) {
+		struct gfs2_rgrpd *rgd;
+
 		rg_locked = 1;
 
 		if (!gfs2_glock_is_locked_by_me(rs->rs_rgd->rd_gl)) {
@@ -2108,11 +2122,20 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 			goto check_rgrp;
 
 		/* If rgrp has enough free space, use it */
-		free_blocks = rgd_free(rs->rs_rgd, rs);
-		if (free_blocks >= target) {
-			ap->allowed = free_blocks;
-			return 0;
+		rgd = rs->rs_rgd;
+		spin_lock(&rgd->rd_rsspin);
+		free_blocks = rgd_free(rgd, rs);
+		blocks_available = rgd->rd_free_clone - rgd->rd_reserved;
+		if (free_blocks < target || blocks_available < target) {
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
@@ -2165,6 +2188,17 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 
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
@@ -2252,11 +2286,11 @@ void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_rgrpd *rgd,
 	struct gfs2_blkreserv *trs;
 	const struct rb_node *n;
 
-	gfs2_print_dbg(seq, "%s R: n:%llu f:%02x b:%u/%u i:%u r:%u e:%u\n",
+	gfs2_print_dbg(seq, "%s R: n:%llu f:%02x b:%u/%u i:%u q:%u r:%u e:%u\n",
 		       fs_id_buf,
 		       (unsigned long long)rgd->rd_addr, rgd->rd_flags,
 		       rgd->rd_free, rgd->rd_free_clone, rgd->rd_dinodes,
-		       rgd->rd_requested, rgd->rd_extfail_pt);
+		       rgd->rd_requested, rgd->rd_reserved, rgd->rd_extfail_pt);
 	if (rgd->rd_sbd->sd_args.ar_rgrplvb) {
 		struct gfs2_rgrp_lvb *rgl = rgd->rd_rgl;
 
@@ -2303,7 +2337,8 @@ static void gfs2_adjust_reservation(struct gfs2_inode *ip,
 	struct gfs2_blkreserv *rs = &ip->i_res;
 	struct gfs2_rgrpd *rgd = rbm->rgd;
 
-	spin_lock(&rgd->rd_rsspin);
+	BUG_ON(rs->rs_reserved < len);
+	rs->rs_reserved -= len;
 	if (gfs2_rs_active(rs)) {
 		u64 start = gfs2_rbm_to_block(rbm);
 
@@ -2317,15 +2352,13 @@ static void gfs2_adjust_reservation(struct gfs2_inode *ip,
 			trace_gfs2_rs(rs, TRACE_RS_CLAIM);
 			if (rs->rs_start < rgd->rd_data0 + rgd->rd_data &&
 			    rs->rs_requested)
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
@@ -2379,6 +2412,8 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 	u32 minext = 1;
 	int error = -ENOSPC;
 
+	BUG_ON(ip->i_res.rs_reserved < *nblocks);
+
 	if (gfs2_rs_active(&ip->i_res)) {
 		gfs2_set_alloc_start(&rbm, ip, dinode);
 		error = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &minext, &ip->i_res, false);
@@ -2400,8 +2435,6 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 	gfs2_alloc_extent(&rbm, dinode, nblocks);
 	block = gfs2_rbm_to_block(&rbm);
 	rbm.rgd->rd_last_alloc = block - rbm.rgd->rd_data0;
-	if (gfs2_rs_active(&ip->i_res))
-		gfs2_adjust_reservation(ip, &rbm, *nblocks);
 	if (!dinode) {
 		ip->i_goal = block + *nblocks - 1;
 		error = gfs2_meta_inode_buffer(ip, &dibh);
@@ -2414,12 +2447,20 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 			brelse(dibh);
 		}
 	}
-	if (rbm.rgd->rd_free < *nblocks) {
+	spin_lock(&rbm.rgd->rd_rsspin);
+	gfs2_adjust_reservation(ip, &rbm, *nblocks);
+	if (rbm.rgd->rd_free < *nblocks || rbm.rgd->rd_reserved < *nblocks) {
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
@@ -2436,7 +2477,6 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 
 	gfs2_quota_change(ip, *nblocks, ip->i_inode.i_uid, ip->i_inode.i_gid);
 
-	rbm.rgd->rd_free_clone -= *nblocks;
 	trace_gfs2_block_alloc(ip, rbm.rgd, block, *nblocks,
 			       dinode ? GFS2_BLKST_DINODE : GFS2_BLKST_USED);
 	*bn = block;
diff --git a/fs/gfs2/trace_gfs2.h b/fs/gfs2/trace_gfs2.h
index d24bdcdd42e5..bd6c8e9e49db 100644
--- a/fs/gfs2/trace_gfs2.h
+++ b/fs/gfs2/trace_gfs2.h
@@ -561,6 +561,7 @@ TRACE_EVENT(gfs2_block_alloc,
 		__field(        u64,	rd_addr			)
 		__field(        u32,	rd_free_clone		)
 		__field(	u32,	rd_requested		)
+		__field(	u32,	rd_reserved		)
 	),
 
 	TP_fast_assign(
@@ -572,16 +573,19 @@ TRACE_EVENT(gfs2_block_alloc,
 		__entry->rd_addr	= rgd->rd_addr;
 		__entry->rd_free_clone	= rgd->rd_free_clone;
 		__entry->rd_requested	= rgd->rd_requested;
+		__entry->rd_reserved	= rgd->rd_reserved;
 	),
 
-	TP_printk("%u,%u bmap %llu alloc %llu/%lu %s rg:%llu rf:%u rr:%lu",
+	TP_printk("%u,%u bmap %llu alloc %llu/%lu %s rg:%llu rf:%u rq:%u rr:%u",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
 		  (unsigned long long)__entry->inum,
 		  (unsigned long long)__entry->start,
 		  (unsigned long)__entry->len,
 		  block_state_name(__entry->block_state),
 		  (unsigned long long)__entry->rd_addr,
-		  __entry->rd_free_clone, (unsigned long)__entry->rd_requested)
+		  __entry->rd_free_clone,
+		  __entry->rd_requested,
+		  __entry->rd_reserved)
 );
 
 /* Keep track of multi-block reservations as they are allocated/freed */
@@ -596,9 +600,11 @@ TRACE_EVENT(gfs2_rs,
 		__field(	u64,	rd_addr			)
 		__field(	u32,	rd_free_clone		)
 		__field(	u32,	rd_requested		)
+		__field(	u32,	rd_reserved		)
 		__field(	u64,	inum			)
 		__field(	u64,	start			)
 		__field(	u32,	requested		)
+		__field(	u32,	reserved		)
 		__field(	u8,	func			)
 	),
 
@@ -607,21 +613,26 @@ TRACE_EVENT(gfs2_rs,
 		__entry->rd_addr	= rs->rs_rgd->rd_addr;
 		__entry->rd_free_clone	= rs->rs_rgd->rd_free_clone;
 		__entry->rd_requested	= rs->rs_rgd->rd_requested;
+		__entry->rd_reserved	= rs->rs_rgd->rd_reserved;
 		__entry->inum		= container_of(rs, struct gfs2_inode,
 						       i_res)->i_no_addr;
 		__entry->start		= rs->rs_start;
 		__entry->requested	= rs->rs_requested;
+		__entry->reserved	= rs->rs_reserved;
 		__entry->func		= func;
 	),
 
-	TP_printk("%u,%u bmap %llu resrv %llu rg:%llu rf:%lu rr:%lu %s f:%lu",
+	TP_printk("%u,%u bmap %llu resrv %llu rg:%llu rf:%u rq:%u rr:%u %s q:%u r:%u",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
 		  (unsigned long long)__entry->inum,
 		  (unsigned long long)__entry->start,
 		  (unsigned long long)__entry->rd_addr,
-		  (unsigned long)__entry->rd_free_clone,
-		  (unsigned long)__entry->rd_requested,
-		  rs_func_name(__entry->func), (unsigned long)__entry->requested)
+		  __entry->rd_free_clone,
+		  __entry->rd_requested,
+		  __entry->rd_reserved,
+		  rs_func_name(__entry->func),
+		  __entry->requested,
+		  __entry->reserved)
 );
 
 #endif /* _TRACE_GFS2_H */
-- 
2.26.2

