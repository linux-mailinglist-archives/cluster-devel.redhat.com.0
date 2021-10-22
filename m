Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BCA437C79
	for <lists+cluster-devel@lfdr.de>; Fri, 22 Oct 2021 20:09:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-Ad11arVgMNSXgr_5ianVmA-1; Fri, 22 Oct 2021 14:09:33 -0400
X-MC-Unique: Ad11arVgMNSXgr_5ianVmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD8A4108087A;
	Fri, 22 Oct 2021 18:09:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BF165C1A3;
	Fri, 22 Oct 2021 18:09:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CAEA04A703;
	Fri, 22 Oct 2021 18:09:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MI6uBQ007076 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 14:06:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BAE4F40CFD11; Fri, 22 Oct 2021 18:06:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B684940CFD07
	for <cluster-devel@redhat.com>; Fri, 22 Oct 2021 18:06:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DB4D185A7A4
	for <cluster-devel@redhat.com>; Fri, 22 Oct 2021 18:06:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-346-B6xb-AzPNyK11SvaifFSvg-1;
	Fri, 22 Oct 2021 14:06:54 -0400
X-MC-Unique: B6xb-AzPNyK11SvaifFSvg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32ED1610A4;
	Fri, 22 Oct 2021 18:06:49 +0000 (UTC)
Date: Fri, 22 Oct 2021 19:06:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YXL9tRher7QVmq6N@arm.com>
References: <20211019134204.3382645-1-agruenba@redhat.com>
	<CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
	<YXBFqD9WVuU8awIv@arm.com>
	<CAHk-=wgv=KPZBJGnx_O5-7hhST8CL9BN4wJwtVuycjhv_1MmvQ@mail.gmail.com>
	<YXCbv5gdfEEtAYo8@arm.com>
	<CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 20, 2021 at 08:19:40PM -1000, Linus Torvalds wrote:
> On Wed, Oct 20, 2021 at 12:44 PM Catalin Marinas
> <catalin.marinas@arm.com> wrote:
> >
> > However, with MTE doing both get_user() every 16 bytes and
> > gup can get pretty expensive.
> 
> So I really think that anything that is performance-critical had
> better only do the "fault_in_write()" code path in the cold error path
> where you took a page fault.
[...]
> So I wouldn't worry too much about the performance concerns. It simply
> shouldn't be a common or hot path.
> 
> And yes, I've seen code that does that "fault_in_xyz()" before the
> critical operation that cannot take page faults, and does it
> unconditionally.
> 
> But then it isn't the "fault_in_xyz()" that should be blamed if it is
> slow, but the caller that does things the wrong way around.

Some more thinking out loud. I did some unscientific benchmarks on a
Raspberry Pi 4 with the filesystem in a RAM block device and a
"dd if=/dev/zero of=/mnt/test" writing 512MB in 1MB blocks. I changed
fault_in_readable() in linux-next to probe every 16 bytes:

- ext4 drops from around 261MB/s to 246MB/s: 5.7% penalty

- btrfs drops from around 360MB/s to 337MB/s: 6.4% penalty

For generic_perform_write() Dave Hansen attempted to move the fault-in
after the uaccess in commit 998ef75ddb57 ("fs: do not prefault
sys_write() user buffer pages"). This was reverted as it was exposing an
ext4 bug. I don't whether it was fixed but re-applying Dave's commit
avoids the performance drop.

btrfs_buffered_write() has a comment about faulting pages in before
locking them in prepare_pages(). I suspect it's a similar problem and
the fault_in() could be moved, though I can't say I understand this code
well enough.

Probing only the first byte(s) in fault_in() would be ideal, no need to
go through all filesystems and try to change the uaccess/probing order.

-- 
Catalin

