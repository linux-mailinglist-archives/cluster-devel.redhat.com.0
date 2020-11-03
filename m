Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 835DC2A3829
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Nov 2020 02:04:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604365496;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e4rbxlpDkkz0KltM4uxraoMp7njCirpQ40MTJmsRkcE=;
	b=SQ2WTlJZilJgpFMpJ6JuMebMJqonlPhw48wfjuQTJTF00Lpfc6bHKieTt4PUF7/9PzYbwU
	G88PaVf0FMQDEbokSwFM32QEiyGOVdbKJYxADthqc2QZaFpfvP92RfmMaOIcihdaVXfpHE
	LB17gnDD8dl0rnn5Qu2/sQsDn81c7po=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-T8T_pUHYPPWE977mc4JRzQ-1; Mon, 02 Nov 2020 20:04:55 -0500
X-MC-Unique: T8T_pUHYPPWE977mc4JRzQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDF8D1868414;
	Tue,  3 Nov 2020 01:04:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCBB875121;
	Tue,  3 Nov 2020 01:04:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A633E79FF7;
	Tue,  3 Nov 2020 01:04:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A314ks0003544 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 20:04:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 497965C5FE; Tue,  3 Nov 2020 01:04:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-45.rdu2.redhat.com [10.10.115.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D3F1F5C5FD;
	Tue,  3 Nov 2020 01:04:45 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  2 Nov 2020 20:04:23 -0500
Message-Id: <20201103010428.1009384-9-aahringo@redhat.com>
In-Reply-To: <20201103010428.1009384-1-aahringo@redhat.com>
References: <20201103010428.1009384-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 RESEND v5.10-rc2 08/13] fs: dlm: move
	shutdown action to node creation
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

This patch move the assignment for the shutdown action callback to the
node creation functionality.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 30a101de0a0c..9723df4e67b8 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -144,6 +144,7 @@ static void process_send_sockets(struct work_struct *work);
 
 static void sctp_connect_to_sock(struct connection *con);
 static void tcp_connect_to_sock(struct connection *con);
+static void dlm_tcp_shutdown(struct connection *con);
 
 /* This is deliberately very simple because most clusters have simple
    sequential nodeids, so we should be able to go straight to a connection
@@ -187,10 +188,12 @@ static int dlm_con_init(struct connection *con, int nodeid)
 	INIT_WORK(&con->rwork, process_recv_sockets);
 	init_waitqueue_head(&con->shutdown_wait);
 
-	if (dlm_config.ci_protocol == 0)
+	if (dlm_config.ci_protocol == 0) {
 		con->connect_action = tcp_connect_to_sock;
-	else
+		con->shutdown_action = dlm_tcp_shutdown;
+	} else {
 		con->connect_action = sctp_connect_to_sock;
+	}
 
 	return 0;
 }
@@ -1101,7 +1104,6 @@ static void tcp_connect_to_sock(struct connection *con)
 	}
 
 	con->rx_action = receive_from_sock;
-	con->shutdown_action = dlm_tcp_shutdown;
 	add_sock(sock, con);
 
 	/* Bind to our cluster-known address connecting to avoid
-- 
2.26.2

