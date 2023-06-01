Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9C771F2A8
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Jun 2023 21:10:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685646609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Vjd8ioINDjA1EPGsXxWeolFWL3diqjoeuqE82zMbAoo=;
	b=SIdct01VAnjbXDaHBuuvTa6DlifqX2xoahnRbieU4in9WjZVG3Vew8kmlWLu/Ok9vvs2d0
	zI9oL9HnffDW5aHxxtDVgy3tga/QYUjRCDN6dqTCAqGa/r5cb864Ya0M5Cpr0tF0H7UWow
	w2V672bBBDOY5YKEj5WJL/Toys7GM3s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-4IJ49-NuPli41MNOgsapuA-1; Thu, 01 Jun 2023 15:10:08 -0400
X-MC-Unique: 4IJ49-NuPli41MNOgsapuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D15B380673A;
	Thu,  1 Jun 2023 19:10:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BAB3112132C;
	Thu,  1 Jun 2023 19:10:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0A90A19465A2;
	Thu,  1 Jun 2023 19:10:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 162581946595 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Jun 2023 19:10:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EE1C3C154DB; Thu,  1 Jun 2023 19:10:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E554CC154D7
 for <cluster-devel@redhat.com>; Thu,  1 Jun 2023 19:10:04 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A427980231B
 for <cluster-devel@redhat.com>; Thu,  1 Jun 2023 19:10:04 +0000 (UTC)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-L9XydRg8PKO_hHW6gWZCIA-1; Thu, 01 Jun 2023 15:10:03 -0400
X-MC-Unique: L9XydRg8PKO_hHW6gWZCIA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-96f83b44939so84710166b.1
 for <cluster-devel@redhat.com>; Thu, 01 Jun 2023 12:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685646602; x=1688238602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vjd8ioINDjA1EPGsXxWeolFWL3diqjoeuqE82zMbAoo=;
 b=NuUX0w57PwucIq5ilpi5VPX1xRS5zmNPRfJu81g5LAK7DeDhIQQdbsqUCoPmxwAltz
 LR8DanwDDHUMrtw0FPuuwZ43mIht124HtCuxrlBqJleuM3VXq32bjTrgCRYHJ+f2iVu/
 yZ56tGfhLjTdFVA4DIUjKDApzDQ2eH8I434gMELG+g6eQiv/GsBy8IdsRtMW49LJJnBh
 KOzklvW31dLOma8ko5zabnY2gtHNyoOagLIRmRDbm5Z/o7fL/0HFiELZLmEKHvDkjmn2
 HP52q43uBYSlqdHfoZ1D4sRZdOSkzDLNJ0LSu8z8xF4KRFS+vL971PWvrLF+G0GTCng8
 YS3A==
X-Gm-Message-State: AC+VfDxafF5yI6YkvdlzEmPKpqs3p3AcZvZ6fVpM+gl0BCORx4LoRpH8
 xBZDgAjuh+877sWCz34u0Y6sHbcSecnAdZ013uk42CwwXqQybEUPj5dHF3y6FokpLeuZAnznvr3
 S37st/OBD3XBkrTU02DAJBTx7fiKNInvx5BNoCA==
X-Received: by 2002:aa7:c249:0:b0:510:f44c:4b71 with SMTP id
 y9-20020aa7c249000000b00510f44c4b71mr513437edo.27.1685646602060; 
 Thu, 01 Jun 2023 12:10:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Ul6p2kjTn2x0gO589Mzspbt+ulNNkhzz1vv3b3xQ74tnvOMZVih4b+zCloCS6Nx7lAVad0CD+MG1AsrF8Kjw=
X-Received: by 2002:aa7:c249:0:b0:510:f44c:4b71 with SMTP id
 y9-20020aa7c249000000b00510f44c4b71mr513429edo.27.1685646601753; Thu, 01 Jun
 2023 12:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230524160204.1042858-1-aahringo@redhat.com>
 <CAHc6FU7vaQmbwzL7Memu9YpsqXM9Ay4Mj52pDpkG6UdXw6hKVg@mail.gmail.com>
 <CAK-6q+gvSO-MRMUPrGVzkO+ki48itzTjnaUC6t_4a+jUs2xV7w@mail.gmail.com>
 <CAHc6FU4BCSFk+St-cndUr24Gb1g1K1DEAiKkMy-Z-SxLjhPM=w@mail.gmail.com>
 <CAK-6q+i8z6WEf5fEGgbcbMi6ffB12UnegPXxjAVJ7-Gxe4S=Bw@mail.gmail.com>
 <CAHc6FU4Y18NUL_D0mtLpY41pNXqdqK6ykPJSTGhg5ou=wQij2w@mail.gmail.com>
 <CAK-6q+i5-fUX=fYASjn4BbFKWYgTQ9DFP3cCYeQxJDuZ4pkCxw@mail.gmail.com>
 <CAHc6FU5S-BO+8dJEcrzu8pQnHucC9kM7=ns6ThSze8zxqSXjpw@mail.gmail.com>
In-Reply-To: <CAHc6FU5S-BO+8dJEcrzu8pQnHucC9kM7=ns6ThSze8zxqSXjpw@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 1 Jun 2023 15:09:50 -0400
Message-ID: <CAK-6q+ibn8MGgmTYHQz8pXtw2sbwaQ=fK-fGG0aYAbY36UPFuA@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

On Thu, Jun 1, 2023 at 1:11=E2=80=AFPM Andreas Gruenbacher <agruenba@redhat=
.com> wrote:
>
> On Thu, Jun 1, 2023 at 6:28=E2=80=AFPM Alexander Aring <aahringo@redhat.c=
om> wrote:
> > Hi,
> >
> > On Tue, May 30, 2023 at 1:40=E2=80=AFPM Andreas Gruenbacher <agruenba@r=
edhat.com> wrote:
> > >
> > > On Tue, May 30, 2023 at 4:08=E2=80=AFPM Alexander Aring <aahringo@red=
hat.com> wrote:
> > > > Hi,
> > > >
> > > > On Tue, May 30, 2023 at 7:01=E2=80=AFAM Andreas Gruenbacher <agruen=
ba@redhat.com> wrote:
> > > > >
> > > > > On Tue, May 30, 2023 at 12:19=E2=80=AFAM Alexander Aring <aahring=
o@redhat.com> wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On Thu, May 25, 2023 at 11:02=E2=80=AFAM Andreas Gruenbacher
> > > > > > <agruenba@redhat.com> wrote:
> > > > > > >
> > > > > > > On Wed, May 24, 2023 at 6:02=E2=80=AFPM Alexander Aring <aahr=
ingo@redhat.com> wrote:
> > > > > > > > This patch fixes a possible plock op collisions when using =
F_SETLKW lock
> > > > > > > > requests and fsid, number and owner are not enough to ident=
ify a result
> > > > > > > > for a pending request. The ltp testcases [0] and [1] are ex=
amples when
> > > > > > > > this is not enough in case of using classic posix locks wit=
h threads and
> > > > > > > > open filedescriptor posix locks.
> > > > > > > >
> > > > > > > > The idea to fix the issue here is to place all lock request=
 in order. In
> > > > > > > > case of non F_SETLKW lock request (indicated if wait is set=
 or not) the
> > > > > > > > lock requests are ordered inside the recv_list. If a result=
 comes back
> > > > > > > > the right plock op can be found by the first plock_op in re=
cv_list which
> > > > > > > > has not info.wait set. This can be done only by non F_SETLK=
W plock ops as
> > > > > > > > dlm_controld always reads a specific plock op (list_move_ta=
il() from
> > > > > > > > send_list to recv_mlist) and write the result immediately b=
ack.
> > > > > > > >
> > > > > > > > This behaviour is for F_SETLKW not possible as multiple wai=
ters can be
> > > > > > > > get a result back in an random order. To avoid a collisions=
 in cases
> > > > > > > > like [0] or [1] this patch adds more fields to compare the =
plock
> > > > > > > > operations as the lock request is the same. This is also be=
ing made in
> > > > > > > > NFS to find an result for an asynchronous F_SETLKW lock req=
uest [2][3]. We
> > > > > > > > still can't find the exact lock request for a specific resu=
lt if the
> > > > > > > > lock request is the same, but if this is the case we don't =
care the
> > > > > > > > order how the identical lock requests get their result back=
 to grant the
> > > > > > > > lock.
> > > > > > >
> > > > > > > When the recv_list contains multiple indistinguishable reques=
ts, this
> > > > > > > can only be because they originated from multiple threads of =
the same
> > > > > > > process. In that case, I agree that it doesn't matter which o=
f those
> > > > > > > requests we "complete" in dev_write() as long as we only comp=
lete one
> > > > > > > request. We do need to compare the additional request fields =
in
> > > > > > > dev_write() to find a suitable request, so that makes sense a=
s well.
> > > > > > > We need to compare all of the fields that identify a request =
(optype,
> > > > > > > ex, wait, pid, nodeid, fsid, number, start, end, owner) to fi=
nd the
> > > > > > > "right" request (or in case there is more than one identical =
request,
> > > > > > > a "suitable" request).
> > > > > > >
> > > > > >
> > > > > > In my "definition" why this works is as you said the "identical
> > > > > > request". There is a more deeper definition of "when is a reque=
st
> > > > > > identical" and in my opinion it is here as: "A request A is ide=
ntical
> > > > > > to request B when they get granted under the same 'time'" which=
 is all
> > > > > > the fields you mentioned.
> > > > > >
> > > > > > Even with cancellation (F_SETLKW only) it does not matter which
> > > > > > "identical request" you cancel because the kernel and user
> > > > > > (dlm_controld) makes no relation between a lock request instanc=
e. You
> > > > > > need to have at least the same amount of "results" coming back =
from
> > > > > > user space as the amount you are waiting for a result for the s=
ame
> > > > > > "identical request".
> > > > >
> > > > > That's not incorrect per se, but cancellations create an addition=
al
> > > > > difficulty: they can either succeed or fail. To indicate that a
> > > > > cancellation has succeeded, a new type of message can be introduc=
ed
> > > > > (say, "CANCELLED"), and it's obvious that a CANCELLED message can=
 only
> > > > > belong to a locking request that is being cancelled. When cancell=
ing a
> > > > > locking request fails, the kernel will see a "locking request gra=
nted"
> > > > > message though, and when multiple identical locking requests are
> > > > > queued and only some of them have been cancelled, it won't be obv=
ious
> > > > > which locking request a "locking request granted" message should =
be
> > > > > assigned to anymore. You really don't want to mix things up in th=
at
> > > > > case.
> > > > >
> > > > > This complication makes it a whole lot more difficult to reason a=
bout
> > > > > the correctness of the code. All that complexity is avoidable by
> > > > > sticking with a fixed mapping of requests and replies (i.e., a un=
ique
> > > > > request identifier).
> > > > >
> > > > > To put it differently, you can shoot yourself in the foot and sti=
ll
> > > > > hop along on the other leg, but it may not be the best of all pos=
sible
> > > > > ideas.
> > > > >
> > > >
> > > > It makes things more complicated, I agree and the reason why this
> > > > works now is because there are a lot of "dependencies". I would lov=
e
> > > > to have an unique identifier to make it possible that we can follow=
 an
> > > > instance handle of the original lock request.
> > > >
> > > > * an unique identifier which also works with the async lock request=
 of
> > > > lockd case.
> > >
> > > What's the lockd case you're referring to here, and why is it relevan=
t
> > > for the problem at hand?
> >
> > just mentioned that we need a solution which also works for the
> > asynchronous lock request (F_SETLK, F_SETLKW) case, there is only one
> > user lockd. [0] DLM plock handling implements the behaviour mentioned
> > at [0] but lm_grant() callback can also return negative values and
> > signals that the lock request was cancelled (on nfs layer) and then
> > need to tell it DLM. This however is not supported as we have a lack
> > of cancellation.
>
> Ouch, that's a bit messy. But if the vfs_lock_file() description is
> accurate, then only F_SETLK requests arriving via lockd can be
> asynchronous, and F_SETLKW requests never are asynchronous. And we
> only need to cancel F_SETLKW requests. It follows that we only ever
> need to cancel synchronous requests.
>

I looked into the code and I think the second sentence of [0] is
important regarding to F_SLEEP "Callers expecting ->lock() to return
asynchronously will only use F_SETLK, not F_SETLKW; they will set
FL_SLEEP if (and only if) the request is for a blocking lock.".
If lockd does a lock request, it will then set args.wait to 1 if it
was F_SETLKW [1]. The receiver will then create a blocking request [2]
and set FL_SLEEP [3]; it does unset FL_SLEEP when args.wait (now as
wait parameter) wasn't set. There is a case of [5] which unset wait
again, but it seems we can end with FL_SLEEP there anyway.

I think we have currently an issue here that we handle F_SETLK when
F_SLEEP (in case of async lockd request) is handled as trylock which
isn't right. Don't ask me why they are going over F_SLEEP and F_SETLK
and not just using F_SETLKW to signal that it is a blocking request.
So we actually have the F_SETLKW case but it's just signaled with
F_SETLK + FL_SLEEP?

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/locks.c?h=3Dv6.4-rc4#n2255
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/lockd/clntproc.c?h=3Dv6.4-rc4#n186
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/lockd/svclock.c?h=3Dv6.4-rc4#n501
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/lockd/svclock.c?h=3Dv6.4-rc4#n240
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/lockd/svclock.c?h=3Dv6.4-rc4#n535
[5] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/lockd/svclock.c?h=3Dv6.4-rc4#n489

