Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7D978429C
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Aug 2023 15:57:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692712642;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=LXzMnEM8moHL5KfliVx5cD1lb3aAd5NGNjk14fqFYLY=;
	b=JEu8JKvcrU9CkQ3IB5NRA1yviObq0OD8Q8oahd0vu0ysYfjoXKVrQ3iCVmwazXPKiH9udf
	SWh+Wi9Q7wL/sBYoJPs50QdQM5Opp+pG/3MCwEQXyZXRDeWQ1o0jA4bb+4zdRbvip2HPeZ
	qYHIpjWedp0ZPRWKUETagSY+9/DqQDI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-Mayd11cvPtSXZYYahGvodw-1; Tue, 22 Aug 2023 09:57:19 -0400
X-MC-Unique: Mayd11cvPtSXZYYahGvodw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8E60823DEA;
	Tue, 22 Aug 2023 13:57:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F77F492C18;
	Tue, 22 Aug 2023 13:56:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ACD83194658C;
	Tue, 22 Aug 2023 13:56:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EC7031946588 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 22 Aug 2023 13:56:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 250A7492C3A; Tue, 22 Aug 2023 13:56:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D075492C13
 for <cluster-devel@redhat.com>; Tue, 22 Aug 2023 13:56:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE2A2101A52E
 for <cluster-devel@redhat.com>; Tue, 22 Aug 2023 13:56:26 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-uHF_2DpxP42ZmfDRuDCquA-1; Tue, 22 Aug 2023 09:56:24 -0400
X-MC-Unique: uHF_2DpxP42ZmfDRuDCquA-1
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3175e1bb38cso748748f8f.1
 for <cluster-devel@redhat.com>; Tue, 22 Aug 2023 06:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692712583; x=1693317383;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LXzMnEM8moHL5KfliVx5cD1lb3aAd5NGNjk14fqFYLY=;
 b=NYv0TjhhgTuDDWLt+54IGhT8FuGG2yN4/s99F6iQFYUaZBslAfjy8+UDnoLjHBns+j
 xcLXdBbllEbk6fPDZSQWUrIsWbIYhbSiLsZy23A+STW/HF0D4aEA20scRuquXRF0P/q/
 WOfswqMTHUN3E/BuIJAtiRmdzSJ7OblWzv8WVzRDTGvFC4kFdsSec/fWqOVi3NHdZod4
 B5/JEpX9lU+j6134PjQVrf+6BMlFw1GG21o2ieuOJTHunVk8EPnHpTbOf1dH/XoLafyd
 mzPGtOoykAZiyrYbDzqkuThnwg9WHsIGi/PrTU26v8N2/tt1zslpp0cyv63b8uxdx/ET
 qEBQ==
X-Gm-Message-State: AOJu0Yx9EpIyiiHayxsatOV86yqhJlP8j0v8Y0Sas+wYaieUjZgRBheM
 Nn/g03BtYWIBFO9xCmx8A/ozyg==
X-Google-Smtp-Source: AGHT+IHJQrlSrCu8WgUX5s8XkdDm6/hR/jwfxds8mVBdQgFEL5tBYnuf/oIT+VMpj8Z6S8wRiH/+Kw==
X-Received: by 2002:a5d:65c5:0:b0:319:8dcf:5c10 with SMTP id
 e5-20020a5d65c5000000b003198dcf5c10mr6979657wrw.6.1692712582669; 
 Tue, 22 Aug 2023 06:56:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c210500b003fc02e8ea68sm19456835wml.13.2023.08.22.06.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 06:56:22 -0700 (PDT)
Date: Tue, 22 Aug 2023 15:56:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <ZOS+g51Yx9PsYkGU@phenom.ffwll.local>
Mail-Followup-To: Qi Zheng <zhengqi.arch@bytedance.com>,
 akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org,
 muchun.song@linux.dev, simon.horman@corigine.com,
 dlemoal@kernel.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 Muchun Song <songmuchun@bytedance.com>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-44-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20230807110936.21819-44-zhengqi.arch@bytedance.com>
X-Operating-System: Linux phenom 6.3.0-2-amd64
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
 muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: ffwll.ch
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 07, 2023 at 07:09:31PM +0800, Qi Zheng wrote:
> Currently, the synchronize_shrinkers() is only used by TTM pool. It only
> requires that no shrinkers run in parallel.
> 
> After we use RCU+refcount method to implement the lockless slab shrink,
> we can not use shrinker_rwsem or synchronize_rcu() to guarantee that all
> shrinker invocations have seen an update before freeing memory.
> 
> So we introduce a new pool_shrink_rwsem to implement a private
> synchronize_shrinkers(), so as to achieve the same purpose.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>

On the 5 drm patches (I counted 2 ttm and 3 drivers) for merging through
some other tree (since I'm assuming that's how this will land):

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 15 +++++++++++++++
>  include/linux/shrinker.h       |  2 --
>  mm/shrinker.c                  | 15 ---------------
>  3 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index c9c9618c0dce..38b4c280725c 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -74,6 +74,7 @@ static struct ttm_pool_type global_dma32_uncached[MAX_ORDER + 1];
>  static spinlock_t shrinker_lock;
>  static struct list_head shrinker_list;
>  static struct shrinker *mm_shrinker;
> +static DECLARE_RWSEM(pool_shrink_rwsem);
>  
>  /* Allocate pages of size 1 << order with the given gfp_flags */
>  static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
> @@ -317,6 +318,7 @@ static unsigned int ttm_pool_shrink(void)
>  	unsigned int num_pages;
>  	struct page *p;
>  
> +	down_read(&pool_shrink_rwsem);
>  	spin_lock(&shrinker_lock);
>  	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
>  	list_move_tail(&pt->shrinker_list, &shrinker_list);
> @@ -329,6 +331,7 @@ static unsigned int ttm_pool_shrink(void)
>  	} else {
>  		num_pages = 0;
>  	}
> +	up_read(&pool_shrink_rwsem);
>  
>  	return num_pages;
>  }
> @@ -572,6 +575,18 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>  }
>  EXPORT_SYMBOL(ttm_pool_init);
>  
> +/**
> + * synchronize_shrinkers - Wait for all running shrinkers to complete.
> + *
> + * This is useful to guarantee that all shrinker invocations have seen an
> + * update, before freeing memory, similar to rcu.
> + */
> +static void synchronize_shrinkers(void)
> +{
> +	down_write(&pool_shrink_rwsem);
> +	up_write(&pool_shrink_rwsem);
> +}
> +
>  /**
>   * ttm_pool_fini - Cleanup a pool
>   *
> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> index c55c07c3f0cb..025c8070dd86 100644
> --- a/include/linux/shrinker.h
> +++ b/include/linux/shrinker.h
> @@ -103,8 +103,6 @@ struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
>  void shrinker_register(struct shrinker *shrinker);
>  void shrinker_free(struct shrinker *shrinker);
>  
> -extern void synchronize_shrinkers(void);
> -
>  #ifdef CONFIG_SHRINKER_DEBUG
>  extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
>  						  const char *fmt, ...);
> diff --git a/mm/shrinker.c b/mm/shrinker.c
> index 3ab301ff122d..a27779ed3798 100644
> --- a/mm/shrinker.c
> +++ b/mm/shrinker.c
> @@ -650,18 +650,3 @@ void shrinker_free(struct shrinker *shrinker)
>  	kfree(shrinker);
>  }
>  EXPORT_SYMBOL_GPL(shrinker_free);
> -
> -/**
> - * synchronize_shrinkers - Wait for all running shrinkers to complete.
> - *
> - * This is equivalent to calling unregister_shrink() and register_shrinker(),
> - * but atomically and with less overhead. This is useful to guarantee that all
> - * shrinker invocations have seen an update, before freeing memory, similar to
> - * rcu.
> - */
> -void synchronize_shrinkers(void)
> -{
> -	down_write(&shrinker_rwsem);
> -	up_write(&shrinker_rwsem);
> -}
> -EXPORT_SYMBOL(synchronize_shrinkers);
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

