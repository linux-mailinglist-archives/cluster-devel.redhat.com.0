Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AE6F128DE26
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 11:58:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602669536;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qZxX9qtMugDxp+WXhwjm5K3llnLrBMlo3yRVa7wfM5c=;
	b=hHlryw7deG+hKNPEuP5IFsWHtYG3gNfpjxpotC1pq3OmZC7NRSKNo/udQSWup7ClTi4ODt
	1Mkaliu5jf2VzdUcW4JYM39mM1e6YHza76dqTkd975RWU6lU/Enhyuz1kq9N+Yubcxdjkf
	r5DVhzhZF2cZq3x1gVohbM4ar4njkIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-CnEjKsaQMCiwrAaUs5VXJw-1; Wed, 14 Oct 2020 05:58:55 -0400
X-MC-Unique: CnEjKsaQMCiwrAaUs5VXJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8891B107AFA9;
	Wed, 14 Oct 2020 09:58:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 775A77666F;
	Wed, 14 Oct 2020 09:58:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62999181A06B;
	Wed, 14 Oct 2020 09:58:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09E9woG2001429 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 05:58:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C6EFD76669; Wed, 14 Oct 2020 09:58:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F2D27666F;
	Wed, 14 Oct 2020 09:58:46 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Oct 2020 11:58:23 +0200
Message-Id: <20201014095833.1035870-8-agruenba@redhat.com>
In-Reply-To: <20201014095833.1035870-1-agruenba@redhat.com>
References: <20201014095833.1035870-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC 07/17] gfs2: Set GBF_FULL flags when reading
	resource groups
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

When reading a resource group from disk or when receiving the resource group
statistics from a Lock Value Block (LVB), set/clear the GBF_FULL flags of the
bitmaps in that resource group according to whether the resource group is full
or not.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/rgrp.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index fcca1cd58ab3..d96e76e91769 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1165,6 +1165,23 @@ static u32 count_unlinked(struct gfs2_rgrpd *rgd)
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
@@ -1208,9 +1225,8 @@ static int gfs2_rgrp_bh_get(struct gfs2_rgrpd *rgd)
 	}
 
 	if (!(rgd->rd_flags & GFS2_RDF_UPTODATE)) {
-		for (x = 0; x < length; x++)
-			clear_bit(GBF_FULL, &rgd->rd_bits[x].bi_flags);
 		gfs2_rgrp_in(rgd, (rgd->rd_bits[0].bi_bh)->b_data);
+		rgrp_set_bitmap_flags(rgd);
 		rgd->rd_flags |= (GFS2_RDF_UPTODATE | GFS2_RDF_CHECK);
 		rgd->rd_free_clone = rgd->rd_free;
 		/* max out the rgrp allocation failure point */
@@ -1260,6 +1276,7 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
 	if (rgd->rd_rgl->rl_unlinked == 0)
 		rgd->rd_flags &= ~GFS2_RDF_CHECK;
 	rgd->rd_free = be32_to_cpu(rgd->rd_rgl->rl_free);
+	rgrp_set_bitmap_flags(rgd);
 	rgd->rd_free_clone = rgd->rd_free;
 	rgd->rd_dinodes = be32_to_cpu(rgd->rd_rgl->rl_dinodes);
 	rgd->rd_igeneration = be64_to_cpu(rgd->rd_rgl->rl_igeneration);
-- 
2.26.2

