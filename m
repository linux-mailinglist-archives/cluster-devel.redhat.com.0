Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 234E978D664
	for <lists+cluster-devel@lfdr.de>; Wed, 30 Aug 2023 16:07:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693404439;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KgD6fkmPapoovFcGFmq1gbGl4Kkwy8gPEIrde0UpTGU=;
	b=Nu55/RIL7MGSF6kpWig3qlvBVpD8i0BJ0FyjIi2DmhkmMFyrWJ0baH5hjxR2zMd6rbeWii
	Jd4FcGFAeJSakL0MKePzs+pAgiUSXXS0jQ/HTzWZ5lzdJPzl8RoF6xDMB50XbAMEuL7AhW
	cGBDKKOUMsmPOB/aadlqEDOHMnrrGGc=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-6X6_evMKPziOfuwgTwg9fQ-1; Wed, 30 Aug 2023 10:07:15 -0400
X-MC-Unique: 6X6_evMKPziOfuwgTwg9fQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DE7D1C0DB09;
	Wed, 30 Aug 2023 14:07:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 593FA492C14;
	Wed, 30 Aug 2023 14:07:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0BC5819465B3;
	Wed, 30 Aug 2023 14:07:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 174A61946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 30 Aug 2023 13:46:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D8D541121315; Wed, 30 Aug 2023 13:46:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D187D112131B
 for <cluster-devel@redhat.com>; Wed, 30 Aug 2023 13:46:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4B8085C70D
 for <cluster-devel@redhat.com>; Wed, 30 Aug 2023 13:46:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-AuE4Y33KMMyWTFnbtocfhg-1; Wed, 30 Aug 2023 09:46:30 -0400
X-MC-Unique: AuE4Y33KMMyWTFnbtocfhg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 912ED6264C;
 Wed, 30 Aug 2023 13:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025A4C433C8;
 Wed, 30 Aug 2023 13:46:27 +0000 (UTC)
Message-ID: <35f7ca6a61b0e90a537badf2bea056b76b75cb12.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>
Date: Wed, 30 Aug 2023 09:46:26 -0400
In-Reply-To: <CAK-6q+i+j1TUmWGH+fdYHix5TwujH8_kuR5ayUv9h6Ah8OQecQ@mail.gmail.com>
References: <20230823213352.1971009-1-aahringo@redhat.com>
 <20230823213352.1971009-7-aahringo@redhat.com>
 <9a8ead64cdd32fdad29cae3aff0bd447f33a32c2.camel@kernel.org>
 <CAK-6q+i+j1TUmWGH+fdYHix5TwujH8_kuR5ayUv9h6Ah8OQecQ@mail.gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH 6/7] dlm: use FL_SLEEP to determine
 blocking vs non-blocking
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-08-30 at 08:38 -0400, Alexander Aring wrote:
> Hi,
>=20
> On Fri, Aug 25, 2023 at 2:18=E2=80=AFPM Jeff Layton <jlayton@kernel.org> =
wrote:
> >=20
> > On Wed, 2023-08-23 at 17:33 -0400, Alexander Aring wrote:
> > > This patch uses the FL_SLEEP flag in struct file_lock to determine if
> > > the lock request is a blocking or non-blocking request. Before dlm wa=
s
> > > using IS_SETLKW() was being used which is not usable for lock request=
s
> > > coming from lockd when EXPORT_OP_SAFE_ASYNC_LOCK inside the export fl=
ags
> > > is set.
> > >=20
> > > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > > ---
> > >  fs/dlm/plock.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> > > index 0094fa4004cc..0c6ed5eeb840 100644
> > > --- a/fs/dlm/plock.c
> > > +++ b/fs/dlm/plock.c
> > > @@ -140,7 +140,7 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u6=
4 number, struct file *file,
> > >       op->info.optype         =3D DLM_PLOCK_OP_LOCK;
> > >       op->info.pid            =3D fl->fl_pid;
> > >       op->info.ex             =3D (fl->fl_type =3D=3D F_WRLCK);
> > > -     op->info.wait           =3D IS_SETLKW(cmd);
> > > +     op->info.wait           =3D !!(fl->fl_flags & FL_SLEEP);
> > >       op->info.fsid           =3D ls->ls_global_id;
> > >       op->info.number         =3D number;
> > >       op->info.start          =3D fl->fl_start;
> >=20
> > Not sure you really need the !!, but ok...
> >=20
>=20
> The wait is a byte value and FL_SLEEP doesn't fit into it, I already
> run into problems with it. I don't think somebody does a if (foo->wait
> =3D=3D 1) but it should be set to 1 or 0.
>=20

AIUI, any halfway decent compiler should take the result of the &, and
implicitly cast that properly to bool. Basically, any value other than 0
should be true.

If the compiler just blindly casts the lowest byte though, then you do
need the double-negative.

> An alternative would be: ((fl->fl_flags & FL_SLEEP) =3D=3D FL_SLEEP). I a=
m
> not sure what the coding style says here. I think it's more important
> what the C standard says about !!(condition), but there are other
> users of this in the Linux kernel. :-/

I don't care too much either way, but my understanding was that you
don't need to do the !! trick in most cases with modern compilers.
--=20
Jeff Layton <jlayton@kernel.org>

