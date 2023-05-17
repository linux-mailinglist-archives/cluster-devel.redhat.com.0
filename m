Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA8D705E0B
	for <lists+cluster-devel@lfdr.de>; Wed, 17 May 2023 05:25:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684293913;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=in4+mHeNLFc736lVbzVg00/EU4thFT85mKz5G3l3ydI=;
	b=gv9wjtHNnyuJk0Ai8+CspoFtRG3K3F7oow8qKnq/Yjhcn/NZJzdiiqIwrgQF3V4cXNMOSl
	fqWng+9v+HixW84kArI3+q4BTFWoXlQ7TNAT9waGqqoOyii+6mDfQPGrg7AEkD+mEuU0/z
	HS1H9SWLQDEGsjQ2zooXKNyR+4BI2Mo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-8L7WIKBGOdW91Q_NawLbpQ-1; Tue, 16 May 2023 23:25:09 -0400
X-MC-Unique: 8L7WIKBGOdW91Q_NawLbpQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CB953C0BE49;
	Wed, 17 May 2023 03:25:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D2882166B32;
	Wed, 17 May 2023 03:25:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6080719465B2;
	Wed, 17 May 2023 03:25:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7BF0419465B3 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 17 May 2023 03:25:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 516FFC16024; Wed, 17 May 2023 03:25:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 496A0C15BA0
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 03:25:07 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25E828026E8
 for <cluster-devel@redhat.com>; Wed, 17 May 2023 03:25:07 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-31-FHGoPScEPSahEE4c_yPLvQ-1; Tue,
 16 May 2023 23:25:04 -0400
X-MC-Unique: FHGoPScEPSahEE4c_yPLvQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pz7mN-004lNA-UT; Wed, 17 May 2023 03:24:43 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 17 May 2023 04:24:40 +0100
Message-Id: <20230517032442.1135379-5-willy@infradead.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 4/6] buffer: Convert
 __block_write_full_page() to __block_write_full_folio()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Remove nine hidden calls to compound_head() by using a folio instead
of a page.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/buffer.c                 | 53 +++++++++++++++++++------------------
 fs/gfs2/aops.c              |  5 ++--
 fs/ntfs/aops.c              |  2 +-
 fs/reiserfs/inode.c         |  2 +-
 include/linux/buffer_head.h |  2 +-
 5 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index a7fc561758b1..4d518df50fab 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -1764,7 +1764,7 @@ static struct buffer_head *folio_create_buffers(struct folio *folio,
  * WB_SYNC_ALL, the writes are posted using REQ_SYNC; this
  * causes the writes to be flagged as synchronous writes.
  */
-int __block_write_full_page(struct inode *inode, struct page *page,
+int __block_write_full_folio(struct inode *inode, struct folio *folio,
 			get_block_t *get_block, struct writeback_control *wbc,
 			bh_end_io_t *handler)
 {
@@ -1776,14 +1776,14 @@ int __block_write_full_page(struct inode *inode, struct page *page,
 	int nr_underway = 0;
 	blk_opf_t write_flags = wbc_to_write_flags(wbc);
 
-	head = folio_create_buffers(page_folio(page), inode,
+	head = folio_create_buffers(folio, inode,
 				    (1 << BH_Dirty) | (1 << BH_Uptodate));
 
 	/*
 	 * Be very careful.  We have no exclusion from block_dirty_folio
 	 * here, and the (potentially unmapped) buffers may become dirty at
 	 * any time.  If a buffer becomes dirty here after we've inspected it
-	 * then we just miss that fact, and the page stays dirty.
+	 * then we just miss that fact, and the folio stays dirty.
 	 *
 	 * Buffers outside i_size may be dirtied by block_dirty_folio;
 	 * handle that here by just cleaning them.
@@ -1793,7 +1793,7 @@ int __block_write_full_page(struct inode *inode, struct page *page,
 	blocksize = bh->b_size;
 	bbits = block_size_bits(blocksize);
 
-	block = (sector_t)page->index << (PAGE_SHIFT - bbits);
+	block = (sector_t)folio->index << (PAGE_SHIFT - bbits);
 	last_block = (i_size_read(inode) - 1) >> bbits;
 
 	/*
@@ -1804,7 +1804,7 @@ int __block_write_full_page(struct inode *inode, struct page *page,
 		if (block > last_block) {
 			/*
 			 * mapped buffers outside i_size will occur, because
-			 * this page can be outside i_size when there is a
+			 * this folio can be outside i_size when there is a
 			 * truncate in progress.
 			 */
 			/*
@@ -1834,7 +1834,7 @@ int __block_write_full_page(struct inode *inode, struct page *page,
 			continue;
 		/*
 		 * If it's a fully non-blocking write attempt and we cannot
-		 * lock the buffer then redirty the page.  Note that this can
+		 * lock the buffer then redirty the folio.  Note that this can
 		 * potentially cause a busy-wait loop from writeback threads
 		 * and kswapd activity, but those code paths have their own
 		 * higher-level throttling.
@@ -1842,7 +1842,7 @@ int __block_write_full_page(struct inode *inode, struct page *page,
 		if (wbc->sync_mode != WB_SYNC_NONE) {
 			lock_buffer(bh);
 		} else if (!trylock_buffer(bh)) {
-			redirty_page_for_writepage(wbc, page);
+			folio_redirty_for_writepage(wbc, folio);
 			continue;
 		}
 		if (test_clear_buffer_dirty(bh)) {
@@ -1853,11 +1853,11 @@ int __block_write_full_page(struct inode *inode, struct page *page,
 	} while ((bh = bh->b_this_page) != head);
 
 	/*
-	 * The page and its buffers are protected by PageWriteback(), so we can
-	 * drop the bh refcounts early.
+	 * The folio and its buffers are protected by the writeback flag,
+	 * so we can drop the bh refcounts early.
 	 */
-	BUG_ON(PageWriteback(page));
-	set_page_writeback(page);
+	BUG_ON(folio_test_writeback(folio));
+	folio_start_writeback(folio);
 
 	do {
 		struct buffer_head *next = bh->b_this_page;
@@ -1867,20 +1867,20 @@ int __block_write_full_page(struct inode *inode, struct page *page,
 		}
 		bh = next;
 	} while (bh != head);
-	unlock_page(page);
+	folio_unlock(folio);
 
 	err = 0;
 done:
 	if (nr_underway == 0) {
 		/*
-		 * The page was marked dirty, but the buffers were
+		 * The folio was marked dirty, but the buffers were
 		 * clean.  Someone wrote them back by hand with
 		 * write_dirty_buffer/submit_bh.  A rare case.
 		 */
-		end_page_writeback(page);
+		folio_end_writeback(folio);
 
 		/*
-		 * The page and buffer_heads can be released at any time from
+		 * The folio and buffer_heads can be released at any time from
 		 * here on.
 		 */
 	}
@@ -1891,7 +1891,7 @@ int __block_write_full_page(struct inode *inode, struct page *page,
 	 * ENOSPC, or some other error.  We may already have added some
 	 * blocks to the file, so we need to write these out to avoid
 	 * exposing stale data.
-	 * The page is currently locked and not marked for writeback
+	 * The folio is currently locked and not marked for writeback
 	 */
 	bh = head;
 	/* Recovery: lock and submit the mapped buffers */
@@ -1903,15 +1903,15 @@ int __block_write_full_page(struct inode *inode, struct page *page,
 		} else {
 			/*
 			 * The buffer may have been set dirty during
-			 * attachment to a dirty page.
+			 * attachment to a dirty folio.
 			 */
 			clear_buffer_dirty(bh);
 		}
 	} while ((bh = bh->b_this_page) != head);
-	SetPageError(page);
-	BUG_ON(PageWriteback(page));
-	mapping_set_error(page->mapping, err);
-	set_page_writeback(page);
+	folio_set_error(folio);
+	BUG_ON(folio_test_writeback(folio));
+	mapping_set_error(folio->mapping, err);
+	folio_start_writeback(folio);
 	do {
 		struct buffer_head *next = bh->b_this_page;
 		if (buffer_async_write(bh)) {
@@ -1921,10 +1921,10 @@ int __block_write_full_page(struct inode *inode, struct page *page,
 		}
 		bh = next;
 	} while (bh != head);
-	unlock_page(page);
+	folio_unlock(folio);
 	goto done;
 }
-EXPORT_SYMBOL(__block_write_full_page);
+EXPORT_SYMBOL(__block_write_full_folio);
 
 /*
  * If a page has any new buffers, zero them out here, and mark them uptodate
@@ -2677,6 +2677,7 @@ EXPORT_SYMBOL(block_truncate_page);
 int block_write_full_page(struct page *page, get_block_t *get_block,
 			struct writeback_control *wbc)
 {
+	struct folio *folio = page_folio(page);
 	struct inode * const inode = page->mapping->host;
 	loff_t i_size = i_size_read(inode);
 	const pgoff_t end_index = i_size >> PAGE_SHIFT;
@@ -2684,13 +2685,13 @@ int block_write_full_page(struct page *page, get_block_t *get_block,
 
 	/* Is the page fully inside i_size? */
 	if (page->index < end_index)
-		return __block_write_full_page(inode, page, get_block, wbc,
+		return __block_write_full_folio(inode, folio, get_block, wbc,
 					       end_buffer_async_write);
 
 	/* Is the page fully outside i_size? (truncate in progress) */
 	offset = i_size & (PAGE_SIZE-1);
 	if (page->index >= end_index+1 || !offset) {
-		unlock_page(page);
+		folio_unlock(folio);
 		return 0; /* don't care */
 	}
 
@@ -2702,7 +2703,7 @@ int block_write_full_page(struct page *page, get_block_t *get_block,
 	 * writes to that region are not written out to the file."
 	 */
 	zero_user_segment(page, offset, PAGE_SIZE);
-	return __block_write_full_page(inode, page, get_block, wbc,
+	return __block_write_full_folio(inode, folio, get_block, wbc,
 							end_buffer_async_write);
 }
 EXPORT_SYMBOL(block_write_full_page);
diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 0f92e3e117da..e97462a5302e 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -108,9 +108,8 @@ static int gfs2_write_jdata_folio(struct folio *folio,
 		folio_zero_segment(folio, offset_in_folio(folio, i_size),
 				folio_size(folio));
 
-	return __block_write_full_page(inode, &folio->page,
-				       gfs2_get_block_noalloc, wbc,
-				       end_buffer_async_write);
+	return __block_write_full_folio(inode, folio, gfs2_get_block_noalloc,
+			wbc, end_buffer_async_write);
 }
 
 /**
diff --git a/fs/ntfs/aops.c b/fs/ntfs/aops.c
index e8aeba124a95..4e158bce4192 100644
--- a/fs/ntfs/aops.c
+++ b/fs/ntfs/aops.c
@@ -526,7 +526,7 @@ static int ntfs_read_folio(struct file *file, struct folio *folio)
  *
  * Return 0 on success and -errno on error.
  *
- * Based on ntfs_read_block() and __block_write_full_page().
+ * Based on ntfs_read_block() and __block_write_full_folio().
  */
 static int ntfs_write_block(struct page *page, struct writeback_control *wbc)
 {
diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index d8debbb6105f..ff34ee49106f 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -2506,7 +2506,7 @@ static int map_block_for_writepage(struct inode *inode,
 
 /*
  * mason@suse.com: updated in 2.5.54 to follow the same general io
- * start/recovery path as __block_write_full_page, along with special
+ * start/recovery path as __block_write_full_folio, along with special
  * code to handle reiserfs tails.
  */
 static int reiserfs_write_full_page(struct page *page,
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index 1520793c72da..a366e01f8bd4 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -263,7 +263,7 @@ extern int buffer_heads_over_limit;
 void block_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 int block_write_full_page(struct page *page, get_block_t *get_block,
 				struct writeback_control *wbc);
-int __block_write_full_page(struct inode *inode, struct page *page,
+int __block_write_full_folio(struct inode *inode, struct folio *folio,
 			get_block_t *get_block, struct writeback_control *wbc,
 			bh_end_io_t *handler);
 int block_read_full_folio(struct folio *, get_block_t *);
-- 
2.39.2

