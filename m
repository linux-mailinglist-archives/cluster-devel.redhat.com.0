Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DA665DB7F
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Jan 2023 18:48:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672854502;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qtxGcT7vdm2KaFXgZ1lwkhmE1kvOKa3WyOe9r831lE0=;
	b=Cja2U3bMlVVluJqkldTWaMMs3lkcyerswp8IkCjPq+7ueb1FgR19rAKRyYCkXtBqlfpMud
	Dap9X0BFzCVO23ZOPAs5kxhkQ7w8U2JIZWKxF0s/QEVrBkkZgB3rsARKFXONeqWBTBrCVc
	yjzUlsKxf00HQuyuabNhfitja1GqGiY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-tzBtpezCNSaaSjtFalcUAw-1; Wed, 04 Jan 2023 12:48:19 -0500
X-MC-Unique: tzBtpezCNSaaSjtFalcUAw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EFD52932480;
	Wed,  4 Jan 2023 17:48:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 836602166B32;
	Wed,  4 Jan 2023 17:48:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 65439194658F;
	Wed,  4 Jan 2023 17:48:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9367F1946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  4 Jan 2023 17:48:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 163CC35455; Wed,  4 Jan 2023 17:48:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EDEB175AD
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 17:48:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F6A43C02523
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 17:48:00 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-y2wsv0jxNNykAY8bNiqL-Q-1; Wed, 04 Jan 2023 12:47:59 -0500
X-MC-Unique: y2wsv0jxNNykAY8bNiqL-Q-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8D5B0B81733;
 Wed,  4 Jan 2023 17:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367CCC433EF;
 Wed,  4 Jan 2023 17:40:19 +0000 (UTC)
Date: Wed, 4 Jan 2023 09:40:18 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <Y7W6AittyYB5/bok@magnolia>
References: <20221231150919.659533-1-agruenba@redhat.com>
 <20221231150919.659533-3-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221231150919.659533-3-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH v5 2/9] iomap/gfs2: Unlock and put folio
 in page_done handler
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 31, 2022 at 04:09:12PM +0100, Andreas Gruenbacher wrote:
> When an iomap defines a ->page_done() handler in its page_ops, delegate
> unlocking the folio and putting the folio reference to that handler.
> 
> This allows to fix a race between journaled data writes and folio
> writeback in gfs2: before this change, gfs2_iomap_page_done() was called
> after unlocking the folio, so writeback could start writing back the
> folio's buffers before they could be marked for writing to the journal.
> Also, try_to_free_buffers() could free the buffers before
> gfs2_iomap_page_done() was done adding the buffers to the current
> current transaction.  With this change, gfs2_iomap_page_done() adds the
> buffers to the current transaction while the folio is still locked, so
> the problems described above can no longer occur.
> 
> The only current user of ->page_done() is gfs2, so other filesystems are
> not affected.  To catch out any out-of-tree users, switch from a page to
> a folio in ->page_done().

I really hope there aren't any out of tree users...

> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/gfs2/bmap.c         | 15 ++++++++++++---
>  fs/iomap/buffered-io.c |  8 ++++----
>  include/linux/iomap.h  |  7 ++++---
>  3 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index e7537fd305dd..46206286ad42 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -968,14 +968,23 @@ static int gfs2_iomap_page_prepare(struct inode *inode, loff_t pos,
>  }
>  
>  static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
> -				 unsigned copied, struct page *page)
> +				 unsigned copied, struct folio *folio)
>  {
>  	struct gfs2_trans *tr = current->journal_info;
>  	struct gfs2_inode *ip = GFS2_I(inode);
>  	struct gfs2_sbd *sdp = GFS2_SB(inode);
>  
> -	if (page && !gfs2_is_stuffed(ip))
> -		gfs2_page_add_databufs(ip, page, offset_in_page(pos), copied);
> +	if (!folio) {
> +		gfs2_trans_end(sdp);
> +		return;
> +	}
> +
> +	if (!gfs2_is_stuffed(ip))
> +		gfs2_page_add_databufs(ip, &folio->page, offset_in_page(pos),
> +				       copied);
> +
> +	folio_unlock(folio);
> +	folio_put(folio);
>  
>  	if (tr->tr_num_buf_new)
>  		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index c30d150a9303..e13d5694e299 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -580,12 +580,12 @@ static void iomap_put_folio(struct iomap_iter *iter, loff_t pos, size_t ret,
>  {
>  	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
>  
> -	if (folio)
> +	if (page_ops && page_ops->page_done) {
> +		page_ops->page_done(iter->inode, pos, ret, folio);
> +	} else if (folio) {
>  		folio_unlock(folio);
> -	if (page_ops && page_ops->page_done)
> -		page_ops->page_done(iter->inode, pos, ret, &folio->page);
> -	if (folio)
>  		folio_put(folio);
> +	}
>  }
>  
>  static int iomap_write_begin_inline(const struct iomap_iter *iter,
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index 0983dfc9a203..743e2a909162 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -131,13 +131,14 @@ static inline bool iomap_inline_data_valid(const struct iomap *iomap)
>   * associated with them.
>   *
>   * When page_prepare succeeds, page_done will always be called to do any
> - * cleanup work necessary.  In that page_done call, @page will be NULL if the
> - * associated page could not be obtained.
> + * cleanup work necessary.  In that page_done call, @folio will be NULL if the
> + * associated folio could not be obtained.  When folio is not NULL, page_done
> + * is responsible for unlocking and putting the folio.
>   */
>  struct iomap_page_ops {
>  	int (*page_prepare)(struct inode *inode, loff_t pos, unsigned len);
>  	void (*page_done)(struct inode *inode, loff_t pos, unsigned copied,
> -			struct page *page);
> +			struct folio *folio);
>  
>  	/*
>  	 * Check that the cached iomap still maps correctly to the filesystem's
> -- 
> 2.38.1
> 

