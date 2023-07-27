Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB19764F5A
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 11:20:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690449622;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cb79b5va6gFfSJneJi5lY4rGeRwgOukMupryAUVW6kI=;
	b=McIRZSnMt9sdmz1Fhf8YpwE2ID46WDXTjtxfytP7g7r2qIDaPGYA8c4O465B/tFHsl0EUn
	Jdspi5khyNgmN89/rUnLMo8g06cN0wY29wymydvMCgw9Tc1RHVWCmUJ2y4BMZGHlO5P6Xu
	kGbpOz8ZWbx6BHECYYfIohz7wSp3wRY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-nmc8fqOzPjuWEd9h5gQIoQ-1; Thu, 27 Jul 2023 05:20:18 -0400
X-MC-Unique: nmc8fqOzPjuWEd9h5gQIoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D19A6857FD1;
	Thu, 27 Jul 2023 09:20:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A7DDC2C856;
	Thu, 27 Jul 2023 09:20:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4C0731946A71;
	Thu, 27 Jul 2023 09:20:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 976111946586 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 09:20:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7F0CB46A3A7; Thu, 27 Jul 2023 09:20:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77E82492C13
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 09:20:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58B2C1C06915
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 09:20:06 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-jp4qkjhxO-eyhwMZv66ayw-1; Thu, 27 Jul 2023 05:20:04 -0400
X-MC-Unique: jp4qkjhxO-eyhwMZv66ayw-1
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-55c79b62f3aso52628a12.1
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 02:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690449603; x=1691054403;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cb79b5va6gFfSJneJi5lY4rGeRwgOukMupryAUVW6kI=;
 b=RNPxL5LEV6qQdZIVAbHpU6Gz7W4wC3J180mDZIbQsaUrsOZahBlQ7SF9dwYVLU9auM
 v5LkPoMOECXf/17+RYdKvsgXX9vbT4J0jnHa0fWwEeclziwv+6BmGC9hW6NOCkoejreS
 h465ZRc2CbAXFxY/w5BHhQVQPR59XtKZ1U/66sm9kYwN1UAK3ff1jyQvaMF2NNMygmG1
 hxcp9QeNVyHSKlXiNwaYuqK5r/Dm1VfScSkf0AAI6+xnfq15cXZ8PNkEKeX0ldlm1nwV
 Tg3qRyk2MyV064abIaX+Y1c2zXJR5L7Fk+9pjk2YBH+yxGsvZq0Wrx7Y/rVWVHGP445M
 SeWg==
X-Gm-Message-State: ABy/qLZZ5xVGYAw0b43XnTBUBp1rtfu4Dkpi/o1ee8FHk17oRl8WG+cC
 DaUoVXyOe+fHbWSF0DD6nXULOQ==
X-Google-Smtp-Source: APBJJlH+dm0mCsob/js+yZXnXAfwEH4KDToex0aS0MQ56gbjyJxo+xxDZzOa2lZ9gy3mjvwdmWQa2g==
X-Received: by 2002:a17:902:da82:b0:1b8:811:b079 with SMTP id
 j2-20020a170902da8200b001b80811b079mr5785873plx.0.1690449602958; 
 Thu, 27 Jul 2023 02:20:02 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 5-20020a170902c24500b001bbb7d8fff2sm1109046plg.116.2023.07.27.02.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 02:20:02 -0700 (PDT)
Message-ID: <5f1b85b8-3655-1700-4d16-fa056b31ceeb@bytedance.com>
Date: Thu, 27 Jul 2023 17:19:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-41-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-41-zhengqi.arch@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH v3 40/49] xfs: dynamically allocate the
 xfs-qm shrinker
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
 linux-bcache@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2023/7/27 16:04, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the xfs-qm shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct xfs_quotainfo.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   fs/xfs/xfs_qm.c | 26 +++++++++++++-------------
>   fs/xfs/xfs_qm.h |  2 +-
>   2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/xfs/xfs_qm.c b/fs/xfs/xfs_qm.c
> index 6abcc34fafd8..032f0a208bd2 100644
> --- a/fs/xfs/xfs_qm.c
> +++ b/fs/xfs/xfs_qm.c
> @@ -504,8 +504,7 @@ xfs_qm_shrink_scan(
>   	struct shrinker		*shrink,
>   	struct shrink_control	*sc)
>   {
> -	struct xfs_quotainfo	*qi = container_of(shrink,
> -					struct xfs_quotainfo, qi_shrinker);
> +	struct xfs_quotainfo	*qi = shrink->private_data;
>   	struct xfs_qm_isolate	isol;
>   	unsigned long		freed;
>   	int			error;
> @@ -539,8 +538,7 @@ xfs_qm_shrink_count(
>   	struct shrinker		*shrink,
>   	struct shrink_control	*sc)
>   {
> -	struct xfs_quotainfo	*qi = container_of(shrink,
> -					struct xfs_quotainfo, qi_shrinker);
> +	struct xfs_quotainfo	*qi = shrink->private_data;
>   
>   	return list_lru_shrink_count(&qi->qi_lru, sc);
>   }
> @@ -680,16 +678,18 @@ xfs_qm_init_quotainfo(
>   	if (XFS_IS_PQUOTA_ON(mp))
>   		xfs_qm_set_defquota(mp, XFS_DQTYPE_PROJ, qinf);
>   
> -	qinf->qi_shrinker.count_objects = xfs_qm_shrink_count;
> -	qinf->qi_shrinker.scan_objects = xfs_qm_shrink_scan;
> -	qinf->qi_shrinker.seeks = DEFAULT_SEEKS;
> -	qinf->qi_shrinker.flags = SHRINKER_NUMA_AWARE;
> -
> -	error = register_shrinker(&qinf->qi_shrinker, "xfs-qm:%s",
> -				  mp->m_super->s_id);
> -	if (error)
> +	qinf->qi_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "xfs-qm:%s",
> +					   mp->m_super->s_id);
> +	if (!qinf->qi_shrinker)

Here should set error to -ENOMEM, will fix.

>   		goto out_free_inos;
>   
> +	qinf->qi_shrinker->count_objects = xfs_qm_shrink_count;
> +	qinf->qi_shrinker->scan_objects = xfs_qm_shrink_scan;
> +	qinf->qi_shrinker->seeks = DEFAULT_SEEKS;
> +	qinf->qi_shrinker->private_data = qinf;
> +
> +	shrinker_register(qinf->qi_shrinker);
> +
>   	return 0;
>   
>   out_free_inos:
> @@ -718,7 +718,7 @@ xfs_qm_destroy_quotainfo(
>   	qi = mp->m_quotainfo;
>   	ASSERT(qi != NULL);
>   
> -	unregister_shrinker(&qi->qi_shrinker);
> +	shrinker_free(qi->qi_shrinker);
>   	list_lru_destroy(&qi->qi_lru);
>   	xfs_qm_destroy_quotainos(qi);
>   	mutex_destroy(&qi->qi_tree_lock);
> diff --git a/fs/xfs/xfs_qm.h b/fs/xfs/xfs_qm.h
> index 9683f0457d19..d5c9fc4ba591 100644
> --- a/fs/xfs/xfs_qm.h
> +++ b/fs/xfs/xfs_qm.h
> @@ -63,7 +63,7 @@ struct xfs_quotainfo {
>   	struct xfs_def_quota	qi_usr_default;
>   	struct xfs_def_quota	qi_grp_default;
>   	struct xfs_def_quota	qi_prj_default;
> -	struct shrinker		qi_shrinker;
> +	struct shrinker		*qi_shrinker;
>   
>   	/* Minimum and maximum quota expiration timestamp values. */
>   	time64_t		qi_expiry_min;

