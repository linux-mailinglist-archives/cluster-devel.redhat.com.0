Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A6565DBB3
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Jan 2023 18:56:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672854975;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KqMdv0MCWwV7b/4aI2WzCFi5bKjkBa0V7HsBepep7Xc=;
	b=B3Sib/ngxMyqUiZACUn1R9X7fTx9Qpo4nt9zyySD9lgNdlnQ5brwdqEGP4uaoJV5Qf8LYX
	q5vCnFR6Fn/ixm2iAMfGX9on9Q4pjNYqQSwbKSUlbHasnluPHn8G2mBnqqEksQ5Xum9CWr
	xRU69w8g/e9MtH2tqB0ezDzWv3hJpy4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-e2LNHLcaOZiY7w9dKLUP0g-1; Wed, 04 Jan 2023 12:56:09 -0500
X-MC-Unique: e2LNHLcaOZiY7w9dKLUP0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3EF318E6206;
	Wed,  4 Jan 2023 17:56:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C883A4015306;
	Wed,  4 Jan 2023 17:56:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9FA2D194658F;
	Wed,  4 Jan 2023 17:56:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C88D21946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  4 Jan 2023 17:56:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7098D40C2064; Wed,  4 Jan 2023 17:56:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69BA640C2005
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 17:56:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E6063C10692
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 17:56:06 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-C03lKwTQMEGeZOWm1h4tkg-1; Wed, 04 Jan 2023 12:56:04 -0500
X-MC-Unique: C03lKwTQMEGeZOWm1h4tkg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 08F45CE1877;
 Wed,  4 Jan 2023 17:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4665FC433F0;
 Wed,  4 Jan 2023 17:46:02 +0000 (UTC)
Date: Wed, 4 Jan 2023 09:46:01 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <Y7W7WYW2mPLHACcl@magnolia>
References: <20221231150919.659533-1-agruenba@redhat.com>
 <20221231150919.659533-7-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221231150919.659533-7-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH v5 6/9] iomap: Rename page_prepare
 handler to get_folio
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 31, 2022 at 04:09:16PM +0100, Andreas Gruenbacher wrote:
> The ->page_prepare() handler in struct iomap_page_ops is now somewhat
> misnamed, so rename it to ->get_folio().
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

Looks good to me,
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/gfs2/bmap.c         | 6 +++---
>  fs/iomap/buffered-io.c | 4 ++--
>  include/linux/iomap.h  | 6 +++---
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index 41349e09558b..d3adb715ac8c 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -957,7 +957,7 @@ static int __gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
>  }
>  
>  static struct folio *
> -gfs2_iomap_page_prepare(struct iomap_iter *iter, loff_t pos, unsigned len)
> +gfs2_iomap_get_folio(struct iomap_iter *iter, loff_t pos, unsigned len)
>  {
>  	struct inode *inode = iter->inode;
>  	unsigned int blockmask = i_blocksize(inode) - 1;
> @@ -998,7 +998,7 @@ static void gfs2_iomap_put_folio(struct inode *inode, loff_t pos,
>  }
>  
>  static const struct iomap_page_ops gfs2_iomap_page_ops = {
> -	.page_prepare = gfs2_iomap_page_prepare,
> +	.get_folio = gfs2_iomap_get_folio,
>  	.put_folio = gfs2_iomap_put_folio,
>  };
>  
> @@ -1291,7 +1291,7 @@ int gfs2_alloc_extent(struct inode *inode, u64 lblock, u64 *dblock,
>  /*
>   * NOTE: Never call gfs2_block_zero_range with an open transaction because it
>   * uses iomap write to perform its actions, which begin their own transactions
> - * (iomap_begin, page_prepare, etc.)
> + * (iomap_begin, get_folio, etc.)
>   */
>  static int gfs2_block_zero_range(struct inode *inode, loff_t from,
>  				 unsigned int length)
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 7decd8cdc755..4f363d42dbaf 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -642,8 +642,8 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
>  	if (!mapping_large_folio_support(iter->inode->i_mapping))
>  		len = min_t(size_t, len, PAGE_SIZE - offset_in_page(pos));
>  
> -	if (page_ops && page_ops->page_prepare)
> -		folio = page_ops->page_prepare(iter, pos, len);
> +	if (page_ops && page_ops->get_folio)
> +		folio = page_ops->get_folio(iter, pos, len);
>  	else
>  		folio = iomap_get_folio(iter, pos);
>  	if (IS_ERR(folio))
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index 87b5d0f8e578..dd3575ada5d1 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -126,17 +126,17 @@ static inline bool iomap_inline_data_valid(const struct iomap *iomap)
>  }
>  
>  /*
> - * When a filesystem sets page_ops in an iomap mapping it returns, page_prepare
> + * When a filesystem sets page_ops in an iomap mapping it returns, get_folio
>   * and put_folio will be called for each page written to.  This only applies to
>   * buffered writes as unbuffered writes will not typically have pages
>   * associated with them.
>   *
> - * When page_prepare succeeds, put_folio will always be called to do any
> + * When get_folio succeeds, put_folio will always be called to do any
>   * cleanup work necessary.  put_folio is responsible for unlocking and putting
>   * @folio.
>   */
>  struct iomap_page_ops {
> -	struct folio *(*page_prepare)(struct iomap_iter *iter, loff_t pos,
> +	struct folio *(*get_folio)(struct iomap_iter *iter, loff_t pos,
>  			unsigned len);
>  	void (*put_folio)(struct inode *inode, loff_t pos, unsigned copied,
>  			struct folio *folio);
> -- 
> 2.38.1
> 

