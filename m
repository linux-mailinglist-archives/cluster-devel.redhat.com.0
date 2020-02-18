Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id AD86B1630AF
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 20:54:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582055675;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k23z3dfJlJQ2hNj5JaL+D/isrjddE6FvNB15vvl6HvI=;
	b=DJyedsjRcbVcmeNQNrowT4abFuZ2cUZsUxGqN6EHW8SH+taLg+jOJZO/sTKQj/i3ON9Y++
	6amW0uX4h1RR+2DM1MBt1QBsJ594fRWbzz3bt5pc7mQtpjmlJtjnksUGQkDyZ/JwT+o/UN
	MA1znJmo0PbqH5ByvJNj90uNC9a0EYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-e5KFvuObOj6lzJij2VrMow-1; Tue, 18 Feb 2020 14:54:33 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 753D81005514;
	Tue, 18 Feb 2020 19:54:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35BFC90526;
	Tue, 18 Feb 2020 19:54:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE0CC35B0A;
	Tue, 18 Feb 2020 19:54:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IJsJT6012780 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 14:54:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7EA532063207; Tue, 18 Feb 2020 19:54:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79124206320D
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 19:54:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB9F8186E166
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 19:54:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-13-TRqIFCbCPqW7OCPS3Q0GuA-1; Tue, 18 Feb 2020 14:54:14 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j48wW-0003Wd-Ia; Tue, 18 Feb 2020 19:54:04 +0000
Date: Tue, 18 Feb 2020 11:54:04 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200218195404.GD24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-16-willy@infradead.org>
	<20200218063110.GO10776@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200218063110.GO10776@dread.disaster.area>
X-MC-Unique: TRqIFCbCPqW7OCPS3Q0GuA-1
X-MC-Unique: e5KFvuObOj6lzJij2VrMow-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01IJsJT6012780
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 09/19] mm: Add
	page_cache_readahead_limit
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 05:31:10PM +1100, Dave Chinner wrote:
> On Mon, Feb 17, 2020 at 10:45:56AM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >=20
> > ext4 and f2fs have duplicated the guts of the readahead code so
> > they can read past i_size.  Instead, separate out the guts of the
> > readahead code so they can call it directly.
>=20
> Gross and nasty (hosting non-stale data beyond EOF in the page
> cache, that is).

I thought you meant sneaking changes into the VFS (that were rejected) by
copying VFS code and modifying it ...

> > +/**
> > + * page_cache_readahead_limit - Start readahead beyond a file's i_size=
.
> > + * @mapping: File address space.
> > + * @file: This instance of the open file; used for authentication.
> > + * @offset: First page index to read.
> > + * @end_index: The maximum page index to read.
> > + * @nr_to_read: The number of pages to read.
> > + * @lookahead_size: Where to start the next readahead.
> > + *
> > + * This function is for filesystems to call when they want to start
> > + * readahead potentially beyond a file's stated i_size.  If you want
> > + * to start readahead on a normal file, you probably want to call
> > + * page_cache_async_readahead() or page_cache_sync_readahead() instead=
.
> > + *
> > + * Context: File is referenced by caller.  Mutexes may be held by call=
er.
> > + * May sleep, but will not reenter filesystem to reclaim memory.
> >   */
> > -void __do_page_cache_readahead(struct address_space *mapping,
> > -=09=09struct file *filp, pgoff_t offset, unsigned long nr_to_read,
> > -=09=09unsigned long lookahead_size)
> > +void page_cache_readahead_limit(struct address_space *mapping,
>=20
> ... I don't think the function name conveys it's purpose. It's
> really a ranged readahead that ignores where i_size lies. i.e
>=20
> =09page_cache_readahead_range(mapping, start, end, nr_to_read)
>=20
> seems like a better API to me, and then you can drop the "start
> readahead beyond i_size" comments and replace it with "Range is not
> limited by the inode's i_size and hence can be used to read data
> stored beyond EOF into the page cache."

I'm concerned that calling it 'range' implies "I want to read between
start and end" rather than "I want to read nr_to_read at start, oh but
don't go past end".

Maybe the right way to do this is have the three callers cap nr_to_read.
Well, the one caller ... after all, f2fs and ext4 have no desire to
cap the length.  Then we can call it page_cache_readahead_exceed() or
page_cache_readahead_dangerous() or something else like that to make it
clear that you shouldn't be calling it.

> Also: "This is almost certainly not the function you want to call.
> Use page_cache_async_readahead or page_cache_sync_readahead()
> instead."

+1 to that ;-)

Here's what I currently have:

>From d202dda7a92566496fe9e233ee7855fb560324ce Mon Sep 17 00:00:00 2001
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Date: Mon, 10 Feb 2020 18:31:15 -0500
Subject: [PATCH] mm: Add page_cache_readahead_exceed

ext4 and f2fs have duplicated the guts of the readahead code so
they can read past i_size.  Instead, separate out the guts of the
readahead code so they can call it directly.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ext4/verity.c        | 35 ++--------------------
 fs/f2fs/verity.c        | 35 ++--------------------
 include/linux/pagemap.h |  3 ++
 mm/readahead.c          | 66 ++++++++++++++++++++++++++++-------------
 4 files changed, 52 insertions(+), 87 deletions(-)

diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index dc5ec724d889..172ebf860014 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -342,37 +342,6 @@ static int ext4_get_verity_descriptor(struct inode *in=
ode, void *buf,
 =09return desc_size;
 }
=20
-/*
- * Prefetch some pages from the file's Merkle tree.
- *
- * This is basically a stripped-down version of __do_page_cache_readahead(=
)
- * which works on pages past i_size.
- */
-static void ext4_merkle_tree_readahead(struct address_space *mapping,
-=09=09=09=09       pgoff_t start_index, unsigned long count)
-{
-=09LIST_HEAD(pages);
-=09unsigned int nr_pages =3D 0;
-=09struct page *page;
-=09pgoff_t index;
-=09struct blk_plug plug;
-
-=09for (index =3D start_index; index < start_index + count; index++) {
-=09=09page =3D xa_load(&mapping->i_pages, index);
-=09=09if (!page || xa_is_value(page)) {
-=09=09=09page =3D __page_cache_alloc(readahead_gfp_mask(mapping));
-=09=09=09if (!page)
-=09=09=09=09break;
-=09=09=09page->index =3D index;
-=09=09=09list_add(&page->lru, &pages);
-=09=09=09nr_pages++;
-=09=09}
-=09}
-=09blk_start_plug(&plug);
-=09ext4_mpage_readpages(mapping, &pages, NULL, nr_pages, true);
-=09blk_finish_plug(&plug);
-}
-
 static struct page *ext4_read_merkle_tree_page(struct inode *inode,
 =09=09=09=09=09       pgoff_t index,
 =09=09=09=09=09       unsigned long num_ra_pages)
@@ -386,8 +355,8 @@ static struct page *ext4_read_merkle_tree_page(struct i=
node *inode,
 =09=09if (page)
 =09=09=09put_page(page);
 =09=09else if (num_ra_pages > 1)
-=09=09=09ext4_merkle_tree_readahead(inode->i_mapping, index,
-=09=09=09=09=09=09   num_ra_pages);
+=09=09=09page_cache_readahead_exceed(inode->i_mapping, NULL,
+=09=09=09=09=09index, num_ra_pages, 0);
 =09=09page =3D read_mapping_page(inode->i_mapping, index, NULL);
 =09}
 =09return page;
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index d7d430a6f130..f240ad087162 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -222,37 +222,6 @@ static int f2fs_get_verity_descriptor(struct inode *in=
ode, void *buf,
 =09return size;
 }
=20
-/*
- * Prefetch some pages from the file's Merkle tree.
- *
- * This is basically a stripped-down version of __do_page_cache_readahead(=
)
- * which works on pages past i_size.
- */
-static void f2fs_merkle_tree_readahead(struct address_space *mapping,
-=09=09=09=09       pgoff_t start_index, unsigned long count)
-{
-=09LIST_HEAD(pages);
-=09unsigned int nr_pages =3D 0;
-=09struct page *page;
-=09pgoff_t index;
-=09struct blk_plug plug;
-
-=09for (index =3D start_index; index < start_index + count; index++) {
-=09=09page =3D xa_load(&mapping->i_pages, index);
-=09=09if (!page || xa_is_value(page)) {
-=09=09=09page =3D __page_cache_alloc(readahead_gfp_mask(mapping));
-=09=09=09if (!page)
-=09=09=09=09break;
-=09=09=09page->index =3D index;
-=09=09=09list_add(&page->lru, &pages);
-=09=09=09nr_pages++;
-=09=09}
-=09}
-=09blk_start_plug(&plug);
-=09f2fs_mpage_readpages(mapping, &pages, NULL, nr_pages, true);
-=09blk_finish_plug(&plug);
-}
-
 static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
 =09=09=09=09=09       pgoff_t index,
 =09=09=09=09=09       unsigned long num_ra_pages)
@@ -266,8 +235,8 @@ static struct page *f2fs_read_merkle_tree_page(struct i=
node *inode,
 =09=09if (page)
 =09=09=09put_page(page);
 =09=09else if (num_ra_pages > 1)
-=09=09=09f2fs_merkle_tree_readahead(inode->i_mapping, index,
-=09=09=09=09=09=09   num_ra_pages);
+=09=09=09page_cache_readahead_exceed(inode->i_mapping, NULL,
+=09=09=09=09=09index, num_ra_pages, 0);
 =09=09page =3D read_mapping_page(inode->i_mapping, index, NULL);
 =09}
 =09return page;
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 48c3bca57df6..1f7964d2b8ca 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -623,6 +623,9 @@ void page_cache_sync_readahead(struct address_space *, =
struct file_ra_state *,
 void page_cache_async_readahead(struct address_space *, struct file_ra_sta=
te *,
 =09=09struct file *, struct page *, pgoff_t index,
 =09=09unsigned long req_count);
+void page_cache_readahead_exceed(struct address_space *, struct file *,
+=09=09pgoff_t index, unsigned long nr_to_read,
+=09=09unsigned long lookahead_count);
=20
 /*
  * Like add_to_page_cache_locked, but used to add newly allocated pages:
diff --git a/mm/readahead.c b/mm/readahead.c
index 9dd431fa16c9..cad26287ad8b 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -142,45 +142,43 @@ static void read_pages(struct readahead_control *rac,=
 struct list_head *pages)
 =09blk_finish_plug(&plug);
 }
=20
-/*
- * __do_page_cache_readahead() actually reads a chunk of disk.  It allocat=
es
- * the pages first, then submits them for I/O. This avoids the very bad
- * behaviour which would occur if page allocations are causing VM writebac=
k.
- * We really don't want to intermingle reads and writes like that.
+/**
+ * page_cache_readahead_exceed - Start unchecked readahead.
+ * @mapping: File address space.
+ * @file: This instance of the open file; used for authentication.
+ * @index: First page index to read.
+ * @nr_to_read: The number of pages to read.
+ * @lookahead_size: Where to start the next readahead.
+ *
+ * This function is for filesystems to call when they want to start
+ * readahead beyond a file's stated i_size.  This is almost certainly
+ * not the function you want to call.  Use page_cache_async_readahead()
+ * or page_cache_sync_readahead() instead.
+ *
+ * Context: File is referenced by caller.  Mutexes may be held by caller.
+ * May sleep, but will not reenter filesystem to reclaim memory.
  */
-void __do_page_cache_readahead(struct address_space *mapping,
-=09=09struct file *filp, pgoff_t index, unsigned long nr_to_read,
+void page_cache_readahead_exceed(struct address_space *mapping,
+=09=09struct file *file, pgoff_t index, unsigned long nr_to_read,
 =09=09unsigned long lookahead_size)
 {
-=09struct inode *inode =3D mapping->host;
-=09unsigned long end_index;=09/* The last page we want to read */
 =09LIST_HEAD(page_pool);
 =09unsigned long i;
-=09loff_t isize =3D i_size_read(inode);
 =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
 =09bool use_list =3D mapping->a_ops->readpages;
 =09struct readahead_control rac =3D {
 =09=09.mapping =3D mapping,
-=09=09.file =3D filp,
+=09=09.file =3D file,
 =09=09._start =3D index,
 =09=09._nr_pages =3D 0,
 =09};
=20
-=09if (isize =3D=3D 0)
-=09=09return;
-
-=09end_index =3D ((isize - 1) >> PAGE_SHIFT);
-
 =09/*
 =09 * Preallocate as many pages as we will need.
 =09 */
 =09for (i =3D 0; i < nr_to_read; i++) {
-=09=09struct page *page;
-
-=09=09if (index > end_index)
-=09=09=09break;
+=09=09struct page *page =3D xa_load(&mapping->i_pages, index);
=20
-=09=09page =3D xa_load(&mapping->i_pages, index);
 =09=09if (page && !xa_is_value(page)) {
 =09=09=09/*
 =09=09=09 * Page already present?  Kick off the current batch
@@ -225,6 +223,32 @@ void __do_page_cache_readahead(struct address_space *m=
apping,
 =09=09read_pages(&rac, &page_pool);
 =09BUG_ON(!list_empty(&page_pool));
 }
+EXPORT_SYMBOL_GPL(page_cache_readahead_exceed);
+
+/*
+ * __do_page_cache_readahead() actually reads a chunk of disk.  It allocat=
es
+ * the pages first, then submits them for I/O. This avoids the very bad
+ * behaviour which would occur if page allocations are causing VM writebac=
k.
+ * We really don't want to intermingle reads and writes like that.
+ */
+void __do_page_cache_readahead(struct address_space *mapping,
+=09=09struct file *file, pgoff_t index, unsigned long nr_to_read,
+=09=09unsigned long lookahead_size)
+{
+=09struct inode *inode =3D mapping->host;
+=09loff_t isize =3D i_size_read(inode);
+=09pgoff_t end_index;
+
+=09if (isize =3D=3D 0)
+=09=09return;
+
+=09end_index =3D (isize - 1) >> PAGE_SHIFT;
+=09if (end_index < index + nr_to_read)
+=09=09nr_to_read =3D end_index - index;
+
+=09page_cache_readahead_exceed(mapping, file, index, nr_to_read,
+=09=09=09lookahead_size);
+}
=20
 /*
  * Chunk the readahead into 2 megabyte units, so that we don't pin too muc=
h
--=20
2.25.0


