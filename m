Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9C23BBF00
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Jul 2021 17:29:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-dWGv4ACmNTeqfQWJg9hGwg-1; Mon, 05 Jul 2021 11:28:59 -0400
X-MC-Unique: dWGv4ACmNTeqfQWJg9hGwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C997E800C78;
	Mon,  5 Jul 2021 15:28:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6287810372C0;
	Mon,  5 Jul 2021 15:28:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B3934EA2F;
	Mon,  5 Jul 2021 15:28:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 165FSk4N031846 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Jul 2021 11:28:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30CAA2023450; Mon,  5 Jul 2021 15:28:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2649B200C0C8
	for <cluster-devel@redhat.com>; Mon,  5 Jul 2021 15:28:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87D4E185A7A4
	for <cluster-devel@redhat.com>; Mon,  5 Jul 2021 15:28:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-171-oXoAs3qPPBWSXGvzxf7-8Q-1;
	Mon, 05 Jul 2021 11:28:38 -0400
X-MC-Unique: oXoAs3qPPBWSXGvzxf7-8Q-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0BE46197B;
	Mon,  5 Jul 2021 15:28:35 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon,  5 Jul 2021 11:27:31 -0400
Message-Id: <20210705152815.1520546-15-sashal@kernel.org>
In-Reply-To: <20210705152815.1520546-1-sashal@kernel.org>
References: <20210705152815.1520546-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.13 15/59] fs: dlm: fix srcu read
	lock usage
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Alexander Aring <aahringo@redhat.com>

[ Upstream commit b38bc9c2b3171f4411d80015ecb876bc6f9bcd26 ]

This patch holds the srcu connection read lock in cases where we lookup
the connections and accessing it. We don't hold the srcu lock in workers
function where the scheduled worker is part of the connection itself.
The connection should not be freed if any worker is scheduled or
pending.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/dlm/lowcomms.c | 75 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 52 insertions(+), 23 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 166e36fcf3e4..47bf99373f3e 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -113,6 +113,7 @@ struct writequeue_entry {
 	int len;
 	int end;
 	int users;
+	int idx; /* get()/commit() idx exchange */
 	struct connection *con;
 };
 
@@ -163,21 +164,14 @@ static inline int nodeid_hash(int nodeid)
 	return nodeid & (CONN_HASH_SIZE-1);
 }
 
-static struct connection *__find_con(int nodeid)
+static struct connection *__find_con(int nodeid, int r)
 {
-	int r, idx;
 	struct connection *con;
 
-	r = nodeid_hash(nodeid);
-
-	idx = srcu_read_lock(&connections_srcu);
 	hlist_for_each_entry_rcu(con, &connection_hash[r], list) {
-		if (con->nodeid == nodeid) {
-			srcu_read_unlock(&connections_srcu, idx);
+		if (con->nodeid == nodeid)
 			return con;
-		}
 	}
-	srcu_read_unlock(&connections_srcu, idx);
 
 	return NULL;
 }
@@ -216,7 +210,8 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 	struct connection *con, *tmp;
 	int r, ret;
 
-	con = __find_con(nodeid);
+	r = nodeid_hash(nodeid);
+	con = __find_con(nodeid, r);
 	if (con || !alloc)
 		return con;
 
@@ -230,8 +225,6 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 		return NULL;
 	}
 
-	r = nodeid_hash(nodeid);
-
 	spin_lock(&connections_lock);
 	/* Because multiple workqueues/threads calls this function it can
 	 * race on multiple cpu's. Instead of locking hot path __find_con()
@@ -239,7 +232,7 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 	 * under protection of connections_lock. If this is the case we
 	 * abort our connection creation and return the existing connection.
 	 */
-	tmp = __find_con(nodeid);
+	tmp = __find_con(nodeid, r);
 	if (tmp) {
 		spin_unlock(&connections_lock);
 		kfree(con->rx_buf);
@@ -256,15 +249,13 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 /* Loop round all connections */
 static void foreach_conn(void (*conn_func)(struct connection *c))
 {
-	int i, idx;
+	int i;
 	struct connection *con;
 
-	idx = srcu_read_lock(&connections_srcu);
 	for (i = 0; i < CONN_HASH_SIZE; i++) {
 		hlist_for_each_entry_rcu(con, &connection_hash[i], list)
 			conn_func(con);
 	}
-	srcu_read_unlock(&connections_srcu, idx);
 }
 
 static struct dlm_node_addr *find_node_addr(int nodeid)
@@ -518,14 +509,21 @@ static void lowcomms_state_change(struct sock *sk)
 int dlm_lowcomms_connect_node(int nodeid)
 {
 	struct connection *con;
+	int idx;
 
 	if (nodeid == dlm_our_nodeid())
 		return 0;
 
+	idx = srcu_read_lock(&connections_srcu);
 	con = nodeid2con(nodeid, GFP_NOFS);
-	if (!con)
+	if (!con) {
+		srcu_read_unlock(&connections_srcu, idx);
 		return -ENOMEM;
+	}
+
 	lowcomms_connect_sock(con);
+	srcu_read_unlock(&connections_srcu, idx);
+
 	return 0;
 }
 
@@ -864,7 +862,7 @@ static int accept_from_sock(struct listen_connection *con)
 	int result;
 	struct sockaddr_storage peeraddr;
 	struct socket *newsock;
-	int len;
+	int len, idx;
 	int nodeid;
 	struct connection *newcon;
 	struct connection *addcon;
@@ -907,8 +905,10 @@ static int accept_from_sock(struct listen_connection *con)
 	 *  the same time and the connections cross on the wire.
 	 *  In this case we store the incoming one in "othercon"
 	 */
+	idx = srcu_read_lock(&connections_srcu);
 	newcon = nodeid2con(nodeid, GFP_NOFS);
 	if (!newcon) {
+		srcu_read_unlock(&connections_srcu, idx);
 		result = -ENOMEM;
 		goto accept_err;
 	}
@@ -924,6 +924,7 @@ static int accept_from_sock(struct listen_connection *con)
 			if (!othercon) {
 				log_print("failed to allocate incoming socket");
 				mutex_unlock(&newcon->sock_mutex);
+				srcu_read_unlock(&connections_srcu, idx);
 				result = -ENOMEM;
 				goto accept_err;
 			}
@@ -932,6 +933,7 @@ static int accept_from_sock(struct listen_connection *con)
 			if (result < 0) {
 				kfree(othercon);
 				mutex_unlock(&newcon->sock_mutex);
+				srcu_read_unlock(&connections_srcu, idx);
 				goto accept_err;
 			}
 
@@ -966,6 +968,8 @@ static int accept_from_sock(struct listen_connection *con)
 	if (!test_and_set_bit(CF_READ_PENDING, &addcon->flags))
 		queue_work(recv_workqueue, &addcon->rwork);
 
+	srcu_read_unlock(&connections_srcu, idx);
+
 	return 0;
 
 accept_err:
@@ -1403,7 +1407,9 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 
 void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
 {
+	struct writequeue_entry *e;
 	struct connection *con;
+	int idx;
 
 	if (len > DEFAULT_BUFFER_SIZE ||
 	    len < sizeof(struct dlm_header)) {
@@ -1413,11 +1419,23 @@ void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
 		return NULL;
 	}
 
+	idx = srcu_read_lock(&connections_srcu);
 	con = nodeid2con(nodeid, allocation);
-	if (!con)
+	if (!con) {
+		srcu_read_unlock(&connections_srcu, idx);
 		return NULL;
+	}
+
+	e = new_wq_entry(con, len, allocation, ppc);
+	if (!e) {
+		srcu_read_unlock(&connections_srcu, idx);
+		return NULL;
+	}
+
+	/* we assume if successful commit must called */
+	e->idx = idx;
 
-	return new_wq_entry(con, len, allocation, ppc);
+	return e;
 }
 
 void dlm_lowcomms_commit_buffer(void *mh)
@@ -1435,10 +1453,12 @@ void dlm_lowcomms_commit_buffer(void *mh)
 	spin_unlock(&con->writequeue_lock);
 
 	queue_work(send_workqueue, &con->swork);
+	srcu_read_unlock(&connections_srcu, e->idx);
 	return;
 
 out:
 	spin_unlock(&con->writequeue_lock);
+	srcu_read_unlock(&connections_srcu, e->idx);
 	return;
 }
 
@@ -1532,8 +1552,10 @@ int dlm_lowcomms_close(int nodeid)
 {
 	struct connection *con;
 	struct dlm_node_addr *na;
+	int idx;
 
 	log_print("closing connection to node %d", nodeid);
+	idx = srcu_read_lock(&connections_srcu);
 	con = nodeid2con(nodeid, 0);
 	if (con) {
 		set_bit(CF_CLOSE, &con->flags);
@@ -1542,6 +1564,7 @@ int dlm_lowcomms_close(int nodeid)
 		if (con->othercon)
 			clean_one_writequeue(con->othercon);
 	}
+	srcu_read_unlock(&connections_srcu, idx);
 
 	spin_lock(&dlm_node_addrs_spin);
 	na = find_node_addr(nodeid);
@@ -1621,6 +1644,8 @@ static void shutdown_conn(struct connection *con)
 
 void dlm_lowcomms_shutdown(void)
 {
+	int idx;
+
 	/* Set all the flags to prevent any
 	 * socket activity.
 	 */
@@ -1633,7 +1658,9 @@ void dlm_lowcomms_shutdown(void)
 
 	dlm_close_sock(&listen_con.sock);
 
+	idx = srcu_read_lock(&connections_srcu);
 	foreach_conn(shutdown_conn);
+	srcu_read_unlock(&connections_srcu, idx);
 }
 
 static void _stop_conn(struct connection *con, bool and_other)
@@ -1682,7 +1709,7 @@ static void free_conn(struct connection *con)
 
 static void work_flush(void)
 {
-	int ok, idx;
+	int ok;
 	int i;
 	struct connection *con;
 
@@ -1693,7 +1720,6 @@ static void work_flush(void)
 			flush_workqueue(recv_workqueue);
 		if (send_workqueue)
 			flush_workqueue(send_workqueue);
-		idx = srcu_read_lock(&connections_srcu);
 		for (i = 0; i < CONN_HASH_SIZE && ok; i++) {
 			hlist_for_each_entry_rcu(con, &connection_hash[i],
 						 list) {
@@ -1707,14 +1733,17 @@ static void work_flush(void)
 				}
 			}
 		}
-		srcu_read_unlock(&connections_srcu, idx);
 	} while (!ok);
 }
 
 void dlm_lowcomms_stop(void)
 {
+	int idx;
+
+	idx = srcu_read_lock(&connections_srcu);
 	work_flush();
 	foreach_conn(free_conn);
+	srcu_read_unlock(&connections_srcu, idx);
 	work_stop();
 	deinit_local();
 }
-- 
2.30.2

