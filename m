Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC64272D145
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 23:01:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686603716;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8TAjc/iGR0TnG7xeR+UbsxUyFbhLwY9D51/Atttv7wM=;
	b=g1m6k6qgjstsGwyCjNt8x6BPWclIsNIpz56wcEREloQAZpwgT5BT8bQGa2nT4jwgU8RfPF
	02ceRsBUu2FYc8QkQbtDyYNFS0jFdqW402a0kd5E2J4kSsIRKwTTK0lO0fUNHrhyGcLg5q
	/UlpcJKcfTtiuAsrXF3xYrdEJRPyW0s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-lBfUrGEVPnuN3oYbFiaKcw-1; Mon, 12 Jun 2023 17:01:53 -0400
X-MC-Unique: lBfUrGEVPnuN3oYbFiaKcw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 566BD1C05151;
	Mon, 12 Jun 2023 21:01:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4AC9F11320;
	Mon, 12 Jun 2023 21:01:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EC38519465B9;
	Mon, 12 Jun 2023 21:01:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 18CB819466DF for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 21:01:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EF9FA141511E; Mon, 12 Jun 2023 21:01:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E895F1415102
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:01:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9AF985A5A8
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:01:48 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-392-gJDc3lcpPo2OW3kbd1kJ1A-1; Mon,
 12 Jun 2023 17:01:45 -0400
X-MC-Unique: gJDc3lcpPo2OW3kbd1kJ1A-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q8ofX-0033wu-M2; Mon, 12 Jun 2023 21:01:43 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Jun 2023 22:01:36 +0100
Message-Id: <20230612210141.730128-10-willy@infradead.org>
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
Subject: [Cluster-devel] [PATCH v3 09/14] buffer: Convert
 page_zero_new_buffers() to folio_zero_new_buffers()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Most of the callers already have a folio; convert reiserfs_write_end()
to have a folio.  Removes a couple of hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/buffer.c                 | 27 ++++++++++++++-------------
 fs/ext4/inode.c             |  4 ++--
 fs/reiserfs/inode.c         |  7 ++++---
 include/linux/buffer_head.h |  2 +-
 4 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 97c64b05151f..e4bd465ecee8 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -1927,33 +1927,34 @@ int __block_write_full_folio(struct inode *inode, struct folio *folio,
 EXPORT_SYMBOL(__block_write_full_folio);
 
 /*
- * If a page has any new buffers, zero them out here, and mark them uptodate
+ * If a folio has any new buffers, zero them out here, and mark them uptodate
  * and dirty so they'll be written out (in order to prevent uninitialised
  * block data from leaking). And clear the new bit.
  */
-void page_zero_new_buffers(struct page *page, unsigned from, unsigned to)
+void folio_zero_new_buffers(struct folio *folio, size_t from, size_t to)
 {
-	unsigned int block_start, block_end;
+	size_t block_start, block_end;
 	struct buffer_head *head, *bh;
 
-	BUG_ON(!PageLocked(page));
-	if (!page_has_buffers(page))
+	BUG_ON(!folio_test_locked(folio));
+	head = folio_buffers(folio);
+	if (!head)
 		return;
 
-	bh = head = page_buffers(page);
+	bh = head;
 	block_start = 0;
 	do {
 		block_end = block_start + bh->b_size;
 
 		if (buffer_new(bh)) {
 			if (block_end > from && block_start < to) {
-				if (!PageUptodate(page)) {
-					unsigned start, size;
+				if (!folio_test_uptodate(folio)) {
+					size_t start, xend;
 
 					start = max(from, block_start);
-					size = min(to, block_end) - start;
+					xend = min(to, block_end);
 
-					zero_user(page, start, size);
+					folio_zero_segment(folio, start, xend);
 					set_buffer_uptodate(bh);
 				}
 
@@ -1966,7 +1967,7 @@ void page_zero_new_buffers(struct page *page, unsigned from, unsigned to)
 		bh = bh->b_this_page;
 	} while (bh != head);
 }
-EXPORT_SYMBOL(page_zero_new_buffers);
+EXPORT_SYMBOL(folio_zero_new_buffers);
 
 static void
 iomap_to_bh(struct inode *inode, sector_t block, struct buffer_head *bh,
@@ -2104,7 +2105,7 @@ int __block_write_begin_int(struct folio *folio, loff_t pos, unsigned len,
 			err = -EIO;
 	}
 	if (unlikely(err))
-		page_zero_new_buffers(&folio->page, from, to);
+		folio_zero_new_buffers(folio, from, to);
 	return err;
 }
 
@@ -2208,7 +2209,7 @@ int block_write_end(struct file *file, struct address_space *mapping,
 		if (!folio_test_uptodate(folio))
 			copied = 0;
 
-		page_zero_new_buffers(&folio->page, start+copied, start+len);
+		folio_zero_new_buffers(folio, start+copied, start+len);
 	}
 	flush_dcache_folio(folio);
 
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 02de439bf1f0..9ca583360166 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1093,7 +1093,7 @@ static int ext4_block_write_begin(struct folio *folio, loff_t pos, unsigned len,
 			err = -EIO;
 	}
 	if (unlikely(err)) {
-		page_zero_new_buffers(&folio->page, from, to);
+		folio_zero_new_buffers(folio, from, to);
 	} else if (fscrypt_inode_uses_fs_layer_crypto(inode)) {
 		for (i = 0; i < nr_wait; i++) {
 			int err2;
@@ -1339,7 +1339,7 @@ static int ext4_write_end(struct file *file,
 }
 
 /*
- * This is a private version of page_zero_new_buffers() which doesn't
+ * This is a private version of folio_zero_new_buffers() which doesn't
  * set the buffer to be dirty, since in data=journalled mode we need
  * to call ext4_dirty_journalled_data() instead.
  */
diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index ff34ee49106f..77bd3b27059f 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -2872,6 +2872,7 @@ static int reiserfs_write_end(struct file *file, struct address_space *mapping,
 			      loff_t pos, unsigned len, unsigned copied,
 			      struct page *page, void *fsdata)
 {
+	struct folio *folio = page_folio(page);
 	struct inode *inode = page->mapping->host;
 	int ret = 0;
 	int update_sd = 0;
@@ -2887,12 +2888,12 @@ static int reiserfs_write_end(struct file *file, struct address_space *mapping,
 
 	start = pos & (PAGE_SIZE - 1);
 	if (unlikely(copied < len)) {
-		if (!PageUptodate(page))
+		if (!folio_test_uptodate(folio))
 			copied = 0;
 
-		page_zero_new_buffers(page, start + copied, start + len);
+		folio_zero_new_buffers(folio, start + copied, start + len);
 	}
-	flush_dcache_page(page);
+	flush_dcache_folio(folio);
 
 	reiserfs_commit_page(inode, page, start, start + copied);
 
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index a366e01f8bd4..c794ea7096ba 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -278,7 +278,7 @@ int block_write_end(struct file *, struct address_space *,
 int generic_write_end(struct file *, struct address_space *,
 				loff_t, unsigned, unsigned,
 				struct page *, void *);
-void page_zero_new_buffers(struct page *page, unsigned from, unsigned to);
+void folio_zero_new_buffers(struct folio *folio, size_t from, size_t to);
 void clean_page_buffers(struct page *page);
 int cont_write_begin(struct file *, struct address_space *, loff_t,
 			unsigned, struct page **, void **,
-- 
2.39.2

