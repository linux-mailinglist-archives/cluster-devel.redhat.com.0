Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9B408166045
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 16:00:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582210854;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=rcbQ0jGZSldIIU+FWjBZVl9sNLRghuA5GeP8t8Qgiow=;
	b=Ufv0GEEE5NbnEu6B+to9aUndqr6MDe0dPu40xcYvkhS3ITh+oP3cEAPGJi6IOhT+OTUm5q
	1KqSeeYgCB5/7FfcrJG5f4DCs5nJGM45gfUrP9pjhxuzmpaMG/Gh0xXne+QqwmiKq7sqY4
	VfSXagf4b9QyDVHMCT8RslJDYxb6U1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-U0T24vHkP96QujIDn7XeMA-1; Thu, 20 Feb 2020 10:00:52 -0500
X-MC-Unique: U0T24vHkP96QujIDn7XeMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCC78800D48;
	Thu, 20 Feb 2020 15:00:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB1F519757;
	Thu, 20 Feb 2020 15:00:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00F381803C33;
	Thu, 20 Feb 2020 15:00:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KF0jJr024537 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 10:00:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3B73B202A941; Thu, 20 Feb 2020 15:00:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33F462028CD6
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 15:00:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC8D385A316
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 15:00:42 +0000 (UTC)
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
	[216.228.121.64]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-375-lhyL1l9ZMhCrQ5lXG6JYag-1; Thu, 20 Feb 2020 10:00:34 -0500
X-MC-Unique: lhyL1l9ZMhCrQ5lXG6JYag-1
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e4e9ef00000>; Thu, 20 Feb 2020 07:00:00 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Thu, 20 Feb 2020 07:00:33 -0800
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Thu, 20 Feb 2020 07:00:33 -0800
Received: from [10.2.165.18] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 20 Feb 2020 15:00:32 +0000
From: Zi Yan <ziy@nvidia.com>
To: Matthew Wilcox <willy@infradead.org>
Date: Thu, 20 Feb 2020 10:00:30 -0500
Message-ID: <5D7CE6BD-FABD-4901-AEF0-E0F10FC00EB1@nvidia.com>
In-Reply-To: <20200219210103.32400-11-willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-11-willy@infradead.org>
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
	HQMAIL107.nvidia.com (172.20.187.13)
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=nvidia.com header.s=n1
	header.b=YtTAS8bn;
	spf=pass (relay.mimecast.com: domain of ziy@nvidia.com designates
	216.228.121.64 as permitted sender)
	smtp.mailfrom=ziy@nvidia.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 10/24] mm: Add readahead address
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
Content-Type: multipart/signed;
	boundary="=_MailMate_D3452F35-D86E-413E-A05C-9E5444344EF4_=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=_MailMate_D3452F35-D86E-413E-A05C-9E5444344EF4_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 19 Feb 2020, at 16:00, Matthew Wilcox wrote:

> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>
> This replaces ->readpages with a saner interface:
>  - Return void instead of an ignored error code.
>  - Page cache is already populated with locked pages when ->readahead
>    is called.
>  - New arguments can be passed to the implementation without changing
>    all the filesystems that use a common helper function like
>    mpage_readahead().
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  Documentation/filesystems/locking.rst |  6 +++++-
>  Documentation/filesystems/vfs.rst     | 15 +++++++++++++++
>  include/linux/fs.h                    |  2 ++
>  include/linux/pagemap.h               | 18 ++++++++++++++++++
>  mm/readahead.c                        | 12 ++++++++++--
>  5 files changed, 50 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesy=
stems/locking.rst
> index 5057e4d9dcd1..0af2e0e11461 100644
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
>
> +->readahead() unlocks the pages that I/O is attempted on like ->readpage=
().
> +
>  ->readpages() populates the pagecache with the passed pages and starts
>  I/O against them.  They come unlocked upon I/O completion.
>
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystem=
s/vfs.rst
> index 7d4d09dd5e6d..ed17771c212b 100644
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
> @@ -781,12 +782,26 @@ cache in your filesystem.  The following members ar=
e defined:
>  =09If defined, it should set the PageDirty flag, and the
>  =09PAGECACHE_TAG_DIRTY tag in the radix tree.
>
> +``readahead``
> +=09Called by the VM to read pages associated with the address_space
> +=09object.  The pages are consecutive in the page cache and are
> +=09locked.  The implementation should decrement the page refcount
> +=09after starting I/O on each page.  Usually the page will be
> +=09unlocked by the I/O completion handler.  If the filesystem decides
> +=09to stop attempting I/O before reaching the end of the readahead
> +=09window, it can simply return.  The caller will decrement the page
> +=09refcount and unlock the remaining pages for you.  Set PageUptodate
> +=09if the I/O completes successfully.  Setting PageError on any page
> +=09will be ignored; simply unlock the page if an I/O error occurs.
> +
>  ``readpages``
>  =09called by the VM to read pages associated with the address_space
>  =09object.  This is essentially just a vector version of readpage.
>  =09Instead of just one page, several pages are requested.
>  =09readpages is only used for read-ahead, so read errors are
>  =09ignored.  If anything goes wrong, feel free to give up.
> +=09This interface is deprecated and will be removed by the end of
> +=092020; implement readahead instead.
>
>  ``write_begin``
>  =09Called by the generic buffered write code to ask the filesystem
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 3cd4fe6b845e..d4e2d2964346 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -292,6 +292,7 @@ enum positive_aop_returns {
>  struct page;
>  struct address_space;
>  struct writeback_control;
> +struct readahead_control;
>
>  /*
>   * Write life time hint values.
> @@ -375,6 +376,7 @@ struct address_space_operations {
>  =09 */
>  =09int (*readpages)(struct file *filp, struct address_space *mapping,
>  =09=09=09struct list_head *pages, unsigned nr_pages);
> +=09void (*readahead)(struct readahead_control *);
>
>  =09int (*write_begin)(struct file *, struct address_space *mapping,
>  =09=09=09=09loff_t pos, unsigned len, unsigned flags,
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 4989d330fada..b3008605fd1b 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -669,6 +669,24 @@ static inline struct page *readahead_page(struct rea=
dahead_control *rac)
>  =09return page;
>  }
>
> +/* The byte offset into the file of this readahead block */
> +static inline loff_t readahead_pos(struct readahead_control *rac)
> +{
> +=09return (loff_t)rac->_index * PAGE_SIZE;
> +}
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
> +=09return rac->_index;
> +}

rac->_index is pgoff_t, so readahead_index() should return the same type, r=
ight?
BTW, pgoff_t is unsigned long.

> +
>  /* The number of pages in this readahead block */
>  static inline unsigned int readahead_count(struct readahead_control *rac=
)
>  {
> diff --git a/mm/readahead.c b/mm/readahead.c
> index aaa209559ba2..07cdfbf00f4b 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -124,7 +124,14 @@ static void read_pages(struct readahead_control *rac=
, struct list_head *pages)
>
>  =09blk_start_plug(&plug);
>
> -=09if (aops->readpages) {
> +=09if (aops->readahead) {
> +=09=09aops->readahead(rac);
> +=09=09/* Clean up the remaining pages */
> +=09=09while ((page =3D readahead_page(rac))) {
> +=09=09=09unlock_page(page);
> +=09=09=09put_page(page);
> +=09=09}
> +=09} else if (aops->readpages) {
>  =09=09aops->readpages(rac->file, rac->mapping, pages,
>  =09=09=09=09readahead_count(rac));
>  =09=09/* Clean up the remaining pages */
> @@ -234,7 +241,8 @@ void force_page_cache_readahead(struct address_space =
*mapping,
>  =09struct file_ra_state *ra =3D &filp->f_ra;
>  =09unsigned long max_pages;
>
> -=09if (unlikely(!mapping->a_ops->readpage && !mapping->a_ops->readpages)=
)
> +=09if (unlikely(!mapping->a_ops->readpage && !mapping->a_ops->readpages =
&&
> +=09=09=09!mapping->a_ops->readahead))
>  =09=09return;
>
>  =09/*
> --=20
> 2.25.0


--
Best Regards,
Yan Zi

--=_MailMate_D3452F35-D86E-413E-A05C-9E5444344EF4_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBAgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAl5Onw4PHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKP0AQAJ8rKk4f4gJQCLy1BEarhc0jqEJxv+LP4T93
thazkNgMM87L6fUgs2i0V2lUTkOQ9kN56mQH0wNc47I0tWm/5vVCPnDyS8MUFBeY
0sQiI3uTOVZcrz3GaZfrVJTUQHhIQ84wSAfUaRbaDKVlsGg4j1rZJocZrtKiXFoQ
afay88LB8I0MMBXGS6eM4Ep+ABD1Dp+awB7sOnuZOrvuWfNaULR4f8sGyyim/QjY
ZsJzs5rF5JIRkrCspYEnNbg7vx1orAAJBCxyVFgmAOIp2rNsnoDbHXhXE1LLCNgF
sIl6bfNbL/1hpJRWa6RegKxN9AiWCoDlKcqTOlHh5edI6ukk7oRSB7WJkcKgVSIA
ITkR/USPckkT4ZXP+5fYsfKMGgmPX00W9muaq6+/qWRFxjP1GY39zOlAgMoMMz82
AiBkYTLsp3L6SZ4f7GVLM8efNHFXk7cjjRDbN4GaGRzZhoz7yx3vGJaP/q9fssld
PXpx/80pWMoSQQQ1o3ouW1XdZdV6rh8slBFoXeYpFQXLs3Q/j7njrK4drJniuHz5
qySleNBceQp4y9l4FVC7G7t23VSRTHzcrff5wA+H+tVOjddzKC/L7rrZROsVk9uF
RBTotQ4VHR/fLoic/7IXBjQMD0nkS4UpaG71v9Rk4RwsusZU0f34h4zmuFQ4nfrU
hNoR35aP
=9x1/
-----END PGP SIGNATURE-----

--=_MailMate_D3452F35-D86E-413E-A05C-9E5444344EF4_=--

