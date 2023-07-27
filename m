Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EC1764A4B
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 10:08:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690445323;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BqN9tp9prAKwSL/xaaZwvgP8yGlZqKh7lkz65rMIkwI=;
	b=HeORw40BXexCGRKVc3Zmp90nU54HEppGd3tgfIpD8JxTaat87ZR2AiHfs3xSKtEXwcbKth
	ZtCfI7g7EQ7gPBJdt2vXH0tkOoGjQAmbFHcBx5qwkbiSKSlNMx8b1cbmmPJv74KlhFlsBc
	Nia1JnqxUT4d55iCKYn44GIZDuuuZ1Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-687-07xQQFTEMwOGqw2zq80rOA-1; Thu, 27 Jul 2023 04:08:38 -0400
X-MC-Unique: 07xQQFTEMwOGqw2zq80rOA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB2D11044596;
	Thu, 27 Jul 2023 08:08:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9CAB71454145;
	Thu, 27 Jul 2023 08:08:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 40B1E1946A78;
	Thu, 27 Jul 2023 08:08:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8E4C01946A6C for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 08:06:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7E52D40C206F; Thu, 27 Jul 2023 08:06:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 771FA40C2063
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 08:06:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 429B485A58A
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 08:06:53 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-NepOMCEINgKU0vIxwtz_3Q-3; Thu, 27 Jul 2023 04:06:50 -0400
X-MC-Unique: NepOMCEINgKU0vIxwtz_3Q-3
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6748a616e17so182392b3a.1
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 01:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445210; x=1691050010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BqN9tp9prAKwSL/xaaZwvgP8yGlZqKh7lkz65rMIkwI=;
 b=UO+cq2Xvyxp5tnOAdFDYDPWkgm7j6KGHJrlKXrEvOy8H463JRa2MZnH5PJ+Ht59aHo
 XAKHZmeIvztvGqm8Duk1X/eBZMN0Cy5xLo18msY8PiX93P48qdBkVUzBjSZdvYuTfuk5
 59cF82o4xMQJuzO1W0UL1tGTfYMYPLdtr2vdFLC1cx+kODvAW2C1uKFDm6NKnmQ7iE8O
 NY7DSSm+nAZ1etAudhUsJ93prMucLp7c0NcAav8MHSAbPAFgrz6f/DUMV62fXonaYkEE
 aaV9WH5tiFOuI1oyCcXjxx8mx8khweKjuPq1PgwWr0jOppicMX5pGlLwJWLdjev+a83m
 WxYg==
X-Gm-Message-State: ABy/qLa5/mypFOKSO/sHgiimAptKkNB535ajCEL47gTXXwNGBcfy9zL2
 nqKITkHGVoKWVjKoj9acE12BoA==
X-Google-Smtp-Source: APBJJlGqyHUGzcwYP72gZn72jBkXTN2mSwLe5z3KDdW3R9YyUcC+gdVHx8KhimUXzhfrGyXx8SlIVg==
X-Received: by 2002:a05:6a20:918e:b0:11a:dbb3:703b with SMTP id
 v14-20020a056a20918e00b0011adbb3703bmr5539836pzd.6.1690445210111; 
 Thu, 27 Jul 2023 01:06:50 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:06:48 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Thu, 27 Jul 2023 16:04:18 +0800
Message-Id: <20230727080502.77895-6-zhengqi.arch@bytedance.com>
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
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH v3 05/49] mm: shrinker: add infrastructure
 for dynamically allocating shrinker
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

Currently, the shrinker instances can be divided into the following three
types:

a) global shrinker instance statically defined in the kernel, such as
   workingset_shadow_shrinker.

b) global shrinker instance statically defined in the kernel modules, such
   as mmu_shrinker in x86.

c) shrinker instance embedded in other structures.

For case a, the memory of shrinker instance is never freed. For case b,
the memory of shrinker instance will be freed after synchronize_rcu() when
the module is unloaded. For case c, the memory of shrinker instance will
be freed along with the structure it is embedded in.

In preparation for implementing lockless slab shrink, we need to
dynamically allocate those shrinker instances in case c, then the memory
can be dynamically freed alone by calling kfree_rcu().

So this commit adds the following new APIs for dynamically allocating
shrinker, and add a private_data field to struct shrinker to record and
get the original embedded structure.

1. shrinker_alloc()

Used to allocate shrinker instance itself and related memory, it will
return a pointer to the shrinker instance on success and NULL on failure.

2. shrinker_register()

Used to register the shrinker instance, which is same as the current
register_shrinker_prepared().

3. shrinker_free()

Used to unregister (if needed) and free the shrinker instance.

In order to simplify shrinker-related APIs and make shrinker more
independent of other kernel mechanisms, subsequent submissions will use
the above API to convert all shrinkers (including case a and b) to
dynamically allocated, and then remove all existing APIs.

This will also have another advantage mentioned by Dave Chinner:

```
The other advantage of this is that it will break all the existing
out of tree code and third party modules using the old API and will
no longer work with a kernel using lockless slab shrinkers. They
need to break (both at the source and binary levels) to stop bad
things from happening due to using uncoverted shrinkers in the new
setup.
```

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/shrinker.h |   7 +++
 mm/internal.h            |  11 +++++
 mm/shrinker.c            | 101 +++++++++++++++++++++++++++++++++++++++
 mm/shrinker_debug.c      |  17 ++++++-
 4 files changed, 134 insertions(+), 2 deletions(-)

diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index 8dc15aa37410..cc23ff0aee20 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -70,6 +70,8 @@ struct shrinker {
 	int seeks;	/* seeks to recreate an obj */
 	unsigned flags;
 
+	void *private_data;
+
 	/* These are for internal use */
 	struct list_head list;
 #ifdef CONFIG_MEMCG
@@ -95,6 +97,11 @@ struct shrinker {
  * non-MEMCG_AWARE shrinker should not have this flag set.
  */
 #define SHRINKER_NONSLAB	(1 << 3)
+#define SHRINKER_ALLOCATED	(1 << 4)
+
+struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
+void shrinker_register(struct shrinker *shrinker);
+void shrinker_free(struct shrinker *shrinker);
 
 extern int __printf(2, 3) prealloc_shrinker(struct shrinker *shrinker,
 					    const char *fmt, ...);
diff --git a/mm/internal.h b/mm/internal.h
index 8b82038dcc6a..38434175df86 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1144,6 +1144,9 @@ unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
 
 #ifdef CONFIG_SHRINKER_DEBUG
 extern int shrinker_debugfs_add(struct shrinker *shrinker);
+extern int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
+				       const char *fmt, va_list ap);
+extern void shrinker_debugfs_name_free(struct shrinker *shrinker);
 extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
 					      int *debugfs_id);
 extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
@@ -1153,6 +1156,14 @@ static inline int shrinker_debugfs_add(struct shrinker *shrinker)
 {
 	return 0;
 }
+static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
+					      const char *fmt, va_list ap)
+{
+	return 0;
+}
+static inline void shrinker_debugfs_name_free(struct shrinker *shrinker)
+{
+}
 static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
 						     int *debugfs_id)
 {
diff --git a/mm/shrinker.c b/mm/shrinker.c
index 043c87ccfab4..43a375f954f3 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -550,6 +550,107 @@ unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
 	return freed;
 }
 
+struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...)
+{
+	struct shrinker *shrinker;
+	unsigned int size;
+	va_list ap;
+	int err;
+
+	shrinker = kzalloc(sizeof(struct shrinker), GFP_KERNEL);
+	if (!shrinker)
+		return NULL;
+
+	va_start(ap, fmt);
+	err = shrinker_debugfs_name_alloc(shrinker, fmt, ap);
+	va_end(ap);
+	if (err)
+		goto err_name;
+
+	shrinker->flags = flags | SHRINKER_ALLOCATED;
+
+	if (flags & SHRINKER_MEMCG_AWARE) {
+		err = prealloc_memcg_shrinker(shrinker);
+		if (err == -ENOSYS)
+			shrinker->flags &= ~SHRINKER_MEMCG_AWARE;
+		else if (err == 0)
+			goto done;
+		else
+			goto err_flags;
+	}
+
+	/*
+	 * The nr_deferred is available on per memcg level for memcg aware
+	 * shrinkers, so only allocate nr_deferred in the following cases:
+	 *  - non memcg aware shrinkers
+	 *  - !CONFIG_MEMCG
+	 *  - memcg is disabled by kernel command line
+	 */
+	size = sizeof(*shrinker->nr_deferred);
+	if (flags & SHRINKER_NUMA_AWARE)
+		size *= nr_node_ids;
+
+	shrinker->nr_deferred = kzalloc(size, GFP_KERNEL);
+	if (!shrinker->nr_deferred)
+		goto err_flags;
+
+done:
+	return shrinker;
+
+err_flags:
+	shrinker_debugfs_name_free(shrinker);
+err_name:
+	kfree(shrinker);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(shrinker_alloc);
+
+void shrinker_register(struct shrinker *shrinker)
+{
+	if (unlikely(!(shrinker->flags & SHRINKER_ALLOCATED))) {
+		pr_warn("Must use shrinker_alloc() to dynamically allocate the shrinker");
+		return;
+	}
+
+	down_write(&shrinker_rwsem);
+	list_add_tail(&shrinker->list, &shrinker_list);
+	shrinker->flags |= SHRINKER_REGISTERED;
+	shrinker_debugfs_add(shrinker);
+	up_write(&shrinker_rwsem);
+}
+EXPORT_SYMBOL_GPL(shrinker_register);
+
+void shrinker_free(struct shrinker *shrinker)
+{
+	struct dentry *debugfs_entry = NULL;
+	int debugfs_id;
+
+	if (!shrinker)
+		return;
+
+	down_write(&shrinker_rwsem);
+	if (shrinker->flags & SHRINKER_REGISTERED) {
+		list_del(&shrinker->list);
+		debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
+		shrinker->flags &= ~SHRINKER_REGISTERED;
+	} else {
+		shrinker_debugfs_name_free(shrinker);
+	}
+
+	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
+		unregister_memcg_shrinker(shrinker);
+	up_write(&shrinker_rwsem);
+
+	if (debugfs_entry)
+		shrinker_debugfs_remove(debugfs_entry, debugfs_id);
+
+	kfree(shrinker->nr_deferred);
+	shrinker->nr_deferred = NULL;
+
+	kfree(shrinker);
+}
+EXPORT_SYMBOL_GPL(shrinker_free);
+
 /*
  * Add a shrinker callback to be called from the vm.
  */
diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
index f1becfd45853..506257585408 100644
--- a/mm/shrinker_debug.c
+++ b/mm/shrinker_debug.c
@@ -191,6 +191,20 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
 	return 0;
 }
 
+int shrinker_debugfs_name_alloc(struct shrinker *shrinker, const char *fmt,
+				va_list ap)
+{
+	shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
+
+	return shrinker->name ? 0 : -ENOMEM;
+}
+
+void shrinker_debugfs_name_free(struct shrinker *shrinker)
+{
+	kfree_const(shrinker->name);
+	shrinker->name = NULL;
+}
+
 int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
 {
 	struct dentry *entry;
@@ -239,8 +253,7 @@ struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
 
 	lockdep_assert_held(&shrinker_rwsem);
 
-	kfree_const(shrinker->name);
-	shrinker->name = NULL;
+	shrinker_debugfs_name_free(shrinker);
 
 	*debugfs_id = entry ? shrinker->debugfs_id : -1;
 	shrinker->debugfs_entry = NULL;
-- 
2.30.2

