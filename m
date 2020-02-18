Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 48A41162138
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 07:58:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582009097;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Joe5ItvrOtLXdRbueWBLyOM0De8wu5hkrx6z5OBXXhc=;
	b=iflMnkRn3TCHMTwRODANuKTbedKFcCAfSnFS7AfRO5s78R91O2TOmm2GBDZ5+d2/4n+LVb
	b5LjYjrDZ3+xi56rk8PMBGZZgDdSAxQ/HkINB1wY864yfCjQWJRTa5721933XHvuJWSkFw
	0fvIkBkV94IYJtUEPjTprzRAbetAnPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-zEcv1QqPMDyT9TFc8Cpwyg-1; Tue, 18 Feb 2020 01:58:15 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D1A0801E67;
	Tue, 18 Feb 2020 06:58:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 505715C1B2;
	Tue, 18 Feb 2020 06:58:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 22F3F18089C8;
	Tue, 18 Feb 2020 06:58:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01I6w7Km031541 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 01:58:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2A8C8100320A; Tue, 18 Feb 2020 06:58:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 200BF1003213
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 06:58:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BB611017E58
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 06:58:04 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-194-rhzLHDi6OoOcnW4wUGUQ3A-1; Tue, 18 Feb 2020 01:58:01 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 7C5BF3A2771;
	Tue, 18 Feb 2020 17:57:59 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j3wpS-0006Wf-5F; Tue, 18 Feb 2020 17:57:58 +1100
Date: Tue, 18 Feb 2020 17:57:58 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200218065758.GQ10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-19-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-19-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=cHVu4ezWpKoVtZSsmu8A:9
	a=a6t_wt_lAo5S5IOh:21 a=CcahuoPPjRgWG3dV:21 a=CjuIK1q_8ugA:10
	a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: rhzLHDi6OoOcnW4wUGUQ3A-1
X-MC-Unique: zEcv1QqPMDyT9TFc8Cpwyg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01I6w7Km031541
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 11/19] btrfs: Convert from readpages
	to readahead
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

On Mon, Feb 17, 2020 at 10:45:59AM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> Use the new readahead operation in btrfs.  Add a
> readahead_for_each_batch() iterator to optimise the loop in the XArray.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/btrfs/extent_io.c    | 46 +++++++++++++----------------------------
>  fs/btrfs/extent_io.h    |  3 +--
>  fs/btrfs/inode.c        | 16 +++++++-------
>  include/linux/pagemap.h | 27 ++++++++++++++++++++++++
>  4 files changed, 49 insertions(+), 43 deletions(-)
>=20
> diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
> index c0f202741e09..e97a6acd6f5d 100644
> --- a/fs/btrfs/extent_io.c
> +++ b/fs/btrfs/extent_io.c
> @@ -4278,52 +4278,34 @@ int extent_writepages(struct address_space *mappi=
ng,
>  =09return ret;
>  }
> =20
> -int extent_readpages(struct address_space *mapping, struct list_head *pa=
ges,
> -=09=09     unsigned nr_pages)
> +void extent_readahead(struct readahead_control *rac)
>  {
>  =09struct bio *bio =3D NULL;
>  =09unsigned long bio_flags =3D 0;
>  =09struct page *pagepool[16];
>  =09struct extent_map *em_cached =3D NULL;
> -=09struct extent_io_tree *tree =3D &BTRFS_I(mapping->host)->io_tree;
> -=09int nr =3D 0;
> +=09struct extent_io_tree *tree =3D &BTRFS_I(rac->mapping->host)->io_tree=
;
>  =09u64 prev_em_start =3D (u64)-1;
> +=09int nr;
> =20
> -=09while (!list_empty(pages)) {
> -=09=09u64 contig_end =3D 0;
> -
> -=09=09for (nr =3D 0; nr < ARRAY_SIZE(pagepool) && !list_empty(pages);) {
> -=09=09=09struct page *page =3D lru_to_page(pages);
> -
> -=09=09=09prefetchw(&page->flags);
> -=09=09=09list_del(&page->lru);
> -=09=09=09if (add_to_page_cache_lru(page, mapping, page->index,
> -=09=09=09=09=09=09readahead_gfp_mask(mapping))) {
> -=09=09=09=09put_page(page);
> -=09=09=09=09break;
> -=09=09=09}
> -
> -=09=09=09pagepool[nr++] =3D page;
> -=09=09=09contig_end =3D page_offset(page) + PAGE_SIZE - 1;
> -=09=09}
> +=09readahead_for_each_batch(rac, pagepool, ARRAY_SIZE(pagepool), nr) {
> +=09=09u64 contig_start =3D page_offset(pagepool[0]);
> +=09=09u64 contig_end =3D page_offset(pagepool[nr - 1]) + PAGE_SIZE - 1;

So this assumes a contiguous page range is returned, right?

> =20
> -=09=09if (nr) {
> -=09=09=09u64 contig_start =3D page_offset(pagepool[0]);
> +=09=09ASSERT(contig_start + nr * PAGE_SIZE - 1 =3D=3D contig_end);

Ok, yes it does. :)

I don't see how readahead_for_each_batch() guarantees that, though.

> =20
> -=09=09=09ASSERT(contig_start + nr * PAGE_SIZE - 1 =3D=3D contig_end);
> -
> -=09=09=09contiguous_readpages(tree, pagepool, nr, contig_start,
> -=09=09=09=09     contig_end, &em_cached, &bio, &bio_flags,
> -=09=09=09=09     &prev_em_start);
> -=09=09}
> +=09=09contiguous_readpages(tree, pagepool, nr, contig_start,
> +=09=09=09=09contig_end, &em_cached, &bio, &bio_flags,
> +=09=09=09=09&prev_em_start);
>  =09}
> =20
>  =09if (em_cached)
>  =09=09free_extent_map(em_cached);
> =20
> -=09if (bio)
> -=09=09return submit_one_bio(bio, 0, bio_flags);
> -=09return 0;
> +=09if (bio) {
> +=09=09if (submit_one_bio(bio, 0, bio_flags))
> +=09=09=09return;
> +=09}
>  }

Shouldn't that just be

=09if (bio)
=09=09submit_one_bio(bio, 0, bio_flags);

> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 4f36c06d064d..1bbb60a0bf16 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -669,6 +669,33 @@ static inline void readahead_next(struct readahead_c=
ontrol *rac)
>  #define readahead_for_each(rac, page)=09=09=09=09=09\
>  =09for (; (page =3D readahead_page(rac)); readahead_next(rac))
> =20
> +static inline unsigned int readahead_page_batch(struct readahead_control=
 *rac,
> +=09=09struct page **array, unsigned int size)
> +{
> +=09unsigned int batch =3D 0;

Confusing when put alongside rac->_batch_count counting the number
of pages in the batch, and "batch" being the index into the page
array, and they aren't the same counts....

> +=09XA_STATE(xas, &rac->mapping->i_pages, rac->_start);
> +=09struct page *page;
> +
> +=09rac->_batch_count =3D 0;
> +=09xas_for_each(&xas, page, rac->_start + rac->_nr_pages - 1) {

That just iterates pages in the start,end doesn't it? What
guarantees that this fills the array with a contiguous page range?

> +=09=09VM_BUG_ON_PAGE(!PageLocked(page), page);
> +=09=09VM_BUG_ON_PAGE(PageTail(page), page);
> +=09=09array[batch++] =3D page;
> +=09=09rac->_batch_count +=3D hpage_nr_pages(page);
> +=09=09if (PageHead(page))
> +=09=09=09xas_set(&xas, rac->_start + rac->_batch_count);

What on earth does this do? Comments please!

> +
> +=09=09if (batch =3D=3D size)
> +=09=09=09break;
> +=09}
> +
> +=09return batch;
> +}

Seems a bit big for an inline function.

> +
> +#define readahead_for_each_batch(rac, array, size, nr)=09=09=09\
> +=09for (; (nr =3D readahead_page_batch(rac, array, size));=09=09\
> +=09=09=09readahead_next(rac))

I had to go look at the caller to work out what "size" refered to
here.

This is complex enough that it needs proper API documentation.

Cheers,

Dave.

--=20
Dave Chinner
david@fromorbit.com


