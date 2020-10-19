Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CD593292DED
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Oct 2020 20:59:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603133982;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e8gXMqI8F80cjCzWNImmAu+vLBpMHx6LotTnSwnIEz4=;
	b=TT2FqJxjEKEePJ8AH11n//tVLEKQGhNrcOFk0tBQbwZ9mvDIQ2vJ7/0KpM6IIL1yRBuljl
	+BSX2wcNP1ogwcVQ38HwdxweMaPQSHLS2pvF/ZfWuHC6+7cEjZW8hNIReeAaphwATz6yER
	Wxhlm7Hn/p6wq1lB0Ve/8zmXlm0K4js=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-tuxalWYuOxeNFx4HX53mxg-1; Mon, 19 Oct 2020 14:59:41 -0400
X-MC-Unique: tuxalWYuOxeNFx4HX53mxg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86EFF8030B2;
	Mon, 19 Oct 2020 18:59:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7443E1002C03;
	Mon, 19 Oct 2020 18:59:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60A35181A06C;
	Mon, 19 Oct 2020 18:59:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JIxaZJ021325 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 14:59:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 811F85C225; Mon, 19 Oct 2020 18:59:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-200.rdu2.redhat.com [10.10.116.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9D305C1A3;
	Mon, 19 Oct 2020 18:59:35 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 19 Oct 2020 14:59:14 -0400
Message-Id: <20201019185916.707827-8-aahringo@redhat.com>
In-Reply-To: <20201019185916.707827-1-aahringo@redhat.com>
References: <20201019185916.707827-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 7/9] fs: dlm: move shutdown action
	to node creation
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch move the assignment for the shutdown action callback to the
node creation functionality.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index e8657ae023654..bae4125c22deb 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -144,6 +144,7 @@ static void process_send_sockets(struct work_struct *work);
 
 static void sctp_connect_to_sock(struct connection *con);
 static void tcp_connect_to_sock(struct connection *con);
+static void dlm_tcp_shutdown(struct connection *con);
 
 /* This is deliberately very simple because most clusters have simple
    sequential nodeids, so we should be able to go straight to a connection
@@ -212,10 +213,12 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 			con->rx_action = zerocon->rx_action;
 	}
 
-	if (dlm_config.ci_protocol == 0)
+	if (dlm_config.ci_protocol == 0) {
 		con->connect_action = tcp_connect_to_sock;
-	else
+		con->shutdown_action = dlm_tcp_shutdown;
+	} else {
 		con->connect_action = sctp_connect_to_sock;
+	}
 
 	r = nodeid_hash(nodeid);
 
@@ -1112,7 +1115,6 @@ static void tcp_connect_to_sock(struct connection *con)
 	}
 
 	con->rx_action = receive_from_sock;
-	con->shutdown_action = dlm_tcp_shutdown;
 	add_sock(sock, con);
 
 	/* Bind to our cluster-known address connecting to avoid
-- 
2.26.2

