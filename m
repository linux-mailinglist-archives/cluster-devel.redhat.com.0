Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFF277823B
	for <lists+cluster-devel@lfdr.de>; Thu, 10 Aug 2023 22:38:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691699903;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dIni07KyJce7xxuw2QLVT5cpv2HHxiYwf+IdLolCCXY=;
	b=EjyifW3nVrFa6yfVmDfuI2SRQ7jAk46goqNpzFRilg3gaP6NXdynPIwELTuwjaf0Y2rkWK
	IhoNSu7t3j1BKPTXypcb4K2mhkTA9JsEHEz/dxm//Hpfdiovr1Pz3xTDspu2qs9nJrxK+s
	+zM+p+XL7FLjlPsNtE86mtk7g87a9Mc=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-o6EElvJuPruIZSQhMryIqA-1; Thu, 10 Aug 2023 16:38:21 -0400
X-MC-Unique: o6EElvJuPruIZSQhMryIqA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51B53380350D;
	Thu, 10 Aug 2023 20:38:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DD9F40C2079;
	Thu, 10 Aug 2023 20:38:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DAA1A1946595;
	Thu, 10 Aug 2023 20:38:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 825D81946588 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 10 Aug 2023 20:38:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 356E7401E6A; Thu, 10 Aug 2023 20:38:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D208492C13
 for <cluster-devel@redhat.com>; Thu, 10 Aug 2023 20:38:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E4CC38035B6
 for <cluster-devel@redhat.com>; Thu, 10 Aug 2023 20:38:02 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-3ClTKRYXPpKBjIUuWzD1Mg-1; Thu, 10 Aug 2023 16:38:00 -0400
X-MC-Unique: 3ClTKRYXPpKBjIUuWzD1Mg-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-51bef8bb689so3439814a12.1
 for <cluster-devel@redhat.com>; Thu, 10 Aug 2023 13:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691699879; x=1692304679;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dIni07KyJce7xxuw2QLVT5cpv2HHxiYwf+IdLolCCXY=;
 b=Rd2hii2Kt+Y6b3SHk84zVJugh5dTkFOYiqhCjBtVJL5rEtvYVY2P1lyXvv+ci6qDZs
 id9n/yBhQBjNDTATaFSaYMR2wvPicHRQ+itvL5HzCyYfMD7amS8X6PM/7ch6BWZHdEfv
 zroljc/XYPCQJFQCVUN9MGeApN4HCtxfuA4LVtU0WNtBb8B05F1DrUpDjD4e/PJjpF5s
 wTdSbjZzakK7xtVrmorlbYu2LRbjXFhrX2sQ07uyqC7MeC9cwZTubNnhaHjjgUZBfSV4
 exsCAgMsmNQ74GZQuXbSsM1VHry8VLSuzWGm1kKMGRSInPU3QJiiurvh80hlb/JRyInP
 Pfvg==
X-Gm-Message-State: AOJu0YwdwMW+GqufklvEQyQDTyGafAbPhQqkFg+xSWcHrJzEttfZjTr7
 WX2zcfgFAzILiotnJDdZKIk/2+400QU9KOffmjZhyuScht3pVlzkup9UFjpPhT+//1z7t23aaRQ
 Jl3owBr61826xMMfljRB7NuG4P2tpo7L3tJRQIA==
X-Received: by 2002:a05:6402:2793:b0:51f:ef58:da87 with SMTP id
 b19-20020a056402279300b0051fef58da87mr3780709ede.2.1691699879345; 
 Thu, 10 Aug 2023 13:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtyfF/rZBCKNCFMZqumNdBbqxsmDl7zLHcIbu3ah5OjXYkk27PzRjmI6/9s/gxl4lkuZpq+rLAuxBfb7ABrHE=
X-Received: by 2002:a05:6402:2793:b0:51f:ef58:da87 with SMTP id
 b19-20020a056402279300b0051fef58da87mr3780687ede.2.1691699879039; Thu, 10 Aug
 2023 13:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230720125806.1385279-1-aahringo@redhat.com>
 <20230720125806.1385279-2-aahringo@redhat.com>
 <af8586c743be551c3f939455368fc288856abe11.camel@kernel.org>
In-Reply-To: <af8586c743be551c3f939455368fc288856abe11.camel@kernel.org>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 10 Aug 2023 16:37:47 -0400
Message-ID: <CAK-6q+gH0Rd36peoGTnGyggFq+oUVh_z+uUdKKE3=CZ9MWkYnQ@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [RFC v6.5-rc2 2/3] fs: lockd: fix race in async
 lock request handling
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
Cc: cluster-devel@redhat.com, linux-nfs@vger.kernel.org, neilb@suse.de,
 Dai.Ngo@oracle.com, tom@talpey.com, kolga@netapp.com, chuck.lever@oracle.com,
 anna@kernel.org, trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 21, 2023 at 11:45=E2=80=AFAM Jeff Layton <jlayton@kernel.org> w=
rote:
>
> On Thu, 2023-07-20 at 08:58 -0400, Alexander Aring wrote:
> > This patch fixes a race in async lock request handling between adding
> > the relevant struct nlm_block to nlm_blocked list after the request was
> > sent by vfs_lock_file() and nlmsvc_grant_deferred() does a lookup of th=
e
> > nlm_block in the nlm_blocked list. It could be that the async request i=
s
> > completed before the nlm_block was added to the list. This would end
> > in a -ENOENT and a kernel log message of "lockd: grant for unknown
> > block".
> >
> > To solve this issue we add the nlm_block before the vfs_lock_file() cal=
l
> > to be sure it has been added when a possible nlmsvc_grant_deferred() is
> > called. If the vfs_lock_file() results in an case when it wouldn't be
> > added to nlm_blocked list, the nlm_block struct will be removed from
> > this list again.
> >
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > ---
> >  fs/lockd/svclock.c          | 80 +++++++++++++++++++++++++++----------
> >  include/linux/lockd/lockd.h |  1 +
> >  2 files changed, 60 insertions(+), 21 deletions(-)
> >
> > diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> > index 28abec5c451d..62ef27a69a9e 100644
> > --- a/fs/lockd/svclock.c
> > +++ b/fs/lockd/svclock.c
> > @@ -297,6 +297,8 @@ static void nlmsvc_free_block(struct kref *kref)
> >
> >       dprintk("lockd: freeing block %p...\n", block);
> >
> > +     WARN_ON_ONCE(block->b_flags & B_PENDING_CALLBACK);
> > +
> >       /* Remove block from file's list of blocks */
> >       list_del_init(&block->b_flist);
> >       mutex_unlock(&file->f_mutex);
> > @@ -543,6 +545,12 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_fil=
e *file,
> >               goto out;
> >       }
> >
> > +     if (block->b_flags & B_PENDING_CALLBACK)
> > +             goto pending_request;
> > +
> > +     /* Append to list of blocked */
> > +     nlmsvc_insert_block(block, NLM_NEVER);
> > +
> >       if (!wait)
> >               lock->fl.fl_flags &=3D ~FL_SLEEP;
> >       mode =3D lock_to_openmode(&lock->fl);
> > @@ -552,9 +560,13 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_fil=
e *file,
> >       dprintk("lockd: vfs_lock_file returned %d\n", error);
> >       switch (error) {
> >               case 0:
> > +                     nlmsvc_remove_block(block);
> >                       ret =3D nlm_granted;
> >                       goto out;
> >               case -EAGAIN:
> > +                     if (!wait)
> > +                             nlmsvc_remove_block(block);
> > +pending_request:
> >                       /*
> >                        * If this is a blocking request for an
> >                        * already pending lock request then we need
> > @@ -565,6 +577,8 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file=
 *file,
> >                       ret =3D async_block ? nlm_lck_blocked : nlm_lck_d=
enied;
> >                       goto out;
> >               case FILE_LOCK_DEFERRED:
> > +                     block->b_flags |=3D B_PENDING_CALLBACK;
> > +
> >                       if (wait)
> >                               break;
> >                       /* Filesystem lock operation is in progress
> > @@ -572,17 +586,16 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_fi=
le *file,
> >                       ret =3D nlmsvc_defer_lock_rqst(rqstp, block);
>
> When the above function is called, it's going to end up reinserting the
> block into the list. I think you probably also need to remove the call
> to nlmsvc_insert_block from nlmsvc_defer_lock_rqst since it could have
> been granted before that occurs.
>

it cannot be granted during this time because the f_mutex is held. We
insert it in the first place to have a way to get the block lookup
working when a lm_grant() is really fast. Then lm_grant() will lookup
the lock and have a way to get f_mutex to hold it. Then lm_grant()
will only run when nobody is in this critical area (on a per nlm_file
basis).

There is a difference in the call between NLM_NEVER and NLM_TIMEOUT in
nlmsvc_defer_lock_rqst(), when nlmsvc_defer_lock_rqst() it will just
update the timeout value. I am not sure about the consequences when it
does a nlmsvc_insert_block() with NLM_NEVER instead of NLM_TIMEOUT.
But as I said it should not be possible to grant the block when
f_mutex is held.

> >                       goto out;
> >               case -EDEADLK:
> > +                     nlmsvc_remove_block(block);
> >                       ret =3D nlm_deadlock;
> >                       goto out;
> >               default:                        /* includes ENOLCK */
> > +                     nlmsvc_remove_block(block);
> >                       ret =3D nlm_lck_denied_nolocks;
> >                       goto out;
> >       }
> >
> >       ret =3D nlm_lck_blocked;
> > -
> > -     /* Append to list of blocked */
> > -     nlmsvc_insert_block(block, NLM_NEVER);
> >  out:
> >       mutex_unlock(&file->f_mutex);
> >       nlmsvc_release_block(block);
> > @@ -739,34 +752,59 @@ nlmsvc_update_deferred_block(struct nlm_block *bl=
ock, int result)
> >               block->b_flags |=3D B_TIMED_OUT;
> >  }
> >
> > +static int __nlmsvc_grant_deferred(struct nlm_block *block,
> > +                                struct file_lock *fl,
> > +                                int result)
> > +{
> > +     int rc =3D 0;
> > +
> > +     dprintk("lockd: nlmsvc_notify_blocked block %p flags %d\n",
> > +                                     block, block->b_flags);
> > +     if (block->b_flags & B_QUEUED) {
> > +             if (block->b_flags & B_TIMED_OUT) {
> > +                     rc =3D -ENOLCK;
> > +                     goto out;
> > +             }
> > +             nlmsvc_update_deferred_block(block, result);
> > +     } else if (result =3D=3D 0)
> > +             block->b_granted =3D 1;
> > +
> > +     nlmsvc_insert_block_locked(block, 0);
> > +     svc_wake_up(block->b_daemon);
> > +out:
> > +     return rc;
> > +}
> > +
> >  static int nlmsvc_grant_deferred(struct file_lock *fl, int result)
> >  {
> > -     struct nlm_block *block;
> > -     int rc =3D -ENOENT;
> > +     struct nlm_block *block =3D NULL;
> > +     int rc;
> >
> >       spin_lock(&nlm_blocked_lock);
> >       list_for_each_entry(block, &nlm_blocked, b_list) {
> >               if (nlm_compare_locks(&block->b_call->a_args.lock.fl, fl)=
) {
> > -                     dprintk("lockd: nlmsvc_notify_blocked block %p fl=
ags %d\n",
> > -                                                     block, block->b_f=
lags);
> > -                     if (block->b_flags & B_QUEUED) {
> > -                             if (block->b_flags & B_TIMED_OUT) {
> > -                                     rc =3D -ENOLCK;
> > -                                     break;
> > -                             }
> > -                             nlmsvc_update_deferred_block(block, resul=
t);
> > -                     } else if (result =3D=3D 0)
> > -                             block->b_granted =3D 1;
> > -
> > -                     nlmsvc_insert_block_locked(block, 0);
> > -                     svc_wake_up(block->b_daemon);
> > -                     rc =3D 0;
> > +                     kref_get(&block->b_count);
> >                       break;
> >               }
> >       }
> >       spin_unlock(&nlm_blocked_lock);
> > -     if (rc =3D=3D -ENOENT)
> > -             printk(KERN_WARNING "lockd: grant for unknown block\n");
> > +
> > +     if (!block) {
> > +             pr_warn("lockd: grant for unknown pending block\n");
> > +             return -ENOENT;
> > +     }
> > +
> > +     /* don't interfere with nlmsvc_lock() */
> > +     mutex_lock(&block->b_file->f_mutex);
>
>
> This is called from lm_grant, and Documentation/filesystems/locking.rst
> says that lm_grant is not allowed to block. The only caller though is
> dlm_plock_callback, and I don't see anything that would prevent
> blocking.
>
> Do we need to fix the documentation there?
>

You are right and I think it should not call any sleepable API.
However DLM is the only one upstream user and I have no other idea how
to make the current situation better.

We should update the documentation but be open to make it
non-sleepable in future?

>
> > +     block->b_flags &=3D ~B_PENDING_CALLBACK;
> > +
>
> You're adding this new flag when the lock is deferred and then clearing
> it when the lock is granted. What about when the lock request is
> cancelled (e.g. by signal)? It seems like you also need to clear it then
> too, correct?
>

correct. I add code to clear it when the block is getting removed from
nlm_blocked in nlmsvc_remove_block().

> > +     spin_lock(&nlm_blocked_lock);
> > +     WARN_ON_ONCE(list_empty(&block->b_list));
> > +     rc =3D __nlmsvc_grant_deferred(block, fl, result);
> > +     spin_unlock(&nlm_blocked_lock);
> > +     mutex_unlock(&block->b_file->f_mutex);
> > +
> > +     nlmsvc_release_block(block);
> >       return rc;
> >  }
> >
> > diff --git a/include/linux/lockd/lockd.h b/include/linux/lockd/lockd.h
> > index f42594a9efe0..a977be8bcc2c 100644
> > --- a/include/linux/lockd/lockd.h
> > +++ b/include/linux/lockd/lockd.h
> > @@ -189,6 +189,7 @@ struct nlm_block {
> >  #define B_QUEUED             1       /* lock queued */
> >  #define B_GOT_CALLBACK               2       /* got lock or conflictin=
g lock */
> >  #define B_TIMED_OUT          4       /* filesystem too slow to respond=
 */
> > +#define B_PENDING_CALLBACK   8       /* pending callback for lock requ=
est */
> >  };
> >
> >  /*
>
> --
> Jeff Layton <jlayton@kernel.org>
>

