Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CB18A759D78
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jul 2023 20:36:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689791776;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ur/7tY9x/tRgeuGcTOKDecGX+pLOZx869sm+6cI/oO4=;
	b=R0As3FABY/mgzNQPiWfp8aB+Vqe2kAcnVRJgEu76V4L7hKfKqYG+BvURTnM1Aq/vEKU0k9
	xoSGNTdp2SUcQCyTjn/PZyrv+Al25DgsJFU9caVlQpzf403U03nTstnhW7zP3TINnWzgM6
	XBX3HaM+RjW3bCq6YT+SmFTSqbhJXPY=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-qexWVZ5lM_622-ywozJW9g-1; Wed, 19 Jul 2023 14:36:13 -0400
X-MC-Unique: qexWVZ5lM_622-ywozJW9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED8C33849533;
	Wed, 19 Jul 2023 18:36:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED40B40D2839;
	Wed, 19 Jul 2023 18:36:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 953DE19465BD;
	Wed, 19 Jul 2023 18:35:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 265E919465A4 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 19 Jul 2023 18:33:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CC4AE40C2070; Wed, 19 Jul 2023 18:33:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C53B140C206F
 for <cluster-devel@redhat.com>; Wed, 19 Jul 2023 18:33:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A444A858F1E
 for <cluster-devel@redhat.com>; Wed, 19 Jul 2023 18:33:34 +0000 (UTC)
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-AIeBH34gMOqI9D8OWGPyEw-1; Wed, 19 Jul 2023 14:33:33 -0400
X-MC-Unique: AIeBH34gMOqI9D8OWGPyEw-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-57325434999so248697b3.1
 for <cluster-devel@redhat.com>; Wed, 19 Jul 2023 11:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689791613; x=1692383613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ur/7tY9x/tRgeuGcTOKDecGX+pLOZx869sm+6cI/oO4=;
 b=AMMn+Z9XsyJp3OSvu89c59EjezvMoaH6U2VB6cQ2XxzcG6vW3wzGHebkNY15TYcVAJ
 mIw2m8dkUriwc5IzhFPtvyU4blVy7elAqsO7fP7hWa3rJgpXZlLr/EyYGtJOWX16sd5Z
 6qaNR5/z8xbiOzvBBSVF8lNAvjeDgEU1ltnXP5Z1cQv8uLZ5NhJWOoXxmQmKsCKrebP5
 eGx0dD3Hnaksva7PEEAc1nUg1i/uyB+tOc4cbYtqQyx5wuNgTjQM9NbZiufXHHmDzqNe
 co1V4yjllcI9iGBQ05Ujjj02ZZeGA3+b932M5J7B2s8KkoudOoY7Q3RPA/xI06KV3z54
 YviA==
X-Gm-Message-State: ABy/qLYwxX2ptv5SuQWaQn6sSy30aMyCHerHqRDgzp6+VwH8SCFbESru
 Bv4FpzL4F+MSnK6ENO5ex5m0JOACJxaet1y1zhOr9R8Zm081qLZHk3tQKGcWgLfrsUUfAgerxIH
 KmcLDBDkD1c58r9mnbfUr1c+alh28d6O5BZFp4w==
X-Received: by 2002:a81:92d3:0:b0:581:2887:22be with SMTP id
 j202-20020a8192d3000000b00581288722bemr21774103ywg.37.1689791612868; 
 Wed, 19 Jul 2023 11:33:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGBzan3MF717TbeJevLQRirLTiedRen/Yjq7rPm4PF2/R07POBpIIAQkupe9F5A+x6nP2ha/T8mDGhgyrdBxNM=
X-Received: by 2002:a81:92d3:0:b0:581:2887:22be with SMTP id
 j202-20020a8192d3000000b00581288722bemr21774082ywg.37.1689791612580; Wed, 19
 Jul 2023 11:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230718180721.745569-1-aahringo@redhat.com>
 <20230718180721.745569-4-aahringo@redhat.com>
In-Reply-To: <20230718180721.745569-4-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 19 Jul 2023 14:33:21 -0400
Message-ID: <CAK-6q+j10uosheJ=jeU9R7p2kV1niAoMhPOkc7HMtNgkp2e2XQ@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCHv3 v6.5-rc2 3/3] fs: dlm: fix F_CANCELLK
 to cancel pending request
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
Cc: ocfs2-devel@lists.linux.dev, mark@fasheh.com, cluster-devel@redhat.com,
 joseph.qi@linux.alibaba.com, jlbec@evilplan.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 18, 2023 at 2:07=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
>
> This patch fixes the current handling of F_CANCELLK by not just doing a
> unlock as we need to try to cancel a lock at first. A unlock makes sense
> on a non-blocking lock request but if it's a blocking lock request we
> need to cancel the request until it's not granted yet. This patch is fixi=
ng
> this behaviour by first try to cancel a lock request and if it's failed
> it's unlocking the lock which seems to be granted.
>
> Note: currently the nfs locking handling was disabled by commit
> 40595cdc93ed ("nfs: block notification on fs with its own ->lock").
> However DLM was never being updated regarding to this change. Future
> patches will try to fix lockd lock requests for DLM. This patch is
> currently assuming the upstream DLM lockd handling is correct.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/plock.c            | 102 +++++++++++++++++++++++++++++++++-----
>  fs/gfs2/file.c            |   9 ++--
>  fs/ocfs2/stack_user.c     |  13 ++---
>  include/linux/dlm_plock.h |   2 +
>  4 files changed, 97 insertions(+), 29 deletions(-)
>
> diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> index a8ffa0760913..84510994b177 100644
> --- a/fs/dlm/plock.c
> +++ b/fs/dlm/plock.c
> @@ -42,6 +42,27 @@ static inline void set_version(struct dlm_plock_info *=
info)
>         info->version[2] =3D DLM_PLOCK_VERSION_PATCH;
>  }
>
> +static struct plock_op *plock_lookup_waiter(const struct dlm_plock_info =
*info)
> +{
> +       struct plock_op *op =3D NULL, *iter;
> +
> +       list_for_each_entry(iter, &recv_list, list) {
> +               if (iter->info.fsid =3D=3D info->fsid &&
> +                   iter->info.number =3D=3D info->number &&
> +                   iter->info.owner =3D=3D info->owner &&
> +                   iter->info.pid =3D=3D info->pid &&
> +                   iter->info.start =3D=3D info->start &&
> +                   iter->info.end =3D=3D info->end &&
> +                   iter->info.ex =3D=3D info->ex &&
> +                   iter->info.wait) {
> +                       op =3D iter;
> +                       break;
> +               }
> +       }
> +
> +       return op;
> +}
> +
>  static int check_version(struct dlm_plock_info *info)
>  {
>         if ((DLM_PLOCK_VERSION_MAJOR !=3D info->version[0]) ||
> @@ -334,6 +355,73 @@ int dlm_posix_unlock(dlm_lockspace_t *lockspace, u64=
 number, struct file *file,
>  }
>  EXPORT_SYMBOL_GPL(dlm_posix_unlock);
>
> +/*
> + * NOTE: This implementation can only handle async lock requests as nfs
> + * do it. It cannot handle cancellation of a pending lock request sittin=
g
> + * in wait_event(), but for now only nfs is the only user local kernel
> + * user.
> + */
> +int dlm_posix_cancel(dlm_lockspace_t *lockspace, u64 number, struct file=
 *file,
> +                    struct file_lock *fl)
> +{
> +       struct dlm_plock_info info;
> +       struct plock_op *op;
> +       struct dlm_ls *ls;
> +       int rv;
> +
> +       /* this only works for async request for now and nfs is the only
> +        * kernel user right now.
> +        */
> +       if (WARN_ON_ONCE(!fl->fl_lmops || !fl->fl_lmops->lm_grant))
> +               return -EOPNOTSUPP;
> +
> +       ls =3D dlm_find_lockspace_local(lockspace);
> +       if (!ls)
> +               return -EINVAL;
> +

here is a:

memset(&info, 0, sizeof(info));

missing.

- Alex

