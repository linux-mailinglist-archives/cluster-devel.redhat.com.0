Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC386AA41C
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Mar 2023 23:21:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677882074;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YAxopu0QalgX5mIWbB4RAz5GbQNto2lyhWw9a38cGno=;
	b=e+WE0QfqvWlVMIXA18Ao5iredTBa67StRzMpwStRPEcUYiu+XCoEczSlrbXDxJI7udi5Ui
	uSMAzQr2vL/H5du3qjL+bc5Edy+KwCdkyFPMJr5Vw7t5t61puzEcH26HLlgWYROQT9m9fO
	4gcaCWzFUTmd1QNuXhV9I4IDN9Cn6RQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-fQ44e_JrOWO2JR5DxiF3iA-1; Fri, 03 Mar 2023 17:21:09 -0500
X-MC-Unique: fQ44e_JrOWO2JR5DxiF3iA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 633A1185A78B;
	Fri,  3 Mar 2023 22:21:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63F821121315;
	Fri,  3 Mar 2023 22:21:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 20C0519452D0;
	Fri,  3 Mar 2023 22:21:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D894219465A0 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  3 Mar 2023 22:21:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C7345400F8FA; Fri,  3 Mar 2023 22:21:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFCDD40C6EC4
 for <cluster-devel@redhat.com>; Fri,  3 Mar 2023 22:21:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3F7638041DF
 for <cluster-devel@redhat.com>; Fri,  3 Mar 2023 22:21:04 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-BbohBwLrMQe7VS2oehyGug-1; Fri, 03 Mar 2023 17:21:03 -0500
X-MC-Unique: BbohBwLrMQe7VS2oehyGug-1
Received: by mail-ed1-f70.google.com with SMTP id
 r9-20020a05640251c900b004d4257341c2so193398edd.19
 for <cluster-devel@redhat.com>; Fri, 03 Mar 2023 14:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677882062;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YAxopu0QalgX5mIWbB4RAz5GbQNto2lyhWw9a38cGno=;
 b=2RdkXeYbNY9y1xqji+Q9+E6Ycr6h2A7bFEtW8FQwBGxS98EK8vwY09NH35sz0rqanz
 t1ONSzI9VBEMIktf9YoU4i2a/3ixs3h6zbN0tXOuBpZiYtbU+t/RlaU/OVeK0KpjhdLH
 cpzTKD/o7kmoKpgl+DwYHD0/g4gCXpcnJ+NB5mtGuGuZb2bpG84Uk4eUA0zhuZ35SjBW
 6NFN3Q9ch59omaTZULtRjgGp6/L6W0fGjTD+PWZumeZsQlAMqogCdakF4uWpEdcvxdpt
 IRZzRLnT47pvC9aO/b09a2+C8YEL8CgQrdtd428mK+vRljDHOXytIMqSpvg0KYKW3X11
 KEbA==
X-Gm-Message-State: AO0yUKUm89rPxCJt4ygUBQXtUTLzPG4bh6hNUOJ57cxV6E/I+5eNlzP1
 WtRUlF4PjVPNpWe4aXrLJN9LcY39hudgyqiB03Bn1NQFSzW20WQxKMnT+Yl9x+44c/Cq3Imp1Kh
 bI6ApxC9e9QtwTuB6grn4bV+s8iRue0RGHbIhHg==
X-Received: by 2002:a17:906:5910:b0:8b1:78b8:4207 with SMTP id
 h16-20020a170906591000b008b178b84207mr1613353ejq.3.1677882062337; 
 Fri, 03 Mar 2023 14:21:02 -0800 (PST)
X-Google-Smtp-Source: AK7set+NfoWFp0oQGeK5VSkBgTLL6OkZAhjbeL/znGGmWSHOk3SNZ182IHnSDohZ5K29MCqKZrx8WEMM/Fj+MSGb1+s=
X-Received: by 2002:a17:906:5910:b0:8b1:78b8:4207 with SMTP id
 h16-20020a170906591000b008b178b84207mr1613344ejq.3.1677882062048; Fri, 03 Mar
 2023 14:21:02 -0800 (PST)
MIME-Version: 1.0
References: <20230302171441.1509914-13-aahringo@redhat.com>
 <20230303133845.801743-1-agruenba@redhat.com>
 <CAK-6q+gmTae=5xj5Noomy=aVRfwAQgD1C2WJ1=TYEjPWA76cMw@mail.gmail.com>
 <20230303155255.807862-1-agruenba@redhat.com>
 <CAHc6FU4WbLVORRjf2PEwGi-yg9-abpAx7uztq-z43SU6eXqh0g@mail.gmail.com>
In-Reply-To: <CAHc6FU4WbLVORRjf2PEwGi-yg9-abpAx7uztq-z43SU6eXqh0g@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 3 Mar 2023 17:20:50 -0500
Message-ID: <CAK-6q+hxpt2XN1S0kDO-d6JFKhBqU02xxMZSz3ivP5xAcr=NrA@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 3, 2023 at 11:08=E2=80=AFAM Andreas Gruenbacher <agruenba@redha=
t.com> wrote:
>
> On Fri, Mar 3, 2023 at 4:53=E2=80=AFPM Andreas Gruenbacher <agruenba@redh=
at.com> wrote:
> > diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
> > index 39bdd1f6..588bcaaa 100644
> > --- a/dlm_controld/plock.c
> > +++ b/dlm_controld/plock.c
> > @@ -8,6 +8,7 @@
> >
> >  #include "dlm_daemon.h"
> >  #include <linux/dlm_plock.h>
> > +#include <sys/sdt.h>
> >

does this require an additional dependency?

> >  /* FIXME: remove this once everyone is using the version of
> >   * dlm_plock.h which defines it */
> > @@ -211,6 +212,11 @@ static uint64_t dt_usec(const struct timeval *star=
t, const struct timeval *stop)
> >  static void plock_print_start_waiter(const struct lockspace *ls,
> >                                      struct lock_waiter *w)
> >  {
> > +       const struct dlm_plock_info *info =3D &w->info;
> > +
> > +       DTRACE_PROBE7(dlm_controld, plock_wait_begin, info->number, w, =
info->start,
> > +                     info->end, info->nodeid, info->pid, info->owner);
> > +
> >         log_plock(ls, "state waiter start %llx %p %llx-%llx %d/%u/%llx"=
,
> >                   (unsigned long long)w->info.number,
> >                   w,
>
> An additional question I have about those events is which information
> to log. We need to be able to identify which inode the request is for
> (info->number), the locking range (info->start and info->end), whether
> it is read or write lock, and which context in the kernel the request
> refers to (this seems to be info->owner, but I'm not entirely sure
> about that). The pid may be interesting as well, but are w or

w is always true for waiters, it's just stored there as the structure
is used in other places. It means if it's not a trylock or not. When
we have a waiter we always have no trylock, so w =3D=3D 1.

> info->nodeid really useful? We should try to avoid exposing

yes it is useful. So far I see you need a nodeid/pid kombination to
see which pid had the lock state for a specific time. nodeid will tell
you on which node the pid runs on, the same pid _could_ occur twice,
without nodeid you don't know which process in the cluster had the
state. Either lock or in this case contention state.

> unnecessary implementation details like the addresses of objects
> inside dlm_controld.
>

I am using it as a unique handle (probably the nodeid needs to be
considered here as well, because the same argument like pid just more
unlikely) to look up the start trace/log to the end trace. I used a
hash value of some values, but printing out those values twice will
just blow up the trace/log size. Or?

- Alex

