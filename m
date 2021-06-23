Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A7BCC3B1D6F
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Jun 2021 17:15:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624461347;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pfMfsxWGElqD71fR2Ff3JZNlcs1/NaLnlylKPT9mKMQ=;
	b=QqjdTuwvXe4Fgb3DWnAuzrEOB9SR6nMF6p0dWDxaexdFeUxQw9FNcD0PRxH8TjTaRMDOzV
	xr3Q5CorMrRzmNBybJB2sqJ5oFLTmqyrVOlXktz7OQ0taVNkvtmnTpfHeF9QR5+bNaQRKn
	XADrZGlvpsYrrTTniLetWF9wKL4ITVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-t6AMEa8QNkmt3OIOBEbmBw-1; Wed, 23 Jun 2021 11:15:46 -0400
X-MC-Unique: t6AMEa8QNkmt3OIOBEbmBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5263101F009;
	Wed, 23 Jun 2021 15:15:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4E3F10016F8;
	Wed, 23 Jun 2021 15:15:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 903CF4EA29;
	Wed, 23 Jun 2021 15:15:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15NFFfSE025008 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Jun 2021 11:15:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2ABD260C05; Wed, 23 Jun 2021 15:15:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (unknown [10.22.8.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFE6C60E1C;
	Wed, 23 Jun 2021 15:15:40 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Jun 2021 11:14:49 -0400
Message-Id: <20210623151454.176649-11-aahringo@redhat.com>
In-Reply-To: <20210623151454.176649-1-aahringo@redhat.com>
References: <20210623151454.176649-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC dlm/next 10/15] fs: dlm: introduce reconnect
	work
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will add another work to close the sockets which we cannot do
inside the lowcomms_error_report() handler. This patch will also close
the "othercon" sock if present.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 163 +++++++++++++++++++++++++---------------------
 1 file changed, 88 insertions(+), 75 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index d2febefe1d0d..a54ed3cf0b45 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -73,10 +73,8 @@ struct connection {
 #define CF_APP_LIMITED 3
 #define CF_SHUTDOWN 4
 #define CF_CONNECTED 5
-#define CF_RECONNECT 6
-#define CF_DELAY_CONNECT 7
-#define CF_EOF 8
-#define CF_STOP 9
+#define CF_EOF 6
+#define CF_STOP 7
 	struct list_head writequeue;  /* List of outgoing writequeue_entries */
 	spinlock_t writequeue_lock;
 	atomic_t writequeue_cnt;
@@ -89,7 +87,9 @@ struct connection {
 	struct mutex rwork_lock;
 	struct work_struct rwork;
 	struct mutex swork_lock;
-	struct work_struct swork;
+	struct delayed_work swork;
+	struct work_struct cwork;
+	int sk_err;
 	wait_queue_head_t shutdown_wait; /* wait for graceful shutdown */
 	unsigned char *rx_buf;
 	int rx_buflen;
@@ -184,6 +184,7 @@ DEFINE_STATIC_SRCU(connections_srcu);
 
 static const struct dlm_proto_ops *dlm_proto_ops;
 
+static void process_close_sockets(struct work_struct *work);
 static void process_recv_sockets(struct work_struct *work);
 static void process_send_sockets(struct work_struct *work);
 
@@ -208,6 +209,16 @@ static inline void dlm_io_queue(struct connection *con,
 	queue_work(io_workqueue, work);
 }
 
+static inline void dlm_io_delayed_queue(struct connection *con,
+					struct delayed_work *dwork,
+					unsigned long delay)
+{
+	if (test_bit(CF_STOP, &con->flags))
+		return;
+
+	queue_delayed_work(io_workqueue, dwork, delay);
+}
+
 static inline struct connection *dlm_sendcon(struct connection *con)
 {
 	if (test_bit(CF_IS_OTHERCON, &con->flags))
@@ -260,8 +271,9 @@ static int dlm_con_init(struct connection *con, int nodeid)
 	INIT_LIST_HEAD(&con->writequeue);
 	spin_lock_init(&con->writequeue_lock);
 	atomic_set(&con->writequeue_cnt, 0);
-	INIT_WORK(&con->swork, process_send_sockets);
+	INIT_DELAYED_WORK(&con->swork, process_send_sockets);
 	INIT_WORK(&con->rwork, process_recv_sockets);
+	INIT_WORK(&con->cwork, process_close_sockets);
 	init_waitqueue_head(&con->shutdown_wait);
 
 	return 0;
@@ -551,19 +563,10 @@ static void lowcomms_write_space(struct sock *sk)
 	}
 
 out:
-	dlm_io_queue(con, &con->swork);
+	dlm_io_delayed_queue(con, &con->swork, 0);
 	read_unlock_bh(&sk->sk_callback_lock);
 }
 
-static inline void lowcomms_connect_sock(struct connection *con)
-{
-	if (test_bit(CF_CLOSE, &con->flags))
-		return;
-
-	dlm_io_queue(con, &con->swork);
-	cond_resched();
-}
-
 static void lowcomms_state_change(struct sock *sk)
 {
 	/* SCTP layer is not calling sk_data_ready when the connection
@@ -579,27 +582,6 @@ static void lowcomms_state_change(struct sock *sk)
 	}
 }
 
-int dlm_lowcomms_connect_node(int nodeid)
-{
-	struct connection *con;
-	int idx;
-
-	if (nodeid == dlm_our_nodeid())
-		return 0;
-
-	idx = srcu_read_lock(&connections_srcu);
-	con = nodeid2con(nodeid, GFP_NOFS);
-	if (!con) {
-		srcu_read_unlock(&connections_srcu, idx);
-		return -ENOMEM;
-	}
-
-	lowcomms_connect_sock(con);
-	srcu_read_unlock(&connections_srcu, idx);
-
-	return 0;
-}
-
 int dlm_lowcomms_nodes_set_mark(int nodeid, unsigned int mark)
 {
 	struct dlm_node_addr *na;
@@ -659,20 +641,8 @@ static void lowcomms_error_report(struct sock *sk)
 				   sk->sk_err_soft);
 	}
 
-	/* below sendcon only handling */
-	if (test_bit(CF_IS_OTHERCON, &con->flags))
-		con = con->sendcon;
-
-	switch (sk->sk_err) {
-	case ECONNREFUSED:
-		set_bit(CF_DELAY_CONNECT, &con->flags);
-		break;
-	default:
-		break;
-	}
-
-	if (!test_and_set_bit(CF_RECONNECT, &con->flags))
-		dlm_io_queue(con, &con->swork);
+	con->sk_err = sk->sk_err;
+	dlm_io_queue(dlm_sendcon(con), &con->cwork);
 
 out:
 	read_unlock_bh(&sk->sk_callback_lock);
@@ -837,8 +807,6 @@ static void close_connection(struct connection *con, bool and_other)
 	con->retries = 0;
 	clear_bit(CF_APP_LIMITED, &con->flags);
 	clear_bit(CF_CONNECTED, &con->flags);
-	clear_bit(CF_DELAY_CONNECT, &con->flags);
-	clear_bit(CF_RECONNECT, &con->flags);
 	clear_bit(CF_EOF, &con->flags);
 
 	/* handling for tcp shutdown */
@@ -851,10 +819,13 @@ static void cancel_io_work(struct connection *con, bool and_other)
 	struct connection *sendcon = dlm_sendcon(con);
 
 	set_bit(CF_STOP, &sendcon->flags);
-	cancel_work_sync(&sendcon->swork);
 	cancel_work_sync(&sendcon->rwork);
-	if (sendcon->othercon && and_other)
+	cancel_work_sync(&sendcon->cwork);
+	cancel_delayed_work_sync(&sendcon->swork);
+	if (sendcon->othercon && and_other) {
 		cancel_work_sync(&sendcon->othercon->rwork);
+		cancel_work_sync(&sendcon->othercon->cwork);
+	}
 
 	dlm_con_lock(sendcon);
 	close_connection(con, and_other);
@@ -911,7 +882,7 @@ static void dlm_tcp_shutdown(struct connection *con)
 	}
 
 	/* flush all send */
-	flush_work(&con->swork);
+	flush_delayed_work(&con->swork);
 	shutdown_connection(con, con);
 }
 
@@ -1002,9 +973,10 @@ static void receive_from_sock(struct connection *con,
 	return;
 
 out_close:
-	if (!test_and_set_bit(CF_RECONNECT, &sendcon->flags))
-		dlm_io_queue(sendcon, &sendcon->swork);
-
+	dlm_con_lock(sendcon);
+	close_connection(con, false);
+	dlm_con_unlock(sendcon);
+	dlm_io_delayed_queue(sendcon, &sendcon->swork, 0);
 	return;
 
 out_eof:
@@ -1376,7 +1348,7 @@ static void _dlm_lowcomms_commit_msg(struct dlm_msg *msg)
 	e->len = DLM_WQ_LENGTH_BYTES(e);
 	spin_unlock(&con->writequeue_lock);
 
-	dlm_io_queue(con, &con->swork);
+	dlm_io_delayed_queue(con, &con->swork, 0);
 	return;
 
 out:
@@ -1430,7 +1402,7 @@ static void send_to_sock(struct connection *con)
 
 	mutex_lock(&con->swork_lock);
 	if (con->sock == NULL) {
-		dlm_io_queue(con, &con->swork);
+		dlm_io_delayed_queue(con, &con->swork, 0);
 		goto out;
 	}
 
@@ -1611,33 +1583,74 @@ static int dlm_connect(struct connection *con)
 	    result != -EPROTONOSUPPORT) {
 		log_print("connect %d try %d error %d", con->nodeid,
 			  con->retries, result);
-		msleep(1000);
-		lowcomms_connect_sock(con);
+		dlm_io_delayed_queue(con, &con->swork,
+				     msecs_to_jiffies(1000));
 	}
 
 	return result;
 }
 
-/* Send workqueue function */
-static void process_send_sockets(struct work_struct *work)
+int dlm_lowcomms_connect_node(int nodeid)
 {
-	struct connection *con = container_of(work, struct connection, swork);
+	struct connection *con;
+	int idx;
 
-	WARN_ON(test_bit(CF_IS_OTHERCON, &con->flags));
+	if (nodeid == dlm_our_nodeid())
+		return 0;
 
-	if (test_and_clear_bit(CF_RECONNECT, &con->flags)) {
-		dlm_con_lock(con);
-		close_connection(con, false);
-		dlm_midcomms_unack_msg_resend(con->nodeid);
-		dlm_con_unlock(con);
+	idx = srcu_read_lock(&connections_srcu);
+	con = nodeid2con(nodeid, GFP_NOFS);
+	if (!con) {
+		srcu_read_unlock(&connections_srcu, idx);
+		return -ENOMEM;
 	}
 
-	if (con->sock == NULL) { /* not mutex protected so check it inside too */
-		if (test_and_clear_bit(CF_DELAY_CONNECT, &con->flags))
-			msleep(1000);
+	if (test_bit(CF_CLOSE, &con->flags)) {
+		srcu_read_unlock(&connections_srcu, idx);
+		return 0;
+	}
 
+	dlm_con_lock(con);
+	dlm_connect(con);
+	dlm_con_unlock(con);
+	srcu_read_unlock(&connections_srcu, idx);
+
+	cond_resched();
+	return 0;
+}
+
+static void process_close_sockets(struct work_struct *work)
+{
+	struct connection *con = container_of(work, struct connection, cwork);
+	struct connection *sendcon = dlm_sendcon(con);
+	unsigned int delay = 0;
+
+	dlm_con_lock(sendcon);
+	close_connection(con, false);
+	dlm_con_unlock(sendcon);
+
+	switch (con->sk_err) {
+	case ECONNREFUSED:
+		delay = msecs_to_jiffies(1000);
+		break;
+	default:
+		break;
+	}
+
+	dlm_io_delayed_queue(sendcon, &sendcon->swork, delay);
+}
+
+/* Send workqueue function */
+static void process_send_sockets(struct work_struct *work)
+{
+	struct connection *con = container_of(work, struct connection,
+					      swork.work);
+
+	/* be used to connect socket */
+	if (con->sock == NULL) {
 		dlm_con_lock(con);
 		dlm_connect(con);
+		dlm_midcomms_unack_msg_resend(con->nodeid);
 		dlm_con_unlock(con);
 	}
 
-- 
2.26.3

