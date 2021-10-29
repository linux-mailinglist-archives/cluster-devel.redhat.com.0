Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2E5440191
	for <lists+cluster-devel@lfdr.de>; Fri, 29 Oct 2021 19:56:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-NU-F1OxEPoa-4JJguVlMdQ-1; Fri, 29 Oct 2021 13:56:43 -0400
X-MC-Unique: NU-F1OxEPoa-4JJguVlMdQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1339319057A0;
	Fri, 29 Oct 2021 17:56:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 261805F4E1;
	Fri, 29 Oct 2021 17:56:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD4974A702;
	Fri, 29 Oct 2021 17:56:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19THonDI001444 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 29 Oct 2021 13:50:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3822F2026D48; Fri, 29 Oct 2021 17:50:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 343BA2026D65
	for <cluster-devel@redhat.com>; Fri, 29 Oct 2021 17:50:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CCD018A01AB
	for <cluster-devel@redhat.com>; Fri, 29 Oct 2021 17:50:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-433-fgM6r8gYMjSaQsrXvzL2Fg-1;
	Fri, 29 Oct 2021 13:50:42 -0400
X-MC-Unique: fgM6r8gYMjSaQsrXvzL2Fg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7CA9610C7;
	Fri, 29 Oct 2021 17:50:38 +0000 (UTC)
Date: Fri, 29 Oct 2021 18:50:35 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YXw0a9n+/PLAcObB@arm.com>
References: <CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
	<YXL9tRher7QVmq6N@arm.com>
	<CAHk-=wg4t2t1AaBDyMfOVhCCOiLLjCB5TFVgZcV4Pr8X2qptJw@mail.gmail.com>
	<CAHc6FU7BEfBJCpm8wC3P+8GTBcXxzDWcp6wAcgzQtuaJLHrqZA@mail.gmail.com>
	<YXhH0sBSyTyz5Eh2@arm.com>
	<CAHk-=wjWDsB-dDj+x4yr8h8f_VSkyB7MbgGqBzDRMNz125sZxw@mail.gmail.com>
	<YXmkvfL9B+4mQAIo@arm.com>
	<CAHk-=wjQqi9cw1Guz6a8oBB0xiQNF_jtFzs3gW0k7+fKN-mB1g@mail.gmail.com>
	<YXsUNMWFpmT1eQcX@arm.com>
	<CAHk-=wgzEKEYKRoR_abQRDO=R8xJX_FK+XC3gNhKfu=KLdxt3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgzEKEYKRoR_abQRDO=R8xJX_FK+XC3gNhKfu=KLdxt3g@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Paul Mackerras <paulus@ozlabs.org>,
	Tony Luck <tony.luck@intel.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Andy Lutomirski <luto@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>, ocfs2-devel@oss.oracle.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 28, 2021 at 03:32:23PM -0700, Linus Torvalds wrote:
> The pointer color fault (or whatever some other architecture may do to
> generate sub-page faults) is not only not recoverable in the sense
> that we can't fix it up, it also ends up being a forced SIGSEGV (ie it
> can't be blocked - it has to either be caught or cause the process to
> be killed).
> 
> And the thing is, I think we could just make the rule be that kernel
> code that has this kind of retry loop with fault_in_pages() would
> force an EFAULT on a pending SIGSEGV.
> 
> IOW, the pending SIGSEGV could effectively be exactly that "thread flag".
> 
> And that means that fault_in_xyz() wouldn't need to worry about this
> situation at all: the regular copy_from_user() (or whatever flavor it
> is - to/from/iter/whatever) would take the fault. And if it's a
> regular page fault,. it would act exactly like it does now, so no
> changes.
> 
> If it's a sub-page fault, we'd just make the rule be that we send a
> SIGSEGV even if the instruction in question has a user exception
> fixup.
> 
> Then we just need to add the logic somewhere that does "if active
> pending SIGSEGV, return -EFAULT".
> 
> Of course, that logic might be in fault_in_xyz(), but it migth also be
> a separate function entirely.
> 
> So this does effectively end up being a thread flag, but it's also
> slightly more than that - it's that a sub-page fault from kernel mode
> has semantics that a regular page fault does not.
> 
> The whole "kernel access doesn't cause SIGSEGV, but returns -EFAULT
> instead" has always been an odd and somewhat wrong-headed thing. Of
> course it should cause a SIGSEGV, but that's not how Unix traditionall
> worked. We would just say "color faults always raise a signal, even if
> the color fault was triggered in a system call".

It's doable and, at least for MTE, people have asked for a signal even
when the fault was caused by a kernel uaccess. But there are some
potentially confusing aspects to sort out:

First of all, a uaccess in interrupt should not force such signal as it
had nothing to do with the interrupted context. I guess we can do an
in_task() check in the fault handler.

Second, is there a chance that we enter the fault-in loop with a SIGSEGV
already pending? Maybe it's not a problem, we just bail out of the loop
early and deliver the signal, though unrelated to the actual uaccess in
the loop.

Third is the sigcontext.pc presented to the signal handler. Normally for
SIGSEGV it points to the address of a load/store instruction and a
handler could disable MTE and restart from that point. With a syscall we
don't want it to point to the syscall place as it shouldn't be restarted
in case it copied something. Pointing it to the next instruction after
syscall is backwards-compatible but it may confuse the handler (if it
does some reporting). I think we need add a new si_code that describes a
fault in kernel mode to differentiate from the genuine user access.

There was a discussion back in August on infinite loops with hwpoison
and Tony said that Andy convinced him that the kernel should not send a
SIGBUS for uaccess:

https://lore.kernel.org/linux-edac/20210823152437.GA1637466@agluck-desk2.amr.corp.intel.com/

I personally like the approach of a SIG{SEGV,BUS} on uaccess and I don't
think the ABI change is significant but ideally we should have a unified
approach that's not just for MTE.

Adding Andy and Tony (the background is potentially infinite loops with
faults at sub-page granularity: arm64 MTE, hwpoison, sparc ADI).

Thanks.

-- 
Catalin

