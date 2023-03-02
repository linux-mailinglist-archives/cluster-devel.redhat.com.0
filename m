Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3797D6A87A4
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Mar 2023 18:15:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677777318;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+N59KeNf+M4XP9AjvKcWtqtHDt71+QP/UMpMfMWgftM=;
	b=ZAEnANdY4H9FkZYpK89lKDBgNJRlW1kQyCj1hP6xeRMmuaYGKWPbJp2c87YzGrkN/EFHPS
	Ue/J+kkO4bOqlHiOyRIRnoB6kUuLKU0YNKdeSdoUgOY8dFdv2aEF9Ms9D0XOy3lkfbF83v
	yTGAZ1a37oyzwoWmH0c9BuWueqpWHgg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-34bgi_sNOjW6rNsyHdkgZg-1; Thu, 02 Mar 2023 12:15:14 -0500
X-MC-Unique: 34bgi_sNOjW6rNsyHdkgZg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F00F85A588;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CB8E492C14;
	Thu,  2 Mar 2023 17:15:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 677AE194866E;
	Thu,  2 Mar 2023 17:15:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E975419452CD for <cluster-devel@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 17:14:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D3AB1492B01; Thu,  2 Mar 2023 17:14:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADD60492B00;
 Thu,  2 Mar 2023 17:14:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  2 Mar 2023 12:14:28 -0500
Message-Id: <20230302171441.1509914-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm-tool 01/14] dlm_tool: add fail
 functionality if dump failed
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

Currently dlm_controld sets a embedded data int value of dlm_controld
dump functionality failed for e.g. if lockspace cannot be found. The
dlm_tool does not parse this possible error functionality and will exit
successfully. This patch will add dlm_tool fail functionality if
dlm_controld sets an embedded data error value.
---
 dlm_controld/lib.c           | 25 +++++++++-------
 dlm_controld/libdlmcontrol.h | 10 +++----
 dlm_tool/main.c              | 57 +++++++++++++++++++++++++++---------
 3 files changed, 62 insertions(+), 30 deletions(-)

diff --git a/dlm_controld/lib.c b/dlm_controld/lib.c
index 2888ad05..a21150f2 100644
--- a/dlm_controld/lib.c
+++ b/dlm_controld/lib.c
@@ -109,7 +109,7 @@ static void init_header(struct dlmc_header *h, int cmd, char *name,
 
 static char copy_buf[DLMC_DUMP_SIZE];
 
-static int do_dump(int cmd, char *name, char *buf)
+static int do_dump(int cmd, char *name, char *buf, int *data)
 {
 	struct dlmc_header h;
 	int fd, rv, len;
@@ -118,6 +118,8 @@ static int do_dump(int cmd, char *name, char *buf)
 
 	init_header(&h, cmd, name, 0);
 
+	*data = 0;
+
 	fd = do_connect(DLMC_QUERY_SOCK_PATH);
 	if (fd < 0) {
 		rv = fd;
@@ -134,6 +136,7 @@ static int do_dump(int cmd, char *name, char *buf)
 	if (rv < 0)
 		goto out_close;
 
+	*data = h.data;
 	len = h.len - sizeof(h);
 
 	if (len <= 0 || len > DLMC_DUMP_SIZE)
@@ -150,29 +153,29 @@ static int do_dump(int cmd, char *name, char *buf)
 	return rv;
 }
 
-int dlmc_dump_debug(char *buf)
+int dlmc_dump_debug(char *buf, int *data)
 {
-	return do_dump(DLMC_CMD_DUMP_DEBUG, NULL, buf);
+	return do_dump(DLMC_CMD_DUMP_DEBUG, NULL, buf, data);
 }
 
-int dlmc_dump_config(char *buf)
+int dlmc_dump_config(char *buf, int *data)
 {
-	return do_dump(DLMC_CMD_DUMP_CONFIG, NULL, buf);
+	return do_dump(DLMC_CMD_DUMP_CONFIG, NULL, buf, data);
 }
 
-int dlmc_dump_log_plock(char *buf)
+int dlmc_dump_log_plock(char *buf, int *data)
 {
-	return do_dump(DLMC_CMD_DUMP_LOG_PLOCK, NULL, buf);
+	return do_dump(DLMC_CMD_DUMP_LOG_PLOCK, NULL, buf, data);
 }
 
-int dlmc_dump_plocks(char *name, char *buf)
+int dlmc_dump_plocks(char *name, char *buf, int *data)
 {
-	return do_dump(DLMC_CMD_DUMP_PLOCKS, name, buf);
+	return do_dump(DLMC_CMD_DUMP_PLOCKS, name, buf, data);
 }
 
-int dlmc_dump_run(char *buf)
+int dlmc_dump_run(char *buf, int *data)
 {
-	return do_dump(DLMC_CMD_DUMP_RUN, NULL, buf);
+	return do_dump(DLMC_CMD_DUMP_RUN, NULL, buf, data);
 }
 
 int dlmc_reload_config(void)
diff --git a/dlm_controld/libdlmcontrol.h b/dlm_controld/libdlmcontrol.h
index a8654f3e..08f04c39 100644
--- a/dlm_controld/libdlmcontrol.h
+++ b/dlm_controld/libdlmcontrol.h
@@ -80,11 +80,11 @@ struct dlmc_lockspace {
 
 #define DLMC_STATUS_VERBOSE	0x00000001
 
-int dlmc_dump_debug(char *buf);
-int dlmc_dump_config(char *buf);
-int dlmc_dump_run(char *buf);
-int dlmc_dump_log_plock(char *buf);
-int dlmc_dump_plocks(char *name, char *buf);
+int dlmc_dump_debug(char *buf, int *data);
+int dlmc_dump_config(char *buf, int *data);
+int dlmc_dump_run(char *buf, int *data);
+int dlmc_dump_log_plock(char *buf, int *data);
+int dlmc_dump_plocks(char *name, char *buf, int *data);
 int dlmc_lockspace_info(char *lsname, struct dlmc_lockspace *ls);
 int dlmc_node_info(char *lsname, int nodeid, struct dlmc_node *node);
 /* caller need to free *lss */
diff --git a/dlm_tool/main.c b/dlm_tool/main.c
index 50f0cae9..52fd5b89 100644
--- a/dlm_tool/main.c
+++ b/dlm_tool/main.c
@@ -1466,36 +1466,51 @@ static void do_fence_ack(char *name)
 	dlmc_fence_ack(name);
 }
 
-static void do_plocks(char *name)
+static int do_plocks(char *name)
 {
 	char buf[DLMC_DUMP_SIZE];
+	int rv, data;
 
 	memset(buf, 0, sizeof(buf));
 
-	dlmc_dump_plocks(name, buf);
+	rv = dlmc_dump_plocks(name, buf, &data);
+	if (rv)
+		return rv;
+	else if (data)
+		return data;
 
 	buf[DLMC_DUMP_SIZE-1] = '\0';
 
 	do_write(STDOUT_FILENO, buf, strlen(buf));
+
+	return 0;
 }
 
-static void do_dump(int op)
+static int do_dump(int op)
 {
+	int rv = -EOPNOTSUPP, data;
 	char buf[DLMC_DUMP_SIZE];
 
 	memset(buf, 0, sizeof(buf));
 
 	if (op == OP_DUMP)
-		dlmc_dump_debug(buf);
+		rv = dlmc_dump_debug(buf, &data);
 	else if (op == OP_DUMP_CONFIG)
-		dlmc_dump_config(buf);
+		rv = dlmc_dump_config(buf, &data);
 	else if (op == OP_DUMP_RUN)
-		dlmc_dump_run(buf);
+		rv = dlmc_dump_run(buf, &data);
+
+	if (rv)
+		return rv;
+	else if (data)
+		return data;
 
 	buf[DLMC_DUMP_SIZE-1] = '\0';
 
 	do_write(STDOUT_FILENO, buf, strlen(buf));
 	printf("\n");
+
+	return 0;
 }
 
 static void do_reload_config(void)
@@ -1514,18 +1529,25 @@ static void do_set_config(void)
 		printf("set_config done\n");
 }
 
-static void do_log_plock(void)
+static int do_log_plock(void)
 {
 	char buf[DLMC_DUMP_SIZE];
+	int rv, data;
 
 	memset(buf, 0, sizeof(buf));
 
-	dlmc_dump_log_plock(buf);
+	rv = dlmc_dump_log_plock(buf, &data);
+	if (rv)
+		return rv;
+	else if (data)
+		return data;
 
 	buf[DLMC_DUMP_SIZE-1] = '\0';
 
 	do_write(STDOUT_FILENO, buf, strlen(buf));
 	printf("\n");
+
+	return 0;
 }
 
 static int do_run(int op)
@@ -1576,6 +1598,7 @@ int main(int argc, char **argv)
 {
 	prog_name = argv[0];
 	decode_arguments(argc, argv);
+	int rv = 0;
 
 	switch (operation) {
 
@@ -1605,11 +1628,11 @@ int main(int argc, char **argv)
 		break;
 
 	case OP_DUMP:
-		do_dump(operation);
+		rv = do_dump(operation);
 		break;
 
 	case OP_DUMP_CONFIG:
-		do_dump(operation);
+		rv = do_dump(operation);
 		break;
 
 	case OP_RELOAD_CONFIG:
@@ -1621,11 +1644,11 @@ int main(int argc, char **argv)
 		break;
 
 	case OP_LOG_PLOCK:
-		do_log_plock();
+		rv = do_log_plock();
 		break;
 
 	case OP_PLOCKS:
-		do_plocks(lsname);
+		rv = do_plocks(lsname);
 		break;
 
 	case OP_DEADLOCK_CHECK:
@@ -1654,9 +1677,15 @@ int main(int argc, char **argv)
 		break;
 
 	case OP_DUMP_RUN:
-		do_dump(operation);
+		rv = do_dump(operation);
 		break;
 	}
-	return 0;
+
+	if (rv < 0) {
+		fprintf(stderr, "failed: %s\n", strerror(-rv));
+		return EXIT_FAILURE;
+	}
+
+	return EXIT_SUCCESS;
 }
 
-- 
2.31.1

