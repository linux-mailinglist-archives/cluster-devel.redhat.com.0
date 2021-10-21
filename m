Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B01EF4357F2
	for <lists+cluster-devel@lfdr.de>; Thu, 21 Oct 2021 02:51:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634777471;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RnbsxEzrdrUAsHTCfQyfUCY1UIJ3Uc7kpANnFXb7TzE=;
	b=MopjXHKhWbMg0LZOrW2R0FWKTMbTc+I2ACN+bTZvJDD5Uu5waZ0Ptqy4w+oed0d4nrIuvU
	eyK2uRE/O0V9eS+PsD8ZpZrvoTEWaVajT/R4eeotVS8WG67foszbJoEzUkhFUybdHlC0rw
	l+mI8m8TgNiEpFAwOX4Lm6rRDRZ1kTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-F4EM2AA_MI6BBFx2WSkJdQ-1; Wed, 20 Oct 2021 20:51:08 -0400
X-MC-Unique: F4EM2AA_MI6BBFx2WSkJdQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08A1D1006AA6;
	Thu, 21 Oct 2021 00:51:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DD1D5DF21;
	Thu, 21 Oct 2021 00:51:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 659BC4A703;
	Thu, 21 Oct 2021 00:51:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19L0kTEH027505 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 20:46:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6997311558B5; Thu, 21 Oct 2021 00:46:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 652E611558B4
	for <cluster-devel@redhat.com>; Thu, 21 Oct 2021 00:46:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 943E3811E76
	for <cluster-devel@redhat.com>; Thu, 21 Oct 2021 00:46:26 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-556-6qf3gb7vNk2YRXFxMbX84w-1; Wed, 20 Oct 2021 20:46:23 -0400
X-MC-Unique: 6qf3gb7vNk2YRXFxMbX84w-1
Received: by mail-wm1-f69.google.com with SMTP id
	g4-20020a1c9d04000000b0030dd4dd6659so1176245wme.3
	for <cluster-devel@redhat.com>; Wed, 20 Oct 2021 17:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GgRzGZvlhKco4vdRDM+mmGlMh4qaw7uLRwsJYM91KRo=;
	b=zSioNm+8+juo0k1TkSSQmaTO3LvfyVV8JEQi/e1ZITTQXvLXBiCDfZg4fuz6+vDwEX
	Vbsy3lHVe3DddI39Hxrxvp/1axew0mAwbXqtIwUF94bhLtIJr1tV0OeDoweaUElpPWDB
	a6BXGQeFn+PpY+36bMdRWgVpAAEtPPs//V+FJ9jf2n4WdIigT1KiJ9qqx4SS9aqVhhAq
	NEvdSzaWJC+DYyL9U4BliGqvDSgQbDsNzsnBCcYOh8agoDhli9ww70+exAE6+YXq61aC
	fcs2u3gVuHVNgyfqIkamlj1bq6d6FOmYU3InzBky/M8P6LoDFRof6kyYKTxzxwGrsOIr
	lMoQ==
X-Gm-Message-State: AOAM533owXjPLCLQRLgY/p9e2ipS8vSj/Cn3NGsQuI4oFyAG3R0G9t9i
	vBlDpxABODDLxHSjGRMLtSHeyPs06aYUWRG2R4NSPqB49+I/TJFXUeyMhSbGm8Nf49eN7E+wGN2
	+c4jsjDwhTv9v+MkEK9xuyuDvHzcexDD3k9sn3A==
X-Received: by 2002:a1c:4e10:: with SMTP id g16mr588666wmh.128.1634777182160; 
	Wed, 20 Oct 2021 17:46:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRGyQwuX0RWsnHGQyYi/ngKg0rwoZsofzx0FO8yb5Tm0XYCRffyxkRLT6pbnH1pATha3ETgfDhMtMfli9BWdA=
X-Received: by 2002:a1c:4e10:: with SMTP id g16mr588649wmh.128.1634777181923; 
	Wed, 20 Oct 2021 17:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wh5p6zpgUUoY+O7e74X9BZyODhnsqvv=xqnTaLRNj3d_Q@mail.gmail.com>
	<YSk7xfcHVc7CxtQO@zeniv-ca.linux.org.uk>
	<CAHk-=wjMyZLH+ta5SohAViSc10iPj-hRnHc-KPDoj1XZCmxdBg@mail.gmail.com>
	<YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
	<YSqOUb7yZ7kBoKRY@zeniv-ca.linux.org.uk> <YS40qqmXL7CMFLGq@arm.com>
	<YS5KudP4DBwlbPEp@zeniv-ca.linux.org.uk> <YWR2cPKeDrc0uHTK@arm.com>
	<CAHk-=wjvQWj7mvdrgTedUW50c2fkdn6Hzxtsk-=ckkMrFoTXjQ@mail.gmail.com>
	<YWSnvq58jDsDuIik@arm.com>
	<CAHk-=wiNWOY5QW5ZJukt_9pHTWvrJhE2=DxPpEtFHAWdzOPDTg@mail.gmail.com>
In-Reply-To: <CAHk-=wiNWOY5QW5ZJukt_9pHTWvrJhE2=DxPpEtFHAWdzOPDTg@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 21 Oct 2021 02:46:10 +0200
Message-ID: <CAHc6FU7bpjAxP+4dfE-C0pzzQJN1p=C2j3vyXwUwf7fF9JF72w@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Josef Bacik <josef@toxicpanda.com>,
	Al Viro <viro@zeniv.linux.org.uk>, "Darrick J. Wong" <djwong@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Will Deacon <will@kernel.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Cluster-devel] [RFC][arm64] possible infinite loop in btrfs
	search_ioctl()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 12, 2021 at 1:59 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Mon, Oct 11, 2021 at 2:08 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> >
> > +#ifdef CONFIG_ARM64_MTE
> > +#define FAULT_GRANULE_SIZE     (16)
> > +#define FAULT_GRANULE_MASK     (~(FAULT_GRANULE_SIZE-1))
>
> [...]
>
> > If this looks in the right direction, I'll do some proper patches
> > tomorrow.
>
> Looks fine to me. It's going to be quite expensive and bad for caches, though.
>
> That said, fault_in_writable() is _supposed_ to all be for the slow
> path when things go south and the normal path didn't work out, so I
> think it's fine.

Let me get back to this; I'm actually not convinced that we need to
worry about sub-page-size fault granules in fault_in_pages_readable or
fault_in_pages_writeable.

>From a filesystem point of view, we can get into trouble when a
user-space read or write triggers a page fault while we're holding
filesystem locks, and that page fault ends up calling back into the
filesystem. To deal with that, we're performing those user-space
accesses with page faults disabled. When a page fault would occur, we
get back an error instead, and then we try to fault in the offending
pages. If a page is resident and we still get a fault trying to access
it, trying to fault in the same page again isn't going to help and we
have a true error. We're clearly looking at memory at a page
granularity; faults at a sub-page level don't matter at this level of
abstraction (but they do show similar error behavior). To avoid
getting stuck, when it gets a short result or -EFAULT, the filesystem
implements the following backoff strategy: first, it tries to fault in
a number of pages. When the read or write still doesn't make progress,
it scales back and faults in a single page. Finally, when that still
doesn't help, it gives up. This strategy is needed for actual page
faults, but it also handles sub-page faults appropriately as long as
the user-space access functions give sensible results.

What am I missing?

Thanks,
Andreas

> I do wonder how the sub-page granularity works. Is it sufficient to
> just read from it? Because then a _slightly_ better option might be to
> do one write per page (to catch page table writability) and then one
> read per "granule" (to catch pointer coloring or cache poisoning
> issues)?
>
> That said, since this is all preparatory to us wanting to write to it
> eventually anyway, maybe marking it all dirty in the caches is only
> good.
>
>                 Linus
>

