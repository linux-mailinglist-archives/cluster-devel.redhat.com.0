Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 005F4292DEB
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Oct 2020 20:59:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603133982;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=htt1SdUEjyLnTb9HZeonxKzhm+wYU+Vn3yWLUIsT3rk=;
	b=QjJWeX6kjhrCjLQFDZBSzPDMoVmRHaJHj5k8bLep9OQZ1sa0gCRjNHwPzg99jxEpS/vnOL
	rSnCvj8p57ld8Qw3ccZaLVs/496Gmr0o6hvH2nzL7G4Q1vfLizAjP2ALkJ9aHGVuNaxqg7
	5zZqi31Qfgb7Iwjgr91hePdF2BWRsc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-fascgpy6MgyW8uJ0MlAAow-1; Mon, 19 Oct 2020 14:59:40 -0400
X-MC-Unique: fascgpy6MgyW8uJ0MlAAow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3042C1084C87;
	Mon, 19 Oct 2020 18:59:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E94655770;
	Mon, 19 Oct 2020 18:59:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0929C181A06B;
	Mon, 19 Oct 2020 18:59:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JIxZpH021320 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 14:59:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B66B25C22A; Mon, 19 Oct 2020 18:59:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-200.rdu2.redhat.com [10.10.116.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B13D5C1A3;
	Mon, 19 Oct 2020 18:59:32 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 19 Oct 2020 14:59:13 -0400
Message-Id: <20201019185916.707827-7-aahringo@redhat.com>
In-Reply-To: <20201019185916.707827-1-aahringo@redhat.com>
References: <20201019185916.707827-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 6/9] fs: dlm: move connect callback
	in node creation
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch moves the assignment for the connect callback to the node
creation instead of assign some dummy functionality. The assignment
which connect functionality will be used will be detected according to
the configfs setting.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 70a216a20dbb9..e8657ae023654 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -142,6 +142,8 @@ DEFINE_STATIC_SRCU(connections_srcu);
 static void process_recv_sockets(struct work_struct *work);
 static void process_send_sockets(struct work_struct *work);
 
+static void sctp_connect_to_sock(struct connection *con);
+static void tcp_connect_to_sock(struct connection *con);
 
 /* This is deliberately very simple because most clusters have simple
    sequential nodeids, so we should be able to go straight to a connection
@@ -206,11 +208,15 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 	if (con->nodeid) {
 		struct connection *zerocon = __find_con(0);
 
-		con->connect_action = zerocon->connect_action;
 		if (!con->rx_action)
 			con->rx_action = zerocon->rx_action;
 	}
 
+	if (dlm_config.ci_protocol == 0)
+		con->connect_action = tcp_connect_to_sock;
+	else
+		con->connect_action = sctp_connect_to_sock;
+
 	r = nodeid_hash(nodeid);
 
 	spin_lock(&connections_lock);
@@ -1009,7 +1015,6 @@ static void sctp_connect_to_sock(struct connection *con)
 	sock_set_mark(sock->sk, mark);
 
 	con->rx_action = receive_from_sock;
-	con->connect_action = sctp_connect_to_sock;
 	add_sock(sock, con);
 
 	/* Bind to all addresses. */
@@ -1107,7 +1112,6 @@ static void tcp_connect_to_sock(struct connection *con)
 	}
 
 	con->rx_action = receive_from_sock;
-	con->connect_action = tcp_connect_to_sock;
 	con->shutdown_action = dlm_tcp_shutdown;
 	add_sock(sock, con);
 
@@ -1195,7 +1199,6 @@ static struct socket *tcp_create_listen_sock(struct connection *con,
 	sock->sk->sk_user_data = con;
 	save_listen_callbacks(sock);
 	con->rx_action = accept_from_sock;
-	con->connect_action = tcp_connect_to_sock;
 	write_unlock_bh(&sock->sk->sk_callback_lock);
 
 	/* Bind to our port */
@@ -1278,7 +1281,6 @@ static int sctp_listen_for_all(void)
 	con->sock = sock;
 	con->sock->sk->sk_data_ready = lowcomms_data_ready;
 	con->rx_action = accept_from_sock;
-	con->connect_action = sctp_connect_to_sock;
 
 	write_unlock_bh(&sock->sk->sk_callback_lock);
 
-- 
2.26.2

