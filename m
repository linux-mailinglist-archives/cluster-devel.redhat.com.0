Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4540014F83D
	for <lists+cluster-devel@lfdr.de>; Sat,  1 Feb 2020 16:13:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580569985;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pCBIpKnq4e3hJvGZhxDIb49ovBWKMmkqs7u1lPM5FdA=;
	b=ExD1184trfntQzqg8BDBdwi+um4v8ss/Isp+Bi7+PE74ztUcuOyaJjJzx7KT10PHhznEKa
	Ij79OYZ9/bM/VTzqASxnB3B+bq6+q0qdE92AqqY4otTN9Eky5ajMa5Vs6IXf2sxS4CA20k
	tJ/L+Il1ykCMI5n0P0+nyVwE/cHd25A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-r1wrUB9HPMyOjhMce6Xwvg-1; Sat, 01 Feb 2020 10:13:03 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B72731007269;
	Sat,  1 Feb 2020 15:12:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A66F38BE26;
	Sat,  1 Feb 2020 15:12:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AEC6185CF8;
	Sat,  1 Feb 2020 15:12:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 011FCtTZ030103 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 1 Feb 2020 10:12:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F02FB2166B2D; Sat,  1 Feb 2020 15:12:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC6322166B29
	for <cluster-devel@redhat.com>; Sat,  1 Feb 2020 15:12:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA1C61017E5E
	for <cluster-devel@redhat.com>; Sat,  1 Feb 2020 15:12:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-249-TM9B9SR-O6C9JS27EXdgxQ-1; Sat, 01 Feb 2020 10:12:51 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1ixuRu-0006HT-5R; Sat, 01 Feb 2020 15:12:42 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sat,  1 Feb 2020 07:12:32 -0800
Message-Id: <20200201151240.24082-5-willy@infradead.org>
In-Reply-To: <20200201151240.24082-1-willy@infradead.org>
References: <20200201151240.24082-1-willy@infradead.org>
MIME-Version: 1.0
X-MC-Unique: TM9B9SR-O6C9JS27EXdgxQ-1
X-MC-Unique: r1wrUB9HPMyOjhMce6Xwvg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 011FCtTZ030103
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v4 04/12] mm: Add readahead address space
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

This replaces ->readpages with a saner interface:
 - Return the number of pages not read instead of an ignored error code.
 - Pages are already in the page cache when ->readahead is called.
 - Implementation looks up the pages in the page cache instead of
   having them passed in a linked list.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: linux-btrfs@vger.kernel.org
Cc: linux-erofs@lists.ozlabs.org
Cc: linux-ext4@vger.kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: linux-xfs@vger.kernel.org
Cc: cluster-devel@redhat.com
Cc: ocfs2-devel@oss.oracle.com
---
 Documentation/filesystems/locking.rst |  7 ++++++-
 Documentation/filesystems/vfs.rst     | 14 ++++++++++++++
 include/linux/fs.h                    |  2 ++
 include/linux/pagemap.h               | 12 ++++++++++++
 mm/readahead.c                        | 13 ++++++++++++-
 5 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesyst=
ems/locking.rst
index 5057e4d9dcd1..3d10729caf44 100644
--- a/Documentation/filesystems/locking.rst
+++ b/Documentation/filesystems/locking.rst
@@ -239,6 +239,8 @@ prototypes::
 =09int (*readpage)(struct file *, struct page *);
 =09int (*writepages)(struct address_space *, struct writeback_control *);
 =09int (*set_page_dirty)(struct page *page);
+=09unsigned (*readahead)(struct file *, struct address_space *,
+=09=09=09=09 pgoff_t start, unsigned nr_pages);
 =09int (*readpages)(struct file *filp, struct address_space *mapping,
 =09=09=09struct list_head *pages, unsigned nr_pages);
 =09int (*write_begin)(struct file *, struct address_space *mapping,
@@ -271,7 +273,8 @@ writepage:=09=09yes, unlocks (see below)
 readpage:=09=09yes, unlocks
 writepages:
 set_page_dirty=09=09no
-readpages:
+readahead:=09=09yes, unlocks
+readpages:=09=09no
 write_begin:=09=09locks the page=09=09 exclusive
 write_end:=09=09yes, unlocks=09=09 exclusive
 bmap:
@@ -295,6 +298,8 @@ the request handler (/dev/loop).
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
index 7d4d09dd5e6d..c2bc345f2169 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -706,6 +706,8 @@ cache in your filesystem.  The following members are de=
fined:
 =09=09int (*readpage)(struct file *, struct page *);
 =09=09int (*writepages)(struct address_space *, struct writeback_control *=
);
 =09=09int (*set_page_dirty)(struct page *page);
+=09=09unsigned (*readahead)(struct file *filp, struct address_space *mappi=
ng,
+=09=09=09=09 pgoff_t start, unsigned nr_pages);
 =09=09int (*readpages)(struct file *filp, struct address_space *mapping,
 =09=09=09=09 struct list_head *pages, unsigned nr_pages);
 =09=09int (*write_begin)(struct file *, struct address_space *mapping,
@@ -781,6 +783,18 @@ cache in your filesystem.  The following members are d=
efined:
 =09If defined, it should set the PageDirty flag, and the
 =09PAGECACHE_TAG_DIRTY tag in the radix tree.
=20
+``readahead``
+=09Called by the VM to read pages associated with the address_space
+=09object.  The pages are consecutive in the page cache and
+=09are locked.  The implementation should decrement the page
+=09refcount after attempting I/O on each page.  Usually the
+=09page will be unlocked by the I/O completion handler.  If the
+=09function does not attempt I/O on some pages, return the number
+=09of pages which were not read so the caller can unlock the pages
+=09for you.  Set PageUptodate if the I/O completes successfully.
+=09Setting PageError on any page will be ignored; simply unlock
+=09the page if an I/O error occurs.
+
 ``readpages``
 =09called by the VM to read pages associated with the address_space
 =09object.  This is essentially just a vector version of readpage.
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 41584f50af0d..3bfc142e7d10 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -375,6 +375,8 @@ struct address_space_operations {
 =09 */
 =09int (*readpages)(struct file *filp, struct address_space *mapping,
 =09=09=09struct list_head *pages, unsigned nr_pages);
+=09unsigned (*readahead)(struct file *, struct address_space *,
+=09=09=09pgoff_t start, unsigned nr_pages);
=20
 =09int (*write_begin)(struct file *, struct address_space *mapping,
 =09=09=09=09loff_t pos, unsigned len, unsigned flags,
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index ccb14b6a16b5..a2cf007826f2 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -630,6 +630,18 @@ static inline int add_to_page_cache(struct page *page,
 =09return error;
 }
=20
+/*
+ * Only call this from a ->readahead implementation.
+ */
+static inline
+struct page *readahead_page(struct address_space *mapping, pgoff_t index)
+{
+=09struct page *page =3D xa_load(&mapping->i_pages, index);
+=09VM_BUG_ON_PAGE(!PageLocked(page), page);
+
+=09return page;
+}
+
 static inline unsigned long dir_pages(struct inode *inode)
 {
 =09return (unsigned long)(inode->i_size + PAGE_SIZE - 1) >>
diff --git a/mm/readahead.c b/mm/readahead.c
index 7daef0038b14..b2ed0baf3a5d 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -121,7 +121,18 @@ static void read_pages(struct address_space *mapping, =
struct file *filp,
=20
 =09blk_start_plug(&plug);
=20
-=09if (mapping->a_ops->readpages) {
+=09if (mapping->a_ops->readahead) {
+=09=09unsigned left =3D mapping->a_ops->readahead(filp, mapping,
+=09=09=09=09start, nr_pages);
+
+=09=09while (left) {
+=09=09=09struct page *page =3D readahead_page(mapping,
+=09=09=09=09=09start + nr_pages - left);
+=09=09=09unlock_page(page);
+=09=09=09put_page(page);
+=09=09=09left--;
+=09=09}
+=09} else if (mapping->a_ops->readpages) {
 =09=09mapping->a_ops->readpages(filp, mapping, pages, nr_pages);
 =09=09/* Clean up the remaining pages */
 =09=09put_pages_list(pages);
--=20
2.24.1


