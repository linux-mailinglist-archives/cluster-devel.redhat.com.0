Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id ABD9C163961
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 02:32:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582075965;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a8ZomntyDZQd4T0ETmKn7kyy8sPKQZmX4XFar/4v0t8=;
	b=dxBKZjwb+zZHskwNvP6amIuaCLdJJFFOTT99EWoPL1IPs9ueufd06ZjFuUTpb4nLFMS1mQ
	d5Cjrw4zf0dy/XFkg7qo42Rd1BLLbG0vIeQeWFPl5nA0Oq85nUKmoDXY6g2EYiJQUHB8vO
	H5DltvFinPUae/OQx1LkHkqIdQ/PCsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-yD1P0u9BOGKX1plens_oqw-1; Tue, 18 Feb 2020 20:32:43 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63407800D55;
	Wed, 19 Feb 2020 01:32:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 063FE60C80;
	Wed, 19 Feb 2020 01:32:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5185A35AE2;
	Wed, 19 Feb 2020 01:32:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J1Wcp3000551 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 20:32:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8724B2166B28; Wed, 19 Feb 2020 01:32:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82EB92166B27
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 01:32:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16F851017E56
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 01:32:36 +0000 (UTC)
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
	[216.228.121.64]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-272-epx-gfppMfGLsmko3KHVNg-1; Tue, 18 Feb 2020 20:32:32 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e4c900f0000>; Tue, 18 Feb 2020 17:31:59 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate102.nvidia.com (PGP Universal service);
	Tue, 18 Feb 2020 17:32:31 -0800
X-PGP-Universal: processed;
	by hqpgpgate102.nvidia.com on Tue, 18 Feb 2020 17:32:31 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 19 Feb 2020 01:32:31 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-16-willy@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <1263603d-f446-c447-2eac-697d105fa76c@nvidia.com>
Date: Tue, 18 Feb 2020 17:32:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-16-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-MC-Unique: epx-gfppMfGLsmko3KHVNg-1
X-MC-Unique: yD1P0u9BOGKX1plens_oqw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 09/19] mm: Add
	page_cache_readahead_limit
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/17/20 10:45 AM, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> ext4 and f2fs have duplicated the guts of the readahead code so
> they can read past i_size.  Instead, separate out the guts of the
> readahead code so they can call it directly.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/ext4/verity.c        | 35 ++---------------------
>  fs/f2fs/verity.c        | 35 ++---------------------
>  include/linux/pagemap.h |  4 +++
>  mm/readahead.c          | 61 +++++++++++++++++++++++++++++------------
>  4 files changed, 52 insertions(+), 83 deletions(-)


Just some minor ideas below, mostly documentation, so:

    Reviewed-by: John Hubbard <jhubbard@nvidia.com>

> 
> diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
> index dc5ec724d889..f6e0bf05933e 100644
> --- a/fs/ext4/verity.c
> +++ b/fs/ext4/verity.c
> @@ -342,37 +342,6 @@ static int ext4_get_verity_descriptor(struct inode *inode, void *buf,
>  	return desc_size;
>  }
>  
> -/*
> - * Prefetch some pages from the file's Merkle tree.
> - *
> - * This is basically a stripped-down version of __do_page_cache_readahead()
> - * which works on pages past i_size.
> - */
> -static void ext4_merkle_tree_readahead(struct address_space *mapping,
> -				       pgoff_t start_index, unsigned long count)
> -{
> -	LIST_HEAD(pages);
> -	unsigned int nr_pages = 0;
> -	struct page *page;
> -	pgoff_t index;
> -	struct blk_plug plug;
> -
> -	for (index = start_index; index < start_index + count; index++) {
> -		page = xa_load(&mapping->i_pages, index);
> -		if (!page || xa_is_value(page)) {
> -			page = __page_cache_alloc(readahead_gfp_mask(mapping));
> -			if (!page)
> -				break;
> -			page->index = index;
> -			list_add(&page->lru, &pages);
> -			nr_pages++;
> -		}
> -	}
> -	blk_start_plug(&plug);
> -	ext4_mpage_readpages(mapping, &pages, NULL, nr_pages, true);
> -	blk_finish_plug(&plug);
> -}
> -
>  static struct page *ext4_read_merkle_tree_page(struct inode *inode,
>  					       pgoff_t index,
>  					       unsigned long num_ra_pages)
> @@ -386,8 +355,8 @@ static struct page *ext4_read_merkle_tree_page(struct inode *inode,
>  		if (page)
>  			put_page(page);
>  		else if (num_ra_pages > 1)
> -			ext4_merkle_tree_readahead(inode->i_mapping, index,
> -						   num_ra_pages);
> +			page_cache_readahead_limit(inode->i_mapping, NULL,
> +					index, LONG_MAX, num_ra_pages, 0);


LONG_MAX seems bold at first, but then again I can't think of anything smaller 
that makes any sense, and the previous code didn't have a limit either...OK.

I also wondered about the NULL file parameter, and wonder if we're stripping out
information that is needed for authentication, given that that's what the newly
written kerneldoc says the "file" arg is for. But it seems that if we're this 
deep in the fs code's read routines, file system authentication has long since 
been addressed.

Any actually I don't yet (still working through the patches) see any authentication,
so maybe that parameter will turn out to be unnecessary.

Anyway, It's nice to see this factored out into a single routine.


>  		page = read_mapping_page(inode->i_mapping, index, NULL);
>  	}
>  	return page;
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index d7d430a6f130..71a3e36721fa 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -222,37 +222,6 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
>  	return size;
>  }
>  
> -/*
> - * Prefetch some pages from the file's Merkle tree.
> - *
> - * This is basically a stripped-down version of __do_page_cache_readahead()
> - * which works on pages past i_size.
> - */
> -static void f2fs_merkle_tree_readahead(struct address_space *mapping,
> -				       pgoff_t start_index, unsigned long count)
> -{
> -	LIST_HEAD(pages);
> -	unsigned int nr_pages = 0;
> -	struct page *page;
> -	pgoff_t index;
> -	struct blk_plug plug;
> -
> -	for (index = start_index; index < start_index + count; index++) {
> -		page = xa_load(&mapping->i_pages, index);
> -		if (!page || xa_is_value(page)) {
> -			page = __page_cache_alloc(readahead_gfp_mask(mapping));
> -			if (!page)
> -				break;
> -			page->index = index;
> -			list_add(&page->lru, &pages);
> -			nr_pages++;
> -		}
> -	}
> -	blk_start_plug(&plug);
> -	f2fs_mpage_readpages(mapping, &pages, NULL, nr_pages, true);
> -	blk_finish_plug(&plug);
> -}
> -
>  static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
>  					       pgoff_t index,
>  					       unsigned long num_ra_pages)
> @@ -266,8 +235,8 @@ static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
>  		if (page)
>  			put_page(page);
>  		else if (num_ra_pages > 1)
> -			f2fs_merkle_tree_readahead(inode->i_mapping, index,
> -						   num_ra_pages);
> +			page_cache_readahead_limit(inode->i_mapping, NULL,
> +					index, LONG_MAX, num_ra_pages, 0);
>  		page = read_mapping_page(inode->i_mapping, index, NULL);
>  	}
>  	return page;
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index bd4291f78f41..4f36c06d064d 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -389,6 +389,10 @@ extern struct page * read_cache_page_gfp(struct address_space *mapping,
>  				pgoff_t index, gfp_t gfp_mask);
>  extern int read_cache_pages(struct address_space *mapping,
>  		struct list_head *pages, filler_t *filler, void *data);
> +void page_cache_readahead_limit(struct address_space *mapping,
> +		struct file *file, pgoff_t offset, pgoff_t end_index,
> +		unsigned long nr_to_read, unsigned long lookahead_size);
> +
>  
>  static inline struct page *read_mapping_page(struct address_space *mapping,
>  				pgoff_t index, void *data)
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 975ff5e387be..94d499cfb657 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -142,35 +142,38 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages)
>  	blk_finish_plug(&plug);
>  }
>  
> -/*
> - * __do_page_cache_readahead() actually reads a chunk of disk.  It allocates
> - * the pages first, then submits them for I/O. This avoids the very bad
> - * behaviour which would occur if page allocations are causing VM writeback.
> - * We really don't want to intermingle reads and writes like that.
> +/**
> + * page_cache_readahead_limit - Start readahead beyond a file's i_size.


Maybe: 

    "Start readahead to a caller-specified end point" ?

(It's only *potentially* beyond files's i_size.)


> + * @mapping: File address space.
> + * @file: This instance of the open file; used for authentication.
> + * @offset: First page index to read.
> + * @end_index: The maximum page index to read.
> + * @nr_to_read: The number of pages to read.


How about:

    "The number of pages to read, as long as end_index is not exceeded."


> + * @lookahead_size: Where to start the next readahead.


Pre-existing, but...it's hard to understand how a size is "where to start".
Should we rename this arg?

> + *
> + * This function is for filesystems to call when they want to start
> + * readahead potentially beyond a file's stated i_size.  If you want
> + * to start readahead on a normal file, you probably want to call
> + * page_cache_async_readahead() or page_cache_sync_readahead() instead.
> + *
> + * Context: File is referenced by caller.  Mutexes may be held by caller.
> + * May sleep, but will not reenter filesystem to reclaim memory.


In fact, can we say "must not reenter filesystem"? 


>   */
> -void __do_page_cache_readahead(struct address_space *mapping,
> -		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
> -		unsigned long lookahead_size)
> +void page_cache_readahead_limit(struct address_space *mapping,
> +		struct file *file, pgoff_t offset, pgoff_t end_index,
> +		unsigned long nr_to_read, unsigned long lookahead_size)
>  {
> -	struct inode *inode = mapping->host;
> -	unsigned long end_index;	/* The last page we want to read */
>  	LIST_HEAD(page_pool);
>  	unsigned long i;
> -	loff_t isize = i_size_read(inode);
>  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
>  	bool use_list = mapping->a_ops->readpages;
>  	struct readahead_control rac = {
>  		.mapping = mapping,
> -		.file = filp,
> +		.file = file,
>  		._start = offset,
>  		._nr_pages = 0,
>  	};
>  
> -	if (isize == 0)
> -		return;
> -
> -	end_index = ((isize - 1) >> PAGE_SHIFT);
> -
>  	/*
>  	 * Preallocate as many pages as we will need.
>  	 */
> @@ -225,6 +228,30 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  		read_pages(&rac, &page_pool);
>  	BUG_ON(!list_empty(&page_pool));
>  }
> +EXPORT_SYMBOL_GPL(page_cache_readahead_limit);
> +
> +/*
> + * __do_page_cache_readahead() actually reads a chunk of disk.  It allocates
> + * the pages first, then submits them for I/O. This avoids the very bad
> + * behaviour which would occur if page allocations are causing VM writeback.
> + * We really don't want to intermingle reads and writes like that.
> + */
> +void __do_page_cache_readahead(struct address_space *mapping,
> +		struct file *file, pgoff_t offset, unsigned long nr_to_read,
> +		unsigned long lookahead_size)
> +{
> +	struct inode *inode = mapping->host;
> +	unsigned long end_index;	/* The last page we want to read */
> +	loff_t isize = i_size_read(inode);
> +
> +	if (isize == 0)
> +		return;
> +
> +	end_index = ((isize - 1) >> PAGE_SHIFT);
> +
> +	page_cache_readahead_limit(mapping, file, offset, end_index,
> +			nr_to_read, lookahead_size);
> +}
>  
>  /*
>   * Chunk the readahead into 2 megabyte units, so that we don't pin too much
> 


thanks,
-- 
John Hubbard
NVIDIA

