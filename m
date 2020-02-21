Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9BE166D14
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Feb 2020 03:43:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582253031;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FupvP/7fBUSXeaHkpIPB/6auVkQxSnSk5TKtwtzmqZs=;
	b=OWAWM39yqoNPHvhNvGEmbh93mF5SFJ8BCRE+gxKr8LX6K+AFHFeY0w2F/v5D3Bw7bVPdqQ
	473vPUcn8izzo8a/7i0Jsa5FyIKRJyGRyGSlr1R4ApUEJuM4GymPWs+9XpXaFE7jmQj8VW
	dzQY2PZKupYExue380UFIJxLvEld9uc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-GZSOxSbDNUCa5oZWwNwZdg-1; Thu, 20 Feb 2020 21:43:49 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5FC58017CC;
	Fri, 21 Feb 2020 02:43:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21D1038A;
	Fri, 21 Feb 2020 02:43:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2523918089C8;
	Fri, 21 Feb 2020 02:43:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01L2hg8C032214 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 21:43:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 81E371635A1; Fri, 21 Feb 2020 02:43:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DA9B13BF57
	for <cluster-devel@redhat.com>; Fri, 21 Feb 2020 02:43:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99CE38007B3
	for <cluster-devel@redhat.com>; Fri, 21 Feb 2020 02:43:39 +0000 (UTC)
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
	[216.228.121.64]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-248-d5zZgUGBMO63g7pC3zB3PQ-1; Thu, 20 Feb 2020 21:43:33 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e4f43b30000>; Thu, 20 Feb 2020 18:42:59 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Thu, 20 Feb 2020 18:43:32 -0800
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Thu, 20 Feb 2020 18:43:32 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 21 Feb 2020 02:43:32 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-2-willy@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <e065679e-222f-7323-9782-0c4471bb9233@nvidia.com>
Date: Thu, 20 Feb 2020 18:43:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219210103.32400-2-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-MC-Unique: d5zZgUGBMO63g7pC3zB3PQ-1
X-MC-Unique: GZSOxSbDNUCa5oZWwNwZdg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 01/24] mm: Move readahead prototypes
	from mm.h
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/19/20 1:00 PM, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> The readahead code is part of the page cache so should be found in the
> pagemap.h file.  force_page_cache_readahead is only used within mm,
> so move it to mm/internal.h instead.  Remove the parameter names where
> they add no value, and rename the ones which were actively misleading.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  block/blk-core.c        |  1 +
>  include/linux/mm.h      | 19 -------------------
>  include/linux/pagemap.h |  8 ++++++++
>  mm/fadvise.c            |  2 ++
>  mm/internal.h           |  2 ++
>  5 files changed, 13 insertions(+), 19 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 089e890ab208..41417bb93634 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -20,6 +20,7 @@
>  #include <linux/blk-mq.h>
>  #include <linux/highmem.h>
>  #include <linux/mm.h>
> +#include <linux/pagemap.h>

Yes. But I think these files also need a similar change:

    fs/btrfs/disk-io.c
    fs/nfs/super.c
    

...because they also use VM_READAHEAD_PAGES, and do not directly include
pagemap.h yet.


>  #include <linux/kernel_stat.h>
>  #include <linux/string.h>
>  #include <linux/init.h>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 52269e56c514..68dcda9a2112 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2401,25 +2401,6 @@ extern vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf);
>  int __must_check write_one_page(struct page *page);
>  void task_dirty_inc(struct task_struct *tsk);
>  
> -/* readahead.c */
> -#define VM_READAHEAD_PAGES	(SZ_128K / PAGE_SIZE)
> -
> -int force_page_cache_readahead(struct address_space *mapping, struct file *filp,
> -			pgoff_t offset, unsigned long nr_to_read);
> -
> -void page_cache_sync_readahead(struct address_space *mapping,
> -			       struct file_ra_state *ra,
> -			       struct file *filp,
> -			       pgoff_t offset,
> -			       unsigned long size);
> -
> -void page_cache_async_readahead(struct address_space *mapping,
> -				struct file_ra_state *ra,
> -				struct file *filp,
> -				struct page *pg,
> -				pgoff_t offset,
> -				unsigned long size);
> -
>  extern unsigned long stack_guard_gap;
>  /* Generic expand stack which grows the stack according to GROWS{UP,DOWN} */
>  extern int expand_stack(struct vm_area_struct *vma, unsigned long address);
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index ccb14b6a16b5..24894b9b90c9 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -614,6 +614,14 @@ int replace_page_cache_page(struct page *old, struct page *new, gfp_t gfp_mask);
>  void delete_from_page_cache_batch(struct address_space *mapping,
>  				  struct pagevec *pvec);
>  
> +#define VM_READAHEAD_PAGES	(SZ_128K / PAGE_SIZE)
> +
> +void page_cache_sync_readahead(struct address_space *, struct file_ra_state *,
> +		struct file *, pgoff_t index, unsigned long req_count);


Yes, "struct address_space *mapping" is weird, but I don't know if it's
"misleading", given that it's actually one of the things you have to learn
right from the beginning, with linux-mm, right? Or is that about to change?

I'm not asking to restore this to "struct address_space *mapping", but I thought
it's worth mentioning out loud, especially if you or others are planning on
changing those names or something. Just curious.



thanks,
-- 
John Hubbard
NVIDIA


> +void page_cache_async_readahead(struct address_space *, struct file_ra_state *,
> +		struct file *, struct page *, pgoff_t index,
> +		unsigned long req_count);
> +
>  /*
>   * Like add_to_page_cache_locked, but used to add newly allocated pages:
>   * the page is new, so we can just run __SetPageLocked() against it.
> diff --git a/mm/fadvise.c b/mm/fadvise.c
> index 4f17c83db575..3efebfb9952c 100644
> --- a/mm/fadvise.c
> +++ b/mm/fadvise.c
> @@ -22,6 +22,8 @@
>  
>  #include <asm/unistd.h>
>  
> +#include "internal.h"
> +
>  /*
>   * POSIX_FADV_WILLNEED could set PG_Referenced, and POSIX_FADV_NOREUSE could
>   * deactivate the pages and clear PG_Referenced.
> diff --git a/mm/internal.h b/mm/internal.h
> index 3cf20ab3ca01..83f353e74654 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -49,6 +49,8 @@ void unmap_page_range(struct mmu_gather *tlb,
>  			     unsigned long addr, unsigned long end,
>  			     struct zap_details *details);
>  
> +int force_page_cache_readahead(struct address_space *, struct file *,
> +		pgoff_t index, unsigned long nr_to_read);
>  extern unsigned int __do_page_cache_readahead(struct address_space *mapping,
>  		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
>  		unsigned long lookahead_size);
> 



