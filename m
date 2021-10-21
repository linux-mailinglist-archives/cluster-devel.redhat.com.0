Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7836E435EA0
	for <lists+cluster-devel@lfdr.de>; Thu, 21 Oct 2021 12:06:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-DZGpP5wEPiC1f5BipDQyUw-1; Thu, 21 Oct 2021 06:06:25 -0400
X-MC-Unique: DZGpP5wEPiC1f5BipDQyUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21C189F937;
	Thu, 21 Oct 2021 10:06:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2507F60C22;
	Thu, 21 Oct 2021 10:06:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E1D28180BAD1;
	Thu, 21 Oct 2021 10:06:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19LA61aS004844 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 21 Oct 2021 06:06:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 79BDE40D1B9F; Thu, 21 Oct 2021 10:06:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 759DC40D1B9E
	for <cluster-devel@redhat.com>; Thu, 21 Oct 2021 10:06:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 175F918A01A9
	for <cluster-devel@redhat.com>; Thu, 21 Oct 2021 10:06:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-94-zTHOz4wpNmWfnq3bsUTz3g-1; 
	Thu, 21 Oct 2021 06:05:57 -0400
X-MC-Unique: zTHOz4wpNmWfnq3bsUTz3g-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 064A8610FF;
	Thu, 21 Oct 2021 10:05:53 +0000 (UTC)
Date: Thu, 21 Oct 2021 11:05:50 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YXE7fhDkqJbfDk6e@arm.com>
References: <YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
	<YSqOUb7yZ7kBoKRY@zeniv-ca.linux.org.uk> <YS40qqmXL7CMFLGq@arm.com>
	<YS5KudP4DBwlbPEp@zeniv-ca.linux.org.uk> <YWR2cPKeDrc0uHTK@arm.com>
	<CAHk-=wjvQWj7mvdrgTedUW50c2fkdn6Hzxtsk-=ckkMrFoTXjQ@mail.gmail.com>
	<YWSnvq58jDsDuIik@arm.com>
	<CAHk-=wiNWOY5QW5ZJukt_9pHTWvrJhE2=DxPpEtFHAWdzOPDTg@mail.gmail.com>
	<CAHc6FU7bpjAxP+4dfE-C0pzzQJN1p=C2j3vyXwUwf7fF9JF72w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU7bpjAxP+4dfE-C0pzzQJN1p=C2j3vyXwUwf7fF9JF72w@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 21, 2021 at 02:46:10AM +0200, Andreas Gruenbacher wrote:
> On Tue, Oct 12, 2021 at 1:59 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> > On Mon, Oct 11, 2021 at 2:08 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > >
> > > +#ifdef CONFIG_ARM64_MTE
> > > +#define FAULT_GRANULE_SIZE     (16)
> > > +#define FAULT_GRANULE_MASK     (~(FAULT_GRANULE_SIZE-1))
> >
> > [...]
> >
> > > If this looks in the right direction, I'll do some proper patches
> > > tomorrow.
> >
> > Looks fine to me. It's going to be quite expensive and bad for caches, though.
> >
> > That said, fault_in_writable() is _supposed_ to all be for the slow
> > path when things go south and the normal path didn't work out, so I
> > think it's fine.
> 
> Let me get back to this; I'm actually not convinced that we need to
> worry about sub-page-size fault granules in fault_in_pages_readable or
> fault_in_pages_writeable.
> 
> From a filesystem point of view, we can get into trouble when a
> user-space read or write triggers a page fault while we're holding
> filesystem locks, and that page fault ends up calling back into the
> filesystem. To deal with that, we're performing those user-space
> accesses with page faults disabled.

Yes, this makes sense.

> When a page fault would occur, we
> get back an error instead, and then we try to fault in the offending
> pages. If a page is resident and we still get a fault trying to access
> it, trying to fault in the same page again isn't going to help and we
> have a true error.

You can't be sure the second fault is a true error. The unlocked
fault_in_*() may race with some LRU scheme making the pte not accessible
or a write-back making it clean/read-only. copy_to_user() with
pagefault_disabled() fails again but that's a benign fault. The
filesystem should re-attempt the fault-in (gup would correct the pte),
disable page faults and copy_to_user(), potentially in an infinite loop.
If you bail out on the second/third uaccess following a fault_in_*()
call, you may get some unexpected errors (though very rare). Maybe the
filesystems avoid this problem somehow but I couldn't figure it out.

> We're clearly looking at memory at a page
> granularity; faults at a sub-page level don't matter at this level of
> abstraction (but they do show similar error behavior). To avoid
> getting stuck, when it gets a short result or -EFAULT, the filesystem
> implements the following backoff strategy: first, it tries to fault in
> a number of pages. When the read or write still doesn't make progress,
> it scales back and faults in a single page. Finally, when that still
> doesn't help, it gives up. This strategy is needed for actual page
> faults, but it also handles sub-page faults appropriately as long as
> the user-space access functions give sensible results.

As I said above, I think with this approach there's a small chance of
incorrectly reporting an error when the fault is recoverable. If you
change it to an infinite loop, you'd run into the sub-page fault
problem.

There are some places with such infinite loops: futex_wake_op(),
search_ioctl() in the btrfs code. I still have to get my head around
generic_perform_write() but I think we get away here because it faults
in the page with a get_user() rather than gup (and copy_from_user() is
guaranteed to make progress if any bytes can still be accessed).

-- 
Catalin

