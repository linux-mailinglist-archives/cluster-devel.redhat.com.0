Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CEB7233ED
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Jun 2023 02:04:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686009869;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=f1c/PGvnM2AArs48812YAruot+zBOAvMou0BFxMQK/0=;
	b=OTgHvmTa+Un81jY3YG8An3rCpU/RtOI1gcrHW545FavKydW4VRBtGKTzcSf4w9bhfuJjOk
	Z/XFh6YLcCmymqd3hxWyF6E3nCEgSEjy03O3Zw0gV4bR9p2vN8+U89DnXfZCs1x/D4cCzg
	e32Q447wiv5zUYTikie3gdh4kjiXa0w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-r1-EF5liN7GEVs3Ad7mShA-1; Mon, 05 Jun 2023 20:04:24 -0400
X-MC-Unique: r1-EF5liN7GEVs3Ad7mShA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 858092A2AD4A;
	Tue,  6 Jun 2023 00:04:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBF392026D49;
	Tue,  6 Jun 2023 00:04:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 74B2F19465BA;
	Tue,  6 Jun 2023 00:04:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A06F81946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 00:04:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8273D1121315; Tue,  6 Jun 2023 00:04:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B6D91121314
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 00:04:20 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 603A6101A531
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 00:04:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-qIfPsAzOPNyCJbfJzCa_cA-1; Mon, 05 Jun 2023 20:04:16 -0400
X-MC-Unique: qIfPsAzOPNyCJbfJzCa_cA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B14F762B4F;
 Tue,  6 Jun 2023 00:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1C3C433D2;
 Tue,  6 Jun 2023 00:04:15 +0000 (UTC)
Date: Mon, 5 Jun 2023 17:04:14 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230606000414.GJ1325469@frogsfrogsfrogs>
References: <20230601145904.1385409-1-hch@lst.de>
 <20230601145904.1385409-10-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230601145904.1385409-10-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH 09/12] fs: factor out a
 direct_write_fallback helper
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
Cc: linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Miklos Szeredi <mszeredi@redhat.com>, Chao Yu <chao@kernel.org>,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 01, 2023 at 04:59:01PM +0200, Christoph Hellwig wrote:
> Add a helper dealing with handling the syncing of a buffered write fallback
> for direct I/O.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> Reviewed-by: Miklos Szeredi <mszeredi@redhat.com>

Looks good to me; whose tree do you want this to go through?

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/libfs.c         | 41 ++++++++++++++++++++++++++++
>  include/linux/fs.h |  2 ++
>  mm/filemap.c       | 66 +++++++++++-----------------------------------
>  3 files changed, 58 insertions(+), 51 deletions(-)
> 
> diff --git a/fs/libfs.c b/fs/libfs.c
> index 89cf614a327158..5b851315eeed03 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1613,3 +1613,44 @@ u64 inode_query_iversion(struct inode *inode)
>  	return cur >> I_VERSION_QUERIED_SHIFT;
>  }
>  EXPORT_SYMBOL(inode_query_iversion);
> +
> +ssize_t direct_write_fallback(struct kiocb *iocb, struct iov_iter *iter,
> +		ssize_t direct_written, ssize_t buffered_written)
> +{
> +	struct address_space *mapping = iocb->ki_filp->f_mapping;
> +	loff_t pos = iocb->ki_pos - buffered_written;
> +	loff_t end = iocb->ki_pos - 1;
> +	int err;
> +
> +	/*
> +	 * If the buffered write fallback returned an error, we want to return
> +	 * the number of bytes which were written by direct I/O, or the error
> +	 * code if that was zero.
> +	 *
> +	 * Note that this differs from normal direct-io semantics, which will
> +	 * return -EFOO even if some bytes were written.
> +	 */
> +	if (unlikely(buffered_written < 0)) {
> +		if (direct_written)
> +			return direct_written;
> +		return buffered_written;
> +	}
> +
> +	/*
> +	 * We need to ensure that the page cache pages are written to disk and
> +	 * invalidated to preserve the expected O_DIRECT semantics.
> +	 */
> +	err = filemap_write_and_wait_range(mapping, pos, end);
> +	if (err < 0) {
> +		/*
> +		 * We don't know how much we wrote, so just return the number of
> +		 * bytes which were direct-written
> +		 */
> +		if (direct_written)
> +			return direct_written;
> +		return err;
> +	}
> +	invalidate_mapping_pages(mapping, pos >> PAGE_SHIFT, end >> PAGE_SHIFT);
> +	return direct_written + buffered_written;
> +}
> +EXPORT_SYMBOL_GPL(direct_write_fallback);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 91021b4e1f6f48..6af25137543824 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2738,6 +2738,8 @@ extern ssize_t __generic_file_write_iter(struct kiocb *, struct iov_iter *);
>  extern ssize_t generic_file_write_iter(struct kiocb *, struct iov_iter *);
>  extern ssize_t generic_file_direct_write(struct kiocb *, struct iov_iter *);
>  ssize_t generic_perform_write(struct kiocb *, struct iov_iter *);
> +ssize_t direct_write_fallback(struct kiocb *iocb, struct iov_iter *iter,
> +		ssize_t direct_written, ssize_t buffered_written);
>  
>  ssize_t vfs_iter_read(struct file *file, struct iov_iter *iter, loff_t *ppos,
>  		rwf_t flags);
> diff --git a/mm/filemap.c b/mm/filemap.c
> index ddb6f8aa86d6ca..137508da5525b6 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -4006,23 +4006,19 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  {
>  	struct file *file = iocb->ki_filp;
>  	struct address_space *mapping = file->f_mapping;
> -	struct inode 	*inode = mapping->host;
> -	ssize_t		written = 0;
> -	ssize_t		err;
> -	ssize_t		status;
> +	struct inode *inode = mapping->host;
> +	ssize_t ret;
>  
> -	err = file_remove_privs(file);
> -	if (err)
> -		goto out;
> +	ret = file_remove_privs(file);
> +	if (ret)
> +		return ret;
>  
> -	err = file_update_time(file);
> -	if (err)
> -		goto out;
> +	ret = file_update_time(file);
> +	if (ret)
> +		return ret;
>  
>  	if (iocb->ki_flags & IOCB_DIRECT) {
> -		loff_t pos, endbyte;
> -
> -		written = generic_file_direct_write(iocb, from);
> +		ret = generic_file_direct_write(iocb, from);
>  		/*
>  		 * If the write stopped short of completing, fall back to
>  		 * buffered writes.  Some filesystems do this for writes to
> @@ -4030,45 +4026,13 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		 * not succeed (even if it did, DAX does not handle dirty
>  		 * page-cache pages correctly).
>  		 */
> -		if (written < 0 || !iov_iter_count(from) || IS_DAX(inode))
> -			goto out;
> -
> -		pos = iocb->ki_pos;
> -		status = generic_perform_write(iocb, from);
> -		/*
> -		 * If generic_perform_write() returned a synchronous error
> -		 * then we want to return the number of bytes which were
> -		 * direct-written, or the error code if that was zero.  Note
> -		 * that this differs from normal direct-io semantics, which
> -		 * will return -EFOO even if some bytes were written.
> -		 */
> -		if (unlikely(status < 0)) {
> -			err = status;
> -			goto out;
> -		}
> -		/*
> -		 * We need to ensure that the page cache pages are written to
> -		 * disk and invalidated to preserve the expected O_DIRECT
> -		 * semantics.
> -		 */
> -		endbyte = pos + status - 1;
> -		err = filemap_write_and_wait_range(mapping, pos, endbyte);
> -		if (err == 0) {
> -			written += status;
> -			invalidate_mapping_pages(mapping,
> -						 pos >> PAGE_SHIFT,
> -						 endbyte >> PAGE_SHIFT);
> -		} else {
> -			/*
> -			 * We don't know how much we wrote, so just return
> -			 * the number of bytes which were direct-written
> -			 */
> -		}
> -	} else {
> -		written = generic_perform_write(iocb, from);
> +		if (ret < 0 || !iov_iter_count(from) || IS_DAX(inode))
> +			return ret;
> +		return direct_write_fallback(iocb, from, ret,
> +				generic_perform_write(iocb, from));
>  	}
> -out:
> -	return written ? written : err;
> +
> +	return generic_perform_write(iocb, from);
>  }
>  EXPORT_SYMBOL(__generic_file_write_iter);
>  
> -- 
> 2.39.2
> 

