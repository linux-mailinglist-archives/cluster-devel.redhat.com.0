Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7432A16509D
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 22:01:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582146093;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZjbFmV2xRTd4HCpimvXXu5F1Rq//SjCLxsvB7gy1/LM=;
	b=AEccXwVbTtbqtShY2rt7DKGjKtQLvvrWvdTiJaM/4cpvXzpfiL5zlAUWfjGGNP9AUM4NhB
	At+Jjwu2xSY0eN3h5h4PBPRmiXVHtMRK4jKyjE2nOWGnrCVsvY+G5Hxu65kiZHh5vQmi15
	Xev16fRIaE3xxwzXKvfHOt/CwnBmKRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-UNHvpotbNmq3Xqe5QW6_AA-1; Wed, 19 Feb 2020 16:01:28 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EADB1800D42;
	Wed, 19 Feb 2020 21:01:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1304119C4F;
	Wed, 19 Feb 2020 21:01:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DDAF035AF0;
	Wed, 19 Feb 2020 21:01:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JL1GUc001844 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 16:01:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9D307F9AA2; Wed, 19 Feb 2020 21:01:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9970CF9AA1
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FB0580067A
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 21:01:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-38-omcK7n-QN0SARtndJqKEbA-1; Wed, 19 Feb 2020 16:01:10 -0500
X-MC-Unique: omcK7n-QN0SARtndJqKEbA-1
X-MC-Unique: UNHvpotbNmq3Xqe5QW6_AA-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4WSv-0008Uk-Bk; Wed, 19 Feb 2020 21:01:05 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 19 Feb 2020 13:00:56 -0800
Message-Id: <20200219210103.32400-18-willy@infradead.org>
In-Reply-To: <20200219210103.32400-1-willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JL1GUc001844
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v7 17/24] ext4: Convert from readpages to
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

Use the new readahead operation in ext4

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ext4/ext4.h     |  3 +--
 fs/ext4/inode.c    | 21 +++++++++------------
 fs/ext4/readpage.c | 22 ++++++++--------------
 3 files changed, 18 insertions(+), 28 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 4441331d06cc..1570a0b51b73 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3279,8 +3279,7 @@ static inline void ext4_set_de_type(struct super_bloc=
k *sb,
=20
 /* readpages.c */
 extern int ext4_mpage_readpages(struct address_space *mapping,
-=09=09=09=09struct list_head *pages, struct page *page,
-=09=09=09=09unsigned nr_pages, bool is_readahead);
+=09=09struct readahead_control *rac, struct page *page);
 extern int __init ext4_init_post_read_processing(void);
 extern void ext4_exit_post_read_processing(void);
=20
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index e60aca791d3f..d674c5f9066c 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3226,23 +3226,20 @@ static int ext4_readpage(struct file *file, struct =
page *page)
 =09=09ret =3D ext4_readpage_inline(inode, page);
=20
 =09if (ret =3D=3D -EAGAIN)
-=09=09return ext4_mpage_readpages(page->mapping, NULL, page, 1,
-=09=09=09=09=09=09false);
+=09=09return ext4_mpage_readpages(page->mapping, NULL, page);
=20
 =09return ret;
 }
=20
-static int
-ext4_readpages(struct file *file, struct address_space *mapping,
-=09=09struct list_head *pages, unsigned nr_pages)
+static void ext4_readahead(struct readahead_control *rac)
 {
-=09struct inode *inode =3D mapping->host;
+=09struct inode *inode =3D rac->mapping->host;
=20
-=09/* If the file has inline data, no need to do readpages. */
+=09/* If the file has inline data, no need to do readahead. */
 =09if (ext4_has_inline_data(inode))
-=09=09return 0;
+=09=09return;
=20
-=09return ext4_mpage_readpages(mapping, pages, NULL, nr_pages, true);
+=09ext4_mpage_readpages(rac->mapping, rac, NULL);
 }
=20
 static void ext4_invalidatepage(struct page *page, unsigned int offset,
@@ -3587,7 +3584,7 @@ static int ext4_set_page_dirty(struct page *page)
=20
 static const struct address_space_operations ext4_aops =3D {
 =09.readpage=09=09=3D ext4_readpage,
-=09.readpages=09=09=3D ext4_readpages,
+=09.readahead=09=09=3D ext4_readahead,
 =09.writepage=09=09=3D ext4_writepage,
 =09.writepages=09=09=3D ext4_writepages,
 =09.write_begin=09=09=3D ext4_write_begin,
@@ -3604,7 +3601,7 @@ static const struct address_space_operations ext4_aop=
s =3D {
=20
 static const struct address_space_operations ext4_journalled_aops =3D {
 =09.readpage=09=09=3D ext4_readpage,
-=09.readpages=09=09=3D ext4_readpages,
+=09.readahead=09=09=3D ext4_readahead,
 =09.writepage=09=09=3D ext4_writepage,
 =09.writepages=09=09=3D ext4_writepages,
 =09.write_begin=09=09=3D ext4_write_begin,
@@ -3620,7 +3617,7 @@ static const struct address_space_operations ext4_jou=
rnalled_aops =3D {
=20
 static const struct address_space_operations ext4_da_aops =3D {
 =09.readpage=09=09=3D ext4_readpage,
-=09.readpages=09=09=3D ext4_readpages,
+=09.readahead=09=09=3D ext4_readahead,
 =09.writepage=09=09=3D ext4_writepage,
 =09.writepages=09=09=3D ext4_writepages,
 =09.write_begin=09=09=3D ext4_da_write_begin,
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index c1769afbf799..66275f25235d 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -7,8 +7,8 @@
  *
  * This was originally taken from fs/mpage.c
  *
- * The intent is the ext4_mpage_readpages() function here is intended
- * to replace mpage_readpages() in the general case, not just for
+ * The ext4_mpage_readpages() function here is intended to
+ * replace mpage_readahead() in the general case, not just for
  * encrypted files.  It has some limitations (see below), where it
  * will fall back to read_block_full_page(), but these limitations
  * should only be hit when page_size !=3D block_size.
@@ -222,8 +222,7 @@ static inline loff_t ext4_readpage_limit(struct inode *=
inode)
 }
=20
 int ext4_mpage_readpages(struct address_space *mapping,
-=09=09=09 struct list_head *pages, struct page *page,
-=09=09=09 unsigned nr_pages, bool is_readahead)
+=09=09struct readahead_control *rac, struct page *page)
 {
 =09struct bio *bio =3D NULL;
 =09sector_t last_block_in_bio =3D 0;
@@ -241,6 +240,7 @@ int ext4_mpage_readpages(struct address_space *mapping,
 =09int length;
 =09unsigned relative_block =3D 0;
 =09struct ext4_map_blocks map;
+=09unsigned int nr_pages =3D rac ? readahead_count(rac) : 1;
=20
 =09map.m_pblk =3D 0;
 =09map.m_lblk =3D 0;
@@ -251,14 +251,9 @@ int ext4_mpage_readpages(struct address_space *mapping=
,
 =09=09int fully_mapped =3D 1;
 =09=09unsigned first_hole =3D blocks_per_page;
=20
-=09=09if (pages) {
-=09=09=09page =3D lru_to_page(pages);
-
+=09=09if (rac) {
+=09=09=09page =3D readahead_page(rac);
 =09=09=09prefetchw(&page->flags);
-=09=09=09list_del(&page->lru);
-=09=09=09if (add_to_page_cache_lru(page, mapping, page->index,
-=09=09=09=09  readahead_gfp_mask(mapping)))
-=09=09=09=09goto next_page;
 =09=09}
=20
 =09=09if (page_has_buffers(page))
@@ -381,7 +376,7 @@ int ext4_mpage_readpages(struct address_space *mapping,
 =09=09=09bio->bi_iter.bi_sector =3D blocks[0] << (blkbits - 9);
 =09=09=09bio->bi_end_io =3D mpage_end_io;
 =09=09=09bio_set_op_attrs(bio, REQ_OP_READ,
-=09=09=09=09=09=09is_readahead ? REQ_RAHEAD : 0);
+=09=09=09=09=09=09rac ? REQ_RAHEAD : 0);
 =09=09}
=20
 =09=09length =3D first_hole << blkbits;
@@ -406,10 +401,9 @@ int ext4_mpage_readpages(struct address_space *mapping=
,
 =09=09else
 =09=09=09unlock_page(page);
 =09next_page:
-=09=09if (pages)
+=09=09if (rac)
 =09=09=09put_page(page);
 =09}
-=09BUG_ON(pages && !list_empty(pages));
 =09if (bio)
 =09=09submit_bio(bio);
 =09return 0;
--=20
2.25.0


