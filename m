Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D10B78A17D
	for <lists+cluster-devel@lfdr.de>; Sun, 27 Aug 2023 22:45:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693169150;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=b31OO6Xd9+jxzKw5QB3n4d33iA6sZ4nPi+nMylKSno4=;
	b=Ahq1Hbn76x425dKQQw1gVESW2QeDznWV8RInglqA7n1I9GjY+bDp2apXwaIiTOgeBqIpu6
	Q0rwbrZoxCdfIINor7ph/rkf0qEWL2AEHcGDGR3CLIkm1y01K0Lo30aKtKgzzC78DoLnSc
	vTbSc6MwYoqzePLduK3n+UsDSINzbro=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-nvZg6hLDMP-l3KSJWAIpJg-1; Sun, 27 Aug 2023 16:45:46 -0400
X-MC-Unique: nvZg6hLDMP-l3KSJWAIpJg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 628391C25A68;
	Sun, 27 Aug 2023 20:45:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E4A9D2166B26;
	Sun, 27 Aug 2023 20:45:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A6D9D19465BA;
	Sun, 27 Aug 2023 20:45:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A4F1819465A8 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 27 Aug 2023 20:45:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8298E492C14; Sun, 27 Aug 2023 20:45:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B6E1492C13
 for <cluster-devel@redhat.com>; Sun, 27 Aug 2023 20:45:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4349D1C05151
 for <cluster-devel@redhat.com>; Sun, 27 Aug 2023 20:45:43 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-377-0sffH3aeOPGbV_uu0bWmJw-1; Sun,
 27 Aug 2023 16:45:38 -0400
X-MC-Unique: 0sffH3aeOPGbV_uu0bWmJw-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qaMcv-00Dkeb-PH; Sun, 27 Aug 2023 20:44:53 +0000
Date: Sun, 27 Aug 2023 21:44:53 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZOu1xYS6LRmPgEiV@casper.infradead.org>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-3-hao.xu@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230827132835.1373581-3-hao.xu@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 02/11] xfs: add NOWAIT semantics for
 readdir
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 27, 2023 at 09:28:26PM +0800, Hao Xu wrote:
> +++ b/fs/xfs/libxfs/xfs_da_btree.c
> @@ -2643,16 +2643,32 @@ xfs_da_read_buf(
>  	struct xfs_buf_map	map, *mapp = &map;
>  	int			nmap = 1;
>  	int			error;
> +	int			buf_flags = 0;
>  
>  	*bpp = NULL;
>  	error = xfs_dabuf_map(dp, bno, flags, whichfork, &mapp, &nmap);
>  	if (error || !nmap)
>  		goto out_free;
>  
> +	/*
> +	 * NOWAIT semantics mean we don't wait on the buffer lock nor do we
> +	 * issue IO for this buffer if it is not already in memory. Caller will
> +	 * retry. This will return -EAGAIN if the buffer is in memory and cannot
> +	 * be locked, and no buffer and no error if it isn't in memory.  We
> +	 * translate both of those into a return state of -EAGAIN and *bpp =
> +	 * NULL.
> +	 */

I would not include this comment.

> +	if (flags & XFS_DABUF_NOWAIT)
> +		buf_flags |= XBF_TRYLOCK | XBF_INCORE;
>  	error = xfs_trans_read_buf_map(mp, tp, mp->m_ddev_targp, mapp, nmap, 0,
>  			&bp, ops);

what tsting did you do with this?  Because you don't actually _use_
buf_flags anywhere in this patch (presumably they should be the
sixth argument to xfs_trans_read_buf_map() instead of 0).  So I can only
conclude that either you didn't test, or your testing was inadequate.

>  	if (error)
>  		goto out_free;
> +	if (!bp) {
> +		ASSERT(flags & XFS_DABUF_NOWAIT);

I don't think this ASSERT is appropriate.

> @@ -391,10 +401,17 @@ xfs_dir2_leaf_getdents(
>  				bp = NULL;
>  			}
>  
> -			if (*lock_mode == 0)
> -				*lock_mode = xfs_ilock_data_map_shared(dp);
> +			if (*lock_mode == 0) {
> +				*lock_mode =
> +					xfs_ilock_data_map_shared_generic(dp,
> +					ctx->flags & DIR_CONTEXT_F_NOWAIT);
> +				if (!*lock_mode) {
> +					error = -EAGAIN;
> +					break;
> +				}
> +			}

'generic' doesn't seem like a great suffix to mean 'takes nowait flag'.
And this is far too far indented.

			xfs_dir2_lock(dp, ctx, lock_mode);

with:

STATIC void xfs_dir2_lock(struct xfs_inode *dp, struct dir_context *ctx,
		unsigned int lock_mode)
{
	if (*lock_mode)
		return;
	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
		return xfs_ilock_data_map_shared_nowait(dp);
	return xfs_ilock_data_map_shared(dp);
}

... which I think you can use elsewhere in this patch (reformat it to
XFS coding style, of course).  And then you don't need
xfs_ilock_data_map_shared_generic().

