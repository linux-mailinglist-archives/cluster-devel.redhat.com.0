Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B337890EB
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Aug 2023 23:58:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693000706;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KYhyzbAkZA6I0JpkJP7NgCytRvclFoiu9vcGiedxJnM=;
	b=LTn9NXyiNw/9nEYCqmfmx1JDUf7LurHoBHTvyC75sRvSrgT9sX/tM9uKsr57Mk5j7TB7hs
	iW8rpx6HF2qQKTs30gmmKLCIKtnPs2hCv+uY5cf9Q0Ko+o7lraxwqNr6p/wrM0SRw/aBTm
	l3fUB1YxK3rotstkFeoGVo5HwegTpSc=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-MOiwImO_PZ-X2n8PpyHOTg-1; Fri, 25 Aug 2023 17:58:23 -0400
X-MC-Unique: MOiwImO_PZ-X2n8PpyHOTg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9015B1C04B51;
	Fri, 25 Aug 2023 21:58:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7ADCF40C2073;
	Fri, 25 Aug 2023 21:58:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5394F19465B3;
	Fri, 25 Aug 2023 21:58:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D6F1A19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 21:58:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C4E61C1602E; Fri, 25 Aug 2023 21:58:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC4BCC1602B
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 21:58:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C3111C05146
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 21:58:20 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-2_kcmkcNNCyfYEGxxaUGJw-1; Fri, 25 Aug 2023 17:58:18 -0400
X-MC-Unique: 2_kcmkcNNCyfYEGxxaUGJw-1
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1bf1935f6c2so10097365ad.1
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693000697; x=1693605497;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KYhyzbAkZA6I0JpkJP7NgCytRvclFoiu9vcGiedxJnM=;
 b=ejpqUvZMRn9OO7JX8cSxC4yBmgjuNv3/orwleBB7B+QGjfBHlmNkhuFzLvl4IakbuT
 RXVpfE65kFAVZkd7zmlQasn9i+zBCZXjVeaL4U6EYtHS3FAWkIRmsTDz0A37H+otrCRK
 jnq90IKEJOjijynb3FQF2vuZCXG76+lKw9+QI/rZsKKm31G/9k0eqBO3ZvWeG/7jv0jz
 m5oeAoLEtxlzTM/AzPBDUxiO0ybN6UOXHkgIOF9C+hcwSVlBPd2gxW+j/uBuRVLHQku7
 8O01KvQTKJDOX8FYAjtjkdQ8fsKCJW18Hfh51d6P2teqkIAosyV9BVewOJBIf+nxZPcy
 W9uw==
X-Gm-Message-State: AOJu0YzMZPXbZqaqvYk0INtm5Ml/EUqDavfLbja593JtiZrbQYLgojC6
 oE8liRo6jL0/5Qv6cy5HG6FS0A==
X-Google-Smtp-Source: AGHT+IGbNBRmb5i9MT6K586yDhJt+XUD4xbkK8zWzYl+0zg/QCNqIJVK22pGEJPGpFxCH5bzJj3AjQ==
X-Received: by 2002:a17:902:c454:b0:1b8:6984:f5e5 with SMTP id
 m20-20020a170902c45400b001b86984f5e5mr20508009plm.12.1693000697391; 
 Fri, 25 Aug 2023 14:58:17 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au.
 [49.195.66.88]) by smtp.gmail.com with ESMTPSA id
 13-20020a170902c24d00b0019ee045a2b3sm2241969plg.308.2023.08.25.14.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 14:58:16 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qZeoo-006VLc-08;
 Sat, 26 Aug 2023 07:58:14 +1000
Date: Sat, 26 Aug 2023 07:58:14 +1000
From: Dave Chinner <david@fromorbit.com>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZOkj9uTkoHPR/tDV@dread.disaster.area>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
 <20230825135431.1317785-27-hao.xu@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230825135431.1317785-27-hao.xu@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH 26/29] xfs: return -EAGAIN when nowait
 meets sync in transaction commit
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2023 at 09:54:28PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> if the log transaction is a sync one, let's fail the nowait try and
> return -EAGAIN directly since sync transaction means blocked by IO.
> 
> Signed-off-by: Hao Xu <howeyxu@tencent.com>
> ---
>  fs/xfs/xfs_trans.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
> index 7988b4c7f36e..f1f84a3dd456 100644
> --- a/fs/xfs/xfs_trans.c
> +++ b/fs/xfs/xfs_trans.c
> @@ -968,12 +968,24 @@ __xfs_trans_commit(
>  	xfs_csn_t		commit_seq = 0;
>  	int			error = 0;
>  	int			sync = tp->t_flags & XFS_TRANS_SYNC;
> +	bool			nowait = tp->t_flags & XFS_TRANS_NOWAIT;
> +	bool			perm_log = tp->t_flags & XFS_TRANS_PERM_LOG_RES;
>  
>  	trace_xfs_trans_commit(tp, _RET_IP_);
>  
> +	if (nowait && sync) {
> +		/*
> +		 * Currently nowait is only from xfs_vn_update_time()
> +		 * so perm_log is always false here, but let's make
> +		 * code general.
> +		 */
> +		if (perm_log)
> +			xfs_defer_cancel(tp);
> +		goto out_unreserve;
> +	}

This is fundamentally broken.  We cannot about a transaction commit
with dirty items at this point with shutting down the filesystem.

This points to XFS_TRANS_NOWAIT being completely broken, too,
because we don't call xfs_trans_set_sync() until just before we
commit the transaction. At this point, it is -too late- for
nowait+sync to be handled gracefully, and it will *always* go bad.

IOWs, the whole transaction "nowait" semantics as designed and
implemented is not a workable solution....

-Dave.
-- 
Dave Chinner
david@fromorbit.com

