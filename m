Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CE0BA166DF9
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Feb 2020 04:43:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582256609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Wg2mj/GbWDJ1Lb7b7joS8Sc/cRY7nejwQ4eYn3EWisY=;
	b=fQJ+eqCH9M64oeXzp2CkRfXWgX1Ve6Hu33UGMqpNk6BtA/yMMUeJh9huTboXfWRZfc7V77
	/sYB4O24FkPAFDGVIFtbQOrC2WmT5N/4idNwq/Z1/3mQwk8a8y7NmESk9JI0gpsoCiHtRG
	qbLsAPKyK65xEQe0/UF4G+10GxDyqVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-P06zkhxwPNS5p7MHgBE1Vg-1; Thu, 20 Feb 2020 22:43:28 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D355107ACC5;
	Fri, 21 Feb 2020 03:43:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 787B919481;
	Fri, 21 Feb 2020 03:43:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BE478B2C8;
	Fri, 21 Feb 2020 03:43:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01L3hJ9X002625 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 22:43:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7FFC71054EE8; Fri, 21 Feb 2020 03:43:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79F2E1049482
	for <cluster-devel@redhat.com>; Fri, 21 Feb 2020 03:43:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7360800FCC
	for <cluster-devel@redhat.com>; Fri, 21 Feb 2020 03:43:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-91-8ZPrtyUgMl-gPY1_te6iDg-1; Thu, 20 Feb 2020 22:43:14 -0500
X-MC-Unique: 8ZPrtyUgMl-gPY1_te6iDg-1
X-MC-Unique: P06zkhxwPNS5p7MHgBE1Vg-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4zDU-0002Zk-HL; Fri, 21 Feb 2020 03:43:04 +0000
Date: Thu, 20 Feb 2020 19:43:04 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200221034304.GC24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-10-willy@infradead.org>
	<5691442b-56c7-7b0d-d91b-275be52abb42@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <5691442b-56c7-7b0d-d91b-275be52abb42@nvidia.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01L3hJ9X002625
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 09/24] mm: Put readahead pages in
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Feb 20, 2020 at 07:19:58PM -0800, John Hubbard wrote:
> > +static inline struct page *readahead_page(struct readahead_control *ra=
c)
> > +{
> > +=09struct page *page;
> > +
> > +=09BUG_ON(rac->_batch_count > rac->_nr_pages);
> > +=09rac->_nr_pages -=3D rac->_batch_count;
> > +=09rac->_index +=3D rac->_batch_count;
> > +=09rac->_batch_count =3D 0;
>=20
>=20
> Is it intentional, to set rac->_batch_count twice (here, and below)? The
> only reason I can see is if a caller needs to use ->_batch_count in the
> "return NULL" case, which doesn't seem to come up...

Ah, but it does.  Not in this patch, but the next one ...

+       if (aops->readahead) {
+               aops->readahead(rac);
+               /* Clean up the remaining pages */
+               while ((page =3D readahead_page(rac))) {
+                       unlock_page(page);
+                       put_page(page);
+               }

In the normal case, the ->readahead method will consume all the pages,
and we need readahead_page() to do nothing if it is called again.

> > +=09if (!rac->_nr_pages)
> > +=09=09return NULL;

... admittedly I could do:

=09if (!rac->_nr_pages) {
=09=09rac->_batch_count =3D 0;
=09=09return NULL;
=09}

which might be less confusing.

> > @@ -130,23 +129,23 @@ static void read_pages(struct readahead_control *=
rac, struct list_head *pages,
> >  =09=09=09=09readahead_count(rac));
> >  =09=09/* Clean up the remaining pages */
> >  =09=09put_pages_list(pages);
> > -=09=09goto out;
> > -=09}
> > -
> > -=09for (page_idx =3D 0; page_idx < readahead_count(rac); page_idx++) {
> > -=09=09struct page *page =3D lru_to_page(pages);
> > -=09=09list_del(&page->lru);
> > -=09=09if (!add_to_page_cache_lru(page, rac->mapping, page->index,
> > -=09=09=09=09gfp))
> > +=09=09rac->_index +=3D rac->_nr_pages;
> > +=09=09rac->_nr_pages =3D 0;
> > +=09} else {
> > +=09=09while ((page =3D readahead_page(rac))) {
> >  =09=09=09aops->readpage(rac->file, page);
> > -=09=09put_page(page);
> > +=09=09=09put_page(page);
> > +=09=09}
> >  =09}
> > =20
> > -out:
> >  =09blk_finish_plug(&plug);
> > =20
> >  =09BUG_ON(!list_empty(pages));
> > -=09rac->_nr_pages =3D 0;
> > +=09BUG_ON(readahead_count(rac));
> > +
> > +out:
> > +=09/* If we were called due to a conflicting page, skip over it */
>=20
> Tiny documentation nit: What if we were *not* called due to a conflicting=
 page?=20
> (And what is a "conflicting page", in this context, btw?) The next line u=
nconditionally=20
> moves the index ahead, so the "if" part of the comment really confuses me=
.

By the end of the series, read_pages() is called in three places:

1.              if (page && !xa_is_value(page)) {
                        read_pages(&rac, &page_pool);

2.              } else if (add_to_page_cache_lru(page, mapping, index + i,
                                        gfp_mask) < 0) {
                        put_page(page);
                        read_pages(&rac, &page_pool);

3.      read_pages(&rac, &page_pool);

In the first two cases, there's an existing page in the page cache
(which conflicts with this readahead operation), and so we need to
advance index.  In the third case, we're exiting the function, so it
does no harm to advance index one further.

> > +=09=09} else if (add_to_page_cache_lru(page, mapping, index + i,
> > +=09=09=09=09=09gfp_mask) < 0) {
>=20
> I still think you'll want to compare against !=3D0, rather than < 0, here=
.

I tend to prefer < 0 when checking for an error value in case the function
decides to start using positive numbers to mean something.  I don't think
it's a particularly important preference though (after all, returning 1
might mean "failed, but for this weird reason rather than an errno").

> > +=09=09=09put_page(page);
> > +=09=09=09read_pages(&rac, &page_pool);
>=20
> Doing a read_pages() in the error case is because...actually, I'm not sur=
e yet.
> Why do we do this? Effectively it's a retry?

Same as the reason we call read_pages() if we found a page in the page
cache earlier -- we're sending down a set of pages which are consecutive
in the file's address space, and now we have to skip one.  At least one ;-)


