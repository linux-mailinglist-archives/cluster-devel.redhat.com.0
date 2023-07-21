Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE19075D0D7
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Jul 2023 19:46:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689961605;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+GqE0IjkrnuyfenMeHxw2ZXMs98kxSH1BeGVSw0w4LY=;
	b=RSgzM8UJwWHNqbGIU0tGSjPe5aAkamcRq1sY3xnab4ZevWP0iErXd+YlaC7I11oCbkrNpM
	Oln8UGGcHl0HlipE/NJj87pv82KeLiTPK11T4sTH1j0Gqkn14UgVJD7896xpVhbibT+bZd
	7V/Gs/0s3xVGNN9w7RlAQTjWq8zg47c=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-53xmZXmRMP6nifOE9UDPtw-1; Fri, 21 Jul 2023 13:46:43 -0400
X-MC-Unique: 53xmZXmRMP6nifOE9UDPtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9C223C16587;
	Fri, 21 Jul 2023 17:46:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7768C57969;
	Fri, 21 Jul 2023 17:46:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5B6041946A49;
	Fri, 21 Jul 2023 17:46:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BCF9D1946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Jul 2023 17:46:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9EF10200A7CA; Fri, 21 Jul 2023 17:46:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97429200B41D
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 17:46:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77463186E3A1
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 17:46:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-bi3L0OvFN12ic6poznBGLw-1; Fri, 21 Jul 2023 13:46:36 -0400
X-MC-Unique: bi3L0OvFN12ic6poznBGLw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E80FE61D6A;
 Fri, 21 Jul 2023 17:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339ABC433C7;
 Fri, 21 Jul 2023 17:46:30 +0000 (UTC)
Message-ID: <fc5c5e0bcfa7110282106c3319af6a0b5a63b221.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>, chuck.lever@oracle.com
Date: Fri, 21 Jul 2023 13:46:28 -0400
In-Reply-To: <20230720125806.1385279-3-aahringo@redhat.com>
References: <20230720125806.1385279-1-aahringo@redhat.com>
 <20230720125806.1385279-3-aahringo@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [RFC v6.5-rc2 3/3] fs: lockd: introduce safe
 async lock op
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2023-07-20 at 08:58 -0400, Alexander Aring wrote:
> This patch reverts mostly commit 40595cdc93ed ("nfs: block notification
> on fs with its own ->lock") and introduces an EXPORT_OP_SAFE_ASYNC_LOCK
> export flag to signal that the "own ->lock" implementation supports
> async lock requests. The only main user is DLM that is used by GFS2 and
> OCFS2 filesystem. Those implement their own lock() implementation and
> return FILE_LOCK_DEFERRED as return value. Since commit 40595cdc93ed
> ("nfs: block notification on fs with its own ->lock") the DLM
> implementation were never updated. This patch should prepare for DLM
> to set the EXPORT_OP_SAFE_ASYNC_LOCK export flag and update the DLM
> plock implementation regarding to it.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/lockd/svclock.c       |  5 ++---
>  fs/nfsd/nfs4state.c      | 11 ++++++++---
>  include/linux/exportfs.h |  1 +
>  3 files changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> index 62ef27a69a9e..54a67bd33843 100644
> --- a/fs/lockd/svclock.c
> +++ b/fs/lockd/svclock.c
> @@ -483,9 +483,7 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *=
file,
>  =09    struct nlm_host *host, struct nlm_lock *lock, int wait,
>  =09    struct nlm_cookie *cookie, int reclaim)
>  {
> -#if IS_ENABLED(CONFIG_SUNRPC_DEBUG)
>  =09struct inode=09=09*inode =3D nlmsvc_file_inode(file);
> -#endif
>  =09struct nlm_block=09*block =3D NULL;
>  =09int=09=09=09error;
>  =09int=09=09=09mode;
> @@ -499,7 +497,8 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *=
file,
>  =09=09=09=09(long long)lock->fl.fl_end,
>  =09=09=09=09wait);
> =20
> -=09if (nlmsvc_file_file(file)->f_op->lock) {
> +=09if (!(inode->i_sb->s_export_op->flags & EXPORT_OP_SAFE_ASYNC_LOCK) &&
> +=09    nlmsvc_file_file(file)->f_op->lock) {
>  =09=09async_block =3D wait;
>  =09=09wait =3D 0;
>  =09}
> diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> index 6e61fa3acaf1..efcea229d640 100644
> --- a/fs/nfsd/nfs4state.c
> +++ b/fs/nfsd/nfs4state.c
> @@ -7432,6 +7432,7 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_com=
pound_state *cstate,
>  =09struct nfsd4_blocked_lock *nbl =3D NULL;
>  =09struct file_lock *file_lock =3D NULL;
>  =09struct file_lock *conflock =3D NULL;
> +=09struct super_block *sb;
>  =09__be32 status =3D 0;
>  =09int lkflg;
>  =09int err;
> @@ -7453,6 +7454,7 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_com=
pound_state *cstate,
>  =09=09dprintk("NFSD: nfsd4_lock: permission denied!\n");
>  =09=09return status;
>  =09}
> +=09sb =3D cstate->current_fh.fh_dentry->d_sb;
> =20
>  =09if (lock->lk_is_new) {
>  =09=09if (nfsd4_has_session(cstate))
> @@ -7504,7 +7506,8 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_com=
pound_state *cstate,
>  =09fp =3D lock_stp->st_stid.sc_file;
>  =09switch (lock->lk_type) {
>  =09=09case NFS4_READW_LT:
> -=09=09=09if (nfsd4_has_session(cstate))
> +=09=09=09if (sb->s_export_op->flags & EXPORT_OP_SAFE_ASYNC_LOCK &&

This will break existing filesystems that don't set the new flag. Maybe
you also need to test for the filesystem's ->lock operation here too?

This might be more nicely expressed in a helper function.

> +=09=09=09    nfsd4_has_session(cstate))
>  =09=09=09=09fl_flags |=3D FL_SLEEP;
>  =09=09=09fallthrough;
>  =09=09case NFS4_READ_LT:
> @@ -7516,7 +7519,8 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_com=
pound_state *cstate,
>  =09=09=09fl_type =3D F_RDLCK;
>  =09=09=09break;
>  =09=09case NFS4_WRITEW_LT:
> -=09=09=09if (nfsd4_has_session(cstate))
> +=09=09=09if (sb->s_export_op->flags & EXPORT_OP_SAFE_ASYNC_LOCK &&
> +=09=09=09    nfsd4_has_session(cstate))
>  =09=09=09=09fl_flags |=3D FL_SLEEP;
>  =09=09=09fallthrough;
>  =09=09case NFS4_WRITE_LT:
> @@ -7544,7 +7548,8 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_com=
pound_state *cstate,
>  =09 * for file locks), so don't attempt blocking lock notifications
>  =09 * on those filesystems:
>  =09 */
> -=09if (nf->nf_file->f_op->lock)
> +=09if (!(sb->s_export_op->flags & EXPORT_OP_SAFE_ASYNC_LOCK) &&
> +=09    nf->nf_file->f_op->lock)
>  =09=09fl_flags &=3D ~FL_SLEEP;
> =20
>  =09nbl =3D find_or_allocate_block(lock_sop, &fp->fi_fhandle, nn);
> diff --git a/include/linux/exportfs.h b/include/linux/exportfs.h
> index 11fbd0ee1370..da742abbaf3e 100644
> --- a/include/linux/exportfs.h
> +++ b/include/linux/exportfs.h
> @@ -224,6 +224,7 @@ struct export_operations {
>  =09=09=09=09=09=09  atomic attribute updates
>  =09=09=09=09=09=09*/
>  #define EXPORT_OP_FLUSH_ON_CLOSE=09(0x20) /* fs flushes file data on clo=
se */
> +#define EXPORT_OP_SAFE_ASYNC_LOCK=09(0x40) /* fs can do async lock reque=
st */
>  =09unsigned long=09flags;
>  };
> =20

--=20
Jeff Layton <jlayton@kernel.org>

