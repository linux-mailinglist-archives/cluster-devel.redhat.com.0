Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 202C25BECE5
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Sep 2022 20:36:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663699006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=npAizBMkOVeJhtteU90mjHijrOWxCdrkkWTuHdcI6ec=;
	b=NQ1lJzrR/fJ9oyj7Y3OeY7cbJW4ZrCWWQQJZ7SvEsR1ajk0nozlHC4o7BWiLN1lZOYzQve
	NRwLOQLUmu8uei7zJZB1Z+LJY6S6YA0zwrZsRVO8xC3uFw94WLz0/KDcaG74Jj0JNOR947
	pORWqNB2JAXEHSYgo+85ecxF76ekzms=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-vvRlEJDPO6i8cMXfx01w9w-1; Tue, 20 Sep 2022 14:36:41 -0400
X-MC-Unique: vvRlEJDPO6i8cMXfx01w9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D81C4811E87;
	Tue, 20 Sep 2022 18:36:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 068D21759F;
	Tue, 20 Sep 2022 18:36:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E032A194658D;
	Tue, 20 Sep 2022 18:36:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3F2291946588 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 20 Sep 2022 18:36:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 205B51410F36; Tue, 20 Sep 2022 18:36:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18B7A140EBF6
 for <cluster-devel@redhat.com>; Tue, 20 Sep 2022 18:36:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE454862FDC
 for <cluster-devel@redhat.com>; Tue, 20 Sep 2022 18:36:37 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-93-8KLtlBdiPz2kWMKC3Z8h8Q-1; Tue, 20 Sep 2022 14:36:36 -0400
X-MC-Unique: 8KLtlBdiPz2kWMKC3Z8h8Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 h133-20020a1c218b000000b003b3263d477eso1500983wmh.8
 for <cluster-devel@redhat.com>; Tue, 20 Sep 2022 11:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=npAizBMkOVeJhtteU90mjHijrOWxCdrkkWTuHdcI6ec=;
 b=EW3+7hST4F5wNJ7AR1ehN+OMveuWlZCWXiNQPXXBLgrLisownVgfE6RlgcrI7SBesf
 o6scxRSDJV4WkjnsAwCNMD3YVkZaFUQolDZ1rQ4iALph++OsVJEyGpPPXcXPKVFTXKEi
 8qWXz59+mKwep9gKpKt+f//MY20DTHt5Tg9IK69p7AKLl3cpt/5D27ceayLi2OZW1nFO
 9jPYs43yTJOjJqhdBspcaER0HTSHpUGWREVCzIYXHBnTc6ADn7jG0071CkRJFHWqe/jg
 gOd0xXPbM24JC485ZdcqFcn6MeAV7ljDQIZr3LOzxTvy2NfGyWuiuiQkWbgumuX90dDm
 51Dg==
X-Gm-Message-State: ACrzQf0u5ldmx1CIWKrK/wBR84HoJaTmjvLgVAleLkBmDyBtckaxHkbx
 0d5bhP3ux0++v/LIIUWW3e8iITpdRSBVsMpd2Ib01YyO8noI0n9nfrLYti6gXgoH4iyZRQOv55N
 7+Zg/UsvIkEteRT8nfODlMwBl2fGmzvFfYh1E9w==
X-Received: by 2002:a5d:53c8:0:b0:228:62ee:64cb with SMTP id
 a8-20020a5d53c8000000b0022862ee64cbmr14698500wrw.267.1663698995372; 
 Tue, 20 Sep 2022 11:36:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6x15oZAshyjcA1FJOluYgRtoOeMV1i5LXk6VhQCv4/LFFPKjGbt6Aaccq8NLbt7tE/N4OMqOaMRtanjTplpoo=
X-Received: by 2002:a5d:53c8:0:b0:228:62ee:64cb with SMTP id
 a8-20020a5d53c8000000b0022862ee64cbmr14698489wrw.267.1663698995089; Tue, 20
 Sep 2022 11:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220916184309.3179451-1-aahringo@redhat.com>
 <20220916184309.3179451-6-aahringo@redhat.com>
In-Reply-To: <20220916184309.3179451-6-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 20 Sep 2022 14:36:23 -0400
Message-ID: <CAK-6q+gEirxOAeded1HGLd54n5UrXfcCxOmLiDFidDLX0581xQ@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH/RFC dlm/next 6/6] fs: dlm: use a
 non-static queue for callbacks
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Sep 16, 2022 at 2:43 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch will introducde a queue implementation for callbacks by using
> the Linux lists. The current callback queue handling is implemented by a
> static limit of 6 entries, see DLM_CALLBACKS_SIZE. The sequence number
> inside the callback structure was used to see if the entries inside the
> static entry is valid or not. We don't need any sequence numbers anymore
> with a dynamic datastructure with grows and shrinks during runtime to
> offer such functionality.
>
> We assume that every callback will be delivered to the DLM user if once
> queued. Therefore the callback flag DLM_CB_SKIP was dropped and the
> check for skipping bast was moved before worker handling and not skip
> while the callback worker executes. This will reduce unnecessary queues
> of the callback worker.
>
> All last callback saves are pointers now and don't need to copied over.
> There is a reference counter for callback structures which will care
> about to free the callback structures at the right time if they are not
> referenced anymore.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
...
>
> -       for (i = 1; i < DLM_CALLBACKS_SIZE; i++) {
> -               if (!lkb->lkb_callbacks[i].seq)
> -                       break;
> -               memcpy(&lkb->lkb_callbacks[i-1], &lkb->lkb_callbacks[i],
> -                      sizeof(struct dlm_callback));
> -               memset(&lkb->lkb_callbacks[i], 0, sizeof(struct dlm_callback));
> -               (*resid)++;
> -       }
> -
> -       /* if cb is a bast, it should be skipped if the blocking mode is
> -          compatible with the last granted mode */
> -
> -       if ((cb->flags & DLM_CB_BAST) && lkb->lkb_last_cast.seq) {
> -               if (dlm_modes_compat(cb->mode, lkb->lkb_last_cast.mode)) {
> -                       cb->flags |= DLM_CB_SKIP;
> -
> -                       log_debug(ls, "skip %x bast %llu mode %d "
> -                                 "for cast %llu mode %d",
> -                                 lkb->lkb_id,
> -                                 (unsigned long long)cb->seq,
> -                                 cb->mode,
> -                                 (unsigned long long)lkb->lkb_last_cast.seq,
> -                                 lkb->lkb_last_cast.mode);
> -                       rv = 0;
> -                       goto out;
> -               }
> -       }
> +       if (flags & DLM_CB_BAST)
> +               dlm_callback_set_last_ptr(&lkb->lkb_last_bast, cb);

I will change this to have an int lkb->lkb_last_bast_mode, this is
only used for debugfs and we need to hold a lock to get this
information. However we only need the mode and this only for debugging
information... so we copy just the mode value.

>
> -       if (cb->flags & DLM_CB_CAST)
> -               memcpy(&lkb->lkb_last_cast, cb, sizeof(struct dlm_callback));
> +       dlm_callback_set_last_ptr(&lkb->lkb_last_cb, cb);
>
> -       if (cb->flags & DLM_CB_BAST)
> -               memcpy(&lkb->lkb_last_bast, cb, sizeof(struct dlm_callback));
> -       rv = 0;
>   out:
>         return rv;
>  }
>
> +int dlm_dequeue_lkb_callback(struct dlm_lkb *lkb, struct dlm_callback **cb)
> +{
> +       /* oldest undelivered cb is callbacks first entry */
> +       *cb = list_first_entry_or_null(&lkb->lkb_callbacks,
> +                                      struct dlm_callback, list);
> +       if (!*cb)
> +               return DLM_DEQUEUE_CALLBACK_FAILURE;
> +
> +       /* remove it from callbacks so shift others down */
> +       list_del(&(*cb)->list);
> +       if (atomic_dec_and_test(&lkb->lkb_callbacks_count))
> +               return DLM_DEQUEUE_CALLBACK_LAST;
> +
> +       return DLM_DEQUEUE_CALLBACK_SUCCESS;
> +}
> +
>  void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
>                 uint32_t sbflags)
>  {
>         struct dlm_ls *ls = lkb->lkb_resource->res_ls;
> -       uint64_t new_seq, prev_seq;
>         int rv;
>
> -       spin_lock(&dlm_cb_seq_spin);
> -       new_seq = ++dlm_cb_seq;
> -       if (!dlm_cb_seq)
> -               new_seq = ++dlm_cb_seq;
> -       spin_unlock(&dlm_cb_seq_spin);
> -
>         if (lkb->lkb_flags & DLM_IFL_USER) {
> -               dlm_user_add_ast(lkb, flags, mode, status, sbflags, new_seq);
> +               dlm_user_add_ast(lkb, flags, mode, status, sbflags);
>                 return;
>         }
>
>         spin_lock(&lkb->lkb_cb_lock);
> -       prev_seq = lkb->lkb_callbacks[0].seq;
> -
> -       rv = dlm_add_lkb_callback(lkb, flags, mode, status, sbflags, new_seq);
> -       if (rv < 0)
> -               goto out;
> -
> -       if (!prev_seq) {
> +       rv = dlm_enqueue_lkb_callback(lkb, flags, mode, status, sbflags);
> +       spin_unlock(&lkb->lkb_cb_lock);
> +       switch (rv) {
> +       case DLM_ENQUEUE_CALLBACK_NEED_SCHED:
>                 kref_get(&lkb->lkb_ref);
>
>                 read_lock(&ls->ls_cb_lock);
> @@ -203,9 +159,16 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
>                         queue_work(ls->ls_callback_wq, &lkb->lkb_cb_work);
>                 }
>                 read_unlock(&ls->ls_cb_lock);
> +               break;
> +       case DLM_ENQUEUE_CALLBACK_FAILURE:
> +               WARN_ON(1);
> +               break;
> +       case DLM_ENQUEUE_CALLBACK_SUCCESS:
> +               break;
> +       default:
> +               WARN_ON(1);
> +               break;
>         }
> - out:
> -       spin_unlock(&lkb->lkb_cb_lock);
>  }
>
>  void dlm_callback_work(struct work_struct *work)
> @@ -214,54 +177,36 @@ void dlm_callback_work(struct work_struct *work)
>         struct dlm_ls *ls = lkb->lkb_resource->res_ls;
>         void (*castfn) (void *astparam);
>         void (*bastfn) (void *astparam, int mode);
> -       struct dlm_callback callbacks[DLM_CALLBACKS_SIZE];
> -       int i, rv, resid;
> +       struct dlm_callback *cb;
> +       int rv;
>
> -       memset(&callbacks, 0, sizeof(callbacks));
> +       WARN_ON(!atomic_read(&lkb->lkb_callbacks_count));
>

this WARN_ON() can be removed and mostly covered the WARN_ON() when
dequeue() fails. Because we see it as a failure to see a dequeue() and
there was nothing to dequeue() which indicates an issue with the whole
callback queue workflow.

> -       spin_lock(&lkb->lkb_cb_lock);
> -       if (!lkb->lkb_callbacks[0].seq) {
> -               /* no callback work exists, shouldn't happen */
> -               log_error(ls, "dlm_callback_work %x no work", lkb->lkb_id);
> -               dlm_print_lkb(lkb);
> -               dlm_dump_lkb_callbacks(lkb);
> -       }
> +       do {
> +               spin_lock(&lkb->lkb_cb_lock);
> +               rv = dlm_dequeue_lkb_callback(lkb, &cb);
> +               spin_unlock(&lkb->lkb_cb_lock);
>
> -       for (i = 0; i < DLM_CALLBACKS_SIZE; i++) {
> -               rv = dlm_rem_lkb_callback(ls, lkb, &callbacks[i], &resid);
> -               if (rv < 0)
> +               if (WARN_ON(rv == DLM_DEQUEUE_CALLBACK_FAILURE))

here.

- Alex

