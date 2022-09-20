Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CFE5BECF0
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Sep 2022 20:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663699418;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=G60xMMtXJjCU4InV14N/DTIR+DB9kYcMsSaIQmfODk4=;
	b=NNIlOceXTlZcxtcBKWNa3TLS5u43lIKjmsnxV6lYPrgnPeKkUNED29ioG8og/VatKggMx1
	NY6y4G5xZkj20JwlBOfrq8w/an9qgrZ72gSenIpnqCXD59vaVP46goSrOsjjl967RGTuwI
	2mGb7xYvx9Ar8XxVxX7Mj7XrZQNn4rk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-h5zKyEl5PEWFSwCKgoGxvw-1; Tue, 20 Sep 2022 14:43:34 -0400
X-MC-Unique: h5zKyEl5PEWFSwCKgoGxvw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6B958001B8;
	Tue, 20 Sep 2022 18:43:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A6E15492B05;
	Tue, 20 Sep 2022 18:43:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 61F16194658D;
	Tue, 20 Sep 2022 18:43:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 27ECC1946588 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 20 Sep 2022 18:43:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 18CF840C2066; Tue, 20 Sep 2022 18:43:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10C0140C2064
 for <cluster-devel@redhat.com>; Tue, 20 Sep 2022 18:43:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 741D2185A7A3
 for <cluster-devel@redhat.com>; Tue, 20 Sep 2022 18:43:32 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-177-gIx_zdrhMGyWQX0lsQIUvA-1; Tue, 20 Sep 2022 14:43:30 -0400
X-MC-Unique: gIx_zdrhMGyWQX0lsQIUvA-1
Received: by mail-wm1-f72.google.com with SMTP id
 i129-20020a1c3b87000000b003b33e6160bdso6708041wma.7
 for <cluster-devel@redhat.com>; Tue, 20 Sep 2022 11:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=G60xMMtXJjCU4InV14N/DTIR+DB9kYcMsSaIQmfODk4=;
 b=xp53+aN44ybU0TP2ln8dNQdQ545CtPe6E7zGNvDGuYx7QEmIOXOr8mZEjjSfdKTQ1V
 klaPIGFIY1iCa5+A0eCWkixE6mIO55f4jTPe8rygHnxaJcPSxA4CSwNcfF1n367R4ZzK
 Ffs95Xv8kXgGJhQsvt9UQ2CG+IQVCc4QYnqXJtQcxVQ9T0TToOAI/xLbYnSq3SdjoSf2
 aZbbnl3FdZ1Qu7b6/LW/oLrvpQewyED32CrLGDHWtfZmKFehSRIDtu6Qh9wnGRRkj1Qv
 1wSzL+/ikvdO9kuLJE9JcfqR8DksL/kjaguXNKu8A/zsEmq+bcqsnYlRZAotLY/7WeEB
 ZlbQ==
X-Gm-Message-State: ACrzQf3TCQoly05yktXn0JhnH4K6/PkijdxbvtP0CFGT6uZD2AXs/QBH
 U2iOm2DLDzBiASGC6RxrvlB07z2n0XJ8vx4AGwaN6gRHX8G5nhUHjg7g+EKW100FZQWuFV3ok9L
 yLDWRf6sbzayV3igxjoYuYzsCXTmVOdkH4MFVLQ==
X-Received: by 2002:a05:6000:1090:b0:228:a963:3641 with SMTP id
 y16-20020a056000109000b00228a9633641mr15208125wrw.289.1663699409392; 
 Tue, 20 Sep 2022 11:43:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Foq2gYwPP6Ds43UvprX7+mgD8iLkCHAiI2lmyLXPfm1fsj4U4sKGBC/mxCo1zPZdexU+AgLlKPYVecv18o6Y=
X-Received: by 2002:a05:6000:1090:b0:228:a963:3641 with SMTP id
 y16-20020a056000109000b00228a9633641mr15208118wrw.289.1663699409246; Tue, 20
 Sep 2022 11:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220916184309.3179451-1-aahringo@redhat.com>
 <20220916184309.3179451-6-aahringo@redhat.com>
 <CAK-6q+gEirxOAeded1HGLd54n5UrXfcCxOmLiDFidDLX0581xQ@mail.gmail.com>
In-Reply-To: <CAK-6q+gEirxOAeded1HGLd54n5UrXfcCxOmLiDFidDLX0581xQ@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 20 Sep 2022 14:43:17 -0400
Message-ID: <CAK-6q+gZDmz85T6SyyvZuH1=_CYu_xuVJB9fKWrFOPfsjB-AtA@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH/RFC dlm/next 6/6] fs: dlm: use a
 non-static queue for callbacks
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Sep 20, 2022 at 2:36 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> Hi,
>
> On Fri, Sep 16, 2022 at 2:43 PM Alexander Aring <aahringo@redhat.com> wrote:
> >
> > This patch will introducde a queue implementation for callbacks by using
> > the Linux lists. The current callback queue handling is implemented by a
> > static limit of 6 entries, see DLM_CALLBACKS_SIZE. The sequence number
> > inside the callback structure was used to see if the entries inside the
> > static entry is valid or not. We don't need any sequence numbers anymore
> > with a dynamic datastructure with grows and shrinks during runtime to
> > offer such functionality.
> >
> > We assume that every callback will be delivered to the DLM user if once
> > queued. Therefore the callback flag DLM_CB_SKIP was dropped and the
> > check for skipping bast was moved before worker handling and not skip
> > while the callback worker executes. This will reduce unnecessary queues
> > of the callback worker.
> >
> > All last callback saves are pointers now and don't need to copied over.
> > There is a reference counter for callback structures which will care
> > about to free the callback structures at the right time if they are not
> > referenced anymore.
> >
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ...
> >
> > -       for (i = 1; i < DLM_CALLBACKS_SIZE; i++) {
> > -               if (!lkb->lkb_callbacks[i].seq)
> > -                       break;
> > -               memcpy(&lkb->lkb_callbacks[i-1], &lkb->lkb_callbacks[i],
> > -                      sizeof(struct dlm_callback));
> > -               memset(&lkb->lkb_callbacks[i], 0, sizeof(struct dlm_callback));
> > -               (*resid)++;
> > -       }
> > -
> > -       /* if cb is a bast, it should be skipped if the blocking mode is
> > -          compatible with the last granted mode */
> > -
> > -       if ((cb->flags & DLM_CB_BAST) && lkb->lkb_last_cast.seq) {
> > -               if (dlm_modes_compat(cb->mode, lkb->lkb_last_cast.mode)) {
> > -                       cb->flags |= DLM_CB_SKIP;
> > -
> > -                       log_debug(ls, "skip %x bast %llu mode %d "
> > -                                 "for cast %llu mode %d",
> > -                                 lkb->lkb_id,
> > -                                 (unsigned long long)cb->seq,
> > -                                 cb->mode,
> > -                                 (unsigned long long)lkb->lkb_last_cast.seq,
> > -                                 lkb->lkb_last_cast.mode);
> > -                       rv = 0;
> > -                       goto out;
> > -               }
> > -       }
> > +       if (flags & DLM_CB_BAST)
> > +               dlm_callback_set_last_ptr(&lkb->lkb_last_bast, cb);
>
> I will change this to have an int lkb->lkb_last_bast_mode, this is
> only used for debugfs and we need to hold a lock to get this
> information. However we only need the mode and this only for debugging
> information... so we copy just the mode value.

since this is debug only, then we move this directly right to the bast
callback call and not when it's enqueued. The others however are for
optimizations and we should not queue callbacks when we know there can
be already skipped and not after dequeuing them.

- Alex

