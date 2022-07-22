Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B22FC57D798
	for <lists+cluster-devel@lfdr.de>; Fri, 22 Jul 2022 02:09:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658448563;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qi/AOlqLMzC+gEWWnukQzjuSvBa7cNPEJZihOrqRY1c=;
	b=EnXu+YJRSP8CanxyQ8+YIPV6ewp9lklTdEGC5+ulO5IfDW9G5yC4ytcjUvmHHi7ZAd0rOc
	CaEDQip0UC8KbnImHQIKn4j2sY++h7IBLFIyll4OptgyRLgPG8w8EVr8Gifjhd+gteUpNY
	IsibEfcNgec8Dd/374d2/GGjzNQ19g0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-IhPVg3MNOSWJp_9rUxTo9Q-1; Thu, 21 Jul 2022 20:09:18 -0400
X-MC-Unique: IhPVg3MNOSWJp_9rUxTo9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A1DB101A586;
	Fri, 22 Jul 2022 00:09:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E7B3E202699A;
	Fri, 22 Jul 2022 00:09:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 93BA81947053;
	Fri, 22 Jul 2022 00:09:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 29AE51947049 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 22 Jul 2022 00:09:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 157BB492CA5; Fri, 22 Jul 2022 00:09:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12369492C3B
 for <cluster-devel@redhat.com>; Fri, 22 Jul 2022 00:09:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF29E85A581
 for <cluster-devel@redhat.com>; Fri, 22 Jul 2022 00:09:12 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-GMf207XwOF2TMOdg866SWA-1; Thu, 21 Jul 2022 20:09:11 -0400
X-MC-Unique: GMf207XwOF2TMOdg866SWA-1
Received: by mail-qv1-f72.google.com with SMTP id
 eq6-20020ad45966000000b0047405c4e6ffso2041746qvb.17
 for <cluster-devel@redhat.com>; Thu, 21 Jul 2022 17:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qi/AOlqLMzC+gEWWnukQzjuSvBa7cNPEJZihOrqRY1c=;
 b=WmkoH9vD6JfErOymtKBNMZ7y7rHNUBhAOlta6yw8s/48g0lkUjspldj6UQgagibg/q
 qIZFnV8eam2nfjEH9aZfnmKYH8fLJt8g92auihr7IgqsJ+mhkQWEZmoLc27Czv94+OhH
 frcb75k/ZLhn89onSjdW/IpS5YRxpEoiKgeJDI96/JPD8ojpiI3l1WvG/eQJwWtSflHz
 w8+3IwNzm/aU1cmnjRGk+gRm0yP0GLPPQ6EKYzQBl7ViOBdaqQC2aMBmZiP7ZgQMP6as
 aw/7+4cYsLWjhPcFx/fE8hSuNDPwo1IfuucRVrL133UE3QMcDtYKxVqFkdn4o0e3o4CV
 zDzw==
X-Gm-Message-State: AJIora8iclptFG/wBTzw/4yZVW0qX0fGaSnhRCkhbTSBLQoUI2INvmjy
 Sl9zq1gOqg8BYMtpzvGwkDS77X9ZhglqdxggY7YhQrggXbmF7RD5p/Hjxgx6YVAGFna1Jzqu8Yl
 kp/CKTTM5kGMrBALwvsMqs8o5w03SfF5ykRSrmA==
X-Received: by 2002:ac8:5c05:0:b0:31f:1f1f:2ab with SMTP id
 i5-20020ac85c05000000b0031f1f1f02abmr962107qti.123.1658448551135; 
 Thu, 21 Jul 2022 17:09:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vYuc5IVGz8o2zfDxLQi3YcHU/wQviI8I6PslByi5GnWJ54LGhaIXTZWM3siWRrNN4ylZt21xFUczdONIunxnI=
X-Received: by 2002:ac8:5c05:0:b0:31f:1f1f:2ab with SMTP id
 i5-20020ac85c05000000b0031f1f1f02abmr962094qti.123.1658448550935; Thu, 21 Jul
 2022 17:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220721215340.936838-1-aahringo@redhat.com>
 <20220721215340.936838-4-aahringo@redhat.com>
In-Reply-To: <20220721215340.936838-4-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 21 Jul 2022 20:09:00 -0400
Message-ID: <CAK-6q+gq2aCN5YKiqOdG8hTdyBssYHZLFE3-HSy_PFCJYZdAfw@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH dlm/next 3/3] fs: dlm: fix refcount
 handling for dlm_add_cb()
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
Cc: cluster-devel <cluster-devel@redhat.com>, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Jul 21, 2022 at 5:53 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> Each time dlm_add_cb() queues work or adds the lkb for queuing later to
> the ls->ls_cb_delay list it increments a refcount. However if the work
> is already queued or being added to the list we need to revert the
> incrementation of the refcount. The function dlm_add_cb() can be called
> multiple times without handling the related dlm_callback_work() work
> function where it's get a put call. This patch reverts the kref_get()
> when it's necessary in cases if already queued or not.
>
> In case of dlm_callback_resume() we need to ensure that the
> LSFL_CB_DELAY bit is cleared after all ls->ls_cb_delay lkbs are queued for
> work. As the ls->ls_cb_delay list handling is there for queuing work for
> later it should not be the case that a work was already queued, if so we
> drop a warning.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/ast.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
> index 0271796d36b1..68e09ed8234e 100644
> --- a/fs/dlm/ast.c
> +++ b/fs/dlm/ast.c
> @@ -177,6 +177,7 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
>  {
>         struct dlm_ls *ls = lkb->lkb_resource->res_ls;
>         uint64_t new_seq, prev_seq;
> +       bool queued = true;
>         int rv;
>
>         spin_lock(&dlm_cb_seq_spin);
> @@ -202,13 +203,19 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
>
>                 mutex_lock(&ls->ls_cb_mutex);
>                 if (test_bit(LSFL_CB_DELAY, &ls->ls_flags)) {
> -                       if (list_empty(&lkb->lkb_cb_list))
> +                       if (list_empty(&lkb->lkb_cb_list)) {
>                                 list_add(&lkb->lkb_cb_list, &ls->ls_cb_delay);
> +                               queued = false;
> +                       }
>                 } else {
> -                       queue_work(ls->ls_callback_wq, &lkb->lkb_cb_work);
> +                       queued = !queue_work(ls->ls_callback_wq, &lkb->lkb_cb_work);
>                 }
>                 mutex_unlock(&ls->ls_cb_mutex);
> +
> +               if (queued)
> +                       dlm_put_lkb(lkb);
>         }

I will drop this patch and 2/3, there is nothing wrong as it does a if
(!prev_seq) before and if (!prev_seq) is true it acts like if it's
already queued for list_add() and queue_work() (I believe)... however
personally, I am not happy with this how it's currently is because
this code smells like it was forgotten to take care about if it's
already queued or not. This is only working because of some other
lkb-specific handling what dlm_add_lkb_callback() and
dlm_callback_work() does regarding lkb->lkb_callbacks[0].seq - if
dlm_add_lkb_callback() would end in an "unlikely" error it would queue
nothing anymore.

Patch 1/3 is still valid and could cause problems.

- Alex

