Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 19E4A1A80B7
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Apr 2020 17:03:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586876579;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=brs8ilh/aElZ/8pDqDwQmfyDVGWoXkFGLP8lqXNvub0=;
	b=NuLDIIrnFiIFdtbjrY8ocMi/I53Ai2bF+UKeretGbOFekQtA6p8Dh8pKNQC7Tw64/5VsH/
	J3av4bvhPxk/1nduWqdR/qXA0chIQBCpGBy/x/FKP1cJP08ZJKlTZyY/gTIZPlHtfi5h9N
	SKH0FhTVVvC5TtP317otPdSMoRpeb9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-KtMj9PGaPfmY5eiR2Dt78Q-1; Tue, 14 Apr 2020 11:02:57 -0400
X-MC-Unique: KtMj9PGaPfmY5eiR2Dt78Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCC9C1922967;
	Tue, 14 Apr 2020 15:02:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2D6C19C69;
	Tue, 14 Apr 2020 15:02:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 80EF418089C8;
	Tue, 14 Apr 2020 15:02:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03EF2mvt014723 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 11:02:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 522032028CD3; Tue, 14 Apr 2020 15:02:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E30520267F2
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34AA01017E43
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-202-qTHSHhP0MKSQw9Guuct64w-1; Tue, 14 Apr 2020 11:02:43 -0400
X-MC-Unique: qTHSHhP0MKSQw9Guuct64w-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jON5A-0006PK-DB; Tue, 14 Apr 2020 15:02:36 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 08:02:27 -0700
Message-Id: <20200414150233.24495-20-willy@infradead.org>
In-Reply-To: <20200414150233.24495-1-willy@infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03EF2mvt014723
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, Gao Xiang <gaoxiang25@huawei.com>,
	William Kucharski <william.kucharski@oracle.com>,
	Chao Yu <yuchao0@huawei.com>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v11 19/25] erofs: Convert compressed files
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

Use the new readahead operation in erofs.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: Gao Xiang <gaoxiang25@huawei.com>
Reviewed-by: Dave Chinner <dchinner@redhat.com>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
---
 fs/erofs/zdata.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index a78108128af3..187f93b4900e 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -1305,28 +1305,23 @@ static bool should_decompress_synchronously(struct =
erofs_sb_info *sbi,
 =09return nr <=3D sbi->max_sync_decompress_pages;
 }
=20
-static int z_erofs_readpages(struct file *filp, struct address_space *mapp=
ing,
-=09=09=09     struct list_head *pages, unsigned int nr_pages)
+static void z_erofs_readahead(struct readahead_control *rac)
 {
-=09struct inode *const inode =3D mapping->host;
+=09struct inode *const inode =3D rac->mapping->host;
 =09struct erofs_sb_info *const sbi =3D EROFS_I_SB(inode);
=20
-=09bool sync =3D should_decompress_synchronously(sbi, nr_pages);
+=09bool sync =3D should_decompress_synchronously(sbi, readahead_count(rac)=
);
 =09struct z_erofs_decompress_frontend f =3D DECOMPRESS_FRONTEND_INIT(inode=
);
-=09gfp_t gfp =3D mapping_gfp_constraint(mapping, GFP_KERNEL);
-=09struct page *head =3D NULL;
+=09struct page *page, *head =3D NULL;
 =09LIST_HEAD(pagepool);
=20
-=09trace_erofs_readpages(mapping->host, lru_to_page(pages)->index,
-=09=09=09      nr_pages, false);
+=09trace_erofs_readpages(inode, readahead_index(rac),
+=09=09=09readahead_count(rac), false);
=20
-=09f.headoffset =3D (erofs_off_t)lru_to_page(pages)->index << PAGE_SHIFT;
-
-=09for (; nr_pages; --nr_pages) {
-=09=09struct page *page =3D lru_to_page(pages);
+=09f.headoffset =3D readahead_pos(rac);
=20
+=09while ((page =3D readahead_page(rac))) {
 =09=09prefetchw(&page->flags);
-=09=09list_del(&page->lru);
=20
 =09=09/*
 =09=09 * A pure asynchronous readahead is indicated if
@@ -1335,11 +1330,6 @@ static int z_erofs_readpages(struct file *filp, stru=
ct address_space *mapping,
 =09=09 */
 =09=09sync &=3D !(PageReadahead(page) && !head);
=20
-=09=09if (add_to_page_cache_lru(page, mapping, page->index, gfp)) {
-=09=09=09list_add(&page->lru, &pagepool);
-=09=09=09continue;
-=09=09}
-
 =09=09set_page_private(page, (unsigned long)head);
 =09=09head =3D page;
 =09}
@@ -1368,11 +1358,10 @@ static int z_erofs_readpages(struct file *filp, str=
uct address_space *mapping,
=20
 =09/* clean up the remaining free pages */
 =09put_pages_list(&pagepool);
-=09return 0;
 }
=20
 const struct address_space_operations z_erofs_aops =3D {
 =09.readpage =3D z_erofs_readpage,
-=09.readpages =3D z_erofs_readpages,
+=09.readahead =3D z_erofs_readahead,
 };
=20
--=20
2.25.1


