Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BBE44EF01
	for <lists+cluster-devel@lfdr.de>; Fri, 12 Nov 2021 23:03:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636754602;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BVUhH0fXvU7cleaOisM0gpt/br/ZxWF+yMej2m2eBbY=;
	b=d5TyroQP1I3vhKHPYk3WosK5MiSdsZELG/kABVIWD/8LPE254Cid3Ay0Dh/FrdAsFrG4GP
	I3Hy6bH4ImTzPSbYrOHBUEpwhLWXt4MzlYHMyzGqlu9NIbZah+LIPKOxJOc9csdovImtEQ
	yOYDNqpMin08hKj1e8op3vY6Rqrf4M8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-Qsd6AIUvOYWF0SbhA3qbRA-1; Fri, 12 Nov 2021 17:03:19 -0500
X-MC-Unique: Qsd6AIUvOYWF0SbhA3qbRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B6AD1030C21;
	Fri, 12 Nov 2021 22:03:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35ED05C3DF;
	Fri, 12 Nov 2021 22:03:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09F7B4E58E;
	Fri, 12 Nov 2021 22:03:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ACM36ua020541 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 12 Nov 2021 17:03:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B231A60C82; Fri, 12 Nov 2021 22:03:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6320660C17;
	Fri, 12 Nov 2021 22:03:06 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 12 Nov 2021 17:02:40 -0500
Message-Id: <20211112220240.1695712-2-aahringo@redhat.com>
In-Reply-To: <20211112220240.1695712-1-aahringo@redhat.com>
References: <20211112220240.1695712-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 2/2] fs: dlm: replace use of socket
	sk_callback_lock with sock_lock
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

This patch will replace the use of socket sk_callback_lock lock and uses
socket lock instead. Some users like sunrpc, see commit ea9afca88bbe
("SUNRPC: Replace use of socket sk_callback_lock with sock_lock") moving
from sk_callback_lock to sock_lock which seems to be held when the socket
callbacks are called.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index e319309066b3..df94cba699ea 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -489,11 +489,9 @@ static void lowcomms_data_ready(struct sock *sk)
 {
 	struct connection *con;
 
-	read_lock_bh(&sk->sk_callback_lock);
 	con = sock2con(sk);
 	if (con && !test_and_set_bit(CF_READ_PENDING, &con->flags))
 		queue_work(recv_workqueue, &con->rwork);
-	read_unlock_bh(&sk->sk_callback_lock);
 }
 
 static void lowcomms_listen_data_ready(struct sock *sk)
@@ -508,15 +506,14 @@ static void lowcomms_write_space(struct sock *sk)
 {
 	struct connection *con;
 
-	read_lock_bh(&sk->sk_callback_lock);
 	con = sock2con(sk);
 	if (!con)
-		goto out;
+		return;
 
 	if (!test_and_set_bit(CF_CONNECTED, &con->flags)) {
 		log_print("successful connected to node %d", con->nodeid);
 		queue_work(send_workqueue, &con->swork);
-		goto out;
+		return;
 	}
 
 	clear_bit(SOCK_NOSPACE, &con->sock->flags);
@@ -527,8 +524,6 @@ static void lowcomms_write_space(struct sock *sk)
 	}
 
 	queue_work(send_workqueue, &con->swork);
-out:
-	read_unlock_bh(&sk->sk_callback_lock);
 }
 
 static inline void lowcomms_connect_sock(struct connection *con)
@@ -597,7 +592,6 @@ static void lowcomms_error_report(struct sock *sk)
 	struct connection *con;
 	void (*orig_report)(struct sock *) = NULL;
 
-	read_lock_bh(&sk->sk_callback_lock);
 	con = sock2con(sk);
 	if (con == NULL)
 		goto out;
@@ -642,7 +636,6 @@ static void lowcomms_error_report(struct sock *sk)
 		queue_work(send_workqueue, &con->swork);
 
 out:
-	read_unlock_bh(&sk->sk_callback_lock);
 	if (orig_report)
 		orig_report(sk);
 }
@@ -662,20 +655,20 @@ static void restore_callbacks(struct socket *sock)
 {
 	struct sock *sk = sock->sk;
 
-	write_lock_bh(&sk->sk_callback_lock);
+	lock_sock(sk);
 	sk->sk_user_data = NULL;
 	sk->sk_data_ready = listen_sock.sk_data_ready;
 	sk->sk_state_change = listen_sock.sk_state_change;
 	sk->sk_write_space = listen_sock.sk_write_space;
 	sk->sk_error_report = listen_sock.sk_error_report;
-	write_unlock_bh(&sk->sk_callback_lock);
+	release_sock(sk);
 }
 
 static void add_listen_sock(struct socket *sock, struct listen_connection *con)
 {
 	struct sock *sk = sock->sk;
 
-	write_lock_bh(&sk->sk_callback_lock);
+	lock_sock(sk);
 	save_listen_callbacks(sock);
 	con->sock = sock;
 
@@ -683,7 +676,7 @@ static void add_listen_sock(struct socket *sock, struct listen_connection *con)
 	sk->sk_allocation = GFP_NOFS;
 	/* Install a data_ready callback */
 	sk->sk_data_ready = lowcomms_listen_data_ready;
-	write_unlock_bh(&sk->sk_callback_lock);
+	release_sock(sk);
 }
 
 /* Make a socket active */
@@ -691,7 +684,7 @@ static void add_sock(struct socket *sock, struct connection *con)
 {
 	struct sock *sk = sock->sk;
 
-	write_lock_bh(&sk->sk_callback_lock);
+	lock_sock(sk);
 	con->sock = sock;
 
 	sk->sk_user_data = con;
@@ -701,7 +694,7 @@ static void add_sock(struct socket *sock, struct connection *con)
 	sk->sk_state_change = lowcomms_state_change;
 	sk->sk_allocation = GFP_NOFS;
 	sk->sk_error_report = lowcomms_error_report;
-	write_unlock_bh(&sk->sk_callback_lock);
+	release_sock(sk);
 }
 
 /* Add the port number to an IPv6 or 4 sockaddr and return the address
@@ -1679,9 +1672,9 @@ static void _stop_conn(struct connection *con, bool and_other)
 	set_bit(CF_READ_PENDING, &con->flags);
 	set_bit(CF_WRITE_PENDING, &con->flags);
 	if (con->sock && con->sock->sk) {
-		write_lock_bh(&con->sock->sk->sk_callback_lock);
+		lock_sock(con->sock->sk);
 		con->sock->sk->sk_user_data = NULL;
-		write_unlock_bh(&con->sock->sk->sk_callback_lock);
+		release_sock(con->sock->sk);
 	}
 	if (con->othercon && and_other)
 		_stop_conn(con->othercon, false);
-- 
2.27.0

