Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 459723CE091
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Jul 2021 18:04:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-rQ5V7VskM1G-YIprqrJ47w-1; Mon, 19 Jul 2021 12:04:31 -0400
X-MC-Unique: rQ5V7VskM1G-YIprqrJ47w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13BA850764;
	Mon, 19 Jul 2021 16:04:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0105926FD8;
	Mon, 19 Jul 2021 16:04:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C98E01809C99;
	Mon, 19 Jul 2021 16:04:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JG4Q9B000379 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 12:04:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C8F92144B4E; Mon, 19 Jul 2021 16:04:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5871A2144B4C
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 16:04:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53D7B18A6535
	for <cluster-devel@redhat.com>; Mon, 19 Jul 2021 16:04:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-279-U7HxRM0ONQmIm5P31HDl-g-1;
	Mon, 19 Jul 2021 12:04:20 -0400
X-MC-Unique: U7HxRM0ONQmIm5P31HDl-g-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9691F61166;
	Mon, 19 Jul 2021 16:04:19 +0000 (UTC)
Date: Mon, 19 Jul 2021 09:04:19 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210719160419.GD22402@magnolia>
References: <20210719103520.495450-1-hch@lst.de>
	<20210719103520.495450-3-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210719103520.495450-3-hch@lst.de>
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
Subject: Re: [Cluster-devel] [PATCH 02/27] iomap: remove the iomap arguments
 to ->page_{prepare, done}
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

On Mon, Jul 19, 2021 at 12:34:55PM +0200, Christoph Hellwig wrote:
> These aren't actually used by the only instance implementing the methods.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

/me finds it kind of amusing that we still don't have any ->page_prepare
use cases for actually passing the page in, but if nobody /else/ has any
objection or imminently wants to use the iomap argument, then...

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/gfs2/bmap.c         | 5 ++---
>  fs/iomap/buffered-io.c | 6 +++---
>  include/linux/iomap.h  | 5 ++---
>  3 files changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index ed8b67b2171817..5414c2c3358092 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -1002,7 +1002,7 @@ static void gfs2_write_unlock(struct inode *inode)
>  }
>  
>  static int gfs2_iomap_page_prepare(struct inode *inode, loff_t pos,
> -				   unsigned len, struct iomap *iomap)
> +				   unsigned len)
>  {
>  	unsigned int blockmask = i_blocksize(inode) - 1;
>  	struct gfs2_sbd *sdp = GFS2_SB(inode);
> @@ -1013,8 +1013,7 @@ static int gfs2_iomap_page_prepare(struct inode *inode, loff_t pos,
>  }
>  
>  static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
> -				 unsigned copied, struct page *page,
> -				 struct iomap *iomap)
> +				 unsigned copied, struct page *page)
>  {
>  	struct gfs2_trans *tr = current->journal_info;
>  	struct gfs2_inode *ip = GFS2_I(inode);
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 87ccb3438becd9..75310f6fcf8401 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -605,7 +605,7 @@ iomap_write_begin(struct inode *inode, loff_t pos, unsigned len, unsigned flags,
>  		return -EINTR;
>  
>  	if (page_ops && page_ops->page_prepare) {
> -		status = page_ops->page_prepare(inode, pos, len, iomap);
> +		status = page_ops->page_prepare(inode, pos, len);
>  		if (status)
>  			return status;
>  	}
> @@ -638,7 +638,7 @@ iomap_write_begin(struct inode *inode, loff_t pos, unsigned len, unsigned flags,
>  
>  out_no_page:
>  	if (page_ops && page_ops->page_done)
> -		page_ops->page_done(inode, pos, 0, NULL, iomap);
> +		page_ops->page_done(inode, pos, 0, NULL);
>  	return status;
>  }
>  
> @@ -714,7 +714,7 @@ static size_t iomap_write_end(struct inode *inode, loff_t pos, size_t len,
>  	if (old_size < pos)
>  		pagecache_isize_extended(inode, old_size, pos);
>  	if (page_ops && page_ops->page_done)
> -		page_ops->page_done(inode, pos, ret, page, iomap);
> +		page_ops->page_done(inode, pos, ret, page);
>  	put_page(page);
>  
>  	if (ret < len)
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index 479c1da3e2211e..093519d91cc9cc 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -108,10 +108,9 @@ iomap_sector(struct iomap *iomap, loff_t pos)
>   * associated page could not be obtained.
>   */
>  struct iomap_page_ops {
> -	int (*page_prepare)(struct inode *inode, loff_t pos, unsigned len,
> -			struct iomap *iomap);
> +	int (*page_prepare)(struct inode *inode, loff_t pos, unsigned len);
>  	void (*page_done)(struct inode *inode, loff_t pos, unsigned copied,
> -			struct page *page, struct iomap *iomap);
> +			struct page *page);
>  };
>  
>  /*
> -- 
> 2.30.2
> 

