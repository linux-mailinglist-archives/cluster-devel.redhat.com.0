Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 50596773656
	for <lists+cluster-devel@lfdr.de>; Tue,  8 Aug 2023 04:12:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691460740;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=S5nJ90Y7HkcDKRE+pcPu5keZJ+24iVkBC6PdC2b5uJ0=;
	b=BpIiY3z+2lUZcnPJLPGWZLkHgHZlSIXGS2KHI6eJR+bcCatUvVVZ07h8gf10/baS0gYUQq
	G9tLWA7HAH1G6jpt85tL+g8+KaClMEsqPpjWVfS2/Fx7vRbmFIN2rFKUHO4gC5jj1J+oQh
	bLVgcC63PgqhCUDGrVt/Sn+i9FJrQJc=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-_SibwRmfMMebINEHUqPBCA-1; Mon, 07 Aug 2023 22:12:17 -0400
X-MC-Unique: _SibwRmfMMebINEHUqPBCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D7E729DD981;
	Tue,  8 Aug 2023 02:12:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B9334C15BAD;
	Tue,  8 Aug 2023 02:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6123F194658C;
	Tue,  8 Aug 2023 02:12:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A72AD194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue,  8 Aug 2023 02:12:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 827C5C15BAE; Tue,  8 Aug 2023 02:12:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AB35C15BAD
 for <cluster-devel@redhat.com>; Tue,  8 Aug 2023 02:12:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41D0D856DED
 for <cluster-devel@redhat.com>; Tue,  8 Aug 2023 02:12:11 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-sjt8ab4NNJqSyhwjryQsFw-1; Mon, 07 Aug 2023 22:12:07 -0400
X-MC-Unique: sjt8ab4NNJqSyhwjryQsFw-1
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-5650ef42f6dso452627a12.0
 for <cluster-devel@redhat.com>; Mon, 07 Aug 2023 19:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691460726; x=1692065526;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S5nJ90Y7HkcDKRE+pcPu5keZJ+24iVkBC6PdC2b5uJ0=;
 b=IUKDrfIcWu66/9Uc1tHfVa2HH22iKy2y+xe9CbLDo7f7eOPhhS4eBnVHuW5BO0hDTs
 hEvjZOS/L7bwPHsYRt7nghGPnKaxhFekKEGrr1rE2NnfxReo8BTU8mOIsjTUEj3qpPal
 KMv0iu6fqXy3W2fvXnNsCFfjFdgUGw351RIOOzg/x6nPqm64PkCXO1NTG6HvbVWF57pC
 HILoNeaqJYMqb0BMFjpZ8Sf5Onza3KLrAXYiVRGwleQJ0v9mCzipK6Ogt0qPFsj38RkJ
 gsIwRdaKkLO8p5RRp91PiZmEludqborph52AJNsIhw3GmL9fJk3RoxBx7drlhQC7Nuq+
 AaWg==
X-Gm-Message-State: AOJu0Yxjxu0fSwYUwKTV5PKauqC/Lj535MHqFpUjCpXLSzITZzimsi0T
 VChkAYbTA2WYqF6F28vo4/iJWA==
X-Google-Smtp-Source: AGHT+IHE8FO8RAjHks3Izbxy+yXIAOFeIsxej7SyncoSZwq8TiDh2J09MxtXtA2ffdHhYGJ2WNjVaA==
X-Received: by 2002:a17:90a:ad90:b0:25e:d013:c22c with SMTP id
 s16-20020a17090aad9000b0025ed013c22cmr8256877pjq.47.1691460726140; 
 Mon, 07 Aug 2023 19:12:06 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-166-213.pa.nsw.optusnet.com.au.
 [49.180.166.213]) by smtp.gmail.com with ESMTPSA id
 jv14-20020a17090b31ce00b00263e4dc33aasm9313956pjb.11.2023.08.07.19.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 19:12:05 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qTCCY-002WbH-25;
 Tue, 08 Aug 2023 12:12:02 +1000
Date: Tue, 8 Aug 2023 12:12:02 +1000
From: Dave Chinner <david@fromorbit.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <ZNGkcp3Dh8hOiFpk@dread.disaster.area>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-45-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20230807110936.21819-45-zhengqi.arch@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH v4 44/48] mm: shrinker: add a secondary
 array for shrinker_info::{map, nr_deferred}
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
 dlemoal@kernel.org, Muchun Song <songmuchun@bytedance.com>,
 yujie.liu@intel.com, vbabka@suse.cz, linux-raid@vger.kernel.org,
 brauner@kernel.org, tytso@mit.edu, gregkh@linuxfoundation.org,
 muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 07, 2023 at 07:09:32PM +0800, Qi Zheng wrote:
> Currently, we maintain two linear arrays per node per memcg, which are
> shrinker_info::map and shrinker_info::nr_deferred. And we need to resize
> them when the shrinker_nr_max is exceeded, that is, allocate a new array,
> and then copy the old array to the new array, and finally free the old
> array by RCU.
> 
> For shrinker_info::map, we do set_bit() under the RCU lock, so we may set
> the value into the old map which is about to be freed. This may cause the
> value set to be lost. The current solution is not to copy the old map when
> resizing, but to set all the corresponding bits in the new map to 1. This
> solves the data loss problem, but bring the overhead of more pointless
> loops while doing memcg slab shrink.
> 
> For shrinker_info::nr_deferred, we will only modify it under the read lock
> of shrinker_rwsem, so it will not run concurrently with the resizing. But
> after we make memcg slab shrink lockless, there will be the same data loss
> problem as shrinker_info::map, and we can't work around it like the map.
> 
> For such resizable arrays, the most straightforward idea is to change it
> to xarray, like we did for list_lru [1]. We need to do xa_store() in the
> list_lru_add()-->set_shrinker_bit(), but this will cause memory
> allocation, and the list_lru_add() doesn't accept failure. A possible
> solution is to pre-allocate, but the location of pre-allocation is not
> well determined.

So you implemented a two level array that preallocates leaf
nodes to work around it? It's remarkable complex for what it does,
I can't help but think a radix tree using a special holder for
nr_deferred values of zero would end up being simpler...

> Therefore, this commit chooses to introduce a secondary array for
> shrinker_info::{map, nr_deferred}, so that we only need to copy this
> secondary array every time the size is resized. Then even if we get the
> old secondary array under the RCU lock, the found map and nr_deferred are
> also true, so no data is lost.

I don't understand what you are trying to describe here. If we get
the old array, then don't we get either a stale nr_deferred value,
or the update we do gets lost because the next shrinker lookup will
find the new array and os the deferred value stored to the old one
is never seen again?

> 
> [1]. https://lore.kernel.org/all/20220228122126.37293-13-songmuchun@bytedance.com/
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
.....
> diff --git a/mm/shrinker.c b/mm/shrinker.c
> index a27779ed3798..1911c06b8af5 100644
> --- a/mm/shrinker.c
> +++ b/mm/shrinker.c
> @@ -12,15 +12,50 @@ DECLARE_RWSEM(shrinker_rwsem);
>  #ifdef CONFIG_MEMCG
>  static int shrinker_nr_max;
>  
> -/* The shrinker_info is expanded in a batch of BITS_PER_LONG */
> -static inline int shrinker_map_size(int nr_items)
> +static inline int shrinker_unit_size(int nr_items)
>  {
> -	return (DIV_ROUND_UP(nr_items, BITS_PER_LONG) * sizeof(unsigned long));
> +	return (DIV_ROUND_UP(nr_items, SHRINKER_UNIT_BITS) * sizeof(struct shrinker_info_unit *));
>  }
>  
> -static inline int shrinker_defer_size(int nr_items)
> +static inline void shrinker_unit_free(struct shrinker_info *info, int start)
>  {
> -	return (round_up(nr_items, BITS_PER_LONG) * sizeof(atomic_long_t));
> +	struct shrinker_info_unit **unit;
> +	int nr, i;
> +
> +	if (!info)
> +		return;
> +
> +	unit = info->unit;
> +	nr = DIV_ROUND_UP(info->map_nr_max, SHRINKER_UNIT_BITS);
> +
> +	for (i = start; i < nr; i++) {
> +		if (!unit[i])
> +			break;
> +
> +		kvfree(unit[i]);
> +		unit[i] = NULL;
> +	}
> +}
> +
> +static inline int shrinker_unit_alloc(struct shrinker_info *new,
> +				       struct shrinker_info *old, int nid)
> +{
> +	struct shrinker_info_unit *unit;
> +	int nr = DIV_ROUND_UP(new->map_nr_max, SHRINKER_UNIT_BITS);
> +	int start = old ? DIV_ROUND_UP(old->map_nr_max, SHRINKER_UNIT_BITS) : 0;
> +	int i;
> +
> +	for (i = start; i < nr; i++) {
> +		unit = kvzalloc_node(sizeof(*unit), GFP_KERNEL, nid);

A unit is 576 bytes. Why is this using kvzalloc_node()?

> +		if (!unit) {
> +			shrinker_unit_free(new, start);
> +			return -ENOMEM;
> +		}
> +
> +		new->unit[i] = unit;
> +	}
> +
> +	return 0;
>  }
>  
>  void free_shrinker_info(struct mem_cgroup *memcg)
> @@ -32,6 +67,7 @@ void free_shrinker_info(struct mem_cgroup *memcg)
>  	for_each_node(nid) {
>  		pn = memcg->nodeinfo[nid];
>  		info = rcu_dereference_protected(pn->shrinker_info, true);
> +		shrinker_unit_free(info, 0);
>  		kvfree(info);
>  		rcu_assign_pointer(pn->shrinker_info, NULL);
>  	}

Why is this safe? The info and maps are looked up by RCU, so why is
freeing them without a RCU grace period expiring safe?

Yes, it was safe to do this when it was all under a semaphore, but
now the lookup and use is under RCU, so this freeing isn't
serialised against lookups anymore...


> @@ -40,28 +76,27 @@ void free_shrinker_info(struct mem_cgroup *memcg)
>  int alloc_shrinker_info(struct mem_cgroup *memcg)
>  {
>  	struct shrinker_info *info;
> -	int nid, size, ret = 0;
> -	int map_size, defer_size = 0;
> +	int nid, ret = 0;
> +	int array_size = 0;
>  
>  	down_write(&shrinker_rwsem);
> -	map_size = shrinker_map_size(shrinker_nr_max);
> -	defer_size = shrinker_defer_size(shrinker_nr_max);
> -	size = map_size + defer_size;
> +	array_size = shrinker_unit_size(shrinker_nr_max);
>  	for_each_node(nid) {
> -		info = kvzalloc_node(sizeof(*info) + size, GFP_KERNEL, nid);
> -		if (!info) {
> -			free_shrinker_info(memcg);
> -			ret = -ENOMEM;
> -			break;
> -		}
> -		info->nr_deferred = (atomic_long_t *)(info + 1);
> -		info->map = (void *)info->nr_deferred + defer_size;
> +		info = kvzalloc_node(sizeof(*info) + array_size, GFP_KERNEL, nid);
> +		if (!info)
> +			goto err;
>  		info->map_nr_max = shrinker_nr_max;
> +		if (shrinker_unit_alloc(info, NULL, nid))
> +			goto err;

That's going to now do a lot of small memory allocation when we have
lots of shrinkers active....

> @@ -150,17 +175,34 @@ static int expand_shrinker_info(int new_id)
>  	return ret;
>  }
>  
> +static inline int shriner_id_to_index(int shrinker_id)

shrinker_id_to_index

> +{
> +	return shrinker_id / SHRINKER_UNIT_BITS;
> +}
> +
> +static inline int shriner_id_to_offset(int shrinker_id)

shrinker_id_to_offset

> +{
> +	return shrinker_id % SHRINKER_UNIT_BITS;
> +}

....
> @@ -209,26 +251,31 @@ static long xchg_nr_deferred_memcg(int nid, struct shrinker *shrinker,
>  				   struct mem_cgroup *memcg)
>  {
>  	struct shrinker_info *info;
> +	struct shrinker_info_unit *unit;
>  
>  	info = shrinker_info_protected(memcg, nid);
> -	return atomic_long_xchg(&info->nr_deferred[shrinker->id], 0);
> +	unit = info->unit[shriner_id_to_index(shrinker->id)];
> +	return atomic_long_xchg(&unit->nr_deferred[shriner_id_to_offset(shrinker->id)], 0);
>  }
>  
>  static long add_nr_deferred_memcg(long nr, int nid, struct shrinker *shrinker,
>  				  struct mem_cgroup *memcg)
>  {
>  	struct shrinker_info *info;
> +	struct shrinker_info_unit *unit;
>  
>  	info = shrinker_info_protected(memcg, nid);
> -	return atomic_long_add_return(nr, &info->nr_deferred[shrinker->id]);
> +	unit = info->unit[shriner_id_to_index(shrinker->id)];
> +	return atomic_long_add_return(nr, &unit->nr_deferred[shriner_id_to_offset(shrinker->id)]);
>  }
>  
>  void reparent_shrinker_deferred(struct mem_cgroup *memcg)
>  {
> -	int i, nid;
> +	int nid, index, offset;
>  	long nr;
>  	struct mem_cgroup *parent;
>  	struct shrinker_info *child_info, *parent_info;
> +	struct shrinker_info_unit *child_unit, *parent_unit;
>  
>  	parent = parent_mem_cgroup(memcg);
>  	if (!parent)
> @@ -239,9 +286,13 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
>  	for_each_node(nid) {
>  		child_info = shrinker_info_protected(memcg, nid);
>  		parent_info = shrinker_info_protected(parent, nid);
> -		for (i = 0; i < child_info->map_nr_max; i++) {
> -			nr = atomic_long_read(&child_info->nr_deferred[i]);
> -			atomic_long_add(nr, &parent_info->nr_deferred[i]);
> +		for (index = 0; index < shriner_id_to_index(child_info->map_nr_max); index++) {
> +			child_unit = child_info->unit[index];
> +			parent_unit = parent_info->unit[index];
> +			for (offset = 0; offset < SHRINKER_UNIT_BITS; offset++) {
> +				nr = atomic_long_read(&child_unit->nr_deferred[offset]);
> +				atomic_long_add(nr, &parent_unit->nr_deferred[offset]);
> +			}
>  		}
>  	}
>  	up_read(&shrinker_rwsem);
> @@ -407,7 +458,7 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>  {
>  	struct shrinker_info *info;
>  	unsigned long ret, freed = 0;
> -	int i;
> +	int offset, index = 0;
>  
>  	if (!mem_cgroup_online(memcg))
>  		return 0;
> @@ -419,56 +470,63 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>  	if (unlikely(!info))
>  		goto unlock;
>  
> -	for_each_set_bit(i, info->map, info->map_nr_max) {
> -		struct shrink_control sc = {
> -			.gfp_mask = gfp_mask,
> -			.nid = nid,
> -			.memcg = memcg,
> -		};
> -		struct shrinker *shrinker;
> +	for (; index < shriner_id_to_index(info->map_nr_max); index++) {
> +		struct shrinker_info_unit *unit;

This adds another layer of indent to shrink_slab_memcg(). Please
factor it first so that the code ends up being readable. Doing that
first as a separate patch will also make the actual algorithm
changes in this patch be much more obvious - this huge hunk of
diff is pretty much impossible to review...

-Dave.
-- 
Dave Chinner
david@fromorbit.com

