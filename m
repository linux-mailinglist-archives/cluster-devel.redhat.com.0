Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE4F4F1A0E
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102843;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BXbN/3dC8cOX8mRVjzRR/yJ3qSUjX5XnBL8vRRD7P1Y=;
	b=V9K6MGmJgV+giPvHvcRhcZZw15TihSwae5+fr7uSquBvszImr6h+R3CB+haxz45GH5To5G
	lh4Q6nvEByQQ93ApTrxbaXQOQAJrDtCm5ruUrPOhQnhJGrFvshShGTC2v9P5Fj6JFPpCJ+
	0w56bg+e0F+yhWKlErlCtlYn+9US7MY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-XphSREAjMtCu_XVu8DlsMg-1; Mon, 04 Apr 2022 16:07:20 -0400
X-MC-Unique: XphSREAjMtCu_XVu8DlsMg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F0823810782;
	Mon,  4 Apr 2022 20:07:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86612145BF01;
	Mon,  4 Apr 2022 20:07:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 83EF6193F6ED;
	Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 20AD51940374 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1B4DF7C2A; Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F23FE7C28;
 Mon,  4 Apr 2022 20:06:53 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:36 -0400
Message-Id: <20220404200646.3170301-10-aahringo@redhat.com>
In-Reply-To: <20220404200646.3170301-1-aahringo@redhat.com>
References: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 09/19] fs: dlm: move global
 to static inits
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Instead of init global module at module loading time we can move the
initialization of those global variables at memory initialization of the
module loader.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index ff439d780cb1..16241fe6ac3c 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -13,11 +13,11 @@
 #include "dlm_internal.h"
 #include "lockspace.h"
 
-static spinlock_t ops_lock;
-static struct list_head send_list;
-static struct list_head recv_list;
-static wait_queue_head_t send_wq;
-static wait_queue_head_t recv_wq;
+static DEFINE_SPINLOCK(ops_lock);
+static LIST_HEAD(send_list);
+static LIST_HEAD(recv_list);
+static DECLARE_WAIT_QUEUE_HEAD(send_wq);
+static DECLARE_WAIT_QUEUE_HEAD(recv_wq);
 
 struct plock_async_data {
 	void *fl;
@@ -480,12 +480,6 @@ int dlm_plock_init(void)
 {
 	int rv;
 
-	spin_lock_init(&ops_lock);
-	INIT_LIST_HEAD(&send_list);
-	INIT_LIST_HEAD(&recv_list);
-	init_waitqueue_head(&send_wq);
-	init_waitqueue_head(&recv_wq);
-
 	rv = misc_register(&plock_dev_misc);
 	if (rv)
 		log_print("dlm_plock_init: misc_register failed %d", rv);
-- 
2.31.1

