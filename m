Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E9EE622B1CC
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jul 2020 16:49:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595515782;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VpR2WVXFlFRPqh5Ig7Ni7RcQgTA42ZIdG8xHZaCTSyI=;
	b=COL19w087dsc+8pp6LINjOMrchX2ykcvX0pXTF0V10dntH2VVCgYorhDXHIsqvSZPPMIDh
	E++I+ILt9g1ZpCQlP2iXu25KSGa4OOIwCUFbyLIPG3fJHd9BmzlcngZbTmXa9lFgoXaZgE
	g531v5ODd34oZPRGKwTOHom2mqYWCqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-yu5fNu8lN2Sq_5yI299Wig-1; Thu, 23 Jul 2020 10:49:40 -0400
X-MC-Unique: yu5fNu8lN2Sq_5yI299Wig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACA71102C856;
	Thu, 23 Jul 2020 14:49:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E8AC71D00;
	Thu, 23 Jul 2020 14:49:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A25C9A135;
	Thu, 23 Jul 2020 14:49:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06NEnW6R009096 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jul 2020 10:49:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8D3D619D7F; Thu, 23 Jul 2020 14:49:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-118-215.rdu2.redhat.com [10.10.118.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E691F19930;
	Thu, 23 Jul 2020 14:49:31 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 23 Jul 2020 10:49:08 -0400
Message-Id: <20200723144908.271110-5-aahringo@redhat.com>
In-Reply-To: <20200723144908.271110-1-aahringo@redhat.com>
References: <20200723144908.271110-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 4/4] fs: dlm: implement tcp
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
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
index f5ac40db5e7c1..359d5e003f749 100644
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
@@ -711,13 +764,18 @@ static int receive_from_sock(struct connection *con)
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
 
@@ -801,6 +859,7 @@ static int accept_from_sock(struct connection *con)
 			spin_lock_init(&othercon->writequeue_lock);
 			INIT_WORK(&othercon->swork, process_send_sockets);
 			INIT_WORK(&othercon->rwork, process_recv_sockets);
+			init_waitqueue_head(&othercon->shutdown_wait);
 			set_bit(CF_IS_OTHERCON, &othercon->flags);
 		} else {
 			/* close other sock con if we have something new */
@@ -1045,6 +1104,7 @@ static void tcp_connect_to_sock(struct connection *con)
 
 	con->rx_action = receive_from_sock;
 	con->connect_action = tcp_connect_to_sock;
+	con->shutdown_action = dlm_tcp_shutdown;
 	add_sock(sock, con);
 
 	/* Bind to our cluster-known address connecting to avoid
@@ -1540,6 +1600,12 @@ static void stop_conn(struct connection *con)
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
@@ -1591,6 +1657,7 @@ void dlm_lowcomms_stop(void)
 	mutex_lock(&connections_lock);
 	dlm_allow_conn = 0;
 	mutex_unlock(&connections_lock);
+	foreach_conn(shutdown_conn);
 	work_flush();
 	clean_writequeues();
 	foreach_conn(free_conn);
-- 
2.26.2

