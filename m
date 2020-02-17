Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DE248161A23
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581965203;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9hRYRdWlCgho5dv/3LgNvZ16bPHXcBqSpCeeD06OKeI=;
	b=LidiQs7ZLJnA7y0bpzTrAN3Lapd+flkIyPVeHLylZTDVfpm1RSwKy5kHjDJ+skayHstQgG
	od3oS4XQcIO2p1pq/pIPzWpLZB9XYq+UMmmQHj9QQEUL4xfTJecaaWgY1Nt29rwzKpI4jR
	ZX1VOI7f2uvlup9HN7XFUu+U8pW+Eps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-YJVGz832NEyedR1GGdRB9g-1; Mon, 17 Feb 2020 13:46:41 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CB0E80256D;
	Mon, 17 Feb 2020 18:46:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A09310027A7;
	Mon, 17 Feb 2020 18:46:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F409618034EA;
	Mon, 17 Feb 2020 18:46:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HIkUrf024923 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 13:46:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E4FA710E51C3; Mon, 17 Feb 2020 18:46:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E069910E51B2
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C79F88001E5
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-320-pOLoGlizPEihruKxW6yEtg-1; Mon, 17 Feb 2020 13:46:26 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3lPL-00058n-CQ; Mon, 17 Feb 2020 18:46:15 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Feb 2020 10:45:44 -0800
Message-Id: <20200217184613.19668-4-willy@infradead.org>
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: pOLoGlizPEihruKxW6yEtg-1
X-MC-Unique: YJVGz832NEyedR1GGdRB9g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HIkUrf024923
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v6 03/19] mm: Use readahead_control to pass
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

In this patch, only between __do_page_cache_readahead() and
read_pages(), but it will be extended in upcoming patches.  Also add
the readahead_count() accessor.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/pagemap.h | 17 +++++++++++++++++
 mm/readahead.c          | 36 +++++++++++++++++++++---------------
 2 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index ccb14b6a16b5..982ecda2d4a2 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -630,6 +630,23 @@ static inline int add_to_page_cache(struct page *page,
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
+=09pgoff_t _start;
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
index 12d13b7792da..15329309231f 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -113,26 +113,29 @@ int read_cache_pages(struct address_space *mapping, s=
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
@@ -155,9 +158,13 @@ void __do_page_cache_readahead(struct address_space *m=
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
@@ -180,10 +187,9 @@ void __do_page_cache_readahead(struct address_space *m=
apping,
 =09=09=09 * contiguous pages before continuing with the next
 =09=09=09 * batch.
 =09=09=09 */
-=09=09=09if (nr_pages)
-=09=09=09=09read_pages(mapping, filp, &page_pool, nr_pages,
-=09=09=09=09=09=09gfp_mask);
-=09=09=09nr_pages =3D 0;
+=09=09=09if (readahead_count(&rac))
+=09=09=09=09read_pages(&rac, &page_pool, gfp_mask);
+=09=09=09rac._nr_pages =3D 0;
 =09=09=09continue;
 =09=09}
=20
@@ -194,7 +200,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09=09list_add(&page->lru, &page_pool);
 =09=09if (page_idx =3D=3D nr_to_read - lookahead_size)
 =09=09=09SetPageReadahead(page);
-=09=09nr_pages++;
+=09=09rac._nr_pages++;
 =09}
=20
 =09/*
@@ -202,8 +208,8 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09 * uptodate then the caller will launch readpage again, and
 =09 * will then handle the error.
 =09 */
-=09if (nr_pages)
-=09=09read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
+=09if (readahead_count(&rac))
+=09=09read_pages(&rac, &page_pool, gfp_mask);
 =09BUG_ON(!list_empty(&page_pool));
 }
=20
--=20
2.25.0


