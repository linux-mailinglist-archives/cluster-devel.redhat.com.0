Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 95CF0164393
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 12:42:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582112536;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EmTIrh10w43E2nNt6Nm96tEz8HC5kA05y1Zxm3InqU8=;
	b=akmUu6lB2m6gkvLCPvjeWRfzLXHD/NZb6ysC83rRHkc9EdobETK/4oyjFo5L+Tddk4+efu
	x+RyH4CqL0z2dfz/wAnWTDF+ufKH0cESc2yw57RkFYFVh8EpLq9m4EqmEURexMFkRUxHhZ
	/G0LoaPgd5r+WM7hL4LNW0lTso2QVqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-73OetEPJONaRpsgAcJryJA-1; Wed, 19 Feb 2020 06:42:11 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEEBB1137840;
	Wed, 19 Feb 2020 11:42:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBBB95C3FA;
	Wed, 19 Feb 2020 11:42:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9E4818089CF;
	Wed, 19 Feb 2020 11:42:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J3ZgBM007125 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 22:35:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6CBD12166B28; Wed, 19 Feb 2020 03:35:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 688D02166B27
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 03:35:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4320918AE96B
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 03:35:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-82-m3It03irMFGHhlv3qPHDXw-1; 
	Tue, 18 Feb 2020 22:35:37 -0500
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C289424655;
	Wed, 19 Feb 2020 03:35:35 +0000 (UTC)
Date: Tue, 18 Feb 2020 19:35:34 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219033534.GD1075@sol.localdomain>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-14-willy@infradead.org>
	<20200219031044.GA1075@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200219031044.GA1075@sol.localdomain>
X-MC-Unique: m3It03irMFGHhlv3qPHDXw-1
X-MC-Unique: 73OetEPJONaRpsgAcJryJA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J3ZgBM007125
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 19 Feb 2020 06:42:02 -0500
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 08/19] mm: Add readahead address
	space operation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 07:10:44PM -0800, Eric Biggers wrote:
> On Mon, Feb 17, 2020 at 10:45:54AM -0800, Matthew Wilcox wrote:
> > diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesyst=
ems/vfs.rst
> > index 7d4d09dd5e6d..81ab30fbe45c 100644
> > --- a/Documentation/filesystems/vfs.rst
> > +++ b/Documentation/filesystems/vfs.rst
> > @@ -706,6 +706,7 @@ cache in your filesystem.  The following members ar=
e defined:
> >  =09=09int (*readpage)(struct file *, struct page *);
> >  =09=09int (*writepages)(struct address_space *, struct writeback_contr=
ol *);
> >  =09=09int (*set_page_dirty)(struct page *page);
> > +=09=09void (*readahead)(struct readahead_control *);
> >  =09=09int (*readpages)(struct file *filp, struct address_space *mappin=
g,
> >  =09=09=09=09 struct list_head *pages, unsigned nr_pages);
> >  =09=09int (*write_begin)(struct file *, struct address_space *mapping,
> > @@ -781,12 +782,24 @@ cache in your filesystem.  The following members =
are defined:
> >  =09If defined, it should set the PageDirty flag, and the
> >  =09PAGECACHE_TAG_DIRTY tag in the radix tree.
> > =20
> > +``readahead``
> > +=09Called by the VM to read pages associated with the address_space
> > +=09object.  The pages are consecutive in the page cache and are
> > +=09locked.  The implementation should decrement the page refcount
> > +=09after starting I/O on each page.  Usually the page will be
> > +=09unlocked by the I/O completion handler.  If the function does
> > +=09not attempt I/O on some pages, the caller will decrement the page
> > +=09refcount and unlock the pages for you.=09Set PageUptodate if the
> > +=09I/O completes successfully.  Setting PageError on any page will
> > +=09be ignored; simply unlock the page if an I/O error occurs.
> > +
>=20
> This is unclear about how "not attempting I/O" works and how that affects=
 who is
> responsible for putting and unlocking the pages.  How does the caller kno=
w which
> pages were not attempted?  Can any arbitrary subset of pages be not attem=
pted,
> or just the last N pages?
>=20
> In the code, the caller actually uses readahead_for_each() to iterate thr=
ough
> and put+unlock the pages.  That implies that ->readahead() must also use
> readahead_for_each() as well, in order for the iterator to be advanced
> correctly... Right?  And the ownership of each page is transferred to the=
 callee
> when the callee advances the iterator past that page.
>=20
> I don't see how ext4_readahead() and f2fs_readahead() can work at all, gi=
ven
> that they don't advance the iterator.
>=20

Yep, this patchset immediately crashes on boot with:

BUG: Bad page state in process swapper/0  pfn:02176
page:ffffea00000751d0 refcount:0 mapcount:0 mapping:ffff88807cba0400 index:=
0x0
ext4_da_aops name:"systemd"
flags: 0x100000000020001(locked|mappedtodisk)
raw: 0100000000020001 dead000000000100 dead000000000122 ffff88807cba0400
raw: 0000000000000000 0000000000000000 00000000ffffffff
page dumped because: PAGE_FLAGS_CHECK_AT_FREE flag(s) set
bad because of flags: 0x1(locked)
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc2-00019-g7203ed9018cb9 #1=
8
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS ?-20191223_1005=
56-anatol 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x7a/0xaa lib/dump_stack.c:118
 bad_page.cold+0x89/0xba mm/page_alloc.c:649
 free_pages_check_bad+0x5d/0x60 mm/page_alloc.c:1050
 free_pages_check mm/page_alloc.c:1059 [inline]
 free_pages_prepare mm/page_alloc.c:1157 [inline]
 free_pcp_prepare+0x1c1/0x200 mm/page_alloc.c:1198
 free_unref_page_prepare mm/page_alloc.c:3011 [inline]
 free_unref_page+0x16/0x70 mm/page_alloc.c:3060
 __put_single_page mm/swap.c:81 [inline]
 __put_page+0x31/0x40 mm/swap.c:115
 put_page include/linux/mm.h:1029 [inline]
 ext4_mpage_readpages+0x778/0x9b0 fs/ext4/readpage.c:405
 ext4_readahead+0x2f/0x40 fs/ext4/inode.c:3242
 read_pages+0x4c/0x200 mm/readahead.c:126
 page_cache_readahead_limit+0x224/0x250 mm/readahead.c:241
 __do_page_cache_readahead mm/readahead.c:266 [inline]
 ra_submit mm/internal.h:62 [inline]
 ondemand_readahead+0x1df/0x4d0 mm/readahead.c:544
 page_cache_sync_readahead+0x2d/0x40 mm/readahead.c:579
 generic_file_buffered_read+0x77e/0xa90 mm/filemap.c:2029
 generic_file_read_iter+0xd4/0x130 mm/filemap.c:2302
 ext4_file_read_iter fs/ext4/file.c:131 [inline]
 ext4_file_read_iter+0x53/0x180 fs/ext4/file.c:114
 call_read_iter include/linux/fs.h:1897 [inline]
 new_sync_read+0x113/0x1a0 fs/read_write.c:414
 __vfs_read+0x21/0x30 fs/read_write.c:427
 vfs_read+0xcb/0x160 fs/read_write.c:461
 kernel_read+0x2c/0x40 fs/read_write.c:440
 prepare_binprm+0x14f/0x190 fs/exec.c:1589
 __do_execve_file.isra.0+0x4c0/0x800 fs/exec.c:1806
 do_execveat_common fs/exec.c:1871 [inline]
 do_execve+0x20/0x30 fs/exec.c:1888
 run_init_process+0xc8/0xcd init/main.c:1279
 try_to_run_init_process+0x10/0x36 init/main.c:1288
 kernel_init+0xac/0xfd init/main.c:1385
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Disabling lock debugging due to kernel taint
page:ffffea00000751d0 refcount:0 mapcount:0 mapping:ffff88807cba0400 index:=
0x0
ext4_da_aops name:"systemd"
flags: 0x100000000020001(locked|mappedtodisk)
raw: 0100000000020001 dead000000000100 dead000000000122 ffff88807cba0400
raw: 0000000000000000 0000000000000000 00000000ffffffff
page dumped because: VM_BUG_ON_PAGE(page_ref_count(page) =3D=3D 0)


I had to add:

diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index e14841ade6122..cb982088b5225 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -401,8 +401,10 @@ int ext4_mpage_readpages(struct address_space *mapping=
,
 =09=09else
 =09=09=09unlock_page(page);
 =09next_page:
-=09=09if (rac)
+=09=09if (rac) {
 =09=09=09put_page(page);
+=09=09=09readahead_next(rac);
+=09=09}
 =09}
 =09if (bio)
 =09=09submit_bio(bio);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 87964e4cb6b81..e16b0fe42e2e5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2238,8 +2238,10 @@ int f2fs_mpage_readpages(struct inode *inode, struct=
 readahead_control *rac,
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 next_page:
 #endif
-=09=09if (rac)
+=09=09if (rac) {
 =09=09=09put_page(page);
+=09=09=09readahead_next(rac);
+=09=09}
=20
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 =09=09if (f2fs_compressed_file(inode)) {



