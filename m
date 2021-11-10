Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 096FA44C03C
	for <lists+cluster-devel@lfdr.de>; Wed, 10 Nov 2021 12:40:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636544447;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mSRSfofEtoedE2yqkJZbQw0bqF5J9tr3mlk5/Zhn3oU=;
	b=JFbSSGJFbblTUC+wh8gkGu2Fm0gd3/j9kW0O7XKbRmwMgLHI6BnufNLljBGXCUvMNOzWcq
	nCoIg3VOrEVXuj+iGXvbsJ+owHc2QD3F7Ql1Q0kK7u/3JAIrPQVEppoCgMjWVHl30/1uN5
	zg5QkqTUuksIWR8RfMw5DwU2BCJWjrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-Uac5v3XuPhCD1iUHbFLc5g-1; Wed, 10 Nov 2021 06:40:44 -0500
X-MC-Unique: Uac5v3XuPhCD1iUHbFLc5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86FD419200CB;
	Wed, 10 Nov 2021 11:40:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 211C36784B;
	Wed, 10 Nov 2021 11:40:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 678561832DD2;
	Wed, 10 Nov 2021 11:40:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AABd094027957 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 10 Nov 2021 06:39:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6382919739; Wed, 10 Nov 2021 11:39:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.195.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 96D3419D9F;
	Wed, 10 Nov 2021 11:38:43 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@lst.de>, "Darrick J . Wong" <djwong@kernel.org>
Date: Wed, 10 Nov 2021 12:38:42 +0100
Message-Id: <20211110113842.517426-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, stable@vger.kernel.org
Subject: [Cluster-devel] [5.15 REGRESSION] iomap: Fix inline extent handling
	in iomap_readpage
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

When reporting IOMAP_INLINE extents, filesystems set iomap->length to
the length of iomap->inline_data.  For reading that into the page cache,
function iomap_read_inline_data copies the inline data, zeroes out the
rest of the page, and marks the entire page up-to-date.

Before commit 740499c78408 ("iomap: fix the iomap_readpage_actor return
value for inline data"), when hitting an IOMAP_INLINE extent,
iomap_readpage_actor would report having read the entire page.  Since
then, it only reports having read the inline data (iomap->length).

This will force iomap_readpage into another iteration, and the
filesystem will report an unaligned hole after the IOMAP_INLINE extent.
But iomap_readpage_actor (now iomap_readpage_iter) isn't prepared to
deal with unaligned extents, it will get things wrong on filesystems
with a block size smaller than the page size, and we'll eventually run
into the following warning in iomap_iter_advance:

  WARN_ON_ONCE(iter->processed > iomap_length(iter));

Fix that by changing iomap_readpage_iter back to report that we've read
the entire page, which avoids having to deal with unaligned extents.  To
prevent iomap from complaining about running past the end of the extent,
fix up the extent size as well.

Fixes: 740499c78408 ("iomap: fix the iomap_readpage_actor return value for inline data")
Cc: stable@vger.kernel.org # v5.15+
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/buffered-io.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 1753c26c8e76..de3fcd2522a2 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -244,10 +244,10 @@ static inline bool iomap_block_needs_zeroing(const struct iomap_iter *iter,
 		pos >= i_size_read(iter->inode);
 }
 
-static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
+static loff_t iomap_readpage_iter(struct iomap_iter *iter,
 		struct iomap_readpage_ctx *ctx, loff_t offset)
 {
-	const struct iomap *iomap = &iter->iomap;
+	struct iomap *iomap = &iter->iomap;
 	loff_t pos = iter->pos + offset;
 	loff_t length = iomap_length(iter) - offset;
 	struct page *page = ctx->cur_page;
@@ -256,8 +256,15 @@ static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
 	unsigned poff, plen;
 	sector_t sector;
 
-	if (iomap->type == IOMAP_INLINE)
-		return min(iomap_read_inline_data(iter, page), length);
+	if (iomap->type == IOMAP_INLINE) {
+		/*
+		 * The filesystem sets iomap->length to the size of the inline
+		 * data.  We're at the end of the file, so we know that the
+		 * rest of the page needs to be zeroed out.
+		 */
+		iomap->length = iomap_read_inline_data(iter, page);
+		return iomap->length;
+	}
 
 	/* zero post-eof blocks as the page may be mapped */
 	iop = iomap_page_create(iter->inode, page);
@@ -352,7 +359,7 @@ iomap_readpage(struct page *page, const struct iomap_ops *ops)
 }
 EXPORT_SYMBOL_GPL(iomap_readpage);
 
-static loff_t iomap_readahead_iter(const struct iomap_iter *iter,
+static loff_t iomap_readahead_iter(struct iomap_iter *iter,
 		struct iomap_readpage_ctx *ctx)
 {
 	loff_t length = iomap_length(iter);
-- 
2.31.1

