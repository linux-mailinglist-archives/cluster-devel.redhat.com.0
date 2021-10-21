Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 13026436498
	for <lists+cluster-devel@lfdr.de>; Thu, 21 Oct 2021 16:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634827424;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=SmEzbXtfEVt2BpM7wSrp23JreLNUFM7GXMWeh1u9ztI=;
	b=Xe0c4yYQ6YK4OHQ9CuxBf9Tn2xOB0a726YsuW3lpGHXmNdJdI87VsUOYFvS7etLKnzTN5h
	NwAW/+UCn7jg6juP/TPHH7721zKOEPItvbqKMy15dJJl8JOlW7pvgGj5kblgc+sLJNp9T8
	hFnC15ikbr0F2K3ac5uTrxm21Oou2eE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-CX1T630TO32WrYPl-IwZIA-1; Thu, 21 Oct 2021 10:43:41 -0400
X-MC-Unique: CX1T630TO32WrYPl-IwZIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4804C100CFBD;
	Thu, 21 Oct 2021 14:43:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BA5A5F4F5;
	Thu, 21 Oct 2021 14:43:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40FDC4E58F;
	Thu, 21 Oct 2021 14:43:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19LEgtFW029279 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 21 Oct 2021 10:42:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1439621568B5; Thu, 21 Oct 2021 14:42:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D6BC21568B2
	for <cluster-devel@redhat.com>; Thu, 21 Oct 2021 14:42:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 844B61066559
	for <cluster-devel@redhat.com>; Thu, 21 Oct 2021 14:42:47 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-209-nsh2_nwfPg-MX9-1eO_hiQ-1; Thu, 21 Oct 2021 10:42:46 -0400
X-MC-Unique: nsh2_nwfPg-MX9-1eO_hiQ-1
Received: by mail-wm1-f71.google.com with SMTP id
	s3-20020a1ca903000000b0032326edebe1so669626wme.2
	for <cluster-devel@redhat.com>; Thu, 21 Oct 2021 07:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SmEzbXtfEVt2BpM7wSrp23JreLNUFM7GXMWeh1u9ztI=;
	b=z+R7eiTMbsCsdqgxf54UGVwVq+z9t01K4f22QB5Dd/MUAnxCAKYRbAn5IvCP/Osmb/
	0/0olu3ENhaeCAGiBk7WLN2phUGCfbMXRF6i0FFiHAqsH6nAi+jwQg91+nWzR1JMEgoG
	MWdHJbtmbmnzr/szTJJG84zIP9yax2lOHOicACwdYMGZgiKEZy4uKfdcOyRtE/llnxfW
	jKGF9Koy6tqsCzwYHWzydBthU5WyUC4Oz+wZlyjD3fDgL3qGIplXHN9DbmIhF56Emguo
	RxtXLM0+T4nNYCAtzkFvSceoJk80m8JfL4dftsVXwH2rmtmbmJHcgLgz+9irW+vcJxkQ
	knoQ==
X-Gm-Message-State: AOAM533VR5hwfbhOX8DKfPh9wx5+VkCzwMtcWluqTHjQRZWvs3WCi/a1
	FLfsUYMqvhvURUktCsBy0cYvMI8cX15oCUpiuHh1RahBri+jCpSj2cDKjaoOG/IRZMm+ZvUiO47
	K+4UQyQRfoT69MTlLRxei442sFhvrewip+z5ahQ==
X-Received: by 2002:adf:c78d:: with SMTP id l13mr7544008wrg.134.1634827364923; 
	Thu, 21 Oct 2021 07:42:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe9FbtIjQkoQAdC+TPuURhpm/wOA+DZOJl2uKRFfWKCj35F5i6OVE+TEzdARceI4I8WSyqjU9LUZpNOmPkJLM=
X-Received: by 2002:adf:c78d:: with SMTP id l13mr7543974wrg.134.1634827364652; 
	Thu, 21 Oct 2021 07:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
	<YSqOUb7yZ7kBoKRY@zeniv-ca.linux.org.uk> <YS40qqmXL7CMFLGq@arm.com>
	<YS5KudP4DBwlbPEp@zeniv-ca.linux.org.uk> <YWR2cPKeDrc0uHTK@arm.com>
	<CAHk-=wjvQWj7mvdrgTedUW50c2fkdn6Hzxtsk-=ckkMrFoTXjQ@mail.gmail.com>
	<YWSnvq58jDsDuIik@arm.com>
	<CAHk-=wiNWOY5QW5ZJukt_9pHTWvrJhE2=DxPpEtFHAWdzOPDTg@mail.gmail.com>
	<CAHc6FU7bpjAxP+4dfE-C0pzzQJN1p=C2j3vyXwUwf7fF9JF72w@mail.gmail.com>
	<YXE7fhDkqJbfDk6e@arm.com>
In-Reply-To: <YXE7fhDkqJbfDk6e@arm.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 21 Oct 2021 16:42:33 +0200
Message-ID: <CAHc6FU5xTMOxuiEDyc9VO_V98=bvoDc-0OFi4jsGPgWJWjRJWQ@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Will Deacon <will@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Josef Bacik <josef@toxicpanda.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 21, 2021 at 12:06 PM Catalin Marinas
<catalin.marinas@arm.com> wrote:
> On Thu, Oct 21, 2021 at 02:46:10AM +0200, Andreas Gruenbacher wrote:
> > On Tue, Oct 12, 2021 at 1:59 AM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > > On Mon, Oct 11, 2021 at 2:08 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > >
> > > > +#ifdef CONFIG_ARM64_MTE
> > > > +#define FAULT_GRANULE_SIZE     (16)
> > > > +#define FAULT_GRANULE_MASK     (~(FAULT_GRANULE_SIZE-1))
> > >
> > > [...]
> > >
> > > > If this looks in the right direction, I'll do some proper patches
> > > > tomorrow.
> > >
> > > Looks fine to me. It's going to be quite expensive and bad for caches, though.
> > >
> > > That said, fault_in_writable() is _supposed_ to all be for the slow
> > > path when things go south and the normal path didn't work out, so I
> > > think it's fine.
> >
> > Let me get back to this; I'm actually not convinced that we need to
> > worry about sub-page-size fault granules in fault_in_pages_readable or
> > fault_in_pages_writeable.
> >
> > From a filesystem point of view, we can get into trouble when a
> > user-space read or write triggers a page fault while we're holding
> > filesystem locks, and that page fault ends up calling back into the
> > filesystem. To deal with that, we're performing those user-space
> > accesses with page faults disabled.
>
> Yes, this makes sense.
>
> > When a page fault would occur, we
> > get back an error instead, and then we try to fault in the offending
> > pages. If a page is resident and we still get a fault trying to access
> > it, trying to fault in the same page again isn't going to help and we
> > have a true error.
>
> You can't be sure the second fault is a true error. The unlocked
> fault_in_*() may race with some LRU scheme making the pte not accessible
> or a write-back making it clean/read-only. copy_to_user() with
> pagefault_disabled() fails again but that's a benign fault. The
> filesystem should re-attempt the fault-in (gup would correct the pte),
> disable page faults and copy_to_user(), potentially in an infinite loop.
> If you bail out on the second/third uaccess following a fault_in_*()
> call, you may get some unexpected errors (though very rare). Maybe the
> filesystems avoid this problem somehow but I couldn't figure it out.

Good point, we can indeed only bail out if both the user copy and the
fault-in fail.

But probing the entire memory range in fault domain granularity in the
page fault-in functions still doesn't actually make sense. Those
functions really only need to guarantee that we'll be able to make
progress eventually. From that point of view, it should be enough to
probe the first byte of the requested memory range, so when one of
those functions reports that the next N bytes should be accessible,
this really means that the first byte surely isn't permanently
inaccessible and that the rest is likely accessible. Functions
fault_in_readable and fault_in_writeable already work that way, so
this only leaves function fault_in_safe_writeable to worry about.

> > We're clearly looking at memory at a page
> > granularity; faults at a sub-page level don't matter at this level of
> > abstraction (but they do show similar error behavior). To avoid
> > getting stuck, when it gets a short result or -EFAULT, the filesystem
> > implements the following backoff strategy: first, it tries to fault in
> > a number of pages. When the read or write still doesn't make progress,
> > it scales back and faults in a single page. Finally, when that still
> > doesn't help, it gives up. This strategy is needed for actual page
> > faults, but it also handles sub-page faults appropriately as long as
> > the user-space access functions give sensible results.
>
> As I said above, I think with this approach there's a small chance of
> incorrectly reporting an error when the fault is recoverable. If you
> change it to an infinite loop, you'd run into the sub-page fault
> problem.

Yes, I see now, thanks.

> There are some places with such infinite loops: futex_wake_op(),
> search_ioctl() in the btrfs code. I still have to get my head around
> generic_perform_write() but I think we get away here because it faults
> in the page with a get_user() rather than gup (and copy_from_user() is
> guaranteed to make progress if any bytes can still be accessed).

Thanks,
Andreas

