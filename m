Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EA4132A108E
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Oct 2020 22:52:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604094738;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oEiv2xdzH0DX4IdAIdwORM7kv+dAHFcCg5fMgO3z1Yw=;
	b=CTYBF1W8zVn3ne+e+RHfyoZCReY62B27l/+p4Loq/Ql07EYNEh70/QZxzYURYd4A8DZnC9
	GUn+C3mfKjoOlCn8u6oXL1ptHXz0Fa+zl5waNMuhs2pLqxqrJvxTv0cD/rT868MN5SSpMw
	e6IjcRWt0CKAhp4c+s+qUESLgMDxYJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-lyFB55ffPFaNy1SaE3scag-1; Fri, 30 Oct 2020 17:52:16 -0400
X-MC-Unique: lyFB55ffPFaNy1SaE3scag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AB21184C802;
	Fri, 30 Oct 2020 21:52:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 732575C1CF;
	Fri, 30 Oct 2020 21:52:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 604E55811C;
	Fri, 30 Oct 2020 21:52:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ULqAte024080 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 17:52:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8AA3E6115F; Fri, 30 Oct 2020 21:52:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7F5B60BE2;
	Fri, 30 Oct 2020 21:52:09 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 30 Oct 2020 22:51:43 +0100
Message-Id: <20201030215152.1567790-9-agruenba@redhat.com>
In-Reply-To: <20201030215152.1567790-1-agruenba@redhat.com>
References: <20201030215152.1567790-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 08/17] gfs2: When looking for blocks to
	allocate, don't clamp at free blocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

When looking for blocks to allocate, don't limit the number of blocks we are
looking for by the number of available blocks: this defeats the following check
if enough blocks are still available, and it will lead to nonsensical
"0-block allocations" when a resource group is out of free blocks.

Fixes: ff7f4cb46116 ("GFS2: Consolidate free block searching functions")
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/rgrp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 89357107103a..5f72ae9677a7 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1567,7 +1567,7 @@ static void rg_mblk_search(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip,
 		extlen = 1;
 	else {
 		extlen = max_t(u32, atomic_read(&ip->i_sizehint), ap->target);
-		extlen = clamp(extlen, (u32)RGRP_RSRV_MINBLKS, free_blocks);
+		extlen = max_t(u32, extlen, RGRP_RSRV_MINBLKS);
 	}
 	if ((rgd->rd_free_clone < rgd->rd_reserved) || (free_blocks < extlen))
 		return;
-- 
2.26.2

