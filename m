Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3B01B3CE8DE
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 19:37:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-LLM-RIicOPGTZk6p1lDqXg-1; Mon, 19 Jul 2021 13:37:21 -0400
X-MC-Unique: LLM-RIicOPGTZk6p1lDqXg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC3F0804142;
	Mon, 19 Jul 2021 17:37:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE43D60938;
	Mon, 19 Jul 2021 17:37:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD8774EA2A;
	Mon, 19 Jul 2021 17:37:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JHZU6g007494 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 13:35:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8D5762023A0F; Mon, 19 Jul 2021 17:35:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 892FE20239FA
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 17:35:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97093802700
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 17:35:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-37-ir-TqDFGNGis_SfsDl-ITQ-1; 
	Mon, 19 Jul 2021 13:35:23 -0400
X-MC-Unique: ir-TqDFGNGis_SfsDl-ITQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3E4B610D2;
	Mon, 19 Jul 2021 17:35:21 +0000 (UTC)
Date: Mon, 19 Jul 2021 10:35:21 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210719173521.GD22357@magnolia>
References: <20210719103520.495450-1-hch@lst.de>
	<20210719103520.495450-5-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210719103520.495450-5-hch@lst.de>
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
Subject: Re: [Cluster-devel] [PATCH 04/27] fs: mark the iomap argument to
 __block_write_begin_int const
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 19, 2021 at 12:34:57PM +0200, Christoph Hellwig wrote:
> __block_write_begin_int never modifies the passed in iomap, so mark it
> const.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks ok,
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/buffer.c   | 4 ++--
>  fs/internal.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index 6290c3afdba488..bd6a9e9fbd64c9 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -1912,7 +1912,7 @@ EXPORT_SYMBOL(page_zero_new_buffers);
>  
>  static void
>  iomap_to_bh(struct inode *inode, sector_t block, struct buffer_head *bh,
> -		struct iomap *iomap)
> +		const struct iomap *iomap)
>  {
>  	loff_t offset = block << inode->i_blkbits;
>  
> @@ -1966,7 +1966,7 @@ iomap_to_bh(struct inode *inode, sector_t block, struct buffer_head *bh,
>  }
>  
>  int __block_write_begin_int(struct page *page, loff_t pos, unsigned len,
> -		get_block_t *get_block, struct iomap *iomap)
> +		get_block_t *get_block, const struct iomap *iomap)
>  {
>  	unsigned from = pos & (PAGE_SIZE - 1);
>  	unsigned to = from + len;
> diff --git a/fs/internal.h b/fs/internal.h
> index 3ce8edbaa3ca2f..9ad6b5157584b8 100644
> --- a/fs/internal.h
> +++ b/fs/internal.h
> @@ -48,8 +48,8 @@ static inline int emergency_thaw_bdev(struct super_block *sb)
>  /*
>   * buffer.c
>   */
> -extern int __block_write_begin_int(struct page *page, loff_t pos, unsigned len,
> -		get_block_t *get_block, struct iomap *iomap);
> +int __block_write_begin_int(struct page *page, loff_t pos, unsigned len,
> +		get_block_t *get_block, const struct iomap *iomap);
>  
>  /*
>   * char_dev.c
> -- 
> 2.30.2
> 

