Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD1B20082D
	for <lists+cluster-devel@lfdr.de>; Fri, 19 Jun 2020 13:56:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592567781;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qkiSuMBHq1jJPg79H69BLQzOTNgh3NSXy1sjSUD7sso=;
	b=Ck++Q0xxfWG9ZSby6tVJfCHgxaFRoBL38nqTeTa6WJ4OFRYejM4Q+6r6d41RuC55R1nx7m
	DUe46+TzXUPLYuFrKXePuqhdWxOidzcooU73odUDuKeT1TTvAu4SLmMgH1k1I3KOcw5/29
	oXDM0ugMczKtCcoGV7cxuiYiQZr27os=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-Y9AmEfVSNOS7AlNqi7rPJA-1; Fri, 19 Jun 2020 07:56:19 -0400
X-MC-Unique: Y9AmEfVSNOS7AlNqi7rPJA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14C36108BD0E;
	Fri, 19 Jun 2020 11:56:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E02385BAC3;
	Fri, 19 Jun 2020 11:56:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5050AB34BE;
	Fri, 19 Jun 2020 11:56:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JBu8Mn023067 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 07:56:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C43392017F0C; Fri, 19 Jun 2020 11:56:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C019D202683E
	for <cluster-devel@redhat.com>; Fri, 19 Jun 2020 11:56:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A954F81DA26
	for <cluster-devel@redhat.com>; Fri, 19 Jun 2020 11:56:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-303-6uXcdhxDMJCgUZscAlztoA-1; Fri, 19 Jun 2020 07:56:03 -0400
X-MC-Unique: 6uXcdhxDMJCgUZscAlztoA-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jmFcc-0002c8-O0; Fri, 19 Jun 2020 11:55:50 +0000
Date: Fri, 19 Jun 2020 04:55:50 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20200619115550.GY8681@bombadil.infradead.org>
References: <20200619093916.1081129-1-agruenba@redhat.com>
	<20200619093916.1081129-3-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200619093916.1081129-3-agruenba@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Junxiao Bi <junxiao.bi@oracle.com>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 2/2] gfs2: Rework read and page fault
	locking
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 19, 2020 at 11:39:16AM +0200, Andreas Gruenbacher wrote:
>  static int gfs2_readpage(struct file *file, struct page *page)
>  {
> -	struct address_space *mapping = page->mapping;
> -	struct gfs2_inode *ip = GFS2_I(mapping->host);
> -	struct gfs2_holder gh;
>  	int error;
>  
> -	unlock_page(page);
> -	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
> -	error = gfs2_glock_nq(&gh);
> -	if (unlikely(error))
> -		goto out;
> -	error = AOP_TRUNCATED_PAGE;
> -	lock_page(page);
> -	if (page->mapping == mapping && !PageUptodate(page))
> -		error = __gfs2_readpage(file, page);
> -	else
> -		unlock_page(page);
> -	gfs2_glock_dq(&gh);
> -out:
> -	gfs2_holder_uninit(&gh);
> -	if (error && error != AOP_TRUNCATED_PAGE)
> +	error = __gfs2_readpage(file, page);
> +	if (error)
>  		lock_page(page);
>  	return error;

I don't think this is right.  If you return an error from ->readpage, I'm
pretty sure you're supposed to unlock that page.  Looking at
generic_file_buffered_read():

                error = mapping->a_ops->readpage(filp, page);
                if (unlikely(error)) {
                        if (error == AOP_TRUNCATED_PAGE) {
                                put_page(page);
                                error = 0;
                                goto find_page;
                        }
                        goto readpage_error;
                }
...
readpage_error:
                put_page(page);
                goto out;
...
out:
        ra->prev_pos = prev_index;
        ra->prev_pos <<= PAGE_SHIFT;
        ra->prev_pos |= prev_offset;

        *ppos = ((loff_t)index << PAGE_SHIFT) + offset;
        file_accessed(filp);
        return written ? written : error;

so we don't call unlock_page() in generic code, which means the next time
we try to get this page, we'll do ...

                page = find_get_page(mapping, index);
...
                if (!PageUptodate(page)) {
                        error = wait_on_page_locked_killable(page);
and presumably we'll wait forever because nobody is going to unlock this
page?

> @@ -598,16 +582,9 @@ static void gfs2_readahead(struct readahead_control *rac)
>  {
>  	struct inode *inode = rac->mapping->host;
>  	struct gfs2_inode *ip = GFS2_I(inode);
> -	struct gfs2_holder gh;
>  
> -	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
> -	if (gfs2_glock_nq(&gh))
> -		goto out_uninit;
>  	if (!gfs2_is_stuffed(ip))
>  		mpage_readahead(rac, gfs2_block_map);
> -	gfs2_glock_dq(&gh);
> -out_uninit:
> -	gfs2_holder_uninit(&gh);
>  }

Not for this patch, obviously, but why do you go to the effort of using
iomap_readpage() to implement gfs2_readpage(), but don't use iomap for
gfs2_readahead()?  Far more pages are brought in through ->readahead
than are brought in through ->readpage.

>  static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  {
> +	struct gfs2_inode *ip;
> +	struct gfs2_holder gh;
> +	size_t written = 0;
>  	ssize_t ret;
>  
> +	gfs2_holder_mark_uninitialized(&gh);
>  	if (iocb->ki_flags & IOCB_DIRECT) {
>  		ret = gfs2_file_direct_read(iocb, to);

Again, future work, but you probably want to pass in &gh here so you
don't have to eat up another 32 bytes or so of stack space on an unused
gfs2_holder.

>  		if (likely(ret != -ENOTBLK))
>  			return ret;
>  		iocb->ki_flags &= ~IOCB_DIRECT;
>  	}
> -	return generic_file_read_iter(iocb, to);
> +	iocb->ki_flags |= IOCB_CACHED;
> +	ret = generic_file_read_iter(iocb, to);
> +	iocb->ki_flags &= ~IOCB_CACHED;
> +	if (ret >= 0) {
> +		if (!iov_iter_count(to))
> +			return ret;
> +		written = ret;
> +	} else {
> +		switch(ret) {
> +		case -EAGAIN:
> +			if (iocb->ki_flags & IOCB_NOWAIT)
> +				return ret;
> +			break;
> +		case -ECANCELED:
> +			break;
> +		default:
> +			return ret;
> +		}
> +	}

I'm wondering if we want to do this in common code rather than making it
something special only a few filesystems do (either because they care
about workloads with many threads accessing the same file, or because
their per-file locks are very heavy-weight).

