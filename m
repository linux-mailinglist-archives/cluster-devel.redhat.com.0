Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B2E435614
	for <lists+cluster-devel@lfdr.de>; Thu, 21 Oct 2021 00:48:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-c8nvNZsCPpKIxytcE2zlEw-1; Wed, 20 Oct 2021 18:48:08 -0400
X-MC-Unique: c8nvNZsCPpKIxytcE2zlEw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF55C806688;
	Wed, 20 Oct 2021 22:48:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBC5710023AB;
	Wed, 20 Oct 2021 22:48:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 75A404A703;
	Wed, 20 Oct 2021 22:48:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KMiUkh018455 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 18:44:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7E70611558B6; Wed, 20 Oct 2021 22:44:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7991111558B5
	for <cluster-devel@redhat.com>; Wed, 20 Oct 2021 22:44:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E418899EC1
	for <cluster-devel@redhat.com>; Wed, 20 Oct 2021 22:44:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-161-Kis-_qVDNWeRM0xVwcEeaw-1;
	Wed, 20 Oct 2021 18:44:21 -0400
X-MC-Unique: Kis-_qVDNWeRM0xVwcEeaw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CBE26115B;
	Wed, 20 Oct 2021 22:44:18 +0000 (UTC)
Date: Wed, 20 Oct 2021 23:44:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YXCbv5gdfEEtAYo8@arm.com>
References: <20211019134204.3382645-1-agruenba@redhat.com>
	<CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
	<YXBFqD9WVuU8awIv@arm.com>
	<CAHk-=wgv=KPZBJGnx_O5-7hhST8CL9BN4wJwtVuycjhv_1MmvQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgv=KPZBJGnx_O5-7hhST8CL9BN4wJwtVuycjhv_1MmvQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

On Wed, Oct 20, 2021 at 10:11:19AM -1000, Linus Torvalds wrote:
> On Wed, Oct 20, 2021 at 6:37 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > The atomic "add zero" trick isn't that simple for MTE since the arm64
> > atomic or exclusive instructions run with kernel privileges and
> > therefore with the kernel tag checking mode.
> 
> Are there any instructions that are useful for "probe_user_write()"
> kind of thing?

If it's on a user address, the only single-instruction that works with
MTE is STTR (as in put_user()) but that's destructive. Other "add zero"
constructs require some potentially expensive system register accesses
just to set the tag checking mode of the current task.

A probe_user_write() on the kernel linear address involves reading the
tag from memory and comparing it with the tag in the user pointer. In
addition, it needs to take into account the current task's tag checking
mode and the vma vm_flags. We should have most of the information in the
gup code.

> Although at least for MTE, I think the solution was to do a regular
> read, and that checks the tag, and then we could use the gup machinery
> for the writability checks.

Yes, for MTE this should work. For CHERI I think an "add zero" would
do the trick (it should have atomics that work on capabilities
directly). However, with MTE doing both get_user() every 16 bytes and
gup can get pretty expensive. The problematic code is
fault_in_safe_writable() in this series.

I can give this 16-byte probing in gup a try (on top of -next) but IMHO
we unnecessarily overload the fault_in_*() logic with something the
kernel cannot fix up. The only reason we do it is so that we get an
error code and bail out of a loop but the uaccess routines could be
extended to report the fault type instead. It looks like we pretty much
duplicate the uaccess in the fault_in_*() functions (four accesses per
cache line).

-- 
Catalin

