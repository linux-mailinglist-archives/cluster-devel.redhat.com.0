Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A00277EE9D
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Aug 2023 03:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692235193;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MdJI8YOWfcspuu/Kis9p/FFOj/Ijn4DHopWgTGqX0p8=;
	b=RUs7QBigfnPxLqpb04Sf62UoBph9/C+dsg/Dk4QVXY5fI1Q07ToeIwUJqMZAK/tUtELP0i
	MfKwcgPDbSXu6SKzWZAfldWGNQ7Dk1tLttXrjZu8KH7RuM3uZTllcRNZJ2bm07OMocG/+z
	L33ozmuFmfxPrykB2Q/qsoOjugTUh4o=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-BxbYa3CpNGOv-ClFzj1IYA-1; Wed, 16 Aug 2023 21:19:49 -0400
X-MC-Unique: BxbYa3CpNGOv-ClFzj1IYA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D393029A9CAA;
	Thu, 17 Aug 2023 01:19:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E23AE492C14;
	Thu, 17 Aug 2023 01:19:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 64D8C194658C;
	Thu, 17 Aug 2023 01:19:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CC1611946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Aug 2023 01:19:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A9A452026D68; Thu, 17 Aug 2023 01:19:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A243D2026D4B
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 01:19:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C46D29A9CAB
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 01:19:24 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-AmO6tQ9ENS6fi3Zt0TrnQA-1; Wed, 16 Aug 2023 21:19:21 -0400
X-MC-Unique: AmO6tQ9ENS6fi3Zt0TrnQA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5234e6cc76fso4380571a12.1
 for <cluster-devel@redhat.com>; Wed, 16 Aug 2023 18:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692235160; x=1692839960;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdJI8YOWfcspuu/Kis9p/FFOj/Ijn4DHopWgTGqX0p8=;
 b=bEYf91K4+ICatodH3xXYELPWoBujELJxXEWJPLQ2Kf85vTu8HH4Wq936ceoAIlJL18
 zkMwOoY+PjoP20R4pO9m/+i2Yfdi4rsUQsNvWPjo8kGhUVBQgLP3GLeTz9LVBV0xgOgT
 rCWbmVXfyaT66gcruO91hzweyU9nbZWBblz5U98SC8Lpu++wtcSZxetyHPwYEfMeti+s
 EhaYSUTvqAmM/CD2bIemKnyI1LeKjRAfTfL94+oPQeq42WH817UQpwSYdv91tBFh8hzu
 ZOjkPLoS1Q36ZqiV1Er+R1lZ/igYtYtkPCNydRAx8G04wbW8vvcLQGTtuxEfJhyrehOE
 EsnA==
X-Gm-Message-State: AOJu0YwVlRhDAGXQAFRef57Qn8wMoVkH9Wj/aQiPMG87gvUIZHbDx4Jr
 sEM5xJ4IEpLpTn7Wk1K11q0hXjMWL0WDC9RU1pr9WPDtBtXfgA3h7bIOO9D/WzL7dhjk8gc5zbW
 +s8uw10bCoFn2yNWInrpv62Rrh5gljM8gVYvQfw==
X-Received: by 2002:a05:6402:2028:b0:523:b665:e494 with SMTP id
 ay8-20020a056402202800b00523b665e494mr2705182edb.15.1692235159939; 
 Wed, 16 Aug 2023 18:19:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+3zVWGGEV7pU4ZRS9ZVR7J1WVptyIFU1YawAqPgdGNxY0nrs+srZ1tF1GgXLlWOW6IssVK6QeBhfLu09ErmQ=
X-Received: by 2002:a05:6402:2028:b0:523:b665:e494 with SMTP id
 ay8-20020a056402202800b00523b665e494mr2705166edb.15.1692235159674; Wed, 16
 Aug 2023 18:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230814211116.3224759-1-aahringo@redhat.com>
 <20230814211116.3224759-7-aahringo@redhat.com>
 <bd76489a6b0d2f56f4a68d48b3736fcaf5b5119b.camel@kernel.org>
In-Reply-To: <bd76489a6b0d2f56f4a68d48b3736fcaf5b5119b.camel@kernel.org>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 16 Aug 2023 21:19:08 -0400
Message-ID: <CAK-6q+i3oKN3M_kdoQ99hMnzSZyRH1sPdxZ0MQMwp+vSixUhwg@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 16, 2023 at 9:07=E2=80=AFAM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Mon, 2023-08-14 at 17:11 -0400, Alexander Aring wrote:
> > This patch uses the FL_SLEEP flag in struct file_lock to check if it's =
a
> > blocking request in case if the request coming from nfs lockd process
> > indicated by lm_grant() is set.
> >
> > IF FL_SLEEP is set a asynchronous blocking request is being made and
> > it's waiting for lm_grant() callback being called to signal the lock wa=
s
> > granted. If it's not set a synchronous non-blocking request is being ma=
de.
> >
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > ---
> >  fs/dlm/plock.c | 38 ++++++++++++++++++++++----------------
> >  1 file changed, 22 insertions(+), 16 deletions(-)
> >
> > diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> > index 0094fa4004cc..524771002a2f 100644
> > --- a/fs/dlm/plock.c
> > +++ b/fs/dlm/plock.c
> > @@ -140,7 +140,6 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 =
number, struct file *file,
> >       op->info.optype         =3D DLM_PLOCK_OP_LOCK;
> >       op->info.pid            =3D fl->fl_pid;
> >       op->info.ex             =3D (fl->fl_type =3D=3D F_WRLCK);
> > -     op->info.wait           =3D IS_SETLKW(cmd);
> >       op->info.fsid           =3D ls->ls_global_id;
> >       op->info.number         =3D number;
> >       op->info.start          =3D fl->fl_start;
> > @@ -148,24 +147,31 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u6=
4 number, struct file *file,
> >       op->info.owner =3D (__u64)(long)fl->fl_owner;
> >       /* async handling */
> >       if (fl->fl_lmops && fl->fl_lmops->lm_grant) {
> > -             op_data =3D kzalloc(sizeof(*op_data), GFP_NOFS);
> > -             if (!op_data) {
> > -                     dlm_release_plock_op(op);
> > -                     rv =3D -ENOMEM;
> > -                     goto out;
> > -             }
> > +             if (fl->fl_flags & FL_SLEEP) {
> > +                     op_data =3D kzalloc(sizeof(*op_data), GFP_NOFS);
> > +                     if (!op_data) {
> > +                             dlm_release_plock_op(op);
> > +                             rv =3D -ENOMEM;
> > +                             goto out;
> > +                     }
> >
> > -             op_data->callback =3D fl->fl_lmops->lm_grant;
> > -             locks_init_lock(&op_data->flc);
> > -             locks_copy_lock(&op_data->flc, fl);
> > -             op_data->fl             =3D fl;
> > -             op_data->file   =3D file;
> > +                     op->info.wait =3D 1;
> > +                     op_data->callback =3D fl->fl_lmops->lm_grant;
> > +                     locks_init_lock(&op_data->flc);
> > +                     locks_copy_lock(&op_data->flc, fl);
> > +                     op_data->fl             =3D fl;
> > +                     op_data->file   =3D file;
> >
> > -             op->data =3D op_data;
> > +                     op->data =3D op_data;
> >
> > -             send_op(op);
> > -             rv =3D FILE_LOCK_DEFERRED;
> > -             goto out;
> > +                     send_op(op);
> > +                     rv =3D FILE_LOCK_DEFERRED;
> > +                     goto out;
>
> A question...we're returning FILE_LOCK_DEFERRED after the DLM request is
> sent. If it ends up being blocked, what happens? Does it do a lm_grant
> downcall with -EAGAIN or something as the result?
>

no, when info->wait is set then it is a blocked lock request, which
means lm_grant() will be called when the lock request is granted.

>
> > +             } else {
> > +                     op->info.wait =3D 0;
> > +             }
> > +     } else {
> > +             op->info.wait =3D IS_SETLKW(cmd);
> >       }
> >
> >       send_op(op);
>
> Looks reasonable overall.
>
> Now that I look, we have quite a number of places in the kernel that
> seem to check for F_SETLKW, when what they really want is to check
> FL_SLEEP.

Yes, so far I understand FL_SLEEP is F_SETLKW when you get only
F_SETLK in case of fl->fl_lmops && fl->fl_lmops->lm_grant is true. It
is confusing but this is how it works... if it's not set we will get
F_SETLKW and this should imply FL_SLEEP is set.

- Alex

