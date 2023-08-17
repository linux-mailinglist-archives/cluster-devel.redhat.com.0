Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7F177EEAC
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Aug 2023 03:24:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692235450;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XjasKeXZqylsbZptWllQNMerqPBUwmOArgVba6SAq8Q=;
	b=Nai/0pJdN0V6KfCSXSyLQM9bq6x+P9C9R4zwPLgLqA3wIl8P/4py0+ICpV7PpPzO97J9g6
	YLfP+6decC4GbKfyvDx/w9h05nshwPD8YeLwt6Q/0DpkNHIQwsw7fezYQnpYkrwgAhGn95
	WYx3RHWLrGkhUCvT8IgTT1b5fRv/6Tw=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-JePEgREgOqOXux3-Hq68BQ-1; Wed, 16 Aug 2023 21:24:04 -0400
X-MC-Unique: JePEgREgOqOXux3-Hq68BQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2610B3C0C4A3;
	Thu, 17 Aug 2023 01:24:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1ADF140C207A;
	Thu, 17 Aug 2023 01:24:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CB3CE194658C;
	Thu, 17 Aug 2023 01:24:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EBC131946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Aug 2023 01:24:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D4C0D40D283A; Thu, 17 Aug 2023 01:24:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD61540D2839
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 01:24:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EEE3185A78B
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 01:24:01 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-NNyamJBeORODK13q5aNQfA-1; Wed, 16 Aug 2023 21:24:00 -0400
X-MC-Unique: NNyamJBeORODK13q5aNQfA-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5218b9647a8so4328693a12.1
 for <cluster-devel@redhat.com>; Wed, 16 Aug 2023 18:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692235439; x=1692840239;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XjasKeXZqylsbZptWllQNMerqPBUwmOArgVba6SAq8Q=;
 b=hpvcSB0x3UAdIfGJH22sPhhtlzaIYwZkfT1L7S9TurlWrWbQtmxGpmLyQglvi9pB+C
 q+d4OCuXLFGao+/AGKdWi3oNeHaxA+Lsc4eu8FPq15+R4jq5NFBeRxLQT+XGO4w6mrMH
 oKOvmtf8dUDkUm4aFxWunpNOxHK2YAgJoPKs2+Gfqp2coB+1aUGotjEpSNEwDDWI2UJI
 O7EmXeuCm3raP2N240U76qhDCCGmTdsy2PJ+cQXNZJOqoXrE3OClkZ9ZnYX+NfIrY/rB
 7eCPzbQkN/lffB2JoddY2zw8VJ6BnVFhWf/6dW/gOcpp3iMFhz5Ru55XJmBtR8nqScBu
 JK9A==
X-Gm-Message-State: AOJu0YwuK144tF4lZVR9MLzBZuzxdpNrg24ewJ6hn7I142gEGcpK9jZ1
 9rQTOX8g8UMvf3yL1HvwlrVODjJmJ2kVI66RHL1P85JapaxsvQwEl4nsz4amHx2zrHOolHVlIto
 N6myK0MuwIEE4y3NFdLCQ1ymjbRZbgbD/HbzEZw==
X-Received: by 2002:aa7:c545:0:b0:524:5e4c:2fa4 with SMTP id
 s5-20020aa7c545000000b005245e4c2fa4mr2839448edr.14.1692235438943; 
 Wed, 16 Aug 2023 18:23:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXDmfKQ7ys1l6lXBj07FDJ7WlcIO7oafTPjac90Yx5immK+W1gBVjH7vhGznIaT59kMvjiA8PZ+Qat0vf3KLE=
X-Received: by 2002:aa7:c545:0:b0:524:5e4c:2fa4 with SMTP id
 s5-20020aa7c545000000b005245e4c2fa4mr2839440edr.14.1692235438645; Wed, 16 Aug
 2023 18:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230814211116.3224759-1-aahringo@redhat.com>
 <20230814211116.3224759-5-aahringo@redhat.com>
 <ca18531b54306d27218daf8e90b72ef3a4b8e44f.camel@kernel.org>
In-Reply-To: <ca18531b54306d27218daf8e90b72ef3a4b8e44f.camel@kernel.org>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 16 Aug 2023 21:23:47 -0400
Message-ID: <CAK-6q+iTe86JKqeEsfUanwmu6wOxz=CqL_H_NEiq2vZ8PwcWQA@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [RFCv2 4/7] locks: update lock callback
 documentation
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
Cc: linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 ocfs2-devel@lists.linux.dev, chuck.lever@oracle.com, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 16, 2023 at 8:01=E2=80=AFAM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Mon, 2023-08-14 at 17:11 -0400, Alexander Aring wrote:
> > This patch updates the existing documentation regarding recent changes
> > to vfs_lock_file() and lm_grant() is set. In case of lm_grant() is set
> > we only handle FILE_LOCK_DEFERRED in case of FL_SLEEP in fl_flags is no=
t
> > set. This is the case of an blocking lock request. Non-blocking lock
> > requests, when FL_SLEEP is not set, are handled in a synchronized way.
> >
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > ---
> >  fs/locks.c | 28 ++++++++++++++--------------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> >
> > diff --git a/fs/locks.c b/fs/locks.c
> > index df8b26a42524..a8e51f462b43 100644
> > --- a/fs/locks.c
> > +++ b/fs/locks.c
> > @@ -2255,21 +2255,21 @@ int fcntl_getlk(struct file *filp, unsigned int=
 cmd, struct flock *flock)
> >   * To avoid blocking kernel daemons, such as lockd, that need to acqui=
re POSIX
> >   * locks, the ->lock() interface may return asynchronously, before the=
 lock has
> >   * been granted or denied by the underlying filesystem, if (and only i=
f)
> > - * lm_grant is set. Callers expecting ->lock() to return asynchronousl=
y
> > - * will only use F_SETLK, not F_SETLKW; they will set FL_SLEEP if (and=
 only if)
> > - * the request is for a blocking lock. When ->lock() does return async=
hronously,
> > - * it must return FILE_LOCK_DEFERRED, and call ->lm_grant() when the l=
ock
> > - * request completes.
> > - * If the request is for non-blocking lock the file system should retu=
rn
> > - * FILE_LOCK_DEFERRED then try to get the lock and call the callback r=
outine
> > - * with the result. If the request timed out the callback routine will=
 return a
> > + * lm_grant and FL_SLEEP in fl_flags is set. Callers expecting ->lock(=
) to return
> > + * asynchronously will only use F_SETLK, not F_SETLKW; When ->lock() d=
oes return
>
> Isn't the above backward? Shouldn't it say "Callers expecting ->lock()
> to return asynchronously will only use F_SETLKW, not F_SETLK" ?
>

So far I know lockd will always use F_SETLK only, if it's a blocking
or non-blocking request you need to evaluate FL_SLEEP. But if
lm_grant() is not set we are using a check on cmd if it's F_SETLK or
F_SETLKW to check if it's non-blocking or blocking.

If lm_grant() is set and checking on F_SETLKW should never be the
case, because it will never be true (speaking from lockd point of
view).

- Alex

