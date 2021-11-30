Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E606463ED9
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Nov 2021 20:50:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638301806;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a3A8hkj/WYuzMQEfkC7UnPaEfTFJgewK4AU9la3AUSE=;
	b=iA4oNI1WcNWCnBTzKPb3hHNdBdFRp/u3xYw9urXztyWyDn0SY3zgtza31uTQY7cJzUvsbZ
	nn/zHfq2Su8CfzPz8tiKeItVgZUMg63T23rmqSmvBG3nni22hTluW9CcDhn6OMTLSrGd1K
	aU+qVhx9t7O7pMEWbwOItx4KVFo9AA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-kREoca54PqCm6LPU4cMwyQ-1; Tue, 30 Nov 2021 14:50:03 -0500
X-MC-Unique: kREoca54PqCm6LPU4cMwyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89029760C0;
	Tue, 30 Nov 2021 19:50:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B1A4100E125;
	Tue, 30 Nov 2021 19:50:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD8801809C89;
	Tue, 30 Nov 2021 19:49:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AUJlina022141 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Nov 2021 14:47:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DA3AE45D67; Tue, 30 Nov 2021 19:47:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DC1567842;
	Tue, 30 Nov 2021 19:47:44 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 30 Nov 2021 14:47:18 -0500
Message-Id: <20211130194720.666400-5-aahringo@redhat.com>
In-Reply-To: <20211130194720.666400-1-aahringo@redhat.com>
References: <20211130194720.666400-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 5/7] fs: dlm: memory cache for
	midcomms hotpath
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will introduce a kmem cache for allocating message handles
which are needed for midcomms layer to take track of lowcomms messages.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/memory.c   | 31 ++++++++++++++++++++++++++-----
 fs/dlm/memory.h   |  2 ++
 fs/dlm/midcomms.c | 21 +++++++++++++++------
 fs/dlm/midcomms.h |  1 +
 4 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/fs/dlm/memory.c b/fs/dlm/memory.c
index 5918f4d39586..8996c6453ad5 100644
--- a/fs/dlm/memory.c
+++ b/fs/dlm/memory.c
@@ -10,32 +10,44 @@
 ******************************************************************************/
 
 #include "dlm_internal.h"
+#include "midcomms.h"
 #include "config.h"
 #include "memory.h"
 
+static struct kmem_cache *mhandle_cache;
 static struct kmem_cache *lkb_cache;
 static struct kmem_cache *rsb_cache;
 
 
 int __init dlm_memory_init(void)
 {
+	mhandle_cache = dlm_midcomms_cache_create();
+	if (!mhandle_cache)
+		goto out;
+
 	lkb_cache = kmem_cache_create("dlm_lkb", sizeof(struct dlm_lkb),
 				__alignof__(struct dlm_lkb), 0, NULL);
 	if (!lkb_cache)
-		return -ENOMEM;
+		goto lkb;
 
 	rsb_cache = kmem_cache_create("dlm_rsb", sizeof(struct dlm_rsb),
 				__alignof__(struct dlm_rsb), 0, NULL);
-	if (!rsb_cache) {
-		kmem_cache_destroy(lkb_cache);
-		return -ENOMEM;
-	}
+	if (!rsb_cache)
+		goto rsb;
 
 	return 0;
+
+rsb:
+	kmem_cache_destroy(lkb_cache);
+lkb:
+	kmem_cache_destroy(mhandle_cache);
+out:
+	return -ENOMEM;
 }
 
 void dlm_memory_exit(void)
 {
+	kmem_cache_destroy(mhandle_cache);
 	kmem_cache_destroy(lkb_cache);
 	kmem_cache_destroy(rsb_cache);
 }
@@ -89,3 +101,12 @@ void dlm_free_lkb(struct dlm_lkb *lkb)
 	kmem_cache_free(lkb_cache, lkb);
 }
 
+struct dlm_mhandle *dlm_allocate_mhandle(void)
+{
+	return kmem_cache_alloc(mhandle_cache, GFP_NOFS);
+}
+
+void dlm_free_mhandle(struct dlm_mhandle *mhandle)
+{
+	kmem_cache_free(mhandle_cache, mhandle);
+}
diff --git a/fs/dlm/memory.h b/fs/dlm/memory.h
index 4f218ea4b187..c4d46be778a2 100644
--- a/fs/dlm/memory.h
+++ b/fs/dlm/memory.h
@@ -20,6 +20,8 @@ struct dlm_lkb *dlm_allocate_lkb(struct dlm_ls *ls);
 void dlm_free_lkb(struct dlm_lkb *l);
 char *dlm_allocate_lvb(struct dlm_ls *ls);
 void dlm_free_lvb(char *l);
+struct dlm_mhandle *dlm_allocate_mhandle(void);
+void dlm_free_mhandle(struct dlm_mhandle *mhandle);
 
 #endif		/* __MEMORY_DOT_H__ */
 
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 74b4308b912c..3635e42b0669 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -137,6 +137,7 @@
 #include "dlm_internal.h"
 #include "lowcomms.h"
 #include "config.h"
+#include "memory.h"
 #include "lock.h"
 #include "util.h"
 #include "midcomms.h"
@@ -220,6 +221,12 @@ DEFINE_STATIC_SRCU(nodes_srcu);
  */
 static DEFINE_MUTEX(close_lock);
 
+struct kmem_cache *dlm_midcomms_cache_create(void)
+{
+	return kmem_cache_create("dlm_mhandle", sizeof(struct dlm_mhandle),
+				 0, 0, NULL);
+}
+
 static inline const char *dlm_state_str(int state)
 {
 	switch (state) {
@@ -279,7 +286,7 @@ static void dlm_mhandle_release(struct rcu_head *rcu)
 	struct dlm_mhandle *mh = container_of(rcu, struct dlm_mhandle, rcu);
 
 	dlm_lowcomms_put_msg(mh->msg);
-	kfree(mh);
+	dlm_free_mhandle(mh);
 }
 
 static void dlm_mhandle_delete(struct midcomms_node *node,
@@ -1073,10 +1080,12 @@ struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 	/* this is a bug, however we going on and hope it will be resolved */
 	WARN_ON(test_bit(DLM_NODE_FLAG_STOP_TX, &node->flags));
 
-	mh = kzalloc(sizeof(*mh), GFP_NOFS);
+	mh = dlm_allocate_mhandle();
 	if (!mh)
 		goto err;
 
+	mh->committed = false;
+	mh->ack_rcv = NULL;
 	mh->idx = idx;
 	mh->node = node;
 
@@ -1085,7 +1094,7 @@ struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 		msg = dlm_lowcomms_new_msg(nodeid, len, allocation, ppc,
 					   NULL, NULL);
 		if (!msg) {
-			kfree(mh);
+			dlm_free_mhandle(mh);
 			goto err;
 		}
 
@@ -1094,13 +1103,13 @@ struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 		msg = dlm_midcomms_get_msg_3_2(mh, nodeid, len, allocation,
 					       ppc);
 		if (!msg) {
-			kfree(mh);
+			dlm_free_mhandle(mh);
 			goto err;
 		}
 
 		break;
 	default:
-		kfree(mh);
+		dlm_free_mhandle(mh);
 		WARN_ON(1);
 		goto err;
 	}
@@ -1136,7 +1145,7 @@ void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh)
 		dlm_lowcomms_commit_msg(mh->msg);
 		dlm_lowcomms_put_msg(mh->msg);
 		/* mh is not part of rcu list in this case */
-		kfree(mh);
+		dlm_free_mhandle(mh);
 		break;
 	case DLM_VERSION_3_2:
 		dlm_midcomms_commit_msg_3_2(mh);
diff --git a/fs/dlm/midcomms.h b/fs/dlm/midcomms.h
index bc63cf73aa87..82bcd9661922 100644
--- a/fs/dlm/midcomms.h
+++ b/fs/dlm/midcomms.h
@@ -30,6 +30,7 @@ int dlm_midcomms_send_queue_cnt(struct midcomms_node *node);
 uint32_t dlm_midcomms_version(struct midcomms_node *node);
 int dlm_midcomms_rawmsg_send(struct midcomms_node *node, void *buf,
 			     int buflen);
+struct kmem_cache *dlm_midcomms_cache_create(void);
 
 #endif				/* __MIDCOMMS_DOT_H__ */
 
-- 
2.27.0

