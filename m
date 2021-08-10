Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 038EB3E86E1
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Aug 2021 01:56:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-AVZ6bZFzMUmZ12i2tztwDA-1; Tue, 10 Aug 2021 19:56:15 -0400
X-MC-Unique: AVZ6bZFzMUmZ12i2tztwDA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 170F5106F6EB;
	Tue, 10 Aug 2021 23:56:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00EE55D740;
	Tue, 10 Aug 2021 23:56:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E06154A7C8;
	Tue, 10 Aug 2021 23:56:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17ANsRw2001503 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 19:54:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 650902038B98; Tue, 10 Aug 2021 23:54:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 610C52038B93
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 23:54:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 029328D1383
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 23:54:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-76-A6-WniGzOnGYsuu9rDR9Sw-1; 
	Tue, 10 Aug 2021 19:54:20 -0400
X-MC-Unique: A6-WniGzOnGYsuu9rDR9Sw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBDD960F38;
	Tue, 10 Aug 2021 23:54:18 +0000 (UTC)
Date: Tue, 10 Aug 2021 16:54:18 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210810235418.GM3601443@magnolia>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-15-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210809061244.1196573-15-hch@lst.de>
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
Subject: Re: [Cluster-devel] [PATCH 14/30] iomap: switch iomap_file_unshare
	to use iomap_iter
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 09, 2021 at 08:12:28AM +0200, Christoph Hellwig wrote:
> Switch iomap_file_unshare to use iomap_iter.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/iomap/buffered-io.c | 35 ++++++++++++++++++-----------------
>  1 file changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 4c7e82928cc546..4f525727462f33 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -817,10 +817,12 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
>  }
>  EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
>  
> -static loff_t
> -iomap_unshare_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
> -		struct iomap *iomap, struct iomap *srcmap)
> +static loff_t iomap_unshare_iter(struct iomap_iter *iter)
>  {
> +	struct iomap *iomap = &iter->iomap;
> +	struct iomap *srcmap = iomap_iter_srcmap(iter);
> +	loff_t pos = iter->pos;
> +	loff_t length = iomap_length(iter);
>  	long status = 0;
>  	loff_t written = 0;
>  
> @@ -836,12 +838,12 @@ iomap_unshare_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
>  		unsigned long bytes = min_t(loff_t, PAGE_SIZE - offset, length);
>  		struct page *page;
>  
> -		status = iomap_write_begin(inode, pos, bytes,
> +		status = iomap_write_begin(iter->inode, pos, bytes,
>  				IOMAP_WRITE_F_UNSHARE, &page, iomap, srcmap);
>  		if (unlikely(status))
>  			return status;
>  
> -		status = iomap_write_end(inode, pos, bytes, bytes, page, iomap,
> +		status = iomap_write_end(iter->inode, pos, bytes, bytes, page, iomap,
>  				srcmap);
>  		if (WARN_ON_ONCE(status == 0))
>  			return -EIO;
> @@ -852,7 +854,7 @@ iomap_unshare_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
>  		written += status;
>  		length -= status;
>  
> -		balance_dirty_pages_ratelimited(inode->i_mapping);
> +		balance_dirty_pages_ratelimited(iter->inode->i_mapping);
>  	} while (length);
>  
>  	return written;
> @@ -862,18 +864,17 @@ int
>  iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
>  		const struct iomap_ops *ops)
>  {
> -	loff_t ret;
> -
> -	while (len) {
> -		ret = iomap_apply(inode, pos, len, IOMAP_WRITE, ops, NULL,
> -				iomap_unshare_actor);
> -		if (ret <= 0)
> -			return ret;
> -		pos += ret;
> -		len -= ret;
> -	}
> +	struct iomap_iter iter = {
> +		.inode		= inode,
> +		.pos		= pos,
> +		.len		= len,
> +		.flags		= IOMAP_WRITE,
> +	};
> +	int ret;
>  
> -	return 0;
> +	while ((ret = iomap_iter(&iter, ops)) > 0)
> +		iter.processed = iomap_unshare_iter(&iter);
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(iomap_file_unshare);
>  
> -- 
> 2.30.2
> 

