Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E13EB28DE1D
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 11:58:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602669535;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Sz05HHsqab8ts9Ga/5nj/EF7tsQQAawXlfEOughlkAc=;
	b=Fde1jyEUjP91CrbEFw9MOMQhTDhR5Jl0E1yPsnUJVyL/9Z1c0wIJzztIL0W31fMTt1pNyJ
	Ge1Ja7PssvRlcrA3mnXfZddKPAG0OLU8DZdfuUlELq1uzUxX8A1fEvNvdp5uahx6BbmMs7
	/+RGOO6XHMRa7lKSI5O6wrjowHE0UzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-brM93IRqP7a3-Lq_fEblyw-1; Wed, 14 Oct 2020 05:58:53 -0400
X-MC-Unique: brM93IRqP7a3-Lq_fEblyw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5C36879529;
	Wed, 14 Oct 2020 09:58:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1BBE5C1BD;
	Wed, 14 Oct 2020 09:58:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4399E5810F;
	Wed, 14 Oct 2020 09:58:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09E9whO4001361 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 05:58:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 385EE7666A; Wed, 14 Oct 2020 09:58:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7143550B44;
	Wed, 14 Oct 2020 09:58:42 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Oct 2020 11:58:19 +0200
Message-Id: <20201014095833.1035870-4-agruenba@redhat.com>
In-Reply-To: <20201014095833.1035870-1-agruenba@redhat.com>
References: <20201014095833.1035870-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC 03/17] gfs2: Get rid of unnecessary variable
	in gfs2_alloc_blocks
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

Variable ndata is only used inside "if (!dinode)", so it can be replaced
entirely with *nblocks.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/rgrp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index f044430f5c52..af3e15baea89 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -2386,7 +2386,6 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 	struct gfs2_sbd *sdp = GFS2_SB(&ip->i_inode);
 	struct buffer_head *dibh;
 	struct gfs2_rbm rbm = { .rgd = ip->i_res.rs_rgd, };
-	unsigned int ndata;
 	u64 block; /* block, within the file system scope */
 	int error;
 
@@ -2412,12 +2411,8 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 	rbm.rgd->rd_last_alloc = block - rbm.rgd->rd_data0;
 	if (gfs2_rs_active(&ip->i_res))
 		gfs2_adjust_reservation(ip, &rbm, *nblocks);
-	ndata = *nblocks;
-	if (dinode)
-		ndata--;
-
 	if (!dinode) {
-		ip->i_goal = block + ndata - 1;
+		ip->i_goal = block + *nblocks - 1;
 		error = gfs2_meta_inode_buffer(ip, &dibh);
 		if (error == 0) {
 			struct gfs2_dinode *di =
-- 
2.26.2

