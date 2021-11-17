Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCF645403D
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Nov 2021 06:34:01 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-usBK4_yTOF-VHMcQNDOiiA-1; Wed, 17 Nov 2021 00:33:56 -0500
X-MC-Unique: usBK4_yTOF-VHMcQNDOiiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D598515720;
	Wed, 17 Nov 2021 05:33:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17DF05C1BB;
	Wed, 17 Nov 2021 05:33:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A08E84A703;
	Wed, 17 Nov 2021 05:33:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AH5XduB014931 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 00:33:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 34DED2026D46; Wed, 17 Nov 2021 05:33:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F92C2026D48
	for <cluster-devel@redhat.com>; Wed, 17 Nov 2021 05:33:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EB298007B1
	for <cluster-devel@redhat.com>; Wed, 17 Nov 2021 05:33:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-410-Fy4fh-aeOVmPhr29HuFXyQ-1;
	Wed, 17 Nov 2021 00:33:32 -0500
X-MC-Unique: Fy4fh-aeOVmPhr29HuFXyQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56D4061BD4;
	Wed, 17 Nov 2021 05:33:31 +0000 (UTC)
Date: Tue, 16 Nov 2021 21:33:30 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20211117053330.GU24307@magnolia>
References: <20211111161714.584718-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211111161714.584718-1-agruenba@redhat.com>
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
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, Christoph Hellwig <hch@lst.de>,
	stable@vger.kernel.org
Subject: Re: [Cluster-devel] [5.15 REGRESSION v2] iomap: Fix inline extent
 handling in iomap_readpage
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

On Thu, Nov 11, 2021 at 05:17:14PM +0100, Andreas Gruenbacher wrote:
> Before commit 740499c78408 ("iomap: fix the iomap_readpage_actor return
> value for inline data"), when hitting an IOMAP_INLINE extent,
> iomap_readpage_actor would report having read the entire page.  Since
> then, it only reports having read the inline data (iomap->length).
> 
> This will force iomap_readpage into another iteration, and the
> filesystem will report an unaligned hole after the IOMAP_INLINE extent.
> But iomap_readpage_actor (now iomap_readpage_iter) isn't prepared to
> deal with unaligned extents, it will get things wrong on filesystems
> with a block size smaller than the page size, and we'll eventually run
> into the following warning in iomap_iter_advance:
> 
>   WARN_ON_ONCE(iter->processed > iomap_length(iter));
> 
> Fix that by changing iomap_readpage_iter to return 0 when hitting an
> inline extent; this will cause iomap_iter to stop immediately.

I guess this means that we also only support having inline data that
ends at EOF?  IIRC this is true for the three(?) filesystems that have
expressed any interest in inline data: yours, ext4, and erofs?

> To fix readahead as well, change iomap_readahead_iter to pass on
> iomap_readpage_iter return values less than or equal to zero.
> 
> Fixes: 740499c78408 ("iomap: fix the iomap_readpage_actor return value for inline data")
> Cc: stable@vger.kernel.org # v5.15+
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/iomap/buffered-io.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 1753c26c8e76..fe10d8a30f6b 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -256,8 +256,13 @@ static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
>  	unsigned poff, plen;
>  	sector_t sector;
>  
> -	if (iomap->type == IOMAP_INLINE)
> -		return min(iomap_read_inline_data(iter, page), length);
> +	if (iomap->type == IOMAP_INLINE) {
> +		loff_t ret = iomap_read_inline_data(iter, page);

Ew, iomap_read_inline_data returns loff_t.  I think I'll slip in a
change of return type to ssize_t, if you don't mind?

> +
> +		if (ret < 0)
> +			return ret;

...and a comment here explaining that we only support inline data that
ends at EOF?

If the answers to all /four/ questions are 'yes', then consider this:
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> +		return 0;
> +	}
>  
>  	/* zero post-eof blocks as the page may be mapped */
>  	iop = iomap_page_create(iter->inode, page);
> @@ -370,6 +375,8 @@ static loff_t iomap_readahead_iter(const struct iomap_iter *iter,
>  			ctx->cur_page_in_bio = false;
>  		}
>  		ret = iomap_readpage_iter(iter, ctx, done);
> +		if (ret <= 0)
> +			return ret;
>  	}
>  
>  	return done;
> -- 
> 2.31.1
> 

