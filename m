Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6B075F335
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jul 2023 12:28:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690194535;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZDFCq+3UkmhmTN0HM4/h2IKWPu86Pd5FvtdYemXQxRk=;
	b=NSt5DQ7zF8Nbp+LB/us/xlcxoqnTV22r0G4JlqdKOkTiD7zIe9qEIkHBTvjL/sgYHmRGXP
	NW9BSzkhMxoPRMXOy7L2z+41ScYv35HY5raJZId+FUciFcsprkak9DrizEld8HuhPDnKSq
	YXY2mBqwMVxN9XMaVpD7pLzJ7L8gObc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-ksOJknKVMHiYkfiwKpsPPQ-1; Mon, 24 Jul 2023 06:28:49 -0400
X-MC-Unique: ksOJknKVMHiYkfiwKpsPPQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08BAA104D51F;
	Mon, 24 Jul 2023 10:28:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9FF31140E952;
	Mon, 24 Jul 2023 10:28:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6996C1949748;
	Mon, 24 Jul 2023 10:28:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6053A1946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Jul 2023 09:50:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 502DD46A3A7; Mon, 24 Jul 2023 09:50:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47BF7492C13
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 09:50:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2735A873232
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 09:50:45 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-X7UROAhAMxOuqvWekyVhtA-1; Mon, 24 Jul 2023 05:50:43 -0400
X-MC-Unique: X7UROAhAMxOuqvWekyVhtA-1
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1bb91c20602so2232085ad.0
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 02:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690192242; x=1690797042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZDFCq+3UkmhmTN0HM4/h2IKWPu86Pd5FvtdYemXQxRk=;
 b=Nt8RJm9XHvT5vO3OyRJxRc+hpprriS2LPA3R7sD69Jlpr0fwOhRrsnjAMCVDukUc0U
 fmReqe6MozKc/+q60RZQAvYZ8ZITz8xgKTSfFjbTZ3srp97SNQ2DmC7+YjM8r97G/mIr
 6c14gFenRlRrLPNr1IYt9IHBw32HA8WWMPipcpDjT2o+WunbKur1OSVXPhsbQ/R8lxo+
 CKcyVIV7c3Abc2Jhs1gyqtKHtxbHnVOJ3tWaTAYTHHXAFi7x069LwhXPh73tVYVcHcIB
 VOpZl2gceXw3iYJUhf4DihgVUbFLx8gHFCS1VYSSg1vaAfxqFxAbNKJVK8jbBC/rnvFn
 IEEg==
X-Gm-Message-State: ABy/qLaqztrDCjRdHIaqbJfBM6rBCGB9EGxflKIOcvcrXlZGTfuGsERz
 bfKQj7sdXcw8G5z/sIDznxA/0w==
X-Google-Smtp-Source: APBJJlGR+n0mPlGVKvsXqmDpjqybpKJnY8gMKNhLgc/3jSHzBMUiGDHHAqX91CFo21fNITu34xNtfg==
X-Received: by 2002:a17:902:ec8b:b0:1b3:d8ac:8db3 with SMTP id
 x11-20020a170902ec8b00b001b3d8ac8db3mr12344607plg.6.1690192242411; 
 Mon, 24 Jul 2023 02:50:42 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:50:42 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:35 +0800
Message-Id: <20230724094354.90817-29-zhengqi.arch@bytedance.com>
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Mon, 24 Jul 2023 10:28:27 +0000
Subject: [Cluster-devel] [PATCH v2 28/47] bcache: dynamically allocate the
 md-bcache shrinker
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the md-bcache shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct cache_set.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/md/bcache/bcache.h |  2 +-
 drivers/md/bcache/btree.c  | 27 ++++++++++++++++-----------
 drivers/md/bcache/sysfs.c  |  3 ++-
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/md/bcache/bcache.h b/drivers/md/bcache/bcache.h
index 5a79bb3c272f..c622bc50f81b 100644
--- a/drivers/md/bcache/bcache.h
+++ b/drivers/md/bcache/bcache.h
@@ -541,7 +541,7 @@ struct cache_set {
 	struct bio_set		bio_split;
 
 	/* For the btree cache */
-	struct shrinker		shrink;
+	struct shrinker		*shrink;
 
 	/* For the btree cache and anything allocation related */
 	struct mutex		bucket_lock;
diff --git a/drivers/md/bcache/btree.c b/drivers/md/bcache/btree.c
index fd121a61f17c..c176c7fc77d9 100644
--- a/drivers/md/bcache/btree.c
+++ b/drivers/md/bcache/btree.c
@@ -667,7 +667,7 @@ static int mca_reap(struct btree *b, unsigned int min_order, bool flush)
 static unsigned long bch_mca_scan(struct shrinker *shrink,
 				  struct shrink_control *sc)
 {
-	struct cache_set *c = container_of(shrink, struct cache_set, shrink);
+	struct cache_set *c = shrink->private_data;
 	struct btree *b, *t;
 	unsigned long i, nr = sc->nr_to_scan;
 	unsigned long freed = 0;
@@ -734,7 +734,7 @@ static unsigned long bch_mca_scan(struct shrinker *shrink,
 static unsigned long bch_mca_count(struct shrinker *shrink,
 				   struct shrink_control *sc)
 {
-	struct cache_set *c = container_of(shrink, struct cache_set, shrink);
+	struct cache_set *c = shrink->private_data;
 
 	if (c->shrinker_disabled)
 		return 0;
@@ -752,8 +752,8 @@ void bch_btree_cache_free(struct cache_set *c)
 
 	closure_init_stack(&cl);
 
-	if (c->shrink.list.next)
-		unregister_shrinker(&c->shrink);
+	if (c->shrink)
+		shrinker_unregister(c->shrink);
 
 	mutex_lock(&c->bucket_lock);
 
@@ -828,14 +828,19 @@ int bch_btree_cache_alloc(struct cache_set *c)
 		c->verify_data = NULL;
 #endif
 
-	c->shrink.count_objects = bch_mca_count;
-	c->shrink.scan_objects = bch_mca_scan;
-	c->shrink.seeks = 4;
-	c->shrink.batch = c->btree_pages * 2;
+	c->shrink = shrinker_alloc(0, "md-bcache:%pU", c->set_uuid);
+	if (!c->shrink) {
+		pr_warn("bcache: %s: could not allocate shrinker\n", __func__);
+		return -ENOMEM;
+	}
+
+	c->shrink->count_objects = bch_mca_count;
+	c->shrink->scan_objects = bch_mca_scan;
+	c->shrink->seeks = 4;
+	c->shrink->batch = c->btree_pages * 2;
+	c->shrink->private_data = c;
 
-	if (register_shrinker(&c->shrink, "md-bcache:%pU", c->set_uuid))
-		pr_warn("bcache: %s: could not register shrinker\n",
-				__func__);
+	shrinker_register(c->shrink);
 
 	return 0;
 }
diff --git a/drivers/md/bcache/sysfs.c b/drivers/md/bcache/sysfs.c
index 0e2c1880f60b..45d8af755de6 100644
--- a/drivers/md/bcache/sysfs.c
+++ b/drivers/md/bcache/sysfs.c
@@ -866,7 +866,8 @@ STORE(__bch_cache_set)
 
 		sc.gfp_mask = GFP_KERNEL;
 		sc.nr_to_scan = strtoul_or_return(buf);
-		c->shrink.scan_objects(&c->shrink, &sc);
+		if (c->shrink)
+			c->shrink->scan_objects(c->shrink, &sc);
 	}
 
 	sysfs_strtoul_clamp(congested_read_threshold_us,
-- 
2.30.2

