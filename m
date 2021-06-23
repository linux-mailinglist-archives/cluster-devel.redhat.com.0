Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 19F893B1D77
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Jun 2021 17:17:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624461421;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oViLkBUUkx5+k5Pjt9/hNfiMRQsP661XQP2kRTu+vEY=;
	b=DNFMlGLbukUKA9OGgDLvLZzpxJYVFuSjLBxighvpLvNT+Z3+GkNBncxdAJzuZ7Buxbao4x
	jpSDV+VAiCa8bWsiWB66PjmSosmYUWVxUdOrVvyCAM/RZv1vXbJVA+q5NcyXb/C9I2UfR6
	/mUcUb3iFkd6trdgvM/aERSq9EJpDO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-Sf83NuhyMQyjVbSpKP1yww-1; Wed, 23 Jun 2021 11:16:58 -0400
X-MC-Unique: Sf83NuhyMQyjVbSpKP1yww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50043192CC5F;
	Wed, 23 Jun 2021 15:16:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42F426EF59;
	Wed, 23 Jun 2021 15:16:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3049F18005A2;
	Wed, 23 Jun 2021 15:16:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15NFFgLm025036 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Jun 2021 11:15:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D375760E3A; Wed, 23 Jun 2021 15:15:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (unknown [10.22.8.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7544060C05;
	Wed, 23 Jun 2021 15:15:42 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Jun 2021 11:14:52 -0400
Message-Id: <20210623151454.176649-14-aahringo@redhat.com>
In-Reply-To: <20210623151454.176649-1-aahringo@redhat.com>
References: <20210623151454.176649-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC dlm/next 13/15] fs: dlm: move writequeue init
	to sendcon only
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

This patch inits only sendconf functionality to the sendcon and not
othercon. If we have make a mistake by accident we can see it when the
kernel crashes because the othercon was queued for transmitting which
should never be the case. Also add a comment about the othercon handling
and why it's there and how we could possible remove it with breaking
backwards compatibility.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 61 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 17 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index ddf3c0c98386..e858453b4eb7 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -40,6 +40,29 @@
  * cluster-wide mechanism as it must be the same on all nodes of the cluster
  * for the DLM to function.
  *
+ * TODO:
+ *
+ * Special note about the "othercon" field in connection structure. This is
+ * only set if we hit a race between two peers do connect() and accept() at
+ * the same time. If we don't accept the connection and close it the other
+ * peer will disconnect on it's non "othercon" connection which is known as
+ * "sendcon". It's named "sendcon" because it is a must that we only do
+ * sending over this connection. If we hit the race then the "othercon" is
+ * be used for receiving only. Calling a "ss -t" shows two connections in
+ * this case.
+ *
+ * Overall it makes this code a lot of confusion and the code tries to use
+ * only the "sendcon" as resource e.g. mutexes. As the race is only sometimes
+ * there moving "othercon" in it's own struct e.g. "struct connection_other"
+ * makes it difficult to deal with it when we don't hit the race and the
+ * receiving is done by "sendcon".
+ *
+ * There exists an idea by Steve Whitehouse to get rid of this race by
+ * introducing a priotize accept() rule e.g. $OWN_NODEID < $PEER_NODEID.
+ * If the condition is true we accept the node otherwise we trigger a reconnect
+ * to this peer (because the peer wants connect again). However this is not
+ * backwards compatible and will break the connection handling with the
+ * "othercon" handling.
  */
 
 #include <asm/ioctls.h>
@@ -283,16 +306,15 @@ static struct connection *__find_con(int nodeid, int r)
 
 static bool tcp_eof_condition(struct connection *con)
 {
+	if (test_bit(CF_IS_OTHERCON, &con->flags))
+		return false;
+
 	return atomic_read(&con->writequeue_cnt);
 }
 
 static void dlm_con_init(struct connection *con, int nodeid)
 {
 	con->nodeid = nodeid;
-	INIT_LIST_HEAD(&con->writequeue);
-	spin_lock_init(&con->writequeue_lock);
-	atomic_set(&con->writequeue_cnt, 0);
-	INIT_DELAYED_WORK(&con->swork, process_send_sockets);
 	INIT_WORK(&con->rwork, process_recv_sockets);
 	INIT_WORK(&con->cwork, process_close_sockets);
 	init_waitqueue_head(&con->shutdown_wait);
@@ -320,7 +342,12 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 
 	mutex_init(&con->rwork_lock);
 	mutex_init(&con->swork_lock);
+
 	mutex_init(&con->wq_alloc);
+	INIT_LIST_HEAD(&con->writequeue);
+	spin_lock_init(&con->writequeue_lock);
+	atomic_set(&con->writequeue_cnt, 0);
+	INIT_DELAYED_WORK(&con->swork, process_send_sockets);
 
 	mutex_init(&con->process_lock);
 	INIT_LIST_HEAD(&con->processqueue);
@@ -813,20 +840,23 @@ static void close_connection(struct connection *con, bool and_other)
 	 * our policy is to start on a clean state when disconnects, we don't
 	 * know what's send/received on transport layer in this case.
 	 */
-	spin_lock(&con->writequeue_lock);
-	if (!list_empty(&con->writequeue)) {
-		e = list_first_entry(&con->writequeue, struct writequeue_entry,
-				     list);
-		if (e->dirty)
-			free_entry(e);
+	if (!test_bit(CF_IS_OTHERCON, &con->flags)) {
+		spin_lock(&con->writequeue_lock);
+		if (!list_empty(&con->writequeue)) {
+			e = list_first_entry(&con->writequeue, struct writequeue_entry,
+					     list);
+			if (e->dirty)
+				free_entry(e);
+		}
+		spin_unlock(&con->writequeue_lock);
+
+		con->retries = 0;
+		clear_bit(CF_APP_LIMITED, &con->flags);
+		clear_bit(CF_EOF, &con->flags);
 	}
-	spin_unlock(&con->writequeue_lock);
 
 	con->rx_leftover = 0;
-	con->retries = 0;
-	clear_bit(CF_APP_LIMITED, &con->flags);
 	clear_bit(CF_CONNECTED, &con->flags);
-	clear_bit(CF_EOF, &con->flags);
 
 	/* handling for tcp shutdown */
 	clear_bit(CF_SHUTDOWN, &con->flags);
@@ -1544,8 +1574,6 @@ int dlm_lowcomms_close(int nodeid)
 		set_bit(CF_CLOSE, &con->flags);
 		cancel_io_work(con, true);
 		clean_one_writequeue(con);
-		if (con->othercon)
-			clean_one_writequeue(con->othercon);
 	}
 	srcu_read_unlock(&connections_srcu, idx);
 
@@ -1781,7 +1809,6 @@ static void free_conn(struct connection *con)
 	hlist_del_rcu(&con->list);
 	spin_unlock(&connections_lock);
 	if (con->othercon) {
-		clean_one_writequeue(con->othercon);
 		call_srcu(&connections_srcu, &con->othercon->rcu,
 			  connection_release);
 	}
-- 
2.26.3

