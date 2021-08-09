Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A0D9D3E404C
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Aug 2021 08:41:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-woRIEMl_PXSKCoiGSCeIig-1; Mon, 09 Aug 2021 02:41:07 -0400
X-MC-Unique: woRIEMl_PXSKCoiGSCeIig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99F7718C8C03;
	Mon,  9 Aug 2021 06:41:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 892811000186;
	Mon,  9 Aug 2021 06:41:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7504B180BAB1;
	Mon,  9 Aug 2021 06:41:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1796f3Tg004669 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Aug 2021 02:41:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E87A81134CBD; Mon,  9 Aug 2021 06:41:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E48061134CBB
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:40:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C64BC800B28
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:40:59 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-24-WUa6wmnlPLyfltQNsGlJxw-1; Mon, 09 Aug 2021 02:40:58 -0400
X-MC-Unique: WUa6wmnlPLyfltQNsGlJxw-1
Received: from [2a02:1205:5023:1f80:c068:bd3d:78b3:7d37] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCyvh-00AiMG-5b; Mon, 09 Aug 2021 06:38:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon,  9 Aug 2021 08:12:44 +0200
Message-Id: <20210809061244.1196573-31-hch@lst.de>
In-Reply-To: <20210809061244.1196573-1-hch@lst.de>
References: <20210809061244.1196573-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH 30/30] iomap: constify iomap_iter_srcmap
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/iomap/buffered-io.c | 38 +++++++++++++++++++-------------------
 include/linux/iomap.h  |  2 +-
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index ef902cc89accca..71b4806266d783 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -205,10 +205,10 @@ struct iomap_readpage_ctx {
 	struct readahead_control *rac;
 };
 
-static loff_t iomap_read_inline_data(struct iomap_iter *iter,
+static loff_t iomap_read_inline_data(const struct iomap_iter *iter,
 		struct page *page)
 {
-	struct iomap *iomap = iomap_iter_srcmap(iter);
+	const struct iomap *iomap = iomap_iter_srcmap(iter);
 	size_t size = i_size_read(iter->inode) - iomap->offset;
 	size_t poff = offset_in_page(iomap->offset);
 	void *addr;
@@ -234,20 +234,20 @@ static loff_t iomap_read_inline_data(struct iomap_iter *iter,
 	return PAGE_SIZE - poff;
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
@@ -352,7 +352,7 @@ iomap_readpage(struct page *page, const struct iomap_ops *ops)
 }
 EXPORT_SYMBOL_GPL(iomap_readpage);
 
-static loff_t iomap_readahead_iter(struct iomap_iter *iter,
+static loff_t iomap_readahead_iter(const struct iomap_iter *iter,
 		struct iomap_readpage_ctx *ctx)
 {
 	loff_t length = iomap_length(iter);
@@ -536,10 +536,10 @@ iomap_read_page_sync(loff_t block_start, struct page *page, unsigned poff,
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
@@ -577,7 +577,7 @@ static int __iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 	return 0;
 }
 
-static int iomap_write_begin_inline(struct iomap_iter *iter,
+static int iomap_write_begin_inline(const struct iomap_iter *iter,
 		struct page *page)
 {
 	int ret;
@@ -591,11 +591,11 @@ static int iomap_write_begin_inline(struct iomap_iter *iter,
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
 
@@ -666,10 +666,10 @@ static size_t __iomap_write_end(struct inode *inode, loff_t pos, size_t len,
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
@@ -689,7 +689,7 @@ static size_t iomap_write_end(struct iomap_iter *iter, loff_t pos, size_t len,
 		size_t copied, struct page *page)
 {
 	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
-	struct iomap *srcmap = iomap_iter_srcmap(iter);
+	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	loff_t old_size = iter->inode->i_size;
 	size_t ret;
 
@@ -814,7 +814,7 @@ EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
 static loff_t iomap_unshare_iter(struct iomap_iter *iter)
 {
 	struct iomap *iomap = &iter->iomap;
-	struct iomap *srcmap = iomap_iter_srcmap(iter);
+	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	loff_t pos = iter->pos;
 	loff_t length = iomap_length(iter);
 	long status = 0;
@@ -890,7 +890,7 @@ static s64 __iomap_zero_iter(struct iomap_iter *iter, loff_t pos, u64 length)
 static loff_t iomap_zero_iter(struct iomap_iter *iter, bool *did_zero)
 {
 	struct iomap *iomap = &iter->iomap;
-	struct iomap *srcmap = iomap_iter_srcmap(iter);
+	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	loff_t pos = iter->pos;
 	loff_t length = iomap_length(iter);
 	loff_t written = 0;
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index f53c40e9d799fb..24f8489583ca76 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -211,7 +211,7 @@ static inline u64 iomap_length(const struct iomap_iter *iter)
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

