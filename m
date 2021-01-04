Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E36252E9F32
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Jan 2021 22:00:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609794052;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mCf2g4+n9Vy0xVk3QyjMVNuKBQhw07I+leY3J/4K5LQ=;
	b=AopsHgYEpy0usCD3sWsGVlT5D1m3FRS7FCthY8iEO6a8bGFjNPpS5n3bDdQv5iIa0pQKdJ
	9B9G/fr6++g4yltna8t3dmi2eKuT2HM4O0ZLo3+41S2u7mwNLrs9F5x8TBwMQWAIODOTry
	h9rTjC4c67TjvclWgEp2zR2eoYKXviA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-dGlTSpiLMGuiLWEtLpmyzA-1; Mon, 04 Jan 2021 16:00:50 -0500
X-MC-Unique: dGlTSpiLMGuiLWEtLpmyzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88FD7C73A9;
	Mon,  4 Jan 2021 21:00:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 765041001281;
	Mon,  4 Jan 2021 21:00:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B7AE1809CA1;
	Mon,  4 Jan 2021 21:00:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 104L0jsD003757 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 16:00:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 43480271A4; Mon,  4 Jan 2021 21:00:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-75.rdu2.redhat.com [10.10.115.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A572B2719F;
	Mon,  4 Jan 2021 21:00:44 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Jan 2021 16:00:17 -0500
Message-Id: <20210104210024.233765-14-aahringo@redhat.com>
In-Reply-To: <20210104210024.233765-1-aahringo@redhat.com>
References: <20210104210024.233765-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 13/20] fs: dlm: move out some
	hash functionality
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index f021dfecff91..9a3899ad1765 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -59,7 +59,6 @@
 #include "config.h"
 
 #define NEEDED_RMEM (4*1024*1024)
-#define CONN_HASH_SIZE 32
 
 /* Number of messages to send before rescheduling */
 #define MAX_SEND_MSG_COUNT 25
@@ -165,14 +164,6 @@ static void sctp_connect_to_sock(struct connection *con);
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
index 30924b6f03e1..8286531f9a9e 100644
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

