Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 572AE329484
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Mar 2021 23:05:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614636344;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/hUzGy9d1tHQqfl/ZrcSFL9RQcsRpvPZB3rIv2IsCqM=;
	b=RdRtHRLURU/Dwl7TcwoZRJrIlknaFSUpjLPycq2RDy5bIRn5c7ZVIHJaU7811DkEoOzUgK
	5PtE3Lzfz1k47kS2tjtyf1kL5slWZn7FMgywRSvizUcOpxZik7zAuM0W4Jmm90IViPvBqn
	01QJjVNdcj2SC+YlVphUtGdIVXXw1gc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-cZHium4NOzuKhVd5GQ4W2g-1; Mon, 01 Mar 2021 17:05:41 -0500
X-MC-Unique: cZHium4NOzuKhVd5GQ4W2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAE3310CE789;
	Mon,  1 Mar 2021 22:05:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9CD95D768;
	Mon,  1 Mar 2021 22:05:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 562D757DFD;
	Mon,  1 Mar 2021 22:05:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 121M5YFw005960 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Mar 2021 17:05:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B310B10013D7; Mon,  1 Mar 2021 22:05:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-35.rdu2.redhat.com [10.10.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D31210013C1;
	Mon,  1 Mar 2021 22:05:34 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  1 Mar 2021 17:05:16 -0500
Message-Id: <20210301220520.514470-10-aahringo@redhat.com>
In-Reply-To: <20210301220520.514470-1-aahringo@redhat.com>
References: <20210301220520.514470-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 09/13] fs: dlm: simplify
	writequeue handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch cleans up the current dlm sending allocator handling by using
some named macros, list functionality and removes some goto statements.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 83 ++++++++++++++++++++++++-----------------------
 1 file changed, 43 insertions(+), 40 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 97d0c93dd644..a97c69ddbff0 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -102,6 +102,9 @@ struct listen_connection {
 	struct work_struct rwork;
 };
 
+#define DLM_WQ_REMAIN_BYTES(e) (PAGE_SIZE - e->end)
+#define DLM_WQ_LENGTH_BYTES(e) (e->end - e->offset)
+
 /* An entry waiting to be sent */
 struct writequeue_entry {
 	struct list_head list;
@@ -1351,7 +1354,7 @@ static struct writequeue_entry *new_writequeue_entry(struct connection *con,
 {
 	struct writequeue_entry *entry;
 
-	entry = kmalloc(sizeof(struct writequeue_entry), allocation);
+	entry = kzalloc(sizeof(*entry), allocation);
 	if (!entry)
 		return NULL;
 
@@ -1361,20 +1364,48 @@ static struct writequeue_entry *new_writequeue_entry(struct connection *con,
 		return NULL;
 	}
 
-	entry->offset = 0;
-	entry->len = 0;
-	entry->end = 0;
-	entry->users = 0;
 	entry->con = con;
+	entry->users = 1;
 
 	return entry;
 }
 
+static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
+					     gfp_t allocation, char **ppc)
+{
+	struct writequeue_entry *e;
+
+	spin_lock(&con->writequeue_lock);
+	if (!list_empty(&con->writequeue)) {
+		e = list_last_entry(&con->writequeue, struct writequeue_entry, list);
+		if (DLM_WQ_REMAIN_BYTES(e) >= len) {
+			*ppc = page_address(e->page) + e->end;
+			e->end += len;
+			e->users++;
+			spin_unlock(&con->writequeue_lock);
+
+			return e;
+		}
+	}
+	spin_unlock(&con->writequeue_lock);
+
+	e = new_writequeue_entry(con, allocation);
+	if (!e)
+		return NULL;
+
+	*ppc = page_address(e->page);
+	e->end += len;
+
+	spin_lock(&con->writequeue_lock);
+	list_add_tail(&e->list, &con->writequeue);
+	spin_unlock(&con->writequeue_lock);
+
+	return e;
+};
+
 void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
 {
 	struct connection *con;
-	struct writequeue_entry *e;
-	int offset = 0;
 
 	if (len > DEFAULT_BUFFER_SIZE ||
 	    len < sizeof(struct dlm_header)) {
@@ -1388,35 +1419,7 @@ void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
 	if (!con)
 		return NULL;
 
-	spin_lock(&con->writequeue_lock);
-	e = list_entry(con->writequeue.prev, struct writequeue_entry, list);
-	if ((&e->list == &con->writequeue) ||
-	    (PAGE_SIZE - e->end < len)) {
-		e = NULL;
-	} else {
-		offset = e->end;
-		e->end += len;
-		e->users++;
-	}
-	spin_unlock(&con->writequeue_lock);
-
-	if (e) {
-	got_one:
-		*ppc = page_address(e->page) + offset;
-		return e;
-	}
-
-	e = new_writequeue_entry(con, allocation);
-	if (e) {
-		spin_lock(&con->writequeue_lock);
-		offset = e->end;
-		e->end += len;
-		e->users++;
-		list_add_tail(&e->list, &con->writequeue);
-		spin_unlock(&con->writequeue_lock);
-		goto got_one;
-	}
-	return NULL;
+	return new_wq_entry(con, len, allocation, ppc);
 }
 
 void dlm_lowcomms_commit_buffer(void *mh)
@@ -1429,7 +1432,8 @@ void dlm_lowcomms_commit_buffer(void *mh)
 	users = --e->users;
 	if (users)
 		goto out;
-	e->len = e->end - e->offset;
+
+	e->len = DLM_WQ_LENGTH_BYTES(e);
 	spin_unlock(&con->writequeue_lock);
 
 	queue_work(send_workqueue, &con->swork);
@@ -1455,11 +1459,10 @@ static void send_to_sock(struct connection *con)
 
 	spin_lock(&con->writequeue_lock);
 	for (;;) {
-		e = list_entry(con->writequeue.next, struct writequeue_entry,
-			       list);
-		if ((struct list_head *) e == &con->writequeue)
+		if (list_empty(&con->writequeue))
 			break;
 
+		e = list_first_entry(&con->writequeue, struct writequeue_entry, list);
 		len = e->len;
 		offset = e->offset;
 		BUG_ON(len == 0 && e->users == 0);
-- 
2.26.2

