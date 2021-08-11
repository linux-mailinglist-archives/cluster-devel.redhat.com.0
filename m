Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9B17D3E870A
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Aug 2021 02:10:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-fAee44p4PnSPTfUmqmdUxw-1; Tue, 10 Aug 2021 20:10:02 -0400
X-MC-Unique: fAee44p4PnSPTfUmqmdUxw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C6BF3E743;
	Wed, 11 Aug 2021 00:10:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C66A60861;
	Wed, 11 Aug 2021 00:10:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B81E181A0F2;
	Wed, 11 Aug 2021 00:10:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17B0850N002774 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 20:08:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F892204470E; Wed, 11 Aug 2021 00:08:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B7B3204470C
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 00:08:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 379488007B1
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 00:08:02 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-548-LmzttQJXMX-Od0jd0qiRVw-1;
	Tue, 10 Aug 2021 20:08:00 -0400
X-MC-Unique: LmzttQJXMX-Od0jd0qiRVw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3F9D600CD;
	Wed, 11 Aug 2021 00:07:58 +0000 (UTC)
Date: Tue, 10 Aug 2021 17:07:58 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210811000758.GQ3601443@magnolia>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-24-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210809061244.1196573-24-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 23/30] fsdax: switch dax_iomap_rw to use
	iomap_iter
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 09, 2021 at 08:12:37AM +0200, Christoph Hellwig wrote:
> Switch the dax_iomap_rw implementation to use iomap_iter.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

/me gets excited about this file getting cleaned up
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/dax.c | 49 ++++++++++++++++++++++++-------------------------
>  1 file changed, 24 insertions(+), 25 deletions(-)
> 
> diff --git a/fs/dax.c b/fs/dax.c
> index 4d63040fd71f56..51da45301350a6 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -1103,20 +1103,21 @@ s64 dax_iomap_zero(loff_t pos, u64 length, struct iomap *iomap)
>  	return size;
>  }
>  
> -static loff_t
> -dax_iomap_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
> -		struct iomap *iomap, struct iomap *srcmap)
> +static loff_t dax_iomap_iter(const struct iomap_iter *iomi,
> +		struct iov_iter *iter)
>  {
> +	const struct iomap *iomap = &iomi->iomap;
> +	loff_t length = iomap_length(iomi);
> +	loff_t pos = iomi->pos;
>  	struct block_device *bdev = iomap->bdev;
>  	struct dax_device *dax_dev = iomap->dax_dev;
> -	struct iov_iter *iter = data;
>  	loff_t end = pos + length, done = 0;
>  	ssize_t ret = 0;
>  	size_t xfer;
>  	int id;
>  
>  	if (iov_iter_rw(iter) == READ) {
> -		end = min(end, i_size_read(inode));
> +		end = min(end, i_size_read(iomi->inode));
>  		if (pos >= end)
>  			return 0;
>  
> @@ -1133,7 +1134,7 @@ dax_iomap_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
>  	 * written by write(2) is visible in mmap.
>  	 */
>  	if (iomap->flags & IOMAP_F_NEW) {
> -		invalidate_inode_pages2_range(inode->i_mapping,
> +		invalidate_inode_pages2_range(iomi->inode->i_mapping,
>  					      pos >> PAGE_SHIFT,
>  					      (end - 1) >> PAGE_SHIFT);
>  	}
> @@ -1209,31 +1210,29 @@ ssize_t
>  dax_iomap_rw(struct kiocb *iocb, struct iov_iter *iter,
>  		const struct iomap_ops *ops)
>  {
> -	struct address_space *mapping = iocb->ki_filp->f_mapping;
> -	struct inode *inode = mapping->host;
> -	loff_t pos = iocb->ki_pos, ret = 0, done = 0;
> -	unsigned flags = 0;
> +	struct iomap_iter iomi = {
> +		.inode		= iocb->ki_filp->f_mapping->host,
> +		.pos		= iocb->ki_pos,
> +		.len		= iov_iter_count(iter),
> +	};
> +	loff_t done = 0;
> +	int ret;
>  
>  	if (iov_iter_rw(iter) == WRITE) {
> -		lockdep_assert_held_write(&inode->i_rwsem);
> -		flags |= IOMAP_WRITE;
> +		lockdep_assert_held_write(&iomi.inode->i_rwsem);
> +		iomi.flags |= IOMAP_WRITE;
>  	} else {
> -		lockdep_assert_held(&inode->i_rwsem);
> +		lockdep_assert_held(&iomi.inode->i_rwsem);
>  	}
>  
>  	if (iocb->ki_flags & IOCB_NOWAIT)
> -		flags |= IOMAP_NOWAIT;
> +		iomi.flags |= IOMAP_NOWAIT;
>  
> -	while (iov_iter_count(iter)) {
> -		ret = iomap_apply(inode, pos, iov_iter_count(iter), flags, ops,
> -				iter, dax_iomap_actor);
> -		if (ret <= 0)
> -			break;
> -		pos += ret;
> -		done += ret;
> -	}
> +	while ((ret = iomap_iter(&iomi, ops)) > 0)
> +		iomi.processed = dax_iomap_iter(&iomi, iter);
>  
> -	iocb->ki_pos += done;
> +	done = iomi.pos - iocb->ki_pos;
> +	iocb->ki_pos = iomi.pos;
>  	return done ? done : ret;
>  }
>  EXPORT_SYMBOL_GPL(dax_iomap_rw);
> @@ -1307,7 +1306,7 @@ static vm_fault_t dax_iomap_pte_fault(struct vm_fault *vmf, pfn_t *pfnp,
>  	}
>  
>  	/*
> -	 * Note that we don't bother to use iomap_apply here: DAX required
> +	 * Note that we don't bother to use iomap_iter here: DAX required
>  	 * the file system block size to be equal the page size, which means
>  	 * that we never have to deal with more than a single extent here.
>  	 */
> @@ -1561,7 +1560,7 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
>  	}
>  
>  	/*
> -	 * Note that we don't use iomap_apply here.  We aren't doing I/O, only
> +	 * Note that we don't use iomap_iter here.  We aren't doing I/O, only
>  	 * setting up a mapping, so really we're using iomap_begin() as a way
>  	 * to look up our filesystem block.
>  	 */
> -- 
> 2.30.2
> 

