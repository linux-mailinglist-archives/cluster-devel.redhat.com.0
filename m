Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 248A7788E5A
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Aug 2023 20:15:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692987308;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=50H1mBUnO3pk7jkT5LAPC5CehHvBk3CRAmoD/B6BOsQ=;
	b=ONeCv31fdf52OIvRGPKzsSLlPp9YhyEliTLJ3PAIV/nTVwl6q3BkWuIADnKARdt9j7+LKS
	08QwaulfeabAUapoF7xM+m+zQKspJgxp5bbXcn2Fbup3Tnxq18cB2v8/4vAXGXI8fAEvZd
	9qg1EoX4TAbntEtd3iQBaj/N5a+Xzys=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-Mi-rPHE0NUGYz9tPQF5x1w-1; Fri, 25 Aug 2023 14:15:06 -0400
X-MC-Unique: Mi-rPHE0NUGYz9tPQF5x1w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 209A485D062;
	Fri, 25 Aug 2023 18:15:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15DCE492C18;
	Fri, 25 Aug 2023 18:15:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CC35219465B3;
	Fri, 25 Aug 2023 18:15:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6CA7E19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 18:15:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 47CAE2166B27; Fri, 25 Aug 2023 18:15:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F20C2166B26
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 18:15:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22A91185A78F
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 18:15:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-AkUnVmTPOPO3818Mo87fkQ-1; Fri, 25 Aug 2023 14:14:59 -0400
X-MC-Unique: AkUnVmTPOPO3818Mo87fkQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE0BD66CC0;
 Fri, 25 Aug 2023 18:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208E6C433C8;
 Fri, 25 Aug 2023 18:14:56 +0000 (UTC)
Message-ID: <6711ad3dc3a97878dca300d0fa67e0d57665e52e.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>, linux-nfs@vger.kernel.org
Date: Fri, 25 Aug 2023 14:14:54 -0400
In-Reply-To: <20230823213352.1971009-2-aahringo@redhat.com>
References: <20230823213352.1971009-1-aahringo@redhat.com>
 <20230823213352.1971009-2-aahringo@redhat.com>
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
Subject: Re: [Cluster-devel] [PATCH 1/7] lockd: introduce safe async lock op
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-08-23 at 17:33 -0400, Alexander Aring wrote:
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
>=20
> Acked-by: Jeff Layton <jlayton@kernel.org>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/lockd/svclock.c       |  5 ++---
>  fs/nfsd/nfs4state.c      | 13 ++++++++++---
>  include/linux/exportfs.h |  8 ++++++++
>  3 files changed, 20 insertions(+), 6 deletions(-)
>=20
> diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> index c43ccdf28ed9..6e3b230e8317 100644
> --- a/fs/lockd/svclock.c
> +++ b/fs/lockd/svclock.c
> @@ -470,9 +470,7 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *=
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
> @@ -486,7 +484,8 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *=
file,
>  =09=09=09=09(long long)lock->fl.fl_end,
>  =09=09=09=09wait);
> =20
> -=09if (nlmsvc_file_file(file)->f_op->lock) {
> +=09if (!export_op_support_safe_async_lock(inode->i_sb->s_export_op,
> +=09=09=09=09=09       nlmsvc_file_file(file)->f_op)) {
>  =09=09async_block =3D wait;
>  =09=09wait =3D 0;
>  =09}
> diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> index 3aefbad4cc09..14ca06424ff1 100644
> --- a/fs/nfsd/nfs4state.c
> +++ b/fs/nfsd/nfs4state.c
> @@ -7430,6 +7430,7 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_com=
pound_state *cstate,
>  =09struct nfsd4_blocked_lock *nbl =3D NULL;
>  =09struct file_lock *file_lock =3D NULL;
>  =09struct file_lock *conflock =3D NULL;
> +=09struct super_block *sb;
>  =09__be32 status =3D 0;
>  =09int lkflg;
>  =09int err;
> @@ -7451,6 +7452,7 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_com=
pound_state *cstate,
>  =09=09dprintk("NFSD: nfsd4_lock: permission denied!\n");
>  =09=09return status;
>  =09}
> +=09sb =3D cstate->current_fh.fh_dentry->d_sb;
> =20
>  =09if (lock->lk_is_new) {
>  =09=09if (nfsd4_has_session(cstate))
> @@ -7502,7 +7504,9 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_com=
pound_state *cstate,
>  =09fp =3D lock_stp->st_stid.sc_file;
>  =09switch (lock->lk_type) {
>  =09=09case NFS4_READW_LT:
> -=09=09=09if (nfsd4_has_session(cstate))
> +=09=09=09if (nfsd4_has_session(cstate) ||
> +=09=09=09    export_op_support_safe_async_lock(sb->s_export_op,
> +=09=09=09=09=09=09=09      nf->nf_file->f_op))
>  =09=09=09=09fl_flags |=3D FL_SLEEP;
>  =09=09=09fallthrough;
>  =09=09case NFS4_READ_LT:
> @@ -7514,7 +7518,9 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_com=
pound_state *cstate,
>  =09=09=09fl_type =3D F_RDLCK;
>  =09=09=09break;
>  =09=09case NFS4_WRITEW_LT:
> -=09=09=09if (nfsd4_has_session(cstate))
> +=09=09=09if (nfsd4_has_session(cstate) ||
> +=09=09=09    export_op_support_safe_async_lock(sb->s_export_op,
> +=09=09=09=09=09=09=09      nf->nf_file->f_op))
>  =09=09=09=09fl_flags |=3D FL_SLEEP;
>  =09=09=09fallthrough;
>  =09=09case NFS4_WRITE_LT:
> @@ -7542,7 +7548,8 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_com=
pound_state *cstate,
>  =09 * for file locks), so don't attempt blocking lock notifications
>  =09 * on those filesystems:
>  =09 */
> -=09if (nf->nf_file->f_op->lock)
> +=09if (!export_op_support_safe_async_lock(sb->s_export_op,
> +=09=09=09=09=09       nf->nf_file->f_op))
>  =09=09fl_flags &=3D ~FL_SLEEP;
> =20
>  =09nbl =3D find_or_allocate_block(lock_sop, &fp->fi_fhandle, nn);
> diff --git a/include/linux/exportfs.h b/include/linux/exportfs.h
> index 11fbd0ee1370..10358a93cdc1 100644
> --- a/include/linux/exportfs.h
> +++ b/include/linux/exportfs.h
> @@ -3,6 +3,7 @@
>  #define LINUX_EXPORTFS_H 1
> =20
>  #include <linux/types.h>
> +#include <linux/fs.h>
> =20
>  struct dentry;
>  struct iattr;
> @@ -224,9 +225,16 @@ struct export_operations {
>  =09=09=09=09=09=09  atomic attribute updates
>  =09=09=09=09=09=09*/
>  #define EXPORT_OP_FLUSH_ON_CLOSE=09(0x20) /* fs flushes file data on clo=
se */
> +#define EXPORT_OP_SAFE_ASYNC_LOCK=09(0x40) /* fs can do async lock reque=
st */
>  =09unsigned long=09flags;
>  };
> =20
> +static inline bool export_op_support_safe_async_lock(const struct export=
_operations *export_ops,
> +=09=09=09=09=09=09     const struct file_operations *f_op)
> +{
> +=09return (export_ops->flags & EXPORT_OP_SAFE_ASYNC_LOCK) || !f_op->lock=
;
> +}
> +
>  extern int exportfs_encode_inode_fh(struct inode *inode, struct fid *fid=
,
>  =09=09=09=09    int *max_len, struct inode *parent,
>  =09=09=09=09    int flags);

Conceptually, this looks fine, but I agree with Chuck's stylistic
points.

--=20
Jeff Layton <jlayton@kernel.org>

