Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4D97E22ECEE
	for <lists+cluster-devel@lfdr.de>; Mon, 27 Jul 2020 15:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595855655;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4XO+eUP/Jkogq90TNO3vWZ5F61am5YcXKsRIKEOKG50=;
	b=Ne8I0XY7W4cK9kVAU5LziQj/Ctbmai9LIQX9yfv3v9a9Bk9N6SjadXKeZsqbL+jkfI7vFl
	cj7rV6HRaX+Mwv1g3qcqBknvUyFD1nFsSnMMFkMcmQ+0R/ZbO/vUkmpGHoYjNyvFVlmIeE
	W9Mnu7nUTYCDxnA8iYom8eiAUtC8LB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-Q_O6jqmpO3Og7qwKgkATHQ-1; Mon, 27 Jul 2020 09:14:13 -0400
X-MC-Unique: Q_O6jqmpO3Og7qwKgkATHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D5B3100AA22;
	Mon, 27 Jul 2020 13:14:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DF5E5DA66;
	Mon, 27 Jul 2020 13:14:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1FF01800C9A;
	Mon, 27 Jul 2020 13:14:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06RDE85D012203 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 09:14:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4D1936842F; Mon, 27 Jul 2020 13:14:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-112-138.rdu2.redhat.com [10.10.112.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C492660BF4;
	Mon, 27 Jul 2020 13:14:05 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 27 Jul 2020 09:13:38 -0400
Message-Id: <20200727131338.9111-4-aahringo@redhat.com>
In-Reply-To: <20200727131338.9111-1-aahringo@redhat.com>
References: <20200727131338.9111-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm-next 3/3] fs: dlm: implement tcp
	graceful shutdown
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

During my code inspection I saw there is no implementation of a graceful
shutdown for tcp. This patch will introduce a graceful shutdown for tcp
connections. The shutdown is implemented synchronized as
dlm_lowcomms_stop() is called to end all dlm communication. After shutdown
is done, a lot of flush and closing functionality will be called. However
I don't see a problem with that.

The waitqueue for synchronize the shutdown has a timeout of 10 seconds, if
timeout a force close will be exectued.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 77 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 289439fdca996..5050fe05769b4 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -63,6 +63,7 @@
 
 /* Number of messages to send before rescheduling */
 #define MAX_SEND_MSG_COUNT 25
+#define DLM_SHUTDOWN_WAIT_TIMEOUT msecs_to_jiffies(10000)
 
 struct cbuf {
 	unsigned int base;
@@ -110,10 +111,12 @@ struct connection {
 #define CF_CLOSE 6
 #define CF_APP_LIMITED 7
 #define CF_CLOSING 8
+#define CF_SHUTDOWN 9
 	struct list_head writequeue;  /* List of outgoing writequeue_entries */
 	spinlock_t writequeue_lock;
 	int (*rx_action) (struct connection *);	/* What to do when active */
 	void (*connect_action) (struct connection *);	/* What to do to connect */
+	void (*shutdown_action)(struct connection *con); /* What to do to shutdown */
 	struct page *rx_page;
 	struct cbuf cb;
 	int retries;
@@ -122,6 +125,7 @@ struct connection {
 	struct connection *othercon;
 	struct work_struct rwork; /* Receive workqueue */
 	struct work_struct swork; /* Send workqueue */
+	wait_queue_head_t shutdown_wait; /* wait for graceful shutdown */
 };
 #define sock2con(x) ((struct connection *)(x)->sk_user_data)
 
@@ -218,6 +222,7 @@ static struct connection *__nodeid2con(int nodeid, gfp_t alloc)
 	spin_lock_init(&con->writequeue_lock);
 	INIT_WORK(&con->swork, process_send_sockets);
 	INIT_WORK(&con->rwork, process_recv_sockets);
+	init_waitqueue_head(&con->shutdown_wait);
 
 	/* Setup action pointers for child sockets */
 	if (con->nodeid) {
@@ -619,6 +624,54 @@ static void close_connection(struct connection *con, bool and_other,
 	clear_bit(CF_CLOSING, &con->flags);
 }
 
+static void shutdown_connection(struct connection *con)
+{
+	int ret;
+
+	if (cancel_work_sync(&con->swork)) {
+		log_print("canceled swork for node %d", con->nodeid);
+		clear_bit(CF_WRITE_PENDING, &con->flags);
+	}
+
+	mutex_lock(&con->sock_mutex);
+	/* nothing to shutdown */
+	if (!con->sock) {
+		mutex_unlock(&con->sock_mutex);
+		return;
+	}
+
+	set_bit(CF_SHUTDOWN, &con->flags);
+	ret = kernel_sock_shutdown(con->sock, SHUT_WR);
+	mutex_unlock(&con->sock_mutex);
+	if (ret) {
+		log_print("Connection %p failed to shutdown: %d will force close",
+			  con, ret);
+		goto force_close;
+	} else {
+		ret = wait_event_timeout(con->shutdown_wait,
+					 !test_bit(CF_SHUTDOWN, &con->flags),
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
+	clear_bit(CF_SHUTDOWN, &con->flags);
+	close_connection(con, false, true, true);
+}
+
+static void dlm_tcp_shutdown(struct connection *con)
+{
+	if (con->othercon)
+		shutdown_connection(con->othercon);
+	shutdown_connection(con);
+}
+
 /* Data received from remote end */
 static int receive_from_sock(struct connection *con)
 {
@@ -713,13 +766,18 @@ static int receive_from_sock(struct connection *con)
 out_close:
 	mutex_unlock(&con->sock_mutex);
 	if (ret != -EAGAIN) {
-		close_connection(con, false, true, false);
 		/* Reconnect when there is something to send */
+		close_connection(con, false, true, false);
+		if (ret == 0) {
+			log_print("connection %p got EOF from %d",
+				  con, con->nodeid);
+			/* handling for tcp shutdown */
+			clear_bit(CF_SHUTDOWN, &con->flags);
+			wake_up(&con->shutdown_wait);
+			/* signal to breaking receive worker */
+			ret = -1;
+		}
 	}
-	/* Don't return success if we really got EOF */
-	if (ret == 0)
-		ret = -EAGAIN;
-
 	return ret;
 }
 
@@ -803,6 +861,7 @@ static int accept_from_sock(struct connection *con)
 			spin_lock_init(&othercon->writequeue_lock);
 			INIT_WORK(&othercon->swork, process_send_sockets);
 			INIT_WORK(&othercon->rwork, process_recv_sockets);
+			init_waitqueue_head(&othercon->shutdown_wait);
 			set_bit(CF_IS_OTHERCON, &othercon->flags);
 		} else {
 			/* close other sock con if we have something new */
@@ -1047,6 +1106,7 @@ static void tcp_connect_to_sock(struct connection *con)
 
 	con->rx_action = receive_from_sock;
 	con->connect_action = tcp_connect_to_sock;
+	con->shutdown_action = dlm_tcp_shutdown;
 	add_sock(sock, con);
 
 	/* Bind to our cluster-known address connecting to avoid
@@ -1542,6 +1602,12 @@ static void stop_conn(struct connection *con)
 	_stop_conn(con, true);
 }
 
+static void shutdown_conn(struct connection *con)
+{
+	if (con->shutdown_action)
+		con->shutdown_action(con);
+}
+
 static void free_conn(struct connection *con)
 {
 	close_connection(con, true, true, true);
@@ -1593,6 +1659,7 @@ void dlm_lowcomms_stop(void)
 	mutex_lock(&connections_lock);
 	dlm_allow_conn = 0;
 	mutex_unlock(&connections_lock);
+	foreach_conn(shutdown_conn);
 	work_flush();
 	clean_writequeues();
 	foreach_conn(free_conn);
-- 
2.26.2

