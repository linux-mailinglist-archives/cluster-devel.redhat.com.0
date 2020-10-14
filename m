Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4C728DE1F
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 11:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602669535;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=58Sba87guE1BqoUr48mLZtDFdl8ku4aRG2ojfxEAeZM=;
	b=ZuGiHYxzjQXdgnnnsTlYtxeogN36pJJthxSoxILcO7jtKGlsVnicRazT+KPRf5sfRCZvmi
	kzKbeNUkllelJMhc5EomZTlXVIMSK1enYRL9AcsnS+FU+jeGdP8hcQ1h7e/yFewBGzlRWw
	gEmFKN8braDiGclfjP4tRPQA5ZRXBuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-eoMQ5kotMJaaGcBbEAv-Vw-1; Wed, 14 Oct 2020 05:58:53 -0400
X-MC-Unique: eoMQ5kotMJaaGcBbEAv-Vw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21C13100746C;
	Wed, 14 Oct 2020 09:58:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C94510023A5;
	Wed, 14 Oct 2020 09:58:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E55955810F;
	Wed, 14 Oct 2020 09:58:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09E9wkIL001412 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 05:58:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 98CAD76669; Wed, 14 Oct 2020 09:58:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0AD67666B;
	Wed, 14 Oct 2020 09:58:45 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Oct 2020 11:58:22 +0200
Message-Id: <20201014095833.1035870-7-agruenba@redhat.com>
In-Reply-To: <20201014095833.1035870-1-agruenba@redhat.com>
References: <20201014095833.1035870-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC 06/17] gfs2: Don't clear GBF_FULL flags in
	rs_deltree
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Removing a reservation doesn't make any actual space available, so don't clear
the GBF_FULL flags in that case.  Otherwise, we'll only spend time scanning the
bitmaps again unnecessarily.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/rgrp.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index dbb0bcf48078..fcca1cd58ab3 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -327,20 +327,6 @@ static bool gfs2_rbm_add(struct gfs2_rbm *rbm, u32 blocks)
 	}
 }
 
-static struct gfs2_bitmap *gfs2_block_to_bitmap(struct gfs2_rgrpd *rgd,
-						u64 block)
-{
-	unsigned int delta = (sizeof(struct gfs2_rgrp) -
-			      sizeof(struct gfs2_meta_header)) * GFS2_NBBY;
-	unsigned int rblock, bii;
-
-	if (!rgrp_contains_block(rgd, block))
-		return NULL;
-	rblock = block - rgd->rd_data0;
-	bii = (rblock + delta) / rgd->rd_sbd->sd_blocks_per_bitmap;
-	return rgd->rd_bits + bii;
-}
-
 /**
  * gfs2_unaligned_extlen - Look for free blocks which are not byte aligned
  * @rbm: Position to search (value/result)
@@ -660,25 +646,16 @@ static void __rs_deltree(struct gfs2_blkreserv *rs)
 	RB_CLEAR_NODE(&rs->rs_node);
 
 	if (rs->rs_free) {
-		u64 last_block = rs->rs_start + rs->rs_free - 1;
-		struct gfs2_bitmap *start, *last;
-
 		/* return reserved blocks to the rgrp */
 		BUG_ON(rs->rs_rgd->rd_reserved < rs->rs_free);
 		rs->rs_rgd->rd_reserved -= rs->rs_free;
+
 		/* The rgrp extent failure point is likely not to increase;
 		   it will only do so if the freed blocks are somehow
 		   contiguous with a span of free blocks that follows. Still,
 		   it will force the number to be recalculated later. */
 		rgd->rd_extfail_pt += rs->rs_free;
 		rs->rs_free = 0;
-		start = gfs2_block_to_bitmap(rgd, rs->rs_start);
-		last = gfs2_block_to_bitmap(rgd, last_block);
-		if (!start || !last)
-			return;
-		do
-			clear_bit(GBF_FULL, &start->bi_flags);
-		while (start++ != last);
 	}
 }
 
-- 
2.26.2

