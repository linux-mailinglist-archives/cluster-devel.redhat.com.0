Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C2D1659C
	for <lists+cluster-devel@lfdr.de>; Tue,  7 May 2019 16:26:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 267583088A60;
	Tue,  7 May 2019 14:26:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B39683DA5;
	Tue,  7 May 2019 14:26:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 924F818089CC;
	Tue,  7 May 2019 14:26:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x47EQNIY013405 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 10:26:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4C95060C73; Tue,  7 May 2019 14:26:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4715160C72
	for <cluster-devel@redhat.com>; Tue,  7 May 2019 14:26:19 +0000 (UTC)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
	[209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C9C22D7F5
	for <cluster-devel@redhat.com>; Tue,  7 May 2019 14:26:19 +0000 (UTC)
Received: by mail-oi1-f199.google.com with SMTP id d9so3534839oia.16
	for <cluster-devel@redhat.com>; Tue, 07 May 2019 07:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=usO/X/Kr4JtMk4ZwvhVPS5BgEDROKK399Wg3vL4XMeQ=;
	b=BVwqpBS5cRUvuUnO49vfHeYjKHG6BATJh3wbFbpmR6mMWTvZk/jnmzFJEZgsTrsEGt
	r8hd/ArKNv6ZX75XxoPqokb2Gp+HRIlhrytwFl/H7hUcNOQT3r7pacr7rW+N7PKtO0XC
	k0j0nvfqoIpSZz7z1RurbBnm1vxfbTJ1d+GhaUhN5uOFBAg+LhtRHxoR/P981PRMW48+
	GwEOxXrYi9kInncX8T110JfIgSnC/cX96+2/TAZLTMEKk4BzUuFWpujBTdkkcwFISUP6
	Y2cTKct5XJVX20E73VnwGn46dpg4R8gyqBFTbfW+C6YMp1hMLgO5BC3Gaw7GpQr3DiU5
	FvZQ==
X-Gm-Message-State: APjAAAWUZVeLBgnLizjz+DJ2D091J8l9p4hyhJHPgtmzuiT+Dj25ktdB
	XbMiZcAPSR/6DsCkPzWXLIbbV5HvuvDVnSNZq4TgHbm+UHuE76CJE4MWl09rJyXkHSomtyP1P6j
	gEflXg1OA+2qnFxPGjxqk1xghASQR/eYro97wZQ==
X-Received: by 2002:a9d:61c6:: with SMTP id h6mr21310245otk.316.1557239178656; 
	Tue, 07 May 2019 07:26:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyIE28o8xJ8Q5sxccHByKS+6e+6ivy5LDw8T+n4b9V6xENYs0fcyZsuZngdF4n2bGv2CNPiaVCoLGsuqv9kcfo=
X-Received: by 2002:a9d:61c6:: with SMTP id h6mr21310231otk.316.1557239178467; 
	Tue, 07 May 2019 07:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190430230319.10375-1-rpeterso@redhat.com>
	<20190430230319.10375-5-rpeterso@redhat.com>
In-Reply-To: <20190430230319.10375-5-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 7 May 2019 16:26:07 +0200
Message-ID: <CAHc6FU6zNPdq-B3V0Sb2RLwc4w4ydSbuNdW7fbXo1g6VXqUNxw@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH v3 04/19] gfs2: Warn when a journal
 replay overwrites a rgrp with buffers
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Tue, 07 May 2019 14:26:33 +0000 (UTC)

Bob,

On Wed, 1 May 2019 at 01:03, Bob Peterson <rpeterso@redhat.com> wrote:
> This patch adds some instrumentation in gfs2's journal replay that
> indicates when we're about to overwrite a rgrp for which we already
> have a valid buffer_head.

looks okay, but can you explain in the commit message when this
problem will trigger and why that's a problem?

Thanks,
Andreas

> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/lops.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
> index 6af6a3cea967..2e8c6d02e112 100644
> --- a/fs/gfs2/lops.c
> +++ b/fs/gfs2/lops.c
> @@ -564,9 +564,27 @@ static int buf_lo_scan_elements(struct gfs2_jdesc *jd, u32 start,
>
>                 if (gfs2_meta_check(sdp, bh_ip))
>                         error = -EIO;
> -               else
> +               else {
> +                       struct gfs2_meta_header *mh =
> +                               (struct gfs2_meta_header *)bh_ip->b_data;
> +
> +                       if (mh->mh_type == cpu_to_be32(GFS2_METATYPE_RG)) {
> +                               struct gfs2_rgrpd *rgd;
> +
> +                               rgd = gfs2_blk2rgrpd(sdp, blkno, false);
> +                               if (rgd && rgd->rd_addr == blkno &&
> +                                   rgd->rd_bits && rgd->rd_bits->bi_bh) {
> +                                       fs_info(sdp, "Replaying 0x%llx but we "
> +                                               "already have a bh!\n",
> +                                               (unsigned long long)blkno);
> +                                       fs_info(sdp, "busy:%d, pinned:%d\n",
> +                                               buffer_busy(rgd->rd_bits->bi_bh) ? 1 : 0,
> +                                               buffer_pinned(rgd->rd_bits->bi_bh));
> +                                       gfs2_dump_glock(NULL, rgd->rd_gl);
> +                               }
> +                       }
>                         mark_buffer_dirty(bh_ip);
> -
> +               }
>                 brelse(bh_log);
>                 brelse(bh_ip);
>
> --
> 2.20.1
>

