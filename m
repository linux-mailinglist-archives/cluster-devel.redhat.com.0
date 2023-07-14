Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B9906753AFE
	for <lists+cluster-devel@lfdr.de>; Fri, 14 Jul 2023 14:29:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689337785;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BqwVumLBzz7Y+5YmDnWBZFqEyL1x3V2zkoY7kw9bOwA=;
	b=AiF8a9AF9D+SYwSJUvS2iqFdJDcCtRvlZWkjUskVolsiyLi6548KQBwbBkpQ3PyXHv3tk+
	ZJyjsqNoLb4tP+I64nSwsiev8ti/3hrMTHjbmJS8mgPnKs0vysz3DYY0C23pvmATXeJPka
	tR/EyI8whpFBcDXUU+gkMMunE+r5Pxg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-2BhAmeabOwqO_vgXd2BkCA-1; Fri, 14 Jul 2023 08:29:42 -0400
X-MC-Unique: 2BhAmeabOwqO_vgXd2BkCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A7648D1683;
	Fri, 14 Jul 2023 12:29:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EAC0B1121333;
	Fri, 14 Jul 2023 12:29:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A8B6119465A2;
	Fri, 14 Jul 2023 12:29:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 12297194658F for <cluster-devel@listman.corp.redhat.com>;
 Fri, 14 Jul 2023 12:29:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BCBD910C95; Fri, 14 Jul 2023 12:29:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B54CB10E5E
 for <cluster-devel@redhat.com>; Fri, 14 Jul 2023 12:29:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97161185A78B
 for <cluster-devel@redhat.com>; Fri, 14 Jul 2023 12:29:39 +0000 (UTC)
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-wVqFE4jkPpWv-nihUmkX1w-1; Fri, 14 Jul 2023 08:29:38 -0400
X-MC-Unique: wVqFE4jkPpWv-nihUmkX1w-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-579e9b95b86so14886367b3.1
 for <cluster-devel@redhat.com>; Fri, 14 Jul 2023 05:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689337777; x=1691929777;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BqwVumLBzz7Y+5YmDnWBZFqEyL1x3V2zkoY7kw9bOwA=;
 b=hHU1Toclra3QfXnQsrOANBGdezVBMGlBKWlZNbla+NQ5c3UT86IOQrJ1qK1BZ1nIXc
 0XJKYNqjgOJ5BxqtQ1z9pYtDxjfM/hzmL5f9SA3lHxNI1oVHsull+S2GaLoGBoQTvkW7
 ZYfZFL+uRx/Q3BDVMKLxviqBRPQbOUAVP+LNK2Og6OB1jQfO0OCHh2mOQwbkOSOlk0e+
 Zwmb5yd0ggmFFUwucpCkBGo0joilvOKyAg6G6pMMMKRsyyF5ah9+TQXSu7wxuQNODIOk
 y+6xm0ni32Nh5VgfS3TpTW2ZsQXPkvWtbTMzeyEAIlmmFCLrW/Pygxoi1dRt/FlPVhp7
 6cqA==
X-Gm-Message-State: ABy/qLbCQIHtOHhkRAoEgC4M9MMI8blBbhH/VGjxMZRtJIy7lYXjJuBy
 G/lb2eAHz99BH3bCFrjKUJBy8Gq3AiPRQu8YLI0NsNqcJPEsWyedkhCUgL4P9a5kqGzdiOfgPYD
 //e1RLw0f8S9/o3s+9AXvqbJVR7Rll9DeF6/zKa7l2ePiYkNN
X-Received: by 2002:a81:65c1:0:b0:579:f5c2:b16e with SMTP id
 z184-20020a8165c1000000b00579f5c2b16emr4231321ywb.31.1689337777524; 
 Fri, 14 Jul 2023 05:29:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHywAov+Tn3gLj6tsp4KMkJaCqUereecN8J3EGppivRqnkJwm7MZyWH0KaHu6Ej4w8A1HKKutb7MEenRtsiFlA=
X-Received: by 2002:a81:65c1:0:b0:579:f5c2:b16e with SMTP id
 z184-20020a8165c1000000b00579f5c2b16emr4231310ywb.31.1689337777229; Fri, 14
 Jul 2023 05:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230713170836.3583715-1-aahringo@redhat.com>
 <20230713170836.3583715-2-aahringo@redhat.com>
In-Reply-To: <20230713170836.3583715-2-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 14 Jul 2023 08:29:25 -0400
Message-ID: <CAK-6q+jP8dHZM7dpz4bTsg=6a1te+ec8LDMDYLJj2TCEebD5Cw@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH dlm-tool 2/2] fs: dlm: implement
 DLM_PLOCK_OP_CANCEL
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 13, 2023 at 1:08=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
>
> This patch implements DLM_PLOCK_OP_CANCEL to try to delete waiters for a
> lock request which are waiting to being granted. If the waiter can be
> deleted the reply to the kernel will be replaced from
> DLM_PLOCK_OP_LOCK to the sent DLM_PLOCK_OP_CANCEL and clearing the
> DLM_PLOCK_FL_NO_REPLY flag.
> ---
>  dlm_controld/plock.c | 47 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
> index ab19e8d7..fd2bd2cf 100644
> --- a/dlm_controld/plock.c
> +++ b/dlm_controld/plock.c
> @@ -9,6 +9,10 @@
>  #include "dlm_daemon.h"
>  #include <linux/dlm_plock.h>
>
> +#ifndef DLM_PLOCK_OP_CANCEL
> +#define DLM_PLOCK_OP_CANCEL 4
> +#endif
> +
>  #ifndef DLM_PLOCK_FL_NO_REPLY
>  #define DLM_PLOCK_FL_NO_REPLY 2
>  #endif
> @@ -136,6 +140,8 @@ static const char *op_str(int optype)
>         switch (optype) {
>         case DLM_PLOCK_OP_LOCK:
>                 return "LK";
> +       case DLM_PLOCK_OP_CANCEL:
> +               return "CL";
>         case DLM_PLOCK_OP_UNLOCK:
>                 return "UN";
>         case DLM_PLOCK_OP_GET:
> @@ -751,6 +757,43 @@ static void do_lock(struct lockspace *ls, struct dlm=
_plock_info *in,
>         put_resource(ls, r);
>  }
>
> +static int remove_waiter(const struct resource *r, struct dlm_plock_info=
 *in)
> +{
> +       struct lock_waiter *w;
> +
> +       list_for_each_entry(w, &r->waiters, list) {
> +               if (w->info.nodeid =3D=3D in->nodeid &&
> +                   w->info.fsid =3D=3D in->fsid &&
> +                   w->info.number =3D=3D in->number &&
> +                   w->info.owner =3D=3D in->owner &&
> +                   w->info.pid =3D=3D in->pid &&
> +                   w->info.start =3D=3D in->start &&
> +                   w->info.end =3D=3D in->end &&
> +                   w->info.ex =3D=3D in->ex) {
> +                       list_del(&w->list);
> +                       free(w);
> +                       return 0;
> +               }
> +       }
> +
> +       return -ENOENT;
> +}
> +
> +static void do_cancel(struct lockspace *ls, struct dlm_plock_info *in,
> +                     struct resource *r)
> +{
> +       int rv;
> +
> +       rv =3D remove_waiter(r, in);
> +       if (in->nodeid =3D=3D our_nodeid && rv =3D=3D 0) {
> +               /* we replacing a reply because we canceled waiter */
> +               in->flags &=3D ~DLM_PLOCK_FL_NO_REPLY;

I think we should do a copy of "in" here and then clear the flag... it
can have side effects if the ongoing processing will then call
write_result().

At some point dlm_plock_info should be const here...

- Alex

