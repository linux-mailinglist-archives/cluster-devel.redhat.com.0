Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6407778918E
	for <lists+cluster-devel@lfdr.de>; Sat, 26 Aug 2023 00:16:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693001793;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ppeQOWgbWz5gqWZs/rbytV4GhpZ82FSsmBh/giRYIfc=;
	b=E6NGdU5dT4f1z0VByE4UcG0NQHUH2tZD48qh2TqupB4zY0n0e+sDLW0SyeWjM7/vqjfhAt
	r0N3CCiJuGQLMWy5LE87mca5ExM1LXUENicMq0bN0pUURI/l4o5nXN9M3dtBbl16b/L8ou
	gn3Q0YE9Jd67n3f15oMVejDLp7YN0H8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-IONeA3JfMhOjr4R5JvNBQQ-1; Fri, 25 Aug 2023 18:16:25 -0400
X-MC-Unique: IONeA3JfMhOjr4R5JvNBQQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 778BE185A793;
	Fri, 25 Aug 2023 22:16:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 10B2B492C14;
	Fri, 25 Aug 2023 22:16:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7055919465B9;
	Fri, 25 Aug 2023 22:16:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C85C319465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 22:16:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 962F32166B28; Fri, 25 Aug 2023 22:16:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D7B02166B26
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 22:16:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 718C3858EED
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 22:16:22 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154--SmL0f0XNVeLKqBVSn-Eyg-1; Fri, 25 Aug 2023 18:16:20 -0400
X-MC-Unique: -SmL0f0XNVeLKqBVSn-Eyg-1
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1bf55a81eeaso10269825ad.0
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 15:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693001779; x=1693606579;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ppeQOWgbWz5gqWZs/rbytV4GhpZ82FSsmBh/giRYIfc=;
 b=FAlAPRyUw1MOD93ukGLFVgat6p7HbIZHydCcUdk7K1PFhRbRqaBV7RbXT4w78WSME5
 J2jYbFsW1ltoSpR4eyQTa2jUKawCeBewai0vDGi1c6apI9kjEXtEWxkQVpF9NogUlZYb
 LtTOlVaIVdptHEYl9983E1atppIu3pPPR4nU1xDoj2CoIZF7hfg07udM2ZBkKsLUDsLf
 q+1XrZBaEaVAoQPnSqoNqz206lt6TDPzuNiopuEWYQkvkKfXo4XC2ZhE5hFjE0ZY7pee
 tWFJbkhWHdJxzGQiWHD6qfvEf7J9kD60B9BeoulcwJt8hGoTentSaINu7eEwV8PB0ndu
 gW3g==
X-Gm-Message-State: AOJu0YwJxtjRp0MvIvMhrBMofmT9NJ5anEZBQVq0gZpWvClKKGFw8BgJ
 L1omkmjiecsPC6aVti5/H/5eAQ==
X-Google-Smtp-Source: AGHT+IEjt82Q7/ukix1Bwi0HcqOCAUCGzooSpz1T14B8KRhD3u7v0lApveU1bnKvxuVgpN4iNhxk8w==
X-Received: by 2002:a17:903:264e:b0:1bd:c338:ae14 with SMTP id
 je14-20020a170903264e00b001bdc338ae14mr16243879plb.12.1693001778913; 
 Fri, 25 Aug 2023 15:16:18 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au.
 [49.195.66.88]) by smtp.gmail.com with ESMTPSA id
 f8-20020a170902684800b001c0bf60ba5csm2276046pln.272.2023.08.25.15.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 15:16:18 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qZf6F-006Va3-0j;
 Sat, 26 Aug 2023 08:16:15 +1000
Date: Sat, 26 Aug 2023 08:16:15 +1000
From: Dave Chinner <david@fromorbit.com>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZOkoL8nuXJDVZM1H@dread.disaster.area>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
 <20230825135431.1317785-26-hao.xu@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230825135431.1317785-26-hao.xu@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH 25/29] xfs: support nowait for
 xfs_buf_item_init()
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
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2023 at 09:54:27PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> support nowait for xfs_buf_item_init() and error out -EAGAIN to
> _xfs_trans_bjoin() when it would block.
> 
> Signed-off-by: Hao Xu <howeyxu@tencent.com>
> ---
>  fs/xfs/xfs_buf_item.c         |  9 +++++++--
>  fs/xfs/xfs_buf_item.h         |  2 +-
>  fs/xfs/xfs_buf_item_recover.c |  2 +-
>  fs/xfs/xfs_trans_buf.c        | 16 +++++++++++++---
>  4 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/xfs/xfs_buf_item.c b/fs/xfs/xfs_buf_item.c
> index 023d4e0385dd..b1e63137d65b 100644
> --- a/fs/xfs/xfs_buf_item.c
> +++ b/fs/xfs/xfs_buf_item.c
> @@ -827,7 +827,8 @@ xfs_buf_item_free_format(
>  int
>  xfs_buf_item_init(
>  	struct xfs_buf	*bp,
> -	struct xfs_mount *mp)
> +	struct xfs_mount *mp,
> +	bool   nowait)
>  {
>  	struct xfs_buf_log_item	*bip = bp->b_log_item;
>  	int			chunks;
> @@ -847,7 +848,11 @@ xfs_buf_item_init(
>  		return 0;
>  	}
>  
> -	bip = kmem_cache_zalloc(xfs_buf_item_cache, GFP_KERNEL | __GFP_NOFAIL);
> +	bip = kmem_cache_zalloc(xfs_buf_item_cache,
> +				GFP_KERNEL | (nowait ? 0 : __GFP_NOFAIL));
> +	if (!bip)
> +		return -EAGAIN;
> +
>  	xfs_log_item_init(mp, &bip->bli_item, XFS_LI_BUF, &xfs_buf_item_ops);
>  	bip->bli_buf = bp;

I see filesystem shutdowns....

> diff --git a/fs/xfs/xfs_trans_buf.c b/fs/xfs/xfs_trans_buf.c
> index 016371f58f26..a1e4f2e8629a 100644
> --- a/fs/xfs/xfs_trans_buf.c
> +++ b/fs/xfs/xfs_trans_buf.c
> @@ -57,13 +57,14 @@ xfs_trans_buf_item_match(
>   * If the buffer does not yet have a buf log item associated with it,
>   * then allocate one for it.  Then add the buf item to the transaction.
>   */
> -STATIC void
> +STATIC int
>  _xfs_trans_bjoin(
>  	struct xfs_trans	*tp,
>  	struct xfs_buf		*bp,
>  	int			reset_recur)
>  {
>  	struct xfs_buf_log_item	*bip;
> +	int ret;
>  
>  	ASSERT(bp->b_transp == NULL);
>  
> @@ -72,7 +73,11 @@ _xfs_trans_bjoin(
>  	 * it doesn't have one yet, then allocate one and initialize it.
>  	 * The checks to see if one is there are in xfs_buf_item_init().
>  	 */
> -	xfs_buf_item_init(bp, tp->t_mountp);
> +	ret = xfs_buf_item_init(bp, tp->t_mountp,
> +				tp->t_flags & XFS_TRANS_NOWAIT);
> +	if (ret < 0)
> +		return ret;
> +
>  	bip = bp->b_log_item;
>  	ASSERT(!(bip->bli_flags & XFS_BLI_STALE));
>  	ASSERT(!(bip->__bli_format.blf_flags & XFS_BLF_CANCEL));
> @@ -92,6 +97,7 @@ _xfs_trans_bjoin(
>  	xfs_trans_add_item(tp, &bip->bli_item);
>  	bp->b_transp = tp;
>  
> +	return 0;
>  }
>  
>  void
> @@ -309,7 +315,11 @@ xfs_trans_read_buf_map(
>  	}
>  
>  	if (tp) {
> -		_xfs_trans_bjoin(tp, bp, 1);
> +		error = _xfs_trans_bjoin(tp, bp, 1);
> +		if (error) {
> +			xfs_buf_relse(bp);
> +			return error;
> +		}
>  		trace_xfs_trans_read_buf(bp->b_log_item);

So what happens at the callers when we have a dirty transaction and
joining a buffer fails with -EAGAIN?

Apart from the fact this may well propagate -EAGAIN up to userspace,
cancelling a dirty transaction at this point will result in a
filesystem shutdown....

Indeed, this can happen in the "simple" timestamp update case that
this "nowait" semantic is being aimed at. We log the inode in the
timestamp update, which dirties the log item and registers a
precommit operation to be run. We commit the
transaction, which then runs xfs_inode_item_precommit() and that
may need to attach the inode to the inode cluster buffer. This
results in:

xfs_inode_item_precommit
  xfs_imap_to_bp
    xfs_trans_read_buf_map
      _xfs_trans_bjoin
        xfs_buf_item_init(XFS_TRANS_NOWAIT)
	  kmem_cache_zalloc(GFP_NOFS)
	  <memory allocation fails>
      gets -EAGAIN error
    propagates -EAGAIN
  fails due to -EAGAIN

And now xfs_trans_commit() fails with a dirty transaction and the
filesystem shuts down.

IOWs, XFS_TRANS_NOWAIT as it stands is fundamentally broken. Once we
dirty an item in a transaction, we *cannot* back out of the
transaction. We *must block* in every place that could fail -
locking, memory allocation and/or IO - until the transaction
completes because we cannot undo the changes we've already made to
the dirty items in the transaction....

It's even worse than that - once we have committed intents, the
whole chain of intent processing must be run to completionr. Hence
we can't tolerate backing out of that defered processing chain half
way through because we might have to block.

Until we can roll back partial dirty transactions and partially
completed defered intent chains at any random point of completion,
XFS_TRANS_NOWAIT will not work.

-Dave.
-- 
Dave Chinner
david@fromorbit.com

