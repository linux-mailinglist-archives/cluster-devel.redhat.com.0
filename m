Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9582A108D
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Oct 2020 22:52:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604094735;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0215FhG8VVYzGR9AGjxQcj76ygdUoeNhJng3QeX220g=;
	b=SQ1gwDW3NB3jciRL8H8UQgGSnwEO59xd1rv7wmHHdOh/xpNEIPALX31dFeWeiTPMLOTqeu
	5F3uLfbpKQvwNzruatYOydaDSECjxLfH1YQdqkUEDGCywsJDdbxfjzKii5X7FazHLwYgVp
	TRQ6KHKmz5h5nD945NtuOJBJ8bTTnIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-bSaEWFvRMuKLLnXL60MG2A-1; Fri, 30 Oct 2020 17:52:13 -0400
X-MC-Unique: bSaEWFvRMuKLLnXL60MG2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30DA880362B;
	Fri, 30 Oct 2020 21:52:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F06455798;
	Fri, 30 Oct 2020 21:52:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B06258133;
	Fri, 30 Oct 2020 21:52:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ULq9g3024069 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 17:52:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DE864149; Fri, 30 Oct 2020 21:52:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8D3A6716C;
	Fri, 30 Oct 2020 21:52:08 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 30 Oct 2020 22:51:42 +0100
Message-Id: <20201030215152.1567790-8-agruenba@redhat.com>
In-Reply-To: <20201030215152.1567790-1-agruenba@redhat.com>
References: <20201030215152.1567790-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 07/17] gfs2: Set GBF_FULL flags when reading
	resource group
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

When reading a resource group from disk or when receiving the resource group
statistics from a Lock Value Block (LVB), set/clear the GBF_FULL flags of all
bitmaps in that resource group according to whether or not the resource group
is full.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/rgrp.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 73a0e2462cc3..89357107103a 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1161,6 +1161,23 @@ static u32 count_unlinked(struct gfs2_rgrpd *rgd)
 	return count;
 }
 
+static void rgrp_set_bitmap_flags(struct gfs2_rgrpd *rgd)
+{
+	struct gfs2_bitmap *bi;
+	int x;
+
+	if (rgd->rd_free) {
+		for (x = 0; x < rgd->rd_length; x++) {
+			bi = rgd->rd_bits + x;
+			clear_bit(GBF_FULL, &bi->bi_flags);
+		}
+	} else {
+		for (x = 0; x < rgd->rd_length; x++) {
+			bi = rgd->rd_bits + x;
+			set_bit(GBF_FULL, &bi->bi_flags);
+		}
+	}
+}
 
 /**
  * gfs2_rgrp_bh_get - Read in a RG's header and bitmaps
@@ -1204,9 +1221,8 @@ static int gfs2_rgrp_bh_get(struct gfs2_rgrpd *rgd)
 	}
 
 	if (!(rgd->rd_flags & GFS2_RDF_UPTODATE)) {
-		for (x = 0; x < length; x++)
-			clear_bit(GBF_FULL, &rgd->rd_bits[x].bi_flags);
 		gfs2_rgrp_in(rgd, (rgd->rd_bits[0].bi_bh)->b_data);
+		rgrp_set_bitmap_flags(rgd);
 		rgd->rd_flags |= (GFS2_RDF_UPTODATE | GFS2_RDF_CHECK);
 		rgd->rd_free_clone = rgd->rd_free;
 		/* max out the rgrp allocation failure point */
@@ -1256,6 +1272,7 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
 	if (rgd->rd_rgl->rl_unlinked == 0)
 		rgd->rd_flags &= ~GFS2_RDF_CHECK;
 	rgd->rd_free = be32_to_cpu(rgd->rd_rgl->rl_free);
+	rgrp_set_bitmap_flags(rgd);
 	rgd->rd_free_clone = rgd->rd_free;
 	rgd->rd_dinodes = be32_to_cpu(rgd->rd_rgl->rl_dinodes);
 	rgd->rd_igeneration = be64_to_cpu(rgd->rd_rgl->rl_igeneration);
-- 
2.26.2

