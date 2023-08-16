Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BB077E08C
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Aug 2023 13:38:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692185881;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tVYUCDvgsgPUSU/RN4M4ke8iz/uVyLHA8je3+UJfQMM=;
	b=HSvu05JTDv0c50kDhOz44u727PccvIY5On8kZi6glvIrHrPMXfncbzQdCTCUy+7QxiZYgi
	umDcyGTCRXGH2p6Q7z+4D0OpfxiVnvaFh1IsXwzAtcFsCvLIDHa7IozmzgzORbeoWdz6pL
	I3jzKcpbiWfntcdp4vL5+IjNfgIiaWs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-wE8hHm4_NeuArPLJyhA6uA-1; Wed, 16 Aug 2023 07:37:56 -0400
X-MC-Unique: wE8hHm4_NeuArPLJyhA6uA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8C17856DED;
	Wed, 16 Aug 2023 11:37:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7171F2026D4B;
	Wed, 16 Aug 2023 11:37:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 06167194658D;
	Wed, 16 Aug 2023 11:37:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CE36C1946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 16 Aug 2023 11:37:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 92CE0C15BAE; Wed, 16 Aug 2023 11:37:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B477C15BAD
 for <cluster-devel@redhat.com>; Wed, 16 Aug 2023 11:37:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F63485CBE5
 for <cluster-devel@redhat.com>; Wed, 16 Aug 2023 11:37:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-W0tAEJwSMTmgopPNbCPPsw-1; Wed, 16 Aug 2023 07:37:47 -0400
X-MC-Unique: W0tAEJwSMTmgopPNbCPPsw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D33CF660EC;
 Wed, 16 Aug 2023 11:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C8BC433C7;
 Wed, 16 Aug 2023 11:37:44 +0000 (UTC)
Message-ID: <88ec807d16a7eb2be252eea0c10e3374c01da1bf.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>, linux-nfs@vger.kernel.org
Date: Wed, 16 Aug 2023 07:37:42 -0400
In-Reply-To: <20230814211116.3224759-3-aahringo@redhat.com>
References: <20230814211116.3224759-1-aahringo@redhat.com>
 <20230814211116.3224759-3-aahringo@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [RFCv2 2/7] lockd: FILE_LOCK_DEFERRED only on
 FL_SLEEP
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-08-14 at 17:11 -0400, Alexander Aring wrote:
> This patch removes to handle non-blocking lock requests as asynchronous
> lock request returning FILE_LOCK_DEFERRED. When fl_lmops and lm_grant()
> is set and a non-blocking lock request returns FILE_LOCK_DEFERRED will
> end in an WARNING to signal the user the misusage of the API.
>=20

Probably need to rephrase the word salad in the first sentence of the
commit log. I had to go over it a few times to understand what was going
on here.

In any case, I'm guessing that the idea here is that GFS2/DLM shouldn't
ever return FILE_LOCK_DEFERRED if this is a non-wait request (i.e.
someone called F_SETLK instead of F_SETLKW)?

That may be ok, but again, lockd goes to great lengths to avoid blocking
and I think it's generally a good idea. If an upcall to DLM can take a
long time, it might be a good idea to continue to allow a !wait request
to return FILE_LOCK_DEFERRED.

I guess this really depends on the current behavior today though. Does
DLM ever return FILE_LOCK_DEFERRED on a non-blocking lock request?


> The reason why we moving to make non-blocking lock request as
> synchronized call is that we already doing this behaviour for unlock or
> cancellation as well. Those are POSIX lock operations which are handled
> in an synchronized way and waiting for an answer. For non-blocking lock
> requests the answer will probably arrive in the same time as unlock or
> cancellation operations as those are trylock operations only.
>=20
> In case of a blocking lock request we need to have it asynchronously
> because the time when the lock request getting granted is unknown.
>=20
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/lockd/svclock.c | 39 +++++++--------------------------------
>  1 file changed, 7 insertions(+), 32 deletions(-)
>=20
> diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> index 7d63524bdb81..1e74a578d7de 100644
> --- a/fs/lockd/svclock.c
> +++ b/fs/lockd/svclock.c
> @@ -440,31 +440,6 @@ static void nlmsvc_freegrantargs(struct nlm_rqst *ca=
ll)
>  =09locks_release_private(&call->a_args.lock.fl);
>  }
> =20
> -/*
> - * Deferred lock request handling for non-blocking lock
> - */
> -static __be32
> -nlmsvc_defer_lock_rqst(struct svc_rqst *rqstp, struct nlm_block *block)
> -{
> -=09__be32 status =3D nlm_lck_denied_nolocks;
> -
> -=09block->b_flags |=3D B_QUEUED;
> -
> -=09nlmsvc_insert_block(block, NLM_TIMEOUT);
> -
> -=09block->b_cache_req =3D &rqstp->rq_chandle;
> -=09if (rqstp->rq_chandle.defer) {
> -=09=09block->b_deferred_req =3D
> -=09=09=09rqstp->rq_chandle.defer(block->b_cache_req);
> -=09=09if (block->b_deferred_req !=3D NULL)
> -=09=09=09status =3D nlm_drop_reply;
> -=09}
> -=09dprintk("lockd: nlmsvc_defer_lock_rqst block %p flags %d status %d\n"=
,
> -=09=09block, block->b_flags, ntohl(status));
> -
> -=09return status;
> -}
> -
>  /*
>   * Attempt to establish a lock, and if it can't be granted, block it
>   * if required.
> @@ -569,14 +544,14 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file=
 *file,
>  =09=09=09ret =3D async_block ? nlm_lck_blocked : nlm_lck_denied;
>  =09=09=09goto out_cb_mutex;
>  =09=09case FILE_LOCK_DEFERRED:
> -=09=09=09block->b_flags |=3D B_PENDING_CALLBACK;
> +=09=09=09/* lock requests without waiters are handled in
> +=09=09=09 * a non async way. Let assert this to inform
> +=09=09=09 * the user about a API violation.
> +=09=09=09 */
> +=09=09=09WARN_ON_ONCE(!wait);
> =20
> -=09=09=09if (wait)
> -=09=09=09=09break;
> -=09=09=09/* Filesystem lock operation is in progress
> -=09=09=09   Add it to the queue waiting for callback */
> -=09=09=09ret =3D nlmsvc_defer_lock_rqst(rqstp, block);
> -=09=09=09goto out_cb_mutex;
> +=09=09=09block->b_flags |=3D B_PENDING_CALLBACK;
> +=09=09=09break;
>  =09=09case -EDEADLK:
>  =09=09=09nlmsvc_remove_block(block);
>  =09=09=09ret =3D nlm_deadlock;

--=20
Jeff Layton <jlayton@kernel.org>

