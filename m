Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 444DA66189A
	for <lists+cluster-devel@lfdr.de>; Sun,  8 Jan 2023 20:40:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673206850;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PT14zPx5a4QI1wKUmKAWzmL+FBkRZkQR/RJK9Bzk7iQ=;
	b=MTtJlKzogP35F83/KvdOWilDt7OOPmhth0xIHDZfzhV3h263eUGB5YHNxS37hCB6HvSh+O
	Eifk2oBE28VCBBuDG1X/wYG1TbMNPPkDyz743ldZOOmoLQGTWNzGcpD9jaGvXF56UeD5Il
	CxlwU40IaKeGsVY5Ps5iidDLtX7uX70=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-66XUo7S7OoCW-Gi6bLI61w-1; Sun, 08 Jan 2023 14:40:46 -0500
X-MC-Unique: 66XUo7S7OoCW-Gi6bLI61w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D2538533DF;
	Sun,  8 Jan 2023 19:40:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 018F940C2064;
	Sun,  8 Jan 2023 19:40:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 91B3519459CE;
	Sun,  8 Jan 2023 19:40:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 010C41946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  8 Jan 2023 19:40:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E9628492B09; Sun,  8 Jan 2023 19:40:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-3.brq.redhat.com [10.40.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28C01492B06;
 Sun,  8 Jan 2023 19:40:40 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Sun,  8 Jan 2023 20:40:26 +0100
Message-Id: <20230108194034.1444764-3-agruenba@redhat.com>
In-Reply-To: <20230108194034.1444764-1-agruenba@redhat.com>
References: <20230108194034.1444764-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [RFC v6 02/10] iomap/gfs2: Unlock and put folio in
 page_done handler
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

When an iomap defines a ->page_done() handler in its page_ops, delegate
unlocking the folio and putting the folio reference to that handler.

This allows to fix a race between journaled data writes and folio
writeback in gfs2: before this change, gfs2_iomap_page_done() was called
after unlocking the folio, so writeback could start writing back the
folio's buffers before they could be marked for writing to the journal.
Also, try_to_free_buffers() could free the buffers before
gfs2_iomap_page_done() was done adding the buffers to the current
current transaction.  With this change, gfs2_iomap_page_done() adds the
buffers to the current transaction while the folio is still locked, so
the problems described above can no longer occur.

The only current user of ->page_done() is gfs2, so other filesystems are
not affected.  To catch out any out-of-tree users, switch from a page to
a folio in ->page_done().

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 fs/gfs2/bmap.c         | 15 ++++++++++++---
 fs/iomap/buffered-io.c |  8 ++++----
 include/linux/iomap.h  |  7 ++++---
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index e7537fd305dd..46206286ad42 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -968,14 +968,23 @@ static int gfs2_iomap_page_prepare(struct inode *inode, loff_t pos,
 }
 
 static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
-				 unsigned copied, struct page *page)
+				 unsigned copied, struct folio *folio)
 {
 	struct gfs2_trans *tr = current->journal_info;
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 
-	if (page && !gfs2_is_stuffed(ip))
-		gfs2_page_add_databufs(ip, page, offset_in_page(pos), copied);
+	if (!folio) {
+		gfs2_trans_end(sdp);
+		return;
+	}
+
+	if (!gfs2_is_stuffed(ip))
+		gfs2_page_add_databufs(ip, &folio->page, offset_in_page(pos),
+				       copied);
+
+	folio_unlock(folio);
+	folio_put(folio);
 
 	if (tr->tr_num_buf_new)
 		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index c045689b6af8..a9082078e4ed 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -580,12 +580,12 @@ static void __iomap_put_folio(struct iomap_iter *iter, loff_t pos, size_t ret,
 {
 	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
 
-	if (folio)
+	if (page_ops && page_ops->page_done) {
+		page_ops->page_done(iter->inode, pos, ret, folio);
+	} else if (folio) {
 		folio_unlock(folio);
-	if (page_ops && page_ops->page_done)
-		page_ops->page_done(iter->inode, pos, ret, &folio->page);
-	if (folio)
 		folio_put(folio);
+	}
 }
 
 static int iomap_write_begin_inline(const struct iomap_iter *iter,
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 0983dfc9a203..743e2a909162 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -131,13 +131,14 @@ static inline bool iomap_inline_data_valid(const struct iomap *iomap)
  * associated with them.
  *
  * When page_prepare succeeds, page_done will always be called to do any
- * cleanup work necessary.  In that page_done call, @page will be NULL if the
- * associated page could not be obtained.
+ * cleanup work necessary.  In that page_done call, @folio will be NULL if the
+ * associated folio could not be obtained.  When folio is not NULL, page_done
+ * is responsible for unlocking and putting the folio.
  */
 struct iomap_page_ops {
 	int (*page_prepare)(struct inode *inode, loff_t pos, unsigned len);
 	void (*page_done)(struct inode *inode, loff_t pos, unsigned copied,
-			struct page *page);
+			struct folio *folio);
 
 	/*
 	 * Check that the cached iomap still maps correctly to the filesystem's
-- 
2.38.1

