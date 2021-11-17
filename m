Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C679E454BBF
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Nov 2021 18:13:48 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-vbwlHJ9cMYCEUEpp_IUdeQ-1; Wed, 17 Nov 2021 12:13:44 -0500
X-MC-Unique: vbwlHJ9cMYCEUEpp_IUdeQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 630AE87D56B;
	Wed, 17 Nov 2021 17:13:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1782F5F93C;
	Wed, 17 Nov 2021 17:13:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC2054A703;
	Wed, 17 Nov 2021 17:13:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHHCTPq032507 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 12:12:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4AF3D40CFD10; Wed, 17 Nov 2021 17:12:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 456EC40CFD05
	for <cluster-devel@redhat.com>; Wed, 17 Nov 2021 17:12:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2923480A0AF
	for <cluster-devel@redhat.com>; Wed, 17 Nov 2021 17:12:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-476-PWooXxHzPkmGseiFc7CpsQ-1;
	Wed, 17 Nov 2021 12:12:27 -0500
X-MC-Unique: PWooXxHzPkmGseiFc7CpsQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id F06CA61A62;
	Wed, 17 Nov 2021 17:12:25 +0000 (UTC)
Date: Wed, 17 Nov 2021 09:12:25 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20211117171225.GY24307@magnolia>
References: <20211117103202.44346-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211117103202.44346-1-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH] iomap: iomap_read_inline_data cleanup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 17, 2021 at 11:32:02AM +0100, Andreas Gruenbacher wrote:
> Change iomap_read_inline_data to return 0 or an error code; this
> simplifies the callers.  Add a description.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

Looks good, thank you for cleaning this up for me!
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/iomap/buffered-io.c | 30 ++++++++++++++----------------
>  1 file changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index fe10d8a30f6b..f1bc9a35184d 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -205,7 +205,15 @@ struct iomap_readpage_ctx {
>  	struct readahead_control *rac;
>  };
>  
> -static loff_t iomap_read_inline_data(const struct iomap_iter *iter,
> +/**
> + * iomap_read_inline_data - copy inline data into the page cache
> + * @iter: iteration structure
> + * @page: page to copy to
> + *
> + * Copy the inline data in @iter into @page and zero out the rest of the page.
> + * Only a single IOMAP_INLINE extent is allowed at the end of each file.
> + */
> +static int iomap_read_inline_data(const struct iomap_iter *iter,
>  		struct page *page)
>  {
>  	const struct iomap *iomap = iomap_iter_srcmap(iter);
> @@ -214,7 +222,7 @@ static loff_t iomap_read_inline_data(const struct iomap_iter *iter,
>  	void *addr;
>  
>  	if (PageUptodate(page))
> -		return PAGE_SIZE - poff;
> +		return 0;
>  
>  	if (WARN_ON_ONCE(size > PAGE_SIZE - poff))
>  		return -EIO;
> @@ -231,7 +239,7 @@ static loff_t iomap_read_inline_data(const struct iomap_iter *iter,
>  	memset(addr + size, 0, PAGE_SIZE - poff - size);
>  	kunmap_local(addr);
>  	iomap_set_range_uptodate(page, poff, PAGE_SIZE - poff);
> -	return PAGE_SIZE - poff;
> +	return 0;
>  }
>  
>  static inline bool iomap_block_needs_zeroing(const struct iomap_iter *iter,
> @@ -256,13 +264,8 @@ static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
>  	unsigned poff, plen;
>  	sector_t sector;
>  
> -	if (iomap->type == IOMAP_INLINE) {
> -		loff_t ret = iomap_read_inline_data(iter, page);
> -
> -		if (ret < 0)
> -			return ret;
> -		return 0;
> -	}
> +	if (iomap->type == IOMAP_INLINE)
> +		return iomap_read_inline_data(iter, page);
>  
>  	/* zero post-eof blocks as the page may be mapped */
>  	iop = iomap_page_create(iter->inode, page);
> @@ -587,15 +590,10 @@ static int __iomap_write_begin(const struct iomap_iter *iter, loff_t pos,
>  static int iomap_write_begin_inline(const struct iomap_iter *iter,
>  		struct page *page)
>  {
> -	int ret;
> -
>  	/* needs more work for the tailpacking case; disable for now */
>  	if (WARN_ON_ONCE(iomap_iter_srcmap(iter)->offset != 0))
>  		return -EIO;
> -	ret = iomap_read_inline_data(iter, page);
> -	if (ret < 0)
> -		return ret;
> -	return 0;
> +	return iomap_read_inline_data(iter, page);
>  }
>  
>  static int iomap_write_begin(const struct iomap_iter *iter, loff_t pos,
> -- 
> 2.31.1
> 

