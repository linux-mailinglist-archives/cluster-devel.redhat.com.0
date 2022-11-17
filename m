Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FED62E7F1
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Nov 2022 23:12:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668723145;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fWKzhJ/0bAUXn09Pa81l4dvdNk6Vltcdf7y35lWAi4o=;
	b=GP7ClEcQafcOxDJcVG1pXIj8AdGH6lWyF5mv3B1N4EMnBfLrsyg+hCTXORrNgrBy4J5txY
	LipDx/MQ0jkDX29S1cVgVx3qsf8GJZenzLlLbD7ohQ95ebVEbxg7Rj1ZpCBL2xBjKq+L53
	xnechrcczLj6ZyDvBvU0Q2VJ6D7hnc8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-j_kj2Rc6OBmoW_jT6FnCig-1; Thu, 17 Nov 2022 17:12:14 -0500
X-MC-Unique: j_kj2Rc6OBmoW_jT6FnCig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 923941012477;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 876BE111E41C;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7FC2019465A8;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 62FDB1946595 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 22:12:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5697C2166B46; Thu, 17 Nov 2022 22:12:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 326822166B29;
 Thu, 17 Nov 2022 22:12:09 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Nov 2022 17:11:49 -0500
Message-Id: <20221117221157.2396743-10-aahringo@redhat.com>
In-Reply-To: <20221117221157.2396743-1-aahringo@redhat.com>
References: <20221117221157.2396743-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 10/18] fs: dlm: use listen sock as
 dlm running indicator
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

This patch will switch from dlm_allow_conn to check if dlm lowcomms is
running or not to if we actually have a listen socket set or not. The
list socket will be set and unset in lowcomms start and shutdown
functionality. To synchronize with data_ready() callback we will set the
socket callback to NULL while socket lock is held.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c   |  4 ++--
 fs/dlm/lowcomms.c | 17 ++++++-----------
 fs/dlm/lowcomms.h |  4 ++--
 3 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index ac8b62106ce0..20b60709eccf 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -183,7 +183,7 @@ static int dlm_check_protocol_and_dlm_running(unsigned int x)
 		return -EINVAL;
 	}
 
-	if (dlm_allow_conn)
+	if (dlm_lowcomms_is_running())
 		return -EBUSY;
 
 	return 0;
@@ -194,7 +194,7 @@ static int dlm_check_zero_and_dlm_running(unsigned int x)
 	if (!x)
 		return -EINVAL;
 
-	if (dlm_allow_conn)
+	if (dlm_lowcomms_is_running())
 		return -EBUSY;
 
 	return 0;
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index d3302b10b37e..d9001d40aa6e 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -176,7 +176,6 @@ static DEFINE_SPINLOCK(dlm_node_addrs_spin);
 static struct listen_connection listen_con;
 static struct sockaddr_storage *dlm_local_addr[DLM_MAX_ADDR_COUNT];
 static int dlm_local_count;
-int dlm_allow_conn;
 
 /* Work queues */
 static struct workqueue_struct *recv_workqueue;
@@ -191,6 +190,11 @@ static const struct dlm_proto_ops *dlm_proto_ops;
 static void process_recv_sockets(struct work_struct *work);
 static void process_send_sockets(struct work_struct *work);
 
+bool dlm_lowcomms_is_running(void)
+{
+	return !!listen_con.sock;
+}
+
 static void writequeue_entry_ctor(void *data)
 {
 	struct writequeue_entry *entry = data;
@@ -511,9 +515,6 @@ static void lowcomms_data_ready(struct sock *sk)
 
 static void lowcomms_listen_data_ready(struct sock *sk)
 {
-	if (!dlm_allow_conn)
-		return;
-
 	queue_work(recv_workqueue, &listen_con.rwork);
 }
 
@@ -1689,10 +1690,7 @@ void dlm_lowcomms_shutdown(void)
 {
 	int idx;
 
-	/* Set all the flags to prevent any
-	 * socket activity.
-	 */
-	dlm_allow_conn = 0;
+	restore_callbacks(listen_con.sock);
 
 	if (recv_workqueue)
 		flush_workqueue(recv_workqueue);
@@ -1995,8 +1993,6 @@ int dlm_lowcomms_start(void)
 	if (error)
 		goto fail_local;
 
-	dlm_allow_conn = 1;
-
 	/* Start listening */
 	switch (dlm_config.ci_protocol) {
 	case DLM_PROTO_TCP:
@@ -2021,7 +2017,6 @@ int dlm_lowcomms_start(void)
 fail_listen:
 	dlm_proto_ops = NULL;
 fail_proto_ops:
-	dlm_allow_conn = 0;
 	work_stop();
 fail_local:
 	deinit_local();
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index bbce7a18416d..acaf1b0b3885 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -29,8 +29,8 @@ static inline int nodeid_hash(int nodeid)
 	return nodeid & (CONN_HASH_SIZE-1);
 }
 
-/* switch to check if dlm is running */
-extern int dlm_allow_conn;
+/* check if dlm is running */
+bool dlm_lowcomms_is_running(void);
 
 int dlm_lowcomms_start(void);
 void dlm_lowcomms_shutdown(void);
-- 
2.31.1

