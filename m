Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E8D4C657
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Jun 2019 06:49:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AEB0830872F5;
	Thu, 20 Jun 2019 04:49:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5769E5D71C;
	Thu, 20 Jun 2019 04:49:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9A044EA69;
	Thu, 20 Jun 2019 04:48:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5K4mR7Q023316 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 00:48:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5EE571001DE7; Thu, 20 Jun 2019 04:48:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F08B1001DE4;
	Thu, 20 Jun 2019 04:48:24 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249])
	by mx1.redhat.com (Postfix) with ESMTP id 9C722C049D67;
	Thu, 20 Jun 2019 04:48:09 +0000 (UTC)
Received: from dread.disaster.area (pa49-195-189-25.pa.nsw.optusnet.com.au
	[49.195.189.25])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id A9E2E149FBA;
	Thu, 20 Jun 2019 14:48:06 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92)
	(envelope-from <david@fromorbit.com>)
	id 1hdoya-0000Gg-Dd; Thu, 20 Jun 2019 14:47:08 +1000
Date: Thu, 20 Jun 2019 14:47:08 +1000
From: Dave Chinner <david@fromorbit.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190620044708.GT14363@dread.disaster.area>
References: <20190618144716.8133-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618144716.8133-1-agruenba@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.2 cv=D+Q3ErZj c=1 sm=1 tr=0 cx=a_idp_d
	a=K5LJ/TdJMXINHCwnwvH1bQ==:117 a=K5LJ/TdJMXINHCwnwvH1bQ==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=dq6fvYVFJ5YA:10
	a=20KFwNOVAAAA:8 a=7-415B0cAAAA:8 a=uX0c4KQHmT7z40gRqxMA:9
	a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 20 Jun 2019 04:48:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Thu, 20 Jun 2019 04:48:15 +0000 (UTC) for IP:'211.29.132.249'
	DOMAIN:'mail105.syd.optusnet.com.au'
	HELO:'mail105.syd.optusnet.com.au' FROM:'david@fromorbit.com'
	RCPT:''
X-RedHat-Spam-Score: -0.698  (RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_NONE) 211.29.132.249 mail105.syd.optusnet.com.au
	211.29.132.249 mail105.syd.optusnet.com.au
	<david@fromorbit.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH] fs: Move mark_inode_dirty out of
	__generic_write_end
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Thu, 20 Jun 2019 04:49:12 +0000 (UTC)

On Tue, Jun 18, 2019 at 04:47:16PM +0200, Andreas Gruenbacher wrote:
> Remove the mark_inode_dirty call from __generic_write_end and add it to
> generic_write_end and the high-level iomap functions where necessary.
> That way, large writes will only dirty inodes at the end instead of
> dirtying them once per page.  This fixes a performance bottleneck on
> gfs2.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/buffer.c | 26 ++++++++++++++++++--------
>  fs/iomap.c  | 42 ++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 56 insertions(+), 12 deletions(-)

....

> 
> diff --git a/fs/iomap.c b/fs/iomap.c
> index 23ef63fd1669..9454568a7f5e 100644
> --- a/fs/iomap.c
> +++ b/fs/iomap.c
> @@ -881,6 +881,13 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *iter,
>  {
>  	struct inode *inode = iocb->ki_filp->f_mapping->host;
>  	loff_t pos = iocb->ki_pos, ret = 0, written = 0;
> +	loff_t old_size;
> +
> +        /*
> +	 * No need to use i_size_read() here, the i_size cannot change under us
> +	 * because we hold i_rwsem.
> +	 */
> +	old_size = inode->i_size;
>  
>  	while (iov_iter_count(iter)) {
>  		ret = iomap_apply(inode, pos, iov_iter_count(iter),
> @@ -891,6 +898,9 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *iter,
>  		written += ret;
>  	}
>  
> +	if (old_size != inode->i_size)
> +		mark_inode_dirty(inode);
> +
>  	return written ? written : ret;
>  }
>  EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
> @@ -961,18 +971,30 @@ int
>  iomap_file_dirty(struct inode *inode, loff_t pos, loff_t len,
>  		const struct iomap_ops *ops)
>  {
> +	loff_t old_size;
>  	loff_t ret;
>  
> +        /*
> +	 * No need to use i_size_read() here, the i_size cannot change under us
> +	 * because we hold i_rwsem.
> +	 */
> +	old_size = inode->i_size;
> +
>  	while (len) {
>  		ret = iomap_apply(inode, pos, len, IOMAP_WRITE, ops, NULL,
>  				iomap_dirty_actor);
>  		if (ret <= 0)
> -			return ret;
> +			goto out;
>  		pos += ret;
>  		len -= ret;
>  	}
> +	ret = 0;
>  
> -	return 0;
> +out:
> +	if (old_size != inode->i_size)
> +		mark_inode_dirty(inode);


I don't think we want to do this.

The patches I have that add range locking for XFS allow buffered
writes to run concurrently with operations that change the inode
size as long as the ranges don't overlap. To do this, XFS will not
hold the i_rwsem over any iomap call it makes in future - it will
hold a range lock instead. Hence we can have writes and other IO
operations occurring at the same time some other operation is
changing the size of the file, and that means this code no longer
does what you are intending it to do because the inode->i_size is no
longer constant across these operations...

Hence I think adding code that depends on i_rwsem to be held to
function correctly is the wrong direction to be taking the iomap
infrastructure.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

