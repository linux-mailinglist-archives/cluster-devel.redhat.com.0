Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D77672D142
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 23:01:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686603715;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2Apa5O6YVLHPRKl9QPRk82tyPcbf0XN1bONDIYMH1qM=;
	b=RLYuRsNj/OjRZYBtWiMunfTaCWHvObUvRPiYNUARF9adYoix1ZJ3mn6+F4LBCuoEZQYfYq
	nL6PiNVT+bz9wl6OoHEgRz4HWY52AIjtR590M6w4+S2kIO1t4wBEWHgULdWWTR+ExmvB9X
	AAvfag38+Wgfj3y0AIwnBG/57Q5skg4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-PV5IV8qBPemhwgNt7Ds8gQ-1; Mon, 12 Jun 2023 17:01:53 -0400
X-MC-Unique: PV5IV8qBPemhwgNt7Ds8gQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8ACA6858F18;
	Mon, 12 Jun 2023 21:01:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45156C1604D;
	Mon, 12 Jun 2023 21:01:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 07CEF19466DF;
	Mon, 12 Jun 2023 21:01:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 44E96194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 21:01:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 24DAD141510A; Mon, 12 Jun 2023 21:01:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CF7D1415102
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:01:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0194F803DBE
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:01:49 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-147-pd1GY3HvOPiVn4AhEjhgjQ-1; Mon,
 12 Jun 2023 17:01:46 -0400
X-MC-Unique: pd1GY3HvOPiVn4AhEjhgjQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q8ofY-0033xW-AV; Mon, 12 Jun 2023 21:01:44 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Jun 2023 22:01:41 +0100
Message-Id: <20230612210141.730128-15-willy@infradead.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH v3 14/14] buffer: Convert
 block_truncate_page() to use a folio
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Support large folios in block_truncate_page() and avoid three hidden
calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/buffer.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index c38fdcaa32ff..5a5b0c9d9769 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2598,17 +2598,16 @@ int block_truncate_page(struct address_space *mapping,
 			loff_t from, get_block_t *get_block)
 {
 	pgoff_t index = from >> PAGE_SHIFT;
-	unsigned offset = from & (PAGE_SIZE-1);
 	unsigned blocksize;
 	sector_t iblock;
-	unsigned length, pos;
+	size_t offset, length, pos;
 	struct inode *inode = mapping->host;
-	struct page *page;
+	struct folio *folio;
 	struct buffer_head *bh;
 	int err = 0;
 
 	blocksize = i_blocksize(inode);
-	length = offset & (blocksize - 1);
+	length = from & (blocksize - 1);
 
 	/* Block boundary? Nothing to do */
 	if (!length)
@@ -2617,15 +2616,18 @@ int block_truncate_page(struct address_space *mapping,
 	length = blocksize - length;
 	iblock = (sector_t)index << (PAGE_SHIFT - inode->i_blkbits);
 	
-	page = grab_cache_page(mapping, index);
-	if (!page)
+	folio = filemap_grab_folio(mapping, index);
+	if (!folio)
 		return -ENOMEM;
 
-	if (!page_has_buffers(page))
-		create_empty_buffers(page, blocksize, 0);
+	bh = folio_buffers(folio);
+	if (!bh) {
+		folio_create_empty_buffers(folio, blocksize, 0);
+		bh = folio_buffers(folio);
+	}
 
 	/* Find the buffer that contains "offset" */
-	bh = page_buffers(page);
+	offset = offset_in_folio(folio, from);
 	pos = blocksize;
 	while (offset >= pos) {
 		bh = bh->b_this_page;
@@ -2644,7 +2646,7 @@ int block_truncate_page(struct address_space *mapping,
 	}
 
 	/* Ok, it's mapped. Make sure it's up-to-date */
-	if (PageUptodate(page))
+	if (folio_test_uptodate(folio))
 		set_buffer_uptodate(bh);
 
 	if (!buffer_uptodate(bh) && !buffer_delay(bh) && !buffer_unwritten(bh)) {
@@ -2654,12 +2656,12 @@ int block_truncate_page(struct address_space *mapping,
 			goto unlock;
 	}
 
-	zero_user(page, offset, length);
+	folio_zero_range(folio, offset, length);
 	mark_buffer_dirty(bh);
 
 unlock:
-	unlock_page(page);
-	put_page(page);
+	folio_unlock(folio);
+	folio_put(folio);
 
 	return err;
 }
-- 
2.39.2

