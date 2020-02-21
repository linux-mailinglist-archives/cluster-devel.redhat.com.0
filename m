Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CD28E166E18
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Feb 2020 04:50:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582257056;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tk14qMbQgXhzPHJvBXnjmNLCT+UAZJLvtKqXUx6iDgc=;
	b=Oz9Ly1gCQksC4L+i5xAe+PxeLs1eCZR5eygI/4fqlzn7I4Pn8iBKn/c58kt1cvGluPDnzO
	DUXg4rs9CAYkQ+SmJdBDyG+p9fSOuFV4khc5+JXPq8LcOt86f4aISrxFhzJmm0my+aj5vp
	v9+Hq9fA2q6ayqU9oAGx0qkeMfvpWCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-oXhTmFYTP6OYwBGi1jxQBg-1; Thu, 20 Feb 2020 22:50:55 -0500
X-MC-Unique: oXhTmFYTP6OYwBGi1jxQBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29F7C107ACC9;
	Fri, 21 Feb 2020 03:50:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD58B5D9C5;
	Fri, 21 Feb 2020 03:50:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DAD691809567;
	Fri, 21 Feb 2020 03:50:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01L3ok3T003036 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 22:50:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5A41D2028CD4; Fri, 21 Feb 2020 03:50:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 535EA2028CD5
	for <cluster-devel@redhat.com>; Fri, 21 Feb 2020 03:50:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9121E800295
	for <cluster-devel@redhat.com>; Fri, 21 Feb 2020 03:50:43 +0000 (UTC)
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
	[216.228.121.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-222-SImrWQ_KNVmYtMYCPphsXg-1; Thu, 20 Feb 2020 22:50:41 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e4f53820000>; Thu, 20 Feb 2020 19:50:26 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Thu, 20 Feb 2020 19:50:40 -0800
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Thu, 20 Feb 2020 19:50:40 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 21 Feb 2020 03:50:40 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-12-willy@infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <e6ef2075-b849-299e-0f11-c6ee82b0a3c7@nvidia.com>
Date: Thu, 20 Feb 2020 19:50:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219210103.32400-12-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-MC-Unique: SImrWQ_KNVmYtMYCPphsXg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 11/24] mm: Move end_index check out
	of readahead loop
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/19/20 1:00 PM, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> By reducing nr_to_read, we can eliminate this check from inside the loop.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  mm/readahead.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 07cdfbf00f4b..ace611f4bf05 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -166,8 +166,6 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  		unsigned long lookahead_size)
>  {
>  	struct inode *inode = mapping->host;
> -	struct page *page;
> -	unsigned long end_index;	/* The last page we want to read */
>  	LIST_HEAD(page_pool);
>  	loff_t isize = i_size_read(inode);
>  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
> @@ -179,22 +177,27 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  		._nr_pages = 0,
>  	};
>  	unsigned long i;
> +	pgoff_t end_index;	/* The last page we want to read */
>  
>  	if (isize == 0)
>  		return;
>  
> -	end_index = ((isize - 1) >> PAGE_SHIFT);
> +	end_index = (isize - 1) >> PAGE_SHIFT;
> +	if (index > end_index)
> +		return;
> +	if (index + nr_to_read < index)
> +		nr_to_read = ULONG_MAX - index + 1;
> +	if (index + nr_to_read >= end_index)
> +		nr_to_read = end_index - index + 1;


This tiny patch made me pause, because I wasn't sure at first of the exact
intent of the lines above. Once I worked it out, it seemed like it might
be helpful (or overkill??) to add a few hints for the reader, especially since
there are no hints in the function's (minimal) documentation header. What
do you think of this?

	/*
	 * If we can't read *any* pages without going past the inodes's isize
	 * limit, give up entirely:
	 */
	if (index > end_index)
		return;

	/* Cap nr_to_read, in order to avoid overflowing the ULONG type: */
	if (index + nr_to_read < index)
		nr_to_read = ULONG_MAX - index + 1;

	/* Cap nr_to_read, to avoid reading past the inode's isize limit: */
	if (index + nr_to_read >= end_index)
		nr_to_read = end_index - index + 1;


Either way, it looks corrected written to me, so:

    Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard
NVIDIA

>  
>  	/*
>  	 * Preallocate as many pages as we will need.
>  	 */
>  	for (i = 0; i < nr_to_read; i++) {
> -		if (index + i > end_index)
> -			break;
> +		struct page *page = xa_load(&mapping->i_pages, index + i);
>  
>  		BUG_ON(index + i != rac._index + rac._nr_pages);
>  
> -		page = xa_load(&mapping->i_pages, index + i);
>  		if (page && !xa_is_value(page)) {
>  			/*
>  			 * Page already present?  Kick off the current batch of
> 

