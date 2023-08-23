Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC19784EFB
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Aug 2023 05:00:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692759605;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bhgEqLuvf9ApSnTvUwn1L76c2o2W1Ei/QD6yE6yt7Vo=;
	b=KUrn5yRgoSvzm6Y3iTnhCfxPvDMT2SFsDVDnW+anHoqKZP+t2iqD9yA/kAlE7DIAqAoO/v
	wRynuYeiw1zvG20RVvXb+HKO5ZE5x05Ijc2MzgJTvAt7tKpqELfuf74Kf0TCLWMrr7GQrW
	mmG77u+jNjvBW3fjWJWBpjkJcHmSBfA=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-zmYaoIXfMfOOh8ME6fvEJw-1; Tue, 22 Aug 2023 23:00:02 -0400
X-MC-Unique: zmYaoIXfMfOOh8ME6fvEJw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 535A129AA2D5;
	Wed, 23 Aug 2023 03:00:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD9501121314;
	Wed, 23 Aug 2023 02:59:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5DC271946589;
	Wed, 23 Aug 2023 02:59:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5A89B1946586 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 23 Aug 2023 02:59:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A5E3D2026D2B; Wed, 23 Aug 2023 02:59:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E4FB2026D76
 for <cluster-devel@redhat.com>; Wed, 23 Aug 2023 02:59:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F93A1C04327
 for <cluster-devel@redhat.com>; Wed, 23 Aug 2023 02:59:51 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-vXv8QLTtO22JdUxN46yScw-1; Tue, 22 Aug 2023 22:59:49 -0400
X-MC-Unique: vXv8QLTtO22JdUxN46yScw-1
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1b89b0c73d7so9079175ad.1
 for <cluster-devel@redhat.com>; Tue, 22 Aug 2023 19:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692759588; x=1693364388;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bhgEqLuvf9ApSnTvUwn1L76c2o2W1Ei/QD6yE6yt7Vo=;
 b=MFslBbG5hfneEDbHNPuBkdXzHuMYjN4bfkrkN/U29fC8GOrqQ09aD5ze6l1GOLZF66
 AW0ZFwdHO8nLcgCNQyWBx7/9Ur8VOlJKtun00iQZGrg1AA1b6tsnxzA6SbSwqnVqQl/N
 T506+Zg9AH0dbpvE/mT0o5fjjkkBh6+PxwPjTqhx5g+5GmZnVZWDfB3lqrkdBDsTO7A0
 JG8qdGmcWRZ61dCJxYVVg2QjiZVLgmr+Ks7hIXUe16riN5nTCy+A1QLfrZ7BDg8RYWQk
 FniHw/YPSyEV5/5kOQeqYfrU2svGK6CzeU2BPdp1c1rxbpa6vCODqz8M/tHw9V4tuD/0
 MIDg==
X-Gm-Message-State: AOJu0Ywf8B7GthaYqh1RY1cKN+ctEwfWgOpIY0FJA2v6zrmeS03RrikY
 iDRSozBi6uKRMbMcgqPML5xEyg==
X-Google-Smtp-Source: AGHT+IEfrTZGJtg+pRH2EfLUkWhGiT4SJbELosEEcEbXeeoUMWHqtsVXqJsCto+j1ri8qfTaL4v/sQ==
X-Received: by 2002:a17:90a:2f41:b0:26d:4ade:fcf0 with SMTP id
 s59-20020a17090a2f4100b0026d4adefcf0mr10521410pjd.4.1692759588304; 
 Tue, 22 Aug 2023 19:59:48 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1c25:884:3ed:e1db:b610?
 ([2408:8000:b001:1:1f:58ff:f102:103])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a17090a1fc200b00262ca945cecsm11045048pjz.54.2023.08.22.19.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 19:59:47 -0700 (PDT)
Message-ID: <63dc1d86-2a15-6b7e-f63a-63fccb25eae2@bytedance.com>
Date: Wed, 23 Aug 2023 10:59:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
To: daniel@ffwll.ch
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-44-zhengqi.arch@bytedance.com>
 <ZOS+g51Yx9PsYkGU@phenom.ffwll.local>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ZOS+g51Yx9PsYkGU@phenom.ffwll.local>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH v4 43/48] drm/ttm: introduce
 pool_shrink_rwsem
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
 simon.horman@corigine.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, paulmck@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 dlemoal@kernel.org, Muchun Song <songmuchun@bytedance.com>,
 yujie.liu@intel.com, vbabka@suse.cz, linux-raid@vger.kernel.org,
 brauner@kernel.org, tytso@mit.edu, gregkh@linuxfoundation.org,
 daniel.vetter@ffwll.ch, muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 2023/8/22 21:56, Daniel Vetter wrote:
> On Mon, Aug 07, 2023 at 07:09:31PM +0800, Qi Zheng wrote:
>> Currently, the synchronize_shrinkers() is only used by TTM pool. It only
>> requires that no shrinkers run in parallel.
>>
>> After we use RCU+refcount method to implement the lockless slab shrink,
>> we can not use shrinker_rwsem or synchronize_rcu() to guarantee that all
>> shrinker invocations have seen an update before freeing memory.
>>
>> So we introduce a new pool_shrink_rwsem to implement a private
>> synchronize_shrinkers(), so as to achieve the same purpose.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> 
> On the 5 drm patches (I counted 2 ttm and 3 drivers) for merging through
> some other tree (since I'm assuming that's how this will land):

Yeah, there are 5 drm patches: PATCH v4 07/48 23/48 24/48 25/48 43/48.

> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks for your review!

Qi

> 
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c | 15 +++++++++++++++
>>   include/linux/shrinker.h       |  2 --
>>   mm/shrinker.c                  | 15 ---------------
>>   3 files changed, 15 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>> index c9c9618c0dce..38b4c280725c 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -74,6 +74,7 @@ static struct ttm_pool_type global_dma32_uncached[MAX_ORDER + 1];
>>   static spinlock_t shrinker_lock;
>>   static struct list_head shrinker_list;
>>   static struct shrinker *mm_shrinker;
>> +static DECLARE_RWSEM(pool_shrink_rwsem);
>>   
>>   /* Allocate pages of size 1 << order with the given gfp_flags */
>>   static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>> @@ -317,6 +318,7 @@ static unsigned int ttm_pool_shrink(void)
>>   	unsigned int num_pages;
>>   	struct page *p;
>>   
>> +	down_read(&pool_shrink_rwsem);
>>   	spin_lock(&shrinker_lock);
>>   	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
>>   	list_move_tail(&pt->shrinker_list, &shrinker_list);
>> @@ -329,6 +331,7 @@ static unsigned int ttm_pool_shrink(void)
>>   	} else {
>>   		num_pages = 0;
>>   	}
>> +	up_read(&pool_shrink_rwsem);
>>   
>>   	return num_pages;
>>   }
>> @@ -572,6 +575,18 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>   }
>>   EXPORT_SYMBOL(ttm_pool_init);
>>   
>> +/**
>> + * synchronize_shrinkers - Wait for all running shrinkers to complete.
>> + *
>> + * This is useful to guarantee that all shrinker invocations have seen an
>> + * update, before freeing memory, similar to rcu.
>> + */
>> +static void synchronize_shrinkers(void)
>> +{
>> +	down_write(&pool_shrink_rwsem);
>> +	up_write(&pool_shrink_rwsem);
>> +}
>> +
>>   /**
>>    * ttm_pool_fini - Cleanup a pool
>>    *
>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>> index c55c07c3f0cb..025c8070dd86 100644
>> --- a/include/linux/shrinker.h
>> +++ b/include/linux/shrinker.h
>> @@ -103,8 +103,6 @@ struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
>>   void shrinker_register(struct shrinker *shrinker);
>>   void shrinker_free(struct shrinker *shrinker);
>>   
>> -extern void synchronize_shrinkers(void);
>> -
>>   #ifdef CONFIG_SHRINKER_DEBUG
>>   extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
>>   						  const char *fmt, ...);
>> diff --git a/mm/shrinker.c b/mm/shrinker.c
>> index 3ab301ff122d..a27779ed3798 100644
>> --- a/mm/shrinker.c
>> +++ b/mm/shrinker.c
>> @@ -650,18 +650,3 @@ void shrinker_free(struct shrinker *shrinker)
>>   	kfree(shrinker);
>>   }
>>   EXPORT_SYMBOL_GPL(shrinker_free);
>> -
>> -/**
>> - * synchronize_shrinkers - Wait for all running shrinkers to complete.
>> - *
>> - * This is equivalent to calling unregister_shrink() and register_shrinker(),
>> - * but atomically and with less overhead. This is useful to guarantee that all
>> - * shrinker invocations have seen an update, before freeing memory, similar to
>> - * rcu.
>> - */
>> -void synchronize_shrinkers(void)
>> -{
>> -	down_write(&shrinker_rwsem);
>> -	up_write(&shrinker_rwsem);
>> -}
>> -EXPORT_SYMBOL(synchronize_shrinkers);
>> -- 
>> 2.30.2
>>
> 

