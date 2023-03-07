Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC076AE428
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Mar 2023 16:12:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678201931;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T+jAzTrCOcTdsZuDMqbhZg8e+Lk8/gtW6xDS7q+hTuo=;
	b=fQ3oYiNqjkvLVHlk5g7tLqaUSYKFjQT3nLSCuU8eey4w9niqpQMJUTNQg0bYad1SVWccle
	SvIY/wUgnot6tUFqFVGCL0v3t3m3OxtMw5YMGqsH/S4tIybqnFyTrlqFkwq6acttzesdI3
	m3lezh+n/7++z/sSH+CM1LbP/ZGpfDY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-andHkWuhOWO7QY74-wgmdw-1; Tue, 07 Mar 2023 10:11:55 -0500
X-MC-Unique: andHkWuhOWO7QY74-wgmdw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D678385055B;
	Tue,  7 Mar 2023 15:10:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41E082026D4B;
	Tue,  7 Mar 2023 15:10:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0F3D319465A8;
	Tue,  7 Mar 2023 15:10:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9B3011946594 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  7 Mar 2023 15:10:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7BC571121331; Tue,  7 Mar 2023 15:10:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 748841121330
 for <cluster-devel@redhat.com>; Tue,  7 Mar 2023 15:10:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5268E87A3BD
 for <cluster-devel@redhat.com>; Tue,  7 Mar 2023 15:10:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-I_SUoJKsP1yK1iekRh9H4Q-1; Tue, 07 Mar 2023 10:10:18 -0500
X-MC-Unique: I_SUoJKsP1yK1iekRh9H4Q-1
Received: from [46.183.103.17] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pZYOS-000q61-9M; Tue, 07 Mar 2023 14:34:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>
Date: Tue,  7 Mar 2023 15:34:05 +0100
Message-Id: <20230307143410.28031-3-hch@lst.de>
In-Reply-To: <20230307143410.28031-1-hch@lst.de>
References: <20230307143410.28031-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH 2/7] mm: make mapping_get_entry available
 outside of filemap.c
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
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

mapping_get_entry is useful for page cache API users that need to know
about xa_value internals.  Rename it and make it available in pagemap.h.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/pagemap.h | 1 +
 mm/filemap.c            | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 0acb8e1fb7afdc..5d9b51d3854220 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -507,6 +507,7 @@ pgoff_t page_cache_prev_miss(struct address_space *mapping,
 #define FGP_ENTRY		0x00000080
 #define FGP_STABLE		0x00000100
 
+void *filemap_get_entry(struct address_space *mapping, pgoff_t index);
 struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
 		int fgp_flags, gfp_t gfp);
 struct page *pagecache_get_page(struct address_space *mapping, pgoff_t index,
diff --git a/mm/filemap.c b/mm/filemap.c
index 2723104cc06a12..a674108a4d524b 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1836,7 +1836,7 @@ EXPORT_SYMBOL(page_cache_prev_miss);
  */
 
 /*
- * mapping_get_entry - Get a page cache entry.
+ * filemap_get_entry - Get a page cache entry.
  * @mapping: the address_space to search
  * @index: The page cache index.
  *
@@ -1847,7 +1847,7 @@ EXPORT_SYMBOL(page_cache_prev_miss);
  *
  * Return: The folio, swap or shadow entry, %NULL if nothing is found.
  */
-static void *mapping_get_entry(struct address_space *mapping, pgoff_t index)
+void *filemap_get_entry(struct address_space *mapping, pgoff_t index)
 {
 	XA_STATE(xas, &mapping->i_pages, index);
 	struct folio *folio;
@@ -1917,7 +1917,7 @@ struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
 	struct folio *folio;
 
 repeat:
-	folio = mapping_get_entry(mapping, index);
+	folio = filemap_get_entry(mapping, index);
 	if (xa_is_value(folio)) {
 		if (fgp_flags & FGP_ENTRY)
 			return folio;
-- 
2.39.1

