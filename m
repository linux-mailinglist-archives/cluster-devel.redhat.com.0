Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 612B43E870B
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Aug 2021 02:10:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-cKGuTHb9NlOccpz98UsG3A-1; Tue, 10 Aug 2021 20:10:02 -0400
X-MC-Unique: cKGuTHb9NlOccpz98UsG3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D36601007C87;
	Wed, 11 Aug 2021 00:10:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFCBF4536;
	Wed, 11 Aug 2021 00:10:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A84DF181A0F2;
	Wed, 11 Aug 2021 00:10:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17B08o8c002813 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 20:08:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F393204470C; Wed, 11 Aug 2021 00:08:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AFCB2044714
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 00:08:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 457CE8556F0
	for <cluster-devel@redhat.com>; Wed, 11 Aug 2021 00:08:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-156-AAQQv_9OPT6tevTDtbs-kA-1;
	Tue, 10 Aug 2021 20:08:45 -0400
X-MC-Unique: AAQQv_9OPT6tevTDtbs-kA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6007600CD;
	Wed, 11 Aug 2021 00:08:43 +0000 (UTC)
Date: Tue, 10 Aug 2021 17:08:43 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210811000843.GR3601443@magnolia>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-23-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210809061244.1196573-23-hch@lst.de>
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
Subject: Re: [Cluster-devel] [PATCH 22/30] iomap: switch
 iomap_swapfile_activate to use iomap_iter
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 09, 2021 at 08:12:36AM +0200, Christoph Hellwig wrote:
> Switch iomap_swapfile_activate to use iomap_iter.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Smooooooth
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/iomap/swapfile.c | 38 ++++++++++++++++----------------------
>  1 file changed, 16 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/iomap/swapfile.c b/fs/iomap/swapfile.c
> index 6250ca6a1f851d..7069606eca85b2 100644
> --- a/fs/iomap/swapfile.c
> +++ b/fs/iomap/swapfile.c
> @@ -88,13 +88,9 @@ static int iomap_swapfile_fail(struct iomap_swapfile_info *isi, const char *str)
>   * swap only cares about contiguous page-aligned physical extents and makes no
>   * distinction between written and unwritten extents.
>   */
> -static loff_t iomap_swapfile_activate_actor(struct inode *inode, loff_t pos,
> -		loff_t count, void *data, struct iomap *iomap,
> -		struct iomap *srcmap)
> +static loff_t iomap_swapfile_iter(const struct iomap_iter *iter,
> +		struct iomap *iomap, struct iomap_swapfile_info *isi)
>  {
> -	struct iomap_swapfile_info *isi = data;
> -	int error;
> -
>  	switch (iomap->type) {
>  	case IOMAP_MAPPED:
>  	case IOMAP_UNWRITTEN:
> @@ -125,12 +121,12 @@ static loff_t iomap_swapfile_activate_actor(struct inode *inode, loff_t pos,
>  		isi->iomap.length += iomap->length;
>  	} else {
>  		/* Otherwise, add the retained iomap and store this one. */
> -		error = iomap_swapfile_add_extent(isi);
> +		int error = iomap_swapfile_add_extent(isi);
>  		if (error)
>  			return error;
>  		memcpy(&isi->iomap, iomap, sizeof(isi->iomap));
>  	}
> -	return count;
> +	return iomap_length(iter);
>  }
>  
>  /*
> @@ -141,16 +137,19 @@ int iomap_swapfile_activate(struct swap_info_struct *sis,
>  		struct file *swap_file, sector_t *pagespan,
>  		const struct iomap_ops *ops)
>  {
> +	struct inode *inode = swap_file->f_mapping->host;
> +	struct iomap_iter iter = {
> +		.inode	= inode,
> +		.pos	= 0,
> +		.len	= ALIGN_DOWN(i_size_read(inode), PAGE_SIZE),
> +		.flags	= IOMAP_REPORT,
> +	};
>  	struct iomap_swapfile_info isi = {
>  		.sis = sis,
>  		.lowest_ppage = (sector_t)-1ULL,
>  		.file = swap_file,
>  	};
> -	struct address_space *mapping = swap_file->f_mapping;
> -	struct inode *inode = mapping->host;
> -	loff_t pos = 0;
> -	loff_t len = ALIGN_DOWN(i_size_read(inode), PAGE_SIZE);
> -	loff_t ret;
> +	int ret;
>  
>  	/*
>  	 * Persist all file mapping metadata so that we won't have any
> @@ -160,15 +159,10 @@ int iomap_swapfile_activate(struct swap_info_struct *sis,
>  	if (ret)
>  		return ret;
>  
> -	while (len > 0) {
> -		ret = iomap_apply(inode, pos, len, IOMAP_REPORT,
> -				ops, &isi, iomap_swapfile_activate_actor);
> -		if (ret <= 0)
> -			return ret;
> -
> -		pos += ret;
> -		len -= ret;
> -	}
> +	while ((ret = iomap_iter(&iter, ops)) > 0)
> +		iter.processed = iomap_swapfile_iter(&iter, &iter.iomap, &isi);
> +	if (ret < 0)
> +		return ret;
>  
>  	if (isi.iomap.length) {
>  		ret = iomap_swapfile_add_extent(&isi);
> -- 
> 2.30.2
> 

