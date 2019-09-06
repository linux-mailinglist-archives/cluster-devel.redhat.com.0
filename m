Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CD2AC200
	for <lists+cluster-devel@lfdr.de>; Fri,  6 Sep 2019 23:28:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DAE408980FD;
	Fri,  6 Sep 2019 21:28:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CEF960605;
	Fri,  6 Sep 2019 21:28:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3AC882551C;
	Fri,  6 Sep 2019 21:28:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x86LS6Nd030585 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 6 Sep 2019 17:28:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 78F7A1F8; Fri,  6 Sep 2019 21:28:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3305B3DA3;
	Fri,  6 Sep 2019 21:28:04 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246])
	by mx1.redhat.com (Postfix) with ESMTP id D83798980EA;
	Fri,  6 Sep 2019 21:28:02 +0000 (UTC)
Received: from dread.disaster.area (pa49-181-255-194.pa.nsw.optusnet.com.au
	[49.181.255.194])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 0992043DE87;
	Sat,  7 Sep 2019 07:27:59 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92)
	(envelope-from <david@fromorbit.com>)
	id 1i6Llu-00040v-DH; Sat, 07 Sep 2019 07:27:58 +1000
Date: Sat, 7 Sep 2019 07:27:58 +1000
From: Dave Chinner <david@fromorbit.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190906212758.GO1119@dread.disaster.area>
References: <20190906205241.2292-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906205241.2292-1-agruenba@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.2 cv=FNpr/6gs c=1 sm=1 tr=0
	a=YO9NNpcXwc8z/SaoS+iAiA==:117 a=YO9NNpcXwc8z/SaoS+iAiA==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=J70Eh1EUuV4A:10
	a=20KFwNOVAAAA:8 a=7-415B0cAAAA:8 a=r1oko415FTsrSW_0ZeQA:9
	a=SRvg7SIPPn5lGMua:21 a=3wB2Q9QfzO72gL2r:21 a=CjuIK1q_8ugA:10
	a=biEYGPWJfzWAr4FL6Ov7:22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.67]);
	Fri, 06 Sep 2019 21:28:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]);
	Fri, 06 Sep 2019 21:28:03 +0000 (UTC) for IP:'211.29.132.246'
	DOMAIN:'mail104.syd.optusnet.com.au'
	HELO:'mail104.syd.optusnet.com.au' FROM:'david@fromorbit.com'
	RCPT:''
X-RedHat-Spam-Score: -0.698  (RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_NONE) 211.29.132.246 mail104.syd.optusnet.com.au
	211.29.132.246 mail104.syd.optusnet.com.au
	<david@fromorbit.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.67
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, "Darrick J . Wong" <darrick.wong@oracle.com>,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	Lukas Czerner <lczerner@redhat.com>, linux-ext4@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Fri, 06 Sep 2019 21:28:29 +0000 (UTC)

On Fri, Sep 06, 2019 at 10:52:41PM +0200, Andreas Gruenbacher wrote:
> Hi,
> 
> I've just fixed a mmap write vs. truncate consistency issue on gfs on
> filesystems with a block size smaller that the page size [1].
> 
> It turns out that the same problem exists between mmap write and hole
> punching, and since xfstests doesn't seem to cover that,

AFAIA, fsx exercises it pretty often. Certainly it's found problems
with XFS in the past w.r.t. these operations.

> I've written a
> new test [2].

I suspect that what we really want is a test that runs
_test_generic_punch using mmap rather than pwrite...

> Ext4 and xfs both pass that test; they both apparently
> mark the pages that have a hole punched in them as read-only so that
> page_mkwrite is called before those pages can be written to again.

XFS invalidates the range being hole punched (see
xfs_flush_unmap_range() under XFS_MMAPLOCK_EXCL, which means any
attempt to fault that page back in will block on the MMAPLOCK until
the hole punch finishes.

> gfs2 fails that: for some reason, the partially block-mapped pages are
> not marked read-only on gfs2, and so page_mkwrite is not called for the
> partially block-mapped pages, and the hole is not filled in correctly.
> 
> The attached patch fixes the problem, but this really doesn't look right
> as neither ext4 nor xfs require this kind of hack.  So what am I
> overlooking, how does this work on ext4 and xfs?

XFS uses XFS_MMAPLOCK_* to serialise page faults against extent
manipulations (shift, hole punch, truncate, swap, etc) and ext4 uses
a similar locking mechanism to do the same thing. Fundamentally, the
page cache does not provide the necessary mechanisms to detect and
prevent invalidation races inside EOF....

> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/gfs2/bmap.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index 9ef543dd38e2..e677e813be4c 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -2475,6 +2475,13 @@ int __gfs2_punch_hole(struct file *file, loff_t offset, loff_t length)
>  			if (error)
>  				goto out;
>  		}
> +		/*
> +		 * If the first or last page partially lies in the hole, mark
> +		 * the page read-only so that memory-mapped writes will trigger
> +		 * page_mkwrite.
> +		 */
> +		pagecache_isize_extended(inode, offset, inode->i_size);
> +		pagecache_isize_extended(inode, offset + length, inode->i_size);

See xfs_flush_unmap_range(), which is run under XFS_MMAPLOCK_EXCL
to serialise against incoming page faults...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

