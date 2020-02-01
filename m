Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 996B914F83E
	for <lists+cluster-devel@lfdr.de>; Sat,  1 Feb 2020 16:13:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580569985;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bpTzNhKjzwlypxePY5Vld2YMIB1JsExyXAISbsE/LuA=;
	b=CZD1C8k4y05U+aDQYQUUQpqGOvH23GCG/GXDbIFkhyCqDKcac0URBK68axWzoaWKQig8Fj
	5bpmoW8jRGBwKJgKCGb8irzRC+2FaM45od4vbCZ0Y1n0/efB6aIKF5PRZI8lbsmcf0+twx
	c9tDcoj+uOMv8ROMnWfeegSsEowKpI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-3NnysVGdMLSQrcQupf336Q-1; Sat, 01 Feb 2020 10:13:03 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F13F9800D50;
	Sat,  1 Feb 2020 15:12:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF65489A71;
	Sat,  1 Feb 2020 15:12:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2392318089CD;
	Sat,  1 Feb 2020 15:12:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 011FCsBP030093 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 1 Feb 2020 10:12:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0514CA4874; Sat,  1 Feb 2020 15:12:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3E8FD0B2B
	for <cluster-devel@redhat.com>; Sat,  1 Feb 2020 15:12:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8677F185AB80
	for <cluster-devel@redhat.com>; Sat,  1 Feb 2020 15:12:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-67-EWfRsaRPN5CXG4pE4RbFYQ-1; Sat, 01 Feb 2020 10:12:49 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1ixuRu-0006HP-4H; Sat, 01 Feb 2020 15:12:42 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sat,  1 Feb 2020 07:12:31 -0800
Message-Id: <20200201151240.24082-4-willy@infradead.org>
In-Reply-To: <20200201151240.24082-1-willy@infradead.org>
References: <20200201151240.24082-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: EWfRsaRPN5CXG4pE4RbFYQ-1
X-MC-Unique: 3NnysVGdMLSQrcQupf336Q-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 011FCsBP030093
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v4 03/12] readahead: Put pages in cache
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

At allocation time, put the pages in the cache unless we're using
->readpages.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: linux-btrfs@vger.kernel.org
Cc: linux-erofs@lists.ozlabs.org
Cc: linux-ext4@vger.kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: linux-xfs@vger.kernel.org
Cc: cluster-devel@redhat.com
Cc: ocfs2-devel@oss.oracle.com
---
 mm/readahead.c | 64 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 20 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index fc77d13af556..7daef0038b14 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -114,10 +114,10 @@ int read_cache_pages(struct address_space *mapping, s=
truct list_head *pages,
 EXPORT_SYMBOL(read_cache_pages);
=20
 static void read_pages(struct address_space *mapping, struct file *filp,
-=09=09struct list_head *pages, unsigned int nr_pages, gfp_t gfp)
+=09=09struct list_head *pages, pgoff_t start,
+=09=09unsigned int nr_pages)
 {
 =09struct blk_plug plug;
-=09unsigned page_idx;
=20
 =09blk_start_plug(&plug);
=20
@@ -125,18 +125,17 @@ static void read_pages(struct address_space *mapping,=
 struct file *filp,
 =09=09mapping->a_ops->readpages(filp, mapping, pages, nr_pages);
 =09=09/* Clean up the remaining pages */
 =09=09put_pages_list(pages);
-=09=09goto out;
-=09}
+=09} else {
+=09=09struct page *page;
+=09=09unsigned long index;
=20
-=09for (page_idx =3D 0; page_idx < nr_pages; page_idx++) {
-=09=09struct page *page =3D lru_to_page(pages);
-=09=09list_del(&page->lru);
-=09=09if (!add_to_page_cache_lru(page, mapping, page->index, gfp))
+=09=09xa_for_each_range(&mapping->i_pages, index, page, start,
+=09=09=09=09start + nr_pages - 1) {
 =09=09=09mapping->a_ops->readpage(filp, page);
-=09=09put_page(page);
+=09=09=09put_page(page);
+=09=09}
 =09}
=20
-out:
 =09blk_finish_plug(&plug);
 }
=20
@@ -153,13 +152,14 @@ unsigned long __do_page_cache_readahead(struct addres=
s_space *mapping,
 =09=09unsigned long lookahead_size)
 {
 =09struct inode *inode =3D mapping->host;
-=09struct page *page;
 =09unsigned long end_index;=09/* The last page we want to read */
 =09LIST_HEAD(page_pool);
 =09int page_idx;
+=09pgoff_t page_offset;
 =09unsigned long nr_pages =3D 0;
 =09loff_t isize =3D i_size_read(inode);
 =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
+=09bool use_list =3D mapping->a_ops->readpages;
=20
 =09if (isize =3D=3D 0)
 =09=09goto out;
@@ -170,21 +170,32 @@ unsigned long __do_page_cache_readahead(struct addres=
s_space *mapping,
 =09 * Preallocate as many pages as we will need.
 =09 */
 =09for (page_idx =3D 0; page_idx < nr_to_read; page_idx++) {
-=09=09pgoff_t page_offset =3D offset + page_idx;
+=09=09struct page *page;
=20
+=09=09page_offset =3D offset + page_idx;
 =09=09if (page_offset > end_index)
 =09=09=09break;
=20
 =09=09page =3D xa_load(&mapping->i_pages, page_offset);
 =09=09if (page && !xa_is_value(page)) {
 =09=09=09/*
-=09=09=09 * Page already present?  Kick off the current batch of
-=09=09=09 * contiguous pages before continuing with the next
-=09=09=09 * batch.
+=09=09=09 * Page already present?  Kick off the current batch
+=09=09=09 * of contiguous pages before continuing with the
+=09=09=09 * next batch.
 =09=09=09 */
 =09=09=09if (nr_pages)
-=09=09=09=09read_pages(mapping, filp, &page_pool, nr_pages,
-=09=09=09=09=09=09gfp_mask);
+=09=09=09=09read_pages(mapping, filp, &page_pool,
+=09=09=09=09=09=09page_offset - nr_pages,
+=09=09=09=09=09=09nr_pages);
+=09=09=09/*
+=09=09=09 * It's possible this page is the page we should
+=09=09=09 * be marking with PageReadahead.  However, we
+=09=09=09 * don't have a stable ref to this page so it might
+=09=09=09 * be reallocated to another user before we can set
+=09=09=09 * the bit.  There's probably another page in the
+=09=09=09 * cache marked with PageReadahead from the other
+=09=09=09 * process which accessed this file.
+=09=09=09 */
 =09=09=09nr_pages =3D 0;
 =09=09=09continue;
 =09=09}
@@ -192,8 +203,20 @@ unsigned long __do_page_cache_readahead(struct address=
_space *mapping,
 =09=09page =3D __page_cache_alloc(gfp_mask);
 =09=09if (!page)
 =09=09=09break;
-=09=09page->index =3D page_offset;
-=09=09list_add(&page->lru, &page_pool);
+=09=09if (use_list) {
+=09=09=09page->index =3D page_offset;
+=09=09=09list_add(&page->lru, &page_pool);
+=09=09} else if (add_to_page_cache_lru(page, mapping, page_offset,
+=09=09=09=09=09gfp_mask) < 0) {
+=09=09=09if (nr_pages)
+=09=09=09=09read_pages(mapping, filp, &page_pool,
+=09=09=09=09=09=09page_offset - nr_pages,
+=09=09=09=09=09=09nr_pages);
+=09=09=09put_page(page);
+=09=09=09nr_pages =3D 0;
+=09=09=09continue;
+=09=09}
+
 =09=09if (page_idx =3D=3D nr_to_read - lookahead_size)
 =09=09=09SetPageReadahead(page);
 =09=09nr_pages++;
@@ -205,7 +228,8 @@ unsigned long __do_page_cache_readahead(struct address_=
space *mapping,
 =09 * will then handle the error.
 =09 */
 =09if (nr_pages)
-=09=09read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
+=09=09read_pages(mapping, filp, &page_pool, page_offset - nr_pages,
+=09=09=09=09nr_pages);
 =09BUG_ON(!list_empty(&page_pool));
 out:
 =09return nr_pages;
--=20
2.24.1


