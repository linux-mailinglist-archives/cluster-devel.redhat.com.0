Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ECA71EEF3
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Jun 2023 18:28:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685636916;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SCl+syLrlgp+WL4FL8SAAChvmVC8U+rW6rWS8Fs+F2c=;
	b=EWQ2+8vkn9Wk4uKHxRN0CsmnLdqaHTTNRubHf/H9fYFFJK0BtW5B5MTKgFfjLPSfxb4ADG
	rSFzPfvOzm0kdTZDftQwyYKuL8zkjvqDWFA+rtGCLifcU05X9G4XCbyQOJe2A1MeZolMgw
	OBcSdqgFwEGiwXr4kckN7jzQqwbbIfc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-612WJeQPO0SSUP0HvgRqgA-1; Thu, 01 Jun 2023 12:28:32 -0400
X-MC-Unique: 612WJeQPO0SSUP0HvgRqgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7558C85A5BA;
	Thu,  1 Jun 2023 16:28:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 571D2202696C;
	Thu,  1 Jun 2023 16:28:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 23FD819465A2;
	Thu,  1 Jun 2023 16:28:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0262D194658C for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Jun 2023 16:28:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A23909E60; Thu,  1 Jun 2023 16:28:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ACD59E72
 for <cluster-devel@redhat.com>; Thu,  1 Jun 2023 16:28:29 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CFD2800141
 for <cluster-devel@redhat.com>; Thu,  1 Jun 2023 16:28:29 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-AwVPG3XHMRupQuB8zEdX_Q-1; Thu, 01 Jun 2023 12:28:28 -0400
X-MC-Unique: AwVPG3XHMRupQuB8zEdX_Q-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a355c9028so66792566b.3
 for <cluster-devel@redhat.com>; Thu, 01 Jun 2023 09:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685636907; x=1688228907;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SCl+syLrlgp+WL4FL8SAAChvmVC8U+rW6rWS8Fs+F2c=;
 b=JSU7WQcUI0jK/7Z3gkAa0iJYF65jkSU9lgGeQ5EDNLlRxtd9QTmPm8wU9/4K90IN32
 g8IXdOtgsJtIPAnO50jqzzM4LLxjKfAaeFDrInjUp2J99NC2ndOC09IHo2JdZ191YB5+
 lgKYoHe8DOrVxn6BWAkQOFIULicwkXjaHMtDvjNM5MM8sXYGn2Wbv3EPNaBxEX7dw8RT
 HYnXjifefjTHN8eKCUrNbsBi920+0dsMXJf1VxpJF1DfUFU0MQaOcA+2O2LRjAzDhC2/
 ZA0Hqh+6CsIZ42iceUT6M/Kg/W73FIKwu0B62npd5kCpEWUGL2Tk1ZmgHkpYrZnFBvFf
 wMgw==
X-Gm-Message-State: AC+VfDwZ1306vXQddEUI4uEYlYE80zy+HGlN8M2qyrQtcGwKU7y5CzgM
 /etsMtSn4Hmic3lgDh6op1guY2kItas69ly9mS8Nz+VubeMi/oWjH3SAIZmotBMy6JK5zrAHc+o
 Uq1PwITPAUdWcG3tDAh1ZiQwvLdx2HodpvHYQmEV6qqZS1Sdq
X-Received: by 2002:a05:6402:28d:b0:514:c43e:3881 with SMTP id
 l13-20020a056402028d00b00514c43e3881mr268605edv.35.1685636906888; 
 Thu, 01 Jun 2023 09:28:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5eth36gdx5ldU2XGsAm8V1NGZFPlyvGFxJhp+RfwayRqysEISZTuMjCBlyFUWjkUxEZxoNxsH2FMejuS7yJdE=
X-Received: by 2002:a05:6402:28d:b0:514:c43e:3881 with SMTP id
 l13-20020a056402028d00b00514c43e3881mr268585edv.35.1685636906571; Thu, 01 Jun
 2023 09:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230524160204.1042858-1-aahringo@redhat.com>
 <CAHc6FU7vaQmbwzL7Memu9YpsqXM9Ay4Mj52pDpkG6UdXw6hKVg@mail.gmail.com>
 <CAK-6q+gvSO-MRMUPrGVzkO+ki48itzTjnaUC6t_4a+jUs2xV7w@mail.gmail.com>
 <CAHc6FU4BCSFk+St-cndUr24Gb1g1K1DEAiKkMy-Z-SxLjhPM=w@mail.gmail.com>
 <CAK-6q+i8z6WEf5fEGgbcbMi6ffB12UnegPXxjAVJ7-Gxe4S=Bw@mail.gmail.com>
 <CAHc6FU4Y18NUL_D0mtLpY41pNXqdqK6ykPJSTGhg5ou=wQij2w@mail.gmail.com>
In-Reply-To: <CAHc6FU4Y18NUL_D0mtLpY41pNXqdqK6ykPJSTGhg5ou=wQij2w@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 1 Jun 2023 12:28:15 -0400
Message-ID: <CAK-6q+i5-fUX=fYASjn4BbFKWYgTQ9DFP3cCYeQxJDuZ4pkCxw@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Hi,


On Tue, May 30, 2023 at 1:40=E2=80=AFPM Andreas Gruenbacher <agruenba@redha=
t.com> wrote:
>
> On Tue, May 30, 2023 at 4:08=E2=80=AFPM Alexander Aring <aahringo@redhat.=
com> wrote:
> > Hi,
> >
> > On Tue, May 30, 2023 at 7:01=E2=80=AFAM Andreas Gruenbacher <agruenba@r=
edhat.com> wrote:
> > >
> > > On Tue, May 30, 2023 at 12:19=E2=80=AFAM Alexander Aring <aahringo@re=
dhat.com> wrote:
> > > > Hi,
> > > >
> > > > On Thu, May 25, 2023 at 11:02=E2=80=AFAM Andreas Gruenbacher
> > > > <agruenba@redhat.com> wrote:
> > > > >
> > > > > On Wed, May 24, 2023 at 6:02=E2=80=AFPM Alexander Aring <aahringo=
@redhat.com> wrote:
> > > > > > This patch fixes a possible plock op collisions when using F_SE=
TLKW lock
> > > > > > requests and fsid, number and owner are not enough to identify =
a result
> > > > > > for a pending request. The ltp testcases [0] and [1] are exampl=
es when
> > > > > > this is not enough in case of using classic posix locks with th=
reads and
> > > > > > open filedescriptor posix locks.
> > > > > >
> > > > > > The idea to fix the issue here is to place all lock request in =
order. In
> > > > > > case of non F_SETLKW lock request (indicated if wait is set or =
not) the
> > > > > > lock requests are ordered inside the recv_list. If a result com=
es back
> > > > > > the right plock op can be found by the first plock_op in recv_l=
ist which
> > > > > > has not info.wait set. This can be done only by non F_SETLKW pl=
ock ops as
> > > > > > dlm_controld always reads a specific plock op (list_move_tail()=
 from
> > > > > > send_list to recv_mlist) and write the result immediately back.
> > > > > >
> > > > > > This behaviour is for F_SETLKW not possible as multiple waiters=
 can be
> > > > > > get a result back in an random order. To avoid a collisions in =
cases
> > > > > > like [0] or [1] this patch adds more fields to compare the ploc=
k
> > > > > > operations as the lock request is the same. This is also being =
made in
> > > > > > NFS to find an result for an asynchronous F_SETLKW lock request=
 [2][3]. We
> > > > > > still can't find the exact lock request for a specific result i=
f the
> > > > > > lock request is the same, but if this is the case we don't care=
 the
> > > > > > order how the identical lock requests get their result back to =
grant the
> > > > > > lock.
> > > > >
> > > > > When the recv_list contains multiple indistinguishable requests, =
this
> > > > > can only be because they originated from multiple threads of the =
same
> > > > > process. In that case, I agree that it doesn't matter which of th=
ose
> > > > > requests we "complete" in dev_write() as long as we only complete=
 one
> > > > > request. We do need to compare the additional request fields in
> > > > > dev_write() to find a suitable request, so that makes sense as we=
ll.
> > > > > We need to compare all of the fields that identify a request (opt=
ype,
> > > > > ex, wait, pid, nodeid, fsid, number, start, end, owner) to find t=
he
> > > > > "right" request (or in case there is more than one identical requ=
est,
> > > > > a "suitable" request).
> > > > >
> > > >
> > > > In my "definition" why this works is as you said the "identical
> > > > request". There is a more deeper definition of "when is a request
> > > > identical" and in my opinion it is here as: "A request A is identic=
al
> > > > to request B when they get granted under the same 'time'" which is =
all
> > > > the fields you mentioned.
> > > >
> > > > Even with cancellation (F_SETLKW only) it does not matter which
> > > > "identical request" you cancel because the kernel and user
> > > > (dlm_controld) makes no relation between a lock request instance. Y=
ou
> > > > need to have at least the same amount of "results" coming back from
> > > > user space as the amount you are waiting for a result for the same
> > > > "identical request".
> > >
> > > That's not incorrect per se, but cancellations create an additional
> > > difficulty: they can either succeed or fail. To indicate that a
> > > cancellation has succeeded, a new type of message can be introduced
> > > (say, "CANCELLED"), and it's obvious that a CANCELLED message can onl=
y
> > > belong to a locking request that is being cancelled. When cancelling =
a
> > > locking request fails, the kernel will see a "locking request granted=
"
> > > message though, and when multiple identical locking requests are
> > > queued and only some of them have been cancelled, it won't be obvious
> > > which locking request a "locking request granted" message should be
> > > assigned to anymore. You really don't want to mix things up in that
> > > case.
> > >
> > > This complication makes it a whole lot more difficult to reason about
> > > the correctness of the code. All that complexity is avoidable by
> > > sticking with a fixed mapping of requests and replies (i.e., a unique
> > > request identifier).
> > >
> > > To put it differently, you can shoot yourself in the foot and still
> > > hop along on the other leg, but it may not be the best of all possibl=
e
> > > ideas.
> > >
> >
> > It makes things more complicated, I agree and the reason why this
> > works now is because there are a lot of "dependencies". I would love
> > to have an unique identifier to make it possible that we can follow an
> > instance handle of the original lock request.
> >
> > * an unique identifier which also works with the async lock request of
> > lockd case.
>
> What's the lockd case you're referring to here, and why is it relevant
> for the problem at hand?

just mentioned that we need a solution which also works for the
asynchronous lock request (F_SETLK, F_SETLKW) case, there is only one
user lockd. [0] DLM plock handling implements the behaviour mentioned
at [0] but lm_grant() callback can also return negative values and
signals that the lock request was cancelled (on nfs layer) and then
need to tell it DLM. This however is not supported as we have a lack
of cancellation.

So far I don't see any issues with the current solution which this
patch is showing and the async lock request case.

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/locks.c?h=3Dv6.4-rc4#n2255

