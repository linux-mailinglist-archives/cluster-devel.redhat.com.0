Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5798B3FA7E8
	for <lists+cluster-devel@lfdr.de>; Sun, 29 Aug 2021 00:19:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410--nh7RlS9Oju65_CZTEPeYA-1; Sat, 28 Aug 2021 18:19:20 -0400
X-MC-Unique: -nh7RlS9Oju65_CZTEPeYA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C8646409B;
	Sat, 28 Aug 2021 22:19:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33095604CC;
	Sat, 28 Aug 2021 22:19:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA9D54BB7B;
	Sat, 28 Aug 2021 22:19:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17SMJFhY006934 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 28 Aug 2021 18:19:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F1C72162399; Sat, 28 Aug 2021 22:19:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19F1A2162398
	for <cluster-devel@redhat.com>; Sat, 28 Aug 2021 22:19:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F6C9811E76
	for <cluster-devel@redhat.com>; Sat, 28 Aug 2021 22:19:12 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-518-EBnS059yM6eQebpCbYCxqw-1; Sat, 28 Aug 2021 18:19:08 -0400
X-MC-Unique: EBnS059yM6eQebpCbYCxqw-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mK6fI-00Gu1S-6O; Sat, 28 Aug 2021 22:19:04 +0000
Date: Sat, 28 Aug 2021 22:19:04 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <YSq2WJindB0pJPRb@zeniv-ca.linux.org.uk>
References: <CAHk-=wh5p6zpgUUoY+O7e74X9BZyODhnsqvv=xqnTaLRNj3d_Q@mail.gmail.com>
	<YSk7xfcHVc7CxtQO@zeniv-ca.linux.org.uk>
	<CAHk-=wjMyZLH+ta5SohAViSc10iPj-hRnHc-KPDoj1XZCmxdBg@mail.gmail.com>
	<YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
	<YSlftta38M4FsWUq@zeniv-ca.linux.org.uk>
	<20210827232246.GA1668365@agluck-desk2.amr.corp.intel.com>
	<87r1edgs2w.ffs@tglx> <YSqy+U/3lnF6K0ia@zeniv-ca.linux.org.uk>
	<YSq0mPAIBfqFC/NE@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
In-Reply-To: <YSq0mPAIBfqFC/NE@zeniv-ca.linux.org.uk>
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
Cc: cluster-devel <cluster-devel@redhat.com>, "Luck,
	Tony" <tony.luck@intel.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, x86@kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Borislav Petkov <bp@alien8.de>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 28, 2021 at 10:11:36PM +0000, Al Viro wrote:
> On Sat, Aug 28, 2021 at 10:04:41PM +0000, Al Viro wrote:
> > On Sat, Aug 28, 2021 at 11:47:03PM +0200, Thomas Gleixner wrote:
> > 
> > >   /* Try to handle #PF, but anything else is fatal. */
> > >   if (ret != -EFAULT)
> > >      return -EINVAL;
> > 
> > > which all end up in user_insn(). user_insn() returns 0 or the negated
> > > trap number, which results in -EFAULT for #PF, but for #MC the negated
> > > trap number is -18 i.e. != -EFAULT. IOW, there is no endless loop.
> > > 
> > > This used to be a problem before commit:
> > > 
> > >   aee8c67a4faa ("x86/fpu: Return proper error codes from user access functions")
> > > 
> > > and as the changelog says the initial reason for this was #GP going into
> > > the fault path, but I'm pretty sure that I also discussed the #MC angle with
> > > Borislav back then. Should have added some more comments there
> > > obviously.
> > 
> > ... or at least have that check spelled
> > 
> > 	if (ret != -X86_TRAP_PF)
> > 		return -EINVAL;
> > 
> > Unless I'm misreading your explanation, that is...
> 
> BTW, is #MC triggered on stored to a poisoned cacheline?  Existence of CLZERO
> would seem to argue against that...

How about taking __clear_user() out of copy_fpregs_to_sigframe()
and replacing the call of fault_in_pages_writeable() with
	if (!clear_user(buf_fx, fpu_user_xstate_size))
		goto retry;
	return -EFAULT;
in the caller?

