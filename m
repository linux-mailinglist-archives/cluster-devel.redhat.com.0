Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C4466189F
	for <lists+cluster-devel@lfdr.de>; Sun,  8 Jan 2023 20:41:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673206863;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L5KMkMa80rm5HNuuSM+y6bmm81BxzRO2A8GEgrR4WVI=;
	b=BsVRSUNUk+n3tuRu3XkD9AbDCkCjEpU7bZFk627ZD8hlZNxx5v6gvPjpqCRFapL3AaG1HS
	bPbGQHGmhUju78ykPNIRBdayncfCzF6sw+eN+fZYSrJG0h8woDTNShgV0iHcmo9odVgXy0
	cGMiaj3heDBrtBQz+EKUPmU1Pqvawis=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-sphkMM9SNeW9krX17Xv-CA-1; Sun, 08 Jan 2023 14:41:00 -0500
X-MC-Unique: sphkMM9SNeW9krX17Xv-CA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8BAA29AB448;
	Sun,  8 Jan 2023 19:40:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDF3E4085720;
	Sun,  8 Jan 2023 19:40:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A79811947062;
	Sun,  8 Jan 2023 19:40:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 500571946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  8 Jan 2023 19:40:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4511B492B08; Sun,  8 Jan 2023 19:40:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-3.brq.redhat.com [10.40.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E49DA492B06;
 Sun,  8 Jan 2023 19:40:55 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Sun,  8 Jan 2023 20:40:31 +0100
Message-Id: <20230108194034.1444764-8-agruenba@redhat.com>
In-Reply-To: <20230108194034.1444764-1-agruenba@redhat.com>
References: <20230108194034.1444764-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [RFC v6 07/10] iomap: Rename page_prepare handler
 to get_folio
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

The ->page_prepare() handler in struct iomap_page_ops is now somewhat
misnamed, so rename it to ->get_folio().

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 fs/gfs2/bmap.c         | 6 +++---
 fs/iomap/buffered-io.c | 4 ++--
 include/linux/iomap.h  | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 41349e09558b..d3adb715ac8c 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -957,7 +957,7 @@ static int __gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
 }
 
 static struct folio *
-gfs2_iomap_page_prepare(struct iomap_iter *iter, loff_t pos, unsigned len)
+gfs2_iomap_get_folio(struct iomap_iter *iter, loff_t pos, unsigned len)
 {
 	struct inode *inode = iter->inode;
 	unsigned int blockmask = i_blocksize(inode) - 1;
@@ -998,7 +998,7 @@ static void gfs2_iomap_put_folio(struct inode *inode, loff_t pos,
 }
 
 static const struct iomap_page_ops gfs2_iomap_page_ops = {
-	.page_prepare = gfs2_iomap_page_prepare,
+	.get_folio = gfs2_iomap_get_folio,
 	.put_folio = gfs2_iomap_put_folio,
 };
 
@@ -1291,7 +1291,7 @@ int gfs2_alloc_extent(struct inode *inode, u64 lblock, u64 *dblock,
 /*
  * NOTE: Never call gfs2_block_zero_range with an open transaction because it
  * uses iomap write to perform its actions, which begin their own transactions
- * (iomap_begin, page_prepare, etc.)
+ * (iomap_begin, get_folio, etc.)
  */
 static int gfs2_block_zero_range(struct inode *inode, loff_t from,
 				 unsigned int length)
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 666107c3a385..006ddf933948 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -607,8 +607,8 @@ static struct folio *__iomap_get_folio(struct iomap_iter *iter, loff_t pos,
 {
 	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
 
-	if (page_ops && page_ops->page_prepare)
-		return page_ops->page_prepare(iter, pos, len);
+	if (page_ops && page_ops->get_folio)
+		return page_ops->get_folio(iter, pos, len);
 	else
 		return iomap_get_folio(iter, pos);
 }
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index d50501781856..da226032aedc 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -126,17 +126,17 @@ static inline bool iomap_inline_data_valid(const struct iomap *iomap)
 }
 
 /*
- * When a filesystem sets page_ops in an iomap mapping it returns, page_prepare
+ * When a filesystem sets page_ops in an iomap mapping it returns, get_folio
  * and put_folio will be called for each folio written to.  This only applies
  * to buffered writes as unbuffered writes will not typically have folios
  * associated with them.
  *
- * When page_prepare succeeds, put_folio will always be called to do any
+ * When get_folio succeeds, put_folio will always be called to do any
  * cleanup work necessary.  put_folio is responsible for unlocking and putting
  * @folio.
  */
 struct iomap_page_ops {
-	struct folio *(*page_prepare)(struct iomap_iter *iter, loff_t pos,
+	struct folio *(*get_folio)(struct iomap_iter *iter, loff_t pos,
 			unsigned len);
 	void (*put_folio)(struct inode *inode, loff_t pos, unsigned copied,
 			struct folio *folio);
-- 
2.38.1

