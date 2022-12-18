Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 368786504F0
	for <lists+cluster-devel@lfdr.de>; Sun, 18 Dec 2022 23:11:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671401475;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QloeDAWDhNne++m1CakCVHuvgCTtzpcI2+OpIgPLSTo=;
	b=YTz65OAbwyhNu1vIgssdVuDVewr59WksIklpB1PeCbEpPP+Wi0ngc9j5WdUIjm6SoLmdk+
	wKRKqe9cteUth/GSaKnBiOJ2txhEX3TkS/JrJO6CYpweIQz///zY0nrS4k7xOPJbYo+s7Z
	8xfYyMuqKJgFqtLgDAu0fXd0L+tsXZk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-3H3dqkf4Mnmz4VouSmvg3g-1; Sun, 18 Dec 2022 17:11:11 -0500
X-MC-Unique: 3H3dqkf4Mnmz4VouSmvg3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B4B63C0D84F;
	Sun, 18 Dec 2022 22:11:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 104D140C2064;
	Sun, 18 Dec 2022 22:11:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A5F7D1946588;
	Sun, 18 Dec 2022 22:11:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F2CA11946588 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 18 Dec 2022 22:11:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C9A742166B2C; Sun, 18 Dec 2022 22:11:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-22.brq.redhat.com [10.40.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1F772166B26;
 Sun, 18 Dec 2022 22:11:06 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Sun, 18 Dec 2022 23:10:52 +0100
Message-Id: <20221218221054.3946886-6-agruenba@redhat.com>
In-Reply-To: <20221216150626.670312-1-agruenba@redhat.com>
References: <20221216150626.670312-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [RFC v4 5/7] iomap/gfs2: Get page in page_prepare
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Change the iomap ->page_prepare() handler to get and return a locked
folio instead of doing that in iomap_write_begin().  This allows to
recover from out-of-memory situations in ->page_prepare(), which
eliminates the corresponding error handling code in iomap_write_begin().
The ->page_done() handler is now not called with a NULL folio anymore.

Filesystems are expected to use the iomap_folio_prepare() helper for
getting locked folios in their ->page_prepare() handlers.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c         | 16 +++++++++++++---
 fs/iomap/buffered-io.c | 17 ++++++-----------
 include/linux/iomap.h  |  9 +++++----
 3 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 11115fce68cb..ed8ceed64100 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -959,15 +959,25 @@ static int __gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
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
+	folio = iomap_folio_prepare(iter, pos);
+	if (IS_ERR(folio))
+		gfs2_trans_end(sdp);
+	return folio;
 }
 
 static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 93647dae934a..819562633998 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -607,7 +607,7 @@ static void iomap_folio_done(struct iomap_iter *iter, loff_t pos, size_t ret,
 
 	if (page_ops && page_ops->page_done) {
 		page_ops->page_done(iter->inode, pos, ret, folio);
-	} else if (folio) {
+	} else {
 		folio_unlock(folio);
 		folio_put(folio);
 	}
@@ -640,17 +640,12 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 	if (!mapping_large_folio_support(iter->inode->i_mapping))
 		len = min_t(size_t, len, PAGE_SIZE - offset_in_page(pos));
 
-	if (page_ops && page_ops->page_prepare) {
-		status = page_ops->page_prepare(iter->inode, pos, len);
-		if (status)
-			return status;
-	}
-
-	folio = iomap_folio_prepare(iter, pos);
-	if (IS_ERR(folio)) {
-		iomap_folio_done(iter, pos, 0, NULL);
+	if (page_ops && page_ops->page_prepare)
+		folio = page_ops->page_prepare(iter, pos, len);
+	else
+		folio = iomap_folio_prepare(iter, pos);
+	if (IS_ERR(folio))
 		return PTR_ERR(folio);
-	}
 
 	/*
 	 * Now we have a locked folio, before we do anything with it we need to
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 0bf16ef22d81..c74ab8c53b47 100644
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
  * When page_prepare succeeds, page_done will always be called to do any
- * cleanup work necessary.  In that page_done call, @folio will be NULL if the
- * associated folio could not be obtained.  When folio is not NULL, page_done
- * is responsible for unlocking and putting the folio.
+ * cleanup work necessary.  page_done is responsible for unlocking and putting
+ * @folio.
  */
 struct iomap_page_ops {
-	int (*page_prepare)(struct inode *inode, loff_t pos, unsigned len);
+	struct folio *(*page_prepare)(struct iomap_iter *iter, loff_t pos,
+			unsigned len);
 	void (*page_done)(struct inode *inode, loff_t pos, unsigned copied,
 			struct folio *folio);
 
-- 
2.38.1

