Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 25ACF1A80D8
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Apr 2020 17:03:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586876586;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NXMrSZUXhpKxIo7+59c/LFcFPnNm8mVvPn8MwvRsu+8=;
	b=PRo1UIle0Ddf2sJQnjCt68QBfmHWXfrraNof81IQ/elicsh0UzSjewHytHEYzjjrwglZPw
	ex2/TbVosTJET6zlJOBqUC8qJggwWgNy4qsbVqytsBMAjZSBbtEpxrYdrn4nJKyaNhxILC
	zx5TVkpZM7xdzYYTc95UMwyv1075M40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-fRHGE7mHPwWOZrdC9klP3g-1; Tue, 14 Apr 2020 11:03:03 -0400
X-MC-Unique: fRHGE7mHPwWOZrdC9klP3g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28B99149C3;
	Tue, 14 Apr 2020 15:03:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11934272AF;
	Tue, 14 Apr 2020 15:03:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E675F93068;
	Tue, 14 Apr 2020 15:03:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03EF2pCh014821 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 11:02:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D6556ED160; Tue, 14 Apr 2020 15:02:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1ECE76CF
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B475880177E
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-34-dVi942cvOrmD1Vmkxf4xSA-1; Tue, 14 Apr 2020 11:02:49 -0400
X-MC-Unique: dVi942cvOrmD1Vmkxf4xSA-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jON5A-0006Or-5i; Tue, 14 Apr 2020 15:02:36 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 08:02:21 -0700
Message-Id: <20200414150233.24495-14-willy@infradead.org>
In-Reply-To: <20200414150233.24495-1-willy@infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03EF2pCh014821
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v11 13/25] mm: Add
	page_cache_readahead_unbounded
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

ext4 and f2fs have duplicated the guts of the readahead code so
they can read past i_size.  Instead, separate out the guts of the
readahead code so they can call it directly.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Tested-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/verity.c        | 35 ++-------------------
 fs/f2fs/data.c          |  2 +-
 fs/f2fs/f2fs.h          |  3 --
 fs/f2fs/verity.c        | 35 ++-------------------
 include/linux/pagemap.h |  3 ++
 mm/readahead.c          | 68 ++++++++++++++++++++++++++++-------------
 6 files changed, 55 insertions(+), 91 deletions(-)

diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index dc5ec724d889..dec1244dd062 100644
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
+=09=09=09page_cache_readahead_unbounded(inode->i_mapping, NULL,
+=09=09=09=09=09index, num_ra_pages, 0);
 =09=09page =3D read_mapping_page(inode->i_mapping, index, NULL);
 =09}
 =09return page;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index cdf2f626bea7..ae14e952df4f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2177,7 +2177,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, st=
ruct bio **bio_ret,
  * use ->readpage() or do the necessary surgery to decouple ->readpages()
  * from read-ahead.
  */
-int f2fs_mpage_readpages(struct address_space *mapping,
+static int f2fs_mpage_readpages(struct address_space *mapping,
 =09=09=09struct list_head *pages, struct page *page,
 =09=09=09unsigned nr_pages, bool is_readahead)
 {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ba470d5687fe..9205567c5e8e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3373,9 +3373,6 @@ int f2fs_reserve_new_block(struct dnode_of_data *dn);
 int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index);
 int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from);
 int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index);
-int f2fs_mpage_readpages(struct address_space *mapping,
-=09=09=09struct list_head *pages, struct page *page,
-=09=09=09unsigned nr_pages, bool is_readahead);
 struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 =09=09=09int op_flags, bool for_write);
 struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index);
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index d7d430a6f130..865c9fb774fb 100644
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
+=09=09=09page_cache_readahead_unbounded(inode->i_mapping, NULL,
+=09=09=09=09=09index, num_ra_pages, 0);
 =09=09page =3D read_mapping_page(inode->i_mapping, index, NULL);
 =09}
 =09return page;
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index a6eccfd2c80b..36bfc9d855bb 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -622,6 +622,9 @@ void page_cache_sync_readahead(struct address_space *, =
struct file_ra_state *,
 void page_cache_async_readahead(struct address_space *, struct file_ra_sta=
te *,
 =09=09struct file *, struct page *, pgoff_t index,
 =09=09unsigned long req_count);
+void page_cache_readahead_unbounded(struct address_space *, struct file *,
+=09=09pgoff_t index, unsigned long nr_to_read,
+=09=09unsigned long lookahead_count);
=20
 /*
  * Like add_to_page_cache_locked, but used to add newly allocated pages:
diff --git a/mm/readahead.c b/mm/readahead.c
index 998fdd23c0b1..ae231a5312cb 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -156,37 +156,34 @@ static void read_pages(struct readahead_control *rac,=
 struct list_head *pages,
 =09=09rac->_index++;
 }
=20
-/*
- * __do_page_cache_readahead() actually reads a chunk of disk.  It allocat=
es
- * the pages first, then submits them for I/O. This avoids the very bad
- * behaviour which would occur if page allocations are causing VM writebac=
k.
- * We really don't want to intermingle reads and writes like that.
+/**
+ * page_cache_readahead_unbounded - Start unchecked readahead.
+ * @mapping: File address space.
+ * @file: This instance of the open file; used for authentication.
+ * @index: First page index to read.
+ * @nr_to_read: The number of pages to read.
+ * @lookahead_size: Where to start the next readahead.
+ *
+ * This function is for filesystems to call when they want to start
+ * readahead beyond a file's stated i_size.  This is almost certainly
+ * not the function you want to call.  Use page_cache_async_readahead()
+ * or page_cache_sync_readahead() instead.
+ *
+ * Context: File is referenced by caller.  Mutexes may be held by caller.
+ * May sleep, but will not reenter filesystem to reclaim memory.
  */
-void __do_page_cache_readahead(struct address_space *mapping,
-=09=09struct file *filp, pgoff_t index, unsigned long nr_to_read,
+void page_cache_readahead_unbounded(struct address_space *mapping,
+=09=09struct file *file, pgoff_t index, unsigned long nr_to_read,
 =09=09unsigned long lookahead_size)
 {
-=09struct inode *inode =3D mapping->host;
 =09LIST_HEAD(page_pool);
-=09loff_t isize =3D i_size_read(inode);
 =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
 =09struct readahead_control rac =3D {
 =09=09.mapping =3D mapping,
-=09=09.file =3D filp,
+=09=09.file =3D file,
 =09=09._index =3D index,
 =09};
 =09unsigned long i;
-=09pgoff_t end_index;=09/* The last page we want to read */
-
-=09if (isize =3D=3D 0)
-=09=09return;
-
-=09end_index =3D (isize - 1) >> PAGE_SHIFT;
-=09if (index > end_index)
-=09=09return;
-=09/* Don't read past the page containing the last byte of the file */
-=09if (nr_to_read > end_index - index)
-=09=09nr_to_read =3D end_index - index + 1;
=20
 =09/*
 =09 * Preallocate as many pages as we will need.
@@ -230,6 +227,35 @@ void __do_page_cache_readahead(struct address_space *m=
apping,
 =09 */
 =09read_pages(&rac, &page_pool, false);
 }
+EXPORT_SYMBOL_GPL(page_cache_readahead_unbounded);
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
+=09=09struct file *file, pgoff_t index, unsigned long nr_to_read,
+=09=09unsigned long lookahead_size)
+{
+=09struct inode *inode =3D mapping->host;
+=09loff_t isize =3D i_size_read(inode);
+=09pgoff_t end_index;=09/* The last page we want to read */
+
+=09if (isize =3D=3D 0)
+=09=09return;
+
+=09end_index =3D (isize - 1) >> PAGE_SHIFT;
+=09if (index > end_index)
+=09=09return;
+=09/* Don't read past the page containing the last byte of the file */
+=09if (nr_to_read > end_index - index)
+=09=09nr_to_read =3D end_index - index + 1;
+
+=09page_cache_readahead_unbounded(mapping, file, index, nr_to_read,
+=09=09=09lookahead_size);
+}
=20
 /*
  * Chunk the readahead into 2 megabyte units, so that we don't pin too muc=
h
--=20
2.25.1


