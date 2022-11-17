Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B7962E7E4
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Nov 2022 23:12:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668723138;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vRSubDKxlaQlolR1QWcaYUq3PQUPTxUsNUoK4RfHmN8=;
	b=LSE1vsIYQ+fXLYI4dN/0xqUhZtvCk9EYoEtxrmYpq/K2Fbpp8QpIMUtOSuqiyKx1PT0VBh
	+Sheyquxw0JxF5ue61pfhOF/x99Ol8xkqp3W9qqP5pH1Vl3V5wWwWiYPZ510tM47iKQ6Qp
	4WxKDkvIaXGjIr8shGfc6HMTXOyFcAQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-olpAafVuPs6UUkSoc0O4mg-1; Thu, 17 Nov 2022 17:12:14 -0500
X-MC-Unique: olpAafVuPs6UUkSoc0O4mg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7BC8857FB0;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C780E1401C31;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B89C11946595;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B7F7519465B9 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 22:12:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ABC132166B47; Thu, 17 Nov 2022 22:12:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 863222166B29;
 Thu, 17 Nov 2022 22:12:09 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Nov 2022 17:11:51 -0500
Message-Id: <20221117221157.2396743-12-aahringo@redhat.com>
In-Reply-To: <20221117221157.2396743-1-aahringo@redhat.com>
References: <20221117221157.2396743-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 12/18] fs: dlm: cleanup listen sock
 handling
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch removes save_listen_callbacks() and add_listen_sock() as they
are only used once in lowcomms functionality. For shutdown lowcomms it's
not necessary to whole flush the workqueues to synchronize with
restoring the old sk_data_ready() callback. Only the listen con receive
work need to be cancelled. For each individual node shutdown we should be
sure that last ack was been transmitted which is done by flushing per
connection swork worker.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 51 ++++++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 34 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index e33bee1beba2..8bf09c3a0946 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -647,17 +647,6 @@ static void lowcomms_error_report(struct sock *sk)
 		orig_report(sk);
 }
 
-/* Note: sk_callback_lock must be locked before calling this function. */
-static void save_listen_callbacks(struct socket *sock)
-{
-	struct sock *sk = sock->sk;
-
-	listen_sock.sk_data_ready = sk->sk_data_ready;
-	listen_sock.sk_state_change = sk->sk_state_change;
-	listen_sock.sk_write_space = sk->sk_write_space;
-	listen_sock.sk_error_report = sk->sk_error_report;
-}
-
 static void restore_callbacks(struct socket *sock)
 {
 	struct sock *sk = sock->sk;
@@ -671,21 +660,6 @@ static void restore_callbacks(struct socket *sock)
 	release_sock(sk);
 }
 
-static void add_listen_sock(struct socket *sock, struct listen_connection *con)
-{
-	struct sock *sk = sock->sk;
-
-	lock_sock(sk);
-	save_listen_callbacks(sock);
-	con->sock = sock;
-
-	sk->sk_user_data = con;
-	sk->sk_allocation = GFP_NOFS;
-	/* Install a data_ready callback */
-	sk->sk_data_ready = lowcomms_listen_data_ready;
-	release_sock(sk);
-}
-
 /* Make a socket active */
 static void add_sock(struct socket *sock, struct connection *con)
 {
@@ -1593,13 +1567,12 @@ static int work_start(void)
 
 void dlm_lowcomms_shutdown(void)
 {
-	restore_callbacks(listen_con.sock);
-
-	if (recv_workqueue)
-		flush_workqueue(recv_workqueue);
-	if (send_workqueue)
-		flush_workqueue(send_workqueue);
+	/* stop lowcomms_listen_data_ready calls */
+	lock_sock(listen_con.sock->sk);
+	listen_con.sock->sk->sk_data_ready = listen_sock.sk_data_ready;
+	release_sock(listen_con.sock->sk);
 
+	cancel_work_sync(&listen_con.rwork);
 	dlm_close_sock(&listen_con.sock);
 }
 
@@ -1615,6 +1588,7 @@ void dlm_lowcomms_shutdown_node(int nodeid, bool force)
 		return;
 	}
 
+	flush_work(&con->swork);
 	WARN_ON_ONCE(!force && !list_empty(&con->writequeue));
 	clean_one_writequeue(con);
 	if (con->othercon)
@@ -1736,8 +1710,17 @@ static int dlm_listen_for_all(void)
 	if (result < 0)
 		goto out;
 
-	save_listen_callbacks(sock);
-	add_listen_sock(sock, &listen_con);
+	lock_sock(sock->sk);
+	listen_sock.sk_data_ready = sock->sk->sk_data_ready;
+	listen_sock.sk_write_space = sock->sk->sk_write_space;
+	listen_sock.sk_error_report = sock->sk->sk_error_report;
+	listen_sock.sk_state_change = sock->sk->sk_state_change;
+
+	listen_con.sock = sock;
+
+	sock->sk->sk_allocation = GFP_NOFS;
+	sock->sk->sk_data_ready = lowcomms_listen_data_ready;
+	release_sock(sock->sk);
 
 	result = sock->ops->listen(sock, 5);
 	if (result < 0) {
-- 
2.31.1

