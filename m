Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 262533D9549
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Jul 2021 20:29:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627496963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=dsqfNl4dSAxOlG5YsbYQ/wApeEY/B/MuM0gwCH241I8=;
	b=L4TXOI6erX4GyF0XVWfrjVp/YCcc5roV2vw22roKJuBgyGGXfpbVc11Hsvb5o+HblrfE6n
	dk0V0s8TSHPJ1cg8doehJIvJZuOy0ecXzc6xyJZwtO19gCZKNy7cE8DYEAva5fDBDeHGPI
	B/GCSf7gAYdzkpcXCzN5gE5tyrcEWjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-UUV4jfgdOMiKkJ2EzQIaBA-1; Wed, 28 Jul 2021 14:29:22 -0400
X-MC-Unique: UUV4jfgdOMiKkJ2EzQIaBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F0DC190A7A0;
	Wed, 28 Jul 2021 18:29:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10C3910016FD;
	Wed, 28 Jul 2021 18:29:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83F48180BAB1;
	Wed, 28 Jul 2021 18:29:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16SITB4N014110 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Jul 2021 14:29:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 372E42089A12; Wed, 28 Jul 2021 18:29:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31D6F208AB85
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 18:29:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A732480018D
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 18:29:08 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-433-ZbOaFmjzOQC2wH97UV_pAA-1; Wed, 28 Jul 2021 14:29:07 -0400
X-MC-Unique: ZbOaFmjzOQC2wH97UV_pAA-1
Received: by mail-wr1-f69.google.com with SMTP id
	f6-20020adfe9060000b0290153abe88c2dso1253114wrm.20
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 11:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dsqfNl4dSAxOlG5YsbYQ/wApeEY/B/MuM0gwCH241I8=;
	b=OfWLp8E6DLDtcF09nq1XNCWgK4r84vNQWKyQmUMtcD2bYTKs0s+ZXA2DihBsSH3S6z
	4YaHVHDH8QwJVB4Zu79eM2Ru4lk9w7Gr965wp2egCyML4EbZ3Z35n2ewCcGO8NKcr3UK
	KkQ9VQXy5r0MAOK4J9XrvY+cW680Qtcluw3SGC3eEIK+SUWn8JZ78+kcxvjtC2LIBbF/
	LEOyyuemXsrukHalVCbftWDIJg5QQleN4bIF+WQhcPMxKAepXOa5cekfizl0M+UDfQZw
	sz71tAJHZm847wUdsgdD5cNmUbDDHGMSHgLxBeLRYYdiPxYbNVP7cd5SjIJ47tvq9sDI
	21Gg==
X-Gm-Message-State: AOAM532aUacFJonRlbDE1340kTy3ANOotukEnLk2frAJU6GQYoqRm41S
	wi4vvwfsEb9/Gka0MxoR25S/nED2h7iG7hsCiQD40cyHBQBNP3SklweOSc9CVTNFqesGSWdcbGN
	We1b5vS2pTo6XFr+ORWhRhqTpJipE78Sha55eOQ==
X-Received: by 2002:a5d:540d:: with SMTP id g13mr678887wrv.329.1627496946014; 
	Wed, 28 Jul 2021 11:29:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmQqyvdNyA/YfTla5wNd1PZMi8ok6Yyj9KZjkxXhHJKcCpghgx/kg3XyiRqVdphl+xYtbklNIsO801A9zqFoY=
X-Received: by 2002:a5d:540d:: with SMTP id g13mr678875wrv.329.1627496945854; 
	Wed, 28 Jul 2021 11:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210727173709.210711-1-rpeterso@redhat.com>
	<20210727173709.210711-14-rpeterso@redhat.com>
In-Reply-To: <20210727173709.210711-14-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 28 Jul 2021 20:28:54 +0200
Message-ID: <CAHc6FU4MUkurXhtbRrwuF846Dz7eT9+RBFntEs+_bzV6YO=GSA@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 13/15] gfs2: ignore
 usr|grp|prjquota mount options
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 27, 2021 at 7:37 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, gfs2 rejected mounts attempted with the usrquota,
> grpquota, or prjquota mount options. That caused numerous xfstests tests
> to fail. This patch allows gfs2 to accept but ignore those mount options
> so the tests may be run.

We can't just fake this up. Instead, the fstests need to be fixed to
skip tests that don't run on particular filesystems.

> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/ops_fstype.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 8051f130cf53..69bdc2917fb5 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -1373,6 +1373,7 @@ enum gfs2_param {
>         Opt_barrier,
>         Opt_rgrplvb,
>         Opt_loccookie,
> +       Opt_ignore,
>  };
>
>  static const struct constant_table gfs2_param_quota[] = {
> @@ -1431,6 +1432,9 @@ static const struct fs_parameter_spec gfs2_fs_parameters[] = {
>         /* quota can be a flag or an enum so it gets special treatment */
>         fsparam_flag_no("quota",              Opt_quota_flag),
>         fsparam_enum("quota",                 Opt_quota, gfs2_param_quota),
> +       fsparam_flag("usrquota",              Opt_ignore),
> +       fsparam_flag("grpquota",              Opt_ignore),
> +       fsparam_flag("prjquota",              Opt_ignore),
>         {}
>  };
>
> @@ -1532,6 +1536,8 @@ static int gfs2_parse_param(struct fs_context *fc, struct fs_parameter *param)
>         case Opt_loccookie:
>                 args->ar_loccookie = result.boolean;
>                 break;
> +       case Opt_ignore:
> +               break;
>         default:
>                 return invalfc(fc, "invalid mount option: %s", param->key);
>         }
> --
> 2.31.1
>

Andreas

