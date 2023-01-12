Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4375C668692
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Jan 2023 23:11:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673561465;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hh8VI5GRuqAAiw1BB0CJ46qCuKlgxt4vyg96XgbpWLY=;
	b=O8R3OSdCCM4y0VfOkU0urswNhuchRRPNM8pJAUVEF+S3P3R1Qf0UqXtlJPrM2DieQOB6tA
	Ic1OUUVPK6WGX+SGu+o8YpJy9fIfNsh/asNqvp3Dt5oqGa7ptD4Muk19sN9o3Lh02g8tQi
	nTekuIc/45LbVUMw205UdODhrN/yvuc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-TFyx-q39Mrm2QtIaCG5fTw-1; Thu, 12 Jan 2023 17:11:00 -0500
X-MC-Unique: TFyx-q39Mrm2QtIaCG5fTw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 063D11869B74;
	Thu, 12 Jan 2023 22:11:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7C5B2026D68;
	Thu, 12 Jan 2023 22:10:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8DCD71947051;
	Thu, 12 Jan 2023 22:10:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B6BD71947051 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 22:10:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 994701121318; Thu, 12 Jan 2023 22:10:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F5D61121319;
 Thu, 12 Jan 2023 22:10:57 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 12 Jan 2023 17:10:37 -0500
Message-Id: <20230112221037.1882548-7-aahringo@redhat.com>
In-Reply-To: <20230112221037.1882548-1-aahringo@redhat.com>
References: <20230112221037.1882548-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH dlm/next 7/7] fs: dlm: send FIN ack back in
 right cases
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch moves to send a ack back for receiving a FIN message only
when we are in valid states. In other cases and there might be a sender
waiting for a ack we just let it timeout at the senders time and
hopefully all other cleanups will remove the FIN message on their
sending queue. As an example we should never send out an ACK being in
LAST_ACK state or we cannot assume a working socket communication when
we are in CLOSED state.

Cc: stable@vger.kernel.org
Fixes: 489d8e559c65 ("fs: dlm: add reliable connection if reconnect")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index fd9f413cabcd..ecfb3beb0bb8 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -375,7 +375,7 @@ static int dlm_send_ack(int nodeid, uint32_t seq)
 	struct dlm_msg *msg;
 	char *ppc;
 
-	msg = dlm_lowcomms_new_msg(nodeid, mb_len, GFP_NOFS, &ppc,
+	msg = dlm_lowcomms_new_msg(nodeid, mb_len, GFP_ATOMIC, &ppc,
 				   NULL, NULL);
 	if (!msg)
 		return -ENOMEM;
@@ -498,15 +498,14 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 
 		switch (p->header.h_cmd) {
 		case DLM_FIN:
-			/* send ack before fin */
-			dlm_send_ack(node->nodeid, node->seq_next);
-
 			spin_lock(&node->state_lock);
 			pr_debug("receive fin msg from node %d with state %s\n",
 				 node->nodeid, dlm_state_str(node->state));
 
 			switch (node->state) {
 			case DLM_ESTABLISHED:
+				dlm_send_ack(node->nodeid, node->seq_next);
+
 				node->state = DLM_CLOSE_WAIT;
 				pr_debug("switch node %d to state %s\n",
 					 node->nodeid, dlm_state_str(node->state));
@@ -523,12 +522,14 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 				}
 				break;
 			case DLM_FIN_WAIT1:
+				dlm_send_ack(node->nodeid, node->seq_next);
 				node->state = DLM_CLOSING;
 				set_bit(DLM_NODE_FLAG_STOP_RX, &node->flags);
 				pr_debug("switch node %d to state %s\n",
 					 node->nodeid, dlm_state_str(node->state));
 				break;
 			case DLM_FIN_WAIT2:
+				dlm_send_ack(node->nodeid, node->seq_next);
 				midcomms_node_reset(node);
 				pr_debug("switch node %d to state %s\n",
 					 node->nodeid, dlm_state_str(node->state));
-- 
2.31.1

