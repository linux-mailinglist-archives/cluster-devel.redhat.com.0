Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B293435052
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Oct 2021 18:37:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-Lvq6nTorNzyAGlnNvNJfKg-1; Wed, 20 Oct 2021 12:37:19 -0400
X-MC-Unique: Lvq6nTorNzyAGlnNvNJfKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B60A380363B;
	Wed, 20 Oct 2021 16:37:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72EF660CC3;
	Wed, 20 Oct 2021 16:37:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEB0F1800FE4;
	Wed, 20 Oct 2021 16:37:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KGbAVg019618 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 12:37:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7FA671007259; Wed, 20 Oct 2021 16:37:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7ADD811558B6
	for <cluster-devel@redhat.com>; Wed, 20 Oct 2021 16:37:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 897A41097B00
	for <cluster-devel@redhat.com>; Wed, 20 Oct 2021 16:37:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-553-XwhjL_pdPSum7FUfS2ZArA-1;
	Wed, 20 Oct 2021 12:37:03 -0400
X-MC-Unique: XwhjL_pdPSum7FUfS2ZArA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0616061374;
	Wed, 20 Oct 2021 16:36:59 +0000 (UTC)
Date: Wed, 20 Oct 2021 17:36:56 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YXBFqD9WVuU8awIv@arm.com>
References: <20211019134204.3382645-1-agruenba@redhat.com>
	<CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 19, 2021 at 05:40:13AM -1000, Linus Torvalds wrote:
> On Tue, Oct 19, 2021 at 3:42 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >  * Will Catalin Marinas's work for supporting arm64 sub-page faults
> >    be queued behind these patches?  We have an overlap in
> >    fault_in_[pages_]readable fault_in_[pages_]writeable, so one of
> >    the two patch queues will need some adjustments.
> 
> I think that on the whole they should be developed separately, I don't
> think it's going to be a particularly difficult conflict.
> 
> That whole discussion does mean that I suspect that we'll have to
> change fault_in_iov_iter_writeable() to do the "every 16 bytes" or
> whatever thing, and make it use an actual atomic "add zero" or
> whatever rather than walk the page tables. But that's a conceptually
> separate discussion from this one, I wouldn't actually want to mix up
> the two issues too much.

I agree we shouldn't mix the two at the moment. The MTE fix requires
some more thinking and it's not 5.16 material yet.

The atomic "add zero" trick isn't that simple for MTE since the arm64
atomic or exclusive instructions run with kernel privileges and
therefore with the kernel tag checking mode. We could toggle the mode to
match user's just for those atomic ops but it will make this probing
even more expensive (though normally it's done on the slow path).

The quick/backportable fix for MTE is probably to just disable tag
checking on user addresses during pagefault_disabled(). As I mentioned
in the other thread, a more elaborate fix I think is to change the
uaccess routines to update an error code somewhere in a similar way to
the arm64 __put_user_error(). But that would require changing lots of
callers.

-- 
Catalin

