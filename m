Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C74C77827B
	for <lists+cluster-devel@lfdr.de>; Thu, 10 Aug 2023 23:01:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691701274;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OPfzR5oh7RHGXQHB7rxXi5hSEsWl0cGVSEeqGFCdSFg=;
	b=U2YtE7EJeM/3vX4l2brUJRQwFGZHDGlgZ2bFs86vdETJlhOCkhy0//yq5mqRcgqg4jA6ul
	ZqsEpaSOWM8JaIdPRiQJvMd/mcqmVu8oL51/hd52UMbAtg3eCFTXSFrPAtUpmjLwA39/Zs
	bmF6HuvylWA9h/X9rqiR4bN3Al8vmZE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-WywhJivcOoalvWpG99sKdA-1; Thu, 10 Aug 2023 17:01:06 -0400
X-MC-Unique: WywhJivcOoalvWpG99sKdA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96FEB101AA48;
	Thu, 10 Aug 2023 21:01:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 654072166B25;
	Thu, 10 Aug 2023 21:01:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 20E291946595;
	Thu, 10 Aug 2023 21:01:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1DBFA1946588 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 10 Aug 2023 21:01:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E016C2166B27; Thu, 10 Aug 2023 21:01:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D80BD2166B25
 for <cluster-devel@redhat.com>; Thu, 10 Aug 2023 21:01:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6E748DC661
 for <cluster-devel@redhat.com>; Thu, 10 Aug 2023 21:01:03 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-Etf2GZ1gMs2ZOi_ds9NJ-g-1; Thu, 10 Aug 2023 17:01:02 -0400
X-MC-Unique: Etf2GZ1gMs2ZOi_ds9NJ-g-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-52365337c29so923846a12.1
 for <cluster-devel@redhat.com>; Thu, 10 Aug 2023 14:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691701261; x=1692306061;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OPfzR5oh7RHGXQHB7rxXi5hSEsWl0cGVSEeqGFCdSFg=;
 b=WcgWvhUo9IzyRor+tQIXPM5JT5aH4/UsvN56j0hZJd+TQaEvRDyXHZCBSDoHKDF9oc
 rL9bk51yagz64PT6uGZ4JqsrRHkWDhIQ3ELOTQhEvjHrwPI1Ba6UyxwXqaov30i23Hqv
 Ue2Vw2XfNerjdX2qbjSO1FvNBHVq7UkR2uyOF3iMnRSvDfPg0U7GG2z5DA6nWDYnwAj1
 ZG+sT2Bx4k8w6CuCULhBF7/NmqMlhYut8q+H3ysHPtwtipFwY3ZcOJ7faTJdgzJSxanj
 dkoPyim6I88Pjqgmb3i2tdH1GdHMMgtwE3gDojevunbcSEN3oJ0enwK4VThmz/oNDGMT
 tCmg==
X-Gm-Message-State: AOJu0YyJyrUrWlIMPHlJvQUUiTOE8sycyUUx56TN+o7fW8H2/cc84mRL
 PT+mE8PD0ZBXtLm7fEEgEXvJocArZgklnP3KP0BzuToT1PFi7yPlJYHgJEKLK5D1pcA4AdCN84x
 viPhEl7sxgobxPEWTu6w5P8Gv7TNqVvQPgTFKIwA2+4dY8g==
X-Received: by 2002:aa7:d84f:0:b0:51e:5322:a642 with SMTP id
 f15-20020aa7d84f000000b0051e5322a642mr116440eds.27.1691701260981; 
 Thu, 10 Aug 2023 14:01:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7OKMjl8kLRMzVEGxjsaYW5xMayj13hMZQeSni3N6MzMEN29dWfRFa9FakIzxPD75hDfcG+yeM4I08TRciiZE=
X-Received: by 2002:aa7:d84f:0:b0:51e:5322:a642 with SMTP id
 f15-20020aa7d84f000000b0051e5322a642mr116416eds.27.1691701260704; Thu, 10 Aug
 2023 14:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230720125806.1385279-1-aahringo@redhat.com>
 <20230720125806.1385279-2-aahringo@redhat.com>
 <CAK-6q+gaX6v0aiaKB=STd_QWCyujX_bh-7uJ+Kfsu2GRVCCc6g@mail.gmail.com>
 <44d48d5a78159bcf8d52d3213ac6d684e148ebfd.camel@kernel.org>
In-Reply-To: <44d48d5a78159bcf8d52d3213ac6d684e148ebfd.camel@kernel.org>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 10 Aug 2023 17:00:49 -0400
Message-ID: <CAK-6q+gBnuQ9LkfM04SCtOkRsqjjQLseh+wZ5B_K4Sxmr2FQsw@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 21, 2023 at 12:43=E2=80=AFPM Jeff Layton <jlayton@kernel.org> w=
rote:
>
> On Fri, 2023-07-21 at 09:09 -0400, Alexander Aring wrote:
> > Hi,
> >
> > On Thu, Jul 20, 2023 at 8:58=E2=80=AFAM Alexander Aring <aahringo@redha=
t.com> wrote:
> > >
> > > This patch fixes a race in async lock request handling between adding
> > > the relevant struct nlm_block to nlm_blocked list after the request w=
as
> > > sent by vfs_lock_file() and nlmsvc_grant_deferred() does a lookup of =
the
> > > nlm_block in the nlm_blocked list. It could be that the async request=
 is
> > > completed before the nlm_block was added to the list. This would end
> > > in a -ENOENT and a kernel log message of "lockd: grant for unknown
> > > block".
> > >
> > > To solve this issue we add the nlm_block before the vfs_lock_file() c=
all
> > > to be sure it has been added when a possible nlmsvc_grant_deferred() =
is
> > > called. If the vfs_lock_file() results in an case when it wouldn't be
> > > added to nlm_blocked list, the nlm_block struct will be removed from
> > > this list again.
> > >
> > > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > > ---
> > >  fs/lockd/svclock.c          | 80 +++++++++++++++++++++++++++--------=
--
> > >  include/linux/lockd/lockd.h |  1 +
> > >  2 files changed, 60 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> > > index 28abec5c451d..62ef27a69a9e 100644
> > > --- a/fs/lockd/svclock.c
> > > +++ b/fs/lockd/svclock.c
> > > @@ -297,6 +297,8 @@ static void nlmsvc_free_block(struct kref *kref)
> > >
> > >         dprintk("lockd: freeing block %p...\n", block);
> > >
> > > +       WARN_ON_ONCE(block->b_flags & B_PENDING_CALLBACK);
> > > +
> > >         /* Remove block from file's list of blocks */
> > >         list_del_init(&block->b_flist);
> > >         mutex_unlock(&file->f_mutex);
> > > @@ -543,6 +545,12 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_f=
ile *file,
> > >                 goto out;
> > >         }
> > >
> > > +       if (block->b_flags & B_PENDING_CALLBACK)
> > > +               goto pending_request;
> > > +
> > > +       /* Append to list of blocked */
> > > +       nlmsvc_insert_block(block, NLM_NEVER);
> > > +
> > >         if (!wait)
> > >                 lock->fl.fl_flags &=3D ~FL_SLEEP;
> > >         mode =3D lock_to_openmode(&lock->fl);
> > > @@ -552,9 +560,13 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_f=
ile *file,
> > >         dprintk("lockd: vfs_lock_file returned %d\n", error);
> > >         switch (error) {
> > >                 case 0:
> > > +                       nlmsvc_remove_block(block);
> >
> > reacting here with nlmsvc_remove_block() assumes that the block was
> > not being added to the nlm_blocked list before nlmsvc_insert_block()
> > was called. I am not sure if this is always the case here.
> >
> > Does somebody see a problem with that?
> >
>
> The scenario is: we have a block on the list already and now another
> lock request comes in for the same thing: the client decided to just re-
> poll for the lock. That's a plausible scenario. I think the Linux NLM
> client will poll for locks periodically.
>
> In this case though, the lock request was granted by the filesystem, so
> this is likely racing with (and winning vs.) a lm_grant callback. Given
> that the client decided to repoll for it, we're probably safe to just
> dequeue the block and respond here, and not worry about sending a grant
> callback.
>
> Ditto for the other cases where the block is removed.
>

ok.

> > >                         ret =3D nlm_granted;
> > >                         goto out;
> > >                 case -EAGAIN:
> > > +                       if (!wait)
> > > +                               nlmsvc_remove_block(block);
>
> I was thinking that it would be best to not insert a block at all in the
> !wait case, but it looks like DLM just returns DEFERRED and almost
> always does a callback, even when it's not a blocking lock request?
>
> Anyway, I think we probably do have to handle this like you are.
>

I would prefer to have !wait blocked. We even don't do that in DLM, it
causes problems with cancellation as a cancellation will only do
something (at least in DLM) when there is a waiter that the lock
request waits to be granted, which is only being the case for wait
lock requests.

A !wait is only a trylock, the answer should be back being mostly
immediate and it also makes no sense for me to make them async,
because we have the same problems with cancellation/unlock which are
not being offered to be handled in an asynchronous way. As I said, the
answer should be back mostly immediately. We are somehow doing this
optimization for !wait lock requests only, but operations like unlock
are also being called by lockd and are not being handled
asynchronously. That means we probably don't care about this
optimization, it looks different on wait lock requests.

We should update the documentation and only do async lock requests on
wait only. Is this okay?

- Alex

