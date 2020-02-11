Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF3215874C
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Feb 2020 02:04:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581383057;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kzdIpnzuMHEGX6RcDYdosp9m31652Wc5YtBBj5qHeBQ=;
	b=Ywq4eyQbe9PznpSdLqScgxIpuZEBBJ/5oVHFDTM600zE72UYkpz5dlS6fWcUvt4JDkX2fG
	4X5EQE5R72DJYlDxIvRF43V4YrmIOu821UR4wFNQP7UAOXew7s8tHxoyhWE5Priu/+4nvI
	nyVvRzQ0IiI05dXh9Z1jP1Dnst/VQCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-gs9A2R1YNl6gGAJk758VWw-1; Mon, 10 Feb 2020 20:04:15 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34CD4107ACCC;
	Tue, 11 Feb 2020 01:04:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20CD889F0D;
	Tue, 11 Feb 2020 01:04:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01587866D5;
	Tue, 11 Feb 2020 01:04:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01B14877019445 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 20:04:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 79C912026D67; Tue, 11 Feb 2020 01:04:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70F42206320C
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 01:04:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A20A48012A8
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 01:04:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-349-M6WDqwQ2Nb66fJGhogNdBw-1; Mon, 10 Feb 2020 20:04:04 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j1Jxu-0001nt-Da; Tue, 11 Feb 2020 01:03:50 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 10 Feb 2020 17:03:39 -0800
Message-Id: <20200211010348.6872-5-willy@infradead.org>
In-Reply-To: <20200211010348.6872-1-willy@infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: M6WDqwQ2Nb66fJGhogNdBw-1
X-MC-Unique: gs9A2R1YNl6gGAJk758VWw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01B14877019445
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v5 04/13] mm: Add readahead address space
	operation
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

This replaces ->readpages with a saner interface:
 - Return void instead of an ignored error code.
 - Pages are already in the page cache when ->readahead is called.
 - Implementation looks up the pages in the page cache instead of
   having them passed in a linked list.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 Documentation/filesystems/locking.rst |  6 ++-
 Documentation/filesystems/vfs.rst     | 13 +++++++
 include/linux/fs.h                    |  2 +
 include/linux/pagemap.h               | 54 +++++++++++++++++++++++++++
 mm/readahead.c                        | 48 ++++++++++++++----------
 5 files changed, 102 insertions(+), 21 deletions(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesyst=
ems/locking.rst
index 5057e4d9dcd1..0ebc4491025a 100644
--- a/Documentation/filesystems/locking.rst
+++ b/Documentation/filesystems/locking.rst
@@ -239,6 +239,7 @@ prototypes::
 =09int (*readpage)(struct file *, struct page *);
 =09int (*writepages)(struct address_space *, struct writeback_control *);
 =09int (*set_page_dirty)(struct page *page);
+=09void (*readahead)(struct readahead_control *);
 =09int (*readpages)(struct file *filp, struct address_space *mapping,
 =09=09=09struct list_head *pages, unsigned nr_pages);
 =09int (*write_begin)(struct file *, struct address_space *mapping,
@@ -271,7 +272,8 @@ writepage:=09=09yes, unlocks (see below)
 readpage:=09=09yes, unlocks
 writepages:
 set_page_dirty=09=09no
-readpages:
+readahead:=09=09yes, unlocks
+readpages:=09=09no
 write_begin:=09=09locks the page=09=09 exclusive
 write_end:=09=09yes, unlocks=09=09 exclusive
 bmap:
@@ -295,6 +297,8 @@ the request handler (/dev/loop).
 ->readpage() unlocks the page, either synchronously or via I/O
 completion.
=20
+->readahead() unlocks the pages like ->readpage().
+
 ->readpages() populates the pagecache with the passed pages and starts
 I/O against them.  They come unlocked upon I/O completion.
=20
diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/=
vfs.rst
index 7d4d09dd5e6d..cabee16b7406 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -706,6 +706,7 @@ cache in your filesystem.  The following members are de=
fined:
 =09=09int (*readpage)(struct file *, struct page *);
 =09=09int (*writepages)(struct address_space *, struct writeback_control *=
);
 =09=09int (*set_page_dirty)(struct page *page);
+=09=09void (*readahead)(struct readahead_control *);
 =09=09int (*readpages)(struct file *filp, struct address_space *mapping,
 =09=09=09=09 struct list_head *pages, unsigned nr_pages);
 =09=09int (*write_begin)(struct file *, struct address_space *mapping,
@@ -781,12 +782,24 @@ cache in your filesystem.  The following members are =
defined:
 =09If defined, it should set the PageDirty flag, and the
 =09PAGECACHE_TAG_DIRTY tag in the radix tree.
=20
+``readahead``
+=09Called by the VM to read pages associated with the address_space
+=09object.  The pages are consecutive in the page cache and are
+=09locked.  The implementation should decrement the page refcount
+=09after starting I/O on each page.  Usually the page will be
+=09unlocked by the I/O completion handler.  If the function does
+=09not attempt I/O on some pages, the caller will decrement the page
+=09refcount and unlock the pages for you.=09Set PageUptodate if the
+=09I/O completes successfully.  Setting PageError on any page will
+=09be ignored; simply unlock the page if an I/O error occurs.
+
 ``readpages``
 =09called by the VM to read pages associated with the address_space
 =09object.  This is essentially just a vector version of readpage.
 =09Instead of just one page, several pages are requested.
 =09readpages is only used for read-ahead, so read errors are
 =09ignored.  If anything goes wrong, feel free to give up.
+        This interface is deprecated; implement readahead instead.
=20
 ``write_begin``
 =09Called by the generic buffered write code to ask the filesystem
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 3cd4fe6b845e..d4e2d2964346 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -292,6 +292,7 @@ enum positive_aop_returns {
 struct page;
 struct address_space;
 struct writeback_control;
+struct readahead_control;
=20
 /*
  * Write life time hint values.
@@ -375,6 +376,7 @@ struct address_space_operations {
 =09 */
 =09int (*readpages)(struct file *filp, struct address_space *mapping,
 =09=09=09struct list_head *pages, unsigned nr_pages);
+=09void (*readahead)(struct readahead_control *);
=20
 =09int (*write_begin)(struct file *, struct address_space *mapping,
 =09=09=09=09loff_t pos, unsigned len, unsigned flags,
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index ccb14b6a16b5..13efafaf7e1f 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -630,6 +630,60 @@ static inline int add_to_page_cache(struct page *page,
 =09return error;
 }
=20
+/*
+ * Readahead is of a block of consecutive pages.
+ */
+struct readahead_control {
+=09struct file *file;
+=09struct address_space *mapping;
+/* private: use the readahead_* accessors instead */
+=09pgoff_t start;
+=09unsigned int nr_pages;
+=09unsigned int batch_count;
+};
+
+static inline struct page *readahead_page(struct readahead_control *rac)
+{
+=09struct page *page;
+
+=09if (!rac->nr_pages)
+=09=09return NULL;
+
+=09page =3D xa_load(&rac->mapping->i_pages, rac->start);
+=09VM_BUG_ON_PAGE(!PageLocked(page), page);
+=09rac->batch_count =3D hpage_nr_pages(page);
+=09rac->start +=3D rac->batch_count;
+
+=09return page;
+}
+
+#define readahead_for_each(rac, page)=09=09=09=09=09\
+=09for (; (page =3D readahead_page(rac)); rac->nr_pages -=3D rac->batch_co=
unt)
+
+/* The byte offset into the file of this readahead block */
+static inline loff_t readahead_offset(struct readahead_control *rac)
+{
+=09return (loff_t)rac->start * PAGE_SIZE;
+}
+
+/* The number of bytes in this readahead block */
+static inline loff_t readahead_length(struct readahead_control *rac)
+{
+=09return (loff_t)rac->nr_pages * PAGE_SIZE;
+}
+
+/* The index of the first page in this readahead block */
+static inline unsigned int readahead_index(struct readahead_control *rac)
+{
+=09return rac->start;
+}
+
+/* The number of pages in this readahead block */
+static inline unsigned int readahead_count(struct readahead_control *rac)
+{
+=09return rac->nr_pages;
+}
+
 static inline unsigned long dir_pages(struct inode *inode)
 {
 =09return (unsigned long)(inode->i_size + PAGE_SIZE - 1) >>
diff --git a/mm/readahead.c b/mm/readahead.c
index 96c6ca68a174..933b32e0c90a 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -113,25 +113,30 @@ int read_cache_pages(struct address_space *mapping, s=
truct list_head *pages,
=20
 EXPORT_SYMBOL(read_cache_pages);
=20
-static void read_pages(struct address_space *mapping, struct file *filp,
-=09=09struct list_head *pages, pgoff_t start,
-=09=09unsigned int nr_pages)
+static void read_pages(struct readahead_control *rac, struct list_head *pa=
ges)
 {
+=09struct page *page;
 =09struct blk_plug plug;
+=09const struct address_space_operations *aops =3D rac->mapping->a_ops;
+
+=09if (rac->nr_pages =3D=3D 0)
+=09=09return;
=20
 =09blk_start_plug(&plug);
=20
-=09if (mapping->a_ops->readpages) {
-=09=09mapping->a_ops->readpages(filp, mapping, pages, nr_pages);
+=09if (aops->readahead) {
+=09=09aops->readahead(rac);
+=09=09readahead_for_each(rac, page) {
+=09=09=09unlock_page(page);
+=09=09=09put_page(page);
+=09=09}
+=09} else if (aops->readpages) {
+=09=09aops->readpages(rac->file, rac->mapping, pages, rac->nr_pages);
 =09=09/* Clean up the remaining pages */
 =09=09put_pages_list(pages);
 =09} else {
-=09=09struct page *page;
-=09=09unsigned long index;
-
-=09=09xa_for_each_range(&mapping->i_pages, index, page, start,
-=09=09=09=09start + nr_pages - 1) {
-=09=09=09mapping->a_ops->readpage(filp, page);
+=09=09readahead_for_each(rac, page) {
+=09=09=09aops->readpage(rac->file, page);
 =09=09=09put_page(page);
 =09=09}
 =09}
@@ -156,10 +161,15 @@ unsigned long __do_page_cache_readahead(struct addres=
s_space *mapping,
 =09LIST_HEAD(page_pool);
 =09int page_idx;
 =09pgoff_t page_offset =3D start;
-=09unsigned long nr_pages =3D 0;
 =09loff_t isize =3D i_size_read(inode);
 =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
 =09bool use_list =3D mapping->a_ops->readpages;
+=09struct readahead_control rac =3D {
+=09=09.mapping =3D mapping,
+=09=09.file =3D filp,
+=09=09.start =3D start,
+=09=09.nr_pages =3D 0,
+=09};
=20
 =09if (isize =3D=3D 0)
 =09=09goto out;
@@ -206,15 +216,14 @@ unsigned long __do_page_cache_readahead(struct addres=
s_space *mapping,
=20
 =09=09if (page_idx =3D=3D nr_to_read - lookahead_size)
 =09=09=09SetPageReadahead(page);
-=09=09nr_pages++;
+=09=09rac.nr_pages++;
 =09=09page_offset++;
 =09=09continue;
 skip:
-=09=09if (nr_pages)
-=09=09=09read_pages(mapping, filp, &page_pool, start, nr_pages);
-=09=09nr_pages =3D 0;
+=09=09read_pages(&rac, &page_pool);
+=09=09rac.nr_pages =3D 0;
 =09=09page_offset++;
-=09=09start =3D page_offset;
+=09=09rac.start =3D page_offset;
 =09}
=20
 =09/*
@@ -222,11 +231,10 @@ unsigned long __do_page_cache_readahead(struct addres=
s_space *mapping,
 =09 * uptodate then the caller will launch readpage again, and
 =09 * will then handle the error.
 =09 */
-=09if (nr_pages)
-=09=09read_pages(mapping, filp, &page_pool, start, nr_pages);
+=09read_pages(&rac, &page_pool);
 =09BUG_ON(!list_empty(&page_pool));
 out:
-=09return nr_pages;
+=09return rac.nr_pages;
 }
=20
 /*
--=20
2.25.0


