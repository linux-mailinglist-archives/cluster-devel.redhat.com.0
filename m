Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5194D72E336
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jun 2023 14:40:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686660035;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QHc7vP5zkhrUmujQoTt/giRPp5gmSgomrWcTeulO5hY=;
	b=QS4+j07MHPiXXYvFB8kkuARuoOGi9GCTzDNgJ3f0ACqK4XzvISdH4L04xh47AMCu3Glpaq
	zjc56gCYB3fxdGunCp42FtvRoj9z7fpWUdD5T+zhdl0ONHBAaOkg9UsG3JBHkTKjtlCR8U
	PRgY2ynpZBeiaskb84ve4ZgssbimmO8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-CmcnYRv1OkehYUtLDl775w-1; Tue, 13 Jun 2023 08:40:31 -0400
X-MC-Unique: CmcnYRv1OkehYUtLDl775w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A6A7803DC0;
	Tue, 13 Jun 2023 12:40:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E8A4492CAC;
	Tue, 13 Jun 2023 12:40:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AC2841946A45;
	Tue, 13 Jun 2023 12:40:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D5112194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue, 13 Jun 2023 12:40:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 96B6A1121315; Tue, 13 Jun 2023 12:40:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FC221121314
 for <cluster-devel@redhat.com>; Tue, 13 Jun 2023 12:40:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70DFA85A5BF
 for <cluster-devel@redhat.com>; Tue, 13 Jun 2023 12:40:24 +0000 (UTC)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-ofB0Ym_AORWRrUxchGI4ww-1; Tue, 13 Jun 2023 08:40:22 -0400
X-MC-Unique: ofB0Ym_AORWRrUxchGI4ww-1
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-53f84f75bf4so2421568a12.3
 for <cluster-devel@redhat.com>; Tue, 13 Jun 2023 05:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686660022; x=1689252022;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QHc7vP5zkhrUmujQoTt/giRPp5gmSgomrWcTeulO5hY=;
 b=hyr6gU0F20EeANHflgyfiV/xDQ+Vf6Erh8wWDRedf4VCRjWrkFRww+S3afNqUXav0l
 MO9j8TgEkiwrbNcze0mDDYrr4Ai/ER5Ze5AvMuQxEYyJl1hb5sR2KwiwgHFi7IbuPPkE
 dkGvOsB+IIMmQHsrO/Q2IX808tuzp91z/suDG0UqNuCz4XKtHpg45be+GQEUqejpmpAy
 DKAsMuDSf6xu0SjUiExwvRybrFa7FSao4S/vuol8oxetsNQbdOloWeMpA6N9KoKcNEyP
 n/f72bzyFZhjRJvVUeZNweY8Q7bu/Kkpea1t+pyk63PopjWMsMDKk6oJmvqmcptHKgtM
 Tb/g==
X-Gm-Message-State: AC+VfDwx7YldZvsRzfISjbxUkhS/8/cOxMZyMk8uqCAvDbWe6k59Z/CV
 pnAsnzsCty92arnh64SNrQ/ocfBRPK2Rx0HeaDIl5LbaMuGB1JomW37swyU888o5v3wIkX14x4x
 Tig522A6fAQqY5k9UsFN/sR8kDK4ZETGJJJhyOA==
X-Received: by 2002:a17:902:f691:b0:1b1:93f9:4305 with SMTP id
 l17-20020a170902f69100b001b193f94305mr10848628plg.60.1686660021767; 
 Tue, 13 Jun 2023 05:40:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Hp1AV+so40D6vobjase0i58jonjTTpJ10KQsC/eF3MECIIlrw38vj43vTRuKgo54y4DUsr0dFY21F9FS4bcQ=
X-Received: by 2002:a17:902:f691:b0:1b1:93f9:4305 with SMTP id
 l17-20020a170902f69100b001b193f94305mr10848604plg.60.1686660021441; Tue, 13
 Jun 2023 05:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230613030637.2934730-1-islituo@gmail.com>
In-Reply-To: <20230613030637.2934730-1-islituo@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 13 Jun 2023 14:40:08 +0200
Message-ID: <CAHc6FU5NdUpYRhu7NR=LDLtX6CKbXvtaM6MJbkaHAZb0Y5Eh2Q@mail.gmail.com>
To: Tuo Li <islituo@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix possible data races in
 gfs2_show_options()
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
Cc: cluster-devel@redhat.com, baijiaju1990@outlook.com,
 linux-kernel@vger.kernel.org, BassCheck <bass@buaa.edu.cn>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 5:07=E2=80=AFAM Tuo Li <islituo@gmail.com> wrote:
> Some fields such as gt_logd_secs of the struct gfs2_tune are accessed
> without holding the lock gt_spin in gfs2_show_options():
>
>   val =3D sdp->sd_tune.gt_logd_secs;
>   if (val !=3D 30)
>     seq_printf(s, ",commit=3D%d", val);
>
> And thus can cause data races when gfs2_show_options() and other function=
s
> such as gfs2_reconfigure() are concurrently executed:
>
>   spin_lock(&gt->gt_spin);
>   gt->gt_logd_secs =3D newargs->ar_commit;
>
> To fix these possible data races, the lock sdp->sd_tune.gt_spin is
> acquired before accessing the fields of gfs2_tune and released after thes=
e
> accesses.
>
> Reported-by: BassCheck <bass@buaa.edu.cn>
> Signed-off-by: Tuo Li <islituo@gmail.com>
> ---
>  fs/gfs2/super.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index a84bf6444bba..671adf38fe03 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -1059,6 +1059,7 @@ static int gfs2_show_options(struct seq_file *s, st=
ruct dentry *root)
>         }
>         if (args->ar_discard)
>                 seq_puts(s, ",discard");
> +       spin_lock(&sdp->sd_tune.gt_spin);
>         val =3D sdp->sd_tune.gt_logd_secs;
>         if (val !=3D 30)
>                 seq_printf(s, ",commit=3D%d", val);
> @@ -1070,6 +1071,7 @@ static int gfs2_show_options(struct seq_file *s, st=
ruct dentry *root)
>         val =3D sdp->sd_tune.gt_quota_quantum;
>         if (val !=3D 60)
>                 seq_printf(s, ",quota_quantum=3D%d", val);
> +       spin_unlock(&sdp->sd_tune.gt_spin);
>         if (args->ar_statfs_percent)
>                 seq_printf(s, ",statfs_percent=3D%d", args->ar_statfs_per=
cent);
>         if (args->ar_errors !=3D GFS2_ERRORS_DEFAULT) {
> --
> 2.34.1
>

Added to for-next (with minor adjustments).

Thanks,
Andreas

