Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B91CE763251
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jul 2023 11:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690364038;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0oULOTnWb1HIc+jcDQkyDbPD+ewEuK6cRZsxNFZBJHs=;
	b=Kz+CtTvCzD1a3Y9HZCe4lee9sUz6k+j42ubUQausw5kQrDFeeIxbcI3CpooUp87fNWOCt8
	0o8HspomErAAu3QV6U4GrcMm+OmufhFN12ZAnoQS/BrGUu5x86kTwu/IhbnU603SaFfJG5
	9DWNQetFuA5YnXL1nRHBm19PUIidQzc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-xYYHt5UeNJu3Mxo-1p8big-1; Wed, 26 Jul 2023 05:33:55 -0400
X-MC-Unique: xYYHt5UeNJu3Mxo-1p8big-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2291185A794;
	Wed, 26 Jul 2023 09:33:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D966145414A;
	Wed, 26 Jul 2023 09:33:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 36E23193F51A;
	Wed, 26 Jul 2023 09:33:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 18A971949754 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Jul 2023 09:33:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 05616F783A; Wed, 26 Jul 2023 09:33:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F107BF782E
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 09:33:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF65C3815F61
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 09:33:52 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-QjfNe8_QNequ9BBtsRBEMw-1; Wed, 26 Jul 2023 05:33:51 -0400
X-MC-Unique: QjfNe8_QNequ9BBtsRBEMw-1
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-682a5465e9eso1487407b3a.1
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 02:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690364030; x=1690968830;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0oULOTnWb1HIc+jcDQkyDbPD+ewEuK6cRZsxNFZBJHs=;
 b=OWeLXx6wKb1UxHwe1isf1MeE2wDDg+lSToxsDcQ2UZn9/75qStskBb+RR7oOsTlu9F
 qBvHsZvn7RFjI5MY99lB6XfX1qeu7OLSPGOxrK1rQVZsNvdpiOxebOS4YWstJGk9JZS0
 orLDrn/H9XH9iduGPjFtaTazVl2P6unjhsYorJ1Nl8ubElgJmBkaeJlqUyLqWQ+MNDcY
 PKxeGf+F+5Fs4rFNyixjccwD7iuUOAeBHiYR7nUWXMM3TlVCFW6CC8crddZqemuzVNXP
 EspNu2BCF+Gt1Kuy/MrW9u+8WIUUKXPUtpPfakTW3PnkEgclb0RPWqqoL5UhHhKcGNX3
 zs5w==
X-Gm-Message-State: ABy/qLZDStF348gswGLYh3RU4asCiqyXrkD+DUI0ZdJdj8GEuq0XqzyM
 BuOk8x8El8psH8khRjUYTUQ5iA==
X-Google-Smtp-Source: APBJJlG8LKe8O0SB++JE7Hsj6dMankp6b2TdGG8KZmgQCX7ZvwrXNm6kysx08G1J6PXDjDRRJyafNA==
X-Received: by 2002:a17:903:32c9:b0:1b8:5827:8763 with SMTP id
 i9-20020a17090332c900b001b858278763mr2037984plr.4.1690364030014; 
 Wed, 26 Jul 2023 02:33:50 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a170902d2c500b001b89466a5f4sm12582766plc.105.2023.07.26.02.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:33:49 -0700 (PDT)
Message-ID: <0f12022e-5dd2-fb1c-f018-05f8ff0303ae@bytedance.com>
Date: Wed, 26 Jul 2023 17:33:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-29-zhengqi.arch@bytedance.com>
 <4ee26da4-314e-0517-5d9a-31fb107368ef@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <4ee26da4-314e-0517-5d9a-31fb107368ef@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH v2 28/47] bcache: dynamically allocate
 the md-bcache shrinker
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2023/7/26 15:32, Muchun Song wrote:
> 
> 
> On 2023/7/24 17:43, Qi Zheng wrote:
>> In preparation for implementing lockless slab shrink, use new APIs to
>> dynamically allocate the md-bcache shrinker, so that it can be freed
>> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
>> read-side critical section when releasing the struct cache_set.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   drivers/md/bcache/bcache.h |  2 +-
>>   drivers/md/bcache/btree.c  | 27 ++++++++++++++++-----------
>>   drivers/md/bcache/sysfs.c  |  3 ++-
>>   3 files changed, 19 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/md/bcache/bcache.h b/drivers/md/bcache/bcache.h
>> index 5a79bb3c272f..c622bc50f81b 100644
>> --- a/drivers/md/bcache/bcache.h
>> +++ b/drivers/md/bcache/bcache.h
>> @@ -541,7 +541,7 @@ struct cache_set {
>>       struct bio_set        bio_split;
>>       /* For the btree cache */
>> -    struct shrinker        shrink;
>> +    struct shrinker        *shrink;
>>       /* For the btree cache and anything allocation related */
>>       struct mutex        bucket_lock;
>> diff --git a/drivers/md/bcache/btree.c b/drivers/md/bcache/btree.c
>> index fd121a61f17c..c176c7fc77d9 100644
>> --- a/drivers/md/bcache/btree.c
>> +++ b/drivers/md/bcache/btree.c
>> @@ -667,7 +667,7 @@ static int mca_reap(struct btree *b, unsigned int 
>> min_order, bool flush)
>>   static unsigned long bch_mca_scan(struct shrinker *shrink,
>>                     struct shrink_control *sc)
>>   {
>> -    struct cache_set *c = container_of(shrink, struct cache_set, 
>> shrink);
>> +    struct cache_set *c = shrink->private_data;
>>       struct btree *b, *t;
>>       unsigned long i, nr = sc->nr_to_scan;
>>       unsigned long freed = 0;
>> @@ -734,7 +734,7 @@ static unsigned long bch_mca_scan(struct shrinker 
>> *shrink,
>>   static unsigned long bch_mca_count(struct shrinker *shrink,
>>                      struct shrink_control *sc)
>>   {
>> -    struct cache_set *c = container_of(shrink, struct cache_set, 
>> shrink);
>> +    struct cache_set *c = shrink->private_data;
>>       if (c->shrinker_disabled)
>>           return 0;
>> @@ -752,8 +752,8 @@ void bch_btree_cache_free(struct cache_set *c)
>>       closure_init_stack(&cl);
>> -    if (c->shrink.list.next)
>> -        unregister_shrinker(&c->shrink);
>> +    if (c->shrink)
>> +        shrinker_unregister(c->shrink);
>>       mutex_lock(&c->bucket_lock);
>> @@ -828,14 +828,19 @@ int bch_btree_cache_alloc(struct cache_set *c)
>>           c->verify_data = NULL;
>>   #endif
>> -    c->shrink.count_objects = bch_mca_count;
>> -    c->shrink.scan_objects = bch_mca_scan;
>> -    c->shrink.seeks = 4;
>> -    c->shrink.batch = c->btree_pages * 2;
>> +    c->shrink = shrinker_alloc(0, "md-bcache:%pU", c->set_uuid);
>> +    if (!c->shrink) {
>> +        pr_warn("bcache: %s: could not allocate shrinker\n", __func__);
>> +        return -ENOMEM;
> 
> Seems you have cheanged the semantic of this. In the past,
> it is better to have a shrinker, but now it becomes a mandatory.
> Right? I don't know if it is acceptable. From my point of view,
> just do the cleanup, don't change any behaviour.

Oh, should return 0 here, will do.

> 
>> +    }
>> +
>> +    c->shrink->count_objects = bch_mca_count;
>> +    c->shrink->scan_objects = bch_mca_scan;
>> +    c->shrink->seeks = 4;
>> +    c->shrink->batch = c->btree_pages * 2;
>> +    c->shrink->private_data = c;
>> -    if (register_shrinker(&c->shrink, "md-bcache:%pU", c->set_uuid))
>> -        pr_warn("bcache: %s: could not register shrinker\n",
>> -                __func__);
>> +    shrinker_register(c->shrink);
>>       return 0;
>>   }
>> diff --git a/drivers/md/bcache/sysfs.c b/drivers/md/bcache/sysfs.c
>> index 0e2c1880f60b..45d8af755de6 100644
>> --- a/drivers/md/bcache/sysfs.c
>> +++ b/drivers/md/bcache/sysfs.c
>> @@ -866,7 +866,8 @@ STORE(__bch_cache_set)
>>           sc.gfp_mask = GFP_KERNEL;
>>           sc.nr_to_scan = strtoul_or_return(buf);
>> -        c->shrink.scan_objects(&c->shrink, &sc);
>> +        if (c->shrink)
>> +            c->shrink->scan_objects(c->shrink, &sc);
>>       }
>>       sysfs_strtoul_clamp(congested_read_threshold_us,
> 

