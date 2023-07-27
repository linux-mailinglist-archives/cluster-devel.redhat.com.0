Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 52726764B7B
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 10:15:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690445725;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LaFX3BwmrpvhCQ7689MuoFj6fWFWMuerWJZNZNxWVVc=;
	b=LFpuGp9yKJIJrlv9ZcvBWckEjDPnLq9O699iS8YnHezp/s6TliWk569cy9CNTjk7RGP1CH
	lNEV5zcPlBzF8Qzsv01GLOu3zdK2EjQT4smRyJ+0DLklgxTqwjnKZ6SYqYWb2Gpw/UAxef
	PMixIJaVGtEfF/neK5t8llta01/NP+Q=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-auKiIzFYON6bI85ZjyhKfw-1; Thu, 27 Jul 2023 04:15:20 -0400
X-MC-Unique: auKiIzFYON6bI85ZjyhKfw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08B041C07590;
	Thu, 27 Jul 2023 08:15:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F13F8201EE6E;
	Thu, 27 Jul 2023 08:15:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CCCD81946A72;
	Thu, 27 Jul 2023 08:15:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C444819459F1 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 08:11:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 51F974094DC3; Thu, 27 Jul 2023 08:11:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A26C4094DC0
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 08:11:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D2A3185A7AB
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 08:11:45 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-vkWq1wdnMGiUhkY2fCUFJA-1; Thu, 27 Jul 2023 04:11:43 -0400
X-MC-Unique: vkWq1wdnMGiUhkY2fCUFJA-1
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-686f6231bdeso113486b3a.1
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 01:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445502; x=1691050302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LaFX3BwmrpvhCQ7689MuoFj6fWFWMuerWJZNZNxWVVc=;
 b=Al3QCC2AXLb+CzPikeIj5hxOI6TuhVo6xGIqYKB7JX/I2pKEVBBy8qm8Ie6krS1g2B
 a7s5WAEqfTNH1tEZXq7FtwjdEuA0p1gy5szgPYs/5nVtwhmS60r8/SdibUbHGUZb+QWE
 RtaD+ua3SmRmy0kXAI1rQlogVwhcElrfxPxIVhnYnJzCPOLlq7ixUrM57LwL/nie152x
 /p2+np7xQ5g1FRMNTdNQ9m2793MOAvhHEvMgE9/DVEKs1zP3sg1ecQeS9k/fO+j1NHUb
 7qofpR9EJlIwxLRHN01Fcoyy9bOWEjXcEQq20CtxjIWJNRXcjcwpjIoRvboJyph+luRO
 TTOw==
X-Gm-Message-State: ABy/qLZpT4kP1Ru2ZDM4Mc/HFXCEljIw87l49ECMF6yKezOPKR9n20O4
 ZXa+wrFDi0BykUosVz7vJGqDcg==
X-Google-Smtp-Source: APBJJlE5krPFtX55mdmbm5NUPWWjP9qjtSRaT4qUAQtTa6jtnXVyWfbzlnq9LXdP1SlmgTnMsVycpA==
X-Received: by 2002:a05:6a21:78a8:b0:137:3eba:b81f with SMTP id
 bf40-20020a056a2178a800b001373ebab81fmr6016028pzc.3.1690445502183; 
 Thu, 27 Jul 2023 01:11:42 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:11:41 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Thu, 27 Jul 2023 16:04:42 +0800
Message-Id: <20230727080502.77895-30-zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH v3 29/49] md/raid5: dynamically allocate the
 md-raid5 shrinker
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
 linux-bcache@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 Muchun Song <songmuchun@bytedance.com>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the md-raid5 shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct r5conf.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/md/raid5.c | 25 ++++++++++++++-----------
 drivers/md/raid5.h |  2 +-
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 85b3004594e0..fbb4e6f5ff43 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7414,7 +7414,7 @@ static void free_conf(struct r5conf *conf)
 
 	log_exit(conf);
 
-	unregister_shrinker(&conf->shrinker);
+	shrinker_free(conf->shrinker);
 	free_thread_groups(conf);
 	shrink_stripes(conf);
 	raid5_free_percpu(conf);
@@ -7462,7 +7462,7 @@ static int raid5_alloc_percpu(struct r5conf *conf)
 static unsigned long raid5_cache_scan(struct shrinker *shrink,
 				      struct shrink_control *sc)
 {
-	struct r5conf *conf = container_of(shrink, struct r5conf, shrinker);
+	struct r5conf *conf = shrink->private_data;
 	unsigned long ret = SHRINK_STOP;
 
 	if (mutex_trylock(&conf->cache_size_mutex)) {
@@ -7483,7 +7483,7 @@ static unsigned long raid5_cache_scan(struct shrinker *shrink,
 static unsigned long raid5_cache_count(struct shrinker *shrink,
 				       struct shrink_control *sc)
 {
-	struct r5conf *conf = container_of(shrink, struct r5conf, shrinker);
+	struct r5conf *conf = shrink->private_data;
 
 	if (conf->max_nr_stripes < conf->min_nr_stripes)
 		/* unlikely, but not impossible */
@@ -7718,18 +7718,21 @@ static struct r5conf *setup_conf(struct mddev *mddev)
 	 * it reduces the queue depth and so can hurt throughput.
 	 * So set it rather large, scaled by number of devices.
 	 */
-	conf->shrinker.seeks = DEFAULT_SEEKS * conf->raid_disks * 4;
-	conf->shrinker.scan_objects = raid5_cache_scan;
-	conf->shrinker.count_objects = raid5_cache_count;
-	conf->shrinker.batch = 128;
-	conf->shrinker.flags = 0;
-	ret = register_shrinker(&conf->shrinker, "md-raid5:%s", mdname(mddev));
-	if (ret) {
-		pr_warn("md/raid:%s: couldn't register shrinker.\n",
+	conf->shrinker = shrinker_alloc(0, "md-raid5:%s", mdname(mddev));
+	if (!conf->shrinker) {
+		pr_warn("md/raid:%s: couldn't allocate shrinker.\n",
 			mdname(mddev));
 		goto abort;
 	}
 
+	conf->shrinker->seeks = DEFAULT_SEEKS * conf->raid_disks * 4;
+	conf->shrinker->scan_objects = raid5_cache_scan;
+	conf->shrinker->count_objects = raid5_cache_count;
+	conf->shrinker->batch = 128;
+	conf->shrinker->private_data = conf;
+
+	shrinker_register(conf->shrinker);
+
 	sprintf(pers_name, "raid%d", mddev->new_level);
 	rcu_assign_pointer(conf->thread,
 			   md_register_thread(raid5d, mddev, pers_name));
diff --git a/drivers/md/raid5.h b/drivers/md/raid5.h
index 97a795979a35..22bea20eccbd 100644
--- a/drivers/md/raid5.h
+++ b/drivers/md/raid5.h
@@ -670,7 +670,7 @@ struct r5conf {
 	wait_queue_head_t	wait_for_stripe;
 	wait_queue_head_t	wait_for_overlap;
 	unsigned long		cache_state;
-	struct shrinker		shrinker;
+	struct shrinker		*shrinker;
 	int			pool_size; /* number of disks in stripeheads in pool */
 	spinlock_t		device_lock;
 	struct disk_info	*disks;
-- 
2.30.2

