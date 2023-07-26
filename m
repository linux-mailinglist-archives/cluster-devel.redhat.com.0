Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DC9763229
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jul 2023 11:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690363896;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1c1HMAKYJ9E5B+Yw2yBJ71y5Qnnu7lxJRJAz0VpzdjM=;
	b=G17SML/2jcfJ4qN/fqg75T+WAjZYHQojahHokV0p8R2sIW3zobXetp+JDha+TThlbBzRmD
	s3f3Su54wh15dwLV6r1LzyYPDiHlB1tjCdHnLDE9md0iOQXLvHZk4Tf71afJ4LA7HIeBFS
	Tf9OqxKBKPYD04pwmZ669/AUc5EHb58=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-gRSZF4bYN_6LcenGBnGoZg-1; Wed, 26 Jul 2023 05:31:35 -0400
X-MC-Unique: gRSZF4bYN_6LcenGBnGoZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64C9A3815EE4;
	Wed, 26 Jul 2023 09:31:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4BBE940C2063;
	Wed, 26 Jul 2023 09:31:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DCFC3193F51A;
	Wed, 26 Jul 2023 09:31:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 66FFA1946A69 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Jul 2023 09:31:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 511744094DC1; Wed, 26 Jul 2023 09:31:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 494264094DC0
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 09:31:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29C1F803470
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 09:31:32 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-SFLZvHTyMM2NazuytpUb8g-1; Wed, 26 Jul 2023 05:31:29 -0400
X-MC-Unique: SFLZvHTyMM2NazuytpUb8g-1
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-55c79b62f3aso258777a12.1
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 02:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690363888; x=1690968688;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1c1HMAKYJ9E5B+Yw2yBJ71y5Qnnu7lxJRJAz0VpzdjM=;
 b=Qt8YGuI9Uw52dohSj9dWQo5D6xas7ko/DirobTXRcbqTid3PlnQO8/vDh+ZBamhive
 +TfPmzhvkBCpa0gMZfMTQ5kAHAIkqmy++PkuEb37QHPCcLkEbX2AnT1j+bhsR1cUBTCD
 K5pRi0cy65LRwMJAjiaLZzQDkd9Lv+p/GWSsQuU66W046vHVJI+VNQt/MhET/hHKkzZC
 n7J27Hem5Sd5cmMuCo2HqtnWR7t6vQcfKeUL8KJU42QOvurzyQHDLLDD+04m6MudiBZj
 jxhPfIj6aznDkxJM4G8vHOmMM0eh98jGJYjJeu0o8oIP8neiinsX/GT83R4JAlbHKN0A
 Irpg==
X-Gm-Message-State: ABy/qLYr2ewXVsHEmHjL79vsdhKNu+3CgYDwSxy9iZ7pZPeIVnhAIbqs
 N3hZ5GrMMKxim9Pk1gFR6+o7XA==
X-Google-Smtp-Source: APBJJlEqsGncSKz6JEtDSHUBqLuH7hBKwqIpyMup6VZ4SlPsq4lxhQ8OawAhUiBJ+OlnlseBEBKBeQ==
X-Received: by 2002:a05:6a00:4a10:b0:686:b990:560f with SMTP id
 do16-20020a056a004a1000b00686b990560fmr1620878pfb.2.1690363888304; 
 Wed, 26 Jul 2023 02:31:28 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 z5-20020aa791c5000000b0065446092699sm11395167pfa.141.2023.07.26.02.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:31:27 -0700 (PDT)
Message-ID: <b941338c-56e7-65e7-da45-bfefc484ad80@bytedance.com>
Date: Wed, 26 Jul 2023 17:31:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-24-zhengqi.arch@bytedance.com>
 <17de3f5b-3bef-be38-9801-0e84cfe8539b@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <17de3f5b-3bef-be38-9801-0e84cfe8539b@linux.dev>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2023/7/26 15:24, Muchun Song wrote:
> 
> 
> On 2023/7/24 17:43, Qi Zheng wrote:
>> In preparation for implementing lockless slab shrink, use new APIs to
>> dynamically allocate the drm-msm_gem shrinker, so that it can be freed
>> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
>> read-side critical section when releasing the struct msm_drm_private.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> 
> A nit bellow.
> 
>> ---
>>   drivers/gpu/drm/msm/msm_drv.c          |  4 ++-
>>   drivers/gpu/drm/msm/msm_drv.h          |  4 +--
>>   drivers/gpu/drm/msm/msm_gem_shrinker.c | 36 ++++++++++++++++----------
>>   3 files changed, 28 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index 891eff8433a9..7f6933be703f 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -461,7 +461,9 @@ static int msm_drm_init(struct device *dev, const 
>> struct drm_driver *drv)
>>       if (ret)
>>           goto err_msm_uninit;
>> -    msm_gem_shrinker_init(ddev);
>> +    ret = msm_gem_shrinker_init(ddev);
>> +    if (ret)
>> +        goto err_msm_uninit;
>>       if (priv->kms_init) {
>>           ret = priv->kms_init(ddev);
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
>> b/drivers/gpu/drm/msm/msm_drv.h
>> index e13a8cbd61c9..84523d4a1e58 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -217,7 +217,7 @@ struct msm_drm_private {
>>       } vram;
>>       struct notifier_block vmap_notifier;
>> -    struct shrinker shrinker;
>> +    struct shrinker *shrinker;
>>       struct drm_atomic_state *pm_state;
>> @@ -279,7 +279,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, 
>> void *data,
>>   unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, 
>> unsigned long nr_to_scan);
>>   #endif
>> -void msm_gem_shrinker_init(struct drm_device *dev);
>> +int msm_gem_shrinker_init(struct drm_device *dev);
>>   void msm_gem_shrinker_cleanup(struct drm_device *dev);
>>   int msm_gem_prime_mmap(struct drm_gem_object *obj, struct 
>> vm_area_struct *vma);
>> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c 
>> b/drivers/gpu/drm/msm/msm_gem_shrinker.c
>> index f38296ad8743..7daab1298c11 100644
>> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
>> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
>> @@ -34,8 +34,7 @@ static bool can_block(struct shrink_control *sc)
>>   static unsigned long
>>   msm_gem_shrinker_count(struct shrinker *shrinker, struct 
>> shrink_control *sc)
>>   {
>> -    struct msm_drm_private *priv =
>> -        container_of(shrinker, struct msm_drm_private, shrinker);
>> +    struct msm_drm_private *priv = shrinker->private_data;
>>       unsigned count = priv->lru.dontneed.count;
>>       if (can_swap())
>> @@ -100,8 +99,7 @@ active_evict(struct drm_gem_object *obj)
>>   static unsigned long
>>   msm_gem_shrinker_scan(struct shrinker *shrinker, struct 
>> shrink_control *sc)
>>   {
>> -    struct msm_drm_private *priv =
>> -        container_of(shrinker, struct msm_drm_private, shrinker);
>> +    struct msm_drm_private *priv = shrinker->private_data;
>>       struct {
>>           struct drm_gem_lru *lru;
>>           bool (*shrink)(struct drm_gem_object *obj);
>> @@ -148,10 +146,11 @@ msm_gem_shrinker_shrink(struct drm_device *dev, 
>> unsigned long nr_to_scan)
>>       struct shrink_control sc = {
>>           .nr_to_scan = nr_to_scan,
>>       };
>> -    int ret;
>> +    unsigned long ret = SHRINK_STOP;
>>       fs_reclaim_acquire(GFP_KERNEL);
>> -    ret = msm_gem_shrinker_scan(&priv->shrinker, &sc);
>> +    if (priv->shrinker)
>> +        ret = msm_gem_shrinker_scan(priv->shrinker, &sc);
>>       fs_reclaim_release(GFP_KERNEL);
>>       return ret;
>> @@ -210,16 +209,27 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, 
>> unsigned long event, void *ptr)
>>    *
>>    * This function registers and sets up the msm shrinker.
>>    */
>> -void msm_gem_shrinker_init(struct drm_device *dev)
>> +int msm_gem_shrinker_init(struct drm_device *dev)
>>   {
>>       struct msm_drm_private *priv = dev->dev_private;
>> -    priv->shrinker.count_objects = msm_gem_shrinker_count;
>> -    priv->shrinker.scan_objects = msm_gem_shrinker_scan;
>> -    priv->shrinker.seeks = DEFAULT_SEEKS;
>> -    WARN_ON(register_shrinker(&priv->shrinker, "drm-msm_gem"));
>> +
>> +    priv->shrinker = shrinker_alloc(0, "drm-msm_gem");
>> +    if (!priv->shrinker) {
> 
> Just "if (WARN_ON(!priv->shrinker))"

As suggested by Steven Pric in patch #24, this warning is
unnecessary, so I will remove it in the next version.

> 
>> +        WARN_ON(1);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    priv->shrinker->count_objects = msm_gem_shrinker_count;
>> +    priv->shrinker->scan_objects = msm_gem_shrinker_scan;
>> +    priv->shrinker->seeks = DEFAULT_SEEKS;
>> +    priv->shrinker->private_data = priv;
>> +
>> +    shrinker_register(priv->shrinker);
>>       priv->vmap_notifier.notifier_call = msm_gem_shrinker_vmap;
>>       WARN_ON(register_vmap_purge_notifier(&priv->vmap_notifier));
>> +
>> +    return 0;
>>   }
>>   /**
>> @@ -232,8 +242,8 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev)
>>   {
>>       struct msm_drm_private *priv = dev->dev_private;
>> -    if (priv->shrinker.nr_deferred) {
>> +    if (priv->shrinker) {
>>           WARN_ON(unregister_vmap_purge_notifier(&priv->vmap_notifier));
>> -        unregister_shrinker(&priv->shrinker);
>> +        shrinker_unregister(priv->shrinker);
>>       }
>>   }
> 

