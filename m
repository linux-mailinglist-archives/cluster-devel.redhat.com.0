Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA9D43F2E0
	for <lists+cluster-devel@lfdr.de>; Fri, 29 Oct 2021 00:37:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-W3PyU9RcMKOF2YkDO_h6Xw-1; Thu, 28 Oct 2021 18:37:07 -0400
X-MC-Unique: W3PyU9RcMKOF2YkDO_h6Xw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A5FA8066F5;
	Thu, 28 Oct 2021 22:37:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC7366788C;
	Thu, 28 Oct 2021 22:37:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2BAE4E58E;
	Thu, 28 Oct 2021 22:37:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19SMWnCN001715 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 28 Oct 2021 18:32:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05D832166B46; Thu, 28 Oct 2021 22:32:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 000E72166B3F
	for <cluster-devel@redhat.com>; Thu, 28 Oct 2021 22:32:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E19AF1066566
	for <cluster-devel@redhat.com>; Thu, 28 Oct 2021 22:32:45 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-15-0IV4eAnuOEe6sGk_DdzUzA-1; Thu, 28 Oct 2021 18:32:44 -0400
X-MC-Unique: 0IV4eAnuOEe6sGk_DdzUzA-1
Received: by mail-lf1-f53.google.com with SMTP id x27so16752548lfu.5
	for <cluster-devel@redhat.com>; Thu, 28 Oct 2021 15:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P2oA0jP1wTViA9d0b6XSu2m2Y7tBKqkUPBuDKDK703M=;
	b=Hd0zIPf9BFUFq6jKxafieV43uyZAZzz7L22KAR2zEJ3+B3asQRnJK11UVy6FeMlvjV
	uWUAbC/01s8VEaXg2zc4vCIMX2lkVOV0lmvNBZXkoKyPOxcLGM4tPoPAP2tO4cHepG6P
	NCnmOn9wbfyjwUCZz0UHXb59sjP4H0TkLXk7wodz4b45G3ZIMhwiAeotWnP0LEHcKzIU
	RNIcrbMqimaI8qzqnY2I+SzYCTOUVvGA1Ln92jN1syIkRt9ChQb99s84nf4EM59Bd7Ga
	JRqRaihG7K39KdbAkgR/+qdZKs0nKB20JqO7UP3kGyjrn2UAkBh+WxTBZqhCsA45lGOp
	4SAQ==
X-Gm-Message-State: AOAM533zvlnI7BisDCBr085LHoeNqEIYI/Ai7bwU29p9Mglnn8hKWq+f
	D8kyj3oss5Pa5CkctIDC7mGR5nkGov8Vi7yn
X-Google-Smtp-Source: ABdhPJzb+Cp7nFQGeWpSvlubMXX1i/YmhE/h12yJN+F3e2JFKDuu5aMaQYbwvipES8AS8GPkQR4X4g==
X-Received: by 2002:a05:6512:16a7:: with SMTP id
	bu39mr6982536lfb.578.1635460362430; 
	Thu, 28 Oct 2021 15:32:42 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
	[209.85.208.177])
	by smtp.gmail.com with ESMTPSA id o21sm404501ljg.93.2021.10.28.15.32.39
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 28 Oct 2021 15:32:40 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 188so13321015ljj.4
	for <cluster-devel@redhat.com>; Thu, 28 Oct 2021 15:32:39 -0700 (PDT)
X-Received: by 2002:a2e:89d4:: with SMTP id c20mr7772843ljk.191.1635460359642; 
	Thu, 28 Oct 2021 15:32:39 -0700 (PDT)
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
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 28 Oct 2021 15:32:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgzEKEYKRoR_abQRDO=R8xJX_FK+XC3gNhKfu=KLdxt3g@mail.gmail.com>
Message-ID: <CAHk-=wgzEKEYKRoR_abQRDO=R8xJX_FK+XC3gNhKfu=KLdxt3g@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 2:21 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> They do look fairly similar but we should have the information in the
> fault handler to distinguish: not a page fault (pte permission or p*d
> translation), in_task(), user address, fixup handler. But I agree the
> logic looks fragile.

So thinking about this a bit more, I think I have a possible
suggestion for how to handle this..

The pointer color fault (or whatever some other architecture may do to
generate sub-page faults) is not only not recoverable in the sense
that we can't fix it up, it also ends up being a forced SIGSEGV (ie it
can't be blocked - it has to either be caught or cause the process to
be killed).

And the thing is, I think we could just make the rule be that kernel
code that has this kind of retry loop with fault_in_pages() would
force an EFAULT on a pending SIGSEGV.

IOW, the pending SIGSEGV could effectively be exactly that "thread flag".

And that means that fault_in_xyz() wouldn't need to worry about this
situation at all: the regular copy_from_user() (or whatever flavor it
is - to/from/iter/whatever) would take the fault. And if it's a
regular page fault,. it would act exactly like it does now, so no
changes.

If it's a sub-page fault, we'd just make the rule be that we send a
SIGSEGV even if the instruction in question has a user exception
fixup.

Then we just need to add the logic somewhere that does "if active
pending SIGSEGV, return -EFAULT".

Of course, that logic might be in fault_in_xyz(), but it migth also be
a separate function entirely.

So this does effectively end up being a thread flag, but it's also
slightly more than that - it's that a sub-page fault from kernel mode
has semantics that a regular page fault does not.

The whole "kernel access doesn't cause SIGSEGV, but returns -EFAULT
instead" has always been an odd and somewhat wrong-headed thing. Of
course it should cause a SIGSEGV, but that's not how Unix traditionall
worked. We would just say "color faults always raise a signal, even if
the color fault was triggered in a system call".

(And I didn't check: I say "SIGSEGV" above, but maybe the pointer
color faults are actually SIGBUS? Doesn't change the end result).

                 Linus

