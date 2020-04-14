Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B85241A80D0
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Apr 2020 17:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586876584;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ck4Kq+0qtfG/uTs/mwD6oEGsD1UlIXZ+pewarkEffGA=;
	b=I3GU8HMlq+z9s8+aE3akl12zuP3OOAqJaO2jR7cMJdZKk7MS+7bK8sHKEYm/dlHvtTivAQ
	OWnJ0g7SKdtvK52zuT9j0DXmywoGJ4M07IsIGpJ+KTnN63VmnspaVSvwvbxHDHsTKOOLle
	Te3bwqEhzcwS8zIfr/lR034R8vIxoIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-jRw1CW-mMgGlsbocrroGnw-1; Tue, 14 Apr 2020 11:03:02 -0400
X-MC-Unique: jRw1CW-mMgGlsbocrroGnw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88CF81922962;
	Tue, 14 Apr 2020 15:03:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CB5619C69;
	Tue, 14 Apr 2020 15:03:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4ECC59306D;
	Tue, 14 Apr 2020 15:03:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03EF2p0x014802 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 11:02:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D42C20267F2; Tue, 14 Apr 2020 15:02:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 691F22026FFE
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D1798FF663
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-141-IGUdmlCoMXe8ITEXhj2v2w-1; Tue, 14 Apr 2020 11:02:48 -0400
X-MC-Unique: IGUdmlCoMXe8ITEXhj2v2w-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jON5A-0006PB-Ai; Tue, 14 Apr 2020 15:02:36 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 08:02:25 -0700
Message-Id: <20200414150233.24495-18-willy@infradead.org>
In-Reply-To: <20200414150233.24495-1-willy@infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03EF2p0x014802
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v11 17/25] btrfs: Convert from readpages to
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Implement the new readahead method in btrfs using the new
readahead_page_batch() function.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 fs/btrfs/extent_io.c | 43 ++++++++++++-------------------------------
 fs/btrfs/extent_io.h |  3 +--
 fs/btrfs/inode.c     | 16 +++++++---------
 3 files changed, 20 insertions(+), 42 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 39e45b8a5031..fc46adf2f5bf 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -4367,51 +4367,32 @@ int extent_writepages(struct address_space *mapping=
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
-=09int nr =3D 0;
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
-
-=09=09if (nr) {
-=09=09=09u64 contig_start =3D page_offset(pagepool[0]);
+=09while ((nr =3D readahead_page_batch(rac, pagepool))) {
+=09=09u64 contig_start =3D page_offset(pagepool[0]);
+=09=09u64 contig_end =3D page_offset(pagepool[nr - 1]) + PAGE_SIZE - 1;
=20
-=09=09=09ASSERT(contig_start + nr * PAGE_SIZE - 1 =3D=3D contig_end);
+=09=09ASSERT(contig_start + nr * PAGE_SIZE - 1 =3D=3D contig_end);
=20
-=09=09=09contiguous_readpages(pagepool, nr, contig_start,
-=09=09=09=09     contig_end, &em_cached, &bio, &bio_flags,
-=09=09=09=09     &prev_em_start);
-=09=09}
+=09=09contiguous_readpages(pagepool, nr, contig_start, contig_end,
+=09=09=09=09&em_cached, &bio, &bio_flags, &prev_em_start);
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
index 2ed65bd0760e..25594e09fdcd 100644
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
index 320d1062068d..ba0aa8b4ad09 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -4856,8 +4856,8 @@ static void evict_inode_truncate_pages(struct inode *=
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
@@ -7050,11 +7050,11 @@ static int lock_extent_direct(struct inode *inode, =
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
@@ -8293,11 +8293,9 @@ static int btrfs_writepages(struct address_space *ma=
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
@@ -10553,7 +10551,7 @@ static const struct address_space_operations btrfs_=
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
2.25.1


