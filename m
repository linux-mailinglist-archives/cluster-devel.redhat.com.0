Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 48D381636FB
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 00:11:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582067514;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Akrlss92FgzkovaQxMkVJdSsymeHgaqEmFb5c836i2c=;
	b=MxfFubWZNxVOB49n1bedLRabh64ZophkVz1id8MaOLmaLpG+SA9FFKPhjTAke/FeQCeCdd
	YKc4nhIaZHuWAoY3vQA41RSIaTKlNp0D8iwIwxzvdHu+03NLiJSw6sOzbhInaifysRifGX
	kVS0armSU4r+ZMc7wM72D6q0/Vf0TSs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-plRVtisbMLeABATKTrCvOg-1; Tue, 18 Feb 2020 18:11:52 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B0DF800D5F;
	Tue, 18 Feb 2020 23:11:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F5055C112;
	Tue, 18 Feb 2020 23:11:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 46C7C35AF1;
	Tue, 18 Feb 2020 23:11:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01INBk9U025480 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 18:11:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EFEB92026D67; Tue, 18 Feb 2020 23:11:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8CF62026D69
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 23:11:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AB26803AD4
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 23:11:42 +0000 (UTC)
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
	[216.228.121.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-230-9vzeG570PYCbDBPMTfqu5Q-1; Tue, 18 Feb 2020 18:11:40 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e4c6f1d0000>; Tue, 18 Feb 2020 15:11:25 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Tue, 18 Feb 2020 15:11:39 -0800
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Tue, 18 Feb 2020 15:11:39 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 18 Feb 2020 23:11:38 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-10-willy@infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <64b98d0d-d281-fe34-8dbb-a04ac719d74d@nvidia.com>
Date: Tue, 18 Feb 2020 15:11:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-10-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-MC-Unique: 9vzeG570PYCbDBPMTfqu5Q-1
X-MC-Unique: plRVtisbMLeABATKTrCvOg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 06/19] mm: rename readahead loop
	variable to 'i'
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

On 2/17/20 10:45 AM, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> Change the type of page_idx to unsigned long, and rename it -- it's
> just a loop counter, not a page index.
> 
> Suggested-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  mm/readahead.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Looks good,

    Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard
NVIDIA

> diff --git a/mm/readahead.c b/mm/readahead.c
> index 74791b96013f..bdc5759000d3 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -156,7 +156,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  	struct inode *inode = mapping->host;
>  	unsigned long end_index;	/* The last page we want to read */
>  	LIST_HEAD(page_pool);
> -	int page_idx;
> +	unsigned long i;
>  	loff_t isize = i_size_read(inode);
>  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
>  	struct readahead_control rac = {
> @@ -174,7 +174,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  	/*
>  	 * Preallocate as many pages as we will need.
>  	 */
> -	for (page_idx = 0; page_idx < nr_to_read; page_idx++) {
> +	for (i = 0; i < nr_to_read; i++) {
>  		struct page *page;
>  
>  		if (offset > end_index)
> @@ -198,7 +198,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  			break;
>  		page->index = offset;
>  		list_add(&page->lru, &page_pool);
> -		if (page_idx == nr_to_read - lookahead_size)
> +		if (i == nr_to_read - lookahead_size)
>  			SetPageReadahead(page);
>  		rac._nr_pages++;
>  		offset++;
> 

