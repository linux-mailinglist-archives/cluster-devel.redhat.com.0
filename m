Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5A477FDF1
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Aug 2023 20:36:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692297404;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=11Z+nhrH4XFS60FFOphf14coFguhAqo9KWEOL7Km2pM=;
	b=QRmQKBRsng2xukubRnjt/9JEbQrnMwS34+JeL2Qe+T+QwkCPnJ4twdrhLIBzP0gK79wclo
	ihIUD2JE9TtQKrv94pP0sBXKdhrZvKhYQ/hVRHoNg8ccrTst+VySEdjgjba/J6slcxrng0
	59w2HozJY+W0o9KGyts4/4EW77nXAQk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-9eiWy_OmM_WHT11Rnntbig-1; Thu, 17 Aug 2023 14:36:41 -0400
X-MC-Unique: 9eiWy_OmM_WHT11Rnntbig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FC73800CA6;
	Thu, 17 Aug 2023 18:36:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E60FE1121314;
	Thu, 17 Aug 2023 18:36:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 91BA7194658C;
	Thu, 17 Aug 2023 18:36:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3D40B1946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Aug 2023 18:36:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EAF7A4A9004; Thu, 17 Aug 2023 18:36:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E39E6401E6A
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 18:36:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3DD429A9D2A
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 18:36:26 +0000 (UTC)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-jkNCKZyFNMqOC2sxv07OGQ-1; Thu, 17 Aug 2023 14:36:23 -0400
X-MC-Unique: jkNCKZyFNMqOC2sxv07OGQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2bba9a3d63fso942661fa.0
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 11:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692297381; x=1692902181;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=11Z+nhrH4XFS60FFOphf14coFguhAqo9KWEOL7Km2pM=;
 b=e3eBuoiIIVA/NUrExnlQjg3rXqzI4QMHsgwEM1+6psTG+9R4JdA0NPy2HaaU2C+a68
 geaLYJCZKiPmhe7Jz1mxHHVpOcObwi5D+Iul6DI7bf1QT1s33MXQJpcI5ty9gh19Y1k0
 ba8ae4rU98Yj/TAxktjT0591kekudn768fMrM2L1Nd3R1FQJIy7hWp03hXXNv502e1ei
 d5vuN/z0pxBCCnYsyKTwJ1VBQlmJ3V4vU1eYz2tmsEl0PWsYMl0pBiMMJhx954XjLtbv
 wLEKBh+/nAWofBNQmvqHJw8UImPKE+u9bQy3LJX0YWoIh1alM3zodUUtJuaWRbkdC9zU
 vmkg==
X-Gm-Message-State: AOJu0Yw6jYTdFNQtUUffIH88GeZG6sgFzR4fLyIyX0g/xz2yYXGkUVBj
 y5RxsBXlfUbEBxHqJnYgJPskXKu+bLAn8owOAPPePfhI5Ch7ntzC0PIRE1f40wAsG/2nNjr5CCu
 jn/TIueP6CX20gxe8ph8qbgIqVzjeUea4usefbw==
X-Received: by 2002:a05:6512:2017:b0:4fa:ad2d:6c58 with SMTP id
 a23-20020a056512201700b004faad2d6c58mr72712lfb.61.1692297381587; 
 Thu, 17 Aug 2023 11:36:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq0uUY8u7G5Wc2EHn/sDFjawHhsQUnDT8oKLLifpvDLiJL2fcSN4WhsG7+weBoLqhuIEr230Fghf+K6gpHySY=
X-Received: by 2002:a05:6512:2017:b0:4fa:ad2d:6c58 with SMTP id
 a23-20020a056512201700b004faad2d6c58mr72698lfb.61.1692297381218; Thu, 17 Aug
 2023 11:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230814211116.3224759-1-aahringo@redhat.com>
 <20230814211116.3224759-2-aahringo@redhat.com>
 <c049f33344990f74c2b88cc3279a913f6ff6f498.camel@kernel.org>
In-Reply-To: <c049f33344990f74c2b88cc3279a913f6ff6f498.camel@kernel.org>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 17 Aug 2023 14:36:09 -0400
Message-ID: <CAK-6q+g-GAw4U+q2oqeM1gAkaZ=V0yU23r8_pxKyyvPteKvs8Q@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [RFCv2 1/7] lockd: fix race in async lock
 request handling
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
Cc: linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 ocfs2-devel@lists.linux.dev, chuck.lever@oracle.com, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 15, 2023 at 1:49=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Mon, 2023-08-14 at 17:11 -0400, Alexander Aring wrote:
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
> > The introducing of the new B_PENDING_CALLBACK nlm_block flag will handl=
e
> > async lock requests on a pending lock requests as a retry on the caller
> > level to hit the -EAGAIN case.
> >
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > ---
> >  fs/lockd/svclock.c          | 100 ++++++++++++++++++++++++++----------
> >  include/linux/lockd/lockd.h |   2 +
> >  2 files changed, 74 insertions(+), 28 deletions(-)
> >
> > diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> > index c43ccdf28ed9..7d63524bdb81 100644
> > --- a/fs/lockd/svclock.c
> > +++ b/fs/lockd/svclock.c
> > @@ -133,6 +133,7 @@ nlmsvc_remove_block(struct nlm_block *block)
> >  {
> >       if (!list_empty(&block->b_list)) {
> >               spin_lock(&nlm_blocked_lock);
> > +             block->b_flags &=3D ~B_PENDING_CALLBACK;
> >               list_del_init(&block->b_list);
> >               spin_unlock(&nlm_blocked_lock);
> >               nlmsvc_release_block(block);
> > @@ -232,6 +233,7 @@ nlmsvc_create_block(struct svc_rqst *rqstp, struct =
nlm_host *host,
> >       kref_init(&block->b_count);
> >       INIT_LIST_HEAD(&block->b_list);
> >       INIT_LIST_HEAD(&block->b_flist);
> > +     mutex_init(&block->b_cb_mutex);
> >
> >       if (!nlmsvc_setgrantargs(call, lock))
> >               goto failed_free;
> > @@ -289,6 +291,8 @@ static void nlmsvc_free_block(struct kref *kref)
> >
> >       dprintk("lockd: freeing block %p...\n", block);
> >
> > +     WARN_ON_ONCE(block->b_flags & B_PENDING_CALLBACK);
> > +
> >       /* Remove block from file's list of blocks */
> >       list_del_init(&block->b_flist);
> >       mutex_unlock(&file->f_mutex);
> > @@ -532,6 +536,13 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_fil=
e *file,
> >               goto out;
> >       }
> >
> > +     mutex_lock(&block->b_cb_mutex);
> > +     if (block->b_flags & B_PENDING_CALLBACK)
> > +             goto pending_request;
> > +
> > +     /* Append to list of blocked */
> > +     nlmsvc_insert_block(block, NLM_NEVER);
> > +
> >       if (!wait)
> >               lock->fl.fl_flags &=3D ~FL_SLEEP;
> >       mode =3D lock_to_openmode(&lock->fl);
> > @@ -541,9 +552,13 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_fil=
e *file,
> >       dprintk("lockd: vfs_lock_file returned %d\n", error);
> >       switch (error) {
> >               case 0:
> > +                     nlmsvc_remove_block(block);
> >                       ret =3D nlm_granted;
> > -                     goto out;
> > +                     goto out_cb_mutex;
> >               case -EAGAIN:
> > +                     if (!wait)
> > +                             nlmsvc_remove_block(block);
> > +pending_request:
> >                       /*
> >                        * If this is a blocking request for an
> >                        * already pending lock request then we need
> > @@ -552,26 +567,29 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_fi=
le *file,
> >                       if (wait)
> >                               break;
> >                       ret =3D async_block ? nlm_lck_blocked : nlm_lck_d=
enied;
> > -                     goto out;
> > +                     goto out_cb_mutex;
> >               case FILE_LOCK_DEFERRED:
> > +                     block->b_flags |=3D B_PENDING_CALLBACK;
> > +
> >                       if (wait)
> >                               break;
> >                       /* Filesystem lock operation is in progress
> >                          Add it to the queue waiting for callback */
> >                       ret =3D nlmsvc_defer_lock_rqst(rqstp, block);
> > -                     goto out;
> > +                     goto out_cb_mutex;
> >               case -EDEADLK:
> > +                     nlmsvc_remove_block(block);
> >                       ret =3D nlm_deadlock;
> > -                     goto out;
> > +                     goto out_cb_mutex;
> >               default:                        /* includes ENOLCK */
> > +                     nlmsvc_remove_block(block);
> >                       ret =3D nlm_lck_denied_nolocks;
> > -                     goto out;
> > +                     goto out_cb_mutex;
> >       }
> >
> >       ret =3D nlm_lck_blocked;
> > -
> > -     /* Append to list of blocked */
> > -     nlmsvc_insert_block(block, NLM_NEVER);
> > +out_cb_mutex:
> > +     mutex_unlock(&block->b_cb_mutex);
> >  out:
> >       mutex_unlock(&file->f_mutex);
> >       nlmsvc_release_block(block);
> > @@ -728,34 +746,60 @@ nlmsvc_update_deferred_block(struct nlm_block *bl=
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
> > +     struct nlm_block *iter, *block =3D NULL;
> > +     int rc;
> >
> >       spin_lock(&nlm_blocked_lock);
> > -     list_for_each_entry(block, &nlm_blocked, b_list) {
> > -             if (nlm_compare_locks(&block->b_call->a_args.lock.fl, fl)=
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
> > +     list_for_each_entry(iter, &nlm_blocked, b_list) {
> > +             if (nlm_compare_locks(&iter->b_call->a_args.lock.fl, fl))=
 {
> > +                     kref_get(&iter->b_count);
> > +                     block =3D iter;
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
> > +     mutex_lock(&block->b_cb_mutex);
> > +     block->b_flags &=3D ~B_PENDING_CALLBACK;
> > +
> > +     spin_lock(&nlm_blocked_lock);
> > +     WARN_ON_ONCE(list_empty(&block->b_list));
> > +     rc =3D __nlmsvc_grant_deferred(block, fl, result);
> > +     spin_unlock(&nlm_blocked_lock);
> > +     mutex_unlock(&block->b_cb_mutex);
> > +
> > +     nlmsvc_release_block(block);
> >       return rc;
> >  }
> >
> > diff --git a/include/linux/lockd/lockd.h b/include/linux/lockd/lockd.h
> > index f42594a9efe0..91f55458f5fc 100644
> > --- a/include/linux/lockd/lockd.h
> > +++ b/include/linux/lockd/lockd.h
> > @@ -185,10 +185,12 @@ struct nlm_block {
> >       struct nlm_file *       b_file;         /* file in question */
> >       struct cache_req *      b_cache_req;    /* deferred request handl=
ing */
> >       struct cache_deferred_req * b_deferred_req
> > +     struct mutex            b_cb_mutex;     /* callback mutex */
>
> There is no mention at all of this new mutex in the changelog or
> comments. It's not at all clear to me what this is intended to protect.
> In general, with lockd being a single-threaded service, we want to avoid
> sleeping locks. This will need some clear justification.
>

The idea was to protect the PENDING flag and to wait until
nlmsvc_lock() is "mostly" done and then allowing lm_grant() callback
to proceed. Before the f_mutex was doing that, but since I made !wait
request (non-blocking requests) being handled synchronously there was
a deadlock because the callback can be run in an unknown order. It was
fixed by having a new mutex on a per nlm_block basis.

However I will remove those changes and try to find another way.


> At a glance, it looks like you're trying to use this to hold
> B_PENDING_CALLBACK steady while a lock request is being handled. That
> suggests that you're using this mutex to serialize access to a section
> of code and not one or more specific data structures. We usually like to
> avoid that sort of thing, since locks that protect arbitrary sections of
> code become difficult to work with over time.
>
> I'm going to go out on a limb here though and suggest that there is
> probably a way to solve this problem that doesn't involve adding new
> locks.
>

ok.

> >       unsigned int            b_flags;        /* block flags */
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
> Do we need this new flag at all? It seems redundant. If we have a block
> on the list, then it is sort of by definition "pending callback". If
> it's not on the list anymore, then it's not. No?
>

I will try to find another way. A pending callback is more a check on
if it's a wait request (blocking request) and is it on the list or
not.

This flag was also there to avoid multiple wait requests while a wait
request is pending. I ran into this case and the DLM implementation
was never able to handle it. I can return -EAGAIN but DLM lock() needs
to keep track of those things, I prefer to handle this situation in
the upper layer.

I am not sure why lockd do multiple wait requests for the same
nlm_block when it's pending and waiting for lm_grant() callback. I
will split this handling out of this patch as it is something what
doesn't belong to the race fix between request and lm_grant()
callback.

- Alex

