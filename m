Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 998F321810A
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Jul 2020 09:22:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-eQlACVT9MmCbbzZsMXQVuQ-1; Wed, 08 Jul 2020 03:22:56 -0400
X-MC-Unique: eQlACVT9MmCbbzZsMXQVuQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A113800C64;
	Wed,  8 Jul 2020 07:22:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D31DC5C1B2;
	Wed,  8 Jul 2020 07:22:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7E641809547;
	Wed,  8 Jul 2020 07:22:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0687Mj0M006464 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 03:22:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1C24114F378; Wed,  8 Jul 2020 07:22:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDDDE114F379
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 07:22:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BBDE185A797
	for <cluster-devel@redhat.com>; Wed,  8 Jul 2020 07:22:43 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-472-rXx21LMcNTu2BAtWYim2pg-1; Wed, 08 Jul 2020 03:22:40 -0400
X-MC-Unique: rXx21LMcNTu2BAtWYim2pg-1
Received: from dread.disaster.area (pa49-180-53-24.pa.nsw.optusnet.com.au
	[49.180.53.24])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 408423A4417;
	Wed,  8 Jul 2020 16:51:29 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1jt3vT-0003aV-Rn; Wed, 08 Jul 2020 16:51:27 +1000
Date: Wed, 8 Jul 2020 16:51:27 +1000
From: Dave Chinner <david@fromorbit.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200708065127.GM2005@dread.disaster.area>
References: <20200629192353.20841-1-rgoldwyn@suse.de>
	<20200629192353.20841-3-rgoldwyn@suse.de>
	<20200701075310.GB29884@lst.de>
	<20200707124346.xnr5gtcysuzehejq@fiona>
	<20200707125705.GK25523@casper.infradead.org>
	<20200707130030.GA13870@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200707130030.GA13870@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=QIgWuTDL c=1 sm=1 tr=0
	a=moVtWZxmCkf3aAMJKIb/8g==:117 a=moVtWZxmCkf3aAMJKIb/8g==:17
	a=kj9zAlcOel0A:10 a=_RQrkK6FrEwA:10 a=iox4zFpeAAAA:8 a=yPCof4ZbAAAA:8
	a=7-415B0cAAAA:8 a=3vpnGOzTaiQfhgfqfmAA:9 a=CjuIK1q_8ugA:10
	a=WzC6qhA0u3u7Ye7llzcV:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, fdmanana@gmail.com, darrick.wong@oracle.com,
	Goldwyn Rodrigues <rgoldwyn@suse.de>, dsterba@suse.cz,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] always fall back to buffered I/O after
 invalidation failures,
 was: Re: [PATCH 2/6] iomap: IOMAP_DIO_RWF_NO_STALE_PAGECACHE return if page
 invalidation fails
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 07, 2020 at 03:00:30PM +0200, Christoph Hellwig wrote:
> On Tue, Jul 07, 2020 at 01:57:05PM +0100, Matthew Wilcox wrote:
> > On Tue, Jul 07, 2020 at 07:43:46AM -0500, Goldwyn Rodrigues wrote:
> > > On  9:53 01/07, Christoph Hellwig wrote:
> > > > On Mon, Jun 29, 2020 at 02:23:49PM -0500, Goldwyn Rodrigues wrote:
> > > > > From: Goldwyn Rodrigues <rgoldwyn@suse.com>
> > > > > 
> > > > > For direct I/O, add the flag IOMAP_DIO_RWF_NO_STALE_PAGECACHE to indicate
> > > > > that if the page invalidation fails, return back control to the
> > > > > filesystem so it may fallback to buffered mode.
> > > > > 
> > > > > Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
> > > > > Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
> > > > 
> > > > I'd like to start a discussion of this shouldn't really be the
> > > > default behavior.  If we have page cache that can't be invalidated it
> > > > actually makes a whole lot of sense to not do direct I/O, avoid the
> > > > warnings, etc.
> > > > 
> > > > Adding all the relevant lists.
> > > 
> > > Since no one responded so far, let me see if I can stir the cauldron :)
> > > 
> > > What error should be returned in case of such an error? I think the
> > 
> > Christoph's message is ambiguous.  I don't know if he means "fail the
> > I/O with an error" or "satisfy the I/O through the page cache".  I'm
> > strongly in favour of the latter.
> 
> Same here.  Sorry if my previous mail was unclear.
> 
> > Indeed, I'm in favour of not invalidating
> > the page cache at all for direct I/O.  For reads, I think the page cache
> > should be used to satisfy any portion of the read which is currently
> > cached.  For writes, I think we should write into the page cache pages
> > which currently exist, and then force those pages to be written back,
> > but left in cache.
> 
> Something like that, yes.

So are we really willing to take the performance regression that
occurs from copying out of the page cache consuming lots more CPU
than an actual direct IO read? Or that direct IO writes suddenly
serialise because there are page cache pages and now we have to do
buffered IO?

Direct IO should be a deterministic, zero-copy IO path to/from
storage. Using the CPU to copy data during direct IO is the complete
opposite of the intended functionality, not to mention the behaviour
that many applications have been careful designed and tuned for.

Hence I think that forcing iomap to use cached pages for DIO is a
non-starter. I have no problems with providing infrastructure that
allows filesystems to -opt in- to using buffered IO for the direct
IO path. However, the change in IO behaviour caused by unpredicably
switching between direct IO and buffered IO (e.g. suddening DIO
writes serialise -all IO-) will cause unacceptible performance
regressions for many applications and be -very difficult to
diagnose- in production systems.

IOWs, we need to let the individual filesystems decide how they want
to use the page cache for direct IO. Just because we have new direct
IO infrastructure (i.e. iomap) it does not mean we can just make
wholesale changes to the direct IO path behaviour...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

