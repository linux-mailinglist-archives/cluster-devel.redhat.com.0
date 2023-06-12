Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A0A72D150
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 23:02:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686603738;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VTfR0XRcDrdQr18OTDSB9N9llnuWvQuNKz9hb6FFVsk=;
	b=hKi7E7p/LjBe+kZ/ZznQjnryLQa6cIsoqZ6zoitQQBe1xPMPfBi9gcZ1YUO3mw8F+JOMwU
	6v2kTmmyVsdbx3lmVKrNIziUvAbDT8fen9WAPMA9nxnWpo6mYPOhtnQUJgA49TEsRwqO+Q
	9zhGdM/DygDQRJjtb5uDcakI6oEITZI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-wQuGfeFdM3e3JQv8LxV4cA-1; Mon, 12 Jun 2023 17:02:12 -0400
X-MC-Unique: wQuGfeFdM3e3JQv8LxV4cA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73247280AA23;
	Mon, 12 Jun 2023 21:02:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 685231415102;
	Mon, 12 Jun 2023 21:02:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 49E5E19465BB;
	Mon, 12 Jun 2023 21:02:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7986E194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 21:02:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 69B031410F01; Mon, 12 Jun 2023 21:02:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6254B1400C37
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:02:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 435E3280AA22
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:02:09 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-M6kOKbGlPDykkpReItsdng-1; Mon,
 12 Jun 2023 17:02:07 -0400
X-MC-Unique: M6kOKbGlPDykkpReItsdng-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q8ofX-0033ws-JJ; Mon, 12 Jun 2023 21:01:43 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Jun 2023 22:01:35 +0100
Message-Id: <20230612210141.730128-9-willy@infradead.org>
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
Subject: [Cluster-devel] [PATCH v3 08/14] buffer: Convert
 __block_commit_write() to take a folio
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This removes a hidden call to compound_head() inside
__block_commit_write() and moves it to those callers which are still
page based.  Also make block_write_end() safe for large folios.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/buffer.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 0af167e8a9c6..97c64b05151f 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2116,15 +2116,15 @@ int __block_write_begin(struct page *page, loff_t pos, unsigned len,
 }
 EXPORT_SYMBOL(__block_write_begin);
 
-static int __block_commit_write(struct inode *inode, struct page *page,
-		unsigned from, unsigned to)
+static int __block_commit_write(struct inode *inode, struct folio *folio,
+		size_t from, size_t to)
 {
-	unsigned block_start, block_end;
-	int partial = 0;
+	size_t block_start, block_end;
+	bool partial = false;
 	unsigned blocksize;
 	struct buffer_head *bh, *head;
 
-	bh = head = page_buffers(page);
+	bh = head = folio_buffers(folio);
 	blocksize = bh->b_size;
 
 	block_start = 0;
@@ -2132,7 +2132,7 @@ static int __block_commit_write(struct inode *inode, struct page *page,
 		block_end = block_start + blocksize;
 		if (block_end <= from || block_start >= to) {
 			if (!buffer_uptodate(bh))
-				partial = 1;
+				partial = true;
 		} else {
 			set_buffer_uptodate(bh);
 			mark_buffer_dirty(bh);
@@ -2147,11 +2147,11 @@ static int __block_commit_write(struct inode *inode, struct page *page,
 	/*
 	 * If this is a partial write which happened to make all buffers
 	 * uptodate then we can optimize away a bogus read_folio() for
-	 * the next read(). Here we 'discover' whether the page went
+	 * the next read(). Here we 'discover' whether the folio went
 	 * uptodate as a result of this (potentially partial) write.
 	 */
 	if (!partial)
-		SetPageUptodate(page);
+		folio_mark_uptodate(folio);
 	return 0;
 }
 
@@ -2188,10 +2188,9 @@ int block_write_end(struct file *file, struct address_space *mapping,
 			loff_t pos, unsigned len, unsigned copied,
 			struct page *page, void *fsdata)
 {
+	struct folio *folio = page_folio(page);
 	struct inode *inode = mapping->host;
-	unsigned start;
-
-	start = pos & (PAGE_SIZE - 1);
+	size_t start = pos - folio_pos(folio);
 
 	if (unlikely(copied < len)) {
 		/*
@@ -2203,18 +2202,18 @@ int block_write_end(struct file *file, struct address_space *mapping,
 		 * read_folio might come in and destroy our partial write.
 		 *
 		 * Do the simplest thing, and just treat any short write to a
-		 * non uptodate page as a zero-length write, and force the
+		 * non uptodate folio as a zero-length write, and force the
 		 * caller to redo the whole thing.
 		 */
-		if (!PageUptodate(page))
+		if (!folio_test_uptodate(folio))
 			copied = 0;
 
-		page_zero_new_buffers(page, start+copied, start+len);
+		page_zero_new_buffers(&folio->page, start+copied, start+len);
 	}
-	flush_dcache_page(page);
+	flush_dcache_folio(folio);
 
 	/* This could be a short (even 0-length) commit */
-	__block_commit_write(inode, page, start, start+copied);
+	__block_commit_write(inode, folio, start, start + copied);
 
 	return copied;
 }
@@ -2537,8 +2536,9 @@ EXPORT_SYMBOL(cont_write_begin);
 
 int block_commit_write(struct page *page, unsigned from, unsigned to)
 {
-	struct inode *inode = page->mapping->host;
-	__block_commit_write(inode,page,from,to);
+	struct folio *folio = page_folio(page);
+	struct inode *inode = folio->mapping->host;
+	__block_commit_write(inode, folio, from, to);
 	return 0;
 }
 EXPORT_SYMBOL(block_commit_write);
@@ -2586,7 +2586,7 @@ int block_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf,
 
 	ret = __block_write_begin_int(folio, 0, end, get_block, NULL);
 	if (!ret)
-		ret = block_commit_write(&folio->page, 0, end);
+		ret = __block_commit_write(inode, folio, 0, end);
 
 	if (unlikely(ret < 0))
 		goto out_unlock;
-- 
2.39.2

