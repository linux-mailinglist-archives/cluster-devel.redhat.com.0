Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD9F35A175
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Apr 2021 16:49:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617979761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LAf69NYFEU8TfpMy4aW8qXPWZhx237npuUrW4zTotAs=;
	b=PYeEgGXF016ar5NHj0r/mL73mlB6Yzza+NL6eC5djGBN47x0pCsJLTosB3WR6fUMDaPpnQ
	nWHlFWm7F99VhcRJjg6MCWsO+rVL5Xqdb0UYlvgkMtAyNhksfRt6aYtLHoWQBQITReMDW5
	zIMzu/7/Ltkx2rD1Ypns2Rg7fBslR50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-6dCf1qi5NiWJ7x9bg8LWew-1; Fri, 09 Apr 2021 10:49:19 -0400
X-MC-Unique: 6dCf1qi5NiWJ7x9bg8LWew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB3AB8710F4;
	Fri,  9 Apr 2021 14:49:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACD396A97E;
	Fri,  9 Apr 2021 14:49:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9415055348;
	Fri,  9 Apr 2021 14:49:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139EnC51022725 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 10:49:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1AB5B6EF4F; Fri,  9 Apr 2021 14:49:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AB6D14106;
	Fri,  9 Apr 2021 14:49:11 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri,  9 Apr 2021 10:48:55 -0400
Message-Id: <20210409144859.48385-5-aahringo@redhat.com>
In-Reply-To: <20210409144859.48385-1-aahringo@redhat.com>
References: <20210409144859.48385-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com, gnault@redhat.com
Subject: [Cluster-devel] [PATCHv4 dlm/next 4/8] fs: dlm: add functionality
	to re-transmit a message
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch introduces a retransmit functionality for a lowcomms message
handle. It's just allocates a new buffer and transmit it again, no
special handling about prioritize it because keeping bytestream in order.

To avoid another connection look some refactor was done to make a new
buffer allocation with a preexisting connection pointer.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 55 ++++++++++++++++++++++++++++++++++-------------
 fs/dlm/lowcomms.h |  1 +
 2 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index ade1a5266e4a..fb04448c4e48 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1447,25 +1447,14 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
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
-		WARN_ON(1);
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
@@ -1485,6 +1474,26 @@ void *dlm_lowcomms_new_buffer(int nodeid, int len, gfp_t allocation, char **ppc,
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
+		WARN_ON(1);
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
@@ -1525,6 +1534,22 @@ void dlm_lowcomms_get_buffer(void *mh)
 	kref_get(&msg->ref);
 }
 
+void dlm_lowcomms_resend_buffer(void *mh)
+{
+	struct dlm_msg *msg = mh;
+	void *mh_new;
+	char *ppc;
+
+	mh_new = dlm_lowcomms_new_buffer_con(msg->entry->con, msg->len,
+					     GFP_NOFS, &ppc, NULL, NULL);
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
index fa735497dad8..345aed7e00cc 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -30,6 +30,7 @@ int dlm_lowcomms_nodes_set_mark(int nodeid, unsigned int mark);
 int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len);
 void dlm_lowcomms_put_buffer(void *mh);
 void dlm_lowcomms_get_buffer(void *mh);
+void dlm_lowcomms_resend_buffer(void *mh);
 
 #endif				/* __LOWCOMMS_DOT_H__ */
 
-- 
2.26.3

