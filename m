Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD6A64ED74
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Dec 2022 16:06:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671203216;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Hx1hr3zVnpxfjUoh5oVvuyRaT+eEP0rAMA6HZN8X1gk=;
	b=M86gmD2AbGmiYKk0v95svq17BEmBrWeWAOehKGOd7MyIgDSXkcBehH6oYCkt/bCt2nHKMT
	NsgHq0T4Ftr4t7V9bbmyeVJtvsW+WnsudsofSCSLjgNv0D17fHvFc7RqsrTNX0Cs0ej8Zs
	8wTx7vAhzSbCl4X/wzb9sWvXfvAL1ZY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-Mn2gp9SKM1G9u3fV7uqpYg-1; Fri, 16 Dec 2022 10:06:53 -0500
X-MC-Unique: Mn2gp9SKM1G9u3fV7uqpYg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AADBB38149AF;
	Fri, 16 Dec 2022 15:06:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9FC4349BB6A;
	Fri, 16 Dec 2022 15:06:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 89C4F1946A6B;
	Fri, 16 Dec 2022 15:06:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 58E6A1946594 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 16 Dec 2022 15:06:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3A50B14171C2; Fri, 16 Dec 2022 15:06:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-182.brq.redhat.com [10.40.192.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 181A314171BE;
 Fri, 16 Dec 2022 15:06:42 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Fri, 16 Dec 2022 16:06:25 +0100
Message-Id: <20221216150626.670312-7-agruenba@redhat.com>
In-Reply-To: <20221216150626.670312-1-agruenba@redhat.com>
References: <20221216150626.670312-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [RFC v3 6/7] iomap/xfs: Eliminate the iomap_valid
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Eliminate the ->iomap_valid() handler by switching to a ->page_prepare()
handler and validating the mapping there.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/iomap/buffered-io.c | 24 ++++--------------------
 fs/xfs/xfs_iomap.c     | 38 +++++++++++++++++++++++++++-----------
 include/linux/iomap.h  | 17 -----------------
 3 files changed, 31 insertions(+), 48 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 6b7c1a10b8ec..b73ff317da21 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -623,7 +623,7 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
 	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	struct folio *folio;
-	int status = 0;
+	int status;
 
 	BUG_ON(pos + len > iter->iomap.offset + iter->iomap.length);
 	if (srcmap != &iter->iomap)
@@ -642,27 +642,11 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
 	if (IS_ERR_OR_NULL(folio)) {
 		if (!folio)
 			return (iter->flags & IOMAP_NOWAIT) ? -EAGAIN : -ENOMEM;
-		return PTR_ERR(folio);
-	}
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
index 669c1bc5c3a7..2248ce7be2e3 100644
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
+	if (!folio)
+		return NULL;
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

