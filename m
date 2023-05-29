Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D2256715106
	for <lists+cluster-devel@lfdr.de>; Mon, 29 May 2023 23:44:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685396691;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HcXXALEFaXRHPgGrOsEU9tscRxQLRrynLZbbl9jJJ8g=;
	b=Qhq/+HNQBd7WEkIbSkBXBH0WCblD3dNeGJJP9pEst0EO6c+v4p/tFOurtM4FqIKmRH+RfZ
	qURViHaWczPj3QftHrTLD4P0hcWabRewJ4eIiPTUBDojDsqu53saKAfG5+L0tg3aPLwfKt
	/Vk8X2AjJv2j44SVO512YGZKyYGLwlo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-ZndUPFlUNXu3bXb1HBRzVg-1; Mon, 29 May 2023 17:44:48 -0400
X-MC-Unique: ZndUPFlUNXu3bXb1HBRzVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CB09380213A;
	Mon, 29 May 2023 21:44:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F237A2166B2B;
	Mon, 29 May 2023 21:44:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CC0B119465A0;
	Mon, 29 May 2023 21:44:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 296FC1946595 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 29 May 2023 21:44:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1CFE92166B31; Mon, 29 May 2023 21:44:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6C0F2166B2E;
 Mon, 29 May 2023 21:44:43 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 29 May 2023 17:44:40 -0400
Message-Id: <20230529214440.2542721-12-aahringo@redhat.com>
In-Reply-To: <20230529214440.2542721-1-aahringo@redhat.com>
References: <20230529214440.2542721-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 12/12] fs: dlm: add send ack
 threshold and append acks to msgs
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch changes the time when we sending an ack back to tell the
other side it can free some message because it is arrived on the
receiver node, due random reconnects e.g. TCP resets this is handled as
well on application layer to not let DLM run into a deadlock state.

The current handling has the following problems:

1. We end in situations that we only send an ack back message of 16
   bytes out and no other messages. Whereas DLM has logic to combine
   so much messages as it can in one send() socket call. This behaviour
   can be discovered by "trace-cmd start -e dlm_recv" and observing the
   ret field being 16 bytes.

2. When processing of DLM messages will never end because we receive a
   lot of messages, we will not send an ack back as it happens when
   the processing loop ends.

This patch introduces a likely and unlikely threshold case. The likely
case will send an ack back on a transmit path if the threshold is
triggered of amount of processed upper layer protocol. This will solve
issue 1 because it will be send when another normal DLM message will be
sent. It solves issue 2 because it is not part of the processing loop.

There is however a unlikely case, the unlikely case has a bigger
threshold and will be triggered when we only receive messages and do not
sent any message back. This case avoids that the sending node will keep
a lot of message for a long time as we send sometimes ack backs to tell
the sender to finally release messages.

The atomic cmpxchg() is there to provide a atomically ack send with
reset of the upper layer protocol delivery counter.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 30 -------------------
 fs/dlm/midcomms.c | 76 +++++++++++++++++++----------------------------
 2 files changed, 31 insertions(+), 75 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 345a316ae54c..68092f953830 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -860,30 +860,8 @@ struct dlm_processed_nodes {
 	struct list_head list;
 };
 
-static void add_processed_node(int nodeid, struct list_head *processed_nodes)
-{
-	struct dlm_processed_nodes *n;
-
-	list_for_each_entry(n, processed_nodes, list) {
-		/* we already remembered this node */
-		if (n->nodeid == nodeid)
-			return;
-	}
-
-	/* if it's fails in worst case we simple don't send an ack back.
-	 * We try it next time.
-	 */
-	n = kmalloc(sizeof(*n), GFP_NOFS);
-	if (!n)
-		return;
-
-	n->nodeid = nodeid;
-	list_add(&n->list, processed_nodes);
-}
-
 static void process_dlm_messages(struct work_struct *work)
 {
-	struct dlm_processed_nodes *n, *n_tmp;
 	struct processqueue_entry *pentry;
 	LIST_HEAD(processed_nodes);
 
@@ -902,7 +880,6 @@ static void process_dlm_messages(struct work_struct *work)
 	for (;;) {
 		dlm_process_incoming_buffer(pentry->nodeid, pentry->buf,
 					    pentry->buflen);
-		add_processed_node(pentry->nodeid, &processed_nodes);
 		free_processqueue_entry(pentry);
 
 		spin_lock(&processqueue_lock);
@@ -917,13 +894,6 @@ static void process_dlm_messages(struct work_struct *work)
 		list_del(&pentry->list);
 		spin_unlock(&processqueue_lock);
 	}
-
-	/* send ack back after we processed couple of messages */
-	list_for_each_entry_safe(n, n_tmp, &processed_nodes, list) {
-		list_del(&n->list);
-		dlm_midcomms_receive_done(n->nodeid);
-		kfree(n);
-	}
 }
 
 /* Data received from remote end */
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 70286737eb0a..e1a0df67b566 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -148,6 +148,8 @@
 /* 5 seconds wait to sync ending of dlm */
 #define DLM_SHUTDOWN_TIMEOUT	msecs_to_jiffies(5000)
 #define DLM_VERSION_NOT_SET	0
+#define DLM_SEND_ACK_BACK_MSG_THRESHOLD 32
+#define DLM_RECV_ACK_BACK_MSG_THRESHOLD (DLM_SEND_ACK_BACK_MSG_THRESHOLD * 8)
 
 struct midcomms_node {
 	int nodeid;
@@ -165,7 +167,7 @@ struct midcomms_node {
 #define DLM_NODE_FLAG_CLOSE	1
 #define DLM_NODE_FLAG_STOP_TX	2
 #define DLM_NODE_FLAG_STOP_RX	3
-#define DLM_NODE_ULP_DELIVERED	4
+	atomic_t ulp_delivered;
 	unsigned long flags;
 	wait_queue_head_t shutdown_wait;
 
@@ -319,6 +321,7 @@ static void midcomms_node_reset(struct midcomms_node *node)
 
 	atomic_set(&node->seq_next, DLM_SEQ_INIT);
 	atomic_set(&node->seq_send, DLM_SEQ_INIT);
+	atomic_set(&node->ulp_delivered, 0);
 	node->version = DLM_VERSION_NOT_SET;
 	node->flags = 0;
 
@@ -393,6 +396,28 @@ static int dlm_send_ack(int nodeid, uint32_t seq)
 	return 0;
 }
 
+static void dlm_send_ack_threshold(struct midcomms_node *node,
+				   uint32_t threshold)
+{
+	uint32_t oval, nval;
+	bool send_ack;
+
+	/* let only send one user trigger threshold to send ack back */
+	do {
+		oval = atomic_read(&node->ulp_delivered);
+		send_ack = (oval > threshold);
+		/* abort if threshold is not reached */
+		if (!send_ack)
+			break;
+
+		nval = 0;
+		/* try to reset ulp_delivered counter */
+	} while (atomic_cmpxchg(&node->ulp_delivered, oval, nval) != oval);
+
+	if (send_ack)
+		dlm_send_ack(node->nodeid, atomic_read(&node->seq_next));
+}
+
 static int dlm_send_fin(struct midcomms_node *node,
 			void (*ack_rcv)(struct midcomms_node *node))
 {
@@ -560,7 +585,9 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 			WARN_ON_ONCE(test_bit(DLM_NODE_FLAG_STOP_RX, &node->flags));
 			dlm_receive_buffer_3_2_trace(seq, p);
 			dlm_receive_buffer(p, node->nodeid);
-			set_bit(DLM_NODE_ULP_DELIVERED, &node->flags);
+			atomic_inc(&node->ulp_delivered);
+			/* unlikely case to send ack back when we don't transmit */
+			dlm_send_ack_threshold(node, DLM_RECV_ACK_BACK_MSG_THRESHOLD);
 			break;
 		}
 	} else {
@@ -969,49 +996,6 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 	return ret;
 }
 
-void dlm_midcomms_receive_done(int nodeid)
-{
-	struct midcomms_node *node;
-	int idx;
-
-	idx = srcu_read_lock(&nodes_srcu);
-	node = nodeid2node(nodeid, 0);
-	if (!node) {
-		srcu_read_unlock(&nodes_srcu, idx);
-		return;
-	}
-
-	/* old protocol, we do nothing */
-	switch (node->version) {
-	case DLM_VERSION_3_2:
-		break;
-	default:
-		srcu_read_unlock(&nodes_srcu, idx);
-		return;
-	}
-
-	/* do nothing if we didn't delivered stateful to ulp */
-	if (!test_and_clear_bit(DLM_NODE_ULP_DELIVERED,
-				&node->flags)) {
-		srcu_read_unlock(&nodes_srcu, idx);
-		return;
-	}
-
-	spin_lock(&node->state_lock);
-	/* we only ack if state is ESTABLISHED */
-	switch (node->state) {
-	case DLM_ESTABLISHED:
-		spin_unlock(&node->state_lock);
-		dlm_send_ack(node->nodeid, atomic_read(&node->seq_next));
-		break;
-	default:
-		spin_unlock(&node->state_lock);
-		/* do nothing FIN has it's own ack send */
-		break;
-	}
-	srcu_read_unlock(&nodes_srcu, idx);
-}
-
 void dlm_midcomms_unack_msg_resend(int nodeid)
 {
 	struct midcomms_node *node;
@@ -1142,6 +1126,8 @@ struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 			goto err;
 		}
 
+		/* send ack back if necessary */
+		dlm_send_ack_threshold(node, DLM_SEND_ACK_BACK_MSG_THRESHOLD);
 		break;
 	default:
 		dlm_free_mhandle(mh);
-- 
2.31.1

