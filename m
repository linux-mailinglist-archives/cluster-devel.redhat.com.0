Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD94720FF7
	for <lists+cluster-devel@lfdr.de>; Sat,  3 Jun 2023 14:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685793787;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C3E99sHfhNlK6nmqTW9tQuHN2sdQl/d4gx9hwoK3KF4=;
	b=K0rAKTy+fWUdjnBReWKZVXSZo83UiqrNterD/62f2TY/7uOI3/dc+DsIaarBjJhnhPW0Pk
	EpTS2B+aPyk+pR2zxEmAzirUV9dgmcOaxPK9+mF4YNxgRLUwmWeFmmEI0HnxeazV5TE8mV
	1SWTzjExfRI4s8dqy8n1657E0Z/2Y0s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-O_C-RTL-PkWcH003iguxEw-1; Sat, 03 Jun 2023 08:03:03 -0400
X-MC-Unique: O_C-RTL-PkWcH003iguxEw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFCA93C025C1;
	Sat,  3 Jun 2023 12:03:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 403574A927E;
	Sat,  3 Jun 2023 12:03:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C83AB19465A3;
	Sat,  3 Jun 2023 12:03:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CFF4C1946595 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  3 Jun 2023 12:02:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D33ADC154D9; Sat,  3 Jun 2023 12:02:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBFE5C154D7
 for <cluster-devel@redhat.com>; Sat,  3 Jun 2023 12:02:45 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A76D11C05AA8
 for <cluster-devel@redhat.com>; Sat,  3 Jun 2023 12:02:45 +0000 (UTC)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-2ujcVOGyO9eT9PqLyxZUzw-1; Sat, 03 Jun 2023 08:02:44 -0400
X-MC-Unique: 2ujcVOGyO9eT9PqLyxZUzw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9745f301bcfso126316566b.0
 for <cluster-devel@redhat.com>; Sat, 03 Jun 2023 05:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685793763; x=1688385763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C3E99sHfhNlK6nmqTW9tQuHN2sdQl/d4gx9hwoK3KF4=;
 b=YkLU0M1n85nacs1pibi2K22tOtHBLNUT0MkapZSPZ1wcmjmUcXh72YWzd1QeGlresB
 XRcGYnreeH6EpiwHJEaTFXKyjgc46+vhprJAbF+9yonJq12Ri4vg5cS3ilMUYULKXawD
 OsTWpPM/LmXppQWgOc+DcU88qC0vJlDxVONkH/mQVFd4JE23WjAW0Ls1lxQvIx/mfFtB
 VY/3axIuGjrGevdjlkJp+cBniF9hRGuLQCkI3E2qQSiw3I+/MKYzPN/Ql2prafSHoc+X
 3v78jSTbyQDXpKUNb/RTWGfUUsPFD3qANCGUDAlHg6A53yYBZvszhwDGzEHEGsdsBXMt
 zK3w==
X-Gm-Message-State: AC+VfDx7HNbSsdeqdDzwgaLQgcBTraYQNaFfqEkLJoCtIfKiKP8O8dtr
 aE3LwsYNdNIgnvfo5yKUoyjZNIbyjI20b/MRDZBDgWY9KgTtMWhFotT8OiIyUJd3EK4bMDrBrin
 +pBgpn+RckpPiOYR/UHSDJBIotHUahUhLfwMeTa15iIRxbkNh
X-Received: by 2002:a17:907:3da1:b0:977:94fd:c690 with SMTP id
 he33-20020a1709073da100b0097794fdc690mr1733356ejc.17.1685793762897; 
 Sat, 03 Jun 2023 05:02:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6XV7/DT5LDj/H01n6XhqkODDD9EyefJ3Ym/cTjbb5Nk19ra6uTf6kagTor86CONg/bG0L8jsO4d8isLcr7oBg=
X-Received: by 2002:a17:907:3da1:b0:977:94fd:c690 with SMTP id
 he33-20020a1709073da100b0097794fdc690mr1733325ejc.17.1685793762480; Sat, 03
 Jun 2023 05:02:42 -0700 (PDT)
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
 <CAHc6FU4HU6oiYHBAYndp6wb0-LmkSRiAccjQE6t1Gf1PCnhFQQ@mail.gmail.com>
In-Reply-To: <CAHc6FU4HU6oiYHBAYndp6wb0-LmkSRiAccjQE6t1Gf1PCnhFQQ@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Sat, 3 Jun 2023 08:02:31 -0400
Message-ID: <CAK-6q+j_RZ+uySaVEmSfSHTDGRfM0LrbkxMvSuDfK2kjuYNDPw@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jun 3, 2023 at 6:03=E2=80=AFAM Andreas Gruenbacher <agruenba@redhat=
.com> wrote:
>
> On Thu, Jun 1, 2023 at 9:10=E2=80=AFPM Alexander Aring <aahringo@redhat.c=
om> wrote:
> > Hi,
> >
> > On Thu, Jun 1, 2023 at 1:11=E2=80=AFPM Andreas Gruenbacher <agruenba@re=
dhat.com> wrote:
> > >
> > > On Thu, Jun 1, 2023 at 6:28=E2=80=AFPM Alexander Aring <aahringo@redh=
at.com> wrote:
> > > > Hi,
> > > >
> > > > On Tue, May 30, 2023 at 1:40=E2=80=AFPM Andreas Gruenbacher <agruen=
ba@redhat.com> wrote:
> > > > >
> > > > > On Tue, May 30, 2023 at 4:08=E2=80=AFPM Alexander Aring <aahringo=
@redhat.com> wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On Tue, May 30, 2023 at 7:01=E2=80=AFAM Andreas Gruenbacher <ag=
ruenba@redhat.com> wrote:
> > > > > > >
> > > > > > > On Tue, May 30, 2023 at 12:19=E2=80=AFAM Alexander Aring <aah=
ringo@redhat.com> wrote:
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > On Thu, May 25, 2023 at 11:02=E2=80=AFAM Andreas Gruenbache=
r
> > > > > > > > <agruenba@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Wed, May 24, 2023 at 6:02=E2=80=AFPM Alexander Aring <=
aahringo@redhat.com> wrote:
> > > > > > > > > > This patch fixes a possible plock op collisions when us=
ing F_SETLKW lock
> > > > > > > > > > requests and fsid, number and owner are not enough to i=
dentify a result
> > > > > > > > > > for a pending request. The ltp testcases [0] and [1] ar=
e examples when
> > > > > > > > > > this is not enough in case of using classic posix locks=
 with threads and
> > > > > > > > > > open filedescriptor posix locks.
> > > > > > > > > >
> > > > > > > > > > The idea to fix the issue here is to place all lock req=
uest in order. In
> > > > > > > > > > case of non F_SETLKW lock request (indicated if wait is=
 set or not) the
> > > > > > > > > > lock requests are ordered inside the recv_list. If a re=
sult comes back
> > > > > > > > > > the right plock op can be found by the first plock_op i=
n recv_list which
> > > > > > > > > > has not info.wait set. This can be done only by non F_S=
ETLKW plock ops as
> > > > > > > > > > dlm_controld always reads a specific plock op (list_mov=
e_tail() from
> > > > > > > > > > send_list to recv_mlist) and write the result immediate=
ly back.
> > > > > > > > > >
> > > > > > > > > > This behaviour is for F_SETLKW not possible as multiple=
 waiters can be
> > > > > > > > > > get a result back in an random order. To avoid a collis=
ions in cases
> > > > > > > > > > like [0] or [1] this patch adds more fields to compare =
the plock
> > > > > > > > > > operations as the lock request is the same. This is als=
o being made in
> > > > > > > > > > NFS to find an result for an asynchronous F_SETLKW lock=
 request [2][3]. We
> > > > > > > > > > still can't find the exact lock request for a specific =
result if the
> > > > > > > > > > lock request is the same, but if this is the case we do=
n't care the
> > > > > > > > > > order how the identical lock requests get their result =
back to grant the
> > > > > > > > > > lock.
> > > > > > > > >
> > > > > > > > > When the recv_list contains multiple indistinguishable re=
quests, this
> > > > > > > > > can only be because they originated from multiple threads=
 of the same
> > > > > > > > > process. In that case, I agree that it doesn't matter whi=
ch of those
> > > > > > > > > requests we "complete" in dev_write() as long as we only =
complete one
> > > > > > > > > request. We do need to compare the additional request fie=
lds in
> > > > > > > > > dev_write() to find a suitable request, so that makes sen=
se as well.
> > > > > > > > > We need to compare all of the fields that identify a requ=
est (optype,
> > > > > > > > > ex, wait, pid, nodeid, fsid, number, start, end, owner) t=
o find the
> > > > > > > > > "right" request (or in case there is more than one identi=
cal request,
> > > > > > > > > a "suitable" request).
> > > > > > > > >
> > > > > > > >
> > > > > > > > In my "definition" why this works is as you said the "ident=
ical
> > > > > > > > request". There is a more deeper definition of "when is a r=
equest
> > > > > > > > identical" and in my opinion it is here as: "A request A is=
 identical
> > > > > > > > to request B when they get granted under the same 'time'" w=
hich is all
> > > > > > > > the fields you mentioned.
> > > > > > > >
> > > > > > > > Even with cancellation (F_SETLKW only) it does not matter w=
hich
> > > > > > > > "identical request" you cancel because the kernel and user
> > > > > > > > (dlm_controld) makes no relation between a lock request ins=
tance. You
> > > > > > > > need to have at least the same amount of "results" coming b=
ack from
> > > > > > > > user space as the amount you are waiting for a result for t=
he same
> > > > > > > > "identical request".
> > > > > > >
> > > > > > > That's not incorrect per se, but cancellations create an addi=
tional
> > > > > > > difficulty: they can either succeed or fail. To indicate that=
 a
> > > > > > > cancellation has succeeded, a new type of message can be intr=
oduced
> > > > > > > (say, "CANCELLED"), and it's obvious that a CANCELLED message=
 can only
> > > > > > > belong to a locking request that is being cancelled. When can=
celling a
> > > > > > > locking request fails, the kernel will see a "locking request=
 granted"
> > > > > > > message though, and when multiple identical locking requests =
are
> > > > > > > queued and only some of them have been cancelled, it won't be=
 obvious
> > > > > > > which locking request a "locking request granted" message sho=
uld be
> > > > > > > assigned to anymore. You really don't want to mix things up i=
n that
> > > > > > > case.
> > > > > > >
> > > > > > > This complication makes it a whole lot more difficult to reas=
on about
> > > > > > > the correctness of the code. All that complexity is avoidable=
 by
> > > > > > > sticking with a fixed mapping of requests and replies (i.e., =
a unique
> > > > > > > request identifier).
> > > > > > >
> > > > > > > To put it differently, you can shoot yourself in the foot and=
 still
> > > > > > > hop along on the other leg, but it may not be the best of all=
 possible
> > > > > > > ideas.
> > > > > > >
> > > > > >
> > > > > > It makes things more complicated, I agree and the reason why th=
is
> > > > > > works now is because there are a lot of "dependencies". I would=
 love
> > > > > > to have an unique identifier to make it possible that we can fo=
llow an
> > > > > > instance handle of the original lock request.
> > > > > >
> > > > > > * an unique identifier which also works with the async lock req=
uest of
> > > > > > lockd case.
> > > > >
> > > > > What's the lockd case you're referring to here, and why is it rel=
evant
> > > > > for the problem at hand?
> > > >
> > > > just mentioned that we need a solution which also works for the
> > > > asynchronous lock request (F_SETLK, F_SETLKW) case, there is only o=
ne
> > > > user lockd. [0] DLM plock handling implements the behaviour mention=
ed
> > > > at [0] but lm_grant() callback can also return negative values and
> > > > signals that the lock request was cancelled (on nfs layer) and then
> > > > need to tell it DLM. This however is not supported as we have a lac=
k
> > > > of cancellation.
> > >
> > > Ouch, that's a bit messy. But if the vfs_lock_file() description is
> > > accurate, then only F_SETLK requests arriving via lockd can be
> > > asynchronous, and F_SETLKW requests never are asynchronous. And we
> > > only need to cancel F_SETLKW requests. It follows that we only ever
> > > need to cancel synchronous requests.
> > >
> >
> > I looked into the code and I think the second sentence of [0] is
> > important regarding to F_SLEEP "Callers expecting ->lock() to return
> > asynchronously will only use F_SETLK, not F_SETLKW; they will set
> > FL_SLEEP if (and only if) the request is for a blocking lock.".
> > If lockd does a lock request, it will then set args.wait to 1 if it
> > was F_SETLKW [1].
>
> Hmm, this sets args.block?
>

You are right but args.block gets passed as the wait parameter to nlmsvc_lo=
ck().

An example user:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/=
lockd/svc4proc.c#n158

> > The receiver will then create a blocking request [2]
> > and set FL_SLEEP [3]; it does unset FL_SLEEP when args.wait (now as
> > wait parameter) wasn't set. There is a case of [5] which unset wait
> > again, but it seems we can end with FL_SLEEP there anyway.
> >
> > I think we have currently an issue here that we handle F_SETLK when
> > F_SLEEP (in case of async lockd request) is handled as trylock which
> > isn't right. Don't ask me why they are going over F_SLEEP and F_SETLK
> > and not just using F_SETLKW to signal that it is a blocking request.
> > So we actually have the F_SETLKW case but it's just signaled with
> > F_SETLK + FL_SLEEP?
>
> It seems to me that the vfs_lock_file() description and the
> distinction it makes between F_SETLK and F_SETLKW makes sense in a
> scenario when locking is implemented locally in the kernel, but not in
> the context of dlm_controld, where all the locking decisions are made
> in user-space: in the former scenario, F_SETLK requests can be decided
> immediately without sleeping, but F_SETLKW requests may sleep. In the
> dlm_controld scenario, locking requests can never be decided
> immediately, and the requesting task will always sleep. So from the
> point of view of lockd, any request to dlm_controld should probably be
> treated as asynchronous.
>
> This makes things a bit more ugly than I was hoping for.
>

I think they describe a "blocking" request as what you describe with
F_SETLKW. Everything is asynchronous, but F_SETLKW is the "blocking
request" by not actually meaning the lock() callback blocks in the
sense of wait_event(). There is however a semantic difference between
F_SETLK and F_SETLKW in sense when the asynchronous result comes back
and what the result is.

I looked more into this and a "somewhat" recent commit confuses me
more. It's 40595cdc93ed ("nfs: block notification on fs with its own
->lock") [0] and from what I understood, they signaled before F_SETLKW
with FL_SLEEP set, but they realized that mostly everybody does not
follow this API, so they switch to only F_SETLK and assume that the
most nfs clients do polling for a look. If you can't use F_SETLKW,
then the alternative could be polling the lock with F_SETLK, which
isn't a good design to use on DLM. In the commit message it's also
mentioned that they may bring back the old behaviour.

I think the comment in [1] is not up to date anymore.

There are also only two users of "fl_lmops" evaluation, which is fcntl
core and DLM, fuse will reject any lock request when "fl_lmops" is
set.

To be honest I have no idea how to proceed here, probably just look in
fcntl core and do what they do. I also tested dlm/next with a nfsv3
server on gfs2 by running "stress-ng --fcntl 16", I see some worried
error messages on the kernel log coming up.

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/fs/lockd/svclock.c?h=3Dv6.4-rc4&id=3D40595cdc93edf4110c0f0c0b06f8d82008f=
23929
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/locks.c?h=3Dv6.4-rc4#n2255

