Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8F975CEF1
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Jul 2023 18:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689956766;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UQ4yTg6KFwOyH6/4S0w1ZuRiq6GdGDOlqOrCrxtn2fs=;
	b=JPbzMEIfBoH3IkKWuNLy2ft9G409qQKaa397j4zH2gPUZj6GrMkLwHhd82VF1lrSFxw7m4
	QphVhuvix/DNJBbeoe6U9T2aab5PQExOlTM7F1BdKQHmHCUu8vHLEvb1nVkzV9klLjDmxN
	zcpgEFhfy5bm5wEwT4BKylZpR8Up37k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-5r1KXbEjNeys5r0MEByz4A-1; Fri, 21 Jul 2023 12:26:03 -0400
X-MC-Unique: 5r1KXbEjNeys5r0MEByz4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E74CD185A794;
	Fri, 21 Jul 2023 16:26:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 946C0200B41D;
	Fri, 21 Jul 2023 16:26:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 38BB11946A49;
	Fri, 21 Jul 2023 16:26:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DF8BA1946A43 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Jul 2023 16:25:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D89E3C5796A; Fri, 21 Jul 2023 16:25:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0A16C57969
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 16:25:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB88E800C7F
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 16:25:39 +0000 (UTC)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-23cHv3mDOOSYcyBBgFoNvQ-1; Fri, 21 Jul 2023 12:25:38 -0400
X-MC-Unique: 23cHv3mDOOSYcyBBgFoNvQ-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1b895fa8929so11662915ad.0
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 09:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689956737; x=1690561537;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UQ4yTg6KFwOyH6/4S0w1ZuRiq6GdGDOlqOrCrxtn2fs=;
 b=fzHmGUJ1/IJac94lhd/SP5HKgyzJ0w6ejWhpfDLpS7ilw2xTctj3kJfh4G2PXhFOs8
 rmScR9P43L1gId3YFeeHXTF7CdfnDzmddrkOS4/Yf6w4VeeziqsjF3e7eZFzAAaIQ9GE
 RKcH0rDgLsnBMr5tPjO9VvQ1JZwC9JgBlXL50E7bzl5fWG/HQCiCuuUyzLIMVJx9ImZW
 dVGPAMTNG972Eb6Tg6reSTtYr5SsSPqZqkEkiqJzwkaUbYhjAjn/VFmMEspGCWPROUzv
 pV4CdxkLNkhDoB3r/lSinRMEWnin3HUgvgBU1w0bc+owprpgNnuQqqGY8t4Q6Njap34G
 xnlg==
X-Gm-Message-State: ABy/qLYYLOi+Jmw+7hZcuOQA2G1t3nNUQjE59n0MUE+hfpV0tHLXjxOY
 HvgfNoYe1mUasQCjIYip4kRGf0UReq+6pZ65VQ5cUOoDXPMbtcCm0Kr4FJJbgl3SbHyzCpexUhz
 WYlVBpNc3BF/qDpNeoxM5jFvOxUI3yRrDV7dnQIValxxnxEjo
X-Received: by 2002:a17:902:ba88:b0:1b8:944a:a932 with SMTP id
 k8-20020a170902ba8800b001b8944aa932mr1905366pls.2.1689956736665; 
 Fri, 21 Jul 2023 09:25:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlESCjtIwnq0sK4ezm/d3ZuAOFyZc8HY57yrELDobuL2rFh3CsR8Fu9PuxAquVxHTW+clt66EmlVWhzLu5YVWLo=
X-Received: by 2002:a17:902:ba88:b0:1b8:944a:a932 with SMTP id
 k8-20020a170902ba8800b001b8944aa932mr1905353pls.2.1689956736295; Fri, 21 Jul
 2023 09:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230720122241.1381845-1-aahringo@redhat.com>
 <20230720122241.1381845-4-aahringo@redhat.com>
In-Reply-To: <20230720122241.1381845-4-aahringo@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 21 Jul 2023 18:25:24 +0200
Message-ID: <CAHc6FU6nHjx2JQn=1_zif-gLFZQHZfwb5E8HHXHcYn67_VV0SQ@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCHv4 v6.5-rc2 3/3] fs: dlm: fix F_CANCELLK
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 2:22=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
> This patch fixes the current handling of F_CANCELLK by not just doing a
> unlock as we need to try to cancel a lock at first. A unlock makes sense
> on a non-blocking lock request but if it's a blocking lock request we
> need to cancel the request until it's not granted yet. This patch is fixi=
ng
> this behaviour by first try to cancel a lock request and if it's failed
> it's unlocking the lock which seems to be granted.

I don't like how this is implemented, but the problem already starts
in commit 57e2c2f2d94c ("fs: dlm: fix mismatch of plock results from
userspace"). That commit relies on how dlm_controld is implemented
internally; it requires dlm_controld to keep all replies to
non-blocking requests in perfect order. The correctness of that
approach is more difficult to argue for than it should be, the code
might break in non-obvious ways, and it limits the kinds of things
dlm_controld will be able to do in the future. And this change relies
on the same flawed design.

Instead, when noticing that we don't have a way to uniquely identify
requests, such a way should just have been introduced. The CANCEL
request would then carry the same unique identifier as the original
locking request, dlm_controld would reply either to the original
locking request or to the cancel request, and the kernel would have no
problem matching the reply to the request.

But without unique request identifiers, we now end up with those
redundant -ENOENT replies to CANCEL requests and with those
essentially duplicate entries for the same request on recv_list. Not
great.

Andreas

> Note: currently the nfs locking handling was disabled by commit
> 40595cdc93ed ("nfs: block notification on fs with its own ->lock").
> However DLM was never being updated regarding to this change. Future
> patches will try to fix lockd lock requests for DLM. This patch is
> currently assuming the upstream DLM lockd handling is correct.
> ---
>  fs/dlm/plock.c            | 103 +++++++++++++++++++++++++++++++++-----
>  fs/gfs2/file.c            |   9 ++--
>  fs/ocfs2/stack_user.c     |  13 ++---
>  include/linux/dlm_plock.h |   2 +
>  4 files changed, 98 insertions(+), 29 deletions(-)
>
> diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> index a8ffa0760913..943d9f8e5564 100644
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
> @@ -334,6 +355,74 @@ int dlm_posix_unlock(dlm_lockspace_t *lockspace, u64=
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
> +       memset(&info, 0, sizeof(info));
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
> +               }
> +
> +               list_del(&op->list);
> +               spin_unlock(&ops_lock);
> +               WARN_ON(op->info.optype !=3D DLM_PLOCK_OP_LOCK);
> +               op->data->callback(op->data->fl, -EINTR);
> +               dlm_release_plock_op(op);
> +               rv =3D -EINTR;
> +               break;
> +       case -ENOENT:
> +               /* if cancel wasn't successful we probably were to late
> +                * or it was a non-blocking lock request, so just unlock =
it.
> +                */
> +               rv =3D dlm_posix_unlock(lockspace, number, file, fl);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return rv;
> +}
> +EXPORT_SYMBOL_GPL(dlm_posix_cancel);
> +
>  int dlm_posix_get(dlm_lockspace_t *lockspace, u64 number, struct file *f=
ile,
>                   struct file_lock *fl)
>  {
> @@ -457,19 +546,7 @@ static ssize_t dev_write(struct file *file, const ch=
ar __user *u, size_t count,
>          */
>         spin_lock(&ops_lock);
>         if (info.wait) {
> -               list_for_each_entry(iter, &recv_list, list) {
> -                       if (iter->info.fsid =3D=3D info.fsid &&
> -                           iter->info.number =3D=3D info.number &&
> -                           iter->info.owner =3D=3D info.owner &&
> -                           iter->info.pid =3D=3D info.pid &&
> -                           iter->info.start =3D=3D info.start &&
> -                           iter->info.end =3D=3D info.end &&
> -                           iter->info.ex =3D=3D info.ex &&
> -                           iter->info.wait) {
> -                               op =3D iter;
> -                               break;
> -                       }
> -               }
> +               op =3D plock_lookup_waiter(&info);
>         } else {
>                 list_for_each_entry(iter, &recv_list, list) {
>                         if (!iter->info.wait) {
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index 1bf3c4453516..386eceb2f574 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -1436,17 +1436,14 @@ static int gfs2_lock(struct file *file, int cmd, =
struct file_lock *fl)
>
>         if (!(fl->fl_flags & FL_POSIX))
>                 return -ENOLCK;
> -       if (cmd =3D=3D F_CANCELLK) {
> -               /* Hack: */
> -               cmd =3D F_SETLK;
> -               fl->fl_type =3D F_UNLCK;
> -       }
>         if (unlikely(gfs2_withdrawn(sdp))) {
>                 if (fl->fl_type =3D=3D F_UNLCK)
>                         locks_lock_file_wait(file, fl);
>                 return -EIO;
>         }
> -       if (IS_GETLK(cmd))
> +       if (cmd =3D=3D F_CANCELLK)
> +               return dlm_posix_cancel(ls->ls_dlm, ip->i_no_addr, file, =
fl);
> +       else if (IS_GETLK(cmd))
>                 return dlm_posix_get(ls->ls_dlm, ip->i_no_addr, file, fl)=
;
>         else if (fl->fl_type =3D=3D F_UNLCK)
>                 return dlm_posix_unlock(ls->ls_dlm, ip->i_no_addr, file, =
fl);
> diff --git a/fs/ocfs2/stack_user.c b/fs/ocfs2/stack_user.c
> index 05d4414d0c33..9b76ee66aeb2 100644
> --- a/fs/ocfs2/stack_user.c
> +++ b/fs/ocfs2/stack_user.c
> @@ -738,18 +738,11 @@ static int user_plock(struct ocfs2_cluster_connecti=
on *conn,
>          *
>          * Internally, fs/dlm will pass these to a misc device, which
>          * a userspace daemon will read and write to.
> -        *
> -        * For now, cancel requests (which happen internally only),
> -        * are turned into unlocks. Most of this function taken from
> -        * gfs2_lock.
>          */
>
> -       if (cmd =3D=3D F_CANCELLK) {
> -               cmd =3D F_SETLK;
> -               fl->fl_type =3D F_UNLCK;
> -       }
> -
> -       if (IS_GETLK(cmd))
> +       if (cmd =3D=3D F_CANCELLK)
> +               return dlm_posix_cancel(conn->cc_lockspace, ino, file, fl=
);
> +       else if (IS_GETLK(cmd))
>                 return dlm_posix_get(conn->cc_lockspace, ino, file, fl);
>         else if (fl->fl_type =3D=3D F_UNLCK)
>                 return dlm_posix_unlock(conn->cc_lockspace, ino, file, fl=
);
> diff --git a/include/linux/dlm_plock.h b/include/linux/dlm_plock.h
> index e6d76e8715a6..15fc856d198c 100644
> --- a/include/linux/dlm_plock.h
> +++ b/include/linux/dlm_plock.h
> @@ -11,6 +11,8 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 numb=
er, struct file *file,
>                 int cmd, struct file_lock *fl);
>  int dlm_posix_unlock(dlm_lockspace_t *lockspace, u64 number, struct file=
 *file,
>                 struct file_lock *fl);
> +int dlm_posix_cancel(dlm_lockspace_t *lockspace, u64 number, struct file=
 *file,
> +                    struct file_lock *fl);
>  int dlm_posix_get(dlm_lockspace_t *lockspace, u64 number, struct file *f=
ile,
>                 struct file_lock *fl);
>  #endif
> --
> 2.31.1
>

