Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F4E63F4C4
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Dec 2022 17:06:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669910813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CBMmFUoA32jzTS7Gy+irsuClkcPeXOU5teiNIV6s59w=;
	b=WTZBvD+GOzPASlOYqaPYKyFORG9g9y6qR0HIBzTab0W/RaI/TwK7yl71rrIElCOToh4Mat
	4kxGKdMzXR9AaA7AcG45Yxgw/OUDqU5Dg7jbdT9ua5uoD422CWJwO8W4TykAJ2Wbu00+wh
	Na9eCV77DgETp4lyS8S6jzenwZdARV8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-L2xQmmwXNUay27549_hvag-1; Thu, 01 Dec 2022 11:06:42 -0500
X-MC-Unique: L2xQmmwXNUay27549_hvag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA40D101A528;
	Thu,  1 Dec 2022 16:06:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AEC526352E;
	Thu,  1 Dec 2022 16:06:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5DDC11946A43;
	Thu,  1 Dec 2022 16:06:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DCBDE19465B5 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Dec 2022 16:06:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CC07E111E3FF; Thu,  1 Dec 2022 16:06:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-141.brq.redhat.com [10.40.192.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F079A111E3FA;
 Thu,  1 Dec 2022 16:06:24 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Thu,  1 Dec 2022 17:06:18 +0100
Message-Id: <20221201160619.1247788-3-agruenba@redhat.com>
In-Reply-To: <20221201160619.1247788-1-agruenba@redhat.com>
References: <20221201160619.1247788-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [RFC 2/3] iomap: Turn iomap_page_ops into
 iomap_folio_ops
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Rename the iomap page_ops into folio_ops, and rename the operations
accordingly.  Move looking up the folio into ->folio_prepare(), and
unlocking and putting the folio into ->folio_done().  We'll need the
added flexibility in gfs2.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c         | 40 +++++++++++++++++++++++++++++-----------
 fs/iomap/buffered-io.c | 37 +++++++++++++++++++------------------
 include/linux/iomap.h  | 24 ++++++++++++------------
 3 files changed, 60 insertions(+), 41 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 3bdb2c668a71..18dcaa95408e 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -959,36 +959,54 @@ static int __gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
 	goto out;
 }
 
-static int gfs2_iomap_page_prepare(struct inode *inode, loff_t pos,
-				   unsigned len)
+static struct folio *
+gfs2_iomap_folio_prepare(struct inode *inode, unsigned fgp,
+			 loff_t pos, unsigned len)
 {
 	unsigned int blockmask = i_blocksize(inode) - 1;
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 	unsigned int blocks;
+	struct folio *folio;
+	int ret;
 
 	blocks = ((pos & blockmask) + len + blockmask) >> inode->i_blkbits;
-	return gfs2_trans_begin(sdp, RES_DINODE + blocks, 0);
+	ret = gfs2_trans_begin(sdp, RES_DINODE + blocks, 0);
+	if (ret)
+		return ERR_PTR(ret);
+
+	folio = __filemap_get_folio(inode->i_mapping, pos >> PAGE_SHIFT, fgp,
+				    mapping_gfp_mask(inode->i_mapping));
+	if (!folio)
+		gfs2_trans_end(sdp);
+
+	return folio;
 }
 
-static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
-				 unsigned copied, struct page *page)
+static void
+gfs2_iomap_folio_done(struct inode *inode, struct folio *folio,
+		      loff_t pos, unsigned copied)
 {
 	struct gfs2_trans *tr = current->journal_info;
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 
-	if (page && !gfs2_is_stuffed(ip))
-		gfs2_page_add_databufs(ip, page, offset_in_page(pos), copied);
+	folio_unlock(folio);
+
+	if (!gfs2_is_stuffed(ip))
+		gfs2_page_add_databufs(ip, &folio->page, offset_in_page(pos),
+				       copied);
 
 	if (tr->tr_num_buf_new)
 		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
 
 	gfs2_trans_end(sdp);
+
+	folio_put(folio);
 }
 
-static const struct iomap_page_ops gfs2_iomap_page_ops = {
-	.page_prepare = gfs2_iomap_page_prepare,
-	.page_done = gfs2_iomap_page_done,
+static const struct iomap_folio_ops gfs2_iomap_folio_ops = {
+	.folio_prepare = gfs2_iomap_folio_prepare,
+	.folio_done = gfs2_iomap_folio_done,
 };
 
 static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
@@ -1064,7 +1082,7 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
 	}
 
 	if (gfs2_is_stuffed(ip) || gfs2_is_jdata(ip))
-		iomap->page_ops = &gfs2_iomap_page_ops;
+		iomap->folio_ops = &gfs2_iomap_folio_ops;
 	return 0;
 
 out_trans_end:
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 5e751125e35e..9f1656f3df17 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -587,7 +587,7 @@ static int iomap_write_begin_inline(const struct iomap_iter *iter,
 static int iomap_write_begin(const struct iomap_iter *iter, loff_t pos,
 		size_t len, struct folio **foliop)
 {
-	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
+	const struct iomap_folio_ops *folio_ops = iter->iomap.folio_ops;
 	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	struct folio *folio;
 	unsigned fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_STABLE | FGP_NOFS;
@@ -606,17 +606,18 @@ static int iomap_write_begin(const struct iomap_iter *iter, loff_t pos,
 	if (!mapping_large_folio_support(iter->inode->i_mapping))
 		len = min_t(size_t, len, PAGE_SIZE - offset_in_page(pos));
 
-	if (page_ops && page_ops->page_prepare) {
-		status = page_ops->page_prepare(iter->inode, pos, len);
-		if (status)
-			return status;
+	if (folio_ops && folio_ops->folio_prepare) {
+		folio = folio_ops->folio_prepare(iter->inode, fgp, pos, len);
+	} else {
+		folio = __filemap_get_folio(iter->inode->i_mapping,
+				pos >> PAGE_SHIFT, fgp,
+				mapping_gfp_mask(iter->inode->i_mapping));
 	}
-
-	folio = __filemap_get_folio(iter->inode->i_mapping, pos >> PAGE_SHIFT,
-			fgp, mapping_gfp_mask(iter->inode->i_mapping));
-	if (!folio) {
-		status = (iter->flags & IOMAP_NOWAIT) ? -EAGAIN : -ENOMEM;
-		goto out_no_page;
+	if (IS_ERR_OR_NULL(folio)) {
+		status = PTR_ERR(folio);
+		if (folio == NULL)
+			status = (iter->flags & IOMAP_NOWAIT) ? -EAGAIN : -ENOMEM;
+		return status;
 	}
 	if (pos + len > folio_pos(folio) + folio_size(folio))
 		len = folio_pos(folio) + folio_size(folio) - pos;
@@ -635,13 +636,13 @@ static int iomap_write_begin(const struct iomap_iter *iter, loff_t pos,
 	return 0;
 
 out_unlock:
-	folio_unlock(folio);
-	folio_put(folio);
+	if (folio_ops && folio_ops->folio_done) {
+		folio_ops->folio_done(iter->inode, folio, pos, 0);
+	} else {
+		folio_unlock(folio);
+		folio_put(folio);
+	}
 	iomap_write_failed(iter->inode, pos, len);
-
-out_no_page:
-	if (page_ops && page_ops->page_done)
-		page_ops->page_done(iter->inode, pos, 0, NULL);
 	return status;
 }
 
@@ -691,7 +692,7 @@ static size_t iomap_write_end_inline(const struct iomap_iter *iter,
 static size_t iomap_write_end(struct iomap_iter *iter, loff_t pos, size_t len,
 		size_t copied, struct folio *folio)
 {
-	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
+	const struct iomap_folio_ops *folio_ops = iter->iomap.folio_ops;
 	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	loff_t old_size = iter->inode->i_size;
 	size_t ret;
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 238a03087e17..9d3a6ad222cc 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -76,7 +76,7 @@ struct vm_fault;
  */
 #define IOMAP_NULL_ADDR -1ULL	/* addr is not valid */
 
-struct iomap_page_ops;
+struct iomap_folio_ops;
 
 struct iomap {
 	u64			addr; /* disk offset of mapping, bytes */
@@ -88,7 +88,7 @@ struct iomap {
 	struct dax_device	*dax_dev; /* dax_dev for dax operations */
 	void			*inline_data;
 	void			*private; /* filesystem private */
-	const struct iomap_page_ops *page_ops;
+	const struct iomap_folio_ops *folio_ops;
 };
 
 static inline sector_t iomap_sector(const struct iomap *iomap, loff_t pos)
@@ -115,19 +115,19 @@ static inline bool iomap_inline_data_valid(const struct iomap *iomap)
 }
 
 /*
- * When a filesystem sets page_ops in an iomap mapping it returns, page_prepare
- * and page_done will be called for each page written to.  This only applies to
- * buffered writes as unbuffered writes will not typically have pages
+ * When a filesystem sets folio_ops in an iomap mapping it returns, folio_prepare
+ * and folio_done will be called for each folio written to.  This only applies to
+ * buffered writes as unbuffered writes will not typically have folios
  * associated with them.
  *
- * When page_prepare succeeds, page_done will always be called to do any
- * cleanup work necessary.  In that page_done call, @page will be NULL if the
- * associated page could not be obtained.
+ * When folio_prepare succeeds, folio_done will always be called to do any
+ * cleanup work necessary.
  */
-struct iomap_page_ops {
-	int (*page_prepare)(struct inode *inode, loff_t pos, unsigned len);
-	void (*page_done)(struct inode *inode, loff_t pos, unsigned copied,
-			struct page *page);
+struct iomap_folio_ops {
+	struct folio *(*folio_prepare)(struct inode *inode, unsigned fgp,
+				       loff_t pos, unsigned len);
+	void (*folio_done)(struct inode *inode, struct folio *folio,
+			   loff_t pos, unsigned copied);
 };
 
 /*
-- 
2.38.1

