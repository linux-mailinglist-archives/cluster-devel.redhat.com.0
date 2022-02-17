Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 632924B9511
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Feb 2022 01:37:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645058236;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=g5HSi9rphG3nIIT+dlxbso0W/wkD06t+JJ3CFsjyrX4=;
	b=URdOMuKohfTgeZw8kc5fgAu5TqWEFeDq9Qd6LJrHrDLkscPm6ve6RFJpQmPkzvSZfTp0IM
	QW0pRgv8FSefl2vxg876bV+QmRxKfhGm3YVtFUN1JT0E2bUT3e37idCCzMArWb0epOe0M0
	r5mztkguxnlnZWDcEXJrP7prceW63a0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-0jp5eGtMOHmg8TAWBujnog-1; Wed, 16 Feb 2022 19:37:13 -0500
X-MC-Unique: 0jp5eGtMOHmg8TAWBujnog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A675F1006AA5;
	Thu, 17 Feb 2022 00:37:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A56935ED3B;
	Thu, 17 Feb 2022 00:37:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A6F384CA93;
	Thu, 17 Feb 2022 00:37:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21H0b2ma007544 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Feb 2022 19:37:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3DD2C200A39F; Thu, 17 Feb 2022 00:37:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 395202144B21
	for <cluster-devel@redhat.com>; Thu, 17 Feb 2022 00:36:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09F96185A7B2
	for <cluster-devel@redhat.com>; Thu, 17 Feb 2022 00:36:59 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-550--kpVGkdCNzOJezm0XBYdZw-1; Wed, 16 Feb 2022 19:36:57 -0500
X-MC-Unique: -kpVGkdCNzOJezm0XBYdZw-1
Received: by mail-wm1-f70.google.com with SMTP id
	u14-20020a05600c210e00b0037bddd0562eso1015533wml.1
	for <cluster-devel@redhat.com>; Wed, 16 Feb 2022 16:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g5HSi9rphG3nIIT+dlxbso0W/wkD06t+JJ3CFsjyrX4=;
	b=ZHp1r0/vHbDBF4IWAvoGNiq/eOIYwg4BqvOA8B5bpCwabQHucbx7wJDJT3DJWavIk1
	rNgaTCSGVIO6KrVlMvgwRwZEHp3qRfhBdh4nS/17ZIwtiOb/MBgW/RM0Q4XCOpfqd4FR
	7YffZ3EI2KJb32UG+A8/9r9F4XQYi9JdbbKOovizGZ+G2PdNVrFOic6bQrrDftVssTXp
	/+tbvAe4liBAmdOcOIs96TiGgj7+nRz9mm2AXWD4Rd/J8o6q4ny3W6dY4dWfQxvmL1x1
	Oyp08COB7HZKxumPMGI7whhMYyikxa2Sao5naiLtn0pxD/Ln8K9zfhMoWiav85P/BHh8
	C9ww==
X-Gm-Message-State: AOAM531ZRps2tPmVwDvKUyVpp5wHAllxH1WJPbghdOMduf/Z1/RrfqU4
	35Y8BmI+Mwzo43zOGGggsnKvSTrXWGo735+YptyNnGFQfWOlRrCv2FBmYwzpN7BUDyZIA6v8RJC
	smqZZZKJEwGLxRCeBYvRjDotXP4wtSeGCI9i8HA==
X-Received: by 2002:adf:ef83:0:b0:1e4:f048:7193 with SMTP id
	d3-20020adfef83000000b001e4f0487193mr332763wro.349.1645058216383;
	Wed, 16 Feb 2022 16:36:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxc2kH72BVA+wfujfzRe1hTGsuAEcchysYNOLxCk3TgZv2ymKHlKHpYTqXfkd1kiss6ifYAYiTsW2l0uNvxC18=
X-Received: by 2002:adf:ef83:0:b0:1e4:f048:7193 with SMTP id
	d3-20020adfef83000000b001e4f0487193mr332754wro.349.1645058216152;
	Wed, 16 Feb 2022 16:36:56 -0800 (PST)
MIME-Version: 1.0
References: <20220216155307.2994688-1-aahringo@redhat.com>
	<20220216155307.2994688-2-aahringo@redhat.com>
	<CAHc6FU77jwdsDv_FGCFxrUVn_DOEqGrKEkB8c7N2pAF_j5Xo+A@mail.gmail.com>
	<CAK-6q+id1tmHL2GXBqOsJh53pbyH5rdTAgLeXdqUj4D6kZvkow@mail.gmail.com>
In-Reply-To: <CAK-6q+id1tmHL2GXBqOsJh53pbyH5rdTAgLeXdqUj4D6kZvkow@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 17 Feb 2022 01:36:44 +0100
Message-ID: <CAHc6FU4yypWqE+BZx4AstMYHkzoSDV5jVndYY7jYk7L1v20isg@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 16, 2022 at 5:16 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> Hi,
>
> On Wed, Feb 16, 2022 at 11:08 AM Andreas Gruenbacher
> <agruenba@redhat.com> wrote:
> >
> > On Wed, Feb 16, 2022 at 4:53 PM Alexander Aring <aahringo@redhat.com> wrote:
> > > There are several sanity checks and recover handling if they occur in
> > > the dlm plock handling. They should never occur otherwise we have a bug
> > > in the code. To make such bugs more visible we remove the recover
> > > handling and add a WARN_ON() on those sanity checks.
> > >
> > > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > > ---
> > >  fs/dlm/plock.c | 32 ++++----------------------------
> > >  1 file changed, 4 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> > > index a10d2bcfe75a..55fba2f0234f 100644
> > > --- a/fs/dlm/plock.c
> > > +++ b/fs/dlm/plock.c
> > > @@ -157,13 +157,7 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
> > >                 goto out;
> > >         }
> > >
> > > -       spin_lock(&ops_lock);
> > > -       if (!list_empty(&op->list)) {
> > > -               log_error(ls, "dlm_posix_lock: op on list %llx",
> > > -                         (unsigned long long)number);
> > > -               list_del(&op->list);
> > > -       }
> > > -       spin_unlock(&ops_lock);
> > > +       WARN_ON(!list_empty(&op->list));
> >
> > Why don't those checks need the ops_lock spin lock anymore?
> > Why does it make sense to get rid of the list_del calls?
>
> My understanding is that those list_del() calls try to recover
> something if a sanity check hits. The list_emptry() check should
> always be true at this point no matter if lock is held or not.
> Therefore no lock is required here to do some sanity checking.

I don't immediately see what, other than the spin lock, would
guarantee a consistent memory view. In other words, without taking the
spin lock, 'list_empty(&op->list)' might still be true on one CPU even
though another CPU has already added 'op' to a list. So please, when
changing the locking somewhere, explain why the change is correct
beyond just stating that the locking isn't needed.

Thanks,
Andreas

> If those checks hit there is a bug and trying to recover from it makes
> no sense from my point of view.

