Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DB75637407E
	for <lists+cluster-devel@lfdr.de>; Wed,  5 May 2021 18:34:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-U33Q-ikwPjicssp9KUJUIw-1; Wed, 05 May 2021 12:34:38 -0400
X-MC-Unique: U33Q-ikwPjicssp9KUJUIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEB20801B15;
	Wed,  5 May 2021 16:34:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0F385D703;
	Wed,  5 May 2021 16:34:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE53055346;
	Wed,  5 May 2021 16:34:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 145GYXB9032006 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 5 May 2021 12:34:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0CDEA1054F96; Wed,  5 May 2021 16:34:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 094DE10547E8
	for <cluster-devel@redhat.com>; Wed,  5 May 2021 16:34:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6915106655E
	for <cluster-devel@redhat.com>; Wed,  5 May 2021 16:34:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-473-ccYuziZZPAmxcCPgoNUi2A-1;
	Wed, 05 May 2021 12:34:25 -0400
X-MC-Unique: ccYuziZZPAmxcCPgoNUi2A-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4AE2F6157F;
	Wed,  5 May 2021 16:34:22 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed,  5 May 2021 12:32:35 -0400
Message-Id: <20210505163413.3461611-6-sashal@kernel.org>
In-Reply-To: <20210505163413.3461611-1-sashal@kernel.org>
References: <20210505163413.3461611-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 145GYXB9032006
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.11 006/104] fs: dlm: add check if
	dlm is currently running
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8bit

From: Alexander Aring <aahringo@redhat.com>

[ Upstream commit 517461630d1c25ee4dfc1dee80973a64189d6ccf ]

This patch adds checks for dlm config attributes regarding to protocol
parameters as it makes only sense to change them when dlm is not running.
It also adds a check for valid protocol specifiers and return invalid
argument if they are not supported.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/dlm/config.c   | 34 ++++++++++++++++++++++++++++++++--
 fs/dlm/lowcomms.c |  2 +-
 fs/dlm/lowcomms.h |  3 +++
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 8439610c266a..88d95d96e36c 100644
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
index 440dce99d0d9..c438ce0ac115 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -135,7 +135,7 @@ static DEFINE_SPINLOCK(dlm_node_addrs_spin);
 static struct listen_connection listen_con;
 static struct sockaddr_storage *dlm_local_addr[DLM_MAX_ADDR_COUNT];
 static int dlm_local_count;
-static int dlm_allow_conn;
+int dlm_allow_conn;
 
 /* Work queues */
 static struct workqueue_struct *recv_workqueue;
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 790d6703b17e..bcd4dbd1dc98 100644
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
2.30.2


