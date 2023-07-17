Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D9104755D2B
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Jul 2023 09:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689579763;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LgDWPpR69a6gRtsnEM9q7cWClwoc2XjUqvbJeDKqL18=;
	b=ACg4Q67ukZEsxoc3vsyFeBcVk7WonCskRfef+Ps0vdm8sK52WVK0TpVExkEYC2hdRF9QF1
	C35jhnLto8KQ9wXqMHhLR4OjSs6l+HjhacuPLQvZmFcI7kvEm6+vTxpjI4bk0U4t9E2F/D
	PDZmaLpd+xFWkzH6sLGTGA9qJFdiEF8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-JEC2_i7CN2-w07K16nhSgA-1; Mon, 17 Jul 2023 03:42:42 -0400
X-MC-Unique: JEC2_i7CN2-w07K16nhSgA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7213B810BB4;
	Mon, 17 Jul 2023 07:42:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C1C4492B01;
	Mon, 17 Jul 2023 07:42:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 285061946594;
	Mon, 17 Jul 2023 07:42:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EA30F1946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 17 Jul 2023 07:42:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9BE5E40C6F4F; Mon, 17 Jul 2023 07:42:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 945A240C6F4C
 for <cluster-devel@redhat.com>; Mon, 17 Jul 2023 07:42:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FD508D1681
 for <cluster-devel@redhat.com>; Mon, 17 Jul 2023 07:42:37 +0000 (UTC)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46--T4bSmeaODGo1qQPORdplA-1; Mon, 17 Jul 2023 03:42:35 -0400
X-MC-Unique: -T4bSmeaODGo1qQPORdplA-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1b8b2a2e720so21154675ad.3
 for <cluster-devel@redhat.com>; Mon, 17 Jul 2023 00:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689579755; x=1692171755;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LgDWPpR69a6gRtsnEM9q7cWClwoc2XjUqvbJeDKqL18=;
 b=OF2nuessChT7ni+zIxlrdtxSoSCQycpBcCylHp9LmF8828S2PsDFohHDwje5GUBbVf
 otgIeTGg8c5W32jDTTXkss5fdv5EGt4YH51dC2A6wSz5IWnCd1EZq5OxaPDy51boNAGX
 VQQRBP21tviZGM3CecFwCTY/spm1HqqX9Ie9TMnrxi0WJ5JsQuLWetsw3f5UUEuD9P7E
 zAZGvFbGIKDFQowRKt/yOHrr0qgKr2wGURJmVQXqAtwlhzj/Wh9+8+al5toNmekS8QzH
 /q3sNy79tTKRmfszGLOLFxgqwiM7rSCpAsGqHyrVfWMtgeI36hFM1pW0i6yBkelL1ltM
 LVMA==
X-Gm-Message-State: ABy/qLZ0HtgWWokXRienHg5F9KOtojdhWCSzXIxCyOLQR52dASZjnlcP
 abRn/O6uFRdfaBu52LTiPired5h61quNeYCBEYYYQTb2WseHObHPld6MbeCpNqRr4Y7f3lAA+fR
 aYpIs56/7wB9b8vAxnkH9DF/1sVAGIm+9Q7We+A==
X-Received: by 2002:a17:903:32ca:b0:1b8:94e9:e7d2 with SMTP id
 i10-20020a17090332ca00b001b894e9e7d2mr10597107plr.0.1689579754879; 
 Mon, 17 Jul 2023 00:42:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFSdHjeDPWFi9IYOJrmi8q9RrGv5VWqjZyZQX93Uju5J+yo4lOUUQ8UFP2RsXYaWbnx0vqOUH6a1eAHVzaAhqY=
X-Received: by 2002:a17:903:32ca:b0:1b8:94e9:e7d2 with SMTP id
 i10-20020a17090332ca00b001b894e9e7d2mr10597104plr.0.1689579754596; Mon, 17
 Jul 2023 00:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230717071938.6204-1-duminjie@vivo.com>
In-Reply-To: <20230717071938.6204-1-duminjie@vivo.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 17 Jul 2023 09:42:23 +0200
Message-ID: <CAHc6FU4_SDSpom3Qvt35AXOmmc3v9EJYksgP4EN3owMEC2y-AA@mail.gmail.com>
To: Minjie Du <duminjie@vivo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v1] gfs2: increase usage of
 folio_next_index() helper
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Minjie,

On Mon, Jul 17, 2023 at 9:20=E2=80=AFAM Minjie Du <duminjie@vivo.com> wrote=
:
> Simplify code pattern of 'folio->index + folio_nr_pages(folio)' by using
> the existing helper folio_next_index().
>
> Signed-off-by: Minjie Du <duminjie@vivo.com>
> ---
>  fs/gfs2/aops.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index ae49256b7..5f0254237 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -272,8 +272,7 @@ static int gfs2_write_jdata_batch(struct address_spac=
e *mapping,
>                                  * not be suitable for data integrity
>                                  * writeout).
>                                  */
> -                               *done_index =3D folio->index +
> -                                       folio_nr_pages(folio);
> +                               *done_index =3D folio_next_index(folio);
>                                 ret =3D 1;
>                                 break;
>                         }
> --
> 2.39.0
>

Applied, thanks.

Email addresses like '"open list:GFS2 FILE SYSTEM"
<cluster-devel@redhat.com>' and 'open list
<linux-kernel@vger.kernel.org>' are not helpful though, so could you
please avoid using addresses like that in the future?

Thanks,
Andreas

