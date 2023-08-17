Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 815B977FDFC
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Aug 2023 20:39:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692297561;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Kd4TYVvwU1aUt0kyKry2n2j6BSVfouTESoEkR9Nhxgo=;
	b=Pzs3+aAm5LnwWnK2Wi4RNmk31DjOu1KF3HSvnHUWXacrcrGMk05376hvZoX646cOnYylxS
	I/wRSctb44+9Xwszt7wchWAwPqJuWmtjypasnyyX7oBTrZvaWhwihZ233iXJTSHLwB9U/0
	ywC1upNcC+dlhLe7OCro45Ta0NDBVDI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-lnbcL4bSMqemq39lvlqCrA-1; Thu, 17 Aug 2023 14:39:18 -0400
X-MC-Unique: lnbcL4bSMqemq39lvlqCrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39A848DC660;
	Thu, 17 Aug 2023 18:39:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E3631121314;
	Thu, 17 Aug 2023 18:39:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CB7B9194658C;
	Thu, 17 Aug 2023 18:39:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9F1F01946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Aug 2023 18:39:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 885B940C6E8A; Thu, 17 Aug 2023 18:39:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 817C440C6F4E
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 18:39:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 635343811812
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 18:39:15 +0000 (UTC)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-F08PEc5QOAKGxj7wGTR-Aw-1; Thu, 17 Aug 2023 14:39:13 -0400
X-MC-Unique: F08PEc5QOAKGxj7wGTR-Aw-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4fe4a1ce065so12070e87.3
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 11:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692297552; x=1692902352;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kd4TYVvwU1aUt0kyKry2n2j6BSVfouTESoEkR9Nhxgo=;
 b=eSC/YetC9bMfR0GwMFvTC4sfR21r33Hq5OwAx9VG6Haf9lUO95feJSjTlv1EaMzLaR
 Fg9ORXDlHvHKbxTOUjyHZZ8s8tvrvNURWugQUMCZKcR7eqSAK0yOzuWpF7XaHEkAUIvj
 Ac8GcvOOIRtNSxvFoqcHzP8kAbnSidICoJq1iLJUCHzPpLBlqY8rm2G9aGNpbskWu1ul
 baLRzAGfhfNxC3KNJK3fUO6+yGMHuX61WqRMbq4vBNOSHwScGbdokVlFJYUlzdrYT86+
 ZDYFU9v5fWxQr0TSbb/NU2TLLzxn2yiYrQhetXXgmTOs+/5Z4X6KcLE+5Yutm1DkFE+L
 qn9Q==
X-Gm-Message-State: AOJu0YyTBQ53tWyDMnawtZ02aq3ZLxkiTegcAnR6UN/l3yvR/oxd9xIE
 DunIDJOzLeynws9Lf9a4UdxYoMVzLytFP+1Mcqg5lPWJp3FAg7Y7g4RTc4KTfpeHkBoQa4YgXjL
 2znskQh8rIPWY/FPKglzbDiqIpuA4BKWQWU7nkw==
X-Received: by 2002:a19:4359:0:b0:4f8:d385:41bd with SMTP id
 m25-20020a194359000000b004f8d38541bdmr110685lfj.8.1692297552325; 
 Thu, 17 Aug 2023 11:39:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJHRFT1siW8UZCQGrmU6uj/U7AnLGRKgBpAukshZ1dxmC1RXgn+gE5RQG2Zb/ahcVSaEaUTXYhxNQeTDbt5jg=
X-Received: by 2002:a19:4359:0:b0:4f8:d385:41bd with SMTP id
 m25-20020a194359000000b004f8d38541bdmr110668lfj.8.1692297551910; Thu, 17 Aug
 2023 11:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230814211116.3224759-1-aahringo@redhat.com>
 <20230814211116.3224759-2-aahringo@redhat.com>
 <c049f33344990f74c2b88cc3279a913f6ff6f498.camel@kernel.org>
 <350395c8906f46ec4634392adb8a9e3927763ef1.camel@kernel.org>
In-Reply-To: <350395c8906f46ec4634392adb8a9e3927763ef1.camel@kernel.org>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 17 Aug 2023 14:39:00 -0400
Message-ID: <CAK-6q+iB9AWqbe-cJfHi=nRAsdxXQ_KjpZLd4Hsj1VEtj8CNHQ@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

On Tue, Aug 15, 2023 at 2:21=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Tue, 2023-08-15 at 13:49 -0400, Jeff Layton wrote:
> > On Mon, 2023-08-14 at 17:11 -0400, Alexander Aring wrote:
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
> > > The introducing of the new B_PENDING_CALLBACK nlm_block flag will han=
dle
> > > async lock requests on a pending lock requests as a retry on the call=
er
> > > level to hit the -EAGAIN case.
> > >
> > > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > > ---
> > >  fs/lockd/svclock.c          | 100 ++++++++++++++++++++++++++--------=
--
> > >  include/linux/lockd/lockd.h |   2 +
> > >  2 files changed, 74 insertions(+), 28 deletions(-)
> > >
> > >
>
> [...]
>
> > > diff --git a/include/linux/lockd/lockd.h b/include/linux/lockd/lockd.=
h
> > > index f42594a9efe0..91f55458f5fc 100644
> > > --- a/include/linux/lockd/lockd.h
> > > +++ b/include/linux/lockd/lockd.h
> > > @@ -185,10 +185,12 @@ struct nlm_block {
> > >     struct nlm_file *       b_file;         /* file in question */
> > >     struct cache_req *      b_cache_req;    /* deferred request handl=
ing */
> > >     struct cache_deferred_req * b_deferred_req
> > > +   struct mutex            b_cb_mutex;     /* callback mutex */
> >
> > There is no mention at all of this new mutex in the changelog or
> > comments. It's not at all clear to me what this is intended to protect.
> > In general, with lockd being a single-threaded service, we want to avoi=
d
> > sleeping locks. This will need some clear justification.
> >
> > At a glance, it looks like you're trying to use this to hold
> > B_PENDING_CALLBACK steady while a lock request is being handled. That
> > suggests that you're using this mutex to serialize access to a section
> > of code and not one or more specific data structures. We usually like t=
o
> > avoid that sort of thing, since locks that protect arbitrary sections o=
f
> > code become difficult to work with over time.
> >
> > I'm going to go out on a limb here though and suggest that there is
> > probably a way to solve this problem that doesn't involve adding new
> > locks.
> >
> > >     unsigned int            b_flags;        /* block flags */
> > >  #define B_QUEUED           1       /* lock queued */
> > >  #define B_GOT_CALLBACK             2       /* got lock or conflictin=
g lock */
> > >  #define B_TIMED_OUT                4       /* filesystem too slow to=
 respond */
> > > +#define B_PENDING_CALLBACK 8       /* pending callback for lock requ=
est */
> > >  };
> > >
> > >  /*
> >
> > Do we need this new flag at all? It seems redundant. If we have a block
> > on the list, then it is sort of by definition "pending callback". If
> > it's not on the list anymore, then it's not. No?
> >
>
> Do we need anything more than a patch along these lines? Note that this
> is untested, so RFC:
>
> ---------------------8<-----------------------
>
> [RFC PATCH] lockd: alternate fix for race between deferred lock and grant
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/lockd/svclock.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> index c43ccdf28ed9..e9a84363c26e 100644
> --- a/fs/lockd/svclock.c
> +++ b/fs/lockd/svclock.c
> @@ -446,6 +446,8 @@ nlmsvc_defer_lock_rqst(struct svc_rqst *rqstp, struct=
 nlm_block *block)
>
>         block->b_flags |=3D B_QUEUED;
>
> +       /* FIXME: remove and reinsert w/o dropping spinlock */
> +       nlmsvc_remove_block(block);
>         nlmsvc_insert_block(block, NLM_TIMEOUT);
>

a insert should just be okay, because there is an atomic switch if
it's already part of nlm_blocked and it will just update the timeout
of nlm_block in the list and it's order (because nlm_blocked is kind
of sorted according their timeouts in nlm_blocked).

>         block->b_cache_req =3D &rqstp->rq_chandle;
> @@ -535,6 +537,9 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *=
file,
>         if (!wait)
>                 lock->fl.fl_flags &=3D ~FL_SLEEP;
>         mode =3D lock_to_openmode(&lock->fl);
> +
> +       /* Append to list of blocked */
> +       nlmsvc_insert_block(block, NLM_NEVER);
>         error =3D vfs_lock_file(file->f_file[mode], F_SETLK, &lock->fl, N=
ULL);
>         lock->fl.fl_flags &=3D ~FL_SLEEP;
>
> @@ -542,6 +547,7 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *=
file,
>         switch (error) {
>                 case 0:
>                         ret =3D nlm_granted;
> +                       nlmsvc_remove_block(block);
>                         goto out;
>                 case -EAGAIN:
>                         /*
> @@ -552,6 +558,7 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *=
file,
>                         if (wait)
>                                 break;
>                         ret =3D async_block ? nlm_lck_blocked : nlm_lck_d=
enied;
> +                       nlmsvc_remove_block(block);
>                         goto out;
>                 case FILE_LOCK_DEFERRED:
>                         if (wait)
> @@ -570,8 +577,6 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *=
file,
>
>         ret =3D nlm_lck_blocked;
>
> -       /* Append to list of blocked */
> -       nlmsvc_insert_block(block, NLM_NEVER);

ok. I will try to start with that.

- Alex

