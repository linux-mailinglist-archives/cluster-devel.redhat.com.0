Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DAABE4BA268
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Feb 2022 15:05:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645106723;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=blLificsbBodF7OpfZan8hUEAAx4OZsgJofy6LFkj54=;
	b=GdAhcKC0id9POY08/DXp5EcQ/pQAxHEr1s2Thotpw8JDyxcvz6qQ7JCFbRkPcG+ujTgihC
	jclfJeUM19A/Jrs6tV7vByDuT1gYWQfXjFtU7Y8epHpq84z4noCeKfz9v/4Q5bI9VD/qr2
	koBcXfw4lnhdoDdv1+gkN5jbbn4Bma4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-gBRs8bLXPJGyAY4IEN3TNw-1; Thu, 17 Feb 2022 09:05:20 -0500
X-MC-Unique: gBRs8bLXPJGyAY4IEN3TNw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ED8C801B1C;
	Thu, 17 Feb 2022 14:05:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 203411037F4A;
	Thu, 17 Feb 2022 14:05:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D292B4CA93;
	Thu, 17 Feb 2022 14:05:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21HE2EAR007833 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 17 Feb 2022 09:02:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E33D5C080B9; Thu, 17 Feb 2022 14:02:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF4BDC080B8
	for <cluster-devel@redhat.com>; Thu, 17 Feb 2022 14:02:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C42E03801ECE
	for <cluster-devel@redhat.com>; Thu, 17 Feb 2022 14:02:13 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
	[209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-190-q1t1rxcsNZeMWprrCk439w-1; Thu, 17 Feb 2022 09:02:12 -0500
X-MC-Unique: q1t1rxcsNZeMWprrCk439w-1
Received: by mail-qk1-f198.google.com with SMTP id
	t17-20020a05620a035100b0060df15e2977so272838qkm.21
	for <cluster-devel@redhat.com>; Thu, 17 Feb 2022 06:02:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=blLificsbBodF7OpfZan8hUEAAx4OZsgJofy6LFkj54=;
	b=GysGoSLpQxI68iwFMxWvc/qyibuG8CvU0xd+7Ldvff5kUbv5wSlhZ52i2kK+Z6duCR
	5UcZve+Vm3ZbMjlHSHn9Hcqbw/5njwbRhPS0x1fga9Nw+FqOfq5EfQ6BkNXbecyhJmxS
	YsDssOa8fUWhoWwsu+jokqyPhemNHtNRhBdFZ0AoE/HX/Xy3wLxGgBiDM7dvwy1BQsRO
	qGvVTMy448zogYhpozSRkz9qdJGDZ41Y3RJAHNaT52us4/bCB9HbvDT6f8zzKw++c4ot
	7L37SsUxcKIJVGqIZosHu113PZkNMI7WZIbLK8VYNF00KhLH/BwLjw0RPBPO8kkzHFOf
	j0rA==
X-Gm-Message-State: AOAM53382G9zIRePXLUdhsVDg9Ia2qC2DyEHz/AMT8FR0OxapJcJuWnW
	g8T0l1PvaFhGf83AKOdpHuYsXKxlANhRjCPc8dr7tBqnfxj1TV+kMpvOvwVgyvo5dfVWyaokSgM
	Od9qm7VBllHM9oxIYNcuKrZsv9CRMtftrU3Ck1g==
X-Received: by 2002:a05:622a:40e:b0:2dc:eb59:4855 with SMTP id
	n14-20020a05622a040e00b002dceb594855mr2515835qtx.526.1645106531780;
	Thu, 17 Feb 2022 06:02:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTwVAYQ4cuVOsqfJNLiM9tGIEZIz58McDzioXb/qB3PncrpR64ImAruYf2gy2FHst5tPCX2p+jjSTiI81ZXv4=
X-Received: by 2002:a05:622a:40e:b0:2dc:eb59:4855 with SMTP id
	n14-20020a05622a040e00b002dceb594855mr2515808qtx.526.1645106531512;
	Thu, 17 Feb 2022 06:02:11 -0800 (PST)
MIME-Version: 1.0
References: <20220216155307.2994688-1-aahringo@redhat.com>
	<20220216155307.2994688-2-aahringo@redhat.com>
	<CAHc6FU77jwdsDv_FGCFxrUVn_DOEqGrKEkB8c7N2pAF_j5Xo+A@mail.gmail.com>
	<CAK-6q+id1tmHL2GXBqOsJh53pbyH5rdTAgLeXdqUj4D6kZvkow@mail.gmail.com>
	<CAHc6FU4yypWqE+BZx4AstMYHkzoSDV5jVndYY7jYk7L1v20isg@mail.gmail.com>
In-Reply-To: <CAHc6FU4yypWqE+BZx4AstMYHkzoSDV5jVndYY7jYk7L1v20isg@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 17 Feb 2022 09:02:00 -0500
Message-ID: <CAK-6q+hHqAeFLLE5P0+gLEy9YD+3Re+s=vc0iQpxpvPDWH_8Ew@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH dlm/next 1/4] fs: dlm: replace sanity
 checks with WARN_ON
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Feb 16, 2022 at 7:37 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> On Wed, Feb 16, 2022 at 5:16 PM Alexander Aring <aahringo@redhat.com> wrote:
> >
> > Hi,
> >
> > On Wed, Feb 16, 2022 at 11:08 AM Andreas Gruenbacher
> > <agruenba@redhat.com> wrote:
> > >
> > > On Wed, Feb 16, 2022 at 4:53 PM Alexander Aring <aahringo@redhat.com> wrote:
> > > > There are several sanity checks and recover handling if they occur in
> > > > the dlm plock handling. They should never occur otherwise we have a bug
> > > > in the code. To make such bugs more visible we remove the recover
> > > > handling and add a WARN_ON() on those sanity checks.
> > > >
> > > > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > > > ---
> > > >  fs/dlm/plock.c | 32 ++++----------------------------
> > > >  1 file changed, 4 insertions(+), 28 deletions(-)
> > > >
> > > > diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> > > > index a10d2bcfe75a..55fba2f0234f 100644
> > > > --- a/fs/dlm/plock.c
> > > > +++ b/fs/dlm/plock.c
> > > > @@ -157,13 +157,7 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
> > > >                 goto out;
> > > >         }
> > > >
> > > > -       spin_lock(&ops_lock);
> > > > -       if (!list_empty(&op->list)) {
> > > > -               log_error(ls, "dlm_posix_lock: op on list %llx",
> > > > -                         (unsigned long long)number);
> > > > -               list_del(&op->list);
> > > > -       }
> > > > -       spin_unlock(&ops_lock);
> > > > +       WARN_ON(!list_empty(&op->list));
> > >
> > > Why don't those checks need the ops_lock spin lock anymore?
> > > Why does it make sense to get rid of the list_del calls?
> >
> > My understanding is that those list_del() calls try to recover
> > something if a sanity check hits. The list_emptry() check should
> > always be true at this point no matter if lock is held or not.
> > Therefore no lock is required here to do some sanity checking.
>
> I don't immediately see what, other than the spin lock, would
> guarantee a consistent memory view. In other words, without taking the
> spin lock, 'list_empty(&op->list)' might still be true on one CPU even
> though another CPU has already added 'op' to a list. So please, when
> changing the locking somewhere, explain why the change is correct
> beyond just stating that the locking isn't needed.
>

Three WARN_ON()'s are behind wait_event()/wait_event_interruptible()
assuming they have the right barriers here to provide a consistent
memory view.

The other one in dlm_plock_callback() was the one which makes me think
about what the code is trying to do here. My guess is that the whole
locking concept is somehow connected, that some posix lock api/misc
char devices calls cannot be called parallel and they occur in a
specific sequence (maybe this sequence is only guaranteed by
dlm_controld?).
However the dlm_plock_callback() just did a
"list_del_init(&op->list);" before the WARN_ON() and I guess nothing
should interfere with this by another list manipulation otherwise the
previous sanity check would hit.

I would remove those checks but I don't trust that the code is
assuming that some things cannot run parallel (as the API calls it)
and in a specific sequence, otherwise there would be multiple
use-after-free. My assumption here is that those sanity checks somehow
try to confirm that.

Does this justify(if this explanation is correct)/explain the patch enough?

- Alex

