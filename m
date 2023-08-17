Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB64B77F52D
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Aug 2023 13:27:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692271640;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sFAix4jGwtSN+vkJEahyRiLV2ysURglgrypVA+E7VXQ=;
	b=iOeNeebKiYClGyMIx1j6bJIwzr1WYAUqKNPonl8y56FfDoevdcIMbQyaOkvhFdyl6yleJU
	udN4JxHIIGT2uV1UJzjrOILsJr5ZIoyUjQkJa866xDNy9HD+LloZeuMOrFZtnf1lOtJRm4
	vOvBqkdYmgDAtqnJ4UZNxlbNP2LY4hQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-VHDorHOyOR6EhWPdEcVjng-1; Thu, 17 Aug 2023 07:27:18 -0400
X-MC-Unique: VHDorHOyOR6EhWPdEcVjng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 321E2188496A;
	Thu, 17 Aug 2023 11:27:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B0D02026D76;
	Thu, 17 Aug 2023 11:27:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A4451194658C;
	Thu, 17 Aug 2023 11:27:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 719981946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Aug 2023 11:27:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4CF47492C3A; Thu, 17 Aug 2023 11:27:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 453E9492C14
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 11:27:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 295AC104F0B0
 for <cluster-devel@redhat.com>; Thu, 17 Aug 2023 11:27:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-cPsld61KNdqQLNPVeMJQkw-1; Thu, 17 Aug 2023 07:27:09 -0400
X-MC-Unique: cPsld61KNdqQLNPVeMJQkw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C8600643B9;
 Thu, 17 Aug 2023 11:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395D4C433C8;
 Thu, 17 Aug 2023 11:27:05 +0000 (UTC)
Message-ID: <bb8806020ade39f6db9d209b0a4a34dc4d69bdb8.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>
Date: Thu, 17 Aug 2023 07:27:04 -0400
In-Reply-To: <CAK-6q+i3oKN3M_kdoQ99hMnzSZyRH1sPdxZ0MQMwp+vSixUhwg@mail.gmail.com>
References: <20230814211116.3224759-1-aahringo@redhat.com>
 <20230814211116.3224759-7-aahringo@redhat.com>
 <bd76489a6b0d2f56f4a68d48b3736fcaf5b5119b.camel@kernel.org>
 <CAK-6q+i3oKN3M_kdoQ99hMnzSZyRH1sPdxZ0MQMwp+vSixUhwg@mail.gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [RFCv2 6/7] dlm: use FL_SLEEP to check if
 blocking request
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-08-16 at 21:19 -0400, Alexander Aring wrote:
> Hi,
>=20
> On Wed, Aug 16, 2023 at 9:07=E2=80=AFAM Jeff Layton <jlayton@kernel.org> =
wrote:
> >=20
> > On Mon, 2023-08-14 at 17:11 -0400, Alexander Aring wrote:
> > > This patch uses the FL_SLEEP flag in struct file_lock to check if it'=
s a
> > > blocking request in case if the request coming from nfs lockd process
> > > indicated by lm_grant() is set.
> > >=20
> > > IF FL_SLEEP is set a asynchronous blocking request is being made and
> > > it's waiting for lm_grant() callback being called to signal the lock =
was
> > > granted. If it's not set a synchronous non-blocking request is being =
made.
> > >=20
> > > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > > ---
> > >  fs/dlm/plock.c | 38 ++++++++++++++++++++++----------------
> > >  1 file changed, 22 insertions(+), 16 deletions(-)
> > >=20
> > > diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> > > index 0094fa4004cc..524771002a2f 100644
> > > --- a/fs/dlm/plock.c
> > > +++ b/fs/dlm/plock.c
> > > @@ -140,7 +140,6 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u6=
4 number, struct file *file,
> > >       op->info.optype         =3D DLM_PLOCK_OP_LOCK;
> > >       op->info.pid            =3D fl->fl_pid;
> > >       op->info.ex             =3D (fl->fl_type =3D=3D F_WRLCK);
> > > -     op->info.wait           =3D IS_SETLKW(cmd);
> > >       op->info.fsid           =3D ls->ls_global_id;
> > >       op->info.number         =3D number;
> > >       op->info.start          =3D fl->fl_start;
> > > @@ -148,24 +147,31 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, =
u64 number, struct file *file,
> > >       op->info.owner =3D (__u64)(long)fl->fl_owner;
> > >       /* async handling */
> > >       if (fl->fl_lmops && fl->fl_lmops->lm_grant) {
> > > -             op_data =3D kzalloc(sizeof(*op_data), GFP_NOFS);
> > > -             if (!op_data) {
> > > -                     dlm_release_plock_op(op);
> > > -                     rv =3D -ENOMEM;
> > > -                     goto out;
> > > -             }
> > > +             if (fl->fl_flags & FL_SLEEP) {
> > > +                     op_data =3D kzalloc(sizeof(*op_data), GFP_NOFS)=
;
> > > +                     if (!op_data) {
> > > +                             dlm_release_plock_op(op);
> > > +                             rv =3D -ENOMEM;
> > > +                             goto out;
> > > +                     }
> > >=20
> > > -             op_data->callback =3D fl->fl_lmops->lm_grant;
> > > -             locks_init_lock(&op_data->flc);
> > > -             locks_copy_lock(&op_data->flc, fl);
> > > -             op_data->fl             =3D fl;
> > > -             op_data->file   =3D file;
> > > +                     op->info.wait =3D 1;
> > > +                     op_data->callback =3D fl->fl_lmops->lm_grant;
> > > +                     locks_init_lock(&op_data->flc);
> > > +                     locks_copy_lock(&op_data->flc, fl);
> > > +                     op_data->fl             =3D fl;
> > > +                     op_data->file   =3D file;
> > >=20
> > > -             op->data =3D op_data;
> > > +                     op->data =3D op_data;
> > >=20
> > > -             send_op(op);
> > > -             rv =3D FILE_LOCK_DEFERRED;
> > > -             goto out;
> > > +                     send_op(op);
> > > +                     rv =3D FILE_LOCK_DEFERRED;
> > > +                     goto out;
> >=20
> > A question...we're returning FILE_LOCK_DEFERRED after the DLM request i=
s
> > sent. If it ends up being blocked, what happens? Does it do a lm_grant
> > downcall with -EAGAIN or something as the result?
> >=20
>=20
> no, when info->wait is set then it is a blocked lock request, which
> means lm_grant() will be called when the lock request is granted.
>=20

Ok, that's probably problematic with the current code too. lockd will
time out the block after 7s, so if the lock isn't granted in that time
it'll give up on it.

> >=20
> > > +             } else {
> > > +                     op->info.wait =3D 0;
> > > +             }
> > > +     } else {
> > > +             op->info.wait =3D IS_SETLKW(cmd);
> > >       }
> > >=20
> > >       send_op(op);
> >=20
> > Looks reasonable overall.
> >=20
> > Now that I look, we have quite a number of places in the kernel that
> > seem to check for F_SETLKW, when what they really want is to check
> > FL_SLEEP.
>=20
> Yes, so far I understand FL_SLEEP is F_SETLKW when you get only
> F_SETLK in case of fl->fl_lmops && fl->fl_lmops->lm_grant is true. It
> is confusing but this is how it works... if it's not set we will get
> F_SETLKW and this should imply FL_SLEEP is set.
>=20
>=20

Yeah. Might be good to consider how to make this more consistent across
the kernel.
--=20
Jeff Layton <jlayton@kernel.org>

