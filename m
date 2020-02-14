Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 652F215D6A2
	for <lists+cluster-devel@lfdr.de>; Fri, 14 Feb 2020 12:37:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581680273;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RNaZ4JfNFDU0NcYE8lJdvYhazrtkoisD3k8b6KMLtdc=;
	b=AmioAa0tJsJIBLPTk45ugkkRMuM4cF6HqoXIllZYHlJwVlmV20hsBzxUN1Dos14v3Co5ca
	QkaBVGu9CUTisSh+6hbverYrgX0ZdCoXOGL99pKk530TIawmTzRrzUmh+sDaDn077xodp3
	4RV0/LE0n16jczMf+niI7B1x8BTibKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-BsaSSyCwNOOR4bfAu1M2Wg-1; Fri, 14 Feb 2020 06:37:51 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DE9210CE792;
	Fri, 14 Feb 2020 11:37:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F6EE790D6;
	Fri, 14 Feb 2020 11:37:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F64A18089CD;
	Fri, 14 Feb 2020 11:37:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01E3JxOO021941 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 22:20:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BA8322028CD4; Fri, 14 Feb 2020 03:19:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5BA22028CD3
	for <cluster-devel@redhat.com>; Fri, 14 Feb 2020 03:19:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8242101D258
	for <cluster-devel@redhat.com>; Fri, 14 Feb 2020 03:19:57 +0000 (UTC)
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
	[216.228.121.143]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-295-haK0L8UnPeySub_AykSavQ-1; Thu, 13 Feb 2020 22:19:55 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e4611980000>; Thu, 13 Feb 2020 19:18:48 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Thu, 13 Feb 2020 19:19:54 -0800
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Thu, 13 Feb 2020 19:19:54 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 14 Feb 2020 03:19:53 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200211010348.6872-1-willy@infradead.org>
	<20200211010348.6872-2-willy@infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <e0f459af-bb5d-58b9-78be-5adf687477c0@nvidia.com>
Date: Thu, 13 Feb 2020 19:19:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200211010348.6872-2-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-MC-Unique: haK0L8UnPeySub_AykSavQ-1
X-MC-Unique: BsaSSyCwNOOR4bfAu1M2Wg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 14 Feb 2020 06:37:40 -0500
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v5 01/13] mm: Fix the return type of
 __do_page_cache_readahead
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
> ra_submit() which is a wrapper around __do_page_cache_readahead() already
> returns an unsigned long, and the 'nr_to_read' parameter is an unsigned
> long, so fix __do_page_cache_readahead() to return an unsigned long,
> even though I'm pretty sure we're not going to readahead more than 2^32
> pages ever.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  mm/internal.h  | 2 +-
>  mm/readahead.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index 3cf20ab3ca01..41b93c4b3ab7 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -49,7 +49,7 @@ void unmap_page_range(struct mmu_gather *tlb,
>  			     unsigned long addr, unsigned long end,
>  			     struct zap_details *details);
>  
> -extern unsigned int __do_page_cache_readahead(struct address_space *mapping,
> +extern unsigned long __do_page_cache_readahead(struct address_space *mapping,
>  		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
>  		unsigned long lookahead_size);
>  
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 2fe72cd29b47..6bf73ef33b7e 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -152,7 +152,7 @@ static int read_pages(struct address_space *mapping, struct file *filp,
>   *
>   * Returns the number of pages requested, or the maximum amount of I/O allowed.
>   */
> -unsigned int __do_page_cache_readahead(struct address_space *mapping,
> +unsigned long __do_page_cache_readahead(struct address_space *mapping,
>  		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
>  		unsigned long lookahead_size)
>  {
> @@ -161,7 +161,7 @@ unsigned int __do_page_cache_readahead(struct address_space *mapping,
>  	unsigned long end_index;	/* The last page we want to read */
>  	LIST_HEAD(page_pool);
>  	int page_idx;


What about page_idx, too? It should also have the same data type as nr_pages, as long as
we're trying to be consistent on this point.

Just want to ensure we're ready to handle those 2^33+ page readaheads... :)


thanks,
-- 
John Hubbard
NVIDIA
> -	unsigned int nr_pages = 0;
> +	unsigned long nr_pages = 0;
>  	loff_t isize = i_size_read(inode);
>  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
>  
> 

