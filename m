Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5FD161A21
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581965203;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/zSnMKn0GCC6uaEr8Vliq8qfiIcEdZ1au5qjVwruSAw=;
	b=ZznN/Th7Fi+a8HBAq7L8ORGhBzByZHxRukGXTehw7A8/Vb+lMvWraVMfFnnhEQk+Sc1E/b
	u/SUD4V0GHHdyI3UI4QyScRuZNLJ4WmkkfWno62pO+pxu2zC7ZMe7c/bRY+hHOFwRMJEKB
	h2AXPp6GYHL4yfJ+5v4jJZpkEo9rstw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-7mjhj6lEO1CyYlLXGjFjNw-1; Mon, 17 Feb 2020 13:46:41 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA2B3190B2AE;
	Mon, 17 Feb 2020 18:46:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A520F8B54B;
	Mon, 17 Feb 2020 18:46:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A4C135AFF;
	Mon, 17 Feb 2020 18:46:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HIkTY2024904 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 13:46:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4FBB22166B2F; Mon, 17 Feb 2020 18:46:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B9E12166B27
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EE9E8012D2
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-65-7sqqqaNcOg-OJ45sRJaUow-1; Mon, 17 Feb 2020 13:46:26 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3lPL-00059T-KR; Mon, 17 Feb 2020 18:46:15 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Feb 2020 10:45:51 -0800
Message-Id: <20200217184613.19668-11-willy@infradead.org>
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: 7sqqqaNcOg-OJ45sRJaUow-1
X-MC-Unique: 7mjhj6lEO1CyYlLXGjFjNw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HIkTY2024904
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v6 07/16] mm: Add page_cache_readahead_limit
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

ext4 and f2fs have duplicated the guts of the readahead code so
they can read past i_size.  Instead, separate out the guts of the
readahead code so they can call it directly.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ext4/verity.c        | 35 ++-----------------------------
 fs/f2fs/verity.c        | 35 ++-----------------------------
 include/linux/pagemap.h |  4 ++++
 mm/readahead.c          | 46 +++++++++++++++++++++++++----------------
 4 files changed, 36 insertions(+), 84 deletions(-)

diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index dc5ec724d889..f6e0bf05933e 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -342,37 +342,6 @@ static int ext4_get_verity_descriptor(struct inode *in=
ode, void *buf,
 =09return desc_size;
 }
=20
-/*
- * Prefetch some pages from the file's Merkle tree.
- *
- * This is basically a stripped-down version of __do_page_cache_readahead(=
)
- * which works on pages past i_size.
- */
-static void ext4_merkle_tree_readahead(struct address_space *mapping,
-=09=09=09=09       pgoff_t start_index, unsigned long count)
-{
-=09LIST_HEAD(pages);
-=09unsigned int nr_pages =3D 0;
-=09struct page *page;
-=09pgoff_t index;
-=09struct blk_plug plug;
-
-=09for (index =3D start_index; index < start_index + count; index++) {
-=09=09page =3D xa_load(&mapping->i_pages, index);
-=09=09if (!page || xa_is_value(page)) {
-=09=09=09page =3D __page_cache_alloc(readahead_gfp_mask(mapping));
-=09=09=09if (!page)
-=09=09=09=09break;
-=09=09=09page->index =3D index;
-=09=09=09list_add(&page->lru, &pages);
-=09=09=09nr_pages++;
-=09=09}
-=09}
-=09blk_start_plug(&plug);
-=09ext4_mpage_readpages(mapping, &pages, NULL, nr_pages, true);
-=09blk_finish_plug(&plug);
-}
-
 static struct page *ext4_read_merkle_tree_page(struct inode *inode,
 =09=09=09=09=09       pgoff_t index,
 =09=09=09=09=09       unsigned long num_ra_pages)
@@ -386,8 +355,8 @@ static struct page *ext4_read_merkle_tree_page(struct i=
node *inode,
 =09=09if (page)
 =09=09=09put_page(page);
 =09=09else if (num_ra_pages > 1)
-=09=09=09ext4_merkle_tree_readahead(inode->i_mapping, index,
-=09=09=09=09=09=09   num_ra_pages);
+=09=09=09page_cache_readahead_limit(inode->i_mapping, NULL,
+=09=09=09=09=09index, LONG_MAX, num_ra_pages, 0);
 =09=09page =3D read_mapping_page(inode->i_mapping, index, NULL);
 =09}
 =09return page;
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index d7d430a6f130..71a3e36721fa 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -222,37 +222,6 @@ static int f2fs_get_verity_descriptor(struct inode *in=
ode, void *buf,
 =09return size;
 }
=20
-/*
- * Prefetch some pages from the file's Merkle tree.
- *
- * This is basically a stripped-down version of __do_page_cache_readahead(=
)
- * which works on pages past i_size.
- */
-static void f2fs_merkle_tree_readahead(struct address_space *mapping,
-=09=09=09=09       pgoff_t start_index, unsigned long count)
-{
-=09LIST_HEAD(pages);
-=09unsigned int nr_pages =3D 0;
-=09struct page *page;
-=09pgoff_t index;
-=09struct blk_plug plug;
-
-=09for (index =3D start_index; index < start_index + count; index++) {
-=09=09page =3D xa_load(&mapping->i_pages, index);
-=09=09if (!page || xa_is_value(page)) {
-=09=09=09page =3D __page_cache_alloc(readahead_gfp_mask(mapping));
-=09=09=09if (!page)
-=09=09=09=09break;
-=09=09=09page->index =3D index;
-=09=09=09list_add(&page->lru, &pages);
-=09=09=09nr_pages++;
-=09=09}
-=09}
-=09blk_start_plug(&plug);
-=09f2fs_mpage_readpages(mapping, &pages, NULL, nr_pages, true);
-=09blk_finish_plug(&plug);
-}
-
 static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
 =09=09=09=09=09       pgoff_t index,
 =09=09=09=09=09       unsigned long num_ra_pages)
@@ -266,8 +235,8 @@ static struct page *f2fs_read_merkle_tree_page(struct i=
node *inode,
 =09=09if (page)
 =09=09=09put_page(page);
 =09=09else if (num_ra_pages > 1)
-=09=09=09f2fs_merkle_tree_readahead(inode->i_mapping, index,
-=09=09=09=09=09=09   num_ra_pages);
+=09=09=09page_cache_readahead_limit(inode->i_mapping, NULL,
+=09=09=09=09=09index, LONG_MAX, num_ra_pages, 0);
 =09=09page =3D read_mapping_page(inode->i_mapping, index, NULL);
 =09}
 =09return page;
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index bd4291f78f41..4f36c06d064d 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -389,6 +389,10 @@ extern struct page * read_cache_page_gfp(struct addres=
s_space *mapping,
 =09=09=09=09pgoff_t index, gfp_t gfp_mask);
 extern int read_cache_pages(struct address_space *mapping,
 =09=09struct list_head *pages, filler_t *filler, void *data);
+void page_cache_readahead_limit(struct address_space *mapping,
+=09=09struct file *file, pgoff_t offset, pgoff_t end_index,
+=09=09unsigned long nr_to_read, unsigned long lookahead_size);
+
=20
 static inline struct page *read_mapping_page(struct address_space *mapping=
,
 =09=09=09=09pgoff_t index, void *data)
diff --git a/mm/readahead.c b/mm/readahead.c
index 5be7e1cb8666..566693f4e539 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -142,35 +142,21 @@ static void read_pages(struct readahead_control *rac,=
 struct list_head *pages)
 =09blk_finish_plug(&plug);
 }
=20
-/*
- * __do_page_cache_readahead() actually reads a chunk of disk.  It allocat=
es
- * the pages first, then submits them for I/O. This avoids the very bad
- * behaviour which would occur if page allocations are causing VM writebac=
k.
- * We really don't want to intermingle reads and writes like that.
- */
-void __do_page_cache_readahead(struct address_space *mapping,
-=09=09struct file *filp, pgoff_t offset, unsigned long nr_to_read,
-=09=09unsigned long lookahead_size)
+void page_cache_readahead_limit(struct address_space *mapping,
+=09=09struct file *file, pgoff_t offset, pgoff_t end_index,
+=09=09unsigned long nr_to_read, unsigned long lookahead_size)
 {
-=09struct inode *inode =3D mapping->host;
-=09unsigned long end_index;=09/* The last page we want to read */
 =09LIST_HEAD(page_pool);
 =09int page_idx;
-=09loff_t isize =3D i_size_read(inode);
 =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
 =09bool use_list =3D mapping->a_ops->readpages;
 =09struct readahead_control rac =3D {
 =09=09.mapping =3D mapping,
-=09=09.file =3D filp,
+=09=09.file =3D file,
 =09=09._start =3D offset,
 =09=09._nr_pages =3D 0,
 =09};
=20
-=09if (isize =3D=3D 0)
-=09=09return;
-
-=09end_index =3D ((isize - 1) >> PAGE_SHIFT);
-
 =09/*
 =09 * Preallocate as many pages as we will need.
 =09 */
@@ -225,6 +211,30 @@ void __do_page_cache_readahead(struct address_space *m=
apping,
 =09=09read_pages(&rac, &page_pool);
 =09BUG_ON(!list_empty(&page_pool));
 }
+EXPORT_SYMBOL_GPL(page_cache_readahead_limit);
+
+/*
+ * __do_page_cache_readahead() actually reads a chunk of disk.  It allocat=
es
+ * the pages first, then submits them for I/O. This avoids the very bad
+ * behaviour which would occur if page allocations are causing VM writebac=
k.
+ * We really don't want to intermingle reads and writes like that.
+ */
+void __do_page_cache_readahead(struct address_space *mapping,
+=09=09struct file *file, pgoff_t offset, unsigned long nr_to_read,
+=09=09unsigned long lookahead_size)
+{
+=09struct inode *inode =3D mapping->host;
+=09unsigned long end_index;=09/* The last page we want to read */
+=09loff_t isize =3D i_size_read(inode);
+
+=09if (isize =3D=3D 0)
+=09=09return;
+
+=09end_index =3D ((isize - 1) >> PAGE_SHIFT);
+
+=09page_cache_readahead_limit(mapping, file, offset, end_index,
+=09=09=09nr_to_read, lookahead_size);
+}
=20
 /*
  * Chunk the readahead into 2 megabyte units, so that we don't pin too muc=
h
--=20
2.25.0


