Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6A09342AF4A
	for <lists+cluster-devel@lfdr.de>; Tue, 12 Oct 2021 23:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634075350;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=tId0bF1Jvh2YWCW1dAC6c3P85SQzQZNVsB4RnL2LXTk=;
	b=Bvn0vaPrJSExiioh3zxWII+/hoVJYPDkQthlrtfL9x76CrN6397yfIje4gvoCeCiOcAwQs
	RLxOgHEO5CZkH+ZaU3PJYPQuCLZWtOHoLAt6Xd+hRxQsjWQ2+z7CKryQsF0hK44IUmKt8C
	OR+02nDwajiJXiRxYHUbNoJmBdiIJyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-sAr5W8RLOkmyt3V10E77gg-1; Tue, 12 Oct 2021 17:49:07 -0400
X-MC-Unique: sAr5W8RLOkmyt3V10E77gg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A4E7362F8;
	Tue, 12 Oct 2021 21:49:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00F665F4F9;
	Tue, 12 Oct 2021 21:49:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C4CA4E58E;
	Tue, 12 Oct 2021 21:48:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19CLmuX1020919 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 12 Oct 2021 17:48:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5CEDB2180136; Tue, 12 Oct 2021 21:48:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 589F22180137
	for <cluster-devel@redhat.com>; Tue, 12 Oct 2021 21:48:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64287800883
	for <cluster-devel@redhat.com>; Tue, 12 Oct 2021 21:48:53 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-482-J3jaU6GhPE28BItNxreLYA-1; Tue, 12 Oct 2021 17:48:52 -0400
X-MC-Unique: J3jaU6GhPE28BItNxreLYA-1
Received: by mail-wr1-f71.google.com with SMTP id
	h11-20020adfa4cb000000b00160c791a550so387290wrb.6
	for <cluster-devel@redhat.com>; Tue, 12 Oct 2021 14:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tId0bF1Jvh2YWCW1dAC6c3P85SQzQZNVsB4RnL2LXTk=;
	b=H64sAExLlUoH/OH4Dn2NVHemh8vtJ0rXgSkVd0uYJnSIvdSzgS+YmLORLlu/28nZSl
	WYWBXUQoLxztCfRRcI0JIl4Jf98WDkWI+MDJsu1mr/UvfBeQAy33QgEsKRDw5X1mswNo
	DYmqYnh3N/yv1DNggpBIROrrzLDgu5pzBkXMaIS5hXn1SY3joJA6unndLV5d4c6Dzy67
	cOb3fgXi2gbTYauacyzJiUcR0By/hyeMOs9QgZ/9wBD7aP9Hg4zXLF1k+qPZpQcL8Obn
	fFlM/0AAhdomhVgIH4cHAlMQMRS4oFvsKqyM/tA0ZhNEaDv8YBeWsb15F1eLCZYUTZeH
	XvRw==
X-Gm-Message-State: AOAM533f/hBf0U87Py7rS/ndiRSqDA/2etw8XYBnIRODPxGkNe0JFMoq
	kwsF0NY8BCcC/xpG6uOGNHREXA2C0XwycijMnLus7O3/BtLTEljrbi3BjdizYgLXHXtx7NyJpkA
	R4txMlqsRcC36cTBceBbjRSMTAw+BcaU/KhgsvQ==
X-Received: by 2002:a1c:a508:: with SMTP id o8mr8479737wme.29.1634075330528;
	Tue, 12 Oct 2021 14:48:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4T1+8qhT1VAOsL56GPrvfaJCss0qccWNguLC6BZzsbh55G1UrsSU2L6AZyl7XrTwsmvPf7ncTa5ZvGaQ/rYk=
X-Received: by 2002:a1c:a508:: with SMTP id o8mr8479721wme.29.1634075330249;
	Tue, 12 Oct 2021 14:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211011194008.50097-1-rpeterso@redhat.com>
	<20211011194008.50097-10-rpeterso@redhat.com>
In-Reply-To: <20211011194008.50097-10-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 12 Oct 2021 23:48:38 +0200
Message-ID: <CAHc6FU6wKBFOwuWPw7o6+tx4hVPhhFitSzx607qQ-8YYU5kTCw@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 v3 PATCH 09/13] gfs2: split glock
 instantiation off from do_promote
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 11, 2021 at 9:41 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, function do_promote had a section of code that did
> the actual instantiation.  This patch splits that off into its own
> function, gfs2_instantiate, which prepares us for the next patch that
> will use that function.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/gfs2/glock.c | 47 +++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 37 insertions(+), 10 deletions(-)
>
> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index 1d64b45d1ea9..39bfac34e8a4 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -380,6 +380,33 @@ static void do_error(struct gfs2_glock *gl, const int ret)
>         }
>  }
>
> +/**
> + * gfs2_instantiate - Call the glops instantiate function
> + * @gl: The glock
> + *
> + * Returns: 0 if instantiate was successful, 2 if type specific operation is
> + * underway, or error.
> + */
> +static int gfs2_instantiate(struct gfs2_holder *gh)
> +{
> +       struct gfs2_glock *gl = gh->gh_gl;
> +       const struct gfs2_glock_operations *glops = gl->gl_ops;
> +       int ret;
> +
> +       ret = glops->go_instantiate(gh);
> +       switch(ret) {
> +       case 0:
> +               break;
> +       case 1:
> +               ret = 2;
> +               break;
> +       default:
> +               gh->gh_error = ret;
> +               break;
> +       }
> +       return ret;
> +}

Moving the return value tweaking here doesn't help, it only
complicates gfs2_instantiate. So let me revert that.

> +
>  /**
>   * do_promote - promote as many requests as possible on the current queue
>   * @gl: The glock
> @@ -392,7 +419,6 @@ static int do_promote(struct gfs2_glock *gl)
>  __releases(&gl->gl_lockref.lock)
>  __acquires(&gl->gl_lockref.lock)
>  {
> -       const struct gfs2_glock_operations *glops = gl->gl_ops;
>         struct gfs2_holder *gh, *tmp;
>         bool lock_released;
>         int ret;
> @@ -409,19 +435,20 @@ __acquires(&gl->gl_lockref.lock)
>                         break;
>                 }
>                 if (gh->gh_list.prev == &gl->gl_holders &&
> -                   !(gh->gh_flags & GL_SKIP) && glops->go_instantiate) {
> +                   !(gh->gh_flags & GL_SKIP) && gl->gl_ops->go_instantiate) {
>                         lock_released = true;
>                         spin_unlock(&gl->gl_lockref.lock);
> -                       ret = glops->go_instantiate(gh);
> +                       ret = gfs2_instantiate(gh);
>                         spin_lock(&gl->gl_lockref.lock);
>                         if (ret) {
> -                               if (ret == 1)
> -                                       return 2;
> -                               gh->gh_error = ret;
> -                               list_del_init(&gh->gh_list);
> -                               trace_gfs2_glock_queue(gh, 0);
> -                               gfs2_holder_wake(gh);
> -                               goto restart;
> +                               if (ret == 2)
> +                                       return ret;
> +                               else {
> +                                       list_del_init(&gh->gh_list);
> +                                       trace_gfs2_glock_queue(gh, 0);
> +                                       gfs2_holder_wake(gh);
> +                                       goto restart;
> +                               }

We can replace the "else { XXX }" with "XXX" here.

>                         }
>                 }
>                 set_bit(HIF_HOLDER, &gh->gh_iflags);
> --
> 2.31.1
>

Thanks,
Andreas

