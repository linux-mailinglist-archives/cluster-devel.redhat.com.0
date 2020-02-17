Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C1A33161A17
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581965202;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7y4Wu+pnqqsXXg+m6Hsa+4B3pwRrbZbfbcHPjEwnvhU=;
	b=Ptww6OdOOw4oy0DdbYpt2I8CRyz6MkiNyGQT/+MP8teX5AmM/ZWkvPCSHE75xMqwIrH1eJ
	bYKrMFVCRgJxYmf5/h8CGRecRTiDWMr9BAflfS0EgFB8L4VnB8vvIiR3WI/ehbJ/Yg+soN
	fTWcCvc3+TjrHG/UF5YrLzYPIhH+siE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-Xjmb1U-bPlGO_aMfSILmCg-1; Mon, 17 Feb 2020 13:46:41 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E59F1407;
	Mon, 17 Feb 2020 18:46:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF3A219756;
	Mon, 17 Feb 2020 18:46:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D09B735AEF;
	Mon, 17 Feb 2020 18:46:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HIkT4r024878 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 13:46:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DC4822018036; Mon, 17 Feb 2020 18:46:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D75972026D67
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD23010192A1
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 18:46:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-404-Wn6LMq4EP96diNHNGSGogw-1; Mon, 17 Feb 2020 13:46:26 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3lPL-00058z-FT; Mon, 17 Feb 2020 18:46:15 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Feb 2020 10:45:47 -0800
Message-Id: <20200217184613.19668-7-willy@infradead.org>
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: Wn6LMq4EP96diNHNGSGogw-1
X-MC-Unique: Xjmb1U-bPlGO_aMfSILmCg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HIkT4r024878
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v6 05/16] mm: Put readahead pages in cache
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

At allocation time, put the pages in the cache unless we're using
->readpages.  Add the readahead_for_each() iterator for the benefit of
the ->readpage fallback.  This iterator supports huge pages, even though
none of the filesystems to be converted do yet.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/pagemap.h | 24 ++++++++++++++++++++++++
 mm/readahead.c          | 34 +++++++++++++++++-----------------
 2 files changed, 41 insertions(+), 17 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 982ecda2d4a2..3613154e79e4 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -639,8 +639,32 @@ struct readahead_control {
 /* private: use the readahead_* accessors instead */
 =09pgoff_t _start;
 =09unsigned int _nr_pages;
+=09unsigned int _batch_count;
 };
=20
+static inline struct page *readahead_page(struct readahead_control *rac)
+{
+=09struct page *page;
+
+=09if (!rac->_nr_pages)
+=09=09return NULL;
+
+=09page =3D xa_load(&rac->mapping->i_pages, rac->_start);
+=09VM_BUG_ON_PAGE(!PageLocked(page), page);
+=09rac->_batch_count =3D hpage_nr_pages(page);
+
+=09return page;
+}
+
+static inline void readahead_next(struct readahead_control *rac)
+{
+=09rac->_nr_pages -=3D rac->_batch_count;
+=09rac->_start +=3D rac->_batch_count;
+}
+
+#define readahead_for_each(rac, page)=09=09=09=09=09\
+=09for (; (page =3D readahead_page(rac)); readahead_next(rac))
+
 /* The number of pages in this readahead block */
 static inline unsigned int readahead_count(struct readahead_control *rac)
 {
diff --git a/mm/readahead.c b/mm/readahead.c
index 74791b96013f..7663de534734 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -113,12 +113,11 @@ int read_cache_pages(struct address_space *mapping, s=
truct list_head *pages,
=20
 EXPORT_SYMBOL(read_cache_pages);
=20
-static void read_pages(struct readahead_control *rac, struct list_head *pa=
ges,
-=09=09gfp_t gfp)
+static void read_pages(struct readahead_control *rac, struct list_head *pa=
ges)
 {
 =09const struct address_space_operations *aops =3D rac->mapping->a_ops;
+=09struct page *page;
 =09struct blk_plug plug;
-=09unsigned page_idx;
=20
 =09blk_start_plug(&plug);
=20
@@ -127,19 +126,13 @@ static void read_pages(struct readahead_control *rac,=
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
+=09} else {
+=09=09readahead_for_each(rac, page) {
 =09=09=09aops->readpage(rac->file, page);
-=09=09put_page(page);
+=09=09=09put_page(page);
+=09=09}
 =09}
=20
-out:
 =09blk_finish_plug(&plug);
 }
=20
@@ -159,6 +152,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09int page_idx;
 =09loff_t isize =3D i_size_read(inode);
 =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
+=09bool use_list =3D mapping->a_ops->readpages;
 =09struct readahead_control rac =3D {
 =09=09.mapping =3D mapping,
 =09=09.file =3D filp,
@@ -196,8 +190,14 @@ void __do_page_cache_readahead(struct address_space *m=
apping,
 =09=09page =3D __page_cache_alloc(gfp_mask);
 =09=09if (!page)
 =09=09=09break;
-=09=09page->index =3D offset;
-=09=09list_add(&page->lru, &page_pool);
+=09=09if (use_list) {
+=09=09=09page->index =3D offset;
+=09=09=09list_add(&page->lru, &page_pool);
+=09=09} else if (add_to_page_cache_lru(page, mapping, offset,
+=09=09=09=09=09gfp_mask) < 0) {
+=09=09=09put_page(page);
+=09=09=09goto read;
+=09=09}
 =09=09if (page_idx =3D=3D nr_to_read - lookahead_size)
 =09=09=09SetPageReadahead(page);
 =09=09rac._nr_pages++;
@@ -205,7 +205,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09=09continue;
 read:
 =09=09if (readahead_count(&rac))
-=09=09=09read_pages(&rac, &page_pool, gfp_mask);
+=09=09=09read_pages(&rac, &page_pool);
 =09=09rac._nr_pages =3D 0;
 =09=09rac._start =3D ++offset;
 =09}
@@ -216,7 +216,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09 * will then handle the error.
 =09 */
 =09if (readahead_count(&rac))
-=09=09read_pages(&rac, &page_pool, gfp_mask);
+=09=09read_pages(&rac, &page_pool);
 =09BUG_ON(!list_empty(&page_pool));
 }
=20
--=20
2.25.0


