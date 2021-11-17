Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D50B454506
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Nov 2021 11:32:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637145143;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MZpcj2Z8HdqZb1jgsG7GAEGnobLmuYt+4j5fMfR9g4Q=;
	b=dKP54WjLrqd5ZVL9YHP0jM/bX8CylaDZL00IllhIwweqREWP3GPPtFqo6RydBbw+zsPbCY
	CuS8DokHPPR1FSh1pyjft55Kmv0uQAqtl0CDl13PfjY+YHje0WT5tKpE+fuw3bLvnh7ZGE
	G+Dc6zHmZvQuWd/uz2F4O0cbxV0clj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-c6lO1X70P9irKpGfi4uoug-1; Wed, 17 Nov 2021 05:32:20 -0500
X-MC-Unique: c6lO1X70P9irKpGfi4uoug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BA4210144E0;
	Wed, 17 Nov 2021 10:32:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A0575F4ED;
	Wed, 17 Nov 2021 10:32:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE0354A703;
	Wed, 17 Nov 2021 10:32:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHAWDI2012674 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 05:32:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 06C475DEFB; Wed, 17 Nov 2021 10:32:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.192.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A5C65DEFA;
	Wed, 17 Nov 2021 10:32:03 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: "Darrick J . Wong" <djwong@kernel.org>
Date: Wed, 17 Nov 2021 11:32:02 +0100
Message-Id: <20211117103202.44346-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, Christoph Hellwig <hch@lst.de>
Subject: [Cluster-devel] [PATCH] iomap: iomap_read_inline_data cleanup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Change iomap_read_inline_data to return 0 or an error code; this
simplifies the callers.  Add a description.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/buffered-io.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index fe10d8a30f6b..f1bc9a35184d 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -205,7 +205,15 @@ struct iomap_readpage_ctx {
 	struct readahead_control *rac;
 };
 
-static loff_t iomap_read_inline_data(const struct iomap_iter *iter,
+/**
+ * iomap_read_inline_data - copy inline data into the page cache
+ * @iter: iteration structure
+ * @page: page to copy to
+ *
+ * Copy the inline data in @iter into @page and zero out the rest of the page.
+ * Only a single IOMAP_INLINE extent is allowed at the end of each file.
+ */
+static int iomap_read_inline_data(const struct iomap_iter *iter,
 		struct page *page)
 {
 	const struct iomap *iomap = iomap_iter_srcmap(iter);
@@ -214,7 +222,7 @@ static loff_t iomap_read_inline_data(const struct iomap_iter *iter,
 	void *addr;
 
 	if (PageUptodate(page))
-		return PAGE_SIZE - poff;
+		return 0;
 
 	if (WARN_ON_ONCE(size > PAGE_SIZE - poff))
 		return -EIO;
@@ -231,7 +239,7 @@ static loff_t iomap_read_inline_data(const struct iomap_iter *iter,
 	memset(addr + size, 0, PAGE_SIZE - poff - size);
 	kunmap_local(addr);
 	iomap_set_range_uptodate(page, poff, PAGE_SIZE - poff);
-	return PAGE_SIZE - poff;
+	return 0;
 }
 
 static inline bool iomap_block_needs_zeroing(const struct iomap_iter *iter,
@@ -256,13 +264,8 @@ static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
 	unsigned poff, plen;
 	sector_t sector;
 
-	if (iomap->type == IOMAP_INLINE) {
-		loff_t ret = iomap_read_inline_data(iter, page);
-
-		if (ret < 0)
-			return ret;
-		return 0;
-	}
+	if (iomap->type == IOMAP_INLINE)
+		return iomap_read_inline_data(iter, page);
 
 	/* zero post-eof blocks as the page may be mapped */
 	iop = iomap_page_create(iter->inode, page);
@@ -587,15 +590,10 @@ static int __iomap_write_begin(const struct iomap_iter *iter, loff_t pos,
 static int iomap_write_begin_inline(const struct iomap_iter *iter,
 		struct page *page)
 {
-	int ret;
-
 	/* needs more work for the tailpacking case; disable for now */
 	if (WARN_ON_ONCE(iomap_iter_srcmap(iter)->offset != 0))
 		return -EIO;
-	ret = iomap_read_inline_data(iter, page);
-	if (ret < 0)
-		return ret;
-	return 0;
+	return iomap_read_inline_data(iter, page);
 }
 
 static int iomap_write_begin(const struct iomap_iter *iter, loff_t pos,
-- 
2.31.1

