Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A41C74B8DF0
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Feb 2022 17:26:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645028793;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=C2fmqA3BIdnY5Sga3zHBhnvGo/e7+Ax0imS22fhyGqc=;
	b=HPSr0PaDxVl1s1XXIQ/9zrF/uU9HfwgYAPJYCt/4UZ9h9qlLvaQhdnrx5RNOrwFA8MrRfH
	Isj/bkEWs2m328bPTH4bvOmBL7yzVMuW7WdRG98NKGXRYNg2YkIdFnjekpf55GrnhWlnPP
	lFQpXVQKUcAhonkVJ722ExBEzXZKNGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-UtprUdjXNmOlfRHnqc5ezA-1; Wed, 16 Feb 2022 11:26:30 -0500
X-MC-Unique: UtprUdjXNmOlfRHnqc5ezA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BFA8802924;
	Wed, 16 Feb 2022 16:26:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D10D7B9F4;
	Wed, 16 Feb 2022 16:26:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D23B21809CBF;
	Wed, 16 Feb 2022 16:26:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21GGQPes026823 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Feb 2022 11:26:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B06CA1466C4D; Wed, 16 Feb 2022 16:26:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACD5F1466C4B
	for <cluster-devel@redhat.com>; Wed, 16 Feb 2022 16:26:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91F77185A79C
	for <cluster-devel@redhat.com>; Wed, 16 Feb 2022 16:26:25 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
	[209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-189-MddwC3pBMEGCzo_QL0JzJQ-1; Wed, 16 Feb 2022 11:26:24 -0500
X-MC-Unique: MddwC3pBMEGCzo_QL0JzJQ-1
Received: by mail-qv1-f69.google.com with SMTP id
	c8-20020a0ce7c8000000b0042c12357076so2255341qvo.6
	for <cluster-devel@redhat.com>; Wed, 16 Feb 2022 08:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C2fmqA3BIdnY5Sga3zHBhnvGo/e7+Ax0imS22fhyGqc=;
	b=HI5VL3ioXnkilaclGjtwg3oKbsrP7x2bZFNZbrUUEjkWikuZSVOw++KMZlmN9/v9ve
	iN/iCzOruBXO3A76hsk+oTBzxTx4tNUniMCi1vgqdml5ZNEltv0QlcA9kL00Owg9Xd3D
	cid9ZTNPGfvX1hrSO7ktVcUW/A8h+d84xyAUXCgAJNbhbo44OPFUXPIApcBIWM+xJhQw
	Wvbc1zFH1TeImRht+V7pu7S/BkMaLTVleUN1AQ0UXm+J7njDATBwNf7nVV9gZflLoIGn
	4C74ebEMCFdHZkoD7xk/8S+McfYokgHLkiSdltIG/pEsm6OiZU0C87v9nbyKb5AcDvNa
	zq9g==
X-Gm-Message-State: AOAM532BupLFXziI/72+u/1r9wPptcvTFoRsb6JIYOu2W5ipvXVgXWZh
	0dU8+QwVux79B9RkC95SeY0d0B7AcL+kgTqU8yQzDJTXti1TPrI7W732ptsqAcAJ4GdZN+sI3SE
	gmJH+EunYUmYGYAGRM4rNWXIODwwGqtY5vv2kmQ==
X-Received: by 2002:a37:b95:0:b0:5f1:8711:c404 with SMTP id
	143-20020a370b95000000b005f18711c404mr1606934qkl.27.1645028783913;
	Wed, 16 Feb 2022 08:26:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlS7MzmdcnhMCdnz+kDG41L6mCDYXXrVlJKvQ6GcOCcJ4AFwZcr6Pmcd5Kv7cgdaHlsKYOz2MvreKKXz5ZYZQ=
X-Received: by 2002:a37:b95:0:b0:5f1:8711:c404 with SMTP id
	143-20020a370b95000000b005f18711c404mr1606922qkl.27.1645028783705;
	Wed, 16 Feb 2022 08:26:23 -0800 (PST)
MIME-Version: 1.0
References: <20220216155307.2994688-1-aahringo@redhat.com>
	<20220216155307.2994688-2-aahringo@redhat.com>
	<CAHc6FU77jwdsDv_FGCFxrUVn_DOEqGrKEkB8c7N2pAF_j5Xo+A@mail.gmail.com>
	<CAK-6q+id1tmHL2GXBqOsJh53pbyH5rdTAgLeXdqUj4D6kZvkow@mail.gmail.com>
	<CAK-6q+h6OZmNhbyEw7SXVqYSR69KkXQq5cqAzDcJ14Bf_ZEqjQ@mail.gmail.com>
In-Reply-To: <CAK-6q+h6OZmNhbyEw7SXVqYSR69KkXQq5cqAzDcJ14Bf_ZEqjQ@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 16 Feb 2022 11:26:12 -0500
Message-ID: <CAK-6q+ii=kFPTmt4D4VTshO+CoPDcC=TfZP3hdLoqrGfhipHaA@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Feb 16, 2022 at 11:25 AM Alexander Aring <aahringo@redhat.com> wrote:
>
> Hi,
>
> On Wed, Feb 16, 2022 at 11:16 AM Alexander Aring <aahringo@redhat.com> wrote:
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
>
> s/true/false, but !list_empty() is true :)

forget that, originally it was correct....

- Alex

