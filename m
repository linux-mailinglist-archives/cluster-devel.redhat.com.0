Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EE6B22A382A
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Nov 2020 02:04:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604365498;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ULZ7znIDnSPjuPKRIxC/zXIXotCfGxN15BV9XcsiLWQ=;
	b=fSbqXlZ9ip5joHdXNaG7vw9+AggftucF/ydm32NQnyejPRO/9f0NUfA3Q2yiTGBfqCZEk6
	r7tBRBkbLE5XMFEfJ3oI72w+03p/bEHLpJjCdnRRRjaV1s/pUiFC189vOO/fjX2VcPB5oc
	FOBkfvcQKce6S0OIeNz/gJhKNRWXxZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-Pj4tP0VRMYOqZ4l8MI54Pw-1; Mon, 02 Nov 2020 20:04:56 -0500
X-MC-Unique: Pj4tP0VRMYOqZ4l8MI54Pw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C7BA5F9E2;
	Tue,  3 Nov 2020 01:04:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B8C660BF1;
	Tue,  3 Nov 2020 01:04:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 457FC181A06B;
	Tue,  3 Nov 2020 01:04:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A314j4x003533 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 20:04:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AE35C177F9; Tue,  3 Nov 2020 01:04:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-45.rdu2.redhat.com [10.10.115.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4390F5C629;
	Tue,  3 Nov 2020 01:04:45 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  2 Nov 2020 20:04:22 -0500
Message-Id: <20201103010428.1009384-8-aahringo@redhat.com>
In-Reply-To: <20201103010428.1009384-1-aahringo@redhat.com>
References: <20201103010428.1009384-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 RESEND v5.10-rc2 07/13] fs: dlm: move
	connect callback in node creation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch moves the assignment for the connect callback to the node
creation instead of assign some dummy functionality. The assignment
which connect functionality will be used will be detected according to
the configfs setting.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 30cd53fa2f77..30a101de0a0c 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -142,6 +142,8 @@ DEFINE_STATIC_SRCU(connections_srcu);
 static void process_recv_sockets(struct work_struct *work);
 static void process_send_sockets(struct work_struct *work);
 
+static void sctp_connect_to_sock(struct connection *con);
+static void tcp_connect_to_sock(struct connection *con);
 
 /* This is deliberately very simple because most clusters have simple
    sequential nodeids, so we should be able to go straight to a connection
@@ -185,14 +187,10 @@ static int dlm_con_init(struct connection *con, int nodeid)
 	INIT_WORK(&con->rwork, process_recv_sockets);
 	init_waitqueue_head(&con->shutdown_wait);
 
-	/* Setup action pointers for child sockets */
-	if (con->nodeid) {
-		struct connection *zerocon = __find_con(0);
-
-		con->connect_action = zerocon->connect_action;
-		if (!con->rx_action)
-			con->rx_action = zerocon->rx_action;
-	}
+	if (dlm_config.ci_protocol == 0)
+		con->connect_action = tcp_connect_to_sock;
+	else
+		con->connect_action = sctp_connect_to_sock;
 
 	return 0;
 }
@@ -1006,7 +1004,6 @@ static void sctp_connect_to_sock(struct connection *con)
 	sock_set_mark(sock->sk, mark);
 
 	con->rx_action = receive_from_sock;
-	con->connect_action = sctp_connect_to_sock;
 	add_sock(sock, con);
 
 	/* Bind to all addresses. */
@@ -1104,7 +1101,6 @@ static void tcp_connect_to_sock(struct connection *con)
 	}
 
 	con->rx_action = receive_from_sock;
-	con->connect_action = tcp_connect_to_sock;
 	con->shutdown_action = dlm_tcp_shutdown;
 	add_sock(sock, con);
 
@@ -1192,7 +1188,6 @@ static struct socket *tcp_create_listen_sock(struct connection *con,
 	sock->sk->sk_user_data = con;
 	save_listen_callbacks(sock);
 	con->rx_action = accept_from_sock;
-	con->connect_action = tcp_connect_to_sock;
 	write_unlock_bh(&sock->sk->sk_callback_lock);
 
 	/* Bind to our port */
@@ -1275,7 +1270,6 @@ static int sctp_listen_for_all(void)
 	con->sock = sock;
 	con->sock->sk->sk_data_ready = lowcomms_data_ready;
 	con->rx_action = accept_from_sock;
-	con->connect_action = sctp_connect_to_sock;
 
 	write_unlock_bh(&sock->sk->sk_callback_lock);
 
-- 
2.26.2

