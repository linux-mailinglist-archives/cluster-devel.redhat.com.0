Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 64A332E9F31
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Jan 2021 22:00:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609794050;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dnXCdOhlk4yBtMgRl+/QbvgKhPdIFJNcYVnwWvO51CY=;
	b=flirMNRHlASqN2dJFOeV/vKK6rH1yVmEOrkN583mXqK58Et6wkx80uYGSSI/KjAuhSpKCv
	nJIRNNAMF5Hbn3hGDM/nMm44xxsN5jIcbmUEbIVDKVJxPofXGX8YxjhkvDfcAtFzEXuFtJ
	8eX3pCdnsIJkj7UvQNct9q50hSwu3EQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-ZIgc6f8fO0K_fi9p2DSXVQ-1; Mon, 04 Jan 2021 16:00:48 -0500
X-MC-Unique: ZIgc6f8fO0K_fi9p2DSXVQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5843C180A098;
	Mon,  4 Jan 2021 21:00:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48CB760BFA;
	Mon,  4 Jan 2021 21:00:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 071815002D;
	Mon,  4 Jan 2021 21:00:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 104L0iH5003749 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 16:00:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7AEF0272AB; Mon,  4 Jan 2021 21:00:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-75.rdu2.redhat.com [10.10.115.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 055E4272AD;
	Mon,  4 Jan 2021 21:00:43 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Jan 2021 16:00:16 -0500
Message-Id: <20210104210024.233765-13-aahringo@redhat.com>
In-Reply-To: <20210104210024.233765-1-aahringo@redhat.com>
References: <20210104210024.233765-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 12/20] fs: dlm: add functionality
	to re-transmit a message
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

This patch introduces a irqsafe retransmit functionality for a lowcomms
message handle. It's just allocates a new buffer and transmit it again.
To avoid another connection look some refactor was done to make a new
buffer allocation with a preexisting connection pointer.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 54 +++++++++++++++++++++++++++++++++++------------
 fs/dlm/lowcomms.h |  1 +
 2 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index a84223b549ed..f021dfecff91 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1430,24 +1430,14 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 	return e;
 };
 
-void *dlm_lowcomms_new_buffer(int nodeid, int len, gfp_t allocation, char **ppc,
-			      void (*cb)(void *buf, void *priv), void *priv)
+static void *dlm_lowcomms_new_buffer_con(struct connection *con, int len,
+					 gfp_t allocation, char **ppc,
+					 void (*cb)(void *buf, void *priv),
+					 void *priv)
 {
 	struct writequeue_entry *e;
-	struct connection *con;
 	struct dlm_msg *msg;
 
-	if (len > DEFAULT_BUFFER_SIZE ||
-	    len < sizeof(struct dlm_header)) {
-		BUILD_BUG_ON(PAGE_SIZE < DEFAULT_BUFFER_SIZE);
-		log_print("failed to allocate a buffer of size %d", len);
-		return NULL;
-	}
-
-	con = nodeid2con(nodeid, allocation);
-	if (!con)
-		return NULL;
-
 	msg = kzalloc(sizeof(*msg), allocation);
 	if (!msg)
 		return NULL;
@@ -1467,6 +1457,25 @@ void *dlm_lowcomms_new_buffer(int nodeid, int len, gfp_t allocation, char **ppc,
 	return msg;
 }
 
+void *dlm_lowcomms_new_buffer(int nodeid, int len, gfp_t allocation, char **ppc,
+			      void (*cb)(void *buf, void *priv), void *priv)
+{
+	struct connection *con;
+
+	if (len > DEFAULT_BUFFER_SIZE ||
+	    len < sizeof(struct dlm_header)) {
+		BUILD_BUG_ON(PAGE_SIZE < DEFAULT_BUFFER_SIZE);
+		log_print("failed to allocate a buffer of size %d", len);
+		return NULL;
+	}
+
+	con = nodeid2con(nodeid, allocation);
+	if (!con)
+		return NULL;
+
+	return dlm_lowcomms_new_buffer_con(con, len, GFP_ATOMIC, ppc, cb, priv);
+}
+
 void dlm_lowcomms_commit_buffer(void *mh)
 {
 	struct dlm_msg *msg = mh;
@@ -1507,6 +1516,23 @@ void dlm_lowcomms_get_buffer(void *mh)
 	kref_get(&msg->ref);
 }
 
+/* irqsafe */
+void dlm_lowcomms_resend_buffer(void *mh)
+{
+	struct dlm_msg *msg = mh;
+	void *mh_new;
+	char *ppc;
+
+	mh_new = dlm_lowcomms_new_buffer_con(msg->entry->con, msg->len, GFP_ATOMIC,
+					     &ppc, NULL, NULL);
+	if (!mh_new)
+		return;
+
+	memcpy(ppc, msg->ppc, msg->len);
+	dlm_lowcomms_commit_buffer(mh_new);
+	dlm_lowcomms_put_buffer(mh_new);
+}
+
 /* Send a message */
 static void send_to_sock(struct connection *con)
 {
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 6417c5fca215..30924b6f03e1 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -28,6 +28,7 @@ int dlm_lowcomms_connect_node(int nodeid);
 int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len);
 void dlm_lowcomms_put_buffer(void *mh);
 void dlm_lowcomms_get_buffer(void *mh);
+void dlm_lowcomms_resend_buffer(void *mh);
 
 #endif				/* __LOWCOMMS_DOT_H__ */
 
-- 
2.26.2

