Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB1865DBA9
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Jan 2023 18:53:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672854810;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=rk3zbuYzNVY3evPoQjyHFAUl3htX3TYsz9Mapew7N7E=;
	b=I+v1+Q907OEK6RMpbtDl/ZZJhtwKzO7y+RHYVCWJqfaIij4/IhQ49DZA2ModVWbq026pE9
	nukf+bvlHRUECxKgDWH4HsaDcnnJWWXT/xE/0ps0tCf1tXNzmIrrigRlheW1f/+Hb4tcw9
	l+AElzoolNCDe+BY1bXC+WNl1fT6jW0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-xdw85ar1PaijboHrOSuhHQ-1; Wed, 04 Jan 2023 12:53:27 -0500
X-MC-Unique: xdw85ar1PaijboHrOSuhHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DD67857F82;
	Wed,  4 Jan 2023 17:53:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15BAB40C2004;
	Wed,  4 Jan 2023 17:53:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C7A1B194658F;
	Wed,  4 Jan 2023 17:53:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E109C1946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  4 Jan 2023 17:53:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D20EC2166B31; Wed,  4 Jan 2023 17:53:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA4E72166B30
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 17:53:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC1742806041
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 17:53:23 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-RifhP4lrNRW2M1871OVNNw-1; Wed, 04 Jan 2023 12:53:19 -0500
X-MC-Unique: RifhP4lrNRW2M1871OVNNw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87548B81891;
 Wed,  4 Jan 2023 17:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995A1C433A7;
 Wed,  4 Jan 2023 17:53:17 +0000 (UTC)
Date: Wed, 4 Jan 2023 09:53:17 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <Y7W9Dfub1WeTvG8G@magnolia>
References: <20221231150919.659533-1-agruenba@redhat.com>
 <20221231150919.659533-8-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221231150919.659533-8-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH v5 7/9] iomap/xfs: Eliminate the
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
 Matthew Wilcox <willy@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 31, 2022 at 04:09:17PM +0100, Andreas Gruenbacher wrote:
> Eliminate the ->iomap_valid() handler by switching to a ->get_folio()
> handler and validating the mapping there.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/iomap/buffered-io.c | 25 +++++--------------------
>  fs/xfs/xfs_iomap.c     | 37 ++++++++++++++++++++++++++-----------
>  include/linux/iomap.h  | 22 +++++-----------------
>  3 files changed, 36 insertions(+), 48 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 4f363d42dbaf..df6fca11f18c 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -630,7 +630,7 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
>  	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
>  	const struct iomap *srcmap = iomap_iter_srcmap(iter);
>  	struct folio *folio;
> -	int status = 0;
> +	int status;
>  
>  	BUG_ON(pos + len > iter->iomap.offset + iter->iomap.length);
>  	if (srcmap != &iter->iomap)
> @@ -646,27 +646,12 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
>  		folio = page_ops->get_folio(iter, pos, len);
>  	else
>  		folio = iomap_get_folio(iter, pos);
> -	if (IS_ERR(folio))
> -		return PTR_ERR(folio);
> -
> -	/*
> -	 * Now we have a locked folio, before we do anything with it we need to
> -	 * check that the iomap we have cached is not stale. The inode extent
> -	 * mapping can change due to concurrent IO in flight (e.g.
> -	 * IOMAP_UNWRITTEN state can change and memory reclaim could have
> -	 * reclaimed a previously partially written page at this index after IO
> -	 * completion before this write reaches this file offset) and hence we
> -	 * could do the wrong thing here (zero a page range incorrectly or fail
> -	 * to zero) and corrupt data.
> -	 */
> -	if (page_ops && page_ops->iomap_valid) {
> -		bool iomap_valid = page_ops->iomap_valid(iter->inode,
> -							&iter->iomap);
> -		if (!iomap_valid) {
> +	if (IS_ERR(folio)) {
> +		if (folio == ERR_PTR(-ESTALE)) {
>  			iter->iomap.flags |= IOMAP_F_STALE;
> -			status = 0;
> -			goto out_unlock;
> +			return 0;
>  		}
> +		return PTR_ERR(folio);

I wonder if this should be reworked a bit to reduce indenting:

	if (PTR_ERR(folio) == -ESTALE) {
		iter->iomap.flags |= IOMAP_F_STALE;
		return 0;
	}
	if (IS_ERR(folio))
		return PTR_ERR(folio);

But I don't have any strong opinions about that.

>  	}
>  
>  	if (pos + len > folio_pos(folio) + folio_size(folio))
> diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
> index 669c1bc5c3a7..d0bf99539180 100644
> --- a/fs/xfs/xfs_iomap.c
> +++ b/fs/xfs/xfs_iomap.c
> @@ -62,29 +62,44 @@ xfs_iomap_inode_sequence(
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
> +xfs_get_folio(
> +	struct iomap_iter	*iter,
> +	loff_t			pos,
> +	unsigned		len)
>  {
> +	struct inode		*inode = iter->inode;
> +	struct iomap		*iomap = &iter->iomap;
>  	struct xfs_inode	*ip = XFS_I(inode);
> +	struct folio		*folio;
>  
> +	folio = iomap_get_folio(iter, pos);
> +	if (IS_ERR(folio))
> +		return folio;
> +
> +	/*
> +	 * Now that we have a locked folio, we need to check that the iomap we
> +	 * have cached is not stale.  The inode extent mapping can change due to
> +	 * concurrent IO in flight (e.g., IOMAP_UNWRITTEN state can change and
> +	 * memory reclaim could have reclaimed a previously partially written
> +	 * page at this index after IO completion before this write reaches
> +	 * this file offset) and hence we could do the wrong thing here (zero a
> +	 * page range incorrectly or fail to zero) and corrupt data.
> +	 */
>  	if (iomap->validity_cookie !=
>  			xfs_iomap_inode_sequence(ip, iomap->flags)) {
>  		trace_xfs_iomap_invalid(ip, iomap);
> -		return false;
> +		folio_unlock(folio);
> +		folio_put(folio);
> +		return ERR_PTR(-ESTALE);
>  	}
>  
>  	XFS_ERRORTAG_DELAY(ip->i_mount, XFS_ERRTAG_WRITE_DELAY_MS);
> -	return true;
> +	return folio;
>  }
>  
>  const struct iomap_page_ops xfs_iomap_page_ops = {
> -	.iomap_valid		= xfs_iomap_valid,
> +	.get_folio		= xfs_get_folio,
>  };
>  
>  int
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index dd3575ada5d1..6f8e3321e475 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -134,29 +134,17 @@ static inline bool iomap_inline_data_valid(const struct iomap *iomap)
>   * When get_folio succeeds, put_folio will always be called to do any
>   * cleanup work necessary.  put_folio is responsible for unlocking and putting
>   * @folio.
> + *
> + * When an iomap is created, the filesystem can store internal state (e.g., a
> + * sequence number) in iomap->validity_cookie.  When it then detects in the

I would reword this to:

"When an iomap is created, the filesystem can store internal state (e.g.
sequence number) in iomap->validity_cookie.  The get_folio handler can
use this validity cookie to detect if the iomap is no longer up to date
and needs to be refreshed.  If this is the case, the function should
return ERR_PTR(-ESTALE) to retry the operation with a fresh mapping."

--D

> + * get_folio handler that the iomap is no longer up to date and needs to be
> + * refreshed, it can return ERR_PTR(-ESTALE) to trigger a retry.
>   */
>  struct iomap_page_ops {
>  	struct folio *(*get_folio)(struct iomap_iter *iter, loff_t pos,
>  			unsigned len);
>  	void (*put_folio)(struct inode *inode, loff_t pos, unsigned copied,
>  			struct folio *folio);
> -
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
> -	bool (*iomap_valid)(struct inode *inode, const struct iomap *iomap);
>  };
>  
>  /*
> -- 
> 2.38.1
> 

