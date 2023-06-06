Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9D9724FDD
	for <lists+cluster-devel@lfdr.de>; Wed,  7 Jun 2023 00:34:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686090850;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YX/N3CtXoCucNuLNEGx+SElTp9xZShRzX5AxSXbHI8o=;
	b=JBX7XU7tPx2XSePEFqYhuMD7RtWjiOeCgjRGIct5qqhNhoK9PKxT1rz/Tbt6yFdoM+7xgy
	YF1kty3zBUU/MGE0NsM0ObFEn9JIwMco3ANJsN4xZ1tR50ySmqGsQzvgiPciUBRguhCCS5
	vjMO0hnJkvZXAyTtUm7pqB35X7ViXQg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-YAW5OlSXNNykkLaF5kbutQ-1; Tue, 06 Jun 2023 18:34:09 -0400
X-MC-Unique: YAW5OlSXNNykkLaF5kbutQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A9A3811E92;
	Tue,  6 Jun 2023 22:34:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E877492B00;
	Tue,  6 Jun 2023 22:34:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 18B2D19452C7;
	Tue,  6 Jun 2023 22:34:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 240A719465BA for <cluster-devel@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 22:34:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EB5B02026D6A; Tue,  6 Jun 2023 22:34:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E34232026D49
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 22:34:05 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4D5B1C068E8
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 22:34:05 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-423-pHOhQyWTP_qXJTBeyhrHfQ-1; Tue,
 06 Jun 2023 18:34:04 -0400
X-MC-Unique: pHOhQyWTP_qXJTBeyhrHfQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q6fFV-00DbF4-Ka; Tue, 06 Jun 2023 22:33:57 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue,  6 Jun 2023 23:33:42 +0100
Message-Id: <20230606223346.3241328-11-willy@infradead.org>
In-Reply-To: <20230606223346.3241328-1-willy@infradead.org>
References: <20230606223346.3241328-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH v2 10/14] buffer: Convert grow_dev_page() to
 use a folio
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
Cc: Hannes Reinecke <hare@suse.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, cluster-devel@redhat.com,
 Luis Chamberlain <mcgrof@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Get a folio from the page cache instead of a page, then use the
folio API throughout.  Removes a few calls to compound_head()
and may be needed to support block size > PAGE_SIZE.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/buffer.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 5f758bab5bcb..c4fc4b3b8aab 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -976,7 +976,7 @@ grow_dev_page(struct block_device *bdev, sector_t block,
 	      pgoff_t index, int size, int sizebits, gfp_t gfp)
 {
 	struct inode *inode = bdev->bd_inode;
-	struct page *page;
+	struct folio *folio;
 	struct buffer_head *bh;
 	sector_t end_block;
 	int ret = 0;
@@ -992,42 +992,38 @@ grow_dev_page(struct block_device *bdev, sector_t block,
 	 */
 	gfp_mask |= __GFP_NOFAIL;
 
-	page = find_or_create_page(inode->i_mapping, index, gfp_mask);
-
-	BUG_ON(!PageLocked(page));
+	folio = __filemap_get_folio(inode->i_mapping, index,
+			FGP_LOCK | FGP_ACCESSED | FGP_CREAT, gfp_mask);
 
-	if (page_has_buffers(page)) {
-		bh = page_buffers(page);
+	bh = folio_buffers(folio);
+	if (bh) {
 		if (bh->b_size == size) {
-			end_block = init_page_buffers(page, bdev,
+			end_block = init_page_buffers(&folio->page, bdev,
 						(sector_t)index << sizebits,
 						size);
 			goto done;
 		}
-		if (!try_to_free_buffers(page_folio(page)))
+		if (!try_to_free_buffers(folio))
 			goto failed;
 	}
 
-	/*
-	 * Allocate some buffers for this page
-	 */
-	bh = alloc_page_buffers(page, size, true);
+	bh = folio_alloc_buffers(folio, size, true);
 
 	/*
-	 * Link the page to the buffers and initialise them.  Take the
+	 * Link the folio to the buffers and initialise them.  Take the
 	 * lock to be atomic wrt __find_get_block(), which does not
-	 * run under the page lock.
+	 * run under the folio lock.
 	 */
 	spin_lock(&inode->i_mapping->private_lock);
-	link_dev_buffers(page, bh);
-	end_block = init_page_buffers(page, bdev, (sector_t)index << sizebits,
-			size);
+	link_dev_buffers(&folio->page, bh);
+	end_block = init_page_buffers(&folio->page, bdev,
+			(sector_t)index << sizebits, size);
 	spin_unlock(&inode->i_mapping->private_lock);
 done:
 	ret = (block < end_block) ? 1 : -ENXIO;
 failed:
-	unlock_page(page);
-	put_page(page);
+	folio_unlock(folio);
+	folio_put(folio);
 	return ret;
 }
 
-- 
2.39.2

