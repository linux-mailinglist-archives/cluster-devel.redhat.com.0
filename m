Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D210BFCFA3
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Nov 2019 21:25:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573763153;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b9YnWQirOF47+jfpMJsfbnx6QLzgq30bOa++qFov8Bc=;
	b=RyCIQbPF+2wNX3YRgAbELGT9aDI5o4zHgsyn9cszut6Nrd6lJxWYVOGA1iwDOjJw3UOjK6
	v6VLNT+EOF0Z53m3mwbzWjOrl6iN44RxDP9uhgyAnT7vfMT096v2F6j2x+B+U5SIllTw97
	anJco76aLTjllamNHhjfpS0Xk0IrOeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-tMZTXEGZMeuJxQ-FgNn3xw-1; Thu, 14 Nov 2019 15:25:52 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3835800EBE;
	Thu, 14 Nov 2019 20:25:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 576AD101E3CB;
	Thu, 14 Nov 2019 20:25:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E630518089CD;
	Thu, 14 Nov 2019 20:25:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEKPitp011341 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 15:25:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EA8332037E58; Thu, 14 Nov 2019 20:25:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6D012037E65
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 20:25:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDBE91065053
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 20:25:41 +0000 (UTC)
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
	[209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-63-i2V9gFbgMM-RtcD6qZaAEw-1; Thu, 14 Nov 2019 15:25:40 -0500
Received: by mail-oi1-f200.google.com with SMTP id q78so3770270oic.0
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 12:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7e6wUEJfhKghjnPk+WE08a3JXpqh/uiJT6Hie6w9gds=;
	b=sqGh6Ievj/L6kWP76tOtz1ck72SHeTPbgm5PiSNzeKXNpsgzwlZAmCLOC1TwY28u8w
	tGa3vQp3Z56J0pIOlhld3oFZmihipCLBg71E6oL6z5XEcw4TDFEjntGXkwr2PuqCzNDj
	8grqbUbPcGphfuRsYqONGAXEsxdORQKfx6FlC/Oo5V1oc1h+BdrC2vQg/IL3mDHGpa3B
	6okm0AG4bgtmnqyaJC4OR9mygl3pXSFjeFKLHTCSPigcz+m9POvvVKLKrCA0KNWgSc2H
	zD/i4+09F8pG7ZKaKJJBaHgmpzFaR+kNTcgfnwboc3n4ypaQTXwOajTOgV8eA2tBIJU0
	NuKQ==
X-Gm-Message-State: APjAAAVDu8f9jEQA7aoamN8anZj75VxSC5J21XaGgKRxSlsOHu817LvW
	2h1ZOz8FSYiLY3Q8DiARBTCwAjw/FZjol0sgSDyNN17ZqotxIfTdkd1weIPEJQjn0SXJWjm1DZk
	xLn42nGpD1bohoTDLH3zzNAUBOlPu8N2s+Rh17A==
X-Received: by 2002:aca:901:: with SMTP id 1mr3041510oij.72.1573763139840;
	Thu, 14 Nov 2019 12:25:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqzvdgHLRXou2QJ+C4YZtNA8lxhKvPhVA18Y8CF6jGlXtR6JuvnWYl87rU1baBctqQKo95JRFAnygBoclorEk34=
X-Received: by 2002:aca:901:: with SMTP id 1mr3041502oij.72.1573763139636;
	Thu, 14 Nov 2019 12:25:39 -0800 (PST)
MIME-Version: 1.0
References: <709405430.29951966.1573751145790.JavaMail.zimbra@redhat.com>
In-Reply-To: <709405430.29951966.1573751145790.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 14 Nov 2019 21:25:28 +0100
Message-ID: <CAHc6FU4Qy3WWxd7ZV1x74-_LnLpPxeNgsu4NYC9Bn=PDPvj=VQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-MC-Unique: i2V9gFbgMM-RtcD6qZaAEw-1
X-MC-Unique: tMZTXEGZMeuJxQ-FgNn3xw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAEKPitp011341
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: initialize tr_ail1_list when
 creating transactions
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 6:10 PM Bob Peterson <rpeterso@redhat.com> wrote:
> In function gfs2_trans_begin, new transactions were created but their
> ail1 list, tr_ail1_list was never initialized. Therefore it relied
> upon other circumstances when the list became empty.
> This patch adds proper initialization of the list.

Could you please give a better explanation for this change?

> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/trans.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
> index 9d4227330de4..d0efa322f940 100644
> --- a/fs/gfs2/trans.c
> +++ b/fs/gfs2/trans.c
> @@ -53,6 +53,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int=
 blocks,
>                                                    sizeof(u64));
>         INIT_LIST_HEAD(&tr->tr_databuf);
>         INIT_LIST_HEAD(&tr->tr_buf);
> +       INIT_LIST_HEAD(&tr->tr_ail1_list);
>
>         sb_start_intwrite(sdp->sd_vfs);
>
>

What code path accesses tr_ail1_list before it is initialized in gfs2_log_f=
lush?
Should the INIT_LIST_HEAD(&tr->tr_ail1_list) in gfs2_log_flush
consequently be removed?

Thanks,
Andreas


