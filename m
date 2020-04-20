Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 64E791B0880
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Apr 2020 13:57:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587383846;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e75lWsvZ6+yAwYnTOlCVUqF/ycjxnJpWYLGNukCklEI=;
	b=B8pADqBwzfl2UGDArKMY0aUgiTvik8s7mXv/kncYXWpOu0QIk1g9WihVapJqJO4ZnfeD0p
	eP1wT86IRtpvuLkqzukUBMle6wKg73VbtXyiiNytnIMYzZFs8baUEheoTi/eazAUcxuYqX
	hOYgn43uF6nv66YzcbqYsSS/hV1o9gw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-3yxtSw2NO9CMv4E_zxIOoQ-1; Mon, 20 Apr 2020 07:57:14 -0400
X-MC-Unique: 3yxtSw2NO9CMv4E_zxIOoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32F38107ACCA;
	Mon, 20 Apr 2020 11:57:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A91A719C70;
	Mon, 20 Apr 2020 11:57:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E1E0418095FF;
	Mon, 20 Apr 2020 11:57:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KBv7OX015439 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 07:57:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 63C22272AF; Mon, 20 Apr 2020 11:57:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast03.extmail.prod.ext.phx2.redhat.com [10.5.110.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DB4526578
	for <cluster-devel@redhat.com>; Mon, 20 Apr 2020 11:57:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3040218B9FC8
	for <cluster-devel@redhat.com>; Mon, 20 Apr 2020 11:57:04 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-324-EBBMBSbgOCG5ZzBkRQQ7Lg-1; Mon, 20 Apr 2020 07:54:54 -0400
X-MC-Unique: EBBMBSbgOCG5ZzBkRQQ7Lg-1
Received: by mail-ej1-f67.google.com with SMTP id pg17so7661131ejb.9
	for <cluster-devel@redhat.com>; Mon, 20 Apr 2020 04:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Xz434+emhPfWjjKXYErvQLCog0qnyrqkr9U47Pj8EAE=;
	b=Wk6ct2L6ZeBHIjFIcV6pUtMva8jljV8CLs35ldauxOa+R/Gm3LxN9ir+iLr/ISD+xb
	K8+DTX+tZLebYwHzkJ3PmXoL3AXBAgZRR+Wp2tZbFBTP0qPfj3jWNs5cFbB9b4+4Fq8c
	dAhpgZRoIg2W5HTTm9oOfIM2+yN2ev3UguK2vC+b20rRXZ/XbCkXiAjHi2XuhhcZBK0e
	NT6mXrCOmbdrETMO2q+/EZ96Kt47muU1vDjWtnOQfm2Nmyi0x5YKkB8YIgp+rGLwerd3
	T4m33SiByDwjcdrRBXxax+58TuUcr6Z6PWKf5qtMp9R+ilFbgrAmxoYoPrrBPaKvLD3E
	qbew==
X-Gm-Message-State: AGi0Pubq4Tk8tthr83iS5iCix5ZfKygdSkVqN0JvHaf5goYxceP/Ic7C
	1aZfEkuXuvSrzgwzdFfVnfrIzK2EmkleA66CSVuyjg==
X-Google-Smtp-Source: APiQypLbTn+lSf9tXQjoSINzOkViouA+EuTM208dkpb3K/JiwqGLK/tHyeL8eS/wVDrlTm/f0ngTgrLv3Gua9FB3DGg=
X-Received: by 2002:a17:906:8549:: with SMTP id
	h9mr15204554ejy.145.1587383692787; 
	Mon, 20 Apr 2020 04:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-25-willy@infradead.org>
	<CAJfpegsZF=TFQ67vABkE5ghiZoTZF+=_u8tM5U_P6jZeAmv23A@mail.gmail.com>
	<20200420114300.GB5820@bombadil.infradead.org>
In-Reply-To: <20200420114300.GB5820@bombadil.infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 20 Apr 2020 13:54:41 +0200
Message-ID: <CAJfpeguKAbE+_=ctxp+_3gtbqADevMPrRQ1XV6t8AHXbKwDKvg@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03KBv7OX015439
X-loop: cluster-devel@redhat.com
Cc: linux-xfs <linux-xfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v11 24/25] fuse: Convert from readpages
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 1:43 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Apr 20, 2020 at 01:14:17PM +0200, Miklos Szeredi wrote:
> > > +       for (;;) {
> > > +               struct fuse_io_args *ia;
> > > +               struct fuse_args_pages *ap;
> > > +
> > > +               nr_pages =3D readahead_count(rac) - nr_pages;
> >
> > Hmm.  I see what's going on here, but it's confusing.   Why is
> > __readahead_batch() decrementing the readahead count at the start,
> > rather than at the end?
> >
> > At the very least it needs a comment about why nr_pages is calculated t=
his way.
>
> Because usually that's what we want.  See, for example, fs/mpage.c:
>
>         while ((page =3D readahead_page(rac))) {
>                 prefetchw(&page->flags);
>                 args.page =3D page;
>                 args.nr_pages =3D readahead_count(rac);
>                 args.bio =3D do_mpage_readpage(&args);
>                 put_page(page);
>         }
>
> fuse is different because it's trying to allocate for the next batch,
> not for the batch we're currently on.
>
> I'm a little annoyed because I posted almost this exact loop here:
>
> https://lore.kernel.org/linux-fsdevel/CAJfpegtrhGamoSqD-3Svfj3-iTdAbfD8TP=
44H_o+HE+g+CAnCA@mail.gmail.com/
>
> and you said "I think that's fine", modified only by your concern
> for it not being obvious that nr_pages couldn't be decremented by
> __readahead_batch(), so I modified the loop slightly to assign to
> nr_pages.  The part you're now complaining about is unchanged.

Your annoyance is perfectly understandable.   This is something I
noticed now, not back then.

>
> > > +               if (nr_pages > max_pages)
> > > +                       nr_pages =3D max_pages;
> > > +               if (nr_pages =3D=3D 0)
> > > +                       break;
> > > +               ia =3D fuse_io_alloc(NULL, nr_pages);
> > > +               if (!ia)
> > > +                       return;
> > > +               ap =3D &ia->ap;
> > > +               nr_pages =3D __readahead_batch(rac, ap->pages, nr_pag=
es);
> > > +               for (i =3D 0; i < nr_pages; i++) {
> > > +                       fuse_wait_on_page_writeback(inode,
> > > +                                                   readahead_index(r=
ac) + i);
> >
> > What's wrong with ap->pages[i]->index?  Are we trying to wean off using=
 ->index?
>
> It saves reading from a cacheline?  I wouldn't be surprised if the
> compiler hoisted the read from rac->_index to outside the loop and just
> iterated from rac->_index to rac->_index + nr_pages.

Hah, if such optimizations were worth anything with codepaths
involving roundtrips to userspace...

Anyway, I'll let these be, and maybe clean them up later.

Acked-by:  Miklos Szeredi <mszeredi@redhat.com>

Thanks,
Miklos


