Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 240E33A4715
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Jun 2021 18:56:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623430574;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rAEBbgnsYv8n+mcNLapbLLcOwYZmoXFIIWVpOhQPe4A=;
	b=Otg4sOWYNz1u5o8fIbM2FK6e6MmNqFWkoPuIN5pJ0OMza59V2wYxps7tgghcvhZ1If75vi
	K/Il7NHEMDQ6nC9Z+3L5MyUxLbfTWy0rJvgdTfh5YcQdxNZZBKF6/U57w7K0CDMTqoZ9/+
	+h1QCOGP7+s9X7ahBfLmmnDBZ5RWVgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-lOk0a2V-OFqpT992RfuLPg-1; Fri, 11 Jun 2021 12:56:13 -0400
X-MC-Unique: lOk0a2V-OFqpT992RfuLPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3625FCA4;
	Fri, 11 Jun 2021 16:56:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E0FF5D9E2;
	Fri, 11 Jun 2021 16:56:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 292FE1809CAD;
	Fri, 11 Jun 2021 16:56:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15BGu7jP020537 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Jun 2021 12:56:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6ACA25D9F0; Fri, 11 Jun 2021 16:56:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-112-77.rdu2.redhat.com [10.10.112.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF8C15D9C6;
	Fri, 11 Jun 2021 16:56:03 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 11 Jun 2021 12:55:40 -0400
Message-Id: <20210611165541.377603-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 1/2] fs: dlm: fix race in mhandle
	deletion
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

This patch fixes a race between mhandle deletion in case of receiving an
acknowledge and flush of all pending mhandle in cases of an timeout or
resetting node states.

Fixes: 489d8e559c65 ("fs: dlm: add reliable connection if reconnect")
Reported-by: Guillaume Nault <gnault@redhat.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 7d217234b697..92f95ee7003a 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -287,6 +287,14 @@ static void dlm_mhandle_release(struct rcu_head *rcu)
 	kfree(mh);
 }
 
+static void dlm_mhandle_delete(struct midcomms_node *node,
+			       struct dlm_mhandle *mh)
+{
+	list_del_rcu(&mh->list);
+	atomic_dec(&node->send_queue_cnt);
+	call_rcu(&mh->rcu, dlm_mhandle_release);
+}
+
 static void dlm_send_queue_flush(struct midcomms_node *node)
 {
 	struct dlm_mhandle *mh;
@@ -294,15 +302,11 @@ static void dlm_send_queue_flush(struct midcomms_node *node)
 	pr_debug("flush midcomms send queue of node %d\n", node->nodeid);
 
 	rcu_read_lock();
+	spin_lock(&node->send_queue_lock);
 	list_for_each_entry_rcu(mh, &node->send_queue, list) {
-		spin_lock(&node->send_queue_lock);
-		list_del_rcu(&mh->list);
-		spin_unlock(&node->send_queue_lock);
-
-		atomic_dec(&node->send_queue_cnt);
-
-		call_rcu(&mh->rcu, dlm_mhandle_release);
+		dlm_mhandle_delete(node, mh);
 	}
+	spin_unlock(&node->send_queue_lock);
 	rcu_read_unlock();
 }
 
@@ -424,21 +428,24 @@ static void dlm_receive_ack(struct midcomms_node *node, uint32_t seq)
 	rcu_read_lock();
 	list_for_each_entry_rcu(mh, &node->send_queue, list) {
 		if (before(mh->seq, seq)) {
-			spin_lock(&node->send_queue_lock);
-			list_del_rcu(&mh->list);
-			spin_unlock(&node->send_queue_lock);
-
-			atomic_dec(&node->send_queue_cnt);
-
 			if (mh->ack_rcv)
 				mh->ack_rcv(node);
+		} else {
+			/* send queue should be ordered */
+			break;
+		}
+	}
 
-			call_rcu(&mh->rcu, dlm_mhandle_release);
+	spin_lock(&node->send_queue_lock);
+	list_for_each_entry_rcu(mh, &node->send_queue, list) {
+		if (before(mh->seq, seq)) {
+			dlm_mhandle_delete(node, mh);
 		} else {
 			/* send queue should be ordered */
 			break;
 		}
 	}
+	spin_unlock(&node->send_queue_lock);
 	rcu_read_unlock();
 }
 
-- 
2.26.3

