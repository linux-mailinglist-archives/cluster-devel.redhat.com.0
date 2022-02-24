Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1A94C2964
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Feb 2022 11:30:32 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-BvFtA7eoPKSo87GIQ9QIoA-1; Thu, 24 Feb 2022 05:30:27 -0500
X-MC-Unique: BvFtA7eoPKSo87GIQ9QIoA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28549804312;
	Thu, 24 Feb 2022 10:30:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E266723093;
	Thu, 24 Feb 2022 10:30:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9FFC1809C98;
	Thu, 24 Feb 2022 10:30:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21OAT9rb019577 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 24 Feb 2022 05:29:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D434A492D55; Thu, 24 Feb 2022 10:29:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D02AF492D59
	for <cluster-devel@redhat.com>; Thu, 24 Feb 2022 10:29:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6D0C106655A
	for <cluster-devel@redhat.com>; Thu, 24 Feb 2022 10:29:09 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-390-7m77CC0PPMmCydTUSJNPgw-1; Thu, 24 Feb 2022 05:29:05 -0500
X-MC-Unique: 7m77CC0PPMmCydTUSJNPgw-1
Received: from dread.disaster.area (pa49-186-17-0.pa.vic.optusnet.com.au
	[49.186.17.0])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 377EB10E3F4B;
	Thu, 24 Feb 2022 21:29:01 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1nNBMr-00FpGo-82; Thu, 24 Feb 2022 21:29:01 +1100
Date: Thu, 24 Feb 2022 21:29:01 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Theodore Ts'o" <tytso@mit.edu>
Message-ID: <20220224102901.GN59715@dread.disaster.area>
References: <Yg0m6IjcNmfaSokM@google.com>
	<82d0f4e4-c911-a245-4701-4712453592d9@nvidia.com>
	<Yg8bxiz02WBGf6qO@mit.edu> <Yg9QGm2Rygrv+lMj@kroah.com>
	<YhbE2nocBMtLc27C@mit.edu>
	<20220224014842.GM59715@dread.disaster.area>
	<YhcAcfY1pZTl3sId@mit.edu>
MIME-Version: 1.0
In-Reply-To: <YhcAcfY1pZTl3sId@mit.edu>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=deDjYVbe c=1 sm=1 tr=0 ts=62175def
	a=+dVDrTVfsjPpH/ci3UuFng==:117 a=+dVDrTVfsjPpH/ci3UuFng==:17
	a=kj9zAlcOel0A:10 a=oGFeUVbbRNcA:10 a=7-415B0cAAAA:8
	a=nNeadVlkB5BEUYMxFkMA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 23, 2022 at 10:50:09PM -0500, Theodore Ts'o wrote:
> On Thu, Feb 24, 2022 at 12:48:42PM +1100, Dave Chinner wrote:
> > > Fair enough; on the other hand, we could also view this as making ext4
> > > more robust against buggy code in other subsystems, and while other
> > > file systems may be losing user data if they are actually trying to do
> > > remote memory access to file-backed memory, apparently other file
> > > systems aren't noticing and so they're not crashing.
> > 
> > Oh, we've noticed them, no question about that.  We've got bug
> > reports going back years for systems being crashed, triggering BUGs
> > and/or corrupting data on both XFS and ext4 filesystems due to users
> > trying to run RDMA applications with file backed pages.
> 
> Is this issue causing XFS to crash?  I didn't know that.

I have no idea if crashes nowdays -  go back a few years before and
search for XFS BUGging out in ->invalidate_page (or was it
->release_page?) because of unexpected dirty pages. I think it could
also trigger BUGs in writeback when ->writepages tripped over a
dirty page without a delayed allocation mapping over the hole...

We were pretty aggressive about telling people reporting such issues
that they get to keep all the borken bits to themselves and to stop
wasting our time with unsolvable problems caused by their
broken-by-design RDMA applications. Hence people have largely
stopped bothering us with random filesystem crashes on systems using
RDMA on file-backed pages...

> I tried the Syzbot reproducer with XFS mounted, and it didn't trigger
> any crashes.  I'm sure data was getting corrupted, but I figured I
> should bring ext4 to the XFS level of "at least we're not reliably
> killing the kernel".

Oh, well, good to know XFS didn't die a horrible death immediately.
Thanks for checking, Ted.

> On ext4, an unprivileged process can use process_vm_writev(2) to crash
> the system.  I don't know how quickly we can get a fix into mm/gup.c,
> but if some other kernel path tries calling set_page_dirty() on a
> file-backed page without first asking permission from the file system,
> it seems to be nice if the file system doesn't BUG() --- as near as I
> can tell, xfs isn't crashing in this case, but ext4 is.

iomap is probably refusing to map holes for writepage - we've
cleaned up most of the weird edge cases to return errors, so I'm
guessing iomap is just ignoring such pages these days.

Yeah, see iomap_writepage_map():

                error = wpc->ops->map_blocks(wpc, inode, pos);
                if (error)
                        break;
                if (WARN_ON_ONCE(wpc->iomap.type == IOMAP_INLINE))
                        continue;
                if (wpc->iomap.type == IOMAP_HOLE)
                        continue;

Yeah, so if writeback maps a hole rather than converts a delalloc
region to IOMAP_MAPPED, it'll just skip over the block/page.  IIRC,
they essentially become uncleanable pages, and I think eventually
inode reclaim will just toss them out of memory.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

