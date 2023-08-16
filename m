Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB3D77E230
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Aug 2023 15:09:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692191371;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3aG0QKCGqPIYH2isumVKzB5gGGhlZCY1oPBxaCFI2k0=;
	b=cdtX3lQnd09QRfhSxoMd/H9ajAhShVeOwhUJWqnTCp841yeMNj4l8lLmkcC8IKUsMgAI8Z
	WS6N6i3f6IFWy3OwAI/B45YJx/GG6pVFtOW8ZFC61AraG6/YOZvW4AN3pYQTOKGatFA1DU
	FrAJucy6kexlQ636TwvOe4NCPjP3Y4U=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-LqN7RQvKPJyORIdR4vDJpw-1; Wed, 16 Aug 2023 09:09:28 -0400
X-MC-Unique: LqN7RQvKPJyORIdR4vDJpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 456D83C147FA;
	Wed, 16 Aug 2023 13:09:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEDC363F75;
	Wed, 16 Aug 2023 13:09:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 75F6E194658C;
	Wed, 16 Aug 2023 13:09:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 996991946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 16 Aug 2023 13:07:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 747C0492C14; Wed, 16 Aug 2023 13:07:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CBC8492C13
 for <cluster-devel@redhat.com>; Wed, 16 Aug 2023 13:07:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5182A85CCEA
 for <cluster-devel@redhat.com>; Wed, 16 Aug 2023 13:07:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-sJx79bspNXeoH_vquYm23Q-1; Wed, 16 Aug 2023 09:07:34 -0400
X-MC-Unique: sJx79bspNXeoH_vquYm23Q-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24BEB64ACA;
 Wed, 16 Aug 2023 13:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A717C433C8;
 Wed, 16 Aug 2023 13:07:30 +0000 (UTC)
Message-ID: <bd76489a6b0d2f56f4a68d48b3736fcaf5b5119b.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>, linux-nfs@vger.kernel.org
Date: Wed, 16 Aug 2023 09:07:29 -0400
In-Reply-To: <20230814211116.3224759-7-aahringo@redhat.com>
References: <20230814211116.3224759-1-aahringo@redhat.com>
 <20230814211116.3224759-7-aahringo@redhat.com>
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
Cc: cluster-devel@redhat.com, ocfs2-devel@lists.linux.dev,
 chuck.lever@oracle.com, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-08-14 at 17:11 -0400, Alexander Aring wrote:
> This patch uses the FL_SLEEP flag in struct file_lock to check if it's a
> blocking request in case if the request coming from nfs lockd process
> indicated by lm_grant() is set.
>=20
> IF FL_SLEEP is set a asynchronous blocking request is being made and
> it's waiting for lm_grant() callback being called to signal the lock was
> granted. If it's not set a synchronous non-blocking request is being made=
.
>=20
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/plock.c | 38 ++++++++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 16 deletions(-)
>=20
> diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> index 0094fa4004cc..524771002a2f 100644
> --- a/fs/dlm/plock.c
> +++ b/fs/dlm/plock.c
> @@ -140,7 +140,6 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 nu=
mber, struct file *file,
>  =09op->info.optype=09=09=3D DLM_PLOCK_OP_LOCK;
>  =09op->info.pid=09=09=3D fl->fl_pid;
>  =09op->info.ex=09=09=3D (fl->fl_type =3D=3D F_WRLCK);
> -=09op->info.wait=09=09=3D IS_SETLKW(cmd);
>  =09op->info.fsid=09=09=3D ls->ls_global_id;
>  =09op->info.number=09=09=3D number;
>  =09op->info.start=09=09=3D fl->fl_start;
> @@ -148,24 +147,31 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 =
number, struct file *file,
>  =09op->info.owner =3D (__u64)(long)fl->fl_owner;
>  =09/* async handling */
>  =09if (fl->fl_lmops && fl->fl_lmops->lm_grant) {
> -=09=09op_data =3D kzalloc(sizeof(*op_data), GFP_NOFS);
> -=09=09if (!op_data) {
> -=09=09=09dlm_release_plock_op(op);
> -=09=09=09rv =3D -ENOMEM;
> -=09=09=09goto out;
> -=09=09}
> +=09=09if (fl->fl_flags & FL_SLEEP) {
> +=09=09=09op_data =3D kzalloc(sizeof(*op_data), GFP_NOFS);
> +=09=09=09if (!op_data) {
> +=09=09=09=09dlm_release_plock_op(op);
> +=09=09=09=09rv =3D -ENOMEM;
> +=09=09=09=09goto out;
> +=09=09=09}
> =20
> -=09=09op_data->callback =3D fl->fl_lmops->lm_grant;
> -=09=09locks_init_lock(&op_data->flc);
> -=09=09locks_copy_lock(&op_data->flc, fl);
> -=09=09op_data->fl=09=09=3D fl;
> -=09=09op_data->file=09=3D file;
> +=09=09=09op->info.wait =3D 1;
> +=09=09=09op_data->callback =3D fl->fl_lmops->lm_grant;
> +=09=09=09locks_init_lock(&op_data->flc);
> +=09=09=09locks_copy_lock(&op_data->flc, fl);
> +=09=09=09op_data->fl=09=09=3D fl;
> +=09=09=09op_data->file=09=3D file;
> =20
> -=09=09op->data =3D op_data;
> +=09=09=09op->data =3D op_data;
> =20
> -=09=09send_op(op);
> -=09=09rv =3D FILE_LOCK_DEFERRED;
> -=09=09goto out;
> +=09=09=09send_op(op);
> +=09=09=09rv =3D FILE_LOCK_DEFERRED;
> +=09=09=09goto out;

A question...we're returning FILE_LOCK_DEFERRED after the DLM request is
sent. If it ends up being blocked, what happens? Does it do a lm_grant
downcall with -EAGAIN or something as the result?


> +=09=09} else {
> +=09=09=09op->info.wait =3D 0;
> +=09=09}
> +=09} else {
> +=09=09op->info.wait =3D IS_SETLKW(cmd);
>  =09}
> =20
>  =09send_op(op);

Looks reasonable overall.

Now that I look, we have quite a number of places in the kernel that
seem to check for F_SETLKW, when what they really want is to check
FL_SLEEP.
--=20
Jeff Layton <jlayton@kernel.org>

