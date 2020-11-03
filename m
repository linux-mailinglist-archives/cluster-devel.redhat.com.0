Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 21CCD2A3827
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Nov 2020 02:04:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604365496;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yjlHWzSbCMt7f1gliD2sbKZwcDszBLBmmeVmmQQjYF0=;
	b=JZqwmKKQehCL5Yjpd22Y8LVStlAquv5dHpReu9GLHk+PRp/b3wEfzbl2RwH+4UyyJLg3rK
	R8k5/907b/NskxmYLZCThx5LOqw3nnpy5/UbSKABa2v+ddkdHEUxNPJH9wAvHZ383sSTWE
	/5i9kjU3VlhWpKmozreDYGjuF4ke7WM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-137grDRyM56-5NW2WDa8Rw-1; Mon, 02 Nov 2020 20:04:54 -0500
X-MC-Unique: 137grDRyM56-5NW2WDa8Rw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C2941006CA0;
	Tue,  3 Nov 2020 01:04:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEE695B4DE;
	Tue,  3 Nov 2020 01:04:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6B4979FF7;
	Tue,  3 Nov 2020 01:04:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A314jSf003528 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 20:04:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1DAB3177F9; Tue,  3 Nov 2020 01:04:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-45.rdu2.redhat.com [10.10.115.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8D365C22A;
	Tue,  3 Nov 2020 01:04:43 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  2 Nov 2020 20:04:21 -0500
Message-Id: <20201103010428.1009384-7-aahringo@redhat.com>
In-Reply-To: <20201103010428.1009384-1-aahringo@redhat.com>
References: <20201103010428.1009384-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 RESEND v5.10-rc2 06/13] fs: dlm: add
	helper for init connection
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will move the connection structure initialization into an
own function. This avoids cases to update the othercon initialization.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 67 ++++++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 193a4c91c4d8..30cd53fa2f77 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -170,29 +170,12 @@ static struct connection *__find_con(int nodeid)
 	return NULL;
 }
 
-/*
- * If 'allocation' is zero then we don't attempt to create a new
- * connection structure for this node.
- */
-static struct connection *nodeid2con(int nodeid, gfp_t alloc)
+static int dlm_con_init(struct connection *con, int nodeid)
 {
-	struct connection *con, *tmp;
-	int r;
-
-	con = __find_con(nodeid);
-	if (con || !alloc)
-		return con;
-
-	con = kzalloc(sizeof(*con), alloc);
-	if (!con)
-		return NULL;
-
 	con->rx_buflen = dlm_config.ci_buffer_size;
 	con->rx_buf = kmalloc(con->rx_buflen, GFP_NOFS);
-	if (!con->rx_buf) {
-		kfree(con);
-		return NULL;
-	}
+	if (!con->rx_buf)
+		return -ENOMEM;
 
 	con->nodeid = nodeid;
 	mutex_init(&con->sock_mutex);
@@ -211,6 +194,32 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 			con->rx_action = zerocon->rx_action;
 	}
 
+	return 0;
+}
+
+/*
+ * If 'allocation' is zero then we don't attempt to create a new
+ * connection structure for this node.
+ */
+static struct connection *nodeid2con(int nodeid, gfp_t alloc)
+{
+	struct connection *con, *tmp;
+	int r, ret;
+
+	con = __find_con(nodeid);
+	if (con || !alloc)
+		return con;
+
+	con = kzalloc(sizeof(*con), alloc);
+	if (!con)
+		return NULL;
+
+	ret = dlm_con_init(con, nodeid);
+	if (ret) {
+		kfree(con);
+		return NULL;
+	}
+
 	r = nodeid_hash(nodeid);
 
 	spin_lock(&connections_lock);
@@ -849,32 +858,20 @@ static int accept_from_sock(struct connection *con)
 				goto accept_err;
 			}
 
-			othercon->rx_buflen = dlm_config.ci_buffer_size;
-			othercon->rx_buf = kmalloc(othercon->rx_buflen, GFP_NOFS);
-			if (!othercon->rx_buf) {
-				mutex_unlock(&newcon->sock_mutex);
+			result = dlm_con_init(othercon, nodeid);
+			if (result < 0) {
 				kfree(othercon);
-				log_print("failed to allocate incoming socket receive buffer");
-				result = -ENOMEM;
 				goto accept_err;
 			}
 
-			othercon->nodeid = nodeid;
-			othercon->rx_action = receive_from_sock;
-			mutex_init(&othercon->sock_mutex);
-			INIT_LIST_HEAD(&othercon->writequeue);
-			spin_lock_init(&othercon->writequeue_lock);
-			INIT_WORK(&othercon->swork, process_send_sockets);
-			INIT_WORK(&othercon->rwork, process_recv_sockets);
-			init_waitqueue_head(&othercon->shutdown_wait);
 			set_bit(CF_IS_OTHERCON, &othercon->flags);
+			newcon->othercon = othercon;
 		} else {
 			/* close other sock con if we have something new */
 			close_connection(othercon, false, true, false);
 		}
 
 		mutex_lock_nested(&othercon->sock_mutex, 2);
-		newcon->othercon = othercon;
 		add_sock(newsock, othercon);
 		addcon = othercon;
 		mutex_unlock(&othercon->sock_mutex);
-- 
2.26.2

