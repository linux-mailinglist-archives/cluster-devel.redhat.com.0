Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id AB5E2404922
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Sep 2021 13:19:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-CZhl1uk4MO6o8J9OaFJWgA-1; Thu, 09 Sep 2021 07:19:50 -0400
X-MC-Unique: CZhl1uk4MO6o8J9OaFJWgA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B4DC814244;
	Thu,  9 Sep 2021 11:19:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAF705B826;
	Thu,  9 Sep 2021 11:19:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C20C04EA2A;
	Thu,  9 Sep 2021 11:19:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 189BJXK2013481 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Sep 2021 07:19:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B7801014B22; Thu,  9 Sep 2021 11:19:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9756311342E8
	for <cluster-devel@redhat.com>; Thu,  9 Sep 2021 11:19:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FA9B800159
	for <cluster-devel@redhat.com>; Thu,  9 Sep 2021 11:19:30 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-146-9gbCPrhiPDG6QMle-eLRdw-1; Thu, 09 Sep 2021 07:19:29 -0400
X-MC-Unique: 9gbCPrhiPDG6QMle-eLRdw-1
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
	Linux)) id 1mOI46-009ktL-OB; Thu, 09 Sep 2021 11:18:02 +0000
Date: Thu, 9 Sep 2021 12:17:58 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YTntZj0T3pWhApoe@infradead.org>
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-15-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210827164926.1726765-15-agruenba@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 14/19] iomap: Fix iomap_dio_rw return
 value for user copies
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

On Fri, Aug 27, 2021 at 06:49:21PM +0200, Andreas Gruenbacher wrote:
> When a user copy fails in one of the helpers of iomap_dio_rw, fail with
> -EFAULT instead of returning 0.  This matches what iomap_dio_bio_actor
> returns when it gets an -EFAULT from bio_iov_iter_get_pages.  With these
> changes, iomap_dio_actor now consistently fails with -EFAULT when a user
> page cannot be faulted in.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/iomap/direct-io.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index 9398b8c31323..8054f5d6c273 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -370,7 +370,7 @@ iomap_dio_hole_actor(loff_t length, struct iomap_dio *dio)
>  {
>  	length = iov_iter_zero(length, dio->submit.iter);
>  	dio->size += length;
> -	return length;
> +	return length ? length : -EFAULT;

What's wrong with a good old:

	if (!length)
		return -EFAULT;
	return length?

Besides this nit and the fact that the patch needs a reabse it looks
good to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>

