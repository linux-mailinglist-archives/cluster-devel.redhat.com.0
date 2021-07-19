Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A730B3CD34C
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 13:13:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-QGxWITcyOSWzdD8tOUDQWg-1; Mon, 19 Jul 2021 07:13:06 -0400
X-MC-Unique: QGxWITcyOSWzdD8tOUDQWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1A209126B;
	Mon, 19 Jul 2021 11:13:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF88927064;
	Mon, 19 Jul 2021 11:13:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B5D41809C99;
	Mon, 19 Jul 2021 11:13:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JB7GUU008903 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 07:07:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 55D89202E4BF; Mon, 19 Jul 2021 11:07:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5130B202E4BC
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 11:07:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72731805F44
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 11:07:13 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-166-q0KIgkk6M-6ywf8_SEgK2g-1; Mon, 19 Jul 2021 07:07:10 -0400
X-MC-Unique: q0KIgkk6M-6ywf8_SEgK2g-1
Received: from [2001:4bb8:193:7660:d2a4:8d57:2e55:21d0] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5R5B-006mbq-Ek; Mon, 19 Jul 2021 11:05:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon, 19 Jul 2021 12:35:20 +0200
Message-Id: <20210719103520.495450-28-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 27/27] iomap: constify iomap_iter_srcmap
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

The srcmap returned from iomap_iter_srcmap is never modified, so mark
the iomap returned from it const and constify a lot of code that never
modifies the iomap.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/buffered-io.c | 32 ++++++++++++++++----------------
 include/linux/iomap.h  |  2 +-
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index eb5d742b5bf8b7..a2dd42f3115cfa 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -226,20 +226,20 @@ iomap_read_inline_data(struct inode *inode, struct page *page,
 	SetPageUptodate(page);
 }
 
-static inline bool iomap_block_needs_zeroing(struct iomap_iter *iter,
+static inline bool iomap_block_needs_zeroing(const struct iomap_iter *iter,
 		loff_t pos)
 {
-	struct iomap *srcmap = iomap_iter_srcmap(iter);
+	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 
 	return srcmap->type != IOMAP_MAPPED ||
 		(srcmap->flags & IOMAP_F_NEW) ||
 		pos >= i_size_read(iter->inode);
 }
 
-static loff_t iomap_readpage_iter(struct iomap_iter *iter,
+static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
 		struct iomap_readpage_ctx *ctx, loff_t offset)
 {
-	struct iomap *iomap = &iter->iomap;
+	const struct iomap *iomap = &iter->iomap;
 	loff_t pos = iter->pos + offset;
 	loff_t length = iomap_length(iter) - offset;
 	struct page *page = ctx->cur_page;
@@ -355,7 +355,7 @@ iomap_readpage(struct page *page, const struct iomap_ops *ops)
 }
 EXPORT_SYMBOL_GPL(iomap_readpage);
 
-static loff_t iomap_readahead_iter(struct iomap_iter *iter,
+static loff_t iomap_readahead_iter(const struct iomap_iter *iter,
 		struct iomap_readpage_ctx *ctx)
 {
 	loff_t length = iomap_length(iter);
@@ -539,10 +539,10 @@ iomap_read_page_sync(loff_t block_start, struct page *page, unsigned poff,
 	return submit_bio_wait(&bio);
 }
 
-static int __iomap_write_begin(struct iomap_iter *iter, loff_t pos,
+static int __iomap_write_begin(const struct iomap_iter *iter, loff_t pos,
 		unsigned len, struct page *page)
 {
-	struct iomap *srcmap = iomap_iter_srcmap(iter);
+	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	struct iomap_page *iop = iomap_page_create(iter->inode, page);
 	loff_t block_size = i_blocksize(iter->inode);
 	loff_t block_start = round_down(pos, block_size);
@@ -580,11 +580,11 @@ static int __iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 	return 0;
 }
 
-static int iomap_write_begin(struct iomap_iter *iter, loff_t pos, unsigned len,
-		struct page **pagep)
+static int iomap_write_begin(const struct iomap_iter *iter, loff_t pos,
+		unsigned len, struct page **pagep)
 {
 	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
-	struct iomap *srcmap = iomap_iter_srcmap(iter);
+	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	struct page *page;
 	int status = 0;
 
@@ -655,10 +655,10 @@ static size_t __iomap_write_end(struct inode *inode, loff_t pos, size_t len,
 	return copied;
 }
 
-static size_t iomap_write_end_inline(struct iomap_iter *iter, struct page *page,
-		loff_t pos, size_t copied)
+static size_t iomap_write_end_inline(const struct iomap_iter *iter,
+		struct page *page, loff_t pos, size_t copied)
 {
-	struct iomap *iomap = &iter->iomap;
+	const struct iomap *iomap = &iter->iomap;
 	void *addr;
 
 	WARN_ON_ONCE(!PageUptodate(page));
@@ -678,7 +678,7 @@ static size_t iomap_write_end(struct iomap_iter *iter, loff_t pos, size_t len,
 		size_t copied, struct page *page)
 {
 	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
-	struct iomap *srcmap = iomap_iter_srcmap(iter);
+	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	loff_t old_size = iter->inode->i_size;
 	size_t ret;
 
@@ -803,7 +803,7 @@ EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
 static loff_t iomap_unshare_iter(struct iomap_iter *iter)
 {
 	struct iomap *iomap = &iter->iomap;
-	struct iomap *srcmap = iomap_iter_srcmap(iter);
+	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	loff_t pos = iter->pos;
 	loff_t length = iomap_length(iter);
 	long status = 0;
@@ -879,7 +879,7 @@ static s64 __iomap_zero_iter(struct iomap_iter *iter, loff_t pos, u64 length)
 static loff_t iomap_zero_iter(struct iomap_iter *iter, bool *did_zero)
 {
 	struct iomap *iomap = &iter->iomap;
-	struct iomap *srcmap = iomap_iter_srcmap(iter);
+	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	loff_t pos = iter->pos;
 	loff_t length = iomap_length(iter);
 	loff_t written = 0;
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 719798814bdfdb..a1fb0d22efbd40 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -193,7 +193,7 @@ static inline u64 iomap_length(const struct iomap_iter *iter)
  * for a given operation, which may or may no be identical to the destination
  * map in &i->iomap.
  */
-static inline struct iomap *iomap_iter_srcmap(struct iomap_iter *i)
+static inline const struct iomap *iomap_iter_srcmap(const struct iomap_iter *i)
 {
 	if (i->srcmap.type != IOMAP_HOLE)
 		return &i->srcmap;
-- 
2.30.2

