Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2A55BD228
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Sep 2022 18:26:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663604781;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=gB/NmQekN45VJ0MLBuxHbh8Waoh+LIIyWfr6JDqbqqo=;
	b=YLAkKVaEX7BEQRKSsBUKzFK2Th7WuzTHZ+LSyf/kBwNT4FatKTPY1vu0KosgdOQjgG5Fhk
	hsyRrcOfj7YzpOuw6Qvvt5tVvU6EGXbkpxdPoMEhqz/Ln6xkJP3I+v0DTkoceSwG1/hf7V
	CxqpG/JcKvZOsG8zohxAt1NzgGPCUQk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-glDZHAIyMQS70VBFjEmOaQ-1; Mon, 19 Sep 2022 12:26:16 -0400
X-MC-Unique: glDZHAIyMQS70VBFjEmOaQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EACD1C0BDF1;
	Mon, 19 Sep 2022 16:26:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C8EB3492B04;
	Mon, 19 Sep 2022 16:26:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 832E119465A4;
	Mon, 19 Sep 2022 16:26:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CA17A19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 19 Sep 2022 16:26:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8FB92140EBF5; Mon, 19 Sep 2022 16:26:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88CC5140EBF3
 for <cluster-devel@redhat.com>; Mon, 19 Sep 2022 16:26:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB7D08027EA
 for <cluster-devel@redhat.com>; Mon, 19 Sep 2022 16:26:10 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-Dd4NPZL0Mme2B6iUz17FCg-1; Mon, 19 Sep 2022 12:26:06 -0400
X-MC-Unique: Dd4NPZL0Mme2B6iUz17FCg-1
Received: by mail-wr1-f72.google.com with SMTP id
 u27-20020adfa19b000000b0022863c08ac4so6885261wru.11
 for <cluster-devel@redhat.com>; Mon, 19 Sep 2022 09:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=gB/NmQekN45VJ0MLBuxHbh8Waoh+LIIyWfr6JDqbqqo=;
 b=UPM3UatxR2pVQo1ZrZYf+9Rchwzf46+ZbMnFLv3yg6u6vQj1UC+ECawNbWtuj1JWe6
 cdp7/QBP3Zxh21p8ftlbqnle15WTOfgUtZ8n2Hy36aBhp29oBLqRMF9v0nrQ0HuQo9qS
 NVmi63JuK9XHM5k3yhaEBZLSin0KQZTiwCA8K72MadX2vr6SBS9BxHgyTdSHb9jnPaVN
 2Q/a4LYqtIMSxXSUZWSNgqv8mnqKUPT0lKyO8qhtyYqTmcFuRjpJCKnc/5Ak/Y0NYkKH
 DLomuc59uZv70dnZHt/b3gkShzkG9vmcMH/V+WoBbHRiNvrqZL48SSQSBuSdS7ICbp8M
 U2bg==
X-Gm-Message-State: ACrzQf3DLBwW8RrrY1/iNhTEmxotXAdE2MGo4geyC15V3OBLEwGXoZw4
 65FjPxwqNGC6nmqcYjUg3Ql6zFDPPTYBMefV4632XQJQpCZqGNfYaTZ+gjynHWc+kY6JI1AZ/Vw
 ls+UOp3rmYHUt0YLAE8zxR4z2miuAfyoj8bGA4Q==
X-Received: by 2002:a05:6000:1090:b0:228:a963:3641 with SMTP id
 y16-20020a056000109000b00228a9633641mr11385829wrw.289.1663604764729; 
 Mon, 19 Sep 2022 09:26:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5e24uYnhE8W0q2kSJVGVV+lPA7JJ2H4lHPvTKhNcwVpyWoI73fMfdvIvcIkvhnE5ckO+2eHBt/se2enXS5/Os=
X-Received: by 2002:a05:6000:1090:b0:228:a963:3641 with SMTP id
 y16-20020a056000109000b00228a9633641mr11385818wrw.289.1663604764573; Mon, 19
 Sep 2022 09:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220916184309.3179451-1-aahringo@redhat.com>
 <20220916184309.3179451-3-aahringo@redhat.com>
In-Reply-To: <20220916184309.3179451-3-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 19 Sep 2022 12:25:53 -0400
Message-ID: <CAK-6q+jgci8m+BGjm2PAXYO7V4KUqzUhkmrMBTpBdTURoZXyUA@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH/RFC dlm/next 3/6] fs: dlm: change the ls
 cb mutex to rw lock
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Sep 16, 2022 at 2:43 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch changes the ls_cb_mutex to a rw lock. The hotpath in
> dlm_add_cb() can be called by different lkbs at the same time. Currently
> parallel dlm_add_cb() could block because the cb mutex. To change that
> we using a rw lock and use a readers lock in dlm_add_cb() only. The cb
> mutex is only needed that dlm_callback_suspend() and
> dlm_callback_resume() cannot run at the same time as the specific part
> in dlm_add_cb() those will use a writers lock to stop any callback
> queueing in dlm_add_cb().
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/ast.c          | 12 ++++++------
>  fs/dlm/dlm_internal.h |  2 +-
>  fs/dlm/lockspace.c    |  2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
> index 6e07c151ad28..43588c8ab5fc 100644
> --- a/fs/dlm/ast.c
> +++ b/fs/dlm/ast.c
> @@ -200,13 +200,13 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
>         if (!prev_seq) {
>                 kref_get(&lkb->lkb_ref);
>
> -               mutex_lock(&ls->ls_cb_mutex);
> +               read_lock(&ls->ls_cb_lock);
>                 if (test_bit(LSFL_CB_DELAY, &ls->ls_flags)) {
>                         list_add(&lkb->lkb_cb_list, &ls->ls_cb_delay);

I drop this patch because the list_add() must be protected against
possible parallel list_add() to the per lockspace ls_cb_delay list.
However this optimization makes sense because the LSFL_CB_DELAY is a
very rare case.

I let it be a mutex and look later again into this for a possible
optimization regarding the LSFL_CB_DELAY case here.

- Alex

