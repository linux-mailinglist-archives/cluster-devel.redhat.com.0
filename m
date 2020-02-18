Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DFE0B1629A4
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 16:42:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582040566;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZK5W4QAoqYCVtqkmaYSLCSzTty6fzGAJLyjLcYqQUC0=;
	b=at+Lj25eoi6OWYrOXHaoHAHZkH4G7tj8+BNTsGTwjL7KhafIVEUEEfz2y4k+H1/HXw1BjZ
	XDzgeUKcYVDSxbJb6JND6jn/HxmRL6/XI01yi1rJdhUrQBWn9yhuwBYBqgUSP91hx8T6pA
	Kmp7tytHFQOhL9AFMbOnvvorbjvAPVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-16lXDBNeM9CW86avKDKYFQ-1; Tue, 18 Feb 2020 10:42:45 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CE2F8018A2;
	Tue, 18 Feb 2020 15:42:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EED30277A4;
	Tue, 18 Feb 2020 15:42:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA3AC35B05;
	Tue, 18 Feb 2020 15:42:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IFgWMK030786 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 10:42:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A97BAE38D0; Tue, 18 Feb 2020 15:42:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A57429D68
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 15:42:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37B8E80386E
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 15:42:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-2-efj_0vIkMUmOlAd9ELe4VQ-1; Tue, 18 Feb 2020 10:42:28 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j450w-0007Ik-FJ; Tue, 18 Feb 2020 15:42:22 +0000
Date: Tue, 18 Feb 2020 07:42:22 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200218154222.GQ7778@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-12-willy@infradead.org>
	<20200218061459.GM10776@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200218061459.GM10776@dread.disaster.area>
X-MC-Unique: efj_0vIkMUmOlAd9ELe4VQ-1
X-MC-Unique: 16lXDBNeM9CW86avKDKYFQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01IFgWMK030786
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 05:14:59PM +1100, Dave Chinner wrote:
> On Mon, Feb 17, 2020 at 10:45:52AM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >=20
> > At allocation time, put the pages in the cache unless we're using
> > ->readpages.  Add the readahead_for_each() iterator for the benefit of
> > the ->readpage fallback.  This iterator supports huge pages, even thoug=
h
> > none of the filesystems to be converted do yet.
>=20
> This could be better written - took me some time to get my head
> around it and the code.
>=20
> "When populating the page cache for readahead, mappings that don't
> use ->readpages need to have their pages added to the page cache
> before ->readpage is called. Do this insertion earlier so that the
> pages can be looked up immediately prior to ->readpage calls rather
> than passing them on a linked list. This early insert functionality
> is also required by the upcoming ->readahead method that will
> replace ->readpages.
>=20
> Optimise and simplify the readpage loop by adding a
> readahead_for_each() iterator to provide the pages we need to read.
> This iterator also supports huge pages, even though none of the
> filesystems have been converted to use them yet."

Thanks, I'll use that.

> > +static inline struct page *readahead_page(struct readahead_control *ra=
c)
> > +{
> > +=09struct page *page;
> > +
> > +=09if (!rac->_nr_pages)
> > +=09=09return NULL;
>=20
> Hmmmm.
>=20
> > +
> > +=09page =3D xa_load(&rac->mapping->i_pages, rac->_start);
> > +=09VM_BUG_ON_PAGE(!PageLocked(page), page);
> > +=09rac->_batch_count =3D hpage_nr_pages(page);
>=20
> So we could have rac->_nr_pages =3D 2, and then we get an order 2
> large page returned, and so rac->_batch_count =3D 4.

Well, no, we couldn't.  rac->_nr_pages is incremented by 4 when we add
an order-2 page to the readahead.  I can put a
=09BUG_ON(rac->_batch_count > rac->_nr_pages)
in here to be sure to catch any logic error like that.

> > @@ -159,6 +152,7 @@ void __do_page_cache_readahead(struct address_space=
 *mapping,
> >  =09unsigned long i;
> >  =09loff_t isize =3D i_size_read(inode);
> >  =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
> > +=09bool use_list =3D mapping->a_ops->readpages;
> >  =09struct readahead_control rac =3D {
> >  =09=09.mapping =3D mapping,
> >  =09=09.file =3D filp,
>=20
> [ I do find these unstructured mixes of declarations and
> initialisations dense and difficult to read.... ]

Fair ... although I didn't create this mess, I can tidy it up a bit.

> > -=09=09page->index =3D offset;
> > -=09=09list_add(&page->lru, &page_pool);
> > +=09=09if (use_list) {
> > +=09=09=09page->index =3D offset;
> > +=09=09=09list_add(&page->lru, &page_pool);
> > +=09=09} else if (add_to_page_cache_lru(page, mapping, offset,
> > +=09=09=09=09=09gfp_mask) < 0) {
> > +=09=09=09put_page(page);
> > +=09=09=09goto read;
> > +=09=09}
>=20
> Ok, so that's why you put read code at the end of the loop. To turn
> the code into spaghetti :/
>=20
> How much does this simplify down when we get rid of ->readpages and
> can restructure the loop? This really seems like you're trying to
> flatten two nested loops into one by the use of goto....

I see it as having two failure cases in this loop.  One for "page is
already present" (which already existed) and one for "allocated a page,
but failed to add it to the page cache" (which used to be done later).
I didn't want to duplicate the "call read_pages()" code.  So I reshuffled
the code rather than add a nested loop.  I don't think the nested loop
is easier to read (we'll be at 5 levels of indentation for some statements)=
.
Could do it this way ...

@@ -218,18 +218,17 @@ void page_cache_readahead_limit(struct address_space =
*mapping,
                } else if (add_to_page_cache_lru(page, mapping, offset,
                                        gfp_mask) < 0) {
                        put_page(page);
-                       goto read;
+read:
+                       if (readahead_count(&rac))
+                               read_pages(&rac, &page_pool);
+                       rac._nr_pages =3D 0;
+                       rac._start =3D ++offset;
+                       continue;
                }
                if (i =3D=3D nr_to_read - lookahead_size)
                        SetPageReadahead(page);
                rac._nr_pages++;
                offset++;
-               continue;
-read:
-               if (readahead_count(&rac))
-                       read_pages(&rac, &page_pool);
-               rac._nr_pages =3D 0;
-               rac._start =3D ++offset;
        }
=20
        /*

but I'm not sure that's any better.


