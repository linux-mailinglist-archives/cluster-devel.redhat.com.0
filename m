Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BF36764D3
	for <lists+cluster-devel@lfdr.de>; Sat, 21 Jan 2023 08:04:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674284647;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=72dbPnQldghXJsWt6hBZ/ADNkiEKaZsKzxCkekJEdAU=;
	b=HJMPT6lF4PN9eM2dudlemgG8bzbUPsk/ULkAds9J4/rHxgUKJNYkdg7wsUyQevKcUB4Btf
	libAN3gkjB5SpZtXXLmnVFQ/fK9pyrCMjys5/3HFciVb/gDqFxMvDL5DFvrffYVxJOT3dG
	/bVeKhvzqVICuUeDWUHyfRsc50thN+U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-zg12SdsZMIOAQ4cFtbGnMA-1; Sat, 21 Jan 2023 02:04:03 -0500
X-MC-Unique: zg12SdsZMIOAQ4cFtbGnMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DB778533B8;
	Sat, 21 Jan 2023 07:04:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 426DA1731B;
	Sat, 21 Jan 2023 07:04:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0E9551946A6D;
	Sat, 21 Jan 2023 07:04:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 636BD1946586 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 21 Jan 2023 07:03:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4EF142026FFF; Sat, 21 Jan 2023 07:03:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47ED12026D68
 for <cluster-devel@redhat.com>; Sat, 21 Jan 2023 07:03:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D7F68533B6
 for <cluster-devel@redhat.com>; Sat, 21 Jan 2023 07:03:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-YHFVoO11M12gR4Sb5YiTwQ-1; Sat, 21 Jan 2023 02:03:53 -0500
X-MC-Unique: YHFVoO11M12gR4Sb5YiTwQ-1
Received: from [2001:4bb8:19a:2039:6754:cc81:9ace:36fc] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pJ7pN-00DSRH-Cq; Sat, 21 Jan 2023 06:58:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>
Date: Sat, 21 Jan 2023 07:57:54 +0100
Message-Id: <20230121065755.1140136-7-hch@lst.de>
In-Reply-To: <20230121065755.1140136-1-hch@lst.de>
References: <20230121065755.1140136-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 6/7] mm: remove FGP_ENTRY
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

FGP_ENTRY is unused now, so remove it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/pagemap.h | 3 +--
 mm/filemap.c            | 7 +------
 mm/folio-compat.c       | 4 ++--
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 24dedf6b12be49..e2208ee36966ea 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -504,8 +504,7 @@ pgoff_t page_cache_prev_miss(struct address_space *mapping,
 #define FGP_NOFS		0x00000010
 #define FGP_NOWAIT		0x00000020
 #define FGP_FOR_MMAP		0x00000040
-#define FGP_ENTRY		0x00000080
-#define FGP_STABLE		0x00000100
+#define FGP_STABLE		0x00000080
 
 void *filemap_get_entry(struct address_space *mapping, pgoff_t index);
 struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
diff --git a/mm/filemap.c b/mm/filemap.c
index ed0583f9e27512..35baadd130795c 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1889,8 +1889,6 @@ void *filemap_get_entry(struct address_space *mapping, pgoff_t index)
  *
  * * %FGP_ACCESSED - The folio will be marked accessed.
  * * %FGP_LOCK - The folio is returned locked.
- * * %FGP_ENTRY - If there is a shadow / swap / DAX entry, return it
- *   instead of allocating a new folio to replace it.
  * * %FGP_CREAT - If no page is present then a new page is allocated using
  *   @gfp and added to the page cache and the VM's LRU list.
  *   The page is returned locked and with an increased refcount.
@@ -1916,11 +1914,8 @@ struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
 
 repeat:
 	folio = filemap_get_entry(mapping, index);
-	if (xa_is_value(folio)) {
-		if (fgp_flags & FGP_ENTRY)
-			return folio;
+	if (xa_is_value(folio))
 		folio = NULL;
-	}
 	if (!folio)
 		goto no_page;
 
diff --git a/mm/folio-compat.c b/mm/folio-compat.c
index 18c48b55792635..f3841b4977b68e 100644
--- a/mm/folio-compat.c
+++ b/mm/folio-compat.c
@@ -97,8 +97,8 @@ struct page *pagecache_get_page(struct address_space *mapping, pgoff_t index,
 	struct folio *folio;
 
 	folio = __filemap_get_folio(mapping, index, fgp_flags, gfp);
-	if (!folio || xa_is_value(folio))
-		return &folio->page;
+	if (!folio)
+		return NULL;
 	return folio_file_page(folio, index);
 }
 EXPORT_SYMBOL(pagecache_get_page);
-- 
2.39.0

