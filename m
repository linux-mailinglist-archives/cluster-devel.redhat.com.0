Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 762E116F197
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Feb 2020 22:49:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582667352;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nsh1xt+Nf1GpAdgYfjHc8HIv40iyj6X/Ns0quMD1DcU=;
	b=KEbcGTQpvy8sQK8xUehh28NqlNNTvayI23d3tUVS8RswLEHerNK5ggDD0yjKLzIrucofjN
	tk3qS+RijG7YCnAW8/eFut/S4kDubExRdvXY6TH20mONQeCXwDHk2FZ6jWU3ySHrcQbFXN
	g5YSMKwJJLolh46UvFQ8M4knWSTr1VM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-2vUMtCOlMlKuAs704JQ53w-1; Tue, 25 Feb 2020 16:49:09 -0500
X-MC-Unique: 2vUMtCOlMlKuAs704JQ53w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 014A410766DC;
	Tue, 25 Feb 2020 21:49:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3AE0909E9;
	Tue, 25 Feb 2020 21:49:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C66D28B2DC;
	Tue, 25 Feb 2020 21:49:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01PLmt1S010657 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Feb 2020 16:48:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8EE7A1000DBC; Tue, 25 Feb 2020 21:48:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AA43118DF56
	for <cluster-devel@redhat.com>; Tue, 25 Feb 2020 21:48:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F9498007AC
	for <cluster-devel@redhat.com>; Tue, 25 Feb 2020 21:48:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-146-skmn66A2NrGl8sLFxE1Inw-1; Tue, 25 Feb 2020 16:48:50 -0500
X-MC-Unique: skmn66A2NrGl8sLFxE1Inw-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j6i4H-0007qN-Gf; Tue, 25 Feb 2020 21:48:41 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue, 25 Feb 2020 13:48:30 -0800
Message-Id: <20200225214838.30017-18-willy@infradead.org>
In-Reply-To: <20200225214838.30017-1-willy@infradead.org>
References: <20200225214838.30017-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01PLmt1S010657
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v8 17/25] btrfs: Convert from readpages to
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

Implement the new readahead method in btrfs.  Add a readahead_page_batch()
to optimise fetching a batch of pages at once.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/btrfs/extent_io.c | 46 ++++++++++++++------------------------------
 fs/btrfs/extent_io.h |  3 +--
 fs/btrfs/inode.c     | 16 +++++++--------
 3 files changed, 22 insertions(+), 43 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index c0f202741e09..e70f14c1de60 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -4278,52 +4278,34 @@ int extent_writepages(struct address_space *mapping=
,
 =09return ret;
 }
=20
-int extent_readpages(struct address_space *mapping, struct list_head *page=
s,
-=09=09     unsigned nr_pages)
+void extent_readahead(struct readahead_control *rac)
 {
 =09struct bio *bio =3D NULL;
 =09unsigned long bio_flags =3D 0;
 =09struct page *pagepool[16];
 =09struct extent_map *em_cached =3D NULL;
-=09struct extent_io_tree *tree =3D &BTRFS_I(mapping->host)->io_tree;
-=09int nr =3D 0;
+=09struct extent_io_tree *tree =3D &BTRFS_I(rac->mapping->host)->io_tree;
 =09u64 prev_em_start =3D (u64)-1;
+=09int nr;
=20
-=09while (!list_empty(pages)) {
-=09=09u64 contig_end =3D 0;
-
-=09=09for (nr =3D 0; nr < ARRAY_SIZE(pagepool) && !list_empty(pages);) {
-=09=09=09struct page *page =3D lru_to_page(pages);
-
-=09=09=09prefetchw(&page->flags);
-=09=09=09list_del(&page->lru);
-=09=09=09if (add_to_page_cache_lru(page, mapping, page->index,
-=09=09=09=09=09=09readahead_gfp_mask(mapping))) {
-=09=09=09=09put_page(page);
-=09=09=09=09break;
-=09=09=09}
-
-=09=09=09pagepool[nr++] =3D page;
-=09=09=09contig_end =3D page_offset(page) + PAGE_SIZE - 1;
-=09=09}
+=09while ((nr =3D readahead_page_batch(rac, pagepool))) {
+=09=09u64 contig_start =3D page_offset(pagepool[0]);
+=09=09u64 contig_end =3D page_offset(pagepool[nr - 1]) + PAGE_SIZE - 1;
=20
-=09=09if (nr) {
-=09=09=09u64 contig_start =3D page_offset(pagepool[0]);
+=09=09ASSERT(contig_start + nr * PAGE_SIZE - 1 =3D=3D contig_end);
=20
-=09=09=09ASSERT(contig_start + nr * PAGE_SIZE - 1 =3D=3D contig_end);
-
-=09=09=09contiguous_readpages(tree, pagepool, nr, contig_start,
-=09=09=09=09     contig_end, &em_cached, &bio, &bio_flags,
-=09=09=09=09     &prev_em_start);
-=09=09}
+=09=09contiguous_readpages(tree, pagepool, nr, contig_start,
+=09=09=09=09contig_end, &em_cached, &bio, &bio_flags,
+=09=09=09=09&prev_em_start);
 =09}
=20
 =09if (em_cached)
 =09=09free_extent_map(em_cached);
=20
-=09if (bio)
-=09=09return submit_one_bio(bio, 0, bio_flags);
-=09return 0;
+=09if (bio) {
+=09=09if (submit_one_bio(bio, 0, bio_flags))
+=09=09=09return;
+=09}
 }
=20
 /*
diff --git a/fs/btrfs/extent_io.h b/fs/btrfs/extent_io.h
index 5d205bbaafdc..bddac32948c7 100644
--- a/fs/btrfs/extent_io.h
+++ b/fs/btrfs/extent_io.h
@@ -198,8 +198,7 @@ int extent_writepages(struct address_space *mapping,
 =09=09      struct writeback_control *wbc);
 int btree_write_cache_pages(struct address_space *mapping,
 =09=09=09    struct writeback_control *wbc);
-int extent_readpages(struct address_space *mapping, struct list_head *page=
s,
-=09=09     unsigned nr_pages);
+void extent_readahead(struct readahead_control *rac);
 int extent_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 =09=09__u64 start, __u64 len);
 void set_page_extent_mapped(struct page *page);
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 7d26b4bfb2c6..61d5137ce4e9 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -4802,8 +4802,8 @@ static void evict_inode_truncate_pages(struct inode *=
inode)
=20
 =09/*
 =09 * Keep looping until we have no more ranges in the io tree.
-=09 * We can have ongoing bios started by readpages (called from readahead=
)
-=09 * that have their endio callback (extent_io.c:end_bio_extent_readpage)
+=09 * We can have ongoing bios started by readahead that have
+=09 * their endio callback (extent_io.c:end_bio_extent_readpage)
 =09 * still in progress (unlocked the pages in the bio but did not yet
 =09 * unlocked the ranges in the io tree). Therefore this means some
 =09 * ranges can still be locked and eviction started because before
@@ -7004,11 +7004,11 @@ static int lock_extent_direct(struct inode *inode, =
u64 lockstart, u64 lockend,
 =09=09=09 * for it to complete) and then invalidate the pages for
 =09=09=09 * this range (through invalidate_inode_pages2_range()),
 =09=09=09 * but that can lead us to a deadlock with a concurrent
-=09=09=09 * call to readpages() (a buffered read or a defrag call
+=09=09=09 * call to readahead (a buffered read or a defrag call
 =09=09=09 * triggered a readahead) on a page lock due to an
 =09=09=09 * ordered dio extent we created before but did not have
 =09=09=09 * yet a corresponding bio submitted (whence it can not
-=09=09=09 * complete), which makes readpages() wait for that
+=09=09=09 * complete), which makes readahead wait for that
 =09=09=09 * ordered extent to complete while holding a lock on
 =09=09=09 * that page.
 =09=09=09 */
@@ -8247,11 +8247,9 @@ static int btrfs_writepages(struct address_space *ma=
pping,
 =09return extent_writepages(mapping, wbc);
 }
=20
-static int
-btrfs_readpages(struct file *file, struct address_space *mapping,
-=09=09struct list_head *pages, unsigned nr_pages)
+static void btrfs_readahead(struct readahead_control *rac)
 {
-=09return extent_readpages(mapping, pages, nr_pages);
+=09extent_readahead(rac);
 }
=20
 static int __btrfs_releasepage(struct page *page, gfp_t gfp_flags)
@@ -10456,7 +10454,7 @@ static const struct address_space_operations btrfs_=
aops =3D {
 =09.readpage=09=3D btrfs_readpage,
 =09.writepage=09=3D btrfs_writepage,
 =09.writepages=09=3D btrfs_writepages,
-=09.readpages=09=3D btrfs_readpages,
+=09.readahead=09=3D btrfs_readahead,
 =09.direct_IO=09=3D btrfs_direct_IO,
 =09.invalidatepage =3D btrfs_invalidatepage,
 =09.releasepage=09=3D btrfs_releasepage,
--=20
2.25.0


