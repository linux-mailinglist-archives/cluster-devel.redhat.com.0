Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 220EC4B8D4E
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Feb 2022 17:09:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645027741;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=yarxGPppDI7TPgsnjFn1Hqykst0hnZ/VYfuv/RelFpo=;
	b=B7AtBUssOb6PxgBn0SiH1cECrp3siO84tQOqYJqfOnFnfih6nv9f4Ib03CQehN9xadv7A4
	QAxuXmZkkV0Jzr2494u5o1/mI9lav7g4N4tj9EjGhWNJZXNdraOwvMwjgD+pt1/6p2AkAy
	W3+fHxSfYPS2VoLLIzUiX6XzMNx9NGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-Ou-M9N6YODOkXO5YvXio-w-1; Wed, 16 Feb 2022 11:08:57 -0500
X-MC-Unique: Ou-M9N6YODOkXO5YvXio-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 695441F2DA;
	Wed, 16 Feb 2022 16:08:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56E9B70D55;
	Wed, 16 Feb 2022 16:08:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D832F4BB7B;
	Wed, 16 Feb 2022 16:08:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21GG8qmW024380 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Feb 2022 11:08:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0E11B76EE; Wed, 16 Feb 2022 16:08:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 092B276C2
	for <cluster-devel@redhat.com>; Wed, 16 Feb 2022 16:08:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2AF71C07827
	for <cluster-devel@redhat.com>; Wed, 16 Feb 2022 16:08:45 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-85-9zXeuIBIPYC7EmTIDSp_Pg-1; Wed, 16 Feb 2022 11:08:44 -0500
X-MC-Unique: 9zXeuIBIPYC7EmTIDSp_Pg-1
Received: by mail-wm1-f72.google.com with SMTP id
	o24-20020a05600c379800b0037c3222c0faso1795722wmr.1
	for <cluster-devel@redhat.com>; Wed, 16 Feb 2022 08:08:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yarxGPppDI7TPgsnjFn1Hqykst0hnZ/VYfuv/RelFpo=;
	b=tNelePzOWiNt7yD7XsrZr06FBgnhPWeQHl84QbSZsIYanB7GzomOMhHxfa0WF2H0Yy
	BI7n04sL8KLoMIc03YimqpTkKUvA4A7T9mLRwg59YnM7JKEDPvE4bdD9VuaoQaRSKG9U
	m1a1o6tkYki5KoftaU4SX7xjsXGsppQ0/IjkiuBEjPTG3uOg1acqQEGZlQl9tv5zj8wj
	/QItX1J08ZnVsvRzKp8iTu5eH0rsWapKc8sBJ0GMnsAuOMSPyAh6ToX1BOYG1yGU2vjw
	XFFaAgzWPZtUUkkg0B/Z/lTu/0/8N9Lh/0Zry5V9AYdPwKWsfbUpBmVwImvgFOim+zce
	fPAw==
X-Gm-Message-State: AOAM532OCBQLKtHhjsDDQKMZCcph/lpGQDQtlGr6Xza3JTErfkp3zIaO
	yW6fBuVoIKos0kCFyTqIKbxAfN4Oc8cLpw/Y6ieKVDbq0B4JYAgk6PbwXfaMDqQs6Tve35jv76S
	A+Ad+KJNK/avf2+rRkIvaj6qEL45jeOSExmsIRA==
X-Received: by 2002:a7b:c94e:0:b0:37b:ea2f:788c with SMTP id
	i14-20020a7bc94e000000b0037bea2f788cmr2297914wml.14.1645027723534;
	Wed, 16 Feb 2022 08:08:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzW6Gw6UptET+WcZ1CwA0kyeuNf9MWoL/g1osLw8CO6qeaGG87WgNpFGaQp+XDLKZDUiLeje4dcprU4pqtkpeo=
X-Received: by 2002:a7b:c94e:0:b0:37b:ea2f:788c with SMTP id
	i14-20020a7bc94e000000b0037bea2f788cmr2297903wml.14.1645027723373;
	Wed, 16 Feb 2022 08:08:43 -0800 (PST)
MIME-Version: 1.0
References: <20220216155307.2994688-1-aahringo@redhat.com>
	<20220216155307.2994688-2-aahringo@redhat.com>
In-Reply-To: <20220216155307.2994688-2-aahringo@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 16 Feb 2022 17:08:31 +0100
Message-ID: <CAHc6FU77jwdsDv_FGCFxrUVn_DOEqGrKEkB8c7N2pAF_j5Xo+A@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH dlm/next 1/4] fs: dlm: replace sanity
 checks with WARN_ON
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 16, 2022 at 4:53 PM Alexander Aring <aahringo@redhat.com> wrote:
> There are several sanity checks and recover handling if they occur in
> the dlm plock handling. They should never occur otherwise we have a bug
> in the code. To make such bugs more visible we remove the recover
> handling and add a WARN_ON() on those sanity checks.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/plock.c | 32 ++++----------------------------
>  1 file changed, 4 insertions(+), 28 deletions(-)
>
> diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> index a10d2bcfe75a..55fba2f0234f 100644
> --- a/fs/dlm/plock.c
> +++ b/fs/dlm/plock.c
> @@ -157,13 +157,7 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
>                 goto out;
>         }
>
> -       spin_lock(&ops_lock);
> -       if (!list_empty(&op->list)) {
> -               log_error(ls, "dlm_posix_lock: op on list %llx",
> -                         (unsigned long long)number);
> -               list_del(&op->list);
> -       }
> -       spin_unlock(&ops_lock);
> +       WARN_ON(!list_empty(&op->list));

Why don't those checks need the ops_lock spin lock anymore?
Why does it make sense to get rid of the list_del calls?

>         rv = op->info.rv;
>
> @@ -190,13 +184,7 @@ static int dlm_plock_callback(struct plock_op *op)
>         struct plock_xop *xop = (struct plock_xop *)op;
>         int rv = 0;
>
> -       spin_lock(&ops_lock);
> -       if (!list_empty(&op->list)) {
> -               log_print("dlm_plock_callback: op on list %llx",
> -                         (unsigned long long)op->info.number);
> -               list_del(&op->list);
> -       }
> -       spin_unlock(&ops_lock);
> +       WARN_ON(!list_empty(&op->list));
>
>         /* check if the following 2 are still valid or make a copy */
>         file = xop->file;
> @@ -289,13 +277,7 @@ int dlm_posix_unlock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
>         send_op(op);
>         wait_event(recv_wq, (op->done != 0));
>
> -       spin_lock(&ops_lock);
> -       if (!list_empty(&op->list)) {
> -               log_error(ls, "dlm_posix_unlock: op on list %llx",
> -                         (unsigned long long)number);
> -               list_del(&op->list);
> -       }
> -       spin_unlock(&ops_lock);
> +       WARN_ON(!list_empty(&op->list));
>
>         rv = op->info.rv;
>
> @@ -343,13 +325,7 @@ int dlm_posix_get(dlm_lockspace_t *lockspace, u64 number, struct file *file,
>         send_op(op);
>         wait_event(recv_wq, (op->done != 0));
>
> -       spin_lock(&ops_lock);
> -       if (!list_empty(&op->list)) {
> -               log_error(ls, "dlm_posix_get: op on list %llx",
> -                         (unsigned long long)number);
> -               list_del(&op->list);
> -       }
> -       spin_unlock(&ops_lock);
> +       WARN_ON(!list_empty(&op->list));
>
>         /* info.rv from userspace is 1 for conflict, 0 for no-conflict,
>            -ENOENT if there are no locks on the file */
> --
> 2.31.1
>

Thanks,
Andreas

