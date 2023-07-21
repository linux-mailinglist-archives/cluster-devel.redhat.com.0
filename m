Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4D675CC4A
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Jul 2023 17:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689954320;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z6B9ImhhfGWk/d3JGVNTkOmoemaYAWzFqEWomRCFp70=;
	b=FvDpvWWY9MwsWNqmomd7w/ElG5Q9OR+ydhZu1UsSAABgt13gYmiw5EZfxXXxKOVUbMNYbH
	CMtBTuIpAKEgNDX8l1kY4P9SVZkJODgaAfpYCZqsxLNWzib/Rfcb+uvGQivwlc6geAJZkj
	IK9esoxORoLeog5LXqHvtnmzURZuiEg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-vckSbSCONGOa2i8_IoHUSg-1; Fri, 21 Jul 2023 11:45:15 -0400
X-MC-Unique: vckSbSCONGOa2i8_IoHUSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 252D4104458B;
	Fri, 21 Jul 2023 15:45:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B8BF7200B41D;
	Fri, 21 Jul 2023 15:45:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7A1421946A49;
	Fri, 21 Jul 2023 15:45:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AE8D51946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Jul 2023 15:45:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8EF6A200C0F2; Fri, 21 Jul 2023 15:45:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 872F5200A7CA
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 15:45:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 672EF2999B35
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 15:45:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-WzBcpBrDPrSKFK7yXpH-mg-1; Fri, 21 Jul 2023 11:45:08 -0400
X-MC-Unique: WzBcpBrDPrSKFK7yXpH-mg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F12D61265;
 Fri, 21 Jul 2023 15:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31B5C433C7;
 Fri, 21 Jul 2023 15:45:05 +0000 (UTC)
Message-ID: <af8586c743be551c3f939455368fc288856abe11.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>, chuck.lever@oracle.com
Date: Fri, 21 Jul 2023 11:45:04 -0400
In-Reply-To: <20230720125806.1385279-2-aahringo@redhat.com>
References: <20230720125806.1385279-1-aahringo@redhat.com>
 <20230720125806.1385279-2-aahringo@redhat.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2023-07-20 at 08:58 -0400, Alexander Aring wrote:
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
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/lockd/svclock.c          | 80 +++++++++++++++++++++++++++----------
>  include/linux/lockd/lockd.h |  1 +
>  2 files changed, 60 insertions(+), 21 deletions(-)
>=20
> diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> index 28abec5c451d..62ef27a69a9e 100644
> --- a/fs/lockd/svclock.c
> +++ b/fs/lockd/svclock.c
> @@ -297,6 +297,8 @@ static void nlmsvc_free_block(struct kref *kref)
> =20
>  =09dprintk("lockd: freeing block %p...\n", block);
> =20
> +=09WARN_ON_ONCE(block->b_flags & B_PENDING_CALLBACK);
> +
>  =09/* Remove block from file's list of blocks */
>  =09list_del_init(&block->b_flist);
>  =09mutex_unlock(&file->f_mutex);
> @@ -543,6 +545,12 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file =
*file,
>  =09=09goto out;
>  =09}
> =20
> +=09if (block->b_flags & B_PENDING_CALLBACK)
> +=09=09goto pending_request;
> +
> +=09/* Append to list of blocked */
> +=09nlmsvc_insert_block(block, NLM_NEVER);
> +
>  =09if (!wait)
>  =09=09lock->fl.fl_flags &=3D ~FL_SLEEP;
>  =09mode =3D lock_to_openmode(&lock->fl);
> @@ -552,9 +560,13 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file =
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
> +pending_request:
>  =09=09=09/*
>  =09=09=09 * If this is a blocking request for an
>  =09=09=09 * already pending lock request then we need
> @@ -565,6 +577,8 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *=
file,
>  =09=09=09ret =3D async_block ? nlm_lck_blocked : nlm_lck_denied;
>  =09=09=09goto out;
>  =09=09case FILE_LOCK_DEFERRED:
> +=09=09=09block->b_flags |=3D B_PENDING_CALLBACK;
> +
>  =09=09=09if (wait)
>  =09=09=09=09break;
>  =09=09=09/* Filesystem lock operation is in progress
> @@ -572,17 +586,16 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file=
 *file,
>  =09=09=09ret =3D nlmsvc_defer_lock_rqst(rqstp, block);

When the above function is called, it's going to end up reinserting the
block into the list. I think you probably also need to remove the call
to nlmsvc_insert_block from nlmsvc_defer_lock_rqst since it could have
been granted before that occurs.

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
> @@ -739,34 +752,59 @@ nlmsvc_update_deferred_block(struct nlm_block *bloc=
k, int result)
>  =09=09block->b_flags |=3D B_TIMED_OUT;
>  }
> =20
> +static int __nlmsvc_grant_deferred(struct nlm_block *block,
> +=09=09=09=09   struct file_lock *fl,
> +=09=09=09=09   int result)
> +{
> +=09int rc =3D 0;
> +
> +=09dprintk("lockd: nlmsvc_notify_blocked block %p flags %d\n",
> +=09=09=09=09=09block, block->b_flags);
> +=09if (block->b_flags & B_QUEUED) {
> +=09=09if (block->b_flags & B_TIMED_OUT) {
> +=09=09=09rc =3D -ENOLCK;
> +=09=09=09goto out;
> +=09=09}
> +=09=09nlmsvc_update_deferred_block(block, result);
> +=09} else if (result =3D=3D 0)
> +=09=09block->b_granted =3D 1;
> +
> +=09nlmsvc_insert_block_locked(block, 0);
> +=09svc_wake_up(block->b_daemon);
> +out:
> +=09return rc;
> +}
> +
>  static int nlmsvc_grant_deferred(struct file_lock *fl, int result)
>  {
> -=09struct nlm_block *block;
> -=09int rc =3D -ENOENT;
> +=09struct nlm_block *block =3D NULL;
> +=09int rc;
> =20
>  =09spin_lock(&nlm_blocked_lock);
>  =09list_for_each_entry(block, &nlm_blocked, b_list) {
>  =09=09if (nlm_compare_locks(&block->b_call->a_args.lock.fl, fl)) {
> -=09=09=09dprintk("lockd: nlmsvc_notify_blocked block %p flags %d\n",
> -=09=09=09=09=09=09=09block, block->b_flags);
> -=09=09=09if (block->b_flags & B_QUEUED) {
> -=09=09=09=09if (block->b_flags & B_TIMED_OUT) {
> -=09=09=09=09=09rc =3D -ENOLCK;
> -=09=09=09=09=09break;
> -=09=09=09=09}
> -=09=09=09=09nlmsvc_update_deferred_block(block, result);
> -=09=09=09} else if (result =3D=3D 0)
> -=09=09=09=09block->b_granted =3D 1;
> -
> -=09=09=09nlmsvc_insert_block_locked(block, 0);
> -=09=09=09svc_wake_up(block->b_daemon);
> -=09=09=09rc =3D 0;
> +=09=09=09kref_get(&block->b_count);
>  =09=09=09break;
>  =09=09}
>  =09}
>  =09spin_unlock(&nlm_blocked_lock);
> -=09if (rc =3D=3D -ENOENT)
> -=09=09printk(KERN_WARNING "lockd: grant for unknown block\n");
> +
> +=09if (!block) {
> +=09=09pr_warn("lockd: grant for unknown pending block\n");
> +=09=09return -ENOENT;
> +=09}
> +
> +=09/* don't interfere with nlmsvc_lock() */
> +=09mutex_lock(&block->b_file->f_mutex);


This is called from lm_grant, and Documentation/filesystems/locking.rst
says that lm_grant is not allowed to block. The only caller though is
dlm_plock_callback, and I don't see anything that would prevent
blocking.

Do we need to fix the documentation there?


> +=09block->b_flags &=3D ~B_PENDING_CALLBACK;
> +

You're adding this new flag when the lock is deferred and then clearing
it when the lock is granted. What about when the lock request is
cancelled (e.g. by signal)? It seems like you also need to clear it then
too, correct?

> +=09spin_lock(&nlm_blocked_lock);
> +=09WARN_ON_ONCE(list_empty(&block->b_list));
> +=09rc =3D __nlmsvc_grant_deferred(block, fl, result);
> +=09spin_unlock(&nlm_blocked_lock);
> +=09mutex_unlock(&block->b_file->f_mutex);
> +
> +=09nlmsvc_release_block(block);
>  =09return rc;
>  }
> =20
> diff --git a/include/linux/lockd/lockd.h b/include/linux/lockd/lockd.h
> index f42594a9efe0..a977be8bcc2c 100644
> --- a/include/linux/lockd/lockd.h
> +++ b/include/linux/lockd/lockd.h
> @@ -189,6 +189,7 @@ struct nlm_block {
>  #define B_QUEUED=09=091=09/* lock queued */
>  #define B_GOT_CALLBACK=09=092=09/* got lock or conflicting lock */
>  #define B_TIMED_OUT=09=094=09/* filesystem too slow to respond */
> +#define B_PENDING_CALLBACK=098=09/* pending callback for lock request */
>  };
> =20
>  /*

--=20
Jeff Layton <jlayton@kernel.org>

