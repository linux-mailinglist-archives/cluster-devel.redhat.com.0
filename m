Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B30B375F5FC
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jul 2023 14:18:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690201088;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oZDe8DWIRQt0bVCqbQR4I9eGL2c+DUMl1vRJdAkXskw=;
	b=E7OlY74XaRBpnH7jlMuQnZTRrTWbudrTzoL5ubGde4ieNd85lU96K9l3KxaZ101TlL/xGH
	CUvtPrtRgDVDJbkzjjuirZQudGR8vB5zZtjOOBX8NZPDENsvQgS8rl5AjEiLJoc1p8Y8Rr
	mkMtC4XPV4iJEyjDTYWTAsAAAJXNb6s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-692-Hq2YwshlMPaOWJPKuEB34Q-1; Mon, 24 Jul 2023 08:18:02 -0400
X-MC-Unique: Hq2YwshlMPaOWJPKuEB34Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 920F181D9EC;
	Mon, 24 Jul 2023 12:18:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8252A140E952;
	Mon, 24 Jul 2023 12:18:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 46E4D1946594;
	Mon, 24 Jul 2023 12:18:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1D8871946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Jul 2023 12:18:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0BBA94A9004; Mon, 24 Jul 2023 12:18:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03CB646A3AA
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 12:17:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC76A868008
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 12:17:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-C8933KshOvWzt_XKh_mWiw-1; Mon, 24 Jul 2023 08:17:58 -0400
X-MC-Unique: C8933KshOvWzt_XKh_mWiw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 397746113E;
 Mon, 24 Jul 2023 12:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7639DC433C7;
 Mon, 24 Jul 2023 12:17:53 +0000 (UTC)
Message-ID: <d79d3ef43b3a61be99e53a77fa9eb19af7fc550f.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org, 
 david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz, roman.gushchin@linux.dev,
 djwong@kernel.org, brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, 
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org, 
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 08:17:52 -0400
In-Reply-To: <20230724094354.90817-36-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-36-zhengqi.arch@bytedance.com>
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
Subject: Re: [Cluster-devel] [PATCH v2 35/47] nfsd: dynamically allocate the
 nfsd-reply shrinker
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-07-24 at 17:43 +0800, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the nfsd-reply shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct nfsd_net.
>=20
> Acked-by: Chuck Lever <chuck.lever@oracle.com>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>  fs/nfsd/netns.h    |  2 +-
>  fs/nfsd/nfscache.c | 31 ++++++++++++++++---------------
>  2 files changed, 17 insertions(+), 16 deletions(-)
>=20
> diff --git a/fs/nfsd/netns.h b/fs/nfsd/netns.h
> index f669444d5336..ab303a8b77d5 100644
> --- a/fs/nfsd/netns.h
> +++ b/fs/nfsd/netns.h
> @@ -177,7 +177,7 @@ struct nfsd_net {
>  =09/* size of cache when we saw the longest hash chain */
>  =09unsigned int             longest_chain_cachesize;
> =20
> -=09struct shrinker=09=09nfsd_reply_cache_shrinker;
> +=09struct shrinker=09=09*nfsd_reply_cache_shrinker;
> =20
>  =09/* tracking server-to-server copy mounts */
>  =09spinlock_t              nfsd_ssc_lock;
> diff --git a/fs/nfsd/nfscache.c b/fs/nfsd/nfscache.c
> index 6eb3d7bdfaf3..9f0ab65e4125 100644
> --- a/fs/nfsd/nfscache.c
> +++ b/fs/nfsd/nfscache.c
> @@ -200,26 +200,29 @@ int nfsd_reply_cache_init(struct nfsd_net *nn)
>  {
>  =09unsigned int hashsize;
>  =09unsigned int i;
> -=09int status =3D 0;
> =20
>  =09nn->max_drc_entries =3D nfsd_cache_size_limit();
>  =09atomic_set(&nn->num_drc_entries, 0);
>  =09hashsize =3D nfsd_hashsize(nn->max_drc_entries);
>  =09nn->maskbits =3D ilog2(hashsize);
> =20
> -=09nn->nfsd_reply_cache_shrinker.scan_objects =3D nfsd_reply_cache_scan;
> -=09nn->nfsd_reply_cache_shrinker.count_objects =3D nfsd_reply_cache_coun=
t;
> -=09nn->nfsd_reply_cache_shrinker.seeks =3D 1;
> -=09status =3D register_shrinker(&nn->nfsd_reply_cache_shrinker,
> -=09=09=09=09   "nfsd-reply:%s", nn->nfsd_name);
> -=09if (status)
> -=09=09return status;
> -
>  =09nn->drc_hashtbl =3D kvzalloc(array_size(hashsize,
>  =09=09=09=09sizeof(*nn->drc_hashtbl)), GFP_KERNEL);
>  =09if (!nn->drc_hashtbl)
> +=09=09return -ENOMEM;
> +
> +=09nn->nfsd_reply_cache_shrinker =3D shrinker_alloc(0, "nfsd-reply:%s",
> +=09=09=09=09=09=09       nn->nfsd_name);
> +=09if (!nn->nfsd_reply_cache_shrinker)
>  =09=09goto out_shrinker;
> =20
> +=09nn->nfsd_reply_cache_shrinker->scan_objects =3D nfsd_reply_cache_scan=
;
> +=09nn->nfsd_reply_cache_shrinker->count_objects =3D nfsd_reply_cache_cou=
nt;
> +=09nn->nfsd_reply_cache_shrinker->seeks =3D 1;
> +=09nn->nfsd_reply_cache_shrinker->private_data =3D nn;
> +
> +=09shrinker_register(nn->nfsd_reply_cache_shrinker);
> +
>  =09for (i =3D 0; i < hashsize; i++) {
>  =09=09INIT_LIST_HEAD(&nn->drc_hashtbl[i].lru_head);
>  =09=09spin_lock_init(&nn->drc_hashtbl[i].cache_lock);
> @@ -228,7 +231,7 @@ int nfsd_reply_cache_init(struct nfsd_net *nn)
> =20
>  =09return 0;
>  out_shrinker:
> -=09unregister_shrinker(&nn->nfsd_reply_cache_shrinker);
> +=09kvfree(nn->drc_hashtbl);
>  =09printk(KERN_ERR "nfsd: failed to allocate reply cache\n");
>  =09return -ENOMEM;
>  }
> @@ -238,7 +241,7 @@ void nfsd_reply_cache_shutdown(struct nfsd_net *nn)
>  =09struct nfsd_cacherep *rp;
>  =09unsigned int i;
> =20
> -=09unregister_shrinker(&nn->nfsd_reply_cache_shrinker);
> +=09shrinker_unregister(nn->nfsd_reply_cache_shrinker);
> =20
>  =09for (i =3D 0; i < nn->drc_hashsize; i++) {
>  =09=09struct list_head *head =3D &nn->drc_hashtbl[i].lru_head;
> @@ -322,8 +325,7 @@ nfsd_prune_bucket_locked(struct nfsd_net *nn, struct =
nfsd_drc_bucket *b,
>  static unsigned long
>  nfsd_reply_cache_count(struct shrinker *shrink, struct shrink_control *s=
c)
>  {
> -=09struct nfsd_net *nn =3D container_of(shrink,
> -=09=09=09=09struct nfsd_net, nfsd_reply_cache_shrinker);
> +=09struct nfsd_net *nn =3D shrink->private_data;
> =20
>  =09return atomic_read(&nn->num_drc_entries);
>  }
> @@ -342,8 +344,7 @@ nfsd_reply_cache_count(struct shrinker *shrink, struc=
t shrink_control *sc)
>  static unsigned long
>  nfsd_reply_cache_scan(struct shrinker *shrink, struct shrink_control *sc=
)
>  {
> -=09struct nfsd_net *nn =3D container_of(shrink,
> -=09=09=09=09struct nfsd_net, nfsd_reply_cache_shrinker);
> +=09struct nfsd_net *nn =3D shrink->private_data;
>  =09unsigned long freed =3D 0;
>  =09LIST_HEAD(dispose);
>  =09unsigned int i;

Acked-by: Jeff Layton <jlayton@kernel.org>

