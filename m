Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 59B0D3B1D69
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Jun 2021 17:15:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624461339;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XkjHxYJwWKrrXhyKyfsmvYiiZYOwf+h9IjAd+ZB4lOs=;
	b=H5GR+Qq5N+D/kJJJgylTSmBMfOi7xsLFj/tc/LX4L5LV/uvc3kfaDNHT2cF+PYTjdkYRMo
	JepTLNE02LX0VC0iOJZjPDTGz3hJWnTluZhG7gdV3hQc5J5zXXmiCZlYvmpgg2dXrfv5kg
	obGSmiqK1OYlmJI1yUVj0mVIkDthRdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-Ia12yfIyP4yvA834y5LlOA-1; Wed, 23 Jun 2021 11:15:38 -0400
X-MC-Unique: Ia12yfIyP4yvA834y5LlOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04BD11018728;
	Wed, 23 Jun 2021 15:15:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E94235D9F0;
	Wed, 23 Jun 2021 15:15:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D45C01801020;
	Wed, 23 Jun 2021 15:15:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15NFFOj1024822 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Jun 2021 11:15:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A6F160FB8; Wed, 23 Jun 2021 15:15:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (unknown [10.22.8.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD57A60E3A;
	Wed, 23 Jun 2021 15:15:19 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Jun 2021 11:14:43 -0400
Message-Id: <20210623151454.176649-5-aahringo@redhat.com>
In-Reply-To: <20210623151454.176649-1-aahringo@redhat.com>
References: <20210623151454.176649-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC dlm/next 04/15] fs: dlm: introduce generic
	listen
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

This patch combines each transport layer listen functionality into one
listen function. Per transport layer differences are provided by
additional callbacks in dlm_proto_ops.

This patch drops silently sock_set_keepalive() for listen tcp sockets
only. This socket option is not set at connecting sockets, I also don't
see the sense of set keepalive for sockets which are created by accept()
only.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 228 +++++++++++++++++++++++-----------------------
 1 file changed, 113 insertions(+), 115 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 30ee2d349375..783cfd5f63a5 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -143,6 +143,13 @@ struct dlm_node_addr {
 };
 
 struct dlm_proto_ops {
+	const char *name;
+	int proto;
+
+	int (*listen_validate)(void);
+	void (*listen_sockopts)(struct socket *sock);
+	int (*listen_bind)(struct socket *sock);
+
 	/* What to do to connect */
 	void (*connect_action)(struct connection *con);
 	/* What to do to shutdown */
@@ -1328,59 +1335,6 @@ static void tcp_connect_to_sock(struct connection *con)
 	return;
 }
 
-/* On error caller must run dlm_close_sock() for the
- * listen connection socket.
- */
-static int tcp_create_listen_sock(struct listen_connection *con,
-				  struct sockaddr_storage *saddr)
-{
-	struct socket *sock = NULL;
-	int result = 0;
-	int addr_len;
-
-	if (dlm_local_addr[0]->ss_family == AF_INET)
-		addr_len = sizeof(struct sockaddr_in);
-	else
-		addr_len = sizeof(struct sockaddr_in6);
-
-	/* Create a socket to communicate with */
-	result = sock_create_kern(&init_net, dlm_local_addr[0]->ss_family,
-				  SOCK_STREAM, IPPROTO_TCP, &sock);
-	if (result < 0) {
-		log_print("Can't create listening comms socket");
-		goto create_out;
-	}
-
-	sock_set_mark(sock->sk, dlm_config.ci_mark);
-
-	/* Turn off Nagle's algorithm */
-	tcp_sock_set_nodelay(sock->sk);
-
-	sock_set_reuseaddr(sock->sk);
-
-	add_listen_sock(sock, con);
-
-	/* Bind to our port */
-	make_sockaddr(saddr, dlm_config.ci_tcp_port, &addr_len);
-	result = sock->ops->bind(sock, (struct sockaddr *) saddr, addr_len);
-	if (result < 0) {
-		log_print("Can't bind to port %d", dlm_config.ci_tcp_port);
-		goto create_out;
-	}
-	sock_set_keepalive(sock->sk);
-
-	result = sock->ops->listen(sock, 5);
-	if (result < 0) {
-		log_print("Can't listen on port %d", dlm_config.ci_tcp_port);
-		goto create_out;
-	}
-
-	return 0;
-
-create_out:
-	return result;
-}
-
 /* Get local addresses */
 static void init_local(void)
 {
@@ -1407,63 +1361,6 @@ static void deinit_local(void)
 		kfree(dlm_local_addr[i]);
 }
 
-/* Initialise SCTP socket and bind to all interfaces
- * On error caller must run dlm_close_sock() for the
- * listen connection socket.
- */
-static int sctp_listen_for_all(struct listen_connection *con)
-{
-	struct socket *sock = NULL;
-	int result = -EINVAL;
-
-	log_print("Using SCTP for communications");
-
-	result = sock_create_kern(&init_net, dlm_local_addr[0]->ss_family,
-				  SOCK_STREAM, IPPROTO_SCTP, &sock);
-	if (result < 0) {
-		log_print("Can't create comms socket, check SCTP is loaded");
-		goto out;
-	}
-
-	sock_set_rcvbuf(sock->sk, NEEDED_RMEM);
-	sock_set_mark(sock->sk, dlm_config.ci_mark);
-	sctp_sock_set_nodelay(sock->sk);
-
-	add_listen_sock(sock, con);
-
-	/* Bind to all addresses. */
-	result = sctp_bind_addrs(con->sock, dlm_config.ci_tcp_port);
-	if (result < 0)
-		goto out;
-
-	result = sock->ops->listen(sock, 5);
-	if (result < 0) {
-		log_print("Can't set socket listening");
-		goto out;
-	}
-
-	return 0;
-
-out:
-	return result;
-}
-
-static int tcp_listen_for_all(void)
-{
-	/* We don't support multi-homed hosts */
-	if (dlm_local_count > 1) {
-		log_print("TCP protocol can't handle multi-homed hosts, "
-			  "try SCTP");
-		return -EINVAL;
-	}
-
-	log_print("Using TCP for communications");
-
-	return tcp_create_listen_sock(&listen_con, dlm_local_addr[0]);
-}
-
-
-
 static struct writequeue_entry *new_writequeue_entry(struct connection *con,
 						     gfp_t allocation)
 {
@@ -1960,13 +1857,112 @@ void dlm_lowcomms_stop(void)
 	dlm_proto_ops = NULL;
 }
 
+static int dlm_listen_for_all(void)
+{
+	struct socket *sock;
+	int result;
+
+	log_print("Using %s for communications",
+		  dlm_proto_ops->name);
+
+	if (dlm_proto_ops->listen_validate) {
+		result = dlm_proto_ops->listen_validate();
+		if (result < 0)
+			return result;
+	}
+
+	result = sock_create_kern(&init_net, dlm_local_addr[0]->ss_family,
+				  SOCK_STREAM, dlm_proto_ops->proto, &sock);
+	if (result < 0) {
+		log_print("Can't create comms socket, check SCTP is loaded");
+		goto out;
+	}
+
+	sock_set_mark(sock->sk, dlm_config.ci_mark);
+	dlm_proto_ops->listen_sockopts(sock);
+
+	result = dlm_proto_ops->listen_bind(sock);
+	if (result < 0)
+		goto out;
+
+	save_listen_callbacks(sock);
+	add_listen_sock(sock, &listen_con);
+
+	INIT_WORK(&listen_con.rwork, process_listen_recv_socket);
+	result = sock->ops->listen(sock, 5);
+	if (result < 0) {
+		dlm_close_sock(&listen_con.sock);
+		goto out;
+	}
+
+	return 0;
+
+out:
+	sock_release(sock);
+	return result;
+}
+
+static int dlm_tcp_listen_validate(void)
+{
+	/* We don't support multi-homed hosts */
+	if (dlm_local_count > 1) {
+		log_print("TCP protocol can't handle multi-homed hosts, try SCTP");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void dlm_tcp_sockopts(struct socket *sock)
+{
+	/* Turn off Nagle's algorithm */
+	tcp_sock_set_nodelay(sock->sk);
+}
+
+static void dlm_tcp_listen_sockopts(struct socket *sock)
+{
+	dlm_tcp_sockopts(sock);
+	sock_set_reuseaddr(sock->sk);
+}
+
+static int dlm_tcp_listen_bind(struct socket *sock)
+{
+	int addr_len;
+
+	/* Bind to our port */
+	make_sockaddr(dlm_local_addr[0], dlm_config.ci_tcp_port, &addr_len);
+	return sock->ops->bind(sock, (struct sockaddr *)dlm_local_addr[0],
+			       addr_len);
+}
+
 static const struct dlm_proto_ops dlm_tcp_ops = {
+	.name = "TCP",
+	.proto = IPPROTO_TCP,
+	.listen_validate = dlm_tcp_listen_validate,
+	.listen_sockopts = dlm_tcp_listen_sockopts,
+	.listen_bind = dlm_tcp_listen_bind,
 	.connect_action = tcp_connect_to_sock,
 	.shutdown_action = dlm_tcp_shutdown,
 	.eof_condition = tcp_eof_condition,
 };
 
+static int dlm_sctp_bind_listen(struct socket *sock)
+{
+	return sctp_bind_addrs(sock, dlm_config.ci_tcp_port);
+}
+
+static void dlm_sctp_sockopts(struct socket *sock)
+{
+	/* Turn off Nagle's algorithm */
+	sctp_sock_set_nodelay(sock->sk);
+	sock_set_rcvbuf(sock->sk, NEEDED_RMEM);
+}
+
 static const struct dlm_proto_ops dlm_sctp_ops = {
+	.name = "SCTP",
+	.proto = IPPROTO_SCTP,
+	.listen_sockopts = dlm_sctp_sockopts,
+	.listen_bind = dlm_sctp_bind_listen,
 	.connect_action = sctp_connect_to_sock,
 };
 
@@ -1997,24 +1993,26 @@ int dlm_lowcomms_start(void)
 	switch (dlm_config.ci_protocol) {
 	case DLM_PROTO_TCP:
 		dlm_proto_ops = &dlm_tcp_ops;
-		error = tcp_listen_for_all();
 		break;
 	case DLM_PROTO_SCTP:
 		dlm_proto_ops = &dlm_sctp_ops;
-		error = sctp_listen_for_all(&listen_con);
 		break;
 	default:
 		log_print("Invalid protocol identifier %d set",
 			  dlm_config.ci_protocol);
 		error = -EINVAL;
-		break;
+		goto fail_proto_ops;
 	}
+
+	error = dlm_listen_for_all();
 	if (error)
-		goto fail_unlisten;
+		goto fail_listen;
 
 	return 0;
 
-fail_unlisten:
+fail_listen:
+	dlm_proto_ops = NULL;
+fail_proto_ops:
 	dlm_allow_conn = 0;
 	dlm_close_sock(&listen_con.sock);
 	work_stop();
-- 
2.26.3

