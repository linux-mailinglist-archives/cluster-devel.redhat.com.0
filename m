Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 54AFF18FED7
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Mar 2020 21:23:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584995012;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qF5FSRtKF29o1bufKhzNozMeV8gVOvh1Fb17V4IpV78=;
	b=CIhYSfBnTHiLxY4JuEchXNeVAjTQeubz0ZjhHg0JAa+/ViV2CF+wrkZEoXPNrVhSKujhIm
	F4N10Qf3gieQ8YqkpCE0oa4U4/WllEMncS6JJjwWSxchc9VTO679JDvfNFuxZ699cTAlJr
	nLLM8e5G6E78uS9YJoB2ZaFoWMvHQU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-GONcuHkEOsqmlWPfObgTMA-1; Mon, 23 Mar 2020 16:23:29 -0400
X-MC-Unique: GONcuHkEOsqmlWPfObgTMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D200B8010FA;
	Mon, 23 Mar 2020 20:23:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B311D19C70;
	Mon, 23 Mar 2020 20:23:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9178018089C8;
	Mon, 23 Mar 2020 20:23:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02NKNLHU014751 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 16:23:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E19EC1003333; Mon, 23 Mar 2020 20:23:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDA771003343
	for <cluster-devel@redhat.com>; Mon, 23 Mar 2020 20:23:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD79B80029B
	for <cluster-devel@redhat.com>; Mon, 23 Mar 2020 20:23:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-355-54okjCo1ONi6Dz6ID4d_TA-1; Mon, 23 Mar 2020 16:23:18 -0400
X-MC-Unique: 54okjCo1ONi6Dz6ID4d_TA-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jGTbB-0003Up-IQ; Mon, 23 Mar 2020 20:23:01 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 23 Mar 2020 13:22:40 -0700
Message-Id: <20200323202259.13363-7-willy@infradead.org>
In-Reply-To: <20200323202259.13363-1-willy@infradead.org>
References: <20200323202259.13363-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02NKNLHU014751
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v10 06/25] mm: Use readahead_control to pass
	arguments
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

In this patch, only between __do_page_cache_readahead() and read_pages(),
but it will be extended in upcoming patches.  The read_pages() function
becomes aops centric, as this makes the most sense by the end of the
patchset.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 mm/readahead.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 9fcd4e32b62d..9d9aa4ffc7d4 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -113,29 +113,32 @@ int read_cache_pages(struct address_space *mapping, s=
truct list_head *pages,
=20
 EXPORT_SYMBOL(read_cache_pages);
=20
-static void read_pages(struct address_space *mapping, struct file *filp,
-=09=09struct list_head *pages, unsigned int nr_pages, gfp_t gfp)
+static void read_pages(struct readahead_control *rac, struct list_head *pa=
ges,
+=09=09gfp_t gfp)
 {
+=09const struct address_space_operations *aops =3D rac->mapping->a_ops;
 =09struct blk_plug plug;
 =09unsigned page_idx;
=20
-=09if (!nr_pages)
+=09if (!readahead_count(rac))
 =09=09return;
=20
 =09blk_start_plug(&plug);
=20
-=09if (mapping->a_ops->readpages) {
-=09=09mapping->a_ops->readpages(filp, mapping, pages, nr_pages);
+=09if (aops->readpages) {
+=09=09aops->readpages(rac->file, rac->mapping, pages,
+=09=09=09=09readahead_count(rac));
 =09=09/* Clean up the remaining pages */
 =09=09put_pages_list(pages);
 =09=09goto out;
 =09}
=20
-=09for (page_idx =3D 0; page_idx < nr_pages; page_idx++) {
+=09for (page_idx =3D 0; page_idx < readahead_count(rac); page_idx++) {
 =09=09struct page *page =3D lru_to_page(pages);
 =09=09list_del(&page->lru);
-=09=09if (!add_to_page_cache_lru(page, mapping, page->index, gfp))
-=09=09=09mapping->a_ops->readpage(filp, page);
+=09=09if (!add_to_page_cache_lru(page, rac->mapping, page->index,
+=09=09=09=09gfp))
+=09=09=09aops->readpage(rac->file, page);
 =09=09put_page(page);
 =09}
=20
@@ -143,6 +146,7 @@ static void read_pages(struct address_space *mapping, s=
truct file *filp,
 =09blk_finish_plug(&plug);
=20
 =09BUG_ON(!list_empty(pages));
+=09rac->_nr_pages =3D 0;
 }
=20
 /*
@@ -160,9 +164,12 @@ void __do_page_cache_readahead(struct address_space *m=
apping,
 =09unsigned long end_index;=09/* The last page we want to read */
 =09LIST_HEAD(page_pool);
 =09int page_idx;
-=09unsigned int nr_pages =3D 0;
 =09loff_t isize =3D i_size_read(inode);
 =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
+=09struct readahead_control rac =3D {
+=09=09.mapping =3D mapping,
+=09=09.file =3D filp,
+=09};
=20
 =09if (isize =3D=3D 0)
 =09=09return;
@@ -185,9 +192,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09=09=09 * contiguous pages before continuing with the next
 =09=09=09 * batch.
 =09=09=09 */
-=09=09=09read_pages(mapping, filp, &page_pool, nr_pages,
-=09=09=09=09=09=09gfp_mask);
-=09=09=09nr_pages =3D 0;
+=09=09=09read_pages(&rac, &page_pool, gfp_mask);
 =09=09=09continue;
 =09=09}
=20
@@ -198,7 +203,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09=09list_add(&page->lru, &page_pool);
 =09=09if (page_idx =3D=3D nr_to_read - lookahead_size)
 =09=09=09SetPageReadahead(page);
-=09=09nr_pages++;
+=09=09rac._nr_pages++;
 =09}
=20
 =09/*
@@ -206,7 +211,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09 * uptodate then the caller will launch readpage again, and
 =09 * will then handle the error.
 =09 */
-=09read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
+=09read_pages(&rac, &page_pool, gfp_mask);
 }
=20
 /*
--=20
2.25.1


