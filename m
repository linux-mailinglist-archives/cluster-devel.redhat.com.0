Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B90F33E8695
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Aug 2021 01:33:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-f_x5d24dPPmUHM7SaihkaA-1; Tue, 10 Aug 2021 19:33:40 -0400
X-MC-Unique: f_x5d24dPPmUHM7SaihkaA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 029111084F7B;
	Tue, 10 Aug 2021 23:33:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A78C95D6CF;
	Tue, 10 Aug 2021 23:33:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2259D181A0F1;
	Tue, 10 Aug 2021 23:33:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17ANVpo1032215 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 19:31:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 08EBE10150F1; Tue, 10 Aug 2021 23:31:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 049DB1009059
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 23:31:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81B56858EEC
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 23:31:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-193-KZNEEiQEMOKihOPnoOy0Kg-1;
	Tue, 10 Aug 2021 19:31:37 -0400
X-MC-Unique: KZNEEiQEMOKihOPnoOy0Kg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1977C60FDA;
	Tue, 10 Aug 2021 23:31:36 +0000 (UTC)
Date: Tue, 10 Aug 2021 16:31:35 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210810233135.GJ3601443@magnolia>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-11-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210809061244.1196573-11-hch@lst.de>
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
Subject: Re: [Cluster-devel] [PATCH 10/30] iomap: fix the
 iomap_readpage_actor return value for inline data
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

On Mon, Aug 09, 2021 at 08:12:24AM +0200, Christoph Hellwig wrote:
> The actor should never return a larger value than the length that was
> passed in.  The current code handles this gracefully, but the opcoming
> iter model will be more picky.

s/opcoming/upcoming/

With that fixed,
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/iomap/buffered-io.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 44587209e6d7c7..26e16cc9d44931 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -205,7 +205,7 @@ struct iomap_readpage_ctx {
>  	struct readahead_control *rac;
>  };
>  
> -static int iomap_read_inline_data(struct inode *inode, struct page *page,
> +static loff_t iomap_read_inline_data(struct inode *inode, struct page *page,
>  		const struct iomap *iomap)
>  {
>  	size_t size = i_size_read(inode) - iomap->offset;
> @@ -253,7 +253,7 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
>  	sector_t sector;
>  
>  	if (iomap->type == IOMAP_INLINE)
> -		return iomap_read_inline_data(inode, page, iomap);
> +		return min(iomap_read_inline_data(inode, page, iomap), length);
>  
>  	/* zero post-eof blocks as the page may be mapped */
>  	iop = iomap_page_create(inode, page);
> -- 
> 2.30.2
> 

