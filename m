Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2F933254DEE
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Aug 2020 21:04:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598555048;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/L0bDBlBvQzZ/abvi8ZQB3x315bHznlnS/oboP9XegI=;
	b=a85MaxpJ8YrzyKBFYbI7IqDEsnwwj1ew8RWRbpK7YqXBB4/L7D2RWkmdHOFhWnHFS0KZkh
	h/fLJldxxO8VU+lerASebLbprM9bnehWDIkGRFwM36mTwCt1EDwXcJAdkYGjcAxInEXIBf
	rCRrkIXg0yjrmS2z4kT/2H5ZcrQ+a9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-4IGCs-RtMYG3LtIzEcGcdA-1; Thu, 27 Aug 2020 15:04:06 -0400
X-MC-Unique: 4IGCs-RtMYG3LtIzEcGcdA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 804EC10ABDC6;
	Thu, 27 Aug 2020 19:04:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F39C5D9F1;
	Thu, 27 Aug 2020 19:04:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57D8718408AB;
	Thu, 27 Aug 2020 19:04:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07RJ3wPv018129 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 15:03:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F078719D7D; Thu, 27 Aug 2020 19:03:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-193.rdu2.redhat.com [10.10.114.193])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6EEFC19C71;
	Thu, 27 Aug 2020 19:03:58 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Aug 2020 15:02:49 -0400
Message-Id: <20200827190254.719333-3-aahringo@redhat.com>
In-Reply-To: <20200827190254.719333-1-aahringo@redhat.com>
References: <20200827190254.719333-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 2/7] fs: dlm: make connection hash
	lockless
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

There are some problems with the connections_lock. During my
experiements I saw sometimes circular dependencies with sock_lock.
The reason here might be code parts which runs nodeid2con() before
or after sock_lock is acquired.

Another issue are missing locks in for_conn() iteration. Maybe this
works fine because for_conn() is running in a context where
connection_hash cannot be manipulated by others anymore.

However this patch changes the connection_hash to be protected by
sleepable rcu. The hotpath function __find_con() is implemented
lockless as it is only a reader of connection_hash and this hopefully
fixes the circular locking dependencies. The iteration for_conn() will
still call some sleepable functionality, that's why we use sleepable rcu
in this case.

This patch removes the kmemcache functionality as I think I need to
make some free() functionality via call_rcu(). However allocation time
isn't here an issue. The dlm_allow_con will not be protected by a lock
anymore as I think it's enough to just set and flush workqueues
afterwards.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/Kconfig    |  1 +
 fs/dlm/lowcomms.c | 86 ++++++++++++++++++++---------------------------
 2 files changed, 37 insertions(+), 50 deletions(-)

diff --git a/fs/dlm/Kconfig b/fs/dlm/Kconfig
index f82a4952769d..ee92634196a8 100644
--- a/fs/dlm/Kconfig
+++ b/fs/dlm/Kconfig
@@ -4,6 +4,7 @@ menuconfig DLM
 	depends on INET
 	depends on SYSFS && CONFIGFS_FS && (IPV6 || IPV6=n)
 	select IP_SCTP
+	select SRCU
 	help
 	A general purpose distributed lock manager for kernel or userspace
 	applications.
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index ed098870ba0d..9db7126de793 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -126,6 +126,7 @@ struct connection {
 	struct work_struct rwork; /* Receive workqueue */
 	struct work_struct swork; /* Send workqueue */
 	wait_queue_head_t shutdown_wait; /* wait for graceful shutdown */
+	struct rcu_head rcu;
 };
 #define sock2con(x) ((struct connection *)(x)->sk_user_data)
 
@@ -167,8 +168,8 @@ static struct workqueue_struct *recv_workqueue;
 static struct workqueue_struct *send_workqueue;
 
 static struct hlist_head connection_hash[CONN_HASH_SIZE];
-static DEFINE_MUTEX(connections_lock);
-static struct kmem_cache *con_cache;
+static DEFINE_SPINLOCK(connections_lock);
+DEFINE_STATIC_SRCU(connections_srcu);
 
 static void process_recv_sockets(struct work_struct *work);
 static void process_send_sockets(struct work_struct *work);
@@ -184,15 +185,20 @@ static inline int nodeid_hash(int nodeid)
 
 static struct connection *__find_con(int nodeid)
 {
-	int r;
+	int r, idx;
 	struct connection *con;
 
 	r = nodeid_hash(nodeid);
 
-	hlist_for_each_entry(con, &connection_hash[r], list) {
-		if (con->nodeid == nodeid)
+	idx = srcu_read_lock(&connections_srcu);
+	hlist_for_each_entry_rcu(con, &connection_hash[r], list) {
+		if (con->nodeid == nodeid) {
+			srcu_read_unlock(&connections_srcu, idx);
 			return con;
+		}
 	}
+	srcu_read_unlock(&connections_srcu, idx);
+
 	return NULL;
 }
 
@@ -200,7 +206,7 @@ static struct connection *__find_con(int nodeid)
  * If 'allocation' is zero then we don't attempt to create a new
  * connection structure for this node.
  */
-static struct connection *__nodeid2con(int nodeid, gfp_t alloc)
+static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 {
 	struct connection *con = NULL;
 	int r;
@@ -209,13 +215,10 @@ static struct connection *__nodeid2con(int nodeid, gfp_t alloc)
 	if (con || !alloc)
 		return con;
 
-	con = kmem_cache_zalloc(con_cache, alloc);
+	con = kzalloc(sizeof(*con), alloc);
 	if (!con)
 		return NULL;
 
-	r = nodeid_hash(nodeid);
-	hlist_add_head(&con->list, &connection_hash[r]);
-
 	con->nodeid = nodeid;
 	mutex_init(&con->sock_mutex);
 	INIT_LIST_HEAD(&con->writequeue);
@@ -233,31 +236,27 @@ static struct connection *__nodeid2con(int nodeid, gfp_t alloc)
 			con->rx_action = zerocon->rx_action;
 	}
 
+	r = nodeid_hash(nodeid);
+
+	spin_lock(&connections_lock);
+	hlist_add_head_rcu(&con->list, &connection_hash[r]);
+	spin_unlock(&connections_lock);
+
 	return con;
 }
 
 /* Loop round all connections */
 static void foreach_conn(void (*conn_func)(struct connection *c))
 {
-	int i;
-	struct hlist_node *n;
+	int i, idx;
 	struct connection *con;
 
+	idx = srcu_read_lock(&connections_srcu);
 	for (i = 0; i < CONN_HASH_SIZE; i++) {
-		hlist_for_each_entry_safe(con, n, &connection_hash[i], list)
+		hlist_for_each_entry_rcu(con, &connection_hash[i], list)
 			conn_func(con);
 	}
-}
-
-static struct connection *nodeid2con(int nodeid, gfp_t allocation)
-{
-	struct connection *con;
-
-	mutex_lock(&connections_lock);
-	con = __nodeid2con(nodeid, allocation);
-	mutex_unlock(&connections_lock);
-
-	return con;
+	srcu_read_unlock(&connections_srcu, idx);
 }
 
 static struct dlm_node_addr *find_node_addr(int nodeid)
@@ -792,12 +791,9 @@ static int accept_from_sock(struct connection *con)
 	struct connection *newcon;
 	struct connection *addcon;
 
-	mutex_lock(&connections_lock);
 	if (!dlm_allow_conn) {
-		mutex_unlock(&connections_lock);
 		return -1;
 	}
-	mutex_unlock(&connections_lock);
 
 	mutex_lock_nested(&con->sock_mutex, 0);
 
@@ -847,7 +843,7 @@ static int accept_from_sock(struct connection *con)
 		struct connection *othercon = newcon->othercon;
 
 		if (!othercon) {
-			othercon = kmem_cache_zalloc(con_cache, GFP_NOFS);
+			othercon = kzalloc(sizeof(*othercon), GFP_NOFS);
 			if (!othercon) {
 				log_print("failed to allocate incoming socket");
 				mutex_unlock(&newcon->sock_mutex);
@@ -1612,16 +1608,17 @@ static void free_conn(struct connection *con)
 {
 	close_connection(con, true, true, true);
 	if (con->othercon)
-		kmem_cache_free(con_cache, con->othercon);
-	hlist_del(&con->list);
-	kmem_cache_free(con_cache, con);
+		kfree_rcu(con->othercon, rcu);
+	spin_lock(&connections_lock);
+	hlist_del_rcu(&con->list);
+	spin_unlock(&connections_lock);
+	kfree_rcu(con, rcu);
 }
 
 static void work_flush(void)
 {
-	int ok;
+	int ok, idx;
 	int i;
-	struct hlist_node *n;
 	struct connection *con;
 
 	do {
@@ -1631,9 +1628,10 @@ static void work_flush(void)
 			flush_workqueue(recv_workqueue);
 		if (send_workqueue)
 			flush_workqueue(send_workqueue);
+		idx = srcu_read_lock(&connections_srcu);
 		for (i = 0; i < CONN_HASH_SIZE && ok; i++) {
-			hlist_for_each_entry_safe(con, n,
-						  &connection_hash[i], list) {
+			hlist_for_each_entry_rcu(con, &connection_hash[i],
+						 list) {
 				ok &= test_bit(CF_READ_PENDING, &con->flags);
 				ok &= test_bit(CF_WRITE_PENDING, &con->flags);
 				if (con->othercon) {
@@ -1644,6 +1642,7 @@ static void work_flush(void)
 				}
 			}
 		}
+		srcu_read_unlock(&connections_srcu, idx);
 	} while (!ok);
 }
 
@@ -1652,9 +1651,7 @@ void dlm_lowcomms_stop(void)
 	/* Set all the flags to prevent any
 	   socket activity.
 	*/
-	mutex_lock(&connections_lock);
 	dlm_allow_conn = 0;
-	mutex_unlock(&connections_lock);
 
 	if (recv_workqueue)
 		flush_workqueue(recv_workqueue);
@@ -1666,8 +1663,6 @@ void dlm_lowcomms_stop(void)
 	clean_writequeues();
 	foreach_conn(free_conn);
 	work_stop();
-
-	kmem_cache_destroy(con_cache);
 }
 
 int dlm_lowcomms_start(void)
@@ -1686,16 +1681,9 @@ int dlm_lowcomms_start(void)
 		goto fail;
 	}
 
-	error = -ENOMEM;
-	con_cache = kmem_cache_create("dlm_conn", sizeof(struct connection),
-				      __alignof__(struct connection), 0,
-				      NULL);
-	if (!con_cache)
-		goto fail;
-
 	error = work_start();
 	if (error)
-		goto fail_destroy;
+		goto fail;
 
 	dlm_allow_conn = 1;
 
@@ -1714,10 +1702,8 @@ int dlm_lowcomms_start(void)
 	con = nodeid2con(0,0);
 	if (con) {
 		close_connection(con, false, true, true);
-		kmem_cache_free(con_cache, con);
+		kfree_rcu(con, rcu);
 	}
-fail_destroy:
-	kmem_cache_destroy(con_cache);
 fail:
 	return error;
 }
-- 
2.26.2

