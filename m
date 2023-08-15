Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BB377D151
	for <lists+cluster-devel@lfdr.de>; Tue, 15 Aug 2023 19:50:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692121821;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kyRpJK6yA1i+gGrG7Ns5bcXERNn0pzi2YB6sT1ZSRyM=;
	b=GzK6VSm5p3ETTiNmL+RQmsR6W77QSQte7cET/cUQebYpjc60viWR9aq92uU0z6IIxs9Rz9
	71z2CspsxmtWVEIx/hEEqh6GwkdpUhBb/MQtE43q87OSdiZF0aSW6SLe/9z7l1u1T52KgD
	PROgtDkT71H8rBX6NwRuHdKfJ4vZdXE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-VLY80dLGNdq4yT4sxz-RXQ-1; Tue, 15 Aug 2023 13:50:16 -0400
X-MC-Unique: VLY80dLGNdq4yT4sxz-RXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DF4585CBE2;
	Tue, 15 Aug 2023 17:50:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55620C15BAD;
	Tue, 15 Aug 2023 17:50:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E3AA2194658D;
	Tue, 15 Aug 2023 17:50:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 291DE1946589 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 15 Aug 2023 17:50:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B9C8E40C207B; Tue, 15 Aug 2023 17:49:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2DFD40C207A
 for <cluster-devel@redhat.com>; Tue, 15 Aug 2023 17:49:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D98138210A3
 for <cluster-devel@redhat.com>; Tue, 15 Aug 2023 17:49:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-tovEZxcbPcS3KPFpTGXpnw-1; Tue, 15 Aug 2023 13:49:49 -0400
X-MC-Unique: tovEZxcbPcS3KPFpTGXpnw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5548A65D84;
 Tue, 15 Aug 2023 17:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99BDC433C7;
 Tue, 15 Aug 2023 17:49:46 +0000 (UTC)
Message-ID: <c049f33344990f74c2b88cc3279a913f6ff6f498.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>, linux-nfs@vger.kernel.org
Date: Tue, 15 Aug 2023 13:49:45 -0400
In-Reply-To: <20230814211116.3224759-2-aahringo@redhat.com>
References: <20230814211116.3224759-1-aahringo@redhat.com>
 <20230814211116.3224759-2-aahringo@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-08-14 at 17:11 -0400, Alexander Aring wrote:
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
>  fs/lockd/svclock.c          | 100 ++++++++++++++++++++++++++----------
>  include/linux/lockd/lockd.h |   2 +
>  2 files changed, 74 insertions(+), 28 deletions(-)
>=20
> diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> index c43ccdf28ed9..7d63524bdb81 100644
> --- a/fs/lockd/svclock.c
> +++ b/fs/lockd/svclock.c
> @@ -133,6 +133,7 @@ nlmsvc_remove_block(struct nlm_block *block)
>  {
>  =09if (!list_empty(&block->b_list)) {
>  =09=09spin_lock(&nlm_blocked_lock);
> +=09=09block->b_flags &=3D ~B_PENDING_CALLBACK;
> =09=09list_del_init(&block->b_list);
>  =09=09spin_unlock(&nlm_blocked_lock);
>  =09=09nlmsvc_release_block(block);
> @@ -232,6 +233,7 @@ nlmsvc_create_block(struct svc_rqst *rqstp, struct nl=
m_host *host,
>  =09kref_init(&block->b_count);
>  =09INIT_LIST_HEAD(&block->b_list);
>  =09INIT_LIST_HEAD(&block->b_flist);
> +=09mutex_init(&block->b_cb_mutex);
> =20
>  =09if (!nlmsvc_setgrantargs(call, lock))
>  =09=09goto failed_free;
> @@ -289,6 +291,8 @@ static void nlmsvc_free_block(struct kref *kref)
> =20
>  =09dprintk("lockd: freeing block %p...\n", block);
> =20
> +=09WARN_ON_ONCE(block->b_flags & B_PENDING_CALLBACK);
> +
>  =09/* Remove block from file's list of blocks */
>  =09list_del_init(&block->b_flist);
>  =09mutex_unlock(&file->f_mutex);
> @@ -532,6 +536,13 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file =
*file,
>  =09=09goto out;
>  =09}
> =20
> +=09mutex_lock(&block->b_cb_mutex);
> +=09if (block->b_flags & B_PENDING_CALLBACK)
> +=09=09goto pending_request;
> +
> +=09/* Append to list of blocked */
> +=09nlmsvc_insert_block(block, NLM_NEVER);
> +
>  =09if (!wait)
>  =09=09lock->fl.fl_flags &=3D ~FL_SLEEP;
>  =09mode =3D lock_to_openmode(&lock->fl);
> @@ -541,9 +552,13 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file =
*file,
>  =09dprintk("lockd: vfs_lock_file returned %d\n", error);
>  =09switch (error) {
>  =09=09case 0:
> +=09=09=09nlmsvc_remove_block(block);
>  =09=09=09ret =3D nlm_granted;
> -=09=09=09goto out;
> +=09=09=09goto out_cb_mutex;
>  =09=09case -EAGAIN:
> +=09=09=09if (!wait)
> +=09=09=09=09nlmsvc_remove_block(block);
> +pending_request:
>  =09=09=09/*
>  =09=09=09 * If this is a blocking request for an
>  =09=09=09 * already pending lock request then we need
> @@ -552,26 +567,29 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file=
 *file,
>  =09=09=09if (wait)
>  =09=09=09=09break;
>  =09=09=09ret =3D async_block ? nlm_lck_blocked : nlm_lck_denied;
> -=09=09=09goto out;
> +=09=09=09goto out_cb_mutex;
>  =09=09case FILE_LOCK_DEFERRED:
> +=09=09=09block->b_flags |=3D B_PENDING_CALLBACK;
> +
>  =09=09=09if (wait)
>  =09=09=09=09break;
>  =09=09=09/* Filesystem lock operation is in progress
>  =09=09=09   Add it to the queue waiting for callback */
>  =09=09=09ret =3D nlmsvc_defer_lock_rqst(rqstp, block);
> -=09=09=09goto out;
> +=09=09=09goto out_cb_mutex;
>  =09=09case -EDEADLK:
> +=09=09=09nlmsvc_remove_block(block);
>  =09=09=09ret =3D nlm_deadlock;
> -=09=09=09goto out;
> +=09=09=09goto out_cb_mutex;
>  =09=09default:=09=09=09/* includes ENOLCK */
> +=09=09=09nlmsvc_remove_block(block);
>  =09=09=09ret =3D nlm_lck_denied_nolocks;
> -=09=09=09goto out;
> +=09=09=09goto out_cb_mutex;
>  =09}
> =20
>  =09ret =3D nlm_lck_blocked;
> -
> -=09/* Append to list of blocked */
> -=09nlmsvc_insert_block(block, NLM_NEVER);
> +out_cb_mutex:
> +=09mutex_unlock(&block->b_cb_mutex);
>  out:
>  =09mutex_unlock(&file->f_mutex);
>  =09nlmsvc_release_block(block);
> @@ -728,34 +746,60 @@ nlmsvc_update_deferred_block(struct nlm_block *bloc=
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
> +=09struct nlm_block *iter, *block =3D NULL;
> +=09int rc;
> =20
>  =09spin_lock(&nlm_blocked_lock);
> -=09list_for_each_entry(block, &nlm_blocked, b_list) {
> -=09=09if (nlm_compare_locks(&block->b_call->a_args.lock.fl, fl)) {
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
> +=09list_for_each_entry(iter, &nlm_blocked, b_list) {
> +=09=09if (nlm_compare_locks(&iter->b_call->a_args.lock.fl, fl)) {
> +=09=09=09kref_get(&iter->b_count);
> +=09=09=09block =3D iter;
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
> +=09mutex_lock(&block->b_cb_mutex);
> +=09block->b_flags &=3D ~B_PENDING_CALLBACK;
> +
> +=09spin_lock(&nlm_blocked_lock);
> +=09WARN_ON_ONCE(list_empty(&block->b_list));
> +=09rc =3D __nlmsvc_grant_deferred(block, fl, result);
> +=09spin_unlock(&nlm_blocked_lock);
> +=09mutex_unlock(&block->b_cb_mutex);
> +
> +=09nlmsvc_release_block(block);
>  =09return rc;
>  }
> =20
> diff --git a/include/linux/lockd/lockd.h b/include/linux/lockd/lockd.h
> index f42594a9efe0..91f55458f5fc 100644
> --- a/include/linux/lockd/lockd.h
> +++ b/include/linux/lockd/lockd.h
> @@ -185,10 +185,12 @@ struct nlm_block {
>  =09struct nlm_file *=09b_file;=09=09/* file in question */
>  =09struct cache_req *=09b_cache_req;=09/* deferred request handling */
>  =09struct cache_deferred_req * b_deferred_req
> +=09struct mutex=09=09b_cb_mutex;=09/* callback mutex */

There is no mention at all of this new mutex in the changelog or
comments. It's not at all clear to me what this is intended to protect.
In general, with lockd being a single-threaded service, we want to avoid
sleeping locks. This will need some clear justification.

At a glance, it looks like you're trying to use this to hold
B_PENDING_CALLBACK steady while a lock request is being handled. That
suggests that you're using this mutex to serialize access to a section
of code and not one or more specific data structures. We usually like to
avoid that sort of thing, since locks that protect arbitrary sections of
code become difficult to work with over time.

I'm going to go out on a limb here though and suggest that there is
probably a way to solve this problem that doesn't involve adding new
locks.

>  =09unsigned int=09=09b_flags;=09/* block flags */
>  #define B_QUEUED=09=091=09/* lock queued */
>  #define B_GOT_CALLBACK=09=092=09/* got lock or conflicting lock */
>  #define B_TIMED_OUT=09=094=09/* filesystem too slow to respond */
> +#define B_PENDING_CALLBACK=098=09/* pending callback for lock request */
>  };
> =20
>  /*

Do we need this new flag at all? It seems redundant. If we have a block
on the list, then it is sort of by definition "pending callback". If
it's not on the list anymore, then it's not. No?

--=20
Jeff Layton <jlayton@kernel.org>

