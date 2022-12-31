Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A72AE65A54C
	for <lists+cluster-devel@lfdr.de>; Sat, 31 Dec 2022 16:09:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672499381;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l2IfSJX/vtTb5OOkZ9dadpQdlagOz1kQiJKQOgOgBSc=;
	b=DhFeTTgVzZFkTmoUEXU1s1K3uT0pLPxgePv1Ipz9tY/tO3q+iJ9T1yovtar2XPdUPDxErH
	ho0Nbp5B0ImqJAkTSL4FpQ/OI63GNBJA9OjK7Z6TcMyPP0zxnakfAF8ZUBCh9/QDaNB3ym
	QsnZA4k765DqIvzGZISLfARx8OAm9w4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-Fyet5J_YOsWptnjbrBhGqQ-1; Sat, 31 Dec 2022 10:09:38 -0500
X-MC-Unique: Fyet5J_YOsWptnjbrBhGqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C2C6101A52E;
	Sat, 31 Dec 2022 15:09:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3189A40C945A;
	Sat, 31 Dec 2022 15:09:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1612B194658D;
	Sat, 31 Dec 2022 15:09:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F2A421946587 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 31 Dec 2022 15:09:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E63F1492B02; Sat, 31 Dec 2022 15:09:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-3.brq.redhat.com [10.40.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEDFA492B00;
 Sat, 31 Dec 2022 15:09:27 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Matthew Wilcox <willy@infradead.org>
Date: Sat, 31 Dec 2022 16:09:13 +0100
Message-Id: <20221231150919.659533-4-agruenba@redhat.com>
In-Reply-To: <20221231150919.659533-1-agruenba@redhat.com>
References: <20221231150919.659533-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH v5 3/9] iomap: Rename page_done handler to
 put_folio
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

The ->page_done() handler in struct iomap_page_ops is now somewhat
misnamed in that it mainly deals with unlocking and putting a folio, so
rename it to ->put_folio().

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c         |  4 ++--
 fs/iomap/buffered-io.c |  4 ++--
 include/linux/iomap.h  | 10 +++++-----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 46206286ad42..0c041459677b 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -967,7 +967,7 @@ static int gfs2_iomap_page_prepare(struct inode *inode, loff_t pos,
 	return gfs2_trans_begin(sdp, RES_DINODE + blocks, 0);
 }
 
-static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
+static void gfs2_iomap_put_folio(struct inode *inode, loff_t pos,
 				 unsigned copied, struct folio *folio)
 {
 	struct gfs2_trans *tr = current->journal_info;
@@ -994,7 +994,7 @@ static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
 
 static const struct iomap_page_ops gfs2_iomap_page_ops = {
 	.page_prepare = gfs2_iomap_page_prepare,
-	.page_done = gfs2_iomap_page_done,
+	.put_folio = gfs2_iomap_put_folio,
 };
 
 static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index e13d5694e299..2a9bab4f3c79 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -580,8 +580,8 @@ static void iomap_put_folio(struct iomap_iter *iter, loff_t pos, size_t ret,
 {
 	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
 
-	if (page_ops && page_ops->page_done) {
-		page_ops->page_done(iter->inode, pos, ret, folio);
+	if (page_ops && page_ops->put_folio) {
+		page_ops->put_folio(iter->inode, pos, ret, folio);
 	} else if (folio) {
 		folio_unlock(folio);
 		folio_put(folio);
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 743e2a909162..10ec36f373f4 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -126,18 +126,18 @@ static inline bool iomap_inline_data_valid(const struct iomap *iomap)
 
 /*
  * When a filesystem sets page_ops in an iomap mapping it returns, page_prepare
- * and page_done will be called for each page written to.  This only applies to
+ * and put_folio will be called for each page written to.  This only applies to
  * buffered writes as unbuffered writes will not typically have pages
  * associated with them.
  *
- * When page_prepare succeeds, page_done will always be called to do any
- * cleanup work necessary.  In that page_done call, @folio will be NULL if the
- * associated folio could not be obtained.  When folio is not NULL, page_done
+ * When page_prepare succeeds, put_folio will always be called to do any
+ * cleanup work necessary.  In that put_folio call, @folio will be NULL if the
+ * associated folio could not be obtained.  When folio is not NULL, put_folio
  * is responsible for unlocking and putting the folio.
  */
 struct iomap_page_ops {
 	int (*page_prepare)(struct inode *inode, loff_t pos, unsigned len);
-	void (*page_done)(struct inode *inode, loff_t pos, unsigned copied,
+	void (*put_folio)(struct inode *inode, loff_t pos, unsigned copied,
 			struct folio *folio);
 
 	/*
-- 
2.38.1

