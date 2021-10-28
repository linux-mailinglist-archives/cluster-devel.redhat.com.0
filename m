Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DACC243F2B1
	for <lists+cluster-devel@lfdr.de>; Fri, 29 Oct 2021 00:22:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-14BWcpCyPuOWCMOpc_bLEA-1; Thu, 28 Oct 2021 18:22:40 -0400
X-MC-Unique: 14BWcpCyPuOWCMOpc_bLEA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BA5F1808312;
	Thu, 28 Oct 2021 22:22:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC992100E12C;
	Thu, 28 Oct 2021 22:22:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94AD34A703;
	Thu, 28 Oct 2021 22:22:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19SMGC5i032146 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 28 Oct 2021 18:16:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 94FA72166B25; Thu, 28 Oct 2021 22:16:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D4A72166B2D
	for <cluster-devel@redhat.com>; Thu, 28 Oct 2021 22:16:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A36C7811E7A
	for <cluster-devel@redhat.com>; Thu, 28 Oct 2021 22:16:09 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-554-4HP9SC7-OqSFwdSh5Dzxxw-1; Thu, 28 Oct 2021 18:16:08 -0400
X-MC-Unique: 4HP9SC7-OqSFwdSh5Dzxxw-1
Received: by mail-io1-f51.google.com with SMTP id e144so10141783iof.3;
	Thu, 28 Oct 2021 15:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rg70L5/px9IrBTtKlC6NDcYo4kfwnEG9jTpOWhVqPcc=;
	b=xbrq7vWoG+RhfPYA84aDGbou+llHm9RI9OmdqY6ZE4Cwwmk+OKBhTjxkjvttN1xMJA
	qLbsemVaib8hQ0V7EjLoQS7OpRElaQl/z3HSP90zigRAu8/yHLWp89pPhPykaalTsRgH
	HRrXn21jez2a0M1MInNwoUW9cCvjoBmoTKFzYwxj+5Uopbnei35yBKOcicY0rXxWpHxd
	AzRZc59SIzqZI8YE9c+592mjezuM/9kIGJgGyrPhQSrjiUJtzZjopOtAc8K1SCeWnYLx
	XZ/dv4tm1R0cveEYAqm/9Q3F+v0EnO8BkI0FGI6SezLq+GXCDDD51zDZUyaUIqwve8qL
	nWqw==
X-Gm-Message-State: AOAM530+i1GOgnx2sCv910IOCnM+BXIhhXSR5+lg+uOpqmOVDmXlEbNJ
	oub56eMiYzIoHUM5ajN6me4yBKBElaUghwB6O0OJZuM+Hg4=
X-Google-Smtp-Source: ABdhPJwQxQk+UInDEwQGMzT3vtIBaThPNMfpgrXChu4UuLq9KZI3dYCJq/rt6DgOPhDRcNVWlcfUbesD2a/U+JO29i0=
X-Received: by 2002:a05:6602:736:: with SMTP id
	g22mr5165002iox.139.1635459366944; 
	Thu, 28 Oct 2021 15:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgv=KPZBJGnx_O5-7hhST8CL9BN4wJwtVuycjhv_1MmvQ@mail.gmail.com>
	<YXCbv5gdfEEtAYo8@arm.com>
	<CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
	<YXL9tRher7QVmq6N@arm.com>
	<CAHk-=wg4t2t1AaBDyMfOVhCCOiLLjCB5TFVgZcV4Pr8X2qptJw@mail.gmail.com>
	<CAHc6FU7BEfBJCpm8wC3P+8GTBcXxzDWcp6wAcgzQtuaJLHrqZA@mail.gmail.com>
	<YXhH0sBSyTyz5Eh2@arm.com>
	<CAHk-=wjWDsB-dDj+x4yr8h8f_VSkyB7MbgGqBzDRMNz125sZxw@mail.gmail.com>
	<YXmkvfL9B+4mQAIo@arm.com>
	<CAHk-=wjQqi9cw1Guz6a8oBB0xiQNF_jtFzs3gW0k7+fKN-mB1g@mail.gmail.com>
	<YXsUNMWFpmT1eQcX@arm.com>
In-Reply-To: <YXsUNMWFpmT1eQcX@arm.com>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Fri, 29 Oct 2021 00:15:55 +0200
Message-ID: <CAHpGcMLeiXSjCJGY6SCJJ=bdNOspHLHofmTE8aC_sZtfHRG5ZA@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Paul Mackerras <paulus@ozlabs.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v8 00/17] gfs2: Fix mmap + page fault
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Do., 28. Okt. 2021 um 23:21 Uhr schrieb Catalin Marinas
<catalin.marinas@arm.com>:
> One last try on this path before I switch to the other options.
>
> On Wed, Oct 27, 2021 at 02:14:48PM -0700, Linus Torvalds wrote:
> > On Wed, Oct 27, 2021 at 12:13 PM Catalin Marinas
> > <catalin.marinas@arm.com> wrote:
> > > As an alternative, you mentioned earlier that a per-thread fault status
> > > was not feasible on x86 due to races. Was this only for the hw poison
> > > case? I think the uaccess is slightly different.
> >
> > It's not x86-specific, it's very generic.
> >
> > If we set some flag in the per-thread status, we'll need to be careful
> > about not overwriting it if we then have a subsequent NMI that _also_
> > takes a (completely unrelated) page fault - before we then read the
> > per-thread flag.
> >
> > Think 'perf' and fetching backtraces etc.
> >
> > Note that the NMI page fault can easily also be a pointer coloring
> > fault on arm64, for exactly the same reason that whatever original
> > copy_from_user() code was. So this is not a "oh, pointer coloring
> > faults are different". They have the same re-entrancy issue.
> >
> > And both the "pagefault_disable" and "fault happens in interrupt
> > context" cases are also the exact same 'faulthandler_disabled()'
> > thing. So even at fault time they look very similar.
>
> They do look fairly similar but we should have the information in the
> fault handler to distinguish: not a page fault (pte permission or p*d
> translation), in_task(), user address, fixup handler. But I agree the
> logic looks fragile.
>
> I think for nested contexts we can save the uaccess fault state on
> exception entry, restore it on return. Or (needs some thinking on
> atomicity) save it in a local variable. The high-level API would look
> something like:
>
>         unsigned long uaccess_flags;    /* we could use TIF_ flags */
>
>         uaccess_flags = begin_retriable_uaccess();
>         copied = copy_page_from_iter_atomic(...);
>         retry = end_retriable_uaccess(uaccess_flags);
>         ...
>
>         if (!retry)
>                 break;
>
> I think we'd need a TIF flag to mark the retriable region and another to
> track whether a non-recoverable fault occurred. It needs prototyping.
>
> Anyway, if you don't like this approach, I'll look at error codes being
> returned but rather than changing all copy_from_user() etc., introduce a
> new API that returns different error codes depending on the fault
> (e.g -EFAULT vs -EACCES). We already have copy_from_user_nofault(), we'd
> need something for the iov_iter stuff to use in the fs code.

We won't need any of that on the filesystem read and write paths. The
two cases there are buffered and direct I/O:

* In the buffered I/O case, the copying happens with page faults
disabled, at a byte granularity. If that returns a short result, we
need to enable page faults, check if the exact address that failed
still fails (in which case we have a sub-page fault),  fault in the
pages, disable page faults again, and repeat. No probing for sub-page
faults beyond the first byte of the fault-in address is needed.
Functions fault_in_{readable,writeable} implicitly have this behavior;
for fault_in_safe_writeable() the choice we have is to either add
probing of the first byte for sub-page faults to this function or
force callers to do that probing separately. At this point, I'd vote
for the former.

* In the direct I/O case, the copying happens while we're holding page
references, so the only page faults that can occur during copying are
sub-page faults. When iomap_dio_rw or its legacy counterpart is called
with page faults disabled, we need to make sure that the caller can
distinguish between page faults triggered during
bio_iov_iter_get_pages() and during the copying, but that's a separate
problem. (At the moment, when iomap_dio_rw fails with -EFAULT, the
caller *cannot* distinguish between a bio_iov_iter_get_pages failure
and a failure during synchronous copying, but that could be fixed by
returning unique error codes from iomap_dio_rw.)

So as far as I can see, the only problematic case we're left with is
copying bigger than byte-size chunks with page faults disabled when we
don't know whether the underlying pages are resident or not. My guess
would be that in this case, if the copying fails, it would be
perfectly acceptable to explicitly probe the entire chunk for sub-page
faults.

Thanks,
Andreas

