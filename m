Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 51017166CD2
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Feb 2020 03:21:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582251680;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1fFzHXOgqDzJ1VBkHnOJtWMQIQmJCZGe4/j7h8tGuhk=;
	b=cMXj3lYzI2o83AEy6duSgfAcG4IPYpMj0tnwSRsi/+DrU8BGJIlSaM9MUPL5TfazIFEvkY
	e3FKVPt09K/HG0FeOvtuYKxeUCf6kYpF0w46tf1oSPlLVAeHGVkFBPMSI7VXK4hHG6OFF6
	XXZ1D68oxpk1ksWERfn3DFUQnGOv4Uc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-qD1NcnYYNZ2U4WJKRUmVdw-1; Thu, 20 Feb 2020 21:21:18 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38E55102C8BB;
	Fri, 21 Feb 2020 02:21:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57A68101D498;
	Fri, 21 Feb 2020 02:21:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65B8618089C8;
	Fri, 21 Feb 2020 02:21:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01L2L7oc030915 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 21:21:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F332E2166B2C; Fri, 21 Feb 2020 02:21:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE4B22166B2B
	for <cluster-devel@redhat.com>; Fri, 21 Feb 2020 02:21:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BDFA185A793
	for <cluster-devel@redhat.com>; Fri, 21 Feb 2020 02:21:04 +0000 (UTC)
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
	[216.228.121.64]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-333-ZZqFBGFBMxabReeXIfqLMA-1; Thu, 20 Feb 2020 21:21:02 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e4f3e6c0000>; Thu, 20 Feb 2020 18:20:28 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Thu, 20 Feb 2020 18:21:01 -0800
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Thu, 20 Feb 2020 18:21:01 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 21 Feb 2020 02:21:01 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-7-willy@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <495787f3-b242-7b72-8807-50eff3b5c37d@nvidia.com>
Date: Thu, 20 Feb 2020 18:21:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219210103.32400-7-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-MC-Unique: ZZqFBGFBMxabReeXIfqLMA-1
X-MC-Unique: qD1NcnYYNZ2U4WJKRUmVdw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 06/24] mm: Rename various 'offset'
 parameters to 'index'
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/19/20 1:00 PM, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> The word 'offset' is used ambiguously to mean 'byte offset within
> a page', 'byte offset from the start of the file' and 'page offset
> from the start of the file'.  Use 'index' to mean 'page offset
> from the start of the file' throughout the readahead code.


And: use 'count' to mean 'number of pages'.  Since the patch also changes
req_size to req_count.

I'm casting about for a nice place in the code, to put your above note...and
there isn't one. But would it be terrible to just put a short comment
block at the top of this file, just so we have it somewhere? It's pretty
cool to settle on a consistent terminology, so backing it up with "yes, we
actually mean it" documentation would be even better.

One minor note below, but no bugs spotted, and this clarifies the code a bit, so:

    Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard
NVIDIA


> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  mm/readahead.c | 86 ++++++++++++++++++++++++--------------------------
>  1 file changed, 42 insertions(+), 44 deletions(-)
> 
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 6a9d99229bd6..096cf9020648 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -156,7 +156,7 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages,
>   * We really don't want to intermingle reads and writes like that.
>   */
>  void __do_page_cache_readahead(struct address_space *mapping,
> -		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
> +		struct file *filp, pgoff_t index, unsigned long nr_to_read,
>  		unsigned long lookahead_size)
>  {
>  	struct inode *inode = mapping->host;
> @@ -181,7 +181,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  	 * Preallocate as many pages as we will need.
>  	 */
>  	for (page_idx = 0; page_idx < nr_to_read; page_idx++) {
> -		pgoff_t page_offset = offset + page_idx;
> +		pgoff_t page_offset = index + page_idx;


This line seems to unrepentantly mix offset and index, still. :)


>  
>  		if (page_offset > end_index)
>  			break;
> @@ -220,7 +220,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>   * memory at once.
>   */
>  void force_page_cache_readahead(struct address_space *mapping,
> -		struct file *filp, pgoff_t offset, unsigned long nr_to_read)
> +		struct file *filp, pgoff_t index, unsigned long nr_to_read)
>  {
>  	struct backing_dev_info *bdi = inode_to_bdi(mapping->host);
>  	struct file_ra_state *ra = &filp->f_ra;
> @@ -240,9 +240,9 @@ void force_page_cache_readahead(struct address_space *mapping,
>  
>  		if (this_chunk > nr_to_read)
>  			this_chunk = nr_to_read;
> -		__do_page_cache_readahead(mapping, filp, offset, this_chunk, 0);
> +		__do_page_cache_readahead(mapping, filp, index, this_chunk, 0);
>  
> -		offset += this_chunk;
> +		index += this_chunk;
>  		nr_to_read -= this_chunk;
>  	}
>  }
> @@ -323,21 +323,21 @@ static unsigned long get_next_ra_size(struct file_ra_state *ra,
>   */
>  
>  /*
> - * Count contiguously cached pages from @offset-1 to @offset-@max,
> + * Count contiguously cached pages from @index-1 to @index-@max,
>   * this count is a conservative estimation of
>   * 	- length of the sequential read sequence, or
>   * 	- thrashing threshold in memory tight systems
>   */
>  static pgoff_t count_history_pages(struct address_space *mapping,
> -				   pgoff_t offset, unsigned long max)
> +				   pgoff_t index, unsigned long max)
>  {
>  	pgoff_t head;
>  
>  	rcu_read_lock();
> -	head = page_cache_prev_miss(mapping, offset - 1, max);
> +	head = page_cache_prev_miss(mapping, index - 1, max);
>  	rcu_read_unlock();
>  
> -	return offset - 1 - head;
> +	return index - 1 - head;
>  }
>  
>  /*
> @@ -345,13 +345,13 @@ static pgoff_t count_history_pages(struct address_space *mapping,
>   */
>  static int try_context_readahead(struct address_space *mapping,
>  				 struct file_ra_state *ra,
> -				 pgoff_t offset,
> +				 pgoff_t index,
>  				 unsigned long req_size,
>  				 unsigned long max)
>  {
>  	pgoff_t size;
>  
> -	size = count_history_pages(mapping, offset, max);
> +	size = count_history_pages(mapping, index, max);
>  
>  	/*
>  	 * not enough history pages:
> @@ -364,10 +364,10 @@ static int try_context_readahead(struct address_space *mapping,
>  	 * starts from beginning of file:
>  	 * it is a strong indication of long-run stream (or whole-file-read)
>  	 */
> -	if (size >= offset)
> +	if (size >= index)
>  		size *= 2;
>  
> -	ra->start = offset;
> +	ra->start = index;
>  	ra->size = min(size + req_size, max);
>  	ra->async_size = 1;
>  
> @@ -379,13 +379,13 @@ static int try_context_readahead(struct address_space *mapping,
>   */
>  static void ondemand_readahead(struct address_space *mapping,
>  		struct file_ra_state *ra, struct file *filp,
> -		bool hit_readahead_marker, pgoff_t offset,
> +		bool hit_readahead_marker, pgoff_t index,
>  		unsigned long req_size)
>  {
>  	struct backing_dev_info *bdi = inode_to_bdi(mapping->host);
>  	unsigned long max_pages = ra->ra_pages;
>  	unsigned long add_pages;
> -	pgoff_t prev_offset;
> +	pgoff_t prev_index;
>  
>  	/*
>  	 * If the request exceeds the readahead window, allow the read to
> @@ -397,15 +397,15 @@ static void ondemand_readahead(struct address_space *mapping,
>  	/*
>  	 * start of file
>  	 */
> -	if (!offset)
> +	if (!index)
>  		goto initial_readahead;
>  
>  	/*
> -	 * It's the expected callback offset, assume sequential access.
> +	 * It's the expected callback index, assume sequential access.
>  	 * Ramp up sizes, and push forward the readahead window.
>  	 */
> -	if ((offset == (ra->start + ra->size - ra->async_size) ||
> -	     offset == (ra->start + ra->size))) {
> +	if ((index == (ra->start + ra->size - ra->async_size) ||
> +	     index == (ra->start + ra->size))) {
>  		ra->start += ra->size;
>  		ra->size = get_next_ra_size(ra, max_pages);
>  		ra->async_size = ra->size;
> @@ -422,14 +422,14 @@ static void ondemand_readahead(struct address_space *mapping,
>  		pgoff_t start;
>  
>  		rcu_read_lock();
> -		start = page_cache_next_miss(mapping, offset + 1, max_pages);
> +		start = page_cache_next_miss(mapping, index + 1, max_pages);
>  		rcu_read_unlock();
>  
> -		if (!start || start - offset > max_pages)
> +		if (!start || start - index > max_pages)
>  			return;
>  
>  		ra->start = start;
> -		ra->size = start - offset;	/* old async_size */
> +		ra->size = start - index;	/* old async_size */
>  		ra->size += req_size;
>  		ra->size = get_next_ra_size(ra, max_pages);
>  		ra->async_size = ra->size;
> @@ -444,29 +444,29 @@ static void ondemand_readahead(struct address_space *mapping,
>  
>  	/*
>  	 * sequential cache miss
> -	 * trivial case: (offset - prev_offset) == 1
> -	 * unaligned reads: (offset - prev_offset) == 0
> +	 * trivial case: (index - prev_index) == 1
> +	 * unaligned reads: (index - prev_index) == 0
>  	 */
> -	prev_offset = (unsigned long long)ra->prev_pos >> PAGE_SHIFT;
> -	if (offset - prev_offset <= 1UL)
> +	prev_index = (unsigned long long)ra->prev_pos >> PAGE_SHIFT;
> +	if (index - prev_index <= 1UL)
>  		goto initial_readahead;
>  
>  	/*
>  	 * Query the page cache and look for the traces(cached history pages)
>  	 * that a sequential stream would leave behind.
>  	 */
> -	if (try_context_readahead(mapping, ra, offset, req_size, max_pages))
> +	if (try_context_readahead(mapping, ra, index, req_size, max_pages))
>  		goto readit;
>  
>  	/*
>  	 * standalone, small random read
>  	 * Read as is, and do not pollute the readahead state.
>  	 */
> -	__do_page_cache_readahead(mapping, filp, offset, req_size, 0);
> +	__do_page_cache_readahead(mapping, filp, index, req_size, 0);
>  	return;
>  
>  initial_readahead:
> -	ra->start = offset;
> +	ra->start = index;
>  	ra->size = get_init_ra_size(req_size, max_pages);
>  	ra->async_size = ra->size > req_size ? ra->size - req_size : ra->size;
>  
> @@ -477,7 +477,7 @@ static void ondemand_readahead(struct address_space *mapping,
>  	 * the resulted next readahead window into the current one.
>  	 * Take care of maximum IO pages as above.
>  	 */
> -	if (offset == ra->start && ra->size == ra->async_size) {
> +	if (index == ra->start && ra->size == ra->async_size) {
>  		add_pages = get_next_ra_size(ra, max_pages);
>  		if (ra->size + add_pages <= max_pages) {
>  			ra->async_size = add_pages;
> @@ -496,9 +496,8 @@ static void ondemand_readahead(struct address_space *mapping,
>   * @mapping: address_space which holds the pagecache and I/O vectors
>   * @ra: file_ra_state which holds the readahead state
>   * @filp: passed on to ->readpage() and ->readpages()
> - * @offset: start offset into @mapping, in pagecache page-sized units
> - * @req_size: hint: total size of the read which the caller is performing in
> - *            pagecache pages
> + * @index: Index of first page to be read.
> + * @req_count: Total number of pages being read by the caller.
>   *
>   * page_cache_sync_readahead() should be called when a cache miss happened:
>   * it will submit the read.  The readahead logic may decide to piggyback more
> @@ -507,7 +506,7 @@ static void ondemand_readahead(struct address_space *mapping,
>   */
>  void page_cache_sync_readahead(struct address_space *mapping,
>  			       struct file_ra_state *ra, struct file *filp,
> -			       pgoff_t offset, unsigned long req_size)
> +			       pgoff_t index, unsigned long req_count)
>  {
>  	/* no read-ahead */
>  	if (!ra->ra_pages)
> @@ -518,12 +517,12 @@ void page_cache_sync_readahead(struct address_space *mapping,
>  
>  	/* be dumb */
>  	if (filp && (filp->f_mode & FMODE_RANDOM)) {
> -		force_page_cache_readahead(mapping, filp, offset, req_size);
> +		force_page_cache_readahead(mapping, filp, index, req_count);
>  		return;
>  	}
>  
>  	/* do read-ahead */
> -	ondemand_readahead(mapping, ra, filp, false, offset, req_size);
> +	ondemand_readahead(mapping, ra, filp, false, index, req_count);
>  }
>  EXPORT_SYMBOL_GPL(page_cache_sync_readahead);
>  
> @@ -532,21 +531,20 @@ EXPORT_SYMBOL_GPL(page_cache_sync_readahead);
>   * @mapping: address_space which holds the pagecache and I/O vectors
>   * @ra: file_ra_state which holds the readahead state
>   * @filp: passed on to ->readpage() and ->readpages()
> - * @page: the page at @offset which has the PG_readahead flag set
> - * @offset: start offset into @mapping, in pagecache page-sized units
> - * @req_size: hint: total size of the read which the caller is performing in
> - *            pagecache pages
> + * @page: The page at @index which triggered the readahead call.
> + * @index: Index of first page to be read.
> + * @req_count: Total number of pages being read by the caller.
>   *
>   * page_cache_async_readahead() should be called when a page is used which
> - * has the PG_readahead flag; this is a marker to suggest that the application
> + * is marked as PageReadahead; this is a marker to suggest that the application
>   * has used up enough of the readahead window that we should start pulling in
>   * more pages.
>   */
>  void
>  page_cache_async_readahead(struct address_space *mapping,
>  			   struct file_ra_state *ra, struct file *filp,
> -			   struct page *page, pgoff_t offset,
> -			   unsigned long req_size)
> +			   struct page *page, pgoff_t index,
> +			   unsigned long req_count)
>  {
>  	/* no read-ahead */
>  	if (!ra->ra_pages)
> @@ -570,7 +568,7 @@ page_cache_async_readahead(struct address_space *mapping,
>  		return;
>  
>  	/* do read-ahead */
> -	ondemand_readahead(mapping, ra, filp, true, offset, req_size);
> +	ondemand_readahead(mapping, ra, filp, true, index, req_count);
>  }
>  EXPORT_SYMBOL_GPL(page_cache_async_readahead);
>  
> 

