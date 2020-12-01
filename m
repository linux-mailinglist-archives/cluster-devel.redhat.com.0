Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 017972CA6A6
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Dec 2020 16:11:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606835485;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5RvLUrODkcaQSz+rYNJ7sfYVxLo+LQd/7vpuaXc5Y/c=;
	b=KELRXvc6kZR1G8oomSVX3eLyz5WvWgs1WGOksIYwak27b8RD8wKdAc+CB5ZDZgmFNlM+Jl
	6lfGZmWuk+MHcW/67loelHFLDJiExyOrr+QxWxNITtHzA6wGSYGRNTFFrS3ErYEv8B8MwY
	H3EhoDGyW9y8sZ9QvpzppxrNweH5Kds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-usIHlTbkOUG93mADoGikuw-1; Tue, 01 Dec 2020 10:11:22 -0500
X-MC-Unique: usIHlTbkOUG93mADoGikuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3F27805C01;
	Tue,  1 Dec 2020 15:11:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0E2419C71;
	Tue,  1 Dec 2020 15:11:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8E921809CA1;
	Tue,  1 Dec 2020 15:11:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B1FAUBe019737 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 1 Dec 2020 10:10:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 458EC5D71D; Tue,  1 Dec 2020 15:10:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-202.rdu2.redhat.com [10.10.114.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE91E5D6AB;
	Tue,  1 Dec 2020 15:10:29 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  1 Dec 2020 10:09:57 -0500
Message-Id: <20201201150957.115068-18-aahringo@redhat.com>
In-Reply-To: <20201201150957.115068-1-aahringo@redhat.com>
References: <20201201150957.115068-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 17/17] fs: dlm: don't allow half
	transmitted messages
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
 fs/dlm/lowcomms.c | 84 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 54 insertions(+), 30 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 9a3899ad1765..4a34fa0b5345 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -112,6 +112,7 @@ struct writequeue_entry {
 	int len;
 	int end;
 	int users;
+	bool dirty;
 	struct connection *con;
 	struct list_head msgs;
 	struct kref ref;
@@ -647,6 +648,36 @@ static void make_sockaddr(struct sockaddr_storage *saddr, uint16_t port,
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
+		list_del(&msg->list);
+		kref_put(&msg->ref, dlm_msg_release);
+	}
+
+	list_del(&e->list);
+	kref_put(&e->ref, dlm_page_release);
+}
+
 static void dlm_close_sock(struct socket **sock)
 {
 	if (*sock) {
@@ -661,6 +692,7 @@ static void close_connection(struct connection *con, bool and_other,
 			     bool tx, bool rx)
 {
 	bool closing = test_and_set_bit(CF_CLOSING, &con->flags);
+	struct writequeue_entry *e;
 
 	if (tx && !closing && cancel_work_sync(&con->swork)) {
 		log_print("canceled swork for node %d", con->nodeid);
@@ -679,6 +711,26 @@ static void close_connection(struct connection *con, bool and_other,
 		close_connection(con->othercon, false, true, true);
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
+	spin_lock_bh(&con->writequeue_lock);
+	if (!list_empty(&con->writequeue)) {
+		e = list_first_entry(&con->writequeue, struct writequeue_entry,
+				     list);
+		if (e->dirty)
+			free_entry(e);
+	}
+	spin_unlock_bh(&con->writequeue_lock);
+
 	con->rx_leftover = 0;
 	con->retries = 0;
 	clear_bit(CF_CONNECTED, &con->flags);
@@ -958,36 +1010,6 @@ static int accept_from_sock(struct listen_connection *con)
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
-		list_del(&msg->list);
-		kref_put(&msg->ref, dlm_msg_release);
-	}
-
-	list_del(&e->list);
-	kref_put(&e->ref, dlm_page_release);
-}
-
 /*
  * writequeue_entry_complete - try to delete and free write queue entry
  * @e: write queue entry to try to delete
@@ -999,6 +1021,8 @@ static void writequeue_entry_complete(struct writequeue_entry *e, int completed)
 {
 	e->offset += completed;
 	e->len -= completed;
+	/* signal that page was half way transmitted */
+	e->dirty = true;
 
 	if (e->len == 0 && e->users == 0)
 		free_entry(e);
-- 
2.26.2

