Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC154C520A
	for <lists+cluster-devel@lfdr.de>; Sat, 26 Feb 2022 00:23:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-E43Ad_k4M7uO4hpbwCUckA-1; Fri, 25 Feb 2022 18:23:56 -0500
X-MC-Unique: E43Ad_k4M7uO4hpbwCUckA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E8226D4E0;
	Fri, 25 Feb 2022 23:23:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D54D82AFC;
	Fri, 25 Feb 2022 23:23:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 376091809C98;
	Fri, 25 Feb 2022 23:23:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21PNNg0H026713 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 25 Feb 2022 18:23:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C98CD141DC2A; Fri, 25 Feb 2022 23:23:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C40CC14171FE
	for <cluster-devel@redhat.com>; Fri, 25 Feb 2022 23:23:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAE56811E75
	for <cluster-devel@redhat.com>; Fri, 25 Feb 2022 23:23:42 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-170-O_vqIZ2dN-mshE2z_IwSKg-1; Fri, 25 Feb 2022 18:23:41 -0500
X-MC-Unique: O_vqIZ2dN-mshE2z_IwSKg-1
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
	[108.7.220.252]) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21PNLLWc016897
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 25 Feb 2022 18:21:22 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 6F72115C0038; Fri, 25 Feb 2022 18:21:21 -0500 (EST)
Date: Fri, 25 Feb 2022 18:21:21 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <YhlkcYjozFmt3Kl4@mit.edu>
References: <Yg0m6IjcNmfaSokM@google.com> <Yhks88tO3Em/G370@mit.edu>
	<YhlBUCi9O30szf6l@sol.localdomain> <YhlFRoJ3OdYMIh44@mit.edu>
	<YhlIvw00Y4MkAgxX@mit.edu>
	<2f9933b3-a574-23e1-e632-72fc29e582cf@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <2f9933b3-a574-23e1-e632-72fc29e582cf@nvidia.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
	Ritesh Harjani <riteshh@linux.ibm.com>,
	linux-ext4@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
	Christoph Hellwig <hch@lst.de>, Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: Re: [Cluster-devel] [PATCH -v3] ext4: don't BUG if kernel
 subsystems dirty pages without asking ext4 first
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

On Fri, Feb 25, 2022 at 01:33:33PM -0800, John Hubbard wrote:
> On 2/25/22 13:23, Theodore Ts'o wrote:
> > [un]pin_user_pages_remote is dirtying pages without properly warning
> > the file system in advance.  This was noted by Jan Kara in 2018[1] and
> 
> In 2018, [un]pin_user_pages_remote did not exist. And so what Jan reported
> was actually that dio_bio_complete() was calling set_page_dirty_lock()
> on pages that were not (any longer) set up for that.

Fair enough, there are two problems that are getting conflated here,
and that's my bad.  The problem which Jan pointed out is one where the
Direct I/O read path triggered a page fault, so page_mkwrite() was
actually called.  So in this case, the file system was actually
notified, and the page was marked dirty after the file system was
notified.  But then the DIO read was racing with the page cleaner,
which would call writepage(), and then clear the page, and then remove
the buffer_heads.  Then dio_bio_complete() would call set_page_dirty()
a second time, and that's what would trigger the BUG.

But in the syzbot reproducer, it's a different problem.  In this case,
process_vm_writev() calling [un]pin_user_pages_remote(), and
page_mkwrite() is never getting called.  So there is no need to race
with the page cleaner, and so the BUG triggers much more reliably.

> > more recently has resulted in bug reports by Syzbot in various Android
> > kernels[2].
> > 
> > This is technically a bug in mm/gup.c, but arguably ext4 is fragile in
> 
> Is it, really? unpin_user_pages_dirty_lock() moved the set_page_dirty_lock()
> call into mm/gup.c, but that merely refactored things. The callers are
> all over the kernel, and those callers are what need changing in order
> to fix this.

>From my perspective, the bug is calling set_page_dirty() without first
calling the file system's page_mkwrite().  This is necessary since the
file system needs to allocate file system data blocks in preparation
for a future writeback.

Now, calling page_mkwrite() by itself is not enough, since the moment
you make the page dirty, the page cleaner could go ahead and call
writepage() behind your back and clean it.  In actual practice, with a
Direct I/O read request racing with writeback, this is race was quite
hard to hit, because the that would imply that the background
writepage() call would have to complete ahead of the synchronous read
request, and the block layer generally prioritizes synchronous reads
ahead of background write requests.  So in practice, this race was
***very*** hard to hit.  Jan may have reported it in 2018, but I don't
think I've ever seen it happen myself.

For process_vm_writev() this is a case where user pages are pinned and
then released in short order, so I suspect that race with the page
cleaner would also be very hard to hit.  But we could completely
remove the potential for the race, and also make things kinder for
f2fs and btrfs's compressed file write support, by making things work
much like the write(2) system call.  Imagine if we had a
"pin_user_pages_local()" which calls write_begin(), and a
"unpin_user_pages_local()" which calls write_end(), and the
presumption with the "[un]pin_user_pages_local" API is that you don't
hold the pinned pages for very long --- say, not across a system call
boundary, and then it would work the same way the write(2) system call
works does except that in the case of process_vm_writev(2) the pages
are identified by another process's address space where they happen to
be mapped.

This obviously doesn't work when pinning pages for remote DMA, because
in that case the time between pin_user_pages_remote() and
unpin_user_pages_remote() could be a long, long time, so that means we
can't use using write_begin/write_end; we'd need to call page_mkwrite()
when the pages are first pinned and then somehow prevent the page
cleaner from touching a dirty page which is pinned for use by the
remote DMA.

Does that make sense?

							- Ted

