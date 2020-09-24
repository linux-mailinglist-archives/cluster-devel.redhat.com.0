Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5712A277402
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Sep 2020 16:32:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600957962;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C06wyDcZl+Lb9jLDuZ66cHZgU0KB+ebX5NYa4eLYZZg=;
	b=PcNZluC5SdfR0RQHvNhGKHQg3SuCsMOPHqdbQPJtuStg6HGXOsXNdqp3AdHVlJR7gekCdj
	Y9WZe7JWVDjzd7oOAPnZkVF6GklKcVb3nURzQ6yzicfkOv74JLtsh09fDrmGK+Jznjextl
	Tfj+sWUHLtLToFoFa4WxAtrnkRk3Qks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-SPNhBFlJMaa8ech0YGZwtQ-1; Thu, 24 Sep 2020 10:32:40 -0400
X-MC-Unique: SPNhBFlJMaa8ech0YGZwtQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD8166409A;
	Thu, 24 Sep 2020 14:32:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A23E873684;
	Thu, 24 Sep 2020 14:32:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F75C1826D2A;
	Thu, 24 Sep 2020 14:32:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OEWWPc000988 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 10:32:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FDC65D9F1; Thu, 24 Sep 2020 14:32:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-178.rdu2.redhat.com [10.10.114.178])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B5165D9D3;
	Thu, 24 Sep 2020 14:32:31 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 24 Sep 2020 10:31:22 -0400
Message-Id: <20200924143126.158629-2-aahringo@redhat.com>
In-Reply-To: <20200924143126.158629-1-aahringo@redhat.com>
References: <20200924143126.158629-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 1/5] fs: dlm: remove lock
	dependency warning
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

During my experiments to make dlm robust against tcpkill application I
was able to run sometimes in a circular lock dependency warning between
clusters_root.subsys.su_mutex and con->sock_mutex. We don't need to
held the sock_mutex when getting the mark value which held the
clusters_root.subsys.su_mutex. This patch moves the specific handling
just before the sock_mutex will be held.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 1bf1808bfa6b0..24f5e55313d83 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -971,6 +971,10 @@ static void sctp_connect_to_sock(struct connection *con)
 		return;
 	}
 
+	result = dlm_comm_mark(con->nodeid, &mark);
+	if (result < 0)
+		return;
+
 	mutex_lock(&con->sock_mutex);
 
 	/* Some odd races can cause double-connects, ignore them */
@@ -995,11 +999,6 @@ static void sctp_connect_to_sock(struct connection *con)
 	if (result < 0)
 		goto socket_err;
 
-	/* set skb mark */
-	result = dlm_comm_mark(con->nodeid, &mark);
-	if (result < 0)
-		goto bind_err;
-
 	sock_set_mark(sock->sk, mark);
 
 	con->rx_action = receive_from_sock;
@@ -1072,6 +1071,10 @@ static void tcp_connect_to_sock(struct connection *con)
 		return;
 	}
 
+	result = dlm_comm_mark(con->nodeid, &mark);
+	if (result < 0)
+		return;
+
 	mutex_lock(&con->sock_mutex);
 	if (con->retries++ > MAX_CONNECT_RETRIES)
 		goto out;
@@ -1086,11 +1089,6 @@ static void tcp_connect_to_sock(struct connection *con)
 	if (result < 0)
 		goto out_err;
 
-	/* set skb mark */
-	result = dlm_comm_mark(con->nodeid, &mark);
-	if (result < 0)
-		goto out_err;
-
 	sock_set_mark(sock->sk, mark);
 
 	memset(&saddr, 0, sizeof(saddr));
-- 
2.26.2

