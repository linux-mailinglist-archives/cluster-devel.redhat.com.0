Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3471A75CB36
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Jul 2023 17:15:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689952501;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iFmYwzHmEGi25fUiSGWv81OqxMtADPuUZAYqJkpOw9M=;
	b=XOyePaSN7MY/K1EtxWimW5nCV7RTRmOkvvC+l4euPM4towB1iKEVK12Nw9Ld17JPYX1UOd
	Ur/hWKQAsAgWKdyEZQOULRUfBL6IqN1bc971BgZgLd6IVIbROarJNZ/Dz3Sg8cYp2fwkgA
	TVccmWYiEK8bOdayo0Q7yZk1iJc9JA0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-L0AcfnxSMvGHGOf8IS6MMg-1; Fri, 21 Jul 2023 11:14:57 -0400
X-MC-Unique: L0AcfnxSMvGHGOf8IS6MMg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 853AD800B35;
	Fri, 21 Jul 2023 15:14:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9BC8E1121314;
	Fri, 21 Jul 2023 15:14:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 441311946A49;
	Fri, 21 Jul 2023 15:14:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 558A61946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Jul 2023 15:14:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 42384C5796B; Fri, 21 Jul 2023 15:14:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2233DC5796A
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 15:14:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 067D8936D25
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 15:14:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-Qc5kCLBIOt24VKOC1XB-cg-1; Fri, 21 Jul 2023 11:14:44 -0400
X-MC-Unique: Qc5kCLBIOt24VKOC1XB-cg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D0F261CB7;
 Fri, 21 Jul 2023 15:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C26C433C8;
 Fri, 21 Jul 2023 15:14:41 +0000 (UTC)
Message-ID: <4c9a7948dbc502583b0f09f08f0c2ea5bdfa3431.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>, chuck.lever@oracle.com
Date: Fri, 21 Jul 2023 11:14:40 -0400
In-Reply-To: <20230720125806.1385279-1-aahringo@redhat.com>
References: <20230720125806.1385279-1-aahringo@redhat.com>
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
Subject: Re: [Cluster-devel] [RFC v6.5-rc2 1/3] fs: lockd: nlm_blocked list
 race fixes
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2023-07-20 at 08:58 -0400, Alexander Aring wrote:
> This patch fixes races when lockd accessing the global nlm_blocked list.
> It was mostly safe to access the list because everything was accessed
> from the lockd kernel thread context but there exists cases like
> nlmsvc_grant_deferred() that could manipulate the nlm_blocked list and
> it can be called from any context.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/lockd/svclock.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> index c43ccdf28ed9..28abec5c451d 100644
> --- a/fs/lockd/svclock.c
> +++ b/fs/lockd/svclock.c
> @@ -131,12 +131,14 @@ static void nlmsvc_insert_block(struct nlm_block *b=
lock, unsigned long when)
>  static inline void
>  nlmsvc_remove_block(struct nlm_block *block)
>  {
> +=09spin_lock(&nlm_blocked_lock);
>  =09if (!list_empty(&block->b_list)) {
> -=09=09spin_lock(&nlm_blocked_lock);
>  =09=09list_del_init(&block->b_list);
>  =09=09spin_unlock(&nlm_blocked_lock);
>  =09=09nlmsvc_release_block(block);
> +=09=09return;
>  =09}
> +=09spin_unlock(&nlm_blocked_lock);
>  }
> =20
>  /*
> @@ -152,6 +154,7 @@ nlmsvc_lookup_block(struct nlm_file *file, struct nlm=
_lock *lock)
>  =09=09=09=09file, lock->fl.fl_pid,
>  =09=09=09=09(long long)lock->fl.fl_start,
>  =09=09=09=09(long long)lock->fl.fl_end, lock->fl.fl_type);
> +=09spin_lock(&nlm_blocked_lock);
>  =09list_for_each_entry(block, &nlm_blocked, b_list) {
>  =09=09fl =3D &block->b_call->a_args.lock.fl;
>  =09=09dprintk("lockd: check f=3D%p pd=3D%d %Ld-%Ld ty=3D%d cookie=3D%s\n=
",
> @@ -161,9 +164,11 @@ nlmsvc_lookup_block(struct nlm_file *file, struct nl=
m_lock *lock)
>  =09=09=09=09nlmdbg_cookie2a(&block->b_call->a_args.cookie));
>  =09=09if (block->b_file =3D=3D file && nlm_compare_locks(fl, &lock->fl))=
 {
>  =09=09=09kref_get(&block->b_count);
> +=09=09=09spin_unlock(&nlm_blocked_lock);
>  =09=09=09return block;
>  =09=09}
>  =09}
> +=09spin_unlock(&nlm_blocked_lock);
> =20
>  =09return NULL;
>  }
> @@ -185,16 +190,19 @@ nlmsvc_find_block(struct nlm_cookie *cookie)
>  {
>  =09struct nlm_block *block;
> =20
> +=09spin_lock(&nlm_blocked_lock);
>  =09list_for_each_entry(block, &nlm_blocked, b_list) {
>  =09=09if (nlm_cookie_match(&block->b_call->a_args.cookie,cookie))
>  =09=09=09goto found;
>  =09}
> +=09spin_unlock(&nlm_blocked_lock);
> =20
>  =09return NULL;
> =20
>  found:
>  =09dprintk("nlmsvc_find_block(%s): block=3D%p\n", nlmdbg_cookie2a(cookie=
), block);
>  =09kref_get(&block->b_count);
> +=09spin_unlock(&nlm_blocked_lock);
>  =09return block;
>  }
> =20
> @@ -317,6 +325,7 @@ void nlmsvc_traverse_blocks(struct nlm_host *host,
> =20
>  restart:
>  =09mutex_lock(&file->f_mutex);
> +=09spin_lock(&nlm_blocked_lock);
>  =09list_for_each_entry_safe(block, next, &file->f_blocks, b_flist) {
>  =09=09if (!match(block->b_host, host))
>  =09=09=09continue;
> @@ -325,11 +334,13 @@ void nlmsvc_traverse_blocks(struct nlm_host *host,
>  =09=09if (list_empty(&block->b_list))
>  =09=09=09continue;
>  =09=09kref_get(&block->b_count);
> +=09=09spin_unlock(&nlm_blocked_lock);
>  =09=09mutex_unlock(&file->f_mutex);
>  =09=09nlmsvc_unlink_block(block);
>  =09=09nlmsvc_release_block(block);
>  =09=09goto restart;
>  =09}
> +=09spin_unlock(&nlm_blocked_lock);
>  =09mutex_unlock(&file->f_mutex);
>  }
> =20

The patch itself looks correct. Walking these lists without holding the
lock is quite suspicious. Not sure about the stable designation here
though, unless you have a way to easily reproduce this.=20

Reviewed-by: Jeff Layton <jlayton@kernel.org>

