Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 044D2715107
	for <lists+cluster-devel@lfdr.de>; Mon, 29 May 2023 23:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685396692;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Nv08xgO9Cl6b7CjcVIPODV6gaQWnaxVmpN+4BfFPnME=;
	b=Z7C743z9t28mrhdUzCq3nwmtaeI9TjLPLrCh0eL7D9c0EncyKpC+UkplcsHoDH2NHRjdBp
	8ZflY5n+i+qtYsk/VVk4oPdnYU1L4HEpLFg+MwjKvFSIc6mH/K3rLeYkW+JrRpWAKEbqLQ
	k6E1TJ0QEC7XfXq3XN322JZQuVC78FE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-X0G2RXWOOUucLnSNGS_t1A-1; Mon, 29 May 2023 17:44:48 -0400
X-MC-Unique: X0G2RXWOOUucLnSNGS_t1A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B55A11019C9F;
	Mon, 29 May 2023 21:44:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AAEA9140E955;
	Mon, 29 May 2023 21:44:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8FC6D19465B6;
	Mon, 29 May 2023 21:44:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E81CF1946595 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 29 May 2023 21:44:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DBBF52166B30; Mon, 29 May 2023 21:44:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B10D52166B2B;
 Mon, 29 May 2023 21:44:43 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 29 May 2023 17:44:39 -0400
Message-Id: <20230529214440.2542721-11-aahringo@redhat.com>
In-Reply-To: <20230529214440.2542721-1-aahringo@redhat.com>
References: <20230529214440.2542721-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 11/12] fs: dlm: handle sequence
 numbers as atomic
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Currently seq_next is only be read on the receive side which processed
in an ordered way. The seq_send is being protected by locks. To being
able to read the seq_next value on send side as well we convert it to an
atomic_t value. The atomic_cmpxchg() is probably not necessary, however
the atomic_inc() depends on a if coniditional and this should be handled
in an atomic context.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 9c66cb853d17..70286737eb0a 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -152,8 +152,8 @@
 struct midcomms_node {
 	int nodeid;
 	uint32_t version;
-	uint32_t seq_send;
-	uint32_t seq_next;
+	atomic_t seq_send;
+	atomic_t seq_next;
 	/* These queues are unbound because we cannot drop any message in dlm.
 	 * We could send a fence signal for a specific node to the cluster
 	 * manager if queues hits some maximum value, however this handling
@@ -317,8 +317,8 @@ static void midcomms_node_reset(struct midcomms_node *node)
 {
 	pr_debug("reset node %d\n", node->nodeid);
 
-	node->seq_next = DLM_SEQ_INIT;
-	node->seq_send = DLM_SEQ_INIT;
+	atomic_set(&node->seq_next, DLM_SEQ_INIT);
+	atomic_set(&node->seq_send, DLM_SEQ_INIT);
 	node->version = DLM_VERSION_NOT_SET;
 	node->flags = 0;
 
@@ -492,9 +492,19 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 					struct midcomms_node *node,
 					uint32_t seq)
 {
-	if (seq == node->seq_next) {
-		node->seq_next++;
+	bool is_expected_seq;
+	uint32_t oval, nval;
 
+	do {
+		oval = atomic_read(&node->seq_next);
+		is_expected_seq = (oval == seq);
+		if (!is_expected_seq)
+			break;
+
+		nval = oval + 1;
+	} while (atomic_cmpxchg(&node->seq_next, oval, nval) != oval);
+
+	if (is_expected_seq) {
 		switch (p->header.h_cmd) {
 		case DLM_FIN:
 			spin_lock(&node->state_lock);
@@ -503,7 +513,7 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 
 			switch (node->state) {
 			case DLM_ESTABLISHED:
-				dlm_send_ack(node->nodeid, node->seq_next);
+				dlm_send_ack(node->nodeid, nval);
 
 				/* passive shutdown DLM_LAST_ACK case 1
 				 * additional we check if the node is used by
@@ -522,14 +532,14 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 				}
 				break;
 			case DLM_FIN_WAIT1:
-				dlm_send_ack(node->nodeid, node->seq_next);
+				dlm_send_ack(node->nodeid, nval);
 				node->state = DLM_CLOSING;
 				set_bit(DLM_NODE_FLAG_STOP_RX, &node->flags);
 				pr_debug("switch node %d to state %s\n",
 					 node->nodeid, dlm_state_str(node->state));
 				break;
 			case DLM_FIN_WAIT2:
-				dlm_send_ack(node->nodeid, node->seq_next);
+				dlm_send_ack(node->nodeid, nval);
 				midcomms_node_reset(node);
 				pr_debug("switch node %d to state %s\n",
 					 node->nodeid, dlm_state_str(node->state));
@@ -557,11 +567,11 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 		/* retry to ack message which we already have by sending back
 		 * current node->seq_next number as ack.
 		 */
-		if (seq < node->seq_next)
-			dlm_send_ack(node->nodeid, node->seq_next);
+		if (seq < oval)
+			dlm_send_ack(node->nodeid, oval);
 
 		log_print_ratelimited("ignore dlm msg because seq mismatch, seq: %u, expected: %u, nodeid: %d",
-				      seq, node->seq_next, node->nodeid);
+				      seq, oval, node->nodeid);
 	}
 }
 
@@ -992,7 +1002,7 @@ void dlm_midcomms_receive_done(int nodeid)
 	switch (node->state) {
 	case DLM_ESTABLISHED:
 		spin_unlock(&node->state_lock);
-		dlm_send_ack(node->nodeid, node->seq_next);
+		dlm_send_ack(node->nodeid, atomic_read(&node->seq_next));
 		break;
 	default:
 		spin_unlock(&node->state_lock);
@@ -1058,7 +1068,7 @@ static void midcomms_new_msg_cb(void *data)
 	list_add_tail_rcu(&mh->list, &mh->node->send_queue);
 	spin_unlock_bh(&mh->node->send_queue_lock);
 
-	mh->seq = mh->node->seq_send++;
+	mh->seq = atomic_fetch_inc(&mh->node->seq_send);
 }
 
 static struct dlm_msg *dlm_midcomms_get_msg_3_2(struct dlm_mhandle *mh, int nodeid,
@@ -1530,7 +1540,7 @@ static void midcomms_new_rawmsg_cb(void *data)
 		switch (h->h_cmd) {
 		case DLM_OPTS:
 			if (!h->u.h_seq)
-				h->u.h_seq = cpu_to_le32(rd->node->seq_send++);
+				h->u.h_seq = cpu_to_le32(atomic_fetch_inc(&rd->node->seq_send));
 			break;
 		default:
 			break;
-- 
2.31.1

