Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD6E4BDDE
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jun 2019 18:17:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10744BDD1;
	Wed, 19 Jun 2019 16:16:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 907CA60477;
	Wed, 19 Jun 2019 16:16:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 524E23F6E4;
	Wed, 19 Jun 2019 16:16:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5JG2Rl1009650 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 12:02:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5548018828; Wed, 19 Jun 2019 16:02:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C9F660FAB;
	Wed, 19 Jun 2019 16:02:24 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 513DA300194A;
	Wed, 19 Jun 2019 16:01:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 8E0FEAD4C;
	Wed, 19 Jun 2019 16:01:55 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 538551E434D; Wed, 19 Jun 2019 18:01:54 +0200 (CEST)
Date: Wed, 19 Jun 2019 18:01:54 +0200
From: Jan Kara <jack@suse.cz>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190619160154.GA13630@quack2.suse.cz>
References: <20190618144716.8133-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618144716.8133-1-agruenba@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Wed, 19 Jun 2019 16:02:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 19 Jun 2019 16:02:07 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'jack@suse.cz' RCPT:''
X-RedHat-Spam-Score: -2.298  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <jack@suse.cz>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH] fs: Move mark_inode_dirty out of
	__generic_write_end
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 19 Jun 2019 16:17:02 +0000 (UTC)

On Tue 18-06-19 16:47:16, Andreas Gruenbacher wrote:
> Remove the mark_inode_dirty call from __generic_write_end and add it to
> generic_write_end and the high-level iomap functions where necessary.
> That way, large writes will only dirty inodes at the end instead of
> dirtying them once per page.  This fixes a performance bottleneck on
> gfs2.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

So the patch looks correct but honestly I don't like how we duplicate inode
dirtying over several places. I was wondering whether we could not move the
logic to iomap_apply() or something like that.

								Honza

> ---
>  fs/buffer.c | 26 ++++++++++++++++++--------
>  fs/iomap.c  | 42 ++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 56 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index e450c55f6434..1b51003bc9d2 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -2089,8 +2089,7 @@ EXPORT_SYMBOL(block_write_begin);
>  void __generic_write_end(struct inode *inode, loff_t pos, unsigned copied,
>  		struct page *page)
>  {
> -	loff_t old_size = inode->i_size;
> -	bool i_size_changed = false;
> +	loff_t old_size;
>  
>  	/*
>  	 * No need to use i_size_read() here, the i_size cannot change under us
> @@ -2099,23 +2098,21 @@ void __generic_write_end(struct inode *inode, loff_t pos, unsigned copied,
>  	 * But it's important to update i_size while still holding page lock:
>  	 * page writeout could otherwise come in and zero beyond i_size.
>  	 */
> -	if (pos + copied > inode->i_size) {
> +	old_size = inode->i_size;
> +	if (pos + copied > old_size)
>  		i_size_write(inode, pos + copied);
> -		i_size_changed = true;
> -	}
>  
>  	unlock_page(page);
>  
>  	if (old_size < pos)
>  		pagecache_isize_extended(inode, old_size, pos);
> +
>  	/*
>  	 * Don't mark the inode dirty under page lock. First, it unnecessarily
>  	 * makes the holding time of page lock longer. Second, it forces lock
>  	 * ordering of page lock and transaction start for journaling
>  	 * filesystems.
>  	 */
> -	if (i_size_changed)
> -		mark_inode_dirty(inode);
>  }
>  
>  int block_write_end(struct file *file, struct address_space *mapping,
> @@ -2158,9 +2155,22 @@ int generic_write_end(struct file *file, struct address_space *mapping,
>  			loff_t pos, unsigned len, unsigned copied,
>  			struct page *page, void *fsdata)
>  {
> +	struct inode *inode = mapping->host;
> +	loff_t old_size;
> +
> +	/*
> +	 * No need to use i_size_read() here, the i_size cannot change under us
> +	 * because we hold i_rwsem.
> +	 */
> +	old_size = inode->i_size;
> +
>  	copied = block_write_end(file, mapping, pos, len, copied, page, fsdata);
> -	__generic_write_end(mapping->host, pos, copied, page);
> +	__generic_write_end(inode, pos, copied, page);
>  	put_page(page);
> +
> +	if (old_size != inode->i_size)
> +		mark_inode_dirty(inode);
> +
>  	return copied;
>  }
>  EXPORT_SYMBOL(generic_write_end);
> diff --git a/fs/iomap.c b/fs/iomap.c
> index 23ef63fd1669..9454568a7f5e 100644
> --- a/fs/iomap.c
> +++ b/fs/iomap.c
> @@ -881,6 +881,13 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *iter,
>  {
>  	struct inode *inode = iocb->ki_filp->f_mapping->host;
>  	loff_t pos = iocb->ki_pos, ret = 0, written = 0;
> +	loff_t old_size;
> +
> +        /*
> +	 * No need to use i_size_read() here, the i_size cannot change under us
> +	 * because we hold i_rwsem.
> +	 */
> +	old_size = inode->i_size;
>  
>  	while (iov_iter_count(iter)) {
>  		ret = iomap_apply(inode, pos, iov_iter_count(iter),
> @@ -891,6 +898,9 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *iter,
>  		written += ret;
>  	}
>  
> +	if (old_size != inode->i_size)
> +		mark_inode_dirty(inode);
> +
>  	return written ? written : ret;
>  }
>  EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
> @@ -961,18 +971,30 @@ int
>  iomap_file_dirty(struct inode *inode, loff_t pos, loff_t len,
>  		const struct iomap_ops *ops)
>  {
> +	loff_t old_size;
>  	loff_t ret;
>  
> +        /*
> +	 * No need to use i_size_read() here, the i_size cannot change under us
> +	 * because we hold i_rwsem.
> +	 */
> +	old_size = inode->i_size;
> +
>  	while (len) {
>  		ret = iomap_apply(inode, pos, len, IOMAP_WRITE, ops, NULL,
>  				iomap_dirty_actor);
>  		if (ret <= 0)
> -			return ret;
> +			goto out;
>  		pos += ret;
>  		len -= ret;
>  	}
> +	ret = 0;
>  
> -	return 0;
> +out:
> +	if (old_size != inode->i_size)
> +		mark_inode_dirty(inode);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(iomap_file_dirty);
>  
> @@ -1039,19 +1061,31 @@ int
>  iomap_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
>  		const struct iomap_ops *ops)
>  {
> +	loff_t old_size;
>  	loff_t ret;
>  
> +        /*
> +	 * No need to use i_size_read() here, the i_size cannot change under us
> +	 * because we hold i_rwsem.
> +	 */
> +	old_size = inode->i_size;
> +
>  	while (len > 0) {
>  		ret = iomap_apply(inode, pos, len, IOMAP_ZERO,
>  				ops, did_zero, iomap_zero_range_actor);
>  		if (ret <= 0)
> -			return ret;
> +			goto out;
>  
>  		pos += ret;
>  		len -= ret;
>  	}
> +	ret = 0;
>  
> -	return 0;
> +out:
> +	if (old_size != inode->i_size)
> +		mark_inode_dirty(inode);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(iomap_zero_range);
>  
> -- 
> 2.20.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

