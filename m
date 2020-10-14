Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E3F8728DE28
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 11:58:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602669538;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G9A4Gtj9OoZQ2tkx238tzZh5hvgPMvxGrrgA3VLU9sU=;
	b=H4lvYj4q70ReVl8vDbJNYUcrrC7MSPNbFtOIsQ1JyB3bBmxbO2goZ4XzdrePkX7Dc9cQsv
	+McZsmXyjNiB2FJIYixHYcCNaCLyWwpZFe+oAaV6K/shcgS5ILBDt3CiW+jAUsqOHWQuJm
	27XgCSvWqjhIHp5MJYKnwvmHPyHa6nc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-OA2FPlikMGSOoxoGbxag0w-1; Wed, 14 Oct 2020 05:58:56 -0400
X-MC-Unique: OA2FPlikMGSOoxoGbxag0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA991879528;
	Wed, 14 Oct 2020 09:58:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBEA96EF54;
	Wed, 14 Oct 2020 09:58:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4E3F58136;
	Wed, 14 Oct 2020 09:58:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09E9wpS4001434 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 05:58:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EA05750B44; Wed, 14 Oct 2020 09:58:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D56B7666D;
	Wed, 14 Oct 2020 09:58:50 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Oct 2020 11:58:24 +0200
Message-Id: <20201014095833.1035870-9-agruenba@redhat.com>
In-Reply-To: <20201014095833.1035870-1-agruenba@redhat.com>
References: <20201014095833.1035870-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC 08/17] gfs2: When looking for blocks to
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

When looking for blocks to allocate, don't limit the nuber of blocks we are
looking for by the number of available blocks: this defeats the following check
whether enough blocks are still available and it will lead to nonsensical
"0-block allocations" when a resource group is out of free blocks.

Fixes: ff7f4cb46116 ("GFS2: Consolidate free block searching functions")
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/rgrp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index d96e76e91769..dba15d25ff96 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1571,7 +1571,7 @@ static void rg_mblk_search(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip,
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

