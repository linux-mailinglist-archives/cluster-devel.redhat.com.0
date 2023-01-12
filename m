Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D71576686BA
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Jan 2023 23:19:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673561959;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zenschioBbPRvrox3D0Mvz9mE97HzS68MxT9B5mCQfA=;
	b=JFLHVmcT4y7KTaiJl170RQOYX6FEgzSTOug6JKnGRRlUkL5+j615xJMRrk38CpJMGRG0m5
	0EKeg9HvXOTtfhcrBYtasn5DTvhjhPL+CvqTK/YJR4dTbWA72cQcytS6ggk0uIgXyamERa
	RmYRFKmWxs2EFYev/jGweNCrb31ctE0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-OcRXnE7PM5KdVj4IJxAr4g-1; Thu, 12 Jan 2023 17:19:12 -0500
X-MC-Unique: OcRXnE7PM5KdVj4IJxAr4g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB0888828EF;
	Thu, 12 Jan 2023 22:19:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF497492C14;
	Thu, 12 Jan 2023 22:19:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 58F211947056;
	Thu, 12 Jan 2023 22:19:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 23FE11947054 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 22:18:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 65BC640C2005; Thu, 12 Jan 2023 22:18:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40EED40C2064;
 Thu, 12 Jan 2023 22:18:52 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 12 Jan 2023 17:18:42 -0500
Message-Id: <20230112221849.1883104-2-aahringo@redhat.com>
In-Reply-To: <20230112221849.1883104-1-aahringo@redhat.com>
References: <20230112221849.1883104-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH dlm/next 1/8] fs: dlm: bring back previously
 shutdown handling
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch mostly reverts commit 4f567acb0b86 ("fs: dlm: remove socket
shutdown handling"). There can be situations where the dlm midcomms nodes
hash and lowcomms connection hash are not equal, but we need to guarantee
that the lowcomms are all closed on a last release of a dlm lockspace,
means a shutdown is invoked. This patch will guarantee that we always
close all sockets managed by the lowcomms connection hash and calls
shutdown for the last sending dlm message to be sure we don't cut the
socket and the peer potential gets a connection reset.

In future we should try to merge the midcomms/lowcomms hashes into one
hash and don't handle both in separate hashes.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 77 ++++++++++++++++++++++++++++++++++-------------
 fs/dlm/midcomms.c | 20 +++++-------
 2 files changed, 63 insertions(+), 34 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 4450721ec83c..61cd6c2628fa 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -61,6 +61,7 @@
 #include "memory.h"
 #include "config.h"
 
+#define DLM_SHUTDOWN_WAIT_TIMEOUT msecs_to_jiffies(5000)
 #define NEEDED_RMEM (4*1024*1024)
 
 struct connection {
@@ -99,6 +100,7 @@ struct connection {
 	struct connection *othercon;
 	struct work_struct rwork; /* receive worker */
 	struct work_struct swork; /* send worker */
+	wait_queue_head_t shutdown_wait;
 	unsigned char rx_leftover_buf[DLM_MAX_SOCKET_BUFSIZE];
 	int rx_leftover;
 	int mark;
@@ -282,6 +284,7 @@ static void dlm_con_init(struct connection *con, int nodeid)
 	INIT_WORK(&con->swork, process_send_sockets);
 	INIT_WORK(&con->rwork, process_recv_sockets);
 	spin_lock_init(&con->addrs_lock);
+	init_waitqueue_head(&con->shutdown_wait);
 }
 
 /*
@@ -790,6 +793,43 @@ static void close_connection(struct connection *con, bool and_other)
 	up_write(&con->sock_lock);
 }
 
+static void shutdown_connection(struct connection *con, bool and_other)
+{
+	int ret;
+
+	if (con->othercon && and_other)
+		shutdown_connection(con->othercon, false);
+
+	flush_workqueue(io_workqueue);
+	down_read(&con->sock_lock);
+	/* nothing to shutdown */
+	if (!con->sock) {
+		up_read(&con->sock_lock);
+		return;
+	}
+
+	ret = kernel_sock_shutdown(con->sock, SHUT_WR);
+	up_read(&con->sock_lock);
+	if (ret) {
+		log_print("Connection %p failed to shutdown: %d will force close",
+			  con, ret);
+		goto force_close;
+	} else {
+		ret = wait_event_timeout(con->shutdown_wait, !con->sock,
+					 DLM_SHUTDOWN_WAIT_TIMEOUT);
+		if (ret == 0) {
+			log_print("Connection %p shutdown timed out, will force close",
+				  con);
+			goto force_close;
+		}
+	}
+
+	return;
+
+force_close:
+	close_connection(con, false);
+}
+
 static struct processqueue_entry *new_processqueue_entry(int nodeid,
 							 int buflen)
 {
@@ -1488,6 +1528,7 @@ static void process_recv_sockets(struct work_struct *work)
 		break;
 	case DLM_IO_EOF:
 		close_connection(con, false);
+		wake_up(&con->shutdown_wait);
 		/* CF_RECV_PENDING cleared */
 		break;
 	case DLM_IO_RESCHED:
@@ -1695,6 +1736,9 @@ static int work_start(void)
 
 void dlm_lowcomms_shutdown(void)
 {
+	struct connection *con;
+	int i, idx;
+
 	/* stop lowcomms_listen_data_ready calls */
 	lock_sock(listen_con.sock->sk);
 	listen_con.sock->sk->sk_data_ready = listen_sock.sk_data_ready;
@@ -1703,29 +1747,20 @@ void dlm_lowcomms_shutdown(void)
 	cancel_work_sync(&listen_con.rwork);
 	dlm_close_sock(&listen_con.sock);
 
-	flush_workqueue(process_workqueue);
-}
-
-void dlm_lowcomms_shutdown_node(int nodeid, bool force)
-{
-	struct connection *con;
-	int idx;
-
 	idx = srcu_read_lock(&connections_srcu);
-	con = nodeid2con(nodeid, 0);
-	if (WARN_ON_ONCE(!con)) {
-		srcu_read_unlock(&connections_srcu, idx);
-		return;
-	}
+	for (i = 0; i < CONN_HASH_SIZE; i++) {
+		hlist_for_each_entry_rcu(con, &connection_hash[i], list) {
+			shutdown_connection(con, true);
+			stop_connection_io(con);
+			flush_workqueue(process_workqueue);
+			close_connection(con, true);
 
-	flush_work(&con->swork);
-	stop_connection_io(con);
-	WARN_ON_ONCE(!force && !list_empty(&con->writequeue));
-	close_connection(con, true);
-	clean_one_writequeue(con);
-	if (con->othercon)
-		clean_one_writequeue(con->othercon);
-	allow_connection_io(con);
+			clean_one_writequeue(con);
+			if (con->othercon)
+				clean_one_writequeue(con->othercon);
+			allow_connection_io(con);
+		}
+	}
 	srcu_read_unlock(&connections_srcu, idx);
 }
 
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index ecfb3beb0bb8..ecd81018d1cf 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -1418,8 +1418,7 @@ static void midcomms_shutdown(struct midcomms_node *node)
 		break;
 	case DLM_CLOSED:
 		/* we have what we want */
-		spin_unlock(&node->state_lock);
-		return;
+		break;
 	default:
 		/* busy to enter DLM_FIN_WAIT1, wait until passive
 		 * done in shutdown_wait to enter DLM_CLOSED.
@@ -1436,17 +1435,12 @@ static void midcomms_shutdown(struct midcomms_node *node)
 				 node->state == DLM_CLOSED ||
 				 test_bit(DLM_NODE_FLAG_CLOSE, &node->flags),
 				 DLM_SHUTDOWN_TIMEOUT);
-	if (!ret || test_bit(DLM_NODE_FLAG_CLOSE, &node->flags)) {
+	if (!ret || test_bit(DLM_NODE_FLAG_CLOSE, &node->flags))
 		pr_debug("active shutdown timed out for node %d with state %s\n",
 			 node->nodeid, dlm_state_str(node->state));
-		midcomms_node_reset(node);
-		dlm_lowcomms_shutdown_node(node->nodeid, true);
-		return;
-	}
-
-	pr_debug("active shutdown done for node %d with state %s\n",
-		 node->nodeid, dlm_state_str(node->state));
-	dlm_lowcomms_shutdown_node(node->nodeid, false);
+	else
+		pr_debug("active shutdown done for node %d with state %s\n",
+			 node->nodeid, dlm_state_str(node->state));
 }
 
 void dlm_midcomms_shutdown(void)
@@ -1454,8 +1448,6 @@ void dlm_midcomms_shutdown(void)
 	struct midcomms_node *node;
 	int i, idx;
 
-	dlm_lowcomms_shutdown();
-
 	mutex_lock(&close_lock);
 	idx = srcu_read_lock(&nodes_srcu);
 	for (i = 0; i < CONN_HASH_SIZE; i++) {
@@ -1473,6 +1465,8 @@ void dlm_midcomms_shutdown(void)
 	}
 	srcu_read_unlock(&nodes_srcu, idx);
 	mutex_unlock(&close_lock);
+
+	dlm_lowcomms_shutdown();
 }
 
 int dlm_midcomms_close(int nodeid)
-- 
2.31.1

