Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EC9F5161A19
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581965203;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/yycLYMZsTSa+sDG2cuPuJrcMYHQ9N7pmItJBzlFD5s=;
	b=gdfcuy292/VqAxCJI2e1UjGYVLPUehYU9jDIN794EYujoiXkEPs/jFmoMaDQ8IYC/ARyTy
	4Qv0H6YxTltwXkbj5D275EPGK0/hY15K1xRu22x+xQHvR6Qw+DB/nnDhT0E9SAvs6FP79I
	fVBupyeymQJxUEb/8M7G2r1TBqrwcaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-4OHb0is9NHi-LUAityoueQ-1; Mon, 17 Feb 2020 13:46:40 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12A46802562;
	Mon, 17 Feb 2020 18:46:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F133960BF3;
	Mon, 17 Feb 2020 18:46:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D62D218034EA;
	Mon, 17 Feb 2020 18:46:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HIkSxU024836 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 13:46:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 07A6A2166B2B; Mon, 17 Feb 2020 18:46:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F287B2166B2D
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92C42185B0C6
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-354-sirEJMRKN_Og2LPGhkCf9w-1; Mon, 17 Feb 2020 13:46:24 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3lPM-0005B9-0S; Mon, 17 Feb 2020 18:46:16 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Feb 2020 10:46:00 -0800
Message-Id: <20200217184613.19668-20-willy@infradead.org>
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: sirEJMRKN_Og2LPGhkCf9w-1
X-MC-Unique: 4OHb0is9NHi-LUAityoueQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HIkSxU024836
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v6 11/16] erofs: Convert compressed files
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Use the new readahead operation in erofs.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/erofs/zdata.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 17f45fcb8c5c..7c02015d501d 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -1303,28 +1303,23 @@ static bool should_decompress_synchronously(struct =
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
+=09f.headoffset =3D readahead_offset(rac);
=20
+=09readahead_for_each(rac, page) {
 =09=09prefetchw(&page->flags);
-=09=09list_del(&page->lru);
=20
 =09=09/*
 =09=09 * A pure asynchronous readahead is indicated if
@@ -1333,11 +1328,6 @@ static int z_erofs_readpages(struct file *filp, stru=
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
@@ -1366,11 +1356,10 @@ static int z_erofs_readpages(struct file *filp, str=
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
2.25.0


