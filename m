Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 43D801638DC
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 01:59:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582073974;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4uUh9rawL2Hc2t7O8maHq37jsFyLzz+otx7wLakgIjk=;
	b=SggivYUWG9H0xxqkXzE3pFW8oTi0i3gf1aJn4BrG6mLoYvbnxvmbkRluVrkihl6JJsAlJB
	8neSEQx0qGc0DIs1jBUee32Gj/f0K+qhYtkEFqWk4vE33i2ipW8TWcp9hZjYKOCmBRRuTr
	cqGQVDtJEKcweqNictNAcOEs4UiQiBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-E_Ams8NqPAeak4-Jac25tw-1; Tue, 18 Feb 2020 19:59:32 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 604CC107B267;
	Wed, 19 Feb 2020 00:59:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23BB05C13B;
	Wed, 19 Feb 2020 00:59:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A079D18089C8;
	Wed, 19 Feb 2020 00:59:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J0xP9k031604 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 19:59:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 346EFEC4CA; Wed, 19 Feb 2020 00:59:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30573EC4C8
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 00:59:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51E8318AE965
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 00:59:23 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-380-EyaiWhS-Pziq2PwJ9R73OA-1; Tue, 18 Feb 2020 19:59:20 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 368A83A2380;
	Wed, 19 Feb 2020 11:59:16 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j4Dhr-0004cn-HF; Wed, 19 Feb 2020 11:59:15 +1100
Date: Wed, 19 Feb 2020 11:59:15 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219005915.GV10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-12-willy@infradead.org>
	<20200218061459.GM10776@dread.disaster.area>
	<20200218154222.GQ7778@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200218154222.GQ7778@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=vUdR-S3ouboEXt6xVngA:9
	a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: EyaiWhS-Pziq2PwJ9R73OA-1
X-MC-Unique: E_Ams8NqPAeak4-Jac25tw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J0xP9k031604
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 18, 2020 at 07:42:22AM -0800, Matthew Wilcox wrote:
> On Tue, Feb 18, 2020 at 05:14:59PM +1100, Dave Chinner wrote:
> > On Mon, Feb 17, 2020 at 10:45:52AM -0800, Matthew Wilcox wrote:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > >=20
> > > At allocation time, put the pages in the cache unless we're using
> > > ->readpages.  Add the readahead_for_each() iterator for the benefit o=
f
> > > the ->readpage fallback.  This iterator supports huge pages, even tho=
ugh
> > > none of the filesystems to be converted do yet.
> >=20
> > This could be better written - took me some time to get my head
> > around it and the code.
> >=20
> > "When populating the page cache for readahead, mappings that don't
> > use ->readpages need to have their pages added to the page cache
> > before ->readpage is called. Do this insertion earlier so that the
> > pages can be looked up immediately prior to ->readpage calls rather
> > than passing them on a linked list. This early insert functionality
> > is also required by the upcoming ->readahead method that will
> > replace ->readpages.
> >=20
> > Optimise and simplify the readpage loop by adding a
> > readahead_for_each() iterator to provide the pages we need to read.
> > This iterator also supports huge pages, even though none of the
> > filesystems have been converted to use them yet."
>=20
> Thanks, I'll use that.
>=20
> > > +static inline struct page *readahead_page(struct readahead_control *=
rac)
> > > +{
> > > +=09struct page *page;
> > > +
> > > +=09if (!rac->_nr_pages)
> > > +=09=09return NULL;
> >=20
> > Hmmmm.
> >=20
> > > +
> > > +=09page =3D xa_load(&rac->mapping->i_pages, rac->_start);
> > > +=09VM_BUG_ON_PAGE(!PageLocked(page), page);
> > > +=09rac->_batch_count =3D hpage_nr_pages(page);
> >=20
> > So we could have rac->_nr_pages =3D 2, and then we get an order 2
> > large page returned, and so rac->_batch_count =3D 4.
>=20
> Well, no, we couldn't.  rac->_nr_pages is incremented by 4 when we add
> an order-2 page to the readahead.

I don't see any code that does that. :)

i.e. we aren't actually putting high order pages into the page
cache here - page_alloc() allocates order-0 pages) - so there's
nothing in the patch that tells me how rac->_nr_pages behaves
when allocating large pages...

IOWs, we have an undocumented assumption in the implementation...

> I can put a
> =09BUG_ON(rac->_batch_count > rac->_nr_pages)
> in here to be sure to catch any logic error like that.

Definitely necessary given that we don't insert large pages for
readahead yet. A comment explaining the assumptions that the
code makes for large pages is probably in order, too.

> > > -=09=09page->index =3D offset;
> > > -=09=09list_add(&page->lru, &page_pool);
> > > +=09=09if (use_list) {
> > > +=09=09=09page->index =3D offset;
> > > +=09=09=09list_add(&page->lru, &page_pool);
> > > +=09=09} else if (add_to_page_cache_lru(page, mapping, offset,
> > > +=09=09=09=09=09gfp_mask) < 0) {
> > > +=09=09=09put_page(page);
> > > +=09=09=09goto read;
> > > +=09=09}
> >=20
> > Ok, so that's why you put read code at the end of the loop. To turn
> > the code into spaghetti :/
> >=20
> > How much does this simplify down when we get rid of ->readpages and
> > can restructure the loop? This really seems like you're trying to
> > flatten two nested loops into one by the use of goto....
>=20
> I see it as having two failure cases in this loop.  One for "page is
> already present" (which already existed) and one for "allocated a page,
> but failed to add it to the page cache" (which used to be done later).
> I didn't want to duplicate the "call read_pages()" code.  So I reshuffled
> the code rather than add a nested loop.  I don't think the nested loop
> is easier to read (we'll be at 5 levels of indentation for some statement=
s).
> Could do it this way ...

Can we move the update of @rac inside read_pages()? The next
start offset^Windex we start at is rac._start + rac._nr_pages, right?

so read_pages() could do:

{
=09if (readahead_count(rac)) {
=09=09/* do readahead */
=09}

=09/* advance the readahead cursor */
=09rac->_start +=3D rac->_nr_pages;
=09rac._nr_pages =3D 0;
}

and then we only need to call read_pages() in these cases and so
the requirement for avoiding duplicating code is avoided...

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


