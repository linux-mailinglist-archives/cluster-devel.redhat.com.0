Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF6A772065
	for <lists+cluster-devel@lfdr.de>; Mon,  7 Aug 2023 13:15:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691406930;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vjqO/ZPr/Go39gpx6DVg0WzFepitwPif37hI1XuxbyE=;
	b=AlNcOD6nTgmTCkgcNCREv/Dl//0ONYg4vyDLEmW48xpIyKp9edjx0s5NYr6UB6uZk5rZ9k
	sjAqfCfEE72zKdah3D1sGt1u4dPZPg6ONJorQfn60F6jfzWfxbBK7D1UsBLzOCGVzHoqHI
	0CBhuBwy2p7xIUSHbTK7GjbqA7lazYs=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-xWDWWWdnMMetiA5HUBLgqQ-1; Mon, 07 Aug 2023 07:15:23 -0400
X-MC-Unique: xWDWWWdnMMetiA5HUBLgqQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2114229AB3ED;
	Mon,  7 Aug 2023 11:15:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0FC73403168;
	Mon,  7 Aug 2023 11:15:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DEB4B1946589;
	Mon,  7 Aug 2023 11:15:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F26B31946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  7 Aug 2023 11:15:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E070840C2077; Mon,  7 Aug 2023 11:15:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D949A40C2076
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 11:15:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB1AB1C068E4
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 11:15:20 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-8x5nutuiNAeX-tqSsp3AZw-1; Mon, 07 Aug 2023 07:15:19 -0400
X-MC-Unique: 8x5nutuiNAeX-tqSsp3AZw-1
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2690803a368so590809a91.1
 for <cluster-devel@redhat.com>; Mon, 07 Aug 2023 04:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691406918; x=1692011718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vjqO/ZPr/Go39gpx6DVg0WzFepitwPif37hI1XuxbyE=;
 b=Rk875mjLvujISfuYuHC3EZek94PT9STlxWyzmD/8FYNh1Mi3kLMUvL7AgZ0Ta72B7+
 yS6UPYd72q1a61l7qGHxwLn/81iwehC1jyeGbrfdwR0QCZO44OgM9mnChA7Un5jcwFNo
 7nuTQdbg/RWK66dz9c6UnOxcOpMxi4NMNvIewmbiMv7Qhj+dm6sSnPrzuhibdexrVot8
 aXwafcgDKNoItcvVxW3tclXAdGmleJmIeidoiFE2Kh7Ox81uZ8zi6ngOmBZRdE5n6iUd
 sJ2p5NTIyfhjIY1GIYIcKE44TUgVIqedXasI3QcNs993IKNGGDWD0r69J/soMaqDRgL5
 oi2A==
X-Gm-Message-State: ABy/qLY8ZWpdfOaAZQtKphWXbdzpCJJS4PJnUmxoCjnQgiiPrflCqBfK
 t5FQoemlxGQI0fOhQJldNf/BiA==
X-Google-Smtp-Source: APBJJlGmDPkOqvUzYBlbH7T7lkG5BB9heuLk9VUuk/u1AhmT0DHlhAEqotepcvwe4m42tykQjmW6CA==
X-Received: by 2002:a17:90a:4104:b0:25c:1ad3:a4a1 with SMTP id
 u4-20020a17090a410400b0025c1ad3a4a1mr24597319pjf.1.1691406917979; 
 Mon, 07 Aug 2023 04:15:17 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:15:17 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 simon.horman@corigine.com, dlemoal@kernel.org
Date: Mon,  7 Aug 2023 19:09:13 +0800
Message-Id: <20230807110936.21819-26-zhengqi.arch@bytedance.com>
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH v4 25/48] drm/panfrost: dynamically allocate
 the drm-panfrost shrinker
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
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the drm-panfrost shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct panfrost_device.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  6 +++-
 drivers/gpu/drm/panfrost/panfrost_gem.h       |  2 +-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 30 +++++++++++--------
 4 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index b0126b9fbadc..e667e5689353 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -118,7 +118,7 @@ struct panfrost_device {
 
 	struct mutex shrinker_lock;
 	struct list_head shrinker_list;
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 
 	struct panfrost_devfreq pfdevfreq;
 };
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index a2ab99698ca8..e1d0e3a23757 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -601,10 +601,14 @@ static int panfrost_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto err_out1;
 
-	panfrost_gem_shrinker_init(ddev);
+	err = panfrost_gem_shrinker_init(ddev);
+	if (err)
+		goto err_out2;
 
 	return 0;
 
+err_out2:
+	drm_dev_unregister(ddev);
 err_out1:
 	pm_runtime_disable(pfdev->dev);
 	panfrost_device_fini(pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index ad2877eeeccd..863d2ec8d4f0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -81,7 +81,7 @@ panfrost_gem_mapping_get(struct panfrost_gem_object *bo,
 void panfrost_gem_mapping_put(struct panfrost_gem_mapping *mapping);
 void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo);
 
-void panfrost_gem_shrinker_init(struct drm_device *dev);
+int panfrost_gem_shrinker_init(struct drm_device *dev);
 void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
 
 #endif /* __PANFROST_GEM_H__ */
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index 6a71a2555f85..3dfe2b7ccdd9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -18,8 +18,7 @@
 static unsigned long
 panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
-	struct panfrost_device *pfdev =
-		container_of(shrinker, struct panfrost_device, shrinker);
+	struct panfrost_device *pfdev = shrinker->private_data;
 	struct drm_gem_shmem_object *shmem;
 	unsigned long count = 0;
 
@@ -65,8 +64,7 @@ static bool panfrost_gem_purge(struct drm_gem_object *obj)
 static unsigned long
 panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 {
-	struct panfrost_device *pfdev =
-		container_of(shrinker, struct panfrost_device, shrinker);
+	struct panfrost_device *pfdev = shrinker->private_data;
 	struct drm_gem_shmem_object *shmem, *tmp;
 	unsigned long freed = 0;
 
@@ -97,13 +95,22 @@ panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
  *
  * This function registers and sets up the panfrost shrinker.
  */
-void panfrost_gem_shrinker_init(struct drm_device *dev)
+int panfrost_gem_shrinker_init(struct drm_device *dev)
 {
 	struct panfrost_device *pfdev = dev->dev_private;
-	pfdev->shrinker.count_objects = panfrost_gem_shrinker_count;
-	pfdev->shrinker.scan_objects = panfrost_gem_shrinker_scan;
-	pfdev->shrinker.seeks = DEFAULT_SEEKS;
-	WARN_ON(register_shrinker(&pfdev->shrinker, "drm-panfrost"));
+
+	pfdev->shrinker = shrinker_alloc(0, "drm-panfrost");
+	if (!pfdev->shrinker)
+		return -ENOMEM;
+
+	pfdev->shrinker->count_objects = panfrost_gem_shrinker_count;
+	pfdev->shrinker->scan_objects = panfrost_gem_shrinker_scan;
+	pfdev->shrinker->seeks = DEFAULT_SEEKS;
+	pfdev->shrinker->private_data = pfdev;
+
+	shrinker_register(pfdev->shrinker);
+
+	return 0;
 }
 
 /**
@@ -116,7 +123,6 @@ void panfrost_gem_shrinker_cleanup(struct drm_device *dev)
 {
 	struct panfrost_device *pfdev = dev->dev_private;
 
-	if (pfdev->shrinker.nr_deferred) {
-		unregister_shrinker(&pfdev->shrinker);
-	}
+	if (pfdev->shrinker)
+		shrinker_free(pfdev->shrinker);
 }
-- 
2.30.2

