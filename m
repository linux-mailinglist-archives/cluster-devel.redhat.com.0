Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 11F58158748
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Feb 2020 02:04:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581383056;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Lfmx5t1MICUnmsIhuLMp8+IQ6J2eSfkDdqVtEsnpci4=;
	b=N3r0dKNvLVV2YdBoetYeysGzT3yYlo11aoMaX4iI35YqMtSzclhURWsFPXhT0lvZUj097W
	h1qQ8NSMLeb8lqHORsnvo1+sZPAavSMEnYEIPoJQ8e5umCQhQBKBbYHy79Mo61i7nZMw6k
	w3GAmFH5nSjpf50upwy98+9vLhw2AwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-yP6GdToPOMaWTI3XZa0fEQ-1; Mon, 10 Feb 2020 20:04:13 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC7C21005502;
	Tue, 11 Feb 2020 01:04:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95D3D5DA2C;
	Tue, 11 Feb 2020 01:04:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01E0D866BF;
	Tue, 11 Feb 2020 01:04:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01B144kL019369 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 20:04:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 354F4C690B; Tue, 11 Feb 2020 01:04:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30690C690E
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 01:04:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 919D68EB467
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 01:04:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-288-L8vKJbepOl6xgf16SzE9eg-1; Mon, 10 Feb 2020 20:03:59 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j1Jxu-0001o9-IA; Tue, 11 Feb 2020 01:03:50 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 10 Feb 2020 17:03:43 -0800
Message-Id: <20200211010348.6872-9-willy@infradead.org>
In-Reply-To: <20200211010348.6872-1-willy@infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: L8vKJbepOl6xgf16SzE9eg-1
X-MC-Unique: yP6GdToPOMaWTI3XZa0fEQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01B144kL019369
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v5 08/13] erofs: Convert uncompressed files
	from readpages to readahead
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Use the new readahead operation in erofs

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/erofs/data.c              | 39 +++++++++++++-----------------------
 fs/erofs/zdata.c             |  2 +-
 include/trace/events/erofs.h |  6 +++---
 3 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index fc3a8d8064f8..82ebcee9d178 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -280,47 +280,36 @@ static int erofs_raw_access_readpage(struct file *fil=
e, struct page *page)
 =09return 0;
 }
=20
-static int erofs_raw_access_readpages(struct file *filp,
-=09=09=09=09      struct address_space *mapping,
-=09=09=09=09      struct list_head *pages,
-=09=09=09=09      unsigned int nr_pages)
+static void erofs_raw_access_readahead(struct readahead_control *rac)
 {
 =09erofs_off_t last_block;
 =09struct bio *bio =3D NULL;
-=09gfp_t gfp =3D readahead_gfp_mask(mapping);
-=09struct page *page =3D list_last_entry(pages, struct page, lru);
-
-=09trace_erofs_readpages(mapping->host, page, nr_pages, true);
+=09struct page *page;
=20
-=09for (; nr_pages; --nr_pages) {
-=09=09page =3D list_entry(pages->prev, struct page, lru);
+=09trace_erofs_readpages(rac->mapping->host, readahead_index(rac),
+=09=09=09readahead_count(rac), true);
=20
+=09readahead_for_each(rac, page) {
 =09=09prefetchw(&page->flags);
-=09=09list_del(&page->lru);
=20
-=09=09if (!add_to_page_cache_lru(page, mapping, page->index, gfp)) {
-=09=09=09bio =3D erofs_read_raw_page(bio, mapping, page,
-=09=09=09=09=09=09  &last_block, nr_pages, true);
+=09=09bio =3D erofs_read_raw_page(bio, rac->mapping, page, &last_block,
+=09=09=09=09readahead_count(rac), true);
=20
-=09=09=09/* all the page errors are ignored when readahead */
-=09=09=09if (IS_ERR(bio)) {
-=09=09=09=09pr_err("%s, readahead error at page %lu of nid %llu\n",
-=09=09=09=09       __func__, page->index,
-=09=09=09=09       EROFS_I(mapping->host)->nid);
+=09=09/* all the page errors are ignored when readahead */
+=09=09if (IS_ERR(bio)) {
+=09=09=09pr_err("%s, readahead error at page %lu of nid %llu\n",
+=09=09=09       __func__, page->index,
+=09=09=09       EROFS_I(rac->mapping->host)->nid);
=20
-=09=09=09=09bio =3D NULL;
-=09=09=09}
+=09=09=09bio =3D NULL;
 =09=09}
=20
-=09=09/* pages could still be locked */
 =09=09put_page(page);
 =09}
-=09DBG_BUGON(!list_empty(pages));
=20
 =09/* the rare case (end in gaps) */
 =09if (bio)
 =09=09submit_bio(bio);
-=09return 0;
 }
=20
 static int erofs_get_block(struct inode *inode, sector_t iblock,
@@ -358,7 +347,7 @@ static sector_t erofs_bmap(struct address_space *mappin=
g, sector_t block)
 /* for uncompressed (aligned) files and raw access for other files */
 const struct address_space_operations erofs_raw_access_aops =3D {
 =09.readpage =3D erofs_raw_access_readpage,
-=09.readpages =3D erofs_raw_access_readpages,
+=09.readahead =3D erofs_raw_access_readahead,
 =09.bmap =3D erofs_bmap,
 };
=20
diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 80e47f07d946..17f45fcb8c5c 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -1315,7 +1315,7 @@ static int z_erofs_readpages(struct file *filp, struc=
t address_space *mapping,
 =09struct page *head =3D NULL;
 =09LIST_HEAD(pagepool);
=20
-=09trace_erofs_readpages(mapping->host, lru_to_page(pages),
+=09trace_erofs_readpages(mapping->host, lru_to_page(pages)->index,
 =09=09=09      nr_pages, false);
=20
 =09f.headoffset =3D (erofs_off_t)lru_to_page(pages)->index << PAGE_SHIFT;
diff --git a/include/trace/events/erofs.h b/include/trace/events/erofs.h
index 27f5caa6299a..bf9806fd1306 100644
--- a/include/trace/events/erofs.h
+++ b/include/trace/events/erofs.h
@@ -113,10 +113,10 @@ TRACE_EVENT(erofs_readpage,
=20
 TRACE_EVENT(erofs_readpages,
=20
-=09TP_PROTO(struct inode *inode, struct page *page, unsigned int nrpage,
+=09TP_PROTO(struct inode *inode, pgoff_t start, unsigned int nrpage,
 =09=09bool raw),
=20
-=09TP_ARGS(inode, page, nrpage, raw),
+=09TP_ARGS(inode, start, nrpage, raw),
=20
 =09TP_STRUCT__entry(
 =09=09__field(dev_t,=09=09dev=09)
@@ -129,7 +129,7 @@ TRACE_EVENT(erofs_readpages,
 =09TP_fast_assign(
 =09=09__entry->dev=09=3D inode->i_sb->s_dev;
 =09=09__entry->nid=09=3D EROFS_I(inode)->nid;
-=09=09__entry->start=09=3D page->index;
+=09=09__entry->start=09=3D start;
 =09=09__entry->nrpage=09=3D nrpage;
 =09=09__entry->raw=09=3D raw;
 =09),
--=20
2.25.0


