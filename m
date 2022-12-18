Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4CF6504F2
	for <lists+cluster-devel@lfdr.de>; Sun, 18 Dec 2022 23:11:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671401479;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=irD2GLwmm9jLOEic9Txw0La3I6P2VC9FcUcMSRUsrP0=;
	b=UNM3FwNouJaXx0ciedvCsuljS/Rm9E+nrSti3+bIajGyzMjboZVfPYdSC154Dkl5BSQrW1
	1l/NFKc6whf6Qp6UuYAq9igfMfc6CTNfYx1HMvzwynsBo0WGRkXQ2yeku9wuZMMYdLg25g
	1HIz5iH52/IMrJWOhUPndFL+933UGM0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-mesCWr4cN4KatLDbnBnUxA-1; Sun, 18 Dec 2022 17:11:14 -0500
X-MC-Unique: mesCWr4cN4KatLDbnBnUxA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDC54101B429;
	Sun, 18 Dec 2022 22:11:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E29A1175A2;
	Sun, 18 Dec 2022 22:11:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 662D11946588;
	Sun, 18 Dec 2022 22:11:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 702FC1946588 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 18 Dec 2022 22:11:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 52C172166B2B; Sun, 18 Dec 2022 22:11:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-22.brq.redhat.com [10.40.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E3DC2166B26;
 Sun, 18 Dec 2022 22:11:08 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Sun, 18 Dec 2022 23:10:53 +0100
Message-Id: <20221218221054.3946886-7-agruenba@redhat.com>
In-Reply-To: <20221216150626.670312-1-agruenba@redhat.com>
References: <20221216150626.670312-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [RFC v4 6/7] iomap/xfs: Eliminate the iomap_valid
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Eliminate the ->iomap_valid() handler by switching to a ->page_prepare()
handler and validating the mapping there.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/buffered-io.c | 25 +++++--------------------
 fs/xfs/xfs_iomap.c     | 38 +++++++++++++++++++++++++++-----------
 include/linux/iomap.h  | 17 -----------------
 3 files changed, 32 insertions(+), 48 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 819562633998..32a2a287d32c 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -628,7 +628,7 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
 	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	struct folio *folio;
-	int status = 0;
+	int status;
 
 	BUG_ON(pos + len > iter->iomap.offset + iter->iomap.length);
 	if (srcmap != &iter->iomap)
@@ -644,27 +644,12 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 		folio = page_ops->page_prepare(iter, pos, len);
 	else
 		folio = iomap_folio_prepare(iter, pos);
-	if (IS_ERR(folio))
-		return PTR_ERR(folio);
-
-	/*
-	 * Now we have a locked folio, before we do anything with it we need to
-	 * check that the iomap we have cached is not stale. The inode extent
-	 * mapping can change due to concurrent IO in flight (e.g.
-	 * IOMAP_UNWRITTEN state can change and memory reclaim could have
-	 * reclaimed a previously partially written page at this index after IO
-	 * completion before this write reaches this file offset) and hence we
-	 * could do the wrong thing here (zero a page range incorrectly or fail
-	 * to zero) and corrupt data.
-	 */
-	if (page_ops && page_ops->iomap_valid) {
-		bool iomap_valid = page_ops->iomap_valid(iter->inode,
-							&iter->iomap);
-		if (!iomap_valid) {
+	if (IS_ERR(folio)) {
+		if (folio == ERR_PTR(-ESTALE)) {
 			iter->iomap.flags |= IOMAP_F_STALE;
-			status = 0;
-			goto out_unlock;
+			return 0;
 		}
+		return PTR_ERR(folio);
 	}
 
 	if (pos + len > folio_pos(folio) + folio_size(folio))
diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
index 669c1bc5c3a7..ae83cb89279d 100644
--- a/fs/xfs/xfs_iomap.c
+++ b/fs/xfs/xfs_iomap.c
@@ -62,29 +62,45 @@ xfs_iomap_inode_sequence(
 	return cookie | READ_ONCE(ip->i_df.if_seq);
 }
 
-/*
- * Check that the iomap passed to us is still valid for the given offset and
- * length.
- */
-static bool
-xfs_iomap_valid(
-	struct inode		*inode,
-	const struct iomap	*iomap)
+static struct folio *
+xfs_page_prepare(
+	struct iomap_iter	*iter,
+	loff_t			pos,
+	unsigned		len)
 {
+	struct inode		*inode = iter->inode;
+	struct iomap		*iomap = &iter->iomap;
 	struct xfs_inode	*ip = XFS_I(inode);
+	struct folio *folio;
 
+	folio = iomap_folio_prepare(iter, pos);
+	if (IS_ERR(folio))
+		return folio;
+
+	/*
+	 * Now we have a locked folio, before we do anything with it we need to
+	 * check that the iomap we have cached is not stale. The inode extent
+	 * mapping can change due to concurrent IO in flight (e.g.
+	 * IOMAP_UNWRITTEN state can change and memory reclaim could have
+	 * reclaimed a previously partially written page at this index after IO
+	 * completion before this write reaches this file offset) and hence we
+	 * could do the wrong thing here (zero a page range incorrectly or fail
+	 * to zero) and corrupt data.
+	 */
 	if (iomap->validity_cookie !=
 			xfs_iomap_inode_sequence(ip, iomap->flags)) {
 		trace_xfs_iomap_invalid(ip, iomap);
-		return false;
+		folio_unlock(folio);
+		folio_put(folio);
+		return ERR_PTR(-ESTALE);
 	}
 
 	XFS_ERRORTAG_DELAY(ip->i_mount, XFS_ERRTAG_WRITE_DELAY_MS);
-	return true;
+	return folio;
 }
 
 const struct iomap_page_ops xfs_iomap_page_ops = {
-	.iomap_valid		= xfs_iomap_valid,
+	.page_prepare		= xfs_page_prepare,
 };
 
 int
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index c74ab8c53b47..1c8b9a04b0bb 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -140,23 +140,6 @@ struct iomap_page_ops {
 			unsigned len);
 	void (*page_done)(struct inode *inode, loff_t pos, unsigned copied,
 			struct folio *folio);
-
-	/*
-	 * Check that the cached iomap still maps correctly to the filesystem's
-	 * internal extent map. FS internal extent maps can change while iomap
-	 * is iterating a cached iomap, so this hook allows iomap to detect that
-	 * the iomap needs to be refreshed during a long running write
-	 * operation.
-	 *
-	 * The filesystem can store internal state (e.g. a sequence number) in
-	 * iomap->validity_cookie when the iomap is first mapped to be able to
-	 * detect changes between mapping time and whenever .iomap_valid() is
-	 * called.
-	 *
-	 * This is called with the folio over the specified file position held
-	 * locked by the iomap code.
-	 */
-	bool (*iomap_valid)(struct inode *inode, const struct iomap *iomap);
 };
 
 /*
-- 
2.38.1

