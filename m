Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0B92EE926F
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Oct 2019 22:58:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572386328;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ewio0VWfd1ldnDhK6FbjzEVt55Oh/tSZLRb4OJ8sqSo=;
	b=auQBdGAq/5wo05XXOhEi6Bs8Pfg47sGiQDZrfMBs/uSnfEmHnRIBvs8vH/cRpoH8Cc0dB2
	LGHvVGaZgK+l/bsVgMoTlk35SWMBMpOBt7UA7aHiM0wKJUYFLw7rkAb67hQeCGXza0T/Lw
	0jHcW0XW6c8TA7QLsqOdF2d6vQsfVDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-khx-uWL9M6Od3rG3OjSHaw-1; Tue, 29 Oct 2019 17:58:46 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDCB8107AD28;
	Tue, 29 Oct 2019 21:58:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54F34600CC;
	Tue, 29 Oct 2019 21:58:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 545E01802214;
	Tue, 29 Oct 2019 21:58:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9TLwdK5011584 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 29 Oct 2019 17:58:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B03E55D6D0; Tue, 29 Oct 2019 21:58:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A95825D6C5
	for <cluster-devel@redhat.com>; Tue, 29 Oct 2019 21:58:36 +0000 (UTC)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
	[209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6B12C049E79
	for <cluster-devel@redhat.com>; Tue, 29 Oct 2019 21:58:35 +0000 (UTC)
Received: by mail-ot1-f70.google.com with SMTP id s5so25231otk.19
	for <cluster-devel@redhat.com>; Tue, 29 Oct 2019 14:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SVhurLLw0edw4Be2e3WblPQmxQrvgRmczMIIDBjM3d4=;
	b=iQEqK8fGG0a2ezyTT4HdOo9ItRDvDnRlXqfngdL9rSjGzoXVgsI1TBR+GjN0xyCIGq
	Zb+TYbESY2z5P/PNmKofPqkSyU/YTzJsU0JZPaTWlhdcb1niQSbv6qFklhIAhExwKkCI
	uLB8UUh44zNcRLWABJ8+B7DCzlG9Yjs2VU9ePNldZYaEpHGGMr5O02PaCN7b7onqnhiH
	3yu3EAKLfa0lkDBnpbUivqKnr4f4fwJ7M00vcZWpqhpT4YuNBF5CQgFBvjPfkWYhKKRJ
	m5rqwgweAUz9zyw3lfjyef+qSJuV5e1pm18pKkTr0ID+MASeWP4VER7cao350xetvGxT
	ohqA==
X-Gm-Message-State: APjAAAXMNEBs67GUj5FeuKV4Ohy0BFxGiIPQ6sxEhcd12dIAJJ7iYl6F
	X2vCu9Ri8cFNoZXpsYH61WbKzPJle5/SNtz4efi0wGXqUuPNE7gJIAx1Iwdn2Bxt/gZxCXM0hUP
	SL9UKlbbaj4BuJ/gn4/vHTmsPV2bcl8WtcBcs/A==
X-Received: by 2002:a05:6830:20d2:: with SMTP id
	z18mr3343620otq.297.1572386315355; 
	Tue, 29 Oct 2019 14:58:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzfTKfpU8D+EKlQVNQcixZ7wtJc4UYmicgezfEnsZTvGeM625y5JDFqGkhV4Z9mrDjHuwfqgyBzgJgv9PT4VMg=
X-Received: by 2002:a05:6830:20d2:: with SMTP id
	z18mr3343606otq.297.1572386315134; 
	Tue, 29 Oct 2019 14:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191029200934.16088-1-anprice@redhat.com>
In-Reply-To: <20191029200934.16088-1-anprice@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 29 Oct 2019 22:58:23 +0100
Message-ID: <CAHc6FU5MyPf09RQL-mKcwqqyUAssHKfrV+8iF8K3MnLMOvv9Hw@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix initialisation of args for
	remount
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: khx-uWL9M6Od3rG3OjSHaw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2019 at 9:10 PM Andrew Price <anprice@redhat.com> wrote:
> When gfs2 was converted to use fs_context, the initialisation of the
> mount args structure to the currently active args was lost with the
> removal of gfs2_remount_fs(), so the checks of the new args on remount
> became checks against the default values instead of the current ones.
> This caused unexpected remount behaviour and test failures (xfstests
> generic/294, generic/306 and generic/452).
>
> Reinstate the args initialisation, this time in gfs2_init_fs_context()
> and conditional upon fc->purpose, as that's the only time we get control
> before the mount args are parsed in the remount process.
>
> Fixes: 1f52aa08d12f ("gfs2: Convert gfs2 to fs_context")
> Signed-off-by: Andrew Price <anprice@redhat.com>
> ---
>
>  fs/gfs2/ops_fstype.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index dc61af2c4d5e..1f247a0ab6ef 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -1544,13 +1544,18 @@ static int gfs2_init_fs_context(struct fs_context=
 *fc)
>         if (args =3D=3D NULL)
>                 return -ENOMEM;
>
> -       args->ar_quota =3D GFS2_QUOTA_DEFAULT;
> -       args->ar_data =3D GFS2_DATA_DEFAULT;
> -       args->ar_commit =3D 30;
> -       args->ar_statfs_quantum =3D 30;
> -       args->ar_quota_quantum =3D 60;
> -       args->ar_errors =3D GFS2_ERRORS_DEFAULT;
> +       if (fc->purpose =3D=3D FS_CONTEXT_FOR_RECONFIGURE) {
> +               struct gfs2_sbd *sdp =3D fc->root->d_sb->s_fs_info;
>
> +               *args =3D sdp->sd_args;

Since we're fully overwriting args here, shouldn't we use kmalloc to
allocate args above ...

> +       } else {

... and memset it to 0 in this case?

> +               args->ar_quota =3D GFS2_QUOTA_DEFAULT;
> +               args->ar_data =3D GFS2_DATA_DEFAULT;
> +               args->ar_commit =3D 30;
> +               args->ar_statfs_quantum =3D 30;
> +               args->ar_quota_quantum =3D 60;
> +               args->ar_errors =3D GFS2_ERRORS_DEFAULT;
> +       }
>         fc->fs_private =3D args;
>         fc->ops =3D &gfs2_context_ops;
>         return 0;
> --
> 2.21.0
>

Thanks,
Andreas

