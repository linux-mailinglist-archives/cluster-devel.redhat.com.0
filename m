Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2491443AB9E
	for <lists+cluster-devel@lfdr.de>; Tue, 26 Oct 2021 07:16:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-NgoKHMRpPFeOINbjgSrsYA-1; Tue, 26 Oct 2021 01:16:38 -0400
X-MC-Unique: NgoKHMRpPFeOINbjgSrsYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F5A6362F8;
	Tue, 26 Oct 2021 05:16:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CB17100E107;
	Tue, 26 Oct 2021 05:16:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FC294E58F;
	Tue, 26 Oct 2021 05:16:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19Q5GF67013009 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 26 Oct 2021 01:16:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80A6740D1B9E; Tue, 26 Oct 2021 05:16:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BEC140D1B9D
	for <cluster-devel@redhat.com>; Tue, 26 Oct 2021 05:16:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64BB6811E8F
	for <cluster-devel@redhat.com>; Tue, 26 Oct 2021 05:16:15 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-160-0LNzuNwsOPi7h-IOszdgAA-1; Tue, 26 Oct 2021 01:16:13 -0400
X-MC-Unique: 0LNzuNwsOPi7h-IOszdgAA-1
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
	[72.74.133.215]) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 19Q5Crw3021006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 26 Oct 2021 01:12:54 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id C967515C3F84; Tue, 26 Oct 2021 01:12:53 -0400 (EDT)
Date: Tue, 26 Oct 2021 01:12:53 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YXeOVZqer+GFBkXO@mit.edu>
References: <20211019134204.3382645-1-agruenba@redhat.com>
	<CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
	<YXBFqD9WVuU8awIv@arm.com>
	<CAHk-=wgv=KPZBJGnx_O5-7hhST8CL9BN4wJwtVuycjhv_1MmvQ@mail.gmail.com>
	<YXCbv5gdfEEtAYo8@arm.com>
	<CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
	<YXL9tRher7QVmq6N@arm.com>
	<CAHc6FU6JC4ZOwA8t854WbNdmuiNL9DPq0FPga8guATaoCtvsaw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU6JC4ZOwA8t854WbNdmuiNL9DPq0FPga8guATaoCtvsaw@mail.gmail.com>
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
	Jan Kara <jack@suse.cz>, Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Paul Mackerras <paulus@ozlabs.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Darrick J. Wong" <djwong@kernel.org>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 25, 2021 at 08:24:26PM +0200, Andreas Gruenbacher wrote:
> > For generic_perform_write() Dave Hansen attempted to move the fault-in
> > after the uaccess in commit 998ef75ddb57 ("fs: do not prefault
> > sys_write() user buffer pages"). This was reverted as it was exposing an
> > ext4 bug. I don't [know] whether it was fixed but re-applying Dave's commit
> > avoids the performance drop.
> 
> Interesting. The revert of commit 998ef75ddb57 is in commit
> 00a3d660cbac. Maybe Dave and Ted can tell us more about what went
> wrong in ext4 and whether it's still an issue.

The context for the revert can be found here[1].

[1] https://lore.kernel.org/lkml/20151005152236.GA8140@thunk.org/

And "what went wrong in ext4" was fixed here[2].

[2] https://lore.kernel.org/lkml/20151005152236.GA8140@thunk.org/

which landed upstream as commit b90197b65518 ("ext4: use private
version of page_zero_new_buffers() for data=journal mode").

So it looks like the original issue which triggered the revert in 2015
should be addressed, and we can easily test it by using generic/208
with data=journal mode.

There also seems to be a related discussion about whether we should
unrevert 998ef75ddb57 here[3].  Hmm. there is a mention on that thread
in [3], "Side note: search for "iov_iter_fault_in_writeable()" on lkml
for a gfs2 patch-series that is buggy, exactly because it does *not*
use the atomic user space accesses, and just tries to do the fault-in
to hide the real bug."  I assume that's related to the discussion on
this thread?

[3] https://lore.kernel.org/all/3221175.1624375240@warthog.procyon.org.uk/T/#u

						- Ted

