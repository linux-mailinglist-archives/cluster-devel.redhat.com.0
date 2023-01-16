Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D03566C531
	for <lists+cluster-devel@lfdr.de>; Mon, 16 Jan 2023 17:02:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673884971;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=yWMoVbxjqe8C52IYg/jkHrGSHQbIvCeLUDAeg3xtuO0=;
	b=Ob2yYK9we/IOBrNgDLOEe3w5JyA2XaF64zaLEaiXZ5ExAwz/R6V4H9XcyEwWcF35ia9hYH
	AlnBHLOv5slT2h18TJwpUZhpvINzLa1NUPQYRxPkZeEu1MT1cJhTVwEf6qkAqxAs9uCI31
	8gO5Ahd1QLGNXnPSEN0RmISYdykUsYc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-T6nAr4pwOJqGTQAD7Sr9Og-1; Mon, 16 Jan 2023 11:02:48 -0500
X-MC-Unique: T6nAr4pwOJqGTQAD7Sr9Og-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 827E029A9CA2;
	Mon, 16 Jan 2023 16:02:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2979814171B8;
	Mon, 16 Jan 2023 16:02:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E30651946595;
	Mon, 16 Jan 2023 16:02:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8A4B31946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 16 Jan 2023 16:02:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7D7BB40C1141; Mon, 16 Jan 2023 16:02:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 766B140C6EC4
 for <cluster-devel@redhat.com>; Mon, 16 Jan 2023 16:02:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BD06101A52E
 for <cluster-devel@redhat.com>; Mon, 16 Jan 2023 16:02:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-yFHy7LOfMc2nu3pOAVuK8w-1; Mon, 16 Jan 2023 11:02:40 -0500
X-MC-Unique: yFHy7LOfMc2nu3pOAVuK8w-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pHRwP-00BBry-Hb; Mon, 16 Jan 2023 16:02:33 +0000
Date: Mon, 16 Jan 2023 08:02:33 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Y8V1GarEaTu0ytT0@infradead.org>
References: <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-5-agruenba@redhat.com>
 <20230109124642.1663842-1-agruenba@redhat.com>
 <Y70l9ZZXpERjPqFT@infradead.org>
 <Y71pWJ0JHwGrJ/iv@casper.infradead.org> <Y8QxYjy+4Kjg05rB@magnolia>
 <Y8QyqlAkLyysv8Qd@magnolia> <Y8TkmbZfe3L/Yeky@casper.infradead.org>
 <Y8T+Al0aqRcXWzwt@infradead.org>
 <Y8VOjyLW1Q4lbQvS@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <Y8VOjyLW1Q4lbQvS@casper.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [RFC v6 04/10] iomap: Add iomap_get_folio helper
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
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
 "Darrick J. Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 16, 2023 at 01:18:07PM +0000, Matthew Wilcox wrote:
> Essentially reverting 44835d20b2a0.

Yep.

> Although we retain the merging of
> the lock & get functions via the use of FGP flags.  Let me think about
> it for a day.

Yes.  But looking at the code again I wonder if even that is needed.
Out of the users of FGP_ENTRY / __filemap_get_folio_entry:

 - split_huge_pages_in_file really should not be using it at all,
   given that it checks for xa_is_value and treats that as !folio
 - one doesn't pass FGP_LOCK and could just use filemap_get_entry
 - the othr two are in shmem, so we could move the locking logic
   there (and maybe in future optimize it in the callers)

That would be something like this, although it should be split into
two or three patches:

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 29e1f9e76eb6dd..ecd1ff40a80621 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -504,9 +504,9 @@ pgoff_t page_cache_prev_miss(struct address_space *mapping,
 #define FGP_NOFS		0x00000010
 #define FGP_NOWAIT		0x00000020
 #define FGP_FOR_MMAP		0x00000040
-#define FGP_ENTRY		0x00000080
-#define FGP_STABLE		0x00000100
+#define FGP_STABLE		0x00000080
 
+void *filemap_get_entry(struct address_space *mapping, pgoff_t index);
 struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
 		int fgp_flags, gfp_t gfp);
 struct page *pagecache_get_page(struct address_space *mapping, pgoff_t index,
diff --git a/mm/filemap.c b/mm/filemap.c
index c4d4ace9cc7003..85bd86c44e14d2 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1832,7 +1832,7 @@ EXPORT_SYMBOL(page_cache_prev_miss);
  */
 
 /*
- * mapping_get_entry - Get a page cache entry.
+ * filemap_get_entry - Get a page cache entry.
  * @mapping: the address_space to search
  * @index: The page cache index.
  *
@@ -1843,7 +1843,7 @@ EXPORT_SYMBOL(page_cache_prev_miss);
  *
  * Return: The folio, swap or shadow entry, %NULL if nothing is found.
  */
-static void *mapping_get_entry(struct address_space *mapping, pgoff_t index)
+void *filemap_get_entry(struct address_space *mapping, pgoff_t index)
 {
 	XA_STATE(xas, &mapping->i_pages, index);
 	struct folio *folio;
@@ -1887,8 +1887,6 @@ static void *mapping_get_entry(struct address_space *mapping, pgoff_t index)
  *
  * * %FGP_ACCESSED - The folio will be marked accessed.
  * * %FGP_LOCK - The folio is returned locked.
- * * %FGP_ENTRY - If there is a shadow / swap / DAX entry, return it
- *   instead of allocating a new folio to replace it.
  * * %FGP_CREAT - If no page is present then a new page is allocated using
  *   @gfp and added to the page cache and the VM's LRU list.
  *   The page is returned locked and with an increased refcount.
@@ -1913,12 +1911,9 @@ struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
 	struct folio *folio;
 
 repeat:
-	folio = mapping_get_entry(mapping, index);
-	if (xa_is_value(folio)) {
-		if (fgp_flags & FGP_ENTRY)
-			return folio;
+	folio = filemap_get_entry(mapping, index);
+	if (xa_is_value(folio))
 		folio = NULL;
-	}
 	if (!folio)
 		goto no_page;
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index abe6cfd92ffa0e..b182eb99044e9a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3088,11 +3088,10 @@ static int split_huge_pages_in_file(const char *file_path, pgoff_t off_start,
 	mapping = candidate->f_mapping;
 
 	for (index = off_start; index < off_end; index += nr_pages) {
-		struct folio *folio = __filemap_get_folio(mapping, index,
-						FGP_ENTRY, 0);
+		struct folio *folio = filemap_get_folio(mapping, index);
 
 		nr_pages = 1;
-		if (xa_is_value(folio) || !folio)
+		if (!folio)
 			continue;
 
 		if (!folio_test_large(folio))
diff --git a/mm/shmem.c b/mm/shmem.c
index 028675cd97d445..4650192dbcb91b 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -880,6 +880,28 @@ void shmem_unlock_mapping(struct address_space *mapping)
 	}
 }
 
+static struct folio *shmem_get_entry(struct address_space *mapping,
+		pgoff_t index)
+{
+	struct folio *folio;
+
+repeat:
+	folio = filemap_get_entry(mapping, index);
+	if (folio && !xa_is_value(folio)) {
+		folio_lock(folio);
+
+		/* Has the page been truncated? */
+		if (unlikely(folio->mapping != mapping)) {
+			folio_unlock(folio);
+			folio_put(folio);
+			goto repeat;
+		}
+		VM_BUG_ON_FOLIO(!folio_contains(folio, index), folio);
+	}
+
+	return folio;
+}
+
 static struct folio *shmem_get_partial_folio(struct inode *inode, pgoff_t index)
 {
 	struct folio *folio;
@@ -888,8 +910,7 @@ static struct folio *shmem_get_partial_folio(struct inode *inode, pgoff_t index)
 	 * At first avoid shmem_get_folio(,,,SGP_READ): that fails
 	 * beyond i_size, and reports fallocated pages as holes.
 	 */
-	folio = __filemap_get_folio(inode->i_mapping, index,
-					FGP_ENTRY | FGP_LOCK, 0);
+	folio = shmem_get_entry(inode->i_mapping, index);
 	if (!xa_is_value(folio))
 		return folio;
 	/*
@@ -1860,7 +1881,7 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
 	sbinfo = SHMEM_SB(inode->i_sb);
 	charge_mm = vma ? vma->vm_mm : NULL;
 
-	folio = __filemap_get_folio(mapping, index, FGP_ENTRY | FGP_LOCK, 0);
+	folio = shmem_get_entry(mapping, index);
 	if (folio && vma && userfaultfd_minor(vma)) {
 		if (!xa_is_value(folio)) {
 			folio_unlock(folio);
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 2927507b43d819..e7f2083ad7e40a 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -384,7 +384,7 @@ struct folio *filemap_get_incore_folio(struct address_space *mapping,
 {
 	swp_entry_t swp;
 	struct swap_info_struct *si;
-	struct folio *folio = __filemap_get_folio(mapping, index, FGP_ENTRY, 0);
+	struct folio *folio = filemap_get_entry(mapping, index);
 
 	if (!xa_is_value(folio))
 		goto out;

