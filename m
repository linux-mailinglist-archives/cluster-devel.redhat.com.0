Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 83CF82105A1
	for <lists+cluster-devel@lfdr.de>; Wed,  1 Jul 2020 10:01:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-RsAD1DmIMjec8QqQgP2tow-1; Wed, 01 Jul 2020 04:01:54 -0400
X-MC-Unique: RsAD1DmIMjec8QqQgP2tow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1AA5107ACCD;
	Wed,  1 Jul 2020 08:01:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89DA45C6C0;
	Wed,  1 Jul 2020 08:01:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B613B1809543;
	Wed,  1 Jul 2020 08:01:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06181fXT027264 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 04:01:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 736902144B4E; Wed,  1 Jul 2020 08:01:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A89C2156720
	for <cluster-devel@redhat.com>; Wed,  1 Jul 2020 08:01:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC6CE924912
	for <cluster-devel@redhat.com>; Wed,  1 Jul 2020 08:01:38 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-350-dhCxWFaoMh2YlmCQ3LNuPw-1;
	Wed, 01 Jul 2020 04:01:36 -0400
X-MC-Unique: dhCxWFaoMh2YlmCQ3LNuPw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 755A968B02; Wed,  1 Jul 2020 09:53:10 +0200 (CEST)
Date: Wed, 1 Jul 2020 09:53:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Goldwyn Rodrigues <rgoldwyn@suse.de>
Message-ID: <20200701075310.GB29884@lst.de>
References: <20200629192353.20841-1-rgoldwyn@suse.de>
	<20200629192353.20841-3-rgoldwyn@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200629192353.20841-3-rgoldwyn@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, fdmanana@gmail.com, darrick.wong@oracle.com,
	david@fromorbit.com, dsterba@suse.cz, cluster-devel@redhat.com,
	Goldwyn Rodrigues <rgoldwyn@suse.com>,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	hch@lst.de, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] always fall back to buffered I/O after invalidation
 failures,
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

On Mon, Jun 29, 2020 at 02:23:49PM -0500, Goldwyn Rodrigues wrote:
> From: Goldwyn Rodrigues <rgoldwyn@suse.com>
> 
> For direct I/O, add the flag IOMAP_DIO_RWF_NO_STALE_PAGECACHE to indicate
> that if the page invalidation fails, return back control to the
> filesystem so it may fallback to buffered mode.
> 
> Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
> Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>

I'd like to start a discussion of this shouldn't really be the
default behavior.  If we have page cache that can't be invalidated it
actually makes a whole lot of sense to not do direct I/O, avoid the
warnings, etc.

Adding all the relevant lists.

> ---
>  fs/iomap/direct-io.c  |  8 +++++++-
>  include/linux/iomap.h | 14 ++++++++++++++
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index fd22bff61569..2459c76e41ab 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -484,8 +484,14 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
>  	 */
>  	ret = invalidate_inode_pages2_range(mapping,
>  			pos >> PAGE_SHIFT, end >> PAGE_SHIFT);
> -	if (ret)
> +	if (ret) {
> +		if (dio_flags & IOMAP_DIO_RWF_NO_STALE_PAGECACHE) {
> +			if (ret == -EBUSY)
> +				ret = 0;
> +			goto out_free_dio;
> +		}
>  		dio_warn_stale_pagecache(iocb->ki_filp);
> +	}
>  	ret = 0;
>  
>  	if (iov_iter_rw(iter) == WRITE && !wait_for_completion &&
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index 8a4ba1635202..2ebb8a298cd8 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -262,7 +262,21 @@ struct iomap_dio_ops {
>  /*
>   * Wait for completion of DIO
>   */
> +
>  #define IOMAP_DIO_RWF_SYNCIO			(1 << 0)
> +/*
> + * Direct IO will attempt to keep the page cache coherent by
> + * invalidating the inode's page cache over the range of the DIO.
> + * That can fail if something else is actively using the page cache.
> + * If this happens and the DIO continues, the data in the page
> + * cache will become stale.
> + *
> + * Set this flag if you want the DIO to abort without issuing any IO
> + * or error if it fails to invalidate the page cache successfully.
> + * This allows the IO submitter to fallback to buffered IO to resubmit
> + * IO
> + */
> +#define IOMAP_DIO_RWF_NO_STALE_PAGECACHE	(1 << 1)
>  
>  ssize_t iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
>  		const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
> -- 
> 2.26.2
---end quoted text---

