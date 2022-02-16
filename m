Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7FA4B8DA6
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Feb 2022 17:16:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645028192;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RT5xvhs83JoxoUdn5UA6XNvyT2lT6wWyrE/q3avPV3A=;
	b=G/Q2vACkQN1I0Efy44W7ipNOOYo0NAYABy0rK452P4bDaPUEgQc1WyOFGChIUEiwOOgyJS
	OKLIoEJtQYpJXCMe5mxX+vxc2TrZ9T10SXchm55nETAPY1vZFrzNfI7lrshF3zmAD3Njpn
	S/gWBDwEO5ymGvGXyRKFA28Hzn90Eh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-_8MMNbL5MQ2L2k6TauCDpg-1; Wed, 16 Feb 2022 11:16:27 -0500
X-MC-Unique: _8MMNbL5MQ2L2k6TauCDpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99895801B0E;
	Wed, 16 Feb 2022 16:16:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5968870D55;
	Wed, 16 Feb 2022 16:16:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A6D94BB7C;
	Wed, 16 Feb 2022 16:16:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21GGGKE4025773 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Feb 2022 11:16:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5E02B5361C3; Wed, 16 Feb 2022 16:16:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59F875361EC
	for <cluster-devel@redhat.com>; Wed, 16 Feb 2022 16:16:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40D35800B29
	for <cluster-devel@redhat.com>; Wed, 16 Feb 2022 16:16:20 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-593-_fyDjmHINWKvnbH2YUedmw-1; Wed, 16 Feb 2022 11:16:18 -0500
X-MC-Unique: _fyDjmHINWKvnbH2YUedmw-1
Received: by mail-qk1-f200.google.com with SMTP id
	x16-20020a05620a449000b00508582d0db2so1579131qkp.0
	for <cluster-devel@redhat.com>; Wed, 16 Feb 2022 08:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RT5xvhs83JoxoUdn5UA6XNvyT2lT6wWyrE/q3avPV3A=;
	b=3nvc+fp0k/UVwndx4ADTxIgAbXfcBHokaIRr0xO7FQSqkztwgtR4tNQo0tottCJfia
	s0WMPOyS6MRxFJaLGFbvkrD1iNjGH6UsYYx8ldlHEQ6JBkSMDCUR6KFWLLe4HeC8odFJ
	tl2+UIEXhFA8RQZh2b292T6yURoo6ad6Acu7RbEPFDaKd28QZMuh3hpGAAB+T2YsQajB
	bM/tk3P3GxuljSU7WjveNCAdBYUTb1rQrPgg0UJ1pmtbdIYNl+fce27otCr3ICoOzLW1
	Gf4D2X7XT0uyKdVZabsPAe9SWQDnXJqjsw+I9RWFnmFMZ5Xy9vkXgpG5ywoGUsHtiA6t
	RPMQ==
X-Gm-Message-State: AOAM532lPnsP3MgPR7s/qQCSNYQL3PFHhP4AzSzsREqrNJ88PTHKG5FD
	lS2qxay5bvpXuIXqG9RBpoCinhdN4VnJKlNk8pxmBQMYBvVZKzdNV4QC4REi4E+domq02QJK2po
	LZ64YnAMXLwGiwk4fTMHatLXOV06AOIF5mSydDw==
X-Received: by 2002:a37:6d1:0:b0:4b2:8a57:5755 with SMTP id
	200-20020a3706d1000000b004b28a575755mr1670065qkg.691.1645028178361;
	Wed, 16 Feb 2022 08:16:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHQxEu/qwVLs4Pj1i/YupeiWOJYmLw+hX7UO8eCk6i7Eglr5BoUK7h2G648ZIMjmwhhx1wua5AjmRPbsmDfok=
X-Received: by 2002:a37:6d1:0:b0:4b2:8a57:5755 with SMTP id
	200-20020a3706d1000000b004b28a575755mr1670059qkg.691.1645028178131;
	Wed, 16 Feb 2022 08:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20220216155307.2994688-1-aahringo@redhat.com>
	<20220216155307.2994688-2-aahringo@redhat.com>
	<CAHc6FU77jwdsDv_FGCFxrUVn_DOEqGrKEkB8c7N2pAF_j5Xo+A@mail.gmail.com>
In-Reply-To: <CAHc6FU77jwdsDv_FGCFxrUVn_DOEqGrKEkB8c7N2pAF_j5Xo+A@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 16 Feb 2022 11:16:07 -0500
Message-ID: <CAK-6q+id1tmHL2GXBqOsJh53pbyH5rdTAgLeXdqUj4D6kZvkow@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Feb 16, 2022 at 11:08 AM Andreas Gruenbacher
<agruenba@redhat.com> wrote:
>
> On Wed, Feb 16, 2022 at 4:53 PM Alexander Aring <aahringo@redhat.com> wrote:
> > There are several sanity checks and recover handling if they occur in
> > the dlm plock handling. They should never occur otherwise we have a bug
> > in the code. To make such bugs more visible we remove the recover
> > handling and add a WARN_ON() on those sanity checks.
> >
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > ---
> >  fs/dlm/plock.c | 32 ++++----------------------------
> >  1 file changed, 4 insertions(+), 28 deletions(-)
> >
> > diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> > index a10d2bcfe75a..55fba2f0234f 100644
> > --- a/fs/dlm/plock.c
> > +++ b/fs/dlm/plock.c
> > @@ -157,13 +157,7 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
> >                 goto out;
> >         }
> >
> > -       spin_lock(&ops_lock);
> > -       if (!list_empty(&op->list)) {
> > -               log_error(ls, "dlm_posix_lock: op on list %llx",
> > -                         (unsigned long long)number);
> > -               list_del(&op->list);
> > -       }
> > -       spin_unlock(&ops_lock);
> > +       WARN_ON(!list_empty(&op->list));
>
> Why don't those checks need the ops_lock spin lock anymore?
> Why does it make sense to get rid of the list_del calls?

My understanding is that those list_del() calls try to recover
something if a sanity check hits. The list_emptry() check should
always be true at this point no matter if lock is held or not.
Therefore no lock is required here to do some sanity checking.
If those checks hit there is a bug and trying to recover from it makes
no sense from my point of view.

- Alex

