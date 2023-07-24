Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3799475F5F5
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jul 2023 14:17:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690201074;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5ClYoPM2+R1LU+xY2vWgNYeU0LZkz+tiOGJi1rHUYlk=;
	b=DT+OtYZSP/FN27ysDUJcl/W0ViaF3k5s8OYsZTw6TiCNpRoVzpKeS1Zps3cEriTVuo228A
	Q6e9mgBB1bsbifJ2mt6iTon7dlSj2fYjpic6iQEAvRSJsCuKdxLFcTnPCpJf9TWFe0V4TN
	OsHlsy5N2ZpARjExaHfzymuH/lFiriQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-omEEm87WNdKKPHjPDZQ32w-1; Mon, 24 Jul 2023 08:17:52 -0400
X-MC-Unique: omEEm87WNdKKPHjPDZQ32w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE26C809F8F;
	Mon, 24 Jul 2023 12:17:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 764EB400F1F;
	Mon, 24 Jul 2023 12:17:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3143B1946594;
	Mon, 24 Jul 2023 12:17:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C9AC71946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Jul 2023 12:17:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 993394A9005; Mon, 24 Jul 2023 12:17:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91C5C46A3A7
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 12:17:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 753C13815EE7
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 12:17:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-F5IfvOW_MPq9vZkN90M1bQ-1; Mon, 24 Jul 2023 08:17:45 -0400
X-MC-Unique: F5IfvOW_MPq9vZkN90M1bQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21BA160F6A;
 Mon, 24 Jul 2023 12:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE84DC433C7;
 Mon, 24 Jul 2023 12:17:40 +0000 (UTC)
Message-ID: <01e8445d033314b6d9cd67bece74ca1c3ce89945.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org, 
 david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz, roman.gushchin@linux.dev,
 djwong@kernel.org, brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, 
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org, 
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 08:17:39 -0400
In-Reply-To: <20230724094354.90817-35-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-35-zhengqi.arch@bytedance.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH v2 34/47] nfsd: dynamically allocate the
 nfsd-client shrinker
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-07-24 at 17:43 +0800, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the nfsd-client shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct nfsd_net.
>=20
> Acked-by: Chuck Lever <chuck.lever@oracle.com>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>  fs/nfsd/netns.h     |  2 +-
>  fs/nfsd/nfs4state.c | 20 ++++++++++++--------
>  2 files changed, 13 insertions(+), 9 deletions(-)
>=20
> diff --git a/fs/nfsd/netns.h b/fs/nfsd/netns.h
> index ec49b200b797..f669444d5336 100644
> --- a/fs/nfsd/netns.h
> +++ b/fs/nfsd/netns.h
> @@ -195,7 +195,7 @@ struct nfsd_net {
>  =09int=09=09=09nfs4_max_clients;
> =20
>  =09atomic_t=09=09nfsd_courtesy_clients;
> -=09struct shrinker=09=09nfsd_client_shrinker;
> +=09struct shrinker=09=09*nfsd_client_shrinker;
>  =09struct work_struct=09nfsd_shrinker_work;
>  };
> =20
> diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> index 3339177f8e2f..c7a4616cd866 100644
> --- a/fs/nfsd/nfs4state.c
> +++ b/fs/nfsd/nfs4state.c
> @@ -4388,8 +4388,7 @@ static unsigned long
>  nfsd4_state_shrinker_count(struct shrinker *shrink, struct shrink_contro=
l *sc)
>  {
>  =09int count;
> -=09struct nfsd_net *nn =3D container_of(shrink,
> -=09=09=09struct nfsd_net, nfsd_client_shrinker);
> +=09struct nfsd_net *nn =3D shrink->private_data;
> =20
>  =09count =3D atomic_read(&nn->nfsd_courtesy_clients);
>  =09if (!count)
> @@ -8125,12 +8124,17 @@ static int nfs4_state_create_net(struct net *net)
>  =09INIT_WORK(&nn->nfsd_shrinker_work, nfsd4_state_shrinker_worker);
>  =09get_net(net);
> =20
> -=09nn->nfsd_client_shrinker.scan_objects =3D nfsd4_state_shrinker_scan;
> -=09nn->nfsd_client_shrinker.count_objects =3D nfsd4_state_shrinker_count=
;
> -=09nn->nfsd_client_shrinker.seeks =3D DEFAULT_SEEKS;
> -
> -=09if (register_shrinker(&nn->nfsd_client_shrinker, "nfsd-client"))
> +=09nn->nfsd_client_shrinker =3D shrinker_alloc(0, "nfsd-client");
> +=09if (!nn->nfsd_client_shrinker)
>  =09=09goto err_shrinker;
> +
> +=09nn->nfsd_client_shrinker->scan_objects =3D nfsd4_state_shrinker_scan;
> +=09nn->nfsd_client_shrinker->count_objects =3D nfsd4_state_shrinker_coun=
t;
> +=09nn->nfsd_client_shrinker->seeks =3D DEFAULT_SEEKS;
> +=09nn->nfsd_client_shrinker->private_data =3D nn;
> +
> +=09shrinker_register(nn->nfsd_client_shrinker);
> +
>  =09return 0;
> =20
>  err_shrinker:
> @@ -8228,7 +8232,7 @@ nfs4_state_shutdown_net(struct net *net)
>  =09struct list_head *pos, *next, reaplist;
>  =09struct nfsd_net *nn =3D net_generic(net, nfsd_net_id);
> =20
> -=09unregister_shrinker(&nn->nfsd_client_shrinker);
> +=09shrinker_unregister(nn->nfsd_client_shrinker);
>  =09cancel_work(&nn->nfsd_shrinker_work);
>  =09cancel_delayed_work_sync(&nn->laundromat_work);
>  =09locks_end_grace(&nn->nfsd4_manager);

Acked-by: Jeff Layton <jlayton@kernel.org>

