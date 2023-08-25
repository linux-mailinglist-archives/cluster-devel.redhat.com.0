Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D72D788E66
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Aug 2023 20:16:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692987376;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Yuddz7HBRsoh90XmgHvOfAw2NXRoHGSJs7/pl1mOl3A=;
	b=YxheurYizRnQCp/1RKaSJQ/ZwiwnOL4NBfN/Dv/yBF89IulcDh8CvxbiiK1bcyFz/TzZPz
	WJ6XSoFaMxxKBeUDPeb1Y8p3vmhcyAskcohgPdHiKzDsnlwqz4IAK4LntDcwZtLHC7nQMJ
	CW31zYJ7fOOX0Um7vrelpqBC8RxCdMA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-8Jvhchs0P1WzD1j-xZCyfA-1; Fri, 25 Aug 2023 14:16:14 -0400
X-MC-Unique: 8Jvhchs0P1WzD1j-xZCyfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 649EF101A53C;
	Fri, 25 Aug 2023 18:16:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 50741C1602B;
	Fri, 25 Aug 2023 18:16:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0E53D19465B3;
	Fri, 25 Aug 2023 18:16:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5AC8819465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 18:16:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2DF84C1602E; Fri, 25 Aug 2023 18:16:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26B6BC1602B
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 18:16:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AE37185A78B
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 18:16:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-znFOQG7WM4KnBmPiae7zyw-1; Fri, 25 Aug 2023 14:16:07 -0400
X-MC-Unique: znFOQG7WM4KnBmPiae7zyw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 438EF63CED;
 Fri, 25 Aug 2023 18:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40DDC433C8;
 Fri, 25 Aug 2023 18:16:04 +0000 (UTC)
Message-ID: <dc4cb39baf9e8d503e0c79ddc4d1ada1eba97ecb.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>, linux-nfs@vger.kernel.org
Date: Fri, 25 Aug 2023 14:16:03 -0400
In-Reply-To: <20230823213352.1971009-4-aahringo@redhat.com>
References: <20230823213352.1971009-1-aahringo@redhat.com>
 <20230823213352.1971009-4-aahringo@redhat.com>
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
Subject: Re: [Cluster-devel] [PATCH 3/7] lockd: fix race in async lock
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-08-23 at 17:33 -0400, Alexander Aring wrote:
> This patch fixes a race in async lock request handling between adding
> the relevant struct nlm_block to nlm_blocked list after the request was
> sent by vfs_lock_file() and nlmsvc_grant_deferred() does a lookup of the
> nlm_block in the nlm_blocked list. It could be that the async request is
> completed before the nlm_block was added to the list. This would end
> in a -ENOENT and a kernel log message of "lockd: grant for unknown
> block".
>=20
> To solve this issue we add the nlm_block before the vfs_lock_file() call
> to be sure it has been added when a possible nlmsvc_grant_deferred() is
> called. If the vfs_lock_file() results in an case when it wouldn't be
> added to nlm_blocked list, the nlm_block struct will be removed from
> this list again.
>=20
> The introducing of the new B_PENDING_CALLBACK nlm_block flag will handle
> async lock requests on a pending lock requests as a retry on the caller
> level to hit the -EAGAIN case.
>=20
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/lockd/svclock.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> index aa4174fbaf5b..3b158446203b 100644
> --- a/fs/lockd/svclock.c
> +++ b/fs/lockd/svclock.c
> @@ -546,6 +546,9 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *=
file,
>  =09=09ret =3D nlm_lck_blocked;
>  =09=09goto out;
>  =09}
> +
> +=09/* Append to list of blocked */
> +=09nlmsvc_insert_block_locked(block, NLM_NEVER);
>  =09spin_unlock(&nlm_blocked_lock);
> =20
>  =09if (!wait)
> @@ -557,9 +560,12 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file =
*file,
>  =09dprintk("lockd: vfs_lock_file returned %d\n", error);
>  =09switch (error) {
>  =09=09case 0:
> +=09=09=09nlmsvc_remove_block(block);
>  =09=09=09ret =3D nlm_granted;
>  =09=09=09goto out;
>  =09=09case -EAGAIN:
> +=09=09=09if (!wait)
> +=09=09=09=09nlmsvc_remove_block(block);
>  =09=09=09ret =3D async_block ? nlm_lck_blocked : nlm_lck_denied;
>  =09=09=09goto out;
>  =09=09case FILE_LOCK_DEFERRED:
> @@ -570,17 +576,16 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file=
 *file,
>  =09=09=09ret =3D nlmsvc_defer_lock_rqst(rqstp, block);
>  =09=09=09goto out;
>  =09=09case -EDEADLK:
> +=09=09=09nlmsvc_remove_block(block);
>  =09=09=09ret =3D nlm_deadlock;
>  =09=09=09goto out;
>  =09=09default:=09=09=09/* includes ENOLCK */
> +=09=09=09nlmsvc_remove_block(block);
>  =09=09=09ret =3D nlm_lck_denied_nolocks;
>  =09=09=09goto out;
>  =09}
> =20
>  =09ret =3D nlm_lck_blocked;
> -
> -=09/* Append to list of blocked */
> -=09nlmsvc_insert_block(block, NLM_NEVER);
>  out:
>  =09mutex_unlock(&file->f_mutex);
>  =09nlmsvc_release_block(block);

Reviewed-by: Jeff Layton <jlayton@kernel.org>

