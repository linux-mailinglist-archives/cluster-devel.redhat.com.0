Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9584B463ECD
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Nov 2021 20:48:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638301679;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BiMJfQaLk3Mnu5FrF3EXJTd9iMGZ4w1efs3mqxMxkTw=;
	b=fMFn3JhEv/bH44lc8Qxi9H6TUHHyZpTrv+wOqVX3H7PY/7W3lhW0sls+ZFFiMMwOtxKt1L
	85Tkxbp3scgtL6jrDT3Q0dA67PpsBeaStg+y84WhZxTf7S88LWU6BoiQrDJnQEkA+M9WB1
	xjBazd5PhYNkxDHVNgMo3jk0VNW+xqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-9T8SyVVeN7aakGcDfF3h-w-1; Tue, 30 Nov 2021 14:47:56 -0500
X-MC-Unique: 9T8SyVVeN7aakGcDfF3h-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B9585F9EB;
	Tue, 30 Nov 2021 19:47:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EB7745D6C;
	Tue, 30 Nov 2021 19:47:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A58C1809C89;
	Tue, 30 Nov 2021 19:47:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AUJljGX022154 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Nov 2021 14:47:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5E16445D67; Tue, 30 Nov 2021 19:47:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 01EBB67842;
	Tue, 30 Nov 2021 19:47:44 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 30 Nov 2021 14:47:19 -0500
Message-Id: <20211130194720.666400-6-aahringo@redhat.com>
In-Reply-To: <20211130194720.666400-1-aahringo@redhat.com>
References: <20211130194720.666400-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 6/7] fs: dlm: memory cache for
	writequeue_entry
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch introduces a kmem cache for writequeue entry. A writequeue
entry get quite a lot allocated if dlm transmit messages.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 26 +++++++++++++++++++++-----
 fs/dlm/lowcomms.h |  1 +
 fs/dlm/memory.c   | 21 ++++++++++++++++++++-
 fs/dlm/memory.h   |  2 ++
 4 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 4919faf79709..300f44c5d132 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -58,6 +58,7 @@
 #include "dlm_internal.h"
 #include "lowcomms.h"
 #include "midcomms.h"
+#include "memory.h"
 #include "config.h"
 
 #define NEEDED_RMEM (4*1024*1024)
@@ -190,6 +191,19 @@ static const struct dlm_proto_ops *dlm_proto_ops;
 static void process_recv_sockets(struct work_struct *work);
 static void process_send_sockets(struct work_struct *work);
 
+static void writequeue_entry_ctor(void *data)
+{
+	struct writequeue_entry *entry = data;
+
+	INIT_LIST_HEAD(&entry->msgs);
+}
+
+struct kmem_cache *dlm_lowcomms_writequeue_cache_create(void)
+{
+	return kmem_cache_create("dlm_writequeue", sizeof(struct writequeue_entry),
+				 0, 0, writequeue_entry_ctor);
+}
+
 /* need to held writequeue_lock */
 static struct writequeue_entry *con_next_wq(struct connection *con)
 {
@@ -728,7 +742,7 @@ static void dlm_page_release(struct kref *kref)
 						  ref);
 
 	__free_page(e->page);
-	kfree(e);
+	dlm_free_writequeue(e);
 }
 
 static void dlm_msg_release(struct kref *kref)
@@ -1177,21 +1191,23 @@ static struct writequeue_entry *new_writequeue_entry(struct connection *con)
 {
 	struct writequeue_entry *entry;
 
-	entry = kzalloc(sizeof(*entry), GFP_ATOMIC);
+	entry = dlm_allocate_writequeue();
 	if (!entry)
 		return NULL;
 
 	entry->page = alloc_page(GFP_ATOMIC | __GFP_ZERO);
 	if (!entry->page) {
-		kfree(entry);
+		dlm_free_writequeue(entry);
 		return NULL;
 	}
 
+	entry->offset = 0;
+	entry->len = 0;
+	entry->end = 0;
+	entry->dirty = false;
 	entry->con = con;
 	entry->users = 1;
 	kref_init(&entry->ref);
-	INIT_LIST_HEAD(&entry->msgs);
-
 	return entry;
 }
 
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 8108ea24ec30..6c8f4ce457f0 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -47,6 +47,7 @@ int dlm_lowcomms_connect_node(int nodeid);
 int dlm_lowcomms_nodes_set_mark(int nodeid, unsigned int mark);
 int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len);
 void dlm_midcomms_receive_done(int nodeid);
+struct kmem_cache *dlm_lowcomms_writequeue_cache_create(void);
 
 #endif				/* __LOWCOMMS_DOT_H__ */
 
diff --git a/fs/dlm/memory.c b/fs/dlm/memory.c
index 8996c6453ad5..94af986e83c6 100644
--- a/fs/dlm/memory.c
+++ b/fs/dlm/memory.c
@@ -11,9 +11,11 @@
 
 #include "dlm_internal.h"
 #include "midcomms.h"
+#include "lowcomms.h"
 #include "config.h"
 #include "memory.h"
 
+static struct kmem_cache *writequeue_cache;
 static struct kmem_cache *mhandle_cache;
 static struct kmem_cache *lkb_cache;
 static struct kmem_cache *rsb_cache;
@@ -21,9 +23,13 @@ static struct kmem_cache *rsb_cache;
 
 int __init dlm_memory_init(void)
 {
+	writequeue_cache = dlm_lowcomms_writequeue_cache_create();
+	if (!writequeue_cache)
+		goto out;
+
 	mhandle_cache = dlm_midcomms_cache_create();
 	if (!mhandle_cache)
-		goto out;
+		goto mhandle;
 
 	lkb_cache = kmem_cache_create("dlm_lkb", sizeof(struct dlm_lkb),
 				__alignof__(struct dlm_lkb), 0, NULL);
@@ -41,12 +47,15 @@ int __init dlm_memory_init(void)
 	kmem_cache_destroy(lkb_cache);
 lkb:
 	kmem_cache_destroy(mhandle_cache);
+mhandle:
+	kmem_cache_destroy(writequeue_cache);
 out:
 	return -ENOMEM;
 }
 
 void dlm_memory_exit(void)
 {
+	kmem_cache_destroy(writequeue_cache);
 	kmem_cache_destroy(mhandle_cache);
 	kmem_cache_destroy(lkb_cache);
 	kmem_cache_destroy(rsb_cache);
@@ -110,3 +119,13 @@ void dlm_free_mhandle(struct dlm_mhandle *mhandle)
 {
 	kmem_cache_free(mhandle_cache, mhandle);
 }
+
+struct writequeue_entry *dlm_allocate_writequeue(void)
+{
+	return kmem_cache_alloc(writequeue_cache, GFP_ATOMIC);
+}
+
+void dlm_free_writequeue(struct writequeue_entry *writequeue)
+{
+	kmem_cache_free(writequeue_cache, writequeue);
+}
diff --git a/fs/dlm/memory.h b/fs/dlm/memory.h
index c4d46be778a2..854269eacd44 100644
--- a/fs/dlm/memory.h
+++ b/fs/dlm/memory.h
@@ -22,6 +22,8 @@ char *dlm_allocate_lvb(struct dlm_ls *ls);
 void dlm_free_lvb(char *l);
 struct dlm_mhandle *dlm_allocate_mhandle(void);
 void dlm_free_mhandle(struct dlm_mhandle *mhandle);
+struct writequeue_entry *dlm_allocate_writequeue(void);
+void dlm_free_writequeue(struct writequeue_entry *writequeue);
 
 #endif		/* __MEMORY_DOT_H__ */
 
-- 
2.27.0

