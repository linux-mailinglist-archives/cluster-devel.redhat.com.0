Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DB7EA3CD229
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 12:47:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-vV-rcGpwNy-Mq4zwbEZSvA-1; Mon, 19 Jul 2021 06:47:17 -0400
X-MC-Unique: vV-rcGpwNy-Mq4zwbEZSvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96B62362F8;
	Mon, 19 Jul 2021 10:47:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 879C75D9F0;
	Mon, 19 Jul 2021 10:47:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 740E41809C9A;
	Mon, 19 Jul 2021 10:47:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JAlDga007454 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 06:47:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B5F0D202A96A; Mon, 19 Jul 2021 10:47:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1D992023193
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 10:47:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99E8618A6589
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 10:47:13 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-527-U4RwR0TuNYCkA-90COp0RQ-1; Mon, 19 Jul 2021 06:47:10 -0400
X-MC-Unique: U4RwR0TuNYCkA-90COp0RQ-1
Received: from [2001:4bb8:193:7660:d2a4:8d57:2e55:21d0] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5QkV-006kzJ-4k; Mon, 19 Jul 2021 10:44:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon, 19 Jul 2021 12:35:02 +0200
Message-Id: <20210719103520.495450-10-hch@lst.de>
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
Subject: [Cluster-devel] [PATCH 09/27] iomap: switch readahead and readpage
	to use iomap_iter
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Switch the page cache read functions to use iomap_iter instead of
iomap_apply.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/buffered-io.c | 79 +++++++++++++++++++-----------------------
 1 file changed, 36 insertions(+), 43 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 8c26cf7cbd72b0..3b18cafa72bec6 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -234,11 +234,12 @@ static inline bool iomap_block_needs_zeroing(struct inode *inode,
 		pos >= i_size_read(inode);
 }
 
-static loff_t
-iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
-		struct iomap *iomap, struct iomap *srcmap)
+static loff_t iomap_readpage_iter(struct iomap_iter *iter,
+		struct iomap_readpage_ctx *ctx, loff_t offset)
 {
-	struct iomap_readpage_ctx *ctx = data;
+	struct iomap *iomap = &iter->iomap;
+	loff_t pos = iter->pos + offset;
+	loff_t length = iomap_length(iter) - offset;
 	struct page *page = ctx->cur_page;
 	struct iomap_page *iop;
 	bool same_page = false, is_contig = false;
@@ -248,17 +249,17 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 
 	if (iomap->type == IOMAP_INLINE) {
 		WARN_ON_ONCE(pos);
-		iomap_read_inline_data(inode, page, iomap);
+		iomap_read_inline_data(iter->inode, page, iomap);
 		return PAGE_SIZE;
 	}
 
 	/* zero post-eof blocks as the page may be mapped */
-	iop = iomap_page_create(inode, page);
-	iomap_adjust_read_range(inode, iop, &pos, length, &poff, &plen);
+	iop = iomap_page_create(iter->inode, page);
+	iomap_adjust_read_range(iter->inode, iop, &pos, length, &poff, &plen);
 	if (plen == 0)
 		goto done;
 
-	if (iomap_block_needs_zeroing(inode, iomap, pos)) {
+	if (iomap_block_needs_zeroing(iter->inode, iomap, pos)) {
 		zero_user(page, poff, plen);
 		iomap_set_range_uptodate(page, poff, plen);
 		goto done;
@@ -317,23 +318,23 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 int
 iomap_readpage(struct page *page, const struct iomap_ops *ops)
 {
-	struct iomap_readpage_ctx ctx = { .cur_page = page };
-	struct inode *inode = page->mapping->host;
-	unsigned poff;
-	loff_t ret;
+	struct iomap_iter iter = {
+		.inode		= page->mapping->host,
+		.pos		= page_offset(page),
+		.len		= PAGE_SIZE,
+	};
+	struct iomap_readpage_ctx ctx = {
+		.cur_page	= page,
+	};
+	int ret;
 
 	trace_iomap_readpage(page->mapping->host, 1);
 
-	for (poff = 0; poff < PAGE_SIZE; poff += ret) {
-		ret = iomap_apply(inode, page_offset(page) + poff,
-				PAGE_SIZE - poff, 0, ops, &ctx,
-				iomap_readpage_actor);
-		if (ret <= 0) {
-			WARN_ON_ONCE(ret == 0);
-			SetPageError(page);
-			break;
-		}
-	}
+	while ((ret = iomap_iter(&iter, ops)) > 0)
+		iter.processed = iomap_readpage_iter(&iter, &ctx, 0);
+
+	if (ret < 0)
+		SetPageError(page);
 
 	if (ctx.bio) {
 		submit_bio(ctx.bio);
@@ -352,15 +353,14 @@ iomap_readpage(struct page *page, const struct iomap_ops *ops)
 }
 EXPORT_SYMBOL_GPL(iomap_readpage);
 
-static loff_t
-iomap_readahead_actor(struct inode *inode, loff_t pos, loff_t length,
-		void *data, struct iomap *iomap, struct iomap *srcmap)
+static loff_t iomap_readahead_iter(struct iomap_iter *iter,
+		struct iomap_readpage_ctx *ctx)
 {
-	struct iomap_readpage_ctx *ctx = data;
+	loff_t length = iomap_length(iter);
 	loff_t done, ret;
 
 	for (done = 0; done < length; done += ret) {
-		if (ctx->cur_page && offset_in_page(pos + done) == 0) {
+		if (ctx->cur_page && offset_in_page(iter->pos + done) == 0) {
 			if (!ctx->cur_page_in_bio)
 				unlock_page(ctx->cur_page);
 			put_page(ctx->cur_page);
@@ -370,8 +370,7 @@ iomap_readahead_actor(struct inode *inode, loff_t pos, loff_t length,
 			ctx->cur_page = readahead_page(ctx->rac);
 			ctx->cur_page_in_bio = false;
 		}
-		ret = iomap_readpage_actor(inode, pos + done, length - done,
-				ctx, iomap, srcmap);
+		ret = iomap_readpage_iter(iter, ctx, done);
 	}
 
 	return done;
@@ -394,25 +393,19 @@ iomap_readahead_actor(struct inode *inode, loff_t pos, loff_t length,
  */
 void iomap_readahead(struct readahead_control *rac, const struct iomap_ops *ops)
 {
-	struct inode *inode = rac->mapping->host;
-	loff_t pos = readahead_pos(rac);
-	size_t length = readahead_length(rac);
+	struct iomap_iter iter = {
+		.inode	= rac->mapping->host,
+		.pos	= readahead_pos(rac),
+		.len	= readahead_length(rac),
+	};
 	struct iomap_readpage_ctx ctx = {
 		.rac	= rac,
 	};
 
-	trace_iomap_readahead(inode, readahead_count(rac));
+	trace_iomap_readahead(rac->mapping->host, readahead_count(rac));
 
-	while (length > 0) {
-		ssize_t ret = iomap_apply(inode, pos, length, 0, ops,
-				&ctx, iomap_readahead_actor);
-		if (ret <= 0) {
-			WARN_ON_ONCE(ret == 0);
-			break;
-		}
-		pos += ret;
-		length -= ret;
-	}
+	while (iomap_iter(&iter, ops) > 0)
+		iter.processed = iomap_readahead_iter(&iter, &ctx);
 
 	if (ctx.bio)
 		submit_bio(ctx.bio);
-- 
2.30.2

