Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3B02B292DF0
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Oct 2020 20:59:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603133994;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HzP/nHSLNbjsf1Jp9Buw1TSHn4dZcgHZbgKHmVwYcNQ=;
	b=bnPQhLxhrvs3JtaTAi5umEA6U6Vo7GvMZ21atfW0X6wt/dIWV8lOk7rIeK2fm1hU1hrU0R
	NQ/0hVSM7UacTwyl/EtExhepyuGrklND9uaopI2EGwjDgmunCB0valDQ1RomXjV7ZJImld
	Sa/08TBp8hGdQ4obmv10slRTjgMdERE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-imOfYjhkNzOW0GAeZ_4n0Q-1; Mon, 19 Oct 2020 14:59:51 -0400
X-MC-Unique: imOfYjhkNzOW0GAeZ_4n0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8A831084C85;
	Mon, 19 Oct 2020 18:59:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D767460C13;
	Mon, 19 Oct 2020 18:59:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C18D9181A06B;
	Mon, 19 Oct 2020 18:59:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JIxlDw021386 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 14:59:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F1C0B5C230; Mon, 19 Oct 2020 18:59:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-200.rdu2.redhat.com [10.10.116.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7FB1A5C1A3;
	Mon, 19 Oct 2020 18:59:37 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 19 Oct 2020 14:59:16 -0400
Message-Id: <20201019185916.707827-10-aahringo@redhat.com>
In-Reply-To: <20201019185916.707827-1-aahringo@redhat.com>
References: <20201019185916.707827-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 9/9] fs: dlm: listen socket out of
	connection hash
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
 fs/dlm/lowcomms.c | 180 ++++++++++++++++++++--------------------------
 1 file changed, 79 insertions(+), 101 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index f18d40ba42f97..11e5e92148fda 100644
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
@@ -182,6 +187,11 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 	struct connection *con, *tmp;
 	int r;
 
+	if (nodeid == 0) {
+		log_print("Invalid nodeid used for lookup\n");
+		return NULL;
+	}
+
 	con = __find_con(nodeid);
 	if (con || !alloc)
 		return con;
@@ -205,14 +215,6 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 	INIT_WORK(&con->rwork, process_recv_sockets);
 	init_waitqueue_head(&con->shutdown_wait);
 
-	/* Setup action pointers for child sockets */
-	if (con->nodeid) {
-		struct connection *zerocon = __find_con(0);
-
-		if (!con->rx_action)
-			con->rx_action = zerocon->rx_action;
-	}
-
 	if (dlm_config.ci_protocol == 0) {
 		con->connect_action = tcp_connect_to_sock;
 		con->shutdown_action = dlm_tcp_shutdown;
@@ -420,6 +422,11 @@ static void lowcomms_data_ready(struct sock *sk)
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
@@ -555,6 +562,21 @@ static void restore_callbacks(struct socket *sock)
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
@@ -592,6 +614,15 @@ static void make_sockaddr(struct sockaddr_storage *saddr, uint16_t port,
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
@@ -608,11 +639,8 @@ static void close_connection(struct connection *con, bool and_other,
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
@@ -708,11 +736,6 @@ static int receive_from_sock(struct connection *con)
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
@@ -784,7 +807,7 @@ static int receive_from_sock(struct connection *con)
 }
 
 /* Listening socket is busy, accept a connection */
-static int accept_from_sock(struct connection *con)
+static int accept_from_sock(struct listen_connection *con)
 {
 	int result;
 	struct sockaddr_storage peeraddr;
@@ -799,12 +822,8 @@ static int accept_from_sock(struct connection *con)
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
@@ -826,7 +845,6 @@ static int accept_from_sock(struct connection *con)
 		print_hex_dump_bytes("ss: ", DUMP_PREFIX_NONE, 
 				     b, sizeof(struct sockaddr_storage));
 		sock_release(newsock);
-		mutex_unlock(&con->sock_mutex);
 		return -1;
 	}
 
@@ -845,7 +863,8 @@ static int accept_from_sock(struct connection *con)
 		result = -ENOMEM;
 		goto accept_err;
 	}
-	mutex_lock_nested(&newcon->sock_mutex, 1);
+
+	mutex_lock(&newcon->sock_mutex);
 	if (newcon->sock) {
 		struct connection *othercon = newcon->othercon;
 
@@ -869,7 +888,6 @@ static int accept_from_sock(struct connection *con)
 			}
 
 			othercon->nodeid = nodeid;
-			othercon->rx_action = receive_from_sock;
 			mutex_init(&othercon->sock_mutex);
 			INIT_LIST_HEAD(&othercon->writequeue);
 			spin_lock_init(&othercon->writequeue_lock);
@@ -882,14 +900,13 @@ static int accept_from_sock(struct connection *con)
 			close_connection(othercon, false, true, false);
 		}
 
-		mutex_lock_nested(&othercon->sock_mutex, 2);
+		mutex_lock_nested(&othercon->sock_mutex, 1);
 		newcon->othercon = othercon;
 		add_sock(newsock, othercon);
 		addcon = othercon;
 		mutex_unlock(&othercon->sock_mutex);
 	}
 	else {
-		newcon->rx_action = receive_from_sock;
 		/* accept copies the sk after we've saved the callbacks, so we
 		   don't want to save them a second time or comm errors will
 		   result in calling sk_error_report recursively. */
@@ -906,12 +923,10 @@ static int accept_from_sock(struct connection *con)
 	 */
 	if (!test_and_set_bit(CF_READ_PENDING, &addcon->flags))
 		queue_work(recv_workqueue, &addcon->rwork);
-	mutex_unlock(&con->sock_mutex);
 
 	return 0;
 
 accept_err:
-	mutex_unlock(&con->sock_mutex);
 	if (newsock)
 		sock_release(newsock);
 
@@ -984,11 +999,6 @@ static void sctp_connect_to_sock(struct connection *con)
 	struct socket *sock;
 	unsigned int mark;
 
-	if (con->nodeid == 0) {
-		log_print("attempt to connect sock 0 foiled");
-		return;
-	}
-
 	dlm_comm_mark(con->nodeid, &mark);
 
 	mutex_lock(&con->sock_mutex);
@@ -1017,7 +1027,6 @@ static void sctp_connect_to_sock(struct connection *con)
 
 	sock_set_mark(sock->sk, mark);
 
-	con->rx_action = receive_from_sock;
 	add_sock(sock, con);
 
 	/* Bind to all addresses. */
@@ -1084,11 +1093,6 @@ static void tcp_connect_to_sock(struct connection *con)
 	unsigned int mark;
 	int result;
 
-	if (con->nodeid == 0) {
-		log_print("attempt to connect sock 0 foiled");
-		return;
-	}
-
 	dlm_comm_mark(con->nodeid, &mark);
 
 	mutex_lock(&con->sock_mutex);
@@ -1114,7 +1118,6 @@ static void tcp_connect_to_sock(struct connection *con)
 		goto out_err;
 	}
 
-	con->rx_action = receive_from_sock;
 	add_sock(sock, con);
 
 	/* Bind to our cluster-known address connecting to avoid
@@ -1170,8 +1173,11 @@ static void tcp_connect_to_sock(struct connection *con)
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
@@ -1197,20 +1203,13 @@ static struct socket *tcp_create_listen_sock(struct connection *con,
 
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
@@ -1218,13 +1217,13 @@ static struct socket *tcp_create_listen_sock(struct connection *con,
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
@@ -1253,15 +1252,14 @@ static void deinit_local(void)
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
 
@@ -1276,44 +1274,27 @@ static int sctp_listen_for_all(void)
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
@@ -1323,16 +1304,7 @@ static int tcp_listen_for_all(void)
 
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
 
 
@@ -1551,10 +1523,15 @@ static void process_recv_sockets(struct work_struct *work)
 
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
@@ -1688,6 +1665,8 @@ void dlm_lowcomms_stop(void)
 	if (send_workqueue)
 		flush_workqueue(send_workqueue);
 
+	dlm_close_sock(&listen_con.sock);
+
 	foreach_conn(shutdown_conn);
 	work_flush();
 	foreach_conn(free_conn);
@@ -1698,7 +1677,6 @@ void dlm_lowcomms_stop(void)
 int dlm_lowcomms_start(void)
 {
 	int error = -EINVAL;
-	struct connection *con;
 	int i;
 
 	for (i = 0; i < CONN_HASH_SIZE; i++)
@@ -1711,6 +1689,8 @@ int dlm_lowcomms_start(void)
 		goto fail;
 	}
 
+	INIT_WORK(&listen_con.rwork, process_listen_recv_socket);
+
 	error = work_start();
 	if (error)
 		goto fail;
@@ -1721,7 +1701,7 @@ int dlm_lowcomms_start(void)
 	if (dlm_config.ci_protocol == 0)
 		error = tcp_listen_for_all();
 	else
-		error = sctp_listen_for_all();
+		error = sctp_listen_for_all(&listen_con);
 	if (error)
 		goto fail_unlisten;
 
@@ -1729,9 +1709,7 @@ int dlm_lowcomms_start(void)
 
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

