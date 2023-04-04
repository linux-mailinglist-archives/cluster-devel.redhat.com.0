Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 870DE6D70BA
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 01:32:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680651157;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=MmoxdKIc4151pVAmtBeT09xdteWmODj4r9H1FuRwtxw=;
	b=ET4kC6b5J9Tg6PyITpTMyDbfdTO4qztGcEIctcDLsoZCua2e9ZG2ZPzL/AW+1TrNFWJqkI
	lrVFWN7OP5URtWu2/MLtCgxDf7tYpGIvvD71yHooOlgKtibTMzxzTECr7Te05EM/xY45ep
	UCknyuM/IzqlhdneDu/9WhPRuoGVo54=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-eE_DvxLvP3CmFYTEnpH0-A-1; Tue, 04 Apr 2023 19:32:34 -0400
X-MC-Unique: eE_DvxLvP3CmFYTEnpH0-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DEC638173D4;
	Tue,  4 Apr 2023 23:32:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C1C02166B26;
	Tue,  4 Apr 2023 23:32:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CE4DB1946A43;
	Tue,  4 Apr 2023 23:32:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3CCED1946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 23:32:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DBF9F4020C80; Tue,  4 Apr 2023 23:32:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D536B40C6EC4
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 23:32:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5901185A790
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 23:32:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-J0hgdbwiO4-ASzPxcmgylw-1; Tue, 04 Apr 2023 19:32:28 -0400
X-MC-Unique: J0hgdbwiO4-ASzPxcmgylw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D5EA56343B;
 Tue,  4 Apr 2023 23:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8AEC433EF;
 Tue,  4 Apr 2023 23:32:25 +0000 (UTC)
Date: Tue, 4 Apr 2023 16:32:24 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20230404233224.GE1893@sol.localdomain>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, djwong@kernel.org,
 damien.lemoal@opensource.wdc.com, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrey,

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
> +		offset = bs * n;
> +		name = cpu_to_be64(((index << PAGE_SHIFT) + offset));
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
> +
> +		memcpy(page_address(page) + offset, args.value, args.valuelen);
> +		kmem_free(args.value);
> +		args.value = NULL;
> +	}

I was really hoping for a solution where the cached data can be used directly,
instead allocating a temporary page and copying the cached data into it every
time the cache is accessed.  The problem with what you have now is that every
time a single 32-byte hash is accessed, a full page (potentially 64KB!) will be
allocated and filled.  That's not very efficient.  The need to allocate the
temporary page can also cause ENOMEM (which will get reported as EIO).

Did you consider alternatives that would work more efficiently?  I think it
would be worth designing something that works properly with how XFS is planned
to cache the Merkle tree, instead of designing a workaround.
->read_merkle_tree_page was not really designed for what you are doing here.

How about replacing ->read_merkle_tree_page with a function that takes in a
Merkle tree block index (not a page index!) and hands back a (page, offset) pair
that identifies where the Merkle tree block's data is located?  Or (folio,
offset), I suppose.

With that, would it be possible to directly return the XFS cache?

- Eric

