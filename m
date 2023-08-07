Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 594E4772038
	for <lists+cluster-devel@lfdr.de>; Mon,  7 Aug 2023 13:14:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691406863;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UfFRGPeE2ZLo8C9JFiR7wWvNCzDdrS4O9P7I0rwozQE=;
	b=QuOt4EzLx78vxTs19yCAHvIJWkUG3nbmBtTmrzhDwL/pRAZA0ZTnpL3PJsTertVX1JRswW
	vRWv9jVXs1Cu5ecAIa5ksdOHmnweU5Kz2UxHImD5moRu2XFH97B/0h3GMHkWndpptjfVPo
	wrDj5jbYznvteJVSDbc/V/vjG4ffk4s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-691-UoqU8aJdMTyd5MF6S4FyJw-1; Mon, 07 Aug 2023 07:14:19 -0400
X-MC-Unique: UoqU8aJdMTyd5MF6S4FyJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5C71185A78B;
	Mon,  7 Aug 2023 11:14:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98FE6C15BBA;
	Mon,  7 Aug 2023 11:14:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 783EB1946589;
	Mon,  7 Aug 2023 11:14:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2F75F1946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  7 Aug 2023 11:14:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EB5DE2026D68; Mon,  7 Aug 2023 11:14:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3B1F2026D4B
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 11:14:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C44F0185A7A4
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 11:14:16 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-tt03sk89PEiu99QaAfHs0w-1; Mon, 07 Aug 2023 07:14:15 -0400
X-MC-Unique: tt03sk89PEiu99QaAfHs0w-1
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-6874a386ec7so817608b3a.1
 for <cluster-devel@redhat.com>; Mon, 07 Aug 2023 04:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691406854; x=1692011654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UfFRGPeE2ZLo8C9JFiR7wWvNCzDdrS4O9P7I0rwozQE=;
 b=TZm38pJResMp8dustxKzXUssyHLZnqhdBwpVRbSU8Sgs9khcasUVmUizBGayoKmsI5
 FqfguoehVV4x8aC7uvqRZQtXnam/OpeF74vIozUW3hlnDeuNHTLw/IdoW8LjnlqjOnvX
 Fa+6oMvT+FTgfppfAJIqpP0sAd/RzNvdYEaUabFu1n6mhre8032g5esRgqkYqqfvgbjQ
 9cwoD/XP56a0SfMAb2a7uH28CZQFYdj+vTnU1pBBWluMZ6ab42xCW3x2425NuN7xJFvw
 cjYTHXXSHq8ecSA6X/y0UM6dVw3PhJ5q5eZ2J01YS+ZOqtjVBNBqzFTaWDTYjNru3iqa
 /mEg==
X-Gm-Message-State: ABy/qLbTm53dHWmjBnpeqFg7/6W2RDVJDE6Ic1KbI626rNLGvLmhNg4l
 okT1WKVO/eaTJHPvqK6Mgaj1SQ==
X-Google-Smtp-Source: APBJJlFKEuLPG6rXvjHQ/xhYlF3mJA1G+qTCCufEjWmHi053bG2lxjJC7FtDeUsrnl72QxE+YEuj1g==
X-Received: by 2002:a17:902:d503:b0:1bb:83ec:832 with SMTP id
 b3-20020a170902d50300b001bb83ec0832mr32625772plg.2.1691406854020; 
 Mon, 07 Aug 2023 04:14:14 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:14:13 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 simon.horman@corigine.com, dlemoal@kernel.org
Date: Mon,  7 Aug 2023 19:09:08 +0800
Message-Id: <20230807110936.21819-21-zhengqi.arch@bytedance.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH v4 20/48] mm: thp: dynamically allocate the
 thp-related shrinkers
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Use new APIs to dynamically allocate the thp-zero and thp-deferred_split
shrinkers.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/huge_memory.c | 69 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 24 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 947001a7cd42..5d0c7a0b651c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -65,7 +65,11 @@ unsigned long transparent_hugepage_flags __read_mostly =
 	(1<<TRANSPARENT_HUGEPAGE_DEFRAG_KHUGEPAGED_FLAG)|
 	(1<<TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG);
 
-static struct shrinker deferred_split_shrinker;
+static struct shrinker *deferred_split_shrinker;
+static unsigned long deferred_split_count(struct shrinker *shrink,
+					  struct shrink_control *sc);
+static unsigned long deferred_split_scan(struct shrinker *shrink,
+					 struct shrink_control *sc);
 
 static atomic_t huge_zero_refcount;
 struct page *huge_zero_page __read_mostly;
@@ -229,11 +233,7 @@ static unsigned long shrink_huge_zero_page_scan(struct shrinker *shrink,
 	return 0;
 }
 
-static struct shrinker huge_zero_page_shrinker = {
-	.count_objects = shrink_huge_zero_page_count,
-	.scan_objects = shrink_huge_zero_page_scan,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *huge_zero_page_shrinker;
 
 #ifdef CONFIG_SYSFS
 static ssize_t enabled_show(struct kobject *kobj,
@@ -454,6 +454,40 @@ static inline void hugepage_exit_sysfs(struct kobject *hugepage_kobj)
 }
 #endif /* CONFIG_SYSFS */
 
+static int __init thp_shrinker_init(void)
+{
+	huge_zero_page_shrinker = shrinker_alloc(0, "thp-zero");
+	if (!huge_zero_page_shrinker)
+		return -ENOMEM;
+
+	deferred_split_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE |
+						 SHRINKER_MEMCG_AWARE |
+						 SHRINKER_NONSLAB,
+						 "thp-deferred_split");
+	if (!deferred_split_shrinker) {
+		shrinker_free(huge_zero_page_shrinker);
+		return -ENOMEM;
+	}
+
+	huge_zero_page_shrinker->count_objects = shrink_huge_zero_page_count;
+	huge_zero_page_shrinker->scan_objects = shrink_huge_zero_page_scan;
+	huge_zero_page_shrinker->seeks = DEFAULT_SEEKS;
+	shrinker_register(huge_zero_page_shrinker);
+
+	deferred_split_shrinker->count_objects = deferred_split_count;
+	deferred_split_shrinker->scan_objects = deferred_split_scan;
+	deferred_split_shrinker->seeks = DEFAULT_SEEKS;
+	shrinker_register(deferred_split_shrinker);
+
+	return 0;
+}
+
+static void __init thp_shrinker_exit(void)
+{
+	shrinker_free(huge_zero_page_shrinker);
+	shrinker_free(deferred_split_shrinker);
+}
+
 static int __init hugepage_init(void)
 {
 	int err;
@@ -482,12 +516,9 @@ static int __init hugepage_init(void)
 	if (err)
 		goto err_slab;
 
-	err = register_shrinker(&huge_zero_page_shrinker, "thp-zero");
-	if (err)
-		goto err_hzp_shrinker;
-	err = register_shrinker(&deferred_split_shrinker, "thp-deferred_split");
+	err = thp_shrinker_init();
 	if (err)
-		goto err_split_shrinker;
+		goto err_shrinker;
 
 	/*
 	 * By default disable transparent hugepages on smaller systems,
@@ -505,10 +536,8 @@ static int __init hugepage_init(void)
 
 	return 0;
 err_khugepaged:
-	unregister_shrinker(&deferred_split_shrinker);
-err_split_shrinker:
-	unregister_shrinker(&huge_zero_page_shrinker);
-err_hzp_shrinker:
+	thp_shrinker_exit();
+err_shrinker:
 	khugepaged_destroy();
 err_slab:
 	hugepage_exit_sysfs(hugepage_kobj);
@@ -2834,7 +2863,7 @@ void deferred_split_folio(struct folio *folio)
 #ifdef CONFIG_MEMCG
 		if (memcg)
 			set_shrinker_bit(memcg, folio_nid(folio),
-					 deferred_split_shrinker.id);
+					 deferred_split_shrinker->id);
 #endif
 	}
 	spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
@@ -2908,14 +2937,6 @@ static unsigned long deferred_split_scan(struct shrinker *shrink,
 	return split;
 }
 
-static struct shrinker deferred_split_shrinker = {
-	.count_objects = deferred_split_count,
-	.scan_objects = deferred_split_scan,
-	.seeks = DEFAULT_SEEKS,
-	.flags = SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE |
-		 SHRINKER_NONSLAB,
-};
-
 #ifdef CONFIG_DEBUG_FS
 static void split_huge_pages_all(void)
 {
-- 
2.30.2

