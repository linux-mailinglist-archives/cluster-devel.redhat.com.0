Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2674F3BBEFE
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Jul 2021 17:29:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-vzxx6fyKMQWK3dEyqfulkQ-1; Mon, 05 Jul 2021 11:28:59 -0400
X-MC-Unique: vzxx6fyKMQWK3dEyqfulkQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA9679126D;
	Mon,  5 Jul 2021 15:28:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B8AA5C1D0;
	Mon,  5 Jul 2021 15:28:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85F5E4EA29;
	Mon,  5 Jul 2021 15:28:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 165FSkBt031845 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Jul 2021 11:28:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 308C0202348B; Mon,  5 Jul 2021 15:28:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27EFF200C0CC
	for <cluster-devel@redhat.com>; Mon,  5 Jul 2021 15:28:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C79CF1071CE0
	for <cluster-devel@redhat.com>; Mon,  5 Jul 2021 15:28:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-244-Cav_oK_-OFCIQ1YyWXaF2g-1;
	Mon, 05 Jul 2021 11:28:39 -0400
X-MC-Unique: Cav_oK_-OFCIQ1YyWXaF2g-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22E9B61964;
	Mon,  5 Jul 2021 15:28:37 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon,  5 Jul 2021 11:27:32 -0400
Message-Id: <20210705152815.1520546-16-sashal@kernel.org>
In-Reply-To: <20210705152815.1520546-1-sashal@kernel.org>
References: <20210705152815.1520546-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.13 16/59] fs: dlm: reconnect if
	socket error report occurs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Alexander Aring <aahringo@redhat.com>

[ Upstream commit ba868d9deaab2bb1c09e50650127823925154802 ]

This patch will change the reconnect handling that if an error occurs
if a socket error callback is occurred. This will also handle reconnects
in a non blocking connecting case which is currently missing. If error
ECONNREFUSED is reported we delay the reconnect by one second.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/dlm/lowcomms.c | 60 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 47bf99373f3e..cdc50e9a5ab0 100644
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
@@ -939,6 +957,7 @@ static int accept_from_sock(struct listen_connection *con)
 
 			lockdep_set_subclass(&othercon->sock_mutex, 1);
 			newcon->othercon = othercon;
+			othercon->sendcon = newcon;
 		} else {
 			/* close other sock con if we have something new */
 			close_connection(othercon, false, true, false);
@@ -1503,7 +1522,7 @@ static void send_to_sock(struct connection *con)
 				cond_resched();
 				goto out;
 			} else if (ret < 0)
-				goto send_error;
+				goto out;
 		}
 
 		/* Don't starve people filling buffers */
@@ -1520,14 +1539,6 @@ static void send_to_sock(struct connection *con)
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
@@ -1602,8 +1613,15 @@ static void process_send_sockets(struct work_struct *work)
 	struct connection *con = container_of(work, struct connection, swork);
 
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
2.30.2

