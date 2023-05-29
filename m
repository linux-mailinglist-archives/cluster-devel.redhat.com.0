Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C36757151B9
	for <lists+cluster-devel@lfdr.de>; Tue, 30 May 2023 00:19:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685398749;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NhMup7LkBGdAPOz5NDd6KX324j84K3z1CaAR0UneiSQ=;
	b=RcXuvqZTlfGcFboBzCcGJXMSy22mTtbsphdBp2rvoz08J5MvrymtYag3bdFEoNyJrs8PTG
	l13F5wBY/vyUh1retzRTtS0Od3eKqhr8I4yvvrrIMcDe624o4QlVWg2eeTdWXilV0PKAfO
	O0oJxjBle1asb63xIfoaykA/SgI96bY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-BReOLavlO7mYLKoQ5i0RiQ-1; Mon, 29 May 2023 18:19:06 -0400
X-MC-Unique: BReOLavlO7mYLKoQ5i0RiQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C7D33C00132;
	Mon, 29 May 2023 22:19:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A562112132D;
	Mon, 29 May 2023 22:19:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 47CB219465A2;
	Mon, 29 May 2023 22:19:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4D2C3194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 29 May 2023 22:19:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1EB11112132D; Mon, 29 May 2023 22:19:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17AEF1121330
 for <cluster-devel@redhat.com>; Mon, 29 May 2023 22:19:03 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC4548007D9
 for <cluster-devel@redhat.com>; Mon, 29 May 2023 22:19:02 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-nuNCTrMlPk-6aszZxFF8yA-1; Mon, 29 May 2023 18:18:59 -0400
X-MC-Unique: nuNCTrMlPk-6aszZxFF8yA-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5149385acd0so2045490a12.3
 for <cluster-devel@redhat.com>; Mon, 29 May 2023 15:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685398738; x=1687990738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NhMup7LkBGdAPOz5NDd6KX324j84K3z1CaAR0UneiSQ=;
 b=UU8+wuzTd4RcFoI7kjdYdPTMLMtE/r16CvCbcO9L59fhpL3kAqVhcuMB5Sbd/HSlbb
 5gS3SxPJ1osVZA8m5uxubpGIqPst4BRYdWeAiuvb/FRvct5u6uCnjgFBSQu7Q30DqbC+
 I/baFKjivhIQoX3w26fYOwl9QRBHaAq60lFjVEZYCjTm1VW41pYmXQtAYsFeY8+uOgH8
 cMFKjQvzT0opma07/+iWnVkbTMqiCunD9mJVhQP1kLpg8ynPTVVOjczycgUgK6qZUz9j
 uzjT2ZjK57joy0xYtK7+d+3QCVqac7CyCmm8x+gPJr5BGIwoaRtD8D5nXOpJtQB3eFu8
 5Hqw==
X-Gm-Message-State: AC+VfDyvlkh7PLxkoH8/r81E9AMKhu3GVjXbZlY0SqH82qP+kYDDn0CJ
 KFgF9cBd67kz0y2QMFQ77TLLQj2eFHJJEluwzBUCFbh9VKptxXOYTNh0/5+bHRr78FIMBqESQVX
 gx2FyPal10n8v3tmDsLzwWJftIqfnQPEaUQ9VgO8dzWAs0f9g
X-Received: by 2002:aa7:d951:0:b0:514:a0e9:3deb with SMTP id
 l17-20020aa7d951000000b00514a0e93debmr132479eds.23.1685398738219; 
 Mon, 29 May 2023 15:18:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5VDL8U27vZmlDIiAWDqR3X5lbyyXtVtZT5XZw3S73YSsIlPfiu14jTerFrx/9yJ6bdrsXD3OX+FAhhUwIy4tY=
X-Received: by 2002:aa7:d951:0:b0:514:a0e9:3deb with SMTP id
 l17-20020aa7d951000000b00514a0e93debmr132469eds.23.1685398737949; Mon, 29 May
 2023 15:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230524160204.1042858-1-aahringo@redhat.com>
 <CAHc6FU7vaQmbwzL7Memu9YpsqXM9Ay4Mj52pDpkG6UdXw6hKVg@mail.gmail.com>
In-Reply-To: <CAHc6FU7vaQmbwzL7Memu9YpsqXM9Ay4Mj52pDpkG6UdXw6hKVg@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 29 May 2023 18:18:46 -0400
Message-ID: <CAK-6q+gvSO-MRMUPrGVzkO+ki48itzTjnaUC6t_4a+jUs2xV7w@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCHv2 dlm/next] fs: dlm: avoid F_SETLKW
 plock op lookup collisions
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 25, 2023 at 11:02=E2=80=AFAM Andreas Gruenbacher
<agruenba@redhat.com> wrote:
>
> On Wed, May 24, 2023 at 6:02=E2=80=AFPM Alexander Aring <aahringo@redhat.=
com> wrote:
> > This patch fixes a possible plock op collisions when using F_SETLKW loc=
k
> > requests and fsid, number and owner are not enough to identify a result
> > for a pending request. The ltp testcases [0] and [1] are examples when
> > this is not enough in case of using classic posix locks with threads an=
d
> > open filedescriptor posix locks.
> >
> > The idea to fix the issue here is to place all lock request in order. I=
n
> > case of non F_SETLKW lock request (indicated if wait is set or not) the
> > lock requests are ordered inside the recv_list. If a result comes back
> > the right plock op can be found by the first plock_op in recv_list whic=
h
> > has not info.wait set. This can be done only by non F_SETLKW plock ops =
as
> > dlm_controld always reads a specific plock op (list_move_tail() from
> > send_list to recv_mlist) and write the result immediately back.
> >
> > This behaviour is for F_SETLKW not possible as multiple waiters can be
> > get a result back in an random order. To avoid a collisions in cases
> > like [0] or [1] this patch adds more fields to compare the plock
> > operations as the lock request is the same. This is also being made in
> > NFS to find an result for an asynchronous F_SETLKW lock request [2][3].=
 We
> > still can't find the exact lock request for a specific result if the
> > lock request is the same, but if this is the case we don't care the
> > order how the identical lock requests get their result back to grant th=
e
> > lock.
>
> When the recv_list contains multiple indistinguishable requests, this
> can only be because they originated from multiple threads of the same
> process. In that case, I agree that it doesn't matter which of those
> requests we "complete" in dev_write() as long as we only complete one
> request. We do need to compare the additional request fields in
> dev_write() to find a suitable request, so that makes sense as well.
> We need to compare all of the fields that identify a request (optype,
> ex, wait, pid, nodeid, fsid, number, start, end, owner) to find the
> "right" request (or in case there is more than one identical request,
> a "suitable" request).
>

In my "definition" why this works is as you said the "identical
request". There is a more deeper definition of "when is a request
identical" and in my opinion it is here as: "A request A is identical
to request B when they get granted under the same 'time'" which is all
the fields you mentioned.

Even with cancellation (F_SETLKW only) it does not matter which
"identical request" you cancel because the kernel and user
(dlm_controld) makes no relation between a lock request instance. You
need to have at least the same amount of "results" coming back from
user space as the amount you are waiting for a result for the same
"identical request".

> The above patch description doesn't match the code anymore, and the
> code doesn't fully revert the recv_list splitting of the previous
> version.
>

This isn't a revert. Is it a new patch version, I did drop the
recv_setlkw_list here, dropping in means of removing the
recv_setlkw_list and handling everything in the recv_list. Although
there might be a performance impact by splitting the requests in two
lists as we don't need to jump over all F_SETLKW requests.

> > [0] https://gitlab.com/netcoder/ltp/-/blob/dlm_fcntl_owner_testcase/tes=
tcases/kernel/syscalls/fcntl/fcntl40.c
> > [1] https://gitlab.com/netcoder/ltp/-/blob/dlm_fcntl_owner_testcase/tes=
tcases/kernel/syscalls/fcntl/fcntl41.c
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/include/linux/lockd/lockd.h?h=3Dv6.4-rc1#n373
> > [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/fs/lockd/svclock.c?h=3Dv6.4-rc1#n731
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > ---
> > change since v2:
> >  - don't split recv_list into recv_setlkw_list
> >
> >  fs/dlm/plock.c | 43 ++++++++++++++++++++++++++++++-------------
> >  1 file changed, 30 insertions(+), 13 deletions(-)
> >
> > diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> > index 31bc601ee3d8..53d17dbbb716 100644
> > --- a/fs/dlm/plock.c
> > +++ b/fs/dlm/plock.c
> > @@ -391,7 +391,7 @@ static ssize_t dev_read(struct file *file, char __u=
ser *u, size_t count,
> >                 if (op->info.flags & DLM_PLOCK_FL_CLOSE)
> >                         list_del(&op->list);
> >                 else
> > -                       list_move(&op->list, &recv_list);
> > +                       list_move_tail(&op->list, &recv_list);
>
> ^ This should be obsolete, but it won't hurt, either.
>

No it is necessary, I tested it and looked deeper into the reason.
dlm_controld handles the lock requests in an ordered way over a
select() mechanism, but it will not always write a result back when
it's read the request out. This is the case for F_SETLKW but also for
all other plock op requests, such as F_GETLK. Instead of writing the
result back it will send it to corosync and the corosync select()
mechanism will write the result back. Corosync will keep the order to
write the result back. Due the fact that it's going through corosync
multiple non F_SETLKW can be queued up in recv_list and need to be
appended on the tail to later find the first entry which is non
F_SETLKW to find the result.

This ordered lock request read and write the result back (for non
F_SETLKW ops) is not part of UAPI of dlm plock and dlm_controld did it
always this way.

> >                 memcpy(&info, &op->info, sizeof(info));
> >         }
> >         spin_unlock(&ops_lock);
> > @@ -430,19 +430,36 @@ static ssize_t dev_write(struct file *file, const=
 char __user *u, size_t count,
> >                 return -EINVAL;
> >
> >         spin_lock(&ops_lock);
> > -       list_for_each_entry(iter, &recv_list, list) {
> > -               if (iter->info.fsid =3D=3D info.fsid &&
> > -                   iter->info.number =3D=3D info.number &&
> > -                   iter->info.owner =3D=3D info.owner) {
> > -                       list_del_init(&iter->list);
> > -                       memcpy(&iter->info, &info, sizeof(info));
> > -                       if (iter->data)
> > -                               do_callback =3D 1;
> > -                       else
> > -                               iter->done =3D 1;
> > -                       op =3D iter;
> > -                       break;
> > +       if (info.wait) {
>
> We should be able to use the same list_for_each_entry() loop for
> F_SETLKW requests (which have info.wait set) as for all other requests
> as far as I can see.
>

We can't match non F_SETLKW operations on all fields because F_GETLK
will change some fields when it's handled in user space. This is the
whole reason why the ordered handling is done here.

However there can be matched more fields but because F_GETLK we
require that this mechanism works in the above mentioned ordered way.
Those fields are checked by WARN_ON() that we get aware about changes
and "things" doesn't work anymore as they should.

> > +               list_for_each_entry(iter, &recv_list, list) {
> > +                       if (iter->info.fsid =3D=3D info.fsid &&
> > +                           iter->info.number =3D=3D info.number &&
> > +                           iter->info.owner =3D=3D info.owner &&
> > +                           iter->info.pid =3D=3D info.pid &&
> > +                           iter->info.start =3D=3D info.start &&
> > +                           iter->info.end =3D=3D info.end &&
> > +                           iter->info.ex =3D=3D info.ex &&
> > +                           iter->info.wait) {
> > +                               op =3D iter;
> > +                               break;
> > +                       }
> >                 }
> > +       } else {
> > +               list_for_each_entry(iter, &recv_list, list) {
> > +                       if (!iter->info.wait) {
> > +                               op =3D iter;
> > +                               break;
> > +                       }
> > +               }
> > +       }
> > +
> > +       if (op) {
> > +               list_del_init(&op->list);
> > +               memcpy(&op->info, &info, sizeof(info));
> > +               if (op->data)
> > +                       do_callback =3D 1;
> > +               else
> > +                       op->done =3D 1;
> >         }
>
> Can't this code just remain in the list_for_each_entry() loop?
>

It can, but we need two of them then in each loop because two loops
are necessary (see above).

- Alex

