Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCC43E86DC
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Aug 2021 01:55:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-s3V4jcwZPH2T6R8W1WGxDQ-1; Tue, 10 Aug 2021 19:55:16 -0400
X-MC-Unique: s3V4jcwZPH2T6R8W1WGxDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD393760C0;
	Tue, 10 Aug 2021 23:55:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A13236E6E1;
	Tue, 10 Aug 2021 23:55:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 897214BB7B;
	Tue, 10 Aug 2021 23:55:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17ANrYKb001417 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 19:53:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B6BA3212420B; Tue, 10 Aug 2021 23:53:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B14122124209
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 23:53:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33C30101A54C
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 23:53:32 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-40-I-whQDvlPXCIwXYTTMw4FA-1; 
	Tue, 10 Aug 2021 19:53:28 -0400
X-MC-Unique: I-whQDvlPXCIwXYTTMw4FA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0155060F55;
	Tue, 10 Aug 2021 23:53:26 +0000 (UTC)
Date: Tue, 10 Aug 2021 16:53:26 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210810235326.GL3601443@magnolia>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-14-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210809061244.1196573-14-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 13/30] iomap: switch
 iomap_file_buffered_write to use iomap_iter
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 09, 2021 at 08:12:27AM +0200, Christoph Hellwig wrote:
> Switch iomap_file_buffered_write to use iomap_iter.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Seems pretty straightforward.
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/iomap/buffered-io.c | 49 +++++++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 9cda461887afad..4c7e82928cc546 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -726,13 +726,14 @@ static size_t iomap_write_end(struct inode *inode, loff_t pos, size_t len,
>  	return ret;
>  }
>  
> -static loff_t
> -iomap_write_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
> -		struct iomap *iomap, struct iomap *srcmap)
> +static loff_t iomap_write_iter(struct iomap_iter *iter, struct iov_iter *i)
>  {
> -	struct iov_iter *i = data;
> -	long status = 0;
> +	struct iomap *srcmap = iomap_iter_srcmap(iter);
> +	struct iomap *iomap = &iter->iomap;
> +	loff_t length = iomap_length(iter);
> +	loff_t pos = iter->pos;
>  	ssize_t written = 0;
> +	long status = 0;
>  
>  	do {
>  		struct page *page;
> @@ -758,18 +759,18 @@ iomap_write_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
>  			break;
>  		}
>  
> -		status = iomap_write_begin(inode, pos, bytes, 0, &page, iomap,
> -				srcmap);
> +		status = iomap_write_begin(iter->inode, pos, bytes, 0, &page,
> +					   iomap, srcmap);
>  		if (unlikely(status))
>  			break;
>  
> -		if (mapping_writably_mapped(inode->i_mapping))
> +		if (mapping_writably_mapped(iter->inode->i_mapping))
>  			flush_dcache_page(page);
>  
>  		copied = copy_page_from_iter_atomic(page, offset, bytes, i);
>  
> -		status = iomap_write_end(inode, pos, bytes, copied, page, iomap,
> -				srcmap);
> +		status = iomap_write_end(iter->inode, pos, bytes, copied, page,
> +					 iomap, srcmap);
>  
>  		if (unlikely(copied != status))
>  			iov_iter_revert(i, copied - status);
> @@ -790,29 +791,29 @@ iomap_write_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
>  		written += status;
>  		length -= status;
>  
> -		balance_dirty_pages_ratelimited(inode->i_mapping);
> +		balance_dirty_pages_ratelimited(iter->inode->i_mapping);
>  	} while (iov_iter_count(i) && length);
>  
>  	return written ? written : status;
>  }
>  
>  ssize_t
> -iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *iter,
> +iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
>  		const struct iomap_ops *ops)
>  {
> -	struct inode *inode = iocb->ki_filp->f_mapping->host;
> -	loff_t pos = iocb->ki_pos, ret = 0, written = 0;
> -
> -	while (iov_iter_count(iter)) {
> -		ret = iomap_apply(inode, pos, iov_iter_count(iter),
> -				IOMAP_WRITE, ops, iter, iomap_write_actor);
> -		if (ret <= 0)
> -			break;
> -		pos += ret;
> -		written += ret;
> -	}
> +	struct iomap_iter iter = {
> +		.inode		= iocb->ki_filp->f_mapping->host,
> +		.pos		= iocb->ki_pos,
> +		.len		= iov_iter_count(i),
> +		.flags		= IOMAP_WRITE,
> +	};
> +	int ret;
>  
> -	return written ? written : ret;
> +	while ((ret = iomap_iter(&iter, ops)) > 0)
> +		iter.processed = iomap_write_iter(&iter, i);
> +	if (iter.pos == iocb->ki_pos)
> +		return ret;
> +	return iter.pos - iocb->ki_pos;
>  }
>  EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
>  
> -- 
> 2.30.2
> 

