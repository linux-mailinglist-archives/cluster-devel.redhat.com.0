Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C195D77388E
	for <lists+cluster-devel@lfdr.de>; Tue,  8 Aug 2023 09:23:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691479396;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=if5VWB18nVWwRp6UCb6aPEiH47g9I/o9CGJnGCggs6I=;
	b=PYxulOnFOfVdJ7ErxBkiIFxY+C+IMiMKu9MJKd3jGp2lXfpUNXJK88wN9ar5B1Z/61Elvn
	4e2Uav9tMiZFA9DfRucrYTsckVnJCUv7/X5E44/kH2x3Vb634kptxmT+W8HorsTwuw+F1O
	YP4Nzpl5+wntQcN0JUQuo84QJiOSu2Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-8a80EwdDP1OrzmXZ87xJsA-1; Tue, 08 Aug 2023 03:23:11 -0400
X-MC-Unique: 8a80EwdDP1OrzmXZ87xJsA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4A20811731;
	Tue,  8 Aug 2023 07:23:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AF5B1121315;
	Tue,  8 Aug 2023 07:23:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3A3021946589;
	Tue,  8 Aug 2023 07:23:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D72AF1946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  8 Aug 2023 07:23:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C3457400D700; Tue,  8 Aug 2023 07:23:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBAEA40C6F53
 for <cluster-devel@redhat.com>; Tue,  8 Aug 2023 07:23:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 732361C29AE6
 for <cluster-devel@redhat.com>; Tue,  8 Aug 2023 07:23:08 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-hPLfVyGlPAehKHdcq1TxnA-1; Tue, 08 Aug 2023 03:23:06 -0400
X-MC-Unique: hPLfVyGlPAehKHdcq1TxnA-1
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-346434c7793so5314855ab.0
 for <cluster-devel@redhat.com>; Tue, 08 Aug 2023 00:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691479386; x=1692084186;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=if5VWB18nVWwRp6UCb6aPEiH47g9I/o9CGJnGCggs6I=;
 b=Rg0mAK7DESYFO/y+/ASsvWvhG3mMRt2IhbSZImzcL07Gq/36Hg3m8xmBIKMiOHoz9x
 WMzPa/BkcXgiwY44TrzPN1iFYeP4vB4ygbgfhkhZGk7ZvYsNwK2CEdlPN/+P/+dRguYS
 oocys+rdISJ9/b0wZECWJU4v0j3c8+dpDKO6a2P+Npm9z0yd2QwxxvcKf3/R/wr++Azf
 8k4qqon2btdNUkeDdvi/qzaEFoUKfcPZtYtnMcLS8YEr4SaGP1AKxGecCC8ULWJuH1so
 GADTAuBN1lga19iXDu7H3xH/raT98SeIjEA2Kmx1/anQrFNv9+G/57gSf7E5cXGVhGSt
 AZoQ==
X-Gm-Message-State: AOJu0Ywzll4/O1pUD4p+s/QrUmecUEjAqoqBNA5+ErpBfAVB7IOLCF/R
 Pvwz5FYUs2+BCSEUBU1muHZbgdLHWIyUP15m/vY=
X-Google-Smtp-Source: AGHT+IGrIAD/R1XG8iT7hZdid4m31qfruz9y309af9L0+sAELwy0z1r+YzLKvbiH8nyqlY1j6mrYWw==
X-Received: by 2002:a92:2802:0:b0:349:7518:4877 with SMTP id
 l2-20020a922802000000b0034975184877mr3215795ilf.0.1691479385787; 
 Tue, 08 Aug 2023 00:23:05 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a63af4f000000b00564ca424f79sm4948391pgo.48.2023.08.08.00.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 00:23:05 -0700 (PDT)
Message-ID: <0fdb926c-0d61-d81f-1a52-4ef634b51804@bytedance.com>
Date: Tue, 8 Aug 2023 15:22:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
To: Dave Chinner <david@fromorbit.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-46-zhengqi.arch@bytedance.com>
 <ZNGnSbiPN0lDLpSW@dread.disaster.area>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ZNGnSbiPN0lDLpSW@dread.disaster.area>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v4 45/48] mm: shrinker: make global slab
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dave,

On 2023/8/8 10:24, Dave Chinner wrote:
> On Mon, Aug 07, 2023 at 07:09:33PM +0800, Qi Zheng wrote:
>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>> index eb342994675a..f06225f18531 100644
>> --- a/include/linux/shrinker.h
>> +++ b/include/linux/shrinker.h
>> @@ -4,6 +4,8 @@
>>   
>>   #include <linux/atomic.h>
>>   #include <linux/types.h>
>> +#include <linux/refcount.h>
>> +#include <linux/completion.h>
>>   
>>   #define SHRINKER_UNIT_BITS	BITS_PER_LONG
>>   
>> @@ -87,6 +89,10 @@ struct shrinker {
>>   	int seeks;	/* seeks to recreate an obj */
>>   	unsigned flags;
>>   
>> +	refcount_t refcount;
>> +	struct completion done;
>> +	struct rcu_head rcu;
> 
> Documentation, please. What does the refcount protect, what does the
> completion provide, etc.

How about the following:

	/*
	 * reference count of this shrinker, holding this can guarantee
	 * that the shrinker will not be released.
	 */
	refcount_t refcount;
	/*
	 * Wait for shrinker::refcount to reach 0, that is, no shrinker
	 * is running or will run again.
	 */
	struct completion done;

> 
>> +
>>   	void *private_data;
>>   
>>   	/* These are for internal use */
>> @@ -120,6 +126,17 @@ struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
>>   void shrinker_register(struct shrinker *shrinker);
>>   void shrinker_free(struct shrinker *shrinker);
>>   
>> +static inline bool shrinker_try_get(struct shrinker *shrinker)
>> +{
>> +	return refcount_inc_not_zero(&shrinker->refcount);
>> +}
>> +
>> +static inline void shrinker_put(struct shrinker *shrinker)
>> +{
>> +	if (refcount_dec_and_test(&shrinker->refcount))
>> +		complete(&shrinker->done);
>> +}
>> +
>>   #ifdef CONFIG_SHRINKER_DEBUG
>>   extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
>>   						  const char *fmt, ...);
>> diff --git a/mm/shrinker.c b/mm/shrinker.c
>> index 1911c06b8af5..d318f5621862 100644
>> --- a/mm/shrinker.c
>> +++ b/mm/shrinker.c
>> @@ -2,6 +2,7 @@
>>   #include <linux/memcontrol.h>
>>   #include <linux/rwsem.h>
>>   #include <linux/shrinker.h>
>> +#include <linux/rculist.h>
>>   #include <trace/events/vmscan.h>
>>   
>>   #include "internal.h"
>> @@ -577,33 +578,42 @@ unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
>>   	if (!mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
>>   		return shrink_slab_memcg(gfp_mask, nid, memcg, priority);
>>   
>> -	if (!down_read_trylock(&shrinker_rwsem))
>> -		goto out;
>> -
>> -	list_for_each_entry(shrinker, &shrinker_list, list) {
>> +	rcu_read_lock();
>> +	list_for_each_entry_rcu(shrinker, &shrinker_list, list) {
>>   		struct shrink_control sc = {
>>   			.gfp_mask = gfp_mask,
>>   			.nid = nid,
>>   			.memcg = memcg,
>>   		};
>>   
>> +		if (!shrinker_try_get(shrinker))
>> +			continue;
>> +
>> +		/*
>> +		 * We can safely unlock the RCU lock here since we already
>> +		 * hold the refcount of the shrinker.
>> +		 */
>> +		rcu_read_unlock();
>> +
>>   		ret = do_shrink_slab(&sc, shrinker, priority);
>>   		if (ret == SHRINK_EMPTY)
>>   			ret = 0;
>>   		freed += ret;
>> +
>>   		/*
>> -		 * Bail out if someone want to register a new shrinker to
>> -		 * prevent the registration from being stalled for long periods
>> -		 * by parallel ongoing shrinking.
>> +		 * This shrinker may be deleted from shrinker_list and freed
>> +		 * after the shrinker_put() below, but this shrinker is still
>> +		 * used for the next traversal. So it is necessary to hold the
>> +		 * RCU lock first to prevent this shrinker from being freed,
>> +		 * which also ensures that the next shrinker that is traversed
>> +		 * will not be freed (even if it is deleted from shrinker_list
>> +		 * at the same time).
>>   		 */
> 
> This needs to be moved to the head of the function, and document
> the whole list walk, get, put and completion parts of the algorithm
> that make it safe. There's more to this than "we hold a reference
> count", especially the tricky "we might see the shrinker before it
> is fully initialised" case....

How about moving these documents to before list_for_each_entry_rcu(),
and then go to the head of shrink_slab_memcg() to explain the memcg
slab shrink case.

> 
> 
> .....
>>   void shrinker_free(struct shrinker *shrinker)
>>   {
>>   	struct dentry *debugfs_entry = NULL;
>> @@ -686,9 +712,18 @@ void shrinker_free(struct shrinker *shrinker)
>>   	if (!shrinker)
>>   		return;
>>   
>> +	if (shrinker->flags & SHRINKER_REGISTERED) {
>> +		shrinker_put(shrinker);
>> +		wait_for_completion(&shrinker->done);
>> +	}
> 
> Needs a comment explaining why we need to wait here...

/*
  * Wait for all lookups of the shrinker to complete, after that, no
  * shrinker is running or will run again, then we can safely free
  * the structure where the shrinker is located, such as super_block
  * etc.
  */

>> +
>>   	down_write(&shrinker_rwsem);
>>   	if (shrinker->flags & SHRINKER_REGISTERED) {
>> -		list_del(&shrinker->list);
>> +		/*
>> +		 * Lookups on the shrinker are over and will fail in the future,
>> +		 * so we can now remove it from the lists and free it.
>> +		 */
> 
> .... rather than here after the wait has been done and provided the
> guarantee that no shrinker is running or will run again...

With the above comment, how about simplifying the comment here to the
following:

/*
  * Now we can safely remove it from the shrinker_list and free it.
  */

Thanks,
Qi

> 
> -Dave.

