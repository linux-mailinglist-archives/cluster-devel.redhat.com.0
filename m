Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CA20A15874D
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Feb 2020 02:04:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581383057;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PwJN1Bk/JEGyX+xGPFoqixeuIBf4POOzzGjZLGPFrh0=;
	b=HZQJ2MtIxO9Ku0LggqINOo/P4G4EzeAPRAzaCbeTdhs7XHX4RkfT0GUSSahKj2MoS7TIu1
	hRyJIaE9eUUD2tm3Qpt6EB7h6e2w1qPd8i5W5k8zngAHlRtkBi6K8abMO/N60uCOhQ0RKj
	H/eyYEFdtGPnO8j0CVUdzrbjugssFqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-JgwxH7cvP1yPpCMThLsHSg-1; Mon, 10 Feb 2020 20:04:14 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16A3913FA;
	Tue, 11 Feb 2020 01:04:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F30675C114;
	Tue, 11 Feb 2020 01:04:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7EB318089CD;
	Tue, 11 Feb 2020 01:04:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01B147cA019427 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 20:04:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D39682166B2A; Tue, 11 Feb 2020 01:04:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93BD22166B2C
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 01:04:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77987101928D
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 01:04:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-128-b6z3IDppO4my6v9gu5asbQ-1; Mon, 10 Feb 2020 20:04:02 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j1Jxu-0001oT-Nw; Tue, 11 Feb 2020 01:03:50 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 10 Feb 2020 17:03:48 -0800
Message-Id: <20200211010348.6872-14-willy@infradead.org>
In-Reply-To: <20200211010348.6872-1-willy@infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: b6z3IDppO4my6v9gu5asbQ-1
X-MC-Unique: JgwxH7cvP1yPpCMThLsHSg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01B147cA019427
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v5 13/13] iomap: Convert from readpages to
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Use the new readahead operation in iomap.  Convert XFS and ZoneFS to
use it.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/iomap/buffered-io.c | 101 ++++++++++++-----------------------------
 fs/iomap/trace.h       |   2 +-
 fs/xfs/xfs_aops.c      |  13 ++----
 fs/zonefs/super.c      |   7 ++-
 include/linux/iomap.h  |   3 +-
 5 files changed, 39 insertions(+), 87 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index cb3511eb152a..e40eb45230fa 100644
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
@@ -307,11 +306,11 @@ iomap_readpage_actor(struct inode *inode, loff_t pos,=
 loff_t length, void *data,
 =09=09if (ctx->bio)
 =09=09=09submit_bio(ctx->bio);
=20
-=09=09if (ctx->is_readahead) /* same as readahead_gfp_mask */
+=09=09if (ctx->rac) /* same as readahead_gfp_mask */
 =09=09=09gfp |=3D __GFP_NORETRY | __GFP_NOWARN;
 =09=09ctx->bio =3D bio_alloc(gfp, min(BIO_MAX_PAGES, nr_vecs));
 =09=09ctx->bio->bi_opf =3D REQ_OP_READ;
-=09=09if (ctx->is_readahead)
+=09=09if (ctx->rac)
 =09=09=09ctx->bio->bi_opf |=3D REQ_RAHEAD;
 =09=09ctx->bio->bi_iter.bi_sector =3D sector;
 =09=09bio_set_dev(ctx->bio, iomap->bdev);
@@ -367,104 +366,62 @@ iomap_readpage(struct page *page, const struct iomap=
_ops *ops)
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
-=09loff_t done, ret;
+=09loff_t ret, done =3D 0;
=20
-=09for (done =3D 0; done < length; done +=3D ret) {
-=09=09if (ctx->cur_page && offset_in_page(pos + done) =3D=3D 0) {
-=09=09=09if (!ctx->cur_page_in_bio)
-=09=09=09=09unlock_page(ctx->cur_page);
-=09=09=09put_page(ctx->cur_page);
-=09=09=09ctx->cur_page =3D NULL;
-=09=09}
+=09while (done < length) {
 =09=09if (!ctx->cur_page) {
-=09=09=09ctx->cur_page =3D iomap_next_page(inode, ctx->pages,
-=09=09=09=09=09pos, length, &done);
-=09=09=09if (!ctx->cur_page)
-=09=09=09=09break;
+=09=09=09ctx->cur_page =3D readahead_page(ctx->rac);
 =09=09=09ctx->cur_page_in_bio =3D false;
 =09=09}
 =09=09ret =3D iomap_readpage_actor(inode, pos + done, length - done,
 =09=09=09=09ctx, iomap, srcmap);
+=09=09if (WARN_ON(ret =3D=3D 0))
+=09=09=09break;
+=09=09done +=3D ret;
+=09=09if (offset_in_page(pos + done) =3D=3D 0) {
+=09=09=09ctx->rac->nr_pages -=3D ctx->rac->batch_count;
+=09=09=09if (!ctx->cur_page_in_bio)
+=09=09=09=09unlock_page(ctx->cur_page);
+=09=09=09put_page(ctx->cur_page);
+=09=09=09ctx->cur_page =3D NULL;
+=09=09}
 =09}
=20
 =09return done;
 }
=20
-int
-iomap_readpages(struct address_space *mapping, struct list_head *pages,
-=09=09unsigned nr_pages, const struct iomap_ops *ops)
+void iomap_readahead(struct readahead_control *rac, const struct iomap_ops=
 *ops)
 {
+=09struct inode *inode =3D rac->mapping->host;
 =09struct iomap_readpage_ctx ctx =3D {
-=09=09.pages=09=09=3D pages,
-=09=09.is_readahead=09=3D true,
+=09=09.rac=09=3D rac,
 =09};
-=09loff_t pos =3D page_offset(list_entry(pages->prev, struct page, lru));
-=09loff_t last =3D page_offset(list_entry(pages->next, struct page, lru));
-=09loff_t length =3D last - pos + PAGE_SIZE, ret =3D 0;
+=09loff_t pos =3D readahead_offset(rac);
+=09loff_t length =3D readahead_length(rac);
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
-=09if (ctx.cur_page) {
-=09=09if (!ctx.cur_page_in_bio)
-=09=09=09unlock_page(ctx.cur_page);
-=09=09put_page(ctx.cur_page);
-=09}
-
-=09/*
-=09 * Check that we didn't lose a page due to the arcance calling
-=09 * conventions..
-=09 */
-=09WARN_ON_ONCE(!ret && !list_empty(ctx.pages));
-=09return ret;
+=09BUG_ON(ctx.cur_page);
 }
-EXPORT_SYMBOL_GPL(iomap_readpages);
+EXPORT_SYMBOL_GPL(iomap_readahead);
=20
 /*
  * iomap_is_partially_uptodate checks whether blocks within a page are
diff --git a/fs/iomap/trace.h b/fs/iomap/trace.h
index 6dc227b8c47e..d6ba705f938a 100644
--- a/fs/iomap/trace.h
+++ b/fs/iomap/trace.h
@@ -39,7 +39,7 @@ DEFINE_EVENT(iomap_readpage_class, name,=09\
 =09TP_PROTO(struct inode *inode, int nr_pages), \
 =09TP_ARGS(inode, nr_pages))
 DEFINE_READPAGE_EVENT(iomap_readpage);
-DEFINE_READPAGE_EVENT(iomap_readpages);
+DEFINE_READPAGE_EVENT(iomap_readahead);
=20
 DECLARE_EVENT_CLASS(iomap_page_class,
 =09TP_PROTO(struct inode *inode, struct page *page, unsigned long off,
diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
index 3a688eb5c5ae..0897dd71c622 100644
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
index 8bc6ef82d693..8327a01d3bac 100644
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
2.25.0


