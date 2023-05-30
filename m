Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46876716B4A
	for <lists+cluster-devel@lfdr.de>; Tue, 30 May 2023 19:40:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685468437;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ucVScV4sdyNVCqyw1+3t1xIZfOFojPzX1vWAJ5zfJSY=;
	b=e9ysNLP6SrVxyYHhqpQwHm8N0SMgTfShC8OF8BAtke8a71Q0gHfxT7HuELONryEvOAe1nU
	hPmDJxDd+/TUZZt+jb1eEWRT+77ALGcPzt998evrXBxHmIH0g3oyGutoWuPMocZAwhw/S+
	y1WBiL1pUVkoq3B/3vyBI7CS27IRQNE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-P3-Shf13OT-BsO1LPwrd3g-1; Tue, 30 May 2023 13:40:34 -0400
X-MC-Unique: P3-Shf13OT-BsO1LPwrd3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24BAF1C03DA9;
	Tue, 30 May 2023 17:40:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F019740CFD08;
	Tue, 30 May 2023 17:40:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A9F4A19465A8;
	Tue, 30 May 2023 17:40:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A10E81946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 30 May 2023 17:40:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9002F40BAEE; Tue, 30 May 2023 17:40:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87724492B00
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 17:40:29 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65BAB811E7C
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 17:40:29 +0000 (UTC)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-OXpTsG5_Ozi2oKEUPRIreA-1; Tue, 30 May 2023 13:40:27 -0400
X-MC-Unique: OXpTsG5_Ozi2oKEUPRIreA-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1b04c328aa1so11205885ad.2
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 10:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685468426; x=1688060426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ucVScV4sdyNVCqyw1+3t1xIZfOFojPzX1vWAJ5zfJSY=;
 b=EitJYFpWe+H41jRG76xm1ZYmCBKZpa1zMkfbn+vBSdKRz60vGhrvD8jIavkL+d1Odp
 G/IVDg7bSOs6mOVMmQodQa/aJVNiGPvDlx1e4rz/T9GtNAKtf299l/X3A7g7EccCMxRq
 noXArYED3hSWc3YAL8iCjWeU7G7lfWcp85wwIoOPBDHIPgK9H1I5F+mb/vJhyt5HuoIM
 9i0ax3on8BNuGI4cr1VSQHVLFm8NfoCEJK0CI+cs4NtLv8hs2SQMOEtF6zw490f8FqxE
 LWLbKC8BcdLB9cAmNZ7GUTkEhvKB/JQYf3lv4J5ZzifLZSNDkaJnyIz8DC6dSyPQS+0M
 UOdA==
X-Gm-Message-State: AC+VfDyiVkCOiPJJVWZP/JKmXmGkcPRQ5Fqf6Sp8k+yvsWh+FjcpwLvu
 69Nb82sWDK0Wyvr1rvnRY9HIXUPo7q8Uhi3QvrM6DgpYRtUFnV1yEc2zUHFNLELSPzIiUNFPGbq
 kEMclCliCinU7ysOtp/zYlvxVc8thrMCw8VK4Ow==
X-Received: by 2002:a17:902:cecb:b0:1b0:6480:1788 with SMTP id
 d11-20020a170902cecb00b001b064801788mr2477594plg.61.1685468425633; 
 Tue, 30 May 2023 10:40:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4SWNXUogOo8XIdh10noG7U63oer7uEE1TSY24j83/mVyeiy3S/zM9QvSMe4mZwAPw4xFXQ7HG+YgmDLo39m90=
X-Received: by 2002:a17:902:cecb:b0:1b0:6480:1788 with SMTP id
 d11-20020a170902cecb00b001b064801788mr2477571plg.61.1685468425139; Tue, 30
 May 2023 10:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230524160204.1042858-1-aahringo@redhat.com>
 <CAHc6FU7vaQmbwzL7Memu9YpsqXM9Ay4Mj52pDpkG6UdXw6hKVg@mail.gmail.com>
 <CAK-6q+gvSO-MRMUPrGVzkO+ki48itzTjnaUC6t_4a+jUs2xV7w@mail.gmail.com>
 <CAHc6FU4BCSFk+St-cndUr24Gb1g1K1DEAiKkMy-Z-SxLjhPM=w@mail.gmail.com>
 <CAK-6q+i8z6WEf5fEGgbcbMi6ffB12UnegPXxjAVJ7-Gxe4S=Bw@mail.gmail.com>
In-Reply-To: <CAK-6q+i8z6WEf5fEGgbcbMi6ffB12UnegPXxjAVJ7-Gxe4S=Bw@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 30 May 2023 19:40:13 +0200
Message-ID: <CAHc6FU4Y18NUL_D0mtLpY41pNXqdqK6ykPJSTGhg5ou=wQij2w@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 4:08=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
> Hi,
>
> On Tue, May 30, 2023 at 7:01=E2=80=AFAM Andreas Gruenbacher <agruenba@red=
hat.com> wrote:
> >
> > On Tue, May 30, 2023 at 12:19=E2=80=AFAM Alexander Aring <aahringo@redh=
at.com> wrote:
> > > Hi,
> > >
> > > On Thu, May 25, 2023 at 11:02=E2=80=AFAM Andreas Gruenbacher
> > > <agruenba@redhat.com> wrote:
> > > >
> > > > On Wed, May 24, 2023 at 6:02=E2=80=AFPM Alexander Aring <aahringo@r=
edhat.com> wrote:
> > > > > This patch fixes a possible plock op collisions when using F_SETL=
KW lock
> > > > > requests and fsid, number and owner are not enough to identify a =
result
> > > > > for a pending request. The ltp testcases [0] and [1] are examples=
 when
> > > > > this is not enough in case of using classic posix locks with thre=
ads and
> > > > > open filedescriptor posix locks.
> > > > >
> > > > > The idea to fix the issue here is to place all lock request in or=
der. In
> > > > > case of non F_SETLKW lock request (indicated if wait is set or no=
t) the
> > > > > lock requests are ordered inside the recv_list. If a result comes=
 back
> > > > > the right plock op can be found by the first plock_op in recv_lis=
t which
> > > > > has not info.wait set. This can be done only by non F_SETLKW ploc=
k ops as
> > > > > dlm_controld always reads a specific plock op (list_move_tail() f=
rom
> > > > > send_list to recv_mlist) and write the result immediately back.
> > > > >
> > > > > This behaviour is for F_SETLKW not possible as multiple waiters c=
an be
> > > > > get a result back in an random order. To avoid a collisions in ca=
ses
> > > > > like [0] or [1] this patch adds more fields to compare the plock
> > > > > operations as the lock request is the same. This is also being ma=
de in
> > > > > NFS to find an result for an asynchronous F_SETLKW lock request [=
2][3]. We
> > > > > still can't find the exact lock request for a specific result if =
the
> > > > > lock request is the same, but if this is the case we don't care t=
he
> > > > > order how the identical lock requests get their result back to gr=
ant the
> > > > > lock.
> > > >
> > > > When the recv_list contains multiple indistinguishable requests, th=
is
> > > > can only be because they originated from multiple threads of the sa=
me
> > > > process. In that case, I agree that it doesn't matter which of thos=
e
> > > > requests we "complete" in dev_write() as long as we only complete o=
ne
> > > > request. We do need to compare the additional request fields in
> > > > dev_write() to find a suitable request, so that makes sense as well=
.
> > > > We need to compare all of the fields that identify a request (optyp=
e,
> > > > ex, wait, pid, nodeid, fsid, number, start, end, owner) to find the
> > > > "right" request (or in case there is more than one identical reques=
t,
> > > > a "suitable" request).
> > > >
> > >
> > > In my "definition" why this works is as you said the "identical
> > > request". There is a more deeper definition of "when is a request
> > > identical" and in my opinion it is here as: "A request A is identical
> > > to request B when they get granted under the same 'time'" which is al=
l
> > > the fields you mentioned.
> > >
> > > Even with cancellation (F_SETLKW only) it does not matter which
> > > "identical request" you cancel because the kernel and user
> > > (dlm_controld) makes no relation between a lock request instance. You
> > > need to have at least the same amount of "results" coming back from
> > > user space as the amount you are waiting for a result for the same
> > > "identical request".
> >
> > That's not incorrect per se, but cancellations create an additional
> > difficulty: they can either succeed or fail. To indicate that a
> > cancellation has succeeded, a new type of message can be introduced
> > (say, "CANCELLED"), and it's obvious that a CANCELLED message can only
> > belong to a locking request that is being cancelled. When cancelling a
> > locking request fails, the kernel will see a "locking request granted"
> > message though, and when multiple identical locking requests are
> > queued and only some of them have been cancelled, it won't be obvious
> > which locking request a "locking request granted" message should be
> > assigned to anymore. You really don't want to mix things up in that
> > case.
> >
> > This complication makes it a whole lot more difficult to reason about
> > the correctness of the code. All that complexity is avoidable by
> > sticking with a fixed mapping of requests and replies (i.e., a unique
> > request identifier).
> >
> > To put it differently, you can shoot yourself in the foot and still
> > hop along on the other leg, but it may not be the best of all possible
> > ideas.
> >
>
> It makes things more complicated, I agree and the reason why this
> works now is because there are a lot of "dependencies". I would love
> to have an unique identifier to make it possible that we can follow an
> instance handle of the original lock request.
>
> * an unique identifier which also works with the async lock request of
> lockd case.

What's the lockd case you're referring to here, and why is it relevant
for the problem at hand?

> > > > The above patch description doesn't match the code anymore, and the
> > > > code doesn't fully revert the recv_list splitting of the previous
> > > > version.
> > > >
> > >
> > > This isn't a revert. Is it a new patch version, I did drop the
> > > recv_setlkw_list here, dropping in means of removing the
> > > recv_setlkw_list and handling everything in the recv_list. Although
> > > there might be a performance impact by splitting the requests in two
> > > lists as we don't need to jump over all F_SETLKW requests.
> > >
> > > > > [0] https://gitlab.com/netcoder/ltp/-/blob/dlm_fcntl_owner_testca=
se/testcases/kernel/syscalls/fcntl/fcntl40.c
> > > > > [1] https://gitlab.com/netcoder/ltp/-/blob/dlm_fcntl_owner_testca=
se/testcases/kernel/syscalls/fcntl/fcntl41.c
> > > > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/tree/include/linux/lockd/lockd.h?h=3Dv6.4-rc1#n373
> > > > > [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/tree/fs/lockd/svclock.c?h=3Dv6.4-rc1#n731
> > > > >
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > > > > ---
> > > > > change since v2:
> > > > >  - don't split recv_list into recv_setlkw_list
> > > > >
> > > > >  fs/dlm/plock.c | 43 ++++++++++++++++++++++++++++++-------------
> > > > >  1 file changed, 30 insertions(+), 13 deletions(-)
> > > > >
> > > > > diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> > > > > index 31bc601ee3d8..53d17dbbb716 100644
> > > > > --- a/fs/dlm/plock.c
> > > > > +++ b/fs/dlm/plock.c
> > > > > @@ -391,7 +391,7 @@ static ssize_t dev_read(struct file *file, ch=
ar __user *u, size_t count,
> > > > >                 if (op->info.flags & DLM_PLOCK_FL_CLOSE)
> > > > >                         list_del(&op->list);
> > > > >                 else
> > > > > -                       list_move(&op->list, &recv_list);
> > > > > +                       list_move_tail(&op->list, &recv_list);
> > > >
> > > > ^ This should be obsolete, but it won't hurt, either.
> > > >
> > >
> > > No it is necessary, I tested it and looked deeper into the reason.
> > > dlm_controld handles the lock requests in an ordered way over a
> > > select() mechanism, but it will not always write a result back when
> > > it's read the request out. This is the case for F_SETLKW but also for
> > > all other plock op requests, such as F_GETLK. Instead of writing the
> > > result back it will send it to corosync and the corosync select()
> > > mechanism will write the result back. Corosync will keep the order to
> > > write the result back. Due the fact that it's going through corosync
> > > multiple non F_SETLKW can be queued up in recv_list and need to be
> > > appended on the tail to later find the first entry which is non
> > > F_SETLKW to find the result.
> > >
> > > This ordered lock request read and write the result back (for non
> > > F_SETLKW ops) is not part of UAPI of dlm plock and dlm_controld did i=
t
> > > always this way.
> >
> > This sounds pretty confused. Let's look at
> >
>
> As I said, yes it is a lot of specific handling of user space why this
> is actually working.
>
> > > > >                 memcpy(&info, &op->info, sizeof(info));
> > > > >         }
> > > > >         spin_unlock(&ops_lock);
> > > > > @@ -430,19 +430,36 @@ static ssize_t dev_write(struct file *file,=
 const char __user *u, size_t count,
> > > > >                 return -EINVAL;
> > > > >
> > > > >         spin_lock(&ops_lock);
> > > > > -       list_for_each_entry(iter, &recv_list, list) {
> > > > > -               if (iter->info.fsid =3D=3D info.fsid &&
> > > > > -                   iter->info.number =3D=3D info.number &&
> > > > > -                   iter->info.owner =3D=3D info.owner) {
> > > > > -                       list_del_init(&iter->list);
> > > > > -                       memcpy(&iter->info, &info, sizeof(info));
> > > > > -                       if (iter->data)
> > > > > -                               do_callback =3D 1;
> > > > > -                       else
> > > > > -                               iter->done =3D 1;
> > > > > -                       op =3D iter;
> > > > > -                       break;
> > > > > +       if (info.wait) {
> > > >
> > .> > We should be able to use the same list_for_each_entry() loop for
> > > > F_SETLKW requests (which have info.wait set) as for all other reque=
sts
> > > > as far as I can see.
> > > >
> > >
> > > We can't match non F_SETLKW operations on all fields because F_GETLK
> > > will change some fields when it's handled in user space. This is the
> > > whole reason why the ordered handling is done here.
> >
> > I know that F_GETLK uses the l_type field to indicate the outcome of
> > the operation. But that happens in dlm_posix_get() when processing the
> > reply from dlm_controld; it doesn't affect info.optype or any other
> > fields in struct dlm_plock_info. So we actually can compare all of the
> > key fields in struct dlm_plock_info.
> >
>
> F_GETLK also uses start, end, etc. to tell the caller about the region
> which is in conflict. The region which is in conflict is returned into
> the result info struct. See [0] [1].
> Is this more clear now that other fields are affected?

Ah, that sucks.

Thanks,
Andreas

