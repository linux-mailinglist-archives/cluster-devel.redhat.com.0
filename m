Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 42DFC3FA145
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Aug 2021 23:50:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-WM9Ddx8XPRWf_gpapAsuRA-1; Fri, 27 Aug 2021 17:50:21 -0400
X-MC-Unique: WM9Ddx8XPRWf_gpapAsuRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E22E6100E322;
	Fri, 27 Aug 2021 21:50:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DE9D60C81;
	Fri, 27 Aug 2021 21:50:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2DF40181A0F1;
	Fri, 27 Aug 2021 21:50:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RLoCQa031323 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 17:50:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BCC251A9211; Fri, 27 Aug 2021 21:50:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B424A1A920A
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 21:50:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9D7B800883
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 21:50:09 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-541-OGF2Pnb9Pvqsazu45IsdmQ-1; Fri, 27 Aug 2021 17:50:05 -0400
X-MC-Unique: OGF2Pnb9Pvqsazu45IsdmQ-1
Received: by mail-io1-f46.google.com with SMTP id n24so10482214ion.10;
	Fri, 27 Aug 2021 14:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+KgsOnOEWi0MydDQEQeoijmzmgKNc1F+KLYNS6ypl+A=;
	b=an3H6t6out6e3hiDb0yV1of4rfENjtXicgMnKgXSRR442D5KIJnhgmHSpik134QOy7
	SAekFCvCZIhoh/A1gM4QHEEOTWxCiIQKwvBFMPny4vQLd7hb8eVSjs+zZVS/l30+DYmz
	PQ0PZEXrHKLJcwNZArGRZz51Ajc1zK5RbUvMKa8Vah+OqD91AroDbE1TZUZJZIO7dmeM
	5fkhWzUZdNBduV8+HoespYICBHzJzhsX5xjFVF3XPM8HgKq9HqUXXgj/lmLoeApOJdNP
	9C5dSHXTWT0aW/qKGBCGL+f1HNqV8NZc1uqe1q8412lZ/s5XDgn5OcgjqkMshY446ZlH
	cJ3w==
X-Gm-Message-State: AOAM530GJQTcZdzlmBcecs0qZj6fnkFbrVVcd1kgKKMMHSZZ+pMauJd5
	Y4f+qPAlDmGgmTOpRjJAulRx17p9QIlND3ASxJt+UjhGz+Q=
X-Google-Smtp-Source: ABdhPJzJRGOyoNLCUh6UJoKqoQ4Dj1Fl+MXsZg1MLQAg7cot2efKXxtZYUDwPF993DcRv83yJHOc/5bL3LKXA7e/b5o=
X-Received: by 2002:a02:cf05:: with SMTP id q5mr9936733jar.132.1630101004796; 
	Fri, 27 Aug 2021 14:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-17-agruenba@redhat.com>
	<20210827183018.GJ12664@magnolia>
	<CAHc6FU44mGza=G4prXh08=RJZ0Wu7i6rBf53BjURj8oyX5Q8iA@mail.gmail.com>
	<20210827213239.GH12597@magnolia>
In-Reply-To: <20210827213239.GH12597@magnolia>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Fri, 27 Aug 2021 23:49:52 +0200
Message-ID: <CAHpGcMKwQCFOGgmA4pQBLNL8Q-uoX2AGBLsW19aRrv0d_UDrcw@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 16/19] iomap: Add done_before
	argument to iomap_dio_rw
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Fr., 27. Aug. 2021 um 23:33 Uhr schrieb Darrick J. Wong <djwong@kernel.org>:
> On Fri, Aug 27, 2021 at 10:15:11PM +0200, Andreas Gruenbacher wrote:
> > On Fri, Aug 27, 2021 at 8:30 PM Darrick J. Wong <djwong@kernel.org> wrote:
> > > On Fri, Aug 27, 2021 at 06:49:23PM +0200, Andreas Gruenbacher wrote:
> > > > Add a done_before argument to iomap_dio_rw that indicates how much of
> > > > the request has already been transferred.  When the request succeeds, we
> > > > report that done_before additional bytes were tranferred.  This is
> > > > useful for finishing a request asynchronously when part of the request
> > > > has already been completed synchronously.
> > > >
> > > > We'll use that to allow iomap_dio_rw to be used with page faults
> > > > disabled: when a page fault occurs while submitting a request, we
> > > > synchronously complete the part of the request that has already been
> > > > submitted.  The caller can then take care of the page fault and call
> > > > iomap_dio_rw again for the rest of the request, passing in the number of
> > > > bytes already tranferred.
> > > >
> > > > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > > > ---
> > > >  fs/btrfs/file.c       |  5 +++--
> > > >  fs/ext4/file.c        |  5 +++--
> > > >  fs/gfs2/file.c        |  4 ++--
> > > >  fs/iomap/direct-io.c  | 11 ++++++++---
> > > >  fs/xfs/xfs_file.c     |  6 +++---
> > > >  fs/zonefs/super.c     |  4 ++--
> > > >  include/linux/iomap.h |  4 ++--
> > > >  7 files changed, 23 insertions(+), 16 deletions(-)
> > > >
> > >
> > > <snip to the interesting parts>
> > >
> > > > diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> > > > index ba88fe51b77a..dcf9a2b4381f 100644
> > > > --- a/fs/iomap/direct-io.c
> > > > +++ b/fs/iomap/direct-io.c
> > > > @@ -31,6 +31,7 @@ struct iomap_dio {
> > > >       atomic_t                ref;
> > > >       unsigned                flags;
> > > >       int                     error;
> > > > +     size_t                  done_before;
> > > >       bool                    wait_for_completion;
> > > >
> > > >       union {
> > > > @@ -126,6 +127,9 @@ ssize_t iomap_dio_complete(struct iomap_dio *dio)
> > > >       if (ret > 0 && (dio->flags & IOMAP_DIO_NEED_SYNC))
> > > >               ret = generic_write_sync(iocb, ret);
> > > >
> > > > +     if (ret > 0)
> > > > +             ret += dio->done_before;
> > >
> > > Pardon my ignorance since this is the first time I've had a crack at
> > > this patchset, but why is it necessary to carry the "bytes copied"
> > > count from the /previous/ iomap_dio_rw call all the way through to dio
> > > completion of the current call?
> >
> > Consider the following situation:
> >
> >  * A user submits an asynchronous read request.
> >
> >  * The first page of the buffer is in memory, but the following
> >    pages are not. This isn't uncommon for consecutive reads
> >    into freshly allocated memory.
> >
> >  * iomap_dio_rw writes into the first page. Then it
> >    hits the next page which is missing, so it returns a partial
> >    result, synchronously.
> >
> >  * We then fault in the remaining pages and call iomap_dio_rw
> >    for the rest of the request.
> >
> >  * The rest of the request completes asynchronously.
> >
> > Does that answer your question?
>
> No, because you totally ignored the second question:
>
> If the directio operation succeeds even partially and the PARTIAL flag
> is set, won't that push the iov iter ahead by however many bytes
> completed?

Yes, exactly as it should.

> We already finished the IO for the first page, so the second attempt
> should pick up where it left off, i.e. the second page.

Yes, so what's the question?

Thanks,
Andreas

