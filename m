Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A3479A6DA
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Sep 2023 11:46:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694425590;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7LECipjpjMsTeT5UMm7L2TEbO8WqkVi8hOfJfny30YM=;
	b=HgBD4gSTSp6vHyjJmGzCwMLALT6hOjiWfJeEjE4r9kWgkoHIli/J8iq2rcy65YFuBxAnag
	MEWBj4NLru0nGCXlLPGaa3aIlTrpNAd6OsxqqT/Tf1hQAAwpkK/EJzqtMB2CF4K0rfrXx/
	OSDl9N68ocoxykHiKJJV7/WV1CNXkJM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-7RX037grOeu-wZ3yjOD5Mg-1; Mon, 11 Sep 2023 05:46:28 -0400
X-MC-Unique: 7RX037grOeu-wZ3yjOD5Mg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3E573C19367;
	Mon, 11 Sep 2023 09:46:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEF1C40C6EA8;
	Mon, 11 Sep 2023 09:46:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6FEEF19465A2;
	Mon, 11 Sep 2023 09:46:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C8DAD1946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 11 Sep 2023 09:46:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 879C42904; Mon, 11 Sep 2023 09:46:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FBB6422DF
 for <cluster-devel@redhat.com>; Mon, 11 Sep 2023 09:46:23 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5ED50816522
 for <cluster-devel@redhat.com>; Mon, 11 Sep 2023 09:46:23 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-yH6sf7G6NUebGPyYUFQ-sg-1; Mon, 11 Sep 2023 05:46:21 -0400
X-MC-Unique: yH6sf7G6NUebGPyYUFQ-sg-1
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-68cb5278e3fso875197b3a.1
 for <cluster-devel@redhat.com>; Mon, 11 Sep 2023 02:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694425580; x=1695030380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7LECipjpjMsTeT5UMm7L2TEbO8WqkVi8hOfJfny30YM=;
 b=Iko33iJyOhdu5v/+Lw2v3m6kan6iAmzjafNeAOgekvfQKElmQgV/e0y+3unojHOs6s
 i9uaCAnkyPRau7kZp/8itmYAWDbSAUNICqM2gGPSWNxYbkiTKJhdNWFZDAp7ye+daG7q
 HXnwAjpvgCOItkXNFLu+TbykF3FAv4fZjHUmn86z2EsGh0Mgs69FILUNeOoIMWNljcE2
 /SIaW+4YG3gLt6qQpGXjP9RkjobyJc4x+vmg0kyF0e7dIVsjkbwNnm2YdAOh3aSlk10p
 UkGaYKdOC9aFdlYl+R8SpehPoUxCul5ZJP1IoFfmJyKCztZJl0USEsJ60HxQFNofvLTd
 kHnQ==
X-Gm-Message-State: AOJu0Yyo6thMySUM5BbPSvRQ07NPDvtY716AYTGVnjqg/AwhG1xQUBk3
 SMxlH1nCJ0wo7lYU1AqpgXY3Vw==
X-Google-Smtp-Source: AGHT+IEIDNe7dp+17p/1jwosBLUpyZnN7S3R/YUG8mMRO57r91hEdK6UAfUP/CCgqA5OUGqlmZWKGg==
X-Received: by 2002:a05:6a20:a10c:b0:13f:9233:58d with SMTP id
 q12-20020a056a20a10c00b0013f9233058dmr11702677pzk.2.1694425580529; 
 Mon, 11 Sep 2023 02:46:20 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 az7-20020a170902a58700b001bdc2fdcf7esm5988188plb.129.2023.09.11.02.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 02:46:20 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 11 Sep 2023 17:44:07 +0800
Message-Id: <20230911094444.68966-9-zhengqi.arch@bytedance.com>
In-Reply-To: <20230911094444.68966-1-zhengqi.arch@bytedance.com>
References: <20230911094444.68966-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v6 08/45] gfs2: dynamically allocate the
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
 fs/gfs2/glock.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 9cbf8d98489a..35967f8e3038 100644
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
@@ -2463,13 +2459,18 @@ int __init gfs2_glock_init(void)
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
+
+	shrinker_register(glock_shrinker);
+
 	for (i = 0; i < GLOCK_WAIT_TABLE_SIZE; i++)
 		init_waitqueue_head(glock_wait_table + i);
 
@@ -2478,7 +2479,7 @@ int __init gfs2_glock_init(void)
 
 void gfs2_glock_exit(void)
 {
-	unregister_shrinker(&glock_shrinker);
+	shrinker_free(glock_shrinker);
 	rhashtable_destroy(&gl_hash_table);
 	destroy_workqueue(glock_workqueue);
 }
-- 
2.30.2

