Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A2B553E86E0
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Aug 2021 01:56:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-yfLSzFCCP0yJ1ggFWYgkww-1; Tue, 10 Aug 2021 19:56:15 -0400
X-MC-Unique: yfLSzFCCP0yJ1ggFWYgkww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8DD41853028;
	Tue, 10 Aug 2021 23:56:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A5F760BF1;
	Tue, 10 Aug 2021 23:56:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85D3D4BB7C;
	Tue, 10 Aug 2021 23:56:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17ANsq6s001516 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 19:54:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A23B4115D7D0; Tue, 10 Aug 2021 23:54:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D394115D7CF
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 23:54:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F6A58CA952
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 23:54:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-255-yeKUFvXbMlWTSLTJRLm4UQ-1;
	Tue, 10 Aug 2021 19:54:45 -0400
X-MC-Unique: yeKUFvXbMlWTSLTJRLm4UQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17DF360F38;
	Tue, 10 Aug 2021 23:54:44 +0000 (UTC)
Date: Tue, 10 Aug 2021 16:54:43 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210810235443.GN3601443@magnolia>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-16-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210809061244.1196573-16-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 15/30] iomap: switch iomap_zero_range to
	use iomap_iter
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 09, 2021 at 08:12:29AM +0200, Christoph Hellwig wrote:
> Switch iomap_zero_range to use iomap_iter.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Straightforward.
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/iomap/buffered-io.c | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 4f525727462f33..3a23f7346938fb 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -896,11 +896,12 @@ static s64 iomap_zero(struct inode *inode, loff_t pos, u64 length,
>  	return iomap_write_end(inode, pos, bytes, bytes, page, iomap, srcmap);
>  }
>  
> -static loff_t iomap_zero_range_actor(struct inode *inode, loff_t pos,
> -		loff_t length, void *data, struct iomap *iomap,
> -		struct iomap *srcmap)
> +static loff_t iomap_zero_iter(struct iomap_iter *iter, bool *did_zero)
>  {
> -	bool *did_zero = data;
> +	struct iomap *iomap = &iter->iomap;
> +	struct iomap *srcmap = iomap_iter_srcmap(iter);
> +	loff_t pos = iter->pos;
> +	loff_t length = iomap_length(iter);
>  	loff_t written = 0;
>  
>  	/* already zeroed?  we're done. */
> @@ -910,10 +911,11 @@ static loff_t iomap_zero_range_actor(struct inode *inode, loff_t pos,
>  	do {
>  		s64 bytes;
>  
> -		if (IS_DAX(inode))
> +		if (IS_DAX(iter->inode))
>  			bytes = dax_iomap_zero(pos, length, iomap);
>  		else
> -			bytes = iomap_zero(inode, pos, length, iomap, srcmap);
> +			bytes = iomap_zero(iter->inode, pos, length, iomap,
> +					   srcmap);
>  		if (bytes < 0)
>  			return bytes;
>  
> @@ -931,19 +933,17 @@ int
>  iomap_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
>  		const struct iomap_ops *ops)
>  {
> -	loff_t ret;
> -
> -	while (len > 0) {
> -		ret = iomap_apply(inode, pos, len, IOMAP_ZERO,
> -				ops, did_zero, iomap_zero_range_actor);
> -		if (ret <= 0)
> -			return ret;
> -
> -		pos += ret;
> -		len -= ret;
> -	}
> +	struct iomap_iter iter = {
> +		.inode		= inode,
> +		.pos		= pos,
> +		.len		= len,
> +		.flags		= IOMAP_ZERO,
> +	};
> +	int ret;
>  
> -	return 0;
> +	while ((ret = iomap_iter(&iter, ops)) > 0)
> +		iter.processed = iomap_zero_iter(&iter, did_zero);
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(iomap_zero_range);
>  
> -- 
> 2.30.2
> 

