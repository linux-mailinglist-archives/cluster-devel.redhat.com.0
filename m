Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA473705E09
	for <lists+cluster-devel@lfdr.de>; Wed, 17 May 2023 05:25:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684293909;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AbeZXSrkUqRDuI65kyPYYuObwRGdx2E78FHWlBXfCH4=;
	b=IcXKLouCZ9IotW5S2GgHmeWmQMwdhK5yddA4Z3ebuCzpj0vgL0uK32XvtCOLJS5c/GaCAY
	zWyVl2M2GZ6VP++7CtYetZR477mDNkYarDAX1YQadeWiPP9ujoHlfJm70pzCpTEEAvssx7
	qnshGxpq8/uIEppCbHtI2EhIvE+1kQs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-c1V3g6YeMmmEr4qH5A6PIA-1; Tue, 16 May 2023 23:25:05 -0400
X-MC-Unique: c1V3g6YeMmmEr4qH5A6PIA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BE7F84AF30;
	Wed, 17 May 2023 03:25:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8047C492C3F;
	Wed, 17 May 2023 03:25:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4C76B19465B2;
	Wed, 17 May 2023 03:25:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5489519465A4 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 17 May 2023 03:25:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 41571407D440; Wed, 17 May 2023 03:25:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39B2740C6EC4
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 03:25:02 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E924857E0C
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 03:25:02 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-656-uNJuns4MMcOz14qcMZN6Zg-1; Tue,
 16 May 2023 23:25:00 -0400
X-MC-Unique: uNJuns4MMcOz14qcMZN6Zg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pz7mO-004lNE-3m; Wed, 17 May 2023 03:24:44 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 17 May 2023 04:24:42 +0100
Message-Id: <20230517032442.1135379-7-willy@infradead.org>
In-Reply-To: <20230517032442.1135379-1-willy@infradead.org>
References: <20230517032442.1135379-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 6/6] buffer: Make block_write_full_page()
 handle large folios correctly
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
 Luis Chamberlain <mcgrof@kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Keep the interface as struct page, but work entirely on the folio
internally.  Removes several PAGE_SIZE assumptions and removes
some references to page->index and page->mapping.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/buffer.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 4d518df50fab..d8c2c000676b 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2678,33 +2678,31 @@ int block_write_full_page(struct page *page, get_block_t *get_block,
 			struct writeback_control *wbc)
 {
 	struct folio *folio = page_folio(page);
-	struct inode * const inode = page->mapping->host;
+	struct inode * const inode = folio->mapping->host;
 	loff_t i_size = i_size_read(inode);
-	const pgoff_t end_index = i_size >> PAGE_SHIFT;
-	unsigned offset;
 
-	/* Is the page fully inside i_size? */
-	if (page->index < end_index)
+	/* Is the folio fully inside i_size? */
+	if (folio_pos(folio) + folio_size(folio) <= i_size)
 		return __block_write_full_folio(inode, folio, get_block, wbc,
 					       end_buffer_async_write);
 
-	/* Is the page fully outside i_size? (truncate in progress) */
-	offset = i_size & (PAGE_SIZE-1);
-	if (page->index >= end_index+1 || !offset) {
+	/* Is the folio fully outside i_size? (truncate in progress) */
+	if (folio_pos(folio) > i_size) {
 		folio_unlock(folio);
 		return 0; /* don't care */
 	}
 
 	/*
-	 * The page straddles i_size.  It must be zeroed out on each and every
+	 * The folio straddles i_size.  It must be zeroed out on each and every
 	 * writepage invocation because it may be mmapped.  "A file is mapped
 	 * in multiples of the page size.  For a file that is not a multiple of
-	 * the  page size, the remaining memory is zeroed when mapped, and
+	 * the page size, the remaining memory is zeroed when mapped, and
 	 * writes to that region are not written out to the file."
 	 */
-	zero_user_segment(page, offset, PAGE_SIZE);
+	folio_zero_segment(folio, offset_in_folio(folio, i_size),
+			folio_size(folio));
 	return __block_write_full_folio(inode, folio, get_block, wbc,
-							end_buffer_async_write);
+			end_buffer_async_write);
 }
 EXPORT_SYMBOL(block_write_full_page);
 
-- 
2.39.2

