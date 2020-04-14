Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A6BD61A80E5
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Apr 2020 17:03:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586876589;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=t9WUkGGeqfhnv3IHejjGz5Mvn59aWAsZUs6WB33Kzsg=;
	b=LmkufTTU6OwCN3EtKIoljSBpTpcztFg7Ly++pTMDq+NcQbfjcOhwIpNbgL9VaiUNDB7Cmy
	d+aH+KM4Faf6hwMJ9ZIRncozcyyuqeerw2Uuyb6g1X29FDHfEHC1M1WFA8GrNkzN3hOQA3
	uRNPpcJIxfLRc7TLdLpmu4CJF4KEXPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-mmeCvHLZN5SsoCBQn-Z3WQ-1; Tue, 14 Apr 2020 11:03:02 -0400
X-MC-Unique: mmeCvHLZN5SsoCBQn-Z3WQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 411CE107ACCC;
	Tue, 14 Apr 2020 15:02:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BCE3271A3;
	Tue, 14 Apr 2020 15:02:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0803718089CF;
	Tue, 14 Apr 2020 15:02:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03EF2rlg014844 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 11:02:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 04C2B76CF; Tue, 14 Apr 2020 15:02:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 006F5ED17D
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA2AC868CB4
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-181-Bvuk5EtPMcG9Xf7ElgyG_A-1; Tue, 14 Apr 2020 11:02:44 -0400
X-MC-Unique: Bvuk5EtPMcG9Xf7ElgyG_A-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jON5A-0006PG-Bu; Tue, 14 Apr 2020 15:02:36 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 08:02:26 -0700
Message-Id: <20200414150233.24495-19-willy@infradead.org>
In-Reply-To: <20200414150233.24495-1-willy@infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03EF2rlg014844
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, Gao Xiang <gaoxiang25@huawei.com>,
	William Kucharski <william.kucharski@oracle.com>,
	Chao Yu <yuchao0@huawei.com>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v11 18/25] erofs: Convert uncompressed files
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Use the new readahead operation in erofs

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: Gao Xiang <gaoxiang25@huawei.com>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
---
 fs/erofs/data.c              | 39 +++++++++++++-----------------------
 fs/erofs/zdata.c             |  2 +-
 include/trace/events/erofs.h |  6 +++---
 3 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index fc3a8d8064f8..d0542151e8c4 100644
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
+=09while ((page =3D readahead_page(rac))) {
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
index c4b6c9aa87ec..a78108128af3 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -1317,7 +1317,7 @@ static int z_erofs_readpages(struct file *filp, struc=
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
2.25.1


