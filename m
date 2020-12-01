Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 23FFB2CA696
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Dec 2020 16:10:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606835433;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3hesqrpI2m9qcRRfvRHXFK/GE/BWZUjt16O8OSbvOPc=;
	b=MNO8womVikly+SHrSXVbjsJ4vGbQxbsIrAGfNDuMdidNiKJYPTBLzWv0CYBx8gA+/Oi7Qc
	YDS2VcUwelCcROCvqMfISLirP+3M7UcNWuzLpjfJQ8LgI77iA3qjLosKLGQDddRLQmHQH1
	xDQAuQoGg8MlgU8So5JSsSMElDWbbms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-BF2nmGkQMNOa_jVKhHSPyg-1; Tue, 01 Dec 2020 10:10:31 -0500
X-MC-Unique: BF2nmGkQMNOa_jVKhHSPyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FB26817B83;
	Tue,  1 Dec 2020 15:10:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BEE05C1D0;
	Tue,  1 Dec 2020 15:10:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 29267180954D;
	Tue,  1 Dec 2020 15:10:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B1FALhV019601 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 1 Dec 2020 10:10:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2708D5D705; Tue,  1 Dec 2020 15:10:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-202.rdu2.redhat.com [10.10.114.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9EE765D6AB;
	Tue,  1 Dec 2020 15:10:20 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  1 Dec 2020 10:09:44 -0500
Message-Id: <20201201150957.115068-5-aahringo@redhat.com>
In-Reply-To: <20201201150957.115068-1-aahringo@redhat.com>
References: <20201201150957.115068-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 04/17] fs: dlm: add check if dlm
	is currently running
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds checks for dlm config attributes regarding to protocol
parameters as it makes only sense to change them when dlm is not running.
It also adds a check for valid protocol specifiers and return invalid
argument if they are not supported.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c   | 34 ++++++++++++++++++++++++++++++++--
 fs/dlm/lowcomms.c |  2 +-
 fs/dlm/lowcomms.h |  3 +++
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 73e6643903af..ab26cf135710 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -164,6 +164,36 @@ static ssize_t cluster_##name##_show(struct config_item *item, char *buf)     \
 }                                                                             \
 CONFIGFS_ATTR(cluster_, name);
 
+static int dlm_check_protocol_and_dlm_running(unsigned int x)
+{
+	switch (x) {
+	case 0:
+		/* TCP */
+		break;
+	case 1:
+		/* SCTP */
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (dlm_allow_conn)
+		return -EBUSY;
+
+	return 0;
+}
+
+static int dlm_check_zero_and_dlm_running(unsigned int x)
+{
+	if (!x)
+		return -EINVAL;
+
+	if (dlm_allow_conn)
+		return -EBUSY;
+
+	return 0;
+}
+
 static int dlm_check_zero(unsigned int x)
 {
 	if (!x)
@@ -180,7 +210,7 @@ static int dlm_check_buffer_size(unsigned int x)
 	return 0;
 }
 
-CLUSTER_ATTR(tcp_port, dlm_check_zero);
+CLUSTER_ATTR(tcp_port, dlm_check_zero_and_dlm_running);
 CLUSTER_ATTR(buffer_size, dlm_check_buffer_size);
 CLUSTER_ATTR(rsbtbl_size, dlm_check_zero);
 CLUSTER_ATTR(recover_timer, dlm_check_zero);
@@ -188,7 +218,7 @@ CLUSTER_ATTR(toss_secs, dlm_check_zero);
 CLUSTER_ATTR(scan_secs, dlm_check_zero);
 CLUSTER_ATTR(log_debug, NULL);
 CLUSTER_ATTR(log_info, NULL);
-CLUSTER_ATTR(protocol, NULL);
+CLUSTER_ATTR(protocol, dlm_check_protocol_and_dlm_running);
 CLUSTER_ATTR(mark, NULL);
 CLUSTER_ATTR(timewarn_cs, dlm_check_zero);
 CLUSTER_ATTR(waitwarn_us, NULL);
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index d772e1d4461d..d25b9132c593 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -134,7 +134,7 @@ static DEFINE_SPINLOCK(dlm_node_addrs_spin);
 static struct listen_connection listen_con;
 static struct sockaddr_storage *dlm_local_addr[DLM_MAX_ADDR_COUNT];
 static int dlm_local_count;
-static int dlm_allow_conn;
+int dlm_allow_conn;
 
 /* Work queues */
 static struct workqueue_struct *recv_workqueue;
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 0918f9376489..f74888ed43b4 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -14,6 +14,9 @@
 
 #define LOWCOMMS_MAX_TX_BUFFER_LEN	4096
 
+/* switch to check if dlm is running */
+extern int dlm_allow_conn;
+
 int dlm_lowcomms_start(void);
 void dlm_lowcomms_stop(void);
 void dlm_lowcomms_exit(void);
-- 
2.26.2

