Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F11E4B8DE8
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Feb 2022 17:25:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645028727;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=5GEYm+uaFZlbT1HGJAiQ/362SYKGWm0fpGCj2dKfOTk=;
	b=dKSHDvfgUHft1zALVohxPdkMbvnl6iqZvyx4AgSM7mu3PSMHio+kRStPG6CUW0u/TJINBz
	GxsiwWLmYENKBwkc8vx2qDejRzhDTm9MLNXKP8uXrfUS/OSLj5cIGuxpQQAtiTUEzwffQm
	GF5CmGKq4O3dA7hpKajI9EuAKWtDgH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-I-n35RRvN5eSloQIug-4Kg-1; Wed, 16 Feb 2022 11:25:23 -0500
X-MC-Unique: I-n35RRvN5eSloQIug-4Kg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E4341091DA2;
	Wed, 16 Feb 2022 16:25:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39D0B8276A;
	Wed, 16 Feb 2022 16:25:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C5E8E4A7C8;
	Wed, 16 Feb 2022 16:25:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21GGPHcq026742 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Feb 2022 11:25:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6944E1466C4D; Wed, 16 Feb 2022 16:25:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64D251466C4B
	for <cluster-devel@redhat.com>; Wed, 16 Feb 2022 16:25:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49D23380450A
	for <cluster-devel@redhat.com>; Wed, 16 Feb 2022 16:25:17 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
	[209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-510-HoS1kSOoPXG2MsO8duBAVg-1; Wed, 16 Feb 2022 11:25:15 -0500
X-MC-Unique: HoS1kSOoPXG2MsO8duBAVg-1
Received: by mail-qv1-f69.google.com with SMTP id
	c8-20020a0ce7c8000000b0042c12357076so2250414qvo.6
	for <cluster-devel@redhat.com>; Wed, 16 Feb 2022 08:25:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5GEYm+uaFZlbT1HGJAiQ/362SYKGWm0fpGCj2dKfOTk=;
	b=yLhbyb1BWMRmpu323hZVdzkLTE1+n26UUYN4z/rDDnAhgH/wdtNdQmQ2JYG+eLZvbU
	t271pdgfi5LaFirrEYqP73DJNUPhGhEMomAlwrqz9FcX+y4FzD1Rkkzu7nQw4W8BO1/s
	MkUEs1C0lPvQCWLs+KsT0TS+SKKz12xDolefr7cI0dSwVnIava0GF0IHVAj37O2kxM0h
	4oMGZO+7B60zSbVxmMRz86m+lYQJEXSKcDAuflR7slAjSszhsnbROMjcSFbts/WwdNNz
	8GPTlA18/ikavcOLQ9e0XxvyWieGvAtEMx/nBkqmREd+2XJqD/v7ToH0CFI1Q42AGFXY
	elig==
X-Gm-Message-State: AOAM530BQxc5TQlwS+TYSVXNP4pl7qbox2daFp/YwjItX9UKU2De1+LN
	2ymSXRgT6KBlrOtOIvbnetDrpQwcZZnVGCaniAxaDZsPMpFqGP2FsKF8jir19PSsPqnRXRMh1uL
	Xxrl8d4NnGOvhZ8HEqdIR/y4oqFoW+gkuAhR3PQ==
X-Received: by 2002:a05:6214:c82:b0:42c:c5f3:b162 with SMTP id
	r2-20020a0562140c8200b0042cc5f3b162mr2336429qvr.116.1645028715395;
	Wed, 16 Feb 2022 08:25:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynPMbK+RAkBUoLCpQJUG+4HOxLVTN1QEP9ZeP6LloSNZWVXLpqLEBKqPs9CywgkFIayxlsXarAGsBDCeq8UsU=
X-Received: by 2002:a05:6214:c82:b0:42c:c5f3:b162 with SMTP id
	r2-20020a0562140c8200b0042cc5f3b162mr2336419qvr.116.1645028715202;
	Wed, 16 Feb 2022 08:25:15 -0800 (PST)
MIME-Version: 1.0
References: <20220216155307.2994688-1-aahringo@redhat.com>
	<20220216155307.2994688-2-aahringo@redhat.com>
	<CAHc6FU77jwdsDv_FGCFxrUVn_DOEqGrKEkB8c7N2pAF_j5Xo+A@mail.gmail.com>
	<CAK-6q+id1tmHL2GXBqOsJh53pbyH5rdTAgLeXdqUj4D6kZvkow@mail.gmail.com>
In-Reply-To: <CAK-6q+id1tmHL2GXBqOsJh53pbyH5rdTAgLeXdqUj4D6kZvkow@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 16 Feb 2022 11:25:04 -0500
Message-ID: <CAK-6q+h6OZmNhbyEw7SXVqYSR69KkXQq5cqAzDcJ14Bf_ZEqjQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Feb 16, 2022 at 11:16 AM Alexander Aring <aahringo@redhat.com> wrote:
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

s/true/false, but !list_empty() is true :)

 - Alex

