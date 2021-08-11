Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 056AB3E8708
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Aug 2021 02:08:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-3MHoxFerO02xG5xULbcPbA-1; Tue, 10 Aug 2021 20:08:49 -0400
X-MC-Unique: 3MHoxFerO02xG5xULbcPbA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11319106F713;
	Wed, 11 Aug 2021 00:08:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAF2A5C1A1;
	Wed, 11 Aug 2021 00:08:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A29F94A7C8;
	Wed, 11 Aug 2021 00:08:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17B05iDW002370 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 20:05:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 783361007BA7; Wed, 11 Aug 2021 00:05:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72B7010150F1
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 00:05:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9280818A01A9
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 00:05:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-31-WnHHtVdNNzOjZcB62NBZug-1; 
	Tue, 10 Aug 2021 20:05:39 -0400
X-MC-Unique: WnHHtVdNNzOjZcB62NBZug-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id F340861019;
	Wed, 11 Aug 2021 00:05:37 +0000 (UTC)
Date: Tue, 10 Aug 2021 17:05:37 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210811000537.GP3601443@magnolia>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-19-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210809061244.1196573-19-hch@lst.de>
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
Subject: Re: [Cluster-devel] [PATCH 18/30] iomap: switch iomap_fiemap to use
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 09, 2021 at 08:12:32AM +0200, Christoph Hellwig wrote:
> Rewrite the ->fiemap implementation based on iomap_iter.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Nice cleanups!
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/iomap/fiemap.c | 70 ++++++++++++++++++++---------------------------
>  1 file changed, 29 insertions(+), 41 deletions(-)
> 
> diff --git a/fs/iomap/fiemap.c b/fs/iomap/fiemap.c
> index aab070df4a2175..acad09a8c188df 100644
> --- a/fs/iomap/fiemap.c
> +++ b/fs/iomap/fiemap.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (c) 2016-2018 Christoph Hellwig.
> + * Copyright (c) 2016-2021 Christoph Hellwig.
>   */
>  #include <linux/module.h>
>  #include <linux/compiler.h>
> @@ -8,13 +8,8 @@
>  #include <linux/iomap.h>
>  #include <linux/fiemap.h>
>  
> -struct fiemap_ctx {
> -	struct fiemap_extent_info *fi;
> -	struct iomap prev;
> -};
> -
>  static int iomap_to_fiemap(struct fiemap_extent_info *fi,
> -		struct iomap *iomap, u32 flags)
> +		const struct iomap *iomap, u32 flags)
>  {
>  	switch (iomap->type) {
>  	case IOMAP_HOLE:
> @@ -43,24 +38,22 @@ static int iomap_to_fiemap(struct fiemap_extent_info *fi,
>  			iomap->length, flags);
>  }
>  
> -static loff_t
> -iomap_fiemap_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
> -		struct iomap *iomap, struct iomap *srcmap)
> +static loff_t iomap_fiemap_iter(const struct iomap_iter *iter,
> +		struct fiemap_extent_info *fi, struct iomap *prev)
>  {
> -	struct fiemap_ctx *ctx = data;
> -	loff_t ret = length;
> +	int ret;
>  
> -	if (iomap->type == IOMAP_HOLE)
> -		return length;
> +	if (iter->iomap.type == IOMAP_HOLE)
> +		return iomap_length(iter);
>  
> -	ret = iomap_to_fiemap(ctx->fi, &ctx->prev, 0);
> -	ctx->prev = *iomap;
> +	ret = iomap_to_fiemap(fi, prev, 0);
> +	*prev = iter->iomap;
>  	switch (ret) {
>  	case 0:		/* success */
> -		return length;
> +		return iomap_length(iter);
>  	case 1:		/* extent array full */
>  		return 0;
> -	default:
> +	default:	/* error */
>  		return ret;
>  	}
>  }
> @@ -68,38 +61,33 @@ iomap_fiemap_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
>  int iomap_fiemap(struct inode *inode, struct fiemap_extent_info *fi,
>  		u64 start, u64 len, const struct iomap_ops *ops)
>  {
> -	struct fiemap_ctx ctx;
> -	loff_t ret;
> -
> -	memset(&ctx, 0, sizeof(ctx));
> -	ctx.fi = fi;
> -	ctx.prev.type = IOMAP_HOLE;
> +	struct iomap_iter iter = {
> +		.inode		= inode,
> +		.pos		= start,
> +		.len		= len,
> +		.flags		= IOMAP_REPORT,
> +	};
> +	struct iomap prev = {
> +		.type		= IOMAP_HOLE,
> +	};
> +	int ret;
>  
> -	ret = fiemap_prep(inode, fi, start, &len, 0);
> +	ret = fiemap_prep(inode, fi, start, &iter.len, 0);
>  	if (ret)
>  		return ret;
>  
> -	while (len > 0) {
> -		ret = iomap_apply(inode, start, len, IOMAP_REPORT, ops, &ctx,
> -				iomap_fiemap_actor);
> -		/* inode with no (attribute) mapping will give ENOENT */
> -		if (ret == -ENOENT)
> -			break;
> -		if (ret < 0)
> -			return ret;
> -		if (ret == 0)
> -			break;
> +	while ((ret = iomap_iter(&iter, ops)) > 0)
> +		iter.processed = iomap_fiemap_iter(&iter, fi, &prev);
>  
> -		start += ret;
> -		len -= ret;
> -	}
> -
> -	if (ctx.prev.type != IOMAP_HOLE) {
> -		ret = iomap_to_fiemap(fi, &ctx.prev, FIEMAP_EXTENT_LAST);
> +	if (prev.type != IOMAP_HOLE) {
> +		ret = iomap_to_fiemap(fi, &prev, FIEMAP_EXTENT_LAST);
>  		if (ret < 0)
>  			return ret;
>  	}
>  
> +	/* inode with no (attribute) mapping will give ENOENT */
> +	if (ret < 0 && ret != -ENOENT)
> +		return ret;
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(iomap_fiemap);
> -- 
> 2.30.2
> 

