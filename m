Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFF9762D42
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jul 2023 09:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690356370;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nTTDffXkzxVXBy4JmC8uLINROt4TIYQk3fp5u25NUNM=;
	b=HSVKaDhLzMX7a4exaSK5olNob/Wsa2KhfqsgxXmiT0jdRPuKsV5dt3x+zCEd4Q1nyLXKTE
	GYGwwcPqwwGxyAHbwAh/l6LTZpUGkoI4sQZqx7d940lTh77QTvkDpLkUb3vmiZUk7wwwVP
	gN5XF3y90DD+xWx8nVDSb8AWkVxS10Q=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-LspuMzkCNrOmfyVcMT6fvg-1; Wed, 26 Jul 2023 03:26:00 -0400
X-MC-Unique: LspuMzkCNrOmfyVcMT6fvg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C46A1C07544;
	Wed, 26 Jul 2023 07:25:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BA0CF6CCF;
	Wed, 26 Jul 2023 07:25:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 33A6D1946A54;
	Wed, 26 Jul 2023 07:25:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AE2031946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Jul 2023 07:24:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 742514094DC3; Wed, 26 Jul 2023 07:24:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C8BE4094DC0
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 07:24:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C3C98E767F
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 07:24:40 +0000 (UTC)
Received: from out-34.mta1.migadu.com (out-34.mta1.migadu.com
 [95.215.58.34]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-Exk1fKtgPwe2YbNY5pFgPA-1; Wed, 26 Jul 2023 03:24:37 -0400
X-MC-Unique: Exk1fKtgPwe2YbNY5pFgPA-1
Message-ID: <17de3f5b-3bef-be38-9801-0e84cfe8539b@linux.dev>
Date: Wed, 26 Jul 2023 15:24:02 +0800
MIME-Version: 1.0
To: Qi Zheng <zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-24-zhengqi.arch@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-24-zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v2 23/47] drm/msm: dynamically allocate
 the drm-msm_gem shrinker
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 david@fromorbit.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, brauner@kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, tytso@mit.edu,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2023/7/24 17:43, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the drm-msm_gem shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct msm_drm_private.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

A nit bellow.

> ---
>   drivers/gpu/drm/msm/msm_drv.c          |  4 ++-
>   drivers/gpu/drm/msm/msm_drv.h          |  4 +--
>   drivers/gpu/drm/msm/msm_gem_shrinker.c | 36 ++++++++++++++++----------
>   3 files changed, 28 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 891eff8433a9..7f6933be703f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -461,7 +461,9 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	if (ret)
>   		goto err_msm_uninit;
>   
> -	msm_gem_shrinker_init(ddev);
> +	ret = msm_gem_shrinker_init(ddev);
> +	if (ret)
> +		goto err_msm_uninit;
>   
>   	if (priv->kms_init) {
>   		ret = priv->kms_init(ddev);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index e13a8cbd61c9..84523d4a1e58 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -217,7 +217,7 @@ struct msm_drm_private {
>   	} vram;
>   
>   	struct notifier_block vmap_notifier;
> -	struct shrinker shrinker;
> +	struct shrinker *shrinker;
>   
>   	struct drm_atomic_state *pm_state;
>   
> @@ -279,7 +279,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan);
>   #endif
>   
> -void msm_gem_shrinker_init(struct drm_device *dev);
> +int msm_gem_shrinker_init(struct drm_device *dev);
>   void msm_gem_shrinker_cleanup(struct drm_device *dev);
>   
>   int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> index f38296ad8743..7daab1298c11 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -34,8 +34,7 @@ static bool can_block(struct shrink_control *sc)
>   static unsigned long
>   msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
>   {
> -	struct msm_drm_private *priv =
> -		container_of(shrinker, struct msm_drm_private, shrinker);
> +	struct msm_drm_private *priv = shrinker->private_data;
>   	unsigned count = priv->lru.dontneed.count;
>   
>   	if (can_swap())
> @@ -100,8 +99,7 @@ active_evict(struct drm_gem_object *obj)
>   static unsigned long
>   msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>   {
> -	struct msm_drm_private *priv =
> -		container_of(shrinker, struct msm_drm_private, shrinker);
> +	struct msm_drm_private *priv = shrinker->private_data;
>   	struct {
>   		struct drm_gem_lru *lru;
>   		bool (*shrink)(struct drm_gem_object *obj);
> @@ -148,10 +146,11 @@ msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan)
>   	struct shrink_control sc = {
>   		.nr_to_scan = nr_to_scan,
>   	};
> -	int ret;
> +	unsigned long ret = SHRINK_STOP;
>   
>   	fs_reclaim_acquire(GFP_KERNEL);
> -	ret = msm_gem_shrinker_scan(&priv->shrinker, &sc);
> +	if (priv->shrinker)
> +		ret = msm_gem_shrinker_scan(priv->shrinker, &sc);
>   	fs_reclaim_release(GFP_KERNEL);
>   
>   	return ret;
> @@ -210,16 +209,27 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
>    *
>    * This function registers and sets up the msm shrinker.
>    */
> -void msm_gem_shrinker_init(struct drm_device *dev)
> +int msm_gem_shrinker_init(struct drm_device *dev)
>   {
>   	struct msm_drm_private *priv = dev->dev_private;
> -	priv->shrinker.count_objects = msm_gem_shrinker_count;
> -	priv->shrinker.scan_objects = msm_gem_shrinker_scan;
> -	priv->shrinker.seeks = DEFAULT_SEEKS;
> -	WARN_ON(register_shrinker(&priv->shrinker, "drm-msm_gem"));
> +
> +	priv->shrinker = shrinker_alloc(0, "drm-msm_gem");
> +	if (!priv->shrinker) {

Just "if (WARN_ON(!priv->shrinker))"

> +		WARN_ON(1);
> +		return -ENOMEM;
> +	}
> +
> +	priv->shrinker->count_objects = msm_gem_shrinker_count;
> +	priv->shrinker->scan_objects = msm_gem_shrinker_scan;
> +	priv->shrinker->seeks = DEFAULT_SEEKS;
> +	priv->shrinker->private_data = priv;
> +
> +	shrinker_register(priv->shrinker);
>   
>   	priv->vmap_notifier.notifier_call = msm_gem_shrinker_vmap;
>   	WARN_ON(register_vmap_purge_notifier(&priv->vmap_notifier));
> +
> +	return 0;
>   }
>   
>   /**
> @@ -232,8 +242,8 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev)
>   {
>   	struct msm_drm_private *priv = dev->dev_private;
>   
> -	if (priv->shrinker.nr_deferred) {
> +	if (priv->shrinker) {
>   		WARN_ON(unregister_vmap_purge_notifier(&priv->vmap_notifier));
> -		unregister_shrinker(&priv->shrinker);
> +		shrinker_unregister(priv->shrinker);
>   	}
>   }

