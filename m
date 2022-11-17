Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5241862E7E5
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Nov 2022 23:12:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668723138;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c8KRJB/dcPgokdtgwWiJW95GZ+yjM93/jujOJnYdn2c=;
	b=hjm3rWQLibQrUq51sxYS3hWYbcFlfY2L9wHLkwWupUQEggAundb8vIOV6NUT9GIz4Z0qCa
	+Den7oWDlSRAQJ5mmoh58IvqjEKfPg9kt7xUGfziwX+odMvOZJAHARJlHE1qPvXuxyPBU9
	t08bLCxAnFtd+Pd2RSjI6utvHwQePj8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-DDgWgmzgNXKRrZGTcwEaVg-1; Thu, 17 Nov 2022 17:12:14 -0500
X-MC-Unique: DDgWgmzgNXKRrZGTcwEaVg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1F00857D0E;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DFDAD4B3FE1;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C15D21946A42;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EEB5E19465B9 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 22:12:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D57952166B46; Thu, 17 Nov 2022 22:12:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1D5F2166B29;
 Thu, 17 Nov 2022 22:12:09 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Nov 2022 17:11:52 -0500
Message-Id: <20221117221157.2396743-13-aahringo@redhat.com>
In-Reply-To: <20221117221157.2396743-1-aahringo@redhat.com>
References: <20221117221157.2396743-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 13/18] fs: dlm: don't put
 dlm_local_addrs on heap
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch removes to allocate the dlm_local_addr[] pointers on the
heap. Instead we directly store the type of "struct sockaddr_storage".
This removes function deinit_local() because it was freeing memory only.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 38 ++++++++++++--------------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 8bf09c3a0946..0883394cfbeb 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -165,7 +165,7 @@ static LIST_HEAD(dlm_node_addrs);
 static DEFINE_SPINLOCK(dlm_node_addrs_spin);
 
 static struct listen_connection listen_con;
-static struct sockaddr_storage *dlm_local_addr[DLM_MAX_ADDR_COUNT];
+static struct sockaddr_storage dlm_local_addr[DLM_MAX_ADDR_COUNT];
 static int dlm_local_count;
 
 /* Work queues */
@@ -383,7 +383,7 @@ static int nodeid_to_addr(int nodeid, struct sockaddr_storage *sas_out,
 	if (!sa_out)
 		return 0;
 
-	if (dlm_local_addr[0]->ss_family == AF_INET) {
+	if (dlm_local_addr[0].ss_family == AF_INET) {
 		struct sockaddr_in *in4  = (struct sockaddr_in *) &sas;
 		struct sockaddr_in *ret4 = (struct sockaddr_in *) sa_out;
 		ret4->sin_addr.s_addr = in4->sin_addr.s_addr;
@@ -683,7 +683,7 @@ static void add_sock(struct socket *sock, struct connection *con)
 static void make_sockaddr(struct sockaddr_storage *saddr, uint16_t port,
 			  int *addr_len)
 {
-	saddr->ss_family =  dlm_local_addr[0]->ss_family;
+	saddr->ss_family =  dlm_local_addr[0].ss_family;
 	if (saddr->ss_family == AF_INET) {
 		struct sockaddr_in *in4_addr = (struct sockaddr_in *)saddr;
 		in4_addr->sin_port = cpu_to_be16(port);
@@ -1065,7 +1065,7 @@ static int sctp_bind_addrs(struct socket *sock, uint16_t port)
 	int i, addr_len, result = 0;
 
 	for (i = 0; i < dlm_local_count; i++) {
-		memcpy(&localaddr, dlm_local_addr[i], sizeof(localaddr));
+		memcpy(&localaddr, &dlm_local_addr[i], sizeof(localaddr));
 		make_sockaddr(&localaddr, port, &addr_len);
 
 		if (!i)
@@ -1085,7 +1085,7 @@ static int sctp_bind_addrs(struct socket *sock, uint16_t port)
 /* Get local addresses */
 static void init_local(void)
 {
-	struct sockaddr_storage sas, *addr;
+	struct sockaddr_storage sas;
 	int i;
 
 	dlm_local_count = 0;
@@ -1093,21 +1093,10 @@ static void init_local(void)
 		if (dlm_our_addr(&sas, i))
 			break;
 
-		addr = kmemdup(&sas, sizeof(*addr), GFP_NOFS);
-		if (!addr)
-			break;
-		dlm_local_addr[dlm_local_count++] = addr;
+		memcpy(&dlm_local_addr[dlm_local_count++], &sas, sizeof(sas));
 	}
 }
 
-static void deinit_local(void)
-{
-	int i;
-
-	for (i = 0; i < dlm_local_count; i++)
-		kfree(dlm_local_addr[i]);
-}
-
 static struct writequeue_entry *new_writequeue_entry(struct connection *con)
 {
 	struct writequeue_entry *entry;
@@ -1463,7 +1452,7 @@ static void dlm_connect(struct connection *con)
 	}
 
 	/* Create a socket to communicate with */
-	result = sock_create_kern(&init_net, dlm_local_addr[0]->ss_family,
+	result = sock_create_kern(&init_net, dlm_local_addr[0].ss_family,
 				  SOCK_STREAM, dlm_proto_ops->proto, &sock);
 	if (result < 0)
 		goto socket_err;
@@ -1679,7 +1668,6 @@ void dlm_lowcomms_stop(void)
 	foreach_conn(free_conn);
 	srcu_read_unlock(&connections_srcu, idx);
 	work_stop();
-	deinit_local();
 
 	dlm_proto_ops = NULL;
 }
@@ -1696,7 +1684,7 @@ static int dlm_listen_for_all(void)
 	if (result < 0)
 		return result;
 
-	result = sock_create_kern(&init_net, dlm_local_addr[0]->ss_family,
+	result = sock_create_kern(&init_net, dlm_local_addr[0].ss_family,
 				  SOCK_STREAM, dlm_proto_ops->proto, &sock);
 	if (result < 0) {
 		log_print("Can't create comms socket: %d", result);
@@ -1743,7 +1731,7 @@ static int dlm_tcp_bind(struct socket *sock)
 	/* Bind to our cluster-known address connecting to avoid
 	 * routing problems.
 	 */
-	memcpy(&src_addr, dlm_local_addr[0], sizeof(src_addr));
+	memcpy(&src_addr, &dlm_local_addr[0], sizeof(src_addr));
 	make_sockaddr(&src_addr, 0, &addr_len);
 
 	result = sock->ops->bind(sock, (struct sockaddr *)&src_addr,
@@ -1800,8 +1788,8 @@ static int dlm_tcp_listen_bind(struct socket *sock)
 	int addr_len;
 
 	/* Bind to our port */
-	make_sockaddr(dlm_local_addr[0], dlm_config.ci_tcp_port, &addr_len);
-	return sock->ops->bind(sock, (struct sockaddr *)dlm_local_addr[0],
+	make_sockaddr(&dlm_local_addr[0], dlm_config.ci_tcp_port, &addr_len);
+	return sock->ops->bind(sock, (struct sockaddr *)&dlm_local_addr[0],
 			       addr_len);
 }
 
@@ -1891,7 +1879,7 @@ int dlm_lowcomms_start(void)
 
 	error = work_start();
 	if (error)
-		goto fail_local;
+		goto fail;
 
 	/* Start listening */
 	switch (dlm_config.ci_protocol) {
@@ -1918,8 +1906,6 @@ int dlm_lowcomms_start(void)
 	dlm_proto_ops = NULL;
 fail_proto_ops:
 	work_stop();
-fail_local:
-	deinit_local();
 fail:
 	return error;
 }
-- 
2.31.1

