Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EBE173F20F1
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Aug 2021 21:45:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629402325;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=N3r+VfJqTouzOa7Rijd4hTG7Toub9ezhbqH/xKVtdmY=;
	b=O4wLttj5p84DkYuQLZCiLkhTA66mDaKoTKfjXVdTUUdoCIOLmj1zdm4OKh+o4TuULtUvZr
	ZW3maV9gP50kndxtahkaZK/W1xh/eziTkWvWL+Crgw5QIYG12PNsFneyMmwP00Mx7xND6/
	tcypCDgzc75ZSoTXYoWkzefkoTfesB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-azD6WPGBPLSp6kj286Ne9g-1; Thu, 19 Aug 2021 15:45:24 -0400
X-MC-Unique: azD6WPGBPLSp6kj286Ne9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0D87760C0;
	Thu, 19 Aug 2021 19:45:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE7DD369A;
	Thu, 19 Aug 2021 19:45:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F34D9181A100;
	Thu, 19 Aug 2021 19:45:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17JJf6me014590 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 19 Aug 2021 15:41:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D42D107127; Thu, 19 Aug 2021 19:41:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78643107130
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 19:41:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B527803793
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 19:41:03 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-222-TpAWZlD0PXyfEqfMqLFDCg-1; Thu, 19 Aug 2021 15:41:02 -0400
X-MC-Unique: TpAWZlD0PXyfEqfMqLFDCg-1
Received: by mail-wr1-f71.google.com with SMTP id
	z1-20020adfdf810000b0290154f7f8c412so2057216wrl.21
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 12:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N3r+VfJqTouzOa7Rijd4hTG7Toub9ezhbqH/xKVtdmY=;
	b=Plhy8uD4eRCTqe8sbckt48aHjb1hxJ1sEAPKu6sVesXJM1TVvmRhFoXt5logp3B2tU
	El8ky6CN3ng4Ga1GNqm53ABZ7dh4+6L1LbZOY1fhPdHUe2hFMc7Y4EZrjO0z8rfpsWeh
	ecwh73h8rAdJM6pX8Gjc7xoVM6NG9c2coMshMBXD/v/Jln9m1HfisDc2H/dh8FYzjsAb
	DJrp10Dfg4FCTskCxIHh8I+8d0XcyOktI1wHS2F04uMIqonApKijyohC76VZ3UUZ/jne
	BvPK07BQ+cOW7fnjOaZNMcAwpXDAkQiqaX0kV1Kem3HjXpIfDB4FZTb82s7ijvy66ARc
	9wUg==
X-Gm-Message-State: AOAM531frSBGfAbK8HdkCXzBGmjV8fJGTHNiJWdwblPE5gD7nGxRpMH5
	WIW4Z5j72VgpqtMuHutURF0LGZ/hhQTDcNbK9g2Eex7FmXQ6c1BEBxNQzCfDUZLl7Rwx+rMwODL
	tDc6GBcV6pVTbKtk/gbMFzO5kOf36xUnb2XgO5Q==
X-Received: by 2002:a7b:c106:: with SMTP id w6mr296750wmi.152.1629402060759;
	Thu, 19 Aug 2021 12:41:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkJcXH65FWnZ1dP5/HoDmwcsHFn3hPhEUkK7xHddEwx16hWpY7f72bzjUNxESwyU+qX2gMS5ZSiNzWhC/qsKM=
X-Received: by 2002:a7b:c106:: with SMTP id w6mr296733wmi.152.1629402060505;
	Thu, 19 Aug 2021 12:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210803191818.993968-1-agruenba@redhat.com>
	<CAHk-=wj+_Y7NQ-NhhE0jk52c9ZB0VJbO1AjtMJFB8wP=PO+bdw@mail.gmail.com>
	<CAHc6FU6H5q20qiQ5FX1726i0FJHyh=Y46huWkCBZTR3sk+3Dhg@mail.gmail.com>
	<CAHk-=whBCm3G5yibbvQsTn00fA16a688NTU_geQV158DnRy+bQ@mail.gmail.com>
In-Reply-To: <CAHk-=whBCm3G5yibbvQsTn00fA16a688NTU_geQV158DnRy+bQ@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 19 Aug 2021 21:40:49 +0200
Message-ID: <CAHc6FU5HHFwuJBCNuU0e_N0ehaFrzbUrCuTJyaLNC4qxwfazYA@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v5 00/12] gfs2: Fix mmap + page fault
	deadlocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 18, 2021 at 11:49 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> [ Sorry for the delay, I was on the road and this fell through the cracks ]

No harm done, I was busy enough implementing your previous suggestions.

> On Mon, Aug 16, 2021 at 12:14 PM Andreas Gruenbacher
> <agruenba@redhat.com> wrote:
> >
> > On Tue, Aug 3, 2021 at 9:45 PM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > Hmm. Have you tried to figure out why that "still returns 0" happens?
> >
> > The call stack is:
> >
> > gup_pte_range
> > gup_pmd_range
> > gup_pud_range
> > gup_p4d_range
> > gup_pgd_range
> > lockless_pages_from_mm
> > internal_get_user_pages_fast
> > get_user_pages_fast
> > iov_iter_get_pages
> > __bio_iov_iter_get_pages
> > bio_iov_iter_get_pages
> > iomap_dio_bio_actor
> > iomap_dio_actor
> > iomap_apply
> > iomap_dio_rw
> > gfs2_file_direct_write
> >
> > In gup_pte_range, pte_special(pte) is true and so we return 0.
>
> Ok, so that is indeed something that the fast-case can't handle,
> because some of the special code wants to have the mm_lock so that it
> can look at the vma flags (eg "vm_normal_page()" and friends.
>
> That said, some of these cases even the full GUP won't ever handle,
> simply because a mapping doesn't necessarily even _have_ a 'struct
> page' associated with it if it's a VM_IO mapping.
>
> So it turns out that you can't just always do
> fault_in_iov_iter_readable() and then assume that you can do
> iov_iter_get_pages() and repeat until successful.
>
> We could certainly make get_user_pages_fast() handle a few more cases,
> but I get the feeling that we need to have separate error cases for
> EFAULT - no page exists - and the "page exists, but cannot be mapped
> as a 'struct page'" case.

Hmm, what if GUP is made to skip VM_IO vmas without adding anything to
the pages array? That would match fault_in_iov_iter_writeable, which
is modeled after __mm_populate and which skips VM_IO and VM_PFNMAP
vmas.

The other strategy I've added is to scale back the page fault windows
to a single page if faulting in multiple pages didn't help, and to
give up if the I/O operation still fails after that. So pathological
cases won't loop indefinitely anymore at least.

> I also do still think that even regardless of that, we want to just
> add a FOLL_NOFAULT flag that just disables calling handle_mm_fault(),
> and then you can use the regular get_user_pages().
>
> That at least gives us the full _normal_ page handling stuff.

And it does fix the generic/208 failure.

Thanks,
Andreas

