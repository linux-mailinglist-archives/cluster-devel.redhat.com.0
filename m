Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1B77698FD
	for <lists+cluster-devel@lfdr.de>; Mon, 31 Jul 2023 16:07:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690812450;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LOCl39ixuzBWSHbRhyfb9MlqtmJEqSLE0ZDPAEb8QlM=;
	b=ITXbClQSc9tX//9Jcy262PC+9OTxo+sLaLeHkdg+whEIfyt/dw43THStCy8aVLkKN34op+
	/Ut6k3xeZTV5l6tk7/p9BTNPF9mZoAbZkm9/6BvDbOipcNahZ2tEXKdNDO0OizL7lWNSDx
	k0g8OwjZf0LO7iCeLfQ3FHf14X/WLGs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-02iSqSnGO7awl7lGPg2NHw-1; Mon, 31 Jul 2023 10:07:24 -0400
X-MC-Unique: 02iSqSnGO7awl7lGPg2NHw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D0C688D070;
	Mon, 31 Jul 2023 14:07:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9141AC585A2;
	Mon, 31 Jul 2023 14:07:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 22AB11946A79;
	Mon, 31 Jul 2023 14:06:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 36D281946A52 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 31 Jul 2023 14:06:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 22E5F2166B28; Mon, 31 Jul 2023 14:06:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.225.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92CB62166B25;
 Mon, 31 Jul 2023 14:06:16 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 31 Jul 2023 16:06:14 +0200
Message-Id: <20230731140614.390794-2-agruenba@redhat.com>
In-Reply-To: <20230731140614.390794-1-agruenba@redhat.com>
References: <20230731140614.390794-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH 2/2] gfs: Don't use GFP_NOFS in
 gfs2_unstuff_dinode
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Revert the rest of commit 220cca2a4f58 ("GFS2: Change truncate page
allocation to be GFP_NOFS"):

In gfs2_unstuff_dinode(), there is no need to carry out the page cache
allocation under GFP_NOFS because inodes on the "regular" filesystem are
never un-inlined under memory pressure, so switch back from
find_or_create_page() to grab_cache_page() here as well.

Inodes on the "metadata" filesystem can theoretically be un-inlined
under memory pressure, but any page cache allocations in that context
would happen in GFP_NOFS context because those inodes have
inode->i_mapping->gfp_mask set to GFP_NOFS (see the previous patch).

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 8d611fbcf0bd..c2f0ed76a2b6 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -161,7 +161,7 @@ int gfs2_unstuff_dinode(struct gfs2_inode *ip)
 	int error;
 
 	down_write(&ip->i_rw_mutex);
-	page = find_or_create_page(inode->i_mapping, 0, GFP_NOFS);
+	page = grab_cache_page(inode->i_mapping, 0);
 	error = -ENOMEM;
 	if (!page)
 		goto out;
-- 
2.40.1

