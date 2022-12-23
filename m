Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4938F6551EF
	for <lists+cluster-devel@lfdr.de>; Fri, 23 Dec 2022 16:10:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671808243;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=2bi42ObmzJhIVRGH9DaM47E730Lbb8ApGNNgjPXCVUQ=;
	b=BYNAeWxZ3q6wGz6x6o+IbuWBhQs6inx5KHKkmKvqGnaHLhMxZLLREzj2sjaeB+kUwCLfxW
	gYxpzsoBxl+B+cT5mt2dCJlBCjXvu28KTCjuOOmv0GIAKI9kXF7epVwtYLfogKafqyJMMG
	6RtpIDB7ptYG5gTaWfD7vkSRJ1CghR8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-3wg3-lYIPau4ZFGttjaPRQ-1; Fri, 23 Dec 2022 10:10:40 -0500
X-MC-Unique: 3wg3-lYIPau4ZFGttjaPRQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50C761C09040;
	Fri, 23 Dec 2022 15:10:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45264111F3B0;
	Fri, 23 Dec 2022 15:10:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2099719465B6;
	Fri, 23 Dec 2022 15:10:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A32DC19465B1 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 23 Dec 2022 15:10:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 961FD492B02; Fri, 23 Dec 2022 15:10:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E6AA492B00
 for <cluster-devel@redhat.com>; Fri, 23 Dec 2022 15:10:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7279085C6E3
 for <cluster-devel@redhat.com>; Fri, 23 Dec 2022 15:10:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-20-QZ3POXAPN0CF1RsYGWOLKw-1; Fri, 23 Dec 2022 10:10:36 -0500
X-MC-Unique: QZ3POXAPN0CF1RsYGWOLKw-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p8jgw-009FFs-Ll; Fri, 23 Dec 2022 15:10:34 +0000
Date: Fri, 23 Dec 2022 07:10:34 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <Y6XE6jLIax/+xcjF@infradead.org>
References: <20221216150626.670312-1-agruenba@redhat.com>
 <20221216150626.670312-7-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221216150626.670312-7-agruenba@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [RFC v3 6/7] iomap/xfs: Eliminate the
 iomap_valid handler
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
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
 "Darrick J . Wong" <djwong@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 16, 2022 at 04:06:25PM +0100, Andreas Gruenbacher wrote:
> Eliminate the ->iomap_valid() handler by switching to a ->page_prepare()
> handler and validating the mapping there.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/iomap/buffered-io.c | 24 ++++--------------------
>  fs/xfs/xfs_iomap.c     | 38 +++++++++++++++++++++++++++-----------
>  include/linux/iomap.h  | 17 -----------------
>  3 files changed, 31 insertions(+), 48 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 6b7c1a10b8ec..b73ff317da21 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -623,7 +623,7 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
>  	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
>  	const struct iomap *srcmap = iomap_iter_srcmap(iter);
>  	struct folio *folio;
> -	int status = 0;
> +	int status;
>  
>  	BUG_ON(pos + len > iter->iomap.offset + iter->iomap.length);
>  	if (srcmap != &iter->iomap)
> @@ -642,27 +642,11 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
>  	if (IS_ERR_OR_NULL(folio)) {
>  		if (!folio)
>  			return (iter->flags & IOMAP_NOWAIT) ? -EAGAIN : -ENOMEM;
> +		if (folio == ERR_PTR(-ESTALE)) {
>  			iter->iomap.flags |= IOMAP_F_STALE;
> +			return 0;
>  		}
> +		return PTR_ERR(folio);
>  	}
>  
>  	if (pos + len > folio_pos(folio) + folio_size(folio))
> diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
> index 669c1bc5c3a7..2248ce7be2e3 100644
> --- a/fs/xfs/xfs_iomap.c
> +++ b/fs/xfs/xfs_iomap.c
> @@ -62,29 +62,45 @@ xfs_iomap_inode_sequence(
>  	return cookie | READ_ONCE(ip->i_df.if_seq);
>  }
>  
> -/*
> - * Check that the iomap passed to us is still valid for the given offset and
> - * length.
> - */
> -static bool
> -xfs_iomap_valid(
> -	struct inode		*inode,
> -	const struct iomap	*iomap)
> +static struct folio *
> +xfs_page_prepare(
> +	struct iomap_iter	*iter,
> +	loff_t			pos,
> +	unsigned		len)
>  {
> +	struct inode		*inode = iter->inode;
> +	struct iomap		*iomap = &iter->iomap;
>  	struct xfs_inode	*ip = XFS_I(inode);
> +	struct folio *folio;

Please tab align this like the other variable declarations above.

> -	/*
> -	 * Check that the cached iomap still maps correctly to the filesystem's
> -	 * internal extent map. FS internal extent maps can change while iomap
> -	 * is iterating a cached iomap, so this hook allows iomap to detect that
> -	 * the iomap needs to be refreshed during a long running write
> -	 * operation.
> -	 *
> -	 * The filesystem can store internal state (e.g. a sequence number) in
> -	 * iomap->validity_cookie when the iomap is first mapped to be able to
> -	 * detect changes between mapping time and whenever .iomap_valid() is
> -	 * called.
> -	 *
> -	 * This is called with the folio over the specified file position held
> -	 * locked by the iomap code.
> -	 */

We'll still need to capture this information somewhere.  I'd suggest
to move it to the prepare/get method and reword it so that this is
mentioned as an additional use case / requirement.

