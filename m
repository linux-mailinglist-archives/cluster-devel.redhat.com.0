Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C88991620BA
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 07:15:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582006524;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xd37++kKA6bkUgKgKM9LEMPOLAd02C2DkplUTKYL40k=;
	b=T04KmIphyATfSeGyKvF4sBW8IMxGhSQFuRG5C1F4J4zvTAP9pGWHGAItquOfteZ+eDauXF
	XplgYKpZkKytepiqonzMnqIM6HrPacbd2xGDhzT3mLU3vVPEuGQltSa0nB5erKK2UEO06c
	vLjhdsF1gscNwAD3BxhC/bL1NChkxWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-s4z8lW8bNTy5a9pUv5T7jQ-1; Tue, 18 Feb 2020 01:15:23 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DA7F107ACC5;
	Tue, 18 Feb 2020 06:15:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C29975C1B0;
	Tue, 18 Feb 2020 06:15:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94B4D1809567;
	Tue, 18 Feb 2020 06:15:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01I6FAVn029020 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 01:15:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AC3E510D18DD; Tue, 18 Feb 2020 06:15:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A783A10D18DC
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 06:15:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E7B3802086
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 06:15:08 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-270-6TSBIHTVN96PcuaEc30Hng-1; Tue, 18 Feb 2020 01:15:05 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id ABD677E9E5B;
	Tue, 18 Feb 2020 17:15:00 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j3w9r-0006E2-AR; Tue, 18 Feb 2020 17:14:59 +1100
Date: Tue, 18 Feb 2020 17:14:59 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200218061459.GM10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-12-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-12-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=6Sg7X3AK5n0gSZn-CawA:9
	a=XfLjuTNYxNuElQ0I:21 a=atnrvcmCVHYDzj7Q:21 a=CjuIK1q_8ugA:10
	a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: 6TSBIHTVN96PcuaEc30Hng-1
X-MC-Unique: s4z8lW8bNTy5a9pUv5T7jQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01I6FAVn029020
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 07/19] mm: Put readahead pages in
	cache earlier
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

On Mon, Feb 17, 2020 at 10:45:52AM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> At allocation time, put the pages in the cache unless we're using
> ->readpages.  Add the readahead_for_each() iterator for the benefit of
> the ->readpage fallback.  This iterator supports huge pages, even though
> none of the filesystems to be converted do yet.

This could be better written - took me some time to get my head
around it and the code.

"When populating the page cache for readahead, mappings that don't
use ->readpages need to have their pages added to the page cache
before ->readpage is called. Do this insertion earlier so that the
pages can be looked up immediately prior to ->readpage calls rather
than passing them on a linked list. This early insert functionality
is also required by the upcoming ->readahead method that will
replace ->readpages.

Optimise and simplify the readpage loop by adding a
readahead_for_each() iterator to provide the pages we need to read.
This iterator also supports huge pages, even though none of the
filesystems have been converted to use them yet."

> +static inline struct page *readahead_page(struct readahead_control *rac)
> +{
> +=09struct page *page;
> +
> +=09if (!rac->_nr_pages)
> +=09=09return NULL;

Hmmmm.

> +
> +=09page =3D xa_load(&rac->mapping->i_pages, rac->_start);
> +=09VM_BUG_ON_PAGE(!PageLocked(page), page);
> +=09rac->_batch_count =3D hpage_nr_pages(page);

So we could have rac->_nr_pages =3D 2, and then we get an order 2
large page returned, and so rac->_batch_count =3D 4.
> +
> +=09return page;
> +}
> +
> +static inline void readahead_next(struct readahead_control *rac)
> +{
> +=09rac->_nr_pages -=3D rac->_batch_count;
> +=09rac->_start +=3D rac->_batch_count;

This results in rac->_nr_pages =3D -2 (or a huge positive number).
That means that readahead_page() will not terminate when it should,
and potentially will panic if it doesn't find the page that it
thinks should be there at rac->_start + 4...

> +#define readahead_for_each(rac, page)=09=09=09=09=09\
> +=09for (; (page =3D readahead_page(rac)); readahead_next(rac))
> +
>  /* The number of pages in this readahead block */
>  static inline unsigned int readahead_count(struct readahead_control *rac=
)
>  {
> diff --git a/mm/readahead.c b/mm/readahead.c
> index bdc5759000d3..9e430daae42f 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -113,12 +113,11 @@ int read_cache_pages(struct address_space *mapping,=
 struct list_head *pages,
> =20
>  EXPORT_SYMBOL(read_cache_pages);
> =20
> -static void read_pages(struct readahead_control *rac, struct list_head *=
pages,
> -=09=09gfp_t gfp)
> +static void read_pages(struct readahead_control *rac, struct list_head *=
pages)
>  {
>  =09const struct address_space_operations *aops =3D rac->mapping->a_ops;
> +=09struct page *page;
>  =09struct blk_plug plug;
> -=09unsigned page_idx;
> =20
>  =09blk_start_plug(&plug);
> =20
> @@ -127,19 +126,13 @@ static void read_pages(struct readahead_control *ra=
c, struct list_head *pages,
>  =09=09=09=09readahead_count(rac));
>  =09=09/* Clean up the remaining pages */
>  =09=09put_pages_list(pages);
> -=09=09goto out;
> -=09}
> -
> -=09for (page_idx =3D 0; page_idx < readahead_count(rac); page_idx++) {
> -=09=09struct page *page =3D lru_to_page(pages);
> -=09=09list_del(&page->lru);
> -=09=09if (!add_to_page_cache_lru(page, rac->mapping, page->index,
> -=09=09=09=09gfp))
> +=09} else {
> +=09=09readahead_for_each(rac, page) {
>  =09=09=09aops->readpage(rac->file, page);
> -=09=09put_page(page);
> +=09=09=09put_page(page);
> +=09=09}
>  =09}

Nice simplification and gets rid of the need for rac->mapping, but I
still find the aops variable weird.

> -out:
>  =09blk_finish_plug(&plug);
>  }
> =20
> @@ -159,6 +152,7 @@ void __do_page_cache_readahead(struct address_space *=
mapping,
>  =09unsigned long i;
>  =09loff_t isize =3D i_size_read(inode);
>  =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
> +=09bool use_list =3D mapping->a_ops->readpages;
>  =09struct readahead_control rac =3D {
>  =09=09.mapping =3D mapping,
>  =09=09.file =3D filp,

[ I do find these unstructured mixes of declarations and
initialisations dense and difficult to read.... ]

> @@ -196,8 +190,14 @@ void __do_page_cache_readahead(struct address_space =
*mapping,
>  =09=09page =3D __page_cache_alloc(gfp_mask);
>  =09=09if (!page)
>  =09=09=09break;
> -=09=09page->index =3D offset;
> -=09=09list_add(&page->lru, &page_pool);
> +=09=09if (use_list) {
> +=09=09=09page->index =3D offset;
> +=09=09=09list_add(&page->lru, &page_pool);
> +=09=09} else if (add_to_page_cache_lru(page, mapping, offset,
> +=09=09=09=09=09gfp_mask) < 0) {
> +=09=09=09put_page(page);
> +=09=09=09goto read;
> +=09=09}

Ok, so that's why you put read code at the end of the loop. To turn
the code into spaghetti :/

How much does this simplify down when we get rid of ->readpages and
can restructure the loop? This really seems like you're trying to
flatten two nested loops into one by the use of goto....

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


