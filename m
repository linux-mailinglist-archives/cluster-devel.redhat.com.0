Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8E31416CB
	for <lists+cluster-devel@lfdr.de>; Sat, 18 Jan 2020 10:29:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579339743;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8f0KfogsiPP4FUUYdj4uGaX1AqhRn2gSwOtpgeEn8IU=;
	b=OhKwrQvJaxYpozDvdd0NMb/MgZxYf/UE92w8goZeix+s/7zowowGZ4nDA8lLvOe4AzddFI
	4DaWMXi+L23XReH0Hf0cnqtlCeQypgcgnZcM0zmGh6x9eLEYXLx3SqW/2WpF1iQTo2JkuI
	/RoiQwqc35fnZ0SlLbbKcD0PAffKBrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-FkHyDl8DMgSj0J4DTiBvHA-1; Sat, 18 Jan 2020 04:29:02 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D485A10054E3;
	Sat, 18 Jan 2020 09:28:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FC75845BD;
	Sat, 18 Jan 2020 09:28:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 927C51809567;
	Sat, 18 Jan 2020 09:28:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00I9Sorw000995 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 18 Jan 2020 04:28:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 31AE7107CD06; Sat, 18 Jan 2020 09:28:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D1EA107CCF3
	for <cluster-devel@redhat.com>; Sat, 18 Jan 2020 09:28:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 653CA8047BD
	for <cluster-devel@redhat.com>; Sat, 18 Jan 2020 09:28:48 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-423-tQfY_fp0PgWmJ8k97VSdWw-1; Sat, 18 Jan 2020 04:28:46 -0500
Received: from dread.disaster.area (pa49-181-172-170.pa.nsw.optusnet.com.au
	[49.181.172.170])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 96D4543FD14;
	Sat, 18 Jan 2020 20:28:39 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1iskPG-0003Oh-RX; Sat, 18 Jan 2020 20:28:38 +1100
Date: Sat, 18 Jan 2020 20:28:38 +1100
From: Dave Chinner <david@fromorbit.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200118092838.GB9407@dread.disaster.area>
References: <20200114161225.309792-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200114161225.309792-1-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=LYdCFQXi c=1 sm=1 tr=0
	a=IIEU8dkfCNxGYurWsojP/w==:117 a=IIEU8dkfCNxGYurWsojP/w==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=Jdjhy38mL1oA:10
	a=7-415B0cAAAA:8 a=ITVTHrnrj4Og1yiqg0wA:9 a=CjuIK1q_8ugA:10
	a=igBNqPyMv6gA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: tQfY_fp0PgWmJ8k97VSdWw-1
X-MC-Unique: FkHyDl8DMgSj0J4DTiBvHA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00I9Sorw000995
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org, Waiman Long <longman@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-ext4@vger.kernel.org,
	Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Cluster-devel] RFC: hold i_rwsem until aio completes
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Jan 14, 2020 at 05:12:13PM +0100, Christoph Hellwig wrote:
> Hi all,
>=20
> Asynchronous read/write operations currently use a rather magic locking
> scheme, were access to file data is normally protected using a rw_semapho=
re,
> but if we are doing aio where the syscall returns to userspace before the
> I/O has completed we also use an atomic_t to track the outstanding aio
> ops.  This scheme has lead to lots of subtle bugs in file systems where
> didn't wait to the count to reach zero, and due to its adhoc nature also
> means we have to serialize direct I/O writes that are smaller than the
> file system block size.
>=20
> All this is solved by releasing i_rwsem only when the I/O has actually
> completed, but doings so is against to mantras of Linux locking primites:
>=20
>  (1) no unlocking by another process than the one that acquired it
>  (2) no return to userspace with locks held
>=20
> It actually happens we have various places that work around this.  A few
> callers do non-owner unlocks of rwsems, which are pretty nasty for
> PREEMPT_RT as the owner tracking doesn't work.  OTOH the file system
> freeze code has both problems and works around them a little better,
> although in a somewhat awkward way, in that it releases the lockdep
> object when returning to userspace, and reacquires it when done, and
> also clears the rwsem owner when returning to userspace, and then sets
> the new onwer before unlocking.
>=20
> This series tries to follow that scheme, also it doesn't fully work.  The
> first issue is that the rwsem code has a bug where it doesn't properly
> handle clearing the owner.  This series has a patch to fix that, but it
> is ugly and might not be correct so some help is needed.  Second I/O
> completions often come from interrupt context, which means the re-acquire
> is recorded as from irq context, leading to warnings about incorrect
> contexts.  I wonder if we could just have a bit in lockdep that says
> returning to userspace is ok for this particular lock?  That would also
> clean up the fsfreeze situation a lot.
>=20
> Let me know what you think of all this.  While I converted all the iomap
> using file systems only XFS is actually tested.

I think it's pretty gross, actually. It  makes the same mistake made
with locking in the old direct IO code - it encodes specific lock
operations via flags into random locations in the DIO path. This is
a very slippery slope, and IMO it is an layering violation to encode
specific filesystem locking smeantics into a layer that is supposed
to be generic and completely filesystem agnostic. i.e.  this
mechanism breaks if a filesystem moves to a different type of lock
(e.g. range locks), and history teaches us that we'll end up making
a horrible, unmaintainable mess to support different locking
mechanisms and contexts.

I think that we should be moving to a model where the filesystem
provides an unlock method in the iomap operations structure, and if
the method is present in iomap_dio_complete() it gets called for the
filesystem to unlock the inode at the appropriate point. This also
allows the filesystem to provide a different method for read or
write unlock, depending on what type of lock it held at submission.
This gets rid of the need for the iomap code to know what type of
lock the caller holds, too.

This way we always have a consistent point in the AIO/DIO completion
model where the inode gets unlocked, it only gets called for the IO
contexts where the filesystem wants/needs unlock on IO competion
semantics, and it's completely filesystem IO-lock implementation
agnostic. And for filesystems that use the inode i_rwsem, we can
just provide simple helper functions for their read/write unlock
methods.

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


