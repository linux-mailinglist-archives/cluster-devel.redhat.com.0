Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDB815D6A1
	for <lists+cluster-devel@lfdr.de>; Fri, 14 Feb 2020 12:37:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581680273;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jodX0tIvBxH/fc59T73o9SPk6S3e+yDpKWnaNwpeJKk=;
	b=ZXY9yZNBnSwll1SHO1w01UIjqvFPYUyK2T5n06t3jemMU0Rql0abO8Ooz3R78QyyyEKx0u
	aNKSCwG5U5imjTxRTXLYVsKj7PIvntB2nQ1bh6fv7JQfVccPw09Z850bjDrUwZBI3AV0A8
	GA0+Cwzj4noIcBE1Dp5bjem170mYQyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-1a5_cMAIOLeNDqBwDMv64g-1; Fri, 14 Feb 2020 06:37:51 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2160E8014DC;
	Fri, 14 Feb 2020 11:37:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C77F5C13D;
	Fri, 14 Feb 2020 11:37:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 116D18B2B3;
	Fri, 14 Feb 2020 11:37:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01E3ajBK022552 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 22:36:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D5A58100724D; Fri, 14 Feb 2020 03:36:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0BD91007276
	for <cluster-devel@redhat.com>; Fri, 14 Feb 2020 03:36:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A92FA80103E
	for <cluster-devel@redhat.com>; Fri, 14 Feb 2020 03:36:43 +0000 (UTC)
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
	[216.228.121.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-185-5uP3VpcWN-Gt9icWA-7T5g-1; Thu, 13 Feb 2020 22:36:41 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e4615b90000>; Thu, 13 Feb 2020 19:36:25 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Thu, 13 Feb 2020 19:36:39 -0800
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Thu, 13 Feb 2020 19:36:39 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 14 Feb 2020 03:36:39 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200211010348.6872-1-willy@infradead.org>
	<20200211010348.6872-4-willy@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <b0cdd7b4-e103-a884-d8f7-2378905f7b3b@nvidia.com>
Date: Thu, 13 Feb 2020 19:36:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200211010348.6872-4-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-MC-Unique: 5uP3VpcWN-Gt9icWA-7T5g-1
X-MC-Unique: 1a5_cMAIOLeNDqBwDMv64g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 14 Feb 2020 06:37:40 -0500
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v5 03/13] mm: Put readahead pages in
	cache earlier
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/10/20 5:03 PM, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> At allocation time, put the pages in the cache unless we're using
> ->readpages.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  mm/readahead.c | 66 ++++++++++++++++++++++++++++++++------------------
>  1 file changed, 42 insertions(+), 24 deletions(-)
> 
> diff --git a/mm/readahead.c b/mm/readahead.c
> index fc77d13af556..96c6ca68a174 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -114,10 +114,10 @@ int read_cache_pages(struct address_space *mapping, struct list_head *pages,
>  EXPORT_SYMBOL(read_cache_pages);
>  
>  static void read_pages(struct address_space *mapping, struct file *filp,
> -		struct list_head *pages, unsigned int nr_pages, gfp_t gfp)
> +		struct list_head *pages, pgoff_t start,
> +		unsigned int nr_pages)
>  {
>  	struct blk_plug plug;
> -	unsigned page_idx;
>  
>  	blk_start_plug(&plug);
>  
> @@ -125,18 +125,17 @@ static void read_pages(struct address_space *mapping, struct file *filp,
>  		mapping->a_ops->readpages(filp, mapping, pages, nr_pages);
>  		/* Clean up the remaining pages */
>  		put_pages_list(pages);
> -		goto out;
> -	}
> +	} else {
> +		struct page *page;
> +		unsigned long index;
>  
> -	for (page_idx = 0; page_idx < nr_pages; page_idx++) {
> -		struct page *page = lru_to_page(pages);
> -		list_del(&page->lru);
> -		if (!add_to_page_cache_lru(page, mapping, page->index, gfp))
> +		xa_for_each_range(&mapping->i_pages, index, page, start,
> +				start + nr_pages - 1) {
>  			mapping->a_ops->readpage(filp, page);
> -		put_page(page);
> +			put_page(page);
> +		}
>  	}
>  
> -out:
>  	blk_finish_plug(&plug);
>  }
>  
> @@ -149,17 +148,18 @@ static void read_pages(struct address_space *mapping, struct file *filp,
>   * Returns the number of pages requested, or the maximum amount of I/O allowed.
>   */
>  unsigned long __do_page_cache_readahead(struct address_space *mapping,
> -		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
> +		struct file *filp, pgoff_t start, unsigned long nr_to_read,
>  		unsigned long lookahead_size)
>  {
>  	struct inode *inode = mapping->host;
> -	struct page *page;
>  	unsigned long end_index;	/* The last page we want to read */
>  	LIST_HEAD(page_pool);
>  	int page_idx;
> +	pgoff_t page_offset = start;
>  	unsigned long nr_pages = 0;
>  	loff_t isize = i_size_read(inode);
>  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
> +	bool use_list = mapping->a_ops->readpages;
>  
>  	if (isize == 0)
>  		goto out;
> @@ -170,7 +170,7 @@ unsigned long __do_page_cache_readahead(struct address_space *mapping,
>  	 * Preallocate as many pages as we will need.
>  	 */
>  	for (page_idx = 0; page_idx < nr_to_read; page_idx++) {
> -		pgoff_t page_offset = offset + page_idx;
> +		struct page *page;

I see two distinct things happening in this patch, and I think they want to each be
in their own patch:

1) A significant refactoring of the page loop, and

2) Changing the place where the page is added to the page cache. (Only this one is 
   mentioned in the commit description.)

We'll be more likely to spot any errors if these are teased apart.


thanks,
-- 
John Hubbard
NVIDIA

>  
>  		if (page_offset > end_index)
>  			break;
> @@ -178,25 +178,43 @@ unsigned long __do_page_cache_readahead(struct address_space *mapping,
>  		page = xa_load(&mapping->i_pages, page_offset);
>  		if (page && !xa_is_value(page)) {
>  			/*
> -			 * Page already present?  Kick off the current batch of
> -			 * contiguous pages before continuing with the next
> -			 * batch.
> +			 * Page already present?  Kick off the current batch
> +			 * of contiguous pages before continuing with the
> +			 * next batch.
> +			 * It's possible this page is the page we should
> +			 * be marking with PageReadahead.  However, we
> +			 * don't have a stable ref to this page so it might
> +			 * be reallocated to another user before we can set
> +			 * the bit.  There's probably another page in the
> +			 * cache marked with PageReadahead from the other
> +			 * process which accessed this file.
>  			 */
> -			if (nr_pages)
> -				read_pages(mapping, filp, &page_pool, nr_pages,
> -						gfp_mask);
> -			nr_pages = 0;
> -			continue;
> +			goto skip;
>  		}
>  
>  		page = __page_cache_alloc(gfp_mask);
>  		if (!page)
>  			break;
> -		page->index = page_offset;
> -		list_add(&page->lru, &page_pool);
> +		if (use_list) {
> +			page->index = page_offset;
> +			list_add(&page->lru, &page_pool);
> +		} else if (add_to_page_cache_lru(page, mapping, page_offset,
> +					gfp_mask) < 0) {
> +			put_page(page);
> +			goto skip;
> +		}
> +
>  		if (page_idx == nr_to_read - lookahead_size)
>  			SetPageReadahead(page);
>  		nr_pages++;
> +		page_offset++;
> +		continue;
> +skip:
> +		if (nr_pages)
> +			read_pages(mapping, filp, &page_pool, start, nr_pages);
> +		nr_pages = 0;
> +		page_offset++;
> +		start = page_offset;
>  	}
>  
>  	/*
> @@ -205,7 +223,7 @@ unsigned long __do_page_cache_readahead(struct address_space *mapping,
>  	 * will then handle the error.
>  	 */
>  	if (nr_pages)
> -		read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
> +		read_pages(mapping, filp, &page_pool, start, nr_pages);
>  	BUG_ON(!list_empty(&page_pool));
>  out:
>  	return nr_pages;
> 

