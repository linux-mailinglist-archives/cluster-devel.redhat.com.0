Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 983D5746422
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Jul 2023 22:32:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688416376;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1fKWi0rYo77j8u4gN98bhniw2sqFFBsM4GubtoeVvlU=;
	b=F1BLipYDZrU/mzyq0Qt2whuqBbHQbNrnpMnA4lqUUna0eawsxxrCSWyP0wbiKTZxqlUzPx
	85DugchQxVmHyD8TNmggaElmANtkrrOHr/9m6Go0jFVg/ig+3Q1PSgswT8MUHrj/DbO22S
	JyabGQyob70um5FiSCqprgRMiRuNA+A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-NkSpe9zxNAWmgPLbhn5QfA-1; Mon, 03 Jul 2023 16:32:50 -0400
X-MC-Unique: NkSpe9zxNAWmgPLbhn5QfA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FB991C07246;
	Mon,  3 Jul 2023 20:32:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1C2D492C13;
	Mon,  3 Jul 2023 20:32:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 50928194658C;
	Mon,  3 Jul 2023 20:32:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ABA481946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  3 Jul 2023 20:32:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5B87A2166B34; Mon,  3 Jul 2023 20:32:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 538ED2166B31
 for <cluster-devel@redhat.com>; Mon,  3 Jul 2023 20:32:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 367D429AB442
 for <cluster-devel@redhat.com>; Mon,  3 Jul 2023 20:32:44 +0000 (UTC)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-VAsrSgorMQy1t44cfFGDIA-1; Mon, 03 Jul 2023 16:31:47 -0400
X-MC-Unique: VAsrSgorMQy1t44cfFGDIA-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1b806d07935so49864905ad.0
 for <cluster-devel@redhat.com>; Mon, 03 Jul 2023 13:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688416306; x=1691008306;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1fKWi0rYo77j8u4gN98bhniw2sqFFBsM4GubtoeVvlU=;
 b=I2a56q7y7j5co/Df9UmjOsSrDhvcUJEIDvW/gvPuSdA8KhiIkcs1GZccouANV2iTN4
 AtbOJy+xzziMID8x+hd4BrLWWfJ+y6TrOfIRFCH1pxlY7QveL5+qovXtWw2O+nQNNNqV
 yHLFZC7vZiUJP+GAOyzkQkABg3XJ235y8Cx/LDBMhIpJytkyu0/N/Nxx/KCI0K62j+Nu
 s7LaCD/n7tt4ZrdRgtFJYf3jkxuDro02G2J7zTFajgDf9tmaxa5khpKwDGZhxLa/9hCx
 hIBvIiwe46Gxbeu++DSmuYXTHIdfVNuAmP44ou/2srMEPUU2DHfUKraaeobypFKG+xQk
 8Q7w==
X-Gm-Message-State: ABy/qLaGc9SzcbthT6YZpLW83doWhSsBl9nrfflSVCpT+OjHOSEuDWiH
 MLUwGr0+E+XRafwaQW7aRCvM5CaHRltyx9CxEItPup24gLYzxXD9b4WjQGEp9Sb8mfo08VdM2YR
 XSOlvdsUR/ZSD+xfGQ6oFpVs73q4TGqscstrUPQ==
X-Received: by 2002:a17:902:d702:b0:1b8:901d:cfa8 with SMTP id
 w2-20020a170902d70200b001b8901dcfa8mr4873913ply.18.1688416306275; 
 Mon, 03 Jul 2023 13:31:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF+x8Z808wiN59SjHWxqDqEaiR/a3Y6nlWknym38PVY3j6FGLfLmxVbustdLNJmZyEo8OAMYcVEK8zNWcuYTP8=
X-Received: by 2002:a17:902:d702:b0:1b8:901d:cfa8 with SMTP id
 w2-20020a170902d70200b001b8901dcfa8mr4873897ply.18.1688416306008; Mon, 03 Jul
 2023 13:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230620033859.997-1-lidong@vivo.com>
In-Reply-To: <20230620033859.997-1-lidong@vivo.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 3 Jul 2023 22:31:34 +0200
Message-ID: <CAHc6FU71+Y2CT=04cbgtxp5p8jPYU5RK0tcz8wR4jyLdQw6h4A@mail.gmail.com>
To: Li Dong <lidong@vivo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH] fs: Fix bug in gfs2_freeze_func that
 can cause deadlock
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
Cc: "open list:GFS2 FILE SYSTEM" <cluster-devel@redhat.com>,
 open list <linux-kernel@vger.kernel.org>, opensource.kernel@vivo.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Li Dong,

On Tue, Jun 20, 2023 at 5:47=E2=80=AFAM Li Dong <lidong@vivo.com> wrote:
> Function gfs2_freeze_func causes a deadlock=EF=BC=8Cbecause sd_freeze_mut=
ex was
> not released when return
>
> Signed-off-by: Li Dong <lidong@vivo.com>
> ---
>  fs/gfs2/super.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -741,8 +741,10 @@ void gfs2_freeze_func(struct work_struct *work)
>         set_bit(SDF_FROZEN, &sdp->sd_flags);
>
>         error =3D gfs2_do_thaw(sdp);
> -       if (error)
> +       if (error) {
> +               mutex_unlock(&sdp->sd_freeze_mutex);
>                 goto out;
> +       }

thank you for this bug report. I have chosen to fold this fix into
commit "gfs2: Rework freeze / thaw logic" and clean up
gfs2_freeze_func() a little along the way; see the current for-next
branch.

Thanks,
Andreas

>         clear_bit(SDF_FROZEN, &sdp->sd_flags);
>
> --
> 2.31.1.windows.1

