Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id F0C00400576
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Sep 2021 21:05:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-BUT0TYHVOtCabAq15Cmr0A-1; Fri, 03 Sep 2021 15:05:03 -0400
X-MC-Unique: BUT0TYHVOtCabAq15Cmr0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 599FE8145E6;
	Fri,  3 Sep 2021 19:05:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AE075D9FC;
	Fri,  3 Sep 2021 19:05:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 196CB1809C81;
	Fri,  3 Sep 2021 19:05:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 183IschE019220 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 Sep 2021 14:54:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 840541FA85F; Fri,  3 Sep 2021 18:54:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F5F19D5A
	for <cluster-devel@redhat.com>; Fri,  3 Sep 2021 18:54:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEFE380018D
	for <cluster-devel@redhat.com>; Fri,  3 Sep 2021 18:54:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-453-LerANbbUNluyfXz9PhDR8Q-1;
	Fri, 03 Sep 2021 14:54:32 -0400
X-MC-Unique: LerANbbUNluyfXz9PhDR8Q-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6EEA61051;
	Fri,  3 Sep 2021 18:54:30 +0000 (UTC)
Date: Fri, 3 Sep 2021 11:54:30 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20210903185430.GE9892@magnolia>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-16-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210827164926.1726765-16-agruenba@redhat.com>
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
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 15/19] iomap: Support partial direct
 I/O on user copy failures
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

On Fri, Aug 27, 2021 at 06:49:22PM +0200, Andreas Gruenbacher wrote:
> In iomap_dio_rw, when iomap_apply returns an -EFAULT error and the
> IOMAP_DIO_PARTIAL flag is set, complete the request synchronously and
> return a partial result.  This allows the caller to deal with the page
> fault and retry the remainder of the request.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

Pretty straightforward.
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/iomap/direct-io.c  | 6 ++++++
>  include/linux/iomap.h | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index 8054f5d6c273..ba88fe51b77a 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -561,6 +561,12 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
>  		ret = iomap_apply(inode, pos, count, iomap_flags, ops, dio,
>  				iomap_dio_actor);
>  		if (ret <= 0) {
> +			if (ret == -EFAULT && dio->size &&
> +			    (dio_flags & IOMAP_DIO_PARTIAL)) {
> +				wait_for_completion = true;
> +				ret = 0;
> +			}
> +
>  			/* magic error code to fall back to buffered I/O */
>  			if (ret == -ENOTBLK) {
>  				wait_for_completion = true;
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index 479c1da3e221..bcae4814b8e3 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -267,6 +267,13 @@ struct iomap_dio_ops {
>    */
>  #define IOMAP_DIO_OVERWRITE_ONLY	(1 << 1)
>  
> +/*
> + * When a page fault occurs, return a partial synchronous result and allow
> + * the caller to retry the rest of the operation after dealing with the page
> + * fault.
> + */
> +#define IOMAP_DIO_PARTIAL		(1 << 2)
> +
>  ssize_t iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
>  		const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
>  		unsigned int dio_flags);
> -- 
> 2.26.3
> 

