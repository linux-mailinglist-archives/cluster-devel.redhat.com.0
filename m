Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C71872E42C
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Jun 2023 15:33:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686663225;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gwbc96u7yB6oG77glVpSwjMPF8jf6ngpPJbAz3a0kyo=;
	b=c9/tYCFdTwWE9UibJuxYBKwQDb6LG6FFLEN+XbvKZHTyehqW9qiZO9js6sx42rrSb8TyEk
	lQNwqSM9ZkES2WOT0ijN3CwvcCJzB7+8ai1m9hjAgGMs/1wZV8gfk/fS61NnbesnTrsxvb
	lx+9NDlBlJn27cAcRgiZElqjQO0YIRU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-aO9SsZ9nPNOeynNt43nrBQ-1; Tue, 13 Jun 2023 09:33:41 -0400
X-MC-Unique: aO9SsZ9nPNOeynNt43nrBQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1548D28135A9;
	Tue, 13 Jun 2023 13:33:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8DA1492C1B;
	Tue, 13 Jun 2023 13:33:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4ED621946A46;
	Tue, 13 Jun 2023 13:33:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5B977194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue, 13 Jun 2023 13:33:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2077D178B4; Tue, 13 Jun 2023 13:33:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 196A5175AE
 for <cluster-devel@redhat.com>; Tue, 13 Jun 2023 13:33:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6D22185A78E
 for <cluster-devel@redhat.com>; Tue, 13 Jun 2023 13:33:30 +0000 (UTC)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-VYGfJBCJPaGCwCJgYoT35A-1; Tue, 13 Jun 2023 09:33:29 -0400
X-MC-Unique: VYGfJBCJPaGCwCJgYoT35A-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-650924b89edso3265391b3a.2
 for <cluster-devel@redhat.com>; Tue, 13 Jun 2023 06:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686663207; x=1689255207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gwbc96u7yB6oG77glVpSwjMPF8jf6ngpPJbAz3a0kyo=;
 b=iKzJdn3GJNwN1eXs7tLIrSBg648KXlPhmHyRxdo8isSlLNTgKYEYyM7hGt2NH5X4nW
 8jb4rLn1Ng6CghttLydtoHkNt/aY8A6DMEzzSDYjpDksc/iOUZs6vI3I6gnyCHrMDMwO
 5VoWCjr58k2V9ORMj+2ugz3gxxwcASwiZAwGra0RRPH2iah2SMlh3HITL+4WYIvrVu/D
 U+sHxkZ2+7b/gy9pJg84u1/Q4zfN8D27sqtjUC7qn6LLbWttGXz/mxVMHxae2zac1rxd
 UMH4CzMLcr7emdVXnK/xir/EkbZR5grCg95MmHh8ESskZYxLwSCfSzbX3gN/Yq4gfDWC
 Yffw==
X-Gm-Message-State: AC+VfDwEyMj0DYtMDFMNh5HDb6ZH/1gSbs/SkeB8EE9Ns5STf+XR7p7p
 m5OPhDtRGIXsAmR3k1T8qM+msk657gB2/7CLSpndo9RREGFCG5bAc1V66hTfoGIy0PjWFvPSYCP
 YHyKXmiSPm2BudsDwk1Oa6ZnyJjwRtQbKFzBUtYkUSYruYJjl
X-Received: by 2002:a05:6a20:7f97:b0:10e:ce12:356c with SMTP id
 d23-20020a056a207f9700b0010ece12356cmr12628987pzj.17.1686663207464; 
 Tue, 13 Jun 2023 06:33:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fSiUrDusWLBotd9ppwIKdHMKm1n+/EbyDUrf8CZn80ej8vYiO3sQvWXQbPyTCS8MSqJKZadK0/zETK94dY6A=
X-Received: by 2002:a05:6a20:7f97:b0:10e:ce12:356c with SMTP id
 d23-20020a056a207f9700b0010ece12356cmr12628963pzj.17.1686663207047; Tue, 13
 Jun 2023 06:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230612163347.1293077-1-agruenba@redhat.com>
 <20230612163347.1293077-7-agruenba@redhat.com>
 <CAK-6q+i4yy8-T1SPVC=nwQQNtszxzP+uqsG7Jx4zNz44mPqjXA@mail.gmail.com>
In-Reply-To: <CAK-6q+i4yy8-T1SPVC=nwQQNtszxzP+uqsG7Jx4zNz44mPqjXA@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 13 Jun 2023 15:33:15 +0200
Message-ID: <CAHc6FU4_Z-AsHHLNk6Qg_nCwYEDL2s92sCt8oMvWTq8cogAV0g@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 6/8] gfs2: Rework freeze / thaw logic
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
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 3:05=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
> Hi Andreas,
>
> On Mon, Jun 12, 2023 at 12:33=E2=80=AFPM Andreas Gruenbacher
> <agruenba@redhat.com> wrote:
> ...
> >
> > @@ -152,24 +151,18 @@ static void signal_our_withdraw(struct gfs2_sbd *=
sdp)
> >          */
> >         clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
> >         if (!sb_rdonly(sdp->sd_vfs)) {
> > -               struct gfs2_holder freeze_gh;
> > -
> > -               gfs2_holder_mark_uninitialized(&freeze_gh);
> > -               if (sdp->sd_freeze_gl &&
> > -                   !gfs2_glock_is_locked_by_me(sdp->sd_freeze_gl)) {
> > -                       ret =3D gfs2_freeze_lock_shared(sdp, &freeze_gh=
,
> > -                                       log_write_allowed ? 0 : LM_FLAG=
_TRY);
> > -                       if (ret =3D=3D GLR_TRYFAILED)
> > -                               ret =3D 0;
> > -               }
> > -               if (!ret)
> > -                       gfs2_make_fs_ro(sdp);
> > +               bool locked =3D mutex_trylock(&sdp->sd_freeze_mutex);
> > +
> > +               gfs2_make_fs_ro(sdp);
> > +
> > +               if (locked)
> > +                       mutex_unlock(&sdp->sd_freeze_mutex);
>
> I am not sure if I overlooked something here, for me it looks like the
> application does not care about if sd_freeze_mutex is locked or not
> because the introduced locked boolean will never be evaluated?
>
> What am I missing here?

This is to withdraw the filesystem. We're trying to acquire
sd_freeze_mutex to prevent local races, but if we can't get it, we
still go ahead and mark the filesystem read-only. Then we unlock
sd_freeze_mutex, but only if we've locked it before. This is a bit
ugly, but I don't have any better ideas right now.

Thanks,
Andreas

