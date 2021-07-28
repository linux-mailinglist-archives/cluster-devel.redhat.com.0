Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAB13D872E
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Jul 2021 07:39:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627450752;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=rYRCafEdQP28ItnBj8DqmnNrqNX1m41+E+qglaL0dVA=;
	b=gt4PjNdk+uI9qEoz2V+hi+KekV1JTY3g6+KssXo1jwmDSkHu9ex9XcbzCAhaArYT4IU5Hk
	GN5UZZpu3ttl2SaGUE9/OCF22gay+x1VUsk7KTPI+LKhivbObr4mr3ROYB+ER1GTXLs2MR
	SvPn2lB0bnN8QyCjZFOjoNNsy3BNyW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-qxppoX0GO3SkLvo20pSpOQ-1; Wed, 28 Jul 2021 01:39:11 -0400
X-MC-Unique: qxppoX0GO3SkLvo20pSpOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 019F28799ED;
	Wed, 28 Jul 2021 05:39:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D3E05C1BB;
	Wed, 28 Jul 2021 05:39:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C2074A7C8;
	Wed, 28 Jul 2021 05:39:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16S5cwTe026580 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Jul 2021 01:38:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 00D54200E570; Wed, 28 Jul 2021 05:38:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0A6E200E57D
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 05:38:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 307BF80158D
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 05:38:54 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-119-aJtqbub_MmOk7tH75fohPA-1; Wed, 28 Jul 2021 01:38:52 -0400
X-MC-Unique: aJtqbub_MmOk7tH75fohPA-1
Received: by mail-wm1-f72.google.com with SMTP id
	u14-20020a7bcb0e0000b0290248831d46e4so462629wmj.6
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 22:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rYRCafEdQP28ItnBj8DqmnNrqNX1m41+E+qglaL0dVA=;
	b=CEW8+3GNDn8ULcgRu4NlL31PtFBv6+0eiNjK8ZAXFqztNUejieNJhwDK+pdPQZtAuZ
	sdwBwEmZXbPv8WaYWtCvu9Hc8rITS3YZU2c5skRggKt95PUSqghL2Q5033GPqX1jwyNX
	QNvzo/xzld3ORmiujsP20ZeLcVrH+b8xpRz8801P11CGjZyICrMK2f8S6IJhZMFtRCXt
	p5MZNI9uvJa+VLYy+bqMe3m8W/qJI0StbalRYzqPAxoFHPu0aY3dcUDowcl//MuyGFBm
	mUrS0giIrjm8Mfin0glEjgPY5SsfiWL6Me2TMMmv4ohDkq8yg+ihZ8XAOAwuinOqGux4
	eCNA==
X-Gm-Message-State: AOAM530TR+cMiUtE8YKDSvWUcNKrGeZx1EKUMYzeH9reJ9XsE7uld/bs
	oRHPsXAMETWQ9eq5fg/MnHIGV33CCUhuJHbocRV9aAUraprCgMmTDMjxHtpJ3pLsEuyP4LKKg+s
	AZ3bxMzeF4pfmrRbkq69JGG1Kh+EqKMTQY29OaQ==
X-Received: by 2002:a05:600c:4a12:: with SMTP id
	c18mr7378993wmp.3.1627450731007; 
	Tue, 27 Jul 2021 22:38:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzwacFa11tTQpokREn+FMzGZfrs6wBgzZdGNM/yrwYNTPMpCvoUjL08pfejmSRbf5vLRve5hSDQyaf4Oxhf4A=
X-Received: by 2002:a05:600c:4a12:: with SMTP id
	c18mr7378985wmp.3.1627450730876; 
	Tue, 27 Jul 2021 22:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210727173709.210711-1-rpeterso@redhat.com>
	<20210727173709.210711-10-rpeterso@redhat.com>
In-Reply-To: <20210727173709.210711-10-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 28 Jul 2021 07:38:39 +0200
Message-ID: <CAHc6FU5CQgo1wgwANoVetfNhZKGduyLBhS5s6MGTepOgKB9bbA@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 09/15] gfs2: fix deadlock in
 gfs2_ail1_empty withdraw
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Bob,

On Tue, Jul 27, 2021 at 7:37 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, function gfs2_ail1_empty could issue a file system
> withdraw when IO errors were discovered. However, there are several
> callers, including gfs2_flush_revokes() which holds the gfs2_log_lock
> before calling gfs2_ail1_empty. If gfs2_ail1_empty needed to withdraw
> it would leave the gfs2_log_lock held, which resulted in a deadlock
> due to other processes that needed the log_lock.
>
> Another problem discovered by Christoph Helwig is that we cannot
> withdraw from the log_flush process because it may be called from
> the glock workqueue, and the withdraw process waits for that very
> workqueue to be flushed. So the withdraw must be ignored until it may
> be handled by a more appropriate context like the gfs2_logd daemon.
>
> This patch moves the withdraw out of function gfs2_ail1_empty and
> makes each of the callers check for a withdraw by calling new function
> check_ail1_withdraw.

> Function gfs2_flush_revokes now does this check
> after releasing the gfs2_log_lock to avoid the deadlock.

I don't see that in the code.

>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/log.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
> index f0ee3ff6f9a8..c687a8c4e044 100644
> --- a/fs/gfs2/log.c
> +++ b/fs/gfs2/log.c
> @@ -364,11 +364,6 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp, int max_revokes)
>         ret = list_empty(&sdp->sd_ail1_list);
>         spin_unlock(&sdp->sd_ail_lock);
>
> -       if (test_bit(SDF_WITHDRAWING, &sdp->sd_flags)) {
> -               gfs2_lm(sdp, "fatal: I/O error(s)\n");
> -               gfs2_withdraw(sdp);
> -       }
> -
>         return ret;
>  }
>
> @@ -786,6 +781,15 @@ void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
>         }
>  }
>
> +static void check_ail1_withdraw(struct gfs2_sbd *sdp)
> +{
> +       if (!test_bit(SDF_WITHDRAWING, &sdp->sd_flags))
> +               return;
> +
> +       gfs2_lm(sdp, "fatal: I/O error(s)\n");
> +       gfs2_withdraw(sdp);
> +}
> +
>  /**
>   * gfs2_flush_revokes - Add as many revokes to the system transaction as we can
>   * @sdp: The GFS2 superblock
> @@ -1317,6 +1321,7 @@ int gfs2_logd(void *data)
>
>                 if (gfs2_jrnl_flush_reqd(sdp) || t == 0) {
>                         gfs2_ail1_empty(sdp, 0);
> +                       check_ail1_withdraw(sdp);
>                         gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
>                                                   GFS2_LFC_LOGD_JFLUSH_REQD);
>                 }
> @@ -1325,6 +1330,7 @@ int gfs2_logd(void *data)
>                         gfs2_ail1_start(sdp);
>                         gfs2_ail1_wait(sdp);
>                         gfs2_ail1_empty(sdp, 0);
> +                       check_ail1_withdraw(sdp);
>                         gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
>                                                   GFS2_LFC_LOGD_AIL_FLUSH_REQD);
>                 }
> --
> 2.31.1
>

Thanks,
Andreas

