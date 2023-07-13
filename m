Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4A67525CD
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Jul 2023 16:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689260276;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TH13VfP2krZahoQXK1VgL3LTSEeQF913+yNrAS5vlAs=;
	b=BD1c3bfigbqN36Nhuks3QAhpHgkujw6IuoSZ7sN0d9XGnl8e6Z5DHdnv7Cw+8FrwrxwKVx
	y2t2WQuVNuWwIJ5m1k0SAKG8QU++5a2KL3U01nSro0TpcKxCFXNrzIhKT3gtyG6gX0j4DR
	3QQppp20GtkPRR4lMKcXAhYsdlsrKvU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-Bl5yby4VOwWBSMZJnsKonQ-1; Thu, 13 Jul 2023 10:57:51 -0400
X-MC-Unique: Bl5yby4VOwWBSMZJnsKonQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5845856F67;
	Thu, 13 Jul 2023 14:57:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E23C200BA8B;
	Thu, 13 Jul 2023 14:57:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7C1E419465A0;
	Thu, 13 Jul 2023 14:57:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0EF34194658F for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Jul 2023 14:57:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E0646200B406; Thu, 13 Jul 2023 14:57:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9119200AD6E
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 14:57:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B77DB1C16606
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 14:57:47 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-y3URD7PDPq-AcJvK1bsIqg-1; Thu, 13 Jul 2023 10:57:45 -0400
X-MC-Unique: y3URD7PDPq-AcJvK1bsIqg-1
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-3a3b8b73cbeso1113521b6e.1
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 07:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689260264; x=1691852264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TH13VfP2krZahoQXK1VgL3LTSEeQF913+yNrAS5vlAs=;
 b=gibiPb5DOV1HTfzBsHjGNS7d0Q6bS1tUgYMYEgh/inJvVqA6gDJm1P6C94zK1dlG2X
 rm4SGaapUvElVGGYgGq/Q7D7rKixS0SII18xWFyfteSAZlaFKp+uHB3xwrb+z0TKuFj6
 cspi7U6IaOYGYbNUmY8MMRukI0/J6AHtopSzS0imn0d2NZXFVd5EoxN4aCtWNEUeaBrI
 UF3GIjEhUU23eV2IMCG38gceoi5cUCRzY0W5qaEn3wN+kqEQ2b4WoQ1tYqEC/tWlxMqi
 CUkCr3v5AkgWtl6pvyX5B4RGZsLYTsn6zV2lstxHFyvEIZJjan4bL1pOn5WCr2DZ9YDA
 57lQ==
X-Gm-Message-State: ABy/qLYJ9CUpYuOApW+26N+ILoobXECPpXPd7LSQkjfXwmp7OVoWp4/M
 iOLSZV1ITkbOTFS3f7SLcqi+xGeJZLNwwD6mLVwiXrNjfwUm8IlFPfIhwmEhDzh/y7XWpGwD9bp
 BoVZl1zE2f91B1ziTv2qMKdK7TwGJlLsK72azXg==
X-Received: by 2002:a05:6808:171c:b0:3a3:4314:8dc0 with SMTP id
 bc28-20020a056808171c00b003a343148dc0mr1718885oib.5.1689260264753; 
 Thu, 13 Jul 2023 07:57:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGOhi9e7cYssZgb0dhMgRqQx9O0JPjhqJ2SiCjY+KBIIso6xxDnNiONR+hOOjcFCqb0Oz4LhwleGXARikiM/is=
X-Received: by 2002:a05:6808:171c:b0:3a3:4314:8dc0 with SMTP id
 bc28-20020a056808171c00b003a343148dc0mr1718874oib.5.1689260264494; Thu, 13
 Jul 2023 07:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230713144029.3342637-1-aahringo@redhat.com>
 <2023071318-traffic-impeding-dc64@gregkh>
In-Reply-To: <2023071318-traffic-impeding-dc64@gregkh>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 13 Jul 2023 10:57:33 -0400
Message-ID: <CAK-6q+j+vQL7nPnr==ZzgWfVoV9idX6k2OT0R_1DJ_qJo4J6mw@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH v6.5-rc1 1/2] fs: dlm: introduce
 DLM_PLOCK_FL_NO_REPLY flag
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 13, 2023 at 10:49=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Thu, Jul 13, 2023 at 10:40:28AM -0400, Alexander Aring wrote:
> > This patch introduces a new flag DLM_PLOCK_FL_NO_REPLY in case an dlm
> > plock operation should not send a reply back. Currently this is kind of
> > being handled in DLM_PLOCK_FL_CLOSE, but DLM_PLOCK_FL_CLOSE has more
> > meanings that it will remove all waiters for a specific nodeid/owner
> > values in by doing a unlock operation. In case of an error in dlm user
> > space software e.g. dlm_controld we get an reply with an error back.
> > This cannot be matched because there is no op to match in recv_list. We
> > filter now on DLM_PLOCK_FL_NO_REPLY in case we had an error back as
> > reply. In newer dlm_controld version it will never send a result back
> > when DLM_PLOCK_FL_NO_REPLY is set. This filter is a workaround to handl=
e
> > older dlm_controld versions.
> >
> > Fixes: 901025d2f319 ("dlm: make plock operation killable")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
>
> Why is adding a new uapi a stable patch?
>

because the user space is just to copy the flags back to the kernel. I
thought it would work. :)

> > ---
> >  fs/dlm/plock.c                 | 23 +++++++++++++++++++----
> >  include/uapi/linux/dlm_plock.h |  1 +
> >  2 files changed, 20 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> > index 70a4752ed913..7fe9f4b922d3 100644
> > --- a/fs/dlm/plock.c
> > +++ b/fs/dlm/plock.c
> > @@ -96,7 +96,7 @@ static void do_unlock_close(const struct dlm_plock_in=
fo *info)
> >       op->info.end            =3D OFFSET_MAX;
> >       op->info.owner          =3D info->owner;
> >
> > -     op->info.flags |=3D DLM_PLOCK_FL_CLOSE;
> > +     op->info.flags |=3D (DLM_PLOCK_FL_CLOSE | DLM_PLOCK_FL_NO_REPLY);
> >       send_op(op);
> >  }
> >
> > @@ -293,7 +293,7 @@ int dlm_posix_unlock(dlm_lockspace_t *lockspace, u6=
4 number, struct file *file,
> >               op->info.owner  =3D (__u64)(long) fl->fl_owner;
> >
> >       if (fl->fl_flags & FL_CLOSE) {
> > -             op->info.flags |=3D DLM_PLOCK_FL_CLOSE;
> > +             op->info.flags |=3D (DLM_PLOCK_FL_CLOSE | DLM_PLOCK_FL_NO=
_REPLY);
> >               send_op(op);
> >               rv =3D 0;
> >               goto out;
> > @@ -392,7 +392,7 @@ static ssize_t dev_read(struct file *file, char __u=
ser *u, size_t count,
> >       spin_lock(&ops_lock);
> >       if (!list_empty(&send_list)) {
> >               op =3D list_first_entry(&send_list, struct plock_op, list=
);
> > -             if (op->info.flags & DLM_PLOCK_FL_CLOSE)
> > +             if (op->info.flags & DLM_PLOCK_FL_NO_REPLY)
> >                       list_del(&op->list);
> >               else
> >                       list_move_tail(&op->list, &recv_list);
> > @@ -407,7 +407,7 @@ static ssize_t dev_read(struct file *file, char __u=
ser *u, size_t count,
> >          that were generated by the vfs cleaning up for a close
> >          (the process did not make an unlock call). */
> >
> > -     if (op->info.flags & DLM_PLOCK_FL_CLOSE)
> > +     if (op->info.flags & DLM_PLOCK_FL_NO_REPLY)
> >               dlm_release_plock_op(op);
> >
> >       if (copy_to_user(u, &info, sizeof(info)))
> > @@ -433,6 +433,21 @@ static ssize_t dev_write(struct file *file, const =
char __user *u, size_t count,
> >       if (check_version(&info))
> >               return -EINVAL;
> >
> > +     /* Some old dlm user space software will send replies back,
> > +      * even if DLM_PLOCK_FL_NO_REPLY is set (because the flag is
> > +      * new) e.g. if a error occur. We can't match them in recv_list
> > +      * because they were never be part of it. We filter it here,
> > +      * new dlm user space software will filter it in user space.
> > +      *
> > +      * In future this handling can be removed.
> > +      */
> > +     if (info.flags & DLM_PLOCK_FL_NO_REPLY) {
> > +             pr_info("Received unexpected reply from op %d, "
> > +                     "please update DLM user space software!\n",
> > +                     info.optype);
>
> Never allow userspace to spam the kernel log.  And this is not going to
> work, you need to handle the error and at most, report this to userspace
> once.
>

I will ignore handling this issue for older kernels because it would
probably be fine that the user space never gets an invalid value
handled.

> Also, don't wrap your strings, checkpatch should have told you this.
>

That is correct and I was ignoring it as the implementation has
another wrapped string somewhere else. It is a warning not an error.

Will send a v2 to not wrap the string around and drop Fixes and cc stable.

- Alex

