Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C4EE921A57B
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Jul 2020 19:11:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-9jBYtALRP5-cE4HMiQHMYQ-1; Thu, 09 Jul 2020 13:11:13 -0400
X-MC-Unique: 9jBYtALRP5-cE4HMiQHMYQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C613C7465;
	Thu,  9 Jul 2020 17:11:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 711AF5D98A;
	Thu,  9 Jul 2020 17:11:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F005284343;
	Thu,  9 Jul 2020 17:11:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069HB7qj013926 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 13:11:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ED8ED86D6A; Thu,  9 Jul 2020 17:11:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34FE582896
	for <cluster-devel@redhat.com>; Thu,  9 Jul 2020 17:10:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD5D68007B3
	for <cluster-devel@redhat.com>; Thu,  9 Jul 2020 17:10:54 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-280-2T1NoZIzO66mKnM1ESOPlg-1; Thu, 09 Jul 2020 13:10:52 -0400
X-MC-Unique: 2T1NoZIzO66mKnM1ESOPlg-1
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	069Gw3Ee087206; Thu, 9 Jul 2020 17:10:45 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 325y0ak47w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 09 Jul 2020 17:10:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	069GxXXT092527; Thu, 9 Jul 2020 17:10:44 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 325k3h93dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jul 2020 17:10:44 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 069HAehN009314;
	Thu, 9 Jul 2020 17:10:40 GMT
Received: from localhost (/10.159.229.94)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 09 Jul 2020 10:10:39 -0700
Date: Thu, 9 Jul 2020 10:10:38 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200709171038.GE7625@magnolia>
References: <20200629192353.20841-3-rgoldwyn@suse.de>
	<20200701075310.GB29884@lst.de>
	<20200707124346.xnr5gtcysuzehejq@fiona>
	<20200707125705.GK25523@casper.infradead.org>
	<20200707130030.GA13870@lst.de>
	<20200708065127.GM2005@dread.disaster.area>
	<20200708135437.GP25523@casper.infradead.org>
	<20200709022527.GQ2005@dread.disaster.area>
	<20200709160926.GO7606@magnolia>
	<20200709170519.GH12769@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200709170519.GH12769@casper.infradead.org>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9677
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	phishscore=0
	mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
	suspectscore=5 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007090121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9677
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
	clxscore=1015
	lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
	phishscore=0
	adultscore=0 suspectscore=5 mlxlogscore=999 priorityscore=1501
	spamscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007090121
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, fdmanana@gmail.com,
	Goldwyn Rodrigues <rgoldwyn@suse.de>,
	Dave Chinner <david@fromorbit.com>, dsterba@suse.cz,
	cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2020 at 06:05:19PM +0100, Matthew Wilcox wrote:
> On Thu, Jul 09, 2020 at 09:09:26AM -0700, Darrick J. Wong wrote:
> > On Thu, Jul 09, 2020 at 12:25:27PM +1000, Dave Chinner wrote:
> > > iomap: Only invalidate page cache pages on direct IO writes
> > > 
> > > From: Dave Chinner <dchinner@redhat.com>
> > > 
> > > The historic requirement for XFS to invalidate cached pages on
> > > direct IO reads has been lost in the twisty pages of history - it was
> > > inherited from Irix, which implemented page cache invalidation on
> > > read as a method of working around problems synchronising page
> > > cache state with uncached IO.
> > 
> > Urk.
> > 
> > > XFS has carried this ever since. In the initial linux ports it was
> > > necessary to get mmap and DIO to play "ok" together and not
> > > immediately corrupt data. This was the state of play until the linux
> > > kernel had infrastructure to track unwritten extents and synchronise
> > > page faults with allocations and unwritten extent conversions
> > > (->page_mkwrite infrastructure). IOws, the page cache invalidation
> > > on DIO read was necessary to prevent trivial data corruptions. This
> > > didn't solve all the problems, though.
> > > 
> > > There were peformance problems if we didn't invalidate the entire
> > > page cache over the file on read - we couldn't easily determine if
> > > the cached pages were over the range of the IO, and invalidation
> > > required taking a serialising lock (i_mutex) on the inode. This
> > > serialising lock was an issue for XFS, as it was the only exclusive
> > > lock in the direct Io read path.
> > > 
> > > Hence if there were any cached pages, we'd just invalidate the
> > > entire file in one go so that subsequent IOs didn't need to take the
> > > serialising lock. This was a problem that prevented ranged
> > > invalidation from being particularly useful for avoiding the
> > > remaining coherency issues. This was solved with the conversion of
> > > i_mutex to i_rwsem and the conversion of the XFS inode IO lock to
> > > use i_rwsem. Hence we could now just do ranged invalidation and the
> > > performance problem went away.
> > > 
> > > However, page cache invalidation was still needed to serialise
> > > sub-page/sub-block zeroing via direct IO against buffered IO because
> > > bufferhead state attached to the cached page could get out of whack
> > > when direct IOs were issued.  We've removed bufferheads from the
> > > XFS code, and we don't carry any extent state on the cached pages
> > > anymore, and so this problem has gone away, too.
> > > 
> > > IOWs, it would appear that we don't have any good reason to be
> > > invalidating the page cache on DIO reads anymore. Hence remove the
> > > invalidation on read because it is unnecessary overhead,
> > > not needed to maintain coherency between mmap/buffered access and
> > > direct IO anymore, and prevents anyone from using direct IO reads
> > > from intentionally invalidating the page cache of a file.
> > > 
> > > Signed-off-by: Dave Chinner <dchinner@redhat.com>
> > > ---
> > >  fs/iomap/direct-io.c | 33 +++++++++++++++++----------------
> > >  1 file changed, 17 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> > > index ec7b78e6feca..ef0059eb34b5 100644
> > > --- a/fs/iomap/direct-io.c
> > > +++ b/fs/iomap/direct-io.c
> > > @@ -475,23 +475,24 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> > >  	if (ret)
> > >  		goto out_free_dio;
> > >  
> > > -	/*
> > > -	 * Try to invalidate cache pages for the range we're direct
> > > -	 * writing.  If this invalidation fails, tough, the write will
> > > -	 * still work, but racing two incompatible write paths is a
> > > -	 * pretty crazy thing to do, so we don't support it 100%.
> > 
> > I always wondered about the repeated use of 'write' in this comment
> > despite the lack of any sort of WRITE check logic.  Seems fine to me,
> > let's throw it on the fstests pile and see what happens.
> > 
> > Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
> 
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> 
> > --D
> > 
> > > -	 */
> > > -	ret = invalidate_inode_pages2_range(mapping,
> > > -			pos >> PAGE_SHIFT, end >> PAGE_SHIFT);
> > > -	if (ret)
> > > -		dio_warn_stale_pagecache(iocb->ki_filp);
> > > -	ret = 0;
> > > +	if (iov_iter_rw(iter) == WRITE) {
> > > +		/*
> > > +		 * Try to invalidate cache pages for the range we're direct
> > > +		 * writing.  If this invalidation fails, tough, the write will
> > > +		 * still work, but racing two incompatible write paths is a
> > > +		 * pretty crazy thing to do, so we don't support it 100%.
> > > +		 */
> > > +		ret = invalidate_inode_pages2_range(mapping,
> > > +				pos >> PAGE_SHIFT, end >> PAGE_SHIFT);
> > > +		if (ret)
> > > +			dio_warn_stale_pagecache(iocb->ki_filp);
> > > +		ret = 0;
> > >  
> > > -	if (iov_iter_rw(iter) == WRITE && !wait_for_completion &&
> > > -	    !inode->i_sb->s_dio_done_wq) {
> > > -		ret = sb_init_dio_done_wq(inode->i_sb);
> > > -		if (ret < 0)
> > > -			goto out_free_dio;
> > > +		if (!wait_for_completion &&
> > > +		    !inode->i_sb->s_dio_done_wq) {
> > > +			ret = sb_init_dio_done_wq(inode->i_sb);
> > > +			if (ret < 0)
> > > +				goto out_free_dio;

...and yes I did add in the closing brace here. :P

--D

> > >  	}
> > >  
> > >  	inode_dio_begin(inode);

