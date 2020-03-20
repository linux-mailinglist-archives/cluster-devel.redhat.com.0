Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 357B018D03A
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Mar 2020 15:23:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584714203;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vjghLketdNYf9itjOlUhlzdqF2QAdrKUV9J8S3VmWrY=;
	b=atyl9tJ33U65MFwF01gHbw34Tng6YQqpq1pNl1lZmlVxjxgE9/R5AYNSheoyI7goKZ0iNw
	vMNhcHfdMHaDa8Cok0IZRxKL3j4V9BeAcLipZxyfhESIl0HPiCfIB25C/xaS8uf3I6aJWT
	sKfQ7NFffZSjtU3uMXoY1WAtiRjA9iI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-xaS5A9aKMP6LgEeK-XGhmg-1; Fri, 20 Mar 2020 10:23:21 -0400
X-MC-Unique: xaS5A9aKMP6LgEeK-XGhmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8BAF18FE89D;
	Fri, 20 Mar 2020 14:22:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4D6373879;
	Fri, 20 Mar 2020 14:22:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96235942AE;
	Fri, 20 Mar 2020 14:22:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02KEMlWt021950 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Mar 2020 10:22:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 02CB01A9204; Fri, 20 Mar 2020 14:22:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2F4E1CC645
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 14:22:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAD908002C4
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 14:22:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-6-4iXPK4OJOYyuCWqrJAlEeA-1; Fri, 20 Mar 2020 10:22:44 -0400
X-MC-Unique: 4iXPK4OJOYyuCWqrJAlEeA-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jFIXi-0000jo-7E; Fri, 20 Mar 2020 14:22:34 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 20 Mar 2020 07:22:28 -0700
Message-Id: <20200320142231.2402-23-willy@infradead.org>
In-Reply-To: <20200320142231.2402-1-willy@infradead.org>
References: <20200320142231.2402-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02KEMlWt021950
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v9 22/25] f2fs: Convert from readpages to
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

Use the new readahead operation in f2fs

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 fs/f2fs/data.c              | 47 +++++++++++++++----------------------
 include/trace/events/f2fs.h |  6 ++---
 2 files changed, 22 insertions(+), 31 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8e9aa2254490..237dff36fe73 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2160,8 +2160,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, st=
ruct bio **bio_ret,
  * from read-ahead.
  */
 static int f2fs_mpage_readpages(struct address_space *mapping,
-=09=09=09struct list_head *pages, struct page *page,
-=09=09=09unsigned nr_pages, bool is_readahead)
+=09=09struct readahead_control *rac, struct page *page)
 {
 =09struct bio *bio =3D NULL;
 =09sector_t last_block_in_bio =3D 0;
@@ -2179,6 +2178,7 @@ static int f2fs_mpage_readpages(struct address_space =
*mapping,
 =09=09.nr_cpages =3D 0,
 =09};
 #endif
+=09unsigned nr_pages =3D rac ? readahead_count(rac) : 1;
 =09unsigned max_nr_pages =3D nr_pages;
 =09int ret =3D 0;
=20
@@ -2192,15 +2192,9 @@ static int f2fs_mpage_readpages(struct address_space=
 *mapping,
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
@@ -2210,7 +2204,7 @@ static int f2fs_mpage_readpages(struct address_space =
*mapping,
 =09=09=09=09ret =3D f2fs_read_multi_pages(&cc, &bio,
 =09=09=09=09=09=09=09max_nr_pages,
 =09=09=09=09=09=09=09&last_block_in_bio,
-=09=09=09=09=09=09=09is_readahead);
+=09=09=09=09=09=09=09rac);
 =09=09=09=09f2fs_destroy_compress_ctx(&cc);
 =09=09=09=09if (ret)
 =09=09=09=09=09goto set_error_page;
@@ -2233,7 +2227,7 @@ static int f2fs_mpage_readpages(struct address_space =
*mapping,
 #endif
=20
 =09=09ret =3D f2fs_read_single_page(inode, page, max_nr_pages, &map,
-=09=09=09=09=09&bio, &last_block_in_bio, is_readahead);
+=09=09=09=09=09&bio, &last_block_in_bio, rac);
 =09=09if (ret) {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 set_error_page:
@@ -2242,8 +2236,10 @@ static int f2fs_mpage_readpages(struct address_space=
 *mapping,
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
@@ -2253,16 +2249,15 @@ static int f2fs_mpage_readpages(struct address_spac=
e *mapping,
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
@@ -2281,28 +2276,24 @@ static int f2fs_read_data_page(struct file *file, s=
truct page *page)
 =09if (f2fs_has_inline_data(inode))
 =09=09ret =3D f2fs_read_inline_data(inode, page);
 =09if (ret =3D=3D -EAGAIN)
-=09=09ret =3D f2fs_mpage_readpages(page_file_mapping(page),
-=09=09=09=09=09=09NULL, page, 1, false);
+=09=09ret =3D f2fs_mpage_readpages(page_file_mapping(page), NULL, page);
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
+=09f2fs_mpage_readpages(rac->mapping, rac, NULL);
 }
=20
 int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
@@ -3784,7 +3775,7 @@ static void f2fs_swap_deactivate(struct file *file)
=20
 const struct address_space_operations f2fs_dblock_aops =3D {
 =09.readpage=09=3D f2fs_read_data_page,
-=09.readpages=09=3D f2fs_read_data_pages,
+=09.readahead=09=3D f2fs_readahead,
 =09.writepage=09=3D f2fs_write_data_page,
 =09.writepages=09=3D f2fs_write_data_pages,
 =09.write_begin=09=3D f2fs_write_begin,
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
2.25.1


