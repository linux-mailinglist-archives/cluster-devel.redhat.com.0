Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 441423D6538
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 19:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627319525;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MB1ReoAJ1FesbmqDfmS2kpzaKSBSCNI8Iye9wz14z+g=;
	b=BNq3ZuOteOWx5uE1T+OtoDqPN79dnm+74la7EGVoZjvf+yYzj9oz69Dw+sCHSzsFfZbBUf
	xndrKm9o+LAiKPe9aI3M50vunGgfkavHyLXVK/T8Bq4BXNJSWfi7ORpwMNFGCZUma1d4vM
	5O3/ith02XMTOhxbj8oYtI46DlaLL80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-wxlARGpVMP2W12JQb28O7A-1; Mon, 26 Jul 2021 13:12:03 -0400
X-MC-Unique: wxlARGpVMP2W12JQb28O7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 319C31019623;
	Mon, 26 Jul 2021 17:12:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 249A619811;
	Mon, 26 Jul 2021 17:12:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F3ADF4BB7B;
	Mon, 26 Jul 2021 17:12:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QHBwu7022483 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 13:11:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AA6B65DAA5; Mon, 26 Jul 2021 17:11:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4BC765D9D3;
	Mon, 26 Jul 2021 17:11:56 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 26 Jul 2021 13:11:49 -0400
Message-Id: <20210726171149.2326475-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: implement delayed ack
	handling
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

This patch changes that we don't ack each message. Lowcomms will take
care about to send an ack back after a bulk of messages was processed.
Currently it's only when the whole receive buffer was processed, there
might better positions to send an ack back but only the lowcomms
implementation know when there are more data to receive. This patch has
also disadvantages that we might retransmit more on errors, however this
is a very rare case.

Tested with make_panic on gfs2 with three nodes by running:

trace-cmd record -p function -l 'dlm_send_ack' sleep 100

and

trace-cmd report | wc -l

Before patch:
- 20548
- 21376
- 21398

After patch:
- 18338
- 20679
- 19949

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c |  1 +
 fs/dlm/lowcomms.h |  1 +
 fs/dlm/midcomms.c | 56 ++++++++++++++++++++++++++++++++++++++++-------
 3 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index cce1d50aa09f..8f715c620e1f 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -947,6 +947,7 @@ static int receive_from_sock(struct connection *con)
 		}
 	}
 
+	dlm_midcomms_receive_done(con->nodeid);
 	mutex_unlock(&con->sock_mutex);
 	return 0;
 
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index aaae7115c00d..4ccae07cf005 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -46,6 +46,7 @@ int dlm_lowcomms_resend_msg(struct dlm_msg *msg);
 int dlm_lowcomms_connect_node(int nodeid);
 int dlm_lowcomms_nodes_set_mark(int nodeid, unsigned int mark);
 int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len);
+void dlm_midcomms_receive_done(int nodeid);
 
 #endif				/* __LOWCOMMS_DOT_H__ */
 
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index e3de268898ed..7ae39ec8d9b0 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -109,12 +109,6 @@
  * compatibility. There exists better ways to make a better handling.
  * However this should be changed in the next major version bump of dlm.
  *
- * Ack handling:
- *
- * Currently we send an ack message for every dlm message. However we
- * can ack multiple dlm messages with one ack by just delaying the ack
- * message. Will reduce some traffic but makes the drop detection slower.
- *
  * Tail Size checking:
  *
  * There exists a message tail payload in e.g. DLM_MSG however we don't
@@ -169,6 +163,7 @@ struct midcomms_node {
 #define DLM_NODE_FLAG_CLOSE	1
 #define DLM_NODE_FLAG_STOP_TX	2
 #define DLM_NODE_FLAG_STOP_RX	3
+#define DLM_NODE_ULP_DELIVERED	4
 	unsigned long flags;
 	wait_queue_head_t shutdown_wait;
 
@@ -480,11 +475,12 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 {
 	if (seq == node->seq_next) {
 		node->seq_next++;
-		/* send ack before fin */
-		dlm_send_ack(node->nodeid, node->seq_next);
 
 		switch (p->header.h_cmd) {
 		case DLM_FIN:
+			/* send ack before fin */
+			dlm_send_ack(node->nodeid, node->seq_next);
+
 			spin_lock(&node->state_lock);
 			pr_debug("receive fin msg from node %d with state %s\n",
 				 node->nodeid, dlm_state_str(node->state));
@@ -534,6 +530,7 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 		default:
 			WARN_ON(test_bit(DLM_NODE_FLAG_STOP_RX, &node->flags));
 			dlm_receive_buffer(p, node->nodeid);
+			set_bit(DLM_NODE_ULP_DELIVERED, &node->flags);
 			break;
 		}
 	} else {
@@ -933,6 +930,49 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 	return ret;
 }
 
+void dlm_midcomms_receive_done(int nodeid)
+{
+	struct midcomms_node *node;
+	int idx;
+
+	idx = srcu_read_lock(&nodes_srcu);
+	node = nodeid2node(nodeid, 0);
+	if (!node) {
+		srcu_read_unlock(&nodes_srcu, idx);
+		return;
+	}
+
+	/* old protocol, we do nothing */
+	switch (node->version) {
+	case DLM_VERSION_3_2:
+		break;
+	default:
+		srcu_read_unlock(&nodes_srcu, idx);
+		return;
+	}
+
+	/* do nothing if we didn't delivered stateful to ulp */
+	if (!test_and_clear_bit(DLM_NODE_ULP_DELIVERED,
+				&node->flags)) {
+		srcu_read_unlock(&nodes_srcu, idx);
+		return;
+	}
+
+	spin_lock(&node->state_lock);
+	/* we only ack if state is ESTABLISHED */
+	switch (node->state) {
+	case DLM_ESTABLISHED:
+		spin_unlock(&node->state_lock);
+		dlm_send_ack(node->nodeid, node->seq_next);
+		break;
+	default:
+		spin_unlock(&node->state_lock);
+		/* do nothing FIN has it's own ack send */
+		break;
+	};
+	srcu_read_unlock(&nodes_srcu, idx);
+}
+
 void dlm_midcomms_unack_msg_resend(int nodeid)
 {
 	struct midcomms_node *node;
-- 
2.27.0

