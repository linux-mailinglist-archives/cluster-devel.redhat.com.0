Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B250E764EDC
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 11:11:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690449085;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4HPzHhawuqBHwf73jZH4M+rJ1h4rzhX4x1A5fzulUtE=;
	b=bYNKybp7L4dMNQ2U0goo5k6oTzAFo0+sk4dwswq1m/4LsXeiozSpZVgG0ys09aV9oTg6ga
	s0+Vje1+WymRst8Z6ufn1NPzpczAXh9VdMGj0ZsZ4AC/ofyIKTOPLczI38UvsS5ewtARDI
	0sWPuk9cUKRDly78RvpOiTUBygtNDdU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-fJevVnjNPrWSsT7DQjwAlw-1; Thu, 27 Jul 2023 05:11:19 -0400
X-MC-Unique: fJevVnjNPrWSsT7DQjwAlw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A7CC1044589;
	Thu, 27 Jul 2023 09:11:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BC2D145414B;
	Thu, 27 Jul 2023 09:11:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4A2041946A72;
	Thu, 27 Jul 2023 09:11:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AB3D01946A6C for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 09:09:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7D6CC40C206F; Thu, 27 Jul 2023 09:09:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 756F340C2063
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 09:09:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 361A62A59541
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 09:09:09 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-kKcT91MJOWqrB9zxyRAjrQ-1; Thu, 27 Jul 2023 05:09:06 -0400
X-MC-Unique: kKcT91MJOWqrB9zxyRAjrQ-1
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-686f74a8992so86530b3a.1
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 02:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690448946; x=1691053746;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4HPzHhawuqBHwf73jZH4M+rJ1h4rzhX4x1A5fzulUtE=;
 b=CfSYRZKfpR70HvE/8f06gpEW63vUUvwOI8kTOtuGt2SQt+zu7qiUwwJkfqL+R6J1HF
 sbG5COlVK2aYgun3en+lrzoU6kzyMC0xGDbWWQeTcpvD+Pudq7ozfmInbYoYULrWBRhn
 g3PRi/6PdBr6Qo9H3df6H+Kbtm9+EWPZvOe+uuPUI20OYjvaegJtf85NEQTDgk36eVwf
 rRjCuIh/wpDOtItqF57EabeAv9QpWrPirBA++2LlFsTAAcNPgfxphkae1cMnhRvXudyS
 iUCFsKFGOLRqhqdJJE5sCS2A4c4yCzRSyk6IEeAc217cOkV0cgliFbppiWjerJyypQtB
 holg==
X-Gm-Message-State: ABy/qLawq3QN5DjXP+1IcNVK6Qzy+cCk3WwIdFwR5gjjOMYz82gkJplh
 B2OMCy0HiwHEcMO+xpMrgqpGbQ==
X-Google-Smtp-Source: APBJJlGcM2GBnp4i4GpCfKYembVJdmGwthtzp39QltAoTiMbksVAbVCn2LuGL8UI/2xPGfcHp3vTrQ==
X-Received: by 2002:a05:6a20:1595:b0:137:30db:bc1e with SMTP id
 h21-20020a056a20159500b0013730dbbc1emr5836590pzj.3.1690448945731; 
 Thu, 27 Jul 2023 02:09:05 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a635551000000b00563ea47c948sm930669pgm.53.2023.07.27.02.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 02:09:05 -0700 (PDT)
Message-ID: <8951e9da-15ae-f05e-a9a4-a9354249cee2@bytedance.com>
Date: Thu, 27 Jul 2023 17:08:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-17-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-17-zhengqi.arch@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH v3 16/49] nfsd: dynamically allocate the
 nfsd-filecache shrinker
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2023/7/27 16:04, Qi Zheng wrote:
> Use new APIs to dynamically allocate the nfsd-filecache shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   fs/nfsd/filecache.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/nfsd/filecache.c b/fs/nfsd/filecache.c
> index ee9c923192e0..872eb9501965 100644
> --- a/fs/nfsd/filecache.c
> +++ b/fs/nfsd/filecache.c
> @@ -521,11 +521,7 @@ nfsd_file_lru_scan(struct shrinker *s, struct shrink_control *sc)
>   	return ret;
>   }
>   
> -static struct shrinker	nfsd_file_shrinker = {
> -	.scan_objects = nfsd_file_lru_scan,
> -	.count_objects = nfsd_file_lru_count,
> -	.seeks = 1,
> -};
> +static struct shrinker *nfsd_file_shrinker;
>   
>   /**
>    * nfsd_file_cond_queue - conditionally unhash and queue a nfsd_file
> @@ -746,12 +742,18 @@ nfsd_file_cache_init(void)
>   		goto out_err;
>   	}
>   
> -	ret = register_shrinker(&nfsd_file_shrinker, "nfsd-filecache");
> -	if (ret) {
> -		pr_err("nfsd: failed to register nfsd_file_shrinker: %d\n", ret);
> +	nfsd_file_shrinker = shrinker_alloc(0, "nfsd-filecache");
> +	if (!nfsd_file_shrinker) {

Here should set ret to -ENOMEM, will fix.

> +		pr_err("nfsd: failed to allocate nfsd_file_shrinker\n");
>   		goto out_lru;
>   	}
>   
> +	nfsd_file_shrinker->count_objects = nfsd_file_lru_count;
> +	nfsd_file_shrinker->scan_objects = nfsd_file_lru_scan;
> +	nfsd_file_shrinker->seeks = 1;
> +
> +	shrinker_register(nfsd_file_shrinker);
> +
>   	ret = lease_register_notifier(&nfsd_file_lease_notifier);
>   	if (ret) {
>   		pr_err("nfsd: unable to register lease notifier: %d\n", ret);
> @@ -774,7 +776,7 @@ nfsd_file_cache_init(void)
>   out_notifier:
>   	lease_unregister_notifier(&nfsd_file_lease_notifier);
>   out_shrinker:
> -	unregister_shrinker(&nfsd_file_shrinker);
> +	shrinker_free(nfsd_file_shrinker);
>   out_lru:
>   	list_lru_destroy(&nfsd_file_lru);
>   out_err:
> @@ -891,7 +893,7 @@ nfsd_file_cache_shutdown(void)
>   		return;
>   
>   	lease_unregister_notifier(&nfsd_file_lease_notifier);
> -	unregister_shrinker(&nfsd_file_shrinker);
> +	shrinker_free(nfsd_file_shrinker);
>   	/*
>   	 * make sure all callers of nfsd_file_lru_cb are done before
>   	 * calling nfsd_file_cache_purge

