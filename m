Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 894DE450623
	for <lists+cluster-devel@lfdr.de>; Mon, 15 Nov 2021 14:58:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636984706;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qlyU7j22eZYHMV1MWS4X4lbalnEz+9SShn0odiIwsUs=;
	b=JgmJaNJSXYjuiy3M4TwFpBYoI3ta+vV2meWq4hx4IebT9kgT3AsVZ1BndS50vltorS2XMd
	InzjqwsbVehiL9sGM3wXa9ApyoD5J4PRENbn/Q3JbWf24lLn7L7KhOSuk4lgeYYGScypOK
	gI0hDiHO/4iq8Tw+0Lh0XSsDPZp37EE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-23ttydp-PhaShbBSytzCvA-1; Mon, 15 Nov 2021 08:58:23 -0500
X-MC-Unique: 23ttydp-PhaShbBSytzCvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C22F118125CA;
	Mon, 15 Nov 2021 13:58:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4D2F2AF6D;
	Mon, 15 Nov 2021 13:58:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 704141819AC1;
	Mon, 15 Nov 2021 13:58:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AFDvxYC007995 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 15 Nov 2021 08:57:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AECEF56AA2; Mon, 15 Nov 2021 13:57:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7CC556ABC;
	Mon, 15 Nov 2021 13:57:37 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 15 Nov 2021 08:57:06 -0500
Message-Id: <20211115135706.2004320-2-aahringo@redhat.com>
In-Reply-To: <20211115135706.2004320-1-aahringo@redhat.com>
References: <20211115135706.2004320-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm-next 2/2] fs: dlm: replace use of
	socket sk_callback_lock with sock_lock
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
index c7750849c495..203470189011 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -488,11 +488,9 @@ static void lowcomms_data_ready(struct sock *sk)
 {
 	struct connection *con;
 
-	read_lock_bh(&sk->sk_callback_lock);
 	con = sock2con(sk);
 	if (con && !test_and_set_bit(CF_READ_PENDING, &con->flags))
 		queue_work(recv_workqueue, &con->rwork);
-	read_unlock_bh(&sk->sk_callback_lock);
 }
 
 static void lowcomms_listen_data_ready(struct sock *sk)
@@ -507,15 +505,14 @@ static void lowcomms_write_space(struct sock *sk)
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
@@ -526,8 +523,6 @@ static void lowcomms_write_space(struct sock *sk)
 	}
 
 	queue_work(send_workqueue, &con->swork);
-out:
-	read_unlock_bh(&sk->sk_callback_lock);
 }
 
 static inline void lowcomms_connect_sock(struct connection *con)
@@ -597,7 +592,6 @@ static void lowcomms_error_report(struct sock *sk)
 	void (*orig_report)(struct sock *) = NULL;
 	struct inet_sock *inet;
 
-	read_lock_bh(&sk->sk_callback_lock);
 	con = sock2con(sk);
 	if (con == NULL)
 		goto out;
@@ -646,7 +640,6 @@ static void lowcomms_error_report(struct sock *sk)
 		queue_work(send_workqueue, &con->swork);
 
 out:
-	read_unlock_bh(&sk->sk_callback_lock);
 	if (orig_report)
 		orig_report(sk);
 }
@@ -666,20 +659,20 @@ static void restore_callbacks(struct socket *sock)
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
 
@@ -687,7 +680,7 @@ static void add_listen_sock(struct socket *sock, struct listen_connection *con)
 	sk->sk_allocation = GFP_NOFS;
 	/* Install a data_ready callback */
 	sk->sk_data_ready = lowcomms_listen_data_ready;
-	write_unlock_bh(&sk->sk_callback_lock);
+	release_sock(sk);
 }
 
 /* Make a socket active */
@@ -695,7 +688,7 @@ static void add_sock(struct socket *sock, struct connection *con)
 {
 	struct sock *sk = sock->sk;
 
-	write_lock_bh(&sk->sk_callback_lock);
+	lock_sock(sk);
 	con->sock = sock;
 
 	sk->sk_user_data = con;
@@ -705,7 +698,7 @@ static void add_sock(struct socket *sock, struct connection *con)
 	sk->sk_state_change = lowcomms_state_change;
 	sk->sk_allocation = GFP_NOFS;
 	sk->sk_error_report = lowcomms_error_report;
-	write_unlock_bh(&sk->sk_callback_lock);
+	release_sock(sk);
 }
 
 /* Add the port number to an IPv6 or 4 sockaddr and return the address
@@ -1680,9 +1673,9 @@ static void _stop_conn(struct connection *con, bool and_other)
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

