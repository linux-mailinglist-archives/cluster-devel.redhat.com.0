Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A897562E7EA
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Nov 2022 23:12:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668723138;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jrQOlM4Cbm0Lc0FmmvXk4hqj/SIX2YsNqX9boXzFrpQ=;
	b=EbS/JdvGOTuh1R9dW/YeuKGuohBfFXIJAV6oBm1bGL7rMfvi7BMaEQy88hjT/nQZWED4MF
	d0qBtPMchwPNSzYIhtQNxHKIl3sSQZ7Bati8SN6WH4vwOTXmwD6ZJ62HulhbwjLXXd++NC
	l+yyPd7DiWYu4OHT+GuSyeQFe+ddCtQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-pmuVDNfXOOSjzdGZGkVl6g-1; Thu, 17 Nov 2022 17:12:14 -0500
X-MC-Unique: pmuVDNfXOOSjzdGZGkVl6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3143E3800C26;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30CFB2166B46;
	Thu, 17 Nov 2022 22:12:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4BD3A1946A4E;
	Thu, 17 Nov 2022 22:12:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9B64519465B9 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 22:12:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7FDE32166B44; Thu, 17 Nov 2022 22:12:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C7122166B29;
 Thu, 17 Nov 2022 22:12:09 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Nov 2022 17:11:50 -0500
Message-Id: <20221117221157.2396743-11-aahringo@redhat.com>
In-Reply-To: <20221117221157.2396743-1-aahringo@redhat.com>
References: <20221117221157.2396743-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 11/18] fs: dlm: remove socket
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Since commit 489d8e559c65 ("fs: dlm: add reliable connection if
reconnect") we have functionality like TCP offers for half-closed
sockets on dlm application protocol layer. This feature is required
because the cluster manager events about leaving resource memberships
can be locally already occurred but other cluster nodes having a pending
leaving membership over the cluster manager protocol happening. In this
time the local dlm node already shutdown it's connection and don't
transmit anymore any new dlm messages, but however it still needs to be
able to accept dlm messages because the pending leave membership request
of the cluster manager protocol which the dlm kernel implementation has
no control about it.

We have this functionality on the application for two reasons, the main
reason is that SCTP does not support such functionality on socket
layer. But we can do it inside application layer.

Another small issue is that this feature is broken in the TCP world
because some NAT devices does not implement such functionality
correctly. This is the same reason why the reliable connection session
layer in DLM exists. We give up on middle devices in the networking
which sends e.g. TCP resets out. In DLM we cannot have any message
dropping and we ensure it over a session layer that it can't happen.

Back to the half-closed grace shutdown handling. It's not necessary
anymore to do it on socket layer (which is only support for TCP sockets)
because we do it on application layer. This patch removes this handling,
if there are still issues then we have a problem on the application
layer for such handling.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 127 ++++++++--------------------------------------
 fs/dlm/lowcomms.h |   1 +
 fs/dlm/midcomms.c |   6 ++-
 3 files changed, 27 insertions(+), 107 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index d9001d40aa6e..e33bee1beba2 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -65,7 +65,6 @@
 
 /* Number of messages to send before rescheduling */
 #define MAX_SEND_MSG_COUNT 25
-#define DLM_SHUTDOWN_WAIT_TIMEOUT msecs_to_jiffies(10000)
 
 struct connection {
 	struct socket *sock;	/* NULL if not connected */
@@ -79,14 +78,11 @@ struct connection {
 #define CF_CLOSE 6
 #define CF_APP_LIMITED 7
 #define CF_CLOSING 8
-#define CF_SHUTDOWN 9
-#define CF_CONNECTED 10
-#define CF_RECONNECT 11
-#define CF_DELAY_CONNECT 12
-#define CF_EOF 13
+#define CF_CONNECTED 9
+#define CF_RECONNECT 10
+#define CF_DELAY_CONNECT 11
 	struct list_head writequeue;  /* List of outgoing writequeue_entries */
 	spinlock_t writequeue_lock;
-	atomic_t writequeue_cnt;
 	int retries;
 #define MAX_CONNECT_RETRIES 3
 	struct hlist_node list;
@@ -94,7 +90,6 @@ struct connection {
 	struct connection *sendcon;
 	struct work_struct rwork; /* Receive workqueue */
 	struct work_struct swork; /* Send workqueue */
-	wait_queue_head_t shutdown_wait; /* wait for graceful shutdown */
 	unsigned char *rx_buf;
 	int rx_buflen;
 	int rx_leftover;
@@ -157,10 +152,6 @@ struct dlm_proto_ops {
 	int (*listen_validate)(void);
 	void (*listen_sockopts)(struct socket *sock);
 	int (*listen_bind)(struct socket *sock);
-	/* What to do to shutdown */
-	void (*shutdown_action)(struct connection *con);
-	/* What to do to eof check */
-	bool (*eof_condition)(struct connection *con);
 };
 
 static struct listen_sock_callbacks {
@@ -241,11 +232,6 @@ static struct connection *__find_con(int nodeid, int r)
 	return NULL;
 }
 
-static bool tcp_eof_condition(struct connection *con)
-{
-	return atomic_read(&con->writequeue_cnt);
-}
-
 static int dlm_con_init(struct connection *con, int nodeid)
 {
 	con->rx_buflen = dlm_config.ci_buffer_size;
@@ -257,10 +243,8 @@ static int dlm_con_init(struct connection *con, int nodeid)
 	mutex_init(&con->sock_mutex);
 	INIT_LIST_HEAD(&con->writequeue);
 	spin_lock_init(&con->writequeue_lock);
-	atomic_set(&con->writequeue_cnt, 0);
 	INIT_WORK(&con->swork, process_send_sockets);
 	INIT_WORK(&con->rwork, process_recv_sockets);
-	init_waitqueue_head(&con->shutdown_wait);
 
 	return 0;
 }
@@ -771,7 +755,6 @@ static void free_entry(struct writequeue_entry *e)
 	}
 
 	list_del(&e->list);
-	atomic_dec(&e->con->writequeue_cnt);
 	kref_put(&e->ref, dlm_page_release);
 }
 
@@ -834,56 +817,10 @@ static void close_connection(struct connection *con, bool and_other,
 	clear_bit(CF_CONNECTED, &con->flags);
 	clear_bit(CF_DELAY_CONNECT, &con->flags);
 	clear_bit(CF_RECONNECT, &con->flags);
-	clear_bit(CF_EOF, &con->flags);
 	mutex_unlock(&con->sock_mutex);
 	clear_bit(CF_CLOSING, &con->flags);
 }
 
-static void shutdown_connection(struct connection *con)
-{
-	int ret;
-
-	flush_work(&con->swork);
-
-	mutex_lock(&con->sock_mutex);
-	/* nothing to shutdown */
-	if (!con->sock) {
-		mutex_unlock(&con->sock_mutex);
-		return;
-	}
-
-	set_bit(CF_SHUTDOWN, &con->flags);
-	ret = kernel_sock_shutdown(con->sock, SHUT_WR);
-	mutex_unlock(&con->sock_mutex);
-	if (ret) {
-		log_print("Connection %p failed to shutdown: %d will force close",
-			  con, ret);
-		goto force_close;
-	} else {
-		ret = wait_event_timeout(con->shutdown_wait,
-					 !test_bit(CF_SHUTDOWN, &con->flags),
-					 DLM_SHUTDOWN_WAIT_TIMEOUT);
-		if (ret == 0) {
-			log_print("Connection %p shutdown timed out, will force close",
-				  con);
-			goto force_close;
-		}
-	}
-
-	return;
-
-force_close:
-	clear_bit(CF_SHUTDOWN, &con->flags);
-	close_connection(con, false, true, true);
-}
-
-static void dlm_tcp_shutdown(struct connection *con)
-{
-	if (con->othercon)
-		shutdown_connection(con->othercon);
-	shutdown_connection(con);
-}
-
 static int con_realloc_receive_buf(struct connection *con, int newlen)
 {
 	unsigned char *newbuf;
@@ -975,19 +912,8 @@ static int receive_from_sock(struct connection *con)
 		log_print("connection %p got EOF from %d",
 			  con, con->nodeid);
 
-		if (dlm_proto_ops->eof_condition &&
-		    dlm_proto_ops->eof_condition(con)) {
-			set_bit(CF_EOF, &con->flags);
-			mutex_unlock(&con->sock_mutex);
-		} else {
-			mutex_unlock(&con->sock_mutex);
-			close_connection(con, false, true, false);
-
-			/* handling for tcp shutdown */
-			clear_bit(CF_SHUTDOWN, &con->flags);
-			wake_up(&con->shutdown_wait);
-		}
-
+		mutex_unlock(&con->sock_mutex);
+		close_connection(con, false, true, false);
 		/* signal to breaking receive worker */
 		ret = -1;
 	} else {
@@ -1261,7 +1187,6 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 	kref_get(&e->ref);
 	*ppc = page_address(e->page);
 	e->end += len;
-	atomic_inc(&con->writequeue_cnt);
 	if (cb)
 		cb(data);
 
@@ -1467,20 +1392,6 @@ static void send_to_sock(struct connection *con)
 	}
 	spin_unlock(&con->writequeue_lock);
 
-	/* close if we got EOF */
-	if (test_and_clear_bit(CF_EOF, &con->flags)) {
-		mutex_unlock(&con->sock_mutex);
-		close_connection(con, false, false, true);
-
-		/* handling for tcp shutdown */
-		clear_bit(CF_SHUTDOWN, &con->flags);
-		wake_up(&con->shutdown_wait);
-	} else {
-		mutex_unlock(&con->sock_mutex);
-	}
-
-	return;
-
 out:
 	mutex_unlock(&con->sock_mutex);
 	return;
@@ -1680,16 +1591,8 @@ static int work_start(void)
 	return 0;
 }
 
-static void shutdown_conn(struct connection *con)
-{
-	if (dlm_proto_ops->shutdown_action)
-		dlm_proto_ops->shutdown_action(con);
-}
-
 void dlm_lowcomms_shutdown(void)
 {
-	int idx;
-
 	restore_callbacks(listen_con.sock);
 
 	if (recv_workqueue)
@@ -1698,9 +1601,25 @@ void dlm_lowcomms_shutdown(void)
 		flush_workqueue(send_workqueue);
 
 	dlm_close_sock(&listen_con.sock);
+}
+
+void dlm_lowcomms_shutdown_node(int nodeid, bool force)
+{
+	struct connection *con;
+	int idx;
 
 	idx = srcu_read_lock(&connections_srcu);
-	foreach_conn(shutdown_conn);
+	con = nodeid2con(nodeid, 0);
+	if (WARN_ON_ONCE(!con)) {
+		srcu_read_unlock(&connections_srcu, idx);
+		return;
+	}
+
+	WARN_ON_ONCE(!force && !list_empty(&con->writequeue));
+	clean_one_writequeue(con);
+	if (con->othercon)
+		clean_one_writequeue(con->othercon);
+	close_connection(con, true, true, true);
 	srcu_read_unlock(&connections_srcu, idx);
 }
 
@@ -1912,8 +1831,6 @@ static const struct dlm_proto_ops dlm_tcp_ops = {
 	.listen_validate = dlm_tcp_listen_validate,
 	.listen_sockopts = dlm_tcp_listen_sockopts,
 	.listen_bind = dlm_tcp_listen_bind,
-	.shutdown_action = dlm_tcp_shutdown,
-	.eof_condition = tcp_eof_condition,
 };
 
 static int dlm_sctp_bind(struct socket *sock)
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index acaf1b0b3885..3e8dca66183b 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -34,6 +34,7 @@ bool dlm_lowcomms_is_running(void);
 
 int dlm_lowcomms_start(void);
 void dlm_lowcomms_shutdown(void);
+void dlm_lowcomms_shutdown_node(int nodeid, bool force);
 void dlm_lowcomms_stop(void);
 void dlm_lowcomms_init(void);
 void dlm_lowcomms_exit(void);
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 6b4c72fb0171..b0e8bdcaab1b 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -1426,11 +1426,13 @@ static void midcomms_shutdown(struct midcomms_node *node)
 		pr_debug("active shutdown timed out for node %d with state %s\n",
 			 node->nodeid, dlm_state_str(node->state));
 		midcomms_node_reset(node);
+		dlm_lowcomms_shutdown_node(node->nodeid, true);
 		return;
 	}
 
 	pr_debug("active shutdown done for node %d with state %s\n",
 		 node->nodeid, dlm_state_str(node->state));
+	dlm_lowcomms_shutdown_node(node->nodeid, false);
 }
 
 void dlm_midcomms_shutdown(void)
@@ -1438,6 +1440,8 @@ void dlm_midcomms_shutdown(void)
 	struct midcomms_node *node;
 	int i, idx;
 
+	dlm_lowcomms_shutdown();
+
 	mutex_lock(&close_lock);
 	idx = srcu_read_lock(&nodes_srcu);
 	for (i = 0; i < CONN_HASH_SIZE; i++) {
@@ -1455,8 +1459,6 @@ void dlm_midcomms_shutdown(void)
 	}
 	srcu_read_unlock(&nodes_srcu, idx);
 	mutex_unlock(&close_lock);
-
-	dlm_lowcomms_shutdown();
 }
 
 int dlm_midcomms_close(int nodeid)
-- 
2.31.1

