Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA7B1620D6
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 07:22:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582006925;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s/AfXDBiFsRl79gGe04xzSrYTTrW2wF7JgGMXy0f4x4=;
	b=VHW7Ig35n5B6KkTx+cRBKQ1ZpL4TL/nfrJYkZcLPYN4BCBXJJEBb/ChNdoT1In8zMVhWf7
	Tgr0NJ5E1ufQJpxe3cOO8NZ5e35q4RlIxge0LwSawbndDVTy6K77iDToQt152kQvK6zny3
	IVo86ahYGEC9ZZxZdmDRFgm/CslN+mM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-rqSXbyQONk2-oQBd-w4C4w-1; Tue, 18 Feb 2020 01:22:03 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56362800D48;
	Tue, 18 Feb 2020 06:22:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D248391;
	Tue, 18 Feb 2020 06:22:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DC1918095FF;
	Tue, 18 Feb 2020 06:22:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01I6Lv9C029316 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 01:21:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 532742166B29; Tue, 18 Feb 2020 06:21:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ED4E2166B28
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 06:21:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09FD810192B6
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 06:21:54 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-331-s6uHBgP8Olm-CTAgDGAlKQ-1; Tue, 18 Feb 2020 01:21:51 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id D25FD3A2514;
	Tue, 18 Feb 2020 17:21:48 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j3wGR-0006EU-Pg; Tue, 18 Feb 2020 17:21:47 +1100
Date: Tue, 18 Feb 2020 17:21:47 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200218062147.GN10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-14-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-14-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=ZUKaNjAUM_NwrQaOQj4A:9
	a=JQFMNDVPDCAknBdf:21 a=DU4q-3mnrf8zicIu:21 a=CjuIK1q_8ugA:10
	a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: s6uHBgP8Olm-CTAgDGAlKQ-1
X-MC-Unique: rqSXbyQONk2-oQBd-w4C4w-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01I6Lv9C029316
X-loop: cluster-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Feb 17, 2020 at 10:45:54AM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> This replaces ->readpages with a saner interface:
>  - Return void instead of an ignored error code.
>  - Pages are already in the page cache when ->readahead is called.

Might read better as:

 - Page cache is already populates with locked pages when
   ->readahead is called.

>  - Implementation looks up the pages in the page cache instead of
>    having them passed in a linked list.

Add:

 - cleanup of unused readahead handled by ->readahead caller, not
   the method implementation.

>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  Documentation/filesystems/locking.rst |  6 +++++-
>  Documentation/filesystems/vfs.rst     | 13 +++++++++++++
>  include/linux/fs.h                    |  2 ++
>  include/linux/pagemap.h               | 18 ++++++++++++++++++
>  mm/readahead.c                        |  8 +++++++-
>  5 files changed, 45 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesy=
stems/locking.rst
> index 5057e4d9dcd1..0ebc4491025a 100644
> --- a/Documentation/filesystems/locking.rst
> +++ b/Documentation/filesystems/locking.rst
> @@ -239,6 +239,7 @@ prototypes::
>  =09int (*readpage)(struct file *, struct page *);
>  =09int (*writepages)(struct address_space *, struct writeback_control *)=
;
>  =09int (*set_page_dirty)(struct page *page);
> +=09void (*readahead)(struct readahead_control *);
>  =09int (*readpages)(struct file *filp, struct address_space *mapping,
>  =09=09=09struct list_head *pages, unsigned nr_pages);
>  =09int (*write_begin)(struct file *, struct address_space *mapping,
> @@ -271,7 +272,8 @@ writepage:=09=09yes, unlocks (see below)
>  readpage:=09=09yes, unlocks
>  writepages:
>  set_page_dirty=09=09no
> -readpages:
> +readahead:=09=09yes, unlocks
> +readpages:=09=09no
>  write_begin:=09=09locks the page=09=09 exclusive
>  write_end:=09=09yes, unlocks=09=09 exclusive
>  bmap:
> @@ -295,6 +297,8 @@ the request handler (/dev/loop).
>  ->readpage() unlocks the page, either synchronously or via I/O
>  completion.
> =20
> +->readahead() unlocks the pages like ->readpage().
> +

"... the pages that I/O is attempted on ..."

>  ->readpages() populates the pagecache with the passed pages and starts
>  I/O against them.  They come unlocked upon I/O completion.
> =20
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystem=
s/vfs.rst
> index 7d4d09dd5e6d..81ab30fbe45c 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -706,6 +706,7 @@ cache in your filesystem.  The following members are =
defined:
>  =09=09int (*readpage)(struct file *, struct page *);
>  =09=09int (*writepages)(struct address_space *, struct writeback_control=
 *);
>  =09=09int (*set_page_dirty)(struct page *page);
> +=09=09void (*readahead)(struct readahead_control *);
>  =09=09int (*readpages)(struct file *filp, struct address_space *mapping,
>  =09=09=09=09 struct list_head *pages, unsigned nr_pages);
>  =09=09int (*write_begin)(struct file *, struct address_space *mapping,
> @@ -781,12 +782,24 @@ cache in your filesystem.  The following members ar=
e defined:
>  =09If defined, it should set the PageDirty flag, and the
>  =09PAGECACHE_TAG_DIRTY tag in the radix tree.
> =20
> +``readahead``
> +=09Called by the VM to read pages associated with the address_space
> +=09object.  The pages are consecutive in the page cache and are
> +=09locked.  The implementation should decrement the page refcount
> +=09after starting I/O on each page.  Usually the page will be
> +=09unlocked by the I/O completion handler.  If the function does
> +=09not attempt I/O on some pages, the caller will decrement the page
> +=09refcount and unlock the pages for you.=09Set PageUptodate if the
> +=09I/O completes successfully.  Setting PageError on any page will
> +=09be ignored; simply unlock the page if an I/O error occurs.
> +
>  ``readpages``
>  =09called by the VM to read pages associated with the address_space
>  =09object.  This is essentially just a vector version of readpage.
>  =09Instead of just one page, several pages are requested.
>  =09readpages is only used for read-ahead, so read errors are
>  =09ignored.  If anything goes wrong, feel free to give up.
> +=09This interface is deprecated; implement readahead instead.

What is the removal schedule for the deprecated interface?=20

> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 3613154e79e4..bd4291f78f41 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -665,6 +665,24 @@ static inline void readahead_next(struct readahead_c=
ontrol *rac)
>  #define readahead_for_each(rac, page)=09=09=09=09=09\
>  =09for (; (page =3D readahead_page(rac)); readahead_next(rac))
> =20
> +/* The byte offset into the file of this readahead block */
> +static inline loff_t readahead_offset(struct readahead_control *rac)
> +{
> +=09return (loff_t)rac->_start * PAGE_SIZE;
> +}

Urk. Didn't an early page use "offset" for the page index? That
was was "mm: Remove 'page_offset' from readahead loop" did, right?

That's just going to cause confusion to have different units for
readahead "offsets"....

> +
> +/* The number of bytes in this readahead block */
> +static inline loff_t readahead_length(struct readahead_control *rac)
> +{
> +=09return (loff_t)rac->_nr_pages * PAGE_SIZE;
> +}
> +
> +/* The index of the first page in this readahead block */
> +static inline unsigned int readahead_index(struct readahead_control *rac=
)
> +{
> +=09return rac->_start;
> +}

Based on this, I suspect the earlier patch should use "index" rather
than "offset" when walking the page cache indexes...

> +
>  /* The number of pages in this readahead block */
>  static inline unsigned int readahead_count(struct readahead_control *rac=
)
>  {
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 9e430daae42f..975ff5e387be 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -121,7 +121,13 @@ static void read_pages(struct readahead_control *rac=
, struct list_head *pages)
> =20
>  =09blk_start_plug(&plug);
> =20
> -=09if (aops->readpages) {
> +=09if (aops->readahead) {
> +=09=09aops->readahead(rac);
> +=09=09readahead_for_each(rac, page) {
> +=09=09=09unlock_page(page);
> +=09=09=09put_page(page);
> +=09=09}

This needs a comment to explain the unwinding that needs to be done
here. I'm not going to remember in a year's time that this is just
for the pages that weren't submitted by ->readahead....

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


