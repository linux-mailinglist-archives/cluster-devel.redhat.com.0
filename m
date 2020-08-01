Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 83A6923A12B
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Aug 2020 10:41:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-e24PyDeXOXKQovFU0NomSQ-1; Mon, 03 Aug 2020 04:41:01 -0400
X-MC-Unique: e24PyDeXOXKQovFU0NomSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE199107B814;
	Mon,  3 Aug 2020 08:40:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A55AC59;
	Mon,  3 Aug 2020 08:40:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 45B179A10B;
	Mon,  3 Aug 2020 08:40:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 071C5H8n015166 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 1 Aug 2020 08:05:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 125C110CB271; Sat,  1 Aug 2020 12:05:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D48B10CB26A
	for <cluster-devel@redhat.com>; Sat,  1 Aug 2020 12:05:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEEA2805C21
	for <cluster-devel@redhat.com>; Sat,  1 Aug 2020 12:05:13 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-78-ZBK8Q2yyMPe6yLnj5LrETg-1; Sat, 01 Aug 2020 08:05:09 -0400
X-MC-Unique: ZBK8Q2yyMPe6yLnj5LrETg-1
Received: by mail-lj1-f196.google.com with SMTP id v9so531090ljk.6;
	Sat, 01 Aug 2020 05:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=OLG7ItAoYmN7hbuX8EPhVN+JREx1wwvbMlVFaToyRYs=;
	b=VBRzou9QdIl8QSLU3GmG8ePRafjb9AQ/CRZ9GR8lyWuDrzl5+IbNKMjQN+oi0xMfp0
	VteU3BVxMAOtSldNBp8rwPBdt16J7+dVCHuPtjGenkcSWE5GqzDlYsTDugzsLEVdQWbz
	v0lsU+Ci4axA0DsWJznZk1avAuyut7+xBtkmxNMvYbE5Xhl7Kfj9QT1gc4ta7MH4gqGT
	j2d+69gvIs1tNjIqtJQfuCeMOjJGHBfaGJ4YiWhjOdQrQJ8X8lQBvtL8ld05szlqr0Dg
	XprBCOYmpsFsrs3pbjf8Iwz6WY+DeYZO8VWQYHbInJIHFlei2hmTlhHpDpF6E2xy2ZxV
	oXNQ==
X-Gm-Message-State: AOAM531z0NbborPi2Voi9ogt/+H5TxI2adYS7U382HRSuvf3fq7f8S7p
	28uhU+1GJQreZDf2U5VHrVs=
X-Google-Smtp-Source: ABdhPJyFxGGM4eke2ocMldO+y6VDyJKIRDixrr8Htw2n4cKIPnieFniNcb430JXXH2oXfqVE9JWeZw==
X-Received: by 2002:a2e:8897:: with SMTP id k23mr3622693lji.355.1596283507352; 
	Sat, 01 Aug 2020 05:05:07 -0700 (PDT)
Received: from [10.68.32.192] (broadband-37-110-38-130.ip.moscow.rt.ru.
	[37.110.38.130]) by smtp.gmail.com with ESMTPSA id
	v10sm2668127lfo.11.2020.08.01.05.05.05
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 01 Aug 2020 05:05:06 -0700 (PDT)
To: Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
References: <20200731212818.10782-1-efremov@linux.com>
From: Denis Efremov <efremov@linux.com>
Autocrypt: addr=efremov@linux.com; keydata=
	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
Message-ID: <777bd9d1-35b0-842a-83df-55792126c652@linux.com>
Date: Sat, 1 Aug 2020 15:05:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731212818.10782-1-efremov@linux.com>
Content-Language: en-US
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 03 Aug 2020 04:38:59 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] gfs2: Use kvmalloc instead of opencoded
	kmalloc/vmalloc
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Please, skip this patch. I missed that kvmalloc checks (flags & GFP_KERNEL) == GFP_KERNEL
before calling vmalloc.

P.S.: previous mail was filtered because of html tags.

Thanks,
Denis

On 8/1/20 12:28 AM, Denis Efremov wrote:
> Use kvmalloc instead of opencoded kmalloc/vmalloc condition.
> 
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  fs/gfs2/dir.c   | 23 ++++-------------------
>  fs/gfs2/quota.c |  5 +----
>  2 files changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
> index c0f2875c946c..5d2a708fae9c 100644
> --- a/fs/gfs2/dir.c
> +++ b/fs/gfs2/dir.c
> @@ -352,9 +352,7 @@ static __be64 *gfs2_dir_get_hash_table(struct gfs2_inode *ip)
>  		return ERR_PTR(-EIO);
>  	}
>  
> -	hc = kmalloc(hsize, GFP_NOFS | __GFP_NOWARN);
> -	if (hc == NULL)
> -		hc = __vmalloc(hsize, GFP_NOFS);
> +	hc = kvmalloc(hsize, GFP_NOFS);
>  
>  	if (hc == NULL)
>  		return ERR_PTR(-ENOMEM);
> @@ -1320,18 +1318,6 @@ static int do_filldir_main(struct gfs2_inode *dip, struct dir_context *ctx,
>  	return 0;
>  }
>  
> -static void *gfs2_alloc_sort_buffer(unsigned size)
> -{
> -	void *ptr = NULL;
> -
> -	if (size < KMALLOC_MAX_SIZE)
> -		ptr = kmalloc(size, GFP_NOFS | __GFP_NOWARN);
> -	if (!ptr)
> -		ptr = __vmalloc(size, GFP_NOFS);
> -	return ptr;
> -}
> -
> -
>  static int gfs2_set_cookies(struct gfs2_sbd *sdp, struct buffer_head *bh,
>  			    unsigned leaf_nr, struct gfs2_dirent **darr,
>  			    unsigned entries)
> @@ -1409,7 +1395,8 @@ static int gfs2_dir_read_leaf(struct inode *inode, struct dir_context *ctx,
>  	 * 99 is the maximum number of entries that can fit in a single
>  	 * leaf block.
>  	 */
> -	larr = gfs2_alloc_sort_buffer((leaves + entries + 99) * sizeof(void *));
> +	larr = kvmalloc_array(leaves + entries + 99,
> +			      sizeof(void *), GFP_NOFS);
>  	if (!larr)
>  		goto out;
>  	darr = (struct gfs2_dirent **)(larr + leaves);
> @@ -1985,9 +1972,7 @@ static int leaf_dealloc(struct gfs2_inode *dip, u32 index, u32 len,
>  
>  	memset(&rlist, 0, sizeof(struct gfs2_rgrp_list));
>  
> -	ht = kzalloc(size, GFP_NOFS | __GFP_NOWARN);
> -	if (ht == NULL)
> -		ht = __vmalloc(size, GFP_NOFS | __GFP_NOWARN | __GFP_ZERO);
> +	ht = kvzalloc(size, GFP_NOFS);
>  	if (!ht)
>  		return -ENOMEM;
>  
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index 4b67d47a7e00..204b34f38e5c 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -1362,10 +1362,7 @@ int gfs2_quota_init(struct gfs2_sbd *sdp)
>  	bm_size = DIV_ROUND_UP(sdp->sd_quota_slots, 8 * sizeof(unsigned long));
>  	bm_size *= sizeof(unsigned long);
>  	error = -ENOMEM;
> -	sdp->sd_quota_bitmap = kzalloc(bm_size, GFP_NOFS | __GFP_NOWARN);
> -	if (sdp->sd_quota_bitmap == NULL)
> -		sdp->sd_quota_bitmap = __vmalloc(bm_size, GFP_NOFS |
> -						 __GFP_ZERO);
> +	sdp->sd_quota_bitmap = kvzalloc(bm_size, GFP_NOFS);
>  	if (!sdp->sd_quota_bitmap)
>  		return error;
>  
> 

