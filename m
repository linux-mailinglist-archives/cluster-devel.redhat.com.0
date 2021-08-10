Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBF83E86ED
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Aug 2021 02:03:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-RlBY4eZkNVShSj4_8yM-gg-1; Tue, 10 Aug 2021 20:02:58 -0400
X-MC-Unique: RlBY4eZkNVShSj4_8yM-gg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB73E1008064;
	Wed, 11 Aug 2021 00:02:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 933772855C;
	Wed, 11 Aug 2021 00:02:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57249181A0F1;
	Wed, 11 Aug 2021 00:02:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17ANx58j001836 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 19:59:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EBDE3204402D; Tue, 10 Aug 2021 23:59:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6A2B2044031
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 23:59:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83BD480158D
	for <cluster-devel@redhat.com>; Tue, 10 Aug 2021 23:59:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-21-RpmPxABHPVaEuBxyms0XQA-1; 
	Tue, 10 Aug 2021 19:58:57 -0400
X-MC-Unique: RpmPxABHPVaEuBxyms0XQA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3221D60F94;
	Tue, 10 Aug 2021 23:58:56 +0000 (UTC)
Date: Tue, 10 Aug 2021 16:58:55 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210810235855.GO3601443@magnolia>
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-17-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210809061244.1196573-17-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 16/30] iomap: switch iomap_page_mkwrite
	to use iomap_iter
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 09, 2021 at 08:12:30AM +0200, Christoph Hellwig wrote:
> Switch iomap_page_mkwrite to use iomap_iter.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/iomap/buffered-io.c | 39 +++++++++++++++++----------------------
>  1 file changed, 17 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 3a23f7346938fb..5ab464937d4886 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -961,15 +961,15 @@ iomap_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
>  }
>  EXPORT_SYMBOL_GPL(iomap_truncate_page);
>  
> -static loff_t
> -iomap_page_mkwrite_actor(struct inode *inode, loff_t pos, loff_t length,
> -		void *data, struct iomap *iomap, struct iomap *srcmap)
> +static loff_t iomap_page_mkwrite_iter(struct iomap_iter *iter,
> +		struct page *page)
>  {
> -	struct page *page = data;
> +	loff_t length = iomap_length(iter);
>  	int ret;
>  
> -	if (iomap->flags & IOMAP_F_BUFFER_HEAD) {
> -		ret = __block_write_begin_int(page, pos, length, NULL, iomap);
> +	if (iter->iomap.flags & IOMAP_F_BUFFER_HEAD) {
> +		ret = __block_write_begin_int(page, iter->pos, length, NULL,
> +					      &iter->iomap);
>  		if (ret)
>  			return ret;
>  		block_commit_write(page, 0, length);
> @@ -983,29 +983,24 @@ iomap_page_mkwrite_actor(struct inode *inode, loff_t pos, loff_t length,
>  
>  vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, const struct iomap_ops *ops)
>  {
> +	struct iomap_iter iter = {
> +		.inode		= file_inode(vmf->vma->vm_file),
> +		.flags		= IOMAP_WRITE | IOMAP_FAULT,
> +	};
>  	struct page *page = vmf->page;
> -	struct inode *inode = file_inode(vmf->vma->vm_file);
> -	unsigned long length;
> -	loff_t offset;
>  	ssize_t ret;
>  
>  	lock_page(page);
> -	ret = page_mkwrite_check_truncate(page, inode);
> +	ret = page_mkwrite_check_truncate(page, iter.inode);
>  	if (ret < 0)
>  		goto out_unlock;
> -	length = ret;
> -
> -	offset = page_offset(page);
> -	while (length > 0) {
> -		ret = iomap_apply(inode, offset, length,
> -				IOMAP_WRITE | IOMAP_FAULT, ops, page,
> -				iomap_page_mkwrite_actor);
> -		if (unlikely(ret <= 0))
> -			goto out_unlock;
> -		offset += ret;
> -		length -= ret;
> -	}
> +	iter.pos = page_offset(page);
> +	iter.len = ret;
> +	while ((ret = iomap_iter(&iter, ops)) > 0)
> +		iter.processed = iomap_page_mkwrite_iter(&iter, page);
>  
> +	if (ret < 0)
> +		goto out_unlock;
>  	wait_for_stable_page(page);
>  	return VM_FAULT_LOCKED;
>  out_unlock:
> -- 
> 2.30.2
> 

