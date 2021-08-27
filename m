Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 44FC83FB6CA
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Aug 2021 15:16:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-mBZHmU2qPMmxL5WjU4Kk1Q-1; Mon, 30 Aug 2021 09:15:58 -0400
X-MC-Unique: mBZHmU2qPMmxL5WjU4Kk1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59504107ACF5;
	Mon, 30 Aug 2021 13:15:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF3C05C1D5;
	Mon, 30 Aug 2021 13:15:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCEBE4A7C8;
	Mon, 30 Aug 2021 13:15:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RKuspc026562 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 16:56:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 760DE2167806; Fri, 27 Aug 2021 20:56:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70F0321677E7
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 20:56:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8665101A52C
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 20:56:51 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-146-Y_J6zsyxOf-HOzfefav3Cg-1; Fri, 27 Aug 2021 16:56:49 -0400
X-MC-Unique: Y_J6zsyxOf-HOzfefav3Cg-1
Received: by mail-lj1-f174.google.com with SMTP id f2so13694379ljn.1;
	Fri, 27 Aug 2021 13:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=D1T7WfWNcvzH9Rk51aqcudHNYK1tsZ5bySC0AdDjdzY=;
	b=DCnDBCEbOIFNVwogZ4q/tCXNY1pQqo9cw7yZugrE1fNC+7JUvwJJSa78LG1NGKl5nW
	6acPKOlyvVtvaaBuvpbSkQyG9tjOeEloZPPtW21MKpJrm1ArppHj7CeaFZUVEKn5UdVF
	EyJXgmwds73Mmqg82RGPe+Viyav1zGm0KqUsMUpjZcqFS7R72ltFqR4rQ1dM/bywiTkh
	Zg8KJS+ljA2Ih1uummCCH7x328JLG7zk+IfAefqs5gHfipQWvurwBXjQ+dTkkKBkD44Q
	OmmlT4E64oOwVPLXyZohvnPx6Py7VR9vX/sEVPQ37/PKoEAMpmRoUKOBEErNlUtgiMfJ
	sF9g==
X-Gm-Message-State: AOAM533LVDqolGgG9aiE3fH3Af9Qz3cr2NCoi7jgaC6UJ6eCj7RwZApy
	JpWFrU24wMpMePMhRb78mz8Cc10xrK9PVA==
X-Google-Smtp-Source: ABdhPJwCJ2OaAUF4gAyq/jrqfb/W8br/EFdiBn99hCJwKvuif4qcT7IwmOBkVG9J+AGjgGor/tS0Ow==
X-Received: by 2002:a2e:bc1a:: with SMTP id b26mr9289762ljf.218.1630097807229; 
	Fri, 27 Aug 2021 13:56:47 -0700 (PDT)
Received: from kari-VirtualBox (87-95-21-3.bb.dnainternet.fi. [87.95.21.3])
	by smtp.gmail.com with ESMTPSA id f9sm687906lfg.143.2021.08.27.13.56.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Aug 2021 13:56:46 -0700 (PDT)
Date: Fri, 27 Aug 2021 23:56:44 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Message-ID: <20210827205644.lkihrypv27er5km3@kari-VirtualBox>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-5-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210827164926.1726765-5-agruenba@redhat.com>
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
X-Mailman-Approved-At: Mon, 30 Aug 2021 09:15:50 -0400
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 04/19] iov_iter: Turn
 iov_iter_fault_in_readable into fault_in_iov_iter_readable
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 27, 2021 at 06:49:11PM +0200, Andreas Gruenbacher wrote:
> Turn iov_iter_fault_in_readable into a function that returns the number
> of bytes not faulted in (similar to copy_to_user) instead of returning a
> non-zero value when any of the requested pages couldn't be faulted in.
> This supports the existing users that require all pages to be faulted in
> as well as new users that are happy if any pages can be faulted in at
> all.
> 
> Rename iov_iter_fault_in_readable to fault_in_iov_iter_readable to make
> sure that this change doesn't silently break things.

At least this patch will break ntfs3 which is in next. It has been there
just couple weeks so I understand. I added Konstantin and ntfs3 list so
that we know what is going on. Can you please info if and when do we
need rebase.

We are in situation that ntfs3 might get in 5.15, but it is uncertain so
it would be best that we solve this. Just info is enough.

Argillander

> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/btrfs/file.c        |  2 +-
>  fs/f2fs/file.c         |  2 +-
>  fs/fuse/file.c         |  2 +-
>  fs/iomap/buffered-io.c |  2 +-
>  fs/ntfs/file.c         |  2 +-
>  include/linux/uio.h    |  2 +-
>  lib/iov_iter.c         | 33 +++++++++++++++++++++------------
>  mm/filemap.c           |  2 +-
>  8 files changed, 28 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
> index ee34497500e1..281c77cfe91a 100644
> --- a/fs/btrfs/file.c
> +++ b/fs/btrfs/file.c
> @@ -1698,7 +1698,7 @@ static noinline ssize_t btrfs_buffered_write(struct kiocb *iocb,
>  		 * Fault pages before locking them in prepare_pages
>  		 * to avoid recursive lock
>  		 */
> -		if (unlikely(iov_iter_fault_in_readable(i, write_bytes))) {
> +		if (unlikely(fault_in_iov_iter_readable(i, write_bytes))) {
>  			ret = -EFAULT;
>  			break;
>  		}
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6afd4562335f..b04b6c909a8b 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4259,7 +4259,7 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		size_t target_size = 0;
>  		int err;
>  
> -		if (iov_iter_fault_in_readable(from, iov_iter_count(from)))
> +		if (fault_in_iov_iter_readable(from, iov_iter_count(from)))
>  			set_inode_flag(inode, FI_NO_PREALLOC);
>  
>  		if ((iocb->ki_flags & IOCB_NOWAIT)) {
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 97f860cfc195..da49ef71dab5 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -1160,7 +1160,7 @@ static ssize_t fuse_fill_write_pages(struct fuse_io_args *ia,
>  
>   again:
>  		err = -EFAULT;
> -		if (iov_iter_fault_in_readable(ii, bytes))
> +		if (fault_in_iov_iter_readable(ii, bytes))
>  			break;
>  
>  		err = -ENOMEM;
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 87ccb3438bec..7dc42dd3a724 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -749,7 +749,7 @@ iomap_write_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
>  		 * same page as we're writing to, without it being marked
>  		 * up-to-date.
>  		 */
> -		if (unlikely(iov_iter_fault_in_readable(i, bytes))) {
> +		if (unlikely(fault_in_iov_iter_readable(i, bytes))) {
>  			status = -EFAULT;
>  			break;
>  		}
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index ab4f3362466d..a43adeacd930 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -1829,7 +1829,7 @@ static ssize_t ntfs_perform_write(struct file *file, struct iov_iter *i,
>  		 * pages being swapped out between us bringing them into memory
>  		 * and doing the actual copying.
>  		 */
> -		if (unlikely(iov_iter_fault_in_readable(i, bytes))) {
> +		if (unlikely(fault_in_iov_iter_readable(i, bytes))) {
>  			status = -EFAULT;
>  			break;
>  		}
> diff --git a/include/linux/uio.h b/include/linux/uio.h
> index 82c3c3e819e0..12d30246c2e9 100644
> --- a/include/linux/uio.h
> +++ b/include/linux/uio.h
> @@ -119,7 +119,7 @@ size_t copy_page_from_iter_atomic(struct page *page, unsigned offset,
>  				  size_t bytes, struct iov_iter *i);
>  void iov_iter_advance(struct iov_iter *i, size_t bytes);
>  void iov_iter_revert(struct iov_iter *i, size_t bytes);
> -int iov_iter_fault_in_readable(const struct iov_iter *i, size_t bytes);
> +size_t fault_in_iov_iter_readable(const struct iov_iter *i, size_t bytes);
>  size_t iov_iter_single_seg_count(const struct iov_iter *i);
>  size_t copy_page_to_iter(struct page *page, size_t offset, size_t bytes,
>  			 struct iov_iter *i);
> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> index 069cedd9d7b4..082ab155496d 100644
> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@ -430,33 +430,42 @@ static size_t copy_page_to_iter_pipe(struct page *page, size_t offset, size_t by
>  }
>  
>  /*
> + * fault_in_iov_iter_readable - fault in iov iterator for reading
> + * @i: iterator
> + * @size: maximum length
> + *
>   * Fault in one or more iovecs of the given iov_iter, to a maximum length of
> - * bytes.  For each iovec, fault in each page that constitutes the iovec.
> + * @size.  For each iovec, fault in each page that constitutes the iovec.
> + *
> + * Returns the number of bytes not faulted in (like copy_to_user() and
> + * copy_from_user()).
>   *
> - * Return 0 on success, or non-zero if the memory could not be accessed (i.e.
> - * because it is an invalid address).
> + * Always returns 0 for non-userspace iterators.
>   */
> -int iov_iter_fault_in_readable(const struct iov_iter *i, size_t bytes)
> +size_t fault_in_iov_iter_readable(const struct iov_iter *i, size_t size)
>  {
>  	if (iter_is_iovec(i)) {
> +		size_t count = min(size, iov_iter_count(i));
>  		const struct iovec *p;
>  		size_t skip;
>  
> -		if (bytes > i->count)
> -			bytes = i->count;
> -		for (p = i->iov, skip = i->iov_offset; bytes; p++, skip = 0) {
> -			size_t len = min(bytes, p->iov_len - skip);
> +		size -= count;
> +		for (p = i->iov, skip = i->iov_offset; count; p++, skip = 0) {
> +			size_t len = min(count, p->iov_len - skip);
> +			size_t ret;
>  
>  			if (unlikely(!len))
>  				continue;
> -			if (fault_in_readable(p->iov_base + skip, len))
> -				return -EFAULT;
> -			bytes -= len;
> +			ret = fault_in_readable(p->iov_base + skip, len);
> +			count -= len - ret;
> +			if (ret)
> +				break;
>  		}
> +		return count + size;
>  	}
>  	return 0;
>  }
> -EXPORT_SYMBOL(iov_iter_fault_in_readable);
> +EXPORT_SYMBOL(fault_in_iov_iter_readable);
>  
>  void iov_iter_init(struct iov_iter *i, unsigned int direction,
>  			const struct iovec *iov, unsigned long nr_segs,
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 4dec3bc7752e..83af8a534339 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3643,7 +3643,7 @@ ssize_t generic_perform_write(struct file *file,
>  		 * same page as we're writing to, without it being marked
>  		 * up-to-date.
>  		 */
> -		if (unlikely(iov_iter_fault_in_readable(i, bytes))) {
> +		if (unlikely(fault_in_iov_iter_readable(i, bytes))) {
>  			status = -EFAULT;
>  			break;
>  		}
> -- 
> 2.26.3
> 

