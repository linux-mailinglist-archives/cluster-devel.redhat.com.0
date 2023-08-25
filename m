Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2ED789082
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Aug 2023 23:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692999570;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=o7dRQ9By/T99QWDW5xev9b8rVkM9NZXXwZrmSduoTKY=;
	b=gVr77Vh6aV12VDBBbcitHJmT3JN1c85U+BKitTzzi62okmLveiXt2UAe4lVkWsLMSj7nT+
	Lsxbk/exPidhntC90AvDskLabrt44DgN9K7ZLhjhkMKVzE3L6YPMqCJnKezzun5kFLRnH7
	9mvvzYzaHJhF/wJ7mjgmkfaAAQP4adc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-S4kmWDyvNCKxNyEufU9EmQ-1; Fri, 25 Aug 2023 17:39:27 -0400
X-MC-Unique: S4kmWDyvNCKxNyEufU9EmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23879101A528;
	Fri, 25 Aug 2023 21:39:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 26D832166B27;
	Fri, 25 Aug 2023 21:39:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BDF5919465B7;
	Fri, 25 Aug 2023 21:39:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D2F9519465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 21:39:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BEA79112131B; Fri, 25 Aug 2023 21:39:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B70531121319
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 21:39:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95B1D3C1014E
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 21:39:21 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-0ZQQk4QiOAaNhx2Ks3h-rg-1; Fri, 25 Aug 2023 17:39:17 -0400
X-MC-Unique: 0ZQQk4QiOAaNhx2Ks3h-rg-1
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-68a4bcf8a97so1069031b3a.1
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692999556; x=1693604356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o7dRQ9By/T99QWDW5xev9b8rVkM9NZXXwZrmSduoTKY=;
 b=R4SJPFJv9jpPORxaykVgV2bh6vIDm64xrQTNKpCAgHLxfjEvA/T2Oaq2scVjp5ubwc
 8mJhLoQSK6c3ZjT3dO2WQBC0OLJoWRs0UjSrgM9bPgd2bTii2RBF/QmNkfOJ9rfgRPW9
 QGuafwugvMsRC6ZPPSujE+9ET6rllfJfeV51f/Rs2MFDGPyf1K6Wz2mnIkuJ9bRPliC+
 ZWiM1GazetpSS1pQvl3QltERaZl3wisyuJjzknfAUCPBnu7I3LWYN2unekv7KUveze4S
 zcc3nE0hL37ARj+BytjoDV+ePXuXPmGAZzBBzxr9p+wTjSDhXNSWmJinEmqqxQI2hCpR
 4Ldw==
X-Gm-Message-State: AOJu0Yxeon+TaBAwcutmMqlswLoWxutBA6HPwtG2SrRHIfe+XQlgHuwl
 HHETCH7na4ZT3hHs5E12Li301g==
X-Google-Smtp-Source: AGHT+IFGwDu4J6IE5hfbjc7KSF4OfJEndquVBvBoV5vhWuIhyGy4zoBWcpcC8Lokr19GaOsT0RulfQ==
X-Received: by 2002:a05:6a20:7fa0:b0:140:324c:124c with SMTP id
 d32-20020a056a207fa000b00140324c124cmr22387249pzj.62.1692999556447; 
 Fri, 25 Aug 2023 14:39:16 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au.
 [49.195.66.88]) by smtp.gmail.com with ESMTPSA id
 a14-20020a62bd0e000000b006875df4773fsm1997221pff.163.2023.08.25.14.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 14:39:15 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qZeWO-006Uvd-0J;
 Sat, 26 Aug 2023 07:39:12 +1000
Date: Sat, 26 Aug 2023 07:39:12 +1000
From: Dave Chinner <david@fromorbit.com>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZOkfgBlWKVmGN84i@dread.disaster.area>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
 <20230825135431.1317785-3-hao.xu@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230825135431.1317785-3-hao.xu@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH 02/29] xfs: rename XBF_TRYLOCK to
 XBF_NOWAIT
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2023 at 09:54:04PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> XBF_TRYLOCK means we need lock but don't block on it,

Yes.


> we can use it to
> stand for not waiting for memory allcation. Rename XBF_TRYLOCK to
> XBF_NOWAIT, which is more generic.

No.

Not only can XBF_TRYLOCK require memory allocation, it can require
IO to be issued. We use TRYLOCK for -readahead- and so we *must* be
able to allocate memory and issue IO under TRYLOCK caller
conditions.

[...]

> diff --git a/fs/xfs/libxfs/xfs_attr_remote.c b/fs/xfs/libxfs/xfs_attr_remote.c
> index d440393b40eb..2ccb0867824c 100644
> --- a/fs/xfs/libxfs/xfs_attr_remote.c
> +++ b/fs/xfs/libxfs/xfs_attr_remote.c
> @@ -661,7 +661,7 @@ xfs_attr_rmtval_invalidate(
>  			return error;
>  		if (XFS_IS_CORRUPT(args->dp->i_mount, nmap != 1))
>  			return -EFSCORRUPTED;
> -		error = xfs_attr_rmtval_stale(args->dp, &map, XBF_TRYLOCK);
> +		error = xfs_attr_rmtval_stale(args->dp, &map, XBF_NOWAIT);
>  		if (error)
>  			return error;

XBF_INCORE | XBF_NOWAIT makes no real sense. I mean, XBF_INCORE is
exactly "find a cached buffer or fail" - it's not going to do any
memory allocation or IO so NOWAIT smeantics don't make any sense
here. It's the buffer lock that this lookup is explicitly
avoiding, and so TRYLOCK describes exactly the semantics we want
from this incore lookup.

Indeed, this is a deadlock avoidance mechanism as the transaction
may already have the buffer locked and so we don't want the
xfs_buf_incore() lookup to try to lock the buffer again. TRYLOCK
documents this pretty clearly - NOWAIT loses that context....

> diff --git a/fs/xfs/libxfs/xfs_btree.c b/fs/xfs/libxfs/xfs_btree.c
> index 6a6503ab0cd7..77c4f1d83475 100644
> --- a/fs/xfs/libxfs/xfs_btree.c
> +++ b/fs/xfs/libxfs/xfs_btree.c
> @@ -1343,7 +1343,7 @@ xfs_btree_read_buf_block(
>  	int			error;
>  
>  	/* need to sort out how callers deal with failures first */
> -	ASSERT(!(flags & XBF_TRYLOCK));
> +	ASSERT(!(flags & XBF_NOWAIT));
>  
>  	error = xfs_btree_ptr_to_daddr(cur, ptr, &d);
>  	if (error)
> diff --git a/fs/xfs/scrub/repair.c b/fs/xfs/scrub/repair.c
> index ac6d8803e660..9312cf3b20e2 100644
> --- a/fs/xfs/scrub/repair.c
> +++ b/fs/xfs/scrub/repair.c
> @@ -460,7 +460,7 @@ xrep_invalidate_block(
>  
>  	error = xfs_buf_incore(sc->mp->m_ddev_targp,
>  			XFS_FSB_TO_DADDR(sc->mp, fsbno),
> -			XFS_FSB_TO_BB(sc->mp, 1), XBF_TRYLOCK, &bp);
> +			XFS_FSB_TO_BB(sc->mp, 1), XBF_NOWAIT, &bp);

My point exactly.

xfs_buf_incore() is simply a lookup with XBF_INCORE set. (XBF_INCORE
| XBF_TRYLOCK) has the exactly semantics of "return the buffer only
if it is cached and we can lock it without blocking.

It will not instantiate a new buffer (i.e. do memory allocation) or
do IO because the if it is under IO the buffer lock will be held.

So, essentially, this "NOWAIT" semantic you want is already supplied
by (XBF_INCORE | XBF_TRYLOCK) buffer lookups.

>  	if (error)
>  		return 0;
>  
> diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
> index 15d1e5a7c2d3..9f84bc3b802c 100644
> --- a/fs/xfs/xfs_buf.c
> +++ b/fs/xfs/xfs_buf.c
> @@ -228,7 +228,7 @@ _xfs_buf_alloc(
>  	 * We don't want certain flags to appear in b_flags unless they are
>  	 * specifically set by later operations on the buffer.
>  	 */
> -	flags &= ~(XBF_UNMAPPED | XBF_TRYLOCK | XBF_ASYNC | XBF_READ_AHEAD);
> +	flags &= ~(XBF_UNMAPPED | XBF_NOWAIT | XBF_ASYNC | XBF_READ_AHEAD);
>  
>  	atomic_set(&bp->b_hold, 1);
>  	atomic_set(&bp->b_lru_ref, 1);
> @@ -543,7 +543,7 @@ xfs_buf_find_lock(
>  	struct xfs_buf          *bp,
>  	xfs_buf_flags_t		flags)
>  {
> -	if (flags & XBF_TRYLOCK) {
> +	if (flags & XBF_NOWAIT) {
>  		if (!xfs_buf_trylock(bp)) {
>  			XFS_STATS_INC(bp->b_mount, xb_busy_locked);
>  			return -EAGAIN;
> @@ -886,7 +886,7 @@ xfs_buf_readahead_map(
>  	struct xfs_buf		*bp;
>  
>  	xfs_buf_read_map(target, map, nmaps,
> -		     XBF_TRYLOCK | XBF_ASYNC | XBF_READ_AHEAD, &bp, ops,
> +		     XBF_NOWAIT | XBF_ASYNC | XBF_READ_AHEAD, &bp, ops,
>  		     __this_address);

That will break readahead (which we use extensively in getdents
operations) if we can't allocate buffers and issue IO under NOWAIT
conditions.

>  }
>  
> diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
> index 549c60942208..8cd307626939 100644
> --- a/fs/xfs/xfs_buf.h
> +++ b/fs/xfs/xfs_buf.h
> @@ -45,7 +45,7 @@ struct xfs_buf;
>  
>  /* flags used only as arguments to access routines */
>  #define XBF_INCORE	 (1u << 29)/* lookup only, return if found in cache */
> -#define XBF_TRYLOCK	 (1u << 30)/* lock requested, but do not wait */
> +#define XBF_NOWAIT	 (1u << 30)/* mem/lock requested, but do not wait */

That's now a really poor comment. It doesn't describe the semantics
or constraints that NOWAIT might imply.

-Dave.
-- 
Dave Chinner
david@fromorbit.com

