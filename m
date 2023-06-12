Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ED272D143
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 23:01:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686603716;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vKvynQGpjvP3shWSlyAyKuk5q4UrI4w69YUOsJMsW1c=;
	b=gL4ivs7VTn4DDZWhIL2c0WxSoiMuPnsc7btj/jejCY8tVea6C0R1OP0yAQ+VoVZgBfhAxB
	nhTWd+mwQeHGkh6oTiUaiLbchuHhWDc1rBbnxdJxjjm5PprIlPUCQf9JnlP/k1IeoIjLkB
	FXwsV9L7guupqHYPleA/lRfw3JY4JvQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-WAr3nV69OBK-Ke3CHAzwDw-1; Mon, 12 Jun 2023 17:01:54 -0400
X-MC-Unique: WAr3nV69OBK-Ke3CHAzwDw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC61A1C06924;
	Mon, 12 Jun 2023 21:01:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1BA92026833;
	Mon, 12 Jun 2023 21:01:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B471D19465B9;
	Mon, 12 Jun 2023 21:01:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6F2CA194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 21:01:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5177E141510A; Mon, 12 Jun 2023 21:01:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49D8E1415102
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:01:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2352E380226A
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:01:51 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-36-nIxs00ehPA2PEzcwFRSLnQ-1; Mon,
 12 Jun 2023 17:01:48 -0400
X-MC-Unique: nIxs00ehPA2PEzcwFRSLnQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q8ofY-0033xQ-6f; Mon, 12 Jun 2023 21:01:44 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Jun 2023 22:01:40 +0100
Message-Id: <20230612210141.730128-14-willy@infradead.org>
In-Reply-To: <20230612210141.730128-1-willy@infradead.org>
References: <20230612210141.730128-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH v3 13/14] buffer: Use a folio in
 __find_get_block_slow()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Saves a call to compound_head() and may be needed to support
block size > PAGE_SIZE.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/buffer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 4ca2eb2b3dca..c38fdcaa32ff 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -195,19 +195,19 @@ __find_get_block_slow(struct block_device *bdev, sector_t block)
 	pgoff_t index;
 	struct buffer_head *bh;
 	struct buffer_head *head;
-	struct page *page;
+	struct folio *folio;
 	int all_mapped = 1;
 	static DEFINE_RATELIMIT_STATE(last_warned, HZ, 1);
 
 	index = block >> (PAGE_SHIFT - bd_inode->i_blkbits);
-	page = find_get_page_flags(bd_mapping, index, FGP_ACCESSED);
-	if (!page)
+	folio = __filemap_get_folio(bd_mapping, index, FGP_ACCESSED, 0);
+	if (IS_ERR(folio))
 		goto out;
 
 	spin_lock(&bd_mapping->private_lock);
-	if (!page_has_buffers(page))
+	head = folio_buffers(folio);
+	if (!head)
 		goto out_unlock;
-	head = page_buffers(page);
 	bh = head;
 	do {
 		if (!buffer_mapped(bh))
@@ -237,7 +237,7 @@ __find_get_block_slow(struct block_device *bdev, sector_t block)
 	}
 out_unlock:
 	spin_unlock(&bd_mapping->private_lock);
-	put_page(page);
+	folio_put(folio);
 out:
 	return ret;
 }
-- 
2.39.2

