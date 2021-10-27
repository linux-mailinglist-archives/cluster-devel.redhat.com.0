Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C59F743D187
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Oct 2021 21:18:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-Ze2aJq4CMJmPgcPjJH2VDQ-1; Wed, 27 Oct 2021 15:18:12 -0400
X-MC-Unique: Ze2aJq4CMJmPgcPjJH2VDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6697519200C1;
	Wed, 27 Oct 2021 19:18:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A568110429D0;
	Wed, 27 Oct 2021 19:18:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A2314EA2A;
	Wed, 27 Oct 2021 19:18:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19RJDCWF029211 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Oct 2021 15:13:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EAF8240D1B9E; Wed, 27 Oct 2021 19:13:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E73B240D1B9D
	for <cluster-devel@redhat.com>; Wed, 27 Oct 2021 19:13:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEE43811E78
	for <cluster-devel@redhat.com>; Wed, 27 Oct 2021 19:13:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-450-NH-S4X7WOV6RroSZv4HkCw-1;
	Wed, 27 Oct 2021 15:13:08 -0400
X-MC-Unique: NH-S4X7WOV6RroSZv4HkCw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8EAE960EB4;
	Wed, 27 Oct 2021 19:13:04 +0000 (UTC)
Date: Wed, 27 Oct 2021 20:13:01 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YXmkvfL9B+4mQAIo@arm.com>
References: <CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
	<YXBFqD9WVuU8awIv@arm.com>
	<CAHk-=wgv=KPZBJGnx_O5-7hhST8CL9BN4wJwtVuycjhv_1MmvQ@mail.gmail.com>
	<YXCbv5gdfEEtAYo8@arm.com>
	<CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
	<YXL9tRher7QVmq6N@arm.com>
	<CAHk-=wg4t2t1AaBDyMfOVhCCOiLLjCB5TFVgZcV4Pr8X2qptJw@mail.gmail.com>
	<CAHc6FU7BEfBJCpm8wC3P+8GTBcXxzDWcp6wAcgzQtuaJLHrqZA@mail.gmail.com>
	<YXhH0sBSyTyz5Eh2@arm.com>
	<CAHk-=wjWDsB-dDj+x4yr8h8f_VSkyB7MbgGqBzDRMNz125sZxw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjWDsB-dDj+x4yr8h8f_VSkyB7MbgGqBzDRMNz125sZxw@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 26, 2021 at 11:50:04AM -0700, Linus Torvalds wrote:
> On Tue, Oct 26, 2021 at 11:24 AM Catalin Marinas
> <catalin.marinas@arm.com> wrote:
> > While more intrusive, I'd rather change copy_page_from_iter_atomic()
> > etc. to take a pointer where to write back an error code.
[...]
> That said, the fact that these sub-page faults are always
> non-recoverable might be a hint to a solution to the problem: maybe we
> could extend the existing return code with actual negative error
> numbers.
> 
> Because for _most_ cases of "copy_to/from_user()" and friends by far,
> the only thing we look for is "zero for success".
> 
> We could extend the "number of bytes _not_ copied" semantics to say
> "negative means fatal", and because there are fairly few places that
> actually look at non-zero values, we could have a coccinelle script
> that actually marks those places.

As you already replied, there are some odd places where the returned
uncopied of bytes is used. Also for some valid cases like
copy_mount_options(), it's likely that it will fall back to
byte-at-a-time with MTE since it's a good chance it would hit a fault in
a 4K page (not a fast path though). I'd have to go through all the cases
and check whether the return value is meaningful. The iter_iov.c
functions and their callers also seem to make use of the bytes copied in
case they need to call iov_iter_revert() (though I suppose the
iov_iter_iovec_advance() would skip the update in case of an error).

As an alternative, you mentioned earlier that a per-thread fault status
was not feasible on x86 due to races. Was this only for the hw poison
case? I think the uaccess is slightly different.

We can add a current->non_recoverable_uaccess variable cleared on
pagefault_disable(), only set by uaccess faults and checked by the fs
code before re-attempting the fault_in(). An interrupt shouldn't do a
uaccess (well, if it does a _nofault one, we can detect in_interrupt()
in the MTE exception handler). Last time I looked at io_uring it was
running in a separate kernel thread, not sure whether this was changed.
I don't see what else would be racing with such
current->non_recoverable_uaccess variable. If that's doable, I think
it's the least intrusive approach.

-- 
Catalin

