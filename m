Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 09BC942AB64
	for <lists+cluster-devel@lfdr.de>; Tue, 12 Oct 2021 19:59:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-McdMPVOlMgyqkuky7cH1Gg-1; Tue, 12 Oct 2021 13:59:17 -0400
X-MC-Unique: McdMPVOlMgyqkuky7cH1Gg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECB8A800FF0;
	Tue, 12 Oct 2021 17:59:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49C8F19C79;
	Tue, 12 Oct 2021 17:59:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D6591809C81;
	Tue, 12 Oct 2021 17:59:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19CHx8pL000617 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 12 Oct 2021 13:59:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3FB7D404727C; Tue, 12 Oct 2021 17:59:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B4ED4047272
	for <cluster-devel@redhat.com>; Tue, 12 Oct 2021 17:59:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 236D2800B24
	for <cluster-devel@redhat.com>; Tue, 12 Oct 2021 17:59:08 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-557-tPjx16PuNpWPjaGchFjNkA-1; Tue, 12 Oct 2021 13:59:06 -0400
X-MC-Unique: tPjx16PuNpWPjaGchFjNkA-1
Received: by mail-lf1-f54.google.com with SMTP id c16so537936lfb.3
	for <cluster-devel@redhat.com>; Tue, 12 Oct 2021 10:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fqSNsVOtXYPiifkp+lepAhAhHgqhsFkG1XDADIpg/Pc=;
	b=l+XWqC78Zlwg3F/JRPPU9TSQX+q79Ghs3FRW9WIA5rrkzhYzUFOu6zFSv+Mx/cerqb
	TwKsVk8vZnzBLosV491jrP4CEOYn+8+MzMP1vptY2s9O/lkK3NHze9zj9tYPOMSezDTE
	zl0V/bGuTqwC2biJUQ/Mf4FR9s6wcPqvGXOddGuoj2RVkPCe1RP68Gr11P1l+HA3vbQf
	tDhX/eiEFZ9TzFWWU+qxHSCDhZavFJMMnOahGkKIeI1+4F+Xb0hu1BmiVVdsdFCxG2/u
	lw6N1d24zpZIs1Q/5rESIMx0NquwRedrh2jmFRR3xY/B8Z6hhosJqJIJh3W7fP5ijJLP
	P7BA==
X-Gm-Message-State: AOAM532biASHEKENSHzl5U9Vq5csCFN3hwDqU7LR/tuKugglhZphlBkE
	FWbpRg/GCE6TIoh+iEq8H3iqT84l3SlcLhaL
X-Google-Smtp-Source: ABdhPJyVcDaEhi0AOz2CXmzQY0afkNFE1MAS42IRpDhPbPlZZdzZn5++7KmoK3aEOeMkYg+6BkIw9g==
X-Received: by 2002:a2e:a7ca:: with SMTP id x10mr31936018ljp.484.1634061544704;
	Tue, 12 Oct 2021 10:59:04 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
	[209.85.167.54])
	by smtp.gmail.com with ESMTPSA id r2sm791183lfi.152.2021.10.12.10.59.02
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 12 Oct 2021 10:59:03 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id y26so370159lfa.11
	for <cluster-devel@redhat.com>; Tue, 12 Oct 2021 10:59:02 -0700 (PDT)
X-Received: by 2002:a05:6512:10d0:: with SMTP id
	k16mr2835560lfg.150.1634061542163; 
	Tue, 12 Oct 2021 10:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wjMyZLH+ta5SohAViSc10iPj-hRnHc-KPDoj1XZCmxdBg@mail.gmail.com>
	<YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
	<YSqOUb7yZ7kBoKRY@zeniv-ca.linux.org.uk> <YS40qqmXL7CMFLGq@arm.com>
	<YS5KudP4DBwlbPEp@zeniv-ca.linux.org.uk> <YWR2cPKeDrc0uHTK@arm.com>
	<CAHk-=wjvQWj7mvdrgTedUW50c2fkdn6Hzxtsk-=ckkMrFoTXjQ@mail.gmail.com>
	<YWSnvq58jDsDuIik@arm.com>
	<CAHk-=wiNWOY5QW5ZJukt_9pHTWvrJhE2=DxPpEtFHAWdzOPDTg@mail.gmail.com>
	<YWXFagjRVdNanGSy@arm.com>
In-Reply-To: <YWXFagjRVdNanGSy@arm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 12 Oct 2021 10:58:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg3prAnhWZetJvwZdugn7A7CpP4ruz1tdewha=8ZY8AJw@mail.gmail.com>
Message-ID: <CAHk-=wg3prAnhWZetJvwZdugn7A7CpP4ruz1tdewha=8ZY8AJw@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Josef Bacik <josef@toxicpanda.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 12, 2021 at 10:27 AM Catalin Marinas
<catalin.marinas@arm.com> wrote:
>
> Apart from fault_in_pages_*(), there's also fault_in_user_writeable()
> called from the futex code which uses the GUP mechanism as the write
> would be destructive. It looks like it could potentially trigger the
> same infinite loop on -EFAULT.

Hmm.

I think the reason we do fault_in_user_writeable() using GUP is that

 (a) we can avoid the page fault overhead

 (b) we don't have any good "atomic_inc_user()" interface or similar
that could do a write with a zero increment or something like that.

We do have that "arch_futex_atomic_op_inuser()" thing, of course. It's
all kinds of crazy, but we *could* do

       arch_futex_atomic_op_inuser(FUTEX_OP_ADD, 0, &dummy, uaddr);

instead of doing the fault_in_user_writeable().

That might be a good idea anyway. I dunno.

But I agree other options exist:

> I wonder whether we should actually just disable tag checking around the
> problematic accesses. What these callers seem to have in common is using
> pagefault_disable/enable(). We could abuse this to disable tag checking
> or maybe in_atomic() when handling the exception to lazily disable such
> faults temporarily.

Hmm. That would work for MTE, but possibly be very inconvenient for
other situations.

> A more invasive change would be to return a different error for such
> faults like -EACCESS and treat them differently in the caller.

That's _really_ hard for things like "copy_to_user()", that isn't a
single operation, and is supposed to return the bytes left.

Adding another error return would be nasty.

We've had hacks like "squirrel away the actual error code in the task
structure", but that tends to be unmaintainable because we have
interrupts (and NMI's) doing their own possibly nested atomics, so
even disabling preemption won't actually fix some of the nesting
issues.

All of these things make me think that the proper fix ends up being to
make sure that our "fault_in_xyz()" functions simply should always
handle all faults.

Another option may be to teach the GUP code to actually check
architecture-specific sub-page ranges.

        Linus

