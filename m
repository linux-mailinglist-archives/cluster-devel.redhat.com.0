Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CC21E773500
	for <lists+cluster-devel@lfdr.de>; Tue,  8 Aug 2023 01:29:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691450940;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=0xqamAux0UTVG6klbJHwJNM84FqVsjBhqmY+h06Y7S4=;
	b=P59RI3961a79uDJ71A9OumuMETcHt7ZhjMGTDrH8cfccSH2DW4hScJAg4oyraMbTKcnrmn
	kxF//+Y2C2ajxyvS9+uk3VsOn7tOgmr9qn7MRYfwk+JXYOaRxpT35vXgJYO/lL8u75PMEV
	fE2hJ+A0tVFYoEp79zKbl/RA8+p/imQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-Ib0dnLw5N0yg8EEUGlcyPg-1; Mon, 07 Aug 2023 19:28:57 -0400
X-MC-Unique: Ib0dnLw5N0yg8EEUGlcyPg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0015800270;
	Mon,  7 Aug 2023 23:28:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A92344101;
	Mon,  7 Aug 2023 23:28:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4193B19465A3;
	Mon,  7 Aug 2023 23:28:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6AE771946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  7 Aug 2023 23:28:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DFD9740C6E8A; Mon,  7 Aug 2023 23:28:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D842240C6F4E
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 23:28:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B91BB8DC668
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 23:28:51 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-sDLSC18QNBq1F5CHF1jKmA-1; Mon, 07 Aug 2023 19:28:49 -0400
X-MC-Unique: sDLSC18QNBq1F5CHF1jKmA-1
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-686b9964ae2so3587545b3a.3
 for <cluster-devel@redhat.com>; Mon, 07 Aug 2023 16:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691450928; x=1692055728;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0xqamAux0UTVG6klbJHwJNM84FqVsjBhqmY+h06Y7S4=;
 b=NuVOANgFpzUa8ucVLYJhveVr8H6PnoK7RcgCjEUckMR9LxETzePI6uYAHmlhrq4hYA
 U1znRoMQKzkCTg/W65J2V2f7q2vRCOh4dGio3JtrE/WXGOuGXjyWPlhNcsu2bdjRJCOu
 Tt9AlQLzxFFrvmPahv1/710S/qT1qP/yPeL+oYPswF+v2oHEmjK+ojba2wfta2QvHGgq
 RjgYpXVNWWKBO1/hTuLfbsbWbo8kUIrSimLgtgYkXDoncFVMgBM/Mv0PMG+F5+3kNRYc
 H0K6/6y3O+QYcha+i1Eza4iD5c0Khf7+VA7GzFHOC8uBH8fpJR6vUVk5DvMciAxKopnQ
 2RqA==
X-Gm-Message-State: AOJu0YznAbMmJb/KN32aiDEQlQ+RaVWigfqoZM9yNxI4TWG4RqLlDKvH
 yDaFKxKLp0OS/CR0q0/NUbrSIg==
X-Google-Smtp-Source: AGHT+IHWcHOenJQfOaWa9c7YDyMdy3l3j1H0rEzsEcwqog5HJ9HhPve3KCBNDXb4QQT+YEAg/cljWw==
X-Received: by 2002:a05:6a20:8e04:b0:13c:8e50:34b8 with SMTP id
 y4-20020a056a208e0400b0013c8e5034b8mr12892217pzj.35.1691450928413; 
 Mon, 07 Aug 2023 16:28:48 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-166-213.pa.nsw.optusnet.com.au.
 [49.180.166.213]) by smtp.gmail.com with ESMTPSA id
 e18-20020aa78c52000000b0068620bee456sm6663729pfd.209.2023.08.07.16.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:28:47 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qT9eW-002TeM-1d;
 Tue, 08 Aug 2023 09:28:44 +1000
Date: Tue, 8 Aug 2023 09:28:44 +1000
From: Dave Chinner <david@fromorbit.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <ZNF+LLUpKWHDEG1u@dread.disaster.area>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-46-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20230807110936.21819-46-zhengqi.arch@bytedance.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 07, 2023 at 07:09:33PM +0800, Qi Zheng wrote:
> The shrinker_rwsem is a global read-write lock in shrinkers subsystem,
> which protects most operations such as slab shrink, registration and
> unregistration of shrinkers, etc. This can easily cause problems in the
> following cases.
....
> This commit uses the refcount+RCU method [5] proposed by Dave Chinner
> to re-implement the lockless global slab shrink. The memcg slab shrink is
> handled in the subsequent patch.
....
> ---
>  include/linux/shrinker.h | 17 ++++++++++
>  mm/shrinker.c            | 70 +++++++++++++++++++++++++++++-----------
>  2 files changed, 68 insertions(+), 19 deletions(-)

There's no documentation in the code explaining how the lockless
shrinker algorithm works. It's left to the reader to work out how
this all goes together....

> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> index eb342994675a..f06225f18531 100644
> --- a/include/linux/shrinker.h
> +++ b/include/linux/shrinker.h
> @@ -4,6 +4,8 @@
>  
>  #include <linux/atomic.h>
>  #include <linux/types.h>
> +#include <linux/refcount.h>
> +#include <linux/completion.h>
>  
>  #define SHRINKER_UNIT_BITS	BITS_PER_LONG
>  
> @@ -87,6 +89,10 @@ struct shrinker {
>  	int seeks;	/* seeks to recreate an obj */
>  	unsigned flags;
>  
> +	refcount_t refcount;
> +	struct completion done;
> +	struct rcu_head rcu;

What does the refcount protect, why do we need the completion, etc?

> +
>  	void *private_data;
>  
>  	/* These are for internal use */
> @@ -120,6 +126,17 @@ struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
>  void shrinker_register(struct shrinker *shrinker);
>  void shrinker_free(struct shrinker *shrinker);
>  
> +static inline bool shrinker_try_get(struct shrinker *shrinker)
> +{
> +	return refcount_inc_not_zero(&shrinker->refcount);
> +}
> +
> +static inline void shrinker_put(struct shrinker *shrinker)
> +{
> +	if (refcount_dec_and_test(&shrinker->refcount))
> +		complete(&shrinker->done);
> +}
> +
>  #ifdef CONFIG_SHRINKER_DEBUG
>  extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
>  						  const char *fmt, ...);
> diff --git a/mm/shrinker.c b/mm/shrinker.c
> index 1911c06b8af5..d318f5621862 100644
> --- a/mm/shrinker.c
> +++ b/mm/shrinker.c
> @@ -2,6 +2,7 @@
>  #include <linux/memcontrol.h>
>  #include <linux/rwsem.h>
>  #include <linux/shrinker.h>
> +#include <linux/rculist.h>
>  #include <trace/events/vmscan.h>
>  
>  #include "internal.h"
> @@ -577,33 +578,42 @@ unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
>  	if (!mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
>  		return shrink_slab_memcg(gfp_mask, nid, memcg, priority);
>  
> -	if (!down_read_trylock(&shrinker_rwsem))
> -		goto out;
> -
> -	list_for_each_entry(shrinker, &shrinker_list, list) {
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(shrinker, &shrinker_list, list) {
>  		struct shrink_control sc = {
>  			.gfp_mask = gfp_mask,
>  			.nid = nid,
>  			.memcg = memcg,
>  		};
>  
> +		if (!shrinker_try_get(shrinker))
> +			continue;
> +
> +		/*
> +		 * We can safely unlock the RCU lock here since we already
> +		 * hold the refcount of the shrinker.
> +		 */
> +		rcu_read_unlock();
> +
>  		ret = do_shrink_slab(&sc, shrinker, priority);
>  		if (ret == SHRINK_EMPTY)
>  			ret = 0;
>  		freed += ret;
> +
>  		/*
> -		 * Bail out if someone want to register a new shrinker to
> -		 * prevent the registration from being stalled for long periods
> -		 * by parallel ongoing shrinking.
> +		 * This shrinker may be deleted from shrinker_list and freed
> +		 * after the shrinker_put() below, but this shrinker is still
> +		 * used for the next traversal. So it is necessary to hold the
> +		 * RCU lock first to prevent this shrinker from being freed,
> +		 * which also ensures that the next shrinker that is traversed
> +		 * will not be freed (even if it is deleted from shrinker_list
> +		 * at the same time).
>  		 */

This comment really should be at the head of the function,
describing the algorithm used within the function itself. i.e. how
reference counts are used w.r.t. the rcu_read_lock() usage to
guarantee existence of the shrinker and the validity of the list
walk.

I'm not going to remember all these little details when I look at
this code in another 6 months time, and having to work it out from
first principles every time I look at the code will waste of a lot
of time...

-Dave.
-- 
Dave Chinner
david@fromorbit.com

