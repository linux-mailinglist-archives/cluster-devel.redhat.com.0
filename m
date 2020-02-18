Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 724641633D7
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 22:05:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582059948;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3Tzi4YVjiGJU778/orjIDa7TSGwRy5taBn2/82oa+aQ=;
	b=Hkkl8jkVOIgF4Wb71HdQoWEUAcFg+9SOM8jnff9vaGw8kH2/MtRG8psuY4ENJpwsmQ7kgK
	VC9mnEHbSMTUP1gJGJMw67g0ZPc4Gf39J0gKd2YcH7hOMsNxzB34hp/iiXns2TnjYFgeII
	r93xOg7hbWZOYrDGAl+7X2lN8x+Lp0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-qhZqEDeUONaBebcZsL3oiw-1; Tue, 18 Feb 2020 16:05:46 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7E8618FE88C;
	Tue, 18 Feb 2020 21:05:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 008F25C3FA;
	Tue, 18 Feb 2020 21:05:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E44035AF5;
	Tue, 18 Feb 2020 21:05:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IL5ahS018211 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 16:05:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5DB732166B28; Tue, 18 Feb 2020 21:05:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 594CA2166B27
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 21:05:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4F48101D23C
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 21:05:33 +0000 (UTC)
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
	[216.228.121.64]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-380-drC3F3K2MLemJokyykioIQ-1; Tue, 18 Feb 2020 16:05:31 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e4c517a0000>; Tue, 18 Feb 2020 13:04:58 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate102.nvidia.com (PGP Universal service);
	Tue, 18 Feb 2020 13:05:30 -0800
X-PGP-Universal: processed;
	by hqpgpgate102.nvidia.com on Tue, 18 Feb 2020 13:05:30 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 18 Feb 2020 21:05:29 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-2-willy@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <29d2d7ca-7f2b-7eb4-78bc-f2af36c4c426@nvidia.com>
Date: Tue, 18 Feb 2020 13:05:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-2-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-MC-Unique: drC3F3K2MLemJokyykioIQ-1
X-MC-Unique: qhZqEDeUONaBebcZsL3oiw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 01/19] mm: Return void from various
	readahead functions
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/17/20 10:45 AM, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> ondemand_readahead has two callers, neither of which use the return value.
> That means that both ra_submit and __do_page_cache_readahead() can return
> void, and we don't need to worry that a present page in the readahead
> window causes us to return a smaller nr_pages than we ought to have.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  mm/internal.h  |  8 ++++----
>  mm/readahead.c | 24 ++++++++++--------------
>  2 files changed, 14 insertions(+), 18 deletions(-)


This is an easy review and obviously correct, so:

    Reviewed-by: John Hubbard <jhubbard@nvidia.com>


Thoughts for the future of the API:

I will add that I could envision another patchset that went in the
opposite direction, and attempted to preserve the information about
how many pages were successfully read ahead. And that would be nice
to have (at least IMHO), even all the way out to the syscall level,
especially for the readahead syscall.

Of course, vague opinions about how the API might be improved are less
pressing than cleaning up the code now--I'm just bringing this up because
I suspect some people will wonder, "wouldn't it be helpful if I the 
syscall would tell me what happened here? Success (returning 0) doesn't
necessarily mean any pages were even read ahead." It just seems worth 
mentioning.


thanks,
-- 
John Hubbard
NVIDIA

> 
> diff --git a/mm/internal.h b/mm/internal.h
> index 3cf20ab3ca01..f779f058118b 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -49,18 +49,18 @@ void unmap_page_range(struct mmu_gather *tlb,
>  			     unsigned long addr, unsigned long end,
>  			     struct zap_details *details);
>  
> -extern unsigned int __do_page_cache_readahead(struct address_space *mapping,
> +extern void __do_page_cache_readahead(struct address_space *mapping,
>  		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
>  		unsigned long lookahead_size);
>  
>  /*
>   * Submit IO for the read-ahead request in file_ra_state.
>   */
> -static inline unsigned long ra_submit(struct file_ra_state *ra,
> +static inline void ra_submit(struct file_ra_state *ra,
>  		struct address_space *mapping, struct file *filp)
>  {
> -	return __do_page_cache_readahead(mapping, filp,
> -					ra->start, ra->size, ra->async_size);
> +	__do_page_cache_readahead(mapping, filp,
> +			ra->start, ra->size, ra->async_size);
>  }
>  
>  /*
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 2fe72cd29b47..8ce46d69e6ae 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -149,10 +149,8 @@ static int read_pages(struct address_space *mapping, struct file *filp,
>   * the pages first, then submits them for I/O. This avoids the very bad
>   * behaviour which would occur if page allocations are causing VM writeback.
>   * We really don't want to intermingle reads and writes like that.
> - *
> - * Returns the number of pages requested, or the maximum amount of I/O allowed.
>   */
> -unsigned int __do_page_cache_readahead(struct address_space *mapping,
> +void __do_page_cache_readahead(struct address_space *mapping,
>  		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
>  		unsigned long lookahead_size)
>  {
> @@ -166,7 +164,7 @@ unsigned int __do_page_cache_readahead(struct address_space *mapping,
>  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
>  
>  	if (isize == 0)
> -		goto out;
> +		return;
>  
>  	end_index = ((isize - 1) >> PAGE_SHIFT);
>  
> @@ -211,8 +209,6 @@ unsigned int __do_page_cache_readahead(struct address_space *mapping,
>  	if (nr_pages)
>  		read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
>  	BUG_ON(!list_empty(&page_pool));
> -out:
> -	return nr_pages;
>  }
>  
>  /*
> @@ -378,11 +374,10 @@ static int try_context_readahead(struct address_space *mapping,
>  /*
>   * A minimal readahead algorithm for trivial sequential/random reads.
>   */
> -static unsigned long
> -ondemand_readahead(struct address_space *mapping,
> -		   struct file_ra_state *ra, struct file *filp,
> -		   bool hit_readahead_marker, pgoff_t offset,
> -		   unsigned long req_size)
> +static void ondemand_readahead(struct address_space *mapping,
> +		struct file_ra_state *ra, struct file *filp,
> +		bool hit_readahead_marker, pgoff_t offset,
> +		unsigned long req_size)
>  {
>  	struct backing_dev_info *bdi = inode_to_bdi(mapping->host);
>  	unsigned long max_pages = ra->ra_pages;
> @@ -428,7 +423,7 @@ ondemand_readahead(struct address_space *mapping,
>  		rcu_read_unlock();
>  
>  		if (!start || start - offset > max_pages)
> -			return 0;
> +			return;
>  
>  		ra->start = start;
>  		ra->size = start - offset;	/* old async_size */
> @@ -464,7 +459,8 @@ ondemand_readahead(struct address_space *mapping,
>  	 * standalone, small random read
>  	 * Read as is, and do not pollute the readahead state.
>  	 */
> -	return __do_page_cache_readahead(mapping, filp, offset, req_size, 0);
> +	__do_page_cache_readahead(mapping, filp, offset, req_size, 0);
> +	return;
>  
>  initial_readahead:
>  	ra->start = offset;
> @@ -489,7 +485,7 @@ ondemand_readahead(struct address_space *mapping,
>  		}
>  	}
>  
> -	return ra_submit(ra, mapping, filp);
> +	ra_submit(ra, mapping, filp);
>  }
>  
>  /**
> 

