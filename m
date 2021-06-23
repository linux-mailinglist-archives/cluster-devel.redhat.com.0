Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 207E23B1D6C
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Jun 2021 17:15:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624461346;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p4yBZhJP5dD0Hq8cYMZhbrmA4KDNEVU7NIGptZt4gLY=;
	b=Sf+SlkV0r3DNJn8nF2bytIDB/xP4ubsG0iL2RVjW8iFtIlMqpVWPlmTU4MZ6WHyl7kJ3Ft
	qI8YQe3BqZiyMAdffg8V2Sr3k+gcdLaeRhvvpPyAjHS0Pt8tQccY+fQ5LSfONjCYByGTQN
	ZjRlloZ3Eqc5ReJbsL4DwxcDdlqtKfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-GUqNJlUBO9qTMbxPBidNyA-1; Wed, 23 Jun 2021 11:15:44 -0400
X-MC-Unique: GUqNJlUBO9qTMbxPBidNyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7036D19611D1;
	Wed, 23 Jun 2021 15:15:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CA855D6D7;
	Wed, 23 Jun 2021 15:15:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 48FFA1818450;
	Wed, 23 Jun 2021 15:15:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15NFFe54024996 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Jun 2021 11:15:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 93B5960E1C; Wed, 23 Jun 2021 15:15:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (unknown [10.22.8.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F3D660C05;
	Wed, 23 Jun 2021 15:15:40 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Jun 2021 11:14:48 -0400
Message-Id: <20210623151454.176649-10-aahringo@redhat.com>
In-Reply-To: <20210623151454.176649-1-aahringo@redhat.com>
References: <20210623151454.176649-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC dlm/next 09/15] fs: dlm: introduce io_workqueue
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch removes the send_workqueue and recv_workqueue. Instead we
using one workqueue io_workqueue which is not ordered and it's work is
protected by either rwork_lock or swork_lock per connection. The per
connection lock allows us to handle multiple connection at once which
is not possible with an ordered workqueue. To provide send and receive
each operation has it's own lock. If the sock get closed or assigned,
means we clear or set con->sock, both locks need to be held. For this
case helpers are introduced to hold the "con" lock.

This patch also removed a lot of the PENDING flags and doing some flush
operation in stop_conn() with it. The commit 489d8e559c65 ("fs: dlm: add
reliable connection if reconnect") fixed some issues with connection
termination, maybe this functionality was introduce try to fixing.
However now the midcomms layer will take care about that no send/recv
should happen at a proper termination.

There exists also a lot of confusion about the othercon paradigm which
we only have when we hit a connection race. If we hit the race we have
two connection wheras the second (named as othercon) is only for
receiving. This will end in a lot of confusion, I tried to use the locks
and other resources inside the first connection "sendcon" only to reduce
the amount to confusion.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 364 +++++++++++++++++++++-------------------------
 1 file changed, 164 insertions(+), 200 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 8571017c3cdc..d2febefe1d0d 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -67,20 +67,16 @@
 struct connection {
 	struct socket *sock;	/* NULL if not connected */
 	uint32_t nodeid;	/* So we know who we are in the list */
-	struct mutex sock_mutex;
 	unsigned long flags;
-#define CF_READ_PENDING 1
-#define CF_WRITE_PENDING 2
-#define CF_INIT_PENDING 4
-#define CF_IS_OTHERCON 5
-#define CF_CLOSE 6
-#define CF_APP_LIMITED 7
-#define CF_CLOSING 8
-#define CF_SHUTDOWN 9
-#define CF_CONNECTED 10
-#define CF_RECONNECT 11
-#define CF_DELAY_CONNECT 12
-#define CF_EOF 13
+#define CF_IS_OTHERCON 1
+#define CF_CLOSE 2
+#define CF_APP_LIMITED 3
+#define CF_SHUTDOWN 4
+#define CF_CONNECTED 5
+#define CF_RECONNECT 6
+#define CF_DELAY_CONNECT 7
+#define CF_EOF 8
+#define CF_STOP 9
 	struct list_head writequeue;  /* List of outgoing writequeue_entries */
 	spinlock_t writequeue_lock;
 	atomic_t writequeue_cnt;
@@ -90,8 +86,10 @@ struct connection {
 	struct hlist_node list;
 	struct connection *othercon;
 	struct connection *sendcon;
-	struct work_struct rwork; /* Receive workqueue */
-	struct work_struct swork; /* Send workqueue */
+	struct mutex rwork_lock;
+	struct work_struct rwork;
+	struct mutex swork_lock;
+	struct work_struct swork;
 	wait_queue_head_t shutdown_wait; /* wait for graceful shutdown */
 	unsigned char *rx_buf;
 	int rx_buflen;
@@ -101,6 +99,7 @@ struct connection {
 #define sock2con(x) ((struct connection *)(x)->sk_user_data)
 
 struct listen_connection {
+	struct mutex lock;
 	struct socket *sock;
 	struct work_struct rwork;
 };
@@ -177,8 +176,7 @@ static int dlm_local_count;
 int dlm_allow_conn;
 
 /* Work queues */
-static struct workqueue_struct *recv_workqueue;
-static struct workqueue_struct *send_workqueue;
+static struct workqueue_struct *io_workqueue;
 
 static struct hlist_head connection_hash[CONN_HASH_SIZE];
 static DEFINE_SPINLOCK(connections_lock);
@@ -189,6 +187,35 @@ static const struct dlm_proto_ops *dlm_proto_ops;
 static void process_recv_sockets(struct work_struct *work);
 static void process_send_sockets(struct work_struct *work);
 
+static inline void dlm_con_lock(struct connection *con)
+{
+	mutex_lock(&con->swork_lock);
+	mutex_lock(&con->rwork_lock);
+}
+
+static inline void dlm_con_unlock(struct connection *con)
+{
+	mutex_unlock(&con->rwork_lock);
+	mutex_unlock(&con->swork_lock);
+}
+
+static inline void dlm_io_queue(struct connection *con,
+				struct work_struct *work)
+{
+	if (test_bit(CF_STOP, &con->flags))
+		return;
+
+	queue_work(io_workqueue, work);
+}
+
+static inline struct connection *dlm_sendcon(struct connection *con)
+{
+	if (test_bit(CF_IS_OTHERCON, &con->flags))
+		return con->sendcon;
+
+	return con;
+}
+
 /* need to held writequeue_lock */
 static struct writequeue_entry *con_next_wq(struct connection *con)
 {
@@ -230,7 +257,6 @@ static int dlm_con_init(struct connection *con, int nodeid)
 		return -ENOMEM;
 
 	con->nodeid = nodeid;
-	mutex_init(&con->sock_mutex);
 	INIT_LIST_HEAD(&con->writequeue);
 	spin_lock_init(&con->writequeue_lock);
 	atomic_set(&con->writequeue_cnt, 0);
@@ -265,6 +291,8 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 		return NULL;
 	}
 
+	mutex_init(&con->rwork_lock);
+	mutex_init(&con->swork_lock);
 	mutex_init(&con->wq_alloc);
 
 	spin_lock(&connections_lock);
@@ -488,8 +516,8 @@ static void lowcomms_data_ready(struct sock *sk)
 
 	read_lock_bh(&sk->sk_callback_lock);
 	con = sock2con(sk);
-	if (con && !test_and_set_bit(CF_READ_PENDING, &con->flags))
-		queue_work(recv_workqueue, &con->rwork);
+	if (con)
+		dlm_io_queue(dlm_sendcon(con), &con->rwork);
 	read_unlock_bh(&sk->sk_callback_lock);
 }
 
@@ -498,7 +526,7 @@ static void lowcomms_listen_data_ready(struct sock *sk)
 	if (!dlm_allow_conn)
 		return;
 
-	queue_work(recv_workqueue, &listen_con.rwork);
+	queue_work(io_workqueue, &listen_con.rwork);
 }
 
 static void lowcomms_write_space(struct sock *sk)
@@ -506,13 +534,12 @@ static void lowcomms_write_space(struct sock *sk)
 	struct connection *con;
 
 	read_lock_bh(&sk->sk_callback_lock);
-	con = sock2con(sk);
+	con = dlm_sendcon(sock2con(sk));
 	if (!con)
 		goto out;
 
 	if (!test_and_set_bit(CF_CONNECTED, &con->flags)) {
 		log_print("successful connected to node %d", con->nodeid);
-		queue_work(send_workqueue, &con->swork);
 		goto out;
 	}
 
@@ -523,8 +550,8 @@ static void lowcomms_write_space(struct sock *sk)
 		clear_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags);
 	}
 
-	queue_work(send_workqueue, &con->swork);
 out:
+	dlm_io_queue(con, &con->swork);
 	read_unlock_bh(&sk->sk_callback_lock);
 }
 
@@ -532,7 +559,8 @@ static inline void lowcomms_connect_sock(struct connection *con)
 {
 	if (test_bit(CF_CLOSE, &con->flags))
 		return;
-	queue_work(send_workqueue, &con->swork);
+
+	dlm_io_queue(con, &con->swork);
 	cond_resched();
 }
 
@@ -644,7 +672,7 @@ static void lowcomms_error_report(struct sock *sk)
 	}
 
 	if (!test_and_set_bit(CF_RECONNECT, &con->flags))
-		queue_work(send_workqueue, &con->swork);
+		dlm_io_queue(con, &con->swork);
 
 out:
 	read_unlock_bh(&sk->sk_callback_lock);
@@ -774,27 +802,15 @@ static void dlm_close_sock(struct socket **sock)
 }
 
 /* Close a remote connection and tidy up */
-static void close_connection(struct connection *con, bool and_other,
-			     bool tx, bool rx)
+static void close_connection(struct connection *con, bool and_other)
 {
-	bool closing = test_and_set_bit(CF_CLOSING, &con->flags);
 	struct writequeue_entry *e;
 
-	if (tx && !closing && cancel_work_sync(&con->swork)) {
-		log_print("canceled swork for node %d", con->nodeid);
-		clear_bit(CF_WRITE_PENDING, &con->flags);
-	}
-	if (rx && !closing && cancel_work_sync(&con->rwork)) {
-		log_print("canceled rwork for node %d", con->nodeid);
-		clear_bit(CF_READ_PENDING, &con->flags);
-	}
-
-	mutex_lock(&con->sock_mutex);
 	dlm_close_sock(&con->sock);
 
 	if (con->othercon && and_other) {
 		/* Will only re-enter once. */
-		close_connection(con->othercon, false, tx, rx);
+		close_connection(con->othercon, false);
 	}
 
 	/* if we send a writequeue entry only a half way, we drop the
@@ -824,26 +840,44 @@ static void close_connection(struct connection *con, bool and_other,
 	clear_bit(CF_DELAY_CONNECT, &con->flags);
 	clear_bit(CF_RECONNECT, &con->flags);
 	clear_bit(CF_EOF, &con->flags);
-	mutex_unlock(&con->sock_mutex);
-	clear_bit(CF_CLOSING, &con->flags);
+
+	/* handling for tcp shutdown */
+	clear_bit(CF_SHUTDOWN, &con->flags);
+	wake_up(&con->shutdown_wait);
 }
 
-static void shutdown_connection(struct connection *con)
+static void cancel_io_work(struct connection *con, bool and_other)
 {
-	int ret;
+	struct connection *sendcon = dlm_sendcon(con);
 
-	flush_work(&con->swork);
+	set_bit(CF_STOP, &sendcon->flags);
+	cancel_work_sync(&sendcon->swork);
+	cancel_work_sync(&sendcon->rwork);
+	if (sendcon->othercon && and_other)
+		cancel_work_sync(&sendcon->othercon->rwork);
+
+	dlm_con_lock(sendcon);
+	close_connection(con, and_other);
+	dlm_con_unlock(sendcon);
+
+	clear_bit(CF_STOP, &sendcon->flags);
+}
+
+static void shutdown_connection(struct connection *con,
+				struct connection *sendcon)
+{
+	int ret;
 
-	mutex_lock(&con->sock_mutex);
+	mutex_lock(&sendcon->swork_lock);
 	/* nothing to shutdown */
 	if (!con->sock) {
-		mutex_unlock(&con->sock_mutex);
+		mutex_unlock(&sendcon->swork_lock);
 		return;
 	}
 
 	set_bit(CF_SHUTDOWN, &con->flags);
 	ret = kernel_sock_shutdown(con->sock, SHUT_WR);
-	mutex_unlock(&con->sock_mutex);
+	mutex_unlock(&sendcon->swork_lock);
 	if (ret) {
 		log_print("Connection %p failed to shutdown: %d will force close",
 			  con, ret);
@@ -863,14 +897,22 @@ static void shutdown_connection(struct connection *con)
 
 force_close:
 	clear_bit(CF_SHUTDOWN, &con->flags);
-	close_connection(con, false, true, true);
+	cancel_io_work(con, false);
 }
 
 static void dlm_tcp_shutdown(struct connection *con)
 {
-	if (con->othercon)
-		shutdown_connection(con->othercon);
-	shutdown_connection(con);
+	/* flush pending processes which might trigger send */
+	flush_work(&con->rwork);
+
+	if (con->othercon) {
+		flush_work(&con->othercon->rwork);
+		shutdown_connection(con->othercon, con);
+	}
+
+	/* flush all send */
+	flush_work(&con->swork);
+	shutdown_connection(con, con);
 }
 
 static int con_realloc_receive_buf(struct connection *con, int newlen)
@@ -894,17 +936,17 @@ static int con_realloc_receive_buf(struct connection *con, int newlen)
 }
 
 /* Data received from remote end */
-static int receive_from_sock(struct connection *con)
+static void receive_from_sock(struct connection *con,
+			      struct connection *sendcon)
 {
 	struct msghdr msg;
 	struct kvec iov;
 	int ret, buflen;
 
-	mutex_lock(&con->sock_mutex);
-
+	mutex_lock(&sendcon->rwork_lock);
 	if (con->sock == NULL) {
-		ret = -EAGAIN;
-		goto out_close;
+		mutex_unlock(&sendcon->rwork_lock);
+		return;
 	}
 
 	/* realloc if we get new buffer size to read out */
@@ -926,16 +968,20 @@ static int receive_from_sock(struct connection *con)
 		msg.msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
 		ret = kernel_recvmsg(con->sock, &msg, &iov, 1, iov.iov_len,
 				     msg.msg_flags);
-		if (ret == -EAGAIN)
+		if (ret == 0) {
+			mutex_unlock(&sendcon->rwork_lock);
+			goto out_eof;
+		} else if (ret < 0) {
 			break;
-		else if (ret <= 0)
-			goto out_close;
+		}
 
 		/* new buflen according readed bytes and leftover from last receive */
 		buflen = ret + con->rx_leftover;
 		ret = dlm_process_incoming_buffer(con->nodeid, con->rx_buf, buflen);
-		if (ret < 0)
+		if (ret < 0) {
+			mutex_unlock(&sendcon->rwork_lock);
 			goto out_close;
+		}
 
 		/* calculate leftover bytes from process and put it into begin of
 		 * the receive buffer, so next receive we have the full message
@@ -947,40 +993,33 @@ static int receive_from_sock(struct connection *con)
 				con->rx_leftover);
 		}
 	}
+	mutex_unlock(&sendcon->rwork_lock);
 
-	mutex_unlock(&con->sock_mutex);
-	return 0;
+	return;
 
 out_resched:
-	if (!test_and_set_bit(CF_READ_PENDING, &con->flags))
-		queue_work(recv_workqueue, &con->rwork);
-	mutex_unlock(&con->sock_mutex);
-	return -EAGAIN;
+	dlm_io_queue(sendcon, &con->rwork);
+	return;
 
 out_close:
-	if (ret == 0) {
-		log_print("connection %p got EOF from %d",
-			  con, con->nodeid);
-
-		if (dlm_proto_ops->eof_condition &&
-		    dlm_proto_ops->eof_condition(con)) {
-			set_bit(CF_EOF, &con->flags);
-			mutex_unlock(&con->sock_mutex);
-		} else {
-			mutex_unlock(&con->sock_mutex);
-			close_connection(con, false, true, false);
+	if (!test_and_set_bit(CF_RECONNECT, &sendcon->flags))
+		dlm_io_queue(sendcon, &sendcon->swork);
 
-			/* handling for tcp shutdown */
-			clear_bit(CF_SHUTDOWN, &con->flags);
-			wake_up(&con->shutdown_wait);
-		}
+	return;
 
-		/* signal to breaking receive worker */
-		ret = -1;
-	} else {
-		mutex_unlock(&con->sock_mutex);
+out_eof:
+	log_print("connection %p got EOF from %d",
+		  con, con->nodeid);
+
+	if (dlm_proto_ops->eof_condition &&
+	    dlm_proto_ops->eof_condition(con)) {
+		set_bit(CF_EOF, &con->flags);
+		return;
 	}
-	return ret;
+
+	dlm_con_lock(sendcon);
+	close_connection(con, false);
+	dlm_con_unlock(sendcon);
 }
 
 /* Listening socket is busy, accept a connection */
@@ -1038,7 +1077,7 @@ static int accept_from_sock(struct listen_connection *con)
 
 	sock_set_mark(newsock->sk, mark);
 
-	mutex_lock(&newcon->sock_mutex);
+	dlm_con_lock(newcon);
 	if (newcon->sock) {
 		struct connection *othercon = newcon->othercon;
 
@@ -1046,7 +1085,7 @@ static int accept_from_sock(struct listen_connection *con)
 			othercon = kzalloc(sizeof(*othercon), GFP_NOFS);
 			if (!othercon) {
 				log_print("failed to allocate incoming socket");
-				mutex_unlock(&newcon->sock_mutex);
+				dlm_con_unlock(newcon);
 				srcu_read_unlock(&connections_srcu, idx);
 				result = -ENOMEM;
 				goto accept_err;
@@ -1055,24 +1094,21 @@ static int accept_from_sock(struct listen_connection *con)
 			result = dlm_con_init(othercon, nodeid);
 			if (result < 0) {
 				kfree(othercon);
-				mutex_unlock(&newcon->sock_mutex);
+				dlm_con_unlock(newcon);
 				srcu_read_unlock(&connections_srcu, idx);
 				goto accept_err;
 			}
 
-			lockdep_set_subclass(&othercon->sock_mutex, 1);
 			set_bit(CF_IS_OTHERCON, &othercon->flags);
 			newcon->othercon = othercon;
 			othercon->sendcon = newcon;
 		} else {
 			/* close other sock con if we have something new */
-			close_connection(othercon, false, true, false);
+			close_connection(othercon, false);
 		}
 
-		mutex_lock(&othercon->sock_mutex);
 		add_sock(newsock, othercon);
 		addcon = othercon;
-		mutex_unlock(&othercon->sock_mutex);
 	}
 	else {
 		/* accept copies the sk after we've saved the callbacks, so we
@@ -1083,15 +1119,14 @@ static int accept_from_sock(struct listen_connection *con)
 	}
 
 	set_bit(CF_CONNECTED, &addcon->flags);
-	mutex_unlock(&newcon->sock_mutex);
+	dlm_con_unlock(newcon);
 
 	/*
 	 * Add it to the active queue in case we got data
 	 * between processing the accept adding the socket
 	 * to the read_sockets list
 	 */
-	if (!test_and_set_bit(CF_READ_PENDING, &addcon->flags))
-		queue_work(recv_workqueue, &addcon->rwork);
+	dlm_io_queue(newcon, &addcon->rwork);
 
 	srcu_read_unlock(&connections_srcu, idx);
 
@@ -1341,7 +1376,7 @@ static void _dlm_lowcomms_commit_msg(struct dlm_msg *msg)
 	e->len = DLM_WQ_LENGTH_BYTES(e);
 	spin_unlock(&con->writequeue_lock);
 
-	queue_work(send_workqueue, &con->swork);
+	dlm_io_queue(con, &con->swork);
 	return;
 
 out:
@@ -1393,9 +1428,11 @@ static void send_to_sock(struct connection *con)
 	int len, offset, ret;
 	int count = 0;
 
-	mutex_lock(&con->sock_mutex);
-	if (con->sock == NULL)
-		goto out_connect;
+	mutex_lock(&con->swork_lock);
+	if (con->sock == NULL) {
+		dlm_io_queue(con, &con->swork);
+		goto out;
+	}
 
 	spin_lock(&con->writequeue_lock);
 	for (;;) {
@@ -1436,29 +1473,19 @@ static void send_to_sock(struct connection *con)
 		writequeue_entry_complete(e, ret);
 	}
 	spin_unlock(&con->writequeue_lock);
+	mutex_unlock(&con->swork_lock);
 
 	/* close if we got EOF */
 	if (test_and_clear_bit(CF_EOF, &con->flags)) {
-		mutex_unlock(&con->sock_mutex);
-		close_connection(con, false, false, true);
-
-		/* handling for tcp shutdown */
-		clear_bit(CF_SHUTDOWN, &con->flags);
-		wake_up(&con->shutdown_wait);
-	} else {
-		mutex_unlock(&con->sock_mutex);
+		dlm_con_lock(con);
+		close_connection(con, false);
+		dlm_con_unlock(con);
 	}
 
 	return;
 
 out:
-	mutex_unlock(&con->sock_mutex);
-	return;
-
-out_connect:
-	mutex_unlock(&con->sock_mutex);
-	queue_work(send_workqueue, &con->swork);
-	cond_resched();
+	mutex_unlock(&con->swork_lock);
 }
 
 static void clean_one_writequeue(struct connection *con)
@@ -1485,7 +1512,7 @@ int dlm_lowcomms_close(int nodeid)
 	con = nodeid2con(nodeid, 0);
 	if (con) {
 		set_bit(CF_CLOSE, &con->flags);
-		close_connection(con, true, true, true);
+		cancel_io_work(con, true);
 		clean_one_writequeue(con);
 		if (con->othercon)
 			clean_one_writequeue(con->othercon);
@@ -1509,14 +1536,16 @@ int dlm_lowcomms_close(int nodeid)
 static void process_recv_sockets(struct work_struct *work)
 {
 	struct connection *con = container_of(work, struct connection, rwork);
+	struct connection *sendcon = dlm_sendcon(con);
 
-	clear_bit(CF_READ_PENDING, &con->flags);
-	receive_from_sock(con);
+	receive_from_sock(con, sendcon);
 }
 
 static void process_listen_recv_socket(struct work_struct *work)
 {
+	mutex_lock(&listen_con.lock);
 	accept_from_sock(&listen_con);
+	mutex_unlock(&listen_con.lock);
 }
 
 static int dlm_connect(struct connection *con)
@@ -1596,49 +1625,36 @@ static void process_send_sockets(struct work_struct *work)
 
 	WARN_ON(test_bit(CF_IS_OTHERCON, &con->flags));
 
-	clear_bit(CF_WRITE_PENDING, &con->flags);
-
 	if (test_and_clear_bit(CF_RECONNECT, &con->flags)) {
-		close_connection(con, false, false, true);
+		dlm_con_lock(con);
+		close_connection(con, false);
 		dlm_midcomms_unack_msg_resend(con->nodeid);
+		dlm_con_unlock(con);
 	}
 
 	if (con->sock == NULL) { /* not mutex protected so check it inside too */
 		if (test_and_clear_bit(CF_DELAY_CONNECT, &con->flags))
 			msleep(1000);
 
+		dlm_con_lock(con);
 		dlm_connect(con);
+		dlm_con_unlock(con);
 	}
-	if (!list_empty(&con->writequeue))
-		send_to_sock(con);
+
+	send_to_sock(con);
 }
 
 static void work_stop(void)
 {
-	if (recv_workqueue) {
-		destroy_workqueue(recv_workqueue);
-		recv_workqueue = NULL;
-	}
-
-	if (send_workqueue) {
-		destroy_workqueue(send_workqueue);
-		send_workqueue = NULL;
-	}
+	destroy_workqueue(io_workqueue);
 }
 
 static int work_start(void)
 {
-	recv_workqueue = alloc_ordered_workqueue("dlm_recv", WQ_MEM_RECLAIM);
-	if (!recv_workqueue) {
-		log_print("can't start dlm_recv");
-		return -ENOMEM;
-	}
-
-	send_workqueue = alloc_ordered_workqueue("dlm_send", WQ_MEM_RECLAIM);
-	if (!send_workqueue) {
-		log_print("can't start dlm_send");
-		destroy_workqueue(recv_workqueue);
-		recv_workqueue = NULL;
+	io_workqueue = alloc_workqueue("dlm_io",
+				       WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
+	if (!io_workqueue) {
+		log_print("can't start dlm_io");
 		return -ENOMEM;
 	}
 
@@ -1660,10 +1676,7 @@ void dlm_lowcomms_shutdown(void)
 	 */
 	dlm_allow_conn = 0;
 
-	if (recv_workqueue)
-		flush_workqueue(recv_workqueue);
-	if (send_workqueue)
-		flush_workqueue(send_workqueue);
+	flush_workqueue(io_workqueue);
 
 	dlm_close_sock(&listen_con.sock);
 
@@ -1672,27 +1685,6 @@ void dlm_lowcomms_shutdown(void)
 	srcu_read_unlock(&connections_srcu, idx);
 }
 
-static void _stop_conn(struct connection *con, bool and_other)
-{
-	mutex_lock(&con->sock_mutex);
-	set_bit(CF_CLOSE, &con->flags);
-	set_bit(CF_READ_PENDING, &con->flags);
-	set_bit(CF_WRITE_PENDING, &con->flags);
-	if (con->sock && con->sock->sk) {
-		write_lock_bh(&con->sock->sk->sk_callback_lock);
-		con->sock->sk->sk_user_data = NULL;
-		write_unlock_bh(&con->sock->sk->sk_callback_lock);
-	}
-	if (con->othercon && and_other)
-		_stop_conn(con->othercon, false);
-	mutex_unlock(&con->sock_mutex);
-}
-
-static void stop_conn(struct connection *con)
-{
-	_stop_conn(con, true);
-}
-
 static void connection_release(struct rcu_head *rcu)
 {
 	struct connection *con = container_of(rcu, struct connection, rcu);
@@ -1703,7 +1695,8 @@ static void connection_release(struct rcu_head *rcu)
 
 static void free_conn(struct connection *con)
 {
-	close_connection(con, true, true, true);
+	cancel_io_work(con, true);
+
 	spin_lock(&connections_lock);
 	hlist_del_rcu(&con->list);
 	spin_unlock(&connections_lock);
@@ -1716,41 +1709,11 @@ static void free_conn(struct connection *con)
 	call_srcu(&connections_srcu, &con->rcu, connection_release);
 }
 
-static void work_flush(void)
-{
-	int ok;
-	int i;
-	struct connection *con;
-
-	do {
-		ok = 1;
-		foreach_conn(stop_conn);
-		if (recv_workqueue)
-			flush_workqueue(recv_workqueue);
-		if (send_workqueue)
-			flush_workqueue(send_workqueue);
-		for (i = 0; i < CONN_HASH_SIZE && ok; i++) {
-			hlist_for_each_entry_rcu(con, &connection_hash[i],
-						 list) {
-				ok &= test_bit(CF_READ_PENDING, &con->flags);
-				ok &= test_bit(CF_WRITE_PENDING, &con->flags);
-				if (con->othercon) {
-					ok &= test_bit(CF_READ_PENDING,
-						       &con->othercon->flags);
-					ok &= test_bit(CF_WRITE_PENDING,
-						       &con->othercon->flags);
-				}
-			}
-		}
-	} while (!ok);
-}
-
 void dlm_lowcomms_stop(void)
 {
 	int idx;
 
 	idx = srcu_read_lock(&connections_srcu);
-	work_flush();
 	foreach_conn(free_conn);
 	srcu_read_unlock(&connections_srcu, idx);
 	work_stop();
@@ -1962,6 +1925,7 @@ int dlm_lowcomms_start(void)
 		goto fail;
 	}
 
+	mutex_init(&listen_con.lock);
 	INIT_WORK(&listen_con.rwork, process_listen_recv_socket);
 
 	error = work_start();
-- 
2.26.3

