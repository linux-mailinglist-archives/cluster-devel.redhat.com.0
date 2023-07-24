Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B980475F32E
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jul 2023 12:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690194534;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XqecqrzcRvoIqXqcLBZrKzE7eAqHgJsLkgEnUCNLJ88=;
	b=CcGslV7IaAHBBNl/3r3IklGt327KwzCaP1BJIcCbC+quMobwZvd99bKazndls8NxjhLFQX
	hGfq0Ubd6w+HcakaE3yqsu2Ny1j5Dmm9RR9KVfdHbCbjsFvv4wZwt6nx/tGTjsrkuBUU9p
	LJ4QfhHgFJkY5oBJo7Zo92pdWRWYYdw=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-p8EOfVngN-OLlUDP6pCkIw-1; Mon, 24 Jul 2023 06:28:50 -0400
X-MC-Unique: p8EOfVngN-OLlUDP6pCkIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B28161C06EFA;
	Mon, 24 Jul 2023 10:28:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A60D5F7832;
	Mon, 24 Jul 2023 10:28:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3D7F6193774A;
	Mon, 24 Jul 2023 10:28:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C0A481946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Jul 2023 09:53:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A7E0DC2C857; Mon, 24 Jul 2023 09:53:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FC3BC2C7D3
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 09:53:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DC818028B2
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 09:53:56 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-lB-iRVQ0Ny-VzKafKVClpQ-2; Mon, 24 Jul 2023 05:53:54 -0400
X-MC-Unique: lB-iRVQ0Ny-VzKafKVClpQ-2
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1bba9539a23so652405ad.1
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 02:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690192433; x=1690797233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XqecqrzcRvoIqXqcLBZrKzE7eAqHgJsLkgEnUCNLJ88=;
 b=CExH0oJTouiLL2VgRUQspQYYvxj1Bow2VKVg35HG9OoJ/+aabsI2+1LXEYYnZ/G1qf
 EoNRfPb8tNFhIB0v1BwfKRW/6g/b0IjwZdfxHwMGYgQu3hCEBci7YtyCDhaBcU0skCpv
 y0ZuIgNZMv8siZ5+jLjbCOlMg1dHQn/jxwAe007UxIzfCM0Cm+WdWOSYH6H5VcTy73Wr
 ifn/SAQjO1pkA4uJL+MLGaA9HXJ9/7QTubN5KgctopNRGg98T1R+HnIkHqgcZR8I3OvO
 2Bz/+30sY4/790pbLwTvOF8DFxHFP7I2bEVGfgoeWEXUQHoteUeVpfB62yVbbHqQx8Sf
 vbOQ==
X-Gm-Message-State: ABy/qLZ2H4qFmwqsuLnvH4QtgtSppQPxvdOqtgSgLTEPBiJ3nxMtBnvl
 zi5yrw7t2CAkod9mykgZUvmY+w==
X-Google-Smtp-Source: APBJJlHr2sAgfQgo2DnUpmnId7qPkjYXCImwyHrh9U8oeEhs0YzxIvU3vAaX/E5/QdNFkGMDi+4Opg==
X-Received: by 2002:a17:903:41c9:b0:1b8:17e8:547e with SMTP id
 u9-20020a17090341c900b001b817e8547emr12210253ple.1.1690192433168; 
 Mon, 24 Jul 2023 02:53:53 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:53:52 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:51 +0800
Message-Id: <20230724094354.90817-45-zhengqi.arch@bytedance.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Mon, 24 Jul 2023 10:28:27 +0000
Subject: [Cluster-devel] [PATCH v2 44/47] mm: shrinker: make global slab
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The shrinker_rwsem is a global read-write lock in shrinkers subsystem,
which protects most operations such as slab shrink, registration and
unregistration of shrinkers, etc. This can easily cause problems in the
following cases.

1) When the memory pressure is high and there are many filesystems
   mounted or unmounted at the same time, slab shrink will be affected
   (down_read_trylock() failed).

   Such as the real workload mentioned by Kirill Tkhai:

   ```
   One of the real workloads from my experience is start
   of an overcommitted node containing many starting
   containers after node crash (or many resuming containers
   after reboot for kernel update). In these cases memory
   pressure is huge, and the node goes round in long reclaim.
   ```

2) If a shrinker is blocked (such as the case mentioned
   in [1]) and a writer comes in (such as mount a fs),
   then this writer will be blocked and cause all
   subsequent shrinker-related operations to be blocked.

Even if there is no competitor when shrinking slab, there may still be a
problem. The down_read_trylock() may become a perf hotspot with frequent
calls to shrink_slab(). Because of the poor multicore scalability of
atomic operations, this can lead to a significant drop in IPC
(instructions per cycle).

We used to implement the lockless slab shrink with SRCU [2], but then
kernel test robot reported -88.8% regression in
stress-ng.ramfs.ops_per_sec test case [3], so we reverted it [4].

This commit uses the refcount+RCU method [5] proposed by Dave Chinner
to re-implement the lockless global slab shrink. The memcg slab shrink is
handled in the subsequent patch.

For now, all shrinker instances are converted to dynamically allocated and
will be freed by kfree_rcu(). So we can use rcu_read_{lock,unlock}() to
ensure that the shrinker instance is valid.

And the shrinker instance will not be run again after unregistration. So
the structure that records the pointer of shrinker instance can be safely
freed without waiting for the RCU read-side critical section.

In this way, while we implement the lockless slab shrink, we don't need to
be blocked in unregister_shrinker().

The following are the test results:

stress-ng --timeout 60 --times --verify --metrics-brief --ramfs 9 &

1) Before applying this patchset:

setting to a 60 second run per stressor
dispatching hogs: 9 ramfs
stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
                          (secs)    (secs)    (secs)   (real time) (usr+sys time)
ramfs            735238     60.00     12.37    363.70     12253.05        1955.08
for a 60.01s run time:
   1440.27s available CPU time
     12.36s user time   (  0.86%)
    363.70s system time ( 25.25%)
    376.06s total time  ( 26.11%)
load average: 10.79 4.47 1.69
passed: 9: ramfs (9)
failed: 0
skipped: 0
successful run completed in 60.01s (1 min, 0.01 secs)

2) After applying this patchset:

setting to a 60 second run per stressor
dispatching hogs: 9 ramfs
stressor       bogo ops real time  usr time  sys time   bogo ops/s     bogo ops/s
                          (secs)    (secs)    (secs)   (real time) (usr+sys time)
ramfs            746677     60.00     12.22    367.75     12443.70        1965.13
for a 60.01s run time:
   1440.26s available CPU time
     12.21s user time   (  0.85%)
    367.75s system time ( 25.53%)
    379.96s total time  ( 26.38%)
load average: 8.37 2.48 0.86
passed: 9: ramfs (9)
failed: 0
skipped: 0
successful run completed in 60.01s (1 min, 0.01 secs)

We can see that the ops/s has hardly changed.

[1]. https://lore.kernel.org/lkml/20191129214541.3110-1-ptikhomirov@virtuozzo.com/
[2]. https://lore.kernel.org/lkml/20230313112819.38938-1-zhengqi.arch@bytedance.com/
[3]. https://lore.kernel.org/lkml/202305230837.db2c233f-yujie.liu@intel.com/
[4]. https://lore.kernel.org/all/20230609081518.3039120-1-qi.zheng@linux.dev/
[5]. https://lore.kernel.org/lkml/ZIJhou1d55d4H1s0@dread.disaster.area/

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/shrinker.h | 19 +++++++---
 mm/shrinker.c            | 75 ++++++++++++++++++++++++++--------------
 mm/shrinker_debug.c      | 52 +++++++++++++++++++++-------
 3 files changed, 104 insertions(+), 42 deletions(-)

diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index 36977a70bebb..335da93cccee 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -4,6 +4,7 @@
 
 #include <linux/atomic.h>
 #include <linux/types.h>
+#include <linux/refcount.h>
 
 #define SHRINKER_UNIT_BITS	BITS_PER_LONG
 
@@ -86,6 +87,10 @@ struct shrinker {
 	long batch;	/* reclaim batch size, 0 = default */
 	int seeks;	/* seeks to recreate an obj */
 	unsigned flags;
+	bool registered;
+
+	refcount_t refcount;
+	struct rcu_head rcu;
 
 	void *private_data;
 
@@ -106,14 +111,13 @@ struct shrinker {
 #define DEFAULT_SEEKS 2 /* A good number if you don't know better. */
 
 /* Flags */
-#define SHRINKER_REGISTERED	(1 << 0)
-#define SHRINKER_NUMA_AWARE	(1 << 1)
-#define SHRINKER_MEMCG_AWARE	(1 << 2)
+#define SHRINKER_NUMA_AWARE	(1 << 0)
+#define SHRINKER_MEMCG_AWARE	(1 << 1)
 /*
  * It just makes sense when the shrinker is also MEMCG_AWARE for now,
  * non-MEMCG_AWARE shrinker should not have this flag set.
  */
-#define SHRINKER_NONSLAB	(1 << 3)
+#define SHRINKER_NONSLAB	(1 << 2)
 
 unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
 			  int priority);
@@ -122,6 +126,13 @@ void shrinker_free_non_registered(struct shrinker *shrinker);
 void shrinker_register(struct shrinker *shrinker);
 void shrinker_unregister(struct shrinker *shrinker);
 
+static inline bool shrinker_try_get(struct shrinker *shrinker)
+{
+	return READ_ONCE(shrinker->registered) &&
+	       refcount_inc_not_zero(&shrinker->refcount);
+}
+void shrinker_put(struct shrinker *shrinker);
+
 #ifdef CONFIG_SHRINKER_DEBUG
 extern int shrinker_debugfs_add(struct shrinker *shrinker);
 extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
diff --git a/mm/shrinker.c b/mm/shrinker.c
index 8a1fe844f1a4..8e3334749552 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -2,10 +2,13 @@
 #include <linux/memcontrol.h>
 #include <linux/rwsem.h>
 #include <linux/shrinker.h>
+#include <linux/rculist.h>
+#include <linux/spinlock.h>
 #include <trace/events/vmscan.h>
 
 LIST_HEAD(shrinker_list);
 DECLARE_RWSEM(shrinker_rwsem);
+DEFINE_SPINLOCK(shrinker_lock);
 
 #ifdef CONFIG_MEMCG
 static int shrinker_nr_max;
@@ -450,6 +453,18 @@ static unsigned long do_shrink_slab(struct shrink_control *shrinkctl,
 	return freed;
 }
 
+void shrinker_put(struct shrinker *shrinker)
+{
+	if (refcount_dec_and_test(&shrinker->refcount)) {
+		spin_lock(&shrinker_lock);
+		list_del_rcu(&shrinker->list);
+		spin_unlock(&shrinker_lock);
+
+		kfree(shrinker->nr_deferred);
+		kfree_rcu(shrinker, rcu);
+	}
+}
+
 #ifdef CONFIG_MEMCG
 static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
 			struct mem_cgroup *memcg, int priority)
@@ -483,7 +498,8 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
 			int shrinker_id = calc_shrinker_id(index, offset);
 
 			shrinker = idr_find(&shrinker_idr, shrinker_id);
-			if (unlikely(!shrinker || !(shrinker->flags & SHRINKER_REGISTERED))) {
+			if (unlikely(!shrinker ||
+				     !READ_ONCE(shrinker->registered))) {
 				if (!shrinker)
 					clear_bit(offset, unit->map);
 				continue;
@@ -575,33 +591,42 @@ unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
 	if (!mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
 		return shrink_slab_memcg(gfp_mask, nid, memcg, priority);
 
-	if (!down_read_trylock(&shrinker_rwsem))
-		goto out;
-
-	list_for_each_entry(shrinker, &shrinker_list, list) {
+	rcu_read_lock();
+	list_for_each_entry_rcu(shrinker, &shrinker_list, list) {
 		struct shrink_control sc = {
 			.gfp_mask = gfp_mask,
 			.nid = nid,
 			.memcg = memcg,
 		};
 
+		if (!shrinker_try_get(shrinker))
+			continue;
+
+		/*
+		 * We can safely unlock the RCU lock here since we already
+		 * hold the refcount of the shrinker.
+		 */
+		rcu_read_unlock();
+
 		ret = do_shrink_slab(&sc, shrinker, priority);
 		if (ret == SHRINK_EMPTY)
 			ret = 0;
 		freed += ret;
+
 		/*
-		 * Bail out if someone want to register a new shrinker to
-		 * prevent the registration from being stalled for long periods
-		 * by parallel ongoing shrinking.
+		 * This shrinker may be deleted from shrinker_list and freed in
+		 * the shrinker_put() below, but this shrinker is still used for
+		 * the next traversal. So it is necessary to hold the RCU lock
+		 * first to prevent this shrinker from being freed, which also
+		 * ensures that the next shrinker that is traversed will not be
+		 * freed (even if it is deleted from shrinker_list at the same
+		 * time).
 		 */
-		if (rwsem_is_contended(&shrinker_rwsem)) {
-			freed = freed ? : 1;
-			break;
-		}
+		rcu_read_lock();
+		shrinker_put(shrinker);
 	}
 
-	up_read(&shrinker_rwsem);
-out:
+	rcu_read_unlock();
 	cond_resched();
 	return freed;
 }
@@ -686,11 +711,14 @@ EXPORT_SYMBOL(shrinker_free_non_registered);
 
 void shrinker_register(struct shrinker *shrinker)
 {
-	down_write(&shrinker_rwsem);
-	list_add_tail(&shrinker->list, &shrinker_list);
-	shrinker->flags |= SHRINKER_REGISTERED;
+	refcount_set(&shrinker->refcount, 1);
+
+	spin_lock(&shrinker_lock);
+	list_add_tail_rcu(&shrinker->list, &shrinker_list);
+	spin_unlock(&shrinker_lock);
+
 	shrinker_debugfs_add(shrinker);
-	up_write(&shrinker_rwsem);
+	WRITE_ONCE(shrinker->registered, true);
 }
 EXPORT_SYMBOL(shrinker_register);
 
@@ -699,12 +727,12 @@ void shrinker_unregister(struct shrinker *shrinker)
 	struct dentry *debugfs_entry;
 	int debugfs_id;
 
-	if (!shrinker || !(shrinker->flags & SHRINKER_REGISTERED))
+	if (!shrinker || !READ_ONCE(shrinker->registered))
 		return;
 
+	WRITE_ONCE(shrinker->registered, false);
+
 	down_write(&shrinker_rwsem);
-	list_del(&shrinker->list);
-	shrinker->flags &= ~SHRINKER_REGISTERED;
 	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
 		unregister_memcg_shrinker(shrinker);
 	debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
@@ -712,9 +740,6 @@ void shrinker_unregister(struct shrinker *shrinker)
 
 	shrinker_debugfs_remove(debugfs_entry, debugfs_id);
 
-	kfree(shrinker->nr_deferred);
-	shrinker->nr_deferred = NULL;
-
-	kfree(shrinker);
+	shrinker_put(shrinker);
 }
 EXPORT_SYMBOL(shrinker_unregister);
diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
index f1becfd45853..c5573066adbf 100644
--- a/mm/shrinker_debug.c
+++ b/mm/shrinker_debug.c
@@ -5,6 +5,7 @@
 #include <linux/seq_file.h>
 #include <linux/shrinker.h>
 #include <linux/memcontrol.h>
+#include <linux/rculist.h>
 
 /* defined in vmscan.c */
 extern struct rw_semaphore shrinker_rwsem;
@@ -161,17 +162,21 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
 {
 	struct dentry *entry;
 	char buf[128];
-	int id;
-
-	lockdep_assert_held(&shrinker_rwsem);
+	int id, ret = 0;
 
 	/* debugfs isn't initialized yet, add debugfs entries later. */
 	if (!shrinker_debugfs_root)
 		return 0;
 
+	down_write(&shrinker_rwsem);
+	if (shrinker->debugfs_entry)
+		goto fail;
+
 	id = ida_alloc(&shrinker_debugfs_ida, GFP_KERNEL);
-	if (id < 0)
-		return id;
+	if (id < 0) {
+		ret = id;
+		goto fail;
+	}
 	shrinker->debugfs_id = id;
 
 	snprintf(buf, sizeof(buf), "%s-%d", shrinker->name, id);
@@ -180,7 +185,8 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
 	entry = debugfs_create_dir(buf, shrinker_debugfs_root);
 	if (IS_ERR(entry)) {
 		ida_free(&shrinker_debugfs_ida, id);
-		return PTR_ERR(entry);
+		ret = PTR_ERR(entry);
+		goto fail;
 	}
 	shrinker->debugfs_entry = entry;
 
@@ -188,7 +194,10 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
 			    &shrinker_debugfs_count_fops);
 	debugfs_create_file("scan", 0220, entry, shrinker,
 			    &shrinker_debugfs_scan_fops);
-	return 0;
+
+fail:
+	up_write(&shrinker_rwsem);
+	return ret;
 }
 
 int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
@@ -243,6 +252,11 @@ struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
 	shrinker->name = NULL;
 
 	*debugfs_id = entry ? shrinker->debugfs_id : -1;
+	/*
+	 * Ensure that shrinker->registered has been set to false before
+	 * shrinker->debugfs_entry is set to NULL.
+	 */
+	smp_wmb();
 	shrinker->debugfs_entry = NULL;
 
 	return entry;
@@ -266,14 +280,26 @@ static int __init shrinker_debugfs_init(void)
 	shrinker_debugfs_root = dentry;
 
 	/* Create debugfs entries for shrinkers registered at boot */
-	down_write(&shrinker_rwsem);
-	list_for_each_entry(shrinker, &shrinker_list, list)
+	rcu_read_lock();
+	list_for_each_entry_rcu(shrinker, &shrinker_list, list) {
+		if (!shrinker_try_get(shrinker))
+			continue;
+		rcu_read_unlock();
+
 		if (!shrinker->debugfs_entry) {
-			ret = shrinker_debugfs_add(shrinker);
-			if (ret)
-				break;
+			/* Paired with smp_wmb() in shrinker_debugfs_detach() */
+			smp_rmb();
+			if (READ_ONCE(shrinker->registered))
+				ret = shrinker_debugfs_add(shrinker);
 		}
-	up_write(&shrinker_rwsem);
+
+		rcu_read_lock();
+		shrinker_put(shrinker);
+
+		if (ret)
+			break;
+	}
+	rcu_read_unlock();
 
 	return ret;
 }
-- 
2.30.2

