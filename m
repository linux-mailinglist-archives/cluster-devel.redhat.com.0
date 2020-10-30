Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 44B9C2A1092
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Oct 2020 22:52:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604094754;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VxZrIVi1LOz38dhK2e/6pG3wEA9Jfy3K1cxpOwVwaA4=;
	b=NpE7wGeHpp6ZsvT9R10hU4A5/eVVOsfCNAphMWlfKgSWQjUhV6psyOijw0xeN0F0dWky6A
	cTEUM7nftV79sjxoJEdm6LtA6tTKHWN/T5xurcclR8QIkd9DOL00n5dXB2rU/J7qpf69rO
	aNBP7R48811bf7HAYOa2gSy5/mnpVeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-NRrTACVMNL2RJy4s3XadUg-1; Fri, 30 Oct 2020 17:52:32 -0400
X-MC-Unique: NRrTACVMNL2RJy4s3XadUg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C345107464D;
	Fri, 30 Oct 2020 21:52:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F023A709F6;
	Fri, 30 Oct 2020 21:52:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA044181A870;
	Fri, 30 Oct 2020 21:52:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ULqSUI024142 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 17:52:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38EAA68433; Fri, 30 Oct 2020 21:52:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F41CB6EE4C;
	Fri, 30 Oct 2020 21:52:19 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 30 Oct 2020 22:51:46 +0100
Message-Id: <20201030215152.1567790-12-agruenba@redhat.com>
In-Reply-To: <20201030215152.1567790-1-agruenba@redhat.com>
References: <20201030215152.1567790-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 11/17] gfs: Don't search for unreserved
	space twice
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

If gfs2_inplace_reserve has chosen a resource group but it couldn't make a
reservation there, there are too many other reservations in that resource
group.  In that case, don't even try to respect existing reservations in
gfs2_alloc_blocks.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/rgrp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 4e0f8e2a59b1..a5b1028775b1 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -2377,11 +2377,12 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 	struct gfs2_rbm rbm = { .rgd = ip->i_res.rs_rgd, };
 	u64 block; /* block, within the file system scope */
 	u32 minext = 1;
-	int error;
-
-	gfs2_set_alloc_start(&rbm, ip, dinode);
-	error = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &minext, &ip->i_res, false);
+	int error = -ENOSPC;
 
+	if (gfs2_rs_active(&ip->i_res)) {
+		gfs2_set_alloc_start(&rbm, ip, dinode);
+		error = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &minext, &ip->i_res, false);
+	}
 	if (error == -ENOSPC) {
 		gfs2_set_alloc_start(&rbm, ip, dinode);
 		error = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &minext, NULL, false);
-- 
2.26.2

