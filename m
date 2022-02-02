Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 357294A74E7
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Feb 2022 16:48:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643816881;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UQPdOOeFswDY0IuVYfaGEdyG96mlY2cc3FWo19LcrkI=;
	b=TAHRvQuTGsPfOqt5psbNLC/RMfbr9VQ2aXTeGZ92b/b7DXCFHm0dex0b5wlbofwmDEq/gn
	LvCsDUAXBif815h4PQZaEc5AozKDuIItrynvFTf5aJdie2QeF81pfjjJ/abLEIrHktk/qa
	9TLjxSYSQ/hVYLWeopUi60GAfhgkuaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-f5i7-HbSO0i3EbZFubgAKg-1; Wed, 02 Feb 2022 10:47:58 -0500
X-MC-Unique: f5i7-HbSO0i3EbZFubgAKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 788B31091DA2;
	Wed,  2 Feb 2022 15:47:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9295B84A0F;
	Wed,  2 Feb 2022 15:47:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFF881806D2B;
	Wed,  2 Feb 2022 15:47:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 212FllPD017766 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Feb 2022 10:47:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2D8DD1121334; Wed,  2 Feb 2022 15:47:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27E5E112132C
	for <cluster-devel@redhat.com>; Wed,  2 Feb 2022 15:47:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B9DD1C05AF7
	for <cluster-devel@redhat.com>; Wed,  2 Feb 2022 15:47:44 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-217-opSBvLqqP2-YpgVrotSv6w-1; Wed, 02 Feb 2022 10:47:42 -0500
X-MC-Unique: opSBvLqqP2-YpgVrotSv6w-1
Received: by mail-wm1-f72.google.com with SMTP id
	w5-20020a1cf605000000b00354d2d83490so999323wmc.4
	for <cluster-devel@redhat.com>; Wed, 02 Feb 2022 07:47:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UQPdOOeFswDY0IuVYfaGEdyG96mlY2cc3FWo19LcrkI=;
	b=h1sQ8oGcaKMDY1pTPhHaoPVC5WBCLLJFL1HJW4DPfQMHX/UZEW+xBUDxG1eUdmL1jn
	EFzd0agLat+p/V9DKx7oN9pOkaI+udgnvN/UiVy/sAsUFcScR2kdAJgl4+o2meBgIBs9
	7VazKEckYd5rF7pUKUP/2bmIglUXSYmpHCXdIJQIPv3S9Mcd3EDgCcvGSBgJpwglnHWA
	qamB3nu3J/JuVyE0AoH3GcmTsTTmDU+EfeXIjkMzZWIp6qnaxzZM1JFZYEOuXeM2Aa7r
	EBpY7K1dPfjZFqjIoFBBT8DqHvK42au2/W14n7Wz16BRvmKHKpu+IAVetBrRwPy9jPH5
	UGvQ==
X-Gm-Message-State: AOAM533MMojna07uPu1NuSF/n9+gXnWicMf3ZgIPZj3HaQgwO80Af9d5
	haOZg1xy/Tf+uGD0gi8BaRp0u4dqbQgdjedhZuC7GQnw2VPcswb0xChzBKbjWYl95SZoTiGnLTP
	9MeNga4F7AhuHIU4jCmV5zA4AlA0mNVeIDsnkBQ==
X-Received: by 2002:adf:e884:: with SMTP id d4mr5241927wrm.640.1643816861275; 
	Wed, 02 Feb 2022 07:47:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8AleOdsIa4ws+swopDM0XHu8eCt3XLOHBYUzjFlp7zVt58NyXUvGV36sqcaweZjod7ktGFm5lc+1auO199xw=
X-Received: by 2002:adf:e884:: with SMTP id d4mr5241920wrm.640.1643816861068; 
	Wed, 02 Feb 2022 07:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20220124172357.554689-1-rpeterso@redhat.com>
	<20220124172357.554689-3-rpeterso@redhat.com>
In-Reply-To: <20220124172357.554689-3-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 2 Feb 2022 16:47:29 +0100
Message-ID: <CAHc6FU6+mr5n8ng=P7hNbJjr=yE5YN9LcDHtD1_B10TudgcF-g@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 2/3] gfs2: Retry on dlm -EBUSY
	(stop gap)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Bob,

On Mon, Jan 24, 2022 at 6:28 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Sometimes when gfs2 cancels a glock request, dlm needs time to take the
> request off its Conversion queue. During that time, we get -EBUSY from
> dlm, which confuses the glock state machine. Ideally we want dlm to
> not return -EBUSY but wait until the operation has completed. This is
> a stop-gap measure until dlm has a solution in place.

I'm not going to hold my breath until then. We can do better with a
more in-depth patch description here.

Also,

> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/lock_dlm.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
> index 50578f881e6d..bf03c77b6757 100644
> --- a/fs/gfs2/lock_dlm.c
> +++ b/fs/gfs2/lock_dlm.c
> @@ -258,7 +258,7 @@ static int gdlm_lock(struct gfs2_glock *gl, unsigned int req_state,
>                      unsigned int flags)
>  {
>         struct lm_lockstruct *ls = &gl->gl_name.ln_sbd->sd_lockstruct;
> -       int req;
> +       int req, ret;
>         u32 lkf;
>         char strname[GDLM_STRNAME_BYTES] = "";
>
> @@ -278,9 +278,12 @@ static int gdlm_lock(struct gfs2_glock *gl, unsigned int req_state,
>         /*
>          * Submit the actual lock request.
>          */
> -
> -       return dlm_lock(ls->ls_dlm, req, &gl->gl_lksb, lkf, strname,
> -                       GDLM_STRNAME_BYTES - 1, 0, gdlm_ast, gl, gdlm_bast);
> +       do {
> +               ret = dlm_lock(ls->ls_dlm, req, &gl->gl_lksb, lkf, strname,
> +                              GDLM_STRNAME_BYTES - 1, 0, gdlm_ast, gl,
> +                              gdlm_bast);

we should sleep here and in gdlm_put_lock() so that in the rare cases
when dlm ends up in that busy state, we won't eat up 100% cpu time at
least.

> +       } while (ret == -EBUSY);
> +       return ret;
>  }
>
>  static void gdlm_put_lock(struct gfs2_glock *gl)
> @@ -312,8 +315,11 @@ static void gdlm_put_lock(struct gfs2_glock *gl)
>                 return;
>         }
>
> -       error = dlm_unlock(ls->ls_dlm, gl->gl_lksb.sb_lkid, DLM_LKF_VALBLK,
> -                          NULL, gl);
> +       do {
> +               error = dlm_unlock(ls->ls_dlm, gl->gl_lksb.sb_lkid,
> +                                  DLM_LKF_VALBLK, NULL, gl);
> +       } while (error == -EBUSY);
> +
>         if (error) {
>                 fs_err(sdp, "gdlm_unlock %x,%llx err=%d\n",
>                        gl->gl_name.ln_type,
> @@ -506,7 +512,9 @@ static int sync_unlock(struct gfs2_sbd *sdp, struct dlm_lksb *lksb, char *name)
>         struct lm_lockstruct *ls = &sdp->sd_lockstruct;
>         int error;
>
> -       error = dlm_unlock(ls->ls_dlm, lksb->sb_lkid, 0, lksb, ls);
> +       do {
> +               error = dlm_unlock(ls->ls_dlm, lksb->sb_lkid, 0, lksb, ls);
> +       } while (error == -EBUSY);

There's a sync_lock() as well as a sync_unlock(). But those locks are
never canceled, so we don't really bother about -EBUSY.

>         if (error) {
>                 fs_err(sdp, "%s lkid %x error %d\n",
>                        name, lksb->sb_lkid, error);
> --
> 2.34.1

Let me post an updated version.

Thanks,
Andreas

