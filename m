Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD756AA4B4
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Mar 2023 23:43:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677883408;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YFsKh2YHVrRNriHCTxMGUzakLvHAbc3T+/MNU1A3pOM=;
	b=AiweUD03cRyzry+rb8tfQlwRjI1A0+CWvRmFUnLVgsNF7z+R4GjLkAVpzy3QHRnylixuWR
	q6Yigy8XYTl5/C/8/KA09/qV2pJxoqY2NhzOSelEyLAVCY/0uZe2qmX1zmtI4lQ3Njg9kw
	qvVHSggrZd5g3aBOv0reQpExdUgUPkk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-9yHm9sjNO4WSHFVyn1uKIA-1; Fri, 03 Mar 2023 17:43:25 -0500
X-MC-Unique: 9yHm9sjNO4WSHFVyn1uKIA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DD0A1802D40;
	Fri,  3 Mar 2023 22:43:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36BDE140EBF4;
	Fri,  3 Mar 2023 22:43:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 172C019452D0;
	Fri,  3 Mar 2023 22:43:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EE72A19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  3 Mar 2023 22:43:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A70E5C16029; Fri,  3 Mar 2023 22:43:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A01BCC16027
 for <cluster-devel@redhat.com>; Fri,  3 Mar 2023 22:43:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84EE71C05AEE
 for <cluster-devel@redhat.com>; Fri,  3 Mar 2023 22:43:22 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-yuXixKNKM6qPQmdttvfWCw-1; Fri, 03 Mar 2023 17:43:21 -0500
X-MC-Unique: yuXixKNKM6qPQmdttvfWCw-1
Received: by mail-ed1-f70.google.com with SMTP id
 cz22-20020a0564021cb600b004a245f58006so6009952edb.12
 for <cluster-devel@redhat.com>; Fri, 03 Mar 2023 14:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677883400;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YFsKh2YHVrRNriHCTxMGUzakLvHAbc3T+/MNU1A3pOM=;
 b=YiBNg5OP/BSx5QfcirjQ+WmGQJQTBdjH5SGQeLxwRMSdGVVqljSM65pkBH4naYCN9d
 e40paSktWWrhUc8P/MP0fCcPzbcmuy5w1FP+tce3BZ4DxDgcNxtAgIZHaVhv1eHrSkUp
 uGiFE1i4gyWXHFrzPBUnvMh1BAFuLvg7XKewn13cbBCx03HqijiMjWYAfe6Kbab2EAns
 XOHZBdqjB4t3AzCMsu/lTjH2BpiaD4/OTn7mJ5DqjolBd/ChcjFAFk93R9zvgwQqs3I4
 ukJETJrEGmsQ2JjR2VSDkmnDD7FzX/RiAh/T9uuBObg4lZp8lE4H1JlEhQyGY1kYSvq8
 Kt9Q==
X-Gm-Message-State: AO0yUKWXLpfhVprlSdb1NdFdwg+x40F8ZLXUSpEzc82EyZ7THRRbX1+e
 wLeVtL7L1OpY8Cg7eYpxfnwWgjl4u6q5oZDVtjtzvwtWkMwdpOwI14VaGKdlmqTSvzSZX7nLNHv
 zUIOxUq22u5XRP1t9axZ/aNSIRoVeYmhkxCLsiA==
X-Received: by 2002:a17:906:948:b0:8b1:2898:2138 with SMTP id
 j8-20020a170906094800b008b128982138mr1631563ejd.3.1677883400115; 
 Fri, 03 Mar 2023 14:43:20 -0800 (PST)
X-Google-Smtp-Source: AK7set/A7fKAixffFKbPwRuYDpx4+ybmooW7kzGFHIvjitT2ID1YzxxI/NvdpqYJCG2BeAXxSIGyi12tyOa3UonlvPY=
X-Received: by 2002:a17:906:948:b0:8b1:2898:2138 with SMTP id
 j8-20020a170906094800b008b128982138mr1631555ejd.3.1677883399833; Fri, 03 Mar
 2023 14:43:19 -0800 (PST)
MIME-Version: 1.0
References: <20230302171441.1509914-13-aahringo@redhat.com>
 <20230303133845.801743-1-agruenba@redhat.com>
 <CAK-6q+gmTae=5xj5Noomy=aVRfwAQgD1C2WJ1=TYEjPWA76cMw@mail.gmail.com>
 <20230303155255.807862-1-agruenba@redhat.com>
 <CAHc6FU4WbLVORRjf2PEwGi-yg9-abpAx7uztq-z43SU6eXqh0g@mail.gmail.com>
 <CAK-6q+hxpt2XN1S0kDO-d6JFKhBqU02xxMZSz3ivP5xAcr=NrA@mail.gmail.com>
In-Reply-To: <CAK-6q+hxpt2XN1S0kDO-d6JFKhBqU02xxMZSz3ivP5xAcr=NrA@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 3 Mar 2023 17:43:08 -0500
Message-ID: <CAK-6q+he7V+basO7EwnbJih0AUeaYi5PRs2UBHHfyi7v4RyggA@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH dlm-tool 13/14] dlm_controld: plock log
 lock state
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 3, 2023 at 5:20=E2=80=AFPM Alexander Aring <aahringo@redhat.com=
> wrote:
>
> Hi,
>
> On Fri, Mar 3, 2023 at 11:08=E2=80=AFAM Andreas Gruenbacher <agruenba@red=
hat.com> wrote:
> >
> > On Fri, Mar 3, 2023 at 4:53=E2=80=AFPM Andreas Gruenbacher <agruenba@re=
dhat.com> wrote:
> > > diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
> > > index 39bdd1f6..588bcaaa 100644
> > > --- a/dlm_controld/plock.c
> > > +++ b/dlm_controld/plock.c
> > > @@ -8,6 +8,7 @@
> > >
> > >  #include "dlm_daemon.h"
> > >  #include <linux/dlm_plock.h>
> > > +#include <sys/sdt.h>
> > >
>
> does this require an additional dependency?
>
> > >  /* FIXME: remove this once everyone is using the version of
> > >   * dlm_plock.h which defines it */
> > > @@ -211,6 +212,11 @@ static uint64_t dt_usec(const struct timeval *st=
art, const struct timeval *stop)
> > >  static void plock_print_start_waiter(const struct lockspace *ls,
> > >                                      struct lock_waiter *w)
> > >  {
> > > +       const struct dlm_plock_info *info =3D &w->info;
> > > +
> > > +       DTRACE_PROBE7(dlm_controld, plock_wait_begin, info->number, w=
, info->start,
> > > +                     info->end, info->nodeid, info->pid, info->owner=
);
> > > +
> > >         log_plock(ls, "state waiter start %llx %p %llx-%llx %d/%u/%ll=
x",
> > >                   (unsigned long long)w->info.number,
> > >                   w,
> >
> > An additional question I have about those events is which information
> > to log. We need to be able to identify which inode the request is for
> > (info->number), the locking range (info->start and info->end), whether
> > it is read or write lock, and which context in the kernel the request
> > refers to (this seems to be info->owner, but I'm not entirely sure
> > about that). The pid may be interesting as well, but are w or
>
> w is always true for waiters, it's just stored there as the structure
> is used in other places. It means if it's not a trylock or not. When
> we have a waiter we always have no trylock, so w =3D=3D 1.
>
> > info->nodeid really useful? We should try to avoid exposing
>
> yes it is useful. So far I see you need a nodeid/pid kombination to
> see which pid had the lock state for a specific time. nodeid will tell
> you on which node the pid runs on, the same pid _could_ occur twice,
> without nodeid you don't know which process in the cluster had the
> state. Either lock or in this case contention state.
>
> > unnecessary implementation details like the addresses of objects
> > inside dlm_controld.
> >
>
> I am using it as a unique handle (probably the nodeid needs to be
> considered here as well, because the same argument like pid just more
> unlikely) to look up the start trace/log to the end trace. I used a

no, we don't need the nodeid here. We don't trace multiple
applications into one file, then yes. But we separate them in their
own trace/log file.
And using the pointer is valid because this structure should be
add/del to the list and cannot be e.g. added twice.

- Alex

