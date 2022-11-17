Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CD362E7E3
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Nov 2022 23:12:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668723137;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kvhMJicRhnpKWsIFm7SXWyxqcfxrDbcc/hcOnP59vBE=;
	b=a1v88m3dFtMoA7n2BTViHwPZBmy/JKAbahmrYRVOBZC0/wpvYXuwDioCyBzQ9NuFAzmmmv
	RZ4Jtfc3xQLYsJ8MJ40H+k7CiJd9Fe4w1VmoBU5hdGmAaHT+zKjMhTrjLmd5KkKyAUAFl7
	jrx9PvhU2VnE5rM3gIpw3dox/ocSOYE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-flj8VrOTP-aHuqcpX48lBw-1; Thu, 17 Nov 2022 17:12:14 -0500
X-MC-Unique: flj8VrOTP-aHuqcpX48lBw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 306B58582B9;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 07FCB2027064;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 60D751946A68;
	Thu, 17 Nov 2022 22:12:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E6FCE1946595 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 22:12:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CDC022166B48; Thu, 17 Nov 2022 22:12:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9EF62166B29;
 Thu, 17 Nov 2022 22:12:08 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Nov 2022 17:11:46 -0500
Message-Id: <20221117221157.2396743-7-aahringo@redhat.com>
In-Reply-To: <20221117221157.2396743-1-aahringo@redhat.com>
References: <20221117221157.2396743-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 07/18] fs: dlm: add midcomms
 init/start functions
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch introduces leftovers of init, start, stop and exit
functionality. The dlm application layer should always call the midcomms
layer which getting aware of such event and redirect it to the lowcomms
layer. Some functionality which is currently handled inside the start
functionality of midcomms and lowcomms should be handled in the init
functionality as it only need to be initialized once when dlm is loaded.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lockspace.c |  5 ++---
 fs/dlm/lowcomms.c  | 16 ++++++++++------
 fs/dlm/lowcomms.h  |  1 +
 fs/dlm/main.c      |  7 +++++--
 fs/dlm/midcomms.c  | 17 ++++++++++++++++-
 fs/dlm/midcomms.h  |  3 +++
 6 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 96fe8f7ca09c..d0b4e2181a5f 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -17,7 +17,6 @@
 #include "recoverd.h"
 #include "dir.h"
 #include "midcomms.h"
-#include "lowcomms.h"
 #include "config.h"
 #include "memory.h"
 #include "lock.h"
@@ -723,7 +722,7 @@ static int __dlm_new_lockspace(const char *name, const char *cluster,
 	if (!ls_count) {
 		dlm_scand_stop();
 		dlm_midcomms_shutdown();
-		dlm_lowcomms_stop();
+		dlm_midcomms_stop();
 	}
  out:
 	mutex_unlock(&ls_lock);
@@ -926,7 +925,7 @@ int dlm_release_lockspace(void *lockspace, int force)
 	if (!error)
 		ls_count--;
 	if (!ls_count)
-		dlm_lowcomms_stop();
+		dlm_midcomms_stop();
 	mutex_unlock(&ls_lock);
 
 	return error;
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index b05c6d9b5102..0dcb69cc456a 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1987,10 +1987,6 @@ static const struct dlm_proto_ops dlm_sctp_ops = {
 int dlm_lowcomms_start(void)
 {
 	int error = -EINVAL;
-	int i;
-
-	for (i = 0; i < CONN_HASH_SIZE; i++)
-		INIT_HLIST_HEAD(&connection_hash[i]);
 
 	init_local();
 	if (!dlm_local_count) {
@@ -1999,8 +1995,6 @@ int dlm_lowcomms_start(void)
 		goto fail;
 	}
 
-	INIT_WORK(&listen_con.rwork, process_listen_recv_socket);
-
 	error = work_start();
 	if (error)
 		goto fail_local;
@@ -2039,6 +2033,16 @@ int dlm_lowcomms_start(void)
 	return error;
 }
 
+void dlm_lowcomms_init(void)
+{
+	int i;
+
+	for (i = 0; i < CONN_HASH_SIZE; i++)
+		INIT_HLIST_HEAD(&connection_hash[i]);
+
+	INIT_WORK(&listen_con.rwork, process_listen_recv_socket);
+}
+
 void dlm_lowcomms_exit(void)
 {
 	struct dlm_node_addr *na, *safe;
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 29369feea991..bbce7a18416d 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -35,6 +35,7 @@ extern int dlm_allow_conn;
 int dlm_lowcomms_start(void);
 void dlm_lowcomms_shutdown(void);
 void dlm_lowcomms_stop(void);
+void dlm_lowcomms_init(void);
 void dlm_lowcomms_exit(void);
 int dlm_lowcomms_close(int nodeid);
 struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
diff --git a/fs/dlm/main.c b/fs/dlm/main.c
index 1c5be4b70ac1..a77338be3237 100644
--- a/fs/dlm/main.c
+++ b/fs/dlm/main.c
@@ -17,7 +17,7 @@
 #include "user.h"
 #include "memory.h"
 #include "config.h"
-#include "lowcomms.h"
+#include "midcomms.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/dlm.h>
@@ -30,6 +30,8 @@ static int __init init_dlm(void)
 	if (error)
 		goto out;
 
+	dlm_midcomms_init();
+
 	error = dlm_lockspace_init();
 	if (error)
 		goto out_mem;
@@ -66,6 +68,7 @@ static int __init init_dlm(void)
  out_lockspace:
 	dlm_lockspace_exit();
  out_mem:
+	dlm_midcomms_exit();
 	dlm_memory_exit();
  out:
 	return error;
@@ -79,7 +82,7 @@ static void __exit exit_dlm(void)
 	dlm_config_exit();
 	dlm_memory_exit();
 	dlm_lockspace_exit();
-	dlm_lowcomms_exit();
+	dlm_midcomms_exit();
 	dlm_unregister_debugfs();
 }
 
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 960def5ab530..6b4c72fb0171 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -1205,13 +1205,28 @@ void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh,
 #endif
 
 int dlm_midcomms_start(void)
+{
+	return dlm_lowcomms_start();
+}
+
+void dlm_midcomms_stop(void)
+{
+	dlm_lowcomms_stop();
+}
+
+void dlm_midcomms_init(void)
 {
 	int i;
 
 	for (i = 0; i < CONN_HASH_SIZE; i++)
 		INIT_HLIST_HEAD(&node_hash[i]);
 
-	return dlm_lowcomms_start();
+	dlm_lowcomms_init();
+}
+
+void dlm_midcomms_exit(void)
+{
+	dlm_lowcomms_exit();
 }
 
 static void dlm_act_fin_ack_rcv(struct midcomms_node *node)
diff --git a/fs/dlm/midcomms.h b/fs/dlm/midcomms.h
index d6286e80b077..69296552d5ad 100644
--- a/fs/dlm/midcomms.h
+++ b/fs/dlm/midcomms.h
@@ -21,6 +21,9 @@ void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh, const void *name,
 				 int namelen);
 int dlm_midcomms_close(int nodeid);
 int dlm_midcomms_start(void);
+void dlm_midcomms_stop(void);
+void dlm_midcomms_init(void);
+void dlm_midcomms_exit(void);
 void dlm_midcomms_shutdown(void);
 void dlm_midcomms_add_member(int nodeid);
 void dlm_midcomms_remove_member(int nodeid);
-- 
2.31.1

