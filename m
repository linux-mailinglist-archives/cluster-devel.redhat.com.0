Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABA43FB6CB
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Aug 2021 15:16:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-xQoXeSU1OfCoT1kqyIJ5pw-1; Mon, 30 Aug 2021 09:15:58 -0400
X-MC-Unique: xQoXeSU1OfCoT1kqyIJ5pw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53740105146F;
	Mon, 30 Aug 2021 13:15:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4575F60939;
	Mon, 30 Aug 2021 13:15:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B978181A0F8;
	Mon, 30 Aug 2021 13:15:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RNNxwD005103 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 19:23:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EACF420C16C7; Fri, 27 Aug 2021 23:23:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E698220C16C6
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 23:23:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46FAF866DF4
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 23:23:56 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-262-0SCbUYh0OB2xmdW1c9haiA-1; Fri, 27 Aug 2021 19:23:52 -0400
X-MC-Unique: 0SCbUYh0OB2xmdW1c9haiA-1
X-IronPort-AV: E=McAfee;i="6200,9189,10089"; a="218081395"
X-IronPort-AV: E=Sophos;i="5.84,357,1620716400"; d="scan'208";a="218081395"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Aug 2021 16:22:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,357,1620716400"; d="scan'208";a="538679488"
Received: from agluck-desk2.sc.intel.com (HELO
	agluck-desk2.amr.corp.intel.com) ([10.3.52.146])
	by fmsmga002-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2021 16:22:47 -0700
Date: Fri, 27 Aug 2021 16:22:46 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20210827232246.GA1668365@agluck-desk2.amr.corp.intel.com>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-6-agruenba@redhat.com>
	<YSkz025ncjhyRmlB@zeniv-ca.linux.org.uk>
	<CAHk-=wh5p6zpgUUoY+O7e74X9BZyODhnsqvv=xqnTaLRNj3d_Q@mail.gmail.com>
	<YSk7xfcHVc7CxtQO@zeniv-ca.linux.org.uk>
	<CAHk-=wjMyZLH+ta5SohAViSc10iPj-hRnHc-KPDoj1XZCmxdBg@mail.gmail.com>
	<YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
	<YSlftta38M4FsWUq@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
In-Reply-To: <YSlftta38M4FsWUq@zeniv-ca.linux.org.uk>
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
X-Mailman-Approved-At: Mon, 30 Aug 2021 09:15:50 -0400
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 05/19] iov_iter: Introduce
	fault_in_iov_iter_writeable
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

On Fri, Aug 27, 2021 at 09:57:10PM +0000, Al Viro wrote:
> On Fri, Aug 27, 2021 at 09:48:55PM +0000, Al Viro wrote:
> 
> > 	[btrfs]search_ioctl()
> > Broken with memory poisoning, for either variant of semantics.  Same for
> > arm64 sub-page permission differences, I think.
> 
> 
> > So we have 3 callers where we want all-or-nothing semantics - two in
> > arch/x86/kernel/fpu/signal.c and one in btrfs.  HWPOISON will be a problem
> > for all 3, AFAICS...
> > 
> > IOW, it looks like we have two different things mixed here - one that wants
> > to try and fault stuff in, with callers caring only about having _something_
> > faulted in (most of the users) and one that wants to make sure we *can* do
> > stores or loads on each byte in the affected area.
> > 
> > Just accessing a byte in each page really won't suffice for the second kind.
> > Neither will g-u-p use, unless we teach it about HWPOISON and other fun
> > beasts...  Looks like we want that thing to be a separate primitive; for
> > btrfs I'd probably replace fault_in_pages_writeable() with clear_user()
> > as a quick fix for now...
> > 
> > Comments?
> 
> Wait a sec...  Wasn't HWPOISON a per-page thing?  arm64 definitely does have
> smaller-than-page areas with different permissions, so btrfs search_ioctl()
> has a problem there, but arch/x86/kernel/fpu/signal.c doesn't have to deal
> with that...
> 
> Sigh...  I really need more coffee...

On Intel poison is tracked at the cache line granularity. Linux
inflates that to per-page (because it can only take a whole page away).
For faults triggered in ring3 this is pretty much the same thing because
mm/memory_failure.c unmaps the page ... so while you see a #MC on first
access, you get #PF when you retry. The x86 fault handler sees a magic
signature in the page table and sends a SIGBUS.

But it's all different if the #MC is triggerd from ring0. The machine
check handler can't unmap the page. It just schedules task_work to do
the unmap when next returning to the user.

But if your kernel code loops and tries again without a return to user,
then your get another #MC.

-Tony

