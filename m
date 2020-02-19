Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 727E716509C
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 22:01:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582146093;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u5spMq1tA6DPuHbXnFjOlMRcbbEUcoCn62vXAfKQx9I=;
	b=DEWIr1MSxztm86dbaqgO/KinjQZKdEfixtJQu8gS/eZbJ5M5mPfy8ctojmuJnQJcs3733+
	dONOKGLZJZZCNyB3G7FRhmFso2AlZ/syVmDAG7VQSQ7H+iB9JMhiyBfZ8AegjWUjtrS9f7
	uqerBPuwN/HyqHtXHE2wM00M/WGggfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-9gWfEe8EOBGcSxxEbeXerA-1; Wed, 19 Feb 2020 16:01:30 -0500
X-MC-Unique: 9gWfEe8EOBGcSxxEbeXerA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 195EE1882CDD;
	Wed, 19 Feb 2020 21:01:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0111E101D481;
	Wed, 19 Feb 2020 21:01:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CBF931803C33;
	Wed, 19 Feb 2020 21:01:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JL1KKT001939 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 16:01:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 811FA10A85BA; Wed, 19 Feb 2020 21:01:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C5AC10A85B9
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A5381019E0D
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-325-N_ah4F1fMwCM1eXligskRw-1; Wed, 19 Feb 2020 16:01:10 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4WSv-0008V1-EE; Wed, 19 Feb 2020 21:01:05 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 19 Feb 2020 13:00:58 -0800
Message-Id: <20200219210103.32400-20-willy@infradead.org>
In-Reply-To: <20200219210103.32400-1-willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: N_ah4F1fMwCM1eXligskRw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JL1KKT001939
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v7 19/24] f2fs: Convert from readpages to
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Use the new readahead operation in f2fs

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c              | 50 +++++++++++++++----------------------
 fs/f2fs/f2fs.h              |  5 ++--
 include/trace/events/f2fs.h |  6 ++---
 3 files changed, 25 insertions(+), 36 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b27b72107911..87964e4cb6b8 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2159,13 +2159,11 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, =
struct bio **bio_ret,
  * use ->readpage() or do the necessary surgery to decouple ->readpages()
  * from read-ahead.
  */
-int f2fs_mpage_readpages(struct address_space *mapping,
-=09=09=09struct list_head *pages, struct page *page,
-=09=09=09unsigned nr_pages, bool is_readahead)
+int f2fs_mpage_readpages(struct inode *inode, struct readahead_control *ra=
c,
+=09=09struct page *page)
 {
 =09struct bio *bio =3D NULL;
 =09sector_t last_block_in_bio =3D 0;
-=09struct inode *inode =3D mapping->host;
 =09struct f2fs_map_blocks map;
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 =09struct compress_ctx cc =3D {
@@ -2179,6 +2177,7 @@ int f2fs_mpage_readpages(struct address_space *mappin=
g,
 =09=09.nr_cpages =3D 0,
 =09};
 #endif
+=09unsigned nr_pages =3D rac ? readahead_count(rac) : 1;
 =09unsigned max_nr_pages =3D nr_pages;
 =09int ret =3D 0;
=20
@@ -2192,15 +2191,9 @@ int f2fs_mpage_readpages(struct address_space *mappi=
ng,
 =09map.m_may_create =3D false;
=20
 =09for (; nr_pages; nr_pages--) {
-=09=09if (pages) {
-=09=09=09page =3D list_last_entry(pages, struct page, lru);
-
+=09=09if (rac) {
+=09=09=09page =3D readahead_page(rac);
 =09=09=09prefetchw(&page->flags);
-=09=09=09list_del(&page->lru);
-=09=09=09if (add_to_page_cache_lru(page, mapping,
-=09=09=09=09=09=09  page_index(page),
-=09=09=09=09=09=09  readahead_gfp_mask(mapping)))
-=09=09=09=09goto next_page;
 =09=09}
=20
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -2210,7 +2203,7 @@ int f2fs_mpage_readpages(struct address_space *mappin=
g,
 =09=09=09=09ret =3D f2fs_read_multi_pages(&cc, &bio,
 =09=09=09=09=09=09=09max_nr_pages,
 =09=09=09=09=09=09=09&last_block_in_bio,
-=09=09=09=09=09=09=09is_readahead);
+=09=09=09=09=09=09=09rac);
 =09=09=09=09f2fs_destroy_compress_ctx(&cc);
 =09=09=09=09if (ret)
 =09=09=09=09=09goto set_error_page;
@@ -2233,7 +2226,7 @@ int f2fs_mpage_readpages(struct address_space *mappin=
g,
 #endif
=20
 =09=09ret =3D f2fs_read_single_page(inode, page, max_nr_pages, &map,
-=09=09=09=09=09&bio, &last_block_in_bio, is_readahead);
+=09=09=09=09=09&bio, &last_block_in_bio, rac);
 =09=09if (ret) {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 set_error_page:
@@ -2242,8 +2235,10 @@ int f2fs_mpage_readpages(struct address_space *mappi=
ng,
 =09=09=09zero_user_segment(page, 0, PAGE_SIZE);
 =09=09=09unlock_page(page);
 =09=09}
+#ifdef CONFIG_F2FS_FS_COMPRESSION
 next_page:
-=09=09if (pages)
+#endif
+=09=09if (rac)
 =09=09=09put_page(page);
=20
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -2253,16 +2248,15 @@ int f2fs_mpage_readpages(struct address_space *mapp=
ing,
 =09=09=09=09ret =3D f2fs_read_multi_pages(&cc, &bio,
 =09=09=09=09=09=09=09max_nr_pages,
 =09=09=09=09=09=09=09&last_block_in_bio,
-=09=09=09=09=09=09=09is_readahead);
+=09=09=09=09=09=09=09rac);
 =09=09=09=09f2fs_destroy_compress_ctx(&cc);
 =09=09=09}
 =09=09}
 #endif
 =09}
-=09BUG_ON(pages && !list_empty(pages));
 =09if (bio)
 =09=09__submit_bio(F2FS_I_SB(inode), bio, DATA);
-=09return pages ? 0 : ret;
+=09return ret;
 }
=20
 static int f2fs_read_data_page(struct file *file, struct page *page)
@@ -2281,28 +2275,24 @@ static int f2fs_read_data_page(struct file *file, s=
truct page *page)
 =09if (f2fs_has_inline_data(inode))
 =09=09ret =3D f2fs_read_inline_data(inode, page);
 =09if (ret =3D=3D -EAGAIN)
-=09=09ret =3D f2fs_mpage_readpages(page_file_mapping(page),
-=09=09=09=09=09=09NULL, page, 1, false);
+=09=09ret =3D f2fs_mpage_readpages(inode, NULL, page);
 =09return ret;
 }
=20
-static int f2fs_read_data_pages(struct file *file,
-=09=09=09struct address_space *mapping,
-=09=09=09struct list_head *pages, unsigned nr_pages)
+static void f2fs_readahead(struct readahead_control *rac)
 {
-=09struct inode *inode =3D mapping->host;
-=09struct page *page =3D list_last_entry(pages, struct page, lru);
+=09struct inode *inode =3D rac->mapping->host;
=20
-=09trace_f2fs_readpages(inode, page, nr_pages);
+=09trace_f2fs_readpages(inode, readahead_index(rac), readahead_count(rac))=
;
=20
 =09if (!f2fs_is_compress_backend_ready(inode))
-=09=09return 0;
+=09=09return;
=20
 =09/* If the file has inline data, skip readpages */
 =09if (f2fs_has_inline_data(inode))
-=09=09return 0;
+=09=09return;
=20
-=09return f2fs_mpage_readpages(mapping, pages, NULL, nr_pages, true);
+=09f2fs_mpage_readpages(inode, rac, NULL);
 }
=20
 int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
@@ -3784,7 +3774,7 @@ static void f2fs_swap_deactivate(struct file *file)
=20
 const struct address_space_operations f2fs_dblock_aops =3D {
 =09.readpage=09=3D f2fs_read_data_page,
-=09.readpages=09=3D f2fs_read_data_pages,
+=09.readahead=09=3D f2fs_readahead,
 =09.writepage=09=3D f2fs_write_data_page,
 =09.writepages=09=3D f2fs_write_data_pages,
 =09.write_begin=09=3D f2fs_write_begin,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5355be6b6755..b5e72dee8826 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3344,9 +3344,8 @@ int f2fs_reserve_new_block(struct dnode_of_data *dn);
 int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index);
 int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from);
 int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index);
-int f2fs_mpage_readpages(struct address_space *mapping,
-=09=09=09struct list_head *pages, struct page *page,
-=09=09=09unsigned nr_pages, bool is_readahead);
+int f2fs_mpage_readpages(struct inode *inode, struct readahead_control *ra=
c,
+=09=09struct page *page);
 struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 =09=09=09int op_flags, bool for_write);
 struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 67a97838c2a0..d72da4a33883 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1375,9 +1375,9 @@ TRACE_EVENT(f2fs_writepages,
=20
 TRACE_EVENT(f2fs_readpages,
=20
-=09TP_PROTO(struct inode *inode, struct page *page, unsigned int nrpage),
+=09TP_PROTO(struct inode *inode, pgoff_t start, unsigned int nrpage),
=20
-=09TP_ARGS(inode, page, nrpage),
+=09TP_ARGS(inode, start, nrpage),
=20
 =09TP_STRUCT__entry(
 =09=09__field(dev_t,=09dev)
@@ -1389,7 +1389,7 @@ TRACE_EVENT(f2fs_readpages,
 =09TP_fast_assign(
 =09=09__entry->dev=09=3D inode->i_sb->s_dev;
 =09=09__entry->ino=09=3D inode->i_ino;
-=09=09__entry->start=09=3D page->index;
+=09=09__entry->start=09=3D start;
 =09=09__entry->nrpage=09=3D nrpage;
 =09),
=20
--=20
2.25.0


