Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7C27E20B6F1
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Jun 2020 19:27:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593192434;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3Z0IXRyEpwBuOk7MlE0KV2NeB6CYqPOaO4j/ojLi/Bg=;
	b=C2UAN8HfCIaq2cDjuixMdRiJgm6O3qN6+uTh9Q9rUHbJWtnUiZNSxSPtUJDcrM/RpcYvML
	EosT1U0hDFExn0IB1ciNl/wVnOx/IBw4/kT03TpgkYxVgJ0pNEzB3ydPHKGYdkricq0dri
	kR7IuQvbO7P/OguPkMMyOl3yleuL7D0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-vrXYJ8bEOlC3Vjg7i8Ge6w-1; Fri, 26 Jun 2020 13:27:12 -0400
X-MC-Unique: vrXYJ8bEOlC3Vjg7i8Ge6w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58261107ACF4;
	Fri, 26 Jun 2020 17:27:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4913F5C1B2;
	Fri, 26 Jun 2020 17:27:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10A78875B4;
	Fri, 26 Jun 2020 17:27:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05QHR8bS019160 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 13:27:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9D4988FF97; Fri, 26 Jun 2020 17:27:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-78.rdu2.redhat.com [10.10.115.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE9B18FF83;
	Fri, 26 Jun 2020 17:27:06 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: davem@davemloft.net
Date: Fri, 26 Jun 2020 13:26:49 -0400
Message-Id: <20200626172650.115224-3-aahringo@redhat.com>
In-Reply-To: <20200626172650.115224-1-aahringo@redhat.com>
References: <20200626172650.115224-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: netdev@vger.kernel.org, cluster-devel@redhat.com, kuba@kernel.org
Subject: [Cluster-devel] [PATCHv2 dlm-next 2/3] fs: dlm: set skb mark for
	listen socket
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
 fs/dlm/config.c   | 6 ++++++
 fs/dlm/config.h   | 1 +
 fs/dlm/lowcomms.c | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index aee1be86adbdc..6dce6ec58d74f 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -73,6 +73,7 @@ struct dlm_cluster {
 	unsigned int cl_log_debug;
 	unsigned int cl_log_info;
 	unsigned int cl_protocol;
+	unsigned int cl_mark;
 	unsigned int cl_timewarn_cs;
 	unsigned int cl_waitwarn_us;
 	unsigned int cl_waitplock_recovery;
@@ -97,6 +98,7 @@ enum {
 	CLUSTER_ATTR_LOG_DEBUG,
 	CLUSTER_ATTR_LOG_INFO,
 	CLUSTER_ATTR_PROTOCOL,
+	CLUSTER_ATTR_MARK,
 	CLUSTER_ATTR_TIMEWARN_CS,
 	CLUSTER_ATTR_WAITWARN_US,
 	CLUSTER_ATTR_WAITPLOCK_RECOVERY,
@@ -170,6 +172,7 @@ CLUSTER_ATTR(scan_secs, 1);
 CLUSTER_ATTR(log_debug, 0);
 CLUSTER_ATTR(log_info, 0);
 CLUSTER_ATTR(protocol, 0);
+CLUSTER_ATTR(mark, 0);
 CLUSTER_ATTR(timewarn_cs, 1);
 CLUSTER_ATTR(waitwarn_us, 0);
 CLUSTER_ATTR(waitplock_recovery, 0);
@@ -186,6 +189,7 @@ static struct configfs_attribute *cluster_attrs[] = {
 	[CLUSTER_ATTR_LOG_DEBUG] = &cluster_attr_log_debug,
 	[CLUSTER_ATTR_LOG_INFO] = &cluster_attr_log_info,
 	[CLUSTER_ATTR_PROTOCOL] = &cluster_attr_protocol,
+	[CLUSTER_ATTR_MARK] = &cluster_attr_mark,
 	[CLUSTER_ATTR_TIMEWARN_CS] = &cluster_attr_timewarn_cs,
 	[CLUSTER_ATTR_WAITWARN_US] = &cluster_attr_waitwarn_us,
 	[CLUSTER_ATTR_WAITPLOCK_RECOVERY] = &cluster_attr_waitplock_recovery,
@@ -859,6 +863,7 @@ int dlm_our_addr(struct sockaddr_storage *addr, int num)
 #define DEFAULT_LOG_DEBUG          0
 #define DEFAULT_LOG_INFO           1
 #define DEFAULT_PROTOCOL           0
+#define DEFAULT_MARK               0
 #define DEFAULT_TIMEWARN_CS      500 /* 5 sec = 500 centiseconds */
 #define DEFAULT_WAITWARN_US	   0
 #define DEFAULT_WAITPLOCK_RECOVERY 0
@@ -876,6 +881,7 @@ struct dlm_config_info dlm_config = {
 	.ci_log_debug = DEFAULT_LOG_DEBUG,
 	.ci_log_info = DEFAULT_LOG_INFO,
 	.ci_protocol = DEFAULT_PROTOCOL,
+	.ci_mark = DEFAULT_MARK,
 	.ci_timewarn_cs = DEFAULT_TIMEWARN_CS,
 	.ci_waitwarn_us = DEFAULT_WAITWARN_US,
 	.ci_waitplock_recovery = DEFAULT_WAITPLOCK_RECOVERY,
diff --git a/fs/dlm/config.h b/fs/dlm/config.h
index 0cf824367668c..bc94123ac305a 100644
--- a/fs/dlm/config.h
+++ b/fs/dlm/config.h
@@ -31,6 +31,7 @@ struct dlm_config_info {
 	int ci_log_debug;
 	int ci_log_info;
 	int ci_protocol;
+	int ci_mark;
 	int ci_timewarn_cs;
 	int ci_waitwarn_us;
 	int ci_waitplock_recovery;
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 3543a8fec9075..eaedad7d069a8 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1111,6 +1111,8 @@ static struct socket *tcp_create_listen_sock(struct connection *con,
 		goto create_out;
 	}
 
+	sock_set_mark(sock->sk, dlm_config.ci_mark);
+
 	/* Turn off Nagle's algorithm */
 	tcp_sock_set_nodelay(sock->sk);
 
@@ -1185,6 +1187,7 @@ static int sctp_listen_for_all(void)
 	}
 
 	sock_set_rcvbuf(sock->sk, NEEDED_RMEM);
+	sock_set_mark(sock->sk, dlm_config.ci_mark);
 	sctp_sock_set_nodelay(sock->sk);
 
 	write_lock_bh(&sock->sk->sk_callback_lock);
-- 
2.26.2

