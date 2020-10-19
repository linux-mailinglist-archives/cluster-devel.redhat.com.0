Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2C64929287F
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Oct 2020 15:46:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603115167;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=yfp5uLmmKAQpYXoC1rTEcSiy92a8B0maxskNVT2+r00=;
	b=hZt9z9auwybs6ieqvYKi6Y381fjId92MSTgaUeLIixCcwycAvqmrE7uK1VMaHUe95/HP07
	4fyy5yFuFaKAhVAcqGF2GcpUPe0ytoUKqS+aHwjrHUGBAGzfzWPOssTCs/wr3Hkw9LNeF5
	VCS+eF/WHCoGPkgw0QIlgN0yWNtfJkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-C_Y0C87MNu23u6PWWQE2eQ-1; Mon, 19 Oct 2020 09:46:05 -0400
X-MC-Unique: C_Y0C87MNu23u6PWWQE2eQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E449E875110;
	Mon, 19 Oct 2020 13:46:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D9B45B4AD;
	Mon, 19 Oct 2020 13:46:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 80A974EA6C;
	Mon, 19 Oct 2020 13:45:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JDjqmn014537 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 09:45:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD6401111C9A; Mon, 19 Oct 2020 13:45:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B99031010205
	for <cluster-devel@redhat.com>; Mon, 19 Oct 2020 13:45:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 760C38007A4
	for <cluster-devel@redhat.com>; Mon, 19 Oct 2020 13:45:50 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-346-NuOXVhu4PrCIwIWB-LFzXQ-1; Mon, 19 Oct 2020 09:45:49 -0400
X-MC-Unique: NuOXVhu4PrCIwIWB-LFzXQ-1
Received: by mail-wr1-f71.google.com with SMTP id t11so7444370wrv.10
	for <cluster-devel@redhat.com>; Mon, 19 Oct 2020 06:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yfp5uLmmKAQpYXoC1rTEcSiy92a8B0maxskNVT2+r00=;
	b=e/14TKHMRQHV70eNjUyMK3r64dahrkTSb9km6OECCYPPVGtZJbnFs5bg8kz4vSEv6l
	W1hpmWFG1pwlkwci8lqIXkHbQ7a/mHGTcldQpHvF2w8s/yUQNYBtOS/a3KJgMyccvKhZ
	L8ZwDOvcj8ZWzDaMubEV1FMKxJDqy1jjGeR5tj6r6CHPCN/yFTm39kGBFKfzKJ8Q0jfk
	K2QPoFtzhKijCsNZQbxkAm/A/E8My4hYhjZ/lcBj1FHgzpI2X4SJXU5XATN1YvQtVHVE
	90KWpHLdD0/fSx4yKo3qemXz5h1gSHI4I1ko8/3sqKMpym/+OpbKRkJYCqIlRu17lwlE
	N9qA==
X-Gm-Message-State: AOAM533o3N5OyAKl7Q2g8TMjWrDOWLl29xImr58mhi0XItmbLmZ7I64H
	RcGPeOis74epYE8K3d9ad3GJOA7hlIi+UbXhHg/ocHo66iJGIcd3P40g9SLTjQUYKRAAp9uHD9u
	YkxIgzqcMVXkZS3QIv5MmJnqk0NFQoyrCm9j5Ew==
X-Received: by 2002:adf:e412:: with SMTP id g18mr19685810wrm.211.1603115147251;
	Mon, 19 Oct 2020 06:45:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypMPk3ptYRJlhTEoD6Pnb2amjXgoQz74lxSA6h6ds5An9um9bDwD+EEKJz8brGKKXoYzKIN/JtsPrO/AAciQg=
X-Received: by 2002:adf:e412:: with SMTP id g18mr19685793wrm.211.1603115147039;
	Mon, 19 Oct 2020 06:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201019064349.48828-1-tian.xianting@h3c.com>
In-Reply-To: <20201019064349.48828-1-tian.xianting@h3c.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 19 Oct 2020 15:45:35 +0200
Message-ID: <CAHc6FU7TsdKopGCHo-PEJYr2gN7cpai+1YkfZ8=WNMSyX_Pk+g@mail.gmail.com>
To: Xianting Tian <tian.xianting@h3c.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: use helper macro abs()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Oct 19, 2020 at 10:03 AM Xianting Tian <tian.xianting@h3c.com> wrote:
> Use helper macro abs() to simplify the "x >= y || x <= -y" cmp.
>
> Signed-off-by: Xianting Tian <tian.xianting@h3c.com>
> ---
>  fs/gfs2/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 9f4d9e7be..05eb709de 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -304,7 +304,7 @@ void gfs2_statfs_change(struct gfs2_sbd *sdp, s64 total, s64 free,
>         if (sdp->sd_args.ar_statfs_percent) {
>                 x = 100 * l_sc->sc_free;
>                 y = m_sc->sc_free * sdp->sd_args.ar_statfs_percent;
> -               if (x >= y || x <= -y)
> +               if (abs(x) >= y)

x and y are signed values, so this really doesn't seem right.

>                         need_sync = 1;
>         }
>         spin_unlock(&sdp->sd_statfs_spin);
> --
> 2.17.1

Thanks,
Andreas

