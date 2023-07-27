Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8715764F78
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 11:22:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690449736;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zDAeke9dPI5F1DLlt143+V+9EjjOTI/Ym3kFZW9NJks=;
	b=K/ZK3+A1OcJLYvNIem3HOOiVNh6iEZ8ew5XcmpkDuU4JVDaZZq3ve4pdjVirewpQd20fVD
	0RNYrx2p9pI+NAgH4me+Qn6mhfucvJncGdDUALKRxYvADoGQHFzyeYIzbKWB0skgAISm52
	f9sdqc8xktafoeQ761gcYHHzDqMrLPw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-luTrpUYVN_qynhMO9UBvfg-1; Thu, 27 Jul 2023 05:22:12 -0400
X-MC-Unique: luTrpUYVN_qynhMO9UBvfg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAB0D185A78B;
	Thu, 27 Jul 2023 09:22:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDC29C2C858;
	Thu, 27 Jul 2023 09:22:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8EAF81946A71;
	Thu, 27 Jul 2023 09:22:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 478401946A6E for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 09:17:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 407AB4094DC1; Thu, 27 Jul 2023 09:17:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3859E4094DC0
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 09:17:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC73438210A7
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 09:17:52 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-Jiz_4GpfOVyGiu26KB12nA-1; Thu, 27 Jul 2023 05:17:50 -0400
X-MC-Unique: Jiz_4GpfOVyGiu26KB12nA-1
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1bba9539a23so925025ad.1
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 02:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690449470; x=1691054270;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zDAeke9dPI5F1DLlt143+V+9EjjOTI/Ym3kFZW9NJks=;
 b=BXEgBCDEWtGO5DhpuzeGRATUU0aBZgpfLlEvVpVcAjppYG1c7yfiqXUhyRh5au6mlL
 zMWHPVG2fNQSLmtTWykaFbb47uwlboa9KzCqdejHn4DkOnVVrJg1nF5GnLXPwpoSzT/t
 31i4y+kxgebwe/6ixj0TigA89+zanpw6Bco1mBP8/1rls9oshhOoprO/qeDk+trkwrIm
 Siomq/sTDobinsA0Hb/3IZD9+ixKydIULwLMG7VcQajjPpgZLo7GEA5FNElLDOX1ptMF
 nzK8FN6nR/S4zNkiZLKYGEXN+DlXiE2qu27SBc/rS4VyB8OT48AAhPhDyN5gFoePT3Li
 szbA==
X-Gm-Message-State: ABy/qLYv9I5d4J4rb0P8Xvg32MZXKQ+V7IVVoKYhKPC8p1JVvLQ81wkb
 /SbItwNvQnZNw5bAqO9Q8tUI0A==
X-Google-Smtp-Source: APBJJlEO2aWJnLprK4RcTuXXptsAhhV2CWniExK2SV0FTWirST2PpjxVowXAUeeRM51pJjQHZWKeBg==
X-Received: by 2002:a17:902:dac6:b0:1b8:9fc4:2733 with SMTP id
 q6-20020a170902dac600b001b89fc42733mr5853252plx.3.1690449469696; 
 Thu, 27 Jul 2023 02:17:49 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ea8300b001b8c3c7b102sm1099792plb.127.2023.07.27.02.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 02:17:49 -0700 (PDT)
Message-ID: <df02ac8e-b9b3-1582-7d11-fb5ab54f2e64@bytedance.com>
Date: Thu, 27 Jul 2023 17:17:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-35-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-35-zhengqi.arch@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v3 34/49] ext4: dynamically allocate the
 ext4-es shrinker
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
> dynamically allocate the ext4-es shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct ext4_sb_info.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   fs/ext4/ext4.h           |  2 +-
>   fs/ext4/extents_status.c | 22 ++++++++++++----------
>   2 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index 1e2259d9967d..82397bf0b33e 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -1657,7 +1657,7 @@ struct ext4_sb_info {
>   	__u32 s_csum_seed;
>   
>   	/* Reclaim extents from extent status tree */
> -	struct shrinker s_es_shrinker;
> +	struct shrinker *s_es_shrinker;
>   	struct list_head s_es_list;	/* List of inodes with reclaimable extents */
>   	long s_es_nr_inode;
>   	struct ext4_es_stats s_es_stats;
> diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
> index 9b5b8951afb4..74bb64fadbc4 100644
> --- a/fs/ext4/extents_status.c
> +++ b/fs/ext4/extents_status.c
> @@ -1596,7 +1596,7 @@ static unsigned long ext4_es_count(struct shrinker *shrink,
>   	unsigned long nr;
>   	struct ext4_sb_info *sbi;
>   
> -	sbi = container_of(shrink, struct ext4_sb_info, s_es_shrinker);
> +	sbi = shrink->private_data;
>   	nr = percpu_counter_read_positive(&sbi->s_es_stats.es_stats_shk_cnt);
>   	trace_ext4_es_shrink_count(sbi->s_sb, sc->nr_to_scan, nr);
>   	return nr;
> @@ -1605,8 +1605,7 @@ static unsigned long ext4_es_count(struct shrinker *shrink,
>   static unsigned long ext4_es_scan(struct shrinker *shrink,
>   				  struct shrink_control *sc)
>   {
> -	struct ext4_sb_info *sbi = container_of(shrink,
> -					struct ext4_sb_info, s_es_shrinker);
> +	struct ext4_sb_info *sbi = shrink->private_data;
>   	int nr_to_scan = sc->nr_to_scan;
>   	int ret, nr_shrunk;
>   
> @@ -1690,14 +1689,17 @@ int ext4_es_register_shrinker(struct ext4_sb_info *sbi)
>   	if (err)
>   		goto err3;
>   
> -	sbi->s_es_shrinker.scan_objects = ext4_es_scan;
> -	sbi->s_es_shrinker.count_objects = ext4_es_count;
> -	sbi->s_es_shrinker.seeks = DEFAULT_SEEKS;
> -	err = register_shrinker(&sbi->s_es_shrinker, "ext4-es:%s",
> -				sbi->s_sb->s_id);
> -	if (err)
> +	sbi->s_es_shrinker = shrinker_alloc(0, "ext4-es:%s", sbi->s_sb->s_id);
> +	if (!sbi->s_es_shrinker)

Here should set err to -ENOMEM, will fix.

>   		goto err4;
>   
> +	sbi->s_es_shrinker->scan_objects = ext4_es_scan;
> +	sbi->s_es_shrinker->count_objects = ext4_es_count;
> +	sbi->s_es_shrinker->seeks = DEFAULT_SEEKS;
> +	sbi->s_es_shrinker->private_data = sbi;
> +
> +	shrinker_register(sbi->s_es_shrinker);
> +
>   	return 0;
>   err4:
>   	percpu_counter_destroy(&sbi->s_es_stats.es_stats_shk_cnt);
> @@ -1716,7 +1718,7 @@ void ext4_es_unregister_shrinker(struct ext4_sb_info *sbi)
>   	percpu_counter_destroy(&sbi->s_es_stats.es_stats_cache_misses);
>   	percpu_counter_destroy(&sbi->s_es_stats.es_stats_all_cnt);
>   	percpu_counter_destroy(&sbi->s_es_stats.es_stats_shk_cnt);
> -	unregister_shrinker(&sbi->s_es_shrinker);
> +	shrinker_free(sbi->s_es_shrinker);
>   }
>   
>   /*

