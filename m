Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AD7463ECC
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Nov 2021 20:47:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638301678;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WV2MorjOT4CMOdMedGxgvTbNomSHwctpXAbdDk9EzN8=;
	b=P9xutzWmltawWqq/+yc2eODthRu4QtBgvzW9QCt0MokyFjSyWJ07gSBa3fXyoMZgys28Q3
	jd/YvxB4Od6MW54110mlpHUfLQeGo4Osu0WaEhze4DWZb3rXxzI4FPxllZPCGrLiFCAxYK
	y1z6odV2FVd756myYOsWBPpzbWv4yhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-n-U2DcddMdeIM_RBpbJhrg-1; Tue, 30 Nov 2021 14:47:55 -0500
X-MC-Unique: n-U2DcddMdeIM_RBpbJhrg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1247884BA69;
	Tue, 30 Nov 2021 19:47:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD7D98049E;
	Tue, 30 Nov 2021 19:47:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E93801809CB7;
	Tue, 30 Nov 2021 19:47:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AUJli0x022136 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Nov 2021 14:47:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 61E2B45D67; Tue, 30 Nov 2021 19:47:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 050C767843;
	Tue, 30 Nov 2021 19:47:43 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 30 Nov 2021 14:47:17 -0500
Message-Id: <20211130194720.666400-4-aahringo@redhat.com>
In-Reply-To: <20211130194720.666400-1-aahringo@redhat.com>
References: <20211130194720.666400-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 4/7] fs: dlm: remove wq_alloc mutex
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

This patch cleanups the code for allocating a new buffer in the dlm
writequeue mechanism. There was a possible tuneup to allow scheduling
while a new writequeue entry needs to be allocated because either no
sending page is available or are full. To avoid multiple concurrent
users checking at the same time if an entry is available or full
alloc_wq was introduce that those are waiting if there is currently a
new writequeue entry in process to be queued so possible further users
will check on the new allocated writequeue entry if it's full.

To simplify the code we just remove this mutex and switch that the
already introduced spin lock will be held during writequeue check,
allocation and queueing. So other users can never check on available
writequeues while there is a new one in process but not queued yet.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 48 +++++++++++------------------------------------
 1 file changed, 11 insertions(+), 37 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 6d500ebc6145..4919faf79709 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -86,7 +86,6 @@ struct connection {
 	struct list_head writequeue;  /* List of outgoing writequeue_entries */
 	spinlock_t writequeue_lock;
 	atomic_t writequeue_cnt;
-	struct mutex wq_alloc;
 	int retries;
 #define MAX_CONNECT_RETRIES 3
 	struct hlist_node list;
@@ -270,8 +269,6 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 		return NULL;
 	}
 
-	mutex_init(&con->wq_alloc);
-
 	spin_lock(&connections_lock);
 	/* Because multiple workqueues/threads calls this function it can
 	 * race on multiple cpu's. Instead of locking hot path __find_con()
@@ -1176,16 +1173,15 @@ static void deinit_local(void)
 		kfree(dlm_local_addr[i]);
 }
 
-static struct writequeue_entry *new_writequeue_entry(struct connection *con,
-						     gfp_t allocation)
+static struct writequeue_entry *new_writequeue_entry(struct connection *con)
 {
 	struct writequeue_entry *entry;
 
-	entry = kzalloc(sizeof(*entry), allocation);
+	entry = kzalloc(sizeof(*entry), GFP_ATOMIC);
 	if (!entry)
 		return NULL;
 
-	entry->page = alloc_page(allocation | __GFP_ZERO);
+	entry->page = alloc_page(GFP_ATOMIC | __GFP_ZERO);
 	if (!entry->page) {
 		kfree(entry);
 		return NULL;
@@ -1200,8 +1196,8 @@ static struct writequeue_entry *new_writequeue_entry(struct connection *con,
 }
 
 static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
-					     gfp_t allocation, char **ppc,
-					     void (*cb)(void *data), void *data)
+					     char **ppc, void (*cb)(void *data),
+					     void *data)
 {
 	struct writequeue_entry *e;
 
@@ -1217,29 +1213,25 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 
 			e->end += len;
 			e->users++;
-			spin_unlock(&con->writequeue_lock);
-
-			return e;
+			goto out;
 		}
 	}
-	spin_unlock(&con->writequeue_lock);
 
-	e = new_writequeue_entry(con, allocation);
+	e = new_writequeue_entry(con);
 	if (!e)
-		return NULL;
+		goto out;
 
 	kref_get(&e->ref);
 	*ppc = page_address(e->page);
 	e->end += len;
 	atomic_inc(&con->writequeue_cnt);
-
-	spin_lock(&con->writequeue_lock);
 	if (cb)
 		cb(data);
 
 	list_add_tail(&e->list, &con->writequeue);
-	spin_unlock(&con->writequeue_lock);
 
+out:
+	spin_unlock(&con->writequeue_lock);
 	return e;
 };
 
@@ -1250,37 +1242,19 @@ static struct dlm_msg *dlm_lowcomms_new_msg_con(struct connection *con, int len,
 {
 	struct writequeue_entry *e;
 	struct dlm_msg *msg;
-	bool sleepable;
 
 	msg = kzalloc(sizeof(*msg), allocation);
 	if (!msg)
 		return NULL;
 
-	/* this mutex is being used as a wait to avoid multiple "fast"
-	 * new writequeue page list entry allocs in new_wq_entry in
-	 * normal operation which is sleepable context. Without it
-	 * we could end in multiple writequeue entries with one
-	 * dlm message because multiple callers were waiting at
-	 * the writequeue_lock in new_wq_entry().
-	 */
-	sleepable = gfpflags_normal_context(allocation);
-	if (sleepable)
-		mutex_lock(&con->wq_alloc);
-
 	kref_init(&msg->ref);
 
-	e = new_wq_entry(con, len, allocation, ppc, cb, data);
+	e = new_wq_entry(con, len, ppc, cb, data);
 	if (!e) {
-		if (sleepable)
-			mutex_unlock(&con->wq_alloc);
-
 		kfree(msg);
 		return NULL;
 	}
 
-	if (sleepable)
-		mutex_unlock(&con->wq_alloc);
-
 	msg->ppc = *ppc;
 	msg->len = len;
 	msg->entry = e;
-- 
2.27.0

