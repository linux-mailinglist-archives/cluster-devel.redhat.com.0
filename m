Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7C36686B7
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Jan 2023 23:19:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673561958;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OXcHOINBebV5Q5JUhedzCcPXRr1Dg1dxFJSIT+Y2Uqo=;
	b=F5VsxaMs2vwnnlqTujfoAn/BkyrDMqYxF7e8Vn/IozjcV/bQiVJBDlFlD2cqz0rufbOA23
	xqQyEE/KG1aVA4C42eAYMPiA2oTMAikNsoRs17NvjLZYPd/2cAmiYrB3yAR/Q5gy+4u2A7
	HAuRicn5Jgs39ZW1cBRUpATCzGV1e+8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-IkGO13RfN9m3KHaIZOkwUA-1; Thu, 12 Jan 2023 17:19:13 -0500
X-MC-Unique: IkGO13RfN9m3KHaIZOkwUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18B76183B3D8;
	Thu, 12 Jan 2023 22:19:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C1AA1415126;
	Thu, 12 Jan 2023 22:19:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 79D9E1947064;
	Thu, 12 Jan 2023 22:19:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3E482194704F for <cluster-devel@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 22:19:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 72B8540C200C; Thu, 12 Jan 2023 22:18:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DA3640C2064;
 Thu, 12 Jan 2023 22:18:53 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 12 Jan 2023 17:18:48 -0500
Message-Id: <20230112221849.1883104-8-aahringo@redhat.com>
In-Reply-To: <20230112221849.1883104-1-aahringo@redhat.com>
References: <20230112221849.1883104-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH dlm/next 7/8] fs: dlm: move state change
 into else branch
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Currently we can switch at first into DLM_CLOSE_WAIT state and then do
another state change if a condition is true. Instead of doing two state
changes we handle the other state change inside an else branch of this
condition.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index b5720042ef9d..2a9177f3d468 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -506,9 +506,6 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 			case DLM_ESTABLISHED:
 				dlm_send_ack(node->nodeid, node->seq_next);
 
-				node->state = DLM_CLOSE_WAIT;
-				pr_debug("switch node %d to state %s\n",
-					 node->nodeid, dlm_state_str(node->state));
 				/* passive shutdown DLM_LAST_ACK case 1
 				 * additional we check if the node is used by
 				 * cluster manager events at all.
@@ -519,6 +516,10 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 						 node->nodeid, dlm_state_str(node->state));
 					set_bit(DLM_NODE_FLAG_STOP_RX, &node->flags);
 					dlm_send_fin(node, dlm_pas_fin_ack_rcv);
+				} else {
+					node->state = DLM_CLOSE_WAIT;
+					pr_debug("switch node %d to state %s\n",
+						 node->nodeid, dlm_state_str(node->state));
 				}
 				break;
 			case DLM_FIN_WAIT1:
-- 
2.31.1

