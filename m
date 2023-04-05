Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7E86D8047
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 17:02:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680706936;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ijdR/MHnRs9yin6C5jhmGmV2EeFx7fyGP+HaH521iTo=;
	b=S/Kk8px0TTFW/95LUyN51x02vE5CKNBjIRAL9mTTZkxD9XnZDmfF3l6rBfDHGd43TBlp6W
	C85EhpRIOuEEUg0JjugyCskiPfFyVEx96ipEvlmL3saPf5orCH9Uv1QMtMcycmIwT1ONmd
	iDCLLJPj0BlGXuk6hhB9ZjU0F37sSMA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-sit-hVTAMjim6Djmv3sF8g-1; Wed, 05 Apr 2023 11:02:08 -0400
X-MC-Unique: sit-hVTAMjim6Djmv3sF8g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 933ED8996E2;
	Wed,  5 Apr 2023 15:01:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 005C540C83B6;
	Wed,  5 Apr 2023 15:01:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BD2651946597;
	Wed,  5 Apr 2023 15:01:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C32C61946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 15:01:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 92EC940C83A9; Wed,  5 Apr 2023 15:01:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BA1F40C20FA
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 15:01:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A7F129AB408
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 15:01:54 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-gpsxkvurMNy5q_TOKpIgSw-1; Wed, 05 Apr 2023 11:01:52 -0400
X-MC-Unique: gpsxkvurMNy5q_TOKpIgSw-1
Received: by mail-qk1-f198.google.com with SMTP id
 66-20020a370345000000b00746886b1593so16279998qkd.14
 for <cluster-devel@redhat.com>; Wed, 05 Apr 2023 08:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680706911;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ijdR/MHnRs9yin6C5jhmGmV2EeFx7fyGP+HaH521iTo=;
 b=8JLAJN4XIfQzzMfqFkXg8PBMAxFO8JLiAi1FqzFT4AHFZlyD5UF8leTBmsWmRFCkeM
 QO6V1EYb8FhR8mJtrEY73rRqNa4py5scLrbeEpccZvdkKwS1ttAV8OaVl3ccQDy4DsOS
 OJdqNzT4sm59Fl7s3GbX71cl0WDwq8rO9aA6okuR+Sf6TfOLXJRMzgAyUJgxu7/XdjJN
 vtlmSx33oteWKVOl7Dtdd3jUS/a+z255OYWHUkU54CHvybejLqqrvoIDxybYiR8YPe5y
 uQnDK6GLF8Fe+6TmHoEA2a2Nfg0HlYVjJBjRjPupXZvadPuVTpv9rg2nNOXvLyLnV8o5
 ggvQ==
X-Gm-Message-State: AAQBX9ezTYLGDBPuo0GuXWqAXH43mMd5KEwDEU/X3qVWy27/eVz1e4Ab
 0qJoXoMWDVg0s+QlL2Sw3P+UMJSUrQes4bpD/KGLM+Wneh/W+LlVHtLvs5cHBwR510d8U7NWlEQ
 4NfpBq8a7Lg8HEAFCWYWa
X-Received: by 2002:a05:6214:2504:b0:5a3:cbc6:8145 with SMTP id
 gf4-20020a056214250400b005a3cbc68145mr11557268qvb.19.1680706910929; 
 Wed, 05 Apr 2023 08:01:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350YVeAhEKCJSk+gIHwjGx6PP08vlMKC4voUohfc6ezEBe0HN6HJNbkVZpy9LxJ1aS1g8D9uc0g==
X-Received: by 2002:a05:6214:2504:b0:5a3:cbc6:8145 with SMTP id
 gf4-20020a056214250400b005a3cbc68145mr11557235qvb.19.1680706910656; 
 Wed, 05 Apr 2023 08:01:50 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a0cc388000000b005dd8b93457dsm4236165qvi.21.2023.04.05.08.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 08:01:49 -0700 (PDT)
Date: Wed, 5 Apr 2023 17:01:42 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20230405150142.3jmxzo5i27bbc4c4@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-20-aalbersh@redhat.com>
 <20230404161047.GA109974@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20230404161047.GA109974@frogsfrogsfrogs>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH v2 19/23] xfs: disable direct read path
 for fs-verity sealed files
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
Cc: fsverity@lists.linux.dev, linux-ext4@vger.kernel.org,
 damien.lemoal@opensource.wdc.com, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 04, 2023 at 09:10:47AM -0700, Darrick J. Wong wrote:
> On Tue, Apr 04, 2023 at 04:53:15PM +0200, Andrey Albershteyn wrote:
> > The direct path is not supported on verity files. Attempts to use direct
> > I/O path on such files should fall back to buffered I/O path.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > ---
> >  fs/xfs/xfs_file.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> > index 947b5c436172..9e072e82f6c1 100644
> > --- a/fs/xfs/xfs_file.c
> > +++ b/fs/xfs/xfs_file.c
> > @@ -244,7 +244,8 @@ xfs_file_dax_read(
> >  	struct kiocb		*iocb,
> >  	struct iov_iter		*to)
> >  {
> > -	struct xfs_inode	*ip = XFS_I(iocb->ki_filp->f_mapping->host);
> > +	struct inode		*inode = iocb->ki_filp->f_mapping->host;
> > +	struct xfs_inode	*ip = XFS_I(inode);
> >  	ssize_t			ret = 0;
> >  
> >  	trace_xfs_file_dax_read(iocb, to);
> > @@ -297,10 +298,17 @@ xfs_file_read_iter(
> >  
> >  	if (IS_DAX(inode))
> >  		ret = xfs_file_dax_read(iocb, to);
> > -	else if (iocb->ki_flags & IOCB_DIRECT)
> > +	else if (iocb->ki_flags & IOCB_DIRECT && !fsverity_active(inode))
> >  		ret = xfs_file_dio_read(iocb, to);
> > -	else
> > +	else {
> > +		/*
> > +		 * In case fs-verity is enabled, we also fallback to the
> > +		 * buffered read from the direct read path. Therefore,
> > +		 * IOCB_DIRECT is set and need to be cleared
> > +		 */
> > +		iocb->ki_flags &= ~IOCB_DIRECT;
> >  		ret = xfs_file_buffered_read(iocb, to);
> 
> XFS doesn't usually allow directio fallback to the pagecache. Why
> would fsverity be any different?

Didn't know that, this is what happens on ext4 so I did the same.
Then it probably make sense to just error on DIRECT on verity
sealed file.

> 
> --D
> 
> > +	}
> >  
> >  	if (ret > 0)
> >  		XFS_STATS_ADD(mp, xs_read_bytes, ret);
> > -- 
> > 2.38.4
> > 
> 

-- 
- Andrey

