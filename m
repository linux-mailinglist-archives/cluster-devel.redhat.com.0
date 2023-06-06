Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 624DC724FDC
	for <lists+cluster-devel@lfdr.de>; Wed,  7 Jun 2023 00:34:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686090850;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Caz/R9K/an880SZlqoAQNJ80gGi+htRBSdsbSsE1UqQ=;
	b=OknK5rK8D+Ye1ECNl3Y8q9OmbjdHB4Y5QI8Nt0ezxt4rcTSAhbTCrQRdQky3vpXz6e6yfN
	EVplUxSyJFyijv58TU1Ltkvpoaim9gPM5edAPbfKALycXt5soySj6fxjaYFHX3+RrUI/3z
	jl83yAr1NRQ/B4SB1EeWhmKSz4skuCE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-sdhfO2uAMluu-I5qXEOieA-1; Tue, 06 Jun 2023 18:34:06 -0400
X-MC-Unique: sdhfO2uAMluu-I5qXEOieA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AF79280BC61;
	Tue,  6 Jun 2023 22:34:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5FAD69E8D;
	Tue,  6 Jun 2023 22:34:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E4A5D19452C4;
	Tue,  6 Jun 2023 22:34:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 399AE19465BA for <cluster-devel@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 22:34:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1A2C0C1603B; Tue,  6 Jun 2023 22:34:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12530C0297C
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 22:34:04 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6378101A58B
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 22:34:03 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-2-OgByWXNGMmO5F_s0Pz-C1g-1; Tue,
 06 Jun 2023 18:33:59 -0400
X-MC-Unique: OgByWXNGMmO5F_s0Pz-C1g-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q6fFV-00DbF6-NH; Tue, 06 Jun 2023 22:33:57 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue,  6 Jun 2023 23:33:43 +0100
Message-Id: <20230606223346.3241328-12-willy@infradead.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH v2 11/14] buffer: Convert
 init_page_buffers() to folio_init_buffers()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Use the folio API and pass the folio from both callers.
Saves a hidden call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/buffer.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index c4fc4b3b8aab..9b789f109a57 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -934,15 +934,14 @@ static sector_t blkdev_max_block(struct block_device *bdev, unsigned int size)
 }
 
 /*
- * Initialise the state of a blockdev page's buffers.
+ * Initialise the state of a blockdev folio's buffers.
  */ 
-static sector_t
-init_page_buffers(struct page *page, struct block_device *bdev,
-			sector_t block, int size)
+static sector_t folio_init_buffers(struct folio *folio,
+		struct block_device *bdev, sector_t block, int size)
 {
-	struct buffer_head *head = page_buffers(page);
+	struct buffer_head *head = folio_buffers(folio);
 	struct buffer_head *bh = head;
-	int uptodate = PageUptodate(page);
+	bool uptodate = folio_test_uptodate(folio);
 	sector_t end_block = blkdev_max_block(bdev, size);
 
 	do {
@@ -998,9 +997,8 @@ grow_dev_page(struct block_device *bdev, sector_t block,
 	bh = folio_buffers(folio);
 	if (bh) {
 		if (bh->b_size == size) {
-			end_block = init_page_buffers(&folio->page, bdev,
-						(sector_t)index << sizebits,
-						size);
+			end_block = folio_init_buffers(folio, bdev,
+					(sector_t)index << sizebits, size);
 			goto done;
 		}
 		if (!try_to_free_buffers(folio))
@@ -1016,7 +1014,7 @@ grow_dev_page(struct block_device *bdev, sector_t block,
 	 */
 	spin_lock(&inode->i_mapping->private_lock);
 	link_dev_buffers(&folio->page, bh);
-	end_block = init_page_buffers(&folio->page, bdev,
+	end_block = folio_init_buffers(folio, bdev,
 			(sector_t)index << sizebits, size);
 	spin_unlock(&inode->i_mapping->private_lock);
 done:
-- 
2.39.2

