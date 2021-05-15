Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 677A43814A4
	for <lists+cluster-devel@lfdr.de>; Sat, 15 May 2021 02:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621038977;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y1UYpGZpgt+iRXH7IpcRIRbpXR4bGBGIdxMaZHGaRDY=;
	b=KcChZH5R06ne4dfMnNaE4yd/h6naAWwLsSThXP/n5xaAL2Sy5W+jodlMx6ChQWq174gbye
	T89lg691iFJWUa0QUGs/9PsPSp+EzrG9SCvn+GkD4tU0Hyrf8M76j+YL0HHsE/4CPTPtip
	3AadesVpaxx7fsFQHJ2Qq9uhGx00QkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-tOBhS6RVO_2Pn3U5vIE3MQ-1; Fri, 14 May 2021 20:36:15 -0400
X-MC-Unique: tOBhS6RVO_2Pn3U5vIE3MQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91FB18042C5;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84F6D5D9FC;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7551D1800FFC;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14F0a7if030890 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 14 May 2021 20:36:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C03895D9E3; Sat, 15 May 2021 00:36:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-135.rdu2.redhat.com [10.10.115.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43ED05D9CD;
	Sat, 15 May 2021 00:36:07 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 14 May 2021 20:35:43 -0400
Message-Id: <20210515003549.1118171-10-aahringo@redhat.com>
In-Reply-To: <20210515003549.1118171-1-aahringo@redhat.com>
References: <20210515003549.1118171-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv5 v5.13-rc1 dlm/next 09/15] fs: dlm: add
	functionality to re-transmit a message
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch introduces a retransmit functionality for a lowcomms message
handle. It's just allocates a new buffer and transmit it again, no
special handling about prioritize it because keeping bytestream in order.

To avoid another connection look some refactor was done to make a new
buffer allocation with a preexisting connection pointer.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 85 ++++++++++++++++++++++++++++++++++++-----------
 fs/dlm/lowcomms.h |  1 +
 2 files changed, 67 insertions(+), 19 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 70fd54ebdbe1..fd5d4f5c13cf 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -126,6 +126,8 @@ struct writequeue_entry {
 
 struct dlm_msg {
 	struct writequeue_entry *entry;
+	struct dlm_msg *orig_msg;
+	bool retransmit;
 	void *ppc;
 	int len;
 	int idx; /* new()/commit() idx exchange */
@@ -1055,6 +1057,10 @@ static void free_entry(struct writequeue_entry *e)
 	struct dlm_msg *msg, *tmp;
 
 	list_for_each_entry_safe(msg, tmp, &e->msgs, list) {
+		if (msg->orig_msg) {
+			msg->orig_msg->retransmit = false;
+			kref_put(&msg->orig_msg->ref, dlm_msg_release);
+		}
 		list_del(&msg->list);
 		kref_put(&msg->ref, dlm_msg_release);
 	}
@@ -1494,11 +1500,37 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 	return e;
 };
 
+static struct dlm_msg *dlm_lowcomms_new_msg_con(struct connection *con, int len,
+						gfp_t allocation, char **ppc,
+						void (*cb)(struct dlm_mhandle *mh),
+						struct dlm_mhandle *mh)
+{
+	struct writequeue_entry *e;
+	struct dlm_msg *msg;
+
+	msg = kzalloc(sizeof(*msg), allocation);
+	if (!msg)
+		return NULL;
+
+	kref_init(&msg->ref);
+
+	e = new_wq_entry(con, len, allocation, ppc, cb, mh);
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
+}
+
 struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
 				     char **ppc, void (*cb)(struct dlm_mhandle *mh),
 				     struct dlm_mhandle *mh)
 {
-	struct writequeue_entry *e;
 	struct connection *con;
 	struct dlm_msg *msg;
 	int idx;
@@ -1518,32 +1550,18 @@ struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
 		return NULL;
 	}
 
-	msg = kzalloc(sizeof(*msg), allocation);
+	msg = dlm_lowcomms_new_msg_con(con, len, allocation, ppc, cb, mh);
 	if (!msg) {
 		srcu_read_unlock(&connections_srcu, idx);
 		return NULL;
 	}
 
-	kref_init(&msg->ref);
-
-	e = new_wq_entry(con, len, allocation, ppc, cb, mh);
-	if (!e) {
-		srcu_read_unlock(&connections_srcu, idx);
-		kfree(msg);
-		return NULL;
-	}
-
-	msg->ppc = *ppc;
-	msg->len = len;
-	msg->entry = e;
-
 	/* we assume if successful commit must called */
 	msg->idx = idx;
-
 	return msg;
 }
 
-void dlm_lowcomms_commit_msg(struct dlm_msg *msg)
+static void _dlm_lowcomms_commit_msg(struct dlm_msg *msg)
 {
 	struct writequeue_entry *e = msg->entry;
 	struct connection *con = e->con;
@@ -1561,20 +1579,49 @@ void dlm_lowcomms_commit_msg(struct dlm_msg *msg)
 	spin_unlock(&con->writequeue_lock);
 
 	queue_work(send_workqueue, &con->swork);
-	srcu_read_unlock(&connections_srcu, msg->idx);
 	return;
 
 out:
 	spin_unlock(&con->writequeue_lock);
-	srcu_read_unlock(&connections_srcu, msg->idx);
 	return;
 }
 
+void dlm_lowcomms_commit_msg(struct dlm_msg *msg)
+{
+	_dlm_lowcomms_commit_msg(msg);
+	srcu_read_unlock(&connections_srcu, msg->idx);
+}
+
 void dlm_lowcomms_put_msg(struct dlm_msg *msg)
 {
 	kref_put(&msg->ref, dlm_msg_release);
 }
 
+/* does not held connections_srcu, usage workqueue only */
+int dlm_lowcomms_resend_msg(struct dlm_msg *msg)
+{
+	struct dlm_msg *msg_resend;
+	char *ppc;
+
+	if (msg->retransmit)
+		return 1;
+
+	msg_resend = dlm_lowcomms_new_msg_con(msg->entry->con, msg->len,
+					      GFP_ATOMIC, &ppc, NULL, NULL);
+	if (!msg_resend)
+		return -ENOMEM;
+
+	msg->retransmit = true;
+	kref_get(&msg->ref);
+	msg_resend->orig_msg = msg;
+
+	memcpy(ppc, msg->ppc, msg->len);
+	_dlm_lowcomms_commit_msg(msg_resend);
+	dlm_lowcomms_put_msg(msg_resend);
+
+	return 0;
+}
+
 /* Send a message */
 static void send_to_sock(struct connection *con)
 {
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index cdb8f066f0d8..a4384826442c 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -27,6 +27,7 @@ struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
 				     struct dlm_mhandle *mh);
 void dlm_lowcomms_commit_msg(struct dlm_msg *msg);
 void dlm_lowcomms_put_msg(struct dlm_msg *msg);
+int dlm_lowcomms_resend_msg(struct dlm_msg *msg);
 int dlm_lowcomms_connect_node(int nodeid);
 int dlm_lowcomms_nodes_set_mark(int nodeid, unsigned int mark);
 int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len);
-- 
2.26.3

