Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6A243F1FE
	for <lists+cluster-devel@lfdr.de>; Thu, 28 Oct 2021 23:40:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-KYDUQ3ZpN-GAQKoA-smauw-1; Thu, 28 Oct 2021 17:40:45 -0400
X-MC-Unique: KYDUQ3ZpN-GAQKoA-smauw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDC8210A8E00;
	Thu, 28 Oct 2021 21:40:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92D172617D;
	Thu, 28 Oct 2021 21:40:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C73E1809C84;
	Thu, 28 Oct 2021 21:40:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19SLeaMw029986 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 28 Oct 2021 17:40:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80A172166B25; Thu, 28 Oct 2021 21:40:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A8162166B26
	for <cluster-devel@redhat.com>; Thu, 28 Oct 2021 21:40:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F3451066558
	for <cluster-devel@redhat.com>; Thu, 28 Oct 2021 21:40:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-157-XPAJPOBrPGy_CS0IyXjKxg-1;
	Thu, 28 Oct 2021 17:40:31 -0400
X-MC-Unique: XPAJPOBrPGy_CS0IyXjKxg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FD7360FF2;
	Thu, 28 Oct 2021 21:40:28 +0000 (UTC)
Date: Thu, 28 Oct 2021 22:40:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YXsYyWIKjvm6a9GX@arm.com>
References: <YXCbv5gdfEEtAYo8@arm.com>
	<CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
	<YXL9tRher7QVmq6N@arm.com>
	<CAHk-=wg4t2t1AaBDyMfOVhCCOiLLjCB5TFVgZcV4Pr8X2qptJw@mail.gmail.com>
	<CAHc6FU7BEfBJCpm8wC3P+8GTBcXxzDWcp6wAcgzQtuaJLHrqZA@mail.gmail.com>
	<YXhH0sBSyTyz5Eh2@arm.com>
	<CAHk-=wjWDsB-dDj+x4yr8h8f_VSkyB7MbgGqBzDRMNz125sZxw@mail.gmail.com>
	<YXmkvfL9B+4mQAIo@arm.com>
	<CAHk-=wjQqi9cw1Guz6a8oBB0xiQNF_jtFzs3gW0k7+fKN-mB1g@mail.gmail.com>
	<YXsUNMWFpmT1eQcX@arm.com>
MIME-Version: 1.0
In-Reply-To: <YXsUNMWFpmT1eQcX@arm.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 28, 2021 at 10:20:52PM +0100, Catalin Marinas wrote:
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
> 	unsigned long uaccess_flags;	/* we could use TIF_ flags */
> 
> 	uaccess_flags = begin_retriable_uaccess();
> 	copied = copy_page_from_iter_atomic(...);
> 	retry = end_retriable_uaccess(uaccess_flags);

It doesn't work with local flags, so it would need to be saved on
exception entry (interrupt, breakpoint etc.) on the stack, restore on
return. But the API would return pretty close (and probably still more
complicated than copy_*() returning an error code).

-- 
Catalin

