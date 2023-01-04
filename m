Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2018E65DB60
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Jan 2023 18:39:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672853988;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ADkSso9HqjXzGEcOnys5jAka/OiJnbnYOztwzwRPBE0=;
	b=glI0eFWTkJOwAEOpaP353yvdcHOqnIiUQDA/3v9dl+ZnbaBLGLP055kKe2q+CNRHlM1hZw
	8XCt4bN3t3eEaE+CoBQGWf7DWJeAoqT7/iz6DDthbYlOP4CIpAzbwyJeNsuA46dd34s+f6
	oPIGRetwQXDw5DTUVWU59+wuLMiDFag=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-ZRe-GvwuO1CT1gdYOAbBlg-1; Wed, 04 Jan 2023 12:39:44 -0500
X-MC-Unique: ZRe-GvwuO1CT1gdYOAbBlg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2016585CBE3;
	Wed,  4 Jan 2023 17:39:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12D34492B06;
	Wed,  4 Jan 2023 17:39:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 75C74194658F;
	Wed,  4 Jan 2023 17:39:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0196A1946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  4 Jan 2023 17:39:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ADCD94085724; Wed,  4 Jan 2023 17:39:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A41D14085721
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 17:39:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89E50185A78B
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 17:39:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-nKPy09UeNMyIMoB-kSzcrQ-1; Wed, 04 Jan 2023 12:39:09 -0500
X-MC-Unique: nKPy09UeNMyIMoB-kSzcrQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA4F0617CF;
 Wed,  4 Jan 2023 17:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50407C433D2;
 Wed,  4 Jan 2023 17:39:08 +0000 (UTC)
Date: Wed, 4 Jan 2023 09:39:07 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <Y7W5uyho8AWpo5or@magnolia>
References: <20221231150919.659533-1-agruenba@redhat.com>
 <20221231150919.659533-2-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221231150919.659533-2-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v5 1/9] iomap: Add iomap_put_folio helper
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
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
 Matthew Wilcox <willy@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 31, 2022 at 04:09:11PM +0100, Andreas Gruenbacher wrote:
> Add an iomap_put_folio() helper to encapsulate unlocking the folio,
> calling ->page_done(), and putting the folio.  Use the new helper in
> iomap_write_begin() and iomap_write_end().
> 
> This effectively doesn't change the way the code works, but prepares for
> successive improvements.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

Ok,
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/iomap/buffered-io.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 356193e44cf0..c30d150a9303 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -575,6 +575,19 @@ static int __iomap_write_begin(const struct iomap_iter *iter, loff_t pos,
>  	return 0;
>  }
>  
> +static void iomap_put_folio(struct iomap_iter *iter, loff_t pos, size_t ret,
> +		struct folio *folio)
> +{
> +	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
> +
> +	if (folio)
> +		folio_unlock(folio);
> +	if (page_ops && page_ops->page_done)
> +		page_ops->page_done(iter->inode, pos, ret, &folio->page);
> +	if (folio)
> +		folio_put(folio);
> +}
> +
>  static int iomap_write_begin_inline(const struct iomap_iter *iter,
>  		struct folio *folio)
>  {
> @@ -616,7 +629,8 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
>  			fgp, mapping_gfp_mask(iter->inode->i_mapping));
>  	if (!folio) {
>  		status = (iter->flags & IOMAP_NOWAIT) ? -EAGAIN : -ENOMEM;
> -		goto out_no_page;
> +		iomap_put_folio(iter, pos, 0, NULL);
> +		return status;
>  	}
>  
>  	/*
> @@ -656,13 +670,9 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
>  	return 0;
>  
>  out_unlock:
> -	folio_unlock(folio);
> -	folio_put(folio);
> +	iomap_put_folio(iter, pos, 0, folio);
>  	iomap_write_failed(iter->inode, pos, len);
>  
> -out_no_page:
> -	if (page_ops && page_ops->page_done)
> -		page_ops->page_done(iter->inode, pos, 0, NULL);
>  	return status;
>  }
>  
> @@ -712,7 +722,6 @@ static size_t iomap_write_end_inline(const struct iomap_iter *iter,
>  static size_t iomap_write_end(struct iomap_iter *iter, loff_t pos, size_t len,
>  		size_t copied, struct folio *folio)
>  {
> -	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
>  	const struct iomap *srcmap = iomap_iter_srcmap(iter);
>  	loff_t old_size = iter->inode->i_size;
>  	size_t ret;
> @@ -735,14 +744,10 @@ static size_t iomap_write_end(struct iomap_iter *iter, loff_t pos, size_t len,
>  		i_size_write(iter->inode, pos + ret);
>  		iter->iomap.flags |= IOMAP_F_SIZE_CHANGED;
>  	}
> -	folio_unlock(folio);
> +	iomap_put_folio(iter, pos, ret, folio);
>  
>  	if (old_size < pos)
>  		pagecache_isize_extended(iter->inode, old_size, pos);
> -	if (page_ops && page_ops->page_done)
> -		page_ops->page_done(iter->inode, pos, ret, &folio->page);
> -	folio_put(folio);
> -
>  	if (ret < len)
>  		iomap_write_failed(iter->inode, pos + ret, len - ret);
>  	return ret;
> -- 
> 2.38.1
> 

