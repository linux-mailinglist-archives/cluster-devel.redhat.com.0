Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3441B3D7416
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 13:15:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627384552;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=afrSbaGGjeeVykwqXymNzbcEw/D8kWccnFVpP7E5Guw=;
	b=Wi94X0V4AQcSo3ppdX/ORlmRkvmm2uJ8dWCl/X18XvhjXi2o3cwF77qAFOOCyNFdXu9vsy
	9V6ppDlp1aCHV9T6GgYQmUw/0or+eh7IIDl0Sm8T/wuuCKd1hc0bHjtWaFw0GZRaVENlPL
	LicDYjF6jatQNiW6bru8e9f5eK7aD+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-3VKozkg4MuuPMMNzhsu2JA-1; Tue, 27 Jul 2021 07:15:51 -0400
X-MC-Unique: 3VKozkg4MuuPMMNzhsu2JA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA2693CE7;
	Tue, 27 Jul 2021 11:15:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32744544F1;
	Tue, 27 Jul 2021 11:15:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9FBB64BB7C;
	Tue, 27 Jul 2021 11:15:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RBE5SY010894 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 07:14:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A40011155887; Tue, 27 Jul 2021 11:14:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FF691155880
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 11:14:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 324F818812C3
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 11:14:02 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-274-VNG4HS5KNfiVufVSvT3MAA-1; Tue, 27 Jul 2021 07:14:00 -0400
X-MC-Unique: VNG4HS5KNfiVufVSvT3MAA-1
Received: by mail-wm1-f71.google.com with SMTP id
	r2-20020a05600c35c2b029023a3f081487so1229285wmq.4
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 04:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=afrSbaGGjeeVykwqXymNzbcEw/D8kWccnFVpP7E5Guw=;
	b=R0FDBXW4isZ7f6raAQw0J2Y1LRHS4Vb8rS0mXgz/lD+hbepnjfDJSW5tlq0dX8tAHz
	zqu8QXr/LE2txgUSgAv9oeeOlfekcaBqvpaABooDo2+PVZvU/CLus58TiniqUzcGdNg3
	xlc9IoFXReg2qw3krjZxsTH/kKlna06OgRETJLwGV4XxuVdJWQ/Erx8IkE2KSn7DTbVo
	oIppM7SkzxDyxA9Q3jDe1WNcQ1uLERa1MtkHpicdCj/TDuoT2ebuxZqK+z7BJqm/GtwK
	rLHxAZqF/Yl4yjZY/yOqyr/LRNhRxs57/gmsKgFw4DQgE7EwkXHwwc5Q85/pME+rY6RX
	VjWQ==
X-Gm-Message-State: AOAM532JqW+CfAYTPVesJS6+lnWkAHzp3LpOe5tH9GeiHrSiX6ArjkMi
	n1J9GAt1KOjHJxen9ie1mo9WLvdtBmEPBocUN4vZSv9OxJ7fGzwQV05lxcAweFGXXD3mDS8/moH
	gSfl0wqYygnDUYFcSdfqjENbW7/3Q9X2zSO9tEA==
X-Received: by 2002:a1c:2282:: with SMTP id
	i124mr21633324wmi.166.1627384439577; 
	Tue, 27 Jul 2021 04:13:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzfklfZGsBuVC9rf1FJG+V3aLBjS+SfsovPyqckWGhLMBFH25HVSmfqV0mFgBo9h9VeIN01a4/gyJ0JOvSo60=
X-Received: by 2002:a1c:2282:: with SMTP id
	i124mr21633303wmi.166.1627384439403; 
	Tue, 27 Jul 2021 04:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210724193449.361667-1-agruenba@redhat.com>
	<20210724193449.361667-2-agruenba@redhat.com>
	<CAHk-=whodi=ZPhoJy_a47VD+-aFtz385B4_GHvQp8Bp9NdTKUg@mail.gmail.com>
	<03e0541400e946cf87bc285198b82491@AcuMS.aculab.com>
In-Reply-To: <03e0541400e946cf87bc285198b82491@AcuMS.aculab.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 27 Jul 2021 13:13:47 +0200
Message-ID: <CAHc6FU4N7vz+jfoUSa45Mr_F0Ht0_PXroWoc5UNkMgFmpKLaNw@mail.gmail.com>
To: David Laight <David.Laight@aculab.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Cluster-devel] [PATCH v4 1/8] iov_iter: Introduce
	iov_iter_fault_in_writeable helper
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

On Tue, Jul 27, 2021 at 11:30 AM David Laight <David.Laight@aculab.com> wrote:
> From: Linus Torvalds
> > Sent: 24 July 2021 20:53
> >
> > On Sat, Jul 24, 2021 at 12:35 PM Andreas Gruenbacher
> > <agruenba@redhat.com> wrote:
> > >
> > > +int iov_iter_fault_in_writeable(const struct iov_iter *i, size_t bytes)
> > > +{
> > ...
> > > +                       if (fault_in_user_pages(start, len, true) != len)
> > > +                               return -EFAULT;
> >
> > Looking at this once more, I think this is likely wrong.
> >
> > Why?
> >
> > Because any user can/should only care about at least *part* of the
> > area being writable.
> >
> > Imagine that you're doing a large read. If the *first* page is
> > writable, you should still return the partial read, not -EFAULT.
>
> My 2c...
>
> Is it actually worth doing any more than ensuring the first byte
> of the buffer is paged in before entering the block that has
> to disable page faults?

We definitely do want to process as many pages as we can, especially
if allocations are involved during a write.

> Most of the all the pages are present so the IO completes.

That's not guaranteed. There are cases in which none of the pages are
present, and then there are cases in which only the first page is
present (for example, because of a previous access that wasn't page
aligned).

> The pages can always get unmapped (due to page pressure or
> another application thread unmapping them) so there needs
> to be a retry loop.
> Given the cost of actually faulting in a page going around
> the outer loop may not matter.
> Indeed, if an application has just mmap()ed in a very large
> file and is then doing a write() from it then it is quite
> likely that the pages got unmapped!
>
> Clearly there needs to be extra code to ensure progress is made.
> This might actually require the use of 'bounce buffers'
> for really problematic user requests.

I'm not sure if repeated unmapping of the pages that we've just
faulted in is going to be a problem (in terms of preventing progress).
But a suitable heuristic might be to shrink the fault-in "window" on
each retry until it's only one page.

> I also wonder what actually happens for pipes and fifos.
> IIRC reads and write of up to PIPE_MAX (typically 4096)
> are expected to be atomic.
> This should be true even if there are page faults part way
> through the copy_to/from_user().
>
> It has to be said I can't see any reference to PIPE_MAX
> in the linux man pages, but I'm sure it is in the POSIX/TOG
> spec.
>
>         David

Thanks,
Andreas

