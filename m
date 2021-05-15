Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD4D3814A6
	for <lists+cluster-devel@lfdr.de>; Sat, 15 May 2021 02:36:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621038978;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c+alOye7LqSWvYAaXlBQ9yprPS2yCE9fnpg2lsrntpQ=;
	b=QQ3xJAzW/QIBgrRrDNvxnpSw+R1ZH/xP14IOCPgwfBwvhrT/MFDlnujIB2h6sRzXUfTtlP
	4f3hlnqHrM2qHowROQPIyb8mHJglep0TMhdAa+SttEl04Y8l5xa6ooZ9bGEedLqKNjJnZ3
	Creli88WTtebk52Zi6Kk+s/FvbimkgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-rmeZqqw1MVCYuuYBsGVW9w-1; Fri, 14 May 2021 20:36:16 -0400
X-MC-Unique: rmeZqqw1MVCYuuYBsGVW9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9C4380D69C;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8BC6131D2;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C13865534F;
	Sat, 15 May 2021 00:36:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14F0a8H0030907 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 14 May 2021 20:36:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E250376E; Sat, 15 May 2021 00:36:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-135.rdu2.redhat.com [10.10.115.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6A8F5D9E3;
	Sat, 15 May 2021 00:36:07 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 14 May 2021 20:35:44 -0400
Message-Id: <20210515003549.1118171-11-aahringo@redhat.com>
In-Reply-To: <20210515003549.1118171-1-aahringo@redhat.com>
References: <20210515003549.1118171-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv5 v5.13-rc1 dlm/next 10/15] fs: dlm: move
	out some hash functionality
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
index fd5d4f5c13cf..6c59bf4cc514 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -59,7 +59,6 @@
 #include "config.h"
 
 #define NEEDED_RMEM (4*1024*1024)
-#define CONN_HASH_SIZE 32
 
 /* Number of messages to send before rescheduling */
 #define MAX_SEND_MSG_COUNT 25
@@ -175,14 +174,6 @@ static void sctp_connect_to_sock(struct connection *con);
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
 static struct connection *__find_con(int nodeid, int r)
 {
 	struct connection *con;
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index a4384826442c..66dc1bb3de7f 100644
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
2.26.3

