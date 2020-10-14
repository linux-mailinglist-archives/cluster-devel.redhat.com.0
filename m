Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B131928DE33
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 11:59:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602669552;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z7Q0FpNzyPwQPaDbhWgdNdMLVTneo/7i7KevwOiTuVs=;
	b=JncXuC3Gj6aedfJQi/xsbuEGVKMBVsS+0YsoSaAAtVRkvnqqkT7PZIFaLOeB7PxAeY6ath
	jCqhkxW4oQdWGxfy/lwvw2qbD7zqLqCU93NU8TGp8aGrOcfFgO9t4Vdx2296kcfcaWO4ac
	sicw+mT/EOuZpa3t8W21u+i/K3D9gsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-OqmiQpEvPfWvZPavvSX_VQ-1; Wed, 14 Oct 2020 05:59:11 -0400
X-MC-Unique: OqmiQpEvPfWvZPavvSX_VQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B23C1007464;
	Wed, 14 Oct 2020 09:59:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B78D5D9D3;
	Wed, 14 Oct 2020 09:59:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 48153181A050;
	Wed, 14 Oct 2020 09:59:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09E9x5Nb001528 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 05:59:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E3A7E50B44; Wed, 14 Oct 2020 09:59:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A05B7666B;
	Wed, 14 Oct 2020 09:59:04 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Oct 2020 11:58:33 +0200
Message-Id: <20201014095833.1035870-18-agruenba@redhat.com>
In-Reply-To: <20201014095833.1035870-1-agruenba@redhat.com>
References: <20201014095833.1035870-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC 17/17] gfs2: Rename rs_free to rs_wanted
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

This should make it a bit more clear that the rs_start and rs_wanted fields in
struct gfs2_blkreserv only define a semi-reservation that other nodes and other
processes may still steal blocks from.  In contrast, rs_reserved indicates the
number of blocks actually reserved.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/incore.h     |  6 +++---
 fs/gfs2/rgrp.c       | 28 ++++++++++++++--------------
 fs/gfs2/trace_gfs2.h |  6 +++---
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 4f68456da677..03e2126765b7 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -288,9 +288,9 @@ struct gfs2_qadata { /* quota allocation data */
 struct gfs2_blkreserv {
 	struct rb_node rs_node;       /* node within rd_rstree */
 	struct gfs2_rgrpd *rs_rgd;
-	u64 rs_start;		      /* start of reservation */
-	u32 rs_free;                  /* how many blocks are still free */
-	u32 rs_reserved;              /* number of reserved blocks */
+	u64 rs_start;		      /* start of semi-reservation */
+	u32 rs_wanted;                /* size of semi-reservation */
+	u32 rs_reserved;              /* blocks actually reserved */
 };
 
 /*
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 1ed09e45738f..176b5e769b79 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -203,7 +203,7 @@ static inline u64 gfs2_bit_search(const __le64 *ptr, u64 mask, u8 state)
  */
 static inline int rs_cmp(u64 start, u32 len, struct gfs2_blkreserv *rs)
 {
-	if (start >= rs->rs_start + rs->rs_free)
+	if (start >= rs->rs_start + rs->rs_wanted)
 		return 1;
 	if (rs->rs_start >= start + len)
 		return -1;
@@ -625,7 +625,7 @@ static void dump_rs(struct seq_file *seq, const struct gfs2_blkreserv *rs,
 		       fs_id_buf,
 		       (unsigned long long)ip->i_no_addr,
 		       (unsigned long long)rs->rs_start,
-		       rs->rs_free);
+		       rs->rs_wanted);
 }
 
 /**
@@ -645,14 +645,14 @@ static void __rs_deltree(struct gfs2_blkreserv *rs)
 	rb_erase(&rs->rs_node, &rgd->rd_rstree);
 	RB_CLEAR_NODE(&rs->rs_node);
 
-	if (rs->rs_free) {
-		rgd->rd_wanted -= rs->rs_free;
+	if (rs->rs_wanted) {
+		rgd->rd_wanted -= rs->rs_wanted;
 		/* The rgrp extent failure point is likely not to increase;
 		   it will only do so if the freed blocks are somehow
 		   contiguous with a span of free blocks that follows. Still,
 		   it will force the number to be recalculated later. */
-		rgd->rd_extfail_pt += rs->rs_free;
-		rs->rs_free = 0;
+		rgd->rd_extfail_pt += rs->rs_wanted;
+		rs->rs_wanted = 0;
 	}
 }
 
@@ -669,7 +669,7 @@ void gfs2_rs_deltree(struct gfs2_blkreserv *rs)
 	if (rgd) {
 		spin_lock(&rgd->rd_rsspin);
 		__rs_deltree(rs);
-		BUG_ON(rs->rs_free);
+		BUG_ON(rs->rs_wanted);
 		spin_unlock(&rgd->rd_rsspin);
 	}
 }
@@ -1506,7 +1506,7 @@ static void rs_insert(struct gfs2_inode *ip)
 			rb_entry(*newn, struct gfs2_blkreserv, rs_node);
 
 		parent = *newn;
-		rc = rs_cmp(rs->rs_start, rs->rs_free, cur);
+		rc = rs_cmp(rs->rs_start, rs->rs_wanted, cur);
 		if (rc > 0)
 			newn = &((*newn)->rb_right);
 		else if (rc < 0)
@@ -1520,7 +1520,7 @@ static void rs_insert(struct gfs2_inode *ip)
 
 	rb_link_node(&rs->rs_node, parent, newn);
 	rb_insert_color(&rs->rs_node, &rgd->rd_rstree);
-	rgd->rd_wanted += rs->rs_free;
+	rgd->rd_wanted += rs->rs_wanted;
 	spin_unlock(&rgd->rd_rsspin);
 	trace_gfs2_rs(rs, TRACE_RS_INSERT);
 }
@@ -1573,7 +1573,7 @@ static void rg_mblk_search(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip,
 	ret = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &extlen, &ip->i_res, true);
 	if (ret == 0) {
 		rs->rs_start = gfs2_rbm_to_block(&rbm);
-		rs->rs_free = extlen;
+		rs->rs_wanted = extlen;
 		rs_insert(ip);
 	} else {
 		if (goal == rgd->rd_last_alloc + rgd->rd_data0)
@@ -1617,7 +1617,7 @@ static u64 gfs2_next_unreserved_block(struct gfs2_rgrpd *rgd, u64 block,
 
 	if (n) {
 		while (rs_cmp(block, length, rs) == 0 && rs != ignore_rs) {
-			block = rs->rs_start + rs->rs_free;
+			block = rs->rs_start + rs->rs_wanted;
 			n = n->rb_right;
 			if (n == NULL)
 				break;
@@ -2357,12 +2357,12 @@ static void gfs2_adjust_reservation(struct gfs2_inode *ip,
 			unsigned int rlen;
 
 			rs->rs_start += len;
-			rlen = min(rs->rs_free, len);
-			rs->rs_free -= rlen;
+			rlen = min(rs->rs_wanted, len);
+			rs->rs_wanted -= rlen;
 			rgd->rd_wanted -= rlen;
 			trace_gfs2_rs(rs, TRACE_RS_CLAIM);
 			if (rs->rs_start < rgd->rd_data0 + rgd->rd_data &&
-			    rs->rs_free)
+			    rs->rs_wanted)
 				return;
 			/* We used up our block reservation, so we should
 			   reserve more blocks next time. */
diff --git a/fs/gfs2/trace_gfs2.h b/fs/gfs2/trace_gfs2.h
index 4fd1614274fd..d751535d2604 100644
--- a/fs/gfs2/trace_gfs2.h
+++ b/fs/gfs2/trace_gfs2.h
@@ -602,7 +602,7 @@ TRACE_EVENT(gfs2_rs,
 		__field(	u32,	rd_wanted		)
 		__field(	u64,	inum			)
 		__field(	u64,	start			)
-		__field(	u32,	free			)
+		__field(	u32,	wanted			)
 		__field(	u32,	reserved		)
 		__field(	u8,	func			)
 	),
@@ -616,7 +616,7 @@ TRACE_EVENT(gfs2_rs,
 		__entry->inum		= container_of(rs, struct gfs2_inode,
 						       i_res)->i_no_addr;
 		__entry->start		= rs->rs_start;
-		__entry->free		= rs->rs_free;
+		__entry->wanted		= rs->rs_wanted;
 		__entry->reserved	= rs->rs_reserved;
 		__entry->func		= func;
 	),
@@ -630,7 +630,7 @@ TRACE_EVENT(gfs2_rs,
 		  (unsigned long)__entry->rd_reserved,
 		  (unsigned long)__entry->rd_wanted,
 		  rs_func_name(__entry->func),
-		  (unsigned long)__entry->free,
+		  (unsigned long)__entry->wanted,
 		  (unsigned long)__entry->reserved)
 );
 
-- 
2.26.2

