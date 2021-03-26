Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A9EAF34ADA0
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 18:34:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616780039;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Cd5gNI5JtIzTnGpNQNyeBXqQbn9+wT3wpC2PW7uGZiY=;
	b=GsPVBAXVxxiKHLbwFz4UAI7SYJvVYCO8RZJdGCYG9r0xIqYI3u2WdWxbp/c6Pia/56//xr
	TS7hmU2RyQBC/Zb2vtpU5RPt1nDeity5vJ0AGraQD4vRFvmUkI6VBSRDu6/ZC/rxoz2/zZ
	j+1w9qbqduqtEfeF5sWpOWqUhUa+APY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-kEfYXR_5N36Hhf3VdW_5Yw-1; Fri, 26 Mar 2021 13:33:58 -0400
X-MC-Unique: kEfYXR_5N36Hhf3VdW_5Yw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5824710CE7A7;
	Fri, 26 Mar 2021 17:33:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45A6B19C71;
	Fri, 26 Mar 2021 17:33:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F24DF180B450;
	Fri, 26 Mar 2021 17:33:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12QHXpxt009420 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 13:33:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 94BA01002EE6; Fri, 26 Mar 2021 17:33:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-117-90.rdu2.redhat.com [10.10.117.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1A2F1000324;
	Fri, 26 Mar 2021 17:33:50 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 26 Mar 2021 13:33:33 -0400
Message-Id: <20210326173337.44231-5-aahringo@redhat.com>
In-Reply-To: <20210326173337.44231-1-aahringo@redhat.com>
References: <20210326173337.44231-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com, gnault@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 4/8] fs: dlm: add functionality
	to re-transmit a message
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch introduces a irqsafe retransmit functionality for a lowcomms
message handle. It's just allocates a new buffer and transmit it again,
no special handling about prioritize it because keeping bytestream in
order.

To avoid another connection look some refactor was done to make a new
buffer allocation with a preexisting connection pointer.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 84 +++++++++++++++++++++++++++++++----------------
 fs/dlm/lowcomms.h |  1 +
 2 files changed, 56 insertions(+), 29 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index ba782ea84281..d2be58496fd0 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1409,7 +1409,7 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 {
 	struct writequeue_entry *e;
 
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	if (!list_empty(&con->writequeue)) {
 		e = list_last_entry(&con->writequeue, struct writequeue_entry, list);
 		if (DLM_WQ_REMAIN_BYTES(e) >= len) {
@@ -1421,12 +1421,12 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 
 			e->end += len;
 			e->users++;
-			spin_unlock(&con->writequeue_lock);
+			spin_unlock_bh(&con->writequeue_lock);
 
 			return e;
 		}
 	}
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 
 	e = new_writequeue_entry(con, allocation);
 	if (!e)
@@ -1436,35 +1436,24 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 	*ppc = page_address(e->page);
 	e->end += len;
 
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	if (cb)
 		cb(*ppc, priv);
 
 	list_add_tail(&e->list, &con->writequeue);
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 
 	return e;
 };
 
-void *dlm_lowcomms_new_buffer(int nodeid, int len, gfp_t allocation, char **ppc,
-			      void (*cb)(void *buf, void *priv), void *priv)
+static void *dlm_lowcomms_new_buffer_con(struct connection *con, int len,
+					 gfp_t allocation, char **ppc,
+					 void (*cb)(void *buf, void *priv),
+					 void *priv)
 {
 	struct writequeue_entry *e;
-	struct connection *con;
 	struct dlm_msg *msg;
 
-	if (len > DEFAULT_BUFFER_SIZE ||
-	    len < sizeof(struct dlm_header)) {
-		BUILD_BUG_ON(PAGE_SIZE < DEFAULT_BUFFER_SIZE);
-		log_print("failed to allocate a buffer of size %d", len);
-		WARN_ON(1);
-		return NULL;
-	}
-
-	con = nodeid2con(nodeid, allocation);
-	if (!con)
-		return NULL;
-
 	msg = kzalloc(sizeof(*msg), allocation);
 	if (!msg)
 		return NULL;
@@ -1484,6 +1473,26 @@ void *dlm_lowcomms_new_buffer(int nodeid, int len, gfp_t allocation, char **ppc,
 	return msg;
 }
 
+void *dlm_lowcomms_new_buffer(int nodeid, int len, gfp_t allocation, char **ppc,
+			      void (*cb)(void *buf, void *priv), void *priv)
+{
+	struct connection *con;
+
+	if (len > DEFAULT_BUFFER_SIZE ||
+	    len < sizeof(struct dlm_header)) {
+		BUILD_BUG_ON(PAGE_SIZE < DEFAULT_BUFFER_SIZE);
+		log_print("failed to allocate a buffer of size %d", len);
+		WARN_ON(1);
+		return NULL;
+	}
+
+	con = nodeid2con(nodeid, allocation);
+	if (!con)
+		return NULL;
+
+	return dlm_lowcomms_new_buffer_con(con, len, GFP_ATOMIC, ppc, cb, priv);
+}
+
 void dlm_lowcomms_commit_buffer(void *mh)
 {
 	struct dlm_msg *msg = mh;
@@ -1491,7 +1500,7 @@ void dlm_lowcomms_commit_buffer(void *mh)
 	struct connection *con = e->con;
 	int users;
 
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	list_add(&msg->list, &e->msgs);
 	kref_get(&msg->ref);
 
@@ -1500,13 +1509,13 @@ void dlm_lowcomms_commit_buffer(void *mh)
 		goto out;
 
 	e->len = DLM_WQ_LENGTH_BYTES(e);
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 
 	queue_work(send_workqueue, &con->swork);
 	return;
 
 out:
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 	return;
 }
 
@@ -1524,6 +1533,23 @@ void dlm_lowcomms_get_buffer(void *mh)
 	kref_get(&msg->ref);
 }
 
+/* irqsafe */
+void dlm_lowcomms_resend_buffer(void *mh)
+{
+	struct dlm_msg *msg = mh;
+	void *mh_new;
+	char *ppc;
+
+	mh_new = dlm_lowcomms_new_buffer_con(msg->entry->con, msg->len, GFP_ATOMIC,
+					     &ppc, NULL, NULL);
+	if (!mh_new)
+		return;
+
+	memcpy(ppc, msg->ppc, msg->len);
+	dlm_lowcomms_commit_buffer(mh_new);
+	dlm_lowcomms_put_buffer(mh_new);
+}
+
 /* Send a message */
 static void send_to_sock(struct connection *con)
 {
@@ -1537,7 +1563,7 @@ static void send_to_sock(struct connection *con)
 	if (con->sock == NULL)
 		goto out_connect;
 
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	for (;;) {
 		if (list_empty(&con->writequeue))
 			break;
@@ -1546,7 +1572,7 @@ static void send_to_sock(struct connection *con)
 		len = e->len;
 		offset = e->offset;
 		BUG_ON(len == 0 && e->users == 0);
-		spin_unlock(&con->writequeue_lock);
+		spin_unlock_bh(&con->writequeue_lock);
 
 		ret = 0;
 		if (len) {
@@ -1574,10 +1600,10 @@ static void send_to_sock(struct connection *con)
 			count = 0;
 		}
 
-		spin_lock(&con->writequeue_lock);
+		spin_lock_bh(&con->writequeue_lock);
 		writequeue_entry_complete(e, ret);
 	}
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 out:
 	mutex_unlock(&con->sock_mutex);
 	return;
@@ -1600,11 +1626,11 @@ static void clean_one_writequeue(struct connection *con)
 {
 	struct writequeue_entry *e, *safe;
 
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	list_for_each_entry_safe(e, safe, &con->writequeue, list) {
 		free_entry(e);
 	}
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 }
 
 /* Called from recovery when it knows that a node has
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index fa735497dad8..345aed7e00cc 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -30,6 +30,7 @@ int dlm_lowcomms_nodes_set_mark(int nodeid, unsigned int mark);
 int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len);
 void dlm_lowcomms_put_buffer(void *mh);
 void dlm_lowcomms_get_buffer(void *mh);
+void dlm_lowcomms_resend_buffer(void *mh);
 
 #endif				/* __LOWCOMMS_DOT_H__ */
 
-- 
2.26.3

