Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 413786C32F7
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Mar 2023 14:34:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679405666;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uOo+4L0N+VYEj59JHEjLpR3boieGye02BowdVvrNSEw=;
	b=aZW9gFTfry2ZD5DRXZhY0uXk9dhasJEnzCEMshe9tp5Z943L8K6C5ie3/IMxZK1XBCqkmM
	Jje5FWN5ThPWwmbSXBa8YhoQ+R2FFo4eLzOcU0pBV8+eqL3BujoRlfSk6vOlLrgdmJPeqH
	s4D+fr+jEzJHOYG5icEdmInSLlJPXGA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-q6XUoIhPMYykjgKk2VcUbA-1; Tue, 21 Mar 2023 09:34:18 -0400
X-MC-Unique: q6XUoIhPMYykjgKk2VcUbA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 694FC3814954;
	Tue, 21 Mar 2023 13:34:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0778B40C6E67;
	Tue, 21 Mar 2023 13:34:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9C5A919465B3;
	Tue, 21 Mar 2023 13:34:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E862F1946594 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 21 Mar 2023 13:34:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 70B45140E960; Tue, 21 Mar 2023 13:34:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 691A61410F1C
 for <cluster-devel@redhat.com>; Tue, 21 Mar 2023 13:34:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BF4385C06B
 for <cluster-devel@redhat.com>; Tue, 21 Mar 2023 13:34:04 +0000 (UTC)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-_N26z_VkMq-hrIbiYJONQw-1; Tue, 21 Mar 2023 09:34:03 -0400
X-MC-Unique: _N26z_VkMq-hrIbiYJONQw-1
Received: by mail-pl1-f199.google.com with SMTP id
 az7-20020a170902a58700b001a0534b4ddbso8920592plb.15
 for <cluster-devel@redhat.com>; Tue, 21 Mar 2023 06:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679405642;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uOo+4L0N+VYEj59JHEjLpR3boieGye02BowdVvrNSEw=;
 b=wVG4UsQPTQgzsxsLfKInbxvK2/zV+RZRJwQfnc4TgMAa/g5bydHLaP0k7EZqZN/8Rh
 oHdoT0720W0fVllv+j1COfdCC9EzyMriq9bB8oqrrSU++/ngBYvnRsTCm7rCmKa6jppU
 wBonRxnWNxp+30Gu60Ha7HW/NrsAJ1KzFXHmufoaATUyhYX6/wZjYm7TX6qNlFtY/SoX
 3d3N03yZLQ5nLub+S1q3FsEhonpAunLIcg7UaHy1doMQ9y/71H6VpM8VEPLOqZLtjwwa
 yQMAhuY5UxO2ul00tQ0HhtZdcKCgvTOUs7yU9nvlfSGoqYAvxNRSLJJg0KolPHntzT5P
 xl7A==
X-Gm-Message-State: AO0yUKX2nKVWyng4iVgWgIz2yqCprurHf+owKojx8HDlDJzXSp4IB+iE
 JufUkjFyRxYRJ03x8O5I/fsOYM47rvUjuuuLwnTpzKbbHP34izxRheRZ8axaH2d18FMP0gEdn3N
 pCLoL3cNXEopAUA9VONf/OF/AlEMHmAQuZD/FaA==
X-Received: by 2002:a17:902:e752:b0:19f:28f4:1db with SMTP id
 p18-20020a170902e75200b0019f28f401dbmr919100plf.8.1679405642062; 
 Tue, 21 Mar 2023 06:34:02 -0700 (PDT)
X-Google-Smtp-Source: AK7set+RA1QYtoMcu3rPZU6mgv5Dkw2LSjEchEcvgqhYPwcAu+Yn3V6TAc+TIcMjac8OdP8Rojq1838XU8aTCOsnfiA=
X-Received: by 2002:a17:902:e752:b0:19f:28f4:1db with SMTP id
 p18-20020a170902e75200b0019f28f401dbmr919093plf.8.1679405641818; Tue, 21 Mar
 2023 06:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230321131734.2113556-1-aahringo@redhat.com>
In-Reply-To: <20230321131734.2113556-1-aahringo@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 21 Mar 2023 14:33:50 +0100
Message-ID: <CAHc6FU7-Hc7d284NihFpyyc2EByex+Nug8GVmLr0brkGS3BGmg@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH] dlm_controld: set posix_lock flags to
 zero
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 2:17=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
> This patch sets another flags variable to zero which is a leftover of
> commit 0834ed4b ("dlm_controld: initialize waiter->flags").
> ---
>  dlm_controld/plock.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
> index ad9b0f27..7f632888 100644
> --- a/dlm_controld/plock.c
> +++ b/dlm_controld/plock.c
> @@ -1956,6 +1956,7 @@ void receive_plocks_data(struct lockspace *ls, stru=
ct dlm_header *hd, int len)
>                         po->pid         =3D le32_to_cpu(pp->pid);
>                         po->nodeid      =3D le32_to_cpu(pp->nodeid);
>                         po->ex          =3D pp->ex;
> +                       po->flags       =3D 0;
>                         list_add_tail(&po->list, &r->locks);
>                 } else {
>                         w =3D malloc(sizeof(struct lock_waiter));

^ And I think w->flags also isn't being initialized.

Andreas

