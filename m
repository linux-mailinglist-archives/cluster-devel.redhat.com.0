Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F3172D144
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 23:01:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686603715;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y3oTUBr8nUbuZPwhJLsYAQkdoLOLLxnDGymoFp7BQW8=;
	b=amaZjLnw2b+GoPu249PkZPIZHGzo9xAwxyy6h9Zpn68KPclbBNhSoMsOAcIfrLaXv0X87g
	FtDJbxDGUwu91sF6EssdbfmNPQ7kYz72hsUJhYV16fIRpzs9PCVmFw2aZLuOej+Iy9GYmP
	MP3zP4MQan9mJmTf1OnyV+X/D9Q4/cU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-jQHfv-O1MGy3TjjVPFprAg-1; Mon, 12 Jun 2023 17:01:51 -0400
X-MC-Unique: jQHfv-O1MGy3TjjVPFprAg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CA2F811E8E;
	Mon, 12 Jun 2023 21:01:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2703492C1B;
	Mon, 12 Jun 2023 21:01:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A7E041946A47;
	Mon, 12 Jun 2023 21:01:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 39258194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 21:01:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 18FFF2166B26; Mon, 12 Jun 2023 21:01:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 108342166B25
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:01:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4ABC811E94
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:01:47 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-169-2MwgYzNTN3Gz__8epVm1Pg-1; Mon,
 12 Jun 2023 17:01:45 -0400
X-MC-Unique: 2MwgYzNTN3Gz__8epVm1Pg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q8ofX-0033x8-QY; Mon, 12 Jun 2023 21:01:43 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Jun 2023 22:01:37 +0100
Message-Id: <20230612210141.730128-11-willy@infradead.org>
In-Reply-To: <20230612210141.730128-1-willy@infradead.org>
References: <20230612210141.730128-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH v3 10/14] buffer: Convert grow_dev_page() to
 use a folio
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
Cc: Hannes Reinecke <hare@suse.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, cluster-devel@redhat.com,
 Luis Chamberlain <mcgrof@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Get a folio from the page cache instead of a page, then use the
folio API throughout.  Removes a few calls to compound_head()
and may be needed to support block size > PAGE_SIZE.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/buffer.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index e4bd465ecee8..06d031e28bee 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -976,7 +976,7 @@ grow_dev_page(struct block_device *bdev, sector_t block,
 	      pgoff_t index, int size, int sizebits, gfp_t gfp)
 {
 	struct inode *inode = bdev->bd_inode;
-	struct page *page;
+	struct folio *folio;
 	struct buffer_head *bh;
 	sector_t end_block;
 	int ret = 0;
@@ -992,42 +992,38 @@ grow_dev_page(struct block_device *bdev, sector_t block,
 	 */
 	gfp_mask |= __GFP_NOFAIL;
 
-	page = find_or_create_page(inode->i_mapping, index, gfp_mask);
-
-	BUG_ON(!PageLocked(page));
+	folio = __filemap_get_folio(inode->i_mapping, index,
+			FGP_LOCK | FGP_ACCESSED | FGP_CREAT, gfp_mask);
 
-	if (page_has_buffers(page)) {
-		bh = page_buffers(page);
+	bh = folio_buffers(folio);
+	if (bh) {
 		if (bh->b_size == size) {
-			end_block = init_page_buffers(page, bdev,
+			end_block = init_page_buffers(&folio->page, bdev,
 						(sector_t)index << sizebits,
 						size);
 			goto done;
 		}
-		if (!try_to_free_buffers(page_folio(page)))
+		if (!try_to_free_buffers(folio))
 			goto failed;
 	}
 
-	/*
-	 * Allocate some buffers for this page
-	 */
-	bh = alloc_page_buffers(page, size, true);
+	bh = folio_alloc_buffers(folio, size, true);
 
 	/*
-	 * Link the page to the buffers and initialise them.  Take the
+	 * Link the folio to the buffers and initialise them.  Take the
 	 * lock to be atomic wrt __find_get_block(), which does not
-	 * run under the page lock.
+	 * run under the folio lock.
 	 */
 	spin_lock(&inode->i_mapping->private_lock);
-	link_dev_buffers(page, bh);
-	end_block = init_page_buffers(page, bdev, (sector_t)index << sizebits,
-			size);
+	link_dev_buffers(&folio->page, bh);
+	end_block = init_page_buffers(&folio->page, bdev,
+			(sector_t)index << sizebits, size);
 	spin_unlock(&inode->i_mapping->private_lock);
 done:
 	ret = (block < end_block) ? 1 : -ENXIO;
 failed:
-	unlock_page(page);
-	put_page(page);
+	folio_unlock(folio);
+	folio_put(folio);
 	return ret;
 }
 
-- 
2.39.2

