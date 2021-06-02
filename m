Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A4EEC398AF8
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Jun 2021 15:46:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622641592;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=17K7IMwbc+pj+GWWCfE1erDxMUyYf+x6J2mquYo6xKI=;
	b=Gh7lmTZMoP13lRMkGTaTOUrl5EePmcodTnlI5CQEKAq6hP1PB6+C3rz4IAN6r2ko6a9pEg
	b3+SpRDM/3WFde8gAu9eMhOtAGrMwwBdcz57t9ulnCAYn7517w0u/HtyR3cUCnbCb9pR7e
	qp5KmmigOio88m2mCN8JAd6BBAFYBGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-eKY2en5xMQexyjzluLZttw-1; Wed, 02 Jun 2021 09:46:30 -0400
X-MC-Unique: eKY2en5xMQexyjzluLZttw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 472AE1927828;
	Wed,  2 Jun 2021 13:45:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EADF4106416F;
	Wed,  2 Jun 2021 13:45:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA15818095C4;
	Wed,  2 Jun 2021 13:45:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 152Djn4a029980 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Jun 2021 09:45:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 35F441045E9D; Wed,  2 Jun 2021 13:45:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-136.rdu2.redhat.com [10.10.116.136])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78C361037F41;
	Wed,  2 Jun 2021 13:45:48 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  2 Jun 2021 09:45:19 -0400
Message-Id: <20210602134520.71030-5-aahringo@redhat.com>
In-Reply-To: <20210602134520.71030-1-aahringo@redhat.com>
References: <20210602134520.71030-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 5/6] fs: dlm: introduce proto values
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Currently the dlm protocol values are that TCP is 0 and everything else
is SCTP. This makes it difficult to introduce possible other transport
layers. The only one user space tool dlm_controld, which I am aware of,
handles the protocol value 1 for SCTP. We change it now to handle SCTP
as 1, this will break user space API but it will fix it so we can add
possible other transport layers.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c   |  2 +-
 fs/dlm/config.h   |  3 +++
 fs/dlm/lowcomms.c | 23 +++++++++++++++++++----
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index db717a879537..c91c1c73ed9d 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -952,7 +952,7 @@ int dlm_our_addr(struct sockaddr_storage *addr, int num)
 #define DEFAULT_SCAN_SECS          5
 #define DEFAULT_LOG_DEBUG          0
 #define DEFAULT_LOG_INFO           1
-#define DEFAULT_PROTOCOL           0
+#define DEFAULT_PROTOCOL           DLM_PROTO_TCP
 #define DEFAULT_MARK               0
 #define DEFAULT_TIMEWARN_CS      500 /* 5 sec = 500 centiseconds */
 #define DEFAULT_WAITWARN_US	   0
diff --git a/fs/dlm/config.h b/fs/dlm/config.h
index d2cd4bd20313..00374b45c748 100644
--- a/fs/dlm/config.h
+++ b/fs/dlm/config.h
@@ -23,6 +23,9 @@ struct dlm_config_node {
 
 #define DLM_MAX_ADDR_COUNT 3
 
+#define DLM_PROTO_TCP	0
+#define DLM_PROTO_SCTP	1
+
 struct dlm_config_info {
 	int ci_tcp_port;
 	int ci_buffer_size;
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 6b150e3aa30c..f2a3b0401b9c 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -208,12 +208,18 @@ static int dlm_con_init(struct connection *con, int nodeid)
 	INIT_WORK(&con->rwork, process_recv_sockets);
 	init_waitqueue_head(&con->shutdown_wait);
 
-	if (dlm_config.ci_protocol == 0) {
+	switch (dlm_config.ci_protocol) {
+	case DLM_PROTO_TCP:
 		con->connect_action = tcp_connect_to_sock;
 		con->shutdown_action = dlm_tcp_shutdown;
 		con->eof_condition = tcp_eof_condition;
-	} else {
+		break;
+	case DLM_PROTO_SCTP:
 		con->connect_action = sctp_connect_to_sock;
+		break;
+	default:
+		kfree(con->rx_buf);
+		return -EINVAL;
 	}
 
 	return 0;
@@ -1968,10 +1974,19 @@ int dlm_lowcomms_start(void)
 	dlm_allow_conn = 1;
 
 	/* Start listening */
-	if (dlm_config.ci_protocol == 0)
+	switch (dlm_config.ci_protocol) {
+	case DLM_PROTO_TCP:
 		error = tcp_listen_for_all();
-	else
+		break;
+	case DLM_PROTO_SCTP:
 		error = sctp_listen_for_all(&listen_con);
+		break;
+	default:
+		log_print("Invalid protocol identifier %d set",
+			  dlm_config.ci_protocol);
+		error = -EINVAL;
+		break;
+	}
 	if (error)
 		goto fail_unlisten;
 
-- 
2.26.3

