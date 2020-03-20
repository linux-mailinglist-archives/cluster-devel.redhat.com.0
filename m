Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 9307E18D038
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Mar 2020 15:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584714201;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KdJ59ScqUgV5eckTMtgQ31VNqfRaKScwDV/IV3W8vnk=;
	b=TWopTbuNtRJykTFDIOWXW1yK5pgb8PfT0rmX5mfP4EzL51fHwQRzzJ8GFuZMnt224S7ks3
	j6K2LneYMWP/6viDNSwfoH8ScLq7G6t+z+FlHM2MouPF7WDh+63xy2bCQVFxa9mkCiPfKh
	YOfLpKOXsxksou3hROte8GMH09P/H5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-lRNZ9IXiNguGI_OZCN4pVA-1; Fri, 20 Mar 2020 10:23:19 -0400
X-MC-Unique: lRNZ9IXiNguGI_OZCN4pVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE10118FE89B;
	Fri, 20 Mar 2020 14:22:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99A315DA75;
	Fri, 20 Mar 2020 14:22:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C038942AD;
	Fri, 20 Mar 2020 14:22:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02KEMkKJ021903 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Mar 2020 10:22:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4A7062166B30; Fri, 20 Mar 2020 14:22:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 475AE2166AE6
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 14:22:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E854101A55D
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 14:22:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-231-J4z_s8hhPs-oczM8SkTcPQ-1; Fri, 20 Mar 2020 10:22:41 -0400
X-MC-Unique: J4z_s8hhPs-oczM8SkTcPQ-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jFIXh-0000iD-Hj; Fri, 20 Mar 2020 14:22:33 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 20 Mar 2020 07:22:17 -0700
Message-Id: <20200320142231.2402-12-willy@infradead.org>
In-Reply-To: <20200320142231.2402-1-willy@infradead.org>
References: <20200320142231.2402-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02KEMkKJ021903
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v9 11/25] mm: Add readahead address space
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

This replaces ->readpages with a saner interface:
 - Return void instead of an ignored error code.
 - Page cache is already populated with locked pages when ->readahead
   is called.
 - New arguments can be passed to the implementation without changing
   all the filesystems that use a common helper function like
   mpage_readahead().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 Documentation/filesystems/locking.rst |  6 +++++-
 Documentation/filesystems/vfs.rst     | 15 +++++++++++++++
 include/linux/fs.h                    |  2 ++
 mm/readahead.c                        | 12 ++++++++++--
 4 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesyst=
ems/locking.rst
index 5057e4d9dcd1..0af2e0e11461 100644
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
+->readahead() unlocks the pages that I/O is attempted on like ->readpage()=
.
+
 ->readpages() populates the pagecache with the passed pages and starts
 I/O against them.  They come unlocked upon I/O completion.
=20
diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/=
vfs.rst
index 7d4d09dd5e6d..ed17771c212b 100644
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
@@ -781,12 +782,26 @@ cache in your filesystem.  The following members are =
defined:
 =09If defined, it should set the PageDirty flag, and the
 =09PAGECACHE_TAG_DIRTY tag in the radix tree.
=20
+``readahead``
+=09Called by the VM to read pages associated with the address_space
+=09object.  The pages are consecutive in the page cache and are
+=09locked.  The implementation should decrement the page refcount
+=09after starting I/O on each page.  Usually the page will be
+=09unlocked by the I/O completion handler.  If the filesystem decides
+=09to stop attempting I/O before reaching the end of the readahead
+=09window, it can simply return.  The caller will decrement the page
+=09refcount and unlock the remaining pages for you.  Set PageUptodate
+=09if the I/O completes successfully.  Setting PageError on any page
+=09will be ignored; simply unlock the page if an I/O error occurs.
+
 ``readpages``
 =09called by the VM to read pages associated with the address_space
 =09object.  This is essentially just a vector version of readpage.
 =09Instead of just one page, several pages are requested.
 =09readpages is only used for read-ahead, so read errors are
 =09ignored.  If anything goes wrong, feel free to give up.
+=09This interface is deprecated and will be removed by the end of
+=092020; implement readahead instead.
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
diff --git a/mm/readahead.c b/mm/readahead.c
index e52b3a7b9da5..d01531ef9f3c 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -125,7 +125,14 @@ static void read_pages(struct readahead_control *rac, =
struct list_head *pages,
=20
 =09blk_start_plug(&plug);
=20
-=09if (aops->readpages) {
+=09if (aops->readahead) {
+=09=09aops->readahead(rac);
+=09=09/* Clean up the remaining pages */
+=09=09while ((page =3D readahead_page(rac))) {
+=09=09=09unlock_page(page);
+=09=09=09put_page(page);
+=09=09}
+=09} else if (aops->readpages) {
 =09=09aops->readpages(rac->file, rac->mapping, pages,
 =09=09=09=09readahead_count(rac));
 =09=09/* Clean up the remaining pages */
@@ -233,7 +240,8 @@ void force_page_cache_readahead(struct address_space *m=
apping,
 =09struct file_ra_state *ra =3D &filp->f_ra;
 =09unsigned long max_pages;
=20
-=09if (unlikely(!mapping->a_ops->readpage && !mapping->a_ops->readpages))
+=09if (unlikely(!mapping->a_ops->readpage && !mapping->a_ops->readpages &&
+=09=09=09!mapping->a_ops->readahead))
 =09=09return;
=20
 =09/*
--=20
2.25.1


