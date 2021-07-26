Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C83D73D6513
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 19:03:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-P6T6SxNoNH6N6Xveb-pSZA-1; Mon, 26 Jul 2021 13:03:03 -0400
X-MC-Unique: P6T6SxNoNH6N6Xveb-pSZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6770760CD;
	Mon, 26 Jul 2021 17:03:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 802CA710C0;
	Mon, 26 Jul 2021 17:03:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 391B84BB7C;
	Mon, 26 Jul 2021 17:03:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QH2v7J021415 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 13:02:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B1AA29C069; Mon, 26 Jul 2021 17:02:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC0A8AB3F2
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 17:02:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5907C10AF7C3
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 17:02:54 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-94-rYyqt5p3PMySpbRQAC3OXA-1; Mon, 26 Jul 2021 13:02:52 -0400
X-MC-Unique: rYyqt5p3PMySpbRQAC3OXA-1
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id B18C022025;
	Mon, 26 Jul 2021 17:02:50 +0000 (UTC)
Received: from quack2.suse.cz (unknown [10.100.200.198])
	by relay2.suse.de (Postfix) with ESMTP id 9BD91A3B9F;
	Mon, 26 Jul 2021 17:02:50 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 6EA851E3B13; Mon, 26 Jul 2021 19:02:50 +0200 (CEST)
Date: Mon, 26 Jul 2021 19:02:50 +0200
From: Jan Kara <jack@suse.cz>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20210726170250.GL20621@quack2.suse.cz>
References: <20210723205840.299280-1-agruenba@redhat.com>
	<20210723205840.299280-8-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210723205840.299280-8-agruenba@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v3 7/7] gfs2: Fix mmap + page fault
 deadlocks for direct I/O
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri 23-07-21 22:58:40, Andreas Gruenbacher wrote:
> Also disable page faults during direct I/O requests and implement the same kind
> of retry logic as in the buffered I/O case.
> 
> Direct I/O requests differ from buffered I/O requests in that they use
> bio_iov_iter_get_pages for grabbing page references and faulting in pages
> instead of triggering real page faults.  Those manual page faults can be
> disabled with the iocb->noio flag.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/gfs2/file.c | 34 +++++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index f66ac7f56f6d..7986f3be69d2 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -782,21 +782,41 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
>  	struct file *file = iocb->ki_filp;
>  	struct gfs2_inode *ip = GFS2_I(file->f_mapping->host);
>  	size_t count = iov_iter_count(to);
> +	size_t written = 0;
>  	ssize_t ret;
>  
> +	/*
> +	 * In this function, we disable page faults when we're holding the
> +	 * inode glock while doing I/O.  If a page fault occurs, we drop the
> +	 * inode glock, fault in the pages manually, and then we retry.  Other
> +	 * than in gfs2_file_read_iter, iomap_dio_rw can trigger implicit as
> +	 * well as manual page faults, and we need to disable both kinds
> +	 * separately.
> +	 */
> +
>  	if (!count)
>  		return 0; /* skip atime */
>  
>  	gfs2_holder_init(ip->i_gl, LM_ST_DEFERRED, 0, gh);
> +retry:
>  	ret = gfs2_glock_nq(gh);
>  	if (ret)
>  		goto out_uninit;
>  
> +	pagefault_disable();

Is there any use in pagefault_disable() here? iomap_dio_rw() should not
trigger any page faults anyway, should it?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

