Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 054DE77D1A5
	for <lists+cluster-devel@lfdr.de>; Tue, 15 Aug 2023 20:21:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692123692;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SyQPigQ/vVlCpPaMQpNcJrUkGgE/Vbedg0GxFX/gKMw=;
	b=BPMpWA9adxK0mq//3UBbkc7z1GgSt5bFQD/Jqrn1DMaPEUwot+hhHBUtFfx9q2bIwKEPV5
	6y/qVhJwwrDrpW5XqVZ+U8UFArwt9QwE2oF1alu/19j5nAAcV97OLcpsQBjjN/3GWJ6jUk
	78Mt4mD71DbD6b/XPQEcjHLumIevPQI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-v46FgZdMP1utLjnb4XJpFg-1; Tue, 15 Aug 2023 14:21:28 -0400
X-MC-Unique: v46FgZdMP1utLjnb4XJpFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B63F1C29AE9;
	Tue, 15 Aug 2023 18:21:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B4ED940C207A;
	Tue, 15 Aug 2023 18:21:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8401F194658D;
	Tue, 15 Aug 2023 18:21:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A4DBD1946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 15 Aug 2023 18:21:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4913B2166B2D; Tue, 15 Aug 2023 18:21:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3570A2166B2E
 for <cluster-devel@redhat.com>; Tue, 15 Aug 2023 18:21:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 178393C13929
 for <cluster-devel@redhat.com>; Tue, 15 Aug 2023 18:21:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-L6W9kX_GPReXRcgJhEF63w-1; Tue, 15 Aug 2023 14:21:23 -0400
X-MC-Unique: L6W9kX_GPReXRcgJhEF63w-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 285D264605;
 Tue, 15 Aug 2023 18:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FB7C433C7;
 Tue, 15 Aug 2023 18:21:20 +0000 (UTC)
Message-ID: <350395c8906f46ec4634392adb8a9e3927763ef1.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>, linux-nfs@vger.kernel.org
Date: Tue, 15 Aug 2023 14:21:19 -0400
In-Reply-To: <c049f33344990f74c2b88cc3279a913f6ff6f498.camel@kernel.org>
References: <20230814211116.3224759-1-aahringo@redhat.com>
 <20230814211116.3224759-2-aahringo@redhat.com>
 <c049f33344990f74c2b88cc3279a913f6ff6f498.camel@kernel.org>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [RFCv2 1/7] lockd: fix race in async lock
 request handling
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
Cc: cluster-devel@redhat.com, ocfs2-devel@lists.linux.dev,
 chuck.lever@oracle.com, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Tue, 2023-08-15 at 13:49 -0400, Jeff Layton wrote:
> On Mon, 2023-08-14 at 17:11 -0400, Alexander Aring wrote:
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
> > The introducing of the new B_PENDING_CALLBACK nlm_block flag will handl=
e
> > async lock requests on a pending lock requests as a retry on the caller
> > level to hit the -EAGAIN case.
> >=20
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > ---
> >  fs/lockd/svclock.c          | 100 ++++++++++++++++++++++++++----------
> >  include/linux/lockd/lockd.h |   2 +
> >  2 files changed, 74 insertions(+), 28 deletions(-)
> >=20
> >=20

[...]

> > diff --git a/include/linux/lockd/lockd.h b/include/linux/lockd/lockd.h
> > index f42594a9efe0..91f55458f5fc 100644
> > --- a/include/linux/lockd/lockd.h
> > +++ b/include/linux/lockd/lockd.h
> > @@ -185,10 +185,12 @@ struct nlm_block {
> >  =09struct nlm_file *=09b_file;=09=09/* file in question */
> >  =09struct cache_req *=09b_cache_req;=09/* deferred request handling */
> >  =09struct cache_deferred_req * b_deferred_req
> > +=09struct mutex=09=09b_cb_mutex;=09/* callback mutex */
>=20
> There is no mention at all of this new mutex in the changelog or
> comments. It's not at all clear to me what this is intended to protect.
> In general, with lockd being a single-threaded service, we want to avoid
> sleeping locks. This will need some clear justification.
>=20
> At a glance, it looks like you're trying to use this to hold
> B_PENDING_CALLBACK steady while a lock request is being handled. That
> suggests that you're using this mutex to serialize access to a section
> of code and not one or more specific data structures. We usually like to
> avoid that sort of thing, since locks that protect arbitrary sections of
> code become difficult to work with over time.
>=20
> I'm going to go out on a limb here though and suggest that there is
> probably a way to solve this problem that doesn't involve adding new
> locks.
>=20
> >  =09unsigned int=09=09b_flags;=09/* block flags */
> >  #define B_QUEUED=09=091=09/* lock queued */
> >  #define B_GOT_CALLBACK=09=092=09/* got lock or conflicting lock */
> >  #define B_TIMED_OUT=09=094=09/* filesystem too slow to respond */
> > +#define B_PENDING_CALLBACK=098=09/* pending callback for lock request =
*/
> >  };
> > =20
> >  /*
>=20
> Do we need this new flag at all? It seems redundant. If we have a block
> on the list, then it is sort of by definition "pending callback". If
> it's not on the list anymore, then it's not. No?
>=20

Do we need anything more than a patch along these lines? Note that this
is untested, so RFC:

---------------------8<-----------------------

[RFC PATCH] lockd: alternate fix for race between deferred lock and grant

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/lockd/svclock.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
index c43ccdf28ed9..e9a84363c26e 100644
--- a/fs/lockd/svclock.c
+++ b/fs/lockd/svclock.c
@@ -446,6 +446,8 @@ nlmsvc_defer_lock_rqst(struct svc_rqst *rqstp, struct n=
lm_block *block)
=20
 =09block->b_flags |=3D B_QUEUED;
=20
+=09/* FIXME: remove and reinsert w/o dropping spinlock */
+=09nlmsvc_remove_block(block);
 =09nlmsvc_insert_block(block, NLM_TIMEOUT);
=20
 =09block->b_cache_req =3D &rqstp->rq_chandle;
@@ -535,6 +537,9 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *fi=
le,
 =09if (!wait)
 =09=09lock->fl.fl_flags &=3D ~FL_SLEEP;
 =09mode =3D lock_to_openmode(&lock->fl);
+
+=09/* Append to list of blocked */
+=09nlmsvc_insert_block(block, NLM_NEVER);
 =09error =3D vfs_lock_file(file->f_file[mode], F_SETLK, &lock->fl, NULL);
 =09lock->fl.fl_flags &=3D ~FL_SLEEP;
=20
@@ -542,6 +547,7 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *fi=
le,
 =09switch (error) {
 =09=09case 0:
 =09=09=09ret =3D nlm_granted;
+=09=09=09nlmsvc_remove_block(block);
 =09=09=09goto out;
 =09=09case -EAGAIN:
 =09=09=09/*
@@ -552,6 +558,7 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *fi=
le,
 =09=09=09if (wait)
 =09=09=09=09break;
 =09=09=09ret =3D async_block ? nlm_lck_blocked : nlm_lck_denied;
+=09=09=09nlmsvc_remove_block(block);
 =09=09=09goto out;
 =09=09case FILE_LOCK_DEFERRED:
 =09=09=09if (wait)
@@ -570,8 +577,6 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *fi=
le,
=20
 =09ret =3D nlm_lck_blocked;
=20
-=09/* Append to list of blocked */
-=09nlmsvc_insert_block(block, NLM_NEVER);
 out:
 =09mutex_unlock(&file->f_mutex);
 =09nlmsvc_release_block(block);
--=20
2.41.0


