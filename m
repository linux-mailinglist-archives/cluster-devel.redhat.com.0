Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC593F225B
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Aug 2021 23:40:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629409220;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=DvdcXZIwl3tPZt3OBpuE3xqKVNbMTKzJBp4rw8ENU30=;
	b=Sn8iGhnIvz3RwW8KOeEAis8eGbJZZevoz+Pmmz4wSivj6tOW0xmX0Hdx+cAZlPcX2SNNEC
	ToremKCVo81iUmRHxOhmewD/G+5b7VtHI3yExhb151bcToHxoKfneauip1vMU4fEXPCO2z
	xK4fPNoyfi9SHYVq8AzpNUFTdBJZu70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491--rnDLGMgMUWNmXasS_mDJg-1; Thu, 19 Aug 2021 17:40:19 -0400
X-MC-Unique: -rnDLGMgMUWNmXasS_mDJg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18178107ACF5;
	Thu, 19 Aug 2021 21:40:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF1DD604CC;
	Thu, 19 Aug 2021 21:40:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 872F5181A0F7;
	Thu, 19 Aug 2021 21:40:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17JLeEW4023986 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 19 Aug 2021 17:40:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 158B3107530; Thu, 19 Aug 2021 21:40:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D684107668
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 21:40:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3855800677
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 21:40:10 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-365-EL9tQYqQMxqYTqbVPobdXA-1; Thu, 19 Aug 2021 17:40:09 -0400
X-MC-Unique: EL9tQYqQMxqYTqbVPobdXA-1
Received: by mail-wr1-f70.google.com with SMTP id
	z2-20020adff1c20000b0290154f60e3d2aso2150067wro.23
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 14:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DvdcXZIwl3tPZt3OBpuE3xqKVNbMTKzJBp4rw8ENU30=;
	b=sTjdiO94DYi/h3fLXCNzE86a0vv8dcbtgWqN4a3Aks4lauBJm0QcAS9qBm2XyJPVfA
	lhPR03O6DV11r7qBUXl1XRF4tGc1k/V1OGLW+VmWEVfpFIuusECKTjQO8ojCk4O7oV5X
	jXyreekdS+rpJ1DbtdOQzO82sYFBVxtrSf3SDdyf7zhvACY2dQxJ7vqpybukNx1F54X6
	wJwWMWBo3H5k9b5lXT0gzfRX95rypttzzlKmrnHxaiFPpBf3KJdiKI7WmhihDC1F5HaF
	NN456Hgp4M+uJk0q8k1/gVyDXhpfGWq6icqEOrQyvEOncImcPw9z43wGOn/vruvBP8VX
	ylJA==
X-Gm-Message-State: AOAM533fQO27sjRi0AghQ3ZuAtyC86JQfFM2xqBVilACZhplnbBep7KH
	yWuKvv5uSqqw1mgQVyOKcyFMjo5ULtBxaNH90jz3R9WMzur+Ty1ZC251tnHTk3gxi3e8amfNx8q
	NeEsc2qY0UymEZ+K/2ekV0aTcii1QxQoyoMtvJQ==
X-Received: by 2002:a1c:7916:: with SMTP id l22mr623011wme.27.1629409208119;
	Thu, 19 Aug 2021 14:40:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYA97+cGFeqU43YBkPI260mv8aQOOw6JSQmOGyumgFbyOD0nefEq4MgAFBQrx6D74nVITzdNSFMePqB4OBxCo=
X-Received: by 2002:a1c:7916:: with SMTP id l22mr622994wme.27.1629409207884;
	Thu, 19 Aug 2021 14:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210803191818.993968-1-agruenba@redhat.com>
	<CAHk-=wj+_Y7NQ-NhhE0jk52c9ZB0VJbO1AjtMJFB8wP=PO+bdw@mail.gmail.com>
	<CAHc6FU6H5q20qiQ5FX1726i0FJHyh=Y46huWkCBZTR3sk+3Dhg@mail.gmail.com>
	<CAHk-=whBCm3G5yibbvQsTn00fA16a688NTU_geQV158DnRy+bQ@mail.gmail.com>
	<CAHc6FU5HHFwuJBCNuU0e_N0ehaFrzbUrCuTJyaLNC4qxwfazYA@mail.gmail.com>
	<CAHk-=wgumKBhggjyR7Ff6V8VKxaJK1yA-LpWdzZFSqFyqYq0Dw@mail.gmail.com>
In-Reply-To: <CAHk-=wgumKBhggjyR7Ff6V8VKxaJK1yA-LpWdzZFSqFyqYq0Dw@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 19 Aug 2021 23:39:56 +0200
Message-ID: <CAHc6FU6a8SLmHfMoS7NUDKboWpVEGBKyC46pU_brx3y8crbEXA@mail.gmail.com>
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

On Thu, Aug 19, 2021 at 10:14 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, Aug 19, 2021 at 12:41 PM Andreas Gruenbacher
> <agruenba@redhat.com> wrote:
> >
> > Hmm, what if GUP is made to skip VM_IO vmas without adding anything to
> > the pages array? That would match fault_in_iov_iter_writeable, which
> > is modeled after __mm_populate and which skips VM_IO and VM_PFNMAP
> > vmas.
>
> I don't understand what you mean.. GUP already skips VM_IO (and
> VM_PFNMAP) pages. It just returns EFAULT.
>
> We could make it return another error. We already have DAX and
> FOLL_LONGTERM returning -EOPNOTSUPP.
>
> Of course, I think some code ends up always just returning "number of
> pages looked up" and might return 0 for "no pages" rather than the
> error for the first page.
>
> So we may end up having interfaces that then lose that explanation
> error code, but I didn't check.
>
> But we couldn't make it just say "skip them and try later addresses",
> if that is what you meant. THAT makes no sense - that would just make
> GUP look up some other address than what was asked for.

get_user_pages has a start and a nr_pages argument, which specifies an
address range from start to start + nr_pages * PAGE_SIZE. If pages !=
NULL, it adds a pointer to that array for each PAGE_SIZE subpage. I
was thinking of skipping over VM_IO vmas in that process, so when the
range starts in a mappable vma, runs into a VM_IO vma, and ends in a
mappable vma, the pages in the pages array would be discontiguous;
they would only cover the mappable vmas. But that would make it
difficult to make sense of what's in the pages array. So scratch that
idea.

> > > I also do still think that even regardless of that, we want to just
> > > add a FOLL_NOFAULT flag that just disables calling handle_mm_fault(),
> > > and then you can use the regular get_user_pages().
> > >
> > > That at least gives us the full _normal_ page handling stuff.
> >
> > And it does fix the generic/208 failure.
>
> Good. So I think the approach is usable, even if we might have corner
> cases left.
>
> So I think the remaining issue is exactly things like VM_IO and
> VM_PFNMAP. Do the fstests have test-cases for things like this? It
> _is_ quite specialized, it might be a good idea to have that.
>
> Of course, doing direct-IO from special memory regions with zerocopy
> might be something special people actually want to do. But I think
> we've had that VM_IO flag testing there basically forever, so I don't
> think it has ever worked (for some definition of "ever").

The v6 patch queue should handle those cases acceptably well for now,
but I don't think we have tests covering that at all.

Thanks,
Andreas

