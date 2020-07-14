Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 13C2621F8B6
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jul 2020 20:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594749730;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wmsclAhtAtqmLLTPTLY8nPtOjCg6nkujClqmAo+MlZ0=;
	b=QokSpLp9o9ZmN1S6ebh6h0YLSVlhJyOJhrao8utLdj9B/BX1bt1c4KNJeLjQ5PJ/XEau1e
	GENY81Bc7V1XTIRL9bxtMUk6EgdGY+WG0rCGs8IXW4A5AWTwDAk7Q95cfomvDd4yBkDX22
	j4Qy6mIoi0tPwQCBqvpXYydEV7z/oH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-wuBAFCEdPSOWPGwESr0PKg-1; Tue, 14 Jul 2020 14:02:07 -0400
X-MC-Unique: wuBAFCEdPSOWPGwESr0PKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBD248F81E2;
	Tue, 14 Jul 2020 18:01:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C95775FC2E;
	Tue, 14 Jul 2020 18:01:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F214F94EEE;
	Tue, 14 Jul 2020 18:01:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06EI1cpb024224 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jul 2020 14:01:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B4E3560CD0; Tue, 14 Jul 2020 18:01:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-119-142.rdu2.redhat.com [10.10.119.142])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3828860C87;
	Tue, 14 Jul 2020 18:01:38 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 14 Jul 2020 14:01:13 -0400
Message-Id: <20200714180116.18642-2-aahringo@redhat.com>
In-Reply-To: <20200714180116.18642-1-aahringo@redhat.com>
References: <20200714180116.18642-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 1/4] dlm_controld: fix
	-Wstringop-truncation warnings
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch fixes in dlm_controld all -Wstringop-truncation warnings.
There exists two different cases inside the code:

1. string buffer without null termination:

Code work as expected in this case a pragma is introduced to ignore the
warning.

2. string buffer with null termination:

The function strncpy() will not leave the destination buffer with a null
termination symbol if the buffer doesn't fit. That's why gcc above 8.0
print warnings. Obviously there are some memset() to zero the buffer and
doing a strncpy() minus one of the buffer length afterwards which seems
fine. The fact that gcc still complains and knowing other discussions
about memset() I believe that there might be reasons why gcc doesn't
stop to complain about such code or gcc isn't able to detect it.

However this patch will guarantee that the destination buffer is always
null terminated and the full destination buffer size is used now.
---
 dlm_controld/cpg.c          |  3 ++-
 dlm_controld/fence_config.c | 20 +++++++++++++++-----
 dlm_controld/lib.c          | 15 +++++++++++++--
 dlm_controld/main.c         | 13 ++++++++++++-
 4 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/dlm_controld/cpg.c b/dlm_controld/cpg.c
index 5b5c52fc..f3365ee4 100644
--- a/dlm_controld/cpg.c
+++ b/dlm_controld/cpg.c
@@ -1867,7 +1867,8 @@ int set_lockspace_info(struct lockspace *ls, struct dlmc_lockspace *lockspace)
 {
 	struct change *cg, *last = NULL;
 
-	strncpy(lockspace->name, ls->name, DLM_LOCKSPACE_LEN);
+	strncpy(lockspace->name, ls->name, DLM_LOCKSPACE_LEN + 1);
+	lockspace->name[DLM_LOCKSPACE_LEN] = '\0';
 	lockspace->global_id = ls->global_id;
 
 	if (ls->joining)
diff --git a/dlm_controld/fence_config.c b/dlm_controld/fence_config.c
index 5d8d7dc1..08996ac0 100644
--- a/dlm_controld/fence_config.c
+++ b/dlm_controld/fence_config.c
@@ -180,11 +180,21 @@ static int read_config_section(unsigned int nodeid, FILE *file, char *dev_line,
 		memset(dev, 0, sizeof(struct fence_device));
 		memset(con, 0, sizeof(struct fence_connect));
 
-		strncpy(dev->name, dev_name, FENCE_CONFIG_NAME_MAX-1);
-		strncpy(dev->agent, agent, FENCE_CONFIG_NAME_MAX-1);
-		strncpy(dev->args, dev_args, FENCE_CONFIG_ARGS_MAX-1);
-		strncpy(con->name, con_name, FENCE_CONFIG_NAME_MAX-1);
-		strncpy(con->args, con_args, FENCE_CONFIG_ARGS_MAX-1);
+		strncpy(dev->name, dev_name, FENCE_CONFIG_NAME_MAX);
+		dev->name[FENCE_CONFIG_NAME_MAX - 1] = '\0';
+
+		strncpy(dev->agent, agent, FENCE_CONFIG_NAME_MAX);
+		dev->agent[FENCE_CONFIG_NAME_MAX - 1] = '\0';
+
+		strncpy(dev->args, dev_args, FENCE_CONFIG_ARGS_MAX);
+		dev->args[FENCE_CONFIG_ARGS_MAX - 1] = '\0';
+
+		strncpy(con->name, con_name, FENCE_CONFIG_NAME_MAX);
+		con->name[FENCE_CONFIG_NAME_MAX - 1] = '\0';
+
+		strncpy(con->args, con_args, FENCE_CONFIG_ARGS_MAX);
+		con->args[FENCE_CONFIG_ARGS_MAX - 1] = '\0';
+
 		dev->unfence = unfence;
 
 		*dev_out = dev;
diff --git a/dlm_controld/lib.c b/dlm_controld/lib.c
index b6ea3a30..53c11cf9 100644
--- a/dlm_controld/lib.c
+++ b/dlm_controld/lib.c
@@ -81,6 +81,17 @@ static int do_connect(const char *sock_path)
 	return fd;
 }
 
+static inline void init_header_name(struct dlmc_header *h,
+				    const char *name, size_t len)
+{
+#pragma GCC diagnostic push
+#if __GNUC__ >= 8
+#pragma GCC diagnostic ignored "-Wstringop-truncation"
+#endif
+	strncpy(h->name, name, len);
+#pragma GCC diagnostic pop
+}
+
 static void init_header(struct dlmc_header *h, int cmd, char *name,
 			int extra_len)
 {
@@ -92,7 +103,7 @@ static void init_header(struct dlmc_header *h, int cmd, char *name,
 	h->command = cmd;
 
 	if (name)
-		strncpy(h->name, name, DLM_LOCKSPACE_LEN);
+		init_header_name(h, name, DLM_LOCKSPACE_LEN);
 }
 
 static char copy_buf[DLMC_DUMP_SIZE];
@@ -881,7 +892,7 @@ int dlmc_run_check(char *run_uuid, int len, int wait_sec, uint32_t flags,
 
 	init_header(&h, DLMC_CMD_RUN_CHECK, NULL, 0);
 	h.flags = flags;
-	strncpy(h.name, run_uuid, DLMC_RUN_UUID_LEN);
+	init_header_name(&h, run_uuid, DLMC_RUN_UUID_LEN);
 
 	memset(&rh, 0, sizeof(rh));
 
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 8023f4b0..645bd26b 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -788,6 +788,17 @@ static int setup_uevent(void)
 	return s;
 }
 
+static inline void init_header_name(struct dlmc_header *h,
+				    const char *name, size_t len)
+{
+#pragma GCC diagnostic push
+#if __GNUC__ >= 8
+#pragma GCC diagnostic ignored "-Wstringop-truncation"
+#endif
+	strncpy(h->name, name, len);
+#pragma GCC diagnostic pop
+}
+
 static void init_header(struct dlmc_header *h, int cmd, char *name, int result,
 			int extra_len)
 {
@@ -800,7 +811,7 @@ static void init_header(struct dlmc_header *h, int cmd, char *name, int result,
 	h->data = result;
 
 	if (name)
-		strncpy(h->name, name, DLM_LOCKSPACE_LEN);
+		init_header_name(h, name, DLM_LOCKSPACE_LEN);
 }
 
 static char copy_buf[LOG_DUMP_SIZE];
-- 
2.26.2

