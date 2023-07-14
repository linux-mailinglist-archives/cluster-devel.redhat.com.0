Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CC194753C34
	for <lists+cluster-devel@lfdr.de>; Fri, 14 Jul 2023 15:54:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689342870;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7PK6HaFz82C/bdWyaRva/u+XDHKqnF71p3ds0rNqF6w=;
	b=Hok39NHpPzXSg/I5Uiu7U/OizqNV7H+6OdhJnEeLl9/VxQp7oV7SzrxYqrY3Zy2i8ti6lK
	XjsYKJRcqfPDo+lGUQYFM23R9CUQjlOdc9o3DWZc7c+WZXd4Y/JEflGXd+f1VBlxyRd/h2
	KNTGWuWuHgHM0bT5gt9BSQ1GWDwxNx8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-NJRthlyzPzSrIM6djeCPhw-1; Fri, 14 Jul 2023 09:54:26 -0400
X-MC-Unique: NJRthlyzPzSrIM6djeCPhw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5E6D8D16A2;
	Fri, 14 Jul 2023 13:54:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CD031454142;
	Fri, 14 Jul 2023 13:54:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1A93B19465A2;
	Fri, 14 Jul 2023 13:54:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B8CAA194658F for <cluster-devel@listman.corp.redhat.com>;
 Fri, 14 Jul 2023 13:54:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 657BA10C95; Fri, 14 Jul 2023 13:54:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DE4610C9D
 for <cluster-devel@redhat.com>; Fri, 14 Jul 2023 13:54:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DF783C0E449
 for <cluster-devel@redhat.com>; Fri, 14 Jul 2023 13:54:22 +0000 (UTC)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-lXK4UVCMNS2-SGc1lj3dog-1; Fri, 14 Jul 2023 09:54:21 -0400
X-MC-Unique: lXK4UVCMNS2-SGc1lj3dog-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-6686e4499b1so1023887b3a.1
 for <cluster-devel@redhat.com>; Fri, 14 Jul 2023 06:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689342858; x=1691934858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7PK6HaFz82C/bdWyaRva/u+XDHKqnF71p3ds0rNqF6w=;
 b=S1qNKd5QxEBdRs64Btm6tXJ7g8SVxlETcLHT2Zy8hEPIc+HgH5it+J3WDWTCxNoJzN
 2pJCmR7TnWB8o3hLPxy6N4JqXlcVmVTgvAgvUX8SKQ8bhKorTul7SjPYCAr7rGs+VtPp
 9uVtj9iq6HgubK736ovFri7AJMCHOAdUcT2Ur05n5dyLWQjodGM3WYG1UwAwKF6nTB/B
 sg077Z0p3KH+oB/ppV7r36mHQpSD6f08jEPaa85+WrE85/mAd680Y3372Um17JBYm5lg
 X/O8VzwluZ4vEXWX2loMC5Zww2tlaUaG1WToWQJVS8Rp8V97M5vEMqm2dkEAs1sdWbPT
 +fzw==
X-Gm-Message-State: ABy/qLZw0il6I/qMQfhOGkQ+z1RYE5STw5X8YBgkuyvgyGyrchETzBcJ
 87+dR2DxB75ZKoG2pyaBuFHji0u6eIUuu+ZN0jNF1ivS4GomR3SMjWqs/vWzpu2NaRZH9dd6llv
 RXQpltWnYaL6eMkSMKrQXquYpmnNjqrZyvmYIEtfgW7SLMxb8
X-Received: by 2002:a05:6a20:2588:b0:12e:49f3:88d4 with SMTP id
 k8-20020a056a20258800b0012e49f388d4mr4368009pzd.1.1689342858637; 
 Fri, 14 Jul 2023 06:54:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHLQqVnt/mSH9AqHCVbmDj2KJ8TP2QEeDyFhtvzbrRfZYYONJeztval1fWTb8L/71DlqSxGqJw0P7geoPeWBIU=
X-Received: by 2002:a05:6a20:2588:b0:12e:49f3:88d4 with SMTP id
 k8-20020a056a20258800b0012e49f388d4mr4367984pzd.1.1689342858224; Fri, 14 Jul
 2023 06:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230713144029.3342637-1-aahringo@redhat.com>
In-Reply-To: <20230713144029.3342637-1-aahringo@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 14 Jul 2023 15:54:06 +0200
Message-ID: <CAHc6FU542V6T8F8W-npN24zVJih5iRckGHqHLPrVHLhLqWBOgA@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH v6.5-rc1 1/2] fs: dlm: introduce
 DLM_PLOCK_FL_NO_REPLY flag
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 4:40=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
> This patch introduces a new flag DLM_PLOCK_FL_NO_REPLY in case an dlm
> plock operation should not send a reply back. Currently this is kind of
> being handled in DLM_PLOCK_FL_CLOSE, but DLM_PLOCK_FL_CLOSE has more
> meanings that it will remove all waiters for a specific nodeid/owner
> values in by doing a unlock operation. In case of an error in dlm user
> space software e.g. dlm_controld we get an reply with an error back.
> This cannot be matched because there is no op to match in recv_list. We
> filter now on DLM_PLOCK_FL_NO_REPLY in case we had an error back as
> reply. In newer dlm_controld version it will never send a result back
> when DLM_PLOCK_FL_NO_REPLY is set. This filter is a workaround to handle
> older dlm_controld versions.

I don't think this makes sense. If dlm_controld understands a
particular request, it already knows whether or not that request
should receive a reply. On the other hand, if dlm_controld doesn't
understand a particular request, it should communicate that fact back
to the kernel so that the kernel will know. The kernel knows which
kinds of requests should and shouldn't receive replies, so when it is
sent a reply it doesn't expect, it knows that dlm_controld didn't
understand the request and is either outdated or plain broken. The
kernel doesn't need to pipe a flag through dlm_controld for figuring
that out.

Thanks,
Andreas

> Fixes: 901025d2f319 ("dlm: make plock operation killable")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/plock.c                 | 23 +++++++++++++++++++----
>  include/uapi/linux/dlm_plock.h |  1 +
>  2 files changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> index 70a4752ed913..7fe9f4b922d3 100644
> --- a/fs/dlm/plock.c
> +++ b/fs/dlm/plock.c
> @@ -96,7 +96,7 @@ static void do_unlock_close(const struct dlm_plock_info=
 *info)
>         op->info.end            =3D OFFSET_MAX;
>         op->info.owner          =3D info->owner;
>
> -       op->info.flags |=3D DLM_PLOCK_FL_CLOSE;
> +       op->info.flags |=3D (DLM_PLOCK_FL_CLOSE | DLM_PLOCK_FL_NO_REPLY);
>         send_op(op);
>  }
>
> @@ -293,7 +293,7 @@ int dlm_posix_unlock(dlm_lockspace_t *lockspace, u64 =
number, struct file *file,
>                 op->info.owner  =3D (__u64)(long) fl->fl_owner;
>
>         if (fl->fl_flags & FL_CLOSE) {
> -               op->info.flags |=3D DLM_PLOCK_FL_CLOSE;
> +               op->info.flags |=3D (DLM_PLOCK_FL_CLOSE | DLM_PLOCK_FL_NO=
_REPLY);
>                 send_op(op);
>                 rv =3D 0;
>                 goto out;
> @@ -392,7 +392,7 @@ static ssize_t dev_read(struct file *file, char __use=
r *u, size_t count,
>         spin_lock(&ops_lock);
>         if (!list_empty(&send_list)) {
>                 op =3D list_first_entry(&send_list, struct plock_op, list=
);
> -               if (op->info.flags & DLM_PLOCK_FL_CLOSE)
> +               if (op->info.flags & DLM_PLOCK_FL_NO_REPLY)
>                         list_del(&op->list);
>                 else
>                         list_move_tail(&op->list, &recv_list);
> @@ -407,7 +407,7 @@ static ssize_t dev_read(struct file *file, char __use=
r *u, size_t count,
>            that were generated by the vfs cleaning up for a close
>            (the process did not make an unlock call). */
>
> -       if (op->info.flags & DLM_PLOCK_FL_CLOSE)
> +       if (op->info.flags & DLM_PLOCK_FL_NO_REPLY)
>                 dlm_release_plock_op(op);
>
>         if (copy_to_user(u, &info, sizeof(info)))
> @@ -433,6 +433,21 @@ static ssize_t dev_write(struct file *file, const ch=
ar __user *u, size_t count,
>         if (check_version(&info))
>                 return -EINVAL;
>
> +       /* Some old dlm user space software will send replies back,
> +        * even if DLM_PLOCK_FL_NO_REPLY is set (because the flag is
> +        * new) e.g. if a error occur. We can't match them in recv_list
> +        * because they were never be part of it. We filter it here,
> +        * new dlm user space software will filter it in user space.
> +        *
> +        * In future this handling can be removed.
> +        */
> +       if (info.flags & DLM_PLOCK_FL_NO_REPLY) {
> +               pr_info("Received unexpected reply from op %d, "
> +                       "please update DLM user space software!\n",
> +                       info.optype);
> +               return count;
> +       }
> +
>         /*
>          * The results for waiting ops (SETLKW) can be returned in any
>          * order, so match all fields to find the op.  The results for
> diff --git a/include/uapi/linux/dlm_plock.h b/include/uapi/linux/dlm_ploc=
k.h
> index 63b6c1fd9169..8dfa272c929a 100644
> --- a/include/uapi/linux/dlm_plock.h
> +++ b/include/uapi/linux/dlm_plock.h
> @@ -25,6 +25,7 @@ enum {
>  };
>
>  #define DLM_PLOCK_FL_CLOSE 1
> +#define DLM_PLOCK_FL_NO_REPLY 2
>
>  struct dlm_plock_info {
>         __u32 version[3];
> --
> 2.31.1
>

