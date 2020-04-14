Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D46121A80E0
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Apr 2020 17:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586876587;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=++qmz+FAq4cv/bL4j+JFFTCA4zmywTbVIJpXGVYBTsU=;
	b=c3EW8e41PAyrsRR+Ou+M/HtyTZkhITj2C5uHWAn5EfaaZkh3n1TTYstOtwLh4hGMI79/sE
	B93jP9M2oTW6epBIMEsAp8PnquLVyjWGAwg+B1VdE0t4ANtbjL1w4EfwG2eP4qGxih97gc
	/HgdYk6Xvi2HQBpR0Gh08O+TyZ0frKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-uxgb_jc5Mma1YoCOrgyEKw-1; Tue, 14 Apr 2020 11:03:05 -0400
X-MC-Unique: uxgb_jc5Mma1YoCOrgyEKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A42C8024CF;
	Tue, 14 Apr 2020 15:03:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C7E2272A0;
	Tue, 14 Apr 2020 15:03:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D6569307E;
	Tue, 14 Apr 2020 15:03:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03EF2r0v014863 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 11:02:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 75D50ED17D; Tue, 14 Apr 2020 15:02:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71CADED14A
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BE5B1017E49
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-311-a0p6QWghM5WBFPkLXPw5Yg-1; Tue, 14 Apr 2020 11:02:49 -0400
X-MC-Unique: a0p6QWghM5WBFPkLXPw5Yg-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jON59-0006ON-UX; Tue, 14 Apr 2020 15:02:35 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 08:02:15 -0700
Message-Id: <20200414150233.24495-8-willy@infradead.org>
In-Reply-To: <20200414150233.24495-1-willy@infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03EF2r0v014863
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	Zi Yan <ziy@nvidia.com>, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v11 07/25] mm: Rename various 'offset'
	parameters to 'index'
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

The word 'offset' is used ambiguously to mean 'byte offset within
a page', 'byte offset from the start of the file' and 'page offset
from the start of the file'.  Use 'index' to mean 'page offset
from the start of the file' throughout the readahead code.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 mm/readahead.c | 86 ++++++++++++++++++++++++--------------------------
 1 file changed, 42 insertions(+), 44 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 9d9aa4ffc7d4..8a65d6bd97e0 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -156,7 +156,7 @@ static void read_pages(struct readahead_control *rac, s=
truct list_head *pages,
  * We really don't want to intermingle reads and writes like that.
  */
 void __do_page_cache_readahead(struct address_space *mapping,
-=09=09struct file *filp, pgoff_t offset, unsigned long nr_to_read,
+=09=09struct file *filp, pgoff_t index, unsigned long nr_to_read,
 =09=09unsigned long lookahead_size)
 {
 =09struct inode *inode =3D mapping->host;
@@ -180,7 +180,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
 =09 * Preallocate as many pages as we will need.
 =09 */
 =09for (page_idx =3D 0; page_idx < nr_to_read; page_idx++) {
-=09=09pgoff_t page_offset =3D offset + page_idx;
+=09=09pgoff_t page_offset =3D index + page_idx;
=20
 =09=09if (page_offset > end_index)
 =09=09=09break;
@@ -219,7 +219,7 @@ void __do_page_cache_readahead(struct address_space *ma=
pping,
  * memory at once.
  */
 void force_page_cache_readahead(struct address_space *mapping,
-=09=09struct file *filp, pgoff_t offset, unsigned long nr_to_read)
+=09=09struct file *filp, pgoff_t index, unsigned long nr_to_read)
 {
 =09struct backing_dev_info *bdi =3D inode_to_bdi(mapping->host);
 =09struct file_ra_state *ra =3D &filp->f_ra;
@@ -239,9 +239,9 @@ void force_page_cache_readahead(struct address_space *m=
apping,
=20
 =09=09if (this_chunk > nr_to_read)
 =09=09=09this_chunk =3D nr_to_read;
-=09=09__do_page_cache_readahead(mapping, filp, offset, this_chunk, 0);
+=09=09__do_page_cache_readahead(mapping, filp, index, this_chunk, 0);
=20
-=09=09offset +=3D this_chunk;
+=09=09index +=3D this_chunk;
 =09=09nr_to_read -=3D this_chunk;
 =09}
 }
@@ -322,21 +322,21 @@ static unsigned long get_next_ra_size(struct file_ra_=
state *ra,
  */
=20
 /*
- * Count contiguously cached pages from @offset-1 to @offset-@max,
+ * Count contiguously cached pages from @index-1 to @index-@max,
  * this count is a conservative estimation of
  * =09- length of the sequential read sequence, or
  * =09- thrashing threshold in memory tight systems
  */
 static pgoff_t count_history_pages(struct address_space *mapping,
-=09=09=09=09   pgoff_t offset, unsigned long max)
+=09=09=09=09   pgoff_t index, unsigned long max)
 {
 =09pgoff_t head;
=20
 =09rcu_read_lock();
-=09head =3D page_cache_prev_miss(mapping, offset - 1, max);
+=09head =3D page_cache_prev_miss(mapping, index - 1, max);
 =09rcu_read_unlock();
=20
-=09return offset - 1 - head;
+=09return index - 1 - head;
 }
=20
 /*
@@ -344,13 +344,13 @@ static pgoff_t count_history_pages(struct address_spa=
ce *mapping,
  */
 static int try_context_readahead(struct address_space *mapping,
 =09=09=09=09 struct file_ra_state *ra,
-=09=09=09=09 pgoff_t offset,
+=09=09=09=09 pgoff_t index,
 =09=09=09=09 unsigned long req_size,
 =09=09=09=09 unsigned long max)
 {
 =09pgoff_t size;
=20
-=09size =3D count_history_pages(mapping, offset, max);
+=09size =3D count_history_pages(mapping, index, max);
=20
 =09/*
 =09 * not enough history pages:
@@ -363,10 +363,10 @@ static int try_context_readahead(struct address_space=
 *mapping,
 =09 * starts from beginning of file:
 =09 * it is a strong indication of long-run stream (or whole-file-read)
 =09 */
-=09if (size >=3D offset)
+=09if (size >=3D index)
 =09=09size *=3D 2;
=20
-=09ra->start =3D offset;
+=09ra->start =3D index;
 =09ra->size =3D min(size + req_size, max);
 =09ra->async_size =3D 1;
=20
@@ -378,13 +378,13 @@ static int try_context_readahead(struct address_space=
 *mapping,
  */
 static void ondemand_readahead(struct address_space *mapping,
 =09=09struct file_ra_state *ra, struct file *filp,
-=09=09bool hit_readahead_marker, pgoff_t offset,
+=09=09bool hit_readahead_marker, pgoff_t index,
 =09=09unsigned long req_size)
 {
 =09struct backing_dev_info *bdi =3D inode_to_bdi(mapping->host);
 =09unsigned long max_pages =3D ra->ra_pages;
 =09unsigned long add_pages;
-=09pgoff_t prev_offset;
+=09pgoff_t prev_index;
=20
 =09/*
 =09 * If the request exceeds the readahead window, allow the read to
@@ -396,15 +396,15 @@ static void ondemand_readahead(struct address_space *=
mapping,
 =09/*
 =09 * start of file
 =09 */
-=09if (!offset)
+=09if (!index)
 =09=09goto initial_readahead;
=20
 =09/*
-=09 * It's the expected callback offset, assume sequential access.
+=09 * It's the expected callback index, assume sequential access.
 =09 * Ramp up sizes, and push forward the readahead window.
 =09 */
-=09if ((offset =3D=3D (ra->start + ra->size - ra->async_size) ||
-=09     offset =3D=3D (ra->start + ra->size))) {
+=09if ((index =3D=3D (ra->start + ra->size - ra->async_size) ||
+=09     index =3D=3D (ra->start + ra->size))) {
 =09=09ra->start +=3D ra->size;
 =09=09ra->size =3D get_next_ra_size(ra, max_pages);
 =09=09ra->async_size =3D ra->size;
@@ -421,14 +421,14 @@ static void ondemand_readahead(struct address_space *=
mapping,
 =09=09pgoff_t start;
=20
 =09=09rcu_read_lock();
-=09=09start =3D page_cache_next_miss(mapping, offset + 1, max_pages);
+=09=09start =3D page_cache_next_miss(mapping, index + 1, max_pages);
 =09=09rcu_read_unlock();
=20
-=09=09if (!start || start - offset > max_pages)
+=09=09if (!start || start - index > max_pages)
 =09=09=09return;
=20
 =09=09ra->start =3D start;
-=09=09ra->size =3D start - offset;=09/* old async_size */
+=09=09ra->size =3D start - index;=09/* old async_size */
 =09=09ra->size +=3D req_size;
 =09=09ra->size =3D get_next_ra_size(ra, max_pages);
 =09=09ra->async_size =3D ra->size;
@@ -443,29 +443,29 @@ static void ondemand_readahead(struct address_space *=
mapping,
=20
 =09/*
 =09 * sequential cache miss
-=09 * trivial case: (offset - prev_offset) =3D=3D 1
-=09 * unaligned reads: (offset - prev_offset) =3D=3D 0
+=09 * trivial case: (index - prev_index) =3D=3D 1
+=09 * unaligned reads: (index - prev_index) =3D=3D 0
 =09 */
-=09prev_offset =3D (unsigned long long)ra->prev_pos >> PAGE_SHIFT;
-=09if (offset - prev_offset <=3D 1UL)
+=09prev_index =3D (unsigned long long)ra->prev_pos >> PAGE_SHIFT;
+=09if (index - prev_index <=3D 1UL)
 =09=09goto initial_readahead;
=20
 =09/*
 =09 * Query the page cache and look for the traces(cached history pages)
 =09 * that a sequential stream would leave behind.
 =09 */
-=09if (try_context_readahead(mapping, ra, offset, req_size, max_pages))
+=09if (try_context_readahead(mapping, ra, index, req_size, max_pages))
 =09=09goto readit;
=20
 =09/*
 =09 * standalone, small random read
 =09 * Read as is, and do not pollute the readahead state.
 =09 */
-=09__do_page_cache_readahead(mapping, filp, offset, req_size, 0);
+=09__do_page_cache_readahead(mapping, filp, index, req_size, 0);
 =09return;
=20
 initial_readahead:
-=09ra->start =3D offset;
+=09ra->start =3D index;
 =09ra->size =3D get_init_ra_size(req_size, max_pages);
 =09ra->async_size =3D ra->size > req_size ? ra->size - req_size : ra->size=
;
=20
@@ -476,7 +476,7 @@ static void ondemand_readahead(struct address_space *ma=
pping,
 =09 * the resulted next readahead window into the current one.
 =09 * Take care of maximum IO pages as above.
 =09 */
-=09if (offset =3D=3D ra->start && ra->size =3D=3D ra->async_size) {
+=09if (index =3D=3D ra->start && ra->size =3D=3D ra->async_size) {
 =09=09add_pages =3D get_next_ra_size(ra, max_pages);
 =09=09if (ra->size + add_pages <=3D max_pages) {
 =09=09=09ra->async_size =3D add_pages;
@@ -495,9 +495,8 @@ static void ondemand_readahead(struct address_space *ma=
pping,
  * @mapping: address_space which holds the pagecache and I/O vectors
  * @ra: file_ra_state which holds the readahead state
  * @filp: passed on to ->readpage() and ->readpages()
- * @offset: start offset into @mapping, in pagecache page-sized units
- * @req_size: hint: total size of the read which the caller is performing =
in
- *            pagecache pages
+ * @index: Index of first page to be read.
+ * @req_count: Total number of pages being read by the caller.
  *
  * page_cache_sync_readahead() should be called when a cache miss happened=
:
  * it will submit the read.  The readahead logic may decide to piggyback m=
ore
@@ -506,7 +505,7 @@ static void ondemand_readahead(struct address_space *ma=
pping,
  */
 void page_cache_sync_readahead(struct address_space *mapping,
 =09=09=09       struct file_ra_state *ra, struct file *filp,
-=09=09=09       pgoff_t offset, unsigned long req_size)
+=09=09=09       pgoff_t index, unsigned long req_count)
 {
 =09/* no read-ahead */
 =09if (!ra->ra_pages)
@@ -517,12 +516,12 @@ void page_cache_sync_readahead(struct address_space *=
mapping,
=20
 =09/* be dumb */
 =09if (filp && (filp->f_mode & FMODE_RANDOM)) {
-=09=09force_page_cache_readahead(mapping, filp, offset, req_size);
+=09=09force_page_cache_readahead(mapping, filp, index, req_count);
 =09=09return;
 =09}
=20
 =09/* do read-ahead */
-=09ondemand_readahead(mapping, ra, filp, false, offset, req_size);
+=09ondemand_readahead(mapping, ra, filp, false, index, req_count);
 }
 EXPORT_SYMBOL_GPL(page_cache_sync_readahead);
=20
@@ -531,21 +530,20 @@ EXPORT_SYMBOL_GPL(page_cache_sync_readahead);
  * @mapping: address_space which holds the pagecache and I/O vectors
  * @ra: file_ra_state which holds the readahead state
  * @filp: passed on to ->readpage() and ->readpages()
- * @page: the page at @offset which has the PG_readahead flag set
- * @offset: start offset into @mapping, in pagecache page-sized units
- * @req_size: hint: total size of the read which the caller is performing =
in
- *            pagecache pages
+ * @page: The page at @index which triggered the readahead call.
+ * @index: Index of first page to be read.
+ * @req_count: Total number of pages being read by the caller.
  *
  * page_cache_async_readahead() should be called when a page is used which
- * has the PG_readahead flag; this is a marker to suggest that the applica=
tion
+ * is marked as PageReadahead; this is a marker to suggest that the applic=
ation
  * has used up enough of the readahead window that we should start pulling=
 in
  * more pages.
  */
 void
 page_cache_async_readahead(struct address_space *mapping,
 =09=09=09   struct file_ra_state *ra, struct file *filp,
-=09=09=09   struct page *page, pgoff_t offset,
-=09=09=09   unsigned long req_size)
+=09=09=09   struct page *page, pgoff_t index,
+=09=09=09   unsigned long req_count)
 {
 =09/* no read-ahead */
 =09if (!ra->ra_pages)
@@ -569,7 +567,7 @@ page_cache_async_readahead(struct address_space *mappin=
g,
 =09=09return;
=20
 =09/* do read-ahead */
-=09ondemand_readahead(mapping, ra, filp, true, offset, req_size);
+=09ondemand_readahead(mapping, ra, filp, true, index, req_count);
 }
 EXPORT_SYMBOL_GPL(page_cache_async_readahead);
=20
--=20
2.25.1


