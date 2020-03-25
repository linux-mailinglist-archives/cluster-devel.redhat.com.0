Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 089E8192D85
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Mar 2020 16:55:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585151710;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4vNd0XHgwPblcmQbQRhJqjghf10lxOKC/4/Rz3lGWKE=;
	b=Fxh4hFvNDEmNOsQt5OBHr/ZwYpEUzIjdgpb+BHM5Ip6s7ylz93d0JqFtIHCrQm5XZnvtmC
	Gn9nN/CGwCFi3ZZ3o6arOxsRnRHW9tNmorW/qxYhz6GbktgmJjmFPp459AbcDGGWm9v1ld
	E25zgBOKh9yPxlJoMiqIxebcUtlFzXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-d1gPfHzBPGyPjLPxtuFHAg-1; Wed, 25 Mar 2020 11:55:09 -0400
X-MC-Unique: d1gPfHzBPGyPjLPxtuFHAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5FB8801E6D;
	Wed, 25 Mar 2020 15:55:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0538989E76;
	Wed, 25 Mar 2020 15:55:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD689863A3;
	Wed, 25 Mar 2020 15:55:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02PFt0Kk013172 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 11:55:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 726742026D67; Wed, 25 Mar 2020 15:55:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E8AB2022EA5
	for <cluster-devel@redhat.com>; Wed, 25 Mar 2020 15:54:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 376938007DC
	for <cluster-devel@redhat.com>; Wed, 25 Mar 2020 15:54:58 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-194-99e3RqNbNNOzQ7rpH4OEHQ-1; Wed, 25 Mar 2020 11:54:55 -0400
X-MC-Unique: 99e3RqNbNNOzQ7rpH4OEHQ-1
Received: by mail-io1-f67.google.com with SMTP id a20so2674575ioo.13
	for <cluster-devel@redhat.com>; Wed, 25 Mar 2020 08:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WUvTsX9+jdPoLTOSHShSbaoohqGvLnmJWJx3goFYuLM=;
	b=JZ29Z2BoyZixL09UpABS/F+KHn/wm0qBpX72NY5T2tJN/g4Jqz0NSGMDLgicZmH7a6
	2KNbIxvENgDqJV+khLA/WjljEaz0WV6iQYCq2CPmRf1RDZUAvyTWUgNAl4SRyehZjzjI
	L+BRjLFfXfGo57M4MI7K5jHYaL8slVMLGCgqVxaMLLS/f3v/RZw/b7Qy2COvR3fT12lf
	dgEfqYXnOZFFNUqanrrgC84Uj8McXCrczLGgkf7yBSr3AxXWj5cfXdR93U+zBbJ68gO6
	39LeGxEJfFunjcv7SYLCOubp5u6wy84d0sJTugGOXzmeNYDgI1aBwnYHncJqz0jFTvIt
	18Zg==
X-Gm-Message-State: ANhLgQ12YmUVd9y9QRDSAMI6dy6NDYP+OS6OaYK1lr9zlZmz5FOzu2tF
	gtyFx0tX0zlREVMqPR3gF6Exrwhj/5wKMwwLgTg9LQ==
X-Google-Smtp-Source: ADFU+vtWPrSX9gO9pLLxpavehCkl/CaKr8w3OI8WID1sZHiGcDBmq2nlMdLwxJGUo5kQXivDvVBrGhSFup9s33zQy+o=
X-Received: by 2002:a5d:9142:: with SMTP id y2mr3418704ioq.185.1585151694868; 
	Wed, 25 Mar 2020 08:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200323202259.13363-1-willy@infradead.org>
	<20200323202259.13363-25-willy@infradead.org>
	<CAJfpegu7EFcWrg3bP+-2BX_kb52RrzBCo_U3QKYzUkZfe4EjDA@mail.gmail.com>
	<20200325120254.GA22483@bombadil.infradead.org>
	<CAJfpegshssCJiA8PBcq2XvBj3mR8dufHb0zWRFvvKKv82VQYsw@mail.gmail.com>
	<20200325153228.GB22483@bombadil.infradead.org>
In-Reply-To: <20200325153228.GB22483@bombadil.infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 25 Mar 2020 16:54:43 +0100
Message-ID: <CAJfpegtrhGamoSqD-3Svfj3-iTdAbfD8TP44H_o+HE+g+CAnCA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02PFt0Kk013172
X-loop: cluster-devel@redhat.com
Cc: linux-xfs <linux-xfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v10 24/25] fuse: Convert from readpages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 4:32 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Mar 25, 2020 at 03:43:02PM +0100, Miklos Szeredi wrote:
> > >
> > > -       while ((page =3D readahead_page(rac))) {
> > > -               if (fuse_readpages_fill(&data, page) !=3D 0)
> > > +               nr_pages =3D min(readahead_count(rac), fc->max_pages)=
;
> >
> > Missing fc->max_read clamp.
>
> Yeah, I realised that.  I ended up doing ...
>
> +       unsigned int i, max_pages, nr_pages =3D 0;
> ...
> +       max_pages =3D min(fc->max_pages, fc->max_read / PAGE_SIZE);
>
> > > +               ia =3D fuse_io_alloc(NULL, nr_pages);
> > > +               if (!ia)
> > >                         return;
> > > +               ap =3D &ia->ap;
> > > +               __readahead_batch(rac, ap->pages, nr_pages);
> >
> > nr_pages =3D __readahead_batch(...)?
>
> That's the other bug ... this was designed for btrfs which has a fixed-si=
ze
> buffer.  But you want to dynamically allocate fuse_io_args(), so we need =
to
> figure out the number of pages beforehand, which is a little awkward.  I'=
ve
> settled on this for the moment:
>
>         for (;;) {
>                struct fuse_io_args *ia;
>                 struct fuse_args_pages *ap;
>
>                 nr_pages =3D readahead_count(rac) - nr_pages;
>                 if (nr_pages > max_pages)
>                         nr_pages =3D max_pages;
>                 if (nr_pages =3D=3D 0)
>                         break;
>                 ia =3D fuse_io_alloc(NULL, nr_pages);
>                 if (!ia)
>                         return;
>                 ap =3D &ia->ap;
>                 __readahead_batch(rac, ap->pages, nr_pages);
>                 for (i =3D 0; i < nr_pages; i++) {
>                         fuse_wait_on_page_writeback(inode,
>                                                     readahead_index(rac) =
+ i);
>                         ap->descs[i].length =3D PAGE_SIZE;
>                 }
>                 ap->num_pages =3D nr_pages;
>                 fuse_send_readpages(ia, rac->file);
>         }
>
> but I'm not entirely happy with that either.  Pondering better options.

I think that's fine.   Note how the original code possibly
over-allocates the the page array, because it doesn't know the batch
size beforehand.  So this is already better.

>
> > This will give consecutive pages, right?
>
> readpages() was already being called with consecutive pages.  Several
> filesystems had code to cope with the pages being non-consecutive, but
> that wasn't how the core code worked; if there was a discontiguity it
> would send off the pages that were consecutive and start a new batch.
>
> __readahead_batch() can't return fewer than nr_pages, so you don't need
> to check for that.

That's far from obvious.

I'd put a WARN_ON at least to make document the fact.

Thanks,
Miklos


