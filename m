Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1C1661898
	for <lists+cluster-devel@lfdr.de>; Sun,  8 Jan 2023 20:40:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673206845;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jXcUsgijX8a01pme6reNRRyWGuiUaJCZZfbmlAHU5B8=;
	b=PKjAVGnqU/jL/0W+uti8Lq9Yb91m89aCCS1Z2OvJ41eWbQ4IAWsdQcIYzsz6uo6WXe12Nb
	YCwfGfxRh0QPg15fy8ir1cYpaeSr3Zs5/doA6z8Vqt9hOiqqEx8yeOhquV4bIjMBu8dFGy
	VczM0Ld/yERSZw6p/eMmJHEhTu5g8R8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-3evGoHvaMBeWPFUXkkK3Bg-1; Sun, 08 Jan 2023 14:40:42 -0500
X-MC-Unique: 3evGoHvaMBeWPFUXkkK3Bg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17CA129AB442;
	Sun,  8 Jan 2023 19:40:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D1D64085720;
	Sun,  8 Jan 2023 19:40:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8578D19459CE;
	Sun,  8 Jan 2023 19:40:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 05CA71946588 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  8 Jan 2023 19:40:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BF667492B08; Sun,  8 Jan 2023 19:40:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-3.brq.redhat.com [10.40.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62B35492B06;
 Sun,  8 Jan 2023 19:40:38 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Sun,  8 Jan 2023 20:40:25 +0100
Message-Id: <20230108194034.1444764-2-agruenba@redhat.com>
In-Reply-To: <20230108194034.1444764-1-agruenba@redhat.com>
References: <20230108194034.1444764-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [RFC v6 01/10] iomap: Add __iomap_put_folio helper
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add an __iomap_put_folio() helper to encapsulate unlocking the folio,
calling ->page_done(), and putting the folio.  Use the new helper in
iomap_write_begin() and iomap_write_end().

This effectively doesn't change the way the code works, but prepares for
successive improvements.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/buffered-io.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 356193e44cf0..c045689b6af8 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -575,6 +575,19 @@ static int __iomap_write_begin(const struct iomap_iter *iter, loff_t pos,
 	return 0;
 }
 
+static void __iomap_put_folio(struct iomap_iter *iter, loff_t pos, size_t ret,
+		struct folio *folio)
+{
+	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
+
+	if (folio)
+		folio_unlock(folio);
+	if (page_ops && page_ops->page_done)
+		page_ops->page_done(iter->inode, pos, ret, &folio->page);
+	if (folio)
+		folio_put(folio);
+}
+
 static int iomap_write_begin_inline(const struct iomap_iter *iter,
 		struct folio *folio)
 {
@@ -616,7 +629,8 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 			fgp, mapping_gfp_mask(iter->inode->i_mapping));
 	if (!folio) {
 		status = (iter->flags & IOMAP_NOWAIT) ? -EAGAIN : -ENOMEM;
-		goto out_no_page;
+		__iomap_put_folio(iter, pos, 0, NULL);
+		return status;
 	}
 
 	/*
@@ -656,13 +670,9 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 	return 0;
 
 out_unlock:
-	folio_unlock(folio);
-	folio_put(folio);
+	__iomap_put_folio(iter, pos, 0, folio);
 	iomap_write_failed(iter->inode, pos, len);
 
-out_no_page:
-	if (page_ops && page_ops->page_done)
-		page_ops->page_done(iter->inode, pos, 0, NULL);
 	return status;
 }
 
@@ -712,7 +722,6 @@ static size_t iomap_write_end_inline(const struct iomap_iter *iter,
 static size_t iomap_write_end(struct iomap_iter *iter, loff_t pos, size_t len,
 		size_t copied, struct folio *folio)
 {
-	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
 	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	loff_t old_size = iter->inode->i_size;
 	size_t ret;
@@ -735,14 +744,10 @@ static size_t iomap_write_end(struct iomap_iter *iter, loff_t pos, size_t len,
 		i_size_write(iter->inode, pos + ret);
 		iter->iomap.flags |= IOMAP_F_SIZE_CHANGED;
 	}
-	folio_unlock(folio);
+	__iomap_put_folio(iter, pos, ret, folio);
 
 	if (old_size < pos)
 		pagecache_isize_extended(iter->inode, old_size, pos);
-	if (page_ops && page_ops->page_done)
-		page_ops->page_done(iter->inode, pos, ret, &folio->page);
-	folio_put(folio);
-
 	if (ret < len)
 		iomap_write_failed(iter->inode, pos + ret, len - ret);
 	return ret;
-- 
2.38.1

