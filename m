Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 19AE528DE32
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 11:59:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602669552;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fKYjerF/f8DW6iNrRpCyAUBjQXYhf1M0ZlbVbLse5G0=;
	b=hP90gPaIg5mxHnvhwDbttwSJV6QUZvg8qhzZqMDqrDtc6eHJY0pgi1OCOAcTuggd4ei6ep
	EzyFV5EFJWuJ/k+4wyniAAz9V5nQjG4lB2Fyu/7kSzi+YeVmJeKvfvCHSYXu+Ztjhgz1Od
	4YZXep8ZzD5MRvgDHab9h3sbrrQXp18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-IxpayBhBMeKPdmw8Qp-ElQ-1; Wed, 14 Oct 2020 05:59:09 -0400
X-MC-Unique: IxpayBhBMeKPdmw8Qp-ElQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18113879528;
	Wed, 14 Oct 2020 09:59:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08E846EF52;
	Wed, 14 Oct 2020 09:59:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA16458132;
	Wed, 14 Oct 2020 09:59:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09E9x41A001521 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 05:59:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C2E6176669; Wed, 14 Oct 2020 09:59:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 07C9F7666B;
	Wed, 14 Oct 2020 09:59:03 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Oct 2020 11:58:32 +0200
Message-Id: <20201014095833.1035870-17-agruenba@redhat.com>
In-Reply-To: <20201014095833.1035870-1-agruenba@redhat.com>
References: <20201014095833.1035870-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC 16/17] gfs2: Limit the maximum amount of
	reserved space
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

When allocating blocks for an inode, gfs2 tries to keep future allocations
efficient by "reserving" the blocks adjacent to the allocated blocks for future
use by this inode.  These "reservations" are node-local, and they can be stolen
by other nodes or even other processes on the same node when necessary.

Stealing from those reservations is very inefficient because it involves
scanning the bitmaps, repeatedly.  This slows down workloads that create many
small files, for example.  Fix this by discarding some of those
semi-reservations as soon as they cover more than half of the remaining space.

Fixes xfstests generic/488, generic/531.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/incore.h     |  1 +
 fs/gfs2/rgrp.c       | 30 ++++++++++++++++++++++++++++++
 fs/gfs2/trace_gfs2.h | 13 ++++++++++---
 3 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 295c22441ade..4f68456da677 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -104,6 +104,7 @@ struct gfs2_rgrpd {
 	u32 rd_bitbytes;		/* number of bytes in data bitmaps */
 	u32 rd_free;
 	u32 rd_reserved;                /* number of blocks reserved */
+	u32 rd_wanted;
 	u32 rd_free_clone;
 	u32 rd_dinodes;
 	u64 rd_igeneration;
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 751bd31cfa5d..1ed09e45738f 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -646,6 +646,7 @@ static void __rs_deltree(struct gfs2_blkreserv *rs)
 	RB_CLEAR_NODE(&rs->rs_node);
 
 	if (rs->rs_free) {
+		rgd->rd_wanted -= rs->rs_free;
 		/* The rgrp extent failure point is likely not to increase;
 		   it will only do so if the freed blocks are somehow
 		   contiguous with a span of free blocks that follows. Still,
@@ -1519,6 +1520,7 @@ static void rs_insert(struct gfs2_inode *ip)
 
 	rb_link_node(&rs->rs_node, parent, newn);
 	rb_insert_color(&rs->rs_node, &rgd->rd_rstree);
+	rgd->rd_wanted += rs->rs_free;
 	spin_unlock(&rgd->rd_rsspin);
 	trace_gfs2_rs(rs, TRACE_RS_INSERT);
 }
@@ -1997,6 +1999,26 @@ static inline int fast_to_acquire(struct gfs2_rgrpd *rgd)
 	return 0;
 }
 
+static bool gfs2_trim_wanted_blocks(struct gfs2_rgrpd *rgd)
+{
+	u32 max_wanted = (rgd->rd_free_clone - rgd->rd_reserved) / 2;
+	struct gfs2_blkreserv *rs, *next;
+	bool trimmed = false;
+
+	if (rgd->rd_wanted <= max_wanted)
+		goto out;
+	rbtree_postorder_for_each_entry_safe(rs, next, &rgd->rd_rstree, rs_node) {
+		if (rs->rs_reserved)
+			continue;
+		__rs_deltree(rs);
+		if (rgd->rd_wanted <= max_wanted)
+			break;
+	}
+
+out:
+	return trimmed;
+}
+
 /**
  * gfs2_inplace_reserve - Reserve space in the filesystem
  * @ip: the inode to reserve space for
@@ -2046,6 +2068,7 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 
 	while (loops < 3) {
 		struct gfs2_rgrpd *rgd;
+		bool retry = false;
 
 		rg_locked = gfs2_glock_is_locked_by_me(rs->rs_rgd->rd_gl);
 		if (rg_locked) {
@@ -2110,7 +2133,13 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 		if (rs->rs_reserved > blocks_available)
 			rs->rs_reserved = blocks_available;
 		rgd->rd_reserved += rs->rs_reserved;
+		if (!gfs2_rs_active(rs)) {
+			if (gfs2_trim_wanted_blocks(rgd))
+				retry = true;
+		}
 		spin_unlock(&rgd->rd_rsspin);
+		if (retry)
+			rg_mblk_search(rs->rs_rgd, ip, ap);
 		rgrp_unlock_local(rs->rs_rgd);
 		return 0;
 check_rgrp:
@@ -2330,6 +2359,7 @@ static void gfs2_adjust_reservation(struct gfs2_inode *ip,
 			rs->rs_start += len;
 			rlen = min(rs->rs_free, len);
 			rs->rs_free -= rlen;
+			rgd->rd_wanted -= rlen;
 			trace_gfs2_rs(rs, TRACE_RS_CLAIM);
 			if (rs->rs_start < rgd->rd_data0 + rgd->rd_data &&
 			    rs->rs_free)
diff --git a/fs/gfs2/trace_gfs2.h b/fs/gfs2/trace_gfs2.h
index 282fcb1a242f..4fd1614274fd 100644
--- a/fs/gfs2/trace_gfs2.h
+++ b/fs/gfs2/trace_gfs2.h
@@ -560,6 +560,7 @@ TRACE_EVENT(gfs2_block_alloc,
 		__field(        u64,	rd_addr			)
 		__field(        u32,	rd_free_clone		)
 		__field(	u32,	rd_reserved		)
+		__field(	u32,	rd_wanted		)
 	),
 
 	TP_fast_assign(
@@ -571,16 +572,19 @@ TRACE_EVENT(gfs2_block_alloc,
 		__entry->rd_addr	= rgd->rd_addr;
 		__entry->rd_free_clone	= rgd->rd_free_clone;
 		__entry->rd_reserved	= rgd->rd_reserved;
+		__entry->rd_wanted	= rgd->rd_wanted;
 	),
 
-	TP_printk("%u,%u bmap %llu alloc %llu/%lu %s rg:%llu rf:%u rr:%lu",
+	TP_printk("%u,%u bmap %llu alloc %llu/%lu %s rg:%llu rf:%u rr:%lu rw:%lu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
 		  (unsigned long long)__entry->inum,
 		  (unsigned long long)__entry->start,
 		  (unsigned long)__entry->len,
 		  block_state_name(__entry->block_state),
 		  (unsigned long long)__entry->rd_addr,
-		  __entry->rd_free_clone, (unsigned long)__entry->rd_reserved)
+		  __entry->rd_free_clone,
+		  (unsigned long)__entry->rd_reserved,
+		  (unsigned long)__entry->rd_wanted)
 );
 
 /* Keep track of multi-block reservations as they are allocated/freed */
@@ -595,6 +599,7 @@ TRACE_EVENT(gfs2_rs,
 		__field(	u64,	rd_addr			)
 		__field(	u32,	rd_free_clone		)
 		__field(	u32,	rd_reserved		)
+		__field(	u32,	rd_wanted		)
 		__field(	u64,	inum			)
 		__field(	u64,	start			)
 		__field(	u32,	free			)
@@ -607,6 +612,7 @@ TRACE_EVENT(gfs2_rs,
 		__entry->rd_addr	= rs->rs_rgd->rd_addr;
 		__entry->rd_free_clone	= rs->rs_rgd->rd_free_clone;
 		__entry->rd_reserved	= rs->rs_rgd->rd_reserved;
+		__entry->rd_wanted	= rs->rs_rgd->rd_wanted;
 		__entry->inum		= container_of(rs, struct gfs2_inode,
 						       i_res)->i_no_addr;
 		__entry->start		= rs->rs_start;
@@ -615,13 +621,14 @@ TRACE_EVENT(gfs2_rs,
 		__entry->func		= func;
 	),
 
-	TP_printk("%u,%u bmap %llu resrv %llu rg:%llu rf:%lu rr:%lu %s f:%lu r:%lu",
+	TP_printk("%u,%u bmap %llu resrv %llu rg:%llu rf:%lu rr:%lu rw:%lu %s f:%lu r:%lu",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
 		  (unsigned long long)__entry->inum,
 		  (unsigned long long)__entry->start,
 		  (unsigned long long)__entry->rd_addr,
 		  (unsigned long)__entry->rd_free_clone,
 		  (unsigned long)__entry->rd_reserved,
+		  (unsigned long)__entry->rd_wanted,
 		  rs_func_name(__entry->func),
 		  (unsigned long)__entry->free,
 		  (unsigned long)__entry->reserved)
-- 
2.26.2

