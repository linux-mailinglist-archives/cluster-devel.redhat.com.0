Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D10303B1D66
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Jun 2021 17:15:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624461338;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M7Szmnq3zNfOEaphdarTHHDRGMTnxQXcSbobOzJX/60=;
	b=dHb2aHbjOC0YARU0D0QudzUQ28sKcWD/YBPIisCmSpxrmi1HYGFVC+0ByvyaxlQp8VJap2
	zgv8jJwLQLiRqpV/KuDBVSzC+6vhlaON1zO5uMf8JpKmG3f5Pd/dcb1K5yB5jo0SS5qBoY
	VFA1dOHO5raUPmIYwDzjs5e3nioYFTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-lpvLLO-HN4OMBZaTvNhDhw-1; Wed, 23 Jun 2021 11:15:37 -0400
X-MC-Unique: lpvLLO-HN4OMBZaTvNhDhw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47FD78FEFFA;
	Wed, 23 Jun 2021 15:15:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EADCD60877;
	Wed, 23 Jun 2021 15:15:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BA7F180125A;
	Wed, 23 Jun 2021 15:15:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15NFFJSK024760 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Jun 2021 11:15:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3739460E3A; Wed, 23 Jun 2021 15:15:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (unknown [10.22.8.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD4B761093;
	Wed, 23 Jun 2021 15:15:14 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Jun 2021 11:14:42 -0400
Message-Id: <20210623151454.176649-4-aahringo@redhat.com>
In-Reply-To: <20210623151454.176649-1-aahringo@redhat.com>
References: <20210623151454.176649-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC dlm/next 03/15] fs: dlm: move to static proto
	ops
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

This patch moves the per transport socket callbacks to a static const
array. We can support only one transport socket for the init namespace
which will be determinted by reading the dlm config at lowcomms_start().

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 52 +++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 395789bfc467..30ee2d349375 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -84,9 +84,6 @@ struct connection {
 	struct list_head writequeue;  /* List of outgoing writequeue_entries */
 	spinlock_t writequeue_lock;
 	atomic_t writequeue_cnt;
-	void (*connect_action) (struct connection *);	/* What to do to connect */
-	void (*shutdown_action)(struct connection *con); /* What to do to shutdown */
-	bool (*eof_condition)(struct connection *con); /* What to do to eof check */
 	int retries;
 #define MAX_CONNECT_RETRIES 3
 	struct hlist_node list;
@@ -145,6 +142,15 @@ struct dlm_node_addr {
 	struct sockaddr_storage *addr[DLM_MAX_ADDR_COUNT];
 };
 
+struct dlm_proto_ops {
+	/* What to do to connect */
+	void (*connect_action)(struct connection *con);
+	/* What to do to shutdown */
+	void (*shutdown_action)(struct connection *con);
+	/* What to do to eof check */
+	bool (*eof_condition)(struct connection *con);
+};
+
 static struct listen_sock_callbacks {
 	void (*sk_error_report)(struct sock *);
 	void (*sk_data_ready)(struct sock *);
@@ -168,12 +174,13 @@ static struct hlist_head connection_hash[CONN_HASH_SIZE];
 static DEFINE_SPINLOCK(connections_lock);
 DEFINE_STATIC_SRCU(connections_srcu);
 
+static const struct dlm_proto_ops *dlm_proto_ops;
+
 static void process_recv_sockets(struct work_struct *work);
 static void process_send_sockets(struct work_struct *work);
 
 static void sctp_connect_to_sock(struct connection *con);
 static void tcp_connect_to_sock(struct connection *con);
-static void dlm_tcp_shutdown(struct connection *con);
 
 /* need to held writequeue_lock */
 static struct writequeue_entry *con_next_wq(struct connection *con)
@@ -224,20 +231,6 @@ static int dlm_con_init(struct connection *con, int nodeid)
 	INIT_WORK(&con->rwork, process_recv_sockets);
 	init_waitqueue_head(&con->shutdown_wait);
 
-	switch (dlm_config.ci_protocol) {
-	case DLM_PROTO_TCP:
-		con->connect_action = tcp_connect_to_sock;
-		con->shutdown_action = dlm_tcp_shutdown;
-		con->eof_condition = tcp_eof_condition;
-		break;
-	case DLM_PROTO_SCTP:
-		con->connect_action = sctp_connect_to_sock;
-		break;
-	default:
-		kfree(con->rx_buf);
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
@@ -963,7 +956,8 @@ static int receive_from_sock(struct connection *con)
 		log_print("connection %p got EOF from %d",
 			  con, con->nodeid);
 
-		if (con->eof_condition && con->eof_condition(con)) {
+		if (dlm_proto_ops->eof_condition &&
+		    dlm_proto_ops->eof_condition(con)) {
 			set_bit(CF_EOF, &con->flags);
 			mutex_unlock(&con->sock_mutex);
 		} else {
@@ -1814,7 +1808,7 @@ static void process_send_sockets(struct work_struct *work)
 	if (con->sock == NULL) { /* not mutex protected so check it inside too */
 		if (test_and_clear_bit(CF_DELAY_CONNECT, &con->flags))
 			msleep(1000);
-		con->connect_action(con);
+		dlm_proto_ops->connect_action(con);
 	}
 	if (!list_empty(&con->writequeue))
 		send_to_sock(con);
@@ -1854,8 +1848,8 @@ static int work_start(void)
 
 static void shutdown_conn(struct connection *con)
 {
-	if (con->shutdown_action)
-		con->shutdown_action(con);
+	if (dlm_proto_ops->shutdown_action)
+		dlm_proto_ops->shutdown_action(con);
 }
 
 void dlm_lowcomms_shutdown(void)
@@ -1962,8 +1956,20 @@ void dlm_lowcomms_stop(void)
 	srcu_read_unlock(&connections_srcu, idx);
 	work_stop();
 	deinit_local();
+
+	dlm_proto_ops = NULL;
 }
 
+static const struct dlm_proto_ops dlm_tcp_ops = {
+	.connect_action = tcp_connect_to_sock,
+	.shutdown_action = dlm_tcp_shutdown,
+	.eof_condition = tcp_eof_condition,
+};
+
+static const struct dlm_proto_ops dlm_sctp_ops = {
+	.connect_action = sctp_connect_to_sock,
+};
+
 int dlm_lowcomms_start(void)
 {
 	int error = -EINVAL;
@@ -1990,9 +1996,11 @@ int dlm_lowcomms_start(void)
 	/* Start listening */
 	switch (dlm_config.ci_protocol) {
 	case DLM_PROTO_TCP:
+		dlm_proto_ops = &dlm_tcp_ops;
 		error = tcp_listen_for_all();
 		break;
 	case DLM_PROTO_SCTP:
+		dlm_proto_ops = &dlm_sctp_ops;
 		error = sctp_listen_for_all(&listen_con);
 		break;
 	default:
-- 
2.26.3

