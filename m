Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E432172E3BC
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jun 2023 15:06:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686661563;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0F7aXlGJGd7CWwG+Lxsjnu+6B23lj0bYQ8JMGr3fyR4=;
	b=eEMLBKOlDKI7yUwwB9TvvS3gMICmrWqrQGkn/dJJ46TSMM6+zJxi9HWNJY/7eKYY/Y/kxZ
	HbreOaF5ZbUkxh1c5W7ZpXa/iufUB3Nb1JnKK03Wyh1qDQiuvISE6x1sxU4HrUA3ZP5Yoo
	p50TgP9v8vXdzB/2nTT0DORzFhZ1ZFM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-AjxZzwN2PTSiMcbniNIJ_g-1; Tue, 13 Jun 2023 09:05:59 -0400
X-MC-Unique: AjxZzwN2PTSiMcbniNIJ_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 277A385A5BB;
	Tue, 13 Jun 2023 13:05:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 96829422DE;
	Tue, 13 Jun 2023 13:05:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6594C1946A46;
	Tue, 13 Jun 2023 13:05:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 772BF194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue, 13 Jun 2023 13:05:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 641ACC1604D; Tue, 13 Jun 2023 13:05:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CAC7C1604C
 for <cluster-devel@redhat.com>; Tue, 13 Jun 2023 13:05:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40F183801EDF
 for <cluster-devel@redhat.com>; Tue, 13 Jun 2023 13:05:50 +0000 (UTC)
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-Zq-ZnjsUMwOAfrPScK4Y4A-1; Tue, 13 Jun 2023 09:05:48 -0400
X-MC-Unique: Zq-ZnjsUMwOAfrPScK4Y4A-1
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-bc68c4e046aso2932476276.0
 for <cluster-devel@redhat.com>; Tue, 13 Jun 2023 06:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686661548; x=1689253548;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0F7aXlGJGd7CWwG+Lxsjnu+6B23lj0bYQ8JMGr3fyR4=;
 b=FeTEkUna1mPx8NE6+7l5xWjDHYLvCEioMOhjDSRgAukQspwaSjK5gQygHaPXQzZIHG
 NpSU5LH77fTM2ICUP4zWJnLhXl+uSsOILtFdwT9LhaxkW+cURuf8gZAPtQ2JQdaQShRx
 3cJJn6dk8VOzUsHa9rGkMBS10nIqDhpgSfSWUHFxj6yk1RicTkuhpY7coeSCZ6QxCjLD
 pEp4tinBYN11HFEufBDskT0C+Oc8AqENJLwW/jqmgdZ3J7eF7PXrGugS0y21Vl49VqL5
 1OS2KLBMaj96A88WxSztFf4BDzxVx98wnnoX4u66CK9sxJnOBXei9NydaMZGsX5PpCSL
 66Ow==
X-Gm-Message-State: AC+VfDzM340py1ARl2ugH5jpXhwJK0jODiNtPgO38/J/YgaedXBMXkHh
 hLdExhGCMdJSOw/CqwX/mvdv37VA8C/VGgSQk1G2jFG2MyUAryVlst8t1Ro+AaOEX8Wt0mIroQQ
 z3zWQmtXYV1UEHttfOmt88UQnmZvGIq34fZShRidm4jB2Ww==
X-Received: by 2002:a5b:689:0:b0:bcc:dba1:a87b with SMTP id
 j9-20020a5b0689000000b00bccdba1a87bmr1227941ybq.42.1686661547948; 
 Tue, 13 Jun 2023 06:05:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4mwomzxmA+Bqn8NBjyZCCn2n2r1IWSinccLxpqnPbmyVGAX0acwfLyRvA1Nl3pX/kltHs/52SX/nH7bdfomoo=
X-Received: by 2002:a5b:689:0:b0:bcc:dba1:a87b with SMTP id
 j9-20020a5b0689000000b00bccdba1a87bmr1227916ybq.42.1686661547656; Tue, 13 Jun
 2023 06:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230612163347.1293077-1-agruenba@redhat.com>
 <20230612163347.1293077-7-agruenba@redhat.com>
In-Reply-To: <20230612163347.1293077-7-agruenba@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 13 Jun 2023 09:05:36 -0400
Message-ID: <CAK-6q+i4yy8-T1SPVC=nwQQNtszxzP+uqsG7Jx4zNz44mPqjXA@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH 6/8] gfs2: Rework freeze / thaw logic
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Mon, Jun 12, 2023 at 12:33=E2=80=AFPM Andreas Gruenbacher
<agruenba@redhat.com> wrote:
...
>
> @@ -152,24 +151,18 @@ static void signal_our_withdraw(struct gfs2_sbd *sd=
p)
>          */
>         clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
>         if (!sb_rdonly(sdp->sd_vfs)) {
> -               struct gfs2_holder freeze_gh;
> -
> -               gfs2_holder_mark_uninitialized(&freeze_gh);
> -               if (sdp->sd_freeze_gl &&
> -                   !gfs2_glock_is_locked_by_me(sdp->sd_freeze_gl)) {
> -                       ret =3D gfs2_freeze_lock_shared(sdp, &freeze_gh,
> -                                       log_write_allowed ? 0 : LM_FLAG_T=
RY);
> -                       if (ret =3D=3D GLR_TRYFAILED)
> -                               ret =3D 0;
> -               }
> -               if (!ret)
> -                       gfs2_make_fs_ro(sdp);
> +               bool locked =3D mutex_trylock(&sdp->sd_freeze_mutex);
> +
> +               gfs2_make_fs_ro(sdp);
> +
> +               if (locked)
> +                       mutex_unlock(&sdp->sd_freeze_mutex);

I am not sure if I overlooked something here, for me it looks like the
application does not care about if sd_freeze_mutex is locked or not
because the introduced locked boolean will never be evaluated?

What am I missing here?

- Alex

