Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 96CE5277403
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Sep 2020 16:32:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600957962;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3aqleiNiDytq/4sRcm/FCXZVasFtaU4ELZaY1hgjtz4=;
	b=UXW7wrhStCV+cCtv6SjSoIOreSyK2OEDOzxETI92zBlP8dk93P3tOvs9swDeWszFpaPWeQ
	0T9ePHAkQHeFCKj2OTLCDCnyuCUkPK9oRAATsadto1609DoCmtwYNO7KBlPLtR6qEXIhQT
	IWdOjYP9QJI9vCCwsT0yRN+6fbOHR2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-e5UiiZlHMEGm6zMV5wtvgQ-1; Thu, 24 Sep 2020 10:32:40 -0400
X-MC-Unique: e5UiiZlHMEGm6zMV5wtvgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D333104D3F5;
	Thu, 24 Sep 2020 14:32:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4920C19C66;
	Thu, 24 Sep 2020 14:32:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0A108C7A4;
	Thu, 24 Sep 2020 14:32:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OEWW5l000999 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 10:32:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EA4305D9D3; Thu, 24 Sep 2020 14:32:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-178.rdu2.redhat.com [10.10.114.178])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 621845D9D2;
	Thu, 24 Sep 2020 14:32:32 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 24 Sep 2020 10:31:23 -0400
Message-Id: <20200924143126.158629-3-aahringo@redhat.com>
In-Reply-To: <20200924143126.158629-1-aahringo@redhat.com>
References: <20200924143126.158629-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 2/5] fs: dlm: fix mark per nodeid
	setting
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch fixes to set per nodeid mark configuration for accepted
sockets as well. Before this patch only the listen socket mark value was
used for all accepted connections. This patch will ensure that the
cluster mark attribute value will be always used for all sockets, if a
per nodeid mark value is specified dlm will use this value for the
specific node.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c   | 16 ++++++++++------
 fs/dlm/config.h   |  2 +-
 fs/dlm/lowcomms.c | 12 ++++++------
 3 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index f33a7e4ae917b..ca4a9795afbe2 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -860,18 +860,22 @@ int dlm_comm_seq(int nodeid, uint32_t *seq)
 	return 0;
 }
 
-int dlm_comm_mark(int nodeid, unsigned int *mark)
+void dlm_comm_mark(int nodeid, unsigned int *mark)
 {
 	struct dlm_comm *cm;
 
 	cm = get_comm(nodeid);
-	if (!cm)
-		return -ENOENT;
+	if (!cm) {
+		*mark = dlm_config.ci_mark;
+		return;
+	}
 
-	*mark = cm->mark;
-	put_comm(cm);
+	if (cm->mark)
+		*mark = cm->mark;
+	else
+		*mark = dlm_config.ci_mark;
 
-	return 0;
+	put_comm(cm);
 }
 
 int dlm_our_nodeid(void)
diff --git a/fs/dlm/config.h b/fs/dlm/config.h
index f62996cad5616..3b284ae9aeebd 100644
--- a/fs/dlm/config.h
+++ b/fs/dlm/config.h
@@ -46,7 +46,7 @@ void dlm_config_exit(void);
 int dlm_config_nodes(char *lsname, struct dlm_config_node **nodes_out,
 		     int *count_out);
 int dlm_comm_seq(int nodeid, uint32_t *seq);
-int dlm_comm_mark(int nodeid, unsigned int *mark);
+void dlm_comm_mark(int nodeid, unsigned int *mark);
 int dlm_our_nodeid(void);
 int dlm_our_addr(struct sockaddr_storage *addr, int num);
 
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 24f5e55313d83..96f84541867c4 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -790,6 +790,7 @@ static int accept_from_sock(struct connection *con)
 	int nodeid;
 	struct connection *newcon;
 	struct connection *addcon;
+	unsigned int mark;
 
 	if (!dlm_allow_conn) {
 		return -1;
@@ -826,6 +827,9 @@ static int accept_from_sock(struct connection *con)
 		return -1;
 	}
 
+	dlm_comm_mark(nodeid, &mark);
+	sock_set_mark(newsock->sk, mark);
+
 	log_print("got connection from %d", nodeid);
 
 	/*  Check to see if we already have a connection to this node. This
@@ -971,9 +975,7 @@ static void sctp_connect_to_sock(struct connection *con)
 		return;
 	}
 
-	result = dlm_comm_mark(con->nodeid, &mark);
-	if (result < 0)
-		return;
+	dlm_comm_mark(con->nodeid, &mark);
 
 	mutex_lock(&con->sock_mutex);
 
@@ -1071,9 +1073,7 @@ static void tcp_connect_to_sock(struct connection *con)
 		return;
 	}
 
-	result = dlm_comm_mark(con->nodeid, &mark);
-	if (result < 0)
-		return;
+	dlm_comm_mark(con->nodeid, &mark);
 
 	mutex_lock(&con->sock_mutex);
 	if (con->retries++ > MAX_CONNECT_RETRIES)
-- 
2.26.2

