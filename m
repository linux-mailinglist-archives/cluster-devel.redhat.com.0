Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AD075F4E2
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jul 2023 13:25:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690197957;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fRq9dwwGFiUYnhelgiMFCqaFSvyn1Iy7L8f3oV4pu3I=;
	b=Ao6E2IHkv5KY9alBjXfBn5X1Mk4Q070+4AwUfUhnqfN6g10cyILgAYzmXxxtX0AlTqxVJI
	5QQzyqTAh8BacMRny0e8lGcbXiWo+SABbUZdxoYmIIyFxLBSu/4o+gLr/DEWW1wsyd8M7N
	qFsGFj8ohmT5VmuYJUALspd+3R1tMe4=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-uaD41J3hMlChBMZ8mxBrHg-1; Mon, 24 Jul 2023 07:25:54 -0400
X-MC-Unique: uaD41J3hMlChBMZ8mxBrHg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFA3D3801BF1;
	Mon, 24 Jul 2023 11:25:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E829492CAC;
	Mon, 24 Jul 2023 11:25:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 302791946594;
	Mon, 24 Jul 2023 11:25:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B6B021946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Jul 2023 11:25:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9149B1121318; Mon, 24 Jul 2023 11:25:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 894801121315
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 11:25:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AB028631E7
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 11:25:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172]) by
 relay.mimecast.com with ESMTP id us-mta-498-D2sthRDrNNu6d3Zgk0gUWw-1; Mon,
 24 Jul 2023 07:25:14 -0400
X-MC-Unique: D2sthRDrNNu6d3Zgk0gUWw-1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B206CDE0;
 Mon, 24 Jul 2023 04:18:29 -0700 (PDT)
Received: from [10.57.34.62] (unknown [10.57.34.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C518B3F5A1;
 Mon, 24 Jul 2023 04:17:39 -0700 (PDT)
Message-ID: <cdd08c9e-81d3-a85f-5426-5db738aa73ec@arm.com>
Date: Mon, 24 Jul 2023 12:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org,
 david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz, roman.gushchin@linux.dev,
 djwong@kernel.org, brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-25-zhengqi.arch@bytedance.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230724094354.90817-25-zhengqi.arch@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Mon, 24 Jul 2023 11:25:51 +0000
Subject: Re: [Cluster-devel] [PATCH v2 24/47] drm/panfrost: dynamically
 allocate the drm-panfrost shrinker
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
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: arm.com
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/07/2023 10:43, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the drm-panfrost shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct panfrost_device.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

One nit below, but otherwise:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  6 +++-
>  drivers/gpu/drm/panfrost/panfrost_gem.h       |  2 +-
>  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 32 ++++++++++++-------
>  4 files changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index b0126b9fbadc..e667e5689353 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -118,7 +118,7 @@ struct panfrost_device {
>  
>  	struct mutex shrinker_lock;
>  	struct list_head shrinker_list;
> -	struct shrinker shrinker;
> +	struct shrinker *shrinker;
>  
>  	struct panfrost_devfreq pfdevfreq;
>  };
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index bbada731bbbd..f705bbdea360 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -598,10 +598,14 @@ static int panfrost_probe(struct platform_device *pdev)
>  	if (err < 0)
>  		goto err_out1;
>  
> -	panfrost_gem_shrinker_init(ddev);
> +	err = panfrost_gem_shrinker_init(ddev);
> +	if (err)
> +		goto err_out2;
>  
>  	return 0;
>  
> +err_out2:
> +	drm_dev_unregister(ddev);
>  err_out1:
>  	pm_runtime_disable(pfdev->dev);
>  	panfrost_device_fini(pfdev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
> index ad2877eeeccd..863d2ec8d4f0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -81,7 +81,7 @@ panfrost_gem_mapping_get(struct panfrost_gem_object *bo,
>  void panfrost_gem_mapping_put(struct panfrost_gem_mapping *mapping);
>  void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo);
>  
> -void panfrost_gem_shrinker_init(struct drm_device *dev);
> +int panfrost_gem_shrinker_init(struct drm_device *dev);
>  void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
>  
>  #endif /* __PANFROST_GEM_H__ */
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> index bf0170782f25..9a90dfb5301f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> @@ -18,8 +18,7 @@
>  static unsigned long
>  panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
>  {
> -	struct panfrost_device *pfdev =
> -		container_of(shrinker, struct panfrost_device, shrinker);
> +	struct panfrost_device *pfdev = shrinker->private_data;
>  	struct drm_gem_shmem_object *shmem;
>  	unsigned long count = 0;
>  
> @@ -65,8 +64,7 @@ static bool panfrost_gem_purge(struct drm_gem_object *obj)
>  static unsigned long
>  panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>  {
> -	struct panfrost_device *pfdev =
> -		container_of(shrinker, struct panfrost_device, shrinker);
> +	struct panfrost_device *pfdev = shrinker->private_data;
>  	struct drm_gem_shmem_object *shmem, *tmp;
>  	unsigned long freed = 0;
>  
> @@ -97,13 +95,24 @@ panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>   *
>   * This function registers and sets up the panfrost shrinker.
>   */
> -void panfrost_gem_shrinker_init(struct drm_device *dev)
> +int panfrost_gem_shrinker_init(struct drm_device *dev)
>  {
>  	struct panfrost_device *pfdev = dev->dev_private;
> -	pfdev->shrinker.count_objects = panfrost_gem_shrinker_count;
> -	pfdev->shrinker.scan_objects = panfrost_gem_shrinker_scan;
> -	pfdev->shrinker.seeks = DEFAULT_SEEKS;
> -	WARN_ON(register_shrinker(&pfdev->shrinker, "drm-panfrost"));
> +
> +	pfdev->shrinker = shrinker_alloc(0, "drm-panfrost");
> +	if (!pfdev->shrinker) {
> +		WARN_ON(1);

I don't think this WARN_ON is particularly useful - if there's a failed
memory allocation we should see output from the kernel anyway. And we're
changing the semantics from "continue just without a shrinker" (which
argueably justifies the warning) to "probe fails, device doesn't work"
which will be obvious to the user so I don't feel we need the additional
warn.

> +		return -ENOMEM;
> +	}
> +
> +	pfdev->shrinker->count_objects = panfrost_gem_shrinker_count;
> +	pfdev->shrinker->scan_objects = panfrost_gem_shrinker_scan;
> +	pfdev->shrinker->seeks = DEFAULT_SEEKS;
> +	pfdev->shrinker->private_data = pfdev;
> +
> +	shrinker_register(pfdev->shrinker);
> +
> +	return 0;
>  }
>  
>  /**
> @@ -116,7 +125,6 @@ void panfrost_gem_shrinker_cleanup(struct drm_device *dev)
>  {
>  	struct panfrost_device *pfdev = dev->dev_private;
>  
> -	if (pfdev->shrinker.nr_deferred) {
> -		unregister_shrinker(&pfdev->shrinker);
> -	}
> +	if (pfdev->shrinker)
> +		shrinker_unregister(pfdev->shrinker);
>  }

