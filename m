Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9324E1FBD4A
	for <lists+cluster-devel@lfdr.de>; Tue, 16 Jun 2020 19:48:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592329688;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4DCYLsTc8tKZR5x/PEell++URDBns45vORtQP5qqA8Q=;
	b=c6yTlPOnjlT4xT4dtoPAiIoXh3HRnm4zAm24+F1ExmV4sM1dRsuAcIHY+jq5N14NFsvq6A
	wnq8QbDLKhFxJisoUhOAdbTP3YLETtWJ81O4WgZBBwIN31sYZhoX+NW/enqFj4Mqnnb9lB
	3Of7bqTBjt0CNr5xQT3J1cNb79UtjFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-8HGrs30eN0SDbLvVYe0_wg-1; Tue, 16 Jun 2020 13:48:06 -0400
X-MC-Unique: 8HGrs30eN0SDbLvVYe0_wg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29FECE91D;
	Tue, 16 Jun 2020 17:48:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1276978911;
	Tue, 16 Jun 2020 17:48:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3A2F833CA;
	Tue, 16 Jun 2020 17:48:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GHm0JT015365 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 13:48:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4CC425C1C3; Tue, 16 Jun 2020 17:48:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-78.rdu2.redhat.com [10.10.114.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AFB515C1BD;
	Tue, 16 Jun 2020 17:47:59 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 16 Jun 2020 13:47:26 -0400
Message-Id: <20200616174727.34030-2-aahringo@redhat.com>
In-Reply-To: <20200616174727.34030-1-aahringo@redhat.com>
References: <20200616174727.34030-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND dlm-next 1/2] fs: dlm: set skb mark
	for listen socket
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch adds support to set the skb mark value for the DLM listen
tcp and sctp sockets. The mark value will be offered as cluster
configuration. At creation time of the listen socket it will be set as
socket option.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c   |  6 ++++++
 fs/dlm/config.h   |  1 +
 fs/dlm/lowcomms.c | 16 ++++++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 3b21082e1b55..d74655cd6cd3 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -73,6 +73,7 @@ struct dlm_cluster {
 	unsigned int cl_log_debug;
 	unsigned int cl_log_info;
 	unsigned int cl_protocol;
+	unsigned int cl_mark;
 	unsigned int cl_timewarn_cs;
 	unsigned int cl_waitwarn_us;
 	unsigned int cl_new_rsb_count;
@@ -96,6 +97,7 @@ enum {
 	CLUSTER_ATTR_LOG_DEBUG,
 	CLUSTER_ATTR_LOG_INFO,
 	CLUSTER_ATTR_PROTOCOL,
+	CLUSTER_ATTR_MARK,
 	CLUSTER_ATTR_TIMEWARN_CS,
 	CLUSTER_ATTR_WAITWARN_US,
 	CLUSTER_ATTR_NEW_RSB_COUNT,
@@ -168,6 +170,7 @@ CLUSTER_ATTR(scan_secs, 1);
 CLUSTER_ATTR(log_debug, 0);
 CLUSTER_ATTR(log_info, 0);
 CLUSTER_ATTR(protocol, 0);
+CLUSTER_ATTR(mark, 0);
 CLUSTER_ATTR(timewarn_cs, 1);
 CLUSTER_ATTR(waitwarn_us, 0);
 CLUSTER_ATTR(new_rsb_count, 0);
@@ -183,6 +186,7 @@ static struct configfs_attribute *cluster_attrs[] = {
 	[CLUSTER_ATTR_LOG_DEBUG] = &cluster_attr_log_debug,
 	[CLUSTER_ATTR_LOG_INFO] = &cluster_attr_log_info,
 	[CLUSTER_ATTR_PROTOCOL] = &cluster_attr_protocol,
+	[CLUSTER_ATTR_MARK] = &cluster_attr_mark,
 	[CLUSTER_ATTR_TIMEWARN_CS] = &cluster_attr_timewarn_cs,
 	[CLUSTER_ATTR_WAITWARN_US] = &cluster_attr_waitwarn_us,
 	[CLUSTER_ATTR_NEW_RSB_COUNT] = &cluster_attr_new_rsb_count,
@@ -855,6 +859,7 @@ int dlm_our_addr(struct sockaddr_storage *addr, int num)
 #define DEFAULT_LOG_DEBUG          0
 #define DEFAULT_LOG_INFO           1
 #define DEFAULT_PROTOCOL           0
+#define DEFAULT_MARK               0
 #define DEFAULT_TIMEWARN_CS      500 /* 5 sec = 500 centiseconds */
 #define DEFAULT_WAITWARN_US	   0
 #define DEFAULT_NEW_RSB_COUNT    128
@@ -871,6 +876,7 @@ struct dlm_config_info dlm_config = {
 	.ci_log_debug = DEFAULT_LOG_DEBUG,
 	.ci_log_info = DEFAULT_LOG_INFO,
 	.ci_protocol = DEFAULT_PROTOCOL,
+	.ci_mark = DEFAULT_MARK,
 	.ci_timewarn_cs = DEFAULT_TIMEWARN_CS,
 	.ci_waitwarn_us = DEFAULT_WAITWARN_US,
 	.ci_new_rsb_count = DEFAULT_NEW_RSB_COUNT,
diff --git a/fs/dlm/config.h b/fs/dlm/config.h
index 2b471aae4e61..13508ec3ff5e 100644
--- a/fs/dlm/config.h
+++ b/fs/dlm/config.h
@@ -31,6 +31,7 @@ struct dlm_config_info {
 	int ci_log_debug;
 	int ci_log_info;
 	int ci_protocol;
+	int ci_mark;
 	int ci_timewarn_cs;
 	int ci_waitwarn_us;
 	int ci_new_rsb_count;
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index cdfaf4f0e11a..1bc32e728ba4 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1240,6 +1240,14 @@ static struct socket *tcp_create_listen_sock(struct connection *con,
 		goto create_out;
 	}
 
+	/* set skb mark */
+	result = kernel_setsockopt(sock, SOL_SOCKET, SO_MARK,
+				   (char *)&dlm_config.ci_mark,
+				   sizeof(dlm_config.ci_mark));
+	if (result < 0)
+		log_print("Failed to set SO_MARK value to %u",
+			  dlm_config.ci_mark);
+
 	/* Turn off Nagle's algorithm */
 	kernel_setsockopt(sock, SOL_TCP, TCP_NODELAY, (char *)&one,
 			  sizeof(one));
@@ -1324,6 +1332,14 @@ static int sctp_listen_for_all(void)
 		goto out;
 	}
 
+	/* set skb mark */
+	result = kernel_setsockopt(sock, SOL_SOCKET, SO_MARK,
+				   (char *)&dlm_config.ci_mark,
+				   sizeof(dlm_config.ci_mark));
+	if (result < 0)
+		log_print("Failed to set SO_MARK value to %u",
+			  dlm_config.ci_mark);
+
 	result = kernel_setsockopt(sock, SOL_SOCKET, SO_RCVBUFFORCE,
 				 (char *)&bufsize, sizeof(bufsize));
 	if (result)
-- 
2.26.2

