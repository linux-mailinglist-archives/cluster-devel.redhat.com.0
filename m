Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3A964ED72
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Dec 2022 16:06:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671203216;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=olYz7KsF9MP6VTKDZWx6VuyJBrZtR85wJBwS21HUX9Q=;
	b=gSUd37vrsdqGAySFnCglOP+PZUV6R/IW7qLa4JoJNe1PNn3clinspxFQjaTFDLhXH+1i2y
	fQbLJyD1w2mFXBbNbg+e+gFs9PWW2rJiFi9y9P3W1ePdzjfWNM2NxTIK2eYNV/nGmWwudH
	ZS/B7eDKUg7ZxdALyyI0te+VMxy5tCc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-HNA6r7qRPUaZS-X3A4TBbQ-1; Fri, 16 Dec 2022 10:06:50 -0500
X-MC-Unique: HNA6r7qRPUaZS-X3A4TBbQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 981A71805666;
	Fri, 16 Dec 2022 15:06:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E39CC15BA0;
	Fri, 16 Dec 2022 15:06:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 71FEB1946A6B;
	Fri, 16 Dec 2022 15:06:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 554CD1946A70 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 16 Dec 2022 15:06:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 785C514171C1; Fri, 16 Dec 2022 15:06:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-182.brq.redhat.com [10.40.192.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8884614171BE;
 Fri, 16 Dec 2022 15:06:45 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Fri, 16 Dec 2022 16:06:26 +0100
Message-Id: <20221216150626.670312-8-agruenba@redhat.com>
In-Reply-To: <20221216150626.670312-1-agruenba@redhat.com>
References: <20221216150626.670312-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [RFC v3 7/7] iomap: Rename page_ops to folio_ops
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
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The operations in struct page_ops all operate on folios, so rename
struct page_ops to struct folio_ops, ->page_prepare() to
->folio_prepare(), and ->page_done() to ->folio_done().

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c         | 16 ++++++++--------
 fs/iomap/buffered-io.c | 12 ++++++------
 fs/xfs/xfs_iomap.c     |  8 ++++----
 include/linux/iomap.h  | 22 +++++++++++-----------
 4 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index cd5984d3ba50..ba8627ddc2bc 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -960,7 +960,7 @@ static int __gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
 }
 
 static struct folio *
-gfs2_iomap_page_prepare(struct iomap_iter *iter, loff_t pos, unsigned len)
+gfs2_iomap_folio_prepare(struct iomap_iter *iter, loff_t pos, unsigned len)
 {
 	struct inode *inode = iter->inode;
 	unsigned int blockmask = i_blocksize(inode) - 1;
@@ -980,8 +980,8 @@ gfs2_iomap_page_prepare(struct iomap_iter *iter, loff_t pos, unsigned len)
 	return folio;
 }
 
-static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
-				 unsigned copied, struct folio *folio)
+static void gfs2_iomap_folio_done(struct inode *inode, loff_t pos,
+				  unsigned copied, struct folio *folio)
 {
 	struct gfs2_trans *tr = current->journal_info;
 	struct gfs2_inode *ip = GFS2_I(inode);
@@ -1005,9 +1005,9 @@ static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
 	gfs2_trans_end(sdp);
 }
 
-static const struct iomap_page_ops gfs2_iomap_page_ops = {
-	.page_prepare = gfs2_iomap_page_prepare,
-	.page_done = gfs2_iomap_page_done,
+static const struct iomap_folio_ops gfs2_iomap_folio_ops = {
+	.folio_prepare = gfs2_iomap_folio_prepare,
+	.folio_done = gfs2_iomap_folio_done,
 };
 
 static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
@@ -1083,7 +1083,7 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
 	}
 
 	if (gfs2_is_stuffed(ip) || gfs2_is_jdata(ip))
-		iomap->page_ops = &gfs2_iomap_page_ops;
+		iomap->folio_ops = &gfs2_iomap_folio_ops;
 	return 0;
 
 out_trans_end:
@@ -1299,7 +1299,7 @@ int gfs2_alloc_extent(struct inode *inode, u64 lblock, u64 *dblock,
 /*
  * NOTE: Never call gfs2_block_zero_range with an open transaction because it
  * uses iomap write to perform its actions, which begin their own transactions
- * (iomap_begin, page_prepare, etc.)
+ * (iomap_begin, folio_prepare, etc.)
  */
 static int gfs2_block_zero_range(struct inode *inode, loff_t from,
 				 unsigned int length)
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index b73ff317da21..da4570d9d1ff 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -598,10 +598,10 @@ static int __iomap_write_begin(const struct iomap_iter *iter, loff_t pos,
 static void iomap_folio_done(struct iomap_iter *iter, loff_t pos, size_t ret,
 		struct folio *folio)
 {
-	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
+	const struct iomap_folio_ops *folio_ops = iter->iomap.folio_ops;
 
-	if (page_ops && page_ops->page_done) {
-		page_ops->page_done(iter->inode, pos, ret, folio);
+	if (folio_ops && folio_ops->folio_done) {
+		folio_ops->folio_done(iter->inode, pos, ret, folio);
 	} else {
 		folio_unlock(folio);
 		folio_put(folio);
@@ -620,7 +620,7 @@ static int iomap_write_begin_inline(const struct iomap_iter *iter,
 static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 		size_t len, struct folio **foliop)
 {
-	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
+	const struct iomap_folio_ops *folio_ops = iter->iomap.folio_ops;
 	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	struct folio *folio;
 	int status;
@@ -635,8 +635,8 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 	if (!mapping_large_folio_support(iter->inode->i_mapping))
 		len = min_t(size_t, len, PAGE_SIZE - offset_in_page(pos));
 
-	if (page_ops && page_ops->page_prepare)
-		folio = page_ops->page_prepare(iter, pos, len);
+	if (folio_ops && folio_ops->folio_prepare)
+		folio = folio_ops->folio_prepare(iter, pos, len);
 	else
 		folio = iomap_folio_prepare(iter, pos);
 	if (IS_ERR_OR_NULL(folio)) {
diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
index 2248ce7be2e3..79b3f2d4c8ab 100644
--- a/fs/xfs/xfs_iomap.c
+++ b/fs/xfs/xfs_iomap.c
@@ -63,7 +63,7 @@ xfs_iomap_inode_sequence(
 }
 
 static struct folio *
-xfs_page_prepare(
+xfs_folio_prepare(
 	struct iomap_iter	*iter,
 	loff_t			pos,
 	unsigned		len)
@@ -99,8 +99,8 @@ xfs_page_prepare(
 	return folio;
 }
 
-const struct iomap_page_ops xfs_iomap_page_ops = {
-	.page_prepare		= xfs_page_prepare,
+const struct iomap_folio_ops xfs_iomap_folio_ops = {
+	.folio_prepare		= xfs_folio_prepare,
 };
 
 int
@@ -149,7 +149,7 @@ xfs_bmbt_to_iomap(
 		iomap->flags |= IOMAP_F_DIRTY;
 
 	iomap->validity_cookie = sequence_cookie;
-	iomap->page_ops = &xfs_iomap_page_ops;
+	iomap->folio_ops = &xfs_iomap_folio_ops;
 	return 0;
 }
 
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 1c8b9a04b0bb..85d360881851 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -86,7 +86,7 @@ struct vm_fault;
  */
 #define IOMAP_NULL_ADDR -1ULL	/* addr is not valid */
 
-struct iomap_page_ops;
+struct iomap_folio_ops;
 
 struct iomap {
 	u64			addr; /* disk offset of mapping, bytes */
@@ -98,7 +98,7 @@ struct iomap {
 	struct dax_device	*dax_dev; /* dax_dev for dax operations */
 	void			*inline_data;
 	void			*private; /* filesystem private */
-	const struct iomap_page_ops *page_ops;
+	const struct iomap_folio_ops *folio_ops;
 	u64			validity_cookie; /* used with .iomap_valid() */
 };
 
@@ -126,19 +126,19 @@ static inline bool iomap_inline_data_valid(const struct iomap *iomap)
 }
 
 /*
- * When a filesystem sets page_ops in an iomap mapping it returns, page_prepare
- * and page_done will be called for each page written to.  This only applies to
- * buffered writes as unbuffered writes will not typically have pages
- * associated with them.
+ * When a filesystem sets folio_ops in an iomap mapping it returns,
+ * folio_prepare and folio_done will be called for each page written to.  This
+ * only applies to buffered writes as unbuffered writes will not typically have
+ * pages associated with them.
  *
- * When page_prepare succeeds, page_done will always be called to do any
- * cleanup work necessary.  page_done is responsible for unlocking and putting
+ * When folio_prepare succeeds, folio_done will always be called to do any
+ * cleanup work necessary.  folio_done is responsible for unlocking and putting
  * @folio.
  */
-struct iomap_page_ops {
-	struct folio *(*page_prepare)(struct iomap_iter *iter, loff_t pos,
+struct iomap_folio_ops {
+	struct folio *(*folio_prepare)(struct iomap_iter *iter, loff_t pos,
 			unsigned len);
-	void (*page_done)(struct inode *inode, loff_t pos, unsigned copied,
+	void (*folio_done)(struct inode *inode, loff_t pos, unsigned copied,
 			struct folio *folio);
 };
 
-- 
2.38.1

