Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 175C562E7EB
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Nov 2022 23:12:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668723138;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LfEIcFOTB6fsGiv5jNqXCqw3RUrYabUY9UEruUppBeU=;
	b=Leqx3j1Q8uwaaLRunSBcIvFnzDvrp+V6AbyT4eubVQcsj9xHHq4FVeMw/IjWFsxerHaBo7
	lk1QBCUoKUSowRZ8olXZJ24eLkiqbZ2kuTHSWM2GAq3trABmbv33korFzBvxL6Kup6yfNa
	bT+BCUi8O1eTnCuf8n4VzA3W4b1igLY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-FoDmr4iOOguxv7a9bJlgwA-1; Thu, 17 Nov 2022 17:12:14 -0500
X-MC-Unique: FoDmr4iOOguxv7a9bJlgwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D3DD1012466;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 535BA111E403;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AED591946A73;
	Thu, 17 Nov 2022 22:12:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 41CEE1946A4A for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 22:12:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3524E2166B47; Thu, 17 Nov 2022 22:12:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 111BA2166B29;
 Thu, 17 Nov 2022 22:12:10 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Nov 2022 17:11:54 -0500
Message-Id: <20221117221157.2396743-15-aahringo@redhat.com>
In-Reply-To: <20221117221157.2396743-1-aahringo@redhat.com>
References: <20221117221157.2396743-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 15/18] fs: dlm: use sock2con
 without checking null
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch removes null checks on private data for sockets. If we have a
null dereference there we having a bug in our implementation that such
callback occurs in this state.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index ed3cd3757199..677e31144ca0 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -472,10 +472,9 @@ int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len)
 /* Data available on socket or listen socket received a connect */
 static void lowcomms_data_ready(struct sock *sk)
 {
-	struct connection *con;
+	struct connection *con = sock2con(sk);
 
-	con = sock2con(sk);
-	if (con && !test_and_set_bit(CF_READ_PENDING, &con->flags))
+	if (!test_and_set_bit(CF_READ_PENDING, &con->flags))
 		queue_work(recv_workqueue, &con->rwork);
 }
 
@@ -486,11 +485,7 @@ static void lowcomms_listen_data_ready(struct sock *sk)
 
 static void lowcomms_write_space(struct sock *sk)
 {
-	struct connection *con;
-
-	con = sock2con(sk);
-	if (!con)
-		return;
+	struct connection *con = sock2con(sk);
 
 	if (!test_and_set_bit(CF_CONNECTED, &con->flags)) {
 		log_print("connected to node %d", con->nodeid);
@@ -573,14 +568,10 @@ int dlm_lowcomms_nodes_set_mark(int nodeid, unsigned int mark)
 
 static void lowcomms_error_report(struct sock *sk)
 {
-	struct connection *con;
+	struct connection *con = sock2con(sk);
 	void (*orig_report)(struct sock *) = NULL;
 	struct inet_sock *inet;
 
-	con = sock2con(sk);
-	if (con == NULL)
-		goto out;
-
 	orig_report = listen_sock.sk_error_report;
 
 	inet = inet_sk(sk);
-- 
2.31.1

