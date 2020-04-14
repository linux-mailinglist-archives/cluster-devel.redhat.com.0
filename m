Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E50141A80E1
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Apr 2020 17:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586876587;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FPeTtCFemcA33jdgQFuF/61FKJT+lSSkpN0k5huawkU=;
	b=I2lX7s+C7pr3d1kufddkEE9rIY0V6kyPJuBpghtdANSDGG/PKihxUimpfw44aAazVC7+pV
	HjxwcW+bv6KnYCbsu4NBfpJJkO5rF2gRY81W6IjLBCIOQkCkP1ji0LDqR/6FFHFGw1cEse
	oj8wByLf4TZMav4iMaTYZ04dYmX9cOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-1cC_ksb7PY6SG49kJmnF7Q-1; Tue, 14 Apr 2020 11:03:04 -0400
X-MC-Unique: 1cC_ksb7PY6SG49kJmnF7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7017192296C;
	Tue, 14 Apr 2020 15:03:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A16F69F99D;
	Tue, 14 Apr 2020 15:03:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8807B9306D;
	Tue, 14 Apr 2020 15:03:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03EF2qjU014834 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 11:02:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 66F132166B2B; Tue, 14 Apr 2020 15:02:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62B522166B2A
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4160D868CA7
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-505-ms8FUjF4Mg2Ge6jMR-RA9Q-1; Tue, 14 Apr 2020 11:02:49 -0400
X-MC-Unique: ms8FUjF4Mg2Ge6jMR-RA9Q-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jON5A-0006Pj-Kb; Tue, 14 Apr 2020 15:02:36 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 08:02:33 -0700
Message-Id: <20200414150233.24495-26-willy@infradead.org>
In-Reply-To: <20200414150233.24495-1-willy@infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03EF2qjU014834
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	"Darrick J . Wong" <darrick.wong@oracle.com>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v11 25/25] iomap: Convert from readpages to
	readahead
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Use the new readahead operation in iomap.  Convert XFS and ZoneFS to
use it.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 fs/iomap/buffered-io.c | 90 +++++++++++++++---------------------------
 fs/iomap/trace.h       |  2 +-
 fs/xfs/xfs_aops.c      | 13 +++---
 fs/zonefs/super.c      |  7 ++--
 include/linux/iomap.h  |  3 +-
 5 files changed, 41 insertions(+), 74 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 075db1e71b14..890c8fcda4f3 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -214,9 +214,8 @@ iomap_read_end_io(struct bio *bio)
 struct iomap_readpage_ctx {
 =09struct page=09=09*cur_page;
 =09bool=09=09=09cur_page_in_bio;
-=09bool=09=09=09is_readahead;
 =09struct bio=09=09*bio;
-=09struct list_head=09*pages;
+=09struct readahead_control *rac;
 };
=20
 static void
@@ -308,7 +307,7 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, l=
off_t length, void *data,
 =09=09if (ctx->bio)
 =09=09=09submit_bio(ctx->bio);
=20
-=09=09if (ctx->is_readahead) /* same as readahead_gfp_mask */
+=09=09if (ctx->rac) /* same as readahead_gfp_mask */
 =09=09=09gfp |=3D __GFP_NORETRY | __GFP_NOWARN;
 =09=09ctx->bio =3D bio_alloc(gfp, min(BIO_MAX_PAGES, nr_vecs));
 =09=09/*
@@ -319,7 +318,7 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, l=
off_t length, void *data,
 =09=09if (!ctx->bio)
 =09=09=09ctx->bio =3D bio_alloc(orig_gfp, 1);
 =09=09ctx->bio->bi_opf =3D REQ_OP_READ;
-=09=09if (ctx->is_readahead)
+=09=09if (ctx->rac)
 =09=09=09ctx->bio->bi_opf |=3D REQ_RAHEAD;
 =09=09ctx->bio->bi_iter.bi_sector =3D sector;
 =09=09bio_set_dev(ctx->bio, iomap->bdev);
@@ -375,36 +374,8 @@ iomap_readpage(struct page *page, const struct iomap_o=
ps *ops)
 }
 EXPORT_SYMBOL_GPL(iomap_readpage);
=20
-static struct page *
-iomap_next_page(struct inode *inode, struct list_head *pages, loff_t pos,
-=09=09loff_t length, loff_t *done)
-{
-=09while (!list_empty(pages)) {
-=09=09struct page *page =3D lru_to_page(pages);
-
-=09=09if (page_offset(page) >=3D (u64)pos + length)
-=09=09=09break;
-
-=09=09list_del(&page->lru);
-=09=09if (!add_to_page_cache_lru(page, inode->i_mapping, page->index,
-=09=09=09=09GFP_NOFS))
-=09=09=09return page;
-
-=09=09/*
-=09=09 * If we already have a page in the page cache at index we are
-=09=09 * done.  Upper layers don't care if it is uptodate after the
-=09=09 * readpages call itself as every page gets checked again once
-=09=09 * actually needed.
-=09=09 */
-=09=09*done +=3D PAGE_SIZE;
-=09=09put_page(page);
-=09}
-
-=09return NULL;
-}
-
 static loff_t
-iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
+iomap_readahead_actor(struct inode *inode, loff_t pos, loff_t length,
 =09=09void *data, struct iomap *iomap, struct iomap *srcmap)
 {
 =09struct iomap_readpage_ctx *ctx =3D data;
@@ -418,10 +389,7 @@ iomap_readpages_actor(struct inode *inode, loff_t pos,=
 loff_t length,
 =09=09=09ctx->cur_page =3D NULL;
 =09=09}
 =09=09if (!ctx->cur_page) {
-=09=09=09ctx->cur_page =3D iomap_next_page(inode, ctx->pages,
-=09=09=09=09=09pos, length, &done);
-=09=09=09if (!ctx->cur_page)
-=09=09=09=09break;
+=09=09=09ctx->cur_page =3D readahead_page(ctx->rac);
 =09=09=09ctx->cur_page_in_bio =3D false;
 =09=09}
 =09=09ret =3D iomap_readpage_actor(inode, pos + done, length - done,
@@ -431,32 +399,43 @@ iomap_readpages_actor(struct inode *inode, loff_t pos=
, loff_t length,
 =09return done;
 }
=20
-int
-iomap_readpages(struct address_space *mapping, struct list_head *pages,
-=09=09unsigned nr_pages, const struct iomap_ops *ops)
+/**
+ * iomap_readahead - Attempt to read pages from a file.
+ * @rac: Describes the pages to be read.
+ * @ops: The operations vector for the filesystem.
+ *
+ * This function is for filesystems to call to implement their readahead
+ * address_space operation.
+ *
+ * Context: The @ops callbacks may submit I/O (eg to read the addresses of
+ * blocks from disc), and may wait for it.  The caller may be trying to
+ * access a different page, and so sleeping excessively should be avoided.
+ * It may allocate memory, but should avoid costly allocations.  This
+ * function is called with memalloc_nofs set, so allocations will not caus=
e
+ * the filesystem to be reentered.
+ */
+void iomap_readahead(struct readahead_control *rac, const struct iomap_ops=
 *ops)
 {
+=09struct inode *inode =3D rac->mapping->host;
+=09loff_t pos =3D readahead_pos(rac);
+=09loff_t length =3D readahead_length(rac);
 =09struct iomap_readpage_ctx ctx =3D {
-=09=09.pages=09=09=3D pages,
-=09=09.is_readahead=09=3D true,
+=09=09.rac=09=3D rac,
 =09};
-=09loff_t pos =3D page_offset(list_entry(pages->prev, struct page, lru));
-=09loff_t last =3D page_offset(list_entry(pages->next, struct page, lru));
-=09loff_t length =3D last - pos + PAGE_SIZE, ret =3D 0;
=20
-=09trace_iomap_readpages(mapping->host, nr_pages);
+=09trace_iomap_readahead(inode, readahead_count(rac));
=20
 =09while (length > 0) {
-=09=09ret =3D iomap_apply(mapping->host, pos, length, 0, ops,
-=09=09=09=09&ctx, iomap_readpages_actor);
+=09=09loff_t ret =3D iomap_apply(inode, pos, length, 0, ops,
+=09=09=09=09&ctx, iomap_readahead_actor);
 =09=09if (ret <=3D 0) {
 =09=09=09WARN_ON_ONCE(ret =3D=3D 0);
-=09=09=09goto done;
+=09=09=09break;
 =09=09}
 =09=09pos +=3D ret;
 =09=09length -=3D ret;
 =09}
-=09ret =3D 0;
-done:
+
 =09if (ctx.bio)
 =09=09submit_bio(ctx.bio);
 =09if (ctx.cur_page) {
@@ -464,15 +443,8 @@ iomap_readpages(struct address_space *mapping, struct =
list_head *pages,
 =09=09=09unlock_page(ctx.cur_page);
 =09=09put_page(ctx.cur_page);
 =09}
-
-=09/*
-=09 * Check that we didn't lose a page due to the arcance calling
-=09 * conventions..
-=09 */
-=09WARN_ON_ONCE(!ret && !list_empty(ctx.pages));
-=09return ret;
 }
-EXPORT_SYMBOL_GPL(iomap_readpages);
+EXPORT_SYMBOL_GPL(iomap_readahead);
=20
 /*
  * iomap_is_partially_uptodate checks whether blocks within a page are
diff --git a/fs/iomap/trace.h b/fs/iomap/trace.h
index 4df19c66f597..5693a39d52fb 100644
--- a/fs/iomap/trace.h
+++ b/fs/iomap/trace.h
@@ -39,7 +39,7 @@ DEFINE_EVENT(iomap_readpage_class, name,=09\
 =09TP_PROTO(struct inode *inode, int nr_pages), \
 =09TP_ARGS(inode, nr_pages))
 DEFINE_READPAGE_EVENT(iomap_readpage);
-DEFINE_READPAGE_EVENT(iomap_readpages);
+DEFINE_READPAGE_EVENT(iomap_readahead);
=20
 DECLARE_EVENT_CLASS(iomap_range_class,
 =09TP_PROTO(struct inode *inode, unsigned long off, unsigned int len),
diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
index 9d9cebf18726..1fd4fb7a607c 100644
--- a/fs/xfs/xfs_aops.c
+++ b/fs/xfs/xfs_aops.c
@@ -621,14 +621,11 @@ xfs_vm_readpage(
 =09return iomap_readpage(page, &xfs_read_iomap_ops);
 }
=20
-STATIC int
-xfs_vm_readpages(
-=09struct file=09=09*unused,
-=09struct address_space=09*mapping,
-=09struct list_head=09*pages,
-=09unsigned=09=09nr_pages)
+STATIC void
+xfs_vm_readahead(
+=09struct readahead_control=09*rac)
 {
-=09return iomap_readpages(mapping, pages, nr_pages, &xfs_read_iomap_ops);
+=09iomap_readahead(rac, &xfs_read_iomap_ops);
 }
=20
 static int
@@ -644,7 +641,7 @@ xfs_iomap_swapfile_activate(
=20
 const struct address_space_operations xfs_address_space_operations =3D {
 =09.readpage=09=09=3D xfs_vm_readpage,
-=09.readpages=09=09=3D xfs_vm_readpages,
+=09.readahead=09=09=3D xfs_vm_readahead,
 =09.writepage=09=09=3D xfs_vm_writepage,
 =09.writepages=09=09=3D xfs_vm_writepages,
 =09.set_page_dirty=09=09=3D iomap_set_page_dirty,
diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index 3ce9829a6936..dba874a61fc5 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -78,10 +78,9 @@ static int zonefs_readpage(struct file *unused, struct p=
age *page)
 =09return iomap_readpage(page, &zonefs_iomap_ops);
 }
=20
-static int zonefs_readpages(struct file *unused, struct address_space *map=
ping,
-=09=09=09    struct list_head *pages, unsigned int nr_pages)
+static void zonefs_readahead(struct readahead_control *rac)
 {
-=09return iomap_readpages(mapping, pages, nr_pages, &zonefs_iomap_ops);
+=09iomap_readahead(rac, &zonefs_iomap_ops);
 }
=20
 /*
@@ -128,7 +127,7 @@ static int zonefs_writepages(struct address_space *mapp=
ing,
=20
 static const struct address_space_operations zonefs_file_aops =3D {
 =09.readpage=09=09=3D zonefs_readpage,
-=09.readpages=09=09=3D zonefs_readpages,
+=09.readahead=09=09=3D zonefs_readahead,
 =09.writepage=09=09=3D zonefs_writepage,
 =09.writepages=09=09=3D zonefs_writepages,
 =09.set_page_dirty=09=09=3D iomap_set_page_dirty,
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 8b09463dae0d..bc20bd04c2a2 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -155,8 +155,7 @@ loff_t iomap_apply(struct inode *inode, loff_t pos, lof=
f_t length,
 ssize_t iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *fro=
m,
 =09=09const struct iomap_ops *ops);
 int iomap_readpage(struct page *page, const struct iomap_ops *ops);
-int iomap_readpages(struct address_space *mapping, struct list_head *pages=
,
-=09=09unsigned nr_pages, const struct iomap_ops *ops);
+void iomap_readahead(struct readahead_control *, const struct iomap_ops *o=
ps);
 int iomap_set_page_dirty(struct page *page);
 int iomap_is_partially_uptodate(struct page *page, unsigned long from,
 =09=09unsigned long count);
--=20
2.25.1


