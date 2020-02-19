Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9C110165090
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 22:01:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582146088;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cO0fhztAKaJEFytkphkX5ogR9xiafCTEGr71mHjcyVY=;
	b=CEuyHvmjbdMVLiEsbKwNdcN1jMbD/P92SOUyxEnXgrmnnVH0Jl1nu598eQ67f6QisDoInE
	ko/qIEgz+dP/VS2cpcV/AZqzT4saOJs/GjLbUFOZLqYfxJ5haV5yCofMGl3pX3LwFZW3CY
	9fSwvKhdbF/x4dGy3HF7Amn0itD4XSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-ciVXrxPSMl-uYijP6QqCQw-1; Wed, 19 Feb 2020 16:01:26 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BB41DB6D;
	Wed, 19 Feb 2020 21:01:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F033960C88;
	Wed, 19 Feb 2020 21:01:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB66735AFD;
	Wed, 19 Feb 2020 21:01:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JL1HX4001871 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 16:01:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DF5312028CD4; Wed, 19 Feb 2020 21:01:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA6F52028CD3
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7715800294
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-259-YciFCZEEO0aS2KhvKue0TA-1; Wed, 19 Feb 2020 16:01:11 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4WSu-0008TW-Tg; Wed, 19 Feb 2020 21:01:04 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 19 Feb 2020 13:00:44 -0800
Message-Id: <20200219210103.32400-6-willy@infradead.org>
In-Reply-To: <20200219210103.32400-1-willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: YciFCZEEO0aS2KhvKue0TA-1
X-MC-Unique: ciVXrxPSMl-uYijP6QqCQw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JL1HX4001871
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v7 05/24] mm: Use readahead_control to pass
	arguments
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

In this patch, only between __do_page_cache_readahead() and
read_pages(), but it will be extended in upcoming patches.  Also add
the readahead_count() accessor.  The read_pages() function becomes aops
centric, as this makes the most sense by the end of the patchset.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 include/linux/pagemap.h | 17 +++++++++++++++++
 mm/readahead.c          | 34 ++++++++++++++++++++--------------
 2 files changed, 37 insertions(+), 14 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 24894b9b90c9..55fcea0249e6 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -638,6 +638,23 @@ static inline int add_to_page_cache(struct page *page,
 =09return error;
 }
=20
+/*
+ * Readahead is of a block of consecutive pages.
+ */
+struct readahead_control {
+=09struct file *file;
+=09struct address_space *mapping;
+/* private: use the readahead_* accessors instead */
+=09pgoff_t _index;
+=09unsigned int _nr_pages;
+};
+
+/* The number of pages in this readahead block */
+static inline unsigned int readahead_count(struct readahead_control *rac)
+{
+=09return rac->_nr_pages;
+}
+
 static inline unsigned long dir_pages(struct inode *inode)
 {
 =09return (unsigned long)(inode->i_size + PAGE_SIZE - 1) >>
diff --git a/mm/readahead.c b/mm/readahead.c
index 9fcd4e32b62d..6a9d99229bd6 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -113,29 +113,32 @@ int read_cache_pages(struct address_space *mapping, s=
truct list_head *pages,
=20
 EXPORT_SYMBOL(read_cache_pages);
=20
-static void read_pages(struct address_space *mapping, struct file *filp,
-=09=09struct list_head *pages, unsigned int nr_pages, gfp_t gfp)
+static void read_pages(struct readahead_control *rac, struct list_head *pa=
ges,
+=09=09gfp_t gfp)
 {
+=09const struct address_space_operations *aops =3D rac->mapping->a_ops;
 =09struct blk_plug plug;
 =09unsigned page_idx;
=20
-=09if (!nr_pages)
+=09if (!readahead_count(rac))
 =09=09return;
=20
 =09blk_start_plug(&plug);
=20
-=09if (mapping->a_ops->readpages) {
-=09=09mapping->a_ops->readpages(filp, mapping, pages, nr_pages);
+=09if (aops->readpages) {
+=09=09aops->readpages(rac->file, rac->mapping, pages,
+=09=09=09=09readahead_count(rac));
 =09=09/* Clean up the remaining pages */
 =09=09put_pages_list(pages);
 =09=09goto out;
 =09}
=20
-=09for (page_idx =3D 0; page_idx < nr_pages; page_idx++) {
+=09for (page_idx =3D 0; page_idx < readahead_count(rac); page_idx++) {
 =09=09struct page *page =3D lru_to_page(pages);
 =09=09list_del(&page->lru);
-=09=09if (!add_to_page_cache_lru(page, mapping, page->index, gfp))
-=09=09=09mapping->a_ops->readpage(filp, page);
+=09=09if (!add_to_page_cache_lru(page, rac->mapping, page->index,
+=09=09=09=09gfp))
+=09=09=09aops->readpage(rac->file, page);
 =09=09put_page(page);
 =09}
=20
@@ -143,6 +146,7 @@ static void read_pages(struct address_space *mapping, s=
truct file *filp,
 =09blk_finish_plug(&plug);
=20
 =09BUG_ON(!list_empty(pages));
+=09rac->_nr_pages =3D 0;
 }
=20
 /*
@@ -160,9 +164,13 @@ void __do_page_cache_readahead(struct address_space *m=
apping,
 =09unsigned long end_index;=09/* The last page we want to read */
 =09LIST_HEAD(page_pool);
 =09int page_idx;
-=09unsigned int nr_pages =3D 0;
 =09loff_t isize =3D i_size_read(inode);
 =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
+=09struct readahead_control rac =3D {
+=09=09.mapping =3D mapping,
+=09=09.file =3D filp,
+=09=09._nr_pages =3D 0,
+=09};
=20
 =09if (isize =3D=3D 0)
 =09=09return;
@@ -185,9 +193,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09=09=09 * contiguous pages before continuing with the next
 =09=09=09 * batch.
 =09=09=09 */
-=09=09=09read_pages(mapping, filp, &page_pool, nr_pages,
-=09=09=09=09=09=09gfp_mask);
-=09=09=09nr_pages =3D 0;
+=09=09=09read_pages(&rac, &page_pool, gfp_mask);
 =09=09=09continue;
 =09=09}
=20
@@ -198,7 +204,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09=09list_add(&page->lru, &page_pool);
 =09=09if (page_idx =3D=3D nr_to_read - lookahead_size)
 =09=09=09SetPageReadahead(page);
-=09=09nr_pages++;
+=09=09rac._nr_pages++;
 =09}
=20
 =09/*
@@ -206,7 +212,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09 * uptodate then the caller will launch readpage again, and
 =09 * will then handle the error.
 =09 */
-=09read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
+=09read_pages(&rac, &page_pool, gfp_mask);
 }
=20
 /*
--=20
2.25.0


