Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B54A543B979
	for <lists+cluster-devel@lfdr.de>; Tue, 26 Oct 2021 20:24:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-wj6kMt-kMtCP4D3bA670HA-1; Tue, 26 Oct 2021 14:24:40 -0400
X-MC-Unique: wj6kMt-kMtCP4D3bA670HA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC481802B52;
	Tue, 26 Oct 2021 18:24:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE8A5AFD91;
	Tue, 26 Oct 2021 18:24:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F14404A703;
	Tue, 26 Oct 2021 18:24:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19QIORsv020486 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 26 Oct 2021 14:24:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A88140D1B9E; Tue, 26 Oct 2021 18:24:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36C5A40D1B9D
	for <cluster-devel@redhat.com>; Tue, 26 Oct 2021 18:24:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E387899EC3
	for <cluster-devel@redhat.com>; Tue, 26 Oct 2021 18:24:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-361-otfvuBSZMammkVsHrzuPbQ-1;
	Tue, 26 Oct 2021 14:24:25 -0400
X-MC-Unique: otfvuBSZMammkVsHrzuPbQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9302360F9D;
	Tue, 26 Oct 2021 18:24:21 +0000 (UTC)
Date: Tue, 26 Oct 2021 19:24:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YXhH0sBSyTyz5Eh2@arm.com>
References: <20211019134204.3382645-1-agruenba@redhat.com>
	<CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
	<YXBFqD9WVuU8awIv@arm.com>
	<CAHk-=wgv=KPZBJGnx_O5-7hhST8CL9BN4wJwtVuycjhv_1MmvQ@mail.gmail.com>
	<YXCbv5gdfEEtAYo8@arm.com>
	<CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
	<YXL9tRher7QVmq6N@arm.com>
	<CAHk-=wg4t2t1AaBDyMfOVhCCOiLLjCB5TFVgZcV4Pr8X2qptJw@mail.gmail.com>
	<CAHc6FU7BEfBJCpm8wC3P+8GTBcXxzDWcp6wAcgzQtuaJLHrqZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU7BEfBJCpm8wC3P+8GTBcXxzDWcp6wAcgzQtuaJLHrqZA@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 25, 2021 at 09:00:43PM +0200, Andreas Gruenbacher wrote:
> On Fri, Oct 22, 2021 at 9:23 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> > On Fri, Oct 22, 2021 at 8:06 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > Probing only the first byte(s) in fault_in() would be ideal, no need to
> > > go through all filesystems and try to change the uaccess/probing order.
> >
> > Let's try that. Or rather: probing just the first page - since there
> > are users like that btrfs ioctl, and the direct-io path.
> 
> For direct I/O, we actually only want to trigger page fault-in so that
> we can grab page references with bio_iov_iter_get_pages. Probing for
> sub-page error domains will only slow things down. If we hit -EFAULT
> during the actual copy-in or copy-out, we know that the error can't be
> page fault related. Similarly, in the buffered I/O case, we only
> really care about the next byte, so any probing beyond that is
> unnecessary.
> 
> So maybe we should split the sub-page error domain probing off from
> the fault-in functions. Or at least add an argument to the fault-in
> functions that specifies the amount of memory to probe.

My preferred option is not to touch fault-in for sub-page faults (though
I have some draft patches, they need testing).

All this fault-in and uaccess with pagefaults_disabled() is needed to
avoid a deadlock when the uaccess fault handling would take the same
lock. With sub-page faults, the kernel cannot fix it up anyway, so the
arch code won't even attempt call handle_mm_fault() (it is not an mm
fault). But the problem is the copy_*_user() etc. API that can only
return the number of bytes not copied. That's what I think should be
fixed. fault_in() feels like the wrong place to address this when it's
not an mm fault.

As for fault_in() getting another argument with the amount of sub-page
probing to do, I think the API gets even more confusing. I was also
thinking, with your patches for fault_in() now returning size_t, is the
expectation to be precise in what cannot be copied? We don't have such
requirement for copy_*_user().

While more intrusive, I'd rather change copy_page_from_iter_atomic()
etc. to take a pointer where to write back an error code. If it's
-EFAULT, retry the loop. If it's -EACCES/EPERM just bail out. Or maybe
simply a bool set if there was an mm fault to be retried. Yet another
option to return an -EAGAIN if it could not process the mm fault due to
page faults being disabled.

Happy to give this a try, unless there's a strong preference for the
fault_in() fix-up (well, I can do both options and post them).

-- 
Catalin

