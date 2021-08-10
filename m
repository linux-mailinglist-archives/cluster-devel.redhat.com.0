Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E91173E86B3
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Aug 2021 01:48:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-fArifuI8Mme-Av45Edea7A-1; Tue, 10 Aug 2021 19:48:48 -0400
X-MC-Unique: fArifuI8Mme-Av45Edea7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB32F1009606;
	Tue, 10 Aug 2021 23:48:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 823605D740;
	Tue, 10 Aug 2021 23:48:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E19E1800B9C;
	Tue, 10 Aug 2021 23:48:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17ANkwFJ000969 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 19:46:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6897E4EEE; Tue, 10 Aug 2021 23:46:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63FE54EF4
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 23:46:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 725BF8CA944
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 23:46:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-48-wlQiNphnNXSpm5wk3desZw-1; 
	Tue, 10 Aug 2021 19:46:53 -0400
X-MC-Unique: wlQiNphnNXSpm5wk3desZw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFEBB60F38;
	Tue, 10 Aug 2021 23:46:51 +0000 (UTC)
Date: Tue, 10 Aug 2021 16:46:51 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210810234651.GK3601443@magnolia>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-13-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210809061244.1196573-13-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 12/30] iomap: switch readahead and
 readpage to use iomap_iter
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 09, 2021 at 08:12:26AM +0200, Christoph Hellwig wrote:
> Switch the page cache read functions to use iomap_iter instead of
> iomap_apply.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks reasonable,
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/iomap/buffered-io.c | 80 +++++++++++++++++++-----------------------
>  1 file changed, 37 insertions(+), 43 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 26e16cc9d44931..9cda461887afad 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -241,11 +241,12 @@ static inline bool iomap_block_needs_zeroing(struct inode *inode,
>  		pos >= i_size_read(inode);
>  }
>  
> -static loff_t
> -iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
> -		struct iomap *iomap, struct iomap *srcmap)
> +static loff_t iomap_readpage_iter(struct iomap_iter *iter,
> +		struct iomap_readpage_ctx *ctx, loff_t offset)
>  {
> -	struct iomap_readpage_ctx *ctx = data;
> +	struct iomap *iomap = &iter->iomap;
> +	loff_t pos = iter->pos + offset;
> +	loff_t length = iomap_length(iter) - offset;
>  	struct page *page = ctx->cur_page;
>  	struct iomap_page *iop;
>  	loff_t orig_pos = pos;
> @@ -253,15 +254,16 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
>  	sector_t sector;
>  
>  	if (iomap->type == IOMAP_INLINE)
> -		return min(iomap_read_inline_data(inode, page, iomap), length);
> +		return min(iomap_read_inline_data(iter->inode, page, iomap),
> +						  length);
>  
>  	/* zero post-eof blocks as the page may be mapped */
> -	iop = iomap_page_create(inode, page);
> -	iomap_adjust_read_range(inode, iop, &pos, length, &poff, &plen);
> +	iop = iomap_page_create(iter->inode, page);
> +	iomap_adjust_read_range(iter->inode, iop, &pos, length, &poff, &plen);
>  	if (plen == 0)
>  		goto done;
>  
> -	if (iomap_block_needs_zeroing(inode, iomap, pos)) {
> +	if (iomap_block_needs_zeroing(iter->inode, iomap, pos)) {
>  		zero_user(page, poff, plen);
>  		iomap_set_range_uptodate(page, poff, plen);
>  		goto done;
> @@ -313,23 +315,23 @@ iomap_readpage_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
>  int
>  iomap_readpage(struct page *page, const struct iomap_ops *ops)
>  {
> -	struct iomap_readpage_ctx ctx = { .cur_page = page };
> -	struct inode *inode = page->mapping->host;
> -	unsigned poff;
> -	loff_t ret;
> +	struct iomap_iter iter = {
> +		.inode		= page->mapping->host,
> +		.pos		= page_offset(page),
> +		.len		= PAGE_SIZE,
> +	};
> +	struct iomap_readpage_ctx ctx = {
> +		.cur_page	= page,
> +	};
> +	int ret;
>  
>  	trace_iomap_readpage(page->mapping->host, 1);
>  
> -	for (poff = 0; poff < PAGE_SIZE; poff += ret) {
> -		ret = iomap_apply(inode, page_offset(page) + poff,
> -				PAGE_SIZE - poff, 0, ops, &ctx,
> -				iomap_readpage_actor);
> -		if (ret <= 0) {
> -			WARN_ON_ONCE(ret == 0);
> -			SetPageError(page);
> -			break;
> -		}
> -	}
> +	while ((ret = iomap_iter(&iter, ops)) > 0)
> +		iter.processed = iomap_readpage_iter(&iter, &ctx, 0);
> +
> +	if (ret < 0)
> +		SetPageError(page);
>  
>  	if (ctx.bio) {
>  		submit_bio(ctx.bio);
> @@ -348,15 +350,14 @@ iomap_readpage(struct page *page, const struct iomap_ops *ops)
>  }
>  EXPORT_SYMBOL_GPL(iomap_readpage);
>  
> -static loff_t
> -iomap_readahead_actor(struct inode *inode, loff_t pos, loff_t length,
> -		void *data, struct iomap *iomap, struct iomap *srcmap)
> +static loff_t iomap_readahead_iter(struct iomap_iter *iter,
> +		struct iomap_readpage_ctx *ctx)
>  {
> -	struct iomap_readpage_ctx *ctx = data;
> +	loff_t length = iomap_length(iter);
>  	loff_t done, ret;
>  
>  	for (done = 0; done < length; done += ret) {
> -		if (ctx->cur_page && offset_in_page(pos + done) == 0) {
> +		if (ctx->cur_page && offset_in_page(iter->pos + done) == 0) {
>  			if (!ctx->cur_page_in_bio)
>  				unlock_page(ctx->cur_page);
>  			put_page(ctx->cur_page);
> @@ -366,8 +367,7 @@ iomap_readahead_actor(struct inode *inode, loff_t pos, loff_t length,
>  			ctx->cur_page = readahead_page(ctx->rac);
>  			ctx->cur_page_in_bio = false;
>  		}
> -		ret = iomap_readpage_actor(inode, pos + done, length - done,
> -				ctx, iomap, srcmap);
> +		ret = iomap_readpage_iter(iter, ctx, done);
>  	}
>  
>  	return done;
> @@ -390,25 +390,19 @@ iomap_readahead_actor(struct inode *inode, loff_t pos, loff_t length,
>   */
>  void iomap_readahead(struct readahead_control *rac, const struct iomap_ops *ops)
>  {
> -	struct inode *inode = rac->mapping->host;
> -	loff_t pos = readahead_pos(rac);
> -	size_t length = readahead_length(rac);
> +	struct iomap_iter iter = {
> +		.inode	= rac->mapping->host,
> +		.pos	= readahead_pos(rac),
> +		.len	= readahead_length(rac),
> +	};
>  	struct iomap_readpage_ctx ctx = {
>  		.rac	= rac,
>  	};
>  
> -	trace_iomap_readahead(inode, readahead_count(rac));
> +	trace_iomap_readahead(rac->mapping->host, readahead_count(rac));
>  
> -	while (length > 0) {
> -		ssize_t ret = iomap_apply(inode, pos, length, 0, ops,
> -				&ctx, iomap_readahead_actor);
> -		if (ret <= 0) {
> -			WARN_ON_ONCE(ret == 0);
> -			break;
> -		}
> -		pos += ret;
> -		length -= ret;
> -	}
> +	while (iomap_iter(&iter, ops) > 0)
> +		iter.processed = iomap_readahead_iter(&iter, &ctx);
>  
>  	if (ctx.bio)
>  		submit_bio(ctx.bio);
> -- 
> 2.30.2
> 

