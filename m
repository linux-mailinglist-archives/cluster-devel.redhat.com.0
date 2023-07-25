Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C963761B95
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jul 2023 16:26:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690295213;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZUJ4r2aY+x3CleDJbX/AV/N0fMSOwi5/571RR8N6LrY=;
	b=HhtpL6M9jG9aCZAFcvQW1j/j9bcqOyh5erhsVELDwPnpcLd/rfdo9b+N4IEY1zl+Th2WF/
	doz0QgX6pSGKW/uF8sEwdUCW1q8AuIHEVbiDo7i7Y1ZYget7Wql+UeH/KEGhAA2gvSFps/
	mzXfApcjo30hUSg8RMUauhGK2Wg3q/I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-h-flx6ppOQ6jnupxGxLx2A-1; Tue, 25 Jul 2023 10:26:49 -0400
X-MC-Unique: h-flx6ppOQ6jnupxGxLx2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C3B9805AF6;
	Tue, 25 Jul 2023 14:26:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 069BA40C2063;
	Tue, 25 Jul 2023 14:26:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5C14C1946A41;
	Tue, 25 Jul 2023 14:26:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C03261946589 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 25 Jul 2023 14:26:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5965FC2C7D3; Tue, 25 Jul 2023 14:26:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51BDBC2C856
 for <cluster-devel@redhat.com>; Tue, 25 Jul 2023 14:26:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3353C380051E
 for <cluster-devel@redhat.com>; Tue, 25 Jul 2023 14:26:37 +0000 (UTC)
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-IdlRH5PTOVCmGHwhukhxFg-1; Tue, 25 Jul 2023 10:26:35 -0400
X-MC-Unique: IdlRH5PTOVCmGHwhukhxFg-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-583fe0f84a5so22843037b3.3
 for <cluster-devel@redhat.com>; Tue, 25 Jul 2023 07:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690295195; x=1690899995;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZUJ4r2aY+x3CleDJbX/AV/N0fMSOwi5/571RR8N6LrY=;
 b=NbQXd9ogWdsBdHafblf8JDEWpxlyQK+8M9ZCTQPTkTRSbPbhlzQLnPMrUlGA5sIU2e
 4uMEqjJI/IUBnOa9ogC6BYUe4NMZv2g+3LjhWMsreEah8Ec8VXKyLfxG/BbgWR9rnzzS
 crSw123ejFrm/Sj7GIo16EZALpooYL5mBzje+jaMTr3AS28OBRkRfcCqbQuAYIH4vmDb
 WGrzd5xvSrXhrb7/mItFGe29pOJmpJzzurQWZyTKBGlwMTVNYzltcJ2DSqDPVGnzo3uh
 3J8GZpW+7laR3MDsmUEcB0AcM+sAtdBMlHqxLbxGOWDyy2+1lsycL9mwJC4LcNZjip8k
 J4Ew==
X-Gm-Message-State: ABy/qLbZE35rujRjw2wg4JPHRrtSH1jWwqcCiNuVr7YlyjUONsDg8xRq
 VM5uOeBEWMHVXh5Qzc9APvMBZSBVwHrCwVMTOToPinSg80g0TmG2I5XMrEYNBIfBL0jHkEordCd
 Dh1lEHcevrOII3jYXCEwv8Gp07FHmZcb5bDJ0KQ==
X-Received: by 2002:a0d:ca0e:0:b0:577:4975:c114 with SMTP id
 m14-20020a0dca0e000000b005774975c114mr9669222ywd.0.1690295195304; 
 Tue, 25 Jul 2023 07:26:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE9UQpxq1fveOaxD31SoTyFiUUMp4sUQ52JsLcD5Jz+oFaONTwQ/ahNSrQ+l7hC+lie+j/6Tk+Nu2tfxvLqH8g=
X-Received: by 2002:a0d:ca0e:0:b0:577:4975:c114 with SMTP id
 m14-20020a0dca0e000000b005774975c114mr9669202ywd.0.1690295195091; Tue, 25 Jul
 2023 07:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230718180721.745569-1-aahringo@redhat.com>
 <20230718180721.745569-4-aahringo@redhat.com>
In-Reply-To: <20230718180721.745569-4-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 25 Jul 2023 10:26:23 -0400
Message-ID: <CAK-6q+hOv6qEnStcWD6_OCZH9XO_m+Dh-2KX5rYaXbuNOgp6gw@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
> +       info.pid =3D fl->fl_pid;
> +       info.ex =3D (fl->fl_type =3D=3D F_WRLCK);
> +       info.fsid =3D ls->ls_global_id;
> +       dlm_put_lockspace(ls);
> +       info.number =3D number;
> +       info.start =3D fl->fl_start;
> +       info.end =3D fl->fl_end;
> +       info.owner =3D (__u64)fl->fl_pid;
> +
> +       rv =3D do_lock_cancel(&info);
> +       switch (rv) {
> +       case 0:
> +               spin_lock(&ops_lock);
> +               /* lock request to cancel must be on recv_list because
> +                * do_lock_cancel() synchronizes it.
> +                */
> +               op =3D plock_lookup_waiter(&info);
> +               if (WARN_ON_ONCE(!op)) {
> +                       rv =3D -ENOLCK;
> +                       break;

missing spin_unlock() here. I will add it to my upcoming patch series.

- Alex

