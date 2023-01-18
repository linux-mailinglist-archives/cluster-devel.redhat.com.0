Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9455A671E96
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 14:56:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674050171;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=mFihkpDInrgSgklnLUMioicNGhqhAH1TgcOQOASzKX8=;
	b=Uv445n4IJiJ+ifP9cAxkpuy9BuAePxT1yJwjn8E69Yllrpltd/Kw3zpO+gRxtTv+a4hLMi
	n6nujOv4x/XhWMBeUCVlcytlxyqGwKAXP+cPqM42buLCWmPA5jCMtCMd+kijOKObJK8GME
	VwbJfyg+st8tSADq0IB8FHetFDzCrIU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-l469Pos-P56dDQk1qx6cIg-1; Wed, 18 Jan 2023 08:56:08 -0500
X-MC-Unique: l469Pos-P56dDQk1qx6cIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57D8F857F46;
	Wed, 18 Jan 2023 13:56:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D0A2C15BAE;
	Wed, 18 Jan 2023 13:56:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 157EF1946A6D;
	Wed, 18 Jan 2023 13:56:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6262E19465B7 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 13:56:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 44AEAC15E7F; Wed, 18 Jan 2023 13:56:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D922C15BAD
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 13:56:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21A29382888F
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 13:56:06 +0000 (UTC)
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-275-fdzLOzqzPzye0IvUW_7X7w-1; Wed, 18 Jan 2023 08:56:04 -0500
X-MC-Unique: fdzLOzqzPzye0IvUW_7X7w-1
Received: by mail-vs1-f69.google.com with SMTP id
 t13-20020a05610210cd00b003d0e50f796bso5508146vsr.18
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 05:56:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFihkpDInrgSgklnLUMioicNGhqhAH1TgcOQOASzKX8=;
 b=O+yU5kgaAiR+MeDw0ZZErXkS8fciOyxQELG2KTbLRS7/OVmtGYZ2SdmTzWFlRlbLwl
 jahdkIeo49MGeh3EMksHaFRZPmANRty354T4dNcllV771Q64jCMvSsp3gNYuyEsuTQf9
 D7uOqN88fccc7lGYGOScbuEnCVqcrpHXinq6ZVQ3CVfOwJdxi3qNk21RAXfuSVOIuoRO
 +F0nQfPn7uRT9JgORHYy79JJZtW1aRa8BJVgQec2yxdWxOH+utmBUGUnZhoNJ1YBPMoR
 SJhlSpIHhHUKnVfjX9Bjrf9DBwd/uHvStjKGw91P/R0ZNHrmiFeo036k11+kcIsxr0lu
 qsAA==
X-Gm-Message-State: AFqh2kpJlL1Xm3kWdGgN/OpGYEd918yjcmdq3o0my31YmsWG7JnFubYl
 ZDpmAvWTvqyhBnllQZaveJ3pT1YwBiHgWnBUTQKU46MvNXDJf1Wt8UElVLS9O13hplWN3lRl0SR
 Pu/GPK7Y5wc0Gp9YpewG5dw==
X-Received: by 2002:a1f:9092:0:b0:3e1:c1a9:9ed3 with SMTP id
 s140-20020a1f9092000000b003e1c1a99ed3mr896140vkd.9.1674050164276; 
 Wed, 18 Jan 2023 05:56:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsLRo7TamkDesKO8QNJFygnDW4twpsX9e35bGiyAXeGnZO0p6bdjcamDz6tCwjrwmPqirRaLA==
X-Received: by 2002:a1f:9092:0:b0:3e1:c1a9:9ed3 with SMTP id
 s140-20020a1f9092000000b003e1c1a99ed3mr896109vkd.9.1674050163955; 
 Wed, 18 Jan 2023 05:56:03 -0800 (PST)
Received: from bfoster (c-24-61-119-116.hsd1.ma.comcast.net. [24.61.119.116])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a05620a255200b006eeb3165565sm22368714qko.80.2023.01.18.05.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 05:56:03 -0800 (PST)
Date: Wed, 18 Jan 2023 08:57:05 -0500
From: Brian Foster <bfoster@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Y8f6sShghKuFim5E@bfoster>
References: <20230118094329.9553-1-hch@lst.de>
 <20230118094329.9553-5-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230118094329.9553-5-hch@lst.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH 4/9] shmem: remove
 shmem_get_partial_folio
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 18, 2023 at 10:43:24AM +0100, Christoph Hellwig wrote:
> Add a new SGP_FIND mode for shmem_get_partial_folio that works like
> SGP_READ, but does not check i_size.  Use that instead of open coding
> the page cache lookup in shmem_get_partial_folio.  Note that this is
> a behavior change in that it reads in swap cache entries for offsets
> outside i_size, possibly causing a little bit of extra work.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/shmem_fs.h |  1 +
>  mm/shmem.c               | 46 ++++++++++++----------------------------
>  2 files changed, 15 insertions(+), 32 deletions(-)
> 
> diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
> index d09d54be4ffd99..7ba160ac066e5e 100644
> --- a/include/linux/shmem_fs.h
> +++ b/include/linux/shmem_fs.h
> @@ -105,6 +105,7 @@ enum sgp_type {
>  	SGP_CACHE,	/* don't exceed i_size, may allocate page */
>  	SGP_WRITE,	/* may exceed i_size, may allocate !Uptodate page */
>  	SGP_FALLOC,	/* like SGP_WRITE, but make existing page Uptodate */
> +	SGP_FIND,	/* like SGP_READ, but also read outside i_size */
>  };
>  
>  int shmem_get_folio(struct inode *inode, pgoff_t index, struct folio **foliop,
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 9e1015cbad29f9..e9500fea43a8dc 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -877,27 +877,6 @@ void shmem_unlock_mapping(struct address_space *mapping)
>  	}
>  }
>  
> -static struct folio *shmem_get_partial_folio(struct inode *inode, pgoff_t index)
> -{
> -	struct folio *folio;
> -
> -	/*
> -	 * At first avoid shmem_get_folio(,,,SGP_READ): that fails
> -	 * beyond i_size, and reports fallocated pages as holes.
> -	 */
> -	folio = __filemap_get_folio(inode->i_mapping, index,
> -					FGP_ENTRY | FGP_LOCK, 0);

This all seems reasonable to me at a glance, FWIW, but I am a little
curious why this wouldn't split up into two changes. I.e., switch this
over to filemap_get_entry() to minimally remove the FGP_ENTRY dependency
without a behavior change, then (perhaps after the next patch) introduce
SGP_FIND in a separate patch. That makes it easier to review and
potentially undo if it happens to pose a problem in the future. Hm?

Brian

> -	if (!xa_is_value(folio))
> -		return folio;
> -	/*
> -	 * But read a page back from swap if any of it is within i_size
> -	 * (although in some cases this is just a waste of time).
> -	 */
> -	folio = NULL;
> -	shmem_get_folio(inode, index, &folio, SGP_READ);
> -	return folio;
> -}
> -
>  /*
>   * Remove range of pages and swap entries from page cache, and free them.
>   * If !unfalloc, truncate or punch hole; if unfalloc, undo failed fallocate.
> @@ -957,7 +936,8 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, loff_t lend,
>  		goto whole_folios;
>  
>  	same_folio = (lstart >> PAGE_SHIFT) == (lend >> PAGE_SHIFT);
> -	folio = shmem_get_partial_folio(inode, lstart >> PAGE_SHIFT);
> +	folio = NULL;
> +	shmem_get_folio(inode, lstart >> PAGE_SHIFT, &folio, SGP_FIND);
>  	if (folio) {
>  		same_folio = lend < folio_pos(folio) + folio_size(folio);
>  		folio_mark_dirty(folio);
> @@ -971,14 +951,16 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, loff_t lend,
>  		folio = NULL;
>  	}
>  
> -	if (!same_folio)
> -		folio = shmem_get_partial_folio(inode, lend >> PAGE_SHIFT);
> -	if (folio) {
> -		folio_mark_dirty(folio);
> -		if (!truncate_inode_partial_folio(folio, lstart, lend))
> -			end = folio->index;
> -		folio_unlock(folio);
> -		folio_put(folio);
> +	if (!same_folio) {
> +		folio = NULL;
> +		shmem_get_folio(inode, lend >> PAGE_SHIFT, &folio, SGP_FIND);
> +		if (folio) {
> +			folio_mark_dirty(folio);
> +			if (!truncate_inode_partial_folio(folio, lstart, lend))
> +				end = folio->index;
> +			folio_unlock(folio);
> +			folio_put(folio);
> +		}
>  	}
>  
>  whole_folios:
> @@ -1900,7 +1882,7 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
>  		if (folio_test_uptodate(folio))
>  			goto out;
>  		/* fallocated folio */
> -		if (sgp != SGP_READ)
> +		if (sgp != SGP_READ && sgp != SGP_FIND)
>  			goto clear;
>  		folio_unlock(folio);
>  		folio_put(folio);
> @@ -1911,7 +1893,7 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
>  	 * SGP_NOALLOC: fail on hole, with NULL folio, letting caller fail.
>  	 */
>  	*foliop = NULL;
> -	if (sgp == SGP_READ)
> +	if (sgp == SGP_READ || sgp == SGP_FIND)
>  		return 0;
>  	if (sgp == SGP_NOALLOC)
>  		return -ENOENT;
> -- 
> 2.39.0
> 
> 

