Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2541A80CF
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Apr 2020 17:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586876584;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L9LgvZaU/GkVzeWrEy5D88Dwg/J3suiB8uSOlR8Ir2s=;
	b=cZp7jakgHs0f5jwLdThRgXzr/ml0y6iF1CM2lRRu7odSY06Gl5UXPfjhNbcSczBScTyvpT
	ZOzYaxvk35BM4352UP+5Rbu1xkHf+s9ikOUwO/c2aTfXXCdtghL21Vw9B5O+xpwowTWy57
	fzzKjrSykV+4MPbfb/96htRaUNmqYnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-msDr-FBTOFigzH43RSEreg-1; Tue, 14 Apr 2020 11:02:58 -0400
X-MC-Unique: msDr-FBTOFigzH43RSEreg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4D7C800D53;
	Tue, 14 Apr 2020 15:02:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C74F18A85;
	Tue, 14 Apr 2020 15:02:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6544618089D0;
	Tue, 14 Apr 2020 15:02:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03EF2oVD014755 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 11:02:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 269CA10D14FC; Tue, 14 Apr 2020 15:02:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2340110D16CD
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02706185A795
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-393-YyG-Kt-UOvik3pwghvjbRw-1; Tue, 14 Apr 2020 11:02:45 -0400
X-MC-Unique: YyG-Kt-UOvik3pwghvjbRw-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jON5A-0006Ob-1k; Tue, 14 Apr 2020 15:02:36 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 08:02:18 -0700
Message-Id: <20200414150233.24495-11-willy@infradead.org>
In-Reply-To: <20200414150233.24495-1-willy@infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03EF2oVD014755
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v11 10/25] mm: Put readahead pages in cache
	earlier
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

When populating the page cache for readahead, mappings that use
->readpages must populate the page cache themselves as the pages are
passed on a linked list which would normally be used for the page cache's
LRU.  For mappings that use ->readpage or the upcoming ->readahead method,
we can put the pages into the page cache as soon as they're allocated,
which solves a race between readahead and direct IO.  It also lets us
remove the gfp argument from read_pages().

Use the new readahead_page() API to implement the repeated calls to
->readpage(), just like most filesystems will.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 mm/readahead.c | 46 ++++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index ddc63d3b07b8..e52b3a7b9da5 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -114,14 +114,14 @@ int read_cache_pages(struct address_space *mapping, s=
truct list_head *pages,
 EXPORT_SYMBOL(read_cache_pages);
=20
 static void read_pages(struct readahead_control *rac, struct list_head *pa=
ges,
-=09=09gfp_t gfp)
+=09=09bool skip_page)
 {
 =09const struct address_space_operations *aops =3D rac->mapping->a_ops;
+=09struct page *page;
 =09struct blk_plug plug;
-=09unsigned page_idx;
=20
 =09if (!readahead_count(rac))
-=09=09return;
+=09=09goto out;
=20
 =09blk_start_plug(&plug);
=20
@@ -130,23 +130,23 @@ static void read_pages(struct readahead_control *rac,=
 struct list_head *pages,
 =09=09=09=09readahead_count(rac));
 =09=09/* Clean up the remaining pages */
 =09=09put_pages_list(pages);
-=09=09goto out;
-=09}
-
-=09for (page_idx =3D 0; page_idx < readahead_count(rac); page_idx++) {
-=09=09struct page *page =3D lru_to_page(pages);
-=09=09list_del(&page->lru);
-=09=09if (!add_to_page_cache_lru(page, rac->mapping, page->index,
-=09=09=09=09gfp))
+=09=09rac->_index +=3D rac->_nr_pages;
+=09=09rac->_nr_pages =3D 0;
+=09} else {
+=09=09while ((page =3D readahead_page(rac))) {
 =09=09=09aops->readpage(rac->file, page);
-=09=09put_page(page);
+=09=09=09put_page(page);
+=09=09}
 =09}
=20
-out:
 =09blk_finish_plug(&plug);
=20
 =09BUG_ON(!list_empty(pages));
-=09rac->_nr_pages =3D 0;
+=09BUG_ON(readahead_count(rac));
+
+out:
+=09if (skip_page)
+=09=09rac->_index++;
 }
=20
 /*
@@ -168,6 +168,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09struct readahead_control rac =3D {
 =09=09.mapping =3D mapping,
 =09=09.file =3D filp,
+=09=09._index =3D index,
 =09};
 =09unsigned long i;
=20
@@ -183,6 +184,8 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09=09if (index + i > end_index)
 =09=09=09break;
=20
+=09=09BUG_ON(index + i !=3D rac._index + rac._nr_pages);
+
 =09=09page =3D xa_load(&mapping->i_pages, index + i);
 =09=09if (page && !xa_is_value(page)) {
 =09=09=09/*
@@ -190,15 +193,22 @@ void __do_page_cache_readahead(struct address_space *=
mapping,
 =09=09=09 * contiguous pages before continuing with the next
 =09=09=09 * batch.
 =09=09=09 */
-=09=09=09read_pages(&rac, &page_pool, gfp_mask);
+=09=09=09read_pages(&rac, &page_pool, true);
 =09=09=09continue;
 =09=09}
=20
 =09=09page =3D __page_cache_alloc(gfp_mask);
 =09=09if (!page)
 =09=09=09break;
-=09=09page->index =3D index + i;
-=09=09list_add(&page->lru, &page_pool);
+=09=09if (mapping->a_ops->readpages) {
+=09=09=09page->index =3D index + i;
+=09=09=09list_add(&page->lru, &page_pool);
+=09=09} else if (add_to_page_cache_lru(page, mapping, index + i,
+=09=09=09=09=09gfp_mask) < 0) {
+=09=09=09put_page(page);
+=09=09=09read_pages(&rac, &page_pool, true);
+=09=09=09continue;
+=09=09}
 =09=09if (i =3D=3D nr_to_read - lookahead_size)
 =09=09=09SetPageReadahead(page);
 =09=09rac._nr_pages++;
@@ -209,7 +219,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09 * uptodate then the caller will launch readpage again, and
 =09 * will then handle the error.
 =09 */
-=09read_pages(&rac, &page_pool, gfp_mask);
+=09read_pages(&rac, &page_pool, false);
 }
=20
 /*
--=20
2.25.1


