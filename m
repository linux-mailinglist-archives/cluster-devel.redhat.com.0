Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3E96D6900
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 18:36:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680626183;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=2lFLBRct8NMXBe5NZ/2xWs6XVd4Kj62CAloWI3nXQ4w=;
	b=AWyUAe1O6dWLRh0CCM+Qu6GEQXoKJ/URr0VAnnz76LNIO7rt4fE+is0ZhbMERly8NKavku
	Lm1BKpcg5yLtQysupKSBK3WNpbPA21hIN5xRRB/05zjOfFvKiqWRDVvghZQ8qrjWn47ong
	0kzUkIePyVZKZRsvxeZL0PMmIlTALcs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-amVsKxsGNPKTL7jWtccHkQ-1; Tue, 04 Apr 2023 12:36:19 -0400
X-MC-Unique: amVsKxsGNPKTL7jWtccHkQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AD0F8996FD;
	Tue,  4 Apr 2023 16:36:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A65EB2027062;
	Tue,  4 Apr 2023 16:36:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5366A1946A43;
	Tue,  4 Apr 2023 16:36:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 89EE41946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 16:36:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A2CD02027144; Tue,  4 Apr 2023 16:36:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AF07202717C
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 16:36:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70B9B185A790
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 16:36:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-Nk9P2-7NOyijX5w8AjX4BQ-1; Tue, 04 Apr 2023 12:36:05 -0400
X-MC-Unique: Nk9P2-7NOyijX5w8AjX4BQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D7DC636E5;
 Tue,  4 Apr 2023 16:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8443DC4339B;
 Tue,  4 Apr 2023 16:36:03 +0000 (UTC)
Date: Tue, 4 Apr 2023 09:36:02 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20230404163602.GC109974@frogsfrogsfrogs>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230404145319.2057051-22-aalbersh@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH v2 21/23] xfs: handle merkle tree block
 size != fs blocksize != PAGE_SIZE
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
Cc: fsverity@lists.linux.dev, linux-ext4@vger.kernel.org,
 damien.lemoal@opensource.wdc.com, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 04, 2023 at 04:53:17PM +0200, Andrey Albershteyn wrote:
> In case of different Merkle tree block size fs-verity expects
> ->read_merkle_tree_page() to return Merkle tree page filled with
> Merkle tree blocks. The XFS stores each merkle tree block under
> extended attribute. Those attributes are addressed by block offset
> into Merkle tree.
> 
> This patch make ->read_merkle_tree_page() to fetch multiple merkle
> tree blocks based on size ratio. Also the reference to each xfs_buf
> is passed with page->private to ->drop_page().
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> ---
>  fs/xfs/xfs_verity.c | 74 +++++++++++++++++++++++++++++++++++----------
>  fs/xfs/xfs_verity.h |  8 +++++
>  2 files changed, 66 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/xfs/xfs_verity.c b/fs/xfs/xfs_verity.c
> index a9874ff4efcd..ef0aff216f06 100644
> --- a/fs/xfs/xfs_verity.c
> +++ b/fs/xfs/xfs_verity.c
> @@ -134,6 +134,10 @@ xfs_read_merkle_tree_page(
>  	struct page		*page = NULL;
>  	__be64			name = cpu_to_be64(index << PAGE_SHIFT);
>  	uint32_t		bs = 1 << log_blocksize;
> +	int			blocks_per_page =
> +		(1 << (PAGE_SHIFT - log_blocksize));
> +	int			n = 0;
> +	int			offset = 0;
>  	struct xfs_da_args	args = {
>  		.dp		= ip,
>  		.attr_filter	= XFS_ATTR_VERITY,
> @@ -143,26 +147,59 @@ xfs_read_merkle_tree_page(
>  		.valuelen	= bs,
>  	};
>  	int			error = 0;
> +	bool			is_checked = true;
> +	struct xfs_verity_buf_list	*buf_list;
>  
>  	page = alloc_page(GFP_KERNEL);
>  	if (!page)
>  		return ERR_PTR(-ENOMEM);
>  
> -	error = xfs_attr_get(&args);
> -	if (error) {
> -		kmem_free(args.value);
> -		xfs_buf_rele(args.bp);
> +	buf_list = kzalloc(sizeof(struct xfs_verity_buf_list), GFP_KERNEL);
> +	if (!buf_list) {
>  		put_page(page);
> -		return ERR_PTR(-EFAULT);
> +		return ERR_PTR(-ENOMEM);
>  	}
>  
> -	if (args.bp->b_flags & XBF_VERITY_CHECKED)
> +	/*
> +	 * Fill the page with Merkle tree blocks. The blcoks_per_page is higher
> +	 * than 1 when fs block size != PAGE_SIZE or Merkle tree block size !=
> +	 * PAGE SIZE
> +	 */
> +	for (n = 0; n < blocks_per_page; n++) {

Ahah, ok, that's why we can't pass the xfs_buf pages up to fsverity.

> +		offset = bs * n;
> +		name = cpu_to_be64(((index << PAGE_SHIFT) + offset));

Really this ought to be a typechecked helper...

struct xfs_fsverity_merkle_key {
	__be64	merkleoff;
};

static inline void
xfs_fsverity_merkle_key_to_disk(struct xfs_fsverity_merkle_key *k, loff_t pos)
{
	k->merkeloff = cpu_to_be64(pos);
}



> +		args.name = (const uint8_t *)&name;
> +
> +		error = xfs_attr_get(&args);
> +		if (error) {
> +			kmem_free(args.value);
> +			/*
> +			 * No more Merkle tree blocks (e.g. this was the last
> +			 * block of the tree)
> +			 */
> +			if (error == -ENOATTR)
> +				break;
> +			xfs_buf_rele(args.bp);
> +			put_page(page);
> +			kmem_free(buf_list);
> +			return ERR_PTR(-EFAULT);
> +		}
> +
> +		buf_list->bufs[buf_list->buf_count++] = args.bp;
> +
> +		/* One of the buffers was dropped */
> +		if (!(args.bp->b_flags & XBF_VERITY_CHECKED))
> +			is_checked = false;

If there's enough memory pressure to cause the merkle tree pages to get
evicted, what are the chances that the xfs_bufs survive the eviction?

> +		memcpy(page_address(page) + offset, args.value, args.valuelen);
> +		kmem_free(args.value);
> +		args.value = NULL;
> +	}
> +
> +	if (is_checked)
>  		SetPageChecked(page);
> +	page->private = (unsigned long)buf_list;
>  
> -	page->private = (unsigned long)args.bp;
> -	memcpy(page_address(page), args.value, args.valuelen);
> -
> -	kmem_free(args.value);
>  	return page;
>  }
>  
> @@ -191,16 +228,21 @@ xfs_write_merkle_tree_block(
>  
>  static void
>  xfs_drop_page(
> -	struct page	*page)
> +	struct page			*page)
>  {
> -	struct xfs_buf *buf = (struct xfs_buf *)page->private;
> +	int				i = 0;
> +	struct xfs_verity_buf_list	*buf_list =
> +		(struct xfs_verity_buf_list *)page->private;
>  
> -	ASSERT(buf != NULL);
> +	ASSERT(buf_list != NULL);
>  
> -	if (PageChecked(page))
> -		buf->b_flags |= XBF_VERITY_CHECKED;
> +	for (i = 0; i < buf_list->buf_count; i++) {
> +		if (PageChecked(page))
> +			buf_list->bufs[i]->b_flags |= XBF_VERITY_CHECKED;
> +		xfs_buf_rele(buf_list->bufs[i]);
> +	}
>  
> -	xfs_buf_rele(buf);
> +	kmem_free(buf_list);
>  	put_page(page);
>  }
>  
> diff --git a/fs/xfs/xfs_verity.h b/fs/xfs/xfs_verity.h
> index ae5d87ca32a8..433b2f4ae3bc 100644
> --- a/fs/xfs/xfs_verity.h
> +++ b/fs/xfs/xfs_verity.h
> @@ -16,4 +16,12 @@ extern const struct fsverity_operations xfs_verity_ops;
>  #define xfs_verity_ops NULL
>  #endif	/* CONFIG_FS_VERITY */
>  
> +/* Minimal Merkle tree block size is 1024 */
> +#define XFS_VERITY_MAX_MBLOCKS_PER_PAGE (1 << (PAGE_SHIFT - 10))
> +
> +struct xfs_verity_buf_list {
> +	unsigned int	buf_count;
> +	struct xfs_buf	*bufs[XFS_VERITY_MAX_MBLOCKS_PER_PAGE];

So... this is going to be a 520-byte allocation on arm64 with 64k pages?
Even if the merkle tree block size is the same as the page size?  Ouch.

--D

> +};
> +
>  #endif	/* __XFS_VERITY_H__ */
> -- 
> 2.38.4
> 

