Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5EF57D68B
	for <lists+cluster-devel@lfdr.de>; Fri, 22 Jul 2022 00:09:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658441350;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=yVieBIY4tlglZwilyTVRxHw1CLIjvl9/EuHCFz2oMjU=;
	b=jA53XSeu6IkfZDEmA5/NQQasnpElXVNkAoUzIwCiq2ZLKrqn2P7xtEmX/9qJTEAFOi7ETz
	1SawQbuj2MdcSNiQGN1IDD/fu3wdGEDtV/cTafmwG/tQDO1rLUCC7nPF3Zxoy+5Qc3Utky
	1bxLzS79ED9SRAKv1kze/tRu3RU56Mw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-SNRWRs8rNGGMWDq1HEm6VA-1; Thu, 21 Jul 2022 18:09:06 -0400
X-MC-Unique: SNRWRs8rNGGMWDq1HEm6VA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F0A9811E80;
	Thu, 21 Jul 2022 22:09:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C88E492C3B;
	Thu, 21 Jul 2022 22:09:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D2F7C1947077;
	Thu, 21 Jul 2022 22:09:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8A650194704F for <cluster-devel@listman.corp.redhat.com>;
 Thu, 21 Jul 2022 22:09:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 76AF9492CA5; Thu, 21 Jul 2022 22:09:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DF2A492C3B
 for <cluster-devel@redhat.com>; Thu, 21 Jul 2022 22:09:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33EC4101A586
 for <cluster-devel@redhat.com>; Thu, 21 Jul 2022 22:09:03 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-lRiEesUwMw2IgFmeMvOI8g-1; Thu, 21 Jul 2022 18:08:59 -0400
X-MC-Unique: lRiEesUwMw2IgFmeMvOI8g-1
Received: by mail-qt1-f199.google.com with SMTP id
 ay25-20020a05622a229900b0031ef5fdf8f8so1841688qtb.7
 for <cluster-devel@redhat.com>; Thu, 21 Jul 2022 15:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yVieBIY4tlglZwilyTVRxHw1CLIjvl9/EuHCFz2oMjU=;
 b=JfosBMq3v8nceOuvJeVrWwruvdkANz2fKw94TrLOgbOvIJypocieSQyLPNgIzvLX3c
 vZHeglHpq5vp65JGH9cnFjhjjYcnR+gHcb+LCsmkBoUgDMOM+VSDxF33MewwAMpLOdQO
 zNGhmj0l9zMiHy7NtjhA6ldZbTsXvYAVHB4y+OFs3/eVYwzwonZAKOKhkCM4/+K7ta/N
 uGN3KCfrYton4/OiV3tEyKnG8mZThFC7KYRGKVeozCmheLokSe9oXOn28+H6fRf8/FTE
 lixE2QNxo8zSon8Pf0/+DBX7Z4d66fEYmKQHks8uobxGIUarND5YwiKN90KxJwvq3qVn
 xF5Q==
X-Gm-Message-State: AJIora98Ut/WxyzQBuSJrHAJuZmkpkhOopn7qS6TEVLeFIusEnf+E3T5
 RZ4JCWOChSrefPDm+trYN/7Pq9gR57LRZLTqZwfbPXZMwfLsR10lckeVZSoOklg4bAb1X1IHwzQ
 FOoueYDEYzYUJyiWsVaRPFD5mhkkrdY1BYY0A4w==
X-Received: by 2002:a05:622a:1316:b0:31e:f3b4:1c8c with SMTP id
 v22-20020a05622a131600b0031ef3b41c8cmr647939qtk.339.1658441338899; 
 Thu, 21 Jul 2022 15:08:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sfkcVKkhADjHcjhtERK2K5twxorfbmKHwbyNtio0tAuPjfGCWzd2BVM3TDm8t5HhokYvuTFIqEPpWP8vL9NfA=
X-Received: by 2002:a05:622a:1316:b0:31e:f3b4:1c8c with SMTP id
 v22-20020a05622a131600b0031ef3b41c8cmr647919qtk.339.1658441338626; Thu, 21
 Jul 2022 15:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220721215340.936838-1-aahringo@redhat.com>
 <20220721215340.936838-4-aahringo@redhat.com>
In-Reply-To: <20220721215340.936838-4-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 21 Jul 2022 18:08:47 -0400
Message-ID: <CAK-6q+hpc5sd27-C93c9gDc26q9N_+pNjeg7YGDa1ju2dcXOJQ@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
> +
>   out:
>         mutex_unlock(&lkb->lkb_cb_mutex);
>  }
> @@ -303,9 +310,7 @@ void dlm_callback_resume(struct dlm_ls *ls)
>  {
>         struct dlm_lkb *lkb, *safe;
>         int count = 0, sum = 0;
> -       bool empty;
> -
> -       clear_bit(LSFL_CB_DELAY, &ls->ls_flags);
> +       bool empty, queued;
>
>         if (!ls->ls_callback_wq)
>                 return;
> @@ -314,12 +319,16 @@ void dlm_callback_resume(struct dlm_ls *ls)
>         mutex_lock(&ls->ls_cb_mutex);
>         list_for_each_entry_safe(lkb, safe, &ls->ls_cb_delay, lkb_cb_list) {
>                 list_del_init(&lkb->lkb_cb_list);
> -               queue_work(ls->ls_callback_wq, &lkb->lkb_cb_work);
> +               queued = queue_work(ls->ls_callback_wq, &lkb->lkb_cb_work);
> +               WARN_ON_ONCE(!queued);

grml, that should be "!queue_work(ls->ls_callback_wq,
&lkb->lkb_cb_work);" and then "WARN_ON_ONCE(queued);" to follow the
same as above in dlm_add_cb(). Whereas queued is true as it is already
queued for work.

- Alex

