Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 374FC77E10C
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Aug 2023 14:04:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692187481;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ABZ3nkOJDAEqs6Tsshtr8XG/MHXAIkhnMMxg93n4UvI=;
	b=MxPD1UaM8Eok/Z4rRI+MPFvyiJOJTsEovXqE9QqyCGXLx+RzHnF2gObRgGXCwpSveoDiSY
	TbZpkaESFH34K9/QhVAp/EzuWdO6RvROVI9U+Ypt7dSF2Duohw197l6hV+iE+ouDwRJ1nf
	I+Y+4y0lU8ZIcor+TDrOB85ebAuaZjU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-XEi6H07sPa6pJe9RUZEq_w-1; Wed, 16 Aug 2023 08:04:38 -0400
X-MC-Unique: XEi6H07sPa6pJe9RUZEq_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DF038DC664;
	Wed, 16 Aug 2023 12:04:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 220DA40C207A;
	Wed, 16 Aug 2023 12:04:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E5F2319465A3;
	Wed, 16 Aug 2023 12:04:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C567D19465BB for <cluster-devel@listman.corp.redhat.com>;
 Wed, 16 Aug 2023 12:02:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7CC1A140E964; Wed, 16 Aug 2023 12:02:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74A81140E963
 for <cluster-devel@redhat.com>; Wed, 16 Aug 2023 12:02:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59DFC185A78F
 for <cluster-devel@redhat.com>; Wed, 16 Aug 2023 12:02:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-_RdDjtKJNym9h3XzmZYjvw-1; Wed, 16 Aug 2023 08:02:08 -0400
X-MC-Unique: _RdDjtKJNym9h3XzmZYjvw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D9B761648;
 Wed, 16 Aug 2023 12:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34A1C433C7;
 Wed, 16 Aug 2023 12:02:05 +0000 (UTC)
Message-ID: <527071b5b9620fee6b6c2cbf2efe8381e48f778d.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>, linux-nfs@vger.kernel.org
Date: Wed, 16 Aug 2023 08:02:04 -0400
In-Reply-To: <20230814211116.3224759-6-aahringo@redhat.com>
References: <20230814211116.3224759-1-aahringo@redhat.com>
 <20230814211116.3224759-6-aahringo@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [RFCv2 5/7] dlm: use fl_owner from lockd
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

On Mon, 2023-08-14 at 17:11 -0400, Alexander Aring wrote:
> This patch is changing the fl_owner value in case of an nfs lock request
> to not be the pid of lockd. Instead this patch changes it to be the
> owner value that nfs is giving us.
>=20
> Currently there exists proved problems with this behaviour. One nfsd
> server was created to export a gfs2 filesystem mount. Two nfs clients
> doing a nfs mount of this export. Those two clients should conflict each
> other operating on the same nfs file.
>=20
> A small test program was written:
>=20
> int main(int argc, const char *argv[])
> {
> =09struct flock fl =3D {
> =09=09.l_type =3D F_WRLCK,
> =09=09.l_whence =3D SEEK_SET,
> =09=09.l_start =3D 1L,
> =09=09.l_len =3D 1L,
> =09};
> =09int fd;
>=20
> =09fd =3D open("filename", O_RDWR | O_CREAT, 0700);
> =09printf("try to lock...\n");
> =09fcntl(fd, F_SETLKW, &fl);
> =09printf("locked!\n");
> =09getc(stdin);
>=20
> =09return 0;
> }
>=20
> Running on both clients at the same time and don't interrupting by
> pressing any key. It will show that both clients are able to acquire the
> lock which shouldn't be the case. The issue is here that the fl_owner
> value is the same and the lock context of both clients should be
> separated.
>=20
> This patch lets lockd define how to deal with lock contexts and chose
> hopefully the right fl_owner value. A test after this patch was made and
> the locks conflicts each other which should be the case.
>=20
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/plock.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
>=20
> diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> index 00e1d802a81c..0094fa4004cc 100644
> --- a/fs/dlm/plock.c
> +++ b/fs/dlm/plock.c
> @@ -145,6 +145,7 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 nu=
mber, struct file *file,
>  =09op->info.number=09=09=3D number;
>  =09op->info.start=09=09=3D fl->fl_start;
>  =09op->info.end=09=09=3D fl->fl_end;
> +=09op->info.owner =3D (__u64)(long)fl->fl_owner;
>  =09/* async handling */
>  =09if (fl->fl_lmops && fl->fl_lmops->lm_grant) {
>  =09=09op_data =3D kzalloc(sizeof(*op_data), GFP_NOFS);
> @@ -154,9 +155,6 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 nu=
mber, struct file *file,
>  =09=09=09goto out;
>  =09=09}
> =20
> -=09=09/* fl_owner is lockd which doesn't distinguish
> -=09=09   processes on the nfs client */
> -=09=09op->info.owner=09=3D (__u64) fl->fl_pid;
>  =09=09op_data->callback =3D fl->fl_lmops->lm_grant;
>  =09=09locks_init_lock(&op_data->flc);
>  =09=09locks_copy_lock(&op_data->flc, fl);
> @@ -168,8 +166,6 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 nu=
mber, struct file *file,
>  =09=09send_op(op);
>  =09=09rv =3D FILE_LOCK_DEFERRED;
>  =09=09goto out;
> -=09} else {
> -=09=09op->info.owner=09=3D (__u64)(long) fl->fl_owner;
>  =09}
> =20
>  =09send_op(op);
> @@ -326,10 +322,7 @@ int dlm_posix_unlock(dlm_lockspace_t *lockspace, u64=
 number, struct file *file,
>  =09op->info.number=09=09=3D number;
>  =09op->info.start=09=09=3D fl->fl_start;
>  =09op->info.end=09=09=3D fl->fl_end;
> -=09if (fl->fl_lmops && fl->fl_lmops->lm_grant)
> -=09=09op->info.owner=09=3D (__u64) fl->fl_pid;
> -=09else
> -=09=09op->info.owner=09=3D (__u64)(long) fl->fl_owner;
> +=09op->info.owner =3D (__u64)(long)fl->fl_owner;
> =20
>  =09if (fl->fl_flags & FL_CLOSE) {
>  =09=09op->info.flags |=3D DLM_PLOCK_FL_CLOSE;
> @@ -389,7 +382,7 @@ int dlm_posix_cancel(dlm_lockspace_t *lockspace, u64 =
number, struct file *file,
>  =09info.number =3D number;
>  =09info.start =3D fl->fl_start;
>  =09info.end =3D fl->fl_end;
> -=09info.owner =3D (__u64)fl->fl_pid;
> +=09info.owner =3D (__u64)(long)fl->fl_owner;
> =20
>  =09rv =3D do_lock_cancel(&info);
>  =09switch (rv) {
> @@ -450,10 +443,7 @@ int dlm_posix_get(dlm_lockspace_t *lockspace, u64 nu=
mber, struct file *file,
>  =09op->info.number=09=09=3D number;
>  =09op->info.start=09=09=3D fl->fl_start;
>  =09op->info.end=09=09=3D fl->fl_end;
> -=09if (fl->fl_lmops && fl->fl_lmops->lm_grant)
> -=09=09op->info.owner=09=3D (__u64) fl->fl_pid;
> -=09else
> -=09=09op->info.owner=09=3D (__u64)(long) fl->fl_owner;
> +=09op->info.owner =3D (__u64)(long)fl->fl_owner;
> =20
>  =09send_op(op);
>  =09wait_event(recv_wq, (op->done !=3D 0));

This is the way.

Acked-by: Jeff Layton <jlayton@kernel.org>

