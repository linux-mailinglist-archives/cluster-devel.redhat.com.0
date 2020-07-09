Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 67CC221AB34
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Jul 2020 01:06:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-VpzBJbKhODmUX8W1sX7Naw-1; Thu, 09 Jul 2020 19:06:10 -0400
X-MC-Unique: VpzBJbKhODmUX8W1sX7Naw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D33C8186A8D6;
	Thu,  9 Jul 2020 23:06:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B5175C1BD;
	Thu,  9 Jul 2020 23:06:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26FB984357;
	Thu,  9 Jul 2020 23:06:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069MxnoQ020086 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 18:59:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DBA192026D5D; Thu,  9 Jul 2020 22:59:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D777F207B2B0
	for <cluster-devel@redhat.com>; Thu,  9 Jul 2020 22:59:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5ABE810B40
	for <cluster-devel@redhat.com>; Thu,  9 Jul 2020 22:59:45 +0000 (UTC)
Received: from mail109.syd.optusnet.com.au (mail109.syd.optusnet.com.au
	[211.29.132.80]) by relay.mimecast.com with ESMTP id
	us-mta-329-yluJsSY5NkOyMkEk0REp2A-1; Thu, 09 Jul 2020 18:59:43 -0400
X-MC-Unique: yluJsSY5NkOyMkEk0REp2A-1
Received: from dread.disaster.area (pa49-180-53-24.pa.nsw.optusnet.com.au
	[49.180.53.24])
	by mail109.syd.optusnet.com.au (Postfix) with ESMTPS id 484E0D7A54F;
	Fri, 10 Jul 2020 08:59:37 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1jtfVw-00018A-GA; Fri, 10 Jul 2020 08:59:36 +1000
Date: Fri, 10 Jul 2020 08:59:36 +1000
From: Dave Chinner <david@fromorbit.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20200709225936.GZ2005@dread.disaster.area>
References: <20200701075310.GB29884@lst.de>
	<20200707124346.xnr5gtcysuzehejq@fiona>
	<20200707125705.GK25523@casper.infradead.org>
	<20200707130030.GA13870@lst.de>
	<20200708065127.GM2005@dread.disaster.area>
	<20200708135437.GP25523@casper.infradead.org>
	<20200709022527.GQ2005@dread.disaster.area>
	<20200709160926.GO7606@magnolia>
	<20200709170519.GH12769@casper.infradead.org>
	<20200709171038.GE7625@magnolia>
MIME-Version: 1.0
In-Reply-To: <20200709171038.GE7625@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
	a=moVtWZxmCkf3aAMJKIb/8g==:117 a=moVtWZxmCkf3aAMJKIb/8g==:17
	a=kj9zAlcOel0A:10 a=_RQrkK6FrEwA:10 a=7-415B0cAAAA:8
	a=CAmLY35Qp_Y7Zt_JOjoA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, fdmanana@gmail.com,
	Goldwyn Rodrigues <rgoldwyn@suse.de>, dsterba@suse.cz,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
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

On Thu, Jul 09, 2020 at 10:10:38AM -0700, Darrick J. Wong wrote:
> On Thu, Jul 09, 2020 at 06:05:19PM +0100, Matthew Wilcox wrote:
> > On Thu, Jul 09, 2020 at 09:09:26AM -0700, Darrick J. Wong wrote:
> > > On Thu, Jul 09, 2020 at 12:25:27PM +1000, Dave Chinner wrote:
> > > > -	 */
> > > > -	ret = invalidate_inode_pages2_range(mapping,
> > > > -			pos >> PAGE_SHIFT, end >> PAGE_SHIFT);
> > > > -	if (ret)
> > > > -		dio_warn_stale_pagecache(iocb->ki_filp);
> > > > -	ret = 0;
> > > > +	if (iov_iter_rw(iter) == WRITE) {
> > > > +		/*
> > > > +		 * Try to invalidate cache pages for the range we're direct
> > > > +		 * writing.  If this invalidation fails, tough, the write will
> > > > +		 * still work, but racing two incompatible write paths is a
> > > > +		 * pretty crazy thing to do, so we don't support it 100%.
> > > > +		 */
> > > > +		ret = invalidate_inode_pages2_range(mapping,
> > > > +				pos >> PAGE_SHIFT, end >> PAGE_SHIFT);
> > > > +		if (ret)
> > > > +			dio_warn_stale_pagecache(iocb->ki_filp);
> > > > +		ret = 0;
> > > >  
> > > > -	if (iov_iter_rw(iter) == WRITE && !wait_for_completion &&
> > > > -	    !inode->i_sb->s_dio_done_wq) {
> > > > -		ret = sb_init_dio_done_wq(inode->i_sb);
> > > > -		if (ret < 0)
> > > > -			goto out_free_dio;
> > > > +		if (!wait_for_completion &&
> > > > +		    !inode->i_sb->s_dio_done_wq) {
> > > > +			ret = sb_init_dio_done_wq(inode->i_sb);
> > > > +			if (ret < 0)
> > > > +				goto out_free_dio;
> 
> ...and yes I did add in the closing brace here. :P

Doh! I forgot to refresh the patch after fixing that. :/

Thanks!

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

