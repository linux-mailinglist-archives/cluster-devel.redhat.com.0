Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D003F3EDDB7
	for <lists+cluster-devel@lfdr.de>; Mon, 16 Aug 2021 21:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629141275;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=lWy3l2+IfO7xO6oKpqVQHj7y0vYczHZZ4SIluKLQLb8=;
	b=a3nh1saZZDsv4fG01W196ApSbz2Ua1g3fdI0tK1JFMtD/Js12d5cZX9MhY0cMLw00qdssX
	kqkiwkpRSSKEDcPB5LSf7SqTJVvP3gScfLX+D7qfj+C9S5jWGWGjG3nt+iPZg/1q4+XSZa
	cSdoXqJPUugKCTVIofotSCSnY+XVla4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-cYLjPwhSO4ufQVT_IOEeMg-1; Mon, 16 Aug 2021 15:14:34 -0400
X-MC-Unique: cYLjPwhSO4ufQVT_IOEeMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D81561082921;
	Mon, 16 Aug 2021 19:14:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 792B019C44;
	Mon, 16 Aug 2021 19:14:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 355D3181AC06;
	Mon, 16 Aug 2021 19:14:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17GJERw3014954 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 16 Aug 2021 15:14:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F187B2144B46; Mon, 16 Aug 2021 19:14:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECD292144B45
	for <cluster-devel@redhat.com>; Mon, 16 Aug 2021 19:14:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7855F80158D
	for <cluster-devel@redhat.com>; Mon, 16 Aug 2021 19:14:23 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-523-iptDxdmyNz2T51brSvbAaw-1; Mon, 16 Aug 2021 15:14:22 -0400
X-MC-Unique: iptDxdmyNz2T51brSvbAaw-1
Received: by mail-wm1-f71.google.com with SMTP id
	10-20020a05600c024a00b002e6bf2ee820so78163wmj.6
	for <cluster-devel@redhat.com>; Mon, 16 Aug 2021 12:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lWy3l2+IfO7xO6oKpqVQHj7y0vYczHZZ4SIluKLQLb8=;
	b=gSz21UbgIc333ttVDFw4Nc6a/Jk575jEXtI92enNrQ34LMeGwfZoBBzJQY4ytm/AG/
	pzZQjAwScX0Y2ZMCf7Ryw2ZKgWnsvV+4UznXkTtExIFsFvRS5iPvmc8FkMCsdCsYhUUC
	wqPdzkrRCoO3WYS7g7kfA4Ex+oJ90Rbjkhe2/JijYbAKPEI9ddcnWwZM81MV7TTJyK6c
	YEHS6cgFvyPMOfEuAyhsxwA7Y3b3bLEa9o2Iqt/t79LAn61rGbTDJHA/GXEQRR7yuPHd
	MYybFGu40c4uMhF51XPf/WM8JlxdQ59dgf5myAC+CcJSf1TVn7QpiwZOCY4udCkZCPXw
	fBvg==
X-Gm-Message-State: AOAM530/DJBoKmQWVAa/3b7fxV5GMXLg2MrB7+Wph/twlpMYGhQ/PyAO
	QDvFcqG0lIDQEtXtds9Wv+w4I1FjteikaB0ROUcLB8AmNpCLZFUORcii1McOSHNQZKJEoG5hMeT
	F1sC0Vw8t7GnsERqipaKZf7qQI9QGvCVTMbnpAg==
X-Received: by 2002:a5d:674b:: with SMTP id l11mr18978886wrw.357.1629141260957;
	Mon, 16 Aug 2021 12:14:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3e2hMfKU0iq3mIOu2m32crL3qBkqbuiWv8L806qkeQbGdArMICY3wU0R/Jc0O1nkrsAQGzAuFreIkqVtHZaU=
X-Received: by 2002:a5d:674b:: with SMTP id l11mr18978869wrw.357.1629141260774;
	Mon, 16 Aug 2021 12:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210803191818.993968-1-agruenba@redhat.com>
	<CAHk-=wj+_Y7NQ-NhhE0jk52c9ZB0VJbO1AjtMJFB8wP=PO+bdw@mail.gmail.com>
In-Reply-To: <CAHk-=wj+_Y7NQ-NhhE0jk52c9ZB0VJbO1AjtMJFB8wP=PO+bdw@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 16 Aug 2021 21:14:09 +0200
Message-ID: <CAHc6FU6H5q20qiQ5FX1726i0FJHyh=Y46huWkCBZTR3sk+3Dhg@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 3, 2021 at 9:45 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, Aug 3, 2021 at 12:18 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> > With this patch queue, fstest generic/208 (aio-dio-invalidate-failure.c)
> > endlessly spins in gfs2_file_direct_write.  It looks as if there's a bug
> > in get_user_pages_fast when called with FOLL_FAST_ONLY:
> >
> >  (1) The test case performs an aio write into a 32 MB buffer.
> >
> >  (2) The buffer is initially not in memory, so when iomap_dio_rw() ->
> >      ... -> bio_iov_iter_get_pages() is called with the iter->noio flag
> >      set, we get to get_user_pages_fast() with FOLL_FAST_ONLY set.
> >      get_user_pages_fast() returns 0, which causes
> >      bio_iov_iter_get_pages to return -EFAULT.
> >
> >  (3) Then gfs2_file_direct_write faults in the entire buffer with
> >      fault_in_iov_iter_readable(), which succeeds.
> >
> >  (4) With the buffer in memory, we retry the iomap_dio_rw() ->
> >      ... -> bio_iov_iter_get_pages() -> ... -> get_user_pages_fast().
> >      This should succeed now, but get_user_pages_fast() still returns 0.
>
> Hmm. Have you tried to figure out why that "still returns 0" happens?

The call stack is:

gup_pte_range
gup_pmd_range
gup_pud_range
gup_p4d_range
gup_pgd_range
lockless_pages_from_mm
internal_get_user_pages_fast
get_user_pages_fast
iov_iter_get_pages
__bio_iov_iter_get_pages
bio_iov_iter_get_pages
iomap_dio_bio_actor
iomap_dio_actor
iomap_apply
iomap_dio_rw
gfs2_file_direct_write

In gup_pte_range, pte_special(pte) is true and so we return 0.

> One option - for debugging only - would be to introduce a new flag to
> get_user_pages_fast() that says "print out reason if failed" and make
> the retry (but not the original one) have that flag set.
>
> There are a couple of things of note when it comes to "get_user_pages_fast()":
>
>  (a) some architectures don't even enable it
>
>  (b) it can be very picky about the page table contents, and wants the
> accessed bit to already be set (or the dirty bit, in the case of a
> write).
>
> but (a) shouldn't be an issue on any common platform and (b) shouldn't
> be an issue with  fault_in_iov_iter_readable() that actually does a
> __get_user() so it will access through the page tables.
>
> (It might be more of an issue with fault_in_iov_iter_writable() due to
> walking the page tables by hand - if we don't do the proper
> access/dirty setting, I could see get_user_pages_fast() failing).
>
> Anyway, for reason (a) I do think that eventually we should probably
> introduce FOLL_NOFAULT, and allow the full "slow" page table walk -
> just not calling down to handle_mm_fault() if it fails.
>
> But (a) should be a non-issue in your test environment, and so it
> would be interesting to hear what it is that fails. Because scanning
> through the patches, they all _look_ fine to me (apart from the one
> comment about return values, which is more about being consistent with
> copy_to/from_user() and making the code simpler - not about
> correctness)
>
>                        Linus
>

Thanks,
Andreas

