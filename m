Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A644CA201
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Mar 2022 11:17:21 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-olZjzBloNcS5OMcItLyU1A-1; Wed, 02 Mar 2022 05:17:19 -0500
X-MC-Unique: olZjzBloNcS5OMcItLyU1A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0217C824FA6;
	Wed,  2 Mar 2022 10:17:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69A6570D22;
	Wed,  2 Mar 2022 10:17:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6EC281809C83;
	Wed,  2 Mar 2022 10:17:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 222AHCEI023968 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Mar 2022 05:17:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 525832166B13; Wed,  2 Mar 2022 10:17:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DD092166B17
	for <cluster-devel@redhat.com>; Wed,  2 Mar 2022 10:17:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81BD2811E76
	for <cluster-devel@redhat.com>; Wed,  2 Mar 2022 10:17:07 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-186-9d6WPbucPsiyKQDdQMJ0DA-1; Wed, 02 Mar 2022 05:17:05 -0500
X-MC-Unique: 9d6WPbucPsiyKQDdQMJ0DA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 41414B81F60;
	Wed,  2 Mar 2022 10:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0FCC004E1;
	Wed,  2 Mar 2022 10:17:02 +0000 (UTC)
Date: Wed, 2 Mar 2022 10:17:01 +0000
From: Filipe Manana <fdmanana@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <Yh9EHfl3sYJHeo3T@debian9.Home>
References: <1f34c8435fed21e9583492661ceb20d642a75699.1646058596.git.fdmanana@suse.com>
	<20220228223830.GR59715@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20220228223830.GR59715@dread.disaster.area>
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
Cc: cluster-devel@redhat.com, djwong@kernel.org, josef@toxicpanda.com,
	linux-xfs@vger.kernel.org, Filipe Manana <fdmanana@suse.com>,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] iomap: fix incomplete async dio reads
 when using IOMAP_DIO_PARTIAL
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

On Tue, Mar 01, 2022 at 09:38:30AM +1100, Dave Chinner wrote:
> On Mon, Feb 28, 2022 at 02:32:03PM +0000, fdmanana@kernel.org wrote:
> > From: Filipe Manana <fdmanana@suse.com>
> > 
> > Some users recently reported that MariaDB was getting a read corruption
> > when using io_uring on top of btrfs. This started to happen in 5.16,
> > after commit 51bd9563b6783d ("btrfs: fix deadlock due to page faults
> > during direct IO reads and writes"). That changed btrfs to use the new
> > iomap flag IOMAP_DIO_PARTIAL and to disable page faults before calling
> > iomap_dio_rw(). This was necessary to fix deadlocks when the iovector
> > corresponds to a memory mapped file region. That type of scenario is
> > exercised by test case generic/647 from fstests, and it also affected
> > gfs2, which, besides btrfs, is the only user of IOMAP_DIO_PARTIAL.
> > 
> > For this MariaDB scenario, we attempt to read 16K from file offset X
> > using IOCB_NOWAIT and io_uring. In that range we have 4 extents, each
> > with a size of 4K, and what happens is the following:
> > 
> > 1) btrfs_direct_read() disables page faults and calls iomap_dio_rw();
> > 
> > 2) iomap creates a struct iomap_dio object, its reference count is
> >    initialized to 1 and its ->size field is initialized to 0;
> > 
> > 3) iomap calls btrfs_iomap_begin() with file offset X, which finds the
> 
> You mean btrfs_dio_iomap_begin()?

Yes, correct.

> 
> >    first 4K extent, and setups an iomap for this extent consisting of
> >    a single page;
> 
> So we have IOCB_NOWAIT, which means btrfs_dio_iomap_begin() is being
> passed IOMAP_NOWAIT and so knows it is being asked
> to map an extent for an IO that is on a non-blocking path.
> 
> btrfs_dio_iomap_begin() doesn't appear to support NOWAIT semantics
> at all - it will block doing writeback IO, memory allocation, extent
> locking, transaction reservations, extent allocation, etc....

We do have some checks for NOWAIT before getting into btrfs_dio_iomap_begin(),
but they are only for the write path, and they are incomplete. Some are a bit
tricky to deal with, but yes, there's several cases that are either missing
or need to be improved.

> 
> That, to me, looks like the root cause of the problem here -
> btrfs_dio_iomap_begin() is not guaranteeing non-blocking atomic IO
> semantics for IOCB_NOWAIT IO.
> 
> In the case above, given that the extent lookup only found a 4kB
> extent, we know that it doesn't span the entire requested IO range.
> We also known that we cannot tell if we'll block on subsequent
> mappings of the IO range, and hence no guarantee can be given that
> IOCB_NOWAIT IO will not block when it is too late to back out with a
> -EAGAIN error.
> 
> Hence this whole set of problems could be avoided if
> btrfs_dio_iomap_begin() returns -EAGAIN if it can't map the entire
> IO into a single extent without blocking when IOMAP_NOWAIT is set?
> That's exactly what XFS does in xfs_direct_iomap_write_begin():
> 
>         /*
>          * NOWAIT and OVERWRITE I/O needs to span the entire requested I/O with
>          * a single map so that we avoid partial IO failures due to the rest of
>          * the I/O range not covered by this map triggering an EAGAIN condition
>          * when it is subsequently mapped and aborting the I/O.
>          */
>         if (flags & (IOMAP_NOWAIT | IOMAP_OVERWRITE_ONLY)) {
>                 error = -EAGAIN;
>                 if (!imap_spans_range(&imap, offset_fsb, end_fsb))
>                         goto out_unlock;
>         }
> 
> Basically, I'm thinking that IOMAP_NOWAIT and IOMAP_DIO_PARTIAL
> should be exclusive functionality - if you are doing IOMAP_NOWAIT
> then the entire IO must succeed without blocking, and if it doesn't
> then we return -EAGAIN and the caller retries without IOCB_NOWAIT
> set and so then we run with IOMAP_DIO_PARTIAL semantics in a thread
> that can actually block....

Indeed, I had not considered that, that is simple and effective, plus
it can be done exclusively in btrfs code, no need to change iomap.

> 
> .....
> 
> > 11) At iomap_dio_complete() we adjust the iocb->ki_pos from X to X + 4K
> >     and return 4K (the amount of io done) to iomap_dio_complete_work();
> > 
> > 12) iomap_dio_complete_work() calls the iocb completion callback,
> >     iocb->ki_complete() with a second argument value of 4K (total io
> >     done) and the iocb with the adjust ki_pos of X + 4K. This results
> >     in completing the read request for io_uring, leaving it with a
> >     result of 4K bytes read, and only the first page of the buffer
> >     filled in, while the remaining 3 pages, corresponding to the other
> >     3 extents, were not filled;
> > 
> > 13) For the application, the result is unexpected because if we ask
> >     to read N bytes, it expects to get N bytes read as long as those
> >     N bytes don't cross the EOF (i_size).
> 
> Yeah, that's exactly the sort of problem we were having with XFS
> with partial DIO completions due to needing multiple iomap iteration
> loops to complete a single IO. Hence IOMAP_NOWAIT now triggers the
> above range check and aborts before we start...

Interesting.

> 
> > 
> > So fix this by making __iomap_dio_rw() assign true to the boolean variable
> > 'wait_for_completion' when we have IOMAP_DIO_PARTIAL set, we did some
> > progress for a read and we have not crossed the EOF boundary. Do this even
> > if the read has IOCB_NOWAIT set, as it's the only way to avoid providing
> > an unexpected result to an application.
> 
> That's highly specific and ultimately will be fragile, IMO. I'd much
> prefer that *_iomap_begin_write() implementations simply follow
> IOMAP_NOWAIT requirements to ensure that any DIO that needs multiple
> mappings if punted to a context that can block...

Yes, agreed.

Thanks for your feedback Dave, it provided a really good insight into this
problem (and others).

> 
> Cheers,
> 
> Dave.
> -- 
> Dave Chinner
> david@fromorbit.com

