Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7792C66189D
	for <lists+cluster-devel@lfdr.de>; Sun,  8 Jan 2023 20:40:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673206855;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VkAO5mFJ218kYx2y/3xUiDVAsyN3pxE7gJvNvvmhAxQ=;
	b=HFRAL6Mn8aww0YFkjmGppwEpE1P31AexSfXBY7Tzi7wMpwsVcpbJlrzx4SU9yqPqIH+d1a
	w1JdDmrqR7SYrBD5i8CZoZ1Gq72ErCrUo7MgRZr5pQ1/nyVkNouVKlMol5Jx6Q3U8+GOGj
	hI3n2oUWLIcLIwhIzpIt4QgerUdFCDA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-AYTTKEizNbGiVjySrLCbTQ-1; Sun, 08 Jan 2023 14:40:51 -0500
X-MC-Unique: AYTTKEizNbGiVjySrLCbTQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDA07811E6E;
	Sun,  8 Jan 2023 19:40:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B31D8492B00;
	Sun,  8 Jan 2023 19:40:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 88B831947062;
	Sun,  8 Jan 2023 19:40:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 29AE81946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  8 Jan 2023 19:40:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F3A08492B08; Sun,  8 Jan 2023 19:40:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-3.brq.redhat.com [10.40.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D9F9492B06;
 Sun,  8 Jan 2023 19:40:47 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Sun,  8 Jan 2023 20:40:28 +0100
Message-Id: <20230108194034.1444764-5-agruenba@redhat.com>
In-Reply-To: <20230108194034.1444764-1-agruenba@redhat.com>
References: <20230108194034.1444764-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [RFC v6 04/10] iomap: Add iomap_get_folio helper
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
Cc: cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add an iomap_get_folio() helper that gets a folio reference based on
an iomap iterator and an offset into the address space.  Use it in
iomap_write_begin().

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/buffered-io.c | 39 ++++++++++++++++++++++++++++++---------
 include/linux/iomap.h  |  1 +
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index d4b444e44861..de4a8e5f721a 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -457,6 +457,33 @@ bool iomap_is_partially_uptodate(struct folio *folio, size_t from, size_t count)
 }
 EXPORT_SYMBOL_GPL(iomap_is_partially_uptodate);
 
+/**
+ * iomap_get_folio - get a folio reference for writing
+ * @iter: iteration structure
+ * @pos: start offset of write
+ *
+ * Returns a locked reference to the folio at @pos, or an error pointer if the
+ * folio could not be obtained.
+ */
+struct folio *iomap_get_folio(struct iomap_iter *iter, loff_t pos)
+{
+	unsigned fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_STABLE | FGP_NOFS;
+	struct folio *folio;
+
+	if (iter->flags & IOMAP_NOWAIT)
+		fgp |= FGP_NOWAIT;
+
+	folio = __filemap_get_folio(iter->inode->i_mapping, pos >> PAGE_SHIFT,
+			fgp, mapping_gfp_mask(iter->inode->i_mapping));
+	if (folio)
+		return folio;
+
+	if (iter->flags & IOMAP_NOWAIT)
+		return ERR_PTR(-EAGAIN);
+	return ERR_PTR(-ENOMEM);
+}
+EXPORT_SYMBOL_GPL(iomap_get_folio);
+
 bool iomap_release_folio(struct folio *folio, gfp_t gfp_flags)
 {
 	trace_iomap_release_folio(folio->mapping->host, folio_pos(folio),
@@ -603,12 +630,8 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
 	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	struct folio *folio;
-	unsigned fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_STABLE | FGP_NOFS;
 	int status = 0;
 
-	if (iter->flags & IOMAP_NOWAIT)
-		fgp |= FGP_NOWAIT;
-
 	BUG_ON(pos + len > iter->iomap.offset + iter->iomap.length);
 	if (srcmap != &iter->iomap)
 		BUG_ON(pos + len > srcmap->offset + srcmap->length);
@@ -625,12 +648,10 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 			return status;
 	}
 
-	folio = __filemap_get_folio(iter->inode->i_mapping, pos >> PAGE_SHIFT,
-			fgp, mapping_gfp_mask(iter->inode->i_mapping));
-	if (!folio) {
-		status = (iter->flags & IOMAP_NOWAIT) ? -EAGAIN : -ENOMEM;
+	folio = iomap_get_folio(iter, pos);
+	if (IS_ERR(folio)) {
 		__iomap_put_folio(iter, pos, 0, NULL);
-		return status;
+		return PTR_ERR(folio);
 	}
 
 	/*
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index ecf815b34d51..188d14e786a4 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -261,6 +261,7 @@ int iomap_file_buffered_write_punch_delalloc(struct inode *inode,
 int iomap_read_folio(struct folio *folio, const struct iomap_ops *ops);
 void iomap_readahead(struct readahead_control *, const struct iomap_ops *ops);
 bool iomap_is_partially_uptodate(struct folio *, size_t from, size_t count);
+struct folio *iomap_get_folio(struct iomap_iter *iter, loff_t pos);
 bool iomap_release_folio(struct folio *folio, gfp_t gfp_flags);
 void iomap_invalidate_folio(struct folio *folio, size_t offset, size_t len);
 int iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
-- 
2.38.1

