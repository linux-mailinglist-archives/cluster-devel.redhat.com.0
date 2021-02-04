Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 81F7430FF9A
	for <lists+cluster-devel@lfdr.de>; Thu,  4 Feb 2021 22:51:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612475480;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3hesqrpI2m9qcRRfvRHXFK/GE/BWZUjt16O8OSbvOPc=;
	b=ZpuhaFNUMMQIqiYpyC1VGDyfvwnvJp5kjTJDi3lMReklUxd5mwnanff7JFNj9L7xP331i8
	VB6jWOAs0XsdfZaKkUDjJ++hUX56tM1gfUaGS/+Yc00guSdLD65qNv3vYToErPHxm3/jCY
	olzDGiLZRUG8kb2uFUsrHyGal/YuD+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-QgNaLKdFMc6_B_JCPyy1vw-1; Thu, 04 Feb 2021 16:51:19 -0500
X-MC-Unique: QgNaLKdFMc6_B_JCPyy1vw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 543FB100F342;
	Thu,  4 Feb 2021 21:51:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4524C60BE2;
	Thu,  4 Feb 2021 21:51:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 024D64E58E;
	Thu,  4 Feb 2021 21:51:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 114Lp9Z9027526 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 4 Feb 2021 16:51:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E15CE1B533; Thu,  4 Feb 2021 21:51:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-190.rdu2.redhat.com [10.10.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 529B960C16;
	Thu,  4 Feb 2021 21:51:09 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  4 Feb 2021 16:50:51 -0500
Message-Id: <20210204215056.774409-5-aahringo@redhat.com>
In-Reply-To: <20210204215056.774409-1-aahringo@redhat.com>
References: <20210204215056.774409-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 4/9] fs: dlm: add check if dlm is
	currently running
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

