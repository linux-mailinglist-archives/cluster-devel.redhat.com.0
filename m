Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AC3BF38CDFC
	for <lists+cluster-devel@lfdr.de>; Fri, 21 May 2021 21:09:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621624168;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T1NMvr9+RvCYlLixu6OyXtdrIG1ma2aDuYnIFa+qKAI=;
	b=HPJdxaCir49rQcKJL1Od1cgSri3EJepD1cT1EHOy0k6J5giOnKZDIP2V93hnkQVqiobLIT
	0yDBFflmGAxA0luGwHjucAaPNlHXD7KShrD4qsSNPCwcBtQBnPVinYS2+J1nVIGyJjby3j
	AQLxJhUPtmjH185ZUy9e3scp3U/MKhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-b_ZIDBZXOWaPpydxkjWPmw-1; Fri, 21 May 2021 15:09:26 -0400
X-MC-Unique: b_ZIDBZXOWaPpydxkjWPmw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B07B0801817;
	Fri, 21 May 2021 19:09:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A38EE7012E;
	Fri, 21 May 2021 19:09:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8DFCC18095C4;
	Fri, 21 May 2021 19:09:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14LJ9Mis005293 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 May 2021 15:09:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A99595C648; Fri, 21 May 2021 19:09:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-19.rdu2.redhat.com [10.10.115.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 215535C1BB;
	Fri, 21 May 2021 19:09:22 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 21 May 2021 15:08:48 -0400
Message-Id: <20210521190848.350176-17-aahringo@redhat.com>
In-Reply-To: <20210521190848.350176-1-aahringo@redhat.com>
References: <20210521190848.350176-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv6 v5.13-rc1 dlm/next 16/16] fs: dlm: don't
	allow half transmitted messages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will clean a dirty page buffer if a reconnect occurs. If a page
buffer was half transmitted we cannot start inside the middle of a dlm
message if a node connects again. I observed invalid length receptions
errors and was guessing that this behaviour occurs, after this patch I
never saw an invalid message length again. This patch might drops more
messages for dlm version 3.1 but 3.1 can't deal with half messages as
well, for 3.2 it might trigger more re-transmissions but will not leave dlm
in a broken state.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 95 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 35 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index fe9113bd5ba0..36adccc4f849 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -118,6 +118,7 @@ struct writequeue_entry {
 	int len;
 	int end;
 	int users;
+	bool dirty;
 	struct connection *con;
 	struct list_head msgs;
 	struct kref ref;
@@ -700,6 +701,42 @@ static void make_sockaddr(struct sockaddr_storage *saddr, uint16_t port,
 	memset((char *)saddr + *addr_len, 0, sizeof(struct sockaddr_storage) - *addr_len);
 }
 
+static void dlm_page_release(struct kref *kref)
+{
+	struct writequeue_entry *e = container_of(kref, struct writequeue_entry,
+						  ref);
+
+	__free_page(e->page);
+	kfree(e);
+}
+
+static void dlm_msg_release(struct kref *kref)
+{
+	struct dlm_msg *msg = container_of(kref, struct dlm_msg, ref);
+
+	kref_put(&msg->entry->ref, dlm_page_release);
+	kfree(msg);
+}
+
+static void free_entry(struct writequeue_entry *e)
+{
+	struct dlm_msg *msg, *tmp;
+
+	list_for_each_entry_safe(msg, tmp, &e->msgs, list) {
+		if (msg->orig_msg) {
+			msg->orig_msg->retransmit = false;
+			kref_put(&msg->orig_msg->ref, dlm_msg_release);
+		}
+
+		list_del(&msg->list);
+		kref_put(&msg->ref, dlm_msg_release);
+	}
+
+	list_del(&e->list);
+	atomic_dec(&e->con->writequeue_cnt);
+	kref_put(&e->ref, dlm_page_release);
+}
+
 static void dlm_close_sock(struct socket **sock)
 {
 	if (*sock) {
@@ -714,6 +751,7 @@ static void close_connection(struct connection *con, bool and_other,
 			     bool tx, bool rx)
 {
 	bool closing = test_and_set_bit(CF_CLOSING, &con->flags);
+	struct writequeue_entry *e;
 
 	if (tx && !closing && cancel_work_sync(&con->swork)) {
 		log_print("canceled swork for node %d", con->nodeid);
@@ -732,6 +770,26 @@ static void close_connection(struct connection *con, bool and_other,
 		close_connection(con->othercon, false, tx, rx);
 	}
 
+	/* if we send a writequeue entry only a half way, we drop the
+	 * whole entry because reconnection and that we not start of the
+	 * middle of a msg which will confuse the other end.
+	 *
+	 * we can always drop messages because retransmits, but what we
+	 * cannot allow is to transmit half messages which may be processed
+	 * at the other side.
+	 *
+	 * our policy is to start on a clean state when disconnects, we don't
+	 * know what's send/received on transport layer in this case.
+	 */
+	spin_lock(&con->writequeue_lock);
+	if (!list_empty(&con->writequeue)) {
+		e = list_first_entry(&con->writequeue, struct writequeue_entry,
+				     list);
+		if (e->dirty)
+			free_entry(e);
+	}
+	spin_unlock(&con->writequeue_lock);
+
 	con->rx_leftover = 0;
 	con->retries = 0;
 	clear_bit(CF_CONNECTED, &con->flags);
@@ -1026,41 +1084,6 @@ static int accept_from_sock(struct listen_connection *con)
 	return result;
 }
 
-static void dlm_page_release(struct kref *kref)
-{
-	struct writequeue_entry *e = container_of(kref, struct writequeue_entry,
-						  ref);
-
-	__free_page(e->page);
-	kfree(e);
-}
-
-static void dlm_msg_release(struct kref *kref)
-{
-	struct dlm_msg *msg = container_of(kref, struct dlm_msg, ref);
-
-	kref_put(&msg->entry->ref, dlm_page_release);
-	kfree(msg);
-}
-
-static void free_entry(struct writequeue_entry *e)
-{
-	struct dlm_msg *msg, *tmp;
-
-	list_for_each_entry_safe(msg, tmp, &e->msgs, list) {
-		if (msg->orig_msg) {
-			msg->orig_msg->retransmit = false;
-			kref_put(&msg->orig_msg->ref, dlm_msg_release);
-		}
-		list_del(&msg->list);
-		kref_put(&msg->ref, dlm_msg_release);
-	}
-
-	list_del(&e->list);
-	atomic_dec(&e->con->writequeue_cnt);
-	kref_put(&e->ref, dlm_page_release);
-}
-
 /*
  * writequeue_entry_complete - try to delete and free write queue entry
  * @e: write queue entry to try to delete
@@ -1072,6 +1095,8 @@ static void writequeue_entry_complete(struct writequeue_entry *e, int completed)
 {
 	e->offset += completed;
 	e->len -= completed;
+	/* signal that page was half way transmitted */
+	e->dirty = true;
 
 	if (e->len == 0 && e->users == 0)
 		free_entry(e);
-- 
2.26.3

