Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FE7711058
	for <lists+cluster-devel@lfdr.de>; Thu, 25 May 2023 18:04:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685030652;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WiRt50oXKhasmrzR2kh6FHaULiNwoG0spSQORGoTHTA=;
	b=LeKitGgH0ui9I59p3JN8+3l7Zgt3Km82MYuZj3CKTQawvD8UWj7+Vw/K2hu8a8sVW2rEBR
	e1Nm+5xvylpGnzWfP0m7YeTDZ4ycn7gSTYVGbNFfDhjQb17RY91Qpr3DhPdRLs1NoKZjt9
	YZXctST4z7Gbc6tqwHBQVsVLSkKs0XY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-d-6Wh71_MiSK53ciG4y6jQ-1; Thu, 25 May 2023 12:04:08 -0400
X-MC-Unique: d-6Wh71_MiSK53ciG4y6jQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98B7C2A59541;
	Thu, 25 May 2023 16:04:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 437AB200AD47;
	Thu, 25 May 2023 16:04:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E512319465B1;
	Thu, 25 May 2023 16:04:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7441D19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 May 2023 16:03:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 54C90492B0A; Thu, 25 May 2023 16:03:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DD25492B0B
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 16:03:01 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27D133C0ED65
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 16:03:01 +0000 (UTC)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-ifLThkXrMWKMaMBEqiwHRQ-1; Thu, 25 May 2023 12:02:51 -0400
X-MC-Unique: ifLThkXrMWKMaMBEqiwHRQ-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1ae6b280bacso9998945ad.0
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 09:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685030570; x=1687622570;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WiRt50oXKhasmrzR2kh6FHaULiNwoG0spSQORGoTHTA=;
 b=Ei5X7NklQZCk0sc+c2UfPFl1gLNGtegblyesIlb/ZuiVwtGatbsZlyx1PfNW+wwnX0
 4RHo9zrZgKeHkc8t+91OqOU7ouPVrWatK+8PCijJMk2piepccaLfjYWwNd+3P48zwkc3
 JD3p6klnRkmu6e0I1XVzBw2hieTPkEwZxeKH6pjmA0H1OR2YVjirWQhqIF2lor7+QU7j
 0+dEISp3XtGhcFRoWCfkpsj02o5F81cwFWoYPeJmtziPfeL78NpYzgmp6BKPiF0hVT1K
 twmfDhM1jbd82lbJrgJG157a11uI7VdghTXVAu/95DBMiQDX2QhXl6/oN0/TgMu8mqVf
 6O4Q==
X-Gm-Message-State: AC+VfDy3vZEjadSv4SwnyRisrVSfKcBLW16OqbE8ae7IHxv1Aa176hvl
 13qSwvoDHJsoWPW8W5xksVjzdYO88TE9lgrzACNxxWVpZgH31TFe6E5RDZR5vQTlmmbGKCdG+bj
 mz9ei6jzvcSH0GbKsEHsMoblQu+3+kSBVRlu3Tw==
X-Received: by 2002:a17:902:f54c:b0:1af:f64c:f363 with SMTP id
 h12-20020a170902f54c00b001aff64cf363mr3052070plf.15.1685030569934; 
 Thu, 25 May 2023 09:02:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6IxaSUVZPKltFK7HOITIsIRGnmd5NzIdTwh6dJNU2vgkdbKhe1zl+1aodXLLyyl7kcWSFpgVAL2XCU4JAoynY=
X-Received: by 2002:a17:902:f54c:b0:1af:f64c:f363 with SMTP id
 h12-20020a170902f54c00b001aff64cf363mr3052030plf.15.1685030569588; Thu, 25
 May 2023 09:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230524063810.1595778-1-hch@lst.de>
 <20230524063810.1595778-8-hch@lst.de>
In-Reply-To: <20230524063810.1595778-8-hch@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 25 May 2023 18:02:37 +0200
Message-ID: <CAHc6FU6akk6yg1YGpgq-XqMv7soOLA4_Jg17T1M+NKn1PRmJkg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 07/11] iomap: update ki_pos in
 iomap_file_buffered_write
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Chao Yu <chao@kernel.org>,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 8:54=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
> All callers of iomap_file_buffered_write need to updated ki_pos, move it
> into common code.

Thanks for this set of cleanups, especially for the patch killing
current->backing_dev_info.

Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Damien Le Moal <dlemoal@kernel.org>
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  fs/gfs2/file.c         | 4 +---
>  fs/iomap/buffered-io.c | 9 ++++++---
>  fs/xfs/xfs_file.c      | 2 --
>  fs/zonefs/file.c       | 4 +---
>  4 files changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index 904a0d6ac1a1a9..c6a7555d5ad8bb 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -1044,10 +1044,8 @@ static ssize_t gfs2_file_buffered_write(struct kio=
cb *iocb,
>         pagefault_disable();
>         ret =3D iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
>         pagefault_enable();
> -       if (ret > 0) {
> -               iocb->ki_pos +=3D ret;
> +       if (ret > 0)
>                 written +=3D ret;
> -       }
>
>         if (inode =3D=3D sdp->sd_rindex)
>                 gfs2_glock_dq_uninit(statfs_gh);
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 063133ec77f49e..550525a525c45c 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -864,16 +864,19 @@ iomap_file_buffered_write(struct kiocb *iocb, struc=
t iov_iter *i,
>                 .len            =3D iov_iter_count(i),
>                 .flags          =3D IOMAP_WRITE,
>         };
> -       int ret;
> +       ssize_t ret;
>
>         if (iocb->ki_flags & IOCB_NOWAIT)
>                 iter.flags |=3D IOMAP_NOWAIT;
>
>         while ((ret =3D iomap_iter(&iter, ops)) > 0)
>                 iter.processed =3D iomap_write_iter(&iter, i);
> -       if (iter.pos =3D=3D iocb->ki_pos)
> +
> +       if (unlikely(ret < 0))
>                 return ret;
> -       return iter.pos - iocb->ki_pos;
> +       ret =3D iter.pos - iocb->ki_pos;
> +       iocb->ki_pos +=3D ret;
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
>
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index 431c3fd0e2b598..d57443db633637 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -720,8 +720,6 @@ xfs_file_buffered_write(
>         trace_xfs_file_buffered_write(iocb, from);
>         ret =3D iomap_file_buffered_write(iocb, from,
>                         &xfs_buffered_write_iomap_ops);
> -       if (likely(ret >=3D 0))
> -               iocb->ki_pos +=3D ret;
>
>         /*
>          * If we hit a space limit, try to free up some lingering preallo=
cated
> diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
> index 132f01d3461f14..e212d0636f848e 100644
> --- a/fs/zonefs/file.c
> +++ b/fs/zonefs/file.c
> @@ -643,9 +643,7 @@ static ssize_t zonefs_file_buffered_write(struct kioc=
b *iocb,
>                 goto inode_unlock;
>
>         ret =3D iomap_file_buffered_write(iocb, from, &zonefs_write_iomap=
_ops);
> -       if (ret > 0)
> -               iocb->ki_pos +=3D ret;
> -       else if (ret =3D=3D -EIO)
> +       if (ret =3D=3D -EIO)
>                 zonefs_io_error(inode, true);
>
>  inode_unlock:
> --
> 2.39.2
>

