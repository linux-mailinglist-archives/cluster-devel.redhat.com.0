Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2762216507E
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 22:01:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582146085;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rqTltocUdbcOQDLDFNuP6LQM0w27JYYPXlRUkPPrWL0=;
	b=S6prVy1E1QwUmjEXIOH2Q0uMi3UJlkNSfWL579+wfpKGPI9uId1xgRkmMu27onlKMwfM/2
	vn76c1jvXZuEFFXnbqwemh5YsHGO8QMuZuxL413/419vlDx13b1btDfpYdDVAoO2O/8iYL
	LObet3V39AdId3Mx0k1H70SF/TCxE7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-40kBjJ7LO3yHXZ8xW-cEoQ-1; Wed, 19 Feb 2020 16:01:23 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45F41107ACCA;
	Wed, 19 Feb 2020 21:01:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2878E19C4F;
	Wed, 19 Feb 2020 21:01:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81C2818089CF;
	Wed, 19 Feb 2020 21:01:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JL1Fin001787 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 16:01:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 492BBF9AA1; Wed, 19 Feb 2020 21:01:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43E72F9AA7
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5785385A304
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-357-coeO329FOvmBhDtXx3tsuw-1; Wed, 19 Feb 2020 16:01:10 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4WSv-0008Tm-1k; Wed, 19 Feb 2020 21:01:05 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 19 Feb 2020 13:00:48 -0800
Message-Id: <20200219210103.32400-10-willy@infradead.org>
In-Reply-To: <20200219210103.32400-1-willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: coeO329FOvmBhDtXx3tsuw-1
X-MC-Unique: 40kBjJ7LO3yHXZ8xW-cEoQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JL1Fin001787
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v7 09/24] mm: Put readahead pages in cache
	earlier
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

When populating the page cache for readahead, mappings that use
->readpages must populate the page cache themselves as the pages are
passed on a linked list which would normally be used for the page cache's
LRU.  For mappings that use ->readpage or the upcoming ->readahead method,
we can put the pages into the page cache as soon as they're allocated,
which solves a race between readahead and direct IO.  It also lets us
remove the gfp argument from read_pages().

Use the new readahead_page() API to implement the repeated calls to
->readpage(), just like most filesystems will.  This iterator also
supports huge pages, even though none of the filesystems have been
converted to use them yet.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/pagemap.h | 20 +++++++++++++++++
 mm/readahead.c          | 48 +++++++++++++++++++++++++----------------
 2 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 55fcea0249e6..4989d330fada 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -647,8 +647,28 @@ struct readahead_control {
 /* private: use the readahead_* accessors instead */
 =09pgoff_t _index;
 =09unsigned int _nr_pages;
+=09unsigned int _batch_count;
 };
=20
+static inline struct page *readahead_page(struct readahead_control *rac)
+{
+=09struct page *page;
+
+=09BUG_ON(rac->_batch_count > rac->_nr_pages);
+=09rac->_nr_pages -=3D rac->_batch_count;
+=09rac->_index +=3D rac->_batch_count;
+=09rac->_batch_count =3D 0;
+
+=09if (!rac->_nr_pages)
+=09=09return NULL;
+
+=09page =3D xa_load(&rac->mapping->i_pages, rac->_index);
+=09VM_BUG_ON_PAGE(!PageLocked(page), page);
+=09rac->_batch_count =3D hpage_nr_pages(page);
+
+=09return page;
+}
+
 /* The number of pages in this readahead block */
 static inline unsigned int readahead_count(struct readahead_control *rac)
 {
diff --git a/mm/readahead.c b/mm/readahead.c
index 83df5c061d33..aaa209559ba2 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -113,15 +113,14 @@ int read_cache_pages(struct address_space *mapping, s=
truct list_head *pages,
=20
 EXPORT_SYMBOL(read_cache_pages);
=20
-static void read_pages(struct readahead_control *rac, struct list_head *pa=
ges,
-=09=09gfp_t gfp)
+static void read_pages(struct readahead_control *rac, struct list_head *pa=
ges)
 {
 =09const struct address_space_operations *aops =3D rac->mapping->a_ops;
+=09struct page *page;
 =09struct blk_plug plug;
-=09unsigned page_idx;
=20
 =09if (!readahead_count(rac))
-=09=09return;
+=09=09goto out;
=20
 =09blk_start_plug(&plug);
=20
@@ -130,23 +129,23 @@ static void read_pages(struct readahead_control *rac,=
 struct list_head *pages,
 =09=09=09=09readahead_count(rac));
 =09=09/* Clean up the remaining pages */
 =09=09put_pages_list(pages);
-=09=09goto out;
-=09}
-
-=09for (page_idx =3D 0; page_idx < readahead_count(rac); page_idx++) {
-=09=09struct page *page =3D lru_to_page(pages);
-=09=09list_del(&page->lru);
-=09=09if (!add_to_page_cache_lru(page, rac->mapping, page->index,
-=09=09=09=09gfp))
+=09=09rac->_index +=3D rac->_nr_pages;
+=09=09rac->_nr_pages =3D 0;
+=09} else {
+=09=09while ((page =3D readahead_page(rac))) {
 =09=09=09aops->readpage(rac->file, page);
-=09=09put_page(page);
+=09=09=09put_page(page);
+=09=09}
 =09}
=20
-out:
 =09blk_finish_plug(&plug);
=20
 =09BUG_ON(!list_empty(pages));
-=09rac->_nr_pages =3D 0;
+=09BUG_ON(readahead_count(rac));
+
+out:
+=09/* If we were called due to a conflicting page, skip over it */
+=09rac->_index++;
 }
=20
 /*
@@ -165,9 +164,11 @@ void __do_page_cache_readahead(struct address_space *m=
apping,
 =09LIST_HEAD(page_pool);
 =09loff_t isize =3D i_size_read(inode);
 =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
+=09bool use_list =3D mapping->a_ops->readpages;
 =09struct readahead_control rac =3D {
 =09=09.mapping =3D mapping,
 =09=09.file =3D filp,
+=09=09._index =3D index,
 =09=09._nr_pages =3D 0,
 =09};
 =09unsigned long i;
@@ -184,6 +185,8 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09=09if (index + i > end_index)
 =09=09=09break;
=20
+=09=09BUG_ON(index + i !=3D rac._index + rac._nr_pages);
+
 =09=09page =3D xa_load(&mapping->i_pages, index + i);
 =09=09if (page && !xa_is_value(page)) {
 =09=09=09/*
@@ -191,15 +194,22 @@ void __do_page_cache_readahead(struct address_space *=
mapping,
 =09=09=09 * contiguous pages before continuing with the next
 =09=09=09 * batch.
 =09=09=09 */
-=09=09=09read_pages(&rac, &page_pool, gfp_mask);
+=09=09=09read_pages(&rac, &page_pool);
 =09=09=09continue;
 =09=09}
=20
 =09=09page =3D __page_cache_alloc(gfp_mask);
 =09=09if (!page)
 =09=09=09break;
-=09=09page->index =3D index + i;
-=09=09list_add(&page->lru, &page_pool);
+=09=09if (use_list) {
+=09=09=09page->index =3D index + i;
+=09=09=09list_add(&page->lru, &page_pool);
+=09=09} else if (add_to_page_cache_lru(page, mapping, index + i,
+=09=09=09=09=09gfp_mask) < 0) {
+=09=09=09put_page(page);
+=09=09=09read_pages(&rac, &page_pool);
+=09=09=09continue;
+=09=09}
 =09=09if (i =3D=3D nr_to_read - lookahead_size)
 =09=09=09SetPageReadahead(page);
 =09=09rac._nr_pages++;
@@ -210,7 +220,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09 * uptodate then the caller will launch readpage again, and
 =09 * will then handle the error.
 =09 */
-=09read_pages(&rac, &page_pool, gfp_mask);
+=09read_pages(&rac, &page_pool);
 }
=20
 /*
--=20
2.25.0


