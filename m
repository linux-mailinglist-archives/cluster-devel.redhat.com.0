Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 101D04D2270
	for <lists+cluster-devel@lfdr.de>; Tue,  8 Mar 2022 21:21:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646770899;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bGIg+JamYkJipDqCTd4qy7LoDeK3o+MewpzM53UstVk=;
	b=cxmysNBuWxyDIAX7m/qhd5FqRF12JjNeVn3AmQY0RPuR9Bh4l7uQel/MKhWj0ilSrj7MAH
	DbDqLLjs00bQM5OM/wP4uJ01fsV6HXkKN6ISnGt+koSBS1ULgrYE0Wu2U133fuRTj3cdff
	Ow6wZG8Y96AhPKeiVxLY+xEb58w9EfE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-jrm5x2h8MDChfclyMuLf-w-1; Tue, 08 Mar 2022 15:21:35 -0500
X-MC-Unique: jrm5x2h8MDChfclyMuLf-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDE74811E76;
	Tue,  8 Mar 2022 20:21:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA5ED40D1B9A;
	Tue,  8 Mar 2022 20:21:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8325C193210B;
	Tue,  8 Mar 2022 20:21:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E13B2194F4AE for <cluster-devel@listman.corp.redhat.com>;
 Tue,  8 Mar 2022 20:21:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 85B2812E2D; Tue,  8 Mar 2022 20:21:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F24E264185;
 Tue,  8 Mar 2022 20:21:27 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  8 Mar 2022 15:21:19 -0500
Message-Id: <20220308202119.2673632-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Subject: [Cluster-devel] [PATCH dlm-tool] dlm_tool: handle dynamic length
 lockspace dump
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
Cc: cluster-devel@redhat.com, nwahl@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Currently there is a maximum lockspace dump value which I think was
there because a dlm user lockspace limitation of device minor numbers.
However for kernel lockspaces e.g. gfs2 there will no device files
created and so we can indeed have more than 128 lockspaces registered.
If this is the case dlm_tool will simple not dump any lockspace because
it hits the static pre-allocated array size to dump lockspace
information.

This patch is changing the current static behaviour to first get the
dlmc_header header and calculate the additional payload size and
allocate the dump lockspace array so that no static limitation exists
anymore.

I tested this patch series with a hacked dlm test module which registers
300 dlm lockspaces.

Reported-by: Reid Wahl <nwahl@redhat.com>
---
 dlm_controld/lib.c           | 54 +++++++++++++++++-------------------
 dlm_controld/libdlmcontrol.h |  3 +-
 dlm_controld/main.c          | 11 ++------
 dlm_tool/main.c              | 14 ++++++----
 4 files changed, 39 insertions(+), 43 deletions(-)

diff --git a/dlm_controld/lib.c b/dlm_controld/lib.c
index 8cbdd27f..bc92a4b7 100644
--- a/dlm_controld/lib.c
+++ b/dlm_controld/lib.c
@@ -667,24 +667,11 @@ int dlmc_lockspace_info(char *name, struct dlmc_lockspace *lockspace)
 	return rv;
 }
 
-int dlmc_lockspaces(int max, int *count, struct dlmc_lockspace *lss)
+int dlmc_lockspaces(int *count, struct dlmc_lockspace **lss)
 {
-	struct dlmc_header h, *rh;
-	char *reply;
+	struct dlmc_header h;
 	int reply_len;
-	int fd, rv, result, ls_count;
-
-	init_header(&h, DLMC_CMD_LOCKSPACES, NULL, 0);
-	h.data = max;
-
-	reply_len = sizeof(struct dlmc_header) +
-		    (max * sizeof(struct dlmc_lockspace));
-	reply = malloc(reply_len);
-	if (!reply) {
-		rv = -1;
-		goto out;
-	}
-	memset(reply, 0, reply_len);
+	int fd, rv, result;
 
 	fd = do_connect(DLMC_QUERY_SOCK_PATH);
 	if (fd < 0) {
@@ -692,31 +679,40 @@ int dlmc_lockspaces(int max, int *count, struct dlmc_lockspace *lss)
 		goto out;
 	}
 
+	init_header(&h, DLMC_CMD_LOCKSPACES, NULL, 0);
+
 	rv = do_write(fd, &h, sizeof(h));
 	if (rv < 0)
 		goto out_close;
 
-	/* won't usually get back the full reply_len */
-	do_read(fd, reply, reply_len);
+	rv = do_read(fd, &h, sizeof(h));
+	if (rv <0)
+		goto out_close;
 
-	rh = (struct dlmc_header *)reply;
-	result = rh->data;
-	if (result < 0 && result != -E2BIG) {
+	result = h.data;
+	if (result < 0) {
 		rv = result;
 		goto out_close;
 	}
 
-	if (result == -E2BIG) {
-		*count = -E2BIG;
-		ls_count = max;
-	} else {
-		*count = result;
-		ls_count = result;
+	*count = result;
+
+	reply_len = h.len - sizeof(struct dlmc_header);
+	*lss = malloc(reply_len);
+	if (!*lss) {
+		rv = -1;
+		goto out;
+	}
+	memset(*lss, 0, reply_len);
+
+	rv = do_read(fd, *lss, reply_len);
+	if (rv < 0) {
+		free(*lss);
+		goto out;
 	}
+
 	rv = 0;
 
-	memcpy(lss, (char *)reply + sizeof(struct dlmc_header),
-	       ls_count * sizeof(struct dlmc_lockspace));
  out_close:
 	close(fd);
  out:
diff --git a/dlm_controld/libdlmcontrol.h b/dlm_controld/libdlmcontrol.h
index a106171b..a8654f3e 100644
--- a/dlm_controld/libdlmcontrol.h
+++ b/dlm_controld/libdlmcontrol.h
@@ -87,7 +87,8 @@ int dlmc_dump_log_plock(char *buf);
 int dlmc_dump_plocks(char *name, char *buf);
 int dlmc_lockspace_info(char *lsname, struct dlmc_lockspace *ls);
 int dlmc_node_info(char *lsname, int nodeid, struct dlmc_node *node);
-int dlmc_lockspaces(int max, int *count, struct dlmc_lockspace *lss);
+/* caller need to free *lss */
+int dlmc_lockspaces(int *count, struct dlmc_lockspace **lss);
 int dlmc_lockspace_nodes(char *lsname, int type, int max, int *count,
 			 struct dlmc_node *nodes);
 int dlmc_print_status(uint32_t flags);
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 57844dc1..a98dae56 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1070,7 +1070,7 @@ static void query_node_info(int fd, char *name, int nodeid)
 		 (char *)&node, sizeof(node));
 }
 
-static void query_lockspaces(int fd, int max)
+static void query_lockspaces(int fd)
 {
 	int ls_count = 0;
 	struct dlmc_lockspace *lss = NULL;
@@ -1083,12 +1083,7 @@ static void query_lockspaces(int fd, int max)
 		goto out;
 	}
 
-	if (ls_count > max) {
-		result = -E2BIG;
-		ls_count = max;
-	} else {
-		result = ls_count;
-	}
+	result = ls_count;
  out:
 	do_reply(fd, DLMC_CMD_LOCKSPACES, NULL, result, 0,
 		 (char *)lss, ls_count * sizeof(struct dlmc_lockspace));
@@ -1375,7 +1370,7 @@ static void *process_queries(void *arg)
 			query_node_info(f, h.name, h.data);
 			break;
 		case DLMC_CMD_LOCKSPACES:
-			query_lockspaces(f, h.data);
+			query_lockspaces(f);
 			break;
 		case DLMC_CMD_LOCKSPACE_NODES:
 			query_lockspace_nodes(f, h.name, h.option, h.data);
diff --git a/dlm_tool/main.c b/dlm_tool/main.c
index 04ff40f8..f4e69649 100644
--- a/dlm_tool/main.c
+++ b/dlm_tool/main.c
@@ -67,7 +67,6 @@ static int summarize;
 char run_command[DLMC_RUN_COMMAND_LEN];
 char run_uuid[DLMC_RUN_UUID_LEN];
 
-#define MAX_LS 128
 #define MAX_NODES 128
 
 /* from linux/fs/dlm/dlm_internal.h */
@@ -91,7 +90,7 @@ char run_uuid[DLMC_RUN_UUID_LEN];
 #define DLM_MSG_PURGE           14
 
 
-struct dlmc_lockspace lss[MAX_LS];
+struct dlmc_lockspace *lss;
 struct dlmc_node nodes[MAX_NODES];
 
 struct rinfo {
@@ -1410,13 +1409,16 @@ static void do_list(char *name)
 	int rv;
 	int i;
 
-	memset(lss, 0, sizeof(lss));
-
 	if (name) {
+		/* get only one specific lockspace by name */
 		ls_count = 1;
+		lss = malloc(sizeof(struct dlmc_lockspace));
+		if (!lss)
+			exit(EXIT_FAILURE);
+
 		rv = dlmc_lockspace_info(name, lss);
 	} else {
-		rv = dlmc_lockspaces(MAX_LS, &ls_count, lss);
+		rv = dlmc_lockspaces(&ls_count, &lss);
 	}
 
 	if (rv < 0)
@@ -1450,6 +1452,8 @@ static void do_list(char *name)
  next:
 		printf("\n");
 	}
+
+	free(lss);
 }
 
 static void do_deadlock_check(char *name)
-- 
2.31.1

