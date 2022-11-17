Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ED462E7EE
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Nov 2022 23:12:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668723140;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2fK89JjXuUX73LArAaVVmTdHxMmEP4pQTdE7A8z9QZc=;
	b=ZdP27QW0K1A+gvEcdGoHFPTlh6FjjM0rSQ70tbCFjEEAPjCV6QbmDV0rnnuZtR1IcO5BE7
	ALfhSAdMvdWuK7v4cRCVx1tXodfrZIO8FpOCf9VqfVfU33I/4bsu0nT9kDZZkS127QoaMI
	kXuYoaLP+Knq5WtRgnCyS7D6AsRpPao=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-P85uMUW-PdycVRgItvJaYQ-1; Thu, 17 Nov 2022 17:12:17 -0500
X-MC-Unique: P85uMUW-PdycVRgItvJaYQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ACF7858F17;
	Thu, 17 Nov 2022 22:12:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2EFC840C83EB;
	Thu, 17 Nov 2022 22:12:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D058019465BA;
	Thu, 17 Nov 2022 22:12:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E44751946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 22:12:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B890E2166B46; Thu, 17 Nov 2022 22:12:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F8C02166B29;
 Thu, 17 Nov 2022 22:12:10 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Nov 2022 17:11:57 -0500
Message-Id: <20221117221157.2396743-18-aahringo@redhat.com>
In-Reply-To: <20221117221157.2396743-1-aahringo@redhat.com>
References: <20221117221157.2396743-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 18/18] fs: dlm: parallelize
 lowcomms socket handling
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch is rework of lowcomms handling, the main goal was here to
handle recvmsg() and sendpage() to run parallel. Parallel in two senses:
1. per connection and 2. that recvmsg()/sendpage() doesn't block each
other.

Currently recvmsg()/sendpage() cannot run parallel because two
workqueues "dlm_recv" and "dlm_send" are ordered workqueues. That means
only one work item can be executed. The amount of queue items will be
increased about the amount of nodes being inside the cluster. The current
two workqueues for sending and receiving can also block each other if the
same connection is executed at the same time in dlm_recv and dlm_send
workqueue because a per connection mutex for the socket handling.

To make it more parallel we introduce one "dlm_io" workqueue which is
not an ordered workqueue, the amount of workers are not limited. Due
per connection flags SEND/RECV pending we schedule workers ordered per
connection and per send and receive task. To get rid of the mutex
blocking same workers to do socket handling we switched to a semaphore
which handles socket operations as read lock and sock releases as write
operations, to prevent sock_release() being called while the socket is
being used.

There might be more optimization removing the semaphore and replacing it
with other synchronization mechanism, however due other circumstances
e.g. othercon behaviour it seems complicated to doing this change. I
added comments to remove the othercon handling and moving to a different
synchronization mechanism as this is done. We need to do that to the next
dlm major version upgrade because it is not backwards compatible with the
current connect mechanism.

The processing of dlm messages need to be still handled by a ordered
workqueue. An dlm_process ordered workqueue was introduced which gets
filled by the receive worker. This is probably the next bottleneck of
DLM but the application can't currently parse dlm messages parallel. A
comment was introduced to lift the workqueue context of dlm processing
in a non-sleepable softirq to get messages processing done fast.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 1024 ++++++++++++++++++++++++---------------------
 fs/dlm/midcomms.c |   45 +-
 fs/dlm/midcomms.h |    1 +
 3 files changed, 586 insertions(+), 484 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index c6b91f67a2c2..799d1c36eabf 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -63,35 +63,43 @@
 
 #define NEEDED_RMEM (4*1024*1024)
 
-/* Number of messages to send before rescheduling */
-#define MAX_SEND_MSG_COUNT 25
-
 struct connection {
 	struct socket *sock;	/* NULL if not connected */
 	uint32_t nodeid;	/* So we know who we are in the list */
-	struct mutex sock_mutex;
+	/* this semaphore is used to allow parallel recv/send in read
+	 * lock mode. When we release a sock we need to held the write lock.
+	 *
+	 * However this is locking code and not nice. When we remove the
+	 * othercon handling we can look into other mechanism to synchronize
+	 * io handling to call sock_release() at the right time.
+	 */
+	struct rw_semaphore sock_lock;
 	unsigned long flags;
-#define CF_READ_PENDING 1
-#define CF_WRITE_PENDING 2
-#define CF_INIT_PENDING 4
+#define CF_APP_LIMITED 0
+#define CF_RECV_PENDING 1
+#define CF_SEND_PENDING 2
+#define CF_RECV_INTR 3
+#define CF_IO_STOP 4
 #define CF_IS_OTHERCON 5
-#define CF_CLOSE 6
-#define CF_APP_LIMITED 7
-#define CF_CLOSING 8
-#define CF_CONNECTED 9
-#define CF_RECONNECT 10
-#define CF_DELAY_CONNECT 11
 	struct list_head writequeue;  /* List of outgoing writequeue_entries */
 	spinlock_t writequeue_lock;
 	int retries;
-#define MAX_CONNECT_RETRIES 3
 	struct hlist_node list;
+	/* due some connect()/accept() races we currently have this cross over
+	 * connection attempt second connection for one node.
+	 *
+	 * There is a solution to avoid the race by introducing a connect
+	 * rule as e.g. our_nodeid > nodeid_to_connect who is allowed to
+	 * connect. Otherside can connect but will only be considered that
+	 * the other side wants to have a reconnect.
+	 *
+	 * However changing to this behaviour will break backwards compatible.
+	 * In a DLM protocol major version upgrade we should remove this!
+	 */
 	struct connection *othercon;
-	struct connection *sendcon;
-	struct work_struct rwork; /* Receive workqueue */
-	struct work_struct swork; /* Send workqueue */
-	unsigned char *rx_buf;
-	int rx_buflen;
+	struct work_struct rwork; /* receive worker */
+	struct work_struct swork; /* send worker */
+	unsigned char rx_leftover_buf[DLM_MAX_SOCKET_BUFSIZE];
 	int rx_leftover;
 	int mark;
 	int addr_count;
@@ -136,6 +144,14 @@ struct dlm_msg {
 	struct kref ref;
 };
 
+struct processqueue_entry {
+	unsigned char *buf;
+	int nodeid;
+	int buflen;
+
+	struct list_head list;
+};
+
 struct dlm_proto_ops {
 	bool try_new_addr;
 	const char *name;
@@ -162,8 +178,8 @@ static struct sockaddr_storage dlm_local_addr[DLM_MAX_ADDR_COUNT];
 static int dlm_local_count;
 
 /* Work queues */
-static struct workqueue_struct *recv_workqueue;
-static struct workqueue_struct *send_workqueue;
+static struct workqueue_struct *io_workqueue;
+static struct workqueue_struct *process_workqueue;
 
 static struct hlist_head connection_hash[CONN_HASH_SIZE];
 static DEFINE_SPINLOCK(connections_lock);
@@ -171,14 +187,44 @@ DEFINE_STATIC_SRCU(connections_srcu);
 
 static const struct dlm_proto_ops *dlm_proto_ops;
 
+#define DLM_IO_SUCCESS 0
+#define DLM_IO_END 1
+#define DLM_IO_EOF 2
+#define DLM_IO_RESCHED 3
+
 static void process_recv_sockets(struct work_struct *work);
 static void process_send_sockets(struct work_struct *work);
+static void process_dlm_messages(struct work_struct *work);
+
+static DECLARE_WORK(process_work, process_dlm_messages);
+static DEFINE_SPINLOCK(processqueue_lock);
+static bool process_dlm_messages_pending;
+static LIST_HEAD(processqueue);
 
 bool dlm_lowcomms_is_running(void)
 {
 	return !!listen_con.sock;
 }
 
+static void lowcomms_queue_swork(struct connection *con)
+{
+	WARN_ON_ONCE(!lockdep_is_held(&con->writequeue_lock));
+
+	if (!test_bit(CF_IO_STOP, &con->flags) &&
+	    !test_bit(CF_APP_LIMITED, &con->flags) &&
+	    !test_and_set_bit(CF_SEND_PENDING, &con->flags))
+		queue_work(io_workqueue, &con->swork);
+}
+
+static void lowcomms_queue_rwork(struct connection *con)
+{
+	WARN_ON_ONCE(!lockdep_sock_is_held(con->sock->sk));
+
+	if (!test_bit(CF_IO_STOP, &con->flags) &&
+	    !test_and_set_bit(CF_RECV_PENDING, &con->flags))
+		queue_work(io_workqueue, &con->rwork);
+}
+
 static void writequeue_entry_ctor(void *data)
 {
 	struct writequeue_entry *entry = data;
@@ -225,21 +271,15 @@ static struct connection *__find_con(int nodeid, int r)
 	return NULL;
 }
 
-static int dlm_con_init(struct connection *con, int nodeid)
+static void dlm_con_init(struct connection *con, int nodeid)
 {
-	con->rx_buflen = dlm_config.ci_buffer_size;
-	con->rx_buf = kmalloc(con->rx_buflen, GFP_NOFS);
-	if (!con->rx_buf)
-		return -ENOMEM;
-
 	con->nodeid = nodeid;
-	mutex_init(&con->sock_mutex);
+	init_rwsem(&con->sock_lock);
 	INIT_LIST_HEAD(&con->writequeue);
 	spin_lock_init(&con->writequeue_lock);
 	INIT_WORK(&con->swork, process_send_sockets);
 	INIT_WORK(&con->rwork, process_recv_sockets);
-
-	return 0;
+	spin_lock_init(&con->addrs_lock);
 }
 
 /*
@@ -249,7 +289,7 @@ static int dlm_con_init(struct connection *con, int nodeid)
 static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 {
 	struct connection *con, *tmp;
-	int r, ret;
+	int r;
 
 	r = nodeid_hash(nodeid);
 	con = __find_con(nodeid, r);
@@ -260,11 +300,7 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 	if (!con)
 		return NULL;
 
-	ret = dlm_con_init(con, nodeid);
-	if (ret) {
-		kfree(con);
-		return NULL;
-	}
+	dlm_con_init(con, nodeid);
 
 	spin_lock(&connections_lock);
 	/* Because multiple workqueues/threads calls this function it can
@@ -276,7 +312,6 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 	tmp = __find_con(nodeid, r);
 	if (tmp) {
 		spin_unlock(&connections_lock);
-		kfree(con->rx_buf);
 		kfree(con);
 		return tmp;
 	}
@@ -287,18 +322,6 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 	return con;
 }
 
-/* Loop round all connections */
-static void foreach_conn(void (*conn_func)(struct connection *c))
-{
-	int i;
-	struct connection *con;
-
-	for (i = 0; i < CONN_HASH_SIZE; i++) {
-		hlist_for_each_entry_rcu(con, &connection_hash[i], list)
-			conn_func(con);
-	}
-}
-
 static int addr_compare(const struct sockaddr_storage *x,
 			const struct sockaddr_storage *y)
 {
@@ -474,56 +497,38 @@ static void lowcomms_data_ready(struct sock *sk)
 {
 	struct connection *con = sock2con(sk);
 
-	if (!test_and_set_bit(CF_READ_PENDING, &con->flags))
-		queue_work(recv_workqueue, &con->rwork);
-}
-
-static void lowcomms_listen_data_ready(struct sock *sk)
-{
-	queue_work(recv_workqueue, &listen_con.rwork);
+	set_bit(CF_RECV_INTR, &con->flags);
+	lowcomms_queue_rwork(con);
 }
 
 static void lowcomms_write_space(struct sock *sk)
 {
 	struct connection *con = sock2con(sk);
 
-	if (!test_and_set_bit(CF_CONNECTED, &con->flags)) {
-		log_print("connected to node %d", con->nodeid);
-		queue_work(send_workqueue, &con->swork);
-		return;
-	}
-
 	clear_bit(SOCK_NOSPACE, &con->sock->flags);
 
+	spin_lock_bh(&con->writequeue_lock);
 	if (test_and_clear_bit(CF_APP_LIMITED, &con->flags)) {
 		con->sock->sk->sk_write_pending--;
 		clear_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags);
 	}
 
-	queue_work(send_workqueue, &con->swork);
-}
-
-static inline void lowcomms_connect_sock(struct connection *con)
-{
-	if (test_bit(CF_CLOSE, &con->flags))
-		return;
-	queue_work(send_workqueue, &con->swork);
-	cond_resched();
+	lowcomms_queue_swork(con);
+	spin_unlock_bh(&con->writequeue_lock);
 }
 
 static void lowcomms_state_change(struct sock *sk)
 {
 	/* SCTP layer is not calling sk_data_ready when the connection
-	 * is done, so we catch the signal through here. Also, it
-	 * doesn't switch socket state when entering shutdown, so we
-	 * skip the write in that case.
+	 * is done, so we catch the signal through here.
 	 */
-	if (sk->sk_shutdown) {
-		if (sk->sk_shutdown == RCV_SHUTDOWN)
-			lowcomms_data_ready(sk);
-	} else if (sk->sk_state == TCP_ESTABLISHED) {
-		lowcomms_write_space(sk);
-	}
+	if (sk->sk_shutdown == RCV_SHUTDOWN)
+		lowcomms_data_ready(sk);
+}
+
+static void lowcomms_listen_data_ready(struct sock *sk)
+{
+	queue_work(io_workqueue, &listen_con.rwork);
 }
 
 int dlm_lowcomms_connect_node(int nodeid)
@@ -541,9 +546,16 @@ int dlm_lowcomms_connect_node(int nodeid)
 		return -ENOENT;
 	}
 
-	lowcomms_connect_sock(con);
+	down_read(&con->sock_lock);
+	if (!con->sock) {
+		spin_lock_bh(&con->writequeue_lock);
+		lowcomms_queue_swork(con);
+		spin_unlock_bh(&con->writequeue_lock);
+	}
+	up_read(&con->sock_lock);
 	srcu_read_unlock(&connections_srcu, idx);
 
+	cond_resched();
 	return 0;
 }
 
@@ -596,39 +608,23 @@ static void lowcomms_error_report(struct sock *sk)
 				   "invalid socket family %d set, "
 				   "sk_err=%d/%d\n", dlm_our_nodeid(),
 				   sk->sk_family, sk->sk_err, sk->sk_err_soft);
-		goto out;
-	}
-
-	/* below sendcon only handling */
-	if (test_bit(CF_IS_OTHERCON, &con->flags))
-		con = con->sendcon;
-
-	switch (sk->sk_err) {
-	case ECONNREFUSED:
-		set_bit(CF_DELAY_CONNECT, &con->flags);
-		break;
-	default:
 		break;
 	}
 
-	if (!test_and_set_bit(CF_RECONNECT, &con->flags))
-		queue_work(send_workqueue, &con->swork);
+	dlm_midcomms_unack_msg_resend(con->nodeid);
 
-out:
 	listen_sock.sk_error_report(sk);
 }
 
-static void restore_callbacks(struct socket *sock)
+static void restore_callbacks(struct sock *sk)
 {
-	struct sock *sk = sock->sk;
+	WARN_ON_ONCE(!lockdep_sock_is_held(sk));
 
-	lock_sock(sk);
 	sk->sk_user_data = NULL;
 	sk->sk_data_ready = listen_sock.sk_data_ready;
 	sk->sk_state_change = listen_sock.sk_state_change;
 	sk->sk_write_space = listen_sock.sk_write_space;
 	sk->sk_error_report = listen_sock.sk_error_report;
-	release_sock(sk);
 }
 
 /* Make a socket active */
@@ -640,10 +636,10 @@ static void add_sock(struct socket *sock, struct connection *con)
 	con->sock = sock;
 
 	sk->sk_user_data = con;
-	/* Install a data_ready callback */
 	sk->sk_data_ready = lowcomms_data_ready;
 	sk->sk_write_space = lowcomms_write_space;
-	sk->sk_state_change = lowcomms_state_change;
+	if (dlm_config.ci_protocol == DLM_PROTO_SCTP)
+		sk->sk_state_change = lowcomms_state_change;
 	sk->sk_allocation = GFP_NOFS;
 	sk->sk_error_report = lowcomms_error_report;
 	release_sock(sk);
@@ -705,37 +701,62 @@ static void free_entry(struct writequeue_entry *e)
 
 static void dlm_close_sock(struct socket **sock)
 {
-	if (*sock) {
-		restore_callbacks(*sock);
-		sock_release(*sock);
-		*sock = NULL;
+	lock_sock((*sock)->sk);
+	restore_callbacks((*sock)->sk);
+	release_sock((*sock)->sk);
+
+	sock_release(*sock);
+	*sock = NULL;
+}
+
+static void allow_connection_io(struct connection *con)
+{
+	if (con->othercon)
+		clear_bit(CF_IO_STOP, &con->othercon->flags);
+	clear_bit(CF_IO_STOP, &con->flags);
+}
+
+static void stop_connection_io(struct connection *con)
+{
+	if (con->othercon)
+		stop_connection_io(con->othercon);
+
+	down_write(&con->sock_lock);
+	if (con->sock) {
+		lock_sock(con->sock->sk);
+		restore_callbacks(con->sock->sk);
+
+		spin_lock_bh(&con->writequeue_lock);
+		set_bit(CF_IO_STOP, &con->flags);
+		spin_unlock_bh(&con->writequeue_lock);
+		release_sock(con->sock->sk);
+	} else {
+		spin_lock_bh(&con->writequeue_lock);
+		set_bit(CF_IO_STOP, &con->flags);
+		spin_unlock_bh(&con->writequeue_lock);
 	}
+	up_write(&con->sock_lock);
+
+	cancel_work_sync(&con->swork);
+	cancel_work_sync(&con->rwork);
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
+	if (con->othercon && and_other)
+		close_connection(con->othercon, false);
+
+	down_write(&con->sock_lock);
+	if (!con->sock) {
+		up_write(&con->sock_lock);
+		return;
 	}
 
-	mutex_lock(&con->sock_mutex);
 	dlm_close_sock(&con->sock);
 
-	if (con->othercon && and_other) {
-		/* Will only re-enter once. */
-		close_connection(con->othercon, false, tx, rx);
-	}
-
 	/* if we send a writequeue entry only a half way, we drop the
 	 * whole entry because reconnection and that we not start of the
 	 * middle of a msg which will confuse the other end.
@@ -747,143 +768,209 @@ static void close_connection(struct connection *con, bool and_other,
 	 * our policy is to start on a clean state when disconnects, we don't
 	 * know what's send/received on transport layer in this case.
 	 */
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	if (!list_empty(&con->writequeue)) {
 		e = list_first_entry(&con->writequeue, struct writequeue_entry,
 				     list);
 		if (e->dirty)
 			free_entry(e);
 	}
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 
 	con->rx_leftover = 0;
 	con->retries = 0;
 	clear_bit(CF_APP_LIMITED, &con->flags);
-	clear_bit(CF_CONNECTED, &con->flags);
-	clear_bit(CF_DELAY_CONNECT, &con->flags);
-	clear_bit(CF_RECONNECT, &con->flags);
-	mutex_unlock(&con->sock_mutex);
-	clear_bit(CF_CLOSING, &con->flags);
+	clear_bit(CF_RECV_PENDING, &con->flags);
+	clear_bit(CF_SEND_PENDING, &con->flags);
+	up_write(&con->sock_lock);
 }
 
-static int con_realloc_receive_buf(struct connection *con, int newlen)
+static struct processqueue_entry *new_processqueue_entry(int nodeid,
+							 int buflen)
 {
-	unsigned char *newbuf;
-
-	newbuf = kmalloc(newlen, GFP_NOFS);
-	if (!newbuf)
-		return -ENOMEM;
+	struct processqueue_entry *pentry;
 
-	/* copy any leftover from last receive */
-	if (con->rx_leftover)
-		memmove(newbuf, con->rx_buf, con->rx_leftover);
+	pentry = kmalloc(sizeof(*pentry), GFP_NOFS);
+	if (!pentry)
+		return NULL;
 
-	/* swap to new buffer space */
-	kfree(con->rx_buf);
-	con->rx_buflen = newlen;
-	con->rx_buf = newbuf;
+	pentry->buf = kmalloc(buflen, GFP_NOFS);
+	if (!pentry->buf) {
+		kfree(pentry);
+		return NULL;
+	}
 
-	return 0;
+	pentry->nodeid = nodeid;
+	return pentry;
 }
 
-/* Data received from remote end */
-static int receive_from_sock(struct connection *con)
+static void free_processqueue_entry(struct processqueue_entry *pentry)
 {
-	struct msghdr msg;
-	struct kvec iov;
-	int ret, buflen;
+	kfree(pentry->buf);
+	kfree(pentry);
+}
+
+struct dlm_processed_nodes {
+	int nodeid;
 
-	mutex_lock(&con->sock_mutex);
+	struct list_head list;
+};
 
-	if (con->sock == NULL) {
-		ret = -EAGAIN;
-		goto out_close;
+static void add_processed_node(int nodeid, struct list_head *processed_nodes)
+{
+	struct dlm_processed_nodes *n;
+
+	list_for_each_entry(n, processed_nodes, list) {
+		/* we already remembered this node */
+		if (n->nodeid == nodeid)
+			return;
 	}
 
-	/* realloc if we get new buffer size to read out */
-	buflen = dlm_config.ci_buffer_size;
-	if (con->rx_buflen != buflen && con->rx_leftover <= buflen) {
-		ret = con_realloc_receive_buf(con, buflen);
-		if (ret < 0)
-			goto out_resched;
+	/* if it's fails in worst case we simple don't send an ack back.
+	 * We try it next time.
+	 */
+	n = kmalloc(sizeof(*n), GFP_NOFS);
+	if (!n)
+		return;
+
+	n->nodeid = nodeid;
+	list_add(&n->list, processed_nodes);
+}
+
+static void process_dlm_messages(struct work_struct *work)
+{
+	struct dlm_processed_nodes *n, *n_tmp;
+	struct processqueue_entry *pentry;
+	LIST_HEAD(processed_nodes);
+
+	spin_lock(&processqueue_lock);
+	pentry = list_first_entry_or_null(&processqueue,
+					  struct processqueue_entry, list);
+	if (WARN_ON_ONCE(!pentry)) {
+		spin_unlock(&processqueue_lock);
+		return;
 	}
 
+	list_del(&pentry->list);
+	spin_unlock(&processqueue_lock);
+
 	for (;;) {
-		/* calculate new buffer parameter regarding last receive and
-		 * possible leftover bytes
-		 */
-		iov.iov_base = con->rx_buf + con->rx_leftover;
-		iov.iov_len = con->rx_buflen - con->rx_leftover;
-
-		memset(&msg, 0, sizeof(msg));
-		msg.msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
-		ret = kernel_recvmsg(con->sock, &msg, &iov, 1, iov.iov_len,
-				     msg.msg_flags);
-		trace_dlm_recv(con->nodeid, ret);
-		if (ret == -EAGAIN)
+		dlm_process_incoming_buffer(pentry->nodeid, pentry->buf,
+					    pentry->buflen);
+		add_processed_node(pentry->nodeid, &processed_nodes);
+		free_processqueue_entry(pentry);
+
+		spin_lock(&processqueue_lock);
+		pentry = list_first_entry_or_null(&processqueue,
+						  struct processqueue_entry, list);
+		if (!pentry) {
+			process_dlm_messages_pending = false;
+			spin_unlock(&processqueue_lock);
 			break;
-		else if (ret <= 0)
-			goto out_close;
-
-		/* new buflen according readed bytes and leftover from last receive */
-		buflen = ret + con->rx_leftover;
-		ret = dlm_process_incoming_buffer(con->nodeid, con->rx_buf, buflen);
-		if (ret < 0)
-			goto out_close;
-
-		/* calculate leftover bytes from process and put it into begin of
-		 * the receive buffer, so next receive we have the full message
-		 * at the start address of the receive buffer.
-		 */
-		con->rx_leftover = buflen - ret;
-		if (con->rx_leftover) {
-			memmove(con->rx_buf, con->rx_buf + ret,
-				con->rx_leftover);
 		}
+
+		list_del(&pentry->list);
+		spin_unlock(&processqueue_lock);
+	}
+
+	/* send ack back after we processed couple of messages */
+	list_for_each_entry_safe(n, n_tmp, &processed_nodes, list) {
+		list_del(&n->list);
+		dlm_midcomms_receive_done(n->nodeid);
+		kfree(n);
+	}
+}
+
+/* Data received from remote end */
+static int receive_from_sock(struct connection *con, int buflen)
+{
+	struct processqueue_entry *pentry;
+	int ret, buflen_real;
+	struct msghdr msg;
+	struct kvec iov;
+
+	pentry = new_processqueue_entry(con->nodeid, buflen);
+	if (!pentry)
+		return DLM_IO_RESCHED;
+
+	memcpy(pentry->buf, con->rx_leftover_buf, con->rx_leftover);
+
+	/* calculate new buffer parameter regarding last receive and
+	 * possible leftover bytes
+	 */
+	iov.iov_base = pentry->buf + con->rx_leftover;
+	iov.iov_len = buflen - con->rx_leftover;
+
+	memset(&msg, 0, sizeof(msg));
+	msg.msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
+	clear_bit(CF_RECV_INTR, &con->flags);
+again:
+	ret = kernel_recvmsg(con->sock, &msg, &iov, 1, iov.iov_len,
+			     msg.msg_flags);
+	trace_dlm_recv(con->nodeid, ret);
+	if (ret == -EAGAIN) {
+		lock_sock(con->sock->sk);
+		if (test_and_clear_bit(CF_RECV_INTR, &con->flags)) {
+			release_sock(con->sock->sk);
+			goto again;
+		}
+
+		clear_bit(CF_RECV_PENDING, &con->flags);
+		release_sock(con->sock->sk);
+		free_processqueue_entry(pentry);
+		return DLM_IO_END;
+	} else if (ret == 0) {
+		/* close will clear CF_RECV_PENDING */
+		free_processqueue_entry(pentry);
+		return DLM_IO_EOF;
+	} else if (ret < 0) {
+		free_processqueue_entry(pentry);
+		return ret;
 	}
 
-	dlm_midcomms_receive_done(con->nodeid);
-	mutex_unlock(&con->sock_mutex);
-	return 0;
+	/* new buflen according readed bytes and leftover from last receive */
+	buflen_real = ret + con->rx_leftover;
+	ret = dlm_validate_incoming_buffer(con->nodeid, pentry->buf,
+					   buflen_real);
+	if (ret < 0) {
+		free_processqueue_entry(pentry);
+		return ret;
+	}
 
-out_resched:
-	if (!test_and_set_bit(CF_READ_PENDING, &con->flags))
-		queue_work(recv_workqueue, &con->rwork);
-	mutex_unlock(&con->sock_mutex);
-	return -EAGAIN;
-
-out_close:
-	if (ret == 0) {
-		log_print("connection %p got EOF from %d",
-			  con, con->nodeid);
-
-		mutex_unlock(&con->sock_mutex);
-		close_connection(con, false, true, false);
-		/* signal to breaking receive worker */
-		ret = -1;
-	} else {
-		mutex_unlock(&con->sock_mutex);
+	pentry->buflen = ret;
+
+	/* calculate leftover bytes from process and put it into begin of
+	 * the receive buffer, so next receive we have the full message
+	 * at the start address of the receive buffer.
+	 */
+	con->rx_leftover = buflen_real - ret;
+	memmove(con->rx_leftover_buf, pentry->buf + ret,
+		con->rx_leftover);
+
+	spin_lock(&processqueue_lock);
+	list_add_tail(&pentry->list, &processqueue);
+	if (!process_dlm_messages_pending) {
+		process_dlm_messages_pending = true;
+		queue_work(process_workqueue, &process_work);
 	}
-	return ret;
+	spin_unlock(&processqueue_lock);
+
+	return DLM_IO_SUCCESS;
 }
 
 /* Listening socket is busy, accept a connection */
-static int accept_from_sock(struct listen_connection *con)
+static int accept_from_sock(void)
 {
-	int result;
 	struct sockaddr_storage peeraddr;
-	struct socket *newsock;
-	int len, idx;
-	int nodeid;
+	int len, idx, result, nodeid;
 	struct connection *newcon;
-	struct connection *addcon;
+	struct socket *newsock;
 	unsigned int mark;
 
-	if (!con->sock)
-		return -ENOTCONN;
-
-	result = kernel_accept(con->sock, &newsock, O_NONBLOCK);
-	if (result < 0)
+	result = kernel_accept(listen_con.sock, &newsock, O_NONBLOCK);
+	if (result == -EAGAIN)
+		return DLM_IO_END;
+	else if (result < 0)
 		goto accept_err;
 
 	/* Get the connected socket's peer */
@@ -940,7 +1027,7 @@ static int accept_from_sock(struct listen_connection *con)
 
 	sock_set_mark(newsock->sk, mark);
 
-	mutex_lock(&newcon->sock_mutex);
+	down_write(&newcon->sock_lock);
 	if (newcon->sock) {
 		struct connection *othercon = newcon->othercon;
 
@@ -948,63 +1035,50 @@ static int accept_from_sock(struct listen_connection *con)
 			othercon = kzalloc(sizeof(*othercon), GFP_NOFS);
 			if (!othercon) {
 				log_print("failed to allocate incoming socket");
-				mutex_unlock(&newcon->sock_mutex);
+				up_write(&newcon->sock_lock);
 				srcu_read_unlock(&connections_srcu, idx);
 				result = -ENOMEM;
 				goto accept_err;
 			}
 
-			result = dlm_con_init(othercon, nodeid);
-			if (result < 0) {
-				kfree(othercon);
-				mutex_unlock(&newcon->sock_mutex);
-				srcu_read_unlock(&connections_srcu, idx);
-				goto accept_err;
-			}
-
-			lockdep_set_subclass(&othercon->sock_mutex, 1);
-			set_bit(CF_IS_OTHERCON, &othercon->flags);
+			dlm_con_init(othercon, nodeid);
+			lockdep_set_subclass(&othercon->sock_lock, 1);
 			newcon->othercon = othercon;
-			othercon->sendcon = newcon;
+			set_bit(CF_IS_OTHERCON, &othercon->flags);
 		} else {
 			/* close other sock con if we have something new */
-			close_connection(othercon, false, true, false);
+			close_connection(othercon, false);
 		}
 
-		mutex_lock(&othercon->sock_mutex);
+		down_write(&othercon->sock_lock);
 		add_sock(newsock, othercon);
-		addcon = othercon;
-		mutex_unlock(&othercon->sock_mutex);
+
+		/* check if we receved something while adding */
+		lock_sock(othercon->sock->sk);
+		lowcomms_queue_rwork(othercon);
+		release_sock(othercon->sock->sk);
+		up_write(&othercon->sock_lock);
 	}
 	else {
 		/* accept copies the sk after we've saved the callbacks, so we
 		   don't want to save them a second time or comm errors will
 		   result in calling sk_error_report recursively. */
 		add_sock(newsock, newcon);
-		addcon = newcon;
-	}
-
-	set_bit(CF_CONNECTED, &addcon->flags);
-	mutex_unlock(&newcon->sock_mutex);
-
-	/*
-	 * Add it to the active queue in case we got data
-	 * between processing the accept adding the socket
-	 * to the read_sockets list
-	 */
-	if (!test_and_set_bit(CF_READ_PENDING, &addcon->flags))
-		queue_work(recv_workqueue, &addcon->rwork);
 
+		/* check if we receved something while adding */
+		lock_sock(newcon->sock->sk);
+		lowcomms_queue_rwork(newcon);
+		release_sock(newcon->sock->sk);
+	}
+	up_write(&newcon->sock_lock);
 	srcu_read_unlock(&connections_srcu, idx);
 
-	return 0;
+	return DLM_IO_SUCCESS;
 
 accept_err:
 	if (newsock)
 		sock_release(newsock);
 
-	if (result != -EAGAIN)
-		log_print("error accepting connection from node: %d", result);
 	return result;
 }
 
@@ -1098,7 +1172,7 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 {
 	struct writequeue_entry *e;
 
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	if (!list_empty(&con->writequeue)) {
 		e = list_last_entry(&con->writequeue, struct writequeue_entry, list);
 		if (DLM_WQ_REMAIN_BYTES(e) >= len) {
@@ -1127,7 +1201,7 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 	list_add_tail(&e->list, &con->writequeue);
 
 out:
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 	return e;
 };
 
@@ -1176,7 +1250,7 @@ struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
 	    len < sizeof(struct dlm_header)) {
 		BUILD_BUG_ON(PAGE_SIZE < DLM_MAX_SOCKET_BUFSIZE);
 		log_print("failed to allocate a buffer of size %d", len);
-		WARN_ON(1);
+		WARN_ON_ONCE(1);
 		return NULL;
 	}
 
@@ -1207,7 +1281,7 @@ static void _dlm_lowcomms_commit_msg(struct dlm_msg *msg)
 	struct connection *con = e->con;
 	int users;
 
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	kref_get(&msg->ref);
 	list_add(&msg->list, &e->msgs);
 
@@ -1216,13 +1290,11 @@ static void _dlm_lowcomms_commit_msg(struct dlm_msg *msg)
 		goto out;
 
 	e->len = DLM_WQ_LENGTH_BYTES(e);
-	spin_unlock(&con->writequeue_lock);
 
-	queue_work(send_workqueue, &con->swork);
-	return;
+	lowcomms_queue_swork(con);
 
 out:
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 	return;
 }
 
@@ -1244,7 +1316,7 @@ void dlm_lowcomms_put_msg(struct dlm_msg *msg)
 	kref_put(&msg->ref, dlm_msg_release);
 }
 
-/* does not held connections_srcu, usage workqueue only */
+/* does not held connections_srcu, usage lowcomms_error_report only */
 int dlm_lowcomms_resend_msg(struct dlm_msg *msg)
 {
 	struct dlm_msg *msg_resend;
@@ -1270,88 +1342,78 @@ int dlm_lowcomms_resend_msg(struct dlm_msg *msg)
 }
 
 /* Send a message */
-static void send_to_sock(struct connection *con)
+static int send_to_sock(struct connection *con)
 {
 	const int msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
 	struct writequeue_entry *e;
 	int len, offset, ret;
-	int count;
-
-again:
-	count = 0;
 
-	mutex_lock(&con->sock_mutex);
-	if (con->sock == NULL)
-		goto out_connect;
-
-	spin_lock(&con->writequeue_lock);
-	for (;;) {
-		e = con_next_wq(con);
-		if (!e)
-			break;
-
-		len = e->len;
-		offset = e->offset;
-		BUG_ON(len == 0 && e->users == 0);
-		spin_unlock(&con->writequeue_lock);
-
-		ret = kernel_sendpage(con->sock, e->page, offset, len,
-				      msg_flags);
-		trace_dlm_send(con->nodeid, ret);
-		if (ret == -EAGAIN || ret == 0) {
-			if (ret == -EAGAIN &&
-			    test_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags) &&
-			    !test_and_set_bit(CF_APP_LIMITED, &con->flags)) {
-				/* Notify TCP that we're limited by the
-				 * application window size.
-				 */
-				set_bit(SOCK_NOSPACE, &con->sock->flags);
-				con->sock->sk->sk_write_pending++;
-			}
-			cond_resched();
-			goto out;
-		} else if (ret < 0)
-			goto out;
+	spin_lock_bh(&con->writequeue_lock);
+	e = con_next_wq(con);
+	if (!e) {
+		clear_bit(CF_SEND_PENDING, &con->flags);
+		spin_unlock_bh(&con->writequeue_lock);
+		return DLM_IO_END;
+	}
 
-		spin_lock(&con->writequeue_lock);
-		writequeue_entry_complete(e, ret);
+	len = e->len;
+	offset = e->offset;
+	WARN_ON_ONCE(len == 0 && e->users == 0);
+	spin_unlock_bh(&con->writequeue_lock);
 
-		/* Don't starve people filling buffers */
-		if (++count >= MAX_SEND_MSG_COUNT) {
-			spin_unlock(&con->writequeue_lock);
-			mutex_unlock(&con->sock_mutex);
-			cond_resched();
-			goto again;
+	ret = kernel_sendpage(con->sock, e->page, offset, len,
+			      msg_flags);
+	trace_dlm_send(con->nodeid, ret);
+	if (ret == -EAGAIN || ret == 0) {
+		lock_sock(con->sock->sk);
+		spin_lock_bh(&con->writequeue_lock);
+		if (test_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags) &&
+		    !test_and_set_bit(CF_APP_LIMITED, &con->flags)) {
+			/* Notify TCP that we're limited by the
+			 * application window size.
+			 */
+			set_bit(SOCK_NOSPACE, &con->sock->sk->sk_socket->flags);
+			con->sock->sk->sk_write_pending++;
+
+			clear_bit(CF_SEND_PENDING, &con->flags);
+			spin_unlock_bh(&con->writequeue_lock);
+			release_sock(con->sock->sk);
+
+			/* wait for write_space() event */
+			return DLM_IO_END;
 		}
+		spin_unlock_bh(&con->writequeue_lock);
+		release_sock(con->sock->sk);
+
+		return DLM_IO_RESCHED;
+	} else if (ret < 0) {
+		return ret;
 	}
-	spin_unlock(&con->writequeue_lock);
 
-out:
-	mutex_unlock(&con->sock_mutex);
-	return;
+	spin_lock_bh(&con->writequeue_lock);
+	writequeue_entry_complete(e, ret);
+	spin_unlock_bh(&con->writequeue_lock);
 
-out_connect:
-	mutex_unlock(&con->sock_mutex);
-	queue_work(send_workqueue, &con->swork);
-	cond_resched();
+	return DLM_IO_SUCCESS;
 }
 
 static void clean_one_writequeue(struct connection *con)
 {
 	struct writequeue_entry *e, *safe;
 
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	list_for_each_entry_safe(e, safe, &con->writequeue, list) {
 		free_entry(e);
 	}
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 }
 
 static void connection_release(struct rcu_head *rcu)
 {
 	struct connection *con = container_of(rcu, struct connection, rcu);
 
-	kfree(con->rx_buf);
+	WARN_ON_ONCE(!list_empty(&con->writequeue));
+	WARN_ON_ONCE(con->sock);
 	kfree(con);
 }
 
@@ -1371,12 +1433,14 @@ int dlm_lowcomms_close(int nodeid)
 		return -ENOENT;
 	}
 
+	stop_connection_io(con);
+	log_print("io handling for node: %d stopped", nodeid);
+	close_connection(con, true);
+
 	spin_lock(&connections_lock);
 	hlist_del_rcu(&con->list);
 	spin_unlock(&connections_lock);
 
-	close_connection(con, true, true, true);
-
 	clean_one_writequeue(con);
 	call_srcu(&connections_srcu, &con->rcu, connection_release);
 	if (con->othercon) {
@@ -1386,148 +1450,238 @@ int dlm_lowcomms_close(int nodeid)
 	}
 	srcu_read_unlock(&connections_srcu, idx);
 
+	/* for debugging we print when we are done to compare with other
+	 * messages in between. This function need to be correctly synchronized
+	 * with io handling
+	 */
+	log_print("closing connection to node %d done", nodeid);
+
 	return 0;
 }
 
-/* Receive workqueue function */
+/* Receive worker function */
 static void process_recv_sockets(struct work_struct *work)
 {
 	struct connection *con = container_of(work, struct connection, rwork);
+	int ret, buflen;
 
-	clear_bit(CF_READ_PENDING, &con->flags);
-	receive_from_sock(con);
+	down_read(&con->sock_lock);
+	if (!con->sock) {
+		up_read(&con->sock_lock);
+		return;
+	}
+
+	buflen = READ_ONCE(dlm_config.ci_buffer_size);
+	do {
+		ret = receive_from_sock(con, buflen);
+	} while (ret == DLM_IO_SUCCESS);
+	up_read(&con->sock_lock);
+
+	switch (ret) {
+	case DLM_IO_END:
+		/* CF_RECV_PENDING cleared */
+		break;
+	case DLM_IO_EOF:
+		close_connection(con, false);
+		/* CF_RECV_PENDING cleared */
+		break;
+	case DLM_IO_RESCHED:
+		cond_resched();
+		queue_work(io_workqueue, &con->rwork);
+		/* CF_RECV_PENDING not cleared */
+		break;
+	default:
+		if (ret < 0) {
+			if (test_bit(CF_IS_OTHERCON, &con->flags)) {
+				close_connection(con, false);
+			} else {
+				spin_lock_bh(&con->writequeue_lock);
+				lowcomms_queue_swork(con);
+				spin_unlock_bh(&con->writequeue_lock);
+			}
+
+			/* CF_RECV_PENDING cleared for othercon
+			 * we trigger send queue if not already done
+			 * and process_send_sockets will handle it
+			 */
+			break;
+		}
+
+		WARN_ON_ONCE(1);
+		break;
+	}
 }
 
 static void process_listen_recv_socket(struct work_struct *work)
 {
 	int ret;
 
+	if (WARN_ON_ONCE(!listen_con.sock))
+		return;
+
 	do {
-		ret = accept_from_sock(&listen_con);
-	} while (!ret);
+		ret = accept_from_sock();
+	} while (ret == DLM_IO_SUCCESS);
+
+	if (ret < 0)
+		log_print("critical error accepting connection: %d", ret);
 }
 
-static void dlm_connect(struct connection *con)
+static int dlm_connect(struct connection *con)
 {
 	struct sockaddr_storage addr;
 	int result, addr_len;
 	struct socket *sock;
 	unsigned int mark;
 
-	/* Some odd races can cause double-connects, ignore them */
-	if (con->retries++ > MAX_CONNECT_RETRIES)
-		return;
-
-	if (con->sock) {
-		log_print("node %d already connected.", con->nodeid);
-		return;
-	}
-
 	memset(&addr, 0, sizeof(addr));
 	result = nodeid_to_addr(con->nodeid, &addr, NULL,
 				dlm_proto_ops->try_new_addr, &mark);
 	if (result < 0) {
 		log_print("no address for nodeid %d", con->nodeid);
-		return;
+		return result;
 	}
 
 	/* Create a socket to communicate with */
 	result = sock_create_kern(&init_net, dlm_local_addr[0].ss_family,
 				  SOCK_STREAM, dlm_proto_ops->proto, &sock);
 	if (result < 0)
-		goto socket_err;
+		return result;
 
 	sock_set_mark(sock->sk, mark);
 	dlm_proto_ops->sockopts(sock);
 
-	add_sock(sock, con);
-
 	result = dlm_proto_ops->bind(sock);
-	if (result < 0)
-		goto add_sock_err;
+	if (result < 0) {
+		sock_release(sock);
+		return result;
+	}
+
+	add_sock(sock, con);
 
 	log_print_ratelimited("connecting to %d", con->nodeid);
 	make_sockaddr(&addr, dlm_config.ci_tcp_port, &addr_len);
 	result = dlm_proto_ops->connect(con, sock, (struct sockaddr *)&addr,
 					addr_len);
-	if (result < 0)
-		goto add_sock_err;
-
-	return;
-
-add_sock_err:
-	dlm_close_sock(&con->sock);
+	switch (result) {
+	case -EINPROGRESS:
+		/* not an error */
+		fallthrough;
+	case 0:
+		break;
+	default:
+		if (result < 0)
+			dlm_close_sock(&con->sock);
 
-socket_err:
-	/*
-	 * Some errors are fatal and this list might need adjusting. For other
-	 * errors we try again until the max number of retries is reached.
-	 */
-	if (result != -EHOSTUNREACH &&
-	    result != -ENETUNREACH &&
-	    result != -ENETDOWN &&
-	    result != -EINVAL &&
-	    result != -EPROTONOSUPPORT) {
-		log_print("connect %d try %d error %d", con->nodeid,
-			  con->retries, result);
-		msleep(1000);
-		lowcomms_connect_sock(con);
+		break;
 	}
+
+	return result;
 }
 
-/* Send workqueue function */
+/* Send worker function */
 static void process_send_sockets(struct work_struct *work)
 {
 	struct connection *con = container_of(work, struct connection, swork);
+	int ret;
 
-	WARN_ON(test_bit(CF_IS_OTHERCON, &con->flags));
+	WARN_ON_ONCE(test_bit(CF_IS_OTHERCON, &con->flags));
+
+	down_read(&con->sock_lock);
+	if (!con->sock) {
+		up_read(&con->sock_lock);
+		down_write(&con->sock_lock);
+		if (!con->sock) {
+			ret = dlm_connect(con);
+			switch (ret) {
+			case 0:
+				break;
+			case -EINPROGRESS:
+				/* avoid spamming resched on connection
+				 * we might can switch to a state_change
+				 * event based mechanism if established
+				 */
+				msleep(100);
+				break;
+			default:
+				/* CF_SEND_PENDING not cleared */
+				up_write(&con->sock_lock);
+				log_print("connect to node %d try %d error %d",
+					  con->nodeid, con->retries++, ret);
+				msleep(1000);
+				/* For now we try forever to reconnect. In
+				 * future we should send a event to cluster
+				 * manager to fence itself after certain amount
+				 * of retries.
+				 */
+				queue_work(io_workqueue, &con->swork);
+				return;
+			}
+		}
+		downgrade_write(&con->sock_lock);
+	}
 
-	clear_bit(CF_WRITE_PENDING, &con->flags);
+	do {
+		ret = send_to_sock(con);
+	} while (ret == DLM_IO_SUCCESS);
+	up_read(&con->sock_lock);
 
-	if (test_and_clear_bit(CF_RECONNECT, &con->flags)) {
-		close_connection(con, false, false, true);
-		dlm_midcomms_unack_msg_resend(con->nodeid);
-	}
+	switch (ret) {
+	case DLM_IO_END:
+		/* CF_SEND_PENDING cleared */
+		break;
+	case DLM_IO_RESCHED:
+		/* CF_SEND_PENDING not cleared */
+		cond_resched();
+		queue_work(io_workqueue, &con->swork);
+		break;
+	default:
+		if (ret < 0) {
+			close_connection(con, false);
 
-	if (con->sock == NULL) {
-		if (test_and_clear_bit(CF_DELAY_CONNECT, &con->flags))
-			msleep(1000);
+			/* CF_SEND_PENDING cleared */
+			spin_lock_bh(&con->writequeue_lock);
+			lowcomms_queue_swork(con);
+			spin_unlock_bh(&con->writequeue_lock);
+			break;
+		}
 
-		mutex_lock(&con->sock_mutex);
-		dlm_connect(con);
-		mutex_unlock(&con->sock_mutex);
+		WARN_ON_ONCE(1);
+		break;
 	}
-
-	if (!list_empty(&con->writequeue))
-		send_to_sock(con);
 }
 
 static void work_stop(void)
 {
-	if (recv_workqueue) {
-		destroy_workqueue(recv_workqueue);
-		recv_workqueue = NULL;
+	if (io_workqueue) {
+		destroy_workqueue(io_workqueue);
+		io_workqueue = NULL;
 	}
 
-	if (send_workqueue) {
-		destroy_workqueue(send_workqueue);
-		send_workqueue = NULL;
+	if (process_workqueue) {
+		destroy_workqueue(process_workqueue);
+		process_workqueue = NULL;
 	}
 }
 
 static int work_start(void)
 {
-	recv_workqueue = alloc_ordered_workqueue("dlm_recv", WQ_MEM_RECLAIM);
-	if (!recv_workqueue) {
-		log_print("can't start dlm_recv");
+	io_workqueue = alloc_workqueue("dlm_io", WQ_HIGHPRI | WQ_MEM_RECLAIM,
+				       0);
+	if (!io_workqueue) {
+		log_print("can't start dlm_io");
 		return -ENOMEM;
 	}
 
-	send_workqueue = alloc_ordered_workqueue("dlm_send", WQ_MEM_RECLAIM);
-	if (!send_workqueue) {
-		log_print("can't start dlm_send");
-		destroy_workqueue(recv_workqueue);
-		recv_workqueue = NULL;
+	/* ordered dlm message process queue,
+	 * should be converted to a tasklet
+	 */
+	process_workqueue = alloc_ordered_workqueue("dlm_process",
+						    WQ_HIGHPRI | WQ_MEM_RECLAIM);
+	if (!process_workqueue) {
+		log_print("can't start dlm_process");
+		destroy_workqueue(io_workqueue);
+		io_workqueue = NULL;
 		return -ENOMEM;
 	}
 
@@ -1543,6 +1697,8 @@ void dlm_lowcomms_shutdown(void)
 
 	cancel_work_sync(&listen_con.rwork);
 	dlm_close_sock(&listen_con.sock);
+
+	flush_workqueue(process_workqueue);
 }
 
 void dlm_lowcomms_shutdown_node(int nodeid, bool force)
@@ -1558,79 +1714,19 @@ void dlm_lowcomms_shutdown_node(int nodeid, bool force)
 	}
 
 	flush_work(&con->swork);
+	stop_connection_io(con);
 	WARN_ON_ONCE(!force && !list_empty(&con->writequeue));
+	close_connection(con, true);
 	clean_one_writequeue(con);
 	if (con->othercon)
 		clean_one_writequeue(con->othercon);
-	close_connection(con, true, true, true);
+	allow_connection_io(con);
 	srcu_read_unlock(&connections_srcu, idx);
 }
 
-static void _stop_conn(struct connection *con, bool and_other)
-{
-	mutex_lock(&con->sock_mutex);
-	set_bit(CF_CLOSE, &con->flags);
-	set_bit(CF_READ_PENDING, &con->flags);
-	set_bit(CF_WRITE_PENDING, &con->flags);
-	if (con->sock && con->sock->sk) {
-		lock_sock(con->sock->sk);
-		con->sock->sk->sk_user_data = NULL;
-		release_sock(con->sock->sk);
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
-static void free_conn(struct connection *con)
-{
-	close_connection(con, true, true, true);
-}
-
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
-	int idx;
-
-	idx = srcu_read_lock(&connections_srcu);
-	work_flush();
-	foreach_conn(free_conn);
-	srcu_read_unlock(&connections_srcu, idx);
 	work_stop();
-
 	dlm_proto_ops = NULL;
 }
 
@@ -1709,17 +1805,7 @@ static int dlm_tcp_bind(struct socket *sock)
 static int dlm_tcp_connect(struct connection *con, struct socket *sock,
 			   struct sockaddr *addr, int addr_len)
 {
-	int ret;
-
-	ret = sock->ops->connect(sock, addr, addr_len, O_NONBLOCK);
-	switch (ret) {
-	case -EINPROGRESS:
-		fallthrough;
-	case 0:
-		return 0;
-	}
-
-	return ret;
+	return sock->ops->connect(sock, addr, addr_len, O_NONBLOCK);
 }
 
 static int dlm_tcp_listen_validate(void)
@@ -1784,13 +1870,7 @@ static int dlm_sctp_connect(struct connection *con, struct socket *sock,
 	sock_set_sndtimeo(sock->sk, 5);
 	ret = sock->ops->connect(sock, addr, addr_len, 0);
 	sock_set_sndtimeo(sock->sk, 0);
-	if (ret < 0)
-		return ret;
-
-	if (!test_and_set_bit(CF_CONNECTED, &con->flags))
-		log_print("connected to node %d", con->nodeid);
-
-	return 0;
+	return ret;
 }
 
 static int dlm_sctp_listen_validate(void)
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index b0e8bdcaab1b..fc015a6abe17 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -306,11 +306,11 @@ static void dlm_send_queue_flush(struct midcomms_node *node)
 	pr_debug("flush midcomms send queue of node %d\n", node->nodeid);
 
 	rcu_read_lock();
-	spin_lock(&node->send_queue_lock);
+	spin_lock_bh(&node->send_queue_lock);
 	list_for_each_entry_rcu(mh, &node->send_queue, list) {
 		dlm_mhandle_delete(node, mh);
 	}
-	spin_unlock(&node->send_queue_lock);
+	spin_unlock_bh(&node->send_queue_lock);
 	rcu_read_unlock();
 }
 
@@ -437,7 +437,7 @@ static void dlm_receive_ack(struct midcomms_node *node, uint32_t seq)
 		}
 	}
 
-	spin_lock(&node->send_queue_lock);
+	spin_lock_bh(&node->send_queue_lock);
 	list_for_each_entry_rcu(mh, &node->send_queue, list) {
 		if (before(mh->seq, seq)) {
 			dlm_mhandle_delete(node, mh);
@@ -446,7 +446,7 @@ static void dlm_receive_ack(struct midcomms_node *node, uint32_t seq)
 			break;
 		}
 	}
-	spin_unlock(&node->send_queue_lock);
+	spin_unlock_bh(&node->send_queue_lock);
 	rcu_read_unlock();
 }
 
@@ -890,12 +890,7 @@ static void dlm_midcomms_receive_buffer_3_1(union dlm_packet *p, int nodeid)
 	dlm_receive_buffer(p, nodeid);
 }
 
-/*
- * Called from the low-level comms layer to process a buffer of
- * commands.
- */
-
-int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
+int dlm_validate_incoming_buffer(int nodeid, unsigned char *buf, int len)
 {
 	const unsigned char *ptr = buf;
 	const struct dlm_header *hd;
@@ -930,6 +925,32 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 		if (msglen > len)
 			break;
 
+		ret += msglen;
+		len -= msglen;
+		ptr += msglen;
+	}
+
+	return ret;
+}
+
+/*
+ * Called from the low-level comms layer to process a buffer of
+ * commands.
+ */
+int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
+{
+	const unsigned char *ptr = buf;
+	const struct dlm_header *hd;
+	uint16_t msglen;
+	int ret = 0;
+
+	while (len >= sizeof(struct dlm_header)) {
+		hd = (struct dlm_header *)ptr;
+
+		msglen = le16_to_cpu(hd->h_length);
+		if (msglen > len)
+			break;
+
 		switch (hd->h_version) {
 		case cpu_to_le32(DLM_VERSION_3_1):
 			dlm_midcomms_receive_buffer_3_1((union dlm_packet *)ptr, nodeid);
@@ -1046,9 +1067,9 @@ static void midcomms_new_msg_cb(void *data)
 
 	atomic_inc(&mh->node->send_queue_cnt);
 
-	spin_lock(&mh->node->send_queue_lock);
+	spin_lock_bh(&mh->node->send_queue_lock);
 	list_add_tail_rcu(&mh->list, &mh->node->send_queue);
-	spin_unlock(&mh->node->send_queue_lock);
+	spin_unlock_bh(&mh->node->send_queue_lock);
 
 	mh->seq = mh->node->seq_send++;
 }
diff --git a/fs/dlm/midcomms.h b/fs/dlm/midcomms.h
index 69296552d5ad..bea1cee4279c 100644
--- a/fs/dlm/midcomms.h
+++ b/fs/dlm/midcomms.h
@@ -14,6 +14,7 @@
 
 struct midcomms_node;
 
+int dlm_validate_incoming_buffer(int nodeid, unsigned char *buf, int len);
 int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int buflen);
 struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 					     gfp_t allocation, char **ppc);
-- 
2.31.1

