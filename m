Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 67382610316
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Oct 2022 22:46:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666903567;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pmRTOmXdW4fpA0EnHjWTcpUAbx8cwX2MZSO2/iGcvac=;
	b=Nr/X0CV5eBtu+ZXGLcFKvC3LaLOqjUC/Sav1v/YqYUtQzSSwkVoc4h/3Bk//RnX597q0rg
	aPR2GPKGueMKXl8oYynliSJpTxiWYZUrxmAKYNd2c2Yl8601tj0bIcQ5ae0CE+zFYDGHwh
	CXqlKLfSsInF3pL34/SgRio4HOl364Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-6_6qZG51MF2vaeou8R51Tg-1; Thu, 27 Oct 2022 16:46:05 -0400
X-MC-Unique: 6_6qZG51MF2vaeou8R51Tg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 705BC18E004A;
	Thu, 27 Oct 2022 20:45:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9ECF42166B2B;
	Thu, 27 Oct 2022 20:45:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 181A31947B80;
	Thu, 27 Oct 2022 20:45:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3D5B8194706A for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 20:45:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 54BBB112C265; Thu, 27 Oct 2022 20:45:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30CCE1121325;
 Thu, 27 Oct 2022 20:45:38 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Oct 2022 16:45:27 -0400
Message-Id: <20221027204528.1119036-17-aahringo@redhat.com>
In-Reply-To: <20221027204528.1119036-1-aahringo@redhat.com>
References: <20221027204528.1119036-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v6.1-rc1 17/18] fs: dlm: use WARN_ON_ONCE()
 instead of WARN_ON()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

To not get the console spammed about WARN_ON() of invalid states in the
dlm midcomms hot path handling we switch to WARN_ON_ONCE() to get it
only once that there might be an issue with the midcomms state handling.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 3a4e20d6cd2d..32194a750fe1 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -469,7 +469,7 @@ static void dlm_pas_fin_ack_rcv(struct midcomms_node *node)
 		spin_unlock(&node->state_lock);
 		log_print("%s: unexpected state: %d\n",
 			  __func__, node->state);
-		WARN_ON(1);
+		WARN_ON_ONCE(1);
 		return;
 	}
 	spin_unlock(&node->state_lock);
@@ -540,7 +540,7 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 				spin_unlock(&node->state_lock);
 				log_print("%s: unexpected state: %d\n",
 					  __func__, node->state);
-				WARN_ON(1);
+				WARN_ON_ONCE(1);
 				return;
 			}
 			spin_unlock(&node->state_lock);
@@ -548,7 +548,7 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 			set_bit(DLM_NODE_FLAG_STOP_RX, &node->flags);
 			break;
 		default:
-			WARN_ON(test_bit(DLM_NODE_FLAG_STOP_RX, &node->flags));
+			WARN_ON_ONCE(test_bit(DLM_NODE_FLAG_STOP_RX, &node->flags));
 			dlm_receive_buffer_3_2_trace(seq, p);
 			dlm_receive_buffer(p, node->nodeid);
 			set_bit(DLM_NODE_ULP_DELIVERED, &node->flags);
@@ -770,7 +770,7 @@ static void dlm_midcomms_receive_buffer_3_2(union dlm_packet *p, int nodeid)
 			goto out;
 		}
 
-		WARN_ON(test_bit(DLM_NODE_FLAG_STOP_RX, &node->flags));
+		WARN_ON_ONCE(test_bit(DLM_NODE_FLAG_STOP_RX, &node->flags));
 		dlm_receive_buffer(p, nodeid);
 		break;
 	case DLM_OPTS:
@@ -1095,7 +1095,7 @@ struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 	}
 
 	/* this is a bug, however we going on and hope it will be resolved */
-	WARN_ON(test_bit(DLM_NODE_FLAG_STOP_TX, &node->flags));
+	WARN_ON_ONCE(test_bit(DLM_NODE_FLAG_STOP_TX, &node->flags));
 
 	mh = dlm_allocate_mhandle(allocation);
 	if (!mh)
@@ -1127,7 +1127,7 @@ struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 		break;
 	default:
 		dlm_free_mhandle(mh);
-		WARN_ON(1);
+		WARN_ON_ONCE(1);
 		goto err;
 	}
 
@@ -1196,7 +1196,7 @@ void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh,
 		break;
 	default:
 		srcu_read_unlock(&nodes_srcu, mh->idx);
-		WARN_ON(1);
+		WARN_ON_ONCE(1);
 		break;
 	}
 }
@@ -1238,7 +1238,7 @@ static void dlm_act_fin_ack_rcv(struct midcomms_node *node)
 		spin_unlock(&node->state_lock);
 		log_print("%s: unexpected state: %d\n",
 			  __func__, node->state);
-		WARN_ON(1);
+		WARN_ON_ONCE(1);
 		return;
 	}
 	spin_unlock(&node->state_lock);
@@ -1356,7 +1356,7 @@ static void midcomms_node_release(struct rcu_head *rcu)
 {
 	struct midcomms_node *node = container_of(rcu, struct midcomms_node, rcu);
 
-	WARN_ON(atomic_read(&node->send_queue_cnt));
+	WARN_ON_ONCE(atomic_read(&node->send_queue_cnt));
 	kfree(node);
 }
 
-- 
2.31.1

