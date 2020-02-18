Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3C022163480
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 22:12:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582060368;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6MTH57F1nsK7GJaLchCGquZDIxrmRcHIpVJbhHtFAFE=;
	b=NiK/qGuT66zmw17PG7X3shv7DxvzW977GqP0i0NUTqzs/GKHIrg6kCNh2hjbzkutiLGAc2
	s5KHtrtfkOlfA5vG9QGn2kiHk2Oo4S10hv20QfYuGTNP6Dgy8GLmQZ3cM2GMG4Ia5O/FcB
	VdTnbl47S/YNhk8o4kTFbruiCIrH2Ew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-Lj4Bvd8IMYeuzDJGNLPsHQ-1; Tue, 18 Feb 2020 16:12:46 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB3AC800D6C;
	Tue, 18 Feb 2020 21:12:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 519021001920;
	Tue, 18 Feb 2020 21:12:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8DC335AFF;
	Tue, 18 Feb 2020 21:12:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01ILCdgH018510 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 16:12:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DE2EE104FF9B; Tue, 18 Feb 2020 21:12:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9FD31000D92
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 21:12:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BEB8101D232
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 21:12:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-237-ACQsxsVePGi1Kex9dokAeQ-1; Tue, 18 Feb 2020 16:12:34 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4AAO-0006yP-HR; Tue, 18 Feb 2020 21:12:28 +0000
Date: Tue, 18 Feb 2020 13:12:28 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200218211228.GF24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-19-willy@infradead.org>
	<20200218065758.GQ10776@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200218065758.GQ10776@dread.disaster.area>
X-MC-Unique: ACQsxsVePGi1Kex9dokAeQ-1
X-MC-Unique: Lj4Bvd8IMYeuzDJGNLPsHQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01ILCdgH018510
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 05:57:58PM +1100, Dave Chinner wrote:
> On Mon, Feb 17, 2020 at 10:45:59AM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >=20
> > Use the new readahead operation in btrfs.  Add a
> > readahead_for_each_batch() iterator to optimise the loop in the XArray.
> >=20
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > ---
> >  fs/btrfs/extent_io.c    | 46 +++++++++++++----------------------------
> >  fs/btrfs/extent_io.h    |  3 +--
> >  fs/btrfs/inode.c        | 16 +++++++-------
> >  include/linux/pagemap.h | 27 ++++++++++++++++++++++++
> >  4 files changed, 49 insertions(+), 43 deletions(-)
> >=20
> > diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
> > index c0f202741e09..e97a6acd6f5d 100644
> > --- a/fs/btrfs/extent_io.c
> > +++ b/fs/btrfs/extent_io.c
> > @@ -4278,52 +4278,34 @@ int extent_writepages(struct address_space *map=
ping,
> >  =09return ret;
> >  }
> > =20
> > -int extent_readpages(struct address_space *mapping, struct list_head *=
pages,
> > -=09=09     unsigned nr_pages)
> > +void extent_readahead(struct readahead_control *rac)
> >  {
> >  =09struct bio *bio =3D NULL;
> >  =09unsigned long bio_flags =3D 0;
> >  =09struct page *pagepool[16];
> >  =09struct extent_map *em_cached =3D NULL;
> > -=09struct extent_io_tree *tree =3D &BTRFS_I(mapping->host)->io_tree;
> > -=09int nr =3D 0;
> > +=09struct extent_io_tree *tree =3D &BTRFS_I(rac->mapping->host)->io_tr=
ee;
> >  =09u64 prev_em_start =3D (u64)-1;
> > +=09int nr;
> > =20
> > -=09while (!list_empty(pages)) {
> > -=09=09u64 contig_end =3D 0;
> > -
> > -=09=09for (nr =3D 0; nr < ARRAY_SIZE(pagepool) && !list_empty(pages);)=
 {
> > -=09=09=09struct page *page =3D lru_to_page(pages);
> > -
> > -=09=09=09prefetchw(&page->flags);
> > -=09=09=09list_del(&page->lru);
> > -=09=09=09if (add_to_page_cache_lru(page, mapping, page->index,
> > -=09=09=09=09=09=09readahead_gfp_mask(mapping))) {
> > -=09=09=09=09put_page(page);
> > -=09=09=09=09break;
> > -=09=09=09}
> > -
> > -=09=09=09pagepool[nr++] =3D page;
> > -=09=09=09contig_end =3D page_offset(page) + PAGE_SIZE - 1;
> > -=09=09}
> > +=09readahead_for_each_batch(rac, pagepool, ARRAY_SIZE(pagepool), nr) {
> > +=09=09u64 contig_start =3D page_offset(pagepool[0]);
> > +=09=09u64 contig_end =3D page_offset(pagepool[nr - 1]) + PAGE_SIZE - 1=
;
>=20
> So this assumes a contiguous page range is returned, right?

Yes.  That's documented in the readahead API and is the behaviour of
the code.  I mean, btrfs asserts it's true while most of the rest of
the kernel is indifferent to it, but it's the documented and actual
behaviour.

> > =20
> > -=09=09if (nr) {
> > -=09=09=09u64 contig_start =3D page_offset(pagepool[0]);
> > +=09=09ASSERT(contig_start + nr * PAGE_SIZE - 1 =3D=3D contig_end);
>=20
> Ok, yes it does. :)
>=20
> I don't see how readahead_for_each_batch() guarantees that, though.

I ... don't see how it doesn't?  We start at rac->_start and iterate
through the consecutive pages in the page cache.  readahead_for_each_batch(=
)
does assume that __do_page_cache_readahead() has its current behaviour
of putting the pages in the page cache in order, and kicks off a new
call to ->readahead() every time it has to skip an index for whatever
reason (eg page already in page cache).

> > -=09if (bio)
> > -=09=09return submit_one_bio(bio, 0, bio_flags);
> > -=09return 0;
> > +=09if (bio) {
> > +=09=09if (submit_one_bio(bio, 0, bio_flags))
> > +=09=09=09return;
> > +=09}
> >  }
>=20
> Shouldn't that just be
>=20
> =09if (bio)
> =09=09submit_one_bio(bio, 0, bio_flags);

It should, but some overzealous person decided to mark submit_one_bio()
as __must_check, so I have to work around that.

> > +static inline unsigned int readahead_page_batch(struct readahead_contr=
ol *rac,
> > +=09=09struct page **array, unsigned int size)
> > +{
> > +=09unsigned int batch =3D 0;
>=20
> Confusing when put alongside rac->_batch_count counting the number
> of pages in the batch, and "batch" being the index into the page
> array, and they aren't the same counts....

Yes.  Renamed to 'i'.

> > +=09XA_STATE(xas, &rac->mapping->i_pages, rac->_start);
> > +=09struct page *page;
> > +
> > +=09rac->_batch_count =3D 0;
> > +=09xas_for_each(&xas, page, rac->_start + rac->_nr_pages - 1) {
>=20
> That just iterates pages in the start,end doesn't it? What
> guarantees that this fills the array with a contiguous page range?

The behaviour of __do_page_cache_readahead().  Dave Howells also has a
usecase for xas_for_each_contig(), so I'm going to add that soon.

> > +=09=09VM_BUG_ON_PAGE(!PageLocked(page), page);
> > +=09=09VM_BUG_ON_PAGE(PageTail(page), page);
> > +=09=09array[batch++] =3D page;
> > +=09=09rac->_batch_count +=3D hpage_nr_pages(page);
> > +=09=09if (PageHead(page))
> > +=09=09=09xas_set(&xas, rac->_start + rac->_batch_count);
>=20
> What on earth does this do? Comments please!

=09=09/*
=09=09 * The page cache isn't using multi-index entries yet,
=09=09 * so xas_for_each() won't do the right thing for
=09=09 * large pages.  This can be removed once the page cache
=09=09 * is converted.
=09=09 */

> > +
> > +=09=09if (batch =3D=3D size)
> > +=09=09=09break;
> > +=09}
> > +
> > +=09return batch;
> > +}
>=20
> Seems a bit big for an inline function.

It's only called by btrfs at the moment.  If it gets more than one caller,
then sure, let's move it out of line.

> > +
> > +#define readahead_for_each_batch(rac, array, size, nr)=09=09=09\
> > +=09for (; (nr =3D readahead_page_batch(rac, array, size));=09=09\
> > +=09=09=09readahead_next(rac))
>=20
> I had to go look at the caller to work out what "size" refered to
> here.
>=20
> This is complex enough that it needs proper API documentation.

How about just:

-#define readahead_for_each_batch(rac, array, size, nr)                 \
-       for (; (nr =3D readahead_page_batch(rac, array, size));           \
+#define readahead_for_each_batch(rac, array, array_sz, nr)             \
+       for (; (nr =3D readahead_page_batch(rac, array, array_sz));       \

(corresponding rename in readahead_page_batch).  I mean, we could also
do:

#define readahead_for_each_batch(rac, array, nr)=09=09=09\
=09for (; (nr =3D readahead_page_batch(rac, array, ARRAY_SIZE(array)); \
=09=09=09readahead_next(rac))

making it less flexible, but easier to use.


