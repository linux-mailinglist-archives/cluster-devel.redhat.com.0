Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBA64CA576
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Mar 2022 14:04:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646226245;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=h4jUwD5CmiGcFMIQc1HZrTQmpgea2cy6d4c1OFQ/588=;
	b=EtdT/JoW2MH5GltWtOvOa1Zp1O+vzmlQ93PkR9e35wmkCEY9VtTplhVTZzvccgp3sgC8rc
	UgCNaegH7BdxwGjDn7aXt3dluKboTBIqEdRsQTwv+LZyOTOJzqi2VNQ7Apy6/p1+b0kzGi
	dyfSz9qIrmKnG8lcAHm9Nzlzr/fH0FE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-Yq-QugEKOn2BGLxZQvZfGw-1; Wed, 02 Mar 2022 08:04:02 -0500
X-MC-Unique: Yq-QugEKOn2BGLxZQvZfGw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DCE61091DA0;
	Wed,  2 Mar 2022 13:03:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3C76797C7;
	Wed,  2 Mar 2022 13:03:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1BD961809C98;
	Wed,  2 Mar 2022 13:03:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 222D3iq0014275 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Mar 2022 08:03:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BDDB3C159B3; Wed,  2 Mar 2022 13:03:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA54CC159F6
	for <cluster-devel@redhat.com>; Wed,  2 Mar 2022 13:03:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A045C801585
	for <cluster-devel@redhat.com>; Wed,  2 Mar 2022 13:03:44 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-28-DxmedSvNNV6ntC4ClCoXwA-1; Wed, 02 Mar 2022 08:03:42 -0500
X-MC-Unique: DxmedSvNNV6ntC4ClCoXwA-1
Received: by mail-wr1-f69.google.com with SMTP id
	e6-20020a5d4e86000000b001f045d4a962so433041wru.21
	for <cluster-devel@redhat.com>; Wed, 02 Mar 2022 05:03:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h4jUwD5CmiGcFMIQc1HZrTQmpgea2cy6d4c1OFQ/588=;
	b=mucCPimmuIQLVslUw3a7X9zspgoKPD8/8+05feoyk8oGUkqR8yHSPiv8yYjPIRM0LI
	o+XbZnAduEQA0clbRTWQ5Tc23G0NYmagS39W6GR8OvPRDptesb6r8M0WGpBNoomxYliN
	Pe/a8dRg3kBqdoTyCC5jhxYr8AwFtdRfgtvKDTvc1dEWVDnv6sVRwKIZ6BhFdsQ6XFB+
	nsqYygO/nqm8/2TJeb1AYygvVH6BI0oFpICaoeA8i5XPdJ/sNhusXG88bL+jLfQVV6je
	a6fF+iilBV7HBTHDFugaxsRvL/NUTS9R7XELvF0rCB6lCFqhBvStbPRpSPB4XXVKOhvo
	/Cww==
X-Gm-Message-State: AOAM533PvkTg/Zgj4nyX/sn+WGnn/ip8R5xfNmMci9XtJ330XeQco8U8
	rSMshhFC2OdVklfL4oU9+uzXZFoAS5iWrl3R3a2Rmy95hmGnuxp/T/o0eJqohSetxU84YvsDjQd
	lGESZf89/XOf23AsW90IUpSVCNiGG/wjY7YGE4g==
X-Received: by 2002:a5d:67ca:0:b0:1ed:d1e4:bce2 with SMTP id
	n10-20020a5d67ca000000b001edd1e4bce2mr22717383wrw.493.1646226220701;
	Wed, 02 Mar 2022 05:03:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+XpscBL2wfHTCik1tahwWVcz07rxvA/g/MFJrdyIBGmujyMJrPuE1lOaVi7g2ksDDmpxvaW5sb3t7HnD1jk8=
X-Received: by 2002:a5d:67ca:0:b0:1ed:d1e4:bce2 with SMTP id
	n10-20020a5d67ca000000b001edd1e4bce2mr22717362wrw.493.1646226220444;
	Wed, 02 Mar 2022 05:03:40 -0800 (PST)
MIME-Version: 1.0
References: <1f34c8435fed21e9583492661ceb20d642a75699.1646058596.git.fdmanana@suse.com>
	<20220228223830.GR59715@dread.disaster.area>
	<Yh9EHfl3sYJHeo3T@debian9.Home>
In-Reply-To: <Yh9EHfl3sYJHeo3T@debian9.Home>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 2 Mar 2022 14:03:28 +0100
Message-ID: <CAHc6FU7jBeUEAaB0BupypG1zdxf4shF5T56cHZCD_xXi-jeB+Q@mail.gmail.com>
To: Filipe Manana <fdmanana@kernel.org>, Dave Chinner <david@fromorbit.com>,
	Michael Kerrisk <mtk@man7.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, linux-xfs@vger.kernel.org,
	Filipe Manana <fdmanana@suse.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>
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
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 2, 2022 at 11:17 AM Filipe Manana <fdmanana@kernel.org> wrote:
> On Tue, Mar 01, 2022 at 09:38:30AM +1100, Dave Chinner wrote:
> > On Mon, Feb 28, 2022 at 02:32:03PM +0000, fdmanana@kernel.org wrote:
> > > From: Filipe Manana <fdmanana@suse.com>
> > >
> > > Some users recently reported that MariaDB was getting a read corruption
> > > when using io_uring on top of btrfs. This started to happen in 5.16,
> > > after commit 51bd9563b6783d ("btrfs: fix deadlock due to page faults
> > > during direct IO reads and writes"). That changed btrfs to use the new
> > > iomap flag IOMAP_DIO_PARTIAL and to disable page faults before calling
> > > iomap_dio_rw(). This was necessary to fix deadlocks when the iovector
> > > corresponds to a memory mapped file region. That type of scenario is
> > > exercised by test case generic/647 from fstests, and it also affected
> > > gfs2, which, besides btrfs, is the only user of IOMAP_DIO_PARTIAL.
> > >
> > > For this MariaDB scenario, we attempt to read 16K from file offset X
> > > using IOCB_NOWAIT and io_uring. In that range we have 4 extents, each
> > > with a size of 4K, and what happens is the following:
> > >
> > > 1) btrfs_direct_read() disables page faults and calls iomap_dio_rw();
> > >
> > > 2) iomap creates a struct iomap_dio object, its reference count is
> > >    initialized to 1 and its ->size field is initialized to 0;
> > >
> > > 3) iomap calls btrfs_iomap_begin() with file offset X, which finds the
> >
> > You mean btrfs_dio_iomap_begin()?
>
> Yes, correct.
>
> >
> > >    first 4K extent, and setups an iomap for this extent consisting of
> > >    a single page;
> >
> > So we have IOCB_NOWAIT, which means btrfs_dio_iomap_begin() is being
> > passed IOMAP_NOWAIT and so knows it is being asked
> > to map an extent for an IO that is on a non-blocking path.
> >
> > btrfs_dio_iomap_begin() doesn't appear to support NOWAIT semantics
> > at all - it will block doing writeback IO, memory allocation, extent
> > locking, transaction reservations, extent allocation, etc....
>
> We do have some checks for NOWAIT before getting into btrfs_dio_iomap_begin(),
> but they are only for the write path, and they are incomplete. Some are a bit
> tricky to deal with, but yes, there's several cases that are either missing
> or need to be improved.
>
> >
> > That, to me, looks like the root cause of the problem here -
> > btrfs_dio_iomap_begin() is not guaranteeing non-blocking atomic IO
> > semantics for IOCB_NOWAIT IO.
> >
> > In the case above, given that the extent lookup only found a 4kB
> > extent, we know that it doesn't span the entire requested IO range.
> > We also known that we cannot tell if we'll block on subsequent
> > mappings of the IO range, and hence no guarantee can be given that
> > IOCB_NOWAIT IO will not block when it is too late to back out with a
> > -EAGAIN error.
> >
> > Hence this whole set of problems could be avoided if
> > btrfs_dio_iomap_begin() returns -EAGAIN if it can't map the entire
> > IO into a single extent without blocking when IOMAP_NOWAIT is set?
> > That's exactly what XFS does in xfs_direct_iomap_write_begin():
> >
> >         /*
> >          * NOWAIT and OVERWRITE I/O needs to span the entire requested I/O with
> >          * a single map so that we avoid partial IO failures due to the rest of
> >          * the I/O range not covered by this map triggering an EAGAIN condition
> >          * when it is subsequently mapped and aborting the I/O.
> >          */
> >         if (flags & (IOMAP_NOWAIT | IOMAP_OVERWRITE_ONLY)) {
> >                 error = -EAGAIN;
> >                 if (!imap_spans_range(&imap, offset_fsb, end_fsb))
> >                         goto out_unlock;
> >         }
> >
> > Basically, I'm thinking that IOMAP_NOWAIT and IOMAP_DIO_PARTIAL
> > should be exclusive functionality - if you are doing IOMAP_NOWAIT
> > then the entire IO must succeed without blocking, and if it doesn't
> > then we return -EAGAIN and the caller retries without IOCB_NOWAIT
> > set and so then we run with IOMAP_DIO_PARTIAL semantics in a thread
> > that can actually block....
>
> Indeed, I had not considered that, that is simple and effective, plus
> it can be done exclusively in btrfs code, no need to change iomap.

This will work for btrfs, but short buffered reads can still occur on
gfs2 due to the following conflicting requirements:

* On the one hand, buffered reads and writes are expected to be atomic
with respect to each other [*].

* On the other hand, to prevent deadlocks, we must allow the
cluster-wide inode lock to be stolen while faulting in pages. That's
the lock that provides the atomicity, however.

Direct I/O isn't affected because it doesn't have this atomicity requirement.

A non-solution to this dilemma is to lock the entire buffer into
memory: those buffers can be extremely large, so we would eventually
run out of memory.

So we return short reads instead. This only happens rarely, which
doesn't make debugging any easier. It also doesn't help that the
read(2) and write(2) manual pages don't document that short reads as
well as writes must be expected. (The atomicity requirement [*] also
isn't actually documented there.)

[*] https://pubs.opengroup.org/onlinepubs/9699919799/functions/V2_chap02.html#tag_15_09_07

> >
> > .....
> >
> > > 11) At iomap_dio_complete() we adjust the iocb->ki_pos from X to X + 4K
> > >     and return 4K (the amount of io done) to iomap_dio_complete_work();
> > >
> > > 12) iomap_dio_complete_work() calls the iocb completion callback,
> > >     iocb->ki_complete() with a second argument value of 4K (total io
> > >     done) and the iocb with the adjust ki_pos of X + 4K. This results
> > >     in completing the read request for io_uring, leaving it with a
> > >     result of 4K bytes read, and only the first page of the buffer
> > >     filled in, while the remaining 3 pages, corresponding to the other
> > >     3 extents, were not filled;
> > >
> > > 13) For the application, the result is unexpected because if we ask
> > >     to read N bytes, it expects to get N bytes read as long as those
> > >     N bytes don't cross the EOF (i_size).
> >
> > Yeah, that's exactly the sort of problem we were having with XFS
> > with partial DIO completions due to needing multiple iomap iteration
> > loops to complete a single IO. Hence IOMAP_NOWAIT now triggers the
> > above range check and aborts before we start...
>
> Interesting.

Dave, this seems to affect all users of iomap_dio_rw in the same way,
so would it make sense to move this check there?

Thanks,
Andreas

> > > So fix this by making __iomap_dio_rw() assign true to the boolean variable
> > > 'wait_for_completion' when we have IOMAP_DIO_PARTIAL set, we did some
> > > progress for a read and we have not crossed the EOF boundary. Do this even
> > > if the read has IOCB_NOWAIT set, as it's the only way to avoid providing
> > > an unexpected result to an application.
> >
> > That's highly specific and ultimately will be fragile, IMO. I'd much
> > prefer that *_iomap_begin_write() implementations simply follow
> > IOMAP_NOWAIT requirements to ensure that any DIO that needs multiple
> > mappings if punted to a context that can block...
>
> Yes, agreed.
>
> Thanks for your feedback Dave, it provided a really good insight into this
> problem (and others).
>
> >
> > Cheers,
> >
> > Dave.
> > --
> > Dave Chinner
> > david@fromorbit.com
>

