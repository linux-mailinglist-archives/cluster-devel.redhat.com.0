Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1AC74765C
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Jul 2023 18:22:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688487762;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JEbE+8f35ggewzZYNnfdnK2Dc2UOo1hQkfffSP6zams=;
	b=gBsqwRR+AejPdXr88RZ5nV9C07IrKmphqMI7+DCtOJBn4Jk0PCDdB1rEdDQFELDrGOmKKf
	MiINGY6/uGh06XCxKvtjo4ZUQ1nMy/JNHQIN8McPqpOf1WUfS9XIsx9++/X65D9AjDwvCN
	QPQd3wByab5N1WShSwbplMTEpmsXLHE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-MK66DQ7xPse_rbAEiJIxkw-1; Tue, 04 Jul 2023 12:22:39 -0400
X-MC-Unique: MK66DQ7xPse_rbAEiJIxkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8978888D06C;
	Tue,  4 Jul 2023 16:22:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D2969C00049;
	Tue,  4 Jul 2023 16:22:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 813F4194658D;
	Tue,  4 Jul 2023 16:22:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C7C321946588 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Jul 2023 16:22:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B3F9B492C13; Tue,  4 Jul 2023 16:22:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACC5E4CD0C8
 for <cluster-devel@redhat.com>; Tue,  4 Jul 2023 16:22:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E37A1C0432A
 for <cluster-devel@redhat.com>; Tue,  4 Jul 2023 16:22:34 +0000 (UTC)
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-gofDlxMZOPCZUR5awuqGsg-1; Tue, 04 Jul 2023 12:22:33 -0400
X-MC-Unique: gofDlxMZOPCZUR5awuqGsg-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-565d1b86a64so49246157b3.3
 for <cluster-devel@redhat.com>; Tue, 04 Jul 2023 09:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688487753; x=1691079753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JEbE+8f35ggewzZYNnfdnK2Dc2UOo1hQkfffSP6zams=;
 b=egwxmGp72Oj03CTwa+O3ceKgbHSdpH/sbbBguiYu0W3RofaJm8lN3wHW+GXX4Adgrg
 c2pHsyaUFkXZA0z/jOL48DV+N+lal2vXktaLImcp+M526yzWvKWB7DOmXYVbSS49Q4Nf
 svkvC099Lo8qMdaj3pMud42CEIhB/bAEoEmiDgfgbD5dmXNanMWsnAB0HCpqx/eKudu+
 Hu8iVib1w+mfEa+1uJE67abFqQ2q32OWq/nUFsFuhFtCmz+7w3Csvxd0+cz00FmoZiAG
 0ePKSlHTRGR1XnLDFyz0GeXhV3UQoSuyJwxgxTsSBCh2u94X3hVxg6JCLVvyKazvhSqz
 r5BQ==
X-Gm-Message-State: ABy/qLZql4+4LlMcCkn4bnxvVIdUMlfaPTdZgvhUPPo6N/Pj5rimvIhe
 EEhdfV1OUm0XwVFIz1KXCa2vGsCzrr4RJYAZvXJVjiF36BJlpN3NyZIUDCG01/5WZ42cHqpkoT5
 NvBGBrJ8yUJ4tSnGmcZfXt7BZXRFiQYpcQtLgcQ==
X-Received: by 2002:a81:9283:0:b0:577:1a7f:1d8 with SMTP id
 j125-20020a819283000000b005771a7f01d8mr14270077ywg.22.1688487752908; 
 Tue, 04 Jul 2023 09:22:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEnaRG0fc85OSCzWDXGD+BlmBU/HE7Uhfv9CtyDA+iKGrH0x/UCTkyS27cEdrHyKES76iZNdLnALUJ32kb3KMM=
X-Received: by 2002:a81:9283:0:b0:577:1a7f:1d8 with SMTP id
 j125-20020a819283000000b005771a7f01d8mr14270064ywg.22.1688487752732; Tue, 04
 Jul 2023 09:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230704104725.2510-1-machel@vivo.com>
In-Reply-To: <20230704104725.2510-1-machel@vivo.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 4 Jul 2023 12:22:21 -0400
Message-ID: <CAK-6q+jQcyyAtMD5tjzjrJg8Auy6HuugJomiSokwRhqRifVpCA@mail.gmail.com>
To: Wang Ming <machel@vivo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH v1] fs:dlm:Fix NULL pointer dereference
 bug in accept_from_sock()
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
Cc: cluster-devel@redhat.com, opensource.kernel@vivo.com,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 4, 2023 at 6:56=E2=80=AFAM Wang Ming <machel@vivo.com> wrote:
>
> newcon -> sock is NULL but dereferenced.
> First check newcon. Whether sock is a null pointer.
> If so, the subsequent operations are skipped.
> If it is not empty, perform subsequent operations.
>

did you experience some null pointer dereference? If so, on which kernel wa=
s it?

> Signed-off-by: Wang Ming <machel@vivo.com>
> ---
>  fs/dlm/lowcomms.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
> index 9f14ea9f6..ea18b9478 100644
> --- a/fs/dlm/lowcomms.c
> +++ b/fs/dlm/lowcomms.c
> @@ -1081,9 +1081,12 @@ static int accept_from_sock(void)
>                 add_sock(newsock, newcon);
>

Here in add_sock() we assign newcon->sock =3D newsock. It cannot fail
and newsock cannot be null, so holding the newcon->sock_lock write
protected _should_ be safe that others don't manipulate newcon->sock.
It should, that's why I am asking if you experienced some issue here?

>                 /* check if we receved something while adding */
> -               lock_sock(newcon->sock->sk);
> -               lowcomms_queue_rwork(newcon);
> -               release_sock(newcon->sock->sk);

see above, newcon->sock should always be set at this point.

> +               if (newcon->sock) {
> +                       lock_sock(newcon->sock->sk);
> +                       lowcomms_queue_rwork(newcon);
> +                       release_sock(newcon->sock->sk);
> +               }
> +
>         }
>         up_write(&newcon->sock_lock);
>         srcu_read_unlock(&connections_srcu, idx);

- Alex

