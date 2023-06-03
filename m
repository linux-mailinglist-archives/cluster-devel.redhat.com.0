Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE78720F16
	for <lists+cluster-devel@lfdr.de>; Sat,  3 Jun 2023 12:03:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685786597;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SbRekisLkk4Kf2WnqFRasVqF7zjIrsvjpeyQV3BRS90=;
	b=IOY04HGzo9nIrKRl3FbjTkpmiwakco1TyuxqXZAkhVlDccQnngUpr5wEcLiv8CPnazRTA3
	6geL4PvgKZnb72T5/Pkbe+Y/M4ExhCdmKMHfJykd6uShI3hgQxZcsKDuApC0rJWup0eueF
	E96OmOaFxgH6kntoE8oEFonCBG1FT8w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-KEff5U-dONKomIjETGMeuQ-1; Sat, 03 Jun 2023 06:03:14 -0400
X-MC-Unique: KEff5U-dONKomIjETGMeuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CE08185A791;
	Sat,  3 Jun 2023 10:03:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F82D2026D6A;
	Sat,  3 Jun 2023 10:03:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 345A419465B9;
	Sat,  3 Jun 2023 10:03:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B5A7219465A2 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  3 Jun 2023 10:03:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A179649BB98; Sat,  3 Jun 2023 10:03:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A31F403176
 for <cluster-devel@redhat.com>; Sat,  3 Jun 2023 10:03:11 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D98E85A5AA
 for <cluster-devel@redhat.com>; Sat,  3 Jun 2023 10:03:11 +0000 (UTC)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-R6o1mr6kO22ive3KL9IT4w-1; Sat, 03 Jun 2023 06:03:10 -0400
X-MC-Unique: R6o1mr6kO22ive3KL9IT4w-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1b03057588cso28474925ad.1
 for <cluster-devel@redhat.com>; Sat, 03 Jun 2023 03:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685786589; x=1688378589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SbRekisLkk4Kf2WnqFRasVqF7zjIrsvjpeyQV3BRS90=;
 b=cHs4ArjQfAp393O30QA7xdXvrhal79sJs/oI9IxCB9VyTBOLv787TXfrjYakiTkWAv
 rRhPvbIc0sjvbUCW22RJTH8GNrdPGtas2i+Ls7RlirzA4JN1J9pfLKBYHgdj09IiZjLL
 nDXmDBSIhentkIdd8S+T6YwodHfOAw0ivsmi5iaUAUAdHoKskiFXBQPftEdkRJlcQ1Kb
 P4ZVzi2CWMOGW5LjlRXBYD1EJxVBySBsxgnBrlC8SPA1r44KPiZ+hCmBiQV18zFX/yO7
 ii190wuuc/YB+eOJFagh92dMgIxCAsWVcrzdz5yXrlKEDCUQ6FHNgbqtLsgQG5CPhWIz
 kvjQ==
X-Gm-Message-State: AC+VfDypRgOBaE/ShJcp8QLgpAG+Hh4Vr+OUxq1ViuV7gMi8RUIXJ34X
 VKcg2to0EgFCCVUVMtq+HFfPnkWZ6bj1v9A3mcPLZNYBiPlfnZa1VeecSDVVDhq1qEeb1l+l1kX
 aDztKGVPdkAg/kdChmXfuiCwOnvPBByOBybkiLw==
X-Received: by 2002:a17:902:e807:b0:1af:d00c:7f04 with SMTP id
 u7-20020a170902e80700b001afd00c7f04mr2891572plg.12.1685786589064; 
 Sat, 03 Jun 2023 03:03:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7PmxIK+bvqp4no0fa8XIS66Qw5rHdvYEygGJpLjxcJy9WkSB1bcWSqpwGXTHAKNQMNCqfRzJXDoYssJxuJwvk=
X-Received: by 2002:a17:902:e807:b0:1af:d00c:7f04 with SMTP id
 u7-20020a170902e80700b001afd00c7f04mr2891560plg.12.1685786588676; Sat, 03 Jun
 2023 03:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230524160204.1042858-1-aahringo@redhat.com>
 <CAHc6FU7vaQmbwzL7Memu9YpsqXM9Ay4Mj52pDpkG6UdXw6hKVg@mail.gmail.com>
 <CAK-6q+gvSO-MRMUPrGVzkO+ki48itzTjnaUC6t_4a+jUs2xV7w@mail.gmail.com>
 <CAHc6FU4BCSFk+St-cndUr24Gb1g1K1DEAiKkMy-Z-SxLjhPM=w@mail.gmail.com>
 <CAK-6q+i8z6WEf5fEGgbcbMi6ffB12UnegPXxjAVJ7-Gxe4S=Bw@mail.gmail.com>
 <CAHc6FU4Y18NUL_D0mtLpY41pNXqdqK6ykPJSTGhg5ou=wQij2w@mail.gmail.com>
 <CAK-6q+i5-fUX=fYASjn4BbFKWYgTQ9DFP3cCYeQxJDuZ4pkCxw@mail.gmail.com>
 <CAHc6FU5S-BO+8dJEcrzu8pQnHucC9kM7=ns6ThSze8zxqSXjpw@mail.gmail.com>
 <CAK-6q+ibn8MGgmTYHQz8pXtw2sbwaQ=fK-fGG0aYAbY36UPFuA@mail.gmail.com>
In-Reply-To: <CAK-6q+ibn8MGgmTYHQz8pXtw2sbwaQ=fK-fGG0aYAbY36UPFuA@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sat, 3 Jun 2023 12:02:56 +0200
Message-ID: <CAHc6FU4HU6oiYHBAYndp6wb0-LmkSRiAccjQE6t1Gf1PCnhFQQ@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

On Thu, Jun 1, 2023 at 9:10=E2=80=AFPM Alexander Aring <aahringo@redhat.com=
> wrote:
> Hi,
>
> On Thu, Jun 1, 2023 at 1:11=E2=80=AFPM Andreas Gruenbacher <agruenba@redh=
at.com> wrote:
> >
> > On Thu, Jun 1, 2023 at 6:28=E2=80=AFPM Alexander Aring <aahringo@redhat=
.com> wrote:
> > > Hi,
> > >
> > > On Tue, May 30, 2023 at 1:40=E2=80=AFPM Andreas Gruenbacher <agruenba=
@redhat.com> wrote:
> > > >
> > > > On Tue, May 30, 2023 at 4:08=E2=80=AFPM Alexander Aring <aahringo@r=
edhat.com> wrote:
> > > > > Hi,
> > > > >
> > > > > On Tue, May 30, 2023 at 7:01=E2=80=AFAM Andreas Gruenbacher <agru=
enba@redhat.com> wrote:
> > > > > >
> > > > > > On Tue, May 30, 2023 at 12:19=E2=80=AFAM Alexander Aring <aahri=
ngo@redhat.com> wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > On Thu, May 25, 2023 at 11:02=E2=80=AFAM Andreas Gruenbacher
> > > > > > > <agruenba@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, May 24, 2023 at 6:02=E2=80=AFPM Alexander Aring <aa=
hringo@redhat.com> wrote:
> > > > > > > > > This patch fixes a possible plock op collisions when usin=
g F_SETLKW lock
> > > > > > > > > requests and fsid, number and owner are not enough to ide=
ntify a result
> > > > > > > > > for a pending request. The ltp testcases [0] and [1] are =
examples when
> > > > > > > > > this is not enough in case of using classic posix locks w=
ith threads and
> > > > > > > > > open filedescriptor posix locks.
> > > > > > > > >
> > > > > > > > > The idea to fix the issue here is to place all lock reque=
st in order. In
> > > > > > > > > case of non F_SETLKW lock request (indicated if wait is s=
et or not) the
> > > > > > > > > lock requests are ordered inside the recv_list. If a resu=
lt comes back
> > > > > > > > > the right plock op can be found by the first plock_op in =
recv_list which
> > > > > > > > > has not info.wait set. This can be done only by non F_SET=
LKW plock ops as
> > > > > > > > > dlm_controld always reads a specific plock op (list_move_=
tail() from
> > > > > > > > > send_list to recv_mlist) and write the result immediately=
 back.
> > > > > > > > >
> > > > > > > > > This behaviour is for F_SETLKW not possible as multiple w=
aiters can be
> > > > > > > > > get a result back in an random order. To avoid a collisio=
ns in cases
> > > > > > > > > like [0] or [1] this patch adds more fields to compare th=
e plock
> > > > > > > > > operations as the lock request is the same. This is also =
being made in
> > > > > > > > > NFS to find an result for an asynchronous F_SETLKW lock r=
equest [2][3]. We
> > > > > > > > > still can't find the exact lock request for a specific re=
sult if the
> > > > > > > > > lock request is the same, but if this is the case we don'=
t care the
> > > > > > > > > order how the identical lock requests get their result ba=
ck to grant the
> > > > > > > > > lock.
> > > > > > > >
> > > > > > > > When the recv_list contains multiple indistinguishable requ=
ests, this
> > > > > > > > can only be because they originated from multiple threads o=
f the same
> > > > > > > > process. In that case, I agree that it doesn't matter which=
 of those
> > > > > > > > requests we "complete" in dev_write() as long as we only co=
mplete one
> > > > > > > > request. We do need to compare the additional request field=
s in
> > > > > > > > dev_write() to find a suitable request, so that makes sense=
 as well.
> > > > > > > > We need to compare all of the fields that identify a reques=
t (optype,
> > > > > > > > ex, wait, pid, nodeid, fsid, number, start, end, owner) to =
find the
> > > > > > > > "right" request (or in case there is more than one identica=
l request,
> > > > > > > > a "suitable" request).
> > > > > > > >
> > > > > > >
> > > > > > > In my "definition" why this works is as you said the "identic=
al
> > > > > > > request". There is a more deeper definition of "when is a req=
uest
> > > > > > > identical" and in my opinion it is here as: "A request A is i=
dentical
> > > > > > > to request B when they get granted under the same 'time'" whi=
ch is all
> > > > > > > the fields you mentioned.
> > > > > > >
> > > > > > > Even with cancellation (F_SETLKW only) it does not matter whi=
ch
> > > > > > > "identical request" you cancel because the kernel and user
> > > > > > > (dlm_controld) makes no relation between a lock request insta=
nce. You
> > > > > > > need to have at least the same amount of "results" coming bac=
k from
> > > > > > > user space as the amount you are waiting for a result for the=
 same
> > > > > > > "identical request".
> > > > > >
> > > > > > That's not incorrect per se, but cancellations create an additi=
onal
> > > > > > difficulty: they can either succeed or fail. To indicate that a
> > > > > > cancellation has succeeded, a new type of message can be introd=
uced
> > > > > > (say, "CANCELLED"), and it's obvious that a CANCELLED message c=
an only
> > > > > > belong to a locking request that is being cancelled. When cance=
lling a
> > > > > > locking request fails, the kernel will see a "locking request g=
ranted"
> > > > > > message though, and when multiple identical locking requests ar=
e
> > > > > > queued and only some of them have been cancelled, it won't be o=
bvious
> > > > > > which locking request a "locking request granted" message shoul=
d be
> > > > > > assigned to anymore. You really don't want to mix things up in =
that
> > > > > > case.
> > > > > >
> > > > > > This complication makes it a whole lot more difficult to reason=
 about
> > > > > > the correctness of the code. All that complexity is avoidable b=
y
> > > > > > sticking with a fixed mapping of requests and replies (i.e., a =
unique
> > > > > > request identifier).
> > > > > >
> > > > > > To put it differently, you can shoot yourself in the foot and s=
till
> > > > > > hop along on the other leg, but it may not be the best of all p=
ossible
> > > > > > ideas.
> > > > > >
> > > > >
> > > > > It makes things more complicated, I agree and the reason why this
> > > > > works now is because there are a lot of "dependencies". I would l=
ove
> > > > > to have an unique identifier to make it possible that we can foll=
ow an
> > > > > instance handle of the original lock request.
> > > > >
> > > > > * an unique identifier which also works with the async lock reque=
st of
> > > > > lockd case.
> > > >
> > > > What's the lockd case you're referring to here, and why is it relev=
ant
> > > > for the problem at hand?
> > >
> > > just mentioned that we need a solution which also works for the
> > > asynchronous lock request (F_SETLK, F_SETLKW) case, there is only one
> > > user lockd. [0] DLM plock handling implements the behaviour mentioned
> > > at [0] but lm_grant() callback can also return negative values and
> > > signals that the lock request was cancelled (on nfs layer) and then
> > > need to tell it DLM. This however is not supported as we have a lack
> > > of cancellation.
> >
> > Ouch, that's a bit messy. But if the vfs_lock_file() description is
> > accurate, then only F_SETLK requests arriving via lockd can be
> > asynchronous, and F_SETLKW requests never are asynchronous. And we
> > only need to cancel F_SETLKW requests. It follows that we only ever
> > need to cancel synchronous requests.
> >
>
> I looked into the code and I think the second sentence of [0] is
> important regarding to F_SLEEP "Callers expecting ->lock() to return
> asynchronously will only use F_SETLK, not F_SETLKW; they will set
> FL_SLEEP if (and only if) the request is for a blocking lock.".
> If lockd does a lock request, it will then set args.wait to 1 if it
> was F_SETLKW [1].

Hmm, this sets args.block?

> The receiver will then create a blocking request [2]
> and set FL_SLEEP [3]; it does unset FL_SLEEP when args.wait (now as
> wait parameter) wasn't set. There is a case of [5] which unset wait
> again, but it seems we can end with FL_SLEEP there anyway.
>
> I think we have currently an issue here that we handle F_SETLK when
> F_SLEEP (in case of async lockd request) is handled as trylock which
> isn't right. Don't ask me why they are going over F_SLEEP and F_SETLK
> and not just using F_SETLKW to signal that it is a blocking request.
> So we actually have the F_SETLKW case but it's just signaled with
> F_SETLK + FL_SLEEP?

It seems to me that the vfs_lock_file() description and the
distinction it makes between F_SETLK and F_SETLKW makes sense in a
scenario when locking is implemented locally in the kernel, but not in
the context of dlm_controld, where all the locking decisions are made
in user-space: in the former scenario, F_SETLK requests can be decided
immediately without sleeping, but F_SETLKW requests may sleep. In the
dlm_controld scenario, locking requests can never be decided
immediately, and the requesting task will always sleep. So from the
point of view of lockd, any request to dlm_controld should probably be
treated as asynchronous.

This makes things a bit more ugly than I was hoping for.

Thanks,
Andreas

> - Alex
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/fs/locks.c?h=3Dv6.4-rc4#n2255
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/fs/lockd/clntproc.c?h=3Dv6.4-rc4#n186
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/fs/lockd/svclock.c?h=3Dv6.4-rc4#n501
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/fs/lockd/svclock.c?h=3Dv6.4-rc4#n240
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/fs/lockd/svclock.c?h=3Dv6.4-rc4#n535
> [5] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/fs/lockd/svclock.c?h=3Dv6.4-rc4#n489
>

