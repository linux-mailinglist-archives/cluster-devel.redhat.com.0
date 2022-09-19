Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A836B5BD267
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Sep 2022 18:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663606025;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=J8CwIAvybthWXnGZRRiELmnoxnEMrrwjL8UZ5A8/vuI=;
	b=fThnrag85EuqkcKFNS10vGpj0SAZabcAW0vDKjOj1jaxhaFGTTb+9E4dgxFyPLZsQzyClj
	j0NCbuYO80jZVh2k77NxWFA1oFJUuIjRb4kSoSywpnPs9fue7WY90uYrqGyj0rH41TV+1h
	WxlSIBlosAT6OD70rI17PesjyLPmxbE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-GB5W8QK-PgOdJ3RXY6tFjA-1; Mon, 19 Sep 2022 12:47:01 -0400
X-MC-Unique: GB5W8QK-PgOdJ3RXY6tFjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9D4A862FE4;
	Mon, 19 Sep 2022 16:47:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8576B140EBF3;
	Mon, 19 Sep 2022 16:47:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DC51719465A4;
	Mon, 19 Sep 2022 16:46:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8A19519465A0 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 19 Sep 2022 16:46:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6962B140EBF5; Mon, 19 Sep 2022 16:46:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61839140EBF3
 for <cluster-devel@redhat.com>; Mon, 19 Sep 2022 16:46:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E8133804069
 for <cluster-devel@redhat.com>; Mon, 19 Sep 2022 16:46:57 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-413-WJuI5Iy7PyOcWCfG4wxRaA-1; Mon, 19 Sep 2022 12:46:55 -0400
X-MC-Unique: WJuI5Iy7PyOcWCfG4wxRaA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c188-20020a1c35c5000000b003b2dee5fb58so15390203wma.5
 for <cluster-devel@redhat.com>; Mon, 19 Sep 2022 09:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=J8CwIAvybthWXnGZRRiELmnoxnEMrrwjL8UZ5A8/vuI=;
 b=YaJPdUqsrvkWmmZyqaWYKgOi79MMqr2NheprdR2fpW7wbbH761THsEtSpritwuWLgO
 cOKxYY0+5vq3lBj04y9SV8e+qpLwp8gkPByIvTpaRh4q1z5dPCr8nhFLUwXHQ+q3AiOF
 qVBK2ArOKJAo6goPt9VKz0wTE9g/IFkjl+GVEKT7ZwH1mezgu6h+MuIgrR8J9il+eiHR
 Nc8JrcJZjLyIO2eWmsnpLLjXaYKWTqownK3tpg0+qmCql3r/yPtFchr61MkJ+eLTh03b
 KJfLgiwe9/co/H9ewBASFdgOBjqUz6vs7jYJ9uH8oUY1/CC9g00tng9nxwo4cSh8+Uin
 iS4w==
X-Gm-Message-State: ACrzQf2iEzOPhV3Kdm4K67SR5068wiIAI4KLNDN5zncjzozAyY80NTKY
 Hy6kyzPZqTt3fI914ZAohqHNYbIFgBpjQlyzf3F5PKJkOrDbdk9f0S8SCZLe8Cn5bnZHlrlDKLV
 sjZ4xdM4v8R1dek15+9N2AG7iAAiNb4jTo5Xyyg==
X-Received: by 2002:a05:6000:1090:b0:228:a963:3641 with SMTP id
 y16-20020a056000109000b00228a9633641mr11443705wrw.289.1663606014381; 
 Mon, 19 Sep 2022 09:46:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7LaslYR5v6hDXs68/7bO8R6ZqKQxlYp5lsfrgODDFJsVisoIEKdjiTw4WlT7T70jqg05ujTY7UOqTxzvgC1vw=
X-Received: by 2002:a05:6000:1090:b0:228:a963:3641 with SMTP id
 y16-20020a056000109000b00228a9633641mr11443699wrw.289.1663606014183; Mon, 19
 Sep 2022 09:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220916184309.3179451-1-aahringo@redhat.com>
 <20220916184309.3179451-3-aahringo@redhat.com>
 <CAK-6q+jgci8m+BGjm2PAXYO7V4KUqzUhkmrMBTpBdTURoZXyUA@mail.gmail.com>
In-Reply-To: <CAK-6q+jgci8m+BGjm2PAXYO7V4KUqzUhkmrMBTpBdTURoZXyUA@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 19 Sep 2022 12:46:42 -0400
Message-ID: <CAK-6q+im1eYBzE72_pFWHh0_Pgu7ooJ5rXb7qT6D4W7Qg+uTEQ@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Sep 19, 2022 at 12:25 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> Hi,
>
> On Fri, Sep 16, 2022 at 2:43 PM Alexander Aring <aahringo@redhat.com> wrote:
> >
> > This patch changes the ls_cb_mutex to a rw lock. The hotpath in
> > dlm_add_cb() can be called by different lkbs at the same time. Currently
> > parallel dlm_add_cb() could block because the cb mutex. To change that
> > we using a rw lock and use a readers lock in dlm_add_cb() only. The cb
> > mutex is only needed that dlm_callback_suspend() and
> > dlm_callback_resume() cannot run at the same time as the specific part
> > in dlm_add_cb() those will use a writers lock to stop any callback
> > queueing in dlm_add_cb().
> >
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > ---
> >  fs/dlm/ast.c          | 12 ++++++------
> >  fs/dlm/dlm_internal.h |  2 +-
> >  fs/dlm/lockspace.c    |  2 +-
> >  3 files changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
> > index 6e07c151ad28..43588c8ab5fc 100644
> > --- a/fs/dlm/ast.c
> > +++ b/fs/dlm/ast.c
> > @@ -200,13 +200,13 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
> >         if (!prev_seq) {
> >                 kref_get(&lkb->lkb_ref);
> >
> > -               mutex_lock(&ls->ls_cb_mutex);
> > +               read_lock(&ls->ls_cb_lock);
> >                 if (test_bit(LSFL_CB_DELAY, &ls->ls_flags)) {
> >                         list_add(&lkb->lkb_cb_list, &ls->ls_cb_delay);
>
> I drop this patch because the list_add() must be protected against
> possible parallel list_add() to the per lockspace ls_cb_delay list.
> However this optimization makes sense because the LSFL_CB_DELAY is a
> very rare case.
>
> I let it be a mutex and look later again into this for a possible

s/mutex/spinlock/

- Alex

