Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0F44C1FB6
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Feb 2022 00:32:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-LiBbsa0ZMvOg-FF3RWishQ-1; Wed, 23 Feb 2022 18:32:18 -0500
X-MC-Unique: LiBbsa0ZMvOg-FF3RWishQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22FAF801AAD;
	Wed, 23 Feb 2022 23:32:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8B245DBA3;
	Wed, 23 Feb 2022 23:32:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 791451809C98;
	Wed, 23 Feb 2022 23:32:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21NNW2RT007232 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Feb 2022 18:32:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A423976EE; Wed, 23 Feb 2022 23:32:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F4BD79DC
	for <cluster-devel@redhat.com>; Wed, 23 Feb 2022 23:31:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5851A85A5A8
	for <cluster-devel@redhat.com>; Wed, 23 Feb 2022 23:31:57 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-339-k3PFcp4QOOKyvYA_n1MHwA-1; Wed, 23 Feb 2022 18:31:53 -0500
X-MC-Unique: k3PFcp4QOOKyvYA_n1MHwA-1
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
	[108.7.220.252]) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21NNVXAJ022888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 23 Feb 2022 18:31:34 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 7F40815C0036; Wed, 23 Feb 2022 18:31:33 -0500 (EST)
Date: Wed, 23 Feb 2022 18:31:33 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <YhbD1T7qhgnz4myM@mit.edu>
References: <Yg0m6IjcNmfaSokM@google.com>
	<82d0f4e4-c911-a245-4701-4712453592d9@nvidia.com>
	<Yg8bxiz02WBGf6qO@mit.edu>
	<7bd88058-2a9a-92a6-2280-43c805b516c3@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <7bd88058-2a9a-92a6-2280-43c805b516c3@nvidia.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Ritesh Harjani <riteshh@linux.ibm.com>,
	linux-ext4@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
	Christoph Hellwig <hch@lst.de>, Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: Re: [Cluster-devel] [REPORT] kernel BUG at fs/ext4/inode.c:2620 -
	page_buffers()
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

On Thu, Feb 17, 2022 at 10:33:34PM -0800, John Hubbard wrote:
> 
> Just a small thing I'll say once, to get it out of my system. No action
> required here, I just want it understood:
> 
> Before commit 803e4572d7c5 ("mm/process_vm_access: set FOLL_PIN via
> pin_user_pages_remote()"), you would have written that like this:
> 
> "process_vm_writev() is dirtying pages without properly warning the file
> system in advance..."
> 
> Because, there were many callers that were doing this:
> 
>     get_user_pages*()
>     ...use the pages...
> 
>     for_each_page() {
>             set_page_dirty*()
>             put_page()
>     }

Sure, but that's not sufficient when modifying file-backed pages.
Previously, there was only two ways of modifying file-backed pages in
the page cache --- either using the write(2) system call, or when a
mmaped page is modified by the userspace.

In the case of write(2), the file system gets notified before the page
cache is modified by a call to the address operation's write_begin()
call, and after the page cache is modified, the address operation's
write_end() call lets the file system know that the modification is
done.  After the write is done, the 30 second writeback timer is
triggered, and in the case of ext4's data=journalling mode, we close
the ext4 micro-transation (and therefore the time between write_begin
and write_end calls needs to be minimal); otherwise this can block
ext4 transactions.

In the case of a user page fault, the address operation's
page_mkwrite() is called, and at that point we will allocate any
blocks needed to back memory if necessary (in the case of delayed
allocation, file system space has to get reserved).  The problem here
for remote access is that page_mkwrite() can block, and it can
potentially fail (e.g., with ENOSPC or ENOMEM).  This is also why we
can't just add the page buffers and do the file system allocation in
set_page_dirty(), since set_page_dirty() isn't allowed to block.

One approach might be to make all of the pages writeable when
pin_user_pages_remote() is called.  That that would mean that in the
case of remote access via process_vm_writev or RDMA, all of the blocks
will be allocated early.  But that's probably better since at that
point the userspace code is in a position to receive the error when
setting up the RDMA memory, and we don't want to be asking the file
system to do block allocation when incoming data is coming in from
Infiniband or iWARP.

> I see that ext4_warning_inode() has rate limiting, but it doesn't look
> like it's really intended for a per-page rate. It looks like it is
> per-superblock (yes?), so I suspect one instance of this problem, with
> many pages involved, could hit the limit.
> 
> Often, WARN_ON_ONCE() is used with per-page assertions. That's not great
> either, but it might be better here. OTOH, I have minimal experience
> with ext4_warning_inode() and maybe it really is just fine with per-page
> failure rates.

With the syzbot reproducer, we're not actually triggering the rate
limiter, since the ext4 warning is only getting hit a bit more than
once every 4 seconds.  And I'm guessing that in the real world, people
aren't actually trying to do remote direct access to file-backed
memory, at least not using ext4, since that's an invitation to a
kernel crash, and we would have gotten user complaints.  If some user
actually tries to use process_vm_writev for realsies, as opposed to a
random fuzzer or from a malicious program , we do want to warn them
about the potential data loss, so I'd prefer to warn once for each
inode --- but I'm not convinced that it's worth the effort.

Cheers,

						- Ted

