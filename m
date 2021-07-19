Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 314F63CD2F1
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 13:03:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-1WgCfZ0yNfG4YZuJhWuo7g-1; Mon, 19 Jul 2021 07:03:24 -0400
X-MC-Unique: 1WgCfZ0yNfG4YZuJhWuo7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 964A5A0CAD;
	Mon, 19 Jul 2021 11:03:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6065F60C9D;
	Mon, 19 Jul 2021 11:03:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4BD201809C99;
	Mon, 19 Jul 2021 11:03:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JB3KJ4008690 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 07:03:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 931724E6BE; Mon, 19 Jul 2021 11:03:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DDAB76C3
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 11:03:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAAF01801386
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 11:03:17 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-82-uF8fm-TlPTuqCaUR3CwBXw-1; Mon, 19 Jul 2021 07:03:15 -0400
X-MC-Unique: uF8fm-TlPTuqCaUR3CwBXw-1
Received: from [2001:4bb8:193:7660:d2a4:8d57:2e55:21d0] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5R0Q-006mFD-RK; Mon, 19 Jul 2021 11:00:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon, 19 Jul 2021 12:35:15 +0200
Message-Id: <20210719103520.495450-23-hch@lst.de>
In-Reply-To: <20210719103520.495450-1-hch@lst.de>
References: <20210719103520.495450-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 22/27] iomap: pass an iomap_iter to various
	buffered I/O helpers
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
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

Pass the iomap_iter structure instead of individual parameters to
various internal helpers for buffered I/O.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/buffered-io.c | 117 ++++++++++++++++++++---------------------
 1 file changed, 56 insertions(+), 61 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index c273b5d88dd8a8..daabbe8d7edfb5 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -226,12 +226,14 @@ iomap_read_inline_data(struct inode *inode, struct page *page,
 	SetPageUptodate(page);
 }
 
-static inline bool iomap_block_needs_zeroing(struct inode *inode,
-		struct iomap *iomap, loff_t pos)
+static inline bool iomap_block_needs_zeroing(struct iomap_iter *iter,
+		loff_t pos)
 {
-	return iomap->type != IOMAP_MAPPED ||
-		(iomap->flags & IOMAP_F_NEW) ||
-		pos >= i_size_read(inode);
+	struct iomap *srcmap = iomap_iter_srcmap(iter);
+
+	return srcmap->type != IOMAP_MAPPED ||
+		(srcmap->flags & IOMAP_F_NEW) ||
+		pos >= i_size_read(iter->inode);
 }
 
 static loff_t iomap_readpage_iter(struct iomap_iter *iter,
@@ -259,7 +261,7 @@ static loff_t iomap_readpage_iter(struct iomap_iter *iter,
 	if (plen == 0)
 		goto done;
 
-	if (iomap_block_needs_zeroing(iter->inode, iomap, pos)) {
+	if (iomap_block_needs_zeroing(iter, pos)) {
 		zero_user(page, poff, plen);
 		iomap_set_range_uptodate(page, poff, plen);
 		goto done;
@@ -541,12 +543,12 @@ iomap_read_page_sync(loff_t block_start, struct page *page, unsigned poff,
 	return submit_bio_wait(&bio);
 }
 
-static int
-__iomap_write_begin(struct inode *inode, loff_t pos, unsigned len, int flags,
-		struct page *page, struct iomap *srcmap)
+static int __iomap_write_begin(struct iomap_iter *iter, loff_t pos,
+		unsigned len, int flags, struct page *page)
 {
-	struct iomap_page *iop = iomap_page_create(inode, page);
-	loff_t block_size = i_blocksize(inode);
+	struct iomap *srcmap = iomap_iter_srcmap(iter);
+	struct iomap_page *iop = iomap_page_create(iter->inode, page);
+	loff_t block_size = i_blocksize(iter->inode);
 	loff_t block_start = round_down(pos, block_size);
 	loff_t block_end = round_up(pos + len, block_size);
 	unsigned from = offset_in_page(pos), to = from + len, poff, plen;
@@ -556,7 +558,7 @@ __iomap_write_begin(struct inode *inode, loff_t pos, unsigned len, int flags,
 	ClearPageError(page);
 
 	do {
-		iomap_adjust_read_range(inode, iop, &block_start,
+		iomap_adjust_read_range(iter->inode, iop, &block_start,
 				block_end - block_start, &poff, &plen);
 		if (plen == 0)
 			break;
@@ -566,7 +568,7 @@ __iomap_write_begin(struct inode *inode, loff_t pos, unsigned len, int flags,
 		    (to <= poff || to >= poff + plen))
 			continue;
 
-		if (iomap_block_needs_zeroing(inode, srcmap, block_start)) {
+		if (iomap_block_needs_zeroing(iter, block_start)) {
 			if (WARN_ON_ONCE(flags & IOMAP_WRITE_F_UNSHARE))
 				return -EIO;
 			zero_user_segments(page, poff, from, to, poff + plen);
@@ -582,41 +584,40 @@ __iomap_write_begin(struct inode *inode, loff_t pos, unsigned len, int flags,
 	return 0;
 }
 
-static int
-iomap_write_begin(struct inode *inode, loff_t pos, unsigned len, unsigned flags,
-		struct page **pagep, struct iomap *iomap, struct iomap *srcmap)
+static int iomap_write_begin(struct iomap_iter *iter, loff_t pos, unsigned len,
+		unsigned flags, struct page **pagep)
 {
-	const struct iomap_page_ops *page_ops = iomap->page_ops;
+	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
+	struct iomap *srcmap = iomap_iter_srcmap(iter);
 	struct page *page;
 	int status = 0;
 
-	BUG_ON(pos + len > iomap->offset + iomap->length);
-	if (srcmap != iomap)
+	BUG_ON(pos + len > iter->iomap.offset + iter->iomap.length);
+	if (srcmap != &iter->iomap)
 		BUG_ON(pos + len > srcmap->offset + srcmap->length);
 
 	if (fatal_signal_pending(current))
 		return -EINTR;
 
 	if (page_ops && page_ops->page_prepare) {
-		status = page_ops->page_prepare(inode, pos, len);
+		status = page_ops->page_prepare(iter->inode, pos, len);
 		if (status)
 			return status;
 	}
 
-	page = grab_cache_page_write_begin(inode->i_mapping, pos >> PAGE_SHIFT,
-			AOP_FLAG_NOFS);
+	page = grab_cache_page_write_begin(iter->inode->i_mapping,
+				pos >> PAGE_SHIFT, AOP_FLAG_NOFS);
 	if (!page) {
 		status = -ENOMEM;
 		goto out_no_page;
 	}
 
 	if (srcmap->type == IOMAP_INLINE)
-		iomap_read_inline_data(inode, page, srcmap);
-	else if (iomap->flags & IOMAP_F_BUFFER_HEAD)
+		iomap_read_inline_data(iter->inode, page, srcmap);
+	else if (iter->iomap.flags & IOMAP_F_BUFFER_HEAD)
 		status = __block_write_begin_int(page, pos, len, NULL, srcmap);
 	else
-		status = __iomap_write_begin(inode, pos, len, flags, page,
-				srcmap);
+		status = __iomap_write_begin(iter, pos, len, flags, page);
 
 	if (unlikely(status))
 		goto out_unlock;
@@ -627,11 +628,11 @@ iomap_write_begin(struct inode *inode, loff_t pos, unsigned len, unsigned flags,
 out_unlock:
 	unlock_page(page);
 	put_page(page);
-	iomap_write_failed(inode, pos, len);
+	iomap_write_failed(iter->inode, pos, len);
 
 out_no_page:
 	if (page_ops && page_ops->page_done)
-		page_ops->page_done(inode, pos, 0, NULL);
+		page_ops->page_done(iter->inode, pos, 0, NULL);
 	return status;
 }
 
@@ -658,9 +659,10 @@ static size_t __iomap_write_end(struct inode *inode, loff_t pos, size_t len,
 	return copied;
 }
 
-static size_t iomap_write_end_inline(struct inode *inode, struct page *page,
-		struct iomap *iomap, loff_t pos, size_t copied)
+static size_t iomap_write_end_inline(struct iomap_iter *iter, struct page *page,
+		loff_t pos, size_t copied)
 {
+	struct iomap *iomap = &iter->iomap;
 	void *addr;
 
 	WARN_ON_ONCE(!PageUptodate(page));
@@ -671,26 +673,26 @@ static size_t iomap_write_end_inline(struct inode *inode, struct page *page,
 	memcpy(iomap->inline_data + pos, addr + pos, copied);
 	kunmap_atomic(addr);
 
-	mark_inode_dirty(inode);
+	mark_inode_dirty(iter->inode);
 	return copied;
 }
 
 /* Returns the number of bytes copied.  May be 0.  Cannot be an errno. */
-static size_t iomap_write_end(struct inode *inode, loff_t pos, size_t len,
-		size_t copied, struct page *page, struct iomap *iomap,
-		struct iomap *srcmap)
+static size_t iomap_write_end(struct iomap_iter *iter, loff_t pos, size_t len,
+		size_t copied, struct page *page)
 {
-	const struct iomap_page_ops *page_ops = iomap->page_ops;
-	loff_t old_size = inode->i_size;
+	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
+	struct iomap *srcmap = iomap_iter_srcmap(iter);
+	loff_t old_size = iter->inode->i_size;
 	size_t ret;
 
 	if (srcmap->type == IOMAP_INLINE) {
-		ret = iomap_write_end_inline(inode, page, iomap, pos, copied);
+		ret = iomap_write_end_inline(iter, page, pos, copied);
 	} else if (srcmap->flags & IOMAP_F_BUFFER_HEAD) {
-		ret = block_write_end(NULL, inode->i_mapping, pos, len, copied,
-				page, NULL);
+		ret = block_write_end(NULL, iter->inode->i_mapping, pos, len,
+				copied, page, NULL);
 	} else {
-		ret = __iomap_write_end(inode, pos, len, copied, page);
+		ret = __iomap_write_end(iter->inode, pos, len, copied, page);
 	}
 
 	/*
@@ -699,26 +701,24 @@ static size_t iomap_write_end(struct inode *inode, loff_t pos, size_t len,
 	 * preferably after I/O completion so that no stale data is exposed.
 	 */
 	if (pos + ret > old_size) {
-		i_size_write(inode, pos + ret);
-		iomap->flags |= IOMAP_F_SIZE_CHANGED;
+		i_size_write(iter->inode, pos + ret);
+		iter->iomap.flags |= IOMAP_F_SIZE_CHANGED;
 	}
 	unlock_page(page);
 
 	if (old_size < pos)
-		pagecache_isize_extended(inode, old_size, pos);
+		pagecache_isize_extended(iter->inode, old_size, pos);
 	if (page_ops && page_ops->page_done)
-		page_ops->page_done(inode, pos, ret, page);
+		page_ops->page_done(iter->inode, pos, ret, page);
 	put_page(page);
 
 	if (ret < len)
-		iomap_write_failed(inode, pos, len);
+		iomap_write_failed(iter->inode, pos, len);
 	return ret;
 }
 
 static loff_t iomap_write_iter(struct iomap_iter *iter, struct iov_iter *i)
 {
-	struct iomap *srcmap = iomap_iter_srcmap(iter);
-	struct iomap *iomap = &iter->iomap;
 	loff_t length = iomap_length(iter);
 	loff_t pos = iter->pos;
 	ssize_t written = 0;
@@ -748,8 +748,7 @@ static loff_t iomap_write_iter(struct iomap_iter *iter, struct iov_iter *i)
 			break;
 		}
 
-		status = iomap_write_begin(iter->inode, pos, bytes, 0, &page,
-					   iomap, srcmap);
+		status = iomap_write_begin(iter, pos, bytes, 0, &page);
 		if (unlikely(status))
 			break;
 
@@ -758,8 +757,7 @@ static loff_t iomap_write_iter(struct iomap_iter *iter, struct iov_iter *i)
 
 		copied = copy_page_from_iter_atomic(page, offset, bytes, i);
 
-		status = iomap_write_end(iter->inode, pos, bytes, copied, page,
-					 iomap, srcmap);
+		status = iomap_write_end(iter, pos, bytes, copied, page);
 
 		if (unlikely(copied != status))
 			iov_iter_revert(i, copied - status);
@@ -827,13 +825,12 @@ static loff_t iomap_unshare_iter(struct iomap_iter *iter)
 		unsigned long bytes = min_t(loff_t, PAGE_SIZE - offset, length);
 		struct page *page;
 
-		status = iomap_write_begin(iter->inode, pos, bytes,
-				IOMAP_WRITE_F_UNSHARE, &page, iomap, srcmap);
+		status = iomap_write_begin(iter, pos, bytes,
+				IOMAP_WRITE_F_UNSHARE, &page);
 		if (unlikely(status))
 			return status;
 
-		status = iomap_write_end(iter->inode, pos, bytes, bytes, page, iomap,
-				srcmap);
+		status = iomap_write_end(iter, pos, bytes, bytes, page);
 		if (WARN_ON_ONCE(status == 0))
 			return -EIO;
 
@@ -867,22 +864,21 @@ iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
 }
 EXPORT_SYMBOL_GPL(iomap_file_unshare);
 
-static s64 iomap_zero(struct inode *inode, loff_t pos, u64 length,
-		struct iomap *iomap, struct iomap *srcmap)
+static s64 __iomap_zero_iter(struct iomap_iter *iter, loff_t pos, u64 length)
 {
 	struct page *page;
 	int status;
 	unsigned offset = offset_in_page(pos);
 	unsigned bytes = min_t(u64, PAGE_SIZE - offset, length);
 
-	status = iomap_write_begin(inode, pos, bytes, 0, &page, iomap, srcmap);
+	status = iomap_write_begin(iter, pos, bytes, 0, &page);
 	if (status)
 		return status;
 
 	zero_user(page, offset, bytes);
 	mark_page_accessed(page);
 
-	return iomap_write_end(inode, pos, bytes, bytes, page, iomap, srcmap);
+	return iomap_write_end(iter, pos, bytes, bytes, page);
 }
 
 static loff_t iomap_zero_iter(struct iomap_iter *iter, bool *did_zero)
@@ -903,8 +899,7 @@ static loff_t iomap_zero_iter(struct iomap_iter *iter, bool *did_zero)
 		if (IS_DAX(iter->inode))
 			bytes = dax_iomap_zero(pos, length, iomap);
 		else
-			bytes = iomap_zero(iter->inode, pos, length, iomap,
-					   srcmap);
+			bytes = __iomap_zero_iter(iter, pos, length);
 		if (bytes < 0)
 			return bytes;
 
-- 
2.30.2

