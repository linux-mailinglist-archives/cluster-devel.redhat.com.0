Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BF8F12A382E
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Nov 2020 02:05:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604365499;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=X7x82BVaeq3x0KW2wTx8gGh3IPjjVezxf9n2+ywMIbU=;
	b=QfgUm4yX58WZ7FnMrPBZBfir928fm+d9NJryRnBwLKKVrUzpPf/EvFM7Cqs2hpt2lue6dk
	n96AaxhQzFBroy92wHdLlU+XMPBiGsOJI4ZmtNK/OPiE/jOgZeFzkogEk9FZghrQkjXZi5
	jaDGbJ8WqNxSGhvZj9dAi3HkOpDiw/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-Rat2oCDGOnq-Wf7bOOOtXA-1; Mon, 02 Nov 2020 20:04:56 -0500
X-MC-Unique: Rat2oCDGOnq-Wf7bOOOtXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D7541006CA7;
	Tue,  3 Nov 2020 01:04:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C2746CE4F;
	Tue,  3 Nov 2020 01:04:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 271638C7B0;
	Tue,  3 Nov 2020 01:04:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A314lu6003561 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 20:04:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BA7CB5C5FD; Tue,  3 Nov 2020 01:04:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-45.rdu2.redhat.com [10.10.115.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F4E15C629;
	Tue,  3 Nov 2020 01:04:46 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  2 Nov 2020 20:04:25 -0500
Message-Id: <20201103010428.1009384-11-aahringo@redhat.com>
In-Reply-To: <20201103010428.1009384-1-aahringo@redhat.com>
References: <20201103010428.1009384-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 RESEND v5.10-rc2 10/13] fs: dlm: listen
	socket out of connection hash
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch introduces a own connection structure for the listen socket
handling instead of handling the listen socket as normal connection
structure in the connection hash. We can remove some nodeid equals zero
validation checks, because this nodeid should not exists anymore inside
the node hash. This patch also removes the sock mutex in
accept_from_sock() function because this function can't occur in another
parallel context if it's scheduled on only one workqueue.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 167 ++++++++++++++++++++--------------------------
 1 file changed, 74 insertions(+), 93 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 889ac5e8ad0a..b042ef56eba6 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -81,7 +81,6 @@ struct connection {
 #define CF_CONNECTED 10
 	struct list_head writequeue;  /* List of outgoing writequeue_entries */
 	spinlock_t writequeue_lock;
-	int (*rx_action) (struct connection *);	/* What to do when active */
 	void (*connect_action) (struct connection *);	/* What to do to connect */
 	void (*shutdown_action)(struct connection *con); /* What to do to shutdown */
 	int retries;
@@ -98,6 +97,11 @@ struct connection {
 };
 #define sock2con(x) ((struct connection *)(x)->sk_user_data)
 
+struct listen_connection {
+	struct socket *sock;
+	struct work_struct rwork;
+};
+
 /* An entry waiting to be sent */
 struct writequeue_entry {
 	struct list_head list;
@@ -127,6 +131,7 @@ static struct listen_sock_callbacks {
 static LIST_HEAD(dlm_node_addrs);
 static DEFINE_SPINLOCK(dlm_node_addrs_spin);
 
+static struct listen_connection listen_con;
 static struct sockaddr_storage *dlm_local_addr[DLM_MAX_ADDR_COUNT];
 static int dlm_local_count;
 static int dlm_allow_conn;
@@ -421,6 +426,11 @@ static void lowcomms_data_ready(struct sock *sk)
 	read_unlock_bh(&sk->sk_callback_lock);
 }
 
+static void lowcomms_listen_data_ready(struct sock *sk)
+{
+	queue_work(recv_workqueue, &listen_con.rwork);
+}
+
 static void lowcomms_write_space(struct sock *sk)
 {
 	struct connection *con;
@@ -556,6 +566,21 @@ static void restore_callbacks(struct socket *sock)
 	write_unlock_bh(&sk->sk_callback_lock);
 }
 
+static void add_listen_sock(struct socket *sock, struct listen_connection *con)
+{
+	struct sock *sk = sock->sk;
+
+	write_lock_bh(&sk->sk_callback_lock);
+	save_listen_callbacks(sock);
+	con->sock = sock;
+
+	sk->sk_user_data = con;
+	sk->sk_allocation = GFP_NOFS;
+	/* Install a data_ready callback */
+	sk->sk_data_ready = lowcomms_listen_data_ready;
+	write_unlock_bh(&sk->sk_callback_lock);
+}
+
 /* Make a socket active */
 static void add_sock(struct socket *sock, struct connection *con)
 {
@@ -593,6 +618,15 @@ static void make_sockaddr(struct sockaddr_storage *saddr, uint16_t port,
 	memset((char *)saddr + *addr_len, 0, sizeof(struct sockaddr_storage) - *addr_len);
 }
 
+static void dlm_close_sock(struct socket **sock)
+{
+	if (*sock) {
+		restore_callbacks(*sock);
+		sock_release(*sock);
+		*sock = NULL;
+	}
+}
+
 /* Close a remote connection and tidy up */
 static void close_connection(struct connection *con, bool and_other,
 			     bool tx, bool rx)
@@ -609,11 +643,8 @@ static void close_connection(struct connection *con, bool and_other,
 	}
 
 	mutex_lock(&con->sock_mutex);
-	if (con->sock) {
-		restore_callbacks(con->sock);
-		sock_release(con->sock);
-		con->sock = NULL;
-	}
+	dlm_close_sock(&con->sock);
+
 	if (con->othercon && and_other) {
 		/* Will only re-enter once. */
 		close_connection(con->othercon, false, true, true);
@@ -709,11 +740,6 @@ static int receive_from_sock(struct connection *con)
 		goto out_close;
 	}
 
-	if (con->nodeid == 0) {
-		ret = -EINVAL;
-		goto out_close;
-	}
-
 	/* realloc if we get new buffer size to read out */
 	buflen = dlm_config.ci_buffer_size;
 	if (con->rx_buflen != buflen && con->rx_leftover <= buflen) {
@@ -785,7 +811,7 @@ static int receive_from_sock(struct connection *con)
 }
 
 /* Listening socket is busy, accept a connection */
-static int accept_from_sock(struct connection *con)
+static int accept_from_sock(struct listen_connection *con)
 {
 	int result;
 	struct sockaddr_storage peeraddr;
@@ -800,12 +826,8 @@ static int accept_from_sock(struct connection *con)
 		return -1;
 	}
 
-	mutex_lock_nested(&con->sock_mutex, 0);
-
-	if (!con->sock) {
-		mutex_unlock(&con->sock_mutex);
+	if (!con->sock)
 		return -ENOTCONN;
-	}
 
 	result = kernel_accept(con->sock, &newsock, O_NONBLOCK);
 	if (result < 0)
@@ -827,7 +849,6 @@ static int accept_from_sock(struct connection *con)
 		print_hex_dump_bytes("ss: ", DUMP_PREFIX_NONE, 
 				     b, sizeof(struct sockaddr_storage));
 		sock_release(newsock);
-		mutex_unlock(&con->sock_mutex);
 		return -1;
 	}
 
@@ -846,7 +867,8 @@ static int accept_from_sock(struct connection *con)
 		result = -ENOMEM;
 		goto accept_err;
 	}
-	mutex_lock_nested(&newcon->sock_mutex, 1);
+
+	mutex_lock(&newcon->sock_mutex);
 	if (newcon->sock) {
 		struct connection *othercon = newcon->othercon;
 
@@ -865,20 +887,18 @@ static int accept_from_sock(struct connection *con)
 				goto accept_err;
 			}
 
-			set_bit(CF_IS_OTHERCON, &othercon->flags);
 			newcon->othercon = othercon;
 		} else {
 			/* close other sock con if we have something new */
 			close_connection(othercon, false, true, false);
 		}
 
-		mutex_lock_nested(&othercon->sock_mutex, 2);
+		mutex_lock_nested(&othercon->sock_mutex, 1);
 		add_sock(newsock, othercon);
 		addcon = othercon;
 		mutex_unlock(&othercon->sock_mutex);
 	}
 	else {
-		newcon->rx_action = receive_from_sock;
 		/* accept copies the sk after we've saved the callbacks, so we
 		   don't want to save them a second time or comm errors will
 		   result in calling sk_error_report recursively. */
@@ -895,12 +915,10 @@ static int accept_from_sock(struct connection *con)
 	 */
 	if (!test_and_set_bit(CF_READ_PENDING, &addcon->flags))
 		queue_work(recv_workqueue, &addcon->rwork);
-	mutex_unlock(&con->sock_mutex);
 
 	return 0;
 
 accept_err:
-	mutex_unlock(&con->sock_mutex);
 	if (newsock)
 		sock_release(newsock);
 
@@ -973,11 +991,6 @@ static void sctp_connect_to_sock(struct connection *con)
 	struct socket *sock;
 	unsigned int mark;
 
-	if (con->nodeid == 0) {
-		log_print("attempt to connect sock 0 foiled");
-		return;
-	}
-
 	dlm_comm_mark(con->nodeid, &mark);
 
 	mutex_lock(&con->sock_mutex);
@@ -1006,7 +1019,6 @@ static void sctp_connect_to_sock(struct connection *con)
 
 	sock_set_mark(sock->sk, mark);
 
-	con->rx_action = receive_from_sock;
 	add_sock(sock, con);
 
 	/* Bind to all addresses. */
@@ -1073,11 +1085,6 @@ static void tcp_connect_to_sock(struct connection *con)
 	unsigned int mark;
 	int result;
 
-	if (con->nodeid == 0) {
-		log_print("attempt to connect sock 0 foiled");
-		return;
-	}
-
 	dlm_comm_mark(con->nodeid, &mark);
 
 	mutex_lock(&con->sock_mutex);
@@ -1103,7 +1110,6 @@ static void tcp_connect_to_sock(struct connection *con)
 		goto out_err;
 	}
 
-	con->rx_action = receive_from_sock;
 	add_sock(sock, con);
 
 	/* Bind to our cluster-known address connecting to avoid
@@ -1159,8 +1165,11 @@ static void tcp_connect_to_sock(struct connection *con)
 	return;
 }
 
-static struct socket *tcp_create_listen_sock(struct connection *con,
-					     struct sockaddr_storage *saddr)
+/* On error caller must run dlm_close_sock() for the
+ * listen connection socket.
+ */
+static int tcp_create_listen_sock(struct listen_connection *con,
+				  struct sockaddr_storage *saddr)
 {
 	struct socket *sock = NULL;
 	int result = 0;
@@ -1186,20 +1195,13 @@ static struct socket *tcp_create_listen_sock(struct connection *con,
 
 	sock_set_reuseaddr(sock->sk);
 
-	write_lock_bh(&sock->sk->sk_callback_lock);
-	sock->sk->sk_user_data = con;
-	save_listen_callbacks(sock);
-	con->rx_action = accept_from_sock;
-	write_unlock_bh(&sock->sk->sk_callback_lock);
+	add_listen_sock(sock, con);
 
 	/* Bind to our port */
 	make_sockaddr(saddr, dlm_config.ci_tcp_port, &addr_len);
 	result = sock->ops->bind(sock, (struct sockaddr *) saddr, addr_len);
 	if (result < 0) {
 		log_print("Can't bind to port %d", dlm_config.ci_tcp_port);
-		sock_release(sock);
-		sock = NULL;
-		con->sock = NULL;
 		goto create_out;
 	}
 	sock_set_keepalive(sock->sk);
@@ -1207,13 +1209,13 @@ static struct socket *tcp_create_listen_sock(struct connection *con,
 	result = sock->ops->listen(sock, 5);
 	if (result < 0) {
 		log_print("Can't listen on port %d", dlm_config.ci_tcp_port);
-		sock_release(sock);
-		sock = NULL;
 		goto create_out;
 	}
 
+	return 0;
+
 create_out:
-	return sock;
+	return result;
 }
 
 /* Get local addresses */
@@ -1242,15 +1244,14 @@ static void deinit_local(void)
 		kfree(dlm_local_addr[i]);
 }
 
-/* Initialise SCTP socket and bind to all interfaces */
-static int sctp_listen_for_all(void)
+/* Initialise SCTP socket and bind to all interfaces
+ * On error caller must run dlm_close_sock() for the
+ * listen connection socket.
+ */
+static int sctp_listen_for_all(struct listen_connection *con)
 {
 	struct socket *sock = NULL;
 	int result = -EINVAL;
-	struct connection *con = nodeid2con(0, GFP_NOFS);
-
-	if (!con)
-		return -ENOMEM;
 
 	log_print("Using SCTP for communications");
 
@@ -1265,44 +1266,27 @@ static int sctp_listen_for_all(void)
 	sock_set_mark(sock->sk, dlm_config.ci_mark);
 	sctp_sock_set_nodelay(sock->sk);
 
-	write_lock_bh(&sock->sk->sk_callback_lock);
-	/* Init con struct */
-	sock->sk->sk_user_data = con;
-	save_listen_callbacks(sock);
-	con->sock = sock;
-	con->sock->sk->sk_data_ready = lowcomms_data_ready;
-	con->rx_action = accept_from_sock;
-
-	write_unlock_bh(&sock->sk->sk_callback_lock);
+	add_listen_sock(sock, con);
 
 	/* Bind to all addresses. */
-	if (sctp_bind_addrs(con->sock, dlm_config.ci_tcp_port))
-		goto create_delsock;
+	result = sctp_bind_addrs(con->sock, dlm_config.ci_tcp_port);
+	if (result < 0)
+		goto out;
 
 	result = sock->ops->listen(sock, 5);
 	if (result < 0) {
 		log_print("Can't set socket listening");
-		goto create_delsock;
+		goto out;
 	}
 
 	return 0;
 
-create_delsock:
-	sock_release(sock);
-	con->sock = NULL;
 out:
 	return result;
 }
 
 static int tcp_listen_for_all(void)
 {
-	struct socket *sock = NULL;
-	struct connection *con = nodeid2con(0, GFP_NOFS);
-	int result = -EINVAL;
-
-	if (!con)
-		return -ENOMEM;
-
 	/* We don't support multi-homed hosts */
 	if (dlm_local_addr[1] != NULL) {
 		log_print("TCP protocol can't handle multi-homed hosts, "
@@ -1312,16 +1296,7 @@ static int tcp_listen_for_all(void)
 
 	log_print("Using TCP for communications");
 
-	sock = tcp_create_listen_sock(con, dlm_local_addr[0]);
-	if (sock) {
-		add_sock(sock, con);
-		result = 0;
-	}
-	else {
-		result = -EADDRINUSE;
-	}
-
-	return result;
+	return tcp_create_listen_sock(&listen_con, dlm_local_addr[0]);
 }
 
 
@@ -1541,10 +1516,15 @@ static void process_recv_sockets(struct work_struct *work)
 
 	clear_bit(CF_READ_PENDING, &con->flags);
 	do {
-		err = con->rx_action(con);
+		err = receive_from_sock(con);
 	} while (!err);
 }
 
+static void process_listen_recv_socket(struct work_struct *work)
+{
+	accept_from_sock(&listen_con);
+}
+
 /* Send workqueue function */
 static void process_send_sockets(struct work_struct *work)
 {
@@ -1678,6 +1658,8 @@ void dlm_lowcomms_stop(void)
 	if (send_workqueue)
 		flush_workqueue(send_workqueue);
 
+	dlm_close_sock(&listen_con.sock);
+
 	foreach_conn(shutdown_conn);
 	work_flush();
 	foreach_conn(free_conn);
@@ -1688,7 +1670,6 @@ void dlm_lowcomms_stop(void)
 int dlm_lowcomms_start(void)
 {
 	int error = -EINVAL;
-	struct connection *con;
 	int i;
 
 	for (i = 0; i < CONN_HASH_SIZE; i++)
@@ -1701,6 +1682,8 @@ int dlm_lowcomms_start(void)
 		goto fail;
 	}
 
+	INIT_WORK(&listen_con.rwork, process_listen_recv_socket);
+
 	error = work_start();
 	if (error)
 		goto fail;
@@ -1711,7 +1694,7 @@ int dlm_lowcomms_start(void)
 	if (dlm_config.ci_protocol == 0)
 		error = tcp_listen_for_all();
 	else
-		error = sctp_listen_for_all();
+		error = sctp_listen_for_all(&listen_con);
 	if (error)
 		goto fail_unlisten;
 
@@ -1719,9 +1702,7 @@ int dlm_lowcomms_start(void)
 
 fail_unlisten:
 	dlm_allow_conn = 0;
-	con = nodeid2con(0,0);
-	if (con)
-		free_conn(con);
+	dlm_close_sock(&listen_con.sock);
 fail:
 	return error;
 }
-- 
2.26.2

