Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 92D243E53AC
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Aug 2021 08:40:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-cknWDvaEOfGir3u54fYF2w-1; Tue, 10 Aug 2021 02:40:14 -0400
X-MC-Unique: cknWDvaEOfGir3u54fYF2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2065190B2A0;
	Tue, 10 Aug 2021 06:40:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A2721036D2E;
	Tue, 10 Aug 2021 06:40:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 86EAD4BB7C;
	Tue, 10 Aug 2021 06:40:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17A6e0mf006376 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 02:40:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F2076200C0C7; Tue, 10 Aug 2021 06:39:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED9C32031A5A
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 06:39:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58517101A529
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 06:39:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-151-9V4BwEh9PFqW1djVhrxhoQ-1;
	Tue, 10 Aug 2021 02:39:53 -0400
X-MC-Unique: 9V4BwEh9PFqW1djVhrxhoQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id B50DD60238;
	Tue, 10 Aug 2021 06:39:51 +0000 (UTC)
Date: Mon, 9 Aug 2021 23:39:51 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210810063951.GH3601443@magnolia>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-20-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210809061244.1196573-20-hch@lst.de>
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
Subject: Re: [Cluster-devel] [PATCH 19/30] iomap: switch iomap_bmap to use
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 09, 2021 at 08:12:33AM +0200, Christoph Hellwig wrote:
> Rewrite the ->bmap implementation based on iomap_iter.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/iomap/fiemap.c | 31 +++++++++++++------------------
>  1 file changed, 13 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/iomap/fiemap.c b/fs/iomap/fiemap.c
> index acad09a8c188df..60daadba16c149 100644
> --- a/fs/iomap/fiemap.c
> +++ b/fs/iomap/fiemap.c
> @@ -92,35 +92,30 @@ int iomap_fiemap(struct inode *inode, struct fiemap_extent_info *fi,
>  }
>  EXPORT_SYMBOL_GPL(iomap_fiemap);
>  
> -static loff_t
> -iomap_bmap_actor(struct inode *inode, loff_t pos, loff_t length,
> -		void *data, struct iomap *iomap, struct iomap *srcmap)
> -{
> -	sector_t *bno = data, addr;
> -
> -	if (iomap->type == IOMAP_MAPPED) {
> -		addr = (pos - iomap->offset + iomap->addr) >> inode->i_blkbits;
> -		*bno = addr;
> -	}
> -	return 0;
> -}
> -
>  /* legacy ->bmap interface.  0 is the error return (!) */
>  sector_t
>  iomap_bmap(struct address_space *mapping, sector_t bno,
>  		const struct iomap_ops *ops)
>  {
> -	struct inode *inode = mapping->host;
> -	loff_t pos = bno << inode->i_blkbits;
> -	unsigned blocksize = i_blocksize(inode);
> +	struct iomap_iter iter = {
> +		.inode	= mapping->host,
> +		.pos	= (loff_t)bno << mapping->host->i_blkbits,
> +		.len	= i_blocksize(mapping->host),
> +		.flags	= IOMAP_REPORT,
> +	};
>  	int ret;
>  
>  	if (filemap_write_and_wait(mapping))
>  		return 0;
>  
>  	bno = 0;
> -	ret = iomap_apply(inode, pos, blocksize, 0, ops, &bno,
> -			  iomap_bmap_actor);
> +	while ((ret = iomap_iter(&iter, ops)) > 0) {
> +		if (iter.iomap.type != IOMAP_MAPPED)
> +			continue;

I still feel uncomfortable about this use of "continue" here, because it
really means "call iomap_iter again to clean up and exit even though we
know it won't even look for more iomaps to iterate".

To me that feels subtly broken (I usually associate 'continue' with
'go run the loop body again'), and even though bmap has been a quirky
hot mess for 45 years, we don't need to make it even moreso.

Can't this at least be rephrased as:

	const uint bno_shift = (mapping->host->i_blkbits - SECTOR_SHIFT);

	while ((ret = iomap_iter(&iter, ops)) > 0) {
		if (iter.iomap.type == IOMAP_MAPPED)
			bno = iomap_sector(iomap, iter.pos) << bno_shift;
		/* leave iter.processed unset to stop iteration */
	}

to make the loop exit more explicit?

--D

> +		bno = (iter.pos - iter.iomap.offset + iter.iomap.addr) >>
> +				mapping->host->i_blkbits;
> +	}
> +
>  	if (ret)
>  		return 0;
>  	return bno;
> -- 
> 2.30.2
> 

