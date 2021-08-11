Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 171DC3E8719
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Aug 2021 02:17:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-ynOlxT0DOwqw-eXK3mMZyQ-1; Tue, 10 Aug 2021 20:17:22 -0400
X-MC-Unique: ynOlxT0DOwqw-eXK3mMZyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4CF6871803;
	Wed, 11 Aug 2021 00:17:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B843A421F;
	Wed, 11 Aug 2021 00:17:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7974A181A0F7;
	Wed, 11 Aug 2021 00:17:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17B0DPao003151 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 20:13:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DC9A22044716; Wed, 11 Aug 2021 00:13:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D84E82044715
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 00:13:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60065858EEC
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 00:13:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-380-bXaDIEKcN-y-QROHglSwpg-1;
	Tue, 10 Aug 2021 20:13:18 -0400
X-MC-Unique: bXaDIEKcN-y-QROHglSwpg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D56260F55;
	Wed, 11 Aug 2021 00:13:17 +0000 (UTC)
Date: Tue, 10 Aug 2021 17:13:16 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210811001316.GT3601443@magnolia>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-21-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210809061244.1196573-21-hch@lst.de>
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
Subject: Re: [Cluster-devel] [PATCH 20/30] iomap: switch iomap_seek_hole to
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 09, 2021 at 08:12:34AM +0200, Christoph Hellwig wrote:
> Rewrite iomap_seek_hole to use iomap_iter.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me,
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/iomap/seek.c | 51 +++++++++++++++++++++++++------------------------
>  1 file changed, 26 insertions(+), 25 deletions(-)
> 
> diff --git a/fs/iomap/seek.c b/fs/iomap/seek.c
> index ce6fb810854fec..fed8f9005f9e46 100644
> --- a/fs/iomap/seek.c
> +++ b/fs/iomap/seek.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (C) 2017 Red Hat, Inc.
> - * Copyright (c) 2018 Christoph Hellwig.
> + * Copyright (c) 2018-2021 Christoph Hellwig.
>   */
>  #include <linux/module.h>
>  #include <linux/compiler.h>
> @@ -10,21 +10,20 @@
>  #include <linux/pagemap.h>
>  #include <linux/pagevec.h>
>  
> -static loff_t
> -iomap_seek_hole_actor(struct inode *inode, loff_t start, loff_t length,
> -		      void *data, struct iomap *iomap, struct iomap *srcmap)
> +static loff_t iomap_seek_hole_iter(const struct iomap_iter *iter,
> +		loff_t *hole_pos)
>  {
> -	loff_t offset = start;
> +	loff_t length = iomap_length(iter);
>  
> -	switch (iomap->type) {
> +	switch (iter->iomap.type) {
>  	case IOMAP_UNWRITTEN:
> -		offset = mapping_seek_hole_data(inode->i_mapping, start,
> -				start + length, SEEK_HOLE);
> -		if (offset == start + length)
> +		*hole_pos = mapping_seek_hole_data(iter->inode->i_mapping,
> +				iter->pos, iter->pos + length, SEEK_HOLE);
> +		if (*hole_pos == iter->pos + length)
>  			return length;
> -		fallthrough;
> +		return 0;
>  	case IOMAP_HOLE:
> -		*(loff_t *)data = offset;
> +		*hole_pos = iter->pos;
>  		return 0;
>  	default:
>  		return length;
> @@ -32,26 +31,28 @@ iomap_seek_hole_actor(struct inode *inode, loff_t start, loff_t length,
>  }
>  
>  loff_t
> -iomap_seek_hole(struct inode *inode, loff_t offset, const struct iomap_ops *ops)
> +iomap_seek_hole(struct inode *inode, loff_t pos, const struct iomap_ops *ops)
>  {
>  	loff_t size = i_size_read(inode);
> -	loff_t ret;
> +	struct iomap_iter iter = {
> +		.inode	= inode,
> +		.pos	= pos,
> +		.flags	= IOMAP_REPORT,
> +	};
> +	int ret;
>  
>  	/* Nothing to be found before or beyond the end of the file. */
> -	if (offset < 0 || offset >= size)
> +	if (pos < 0 || pos >= size)
>  		return -ENXIO;
>  
> -	while (offset < size) {
> -		ret = iomap_apply(inode, offset, size - offset, IOMAP_REPORT,
> -				  ops, &offset, iomap_seek_hole_actor);
> -		if (ret < 0)
> -			return ret;
> -		if (ret == 0)
> -			break;
> -		offset += ret;
> -	}
> -
> -	return offset;
> +	iter.len = size - pos;
> +	while ((ret = iomap_iter(&iter, ops)) > 0)
> +		iter.processed = iomap_seek_hole_iter(&iter, &pos);
> +	if (ret < 0)
> +		return ret;
> +	if (iter.len) /* found hole before EOF */
> +		return pos;
> +	return size;
>  }
>  EXPORT_SYMBOL_GPL(iomap_seek_hole);
>  
> -- 
> 2.30.2
> 

