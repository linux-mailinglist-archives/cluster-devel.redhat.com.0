Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F0CAD58E
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Sep 2019 11:20:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7170610C6979;
	Mon,  9 Sep 2019 09:20:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0E045D6B7;
	Mon,  9 Sep 2019 09:20:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 25D8A2551D;
	Mon,  9 Sep 2019 09:20:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x899Jhho009369 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Sep 2019 05:19:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 51CA55D721; Mon,  9 Sep 2019 09:19:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 376D25D6B2;
	Mon,  9 Sep 2019 09:19:41 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3A5C30A5411;
	Mon,  9 Sep 2019 09:19:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 5DEDCB04C;
	Mon,  9 Sep 2019 09:19:38 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 60EB11E43AC; Mon,  9 Sep 2019 11:19:39 +0200 (CEST)
Date: Mon, 9 Sep 2019 11:19:39 +0200
From: Jan Kara <jack@suse.cz>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190909091939.GA17151@quack2.suse.cz>
References: <20190906205241.2292-1-agruenba@redhat.com>
	<20190906212758.GO1119@dread.disaster.area>
	<CAHc6FU5BxOHkgHKKWTL7jFq0oL4TbAPpe49QDB6X35ndjYTWKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHc6FU5BxOHkgHKKWTL7jFq0oL4TbAPpe49QDB6X35ndjYTWKQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Mon, 09 Sep 2019 09:19:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Mon, 09 Sep 2019 09:19:40 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'jack@suse.cz' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <jack@suse.cz>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, "Darrick J . Wong" <darrick.wong@oracle.com>,
	Dave Chinner <david@fromorbit.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]); Mon, 09 Sep 2019 09:20:10 +0000 (UTC)

On Fri 06-09-19 23:48:31, Andreas Gruenbacher wrote:
> On Fri, Sep 6, 2019 at 11:28 PM Dave Chinner <david@fromorbit.com> wrote:
> > On Fri, Sep 06, 2019 at 10:52:41PM +0200, Andreas Gruenbacher wrote:
> > > Hi,
> > >
> > > I've just fixed a mmap write vs. truncate consistency issue on gfs on
> > > filesystems with a block size smaller that the page size [1].
> > >
> > > It turns out that the same problem exists between mmap write and hole
> > > punching, and since xfstests doesn't seem to cover that,
> >
> > AFAIA, fsx exercises it pretty often. Certainly it's found problems
> > with XFS in the past w.r.t. these operations.
> >
> > > I've written a
> > > new test [2].
> >
> > I suspect that what we really want is a test that runs
> > _test_generic_punch using mmap rather than pwrite...
> >
> > > Ext4 and xfs both pass that test; they both apparently
> > > mark the pages that have a hole punched in them as read-only so that
> > > page_mkwrite is called before those pages can be written to again.
> >
> > XFS invalidates the range being hole punched (see
> > xfs_flush_unmap_range() under XFS_MMAPLOCK_EXCL, which means any
> > attempt to fault that page back in will block on the MMAPLOCK until
> > the hole punch finishes.
> 
> This isn't about writes during the hole punching, this is about writes
> once the hole is punched. For example, the test case I've posted
> creates the following file layout with 1k blocksize:
> 
>   DDDD DDDD DDDD
> 
> Then it punches a hole like this:
> 
>   DDHH HHHH HHDD
> 
> Then it fills the hole again with mwrite:
> 
>   DDDD DDDD DDDD
> 
> As far as I can tell, that needs to trigger page faults on all three
> pages. I did get these on ext4; judging from the fact that xfs works,
> the also seem to occur there; but on gfs2, page_mkwrite isn't called
> for the two partially mapped pages, only for the page in the middle
> that's entirely within the hole. And I don't see where those pages are
> marked read-only; it appears like pagecache_isize_extended isn't
> called on ext4 or xfs. So how does this work there?

The trick ext4 & xfs use is that they writeout the range being punched
first (see e.g. ext4_punch_hole() calling filemap_write_and_wait_range() or
xfs_flush_unmap_range() called from xfs_free_file_space()). This writeout
also has the effect that all the page mappings for that range get
write-protected.

Another related issue is what Dave points out: Even if you use writeout to
writeprotect pages, GFS2 still seems to have a race where page fault can
come while you are freeing blocks and if you allow that you usually get
into a problematic state. Effects depend on fs implementation details but
usually it can result in stale data exposure or fs corruption.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

