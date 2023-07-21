Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A2A75CFED
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Jul 2023 18:43:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689957826;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o5Ee45XcGODKlJUM7/MDzUdk7SOaDtyc93kB/LptUmY=;
	b=d2XKNC+nTTtC4xhzzJv0Eg+zqtOVVTjzzZHx0j9Ig/J9MiiG9OGC395zFY91tAwpwuiSEe
	P6xjnmjze6TB2XOTmoFE+4uuQHi/2uFbM6IE8CelzQC6UOyGtwo4gf0Tcw6p5j17lYTTjv
	zNxuEu0+UbKfjOiE5GinyrD0msL4EAY=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-PLcGSE0aMC-b6nrs6jYjcQ-1; Fri, 21 Jul 2023 12:43:43 -0400
X-MC-Unique: PLcGSE0aMC-b6nrs6jYjcQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C582D2804625;
	Fri, 21 Jul 2023 16:43:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7599C40C6CCC;
	Fri, 21 Jul 2023 16:43:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2D6111946A74;
	Fri, 21 Jul 2023 16:43:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 659ED1946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Jul 2023 16:43:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F27F2492B03; Fri, 21 Jul 2023 16:43:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA671492B02
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 16:43:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCC3588D580
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 16:43:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-EiWJ9qS5OnWOSalSzlB0Pw-1; Fri, 21 Jul 2023 12:43:33 -0400
X-MC-Unique: EiWJ9qS5OnWOSalSzlB0Pw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2146C61D52;
 Fri, 21 Jul 2023 16:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF2AC433C8;
 Fri, 21 Jul 2023 16:43:30 +0000 (UTC)
Message-ID: <44d48d5a78159bcf8d52d3213ac6d684e148ebfd.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>, chuck.lever@oracle.com
Date: Fri, 21 Jul 2023 12:43:29 -0400
In-Reply-To: <CAK-6q+gaX6v0aiaKB=STd_QWCyujX_bh-7uJ+Kfsu2GRVCCc6g@mail.gmail.com>
References: <20230720125806.1385279-1-aahringo@redhat.com>
 <20230720125806.1385279-2-aahringo@redhat.com>
 <CAK-6q+gaX6v0aiaKB=STd_QWCyujX_bh-7uJ+Kfsu2GRVCCc6g@mail.gmail.com>
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
Subject: Re: [Cluster-devel] [RFC v6.5-rc2 2/3] fs: lockd: fix race in async
 lock request handling
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
Cc: cluster-devel@redhat.com, linux-nfs@vger.kernel.org, neilb@suse.de,
 Dai.Ngo@oracle.com, tom@talpey.com, kolga@netapp.com, anna@kernel.org,
 trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2023-07-21 at 09:09 -0400, Alexander Aring wrote:
> Hi,
>=20
> On Thu, Jul 20, 2023 at 8:58=E2=80=AFAM Alexander Aring <aahringo@redhat.=
com> wrote:
> >=20
> > This patch fixes a race in async lock request handling between adding
> > the relevant struct nlm_block to nlm_blocked list after the request was
> > sent by vfs_lock_file() and nlmsvc_grant_deferred() does a lookup of th=
e
> > nlm_block in the nlm_blocked list. It could be that the async request i=
s
> > completed before the nlm_block was added to the list. This would end
> > in a -ENOENT and a kernel log message of "lockd: grant for unknown
> > block".
> >=20
> > To solve this issue we add the nlm_block before the vfs_lock_file() cal=
l
> > to be sure it has been added when a possible nlmsvc_grant_deferred() is
> > called. If the vfs_lock_file() results in an case when it wouldn't be
> > added to nlm_blocked list, the nlm_block struct will be removed from
> > this list again.
> >=20
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > ---
> >  fs/lockd/svclock.c          | 80 +++++++++++++++++++++++++++----------
> >  include/linux/lockd/lockd.h |  1 +
> >  2 files changed, 60 insertions(+), 21 deletions(-)
> >=20
> > diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> > index 28abec5c451d..62ef27a69a9e 100644
> > --- a/fs/lockd/svclock.c
> > +++ b/fs/lockd/svclock.c
> > @@ -297,6 +297,8 @@ static void nlmsvc_free_block(struct kref *kref)
> >=20
> >         dprintk("lockd: freeing block %p...\n", block);
> >=20
> > +       WARN_ON_ONCE(block->b_flags & B_PENDING_CALLBACK);
> > +
> >         /* Remove block from file's list of blocks */
> >         list_del_init(&block->b_flist);
> >         mutex_unlock(&file->f_mutex);
> > @@ -543,6 +545,12 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_fil=
e *file,
> >                 goto out;
> >         }
> >=20
> > +       if (block->b_flags & B_PENDING_CALLBACK)
> > +               goto pending_request;
> > +
> > +       /* Append to list of blocked */
> > +       nlmsvc_insert_block(block, NLM_NEVER);
> > +
> >         if (!wait)
> >                 lock->fl.fl_flags &=3D ~FL_SLEEP;
> >         mode =3D lock_to_openmode(&lock->fl);
> > @@ -552,9 +560,13 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_fil=
e *file,
> >         dprintk("lockd: vfs_lock_file returned %d\n", error);
> >         switch (error) {
> >                 case 0:
> > +                       nlmsvc_remove_block(block);
>=20
> reacting here with nlmsvc_remove_block() assumes that the block was
> not being added to the nlm_blocked list before nlmsvc_insert_block()
> was called. I am not sure if this is always the case here.
>=20
> Does somebody see a problem with that?
>=20

The scenario is: we have a block on the list already and now another
lock request comes in for the same thing: the client decided to just re-
poll for the lock. That's a plausible scenario. I think the Linux NLM
client will poll for locks periodically.

In this case though, the lock request was granted by the filesystem, so
this is likely racing with (and winning vs.) a lm_grant callback. Given
that the client decided to repoll for it, we're probably safe to just
dequeue the block and respond here, and not worry about sending a grant
callback.

Ditto for the other cases where the block is removed.

> >                         ret =3D nlm_granted;
> >                         goto out;
> >                 case -EAGAIN:
> > +                       if (!wait)
> > +                               nlmsvc_remove_block(block);

I was thinking that it would be best to not insert a block at all in the
!wait case, but it looks like DLM just returns DEFERRED and almost
always does a callback, even when it's not a blocking lock request?

Anyway, I think we probably do have to handle this like you are.

> > +pending_request:
> >                         /*
> >                          * If this is a blocking request for an
> >                          * already pending lock request then we need
> > @@ -565,6 +577,8 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file=
 *file,
> >                         ret =3D async_block ? nlm_lck_blocked : nlm_lck=
_denied;
> >                         goto out;
> >                 case FILE_LOCK_DEFERRED:
> > +                       block->b_flags |=3D B_PENDING_CALLBACK;
> > +
> >                         if (wait)
> >                                 break;
> >                         /* Filesystem lock operation is in progress
> > @@ -572,17 +586,16 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_fi=
le *file,
> >                         ret =3D nlmsvc_defer_lock_rqst(rqstp, block);
> >                         goto out;
> >                 case -EDEADLK:
> > +                       nlmsvc_remove_block(block);
> >                         ret =3D nlm_deadlock;
> >                         goto out;
> >                 default:                        /* includes ENOLCK */
> > +                       nlmsvc_remove_block(block);
> >                         ret =3D nlm_lck_denied_nolocks;
> >                         goto out;
> >         }
> >=20
> >         ret =3D nlm_lck_blocked;
> > -
> > -       /* Append to list of blocked */
> > -       nlmsvc_insert_block(block, NLM_NEVER);
> >  out:
> >         mutex_unlock(&file->f_mutex);
> >         nlmsvc_release_block(block);
> > @@ -739,34 +752,59 @@ nlmsvc_update_deferred_block(struct nlm_block *bl=
ock, int result)
> >                 block->b_flags |=3D B_TIMED_OUT;
> >  }
>=20
> - Alex
>=20

--=20
Jeff Layton <jlayton@kernel.org>

