Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C461715C77
	for <lists+cluster-devel@lfdr.de>; Tue, 30 May 2023 13:01:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685444495;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sSe7wQC4FFM6pm9bSUf5yLMt1V9EvixguZuRRlpEqF8=;
	b=Pi2oy92YTNtnDoQUx53O0CitHP/zsKVNoisHNyAwTqUSaoqrCvHfQxL4irYLCpsY9VBR16
	iVv4syzh3ZZauNvZFee+gi3kZjWbVOHBnR/WmfF3CS8ID/EpIMUyRxHC5alIhFKjPUvP8w
	w0Hbf5IsfkQkWjHre/Jwm8bHVUnmPY4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-iGRym7Q9PBqBiNoaNskQ5Q-1; Tue, 30 May 2023 07:01:32 -0400
X-MC-Unique: iGRym7Q9PBqBiNoaNskQ5Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D41DC8032E4;
	Tue, 30 May 2023 11:01:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7836A20296C6;
	Tue, 30 May 2023 11:01:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0AADA19465A8;
	Tue, 30 May 2023 11:01:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D3EE11946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 30 May 2023 11:01:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B41631121330; Tue, 30 May 2023 11:01:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD05C112132D
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 11:01:27 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DC8F811E7F
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 11:01:27 +0000 (UTC)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-oUB4BNLuOEqscpm4GXb4VA-1; Tue, 30 May 2023 07:01:26 -0400
X-MC-Unique: oUB4BNLuOEqscpm4GXb4VA-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1b034ca114cso14988245ad.1
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 04:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685444485; x=1688036485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sSe7wQC4FFM6pm9bSUf5yLMt1V9EvixguZuRRlpEqF8=;
 b=QyeRmko2v4B4Dx+ArF3UnUiPvUdKCrOnnZAuLR/W+0Jq6r4N1VgQ0tuiwWMAGprfos
 tKldmzb0cc+kIV4SgS023n49zFFCTZbs7lgbtaU5PtkRMlArCYNnMiCaoXmnOPz45Vu6
 kg+5+jVtPcF/Pw+PdTkuerATsLjvJL+mpjxHMG/ThAqFWTUdmgcwizD5J1RuoCNB7m/F
 KDUnC5duAySCKooKnpksRnwKsN/5YNCRC+TGfV933Ssf0OHFLiFbb8bVXMUIPQGdooUd
 aDJuWyKB569NIFQ/ysSnSzgDsWoRzkEuKblGwCPVsNHCNGYK7b+V2+openZgLgCHQJAj
 nV0w==
X-Gm-Message-State: AC+VfDzUJjU5VY0zYAceC0XWH3S1jLX/MHFQHugaMA+O+fBOylIgZ0Xh
 Ssas+uCqtatbNvRLgVgqDiJJbpF/xICX3Nltk5GRdxiEZOQWXpJNjjI9fsR2gkOharINpCGRsh6
 42QnwqotdXP7+3NwsEFCQtTWItNm4wW74zn6E3g==
X-Received: by 2002:a17:902:cec7:b0:1b0:4591:283c with SMTP id
 d7-20020a170902cec700b001b04591283cmr2341350plg.62.1685444485216; 
 Tue, 30 May 2023 04:01:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7bxwCkSLTRBEaco04wihEXJtiOGjj6s//7AEN1+4rEx1XzYCevlaRas9EoG20ptRn7VkOv4H0fuqoSZByRvvY=
X-Received: by 2002:a17:902:cec7:b0:1b0:4591:283c with SMTP id
 d7-20020a170902cec700b001b04591283cmr2341320plg.62.1685444484813; Tue, 30 May
 2023 04:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230524160204.1042858-1-aahringo@redhat.com>
 <CAHc6FU7vaQmbwzL7Memu9YpsqXM9Ay4Mj52pDpkG6UdXw6hKVg@mail.gmail.com>
 <CAK-6q+gvSO-MRMUPrGVzkO+ki48itzTjnaUC6t_4a+jUs2xV7w@mail.gmail.com>
In-Reply-To: <CAK-6q+gvSO-MRMUPrGVzkO+ki48itzTjnaUC6t_4a+jUs2xV7w@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 30 May 2023 13:01:12 +0200
Message-ID: <CAHc6FU4BCSFk+St-cndUr24Gb1g1K1DEAiKkMy-Z-SxLjhPM=w@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 12:19=E2=80=AFAM Alexander Aring <aahringo@redhat.c=
om> wrote:
> Hi,
>
> On Thu, May 25, 2023 at 11:02=E2=80=AFAM Andreas Gruenbacher
> <agruenba@redhat.com> wrote:
> >
> > On Wed, May 24, 2023 at 6:02=E2=80=AFPM Alexander Aring <aahringo@redha=
t.com> wrote:
> > > This patch fixes a possible plock op collisions when using F_SETLKW l=
ock
> > > requests and fsid, number and owner are not enough to identify a resu=
lt
> > > for a pending request. The ltp testcases [0] and [1] are examples whe=
n
> > > this is not enough in case of using classic posix locks with threads =
and
> > > open filedescriptor posix locks.
> > >
> > > The idea to fix the issue here is to place all lock request in order.=
 In
> > > case of non F_SETLKW lock request (indicated if wait is set or not) t=
he
> > > lock requests are ordered inside the recv_list. If a result comes bac=
k
> > > the right plock op can be found by the first plock_op in recv_list wh=
ich
> > > has not info.wait set. This can be done only by non F_SETLKW plock op=
s as
> > > dlm_controld always reads a specific plock op (list_move_tail() from
> > > send_list to recv_mlist) and write the result immediately back.
> > >
> > > This behaviour is for F_SETLKW not possible as multiple waiters can b=
e
> > > get a result back in an random order. To avoid a collisions in cases
> > > like [0] or [1] this patch adds more fields to compare the plock
> > > operations as the lock request is the same. This is also being made i=
n
> > > NFS to find an result for an asynchronous F_SETLKW lock request [2][3=
]. We
> > > still can't find the exact lock request for a specific result if the
> > > lock request is the same, but if this is the case we don't care the
> > > order how the identical lock requests get their result back to grant =
the
> > > lock.
> >
> > When the recv_list contains multiple indistinguishable requests, this
> > can only be because they originated from multiple threads of the same
> > process. In that case, I agree that it doesn't matter which of those
> > requests we "complete" in dev_write() as long as we only complete one
> > request. We do need to compare the additional request fields in
> > dev_write() to find a suitable request, so that makes sense as well.
> > We need to compare all of the fields that identify a request (optype,
> > ex, wait, pid, nodeid, fsid, number, start, end, owner) to find the
> > "right" request (or in case there is more than one identical request,
> > a "suitable" request).
> >
>
> In my "definition" why this works is as you said the "identical
> request". There is a more deeper definition of "when is a request
> identical" and in my opinion it is here as: "A request A is identical
> to request B when they get granted under the same 'time'" which is all
> the fields you mentioned.
>
> Even with cancellation (F_SETLKW only) it does not matter which
> "identical request" you cancel because the kernel and user
> (dlm_controld) makes no relation between a lock request instance. You
> need to have at least the same amount of "results" coming back from
> user space as the amount you are waiting for a result for the same
> "identical request".

That's not incorrect per se, but cancellations create an additional
difficulty: they can either succeed or fail. To indicate that a
cancellation has succeeded, a new type of message can be introduced
(say, "CANCELLED"), and it's obvious that a CANCELLED message can only
belong to a locking request that is being cancelled. When cancelling a
locking request fails, the kernel will see a "locking request granted"
message though, and when multiple identical locking requests are
queued and only some of them have been cancelled, it won't be obvious
which locking request a "locking request granted" message should be
assigned to anymore. You really don't want to mix things up in that
case.

This complication makes it a whole lot more difficult to reason about
the correctness of the code. All that complexity is avoidable by
sticking with a fixed mapping of requests and replies (i.e., a unique
request identifier).

To put it differently, you can shoot yourself in the foot and still
hop along on the other leg, but it may not be the best of all possible
ideas.

> > The above patch description doesn't match the code anymore, and the
> > code doesn't fully revert the recv_list splitting of the previous
> > version.
> >
>
> This isn't a revert. Is it a new patch version, I did drop the
> recv_setlkw_list here, dropping in means of removing the
> recv_setlkw_list and handling everything in the recv_list. Although
> there might be a performance impact by splitting the requests in two
> lists as we don't need to jump over all F_SETLKW requests.
>
> > > [0] https://gitlab.com/netcoder/ltp/-/blob/dlm_fcntl_owner_testcase/t=
estcases/kernel/syscalls/fcntl/fcntl40.c
> > > [1] https://gitlab.com/netcoder/ltp/-/blob/dlm_fcntl_owner_testcase/t=
estcases/kernel/syscalls/fcntl/fcntl41.c
> > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/include/linux/lockd/lockd.h?h=3Dv6.4-rc1#n373
> > > [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/fs/lockd/svclock.c?h=3Dv6.4-rc1#n731
> > >
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > > ---
> > > change since v2:
> > >  - don't split recv_list into recv_setlkw_list
> > >
> > >  fs/dlm/plock.c | 43 ++++++++++++++++++++++++++++++-------------
> > >  1 file changed, 30 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> > > index 31bc601ee3d8..53d17dbbb716 100644
> > > --- a/fs/dlm/plock.c
> > > +++ b/fs/dlm/plock.c
> > > @@ -391,7 +391,7 @@ static ssize_t dev_read(struct file *file, char _=
_user *u, size_t count,
> > >                 if (op->info.flags & DLM_PLOCK_FL_CLOSE)
> > >                         list_del(&op->list);
> > >                 else
> > > -                       list_move(&op->list, &recv_list);
> > > +                       list_move_tail(&op->list, &recv_list);
> >
> > ^ This should be obsolete, but it won't hurt, either.
> >
>
> No it is necessary, I tested it and looked deeper into the reason.
> dlm_controld handles the lock requests in an ordered way over a
> select() mechanism, but it will not always write a result back when
> it's read the request out. This is the case for F_SETLKW but also for
> all other plock op requests, such as F_GETLK. Instead of writing the
> result back it will send it to corosync and the corosync select()
> mechanism will write the result back. Corosync will keep the order to
> write the result back. Due the fact that it's going through corosync
> multiple non F_SETLKW can be queued up in recv_list and need to be
> appended on the tail to later find the first entry which is non
> F_SETLKW to find the result.
>
> This ordered lock request read and write the result back (for non
> F_SETLKW ops) is not part of UAPI of dlm plock and dlm_controld did it
> always this way.

This sounds pretty confused. Let's look at

> > >                 memcpy(&info, &op->info, sizeof(info));
> > >         }
> > >         spin_unlock(&ops_lock);
> > > @@ -430,19 +430,36 @@ static ssize_t dev_write(struct file *file, con=
st char __user *u, size_t count,
> > >                 return -EINVAL;
> > >
> > >         spin_lock(&ops_lock);
> > > -       list_for_each_entry(iter, &recv_list, list) {
> > > -               if (iter->info.fsid =3D=3D info.fsid &&
> > > -                   iter->info.number =3D=3D info.number &&
> > > -                   iter->info.owner =3D=3D info.owner) {
> > > -                       list_del_init(&iter->list);
> > > -                       memcpy(&iter->info, &info, sizeof(info));
> > > -                       if (iter->data)
> > > -                               do_callback =3D 1;
> > > -                       else
> > > -                               iter->done =3D 1;
> > > -                       op =3D iter;
> > > -                       break;
> > > +       if (info.wait) {
> >
.> > We should be able to use the same list_for_each_entry() loop for
> > F_SETLKW requests (which have info.wait set) as for all other requests
> > as far as I can see.
> >
>
> We can't match non F_SETLKW operations on all fields because F_GETLK
> will change some fields when it's handled in user space. This is the
> whole reason why the ordered handling is done here.

I know that F_GETLK uses the l_type field to indicate the outcome of
the operation. But that happens in dlm_posix_get() when processing the
reply from dlm_controld; it doesn't affect info.optype or any other
fields in struct dlm_plock_info. So we actually can compare all of the
key fields in struct dlm_plock_info.

> However there can be matched more fields but because F_GETLK we
> require that this mechanism works in the above mentioned ordered way.
> Those fields are checked by WARN_ON() that we get aware about changes
> and "things" doesn't work anymore as they should.
>
> > > +               list_for_each_entry(iter, &recv_list, list) {
> > > +                       if (iter->info.fsid =3D=3D info.fsid &&
> > > +                           iter->info.number =3D=3D info.number &&
> > > +                           iter->info.owner =3D=3D info.owner &&
> > > +                           iter->info.pid =3D=3D info.pid &&
> > > +                           iter->info.start =3D=3D info.start &&
> > > +                           iter->info.end =3D=3D info.end &&
> > > +                           iter->info.ex =3D=3D info.ex &&
> > > +                           iter->info.wait) {
> > > +                               op =3D iter;
> > > +                               break;
> > > +                       }
> > >                 }
> > > +       } else {
> > > +               list_for_each_entry(iter, &recv_list, list) {
> > > +                       if (!iter->info.wait) {
> > > +                               op =3D iter;
> > > +                               break;
> > > +                       }
> > > +               }
> > > +       }
> > > +
> > > +       if (op) {
> > > +               list_del_init(&op->list);
> > > +               memcpy(&op->info, &info, sizeof(info));
> > > +               if (op->data)
> > > +                       do_callback =3D 1;
> > > +               else
> > > +                       op->done =3D 1;
> > >         }
> >
> > Can't this code just remain in the list_for_each_entry() loop?
> >
>
> It can, but we need two of them then in each loop because two loops
> are necessary (see above).

Well yes, my comment was based on the fact that there actually
shouldn't be two loops.

Andreas

