Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B67ED159A4D
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Feb 2020 21:12:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581451966;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TLV2edMr4IVtgc1Infa5ngZ62ZnMdKDhFUiJpG+tk3Y=;
	b=He4sftpeteMm2QH9kI31VBH92ARdM7rpXtQ98v4C/CVOlPtJnjfU8KZQYsVtOH4UvSiSBy
	2sn4XVd9Wr1o3B35goWKUZTBdNkDhvW6S3aAx08CHfgebvvFsZU74HvwVLZ9Yj03on/A3m
	fvv1RLZXrvif72o09rpa/V+ukIuh99I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-ytfp1dlrOZuts7cZ5RJCQw-1; Tue, 11 Feb 2020 15:12:44 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66C22107ACC4;
	Tue, 11 Feb 2020 20:12:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 470145C10F;
	Tue, 11 Feb 2020 20:12:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E0621803C42;
	Tue, 11 Feb 2020 20:12:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01BK8fns024482 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 15:08:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 393DC1000DB6; Tue, 11 Feb 2020 20:08:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3419710031E6
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 20:08:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C989D8EB44F
	for <cluster-devel@redhat.com>; Tue, 11 Feb 2020 20:08:38 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-215-xj4Iz0BrOzq71est4Ijdzg-1; Tue, 11 Feb 2020 15:08:31 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 2D0293A3899;
	Wed, 12 Feb 2020 07:08:28 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j1bpa-0002l0-DL; Wed, 12 Feb 2020 07:08:26 +1100
Date: Wed, 12 Feb 2020 07:08:26 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200211200826.GK10776@dread.disaster.area>
References: <20200211010348.6872-1-willy@infradead.org>
	<20200211010348.6872-5-willy@infradead.org>
	<20200211045230.GD10776@dread.disaster.area>
	<20200211125413.GU8731@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200211125413.GU8731@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=7-415B0cAAAA:8 a=EnYlyWvjhy6VBD_eMqkA:9 a=CdacwtsPoHkD4rhW:21
	a=vlsg44Ume0T2P6Xz:21 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: xj4Iz0BrOzq71est4Ijdzg-1
X-MC-Unique: ytfp1dlrOZuts7cZ5RJCQw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01BK8fns024482
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v5 04/13] mm: Add readahead address
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Feb 11, 2020 at 04:54:13AM -0800, Matthew Wilcox wrote:
> On Tue, Feb 11, 2020 at 03:52:30PM +1100, Dave Chinner wrote:
> > > +struct readahead_control {
> > > +=09struct file *file;
> > > +=09struct address_space *mapping;
> > > +/* private: use the readahead_* accessors instead */
> > > +=09pgoff_t start;
> > > +=09unsigned int nr_pages;
> > > +=09unsigned int batch_count;
> > > +};
> > > +
> > > +static inline struct page *readahead_page(struct readahead_control *=
rac)
> > > +{
> > > +=09struct page *page;
> > > +
> > > +=09if (!rac->nr_pages)
> > > +=09=09return NULL;
> > > +
> > > +=09page =3D xa_load(&rac->mapping->i_pages, rac->start);
> > > +=09VM_BUG_ON_PAGE(!PageLocked(page), page);
> > > +=09rac->batch_count =3D hpage_nr_pages(page);
> > > +=09rac->start +=3D rac->batch_count;
> >=20
> > There's no mention of large page support in the patch description
> > and I don't recall this sort of large page batching in previous
> > iterations.
> >=20
> > This seems like new functionality to me, not directly related to
> > the initial ->readahead API change? What have I missed?
>=20
> I had a crisis of confidence when I was working on this -- the loop
> originally looked like this:
>=20
> #define readahead_for_each(rac, page)                                   \
>         for (; (page =3D readahead_page(rac)); rac->nr_pages--)
>=20
> and then I started thinking about what I'd need to do to support large
> pages, and that turned into
>=20
> #define readahead_for_each(rac, page)                                   \
>         for (; (page =3D readahead_page(rac));=09=09=09=09\
> =09=09rac->nr_pages -=3D hpage_nr_pages(page))
>=20
> but I realised that was potentially a use-after-free because 'page' has
> certainly had put_page() called on it by then.  I had a brief period
> where I looked at moving put_page() away from being the filesystem's
> responsibility and into the iterator, but that would introduce more
> changes into the patchset, as well as causing problems for filesystems
> that want to break out of the loop.
>=20
> By this point, I was also looking at the readahead_for_each_batch()
> iterator that btrfs uses, and so we have the batch count anyway, and we
> might as well use it to store the number of subpages of the large page.
> And so it became easier to just put the whole ball of wax into the initia=
l
> patch set, rather than introduce the iterator now and then fix it up in
> the patch set that I'm basing on this.
>=20
> So yes, there's a certain amount of excess functionality in this patch
> set ... I can remove it for the next release.

I'd say "Just document it" as that was the main reason I noticed it.
Or perhaps add the batching function as a stand-alone patch so it's
clear that the batch interface solves two problems at once - large
pages and the btrfs page batching implementation...

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


