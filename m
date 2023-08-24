Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9BD7865FD
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Aug 2023 05:45:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692848716;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B+a4BSDzIy5bpWMN+1YxNCRarQu4di8i3ZJob6D5Dd8=;
	b=BKqnURHLHJmHMMQgaUMJ71j+J3WMkzu/2KYlBdraoCnitF5i59B/PIje489U3W1WxYAc92
	a+CVYIVSjYkLP+OB0qziuNrvqxypp/YgZPq+1bhSufwzcHmqbq7wC/ZFPLxhx1lpIlRz96
	oYpuVypF9klH3zgvU9bA27y2VheE7Q0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-1PzXQRjXNVW5QECsZnA5Tw-1; Wed, 23 Aug 2023 23:45:12 -0400
X-MC-Unique: 1PzXQRjXNVW5QECsZnA5Tw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29ACD8564F0;
	Thu, 24 Aug 2023 03:45:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9752440D283A;
	Thu, 24 Aug 2023 03:45:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4DBE5194658F;
	Thu, 24 Aug 2023 03:45:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E234B1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 03:45:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C0CA2140E962; Thu, 24 Aug 2023 03:45:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9733140E950
 for <cluster-devel@redhat.com>; Thu, 24 Aug 2023 03:45:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CEE01C068F7
 for <cluster-devel@redhat.com>; Thu, 24 Aug 2023 03:45:01 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-OJyjj0ziPICkcwXjV-yFgA-1; Wed, 23 Aug 2023 23:44:59 -0400
X-MC-Unique: OJyjj0ziPICkcwXjV-yFgA-1
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-68a32506e90so1062185b3a.1
 for <cluster-devel@redhat.com>; Wed, 23 Aug 2023 20:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692848698; x=1693453498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+a4BSDzIy5bpWMN+1YxNCRarQu4di8i3ZJob6D5Dd8=;
 b=jtHrektyjpTtdFRuX6ZrTPgt0+EHl44xtjPkga5aJzMlkPQmp9c5iQOLzO9V+ArLBc
 b89Bwbd1aAkxia7A+QON8FmWhHd+VfKGtrYTcJ1SPexBJHhDvo+Yrjc/49pY/3eVe+zd
 v2pTDx9L79u5VlUI0xGkpiVBsO3nY7J2VZC1CxGaYkpDf3qLDxXAbtfzNyJ2PqxNgI57
 u5aJN037CPAn4ml6GvObwazGRHT5wd0iLmUQess7M9ZAjYCuoBWCi3eNUKQ6/tsnbPot
 hhOOvDquDBKM7UFyp7Pf6n4GBO4RVkdvWjCMnq00O7SnCwfxgU7j39qYdYwIWeQhnhZ7
 yg3g==
X-Gm-Message-State: AOJu0Yz+rqjJE4eD6Eqhrf1U6TpTbwQT9wR1SsBDyiMzqkyiBWXx9l4A
 TYG5Yg/0iMYWzQcMLlAddvAZ9w==
X-Google-Smtp-Source: AGHT+IEW17bvrtndnX5u4ZO2vRUQ/qIdWra1p6sHngI8edmpBrVuX9kD1hLdFF/eUVbriCdR0TGMjA==
X-Received: by 2002:a05:6a20:3941:b0:137:4fd0:e2e6 with SMTP id
 r1-20020a056a20394100b001374fd0e2e6mr17388012pzg.6.1692848698719; 
 Wed, 23 Aug 2023 20:44:58 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a63b246000000b005579f12a238sm10533157pgo.86.2023.08.23.20.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 20:44:58 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Thu, 24 Aug 2023 11:42:27 +0800
Message-Id: <20230824034304.37411-9-zhengqi.arch@bytedance.com>
In-Reply-To: <20230824034304.37411-1-zhengqi.arch@bytedance.com>
References: <20230824034304.37411-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH v5 08/45] gfs2: dynamically allocate the
 gfs2-glock shrinker
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
Cc: linux-kernel@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 cluster-devel@redhat.com, linux-mm@kvack.org,
 Muchun Song <songmuchun@bytedance.com>, linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Use new APIs to dynamically allocate the gfs2-glock shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
CC: Bob Peterson <rpeterso@redhat.com>
CC: Andreas Gruenbacher <agruenba@redhat.com>
CC: cluster-devel@redhat.com
---
 fs/gfs2/glock.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 675bfec77706..fd3eba1856a5 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -2039,11 +2039,7 @@ static unsigned long gfs2_glock_shrink_count(struct shrinker *shrink,
 	return vfs_pressure_ratio(atomic_read(&lru_count));
 }
 
-static struct shrinker glock_shrinker = {
-	.seeks = DEFAULT_SEEKS,
-	.count_objects = gfs2_glock_shrink_count,
-	.scan_objects = gfs2_glock_shrink_scan,
-};
+static struct shrinker *glock_shrinker;
 
 /**
  * glock_hash_walk - Call a function for glock in a hash bucket
@@ -2463,13 +2459,19 @@ int __init gfs2_glock_init(void)
 		return -ENOMEM;
 	}
 
-	ret = register_shrinker(&glock_shrinker, "gfs2-glock");
-	if (ret) {
+	glock_shrinker = shrinker_alloc(0, "gfs2-glock");
+	if (!glock_shrinker) {
 		destroy_workqueue(glock_workqueue);
 		rhashtable_destroy(&gl_hash_table);
-		return ret;
+		return -ENOMEM;
 	}
 
+	glock_shrinker->count_objects = gfs2_glock_shrink_count;
+	glock_shrinker->scan_objects = gfs2_glock_shrink_scan;
+	glock_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(glock_shrinker);
+
 	for (i = 0; i < GLOCK_WAIT_TABLE_SIZE; i++)
 		init_waitqueue_head(glock_wait_table + i);
 
@@ -2478,7 +2480,7 @@ int __init gfs2_glock_init(void)
 
 void gfs2_glock_exit(void)
 {
-	unregister_shrinker(&glock_shrinker);
+	shrinker_free(glock_shrinker);
 	rhashtable_destroy(&gl_hash_table);
 	destroy_workqueue(glock_workqueue);
 }
-- 
2.30.2

