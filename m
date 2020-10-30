Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E5F392A1094
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Oct 2020 22:53:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604094789;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AYkwDRorIcaNyo5bKZvyGROuNJQvh640XsZNhkxrFhw=;
	b=a6nzaelCq3sKBVj4kEU9VXvA8yi4aW5vw7DdlAC6Rx16wesJf7LNZJpyD4kO8pFk5vi2Ge
	FPJDrN06smm8BqALJlRaTfsc/CE7YEX2Sm5DEBQ7Jx5H0T6a3hzBgg1vaT76tP2Lp8pW/E
	1IaAYP1byXkDdc0V3kgkCC0T7ZqxmEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-cobofId-NhitU7QyBRJYfg-1; Fri, 30 Oct 2020 17:53:06 -0400
X-MC-Unique: cobofId-NhitU7QyBRJYfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B69E835B8E;
	Fri, 30 Oct 2020 21:53:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACB7A7EB97;
	Fri, 30 Oct 2020 21:53:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72016181A86E;
	Fri, 30 Oct 2020 21:53:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ULr0dO024207 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 17:53:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 751DD6EE5D; Fri, 30 Oct 2020 21:53:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 628996E719;
	Fri, 30 Oct 2020 21:52:57 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 30 Oct 2020 22:51:48 +0100
Message-Id: <20201030215152.1567790-14-agruenba@redhat.com>
In-Reply-To: <20201030215152.1567790-1-agruenba@redhat.com>
References: <20201030215152.1567790-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 13/17] gfs2: Rename rs_{free -> requested}
	and rd_{reserved -> requested}
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

We keep track of what we've so far been referring to as reservations in
rd_rstree: the nodes in that tree indicate were in a resource group we'd
like to allocate the next couple of blocks for a particular inode.  Local
processes take those as hints, but they may still "steal" blocks from those
extents, so when actually allocating a block, we much double check in the
bitmap whether that block is actually still free.  Likewise, other cluster
nodes may "steal" such blocks as well.

One of the following patches introduces resource group glock sharing, i.e.,
sharing of an exclusively locked resource group glock among local processes to
speed up allocations.  To make that work, we'll need to keep track of how many
blocks we've actually reserved for each inode, so we end up with two different
kinds of reservations.

Distinguish these two kinds by referring to blocks which are reserved but may
still be "stolen" as "requested".  This rename also makes it more obvious that
rs_requested and rd_requested are strongly related.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/incore.h     |  6 +++---
 fs/gfs2/rgrp.c       | 42 +++++++++++++++++++++---------------------
 fs/gfs2/trace_gfs2.h | 18 +++++++++---------
 3 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index ec1524b3b75e..0141e011102b 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -106,7 +106,7 @@ struct gfs2_rgrpd {
 	u32 rd_data;			/* num of data blocks in rgrp */
 	u32 rd_bitbytes;		/* number of bytes in data bitmaps */
 	u32 rd_free;
-	u32 rd_reserved;                /* number of blocks reserved */
+	u32 rd_requested;		/* number of blocks in rd_rstree */
 	u32 rd_free_clone;
 	u32 rd_dinodes;
 	u64 rd_igeneration;
@@ -289,8 +289,8 @@ struct gfs2_qadata { /* quota allocation data */
 struct gfs2_blkreserv {
 	struct rb_node rs_node;       /* node within rd_rstree */
 	struct gfs2_rgrpd *rs_rgd;
-	u64 rs_start;		      /* start of reservation */
-	u32 rs_free;                  /* how many blocks are still free */
+	u64 rs_start;
+	u32 rs_requested;
 };
 
 /*
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index a5b1028775b1..68fabde2eb41 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -203,7 +203,7 @@ static inline u64 gfs2_bit_search(const __le64 *ptr, u64 mask, u8 state)
  */
 static inline int rs_cmp(u64 start, u32 len, struct gfs2_blkreserv *rs)
 {
-	if (start >= rs->rs_start + rs->rs_free)
+	if (start >= rs->rs_start + rs->rs_requested)
 		return 1;
 	if (rs->rs_start >= start + len)
 		return -1;
@@ -625,7 +625,7 @@ static void dump_rs(struct seq_file *seq, const struct gfs2_blkreserv *rs,
 		       fs_id_buf,
 		       (unsigned long long)ip->i_no_addr,
 		       (unsigned long long)rs->rs_start,
-		       rs->rs_free);
+		       rs->rs_requested);
 }
 
 /**
@@ -645,17 +645,17 @@ static void __rs_deltree(struct gfs2_blkreserv *rs)
 	rb_erase(&rs->rs_node, &rgd->rd_rstree);
 	RB_CLEAR_NODE(&rs->rs_node);
 
-	if (rs->rs_free) {
-		/* return reserved blocks to the rgrp */
-		BUG_ON(rs->rs_rgd->rd_reserved < rs->rs_free);
-		rs->rs_rgd->rd_reserved -= rs->rs_free;
+	if (rs->rs_requested) {
+		/* return requested blocks to the rgrp */
+		BUG_ON(rs->rs_rgd->rd_requested < rs->rs_requested);
+		rs->rs_rgd->rd_requested -= rs->rs_requested;
 
 		/* The rgrp extent failure point is likely not to increase;
 		   it will only do so if the freed blocks are somehow
 		   contiguous with a span of free blocks that follows. Still,
 		   it will force the number to be recalculated later. */
-		rgd->rd_extfail_pt += rs->rs_free;
-		rs->rs_free = 0;
+		rgd->rd_extfail_pt += rs->rs_requested;
+		rs->rs_requested = 0;
 	}
 }
 
@@ -672,7 +672,7 @@ void gfs2_rs_deltree(struct gfs2_blkreserv *rs)
 	if (rgd) {
 		spin_lock(&rgd->rd_rsspin);
 		__rs_deltree(rs);
-		BUG_ON(rs->rs_free);
+		BUG_ON(rs->rs_requested);
 		spin_unlock(&rgd->rd_rsspin);
 	}
 }
@@ -1497,7 +1497,7 @@ static void rs_insert(struct gfs2_inode *ip)
 			rb_entry(*newn, struct gfs2_blkreserv, rs_node);
 
 		parent = *newn;
-		rc = rs_cmp(rs->rs_start, rs->rs_free, cur);
+		rc = rs_cmp(rs->rs_start, rs->rs_requested, cur);
 		if (rc > 0)
 			newn = &((*newn)->rb_right);
 		else if (rc < 0)
@@ -1513,7 +1513,7 @@ static void rs_insert(struct gfs2_inode *ip)
 	rb_insert_color(&rs->rs_node, &rgd->rd_rstree);
 
 	/* Do our rgrp accounting for the reservation */
-	rgd->rd_reserved += rs->rs_free; /* blocks reserved */
+	rgd->rd_requested += rs->rs_requested; /* blocks requested */
 	spin_unlock(&rgd->rd_rsspin);
 	trace_gfs2_rs(rs, TRACE_RS_INSERT);
 }
@@ -1534,9 +1534,9 @@ static inline u32 rgd_free(struct gfs2_rgrpd *rgd, struct gfs2_blkreserv *rs)
 {
 	u32 tot_reserved, tot_free;
 
-	if (WARN_ON_ONCE(rgd->rd_reserved < rs->rs_free))
+	if (WARN_ON_ONCE(rgd->rd_requested < rs->rs_requested))
 		return 0;
-	tot_reserved = rgd->rd_reserved - rs->rs_free;
+	tot_reserved = rgd->rd_requested - rs->rs_requested;
 
 	if (rgd->rd_free_clone < tot_reserved)
 		tot_reserved = 0;
@@ -1571,7 +1571,7 @@ static void rg_mblk_search(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip,
 		extlen = max_t(u32, atomic_read(&ip->i_sizehint), ap->target);
 		extlen = max_t(u32, extlen, RGRP_RSRV_MINBLKS);
 	}
-	if ((rgd->rd_free_clone < rgd->rd_reserved) || (free_blocks < extlen))
+	if ((rgd->rd_free_clone < rgd->rd_requested) || (free_blocks < extlen))
 		return;
 
 	/* Find bitmap block that contains bits for goal block */
@@ -1586,7 +1586,7 @@ static void rg_mblk_search(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip,
 	ret = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &extlen, &ip->i_res, true);
 	if (ret == 0) {
 		rs->rs_start = gfs2_rbm_to_block(&rbm);
-		rs->rs_free = extlen;
+		rs->rs_requested = extlen;
 		rs_insert(ip);
 	} else {
 		if (goal == rgd->rd_last_alloc + rgd->rd_data0)
@@ -1630,7 +1630,7 @@ static u64 gfs2_next_unreserved_block(struct gfs2_rgrpd *rgd, u64 block,
 
 	if (n) {
 		while (rs_cmp(block, length, rs) == 0 && rs != ignore_rs) {
-			block = rs->rs_start + rs->rs_free;
+			block = rs->rs_start + rs->rs_requested;
 			n = n->rb_right;
 			if (n == NULL)
 				break;
@@ -2256,7 +2256,7 @@ void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_rgrpd *rgd,
 		       fs_id_buf,
 		       (unsigned long long)rgd->rd_addr, rgd->rd_flags,
 		       rgd->rd_free, rgd->rd_free_clone, rgd->rd_dinodes,
-		       rgd->rd_reserved, rgd->rd_extfail_pt);
+		       rgd->rd_requested, rgd->rd_extfail_pt);
 	if (rgd->rd_sbd->sd_args.ar_rgrplvb) {
 		struct gfs2_rgrp_lvb *rgl = rgd->rd_rgl;
 
@@ -2311,12 +2311,12 @@ static void gfs2_adjust_reservation(struct gfs2_inode *ip,
 			unsigned int rlen;
 
 			rs->rs_start += len;
-			rlen = min(rs->rs_free, len);
-			rs->rs_free -= rlen;
-			rgd->rd_reserved -= rlen;
+			rlen = min(rs->rs_requested, len);
+			rs->rs_requested -= rlen;
+			rgd->rd_requested -= rlen;
 			trace_gfs2_rs(rs, TRACE_RS_CLAIM);
 			if (rs->rs_start < rgd->rd_data0 + rgd->rd_data &&
-			    rs->rs_free)
+			    rs->rs_requested)
 				goto out;
 			/* We used up our block reservation, so we should
 			   reserve more blocks next time. */
diff --git a/fs/gfs2/trace_gfs2.h b/fs/gfs2/trace_gfs2.h
index e461a691e5e8..d24bdcdd42e5 100644
--- a/fs/gfs2/trace_gfs2.h
+++ b/fs/gfs2/trace_gfs2.h
@@ -560,7 +560,7 @@ TRACE_EVENT(gfs2_block_alloc,
 		__field(	u8,	block_state		)
 		__field(        u64,	rd_addr			)
 		__field(        u32,	rd_free_clone		)
-		__field(	u32,	rd_reserved		)
+		__field(	u32,	rd_requested		)
 	),
 
 	TP_fast_assign(
@@ -571,7 +571,7 @@ TRACE_EVENT(gfs2_block_alloc,
 		__entry->block_state	= block_state;
 		__entry->rd_addr	= rgd->rd_addr;
 		__entry->rd_free_clone	= rgd->rd_free_clone;
-		__entry->rd_reserved	= rgd->rd_reserved;
+		__entry->rd_requested	= rgd->rd_requested;
 	),
 
 	TP_printk("%u,%u bmap %llu alloc %llu/%lu %s rg:%llu rf:%u rr:%lu",
@@ -581,7 +581,7 @@ TRACE_EVENT(gfs2_block_alloc,
 		  (unsigned long)__entry->len,
 		  block_state_name(__entry->block_state),
 		  (unsigned long long)__entry->rd_addr,
-		  __entry->rd_free_clone, (unsigned long)__entry->rd_reserved)
+		  __entry->rd_free_clone, (unsigned long)__entry->rd_requested)
 );
 
 /* Keep track of multi-block reservations as they are allocated/freed */
@@ -595,10 +595,10 @@ TRACE_EVENT(gfs2_rs,
 		__field(        dev_t,  dev                     )
 		__field(	u64,	rd_addr			)
 		__field(	u32,	rd_free_clone		)
-		__field(	u32,	rd_reserved		)
+		__field(	u32,	rd_requested		)
 		__field(	u64,	inum			)
 		__field(	u64,	start			)
-		__field(	u32,	free			)
+		__field(	u32,	requested		)
 		__field(	u8,	func			)
 	),
 
@@ -606,11 +606,11 @@ TRACE_EVENT(gfs2_rs,
 		__entry->dev		= rs->rs_rgd->rd_sbd->sd_vfs->s_dev;
 		__entry->rd_addr	= rs->rs_rgd->rd_addr;
 		__entry->rd_free_clone	= rs->rs_rgd->rd_free_clone;
-		__entry->rd_reserved	= rs->rs_rgd->rd_reserved;
+		__entry->rd_requested	= rs->rs_rgd->rd_requested;
 		__entry->inum		= container_of(rs, struct gfs2_inode,
 						       i_res)->i_no_addr;
 		__entry->start		= rs->rs_start;
-		__entry->free		= rs->rs_free;
+		__entry->requested	= rs->rs_requested;
 		__entry->func		= func;
 	),
 
@@ -620,8 +620,8 @@ TRACE_EVENT(gfs2_rs,
 		  (unsigned long long)__entry->start,
 		  (unsigned long long)__entry->rd_addr,
 		  (unsigned long)__entry->rd_free_clone,
-		  (unsigned long)__entry->rd_reserved,
-		  rs_func_name(__entry->func), (unsigned long)__entry->free)
+		  (unsigned long)__entry->rd_requested,
+		  rs_func_name(__entry->func), (unsigned long)__entry->requested)
 );
 
 #endif /* _TRACE_GFS2_H */
-- 
2.26.2

