Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB09B440298
	for <lists+cluster-devel@lfdr.de>; Fri, 29 Oct 2021 20:54:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-KgRQNR_UMSyuiQnnBdbsEQ-1; Fri, 29 Oct 2021 14:54:16 -0400
X-MC-Unique: KgRQNR_UMSyuiQnnBdbsEQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93EA28018AC;
	Fri, 29 Oct 2021 18:54:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 536934180;
	Fri, 29 Oct 2021 18:54:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3EAF24A702;
	Fri, 29 Oct 2021 18:54:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19TIs4Xh006092 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 29 Oct 2021 14:54:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF6D540CFD11; Fri, 29 Oct 2021 18:54:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA2A640CFD10
	for <cluster-devel@redhat.com>; Fri, 29 Oct 2021 18:54:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90C83811E7F
	for <cluster-devel@redhat.com>; Fri, 29 Oct 2021 18:54:04 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-350-mugO85C-PFeF5Ya-h07a5Q-1; Fri, 29 Oct 2021 14:54:02 -0400
X-MC-Unique: mugO85C-PFeF5Ya-h07a5Q-1
Received: by mail-ed1-f43.google.com with SMTP id w15so41902335edc.9
	for <cluster-devel@redhat.com>; Fri, 29 Oct 2021 11:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uGPiPKSphOUEs2fEDAQ1oyHUSr8W7H4wPzT5A6mID2k=;
	b=rFWsE+UVcpLN++hkNwsDh85Jj63VviANgoTRBzbufheaq5PcfIbpZCfspLDJf40ZS3
	2NtksSUxXnubCu34GhEJQzt/EiHmKJAURCVyWfAEgP0ORcY8EiC5V7GZb4JeBSd1T10c
	XqPl2ptIAQKfbc6yjHrdaVMQbn/4671dzplh8tpNePVQqcgSqRGY4aN9wNHU5yatpnzW
	40M65ApDGtj6thXedoddU1WR29fZ5qpuXtFZR8xrB4bVbb+OSw9e1yQERvDascvk6XyM
	8DKz0b1c/YpUNrrL9bq5Y4r3D6tcVry3Ymcn9/TP7UOPvhffh5XGrCOVTWeXq1pAsdtu
	9SMw==
X-Gm-Message-State: AOAM530i7m5pCzUIDG8lVfJf9OepgurggdsGX1CxnPgGy0ApJwArS7hx
	XHEnAELb/AYiMxHOMGcsUKaXPGsOu2HMN139qg0=
X-Google-Smtp-Source: ABdhPJzIfTaVlSp+pCKIX7k6L2sZbvkJD7wDXcMSO23imZ84NY+HHi2O/LwNzQcmaZstBgceTlO5Wg==
X-Received: by 2002:a05:6402:120b:: with SMTP id
	c11mr17078769edw.397.1635533640837; 
	Fri, 29 Oct 2021 11:54:00 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
	[209.85.208.46])
	by smtp.gmail.com with ESMTPSA id k9sm4006299edo.87.2021.10.29.11.54.00
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 29 Oct 2021 11:54:00 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id f8so20167986edy.4
	for <cluster-devel@redhat.com>; Fri, 29 Oct 2021 11:54:00 -0700 (PDT)
X-Received: by 2002:a05:651c:17a6:: with SMTP id
	bn38mr13088470ljb.56.1635533269069; 
	Fri, 29 Oct 2021 11:47:49 -0700 (PDT)
MIME-Version: 1.0
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
	<YXw0a9n+/PLAcObB@arm.com>
In-Reply-To: <YXw0a9n+/PLAcObB@arm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 29 Oct 2021 11:47:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgNV5Ka0yTssic0JbZEcO3wvoTC65budK88k4D-34v0xA@mail.gmail.com>
Message-ID: <CAHk-=wgNV5Ka0yTssic0JbZEcO3wvoTC65budK88k4D-34v0xA@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 29, 2021 at 10:50 AM Catalin Marinas
<catalin.marinas@arm.com> wrote:
>
> First of all, a uaccess in interrupt should not force such signal as it
> had nothing to do with the interrupted context. I guess we can do an
> in_task() check in the fault handler.

Yeah. It ends up being similar to the thread flag in that you still
end up having to protect against NMI and other users of asynchronous
page faults.

So the suggestion was more of a "mindset" difference and modified
version of the task flag rather than anything fundamentally different.

> Second, is there a chance that we enter the fault-in loop with a SIGSEGV
> already pending? Maybe it's not a problem, we just bail out of the loop
> early and deliver the signal, though unrelated to the actual uaccess in
> the loop.

If we ever run in user space with a pending per-thread SIGSEGV, that
would already be a fairly bad bug. The intent of "force_sig()" is not
only to make sure you can't block the signal, but also that it targets
the particular thread that caused the problem: unlike other random
"send signal to process", a SIGSEGV caused by a bad memory access is
really local to that _thread_, not the signal thread group.

So somebody else sending a SIGSEGV asynchronsly is actually very
different - it goes to the thread group (although you can specify
individual threads too - but once you do that you're already outside
of POSIX).

That said, the more I look at it, the more I think I was wrong. I
think the "we have a SIGSEGV pending" could act as the per-thread
flag, but the complexity of the signal handling is probably an
argument against it.

Not because a SIGSEGV could already be pending, but because so many
other situations could be pending.

In particular, the signal code won't send new signals to a thread if
that thread group is already exiting. So another thread may have
already started the exit and core dump sequence, and is in the process
of killing the shared signal threads, and if one of those threads is
now in the kernel and goes through the copy_from_user() dance, that
whole "thread group is exiting" will mean that the signal code won't
add a new SIGSEGV to the queue.

So the signal could conceptually be used as the flag to stop looping,
but it ends up being such a complicated flag that I think it's
probably not worth it after all. Even if it semantically would be
fairly nice to use pre-existing machinery.

Could it be worked around? Sure. That kernel loop probably has to
check for fatal_signal_pending() anyway, so it would all work even in
the presense of the above kinds of issues. But just the fact that I
went and looked at just how exciting the signal code is made me think
"ok, conceptually nice, but we take a lot of locks and we do a lot of
special things even in the 'simple' force_sig() case".

> Third is the sigcontext.pc presented to the signal handler. Normally for
> SIGSEGV it points to the address of a load/store instruction and a
> handler could disable MTE and restart from that point. With a syscall we
> don't want it to point to the syscall place as it shouldn't be restarted
> in case it copied something.

I think this is actually independent of the whole "how to return
errors". We'll still need to return an error from the system call,
even if we also have a signal pending.

                  Linus

