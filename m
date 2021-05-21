Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D553038CDEF
	for <lists+cluster-devel@lfdr.de>; Fri, 21 May 2021 21:09:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621624156;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MJAny9jDcCQHAhsMmrGUZfSxF9clHZYJvyOfgLACMh0=;
	b=At5jK/cAaf1Q80FDP6yFYKFKIcapQUqYnK5l60Pu3dTF3auqApMo/Br+Njx1mSmr5lc4uM
	kLs/Y0iEqR5KN2aYHm5hVj5p0SfYZGXEY6iM27PoOyg/8iFBV2Vby+MmXh2XCTMJzCtm7B
	T84crS+5a2W6UviPUoHlZMovso8/qco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-hEqfEDlQPSO6cY_qLauecw-1; Fri, 21 May 2021 15:09:14 -0400
X-MC-Unique: hEqfEDlQPSO6cY_qLauecw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80929188E3E4;
	Fri, 21 May 2021 19:09:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 491D15D9D5;
	Fri, 21 May 2021 19:09:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CFFD180B463;
	Fri, 21 May 2021 19:09:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14LJ964T005148 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 May 2021 15:09:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 25A361E6; Fri, 21 May 2021 19:09:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-19.rdu2.redhat.com [10.10.115.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 91E225C1BB;
	Fri, 21 May 2021 19:09:05 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 21 May 2021 15:08:37 -0400
Message-Id: <20210521190848.350176-6-aahringo@redhat.com>
In-Reply-To: <20210521190848.350176-1-aahringo@redhat.com>
References: <20210521190848.350176-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv6 v5.13-rc1 dlm/next 05/16] fs: dlm:
	reconnect if socket error report occurs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will change the reconnect handling that if an error occurs
if a socket error callback is occurred. This will also handle reconnects
in a non blocking connecting case which is currently missing. If error
ECONNREFUSED is reported we delay the reconnect by one second.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 60 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 4944aef24aa5..051f22dbb83a 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -79,6 +79,8 @@ struct connection {
 #define CF_CLOSING 8
 #define CF_SHUTDOWN 9
 #define CF_CONNECTED 10
+#define CF_RECONNECT 11
+#define CF_DELAY_CONNECT 12
 	struct list_head writequeue;  /* List of outgoing writequeue_entries */
 	spinlock_t writequeue_lock;
 	void (*connect_action) (struct connection *);	/* What to do to connect */
@@ -87,6 +89,7 @@ struct connection {
 #define MAX_CONNECT_RETRIES 3
 	struct hlist_node list;
 	struct connection *othercon;
+	struct connection *sendcon;
 	struct work_struct rwork; /* Receive workqueue */
 	struct work_struct swork; /* Send workqueue */
 	wait_queue_head_t shutdown_wait; /* wait for graceful shutdown */
@@ -585,6 +588,22 @@ static void lowcomms_error_report(struct sock *sk)
 				   dlm_config.ci_tcp_port, sk->sk_err,
 				   sk->sk_err_soft);
 	}
+
+	/* below sendcon only handling */
+	if (test_bit(CF_IS_OTHERCON, &con->flags))
+		con = con->sendcon;
+
+	switch (sk->sk_err) {
+	case ECONNREFUSED:
+		set_bit(CF_DELAY_CONNECT, &con->flags);
+		break;
+	default:
+		break;
+	}
+
+	if (!test_and_set_bit(CF_RECONNECT, &con->flags))
+		queue_work(send_workqueue, &con->swork);
+
 out:
 	read_unlock_bh(&sk->sk_callback_lock);
 	if (orig_report)
@@ -702,6 +721,8 @@ static void close_connection(struct connection *con, bool and_other,
 	con->rx_leftover = 0;
 	con->retries = 0;
 	clear_bit(CF_CONNECTED, &con->flags);
+	clear_bit(CF_DELAY_CONNECT, &con->flags);
+	clear_bit(CF_RECONNECT, &con->flags);
 	mutex_unlock(&con->sock_mutex);
 	clear_bit(CF_CLOSING, &con->flags);
 }
@@ -840,18 +861,15 @@ static int receive_from_sock(struct connection *con)
 
 out_close:
 	mutex_unlock(&con->sock_mutex);
-	if (ret != -EAGAIN) {
-		/* Reconnect when there is something to send */
+	if (ret == 0) {
 		close_connection(con, false, true, false);
-		if (ret == 0) {
-			log_print("connection %p got EOF from %d",
-				  con, con->nodeid);
-			/* handling for tcp shutdown */
-			clear_bit(CF_SHUTDOWN, &con->flags);
-			wake_up(&con->shutdown_wait);
-			/* signal to breaking receive worker */
-			ret = -1;
-		}
+		log_print("connection %p got EOF from %d",
+			  con, con->nodeid);
+		/* handling for tcp shutdown */
+		clear_bit(CF_SHUTDOWN, &con->flags);
+		wake_up(&con->shutdown_wait);
+		/* signal to breaking receive worker */
+		ret = -1;
 	}
 	return ret;
 }
@@ -940,6 +958,7 @@ static int accept_from_sock(struct listen_connection *con)
 			lockdep_set_subclass(&othercon->sock_mutex, 1);
 			set_bit(CF_IS_OTHERCON, &othercon->flags);
 			newcon->othercon = othercon;
+			othercon->sendcon = newcon;
 		} else {
 			/* close other sock con if we have something new */
 			close_connection(othercon, false, true, false);
@@ -1504,7 +1523,7 @@ static void send_to_sock(struct connection *con)
 				cond_resched();
 				goto out;
 			} else if (ret < 0)
-				goto send_error;
+				goto out;
 		}
 
 		/* Don't starve people filling buffers */
@@ -1521,14 +1540,6 @@ static void send_to_sock(struct connection *con)
 	mutex_unlock(&con->sock_mutex);
 	return;
 
-send_error:
-	mutex_unlock(&con->sock_mutex);
-	close_connection(con, false, false, true);
-	/* Requeue the send work. When the work daemon runs again, it will try
-	   a new connection, then call this function again. */
-	queue_work(send_workqueue, &con->swork);
-	return;
-
 out_connect:
 	mutex_unlock(&con->sock_mutex);
 	queue_work(send_workqueue, &con->swork);
@@ -1605,8 +1616,15 @@ static void process_send_sockets(struct work_struct *work)
 	WARN_ON(test_bit(CF_IS_OTHERCON, &con->flags));
 
 	clear_bit(CF_WRITE_PENDING, &con->flags);
-	if (con->sock == NULL) /* not mutex protected so check it inside too */
+
+	if (test_and_clear_bit(CF_RECONNECT, &con->flags))
+		close_connection(con, false, false, true);
+
+	if (con->sock == NULL) { /* not mutex protected so check it inside too */
+		if (test_and_clear_bit(CF_DELAY_CONNECT, &con->flags))
+			msleep(1000);
 		con->connect_action(con);
+	}
 	if (!list_empty(&con->writequeue))
 		send_to_sock(con);
 }
-- 
2.26.3

