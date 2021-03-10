Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CF57C3347C3
	for <lists+cluster-devel@lfdr.de>; Wed, 10 Mar 2021 20:18:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615403889;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rMKFnMNfW4SZp1BdXs7Dhknk//hGF94WxpAUqMcZ5YY=;
	b=MYrlW4jqjK/ZQGWMZoWuo2wFU+XgJxtcT/3V2C4apbE2GmV1yOapfRkFLfYFX5ws4vjqgg
	5ZX8WYoBolvk0DbjRP3OrX3hfiK5RfeAwdkLbrkiR7m/n9aUwHNR4mnfgDm0wO1juqeffO
	EauVfqTH5q0QZ0/J0xI4pv/by0gDLp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-FQTYmVM4PRC0j1a14cL7mQ-1; Wed, 10 Mar 2021 14:18:07 -0500
X-MC-Unique: FQTYmVM4PRC0j1a14cL7mQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA9E619057B7;
	Wed, 10 Mar 2021 19:18:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB5FB59450;
	Wed, 10 Mar 2021 19:18:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A539F57DC2;
	Wed, 10 Mar 2021 19:18:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12AJI09q004791 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 10 Mar 2021 14:18:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 90D5A1042A6C; Wed, 10 Mar 2021 19:18:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-190.rdu2.redhat.com [10.10.114.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFE741002F12;
	Wed, 10 Mar 2021 19:17:59 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 10 Mar 2021 14:17:42 -0500
Message-Id: <20210310191745.80824-6-aahringo@redhat.com>
In-Reply-To: <20210310191745.80824-1-aahringo@redhat.com>
References: <20210310191745.80824-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com, gnault@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 5/8] fs: dlm: move out some hash
	functionality
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch moves out some lowcomms hash functionality into lowcomms
header to provide them to other layers like midcomms as well.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c |  9 ---------
 fs/dlm/lowcomms.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index d2be58496fd0..5cb6d7c9ddc1 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -59,7 +59,6 @@
 #include "config.h"
 
 #define NEEDED_RMEM (4*1024*1024)
-#define CONN_HASH_SIZE 32
 
 /* Number of messages to send before rescheduling */
 #define MAX_SEND_MSG_COUNT 25
@@ -166,14 +165,6 @@ static void sctp_connect_to_sock(struct connection *con);
 static void tcp_connect_to_sock(struct connection *con);
 static void dlm_tcp_shutdown(struct connection *con);
 
-/* This is deliberately very simple because most clusters have simple
-   sequential nodeids, so we should be able to go straight to a connection
-   struct in the array */
-static inline int nodeid_hash(int nodeid)
-{
-	return nodeid & (CONN_HASH_SIZE-1);
-}
-
 static struct connection *__find_con(int nodeid)
 {
 	int r, idx;
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 345aed7e00cc..cacfc5620f54 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -13,6 +13,16 @@
 #define __LOWCOMMS_DOT_H__
 
 #define LOWCOMMS_MAX_TX_BUFFER_LEN	4096
+#define CONN_HASH_SIZE 32
+
+/* This is deliberately very simple because most clusters have simple
+ * sequential nodeids, so we should be able to go straight to a connection
+ * struct in the array
+ */
+static inline int nodeid_hash(int nodeid)
+{
+	return nodeid & (CONN_HASH_SIZE-1);
+}
 
 /* switch to check if dlm is running */
 extern int dlm_allow_conn;
-- 
2.26.2

