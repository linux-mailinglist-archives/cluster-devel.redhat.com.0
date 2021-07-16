Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE723CBDB6
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Jul 2021 22:23:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626466992;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JGi+UhvidTex2/Gebi9GgJGNPO+ubMYMc5MzjpjdM8Y=;
	b=hwcOm7vrMKpMUaT2YcgI0oCqWyn+D0QilyQdIy8Ta7+nfS5YVIld0LF3yHRGM2E0p81yiX
	fJlFOZDmOMwQl7AEsUOOd/i9EPSat2eKBs5NYu7UChNPy0X6FKIOpYmJbz6Agkljd2fM/+
	SCR7vOf6v552MjPDPxunAo+eR7rmkag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-JXyq24TUO2q8HUYwhRoBBg-1; Fri, 16 Jul 2021 16:23:10 -0400
X-MC-Unique: JXyq24TUO2q8HUYwhRoBBg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB26A9F935;
	Fri, 16 Jul 2021 20:23:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEA4A18A9E;
	Fri, 16 Jul 2021 20:23:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CEA231809C99;
	Fri, 16 Jul 2021 20:23:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16GKN67t026102 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 16 Jul 2021 16:23:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6CDE25D719; Fri, 16 Jul 2021 20:23:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B04C5D6AB;
	Fri, 16 Jul 2021 20:23:06 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 16 Jul 2021 16:22:43 -0400
Message-Id: <20210716202245.1262791-11-aahringo@redhat.com>
In-Reply-To: <20210716202245.1262791-1-aahringo@redhat.com>
References: <20210716202245.1262791-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v5.14-rc1 10/12] fs: dlm: generic connect
	func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds a generic connect function for TCP and SCTP. If the
connect functionality differs from each other additional callbacks in
dlm_proto_ops were added. The sockopts callback handling will guarantee
that sockets created by connect() will use the same options as sockets
created by accept().

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 343 ++++++++++++++++++++--------------------------
 1 file changed, 150 insertions(+), 193 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index f23682da7b56..ac5825d77ce8 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -143,15 +143,17 @@ struct dlm_node_addr {
 };
 
 struct dlm_proto_ops {
+	bool try_new_addr;
 	const char *name;
 	int proto;
 
+	int (*connect)(struct connection *con, struct socket *sock,
+		       struct sockaddr *addr, int addr_len);
+	void (*sockopts)(struct socket *sock);
+	int (*bind)(struct socket *sock);
 	int (*listen_validate)(void);
 	void (*listen_sockopts)(struct socket *sock);
 	int (*listen_bind)(struct socket *sock);
-
-	/* What to do to connect */
-	void (*connect_action)(struct connection *con);
 	/* What to do to shutdown */
 	void (*shutdown_action)(struct connection *con);
 	/* What to do to eof check */
@@ -186,9 +188,6 @@ static const struct dlm_proto_ops *dlm_proto_ops;
 static void process_recv_sockets(struct work_struct *work);
 static void process_send_sockets(struct work_struct *work);
 
-static void sctp_connect_to_sock(struct connection *con);
-static void tcp_connect_to_sock(struct connection *con);
-
 /* need to held writequeue_lock */
 static struct writequeue_entry *con_next_wq(struct connection *con)
 {
@@ -1151,189 +1150,6 @@ static int sctp_bind_addrs(struct socket *sock, uint16_t port)
 	return result;
 }
 
-/* Initiate an SCTP association.
-   This is a special case of send_to_sock() in that we don't yet have a
-   peeled-off socket for this association, so we use the listening socket
-   and add the primary IP address of the remote node.
- */
-static void sctp_connect_to_sock(struct connection *con)
-{
-	struct sockaddr_storage daddr;
-	int result;
-	int addr_len;
-	struct socket *sock;
-	unsigned int mark;
-
-	mutex_lock(&con->sock_mutex);
-
-	/* Some odd races can cause double-connects, ignore them */
-	if (con->retries++ > MAX_CONNECT_RETRIES)
-		goto out;
-
-	if (con->sock) {
-		log_print("node %d already connected.", con->nodeid);
-		goto out;
-	}
-
-	memset(&daddr, 0, sizeof(daddr));
-	result = nodeid_to_addr(con->nodeid, &daddr, NULL, true, &mark);
-	if (result < 0) {
-		log_print("no address for nodeid %d", con->nodeid);
-		goto out;
-	}
-
-	/* Create a socket to communicate with */
-	result = sock_create_kern(&init_net, dlm_local_addr[0]->ss_family,
-				  SOCK_STREAM, IPPROTO_SCTP, &sock);
-	if (result < 0)
-		goto socket_err;
-
-	sock_set_mark(sock->sk, mark);
-
-	add_sock(sock, con);
-
-	/* Bind to all addresses. */
-	if (sctp_bind_addrs(con->sock, 0))
-		goto bind_err;
-
-	make_sockaddr(&daddr, dlm_config.ci_tcp_port, &addr_len);
-
-	log_print_ratelimited("connecting to %d", con->nodeid);
-
-	/* Turn off Nagle's algorithm */
-	sctp_sock_set_nodelay(sock->sk);
-
-	/*
-	 * Make sock->ops->connect() function return in specified time,
-	 * since O_NONBLOCK argument in connect() function does not work here,
-	 * then, we should restore the default value of this attribute.
-	 */
-	sock_set_sndtimeo(sock->sk, 5);
-	result = sock->ops->connect(sock, (struct sockaddr *)&daddr, addr_len,
-				   0);
-	sock_set_sndtimeo(sock->sk, 0);
-
-	if (result == -EINPROGRESS)
-		result = 0;
-	if (result == 0) {
-		if (!test_and_set_bit(CF_CONNECTED, &con->flags))
-			log_print("successful connected to node %d", con->nodeid);
-		goto out;
-	}
-
-bind_err:
-	con->sock = NULL;
-	sock_release(sock);
-
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
-		mutex_unlock(&con->sock_mutex);
-		msleep(1000);
-		lowcomms_connect_sock(con);
-		return;
-	}
-
-out:
-	mutex_unlock(&con->sock_mutex);
-}
-
-/* Connect a new socket to its peer */
-static void tcp_connect_to_sock(struct connection *con)
-{
-	struct sockaddr_storage saddr, src_addr;
-	unsigned int mark;
-	int addr_len;
-	struct socket *sock = NULL;
-	int result;
-
-	mutex_lock(&con->sock_mutex);
-	if (con->retries++ > MAX_CONNECT_RETRIES)
-		goto out;
-
-	/* Some odd races can cause double-connects, ignore them */
-	if (con->sock)
-		goto out;
-
-	/* Create a socket to communicate with */
-	result = sock_create_kern(&init_net, dlm_local_addr[0]->ss_family,
-				  SOCK_STREAM, IPPROTO_TCP, &sock);
-	if (result < 0)
-		goto out_err;
-
-	memset(&saddr, 0, sizeof(saddr));
-	result = nodeid_to_addr(con->nodeid, &saddr, NULL, false, &mark);
-	if (result < 0) {
-		log_print("no address for nodeid %d", con->nodeid);
-		goto out_err;
-	}
-
-	sock_set_mark(sock->sk, mark);
-
-	add_sock(sock, con);
-
-	/* Bind to our cluster-known address connecting to avoid
-	   routing problems */
-	memcpy(&src_addr, dlm_local_addr[0], sizeof(src_addr));
-	make_sockaddr(&src_addr, 0, &addr_len);
-	result = sock->ops->bind(sock, (struct sockaddr *) &src_addr,
-				 addr_len);
-	if (result < 0) {
-		log_print("could not bind for connect: %d", result);
-		/* This *may* not indicate a critical error */
-	}
-
-	make_sockaddr(&saddr, dlm_config.ci_tcp_port, &addr_len);
-
-	log_print_ratelimited("connecting to %d", con->nodeid);
-
-	/* Turn off Nagle's algorithm */
-	tcp_sock_set_nodelay(sock->sk);
-
-	result = sock->ops->connect(sock, (struct sockaddr *)&saddr, addr_len,
-				   O_NONBLOCK);
-	if (result == -EINPROGRESS)
-		result = 0;
-	if (result == 0)
-		goto out;
-
-out_err:
-	if (con->sock) {
-		sock_release(con->sock);
-		con->sock = NULL;
-	} else if (sock) {
-		sock_release(sock);
-	}
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
-		mutex_unlock(&con->sock_mutex);
-		msleep(1000);
-		lowcomms_connect_sock(con);
-		return;
-	}
-out:
-	mutex_unlock(&con->sock_mutex);
-	return;
-}
-
 /* Get local addresses */
 static void init_local(void)
 {
@@ -1687,6 +1503,74 @@ static void process_listen_recv_socket(struct work_struct *work)
 	accept_from_sock(&listen_con);
 }
 
+static void dlm_connect(struct connection *con)
+{
+	struct sockaddr_storage addr;
+	int result, addr_len;
+	struct socket *sock;
+	unsigned int mark;
+
+	/* Some odd races can cause double-connects, ignore them */
+	if (con->retries++ > MAX_CONNECT_RETRIES)
+		return;
+
+	if (con->sock) {
+		log_print("node %d already connected.", con->nodeid);
+		return;
+	}
+
+	memset(&addr, 0, sizeof(addr));
+	result = nodeid_to_addr(con->nodeid, &addr, NULL,
+				dlm_proto_ops->try_new_addr, &mark);
+	if (result < 0) {
+		log_print("no address for nodeid %d", con->nodeid);
+		return;
+	}
+
+	/* Create a socket to communicate with */
+	result = sock_create_kern(&init_net, dlm_local_addr[0]->ss_family,
+				  SOCK_STREAM, dlm_proto_ops->proto, &sock);
+	if (result < 0)
+		goto socket_err;
+
+	sock_set_mark(sock->sk, mark);
+	dlm_proto_ops->sockopts(sock);
+
+	add_sock(sock, con);
+
+	result = dlm_proto_ops->bind(sock);
+	if (result < 0)
+		goto add_sock_err;
+
+	log_print_ratelimited("connecting to %d", con->nodeid);
+	make_sockaddr(&addr, dlm_config.ci_tcp_port, &addr_len);
+	result = dlm_proto_ops->connect(con, sock, (struct sockaddr *)&addr,
+					addr_len);
+	if (result < 0)
+		goto add_sock_err;
+
+	return;
+
+add_sock_err:
+	dlm_close_sock(&con->sock);
+
+socket_err:
+	/*
+	 * Some errors are fatal and this list might need adjusting. For other
+	 * errors we try again until the max number of retries is reached.
+	 */
+	if (result != -EHOSTUNREACH &&
+	    result != -ENETUNREACH &&
+	    result != -ENETDOWN &&
+	    result != -EINVAL &&
+	    result != -EPROTONOSUPPORT) {
+		log_print("connect %d try %d error %d", con->nodeid,
+			  con->retries, result);
+		msleep(1000);
+		lowcomms_connect_sock(con);
+	}
+}
+
 /* Send workqueue function */
 static void process_send_sockets(struct work_struct *work)
 {
@@ -1701,11 +1585,15 @@ static void process_send_sockets(struct work_struct *work)
 		dlm_midcomms_unack_msg_resend(con->nodeid);
 	}
 
-	if (con->sock == NULL) { /* not mutex protected so check it inside too */
+	if (con->sock == NULL) {
 		if (test_and_clear_bit(CF_DELAY_CONNECT, &con->flags))
 			msleep(1000);
-		dlm_proto_ops->connect_action(con);
+
+		mutex_lock(&con->sock_mutex);
+		dlm_connect(con);
+		mutex_unlock(&con->sock_mutex);
 	}
+
 	if (!list_empty(&con->writequeue))
 		send_to_sock(con);
 }
@@ -1899,6 +1787,43 @@ static int dlm_listen_for_all(void)
 	return result;
 }
 
+static int dlm_tcp_bind(struct socket *sock)
+{
+	struct sockaddr_storage src_addr;
+	int result, addr_len;
+
+	/* Bind to our cluster-known address connecting to avoid
+	 * routing problems.
+	 */
+	memcpy(&src_addr, dlm_local_addr[0], sizeof(src_addr));
+	make_sockaddr(&src_addr, 0, &addr_len);
+
+	result = sock->ops->bind(sock, (struct sockaddr *)&src_addr,
+				 addr_len);
+	if (result < 0) {
+		/* This *may* not indicate a critical error */
+		log_print("could not bind for connect: %d", result);
+	}
+
+	return 0;
+}
+
+static int dlm_tcp_connect(struct connection *con, struct socket *sock,
+			   struct sockaddr *addr, int addr_len)
+{
+	int ret;
+
+	ret = sock->ops->connect(sock, addr, addr_len, O_NONBLOCK);
+	switch (ret) {
+	case -EINPROGRESS:
+		fallthrough;
+	case 0:
+		return 0;
+	}
+
+	return ret;
+}
+
 static int dlm_tcp_listen_validate(void)
 {
 	/* We don't support multi-homed hosts */
@@ -1935,14 +1860,43 @@ static int dlm_tcp_listen_bind(struct socket *sock)
 static const struct dlm_proto_ops dlm_tcp_ops = {
 	.name = "TCP",
 	.proto = IPPROTO_TCP,
+	.connect = dlm_tcp_connect,
+	.sockopts = dlm_tcp_sockopts,
+	.bind = dlm_tcp_bind,
 	.listen_validate = dlm_tcp_listen_validate,
 	.listen_sockopts = dlm_tcp_listen_sockopts,
 	.listen_bind = dlm_tcp_listen_bind,
-	.connect_action = tcp_connect_to_sock,
 	.shutdown_action = dlm_tcp_shutdown,
 	.eof_condition = tcp_eof_condition,
 };
 
+static int dlm_sctp_bind(struct socket *sock)
+{
+	return sctp_bind_addrs(sock, 0);
+}
+
+static int dlm_sctp_connect(struct connection *con, struct socket *sock,
+			    struct sockaddr *addr, int addr_len)
+{
+	int ret;
+
+	/*
+	 * Make sock->ops->connect() function return in specified time,
+	 * since O_NONBLOCK argument in connect() function does not work here,
+	 * then, we should restore the default value of this attribute.
+	 */
+	sock_set_sndtimeo(sock->sk, 5);
+	ret = sock->ops->connect(sock, addr, addr_len, 0);
+	sock_set_sndtimeo(sock->sk, 0);
+	if (ret < 0)
+		return ret;
+
+	if (!test_and_set_bit(CF_CONNECTED, &con->flags))
+		log_print("successful connected to node %d", con->nodeid);
+
+	return 0;
+}
+
 static int dlm_sctp_listen_validate(void)
 {
 	if (!IS_ENABLED(CONFIG_IP_SCTP)) {
@@ -1969,10 +1923,13 @@ static void dlm_sctp_sockopts(struct socket *sock)
 static const struct dlm_proto_ops dlm_sctp_ops = {
 	.name = "SCTP",
 	.proto = IPPROTO_SCTP,
+	.try_new_addr = true,
+	.connect = dlm_sctp_connect,
+	.sockopts = dlm_sctp_sockopts,
+	.bind = dlm_sctp_bind,
 	.listen_validate = dlm_sctp_listen_validate,
 	.listen_sockopts = dlm_sctp_sockopts,
 	.listen_bind = dlm_sctp_bind_listen,
-	.connect_action = sctp_connect_to_sock,
 };
 
 int dlm_lowcomms_start(void)
-- 
2.27.0

