Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0D97738BC
	for <lists+cluster-devel@lfdr.de>; Tue,  8 Aug 2023 09:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691481054;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wpg6aIffbYjICJhycB3Bph3fxU0UaKYZ32RPKTrhmtc=;
	b=Uxp0UOWqtr596V2gEqpR0In75uzVfKT2qBH61NisshiwN6WfCOdwDyFCPRomhZGckuhmON
	IQPZwWvKnHd7FvZsQV2OC23p6nqmbvvhaZNdGs3O3ao7QcnsVs6CgLqTJLNrB9BdbwGDhE
	Xxql1aF1ddxrwwgw7rZAyInsbXKj8tM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-ACpPffCoODCeSsbresDr_g-1; Tue, 08 Aug 2023 03:50:50 -0400
X-MC-Unique: ACpPffCoODCeSsbresDr_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8299C800C78;
	Tue,  8 Aug 2023 07:50:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 697582026D68;
	Tue,  8 Aug 2023 07:50:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 07B50194658F;
	Tue,  8 Aug 2023 07:50:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0AD6B1946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  8 Aug 2023 07:50:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DE974401061; Tue,  8 Aug 2023 07:50:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6A57492C13
 for <cluster-devel@redhat.com>; Tue,  8 Aug 2023 07:50:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B836880B1EA
 for <cluster-devel@redhat.com>; Tue,  8 Aug 2023 07:50:39 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-Uzfml0omM_OcZvLnUMSuzA-1; Tue, 08 Aug 2023 03:50:34 -0400
X-MC-Unique: Uzfml0omM_OcZvLnUMSuzA-1
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-55b78bf0423so522682a12.0
 for <cluster-devel@redhat.com>; Tue, 08 Aug 2023 00:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691481032; x=1692085832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wpg6aIffbYjICJhycB3Bph3fxU0UaKYZ32RPKTrhmtc=;
 b=db8qSnr+B7pXB0XIdfALq2UQvzb6PQp3074ueZYdj/99X2aI6PZcvhMfjKGT52Sc9W
 lx7vgLHoJaV3Uc/yD5hTAJzURXkDcVy7r4fmsWfNe5alPlGnH/nYPbolv1IvMSwNy8aN
 C2RFAVOjlZIDb5qV6L2ZqQN5goKP1RHCqK6Ma0U4jDsmYzSTFqjcmuqWcbCpFgcX/qOB
 xY/UDiLMvLdmYEs2nUY67yj+uf4WzpBd8OKa3kwx89Kq/AFpql4u+hOlpQP/NpRaZSTP
 mj03m2tUeszTFzYeSIlJJpbWr9qLCZwLH6bcHOkOAWLt+hZKJ4nvq7VXr2aEt3sb16+P
 8OQw==
X-Gm-Message-State: ABy/qLYrdp/rkWVYX5i8Qz9fVDAeGS4ObzU3XdbeuIzIIYhQSCFrLCOS
 rn7biQOML9aVcfYq1aKt68tNqw==
X-Google-Smtp-Source: APBJJlEd8UgUmVjTGODajLkItGQ9rG+lZy4ypLT00ATvxhzy6MYHUWJPNACQWVHeXI8Weqa+eylbDA==
X-Received: by 2002:a17:90a:6c97:b0:263:730b:f568 with SMTP id
 y23-20020a17090a6c9700b00263730bf568mr25207579pjj.3.1691481032358; 
 Tue, 08 Aug 2023 00:50:32 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a17090a410400b00263154aab24sm7244870pjf.57.2023.08.08.00.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 00:50:31 -0700 (PDT)
Message-ID: <5757e341-b261-14de-e052-46606d530460@bytedance.com>
Date: Tue, 8 Aug 2023 15:50:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
To: Dave Chinner <david@fromorbit.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-47-zhengqi.arch@bytedance.com>
 <ZNGr+1orhHaBORJG@dread.disaster.area>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ZNGr+1orhHaBORJG@dread.disaster.area>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH v4 46/48] mm: shrinker: make memcg slab
 shrink lockless
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
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 cel@kernel.org, x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 simon.horman@corigine.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, paulmck@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 dlemoal@kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, brauner@kernel.org, tytso@mit.edu,
 gregkh@linuxfoundation.org, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dave,

On 2023/8/8 10:44, Dave Chinner wrote:
> On Mon, Aug 07, 2023 at 07:09:34PM +0800, Qi Zheng wrote:
>> Like global slab shrink, this commit also uses refcount+RCU method to make
>> memcg slab shrink lockless.
> 
> This patch does random code cleanups amongst the actual RCU changes.
> Can you please move the cleanups to a spearate patch to reduce the
> noise in this one?

Sure, will do.

> 
>> diff --git a/mm/shrinker.c b/mm/shrinker.c
>> index d318f5621862..fee6f62904fb 100644
>> --- a/mm/shrinker.c
>> +++ b/mm/shrinker.c
>> @@ -107,6 +107,12 @@ static struct shrinker_info *shrinker_info_protected(struct mem_cgroup *memcg,
>>   					 lockdep_is_held(&shrinker_rwsem));
>>   }
>>   
>> +static struct shrinker_info *shrinker_info_rcu(struct mem_cgroup *memcg,
>> +					       int nid)
>> +{
>> +	return rcu_dereference(memcg->nodeinfo[nid]->shrinker_info);
>> +}
> 
> This helper doesn't add value. It doesn't tell me that
> rcu_read_lock() needs to be held when it is called, for one....

How about adding a comment or an assertion here?

> 
>>   static int expand_one_shrinker_info(struct mem_cgroup *memcg, int new_size,
>>   				    int old_size, int new_nr_max)
>>   {
>> @@ -198,7 +204,7 @@ void set_shrinker_bit(struct mem_cgroup *memcg, int nid, int shrinker_id)
>>   		struct shrinker_info_unit *unit;
>>   
>>   		rcu_read_lock();
>> -		info = rcu_dereference(memcg->nodeinfo[nid]->shrinker_info);
>> +		info = shrinker_info_rcu(memcg, nid);
> 
> ... whilst the original code here was obviously correct.
> 
>>   		unit = info->unit[shriner_id_to_index(shrinker_id)];
>>   		if (!WARN_ON_ONCE(shrinker_id >= info->map_nr_max)) {
>>   			/* Pairs with smp mb in shrink_slab() */
>> @@ -211,7 +217,7 @@ void set_shrinker_bit(struct mem_cgroup *memcg, int nid, int shrinker_id)
>>   
>>   static DEFINE_IDR(shrinker_idr);
>>   
>> -static int prealloc_memcg_shrinker(struct shrinker *shrinker)
>> +static int shrinker_memcg_alloc(struct shrinker *shrinker)
> 
> Cleanups in a separate patch.

OK.

> 
>> @@ -253,10 +258,15 @@ static long xchg_nr_deferred_memcg(int nid, struct shrinker *shrinker,
>>   {
>>   	struct shrinker_info *info;
>>   	struct shrinker_info_unit *unit;
>> +	long nr_deferred;
>>   
>> -	info = shrinker_info_protected(memcg, nid);
>> +	rcu_read_lock();
>> +	info = shrinker_info_rcu(memcg, nid);
>>   	unit = info->unit[shriner_id_to_index(shrinker->id)];
>> -	return atomic_long_xchg(&unit->nr_deferred[shriner_id_to_offset(shrinker->id)], 0);
>> +	nr_deferred = atomic_long_xchg(&unit->nr_deferred[shriner_id_to_offset(shrinker->id)], 0);
>> +	rcu_read_unlock();
>> +
>> +	return nr_deferred;
>>   }
> 
> This adds two rcu_read_lock() sections to every call to
> do_shrink_slab(). It's not at all clear ifrom any of the other code
> that do_shrink_slab() now has internal rcu_read_lock() sections....

The xchg_nr_deferred_memcg() will only be called in shrink_slab_memcg(),
so other code doesn't need to know that information?

> 
>> @@ -464,18 +480,23 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>>   	if (!mem_cgroup_online(memcg))
>>   		return 0;
>>   
>> -	if (!down_read_trylock(&shrinker_rwsem))
>> -		return 0;
>> -
>> -	info = shrinker_info_protected(memcg, nid);
>> +again:
>> +	rcu_read_lock();
>> +	info = shrinker_info_rcu(memcg, nid);
>>   	if (unlikely(!info))
>>   		goto unlock;
>>   
>> -	for (; index < shriner_id_to_index(info->map_nr_max); index++) {
>> +	if (index < shriner_id_to_index(info->map_nr_max)) {
>>   		struct shrinker_info_unit *unit;
>>   
>>   		unit = info->unit[index];
>>   
>> +		/*
>> +		 * The shrinker_info_unit will not be freed, so we can
>> +		 * safely release the RCU lock here.
>> +		 */
>> +		rcu_read_unlock();
> 
> Why - what guarantees that the shrinker_info_unit exists at this
> point? We hold no reference to it, we hold no reference to any
> shrinker, etc. What provides this existence guarantee?

The shrinker_info_unit is never freed unless the memcg is destroyed.
Here we hold the refcount of this memcg (mem_cgroup_iter() -->
css_tryget()), so the shrinker_info_unit will not be freed.

> 
>> +
>>   		for_each_set_bit(offset, unit->map, SHRINKER_UNIT_BITS) {
>>   			struct shrink_control sc = {
>>   				.gfp_mask = gfp_mask,
>> @@ -485,12 +506,14 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>>   			struct shrinker *shrinker;
>>   			int shrinker_id = calc_shrinker_id(index, offset);
>>   
>> +			rcu_read_lock();
>>   			shrinker = idr_find(&shrinker_idr, shrinker_id);
>> -			if (unlikely(!shrinker || !(shrinker->flags & SHRINKER_REGISTERED))) {
>> -				if (!shrinker)
>> -					clear_bit(offset, unit->map);
>> +			if (unlikely(!shrinker || !shrinker_try_get(shrinker))) {
>> +				clear_bit(offset, unit->map);
>> +				rcu_read_unlock();
>>   				continue;
>>   			}
>> +			rcu_read_unlock();
>>   
>>   			/* Call non-slab shrinkers even though kmem is disabled */
>>   			if (!memcg_kmem_online() &&
>> @@ -523,15 +546,20 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>>   					set_shrinker_bit(memcg, nid, shrinker_id);
>>   			}
>>   			freed += ret;
>> -
>> -			if (rwsem_is_contended(&shrinker_rwsem)) {
>> -				freed = freed ? : 1;
>> -				goto unlock;
>> -			}
>> +			shrinker_put(shrinker);
> 
> Ok, so why is this safe to call without holding the rcu read lock?
> The global shrinker has to hold the rcu_read_lock() whilst calling
> shrinker_put() to guarantee the validity of the list next pointer,
> but we don't hold off RCU here so what guarantees a racing global
> shrinker walk doesn't trip over this shrinker_put() call dropping
> the refcount to zero and freeing occuring in a different context...

This will not be a problem, even if shrinker::refcount is reduced to
0 here, the racing global shrinker walk already holds the rcu lock.

         shrink_slab            shrink_slab_memcg
         ===========            =================

         rcu_read_lock()
         shrinker_put()
                                shrinker_put()

And in shrink_slab_memcg(), the shrinker is not required to traverse the
next bit in the shrinker_info_unit::map, so there is no need to hold the
rcu lock to ensure the existence of this shrinker.

> 
> 
>> +		/*
>> +		 * We have already exited the read-side of rcu critical section
>> +		 * before calling do_shrink_slab(), the shrinker_info may be
>> +		 * released in expand_one_shrinker_info(), so reacquire the
>> +		 * shrinker_info.
>> +		 */
>> +		index++;
>> +		goto again;
> 
> With that, what makes the use of shrinker_info in
> xchg_nr_deferred_memcg() in do_shrink_slab() coherent and valid?

Holding rcu lock can ensure that the old shrinker_info will not be
freed, and the shrinker_info_unit::nr_deferred can also be indexed from
the old shrinker_info::unit[x], so the updated nr_deferred will not be
lost.

Thanks,
Qi

> 
> -Dave.

