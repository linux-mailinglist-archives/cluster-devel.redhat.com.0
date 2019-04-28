Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3726AE177
	for <lists+cluster-devel@lfdr.de>; Mon, 29 Apr 2019 13:40:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB3B68AE48;
	Mon, 29 Apr 2019 11:40:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5931768B29;
	Mon, 29 Apr 2019 11:40:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C98E41F3D;
	Mon, 29 Apr 2019 11:40:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3TBeNdi007207 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 07:40:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9ACDC28997; Mon, 29 Apr 2019 11:40:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32CCE289B0;
	Mon, 29 Apr 2019 11:39:53 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3DE930917AD;
	Mon, 29 Apr 2019 11:39:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 4EE20AE20;
	Mon, 29 Apr 2019 11:39:50 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 820AF1E3BF3; Sun, 28 Apr 2019 21:20:29 +0200 (CEST)
Date: Sun, 28 Apr 2019 21:20:29 +0200
From: Jan Kara <jack@suse.cz>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190428192029.GB7441@quack2>
References: <20190426131127.19164-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190426131127.19164-1-agruenba@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Mon, 29 Apr 2019 11:39:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Mon, 29 Apr 2019 11:39:52 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'jack@suse.cz' RCPT:''
X-RedHat-Spam-Score: -1.497  (DATE_IN_PAST_12_24, RCVD_IN_DNSWL_MED,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <jack@suse.cz>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	Dave Chinner <david@fromorbit.com>,
	Mark Syms <Mark.Syms@citrix.com>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH v5 1/3] iomap: Fix use-after-free error
 in page_done callback
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Mon, 29 Apr 2019 11:40:36 +0000 (UTC)

On Fri 26-04-19 15:11:25, Andreas Gruenbacher wrote:
> In iomap_write_end, we are not holding a page reference anymore when
> calling the page_done callback, but the callback needs that reference to
> access the page.
> 
> To fix that, move the put_page call in __generic_write_end into the
> callers of __generic_write_end.  Then, in iomap_write_end, put the page
> after calling the page_done callback.
> 
> Reported-by: Jan Kara <jack@suse.cz>
> Fixes: 63899c6f8851 ("iomap: add a page_done callback")
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/buffer.c |  5 +++--
>  fs/iomap.c  | 12 ++++++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index ce357602f471..6e2c95160ce3 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -2104,7 +2104,6 @@ int __generic_write_end(struct inode *inode, loff_t pos, unsigned copied,
>  	}
>  
>  	unlock_page(page);
> -	put_page(page);
>  
>  	if (old_size < pos)
>  		pagecache_isize_extended(inode, old_size, pos);
> @@ -2160,7 +2159,9 @@ int generic_write_end(struct file *file, struct address_space *mapping,
>  			struct page *page, void *fsdata)
>  {
>  	copied = block_write_end(file, mapping, pos, len, copied, page, fsdata);
> -	return __generic_write_end(mapping->host, pos, copied, page);
> +	copied = __generic_write_end(mapping->host, pos, copied, page);
> +	put_page(page);
> +	return copied;
>  }
>  EXPORT_SYMBOL(generic_write_end);
>  
> diff --git a/fs/iomap.c b/fs/iomap.c
> index 97cb9d486a7d..3e4652dac9d9 100644
> --- a/fs/iomap.c
> +++ b/fs/iomap.c
> @@ -765,6 +765,14 @@ iomap_write_end_inline(struct inode *inode, struct page *page,
>  	return copied;
>  }
>  
> +static int
> +buffer_write_end(struct address_space *mapping, loff_t pos, loff_t len,
> +		unsigned copied, struct page *page)
> +{
> +	copied = block_write_end(NULL, mapping, pos, len, copied, page, NULL);
> +	return __generic_write_end(mapping->host, pos, copied, page);
> +}
> +
>  static int
>  iomap_write_end(struct inode *inode, loff_t pos, unsigned len,
>  		unsigned copied, struct page *page, struct iomap *iomap)
> @@ -774,14 +782,14 @@ iomap_write_end(struct inode *inode, loff_t pos, unsigned len,
>  	if (iomap->type == IOMAP_INLINE) {
>  		ret = iomap_write_end_inline(inode, page, iomap, pos, copied);
>  	} else if (iomap->flags & IOMAP_F_BUFFER_HEAD) {
> -		ret = generic_write_end(NULL, inode->i_mapping, pos, len,
> -				copied, page, NULL);
> +		ret = buffer_write_end(inode->i_mapping, pos, len, copied, page);
>  	} else {
>  		ret = __iomap_write_end(inode, pos, len, copied, page, iomap);
>  	}
>  
>  	if (iomap->page_done)
>  		iomap->page_done(inode, pos, copied, page, iomap);
> +	put_page(page);
>  
>  	if (ret < len)
>  		iomap_write_failed(inode, pos, len);
> -- 
> 2.20.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

