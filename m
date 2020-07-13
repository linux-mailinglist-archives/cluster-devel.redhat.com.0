Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD7321D5C6
	for <lists+cluster-devel@lfdr.de>; Mon, 13 Jul 2020 14:22:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-43d_mPL0MSa1pHVzOwp-4Q-1; Mon, 13 Jul 2020 08:22:41 -0400
X-MC-Unique: 43d_mPL0MSa1pHVzOwp-4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EACC1932480;
	Mon, 13 Jul 2020 12:22:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EB795D9CC;
	Mon, 13 Jul 2020 12:22:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CD99180954D;
	Mon, 13 Jul 2020 12:22:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DCL0T7027846 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 08:21:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 538252026D5D; Mon, 13 Jul 2020 12:21:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F0DE2026D67
	for <cluster-devel@redhat.com>; Mon, 13 Jul 2020 12:20:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF47C856A54
	for <cluster-devel@redhat.com>; Mon, 13 Jul 2020 12:20:57 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-22-estgiGcKPwW03oYmwXVLEA-1;
	Mon, 13 Jul 2020 08:20:55 -0400
X-MC-Unique: estgiGcKPwW03oYmwXVLEA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 45B73B1E2;
	Mon, 13 Jul 2020 12:20:56 +0000 (UTC)
Date: Mon, 13 Jul 2020 07:20:50 -0500
From: Goldwyn Rodrigues <rgoldwyn@suse.de>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200713122050.okus7qlampk5ysyb@fiona>
References: <20200713074633.875946-1-hch@lst.de>
	<20200713074633.875946-3-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200713074633.875946-3-hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 2/2] iomap: fall back to buffered writes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On  9:46 13/07, Christoph Hellwig wrote:
> Failing to invalid the page cache means data in incoherent, which is
> a very bad state for the system.  Always fall back to buffered I/O
> through the page cache if we can't invalidate mappings.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks. This will help btrfs. The current next tree contains the iomap
changes I recomended and would need to be reverted in order to
incorporate this. Once this is in the next tree I will (re)format the
btrfs iomap dio patches.

Reviewed-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
> ---
>  fs/ext4/file.c       |  2 ++
>  fs/gfs2/file.c       |  3 ++-
>  fs/iomap/direct-io.c | 13 ++++++++-----
>  fs/iomap/trace.h     |  1 +
>  fs/xfs/xfs_file.c    |  4 ++--
>  fs/zonefs/super.c    |  7 +++++--
>  6 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index 2a01e31a032c4c..0da6c2a2c32c1e 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -544,6 +544,8 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		iomap_ops = &ext4_iomap_overwrite_ops;
>  	ret = iomap_dio_rw(iocb, from, iomap_ops, &ext4_dio_write_ops,
>  			   is_sync_kiocb(iocb) || unaligned_io || extend);
> +	if (ret == -EREMCHG)
> +		ret = 0;
>  
>  	if (extend)
>  		ret = ext4_handle_inode_extension(inode, offset, ret, count);
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index fe305e4bfd3734..c7907d40c61d17 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -814,7 +814,8 @@ static ssize_t gfs2_file_direct_write(struct kiocb *iocb, struct iov_iter *from)
>  
>  	ret = iomap_dio_rw(iocb, from, &gfs2_iomap_ops, NULL,
>  			   is_sync_kiocb(iocb));
> -
> +	if (ret == -EREMCHG)
> +		ret = 0;
>  out:
>  	gfs2_glock_dq(&gh);
>  out_uninit:
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index 190967e87b69e4..62626235cdbe8d 100644
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
> @@ -478,13 +479,15 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
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
> +			ret = -EREMCHG;
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
> index 00db81eac80d6c..551cca39fa3ba6 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -553,8 +553,8 @@ xfs_file_dio_aio_write(
>  	xfs_iunlock(ip, iolock);
>  
>  	/*
> -	 * No fallback to buffered IO on errors for XFS, direct IO will either
> -	 * complete fully or fail.
> +	 * No partial fallback to buffered IO on errors for XFS, direct IO will
> +	 * either complete fully or fail.
>  	 */
>  	ASSERT(ret < 0 || ret == count);
>  	return ret;
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index 07bc42d62673ce..793850454b752f 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -786,8 +786,11 @@ static ssize_t zonefs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	if (iocb->ki_pos >= ZONEFS_I(inode)->i_max_size)
>  		return -EFBIG;
>  
> -	if (iocb->ki_flags & IOCB_DIRECT)
> -		return zonefs_file_dio_write(iocb, from);
> +	if (iocb->ki_flags & IOCB_DIRECT) {
> +		ret = zonefs_file_dio_write(iocb, from);
> +		if (ret != -EREMCHG)
> +			return ret;
> +	}
>  
>  	return zonefs_file_buffered_write(iocb, from);
>  }
> -- 
> 2.26.2
> 

-- 
Goldwyn

