Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 136805A6C95
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Aug 2022 20:52:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661885544;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mQAXiKAFpuIZSEXKeEw4+AKOakRB1iBihnpWjE79d+c=;
	b=MA2/dYWZ/7H+eVOkirpcyGV4afzwXtqWEPPudeOtZH/g6nQFtycAcJKAyve6orsCASnp5R
	Ti5xVwvBN7MRYWEAEKNqxx/vR3hYSZbYmcvzrRYzbsiNIBCib7lVmuGQmDdD/IY/0A8+1o
	O4RhAe03lr2X5hEcOeUZAn9xcYWjSSo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-MxcJFQdOOsWb0tuKu5K0WA-1; Tue, 30 Aug 2022 14:52:19 -0400
X-MC-Unique: MxcJFQdOOsWb0tuKu5K0WA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E220101E989;
	Tue, 30 Aug 2022 18:52:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE0081410DD7;
	Tue, 30 Aug 2022 18:52:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 24B661946A48;
	Tue, 30 Aug 2022 18:52:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 05F9C1946A40 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 30 Aug 2022 18:52:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DB880141511A; Tue, 30 Aug 2022 18:52:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.2.16.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5AB21415117
 for <cluster-devel@redhat.com>; Tue, 30 Aug 2022 18:52:14 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 30 Aug 2022 13:52:13 -0500
Message-Id: <20220830185213.77259-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Cluster-devel] [PATCH] gfs2: Register fs after creating workqueues
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Before this patch, the gfs2 file system was registered prior to creating
the three workqueues. In some cases this allowed dlm to send recovery
work to a workqueue that did not yet exist because gfs2 was still
initializing.

This patch changes the order of gfs2's initialization routine so it only
registers the file system after the work queues are created.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/main.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
index 14ae9de76277..afcb32854f14 100644
--- a/fs/gfs2/main.c
+++ b/fs/gfs2/main.c
@@ -151,14 +151,6 @@ static int __init init_gfs2_fs(void)
 	if (error)
 		goto fail_shrinker;
 
-	error = register_filesystem(&gfs2_fs_type);
-	if (error)
-		goto fail_fs1;
-
-	error = register_filesystem(&gfs2meta_fs_type);
-	if (error)
-		goto fail_fs2;
-
 	error = -ENOMEM;
 	gfs_recovery_wq = alloc_workqueue("gfs_recovery",
 					  WQ_MEM_RECLAIM | WQ_FREEZABLE, 0);
@@ -180,11 +172,23 @@ static int __init init_gfs2_fs(void)
 		goto fail_mempool;
 
 	gfs2_register_debugfs();
+	error = register_filesystem(&gfs2_fs_type);
+	if (error)
+		goto fail_fs1;
+
+	error = register_filesystem(&gfs2meta_fs_type);
+	if (error)
+		goto fail_fs2;
+
 
 	pr_info("GFS2 installed\n");
 
 	return 0;
 
+fail_fs2:
+	unregister_filesystem(&gfs2_fs_type);
+fail_fs1:
+	mempool_destroy(gfs2_page_pool);
 fail_mempool:
 	destroy_workqueue(gfs2_freeze_wq);
 fail_wq3:
@@ -192,10 +196,6 @@ static int __init init_gfs2_fs(void)
 fail_wq2:
 	destroy_workqueue(gfs_recovery_wq);
 fail_wq1:
-	unregister_filesystem(&gfs2meta_fs_type);
-fail_fs2:
-	unregister_filesystem(&gfs2_fs_type);
-fail_fs1:
 	unregister_shrinker(&gfs2_qd_shrinker);
 fail_shrinker:
 	kmem_cache_destroy(gfs2_trans_cachep);
-- 
2.37.2

