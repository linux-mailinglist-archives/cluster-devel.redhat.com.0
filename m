Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E233463ED8
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Nov 2021 20:50:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638301805;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IIwEEMAiKuOlRqIn6xH752mIBq5CQV1FV00AT6sLM+8=;
	b=e7P+5rtNREQescHjsVzh+3TRsIG9yr5j6Ddj+f1zcSAcEHQFKBYKdOpAI9t4jy7L67MvmJ
	HkTCoLNgnkxQBfWRnDk9iQvI7ZKrUw8bRkYIa6rn08bjcaPm50y027jJaYBeACei6N8GRv
	Etefo995KXsT54hxRIkog4VNU3oAOtg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190--6tLRj7vPwKwPGphQSOnbQ-1; Tue, 30 Nov 2021 14:50:03 -0500
X-MC-Unique: -6tLRj7vPwKwPGphQSOnbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48F8D760C4;
	Tue, 30 Nov 2021 19:50:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38CA245D6C;
	Tue, 30 Nov 2021 19:50:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC11E4BB7C;
	Tue, 30 Nov 2021 19:50:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AUJlj2a022161 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Nov 2021 14:47:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D631C45D6C; Tue, 30 Nov 2021 19:47:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79BBE67842;
	Tue, 30 Nov 2021 19:47:45 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 30 Nov 2021 14:47:20 -0500
Message-Id: <20211130194720.666400-7-aahringo@redhat.com>
In-Reply-To: <20211130194720.666400-1-aahringo@redhat.com>
References: <20211130194720.666400-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 7/7] fs: dlm: memory cache for
	lowcomms hotpath
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

This patch introduces a kmem cache for dlm_msg handles which are used
always if dlm sends a message out. Even if their are covered by midcomms
layer or not.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 13 ++++++++++---
 fs/dlm/lowcomms.h |  1 +
 fs/dlm/memory.c   | 18 ++++++++++++++++++
 fs/dlm/memory.h   |  2 ++
 4 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 300f44c5d132..23a1ff690725 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -204,6 +204,11 @@ struct kmem_cache *dlm_lowcomms_writequeue_cache_create(void)
 				 0, 0, writequeue_entry_ctor);
 }
 
+struct kmem_cache *dlm_lowcomms_msg_cache_create(void)
+{
+	return kmem_cache_create("dlm_msg", sizeof(struct dlm_msg), 0, 0, NULL);
+}
+
 /* need to held writequeue_lock */
 static struct writequeue_entry *con_next_wq(struct connection *con)
 {
@@ -750,7 +755,7 @@ static void dlm_msg_release(struct kref *kref)
 	struct dlm_msg *msg = container_of(kref, struct dlm_msg, ref);
 
 	kref_put(&msg->entry->ref, dlm_page_release);
-	kfree(msg);
+	dlm_free_msg(msg);
 }
 
 static void free_entry(struct writequeue_entry *e)
@@ -1259,7 +1264,7 @@ static struct dlm_msg *dlm_lowcomms_new_msg_con(struct connection *con, int len,
 	struct writequeue_entry *e;
 	struct dlm_msg *msg;
 
-	msg = kzalloc(sizeof(*msg), allocation);
+	msg = dlm_allocate_msg(allocation);
 	if (!msg)
 		return NULL;
 
@@ -1267,10 +1272,12 @@ static struct dlm_msg *dlm_lowcomms_new_msg_con(struct connection *con, int len,
 
 	e = new_wq_entry(con, len, ppc, cb, data);
 	if (!e) {
-		kfree(msg);
+		dlm_free_msg(msg);
 		return NULL;
 	}
 
+	msg->retransmit = false;
+	msg->orig_msg = NULL;
 	msg->ppc = *ppc;
 	msg->len = len;
 	msg->entry = e;
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 6c8f4ce457f0..29369feea991 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -48,6 +48,7 @@ int dlm_lowcomms_nodes_set_mark(int nodeid, unsigned int mark);
 int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len);
 void dlm_midcomms_receive_done(int nodeid);
 struct kmem_cache *dlm_lowcomms_writequeue_cache_create(void);
+struct kmem_cache *dlm_lowcomms_msg_cache_create(void);
 
 #endif				/* __LOWCOMMS_DOT_H__ */
 
diff --git a/fs/dlm/memory.c b/fs/dlm/memory.c
index 94af986e83c6..ce35c3c19aeb 100644
--- a/fs/dlm/memory.c
+++ b/fs/dlm/memory.c
@@ -17,6 +17,7 @@
 
 static struct kmem_cache *writequeue_cache;
 static struct kmem_cache *mhandle_cache;
+static struct kmem_cache *msg_cache;
 static struct kmem_cache *lkb_cache;
 static struct kmem_cache *rsb_cache;
 
@@ -36,6 +37,10 @@ int __init dlm_memory_init(void)
 	if (!lkb_cache)
 		goto lkb;
 
+	msg_cache = dlm_lowcomms_msg_cache_create();
+	if (!msg_cache)
+		goto msg;
+
 	rsb_cache = kmem_cache_create("dlm_rsb", sizeof(struct dlm_rsb),
 				__alignof__(struct dlm_rsb), 0, NULL);
 	if (!rsb_cache)
@@ -44,6 +49,8 @@ int __init dlm_memory_init(void)
 	return 0;
 
 rsb:
+	kmem_cache_destroy(msg_cache);
+msg:
 	kmem_cache_destroy(lkb_cache);
 lkb:
 	kmem_cache_destroy(mhandle_cache);
@@ -57,6 +64,7 @@ void dlm_memory_exit(void)
 {
 	kmem_cache_destroy(writequeue_cache);
 	kmem_cache_destroy(mhandle_cache);
+	kmem_cache_destroy(msg_cache);
 	kmem_cache_destroy(lkb_cache);
 	kmem_cache_destroy(rsb_cache);
 }
@@ -129,3 +137,13 @@ void dlm_free_writequeue(struct writequeue_entry *writequeue)
 {
 	kmem_cache_free(writequeue_cache, writequeue);
 }
+
+struct dlm_msg *dlm_allocate_msg(gfp_t allocation)
+{
+	return kmem_cache_alloc(msg_cache, allocation);
+}
+
+void dlm_free_msg(struct dlm_msg *msg)
+{
+	kmem_cache_free(msg_cache, msg);
+}
diff --git a/fs/dlm/memory.h b/fs/dlm/memory.h
index 854269eacd44..7bd3f1a391ca 100644
--- a/fs/dlm/memory.h
+++ b/fs/dlm/memory.h
@@ -24,6 +24,8 @@ struct dlm_mhandle *dlm_allocate_mhandle(void);
 void dlm_free_mhandle(struct dlm_mhandle *mhandle);
 struct writequeue_entry *dlm_allocate_writequeue(void);
 void dlm_free_writequeue(struct writequeue_entry *writequeue);
+struct dlm_msg *dlm_allocate_msg(gfp_t allocation);
+void dlm_free_msg(struct dlm_msg *msg);
 
 #endif		/* __MEMORY_DOT_H__ */
 
-- 
2.27.0

