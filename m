Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 232DF163945
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 02:23:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582075430;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q+cqN2hA/sDcu3/ckBaD75uDMr8NvELChE8vL9cS0QA=;
	b=C1Q1iaV8XJJ9a1LhJoh5QebV7rMs9uFnvzwRAlYcda2bGozbEQB8Re8xbmTrApj7mdMaN1
	umYImQR74qsB6LH9Qchsev8xff/e4/62PamV3ZvU9sICWshGL42Gtkh4WGjYJ9+wf+zBhw
	7Q56YyMRfsU2MeLDUMcju+duYMIJ7vE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-LhCdUjMPOQONCJGcwR0WLw-1; Tue, 18 Feb 2020 20:23:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE346800D55;
	Wed, 19 Feb 2020 01:23:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E46360C80;
	Wed, 19 Feb 2020 01:23:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 69D3A35AF5;
	Wed, 19 Feb 2020 01:23:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J1NQ34032684 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 20:23:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 73D8FEC4BD; Wed, 19 Feb 2020 01:23:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FA75EC4C4
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 01:23:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90D80801E98
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 01:23:24 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-230-xInjSRkxNiOOJY_TlwmQoQ-1; Tue, 18 Feb 2020 20:23:21 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 36F4A3A325B;
	Wed, 19 Feb 2020 12:23:20 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j4E58-0004eU-Jt; Wed, 19 Feb 2020 12:23:18 +1100
Date: Wed, 19 Feb 2020 12:23:18 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219012318.GY10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-19-willy@infradead.org>
	<20200218065758.GQ10776@dread.disaster.area>
	<20200218211228.GF24185@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200218211228.GF24185@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=LYdCFQXi c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=14rPMwcjc7DfypWj1-kA:9
	a=AEfJ2Jny-4_AqVfN:21 a=ibXzlZxNEIkIBOHq:21 a=CjuIK1q_8ugA:10
	a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: xInjSRkxNiOOJY_TlwmQoQ-1
X-MC-Unique: LhCdUjMPOQONCJGcwR0WLw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J1NQ34032684
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 01:12:28PM -0800, Matthew Wilcox wrote:
> On Tue, Feb 18, 2020 at 05:57:58PM +1100, Dave Chinner wrote:
> > On Mon, Feb 17, 2020 at 10:45:59AM -0800, Matthew Wilcox wrote:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
....
> > > =20
> > > -=09=09if (nr) {
> > > -=09=09=09u64 contig_start =3D page_offset(pagepool[0]);
> > > +=09=09ASSERT(contig_start + nr * PAGE_SIZE - 1 =3D=3D contig_end);
> >=20
> > Ok, yes it does. :)
> >=20
> > I don't see how readahead_for_each_batch() guarantees that, though.
>=20
> I ... don't see how it doesn't?  We start at rac->_start and iterate
> through the consecutive pages in the page cache.  readahead_for_each_batc=
h()
> does assume that __do_page_cache_readahead() has its current behaviour
> of putting the pages in the page cache in order, and kicks off a new
> call to ->readahead() every time it has to skip an index for whatever
> reason (eg page already in page cache).

And there is the comment I was looking for while reading
readahead_for_each_batch() :)

>=20
> > > -=09if (bio)
> > > -=09=09return submit_one_bio(bio, 0, bio_flags);
> > > -=09return 0;
> > > +=09if (bio) {
> > > +=09=09if (submit_one_bio(bio, 0, bio_flags))
> > > +=09=09=09return;
> > > +=09}
> > >  }
> >=20
> > Shouldn't that just be
> >=20
> > =09if (bio)
> > =09=09submit_one_bio(bio, 0, bio_flags);
>=20
> It should, but some overzealous person decided to mark submit_one_bio()
> as __must_check, so I have to work around that.

/me looks at code

Ngggh.

I rather dislike functions that are named in a way that look like
they belong to core kernel APIs but in reality are local static
functions.

I'd ask for this to be fixed if it was generic code, but it's btrfs
specific code so they can deal with the ugliness of their own
creation. :/

> > Confusing when put alongside rac->_batch_count counting the number
> > of pages in the batch, and "batch" being the index into the page
> > array, and they aren't the same counts....
>=20
> Yes.  Renamed to 'i'.
>=20
> > > +=09XA_STATE(xas, &rac->mapping->i_pages, rac->_start);
> > > +=09struct page *page;
> > > +
> > > +=09rac->_batch_count =3D 0;
> > > +=09xas_for_each(&xas, page, rac->_start + rac->_nr_pages - 1) {
> >=20
> > That just iterates pages in the start,end doesn't it? What
> > guarantees that this fills the array with a contiguous page range?
>=20
> The behaviour of __do_page_cache_readahead().  Dave Howells also has a
> usecase for xas_for_each_contig(), so I'm going to add that soon.
>=20
> > > +=09=09VM_BUG_ON_PAGE(!PageLocked(page), page);
> > > +=09=09VM_BUG_ON_PAGE(PageTail(page), page);
> > > +=09=09array[batch++] =3D page;
> > > +=09=09rac->_batch_count +=3D hpage_nr_pages(page);
> > > +=09=09if (PageHead(page))
> > > +=09=09=09xas_set(&xas, rac->_start + rac->_batch_count);
> >=20
> > What on earth does this do? Comments please!
>=20
> =09=09/*
> =09=09 * The page cache isn't using multi-index entries yet,
> =09=09 * so xas_for_each() won't do the right thing for
> =09=09 * large pages.  This can be removed once the page cache
> =09=09 * is converted.
> =09=09 */

Oh, it's changing the internal xarray lookup cursor position to
point at the correct next page index? Perhaps it's better to say
that instead of "won't do the right thing"?

> > > +#define readahead_for_each_batch(rac, array, size, nr)=09=09=09\
> > > +=09for (; (nr =3D readahead_page_batch(rac, array, size));=09=09\
> > > +=09=09=09readahead_next(rac))
> >=20
> > I had to go look at the caller to work out what "size" refered to
> > here.
> >=20
> > This is complex enough that it needs proper API documentation.
>=20
> How about just:
>=20
> -#define readahead_for_each_batch(rac, array, size, nr)                 \
> -       for (; (nr =3D readahead_page_batch(rac, array, size));          =
 \
> +#define readahead_for_each_batch(rac, array, array_sz, nr)             \
> +       for (; (nr =3D readahead_page_batch(rac, array, array_sz));      =
 \

Yup, that's fine - now the macro documents itself.

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


