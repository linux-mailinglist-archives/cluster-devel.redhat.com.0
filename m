Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 173CD668693
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Jan 2023 23:11:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673561466;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Zrv3Cpf3PC4JC4IQVUQ24d/+11YjpOhvE0jh+Ejw0S8=;
	b=Rfh6LRluDM2oLOf+FDxH2X7MKj89aA8PMoxSfeQ9FYxLpVU5z4LDIP9885iXLnjL5tCpA3
	6eQOa6GVM3B+B1hgbM5HiQ4BDL0yD8Wmew+30uhAq94m9EBo8dZjEqAkARR+j5BT05Q+Hw
	zVMozJD6Zi+eBwXkrh82NikoVUaimJU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-oeHnsl78NHSk3xUSnVBPcA-1; Thu, 12 Jan 2023 17:11:00 -0500
X-MC-Unique: oeHnsl78NHSk3xUSnVBPcA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 071523813F3B;
	Thu, 12 Jan 2023 22:11:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12A8B39DB3;
	Thu, 12 Jan 2023 22:10:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AF5451947061;
	Thu, 12 Jan 2023 22:10:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 869B61947051 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 22:10:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6A558112131E; Thu, 12 Jan 2023 22:10:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 401661121314;
 Thu, 12 Jan 2023 22:10:57 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 12 Jan 2023 17:10:36 -0500
Message-Id: <20230112221037.1882548-6-aahringo@redhat.com>
In-Reply-To: <20230112221037.1882548-1-aahringo@redhat.com>
References: <20230112221037.1882548-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH dlm/next 6/7] fs: dlm: move sending fin
 message into state change handling
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch moves the send fin handling which should appear in a specific
state change into the state change handling while the per node
state_lock is held. I expierenced issues when other messages because
we changed the state and a fin message was send out in a different state.

Cc: stable@vger.kernel.org
Fixes: 489d8e559c65 ("fs: dlm: add reliable connection if reconnect")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 33 +++++++++------------------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 1fef99214204..fd9f413cabcd 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -402,7 +402,7 @@ static int dlm_send_fin(struct midcomms_node *node,
 	struct dlm_mhandle *mh;
 	char *ppc;
 
-	mh = dlm_midcomms_get_mhandle(node->nodeid, mb_len, GFP_NOFS, &ppc);
+	mh = dlm_midcomms_get_mhandle(node->nodeid, mb_len, GFP_ATOMIC, &ppc);
 	if (!mh)
 		return -ENOMEM;
 
@@ -518,8 +518,8 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 					node->state = DLM_LAST_ACK;
 					pr_debug("switch node %d to state %s case 1\n",
 						 node->nodeid, dlm_state_str(node->state));
-					spin_unlock(&node->state_lock);
-					goto send_fin;
+					set_bit(DLM_NODE_FLAG_STOP_RX, &node->flags);
+					dlm_send_fin(node, dlm_pas_fin_ack_rcv);
 				}
 				break;
 			case DLM_FIN_WAIT1:
@@ -563,12 +563,6 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 		log_print_ratelimited("ignore dlm msg because seq mismatch, seq: %u, expected: %u, nodeid: %d",
 				      seq, node->seq_next, node->nodeid);
 	}
-
-	return;
-
-send_fin:
-	set_bit(DLM_NODE_FLAG_STOP_RX, &node->flags);
-	dlm_send_fin(node, dlm_pas_fin_ack_rcv);
 }
 
 static struct midcomms_node *
@@ -1368,11 +1362,11 @@ void dlm_midcomms_remove_member(int nodeid)
 		case DLM_CLOSE_WAIT:
 			/* passive shutdown DLM_LAST_ACK case 2 */
 			node->state = DLM_LAST_ACK;
-			spin_unlock(&node->state_lock);
-
 			pr_debug("switch node %d to state %s case 2\n",
 				 node->nodeid, dlm_state_str(node->state));
-			goto send_fin;
+			set_bit(DLM_NODE_FLAG_STOP_RX, &node->flags);
+			dlm_send_fin(node, dlm_pas_fin_ack_rcv);
+			break;
 		case DLM_LAST_ACK:
 			/* probably receive fin caught it, do nothing */
 			break;
@@ -1388,12 +1382,6 @@ void dlm_midcomms_remove_member(int nodeid)
 	spin_unlock(&node->state_lock);
 
 	srcu_read_unlock(&nodes_srcu, idx);
-	return;
-
-send_fin:
-	set_bit(DLM_NODE_FLAG_STOP_RX, &node->flags);
-	dlm_send_fin(node, dlm_pas_fin_ack_rcv);
-	srcu_read_unlock(&nodes_srcu, idx);
 }
 
 static void midcomms_node_release(struct rcu_head *rcu)
@@ -1425,6 +1413,7 @@ static void midcomms_shutdown(struct midcomms_node *node)
 		node->state = DLM_FIN_WAIT1;
 		pr_debug("switch node %d to state %s case 2\n",
 			 node->nodeid, dlm_state_str(node->state));
+		dlm_send_fin(node, dlm_act_fin_ack_rcv);
 		break;
 	case DLM_CLOSED:
 		/* we have what we want */
@@ -1438,12 +1427,8 @@ static void midcomms_shutdown(struct midcomms_node *node)
 	}
 	spin_unlock(&node->state_lock);
 
-	if (node->state == DLM_FIN_WAIT1) {
-		dlm_send_fin(node, dlm_act_fin_ack_rcv);
-
-		if (DLM_DEBUG_FENCE_TERMINATION)
-			msleep(5000);
-	}
+	if (DLM_DEBUG_FENCE_TERMINATION)
+		msleep(5000);
 
 	/* wait for other side dlm + fin */
 	ret = wait_event_timeout(node->shutdown_wait,
-- 
2.31.1

