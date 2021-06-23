Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E7DAD3B1D70
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Jun 2021 17:15:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624461348;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iq8CD6qFVQOlR5l0lCMs+gCK07K7hwxTjeZ4yjLpUw4=;
	b=fnNeoBCdFzzeUzvNZ2Z8ZDxwcROctnBOcE4ljE55f/ILq6QVg/3aMIn5Zj2uLYMUomVhqR
	LWMHRnQyuBwsb6JH+UhX5hPjZ1TVDapmLx8JoJq13qFrlfv3xFOMMoRIvyWNhjx6QEPznd
	fPVJ5SmXCncwrXLIkwpR0H648AdksTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-sLKf6fGuPuSRZ-3jFAg4VA-1; Wed, 23 Jun 2021 11:15:46 -0400
X-MC-Unique: sLKf6fGuPuSRZ-3jFAg4VA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7EC8101F00F;
	Wed, 23 Jun 2021 15:15:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB6DB60854;
	Wed, 23 Jun 2021 15:15:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2C3018199FF;
	Wed, 23 Jun 2021 15:15:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15NFFf65025017 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Jun 2021 11:15:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B5D9160E1C; Wed, 23 Jun 2021 15:15:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (unknown [10.22.8.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5721860C05;
	Wed, 23 Jun 2021 15:15:41 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Jun 2021 11:14:50 -0400
Message-Id: <20210623151454.176649-12-aahringo@redhat.com>
In-Reply-To: <20210623151454.176649-1-aahringo@redhat.com>
References: <20210623151454.176649-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC dlm/next 11/15] fs: dlm: introduce process
	workqueue
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

To not block future receive handling calls this patch introduces a
process workqueue which will call dlm_process_incoming_buffer().

While processing dlm messages the current send functionality should come
to an end and no new queues for swork is allowed. This is done by the
introduced connection bit CF_STOP_SEND.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 219 +++++++++++++++++++++++++++++++---------------
 fs/dlm/midcomms.c |  38 ++++++--
 fs/dlm/midcomms.h |   3 +-
 3 files changed, 178 insertions(+), 82 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index a54ed3cf0b45..28d97f8187a5 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -24,15 +24,15 @@
  * responsibility to resolve these into IP address or
  * whatever it needs for inter-node communication.
  *
- * The comms level is two kernel threads that deal mainly with
- * the receiving of messages from other nodes and passing them
- * up to the mid-level comms layer (which understands the
- * message format) for execution by the locking core, and
- * a send thread which does all the setting up of connections
- * to remote nodes and the sending of data. Threads are not allowed
- * to send their own data because it may cause them to wait in times
- * of high load. Also, this way, the sending thread can collect together
- * messages bound for one node and send them in one block.
+ * Each connection can send and receive at the same time which is considered
+ * as hotpath. Closing or accepting new connection is considered as not hotpath
+ * and will block all send and receive per connection. To disallow sending
+ * while processing dlm message the connection flag CF_STOP_SEND was introduced
+ * which disallow any further dequeuing of the connection writequeue and will
+ * not trigger any new queuing of connection swork. If all received dlm
+ * messages are processed the flag will be dropped and a swork will be
+ * triggered. This combines all new messages which appeared while processing
+ * dlm messages.
  *
  * lowcomms will choose to use either TCP or SCTP as its transport layer
  * depending on the configuration variable 'protocol'. This should be set
@@ -75,6 +75,7 @@ struct connection {
 #define CF_CONNECTED 5
 #define CF_EOF 6
 #define CF_STOP 7
+#define CF_STOP_SEND 8
 	struct list_head writequeue;  /* List of outgoing writequeue_entries */
 	spinlock_t writequeue_lock;
 	atomic_t writequeue_cnt;
@@ -91,9 +92,12 @@ struct connection {
 	struct work_struct cwork;
 	int sk_err;
 	wait_queue_head_t shutdown_wait; /* wait for graceful shutdown */
-	unsigned char *rx_buf;
-	int rx_buflen;
+	unsigned char rx_leftover_buf[DLM_MAX_SOCKET_BUFSIZE];
 	int rx_leftover;
+	struct work_struct pwork;
+	struct list_head processqueue;
+	spinlock_t processqueue_lock;
+	struct mutex process_lock;
 	struct rcu_head rcu;
 };
 #define sock2con(x) ((struct connection *)(x)->sk_user_data)
@@ -121,6 +125,13 @@ struct writequeue_entry {
 	struct kref ref;
 };
 
+struct processqueue_entry {
+	unsigned char *buf;
+	int buflen;
+
+	struct list_head list;
+};
+
 struct dlm_msg {
 	struct writequeue_entry *entry;
 	struct dlm_msg *orig_msg;
@@ -177,6 +188,7 @@ int dlm_allow_conn;
 
 /* Work queues */
 static struct workqueue_struct *io_workqueue;
+static struct workqueue_struct *process_workqueue;
 
 static struct hlist_head connection_hash[CONN_HASH_SIZE];
 static DEFINE_SPINLOCK(connections_lock);
@@ -185,6 +197,7 @@ DEFINE_STATIC_SRCU(connections_srcu);
 static const struct dlm_proto_ops *dlm_proto_ops;
 
 static void process_close_sockets(struct work_struct *work);
+static void process_dlm_messages(struct work_struct *work);
 static void process_recv_sockets(struct work_struct *work);
 static void process_send_sockets(struct work_struct *work);
 
@@ -227,11 +240,25 @@ static inline struct connection *dlm_sendcon(struct connection *con)
 	return con;
 }
 
+static inline void con_stop_send(struct connection *con)
+{
+	set_bit(CF_STOP_SEND, &con->flags);
+}
+
+static inline void con_resume_send(struct connection *con)
+{
+	clear_bit(CF_STOP_SEND, &con->flags);
+	dlm_io_delayed_queue(con, &con->swork, 0);
+}
+
 /* need to held writequeue_lock */
 static struct writequeue_entry *con_next_wq(struct connection *con)
 {
 	struct writequeue_entry *e;
 
+	if (test_bit(CF_STOP_SEND, &con->flags))
+		return NULL;
+
 	if (list_empty(&con->writequeue))
 		return NULL;
 
@@ -260,13 +287,8 @@ static bool tcp_eof_condition(struct connection *con)
 	return atomic_read(&con->writequeue_cnt);
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
 	INIT_LIST_HEAD(&con->writequeue);
 	spin_lock_init(&con->writequeue_lock);
@@ -275,8 +297,6 @@ static int dlm_con_init(struct connection *con, int nodeid)
 	INIT_WORK(&con->rwork, process_recv_sockets);
 	INIT_WORK(&con->cwork, process_close_sockets);
 	init_waitqueue_head(&con->shutdown_wait);
-
-	return 0;
 }
 
 /*
@@ -286,7 +306,7 @@ static int dlm_con_init(struct connection *con, int nodeid)
 static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 {
 	struct connection *con, *tmp;
-	int r, ret;
+	int r;
 
 	r = nodeid_hash(nodeid);
 	con = __find_con(nodeid, r);
@@ -297,16 +317,17 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 	if (!con)
 		return NULL;
 
-	ret = dlm_con_init(con, nodeid);
-	if (ret) {
-		kfree(con);
-		return NULL;
-	}
+	dlm_con_init(con, nodeid);
 
 	mutex_init(&con->rwork_lock);
 	mutex_init(&con->swork_lock);
 	mutex_init(&con->wq_alloc);
 
+	mutex_init(&con->process_lock);
+	INIT_LIST_HEAD(&con->processqueue);
+	spin_lock_init(&con->processqueue_lock);
+	INIT_WORK(&con->pwork, process_dlm_messages);
+
 	spin_lock(&connections_lock);
 	/* Because multiple workqueues/threads calls this function it can
 	 * race on multiple cpu's. Instead of locking hot path __find_con()
@@ -317,7 +338,6 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 	tmp = __find_con(nodeid, r);
 	if (tmp) {
 		spin_unlock(&connections_lock);
-		kfree(con->rx_buf);
 		kfree(con);
 		return tmp;
 	}
@@ -819,13 +839,17 @@ static void cancel_io_work(struct connection *con, bool and_other)
 	struct connection *sendcon = dlm_sendcon(con);
 
 	set_bit(CF_STOP, &sendcon->flags);
+	/* stop receiving */
 	cancel_work_sync(&sendcon->rwork);
 	cancel_work_sync(&sendcon->cwork);
-	cancel_delayed_work_sync(&sendcon->swork);
 	if (sendcon->othercon && and_other) {
 		cancel_work_sync(&sendcon->othercon->rwork);
 		cancel_work_sync(&sendcon->othercon->cwork);
 	}
+	/* flush pending processes which might trigger swork */
+	flush_work(&sendcon->pwork);
+	/* stop sending */
+	cancel_delayed_work_sync(&sendcon->swork);
 
 	dlm_con_lock(sendcon);
 	close_connection(con, and_other);
@@ -874,45 +898,77 @@ static void shutdown_connection(struct connection *con,
 static void dlm_tcp_shutdown(struct connection *con)
 {
 	/* flush pending processes which might trigger send */
-	flush_work(&con->rwork);
+	flush_work(&con->pwork);
+	/* flush all send */
+	flush_delayed_work(&con->swork);
 
-	if (con->othercon) {
-		flush_work(&con->othercon->rwork);
+	if (con->othercon)
 		shutdown_connection(con->othercon, con);
-	}
 
-	/* flush all send */
-	flush_delayed_work(&con->swork);
 	shutdown_connection(con, con);
 }
 
-static int con_realloc_receive_buf(struct connection *con, int newlen)
+static struct processqueue_entry *new_processqueue_entry(int nodeid,
+							 int buflen)
 {
-	unsigned char *newbuf;
+	struct processqueue_entry *pentry;
 
-	newbuf = kmalloc(newlen, GFP_NOFS);
-	if (!newbuf)
-		return -ENOMEM;
+	pentry = kmalloc(sizeof(*pentry), GFP_NOFS);
+	if (!pentry)
+		return NULL;
 
-	/* copy any leftover from last receive */
-	if (con->rx_leftover)
-		memmove(newbuf, con->rx_buf, con->rx_leftover);
+	pentry->buf = kmalloc(buflen, GFP_NOFS);
+	if (!pentry->buf) {
+		kfree(pentry);
+		return NULL;
+	}
 
-	/* swap to new buffer space */
-	kfree(con->rx_buf);
-	con->rx_buflen = newlen;
-	con->rx_buf = newbuf;
+	return pentry;
+}
 
-	return 0;
+static void free_processqueue_entry(struct processqueue_entry *pentry)
+{
+	kfree(pentry->buf);
+	kfree(pentry);
+}
+
+static void process_dlm_messages(struct work_struct *work)
+{
+	struct connection *con = container_of(work, struct connection, pwork);
+	struct processqueue_entry *pentry;
+
+	mutex_lock(&con->process_lock);
+	con_stop_send(con);
+
+	for (;;) {
+		spin_lock(&con->processqueue_lock);
+		if (list_empty(&con->processqueue)) {
+			spin_unlock(&con->processqueue_lock);
+			break;
+		}
+
+		pentry = list_first_entry(&con->processqueue,
+					  struct processqueue_entry, list);
+		list_del(&pentry->list);
+		spin_unlock(&con->processqueue_lock);
+
+		dlm_process_incoming_buffer(con->nodeid, pentry->buf,
+					    pentry->buflen);
+		free_processqueue_entry(pentry);
+	}
+
+	con_resume_send(con);
+	mutex_unlock(&con->process_lock);
 }
 
 /* Data received from remote end */
 static void receive_from_sock(struct connection *con,
 			      struct connection *sendcon)
 {
+	struct processqueue_entry *pentry;
+	int ret, buflen, buflen_real;
 	struct msghdr msg;
 	struct kvec iov;
-	int ret, buflen;
 
 	mutex_lock(&sendcon->rwork_lock);
 	if (con->sock == NULL) {
@@ -920,20 +976,21 @@ static void receive_from_sock(struct connection *con,
 		return;
 	}
 
-	/* realloc if we get new buffer size to read out */
-	buflen = dlm_config.ci_buffer_size;
-	if (con->rx_buflen != buflen && con->rx_leftover <= buflen) {
-		ret = con_realloc_receive_buf(con, buflen);
-		if (ret < 0)
+	buflen = READ_ONCE(dlm_config.ci_buffer_size);
+	for (;;) {
+		pentry = new_processqueue_entry(con->nodeid, buflen);
+		if (!pentry) {
+			mutex_unlock(&sendcon->rwork_lock);
 			goto out_resched;
-	}
+		}
+
+		memcpy(pentry->buf, con->rx_leftover_buf, con->rx_leftover);
 
-	for (;;) {
 		/* calculate new buffer parameter regarding last receive and
 		 * possible leftover bytes
 		 */
-		iov.iov_base = con->rx_buf + con->rx_leftover;
-		iov.iov_len = con->rx_buflen - con->rx_leftover;
+		iov.iov_base = pentry->buf + con->rx_leftover;
+		iov.iov_len = buflen - con->rx_leftover;
 
 		memset(&msg, 0, sizeof(msg));
 		msg.msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
@@ -941,28 +998,39 @@ static void receive_from_sock(struct connection *con,
 				     msg.msg_flags);
 		if (ret == 0) {
 			mutex_unlock(&sendcon->rwork_lock);
+			free_processqueue_entry(pentry);
 			goto out_eof;
 		} else if (ret < 0) {
+			free_processqueue_entry(pentry);
 			break;
 		}
 
 		/* new buflen according readed bytes and leftover from last receive */
-		buflen = ret + con->rx_leftover;
-		ret = dlm_process_incoming_buffer(con->nodeid, con->rx_buf, buflen);
+		buflen_real = ret + con->rx_leftover;
+		ret = dlm_validate_incoming_buffer(con->nodeid, pentry->buf,
+						   buflen_real);
 		if (ret < 0) {
 			mutex_unlock(&sendcon->rwork_lock);
+			free_processqueue_entry(pentry);
 			goto out_close;
 		}
 
+		pentry->buflen = ret;
+
 		/* calculate leftover bytes from process and put it into begin of
 		 * the receive buffer, so next receive we have the full message
 		 * at the start address of the receive buffer.
 		 */
-		con->rx_leftover = buflen - ret;
-		if (con->rx_leftover) {
-			memmove(con->rx_buf, con->rx_buf + ret,
+		con->rx_leftover = buflen_real - ret;
+		if (con->rx_leftover)
+			memmove(con->rx_leftover_buf, pentry->buf + ret,
 				con->rx_leftover);
-		}
+
+		spin_lock(&sendcon->processqueue_lock);
+		list_add_tail(&pentry->list, &sendcon->processqueue);
+		spin_unlock(&sendcon->processqueue_lock);
+
+		queue_work(process_workqueue, &sendcon->pwork);
 	}
 	mutex_unlock(&sendcon->rwork_lock);
 
@@ -983,6 +1051,9 @@ static void receive_from_sock(struct connection *con,
 	log_print("connection %p got EOF from %d",
 		  con, con->nodeid);
 
+	/* flush pending processing which might trigger send */
+	flush_work(&sendcon->pwork);
+
 	if (dlm_proto_ops->eof_condition &&
 	    dlm_proto_ops->eof_condition(con)) {
 		set_bit(CF_EOF, &con->flags);
@@ -1063,13 +1134,7 @@ static int accept_from_sock(struct listen_connection *con)
 				goto accept_err;
 			}
 
-			result = dlm_con_init(othercon, nodeid);
-			if (result < 0) {
-				kfree(othercon);
-				dlm_con_unlock(newcon);
-				srcu_read_unlock(&connections_srcu, idx);
-				goto accept_err;
-			}
+			dlm_con_init(othercon, nodeid);
 
 			set_bit(CF_IS_OTHERCON, &othercon->flags);
 			newcon->othercon = othercon;
@@ -1099,7 +1164,6 @@ static int accept_from_sock(struct listen_connection *con)
 	 * to the read_sockets list
 	 */
 	dlm_io_queue(newcon, &addcon->rwork);
-
 	srcu_read_unlock(&connections_srcu, idx);
 
 	return 0;
@@ -1348,7 +1412,9 @@ static void _dlm_lowcomms_commit_msg(struct dlm_msg *msg)
 	e->len = DLM_WQ_LENGTH_BYTES(e);
 	spin_unlock(&con->writequeue_lock);
 
-	dlm_io_delayed_queue(con, &con->swork, 0);
+	if (!test_bit(CF_STOP_SEND, &con->flags))
+		dlm_io_delayed_queue(con, &con->swork, 0);
+
 	return;
 
 out:
@@ -1660,13 +1726,23 @@ static void process_send_sockets(struct work_struct *work)
 static void work_stop(void)
 {
 	destroy_workqueue(io_workqueue);
+	destroy_workqueue(process_workqueue);
 }
 
 static int work_start(void)
 {
+	process_workqueue = alloc_workqueue("dlm_process",
+					    WQ_HIGHPRI | WQ_UNBOUND |
+					    WQ_MEM_RECLAIM, 0);
+	if (!process_workqueue) {
+		log_print("can't start dlm_process");
+		return -ENOMEM;
+	}
+
 	io_workqueue = alloc_workqueue("dlm_io",
 				       WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
 	if (!io_workqueue) {
+		destroy_workqueue(process_workqueue);
 		log_print("can't start dlm_io");
 		return -ENOMEM;
 	}
@@ -1702,7 +1778,6 @@ static void connection_release(struct rcu_head *rcu)
 {
 	struct connection *con = container_of(rcu, struct connection, rcu);
 
-	kfree(con->rx_buf);
 	kfree(con);
 }
 
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index e3de268898ed..483f7c54c217 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -872,12 +872,7 @@ static void dlm_midcomms_receive_buffer_3_1(union dlm_packet *p, int nodeid)
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
@@ -885,7 +880,7 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 	int ret = 0;
 
 	while (len >= sizeof(struct dlm_header)) {
-		hd = (struct dlm_header *)ptr;
+		hd = (const struct dlm_header *)ptr;
 
 		/* no message should be more than DLM_MAX_SOCKET_BUFSIZE or
 		 * less than dlm_header size.
@@ -912,6 +907,33 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
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
+
+void dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
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
 		switch (le32_to_cpu(hd->h_version)) {
 		case DLM_VERSION_3_1:
 			dlm_midcomms_receive_buffer_3_1((union dlm_packet *)ptr, nodeid);
@@ -929,8 +951,6 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 		len -= msglen;
 		ptr += msglen;
 	}
-
-	return ret;
 }
 
 void dlm_midcomms_unack_msg_resend(int nodeid)
diff --git a/fs/dlm/midcomms.h b/fs/dlm/midcomms.h
index 579abc6929be..a62c1ad786ef 100644
--- a/fs/dlm/midcomms.h
+++ b/fs/dlm/midcomms.h
@@ -14,7 +14,8 @@
 
 struct midcomms_node;
 
-int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int buflen);
+void dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int buflen);
+int dlm_validate_incoming_buffer(int nodeid, unsigned char *buf, int len);
 struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 					     gfp_t allocation, char **ppc);
 void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh);
-- 
2.26.3

