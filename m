Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 301716AA48D
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Mar 2023 23:37:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677883019;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TOtSHjEEU7I4R2ynTqf3Ie4JqrqBIEETqQomk8M7row=;
	b=XuqEQsUFGLT8sUHqiFKhVWyxhWRUBOtSi5ZU66hFnvQhGzUanjGRPJSwL+cZxDp77/qwiH
	40axOdKBwzsaeR6a8tzW/5eGWbVspCyJw7uVnreZ3MH/fI1kLchGEoCrh/s07VUzauoweB
	Fqrt8Bh50ZzE73wtdqatErrhk7lhAQc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-FNais4nQMPKqs3bwc2dwag-1; Fri, 03 Mar 2023 17:36:55 -0500
X-MC-Unique: FNais4nQMPKqs3bwc2dwag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C47CA85A588;
	Fri,  3 Mar 2023 22:36:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AAC2440CF8EF;
	Fri,  3 Mar 2023 22:36:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9425F19452D0;
	Fri,  3 Mar 2023 22:36:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5EA0919465A0 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  3 Mar 2023 22:36:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4BA94440D8; Fri,  3 Mar 2023 22:36:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D97247CE3
 for <cluster-devel@redhat.com>; Fri,  3 Mar 2023 22:36:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA98D3C16EA3
 for <cluster-devel@redhat.com>; Fri,  3 Mar 2023 22:28:48 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-SkjiRIk5NHee5RCh1e1hWw-1; Fri, 03 Mar 2023 17:28:42 -0500
X-MC-Unique: SkjiRIk5NHee5RCh1e1hWw-1
Received: by mail-ed1-f71.google.com with SMTP id
 p36-20020a056402502400b004bb926a3d54so5905866eda.2
 for <cluster-devel@redhat.com>; Fri, 03 Mar 2023 14:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677882521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TOtSHjEEU7I4R2ynTqf3Ie4JqrqBIEETqQomk8M7row=;
 b=gaxJ4BmyWmdbWDfzbVXdZwnHYsRXoHx+vIRMCvGOJnlazcKIt5C+WVsPZ1qSJfL5RE
 SnYICCFXGeDYl/amNMvd9Gzgfm5fXOmFIprtOTGP42s5B/YfA5ziIQtAQOmwMH0Kj/rx
 NiMWik17G7VLnF9lLQbgH4mTL1dq9jn5pOIiNG23K8svlJOjC+u1oarMG+4aOY7QeQ2J
 H+ASL1eX6qzYFz5E8ujFr4JOCveV3Agl7VoaiN2h/eQ4pLgORTUAphDU9hfXQaxKyng+
 7R5uiLyPVfeZ7sYsSi5LymHSyO+BsCsxQTi3WeALq2R5V7C/gBrbozAqU6c6mq6HqoL/
 Lt4A==
X-Gm-Message-State: AO0yUKX0vwWvHWePqKZbAagpd8LJugyZeELHwhbLw8hD4S0gjbLUkq49
 5nE4luxHr2Xh0t/sG7tfxfaGokjrK6xTFpHgTF/GaA50hKel9Z6rrY6//ih6JQK2i/B/ouh3Snx
 NgK8eStSVWIUmHVmvFadvwl/OcHxjNWYhrZY+IA==
X-Received: by 2002:a50:c05b:0:b0:4c0:2126:ac34 with SMTP id
 u27-20020a50c05b000000b004c02126ac34mr1928049edd.6.1677882521536; 
 Fri, 03 Mar 2023 14:28:41 -0800 (PST)
X-Google-Smtp-Source: AK7set9TsM8HLxKBnVU2uiS2ZVHQ59dkApvWpShtDwhh92y7GbATF/a0faNbFPXQSvDHukos/gVTMy+QQvPkrSCtvWE=
X-Received: by 2002:a50:c05b:0:b0:4c0:2126:ac34 with SMTP id
 u27-20020a50c05b000000b004c02126ac34mr1928042edd.6.1677882521279; Fri, 03 Mar
 2023 14:28:41 -0800 (PST)
MIME-Version: 1.0
References: <20230302171441.1509914-13-aahringo@redhat.com>
 <20230303133845.801743-1-agruenba@redhat.com>
 <CAK-6q+gmTae=5xj5Noomy=aVRfwAQgD1C2WJ1=TYEjPWA76cMw@mail.gmail.com>
 <20230303155255.807862-1-agruenba@redhat.com>
 <CAHc6FU4WbLVORRjf2PEwGi-yg9-abpAx7uztq-z43SU6eXqh0g@mail.gmail.com>
 <CAK-6q+hxpt2XN1S0kDO-d6JFKhBqU02xxMZSz3ivP5xAcr=NrA@mail.gmail.com>
In-Reply-To: <CAK-6q+hxpt2XN1S0kDO-d6JFKhBqU02xxMZSz3ivP5xAcr=NrA@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 3 Mar 2023 17:28:30 -0500
Message-ID: <CAK-6q+g6WrnVye=2bsDBW8DDV79AQ9WLn5TnzN7J8-UAe+2tkA@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

I am sorry, I thought you meant the w field in "w->w". As I explain it
below, I use it as a unique handle to make the "start", "end" event
matching.

 Alex

