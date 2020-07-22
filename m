Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0653C22A327
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jul 2020 01:35:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-cq9wqlbIPNe_yYGDB68oJA-1; Wed, 22 Jul 2020 19:35:25 -0400
X-MC-Unique: cq9wqlbIPNe_yYGDB68oJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92AA2800C64;
	Wed, 22 Jul 2020 23:35:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5B1B60C05;
	Wed, 22 Jul 2020 23:35:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD5EF1809547;
	Wed, 22 Jul 2020 23:35:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06MNFcEQ005288 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 19:15:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B95CB2026D67; Wed, 22 Jul 2020 23:15:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4F3F2026D5D
	for <cluster-devel@redhat.com>; Wed, 22 Jul 2020 23:15:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 103241012444
	for <cluster-devel@redhat.com>; Wed, 22 Jul 2020 23:15:36 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-437-x4uDizwDOjSRqmC2W93evA-1; Wed, 22 Jul 2020 19:15:31 -0400
X-MC-Unique: x4uDizwDOjSRqmC2W93evA-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	06MNDUQH082692; Wed, 22 Jul 2020 23:15:23 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2120.oracle.com with ESMTP id 32d6kstdue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 22 Jul 2020 23:15:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	06MNFE5P183481; Wed, 22 Jul 2020 23:15:23 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3030.oracle.com with ESMTP id 32exs4rcbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jul 2020 23:15:22 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06MNDuJY019168;
	Wed, 22 Jul 2020 23:13:56 GMT
Received: from localhost (/10.159.241.198)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 22 Jul 2020 16:13:55 -0700
Date: Wed, 22 Jul 2020 16:13:52 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: "Theodore Ts'o" <tytso@mit.edu>
Message-ID: <20200722231352.GE848607@magnolia>
References: <20200721183157.202276-1-hch@lst.de>
	<20200721183157.202276-4-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200721183157.202276-4-hch@lst.de>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9690
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=5
	mlxlogscore=999
	phishscore=0 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0
	bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007220143
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9690
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	suspectscore=5
	bulkscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
	priorityscore=1501
	lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2007220143
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Goldwyn Rodrigues <rgoldwyn@suse.de>,
	Dave Chinner <david@fromorbit.com>,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	Goldwyn Rodrigues <rgoldwyn@suse.com>, linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 3/3] iomap: fall back to buffered writes
 for invalidation failures
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Ted,

Could you please review the fs/ext4/ part of this patch (it's the
follow-on to the directio discussion I had with you last week) so that I
can get this moving for 5.9? Thx,

--D

On Tue, Jul 21, 2020 at 08:31:57PM +0200, Christoph Hellwig wrote:
> Failing to invalid the page cache means data in incoherent, which is
> a very bad state for the system.  Always fall back to buffered I/O
> through the page cache if we can't invalidate mappings.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Dave Chinner <dchinner@redhat.com>
> Reviewed-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
> ---
>  fs/ext4/file.c       |  2 ++
>  fs/gfs2/file.c       |  3 ++-
>  fs/iomap/direct-io.c | 16 +++++++++++-----
>  fs/iomap/trace.h     |  1 +
>  fs/xfs/xfs_file.c    |  4 ++--
>  fs/zonefs/super.c    |  7 +++++--
>  6 files changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index 2a01e31a032c4c..129cc1dd6b7952 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -544,6 +544,8 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		iomap_ops = &ext4_iomap_overwrite_ops;
>  	ret = iomap_dio_rw(iocb, from, iomap_ops, &ext4_dio_write_ops,
>  			   is_sync_kiocb(iocb) || unaligned_io || extend);
> +	if (ret == -ENOTBLK)
> +		ret = 0;
>  
>  	if (extend)
>  		ret = ext4_handle_inode_extension(inode, offset, ret, count);
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index bebde537ac8cf2..b085a3bea4f0fd 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -835,7 +835,8 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
>  
>  	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
>  			   is_sync_kiocb(iocb));
> -
> +	if (ret == -ENOTBLK)
> +		ret = 0;
>  out:
>  	gfs2_glock_dq(&gh);
>  out_uninit:
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index 190967e87b69e4..c1aafb2ab99072 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -10,6 +10,7 @@
>  #include <linux/backing-dev.h>
>  #include <linux/uio.h>
>  #include <linux/task_io_accounting_ops.h>
> +#include "trace.h"
>  
>  #include "../internal.h"
>  
> @@ -401,6 +402,9 @@ iomap_dio_actor(struct inode *inode, loff_t pos, loff_t length,
>   * can be mapped into multiple disjoint IOs and only a subset of the IOs issued
>   * may be pure data writes. In that case, we still need to do a full data sync
>   * completion.
> + *
> + * Returns -ENOTBLK In case of a page invalidation invalidation failure for
> + * writes.  The callers needs to fall back to buffered I/O in this case.
>   */
>  ssize_t
>  iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> @@ -478,13 +482,15 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
>  	if (iov_iter_rw(iter) == WRITE) {
>  		/*
>  		 * Try to invalidate cache pages for the range we are writing.
> -		 * If this invalidation fails, tough, the write will still work,
> -		 * but racing two incompatible write paths is a pretty crazy
> -		 * thing to do, so we don't support it 100%.
> +		 * If this invalidation fails, let the caller fall back to
> +		 * buffered I/O.
>  		 */
>  		if (invalidate_inode_pages2_range(mapping, pos >> PAGE_SHIFT,
> -				end >> PAGE_SHIFT))
> -			dio_warn_stale_pagecache(iocb->ki_filp);
> +				end >> PAGE_SHIFT)) {
> +			trace_iomap_dio_invalidate_fail(inode, pos, count);
> +			ret = -ENOTBLK;
> +			goto out_free_dio;
> +		}
>  
>  		if (!wait_for_completion && !inode->i_sb->s_dio_done_wq) {
>  			ret = sb_init_dio_done_wq(inode->i_sb);
> diff --git a/fs/iomap/trace.h b/fs/iomap/trace.h
> index 5693a39d52fb63..fdc7ae388476f5 100644
> --- a/fs/iomap/trace.h
> +++ b/fs/iomap/trace.h
> @@ -74,6 +74,7 @@ DEFINE_EVENT(iomap_range_class, name,	\
>  DEFINE_RANGE_EVENT(iomap_writepage);
>  DEFINE_RANGE_EVENT(iomap_releasepage);
>  DEFINE_RANGE_EVENT(iomap_invalidatepage);
> +DEFINE_RANGE_EVENT(iomap_dio_invalidate_fail);
>  
>  #define IOMAP_TYPE_STRINGS \
>  	{ IOMAP_HOLE,		"HOLE" }, \
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index a6ef90457abf97..1b4517fc55f1b9 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -553,8 +553,8 @@ xfs_file_dio_aio_write(
>  	xfs_iunlock(ip, iolock);
>  
>  	/*
> -	 * No fallback to buffered IO on errors for XFS, direct IO will either
> -	 * complete fully or fail.
> +	 * No fallback to buffered IO after short writes for XFS, direct I/O
> +	 * will either complete fully or return an error.
>  	 */
>  	ASSERT(ret < 0 || ret == count);
>  	return ret;
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index 07bc42d62673ce..d0a04528a7e18e 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -786,8 +786,11 @@ static ssize_t zonefs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	if (iocb->ki_pos >= ZONEFS_I(inode)->i_max_size)
>  		return -EFBIG;
>  
> -	if (iocb->ki_flags & IOCB_DIRECT)
> -		return zonefs_file_dio_write(iocb, from);
> +	if (iocb->ki_flags & IOCB_DIRECT) {
> +		ssize_t ret = zonefs_file_dio_write(iocb, from);
> +		if (ret != -ENOTBLK)
> +			return ret;
> +	}
>  
>  	return zonefs_file_buffered_write(iocb, from);
>  }
> -- 
> 2.27.0
> 

