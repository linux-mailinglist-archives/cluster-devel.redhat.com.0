Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A48357B971
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Jul 2022 17:21:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658330492;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=99yX+3ced+90f02uwfU2fi3zI1EPmPprTc8IRlOznJE=;
	b=eJiqbKspiCH4JwFFdEzb9TFhxqu9od4vrhxKkQQy2xDhA7et11bBL6VeMdAMKKMe+pJPWh
	ZS1AyOX/U0c8TnngpfejEIhZyhjdax5wzIExoQMO9jYjgY/TNnH54oX7mNvuNsc6h0fvI+
	5/EuAxSozZxY8dbDRQ2hnTqoaiDf4Oc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-l08kvsqSOq-jqWLQXzbRPw-1; Wed, 20 Jul 2022 11:21:28 -0400
X-MC-Unique: l08kvsqSOq-jqWLQXzbRPw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0B571C0E348;
	Wed, 20 Jul 2022 15:21:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95CA5141511A;
	Wed, 20 Jul 2022 15:21:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 72CA2194707F;
	Wed, 20 Jul 2022 15:21:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AF5211947066 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 20 Jul 2022 14:59:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9082E2166B29; Wed, 20 Jul 2022 14:59:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BCAC2166B26
 for <cluster-devel@redhat.com>; Wed, 20 Jul 2022 14:59:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F570800124
 for <cluster-devel@redhat.com>; Wed, 20 Jul 2022 14:59:01 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-qmgfdMwFOiKPX2p9f2Tjzg-1; Wed, 20 Jul 2022 10:59:00 -0400
X-MC-Unique: qmgfdMwFOiKPX2p9f2Tjzg-1
Received: by mail-qk1-f198.google.com with SMTP id
 s9-20020a05620a254900b006b54dd4d6deso14310119qko.3
 for <cluster-devel@redhat.com>; Wed, 20 Jul 2022 07:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=99yX+3ced+90f02uwfU2fi3zI1EPmPprTc8IRlOznJE=;
 b=UhhM6b1W8S3l5TEY/FMUBqB5c9gNQGeSfgXJ6nHB68sCpx4mHA3cHHrsgfBuVC1B58
 KrhRJQBzvVQGG1OS6jr4clbySwo9AzYX/g2UhuBH+qWxi9O8prnvJ5kmgHvG9/WhiqqC
 9pGDc+9Q5UHVXvyi5jklNuyCUt8S46kqxUaUMOn+8ni+Rr+x0i73eCSiTRXKFoyx96fU
 0YKZKg+ARjIKcR7PObjE9amR6hti1F1QKeC81/0UFSLxmWWs5DkTQanC+GfoG7SquRNd
 s6J+TUVYJEeA07BFwAA5oVwiDnETp/6U0W/B7c12fGRwUIGJKvxJab5qtZNJOfh9lbh+
 +SAw==
X-Gm-Message-State: AJIora/EGmNKUoazonXDAYOuDlDBefa1Ysf357Nwt5ZF63rUpU3P95Aq
 hh6LIKIhr4iwSHOwIUdpvEwGJZ53TXkEXriK/dGbwgx8wBQCw9BjOGOXc6KmiXwIxsYurqKEfhE
 TF+7NygdEVJ57AnAimtCarwmzfM5Qmz1y5Jj4tw==
X-Received: by 2002:a05:622a:1316:b0:31e:f3b4:1c8c with SMTP id
 v22-20020a05622a131600b0031ef3b41c8cmr10410440qtk.339.1658329139578; 
 Wed, 20 Jul 2022 07:58:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t2KJLvwoTzRcAGHYnw/SWR89vZiuqxeE7Um8DQwFTmrtVhLaJ4VlfAMRHZwGzNDc+J1dPzt20N0jTpiLClXgE=
X-Received: by 2002:a05:622a:1316:b0:31e:f3b4:1c8c with SMTP id
 v22-20020a05622a131600b0031ef3b41c8cmr10410425qtk.339.1658329139349; Wed, 20
 Jul 2022 07:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220720011526.2928876-1-aahringo@redhat.com>
 <20220720011526.2928876-2-aahringo@redhat.com>
In-Reply-To: <20220720011526.2928876-2-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 20 Jul 2022 10:58:48 -0400
Message-ID: <CAK-6q+jJSaZ_iPR6+gmSoSng7UiL7F1NfAXbb3FDjtEMDF2z3w@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH dlm/next 2/2] fs: dlm: handle -EINVAL as
 log_error()
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Jul 19, 2022 at 9:15 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> If the user generates a -EINVAL it's probably because the user using DLM
> wrong. To give the user notice about that wrong behaviour we should
> always print -EINVAL errors on the proper loglevel. In case of other
> errors like -EBUSY it will be still printed on debug loglevel as the
> current API handles it as "retry again".
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/lock.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
> index d8de4003ec6a..7d5f94867e45 100644
> --- a/fs/dlm/lock.c
> +++ b/fs/dlm/lock.c
> @@ -2900,11 +2900,21 @@ static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
>  #endif
>         rv = 0;
>   out:
> -       if (rv)
> +       switch (rv) {
> +       case -EINVAL:
> +               log_error(ls, "%s %d %x %x %x %d %d %s", __func__,
> +                         rv, lkb->lkb_id, lkb->lkb_flags, args->flags,
> +                         lkb->lkb_status, lkb->lkb_wait_type,
> +                         lkb->lkb_resource->res_name);
> +               break;
> +       default:
>                 log_debug(ls, "%s %d %x %x %x %d %d %s", __func__,
>                           rv, lkb->lkb_id, lkb->lkb_flags, args->flags,
>                           lkb->lkb_status, lkb->lkb_wait_type,
>                           lkb->lkb_resource->res_name);
> +               break;
> +       }
> +
>         return rv;
>  }
>
> @@ -3037,11 +3047,21 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
>         lkb->lkb_astparam = args->astparam;
>         rv = 0;
>   out:
> -       if (rv)
> +       switch (rv) {
> +       case -EINVAL:
> +               log_error(ls, "%s %d %x %x %x %x %d %s", __func__, rv,
> +                         lkb->lkb_id, lkb->lkb_flags, lkb->lkb_exflags,
> +                         args->flags, lkb->lkb_wait_type,
> +                         lkb->lkb_resource->res_name);
> +               break;
> +       default:
>                 log_debug(ls, "%s %d %x %x %x %x %d %s", __func__, rv,
>                           lkb->lkb_id, lkb->lkb_flags, lkb->lkb_exflags,
>                           args->flags, lkb->lkb_wait_type,
>                           lkb->lkb_resource->res_name);
> +               break;
> +       }
> +

there need to be a case 0: which does nothing of course... will send a v2.

- Alex

