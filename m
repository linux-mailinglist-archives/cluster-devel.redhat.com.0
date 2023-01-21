Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9AA6764D2
	for <lists+cluster-devel@lfdr.de>; Sat, 21 Jan 2023 08:03:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674284638;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YYpS3Y5p5Tks64mwSZy8Ca3HveuDUE7eUAUp6nFbmxA=;
	b=Nq6jVkRFq1kaRcC6D/WvK/XvMeGoQ5unPzdlUuXi+Oy4ZKAE1pXdfJoEaKs6WHXAHLB2vO
	6AlHQ2ZLWPLjhA0i+10nvyvfZYZ4CUFL++6PcaYGhrqmlufLoYYRYpHB1hYvop6PeorHFf
	geRkt/sUu8QP/JRzE7enFGPZnL+O/Fw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-DRXcePTRM0mS6Fado2b2mA-1; Sat, 21 Jan 2023 02:03:54 -0500
X-MC-Unique: DRXcePTRM0mS6Fado2b2mA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A96A1C0514A;
	Sat, 21 Jan 2023 07:03:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2ECCC15BAD;
	Sat, 21 Jan 2023 07:03:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B3A3219465B6;
	Sat, 21 Jan 2023 07:03:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 654271946586 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 21 Jan 2023 07:03:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3AFB22026D2A; Sat, 21 Jan 2023 07:03:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 332C52026D68
 for <cluster-devel@redhat.com>; Sat, 21 Jan 2023 07:03:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 149D7810C2A
 for <cluster-devel@redhat.com>; Sat, 21 Jan 2023 07:03:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-346-zs7bR8JsOSiYjCT6qJIMjA-1; Sat, 21 Jan 2023 02:03:50 -0500
X-MC-Unique: zs7bR8JsOSiYjCT6qJIMjA-1
Received: from [2001:4bb8:19a:2039:6754:cc81:9ace:36fc] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pJ7pI-00DSPB-Bf; Sat, 21 Jan 2023 06:58:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>
Date: Sat, 21 Jan 2023 07:57:52 +0100
Message-Id: <20230121065755.1140136-5-hch@lst.de>
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
Subject: [Cluster-devel] [PATCH 4/7] shmem: remove shmem_get_partial_folio
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add a new SGP_FIND mode for shmem_get_partial_folio that works like
SGP_READ, but does not check i_size.  Use that instead of open coding
the page cache lookup in shmem_get_partial_folio.  Note that this is
a behavior change in that it reads in swap cache entries for offsets
outside i_size, possibly causing a little bit of extra work.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/shmem_fs.h |  1 +
 mm/shmem.c               | 46 ++++++++++++----------------------------
 2 files changed, 15 insertions(+), 32 deletions(-)

diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
index d09d54be4ffd99..7ba160ac066e5e 100644
--- a/include/linux/shmem_fs.h
+++ b/include/linux/shmem_fs.h
@@ -105,6 +105,7 @@ enum sgp_type {
 	SGP_CACHE,	/* don't exceed i_size, may allocate page */
 	SGP_WRITE,	/* may exceed i_size, may allocate !Uptodate page */
 	SGP_FALLOC,	/* like SGP_WRITE, but make existing page Uptodate */
+	SGP_FIND,	/* like SGP_READ, but also read outside i_size */
 };
 
 int shmem_get_folio(struct inode *inode, pgoff_t index, struct folio **foliop,
diff --git a/mm/shmem.c b/mm/shmem.c
index de6fa3980c7d6b..a8371ffeeee54a 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -877,27 +877,6 @@ void shmem_unlock_mapping(struct address_space *mapping)
 	}
 }
 
-static struct folio *shmem_get_partial_folio(struct inode *inode, pgoff_t index)
-{
-	struct folio *folio;
-
-	/*
-	 * At first avoid shmem_get_folio(,,,SGP_READ): that fails
-	 * beyond i_size, and reports fallocated pages as holes.
-	 */
-	folio = __filemap_get_folio(inode->i_mapping, index,
-					FGP_ENTRY | FGP_LOCK, 0);
-	if (!xa_is_value(folio))
-		return folio;
-	/*
-	 * But read a page back from swap if any of it is within i_size
-	 * (although in some cases this is just a waste of time).
-	 */
-	folio = NULL;
-	shmem_get_folio(inode, index, &folio, SGP_READ);
-	return folio;
-}
-
 /*
  * Remove range of pages and swap entries from page cache, and free them.
  * If !unfalloc, truncate or punch hole; if unfalloc, undo failed fallocate.
@@ -957,7 +936,8 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, loff_t lend,
 		goto whole_folios;
 
 	same_folio = (lstart >> PAGE_SHIFT) == (lend >> PAGE_SHIFT);
-	folio = shmem_get_partial_folio(inode, lstart >> PAGE_SHIFT);
+	folio = NULL;
+	shmem_get_folio(inode, lstart >> PAGE_SHIFT, &folio, SGP_FIND);
 	if (folio) {
 		same_folio = lend < folio_pos(folio) + folio_size(folio);
 		folio_mark_dirty(folio);
@@ -971,14 +951,16 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, loff_t lend,
 		folio = NULL;
 	}
 
-	if (!same_folio)
-		folio = shmem_get_partial_folio(inode, lend >> PAGE_SHIFT);
-	if (folio) {
-		folio_mark_dirty(folio);
-		if (!truncate_inode_partial_folio(folio, lstart, lend))
-			end = folio->index;
-		folio_unlock(folio);
-		folio_put(folio);
+	if (!same_folio) {
+		folio = NULL;
+		shmem_get_folio(inode, lend >> PAGE_SHIFT, &folio, SGP_FIND);
+		if (folio) {
+			folio_mark_dirty(folio);
+			if (!truncate_inode_partial_folio(folio, lstart, lend))
+				end = folio->index;
+			folio_unlock(folio);
+			folio_put(folio);
+		}
 	}
 
 whole_folios:
@@ -1900,7 +1882,7 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
 		if (folio_test_uptodate(folio))
 			goto out;
 		/* fallocated folio */
-		if (sgp != SGP_READ)
+		if (sgp != SGP_READ && sgp != SGP_FIND)
 			goto clear;
 		folio_unlock(folio);
 		folio_put(folio);
@@ -1911,7 +1893,7 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
 	 * SGP_NOALLOC: fail on hole, with NULL folio, letting caller fail.
 	 */
 	*foliop = NULL;
-	if (sgp == SGP_READ)
+	if (sgp == SGP_READ || sgp == SGP_FIND)
 		return 0;
 	if (sgp == SGP_NOALLOC)
 		return -ENOENT;
-- 
2.39.0

