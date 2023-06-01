Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 502DB71F05B
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Jun 2023 19:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685639479;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v8HY4z673x9a3/InZ+bsdvSB0Odk2lcvwHGXF60TyWU=;
	b=eFLZ2PcLJBi4iO9ajSlzJIifXuoAvTxVK9He3qYWQ/Aq9n4B696bHzxFFvC9ONUJ/gIIjI
	eNIwuYQyy5HxlpWiDU75BxbLsOEMnVP1i7Nrp/xfZcE9JJA426bK+sfLKYXjASYcPFngud
	rZTs/exYLq5i0snX6IQLFM6KQkjxhOs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-O8JyjmHROsSVHao7krTGHw-1; Thu, 01 Jun 2023 13:11:15 -0400
X-MC-Unique: O8JyjmHROsSVHao7krTGHw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9327B101A53B;
	Thu,  1 Jun 2023 17:11:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DA198162;
	Thu,  1 Jun 2023 17:11:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1EC7819465A2;
	Thu,  1 Jun 2023 17:11:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9862D194658C for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Jun 2023 17:11:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 806C340CFD47; Thu,  1 Jun 2023 17:11:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7544E40CFD46
 for <cluster-devel@redhat.com>; Thu,  1 Jun 2023 17:11:12 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58048101A53B
 for <cluster-devel@redhat.com>; Thu,  1 Jun 2023 17:11:12 +0000 (UTC)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-04SIJppDMVyonWvPfIbu0Q-1; Thu, 01 Jun 2023 13:11:11 -0400
X-MC-Unique: 04SIJppDMVyonWvPfIbu0Q-1
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-53fa00ed93dso1013042a12.3
 for <cluster-devel@redhat.com>; Thu, 01 Jun 2023 10:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685639470; x=1688231470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v8HY4z673x9a3/InZ+bsdvSB0Odk2lcvwHGXF60TyWU=;
 b=ePOuAXgmNBEcM5U4hOnQDQwr9PQu7JbteQpO+qBHIPdXB5thHk5Ke3SHoclBPATeTf
 cPbh0eXOca9AjK9ZCiO7CpcdZrIpqiX2DhLb6DwbuIe3V+LWOJbwKQHYUFJEElvm4pL+
 JZn3TTRHxdhxeLuagDfok6wnmbScxPSUGvXZSE0T/tEcIff46s+Op641ioQcUcm+svPQ
 cWHFlUqux/Iw/PvMrzZv+EVAtrPBnXaKJqYuPeMBthceE3HVhxD7zDfYzpHjw4/K+07U
 7rDZlVNCmRdSZJiXs78eTx41KuaywTAEwMZcLx3bWsqfDXicOYmOQPLAHQZrn/7Sjw4x
 u2vg==
X-Gm-Message-State: AC+VfDy6s8eQ3iVdOc43xwr2+ZYViFccpwEm09yrFl3Mk41Az/+vnqYR
 QTX4zQEMjbteSrvgjcapqcAtaBLFFYAfrBfkj0JeGF2KONf5DaaA52UWaTZxbk4eEr24S3Q4XSE
 2Qmvi8CingpvQ/HXl7If7Tr9LawSlP/Z4JH2e1Q==
X-Received: by 2002:a17:903:1cf:b0:1ad:c736:2090 with SMTP id
 e15-20020a17090301cf00b001adc7362090mr146571plh.3.1685639470046; 
 Thu, 01 Jun 2023 10:11:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5BUgTkN7zJXRHZpxy6ufmqzTuHF4LgcgX+VhLp/15IqhR8Edxzu8TgQDTzhdJqJf5zVtvG4nM034r1KvES/Yg=
X-Received: by 2002:a17:903:1cf:b0:1ad:c736:2090 with SMTP id
 e15-20020a17090301cf00b001adc7362090mr146545plh.3.1685639469687; Thu, 01 Jun
 2023 10:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230524160204.1042858-1-aahringo@redhat.com>
 <CAHc6FU7vaQmbwzL7Memu9YpsqXM9Ay4Mj52pDpkG6UdXw6hKVg@mail.gmail.com>
 <CAK-6q+gvSO-MRMUPrGVzkO+ki48itzTjnaUC6t_4a+jUs2xV7w@mail.gmail.com>
 <CAHc6FU4BCSFk+St-cndUr24Gb1g1K1DEAiKkMy-Z-SxLjhPM=w@mail.gmail.com>
 <CAK-6q+i8z6WEf5fEGgbcbMi6ffB12UnegPXxjAVJ7-Gxe4S=Bw@mail.gmail.com>
 <CAHc6FU4Y18NUL_D0mtLpY41pNXqdqK6ykPJSTGhg5ou=wQij2w@mail.gmail.com>
 <CAK-6q+i5-fUX=fYASjn4BbFKWYgTQ9DFP3cCYeQxJDuZ4pkCxw@mail.gmail.com>
In-Reply-To: <CAK-6q+i5-fUX=fYASjn4BbFKWYgTQ9DFP3cCYeQxJDuZ4pkCxw@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 1 Jun 2023 19:10:57 +0200
Message-ID: <CAHc6FU5S-BO+8dJEcrzu8pQnHucC9kM7=ns6ThSze8zxqSXjpw@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 6:28=E2=80=AFPM Alexander Aring <aahringo@redhat.com=
> wrote:
> Hi,
>
> On Tue, May 30, 2023 at 1:40=E2=80=AFPM Andreas Gruenbacher <agruenba@red=
hat.com> wrote:
> >
> > On Tue, May 30, 2023 at 4:08=E2=80=AFPM Alexander Aring <aahringo@redha=
t.com> wrote:
> > > Hi,
> > >
> > > On Tue, May 30, 2023 at 7:01=E2=80=AFAM Andreas Gruenbacher <agruenba=
@redhat.com> wrote:
> > > >
> > > > On Tue, May 30, 2023 at 12:19=E2=80=AFAM Alexander Aring <aahringo@=
redhat.com> wrote:
> > > > > Hi,
> > > > >
> > > > > On Thu, May 25, 2023 at 11:02=E2=80=AFAM Andreas Gruenbacher
> > > > > <agruenba@redhat.com> wrote:
> > > > > >
> > > > > > On Wed, May 24, 2023 at 6:02=E2=80=AFPM Alexander Aring <aahrin=
go@redhat.com> wrote:
> > > > > > > This patch fixes a possible plock op collisions when using F_=
SETLKW lock
> > > > > > > requests and fsid, number and owner are not enough to identif=
y a result
> > > > > > > for a pending request. The ltp testcases [0] and [1] are exam=
ples when
> > > > > > > this is not enough in case of using classic posix locks with =
threads and
> > > > > > > open filedescriptor posix locks.
> > > > > > >
> > > > > > > The idea to fix the issue here is to place all lock request i=
n order. In
> > > > > > > case of non F_SETLKW lock request (indicated if wait is set o=
r not) the
> > > > > > > lock requests are ordered inside the recv_list. If a result c=
omes back
> > > > > > > the right plock op can be found by the first plock_op in recv=
_list which
> > > > > > > has not info.wait set. This can be done only by non F_SETLKW =
plock ops as
> > > > > > > dlm_controld always reads a specific plock op (list_move_tail=
() from
> > > > > > > send_list to recv_mlist) and write the result immediately bac=
k.
> > > > > > >
> > > > > > > This behaviour is for F_SETLKW not possible as multiple waite=
rs can be
> > > > > > > get a result back in an random order. To avoid a collisions i=
n cases
> > > > > > > like [0] or [1] this patch adds more fields to compare the pl=
ock
> > > > > > > operations as the lock request is the same. This is also bein=
g made in
> > > > > > > NFS to find an result for an asynchronous F_SETLKW lock reque=
st [2][3]. We
> > > > > > > still can't find the exact lock request for a specific result=
 if the
> > > > > > > lock request is the same, but if this is the case we don't ca=
re the
> > > > > > > order how the identical lock requests get their result back t=
o grant the
> > > > > > > lock.
> > > > > >
> > > > > > When the recv_list contains multiple indistinguishable requests=
, this
> > > > > > can only be because they originated from multiple threads of th=
e same
> > > > > > process. In that case, I agree that it doesn't matter which of =
those
> > > > > > requests we "complete" in dev_write() as long as we only comple=
te one
> > > > > > request. We do need to compare the additional request fields in
> > > > > > dev_write() to find a suitable request, so that makes sense as =
well.
> > > > > > We need to compare all of the fields that identify a request (o=
ptype,
> > > > > > ex, wait, pid, nodeid, fsid, number, start, end, owner) to find=
 the
> > > > > > "right" request (or in case there is more than one identical re=
quest,
> > > > > > a "suitable" request).
> > > > > >
> > > > >
> > > > > In my "definition" why this works is as you said the "identical
> > > > > request". There is a more deeper definition of "when is a request
> > > > > identical" and in my opinion it is here as: "A request A is ident=
ical
> > > > > to request B when they get granted under the same 'time'" which i=
s all
> > > > > the fields you mentioned.
> > > > >
> > > > > Even with cancellation (F_SETLKW only) it does not matter which
> > > > > "identical request" you cancel because the kernel and user
> > > > > (dlm_controld) makes no relation between a lock request instance.=
 You
> > > > > need to have at least the same amount of "results" coming back fr=
om
> > > > > user space as the amount you are waiting for a result for the sam=
e
> > > > > "identical request".
> > > >
> > > > That's not incorrect per se, but cancellations create an additional
> > > > difficulty: they can either succeed or fail. To indicate that a
> > > > cancellation has succeeded, a new type of message can be introduced
> > > > (say, "CANCELLED"), and it's obvious that a CANCELLED message can o=
nly
> > > > belong to a locking request that is being cancelled. When cancellin=
g a
> > > > locking request fails, the kernel will see a "locking request grant=
ed"
> > > > message though, and when multiple identical locking requests are
> > > > queued and only some of them have been cancelled, it won't be obvio=
us
> > > > which locking request a "locking request granted" message should be
> > > > assigned to anymore. You really don't want to mix things up in that
> > > > case.
> > > >
> > > > This complication makes it a whole lot more difficult to reason abo=
ut
> > > > the correctness of the code. All that complexity is avoidable by
> > > > sticking with a fixed mapping of requests and replies (i.e., a uniq=
ue
> > > > request identifier).
> > > >
> > > > To put it differently, you can shoot yourself in the foot and still
> > > > hop along on the other leg, but it may not be the best of all possi=
ble
> > > > ideas.
> > > >
> > >
> > > It makes things more complicated, I agree and the reason why this
> > > works now is because there are a lot of "dependencies". I would love
> > > to have an unique identifier to make it possible that we can follow a=
n
> > > instance handle of the original lock request.
> > >
> > > * an unique identifier which also works with the async lock request o=
f
> > > lockd case.
> >
> > What's the lockd case you're referring to here, and why is it relevant
> > for the problem at hand?
>
> just mentioned that we need a solution which also works for the
> asynchronous lock request (F_SETLK, F_SETLKW) case, there is only one
> user lockd. [0] DLM plock handling implements the behaviour mentioned
> at [0] but lm_grant() callback can also return negative values and
> signals that the lock request was cancelled (on nfs layer) and then
> need to tell it DLM. This however is not supported as we have a lack
> of cancellation.

Ouch, that's a bit messy. But if the vfs_lock_file() description is
accurate, then only F_SETLK requests arriving via lockd can be
asynchronous, and F_SETLKW requests never are asynchronous. And we
only need to cancel F_SETLKW requests. It follows that we only ever
need to cancel synchronous requests.

Andreas

> So far I don't see any issues with the current solution which this
> patch is showing and the async lock request case.
>
> - Alex
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/fs/locks.c?h=3Dv6.4-rc4#n2255
>

