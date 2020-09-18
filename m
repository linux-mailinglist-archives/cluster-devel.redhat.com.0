Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D6ABE26FFCD
	for <lists+cluster-devel@lfdr.de>; Fri, 18 Sep 2020 16:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600439279;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=asKd2BT840CYj8M5t0+jwyrj6giqpu6bBnfZqZrlb6Q=;
	b=hKWndULgE36bMJKo3yZbyyTTTdiNnT73ah8omj3I3KZdT7oux6wdGrRbdq/ST5hS4wZDk7
	76lA5XyJhWn0K+KVXZCFSF72JcA6tPZ83XKTriZMXuYNs2GEbjLD0gVbnSEJ6So0kkPvwQ
	FFQ9KGaHjD+/LNvDgYlohAQ+PeocgUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-dPLQZ3CbNQqlDa5OGVpjCg-1; Fri, 18 Sep 2020 10:27:57 -0400
X-MC-Unique: dPLQZ3CbNQqlDa5OGVpjCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FF25802B6C;
	Fri, 18 Sep 2020 14:27:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B047F1002D53;
	Fri, 18 Sep 2020 14:27:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7981F183D043;
	Fri, 18 Sep 2020 14:27:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08IERn4c002450 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 18 Sep 2020 10:27:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D0BC855765; Fri, 18 Sep 2020 14:27:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-112-228.rdu2.redhat.com [10.10.112.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 555F555762;
	Fri, 18 Sep 2020 14:27:49 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 18 Sep 2020 10:27:28 -0400
Message-Id: <20200918142728.147392-7-aahringo@redhat.com>
In-Reply-To: <20200918142728.147392-1-aahringo@redhat.com>
References: <20200918142728.147392-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 6/6] fs: dlm: rework transmit
	handling
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

I detected that dlm messages are transmitted sometimes in a incorrect
order according to the writequeue locked area of commit_buffer(). This
patch replace the current sending mechanism by a basic per dlm message
queue which handles a entry of the writequeue as per dlm message. The
sending mechanism will then use a scatter/gather of the first n writequeue
entries. However that will ensure we send dlm messages in order according
to the commit_buffer() call. The lock of the writequeue was changed that
readers are lockless with help of RCU.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 268 ++++++++++++++++++++++------------------------
 1 file changed, 131 insertions(+), 137 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index c7b6e36845404..2580ef80b8855 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -61,8 +61,8 @@
 #define NEEDED_RMEM (4*1024*1024)
 #define CONN_HASH_SIZE 32
 
-/* Number of messages to send before rescheduling */
-#define MAX_SEND_MSG_COUNT 25
+/* How many dlm messages should be used for scatter/gather to send */
+#define MAX_SEND_IOV_COUNT 25
 #define DLM_SHUTDOWN_WAIT_TIMEOUT msecs_to_jiffies(10000)
 
 struct connection {
@@ -83,6 +83,10 @@ struct connection {
 	int (*rx_action) (struct connection *);	/* What to do when active */
 	void (*connect_action) (struct connection *);	/* What to do to connect */
 	void (*shutdown_action)(struct connection *con); /* What to do to shutdown */
+	struct writequeue_entry *tx_queue[MAX_SEND_IOV_COUNT];
+	struct kvec tx_iov[MAX_SEND_IOV_COUNT];
+	struct msghdr tx_msg;
+	int tx_queue_cnt;
 	int retries;
 #define MAX_CONNECT_RETRIES 3
 	struct hlist_node list;
@@ -99,13 +103,12 @@ struct connection {
 
 /* An entry waiting to be sent */
 struct writequeue_entry {
-	struct list_head list;
-	struct page *page;
-	int offset;
-	int len;
-	int end;
-	int users;
 	struct connection *con;
+	unsigned char *buf;
+	int len;
+
+	struct list_head list;
+	struct rcu_head rcu;
 };
 
 struct dlm_node_addr {
@@ -233,6 +236,19 @@ static void foreach_conn(void (*conn_func)(struct connection *c))
 	srcu_read_unlock(&connections_srcu, idx);
 }
 
+/* can only be used to check if something is pending to transmit */
+static bool writequeue_has_entries(struct connection *con)
+{
+	void *e;
+
+	rcu_read_lock();
+	e = list_first_or_null_rcu(&con->writequeue,
+				   struct writequeue_entry, list);
+	rcu_read_unlock();
+
+	return !!e;
+}
+
 static struct dlm_node_addr *find_node_addr(int nodeid)
 {
 	struct dlm_node_addr *na;
@@ -588,6 +604,15 @@ static void close_connection(struct connection *con, bool and_other,
 		close_connection(con->othercon, false, true, true);
 	}
 
+	/* ideally we would check which messages inside the writequeue
+	 * was sent and which was not, if we didn't send everything in
+	 * one sendmsg() call. However on a sock_release() we will
+	 * drop messages anyway, there need to be other mechanisms
+	 * to check on duplicates or retranmissions. Setting
+	 * con->tx_queue_cnt to zero should ensure we doesn't start
+	 * to transmit in the middle of an dlm message.
+	 */
+	con->tx_queue_cnt = 0;
 	con->rx_leftover = 0;
 	con->retries = 0;
 	mutex_unlock(&con->sock_mutex);
@@ -885,28 +910,23 @@ static int accept_from_sock(struct connection *con)
 	return result;
 }
 
-static void free_entry(struct writequeue_entry *e)
+static void writequeue_entry_release(struct rcu_head *rcu)
 {
-	__free_page(e->page);
+	struct writequeue_entry *e = container_of(rcu, struct writequeue_entry,
+						  rcu);
+
+	kfree(e->buf);
 	kfree(e);
 }
 
-/*
- * writequeue_entry_complete - try to delete and free write queue entry
- * @e: write queue entry to try to delete
- * @completed: bytes completed
- *
- * writequeue_lock must be held.
- */
-static void writequeue_entry_complete(struct writequeue_entry *e, int completed)
+static void writequeue_entry_complete(struct connection *con,
+				      struct writequeue_entry *e)
 {
-	e->offset += completed;
-	e->len -= completed;
+	spin_lock(&con->writequeue_lock);
+	list_del_rcu(&e->list);
+	spin_unlock(&con->writequeue_lock);
 
-	if (e->len == 0 && e->users == 0) {
-		list_del(&e->list);
-		free_entry(e);
-	}
+	call_rcu(&e->rcu, writequeue_entry_release);
 }
 
 /*
@@ -1306,149 +1326,123 @@ static int tcp_listen_for_all(void)
 	return result;
 }
 
-
-
-static struct writequeue_entry *new_writequeue_entry(struct connection *con,
-						     gfp_t allocation)
+void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
 {
-	struct writequeue_entry *entry;
-
-	entry = kmalloc(sizeof(struct writequeue_entry), allocation);
-	if (!entry)
-		return NULL;
+	struct writequeue_entry *e;
+	struct connection *con;
+	void *buf;
 
-	entry->page = alloc_page(allocation);
-	if (!entry->page) {
-		kfree(entry);
+	if (len > DEFAULT_BUFFER_SIZE) {
+		log_print("Error ULP tried to allocate more than capable message size");
 		return NULL;
 	}
 
-	entry->offset = 0;
-	entry->len = 0;
-	entry->end = 0;
-	entry->users = 0;
-	entry->con = con;
-
-	return entry;
-}
-
-void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
-{
-	struct connection *con;
-	struct writequeue_entry *e;
-	int offset = 0;
-
 	con = nodeid2con(nodeid, allocation);
 	if (!con)
 		return NULL;
 
-	spin_lock(&con->writequeue_lock);
-	e = list_entry(con->writequeue.prev, struct writequeue_entry, list);
-	if ((&e->list == &con->writequeue) ||
-	    (PAGE_SIZE - e->end < len)) {
-		e = NULL;
-	} else {
-		offset = e->end;
-		e->end += len;
-		e->users++;
-	}
-	spin_unlock(&con->writequeue_lock);
+	e = kzalloc(sizeof(*e), allocation);
+	if (!e)
+		return NULL;
 
-	if (e) {
-	got_one:
-		*ppc = page_address(e->page) + offset;
-		return e;
+	buf = kmalloc(len, allocation);
+	if (!buf) {
+		kfree(e);
+		return NULL;
 	}
 
-	e = new_writequeue_entry(con, allocation);
-	if (e) {
-		spin_lock(&con->writequeue_lock);
-		offset = e->end;
-		e->end += len;
-		e->users++;
-		list_add_tail(&e->list, &con->writequeue);
-		spin_unlock(&con->writequeue_lock);
-		goto got_one;
-	}
-	return NULL;
+	e->con = con;
+	e->buf = buf;
+	e->len = len;
+
+	*ppc = buf;
+
+	return e;
 }
 
 void dlm_lowcomms_commit_buffer(void *mh)
 {
-	struct writequeue_entry *e = (struct writequeue_entry *)mh;
+	struct writequeue_entry *e = mh;
 	struct connection *con = e->con;
-	int users;
 
 	spin_lock(&con->writequeue_lock);
-	users = --e->users;
-	if (users)
-		goto out;
-	e->len = e->end - e->offset;
+	list_add_tail_rcu(&e->list, &con->writequeue);
 	spin_unlock(&con->writequeue_lock);
 
 	queue_work(send_workqueue, &con->swork);
-	return;
+}
 
-out:
-	spin_unlock(&con->writequeue_lock);
-	return;
+static void send_to_sock_setup_msg(struct connection *con)
+{
+	struct writequeue_entry *e;
+	size_t size = 0;
+	int num = 0;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(e, &con->writequeue, list) {
+		if (num == MAX_SEND_IOV_COUNT)
+			break;
+
+		con->tx_iov[num].iov_base = e->buf;
+		con->tx_iov[num].iov_len = e->len;
+		con->tx_queue[num] = e;
+
+		size += con->tx_iov[num].iov_len;
+		num++;
+	}
+	rcu_read_unlock();
+
+	memset(&con->tx_msg, 0, sizeof(con->tx_msg));
+	con->tx_msg.msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
+	iov_iter_kvec(&con->tx_msg.msg_iter, WRITE, con->tx_iov, num, size);
+	con->tx_queue_cnt = num;
 }
 
 /* Send a message */
 static void send_to_sock(struct connection *con)
 {
-	int ret = 0;
-	const int msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
-	struct writequeue_entry *e;
-	int len, offset;
-	int count = 0;
+	int ret, i;
 
 	mutex_lock(&con->sock_mutex);
 	if (con->sock == NULL)
 		goto out_connect;
 
-	spin_lock(&con->writequeue_lock);
-	for (;;) {
-		e = list_entry(con->writequeue.next, struct writequeue_entry,
-			       list);
-		if ((struct list_head *) e == &con->writequeue)
-			break;
-
-		len = e->len;
-		offset = e->offset;
-		BUG_ON(len == 0 && e->users == 0);
-		spin_unlock(&con->writequeue_lock);
-
-		ret = 0;
-		if (len) {
-			ret = kernel_sendpage(con->sock, e->page, offset, len,
-					      msg_flags);
-			if (ret == -EAGAIN || ret == 0) {
-				if (ret == -EAGAIN &&
-				    test_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags) &&
-				    !test_and_set_bit(CF_APP_LIMITED, &con->flags)) {
-					/* Notify TCP that we're limited by the
-					 * application window size.
-					 */
-					set_bit(SOCK_NOSPACE, &con->sock->flags);
-					con->sock->sk->sk_write_pending++;
-				}
-				cond_resched();
-				goto out;
-			} else if (ret < 0)
-				goto send_error;
+	/* fill up msghdr with messages from writequeue */
+	if (!con->tx_queue_cnt)
+		send_to_sock_setup_msg(con);
+
+	ret = sock_sendmsg(con->sock, &con->tx_msg);
+	if (ret == -EAGAIN) {
+		if (ret == -EAGAIN &&
+		    test_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags) &&
+		    !test_and_set_bit(CF_APP_LIMITED, &con->flags)) {
+			/* Notify TCP that we're limited by the
+			 * application window size.
+			 */
+			set_bit(SOCK_NOSPACE, &con->sock->flags);
+			con->sock->sk->sk_write_pending++;
 		}
+		queue_work(send_workqueue, &con->swork);
+		cond_resched();
+		goto out;
+	} else if (ret < 0) {
+		goto send_error;
+	}
 
-		/* Don't starve people filling buffers */
-		if (++count >= MAX_SEND_MSG_COUNT) {
-			cond_resched();
-			count = 0;
-		}
+	/* if we have nothing left to write cleanup messages from writequeue */
+	if (!msg_data_left(&con->tx_msg)) {
+		for (i = 0; i < con->tx_queue_cnt; i++)
+			writequeue_entry_complete(con, con->tx_queue[i]);
+
+		con->tx_queue_cnt = 0;
 
-		spin_lock(&con->writequeue_lock);
-		writequeue_entry_complete(e, ret);
+		if (writequeue_has_entries(con))
+			queue_work(send_workqueue, &con->swork);
+	} else {
+		/* call again sendmsg() we didn't send everything */
+		queue_work(send_workqueue, &con->swork);
 	}
-	spin_unlock(&con->writequeue_lock);
+
 out:
 	mutex_unlock(&con->sock_mutex);
 	return;
@@ -1469,14 +1463,13 @@ static void send_to_sock(struct connection *con)
 
 static void clean_one_writequeue(struct connection *con)
 {
-	struct writequeue_entry *e, *safe;
+	struct writequeue_entry *e;
 
-	spin_lock(&con->writequeue_lock);
-	list_for_each_entry_safe(e, safe, &con->writequeue, list) {
-		list_del(&e->list);
-		free_entry(e);
+	rcu_read_lock();
+	list_for_each_entry_rcu(e, &con->writequeue, list) {
+		writequeue_entry_complete(con, e);
 	}
-	spin_unlock(&con->writequeue_lock);
+	rcu_read_unlock();
 }
 
 /* Called from recovery when it knows that a node has
@@ -1527,7 +1520,8 @@ static void process_send_sockets(struct work_struct *work)
 	clear_bit(CF_WRITE_PENDING, &con->flags);
 	if (con->sock == NULL) /* not mutex protected so check it inside too */
 		con->connect_action(con);
-	if (!list_empty(&con->writequeue))
+
+	if (writequeue_has_entries(con))
 		send_to_sock(con);
 }
 
-- 
2.26.2

