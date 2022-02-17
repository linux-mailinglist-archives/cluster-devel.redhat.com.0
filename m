Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 662154BA9FB
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Feb 2022 20:40:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645126801;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BXbN/3dC8cOX8mRVjzRR/yJ3qSUjX5XnBL8vRRD7P1Y=;
	b=EUit1ri60m0EzJ3SG2aHyNGqDoNJq7eg6r3OIEZLOTp2x7Sezs+td7zurs6arT6XsHwLPc
	OS6/aS6v4ZU827YBs1UUxZQnv3y1kHSjNRT741tChsQH37w3cuAtkSeJ/Q5EAyjulQpS5m
	jBWqOsWACK6cDx+0MeDcGOE78dSOytA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-cJIBXkEqPCuXe_d7D0I20g-1; Thu, 17 Feb 2022 14:39:57 -0500
X-MC-Unique: cJIBXkEqPCuXe_d7D0I20g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEE1A1006AA6;
	Thu, 17 Feb 2022 19:39:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE49645C87;
	Thu, 17 Feb 2022 19:39:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 988284BB7C;
	Thu, 17 Feb 2022 19:39:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21HJdn8i004281 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 17 Feb 2022 14:39:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2E4B0100EA05; Thu, 17 Feb 2022 19:39:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D25F71009962;
	Thu, 17 Feb 2022 19:39:48 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Feb 2022 14:39:17 -0500
Message-Id: <20220217193917.3292717-7-aahringo@redhat.com>
In-Reply-To: <20220217193917.3292717-1-aahringo@redhat.com>
References: <20220217193917.3292717-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 6/6] fs: dlm: move global to
	static inits
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

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

