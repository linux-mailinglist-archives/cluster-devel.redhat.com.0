Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 66FFF3CE8EE
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 19:44:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-lTQsfKEEP7GpF_yoosdzjg-1; Mon, 19 Jul 2021 13:44:15 -0400
X-MC-Unique: lTQsfKEEP7GpF_yoosdzjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 923B518414A2;
	Mon, 19 Jul 2021 17:44:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 835D25D9F0;
	Mon, 19 Jul 2021 17:44:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6728C1809C99;
	Mon, 19 Jul 2021 17:44:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JHiBkO008026 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 13:44:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5DAEF21449BE; Mon, 19 Jul 2021 17:44:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5650721449C8
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 17:44:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9E1F80234F
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 17:44:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-369-gUcuyGRhMhuHHLvID9uVow-1;
	Mon, 19 Jul 2021 13:44:05 -0400
X-MC-Unique: gUcuyGRhMhuHHLvID9uVow-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25B0B6113A;
	Mon, 19 Jul 2021 17:44:04 +0000 (UTC)
Date: Mon, 19 Jul 2021 10:44:03 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210719174403.GI22357@magnolia>
References: <20210719103520.495450-1-hch@lst.de>
	<20210719103520.495450-28-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210719103520.495450-28-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 27/27] iomap: constify iomap_iter_srcmap
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 19, 2021 at 12:35:20PM +0200, Christoph Hellwig wrote:
> The srcmap returned from iomap_iter_srcmap is never modified, so mark
> the iomap returned from it const and constify a lot of code that never
> modifies the iomap.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

LGTM!
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/iomap/buffered-io.c | 32 ++++++++++++++++----------------
>  include/linux/iomap.h  |  2 +-
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index eb5d742b5bf8b7..a2dd42f3115cfa 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -226,20 +226,20 @@ iomap_read_inline_data(struct inode *inode, struct page *page,
>  	SetPageUptodate(page);
>  }
>  
> -static inline bool iomap_block_needs_zeroing(struct iomap_iter *iter,
> +static inline bool iomap_block_needs_zeroing(const struct iomap_iter *iter,
>  		loff_t pos)
>  {
> -	struct iomap *srcmap = iomap_iter_srcmap(iter);
> +	const struct iomap *srcmap = iomap_iter_srcmap(iter);
>  
>  	return srcmap->type != IOMAP_MAPPED ||
>  		(srcmap->flags & IOMAP_F_NEW) ||
>  		pos >= i_size_read(iter->inode);
>  }
>  
> -static loff_t iomap_readpage_iter(struct iomap_iter *iter,
> +static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
>  		struct iomap_readpage_ctx *ctx, loff_t offset)
>  {
> -	struct iomap *iomap = &iter->iomap;
> +	const struct iomap *iomap = &iter->iomap;
>  	loff_t pos = iter->pos + offset;
>  	loff_t length = iomap_length(iter) - offset;
>  	struct page *page = ctx->cur_page;
> @@ -355,7 +355,7 @@ iomap_readpage(struct page *page, const struct iomap_ops *ops)
>  }
>  EXPORT_SYMBOL_GPL(iomap_readpage);
>  
> -static loff_t iomap_readahead_iter(struct iomap_iter *iter,
> +static loff_t iomap_readahead_iter(const struct iomap_iter *iter,
>  		struct iomap_readpage_ctx *ctx)
>  {
>  	loff_t length = iomap_length(iter);
> @@ -539,10 +539,10 @@ iomap_read_page_sync(loff_t block_start, struct page *page, unsigned poff,
>  	return submit_bio_wait(&bio);
>  }
>  
> -static int __iomap_write_begin(struct iomap_iter *iter, loff_t pos,
> +static int __iomap_write_begin(const struct iomap_iter *iter, loff_t pos,
>  		unsigned len, struct page *page)
>  {
> -	struct iomap *srcmap = iomap_iter_srcmap(iter);
> +	const struct iomap *srcmap = iomap_iter_srcmap(iter);
>  	struct iomap_page *iop = iomap_page_create(iter->inode, page);
>  	loff_t block_size = i_blocksize(iter->inode);
>  	loff_t block_start = round_down(pos, block_size);
> @@ -580,11 +580,11 @@ static int __iomap_write_begin(struct iomap_iter *iter, loff_t pos,
>  	return 0;
>  }
>  
> -static int iomap_write_begin(struct iomap_iter *iter, loff_t pos, unsigned len,
> -		struct page **pagep)
> +static int iomap_write_begin(const struct iomap_iter *iter, loff_t pos,
> +		unsigned len, struct page **pagep)
>  {
>  	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
> -	struct iomap *srcmap = iomap_iter_srcmap(iter);
> +	const struct iomap *srcmap = iomap_iter_srcmap(iter);
>  	struct page *page;
>  	int status = 0;
>  
> @@ -655,10 +655,10 @@ static size_t __iomap_write_end(struct inode *inode, loff_t pos, size_t len,
>  	return copied;
>  }
>  
> -static size_t iomap_write_end_inline(struct iomap_iter *iter, struct page *page,
> -		loff_t pos, size_t copied)
> +static size_t iomap_write_end_inline(const struct iomap_iter *iter,
> +		struct page *page, loff_t pos, size_t copied)
>  {
> -	struct iomap *iomap = &iter->iomap;
> +	const struct iomap *iomap = &iter->iomap;
>  	void *addr;
>  
>  	WARN_ON_ONCE(!PageUptodate(page));
> @@ -678,7 +678,7 @@ static size_t iomap_write_end(struct iomap_iter *iter, loff_t pos, size_t len,
>  		size_t copied, struct page *page)
>  {
>  	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
> -	struct iomap *srcmap = iomap_iter_srcmap(iter);
> +	const struct iomap *srcmap = iomap_iter_srcmap(iter);
>  	loff_t old_size = iter->inode->i_size;
>  	size_t ret;
>  
> @@ -803,7 +803,7 @@ EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
>  static loff_t iomap_unshare_iter(struct iomap_iter *iter)
>  {
>  	struct iomap *iomap = &iter->iomap;
> -	struct iomap *srcmap = iomap_iter_srcmap(iter);
> +	const struct iomap *srcmap = iomap_iter_srcmap(iter);
>  	loff_t pos = iter->pos;
>  	loff_t length = iomap_length(iter);
>  	long status = 0;
> @@ -879,7 +879,7 @@ static s64 __iomap_zero_iter(struct iomap_iter *iter, loff_t pos, u64 length)
>  static loff_t iomap_zero_iter(struct iomap_iter *iter, bool *did_zero)
>  {
>  	struct iomap *iomap = &iter->iomap;
> -	struct iomap *srcmap = iomap_iter_srcmap(iter);
> +	const struct iomap *srcmap = iomap_iter_srcmap(iter);
>  	loff_t pos = iter->pos;
>  	loff_t length = iomap_length(iter);
>  	loff_t written = 0;
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index 719798814bdfdb..a1fb0d22efbd40 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -193,7 +193,7 @@ static inline u64 iomap_length(const struct iomap_iter *iter)
>   * for a given operation, which may or may no be identical to the destination
>   * map in &i->iomap.
>   */
> -static inline struct iomap *iomap_iter_srcmap(struct iomap_iter *i)
> +static inline const struct iomap *iomap_iter_srcmap(const struct iomap_iter *i)
>  {
>  	if (i->srcmap.type != IOMAP_HOLE)
>  		return &i->srcmap;
> -- 
> 2.30.2
> 

