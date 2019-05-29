Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B912E231
	for <lists+cluster-devel@lfdr.de>; Wed, 29 May 2019 18:22:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 587B6308219E;
	Wed, 29 May 2019 16:21:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 702B21972C;
	Wed, 29 May 2019 16:21:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B07F1806B14;
	Wed, 29 May 2019 16:21:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TGKvKd009933 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 12:20:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EADFE1001E71; Wed, 29 May 2019 16:20:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E59011001E9A
	for <cluster-devel@redhat.com>; Wed, 29 May 2019 16:20:55 +0000 (UTC)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
	[209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A308CA0B58
	for <cluster-devel@redhat.com>; Wed, 29 May 2019 16:20:55 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id w110so1346870otb.10
	for <cluster-devel@redhat.com>; Wed, 29 May 2019 09:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nDmpuf+PehJ/033vvPY0Btmz6+RepCx4HZ4B8YD6Iv0=;
	b=t89M9etVEgjohe4kKtW4XVM0Lgs326SCNELzblCzvcwe1jl4P+OGVuRAbtQU81GNB7
	WWgYy5BqZO8N7pudNIoshulgKGvTEnJHT3FgIWWK4SnKt7XZN6kM/uZ8OtjtNHj2FGVC
	Jka7t2H/zoFwV4RaP81TALD1s4ja4E/tg4GO9K8L3gQkOFH9Sg+0YLgfQvPDFPvihiHT
	LKmh0UySOhPQVT1fpwjjqgRXfKJ+Z0jtPlV3Ml1bMKestYsmie3HS8x2uorMBaAI82hB
	PUq/e5ovOvzleOskD66ilrw2ecO+pNaB+FCg2q1cijv5OW0aU9LMSStpO6B7WKkF/7mh
	OuNg==
X-Gm-Message-State: APjAAAWigco+p98tlNIh5DYhTQJPXqFaum/PzucQvORQfzI6fPvrNU4X
	wX48T7NVv20N737+9R4ssragAwCDOkFIy2vgKg28lcGVUs2ViCyc9wzqXFnbhyHntrgdfkIWzS5
	wZed7D0upjzqYwuB2F3M+mh1e6ulY78tEKj8K/w==
X-Received: by 2002:a9d:6c06:: with SMTP id f6mr1691256otq.185.1559146854774; 
	Wed, 29 May 2019 09:20:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLo/gfg6LwGJ+lLb5l3Wnopj4fOll44OgS4Z9rilZFtInNomzL5yEFuletN07IdeW6rXv0TVWIgfnaGZbhpEw=
X-Received: by 2002:a9d:6c06:: with SMTP id f6mr1691234otq.185.1559146854476; 
	Wed, 29 May 2019 09:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190523130421.21003-1-rpeterso@redhat.com>
	<20190523130421.21003-9-rpeterso@redhat.com>
In-Reply-To: <20190523130421.21003-9-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 29 May 2019 18:20:43 +0200
Message-ID: <CAHc6FU5b3QB_Eg2GkAtvyd+aPo=6ZYrZZwSaAZVHuSVag9buHQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH v6 08/26] gfs2: replace more printk
 with calls to fs_info and friends
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 29 May 2019 16:22:02 +0000 (UTC)

On Thu, 23 May 2019 at 15:05, Bob Peterson <rpeterso@redhat.com> wrote:
>
> This patch replaces a few leftover printk errors with calls to
> fs_info and similar, so that the file system having the error is
> properly logged.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/bmap.c  |  2 +-
>  fs/gfs2/glops.c |  3 ++-
>  fs/gfs2/rgrp.c  | 27 ++++++++++++++-------------
>  fs/gfs2/super.c |  6 +++---
>  4 files changed, 20 insertions(+), 18 deletions(-)
>
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index f42718dd292f..a809aa887521 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -1862,7 +1862,7 @@ static int punch_hole(struct gfs2_inode *ip, u64 offset, u64 length)
>                         gfs2_assert_withdraw(sdp, bh);
>                         if (gfs2_assert_withdraw(sdp,
>                                                  prev_bnr != bh->b_blocknr)) {
> -                               printk(KERN_EMERG "GFS2: fsid=%s:inode %llu, "
> +                               fs_emerg(sdp, "GFS2: fsid=%s:inode %llu, "
>                                        "block:%llu, i_h:%u, s_h:%u, mp_h:%u\n",
>                                        sdp->sd_fsname,
>                                        (unsigned long long)ip->i_no_addr,

The fsid is printed twice here; that won't help.

> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index 84a403ed6e77..1e5720e50e9c 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -509,7 +509,8 @@ static void freeze_go_sync(struct gfs2_glock *gl)
>                 atomic_set(&sdp->sd_freeze_state, SFS_STARTING_FREEZE);
>                 error = freeze_super(sdp->sd_vfs);
>                 if (error) {
> -                       printk(KERN_INFO "GFS2: couldn't freeze filesystem: %d\n", error);
> +                       fs_info(sdp, "GFS2: couldn't freeze filesystem: %d\n",
> +                               error);
>                         gfs2_assert_withdraw(sdp, 0);
>                 }
>                 queue_work(gfs2_freeze_wq, &sdp->sd_freeze_work);
> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
> index ed3a6d3973a9..985d968b042c 100644
> --- a/fs/gfs2/rgrp.c
> +++ b/fs/gfs2/rgrp.c
> @@ -1115,32 +1115,33 @@ static int gfs2_rgrp_lvb_valid(struct gfs2_rgrpd *rgd)
>  {
>         struct gfs2_rgrp_lvb *rgl = rgd->rd_rgl;
>         struct gfs2_rgrp *str = (struct gfs2_rgrp *)rgd->rd_bits[0].bi_bh->b_data;
> +       struct gfs2_sbd *sdp = rgd->rd_sbd;
>         int valid = 1;
>
>         if (rgl->rl_flags != str->rg_flags) {
> -               printk(KERN_WARNING "GFS2: rgd: %llu lvb flag mismatch %u/%u",
> -                      (unsigned long long)rgd->rd_addr,
> +               fs_warn(sdp, "GFS2: rgd: %llu lvb flag mismatch %u/%u",
> +                       (unsigned long long)rgd->rd_addr,
>                        be32_to_cpu(rgl->rl_flags), be32_to_cpu(str->rg_flags));
>                 valid = 0;
>         }
>         if (rgl->rl_free != str->rg_free) {
> -               printk(KERN_WARNING "GFS2: rgd: %llu lvb free mismatch %u/%u",
> -                      (unsigned long long)rgd->rd_addr,
> -                      be32_to_cpu(rgl->rl_free), be32_to_cpu(str->rg_free));
> +               fs_warn(sdp, "GFS2: rgd: %llu lvb free mismatch %u/%u",
> +                       (unsigned long long)rgd->rd_addr,
> +                       be32_to_cpu(rgl->rl_free), be32_to_cpu(str->rg_free));
>                 valid = 0;
>         }
>         if (rgl->rl_dinodes != str->rg_dinodes) {
> -               printk(KERN_WARNING "GFS2: rgd: %llu lvb dinode mismatch %u/%u",
> -                      (unsigned long long)rgd->rd_addr,
> -                      be32_to_cpu(rgl->rl_dinodes),
> -                      be32_to_cpu(str->rg_dinodes));
> +               fs_warn(sdp, "GFS2: rgd: %llu lvb dinode mismatch %u/%u",
> +                       (unsigned long long)rgd->rd_addr,
> +                       be32_to_cpu(rgl->rl_dinodes),
> +                       be32_to_cpu(str->rg_dinodes));
>                 valid = 0;
>         }
>         if (rgl->rl_igeneration != str->rg_igeneration) {
> -               printk(KERN_WARNING "GFS2: rgd: %llu lvb igen mismatch "
> -                      "%llu/%llu", (unsigned long long)rgd->rd_addr,
> -                      (unsigned long long)be64_to_cpu(rgl->rl_igeneration),
> -                      (unsigned long long)be64_to_cpu(str->rg_igeneration));
> +               fs_warn(sdp, "GFS2: rgd: %llu lvb igen mismatch %llu/%llu",
> +                       (unsigned long long)rgd->rd_addr,
> +                       (unsigned long long)be64_to_cpu(rgl->rl_igeneration),
> +                       (unsigned long long)be64_to_cpu(str->rg_igeneration));
>                 valid = 0;
>         }
>         return valid;
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 6e3a318edccd..62cc451f30d5 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -981,14 +981,14 @@ void gfs2_freeze_func(struct work_struct *work)
>         error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED, 0,
>                                    &freeze_gh);
>         if (error) {
> -               printk(KERN_INFO "GFS2: couldn't get freeze lock : %d\n", error);
> +               fs_info(sdp, "GFS2: couldn't get freeze lock : %d\n", error);
>                 gfs2_assert_withdraw(sdp, 0);
>         } else {
>                 atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
>                 error = thaw_super(sb);
>                 if (error) {
> -                       printk(KERN_INFO "GFS2: couldn't thaw filesystem: %d\n",
> -                              error);
> +                       fs_info(sdp, "GFS2: couldn't thaw filesystem: %d\n",
> +                               error);
>                         gfs2_assert_withdraw(sdp, 0);
>                 }
>                 if (!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))
> --
> 2.21.0
>

Thanks,
Andreas

