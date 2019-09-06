Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6850DAC233
	for <lists+cluster-devel@lfdr.de>; Fri,  6 Sep 2019 23:49:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9CDB1308213F;
	Fri,  6 Sep 2019 21:49:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 456985D9CA;
	Fri,  6 Sep 2019 21:49:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDD854A460;
	Fri,  6 Sep 2019 21:49:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x86Lmkep031013 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 6 Sep 2019 17:48:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C37B6092F; Fri,  6 Sep 2019 21:48:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 770976060D
	for <cluster-devel@redhat.com>; Fri,  6 Sep 2019 21:48:43 +0000 (UTC)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
	[209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1DF7806CE
	for <cluster-devel@redhat.com>; Fri,  6 Sep 2019 21:48:43 +0000 (UTC)
Received: by mail-oi1-f199.google.com with SMTP id e83so3553016oif.15
	for <cluster-devel@redhat.com>; Fri, 06 Sep 2019 14:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2WJRsnFYnpcG/84+37k58Ernnh9jii5S94NsOJ3BU2I=;
	b=oTrlM0EhoUUyKajcnTLXkAFbkAGxXYV+Rn56Lq4ZcVzoC+o99/01IwaEx7WlGR241b
	llv70YPbfjHmA0EDu7cqycx/Q6Ppvzi9uNzutfS82tvTSfM+/naBs1y3V+/h124++zSs
	niSYmSTJmvW8Q/lMEU13eXV9qVib52ob24ER4k07Zt86u2T5dXfbzmLUDZ8USg0UmTmF
	17W/BN+vnAJePgTies677AWBXxDtFuyMAjk4AGHruZ392PBIgonvXvEDhw//a9LSj6/o
	LCD6A8kmZupmM6ClwdpT/uu6NgSon/7/iP9+O2R4vBWp/xqjF8ddeQCkZLf6wjPFuWE/
	zVWg==
X-Gm-Message-State: APjAAAX3hA3bCkA3K2C4/Niu+Rls3Y+wdMxm4KtAtJpBC9utZ3MaTzvP
	lWadnnOa0CxvqNHVElJr0eUrT4Gn36OXSrGZ1JS266McQ0vjEpVFK9jSQz57WVFCEMhkBouIux1
	4yeT2+Tou54cv5F+IoCK/f+KDjWmpxMcTlyD4Yg==
X-Received: by 2002:aca:aa56:: with SMTP id t83mr8874750oie.178.1567806523105; 
	Fri, 06 Sep 2019 14:48:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqye15i1gX9ZpzmamOPH9muPyVRWyZCi7G16OHNSbCrx+GNtAlQVhmii1YJoF0040MhZwNkhDvufnkahA0N59EU=
X-Received: by 2002:aca:aa56:: with SMTP id t83mr8874736oie.178.1567806522876; 
	Fri, 06 Sep 2019 14:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190906205241.2292-1-agruenba@redhat.com>
	<20190906212758.GO1119@dread.disaster.area>
In-Reply-To: <20190906212758.GO1119@dread.disaster.area>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 6 Sep 2019 23:48:31 +0200
Message-ID: <CAHc6FU5BxOHkgHKKWTL7jFq0oL4TbAPpe49QDB6X35ndjYTWKQ@mail.gmail.com>
To: Dave Chinner <david@fromorbit.com>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, "Darrick J . Wong" <darrick.wong@oracle.com>,
	cluster-devel <cluster-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Lukas Czerner <lczerner@redhat.com>,
	linux-ext4 <linux-ext4@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [Q] gfs2: mmap write vs. punch_hole consistency
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 06 Sep 2019 21:49:11 +0000 (UTC)

On Fri, Sep 6, 2019 at 11:28 PM Dave Chinner <david@fromorbit.com> wrote:
> On Fri, Sep 06, 2019 at 10:52:41PM +0200, Andreas Gruenbacher wrote:
> > Hi,
> >
> > I've just fixed a mmap write vs. truncate consistency issue on gfs on
> > filesystems with a block size smaller that the page size [1].
> >
> > It turns out that the same problem exists between mmap write and hole
> > punching, and since xfstests doesn't seem to cover that,
>
> AFAIA, fsx exercises it pretty often. Certainly it's found problems
> with XFS in the past w.r.t. these operations.
>
> > I've written a
> > new test [2].
>
> I suspect that what we really want is a test that runs
> _test_generic_punch using mmap rather than pwrite...
>
> > Ext4 and xfs both pass that test; they both apparently
> > mark the pages that have a hole punched in them as read-only so that
> > page_mkwrite is called before those pages can be written to again.
>
> XFS invalidates the range being hole punched (see
> xfs_flush_unmap_range() under XFS_MMAPLOCK_EXCL, which means any
> attempt to fault that page back in will block on the MMAPLOCK until
> the hole punch finishes.

This isn't about writes during the hole punching, this is about writes
once the hole is punched. For example, the test case I've posted
creates the following file layout with 1k blocksize:

  DDDD DDDD DDDD

Then it punches a hole like this:

  DDHH HHHH HHDD

Then it fills the hole again with mwrite:

  DDDD DDDD DDDD

As far as I can tell, that needs to trigger page faults on all three
pages. I did get these on ext4; judging from the fact that xfs works,
the also seem to occur there; but on gfs2, page_mkwrite isn't called
for the two partially mapped pages, only for the page in the middle
that's entirely within the hole. And I don't see where those pages are
marked read-only; it appears like pagecache_isize_extended isn't
called on ext4 or xfs. So how does this work there?

> > gfs2 fails that: for some reason, the partially block-mapped pages are
> > not marked read-only on gfs2, and so page_mkwrite is not called for the
> > partially block-mapped pages, and the hole is not filled in correctly.
> >
> > The attached patch fixes the problem, but this really doesn't look right
> > as neither ext4 nor xfs require this kind of hack.  So what am I
> > overlooking, how does this work on ext4 and xfs?
>
> XFS uses XFS_MMAPLOCK_* to serialise page faults against extent
> manipulations (shift, hole punch, truncate, swap, etc) and ext4 uses
> a similar locking mechanism to do the same thing. Fundamentally, the
> page cache does not provide the necessary mechanisms to detect and
> prevent invalidation races inside EOF....

Yes, but that unfortunately doesn't answer my question.

Thanks,
Andreas

> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > ---
> >  fs/gfs2/bmap.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> > index 9ef543dd38e2..e677e813be4c 100644
> > --- a/fs/gfs2/bmap.c
> > +++ b/fs/gfs2/bmap.c
> > @@ -2475,6 +2475,13 @@ int __gfs2_punch_hole(struct file *file, loff_t offset, loff_t length)
> >                       if (error)
> >                               goto out;
> >               }
> > +             /*
> > +              * If the first or last page partially lies in the hole, mark
> > +              * the page read-only so that memory-mapped writes will trigger
> > +              * page_mkwrite.
> > +              */
> > +             pagecache_isize_extended(inode, offset, inode->i_size);
> > +             pagecache_isize_extended(inode, offset + length, inode->i_size);
>
> See xfs_flush_unmap_range(), which is run under XFS_MMAPLOCK_EXCL
> to serialise against incoming page faults...
>
> Cheers,
>
> Dave.
> --
> Dave Chinner
> david@fromorbit.com

