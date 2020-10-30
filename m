Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7613F2A1086
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Oct 2020 22:52:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604094734;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T/OB9NAZezmhsQD/5e2VgQ+j6V+PpE/71EvIT6/0tDY=;
	b=KDCgv/U5XxLApbuPOX2lAIgPGjgn7eRY6LruSB+vIZoeYLIW9GgSSnGz0w2n6XyZ3Uze3V
	iJu01oZC4v3ikDdV7+r33S88kskJ/7gFI2w6qqNzV1VxchJth9kjlmmd9PJaFx9j2SS5hX
	SdLP9nsleCjCnJOQxuYefiiHsM5crV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-Pkx8R-sCMOOFRd22HexEBw-1; Fri, 30 Oct 2020 17:52:12 -0400
X-MC-Unique: Pkx8R-sCMOOFRd22HexEBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E48DE10066FC;
	Fri, 30 Oct 2020 21:52:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B419E5576C;
	Fri, 30 Oct 2020 21:52:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C78058138;
	Fri, 30 Oct 2020 21:52:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ULq1I2024015 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 17:52:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7F1A868431; Fri, 30 Oct 2020 21:52:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B9B3E60BE2;
	Fri, 30 Oct 2020 21:52:00 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 30 Oct 2020 22:51:38 +0100
Message-Id: <20201030215152.1567790-4-agruenba@redhat.com>
In-Reply-To: <20201030215152.1567790-1-agruenba@redhat.com>
References: <20201030215152.1567790-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 03/17] gfs2: Get rid of unnecessary variable
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
index b63b5608eedf..431f994848b2 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -2379,7 +2379,6 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 	struct gfs2_sbd *sdp = GFS2_SB(&ip->i_inode);
 	struct buffer_head *dibh;
 	struct gfs2_rbm rbm = { .rgd = ip->i_res.rs_rgd, };
-	unsigned int ndata;
 	u64 block; /* block, within the file system scope */
 	int error;
 
@@ -2405,12 +2404,8 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
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

