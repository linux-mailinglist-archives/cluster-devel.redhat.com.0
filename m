Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E9A65DB59
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Jan 2023 18:38:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672853906;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=SIzZSnWq+rUzeaqGWn5qsUiIxj64Tplhk7gStPChNE8=;
	b=RMAmijwkJ90WEWtf+BCdG8GqaOL/3OtwrXqAPpZ7FFw6T7uuUP+LQKjYcyiocruZd9nwX5
	mPiohxRcVWcF7MBWnrVxcqmRRgTFKvZIyepMgAtflYdLjRpVaZB8rJKX+7seyXlEMZPs0j
	oTrg02ejr3n7g/oiY+1yjGQtRxr9VYs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-c05PM4dMNbe74rxNuUv9OQ-1; Wed, 04 Jan 2023 12:38:23 -0500
X-MC-Unique: c05PM4dMNbe74rxNuUv9OQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C898857A84;
	Wed,  4 Jan 2023 17:38:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 959EBC15BA0;
	Wed,  4 Jan 2023 17:38:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5B0FD194658F;
	Wed,  4 Jan 2023 17:38:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1871F1946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  4 Jan 2023 17:38:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F06CF2166B31; Wed,  4 Jan 2023 17:38:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8E2F2166B30
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 17:38:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA10285CBE2
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 17:38:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-CSlKjJH9OLGqVfc4wsi08A-1; Wed, 04 Jan 2023 12:38:16 -0500
X-MC-Unique: CSlKjJH9OLGqVfc4wsi08A-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C635617C4;
 Wed,  4 Jan 2023 17:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A99C433EF;
 Wed,  4 Jan 2023 17:38:14 +0000 (UTC)
Date: Wed, 4 Jan 2023 09:38:14 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <Y7W5hiktQFd6CvTY@magnolia>
References: <20221231150919.659533-1-agruenba@redhat.com>
 <20221231150919.659533-5-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221231150919.659533-5-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH v5 4/9] iomap: Add iomap_get_folio helper
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 31, 2022 at 04:09:14PM +0100, Andreas Gruenbacher wrote:
> Add an iomap_get_folio() helper that gets a folio reference based on
> an iomap iterator and an offset into the address space.  Use it in
> iomap_write_begin().
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

Pretty straightforward,
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/iomap/buffered-io.c | 39 ++++++++++++++++++++++++++++++---------
>  include/linux/iomap.h  |  1 +
>  2 files changed, 31 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 2a9bab4f3c79..b84838d2b5d8 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -457,6 +457,33 @@ bool iomap_is_partially_uptodate(struct folio *folio, size_t from, size_t count)
>  }
>  EXPORT_SYMBOL_GPL(iomap_is_partially_uptodate);
>  
> +/**
> + * iomap_get_folio - get a folio reference for writing
> + * @iter: iteration structure
> + * @pos: start offset of write
> + *
> + * Returns a locked reference to the folio at @pos, or an error pointer if the
> + * folio could not be obtained.
> + */
> +struct folio *iomap_get_folio(struct iomap_iter *iter, loff_t pos)
> +{
> +	unsigned fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_STABLE | FGP_NOFS;
> +	struct folio *folio;
> +
> +	if (iter->flags & IOMAP_NOWAIT)
> +		fgp |= FGP_NOWAIT;
> +
> +	folio = __filemap_get_folio(iter->inode->i_mapping, pos >> PAGE_SHIFT,
> +			fgp, mapping_gfp_mask(iter->inode->i_mapping));
> +	if (folio)
> +		return folio;
> +
> +	if (iter->flags & IOMAP_NOWAIT)
> +		return ERR_PTR(-EAGAIN);
> +	return ERR_PTR(-ENOMEM);
> +}
> +EXPORT_SYMBOL_GPL(iomap_get_folio);
> +
>  bool iomap_release_folio(struct folio *folio, gfp_t gfp_flags)
>  {
>  	trace_iomap_release_folio(folio->mapping->host, folio_pos(folio),
> @@ -603,12 +630,8 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
>  	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
>  	const struct iomap *srcmap = iomap_iter_srcmap(iter);
>  	struct folio *folio;
> -	unsigned fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_STABLE | FGP_NOFS;
>  	int status = 0;
>  
> -	if (iter->flags & IOMAP_NOWAIT)
> -		fgp |= FGP_NOWAIT;
> -
>  	BUG_ON(pos + len > iter->iomap.offset + iter->iomap.length);
>  	if (srcmap != &iter->iomap)
>  		BUG_ON(pos + len > srcmap->offset + srcmap->length);
> @@ -625,12 +648,10 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
>  			return status;
>  	}
>  
> -	folio = __filemap_get_folio(iter->inode->i_mapping, pos >> PAGE_SHIFT,
> -			fgp, mapping_gfp_mask(iter->inode->i_mapping));
> -	if (!folio) {
> -		status = (iter->flags & IOMAP_NOWAIT) ? -EAGAIN : -ENOMEM;
> +	folio = iomap_get_folio(iter, pos);
> +	if (IS_ERR(folio)) {
>  		iomap_put_folio(iter, pos, 0, NULL);
> -		return status;
> +		return PTR_ERR(folio);
>  	}
>  
>  	/*
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index 10ec36f373f4..e5732cc5716b 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -261,6 +261,7 @@ int iomap_file_buffered_write_punch_delalloc(struct inode *inode,
>  int iomap_read_folio(struct folio *folio, const struct iomap_ops *ops);
>  void iomap_readahead(struct readahead_control *, const struct iomap_ops *ops);
>  bool iomap_is_partially_uptodate(struct folio *, size_t from, size_t count);
> +struct folio *iomap_get_folio(struct iomap_iter *iter, loff_t pos);
>  bool iomap_release_folio(struct folio *folio, gfp_t gfp_flags);
>  void iomap_invalidate_folio(struct folio *folio, size_t offset, size_t len);
>  int iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
> -- 
> 2.38.1
> 

