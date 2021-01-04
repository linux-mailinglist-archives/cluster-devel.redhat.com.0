Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 55A0B2E9F2F
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Jan 2021 22:00:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609794049;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c+7oQRlunAoMxgjIU5xoi12ibBGbDRyQJq4biHlzAe0=;
	b=GiD9thyWAvOL7ui9n08Qe9Pokoxj7D8yu2VpMPQeHtZ8lIfNqyPNSiGn4gUrAAcD97Roms
	c0GXTkl/vFt15ccwawwYfH8254Qqi45TRxnvoSLgcaeOYAUpEwcdQavSeP0D13trk6tuU1
	qNse7ZNmSJ8VwOPFq2Roq41pd4GyMNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-5TXVC9C1Ni-k6vciymcwBw-1; Mon, 04 Jan 2021 16:00:47 -0500
X-MC-Unique: 5TXVC9C1Ni-k6vciymcwBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 688C0800050;
	Mon,  4 Jan 2021 21:00:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 552E910016FB;
	Mon,  4 Jan 2021 21:00:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F2B64E58E;
	Mon,  4 Jan 2021 21:00:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 104L0hk6003732 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 16:00:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2CE732719F; Mon,  4 Jan 2021 21:00:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-75.rdu2.redhat.com [10.10.115.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA541272AD;
	Mon,  4 Jan 2021 21:00:42 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Jan 2021 16:00:14 -0500
Message-Id: <20210104210024.233765-11-aahringo@redhat.com>
In-Reply-To: <20210104210024.233765-1-aahringo@redhat.com>
References: <20210104210024.233765-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 10/20] fs: dlm: make buffer
	handling per msg
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
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

This patch makes the void pointer handle for lowcomms functionality per
message and not per page allocation entry. A refcount handling for the
handle was added to keep the message alive until the user doesn't need
it anymore.

There exists now a per message callback which will be called when
allocating a new buffer. This callback will be guaranteed to be called
according the order of the sending buffer, which can be used that the
caller increments a sequence number.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 100 +++++++++++++++++++++++++++++++++++++++++-----
 fs/dlm/lowcomms.h |   5 ++-
 fs/dlm/midcomms.c |   8 +++-
 3 files changed, 101 insertions(+), 12 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 8c826e95493c..438badc2d870 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -114,6 +114,17 @@ struct writequeue_entry {
 	int end;
 	int users;
 	struct connection *con;
+	struct list_head msgs;
+	struct kref ref;
+};
+
+struct dlm_msg {
+	struct writequeue_entry *entry;
+	void *ppc;
+	int len;
+
+	struct list_head list;
+	struct kref ref;
 };
 
 struct dlm_node_addr {
@@ -956,12 +967,36 @@ static int accept_from_sock(struct listen_connection *con)
 	return result;
 }
 
-static void free_entry(struct writequeue_entry *e)
+static void dlm_page_release(struct kref *kref)
 {
+	struct writequeue_entry *e = container_of(kref, struct writequeue_entry,
+						  ref);
+
 	__free_page(e->page);
 	kfree(e);
 }
 
+static void dlm_msg_release(struct kref *kref)
+{
+	struct dlm_msg *msg = container_of(kref, struct dlm_msg, ref);
+
+	kref_put(&msg->entry->ref, dlm_page_release);
+	kfree(msg);
+}
+
+static void free_entry(struct writequeue_entry *e)
+{
+	struct dlm_msg *msg, *tmp;
+
+	list_for_each_entry_safe(msg, tmp, &e->msgs, list) {
+		list_del(&msg->list);
+		kref_put(&msg->ref, dlm_msg_release);
+	}
+
+	list_del(&e->list);
+	kref_put(&e->ref, dlm_page_release);
+}
+
 /*
  * writequeue_entry_complete - try to delete and free write queue entry
  * @e: write queue entry to try to delete
@@ -974,10 +1009,8 @@ static void writequeue_entry_complete(struct writequeue_entry *e, int completed)
 	e->offset += completed;
 	e->len -= completed;
 
-	if (e->len == 0 && e->users == 0) {
-		list_del(&e->list);
+	if (e->len == 0 && e->users == 0)
 		free_entry(e);
-	}
 }
 
 /*
@@ -1347,12 +1380,16 @@ static struct writequeue_entry *new_writequeue_entry(struct connection *con,
 
 	entry->con = con;
 	entry->users = 1;
+	kref_init(&entry->ref);
+	INIT_LIST_HEAD(&entry->msgs);
 
 	return entry;
 }
 
 static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
-					     gfp_t allocation, char **ppc)
+					     gfp_t allocation, char **ppc,
+					     void (*cb)(void *buf, void *priv),
+					     void *priv)
 {
 	struct writequeue_entry *e;
 
@@ -1360,7 +1397,12 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 	if (!list_empty(&con->writequeue)) {
 		e = list_last_entry(&con->writequeue, struct writequeue_entry, list);
 		if (DLM_WQ_REMAIN_BYTES(e) >= len) {
+			kref_get(&e->ref);
+
 			*ppc = page_address(e->page) + e->end;
+			if (cb)
+				cb(*ppc, priv);
+
 			e->end += len;
 			e->users++;
 			spin_unlock(&con->writequeue_lock);
@@ -1374,19 +1416,26 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 	if (!e)
 		return NULL;
 
+	kref_get(&e->ref);
 	*ppc = page_address(e->page);
 	e->end += len;
 
 	spin_lock(&con->writequeue_lock);
+	if (cb)
+		cb(*ppc, priv);
+
 	list_add_tail(&e->list, &con->writequeue);
 	spin_unlock(&con->writequeue_lock);
 
 	return e;
 };
 
-void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
+void *dlm_lowcomms_new_buffer(int nodeid, int len, gfp_t allocation, char **ppc,
+			      void (*cb)(void *buf, void *priv), void *priv)
 {
+	struct writequeue_entry *e;
 	struct connection *con;
+	struct dlm_msg *msg;
 
 	if (len > DEFAULT_BUFFER_SIZE ||
 	    len < sizeof(struct dlm_header)) {
@@ -1399,16 +1448,36 @@ void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
 	if (!con)
 		return NULL;
 
-	return new_wq_entry(con, len, allocation, ppc);
+	msg = kzalloc(sizeof(*msg), allocation);
+	if (!msg)
+		return NULL;
+
+	kref_init(&msg->ref);
+
+	e = new_wq_entry(con, len, allocation, ppc, cb, priv);
+	if (!e) {
+		kfree(msg);
+		return NULL;
+	}
+
+	msg->ppc = *ppc;
+	msg->len = len;
+	msg->entry = e;
+
+	return msg;
 }
 
 void dlm_lowcomms_commit_buffer(void *mh)
 {
-	struct writequeue_entry *e = (struct writequeue_entry *)mh;
+	struct dlm_msg *msg = mh;
+	struct writequeue_entry *e = msg->entry;
 	struct connection *con = e->con;
 	int users;
 
 	spin_lock(&con->writequeue_lock);
+	list_add(&msg->list, &e->msgs);
+	kref_get(&msg->ref);
+
 	users = --e->users;
 	if (users)
 		goto out;
@@ -1424,6 +1493,20 @@ void dlm_lowcomms_commit_buffer(void *mh)
 	return;
 }
 
+void dlm_lowcomms_put_buffer(void *mh)
+{
+	struct dlm_msg *msg = mh;
+
+	kref_put(&msg->ref, dlm_msg_release);
+}
+
+void dlm_lowcomms_get_buffer(void *mh)
+{
+	struct dlm_msg *msg = mh;
+
+	kref_get(&msg->ref);
+}
+
 /* Send a message */
 static void send_to_sock(struct connection *con)
 {
@@ -1502,7 +1585,6 @@ static void clean_one_writequeue(struct connection *con)
 
 	spin_lock(&con->writequeue_lock);
 	list_for_each_entry_safe(e, safe, &con->writequeue, list) {
-		list_del(&e->list);
 		free_entry(e);
 	}
 	spin_unlock(&con->writequeue_lock);
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index f74888ed43b4..6417c5fca215 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -21,10 +21,13 @@ int dlm_lowcomms_start(void);
 void dlm_lowcomms_stop(void);
 void dlm_lowcomms_exit(void);
 int dlm_lowcomms_close(int nodeid);
-void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc);
+void *dlm_lowcomms_new_buffer(int nodeid, int len, gfp_t allocation, char **ppc,
+			      void (*cb)(void *buf, void *priv), void *priv);
 void dlm_lowcomms_commit_buffer(void *mh);
 int dlm_lowcomms_connect_node(int nodeid);
 int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len);
+void dlm_lowcomms_put_buffer(void *mh);
+void dlm_lowcomms_get_buffer(void *mh);
 
 #endif				/* __LOWCOMMS_DOT_H__ */
 
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 717a3ed34f6a..e058e017c77d 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -32,23 +32,27 @@
 
 void *dlm_midcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
 {
-	return dlm_lowcomms_get_buffer(nodeid, len, allocation, ppc);
+	return dlm_lowcomms_new_buffer(nodeid, len, allocation, ppc, NULL,
+				       NULL);
 }
 
 void dlm_midcomms_commit_buffer(void *mh)
 {
 	dlm_lowcomms_commit_buffer(mh);
+	dlm_lowcomms_put_buffer(mh);
 }
 
 void *dlm_midcomms_stateless_get_buffer(int nodeid, int len, gfp_t allocation,
 					char **ppc)
 {
-	return dlm_lowcomms_get_buffer(nodeid, len, allocation, ppc);
+	return dlm_lowcomms_new_buffer(nodeid, len, allocation, ppc, NULL,
+				       NULL);
 }
 
 void dlm_midcomms_stateless_commit_buffer(void *mh)
 {
 	dlm_lowcomms_commit_buffer(mh);
+	dlm_lowcomms_put_buffer(mh);
 }
 
 void midcomms_add_member(int nodeid)
-- 
2.26.2

