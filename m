Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE3F65A54F
	for <lists+cluster-devel@lfdr.de>; Sat, 31 Dec 2022 16:09:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672499393;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dE6CAlIEWmWcE9bWCr2nokvAv42ISasFHLnBmeQSMa8=;
	b=G7j/SacaxTSLBt/y+8XFY5k0GuetOKoOyrsgFsgIU85ag100u9a1e5ffQRHwb5h9rRLOeN
	lCrDkbwIm9oFXRjDEBIL1MtdCdOD5f6hPpPFCU9xF5mHObaE6R+8BtsI6TeN8zhOKAc5Zm
	eqxGi0aht0qmIOOlkRr5Jx0EzKL2NMk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-izEWSxhpMz-tVQ9hE0NPfw-1; Sat, 31 Dec 2022 10:09:49 -0500
X-MC-Unique: izEWSxhpMz-tVQ9hE0NPfw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E51C811E6E;
	Sat, 31 Dec 2022 15:09:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9425F40C945A;
	Sat, 31 Dec 2022 15:09:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2BDA51946595;
	Sat, 31 Dec 2022 15:09:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DE7F51946587 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 31 Dec 2022 15:09:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BF71E492B01; Sat, 31 Dec 2022 15:09:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-3.brq.redhat.com [10.40.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF2ED492B00;
 Sat, 31 Dec 2022 15:09:38 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Sat, 31 Dec 2022 16:09:15 +0100
Message-Id: <20221231150919.659533-6-agruenba@redhat.com>
In-Reply-To: <20221231150919.659533-1-agruenba@redhat.com>
References: <20221231150919.659533-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH v5 5/9] iomap/gfs2: Get page in page_prepare
 handler
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Change the iomap ->page_prepare() handler to get and return a locked
folio instead of doing that in iomap_write_begin().  This allows to
recover from out-of-memory situations in ->page_prepare(), which
eliminates the corresponding error handling code in iomap_write_begin().
The ->put_folio() handler now also isn't called with NULL as the folio
value anymore.

Filesystems are expected to use the iomap_get_folio() helper for getting
locked folios in their ->page_prepare() handlers.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c         | 21 +++++++++++++--------
 fs/iomap/buffered-io.c | 17 ++++++-----------
 include/linux/iomap.h  |  9 +++++----
 3 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 0c041459677b..41349e09558b 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -956,15 +956,25 @@ static int __gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
 	goto out;
 }
 
-static int gfs2_iomap_page_prepare(struct inode *inode, loff_t pos,
-				   unsigned len)
+static struct folio *
+gfs2_iomap_page_prepare(struct iomap_iter *iter, loff_t pos, unsigned len)
 {
+	struct inode *inode = iter->inode;
 	unsigned int blockmask = i_blocksize(inode) - 1;
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 	unsigned int blocks;
+	struct folio *folio;
+	int status;
 
 	blocks = ((pos & blockmask) + len + blockmask) >> inode->i_blkbits;
-	return gfs2_trans_begin(sdp, RES_DINODE + blocks, 0);
+	status = gfs2_trans_begin(sdp, RES_DINODE + blocks, 0);
+	if (status)
+		return ERR_PTR(status);
+
+	folio = iomap_get_folio(iter, pos);
+	if (IS_ERR(folio))
+		gfs2_trans_end(sdp);
+	return folio;
 }
 
 static void gfs2_iomap_put_folio(struct inode *inode, loff_t pos,
@@ -974,11 +984,6 @@ static void gfs2_iomap_put_folio(struct inode *inode, loff_t pos,
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 
-	if (!folio) {
-		gfs2_trans_end(sdp);
-		return;
-	}
-
 	if (!gfs2_is_stuffed(ip))
 		gfs2_page_add_databufs(ip, &folio->page, offset_in_page(pos),
 				       copied);
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index b84838d2b5d8..7decd8cdc755 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -609,7 +609,7 @@ static void iomap_put_folio(struct iomap_iter *iter, loff_t pos, size_t ret,
 
 	if (page_ops && page_ops->put_folio) {
 		page_ops->put_folio(iter->inode, pos, ret, folio);
-	} else if (folio) {
+	} else {
 		folio_unlock(folio);
 		folio_put(folio);
 	}
@@ -642,17 +642,12 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 	if (!mapping_large_folio_support(iter->inode->i_mapping))
 		len = min_t(size_t, len, PAGE_SIZE - offset_in_page(pos));
 
-	if (page_ops && page_ops->page_prepare) {
-		status = page_ops->page_prepare(iter->inode, pos, len);
-		if (status)
-			return status;
-	}
-
-	folio = iomap_get_folio(iter, pos);
-	if (IS_ERR(folio)) {
-		iomap_put_folio(iter, pos, 0, NULL);
+	if (page_ops && page_ops->page_prepare)
+		folio = page_ops->page_prepare(iter, pos, len);
+	else
+		folio = iomap_get_folio(iter, pos);
+	if (IS_ERR(folio))
 		return PTR_ERR(folio);
-	}
 
 	/*
 	 * Now we have a locked folio, before we do anything with it we need to
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index e5732cc5716b..87b5d0f8e578 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -13,6 +13,7 @@
 struct address_space;
 struct fiemap_extent_info;
 struct inode;
+struct iomap_iter;
 struct iomap_dio;
 struct iomap_writepage_ctx;
 struct iov_iter;
@@ -131,12 +132,12 @@ static inline bool iomap_inline_data_valid(const struct iomap *iomap)
  * associated with them.
  *
  * When page_prepare succeeds, put_folio will always be called to do any
- * cleanup work necessary.  In that put_folio call, @folio will be NULL if the
- * associated folio could not be obtained.  When folio is not NULL, put_folio
- * is responsible for unlocking and putting the folio.
+ * cleanup work necessary.  put_folio is responsible for unlocking and putting
+ * @folio.
  */
 struct iomap_page_ops {
-	int (*page_prepare)(struct inode *inode, loff_t pos, unsigned len);
+	struct folio *(*page_prepare)(struct iomap_iter *iter, loff_t pos,
+			unsigned len);
 	void (*put_folio)(struct inode *inode, loff_t pos, unsigned copied,
 			struct folio *folio);
 
-- 
2.38.1

