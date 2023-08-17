Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0AD77F73F
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Aug 2023 15:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692277363;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CmwH07w5fyy3pvNX0bl7s81W4p0ZB0NuiFuXPpkj2yY=;
	b=gzvHdlM/iUBXnW7I8Ma9nSiYJKpEF6ecgrhwXrCtTkSlay65jZR/fBrJTSU7WpLqBVQaDc
	jYSDQvRTy+CZB/w1sPejeLckpUpr/gk9ncv3eTiXohmf4699jnxkwcwi4nfbKTJBCdUmRM
	+jcHbWm7WBx31qH4c84f2FPRLB9GJtw=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-8C7ji76HPPC37Od8jUAQkQ-1; Thu, 17 Aug 2023 09:02:39 -0400
X-MC-Unique: 8C7ji76HPPC37Od8jUAQkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6220A29AA3AC;
	Thu, 17 Aug 2023 13:02:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D0D840C207A;
	Thu, 17 Aug 2023 13:02:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D5830194658D;
	Thu, 17 Aug 2023 13:02:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EF2581946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Aug 2023 13:02:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 221BD40C6E8A; Thu, 17 Aug 2023 13:02:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B3CD40C125C
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 13:02:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3FDE185A7AB
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 13:02:21 +0000 (UTC)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-TkVAYdyhMu6EehR8R3wCuw-1; Thu, 17 Aug 2023 09:02:20 -0400
X-MC-Unique: TkVAYdyhMu6EehR8R3wCuw-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4ff9b3ead6fso732074e87.2
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 06:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692277339; x=1692882139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CmwH07w5fyy3pvNX0bl7s81W4p0ZB0NuiFuXPpkj2yY=;
 b=U+eMMLfPPe9qNX1OezITnHYf9vZ4gwkgzeigKnyoHuB08yYQ6bQDb14uOFMgjWKR25
 eXoSxxv7ElSR7NBf0sNozo997ZAMNFJ+YhnZ6OU8sGfBzQZE+ucBussR+cIiqdPJs6pc
 VfONTOBx2hsyrytM0d9gMM5wvlYjJgkbVdf0Iarp+j93rHgpMNy0zIoDYdQR1NRMR8cH
 UVOd1gbJcWCDuaMlgyfIJ3ETQ5EZMTlhUnWflNHSlT6TxVSPYz6I5dWFTSJQDPiKBviJ
 xzkVB5ftxJVu9tMAbAqihYe4SvrtLZm34Ff+OPiz9WnsAiJlMvIdo15PRZDESUS6P0T+
 +l/g==
X-Gm-Message-State: AOJu0YwbXZ+RnJbSv4cLvDoZOe8yZJQ0FQ9t+uZPqZ9bDTld3XsjIDPT
 mVPERWub09SxFpHpJs2nuzCDXsOdbDE6qseSF2qj/6GHfdn8fhG4tlUvaI1xK6kkUV/NYxlF4Aj
 46AkGX5Wg2HFDr17lfOQ3CCwUNdlB0M6lcTP05g==
X-Received: by 2002:a05:6512:2149:b0:4fc:3756:754e with SMTP id
 s9-20020a056512214900b004fc3756754emr3620823lfr.56.1692277339113; 
 Thu, 17 Aug 2023 06:02:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF/W240XLQ+e6Phb4JU0Im3xg6glWU3oArtomKJAuH6Nr56XJ4O+HytbRYxjpPEyRvYX5BslhfhJT54YxNc5Y=
X-Received: by 2002:a05:6512:2149:b0:4fc:3756:754e with SMTP id
 s9-20020a056512214900b004fc3756754emr3620800lfr.56.1692277338728; Thu, 17 Aug
 2023 06:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230814211116.3224759-1-aahringo@redhat.com>
 <20230814211116.3224759-7-aahringo@redhat.com>
 <bd76489a6b0d2f56f4a68d48b3736fcaf5b5119b.camel@kernel.org>
 <CAK-6q+i3oKN3M_kdoQ99hMnzSZyRH1sPdxZ0MQMwp+vSixUhwg@mail.gmail.com>
 <bb8806020ade39f6db9d209b0a4a34dc4d69bdb8.camel@kernel.org>
In-Reply-To: <bb8806020ade39f6db9d209b0a4a34dc4d69bdb8.camel@kernel.org>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 17 Aug 2023 09:02:06 -0400
Message-ID: <CAK-6q+jNceDDJwJK6as6TKvaRoFaxmuWao=gnbLGjTiwHbywXA@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [RFCv2 6/7] dlm: use FL_SLEEP to check if
 blocking request
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 17, 2023 at 7:27=E2=80=AFAM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Wed, 2023-08-16 at 21:19 -0400, Alexander Aring wrote:
> > Hi,
> >
> > On Wed, Aug 16, 2023 at 9:07=E2=80=AFAM Jeff Layton <jlayton@kernel.org=
> wrote:
> > >
> > > On Mon, 2023-08-14 at 17:11 -0400, Alexander Aring wrote:
> > > > This patch uses the FL_SLEEP flag in struct file_lock to check if i=
t's a
> > > > blocking request in case if the request coming from nfs lockd proce=
ss
> > > > indicated by lm_grant() is set.
> > > >
> > > > IF FL_SLEEP is set a asynchronous blocking request is being made an=
d
> > > > it's waiting for lm_grant() callback being called to signal the loc=
k was
> > > > granted. If it's not set a synchronous non-blocking request is bein=
g made.
> > > >
> > > > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > > > ---
> > > >  fs/dlm/plock.c | 38 ++++++++++++++++++++++----------------
> > > >  1 file changed, 22 insertions(+), 16 deletions(-)
> > > >
> > > > diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> > > > index 0094fa4004cc..524771002a2f 100644
> > > > --- a/fs/dlm/plock.c
> > > > +++ b/fs/dlm/plock.c
> > > > @@ -140,7 +140,6 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, =
u64 number, struct file *file,
> > > >       op->info.optype         =3D DLM_PLOCK_OP_LOCK;
> > > >       op->info.pid            =3D fl->fl_pid;
> > > >       op->info.ex             =3D (fl->fl_type =3D=3D F_WRLCK);
> > > > -     op->info.wait           =3D IS_SETLKW(cmd);
> > > >       op->info.fsid           =3D ls->ls_global_id;
> > > >       op->info.number         =3D number;
> > > >       op->info.start          =3D fl->fl_start;
> > > > @@ -148,24 +147,31 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace=
, u64 number, struct file *file,
> > > >       op->info.owner =3D (__u64)(long)fl->fl_owner;
> > > >       /* async handling */
> > > >       if (fl->fl_lmops && fl->fl_lmops->lm_grant) {
> > > > -             op_data =3D kzalloc(sizeof(*op_data), GFP_NOFS);
> > > > -             if (!op_data) {
> > > > -                     dlm_release_plock_op(op);
> > > > -                     rv =3D -ENOMEM;
> > > > -                     goto out;
> > > > -             }
> > > > +             if (fl->fl_flags & FL_SLEEP) {
> > > > +                     op_data =3D kzalloc(sizeof(*op_data), GFP_NOF=
S);
> > > > +                     if (!op_data) {
> > > > +                             dlm_release_plock_op(op);
> > > > +                             rv =3D -ENOMEM;
> > > > +                             goto out;
> > > > +                     }
> > > >
> > > > -             op_data->callback =3D fl->fl_lmops->lm_grant;
> > > > -             locks_init_lock(&op_data->flc);
> > > > -             locks_copy_lock(&op_data->flc, fl);
> > > > -             op_data->fl             =3D fl;
> > > > -             op_data->file   =3D file;
> > > > +                     op->info.wait =3D 1;
> > > > +                     op_data->callback =3D fl->fl_lmops->lm_grant;
> > > > +                     locks_init_lock(&op_data->flc);
> > > > +                     locks_copy_lock(&op_data->flc, fl);
> > > > +                     op_data->fl             =3D fl;
> > > > +                     op_data->file   =3D file;
> > > >
> > > > -             op->data =3D op_data;
> > > > +                     op->data =3D op_data;
> > > >
> > > > -             send_op(op);
> > > > -             rv =3D FILE_LOCK_DEFERRED;
> > > > -             goto out;
> > > > +                     send_op(op);
> > > > +                     rv =3D FILE_LOCK_DEFERRED;
> > > > +                     goto out;
> > >
> > > A question...we're returning FILE_LOCK_DEFERRED after the DLM request=
 is
> > > sent. If it ends up being blocked, what happens? Does it do a lm_gran=
t
> > > downcall with -EAGAIN or something as the result?
> > >
> >
> > no, when info->wait is set then it is a blocked lock request, which
> > means lm_grant() will be called when the lock request is granted.
> >
>
> Ok, that's probably problematic with the current code too. lockd will
> time out the block after 7s, so if the lock isn't granted in that time
> it'll give up on it.
>

that's why blocked lock requests (meaning F_SETLKW, FL_SLEEP is set)
need to use NLM_NEVER? It will never give up on it.

I thought NLM_TIMEOUT is just the polling frequency for doing a
blocked request by doing non-blocking requests. Means trylocks in a
loop with a polling frequency.

> > >
> > > > +             } else {
> > > > +                     op->info.wait =3D 0;
> > > > +             }
> > > > +     } else {
> > > > +             op->info.wait =3D IS_SETLKW(cmd);
> > > >       }
> > > >
> > > >       send_op(op);
> > >
> > > Looks reasonable overall.
> > >
> > > Now that I look, we have quite a number of places in the kernel that
> > > seem to check for F_SETLKW, when what they really want is to check
> > > FL_SLEEP.
> >
> > Yes, so far I understand FL_SLEEP is F_SETLKW when you get only
> > F_SETLK in case of fl->fl_lmops && fl->fl_lmops->lm_grant is true. It
> > is confusing but this is how it works... if it's not set we will get
> > F_SETLKW and this should imply FL_SLEEP is set.
> >
> >
>
> Yeah. Might be good to consider how to make this more consistent across
> the kernel.

ok. I will do some grep and try to find those places.

- Alex

