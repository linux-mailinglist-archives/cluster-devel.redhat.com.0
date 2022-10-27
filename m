Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B3161031C
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Oct 2022 22:46:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666903569;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9JdiJ3unjeo6lZ34JkUfdMk0N7HHqh4MhKUg30ng8DA=;
	b=OdbdgMOxx2Sv99VR6ugnin6ggADsX3a5NOCnXI/30yGT5nLIJJapvv/+2HzYLSndP4tQDD
	wSvX7UmAOH42c/jsVSCV0NSvKcBdujI3De+Z7O4MTQSt8UGtjPHA9EqlYYe184jmuUqf6F
	vqLyO+6gwTfKJb9IKIqvrovMD5EZ+ec=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-6aPOoxYqPaup2cM1yQBn4g-1; Thu, 27 Oct 2022 16:46:05 -0400
X-MC-Unique: 6aPOoxYqPaup2cM1yQBn4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 753AA101246B;
	Thu, 27 Oct 2022 20:45:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F3102166B26;
	Thu, 27 Oct 2022 20:45:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0D462194707C;
	Thu, 27 Oct 2022 20:45:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3E2FD194706C for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 20:45:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8B3711121325; Thu, 27 Oct 2022 20:45:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CEDA112C263;
 Thu, 27 Oct 2022 20:45:38 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Oct 2022 16:45:28 -0400
Message-Id: <20221027204528.1119036-18-aahringo@redhat.com>
In-Reply-To: <20221027204528.1119036-1-aahringo@redhat.com>
References: <20221027204528.1119036-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v6.1-rc1 18/18] fs: dlm: rework lowcomms
 handling
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch is rework of lowcomms handling, the main goal was here to
handle recvmsg() and sendpage() to run parallel. Parallel in two sense:
1. per connection and 2. that recvmsg()/sendpage() doesn't block each
other.

Currently recvmsg()/sendpage() cannot run parallel because two
workqueues "dlm_recv" and "dlm_send" are ordered workqeues. That's said
and we having two workqueues for receive and send, they block each if
both workqueues schedule the same connection at the same time because a
per connection mutex to prevent that the socket gets released by being
used.

To make it more parallel we introduce one "dlm_io" workqueue which is
not an ordered workqueue, the amount of workers are not limited. Due
per connection flags SEND/RECV pending we schedule workers ordered per
connection and per send and receive task. To get rid of the mutex
blocking same workers to do socket handling we switched to a semaphore
which handles socket operations as read lock and sock releases as write
operations, to prevent sock_release() being called while the socket is
being used.

There might be more optimization removing the semaphore and replacing it
with rcu, however due other circumstances e.g. othercon behaviour it
seems complicated to doing this change. I added comments to remove the
othercon handling and moving to rcu handling. We need to do that to the
next dlm major version upgrade because it is not backwards compatible
with the current connect mechanism.

The processing of dlm messages need to be still handled by a ordered
workqueue. An dlm_process ordered workqeue was introduced which gets
filled by the receive worker. This is probably the next bottleneck of
DLM but the application can't currently parse dlm messages parallel. A
comment was introduced to lift the workqueue context of dlm processing
in a non-sleepable softirq.

The lifetime of a connection struct is now different because the
dlm_node_addr structure was merged into the connection struct. The
shutdown handling for TCP was removed to handle half-open sockets. We
have a application handling for dealing with half-opened connection
which is required by dlm and cluster manager join/leave events. SCTP
doesn't support half-closed sockets and it's already handled by the
application to never run into such case, therefore we removed it.

To check if lowcomms is currently running and it cannot be configured at
this time we introduced a function dlm_lowcomms_is_running() and remove
the dlm_allow_conn variable. The synchronization of stopping all listen
socket workers goes now of it's data ready socket callback.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c    |    4 +-
 fs/dlm/lockspace.c |    5 +-
 fs/dlm/lowcomms.c  | 1453 ++++++++++++++++++++------------------------
 fs/dlm/lowcomms.h  |    6 +-
 fs/dlm/main.c      |    7 +-
 fs/dlm/midcomms.c  |   68 ++-
 fs/dlm/midcomms.h  |    4 +
 7 files changed, 730 insertions(+), 817 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index ac8b62106ce0..20b60709eccf 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -183,7 +183,7 @@ static int dlm_check_protocol_and_dlm_running(unsigned int x)
 		return -EINVAL;
 	}
 
-	if (dlm_allow_conn)
+	if (dlm_lowcomms_is_running())
 		return -EBUSY;
 
 	return 0;
@@ -194,7 +194,7 @@ static int dlm_check_zero_and_dlm_running(unsigned int x)
 	if (!x)
 		return -EINVAL;
 
-	if (dlm_allow_conn)
+	if (dlm_lowcomms_is_running())
 		return -EBUSY;
 
 	return 0;
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index cb7531ed89bc..c088de918366 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -17,7 +17,6 @@
 #include "recoverd.h"
 #include "dir.h"
 #include "midcomms.h"
-#include "lowcomms.h"
 #include "config.h"
 #include "memory.h"
 #include "lock.h"
@@ -723,7 +722,7 @@ static int __dlm_new_lockspace(const char *name, const char *cluster,
 	if (!ls_count) {
 		dlm_scand_stop();
 		dlm_midcomms_shutdown();
-		dlm_lowcomms_stop();
+		dlm_midcomms_stop();
 	}
  out:
 	mutex_unlock(&ls_lock);
@@ -926,7 +925,7 @@ int dlm_release_lockspace(void *lockspace, int force)
 	if (!error)
 		ls_count--;
 	if (!ls_count)
-		dlm_lowcomms_stop();
+		dlm_midcomms_stop();
 	mutex_unlock(&ls_lock);
 
 	return error;
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index b05c6d9b5102..0f6c417e47ac 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -63,41 +63,48 @@
 
 #define NEEDED_RMEM (4*1024*1024)
 
-/* Number of messages to send before rescheduling */
-#define MAX_SEND_MSG_COUNT 25
-#define DLM_SHUTDOWN_WAIT_TIMEOUT msecs_to_jiffies(10000)
-
 struct connection {
 	struct socket *sock;	/* NULL if not connected */
 	uint32_t nodeid;	/* So we know who we are in the list */
-	struct mutex sock_mutex;
+	/* this semaphore is used to allow parallel recv/send in read
+	 * lock mode. When we release a sock we need to held the write lock.
+	 *
+	 * However this is locking code and not nice. When we remove the
+	 * othercon handling we should use rcu subsystem to control release
+	 * sock at the right time.
+	 */
+	struct rw_semaphore sock_lock;
 	unsigned long flags;
-#define CF_READ_PENDING 1
-#define CF_WRITE_PENDING 2
-#define CF_INIT_PENDING 4
-#define CF_IS_OTHERCON 5
-#define CF_CLOSE 6
-#define CF_APP_LIMITED 7
-#define CF_CLOSING 8
-#define CF_SHUTDOWN 9
-#define CF_CONNECTED 10
-#define CF_RECONNECT 11
-#define CF_DELAY_CONNECT 12
-#define CF_EOF 13
+#define CF_APP_LIMITED 0
+#define CF_RECV_PENDING 1
+#define CF_SEND_PENDING 2
+#define CF_RECV_INTR 3
+#define CF_IO_STOP 4
 	struct list_head writequeue;  /* List of outgoing writequeue_entries */
 	spinlock_t writequeue_lock;
-	atomic_t writequeue_cnt;
 	int retries;
-#define MAX_CONNECT_RETRIES 3
 	struct hlist_node list;
+	/* due some connect()/accept() races we currently have this cross over
+	 * connection attempt second connection for one node.
+	 *
+	 * There is a solution to avoid the race by introducing a connect
+	 * rule as e.g. our_nodeid > nodeid_to_connect who is allowed to
+	 * connect. Otherside can connect but will only be considered that
+	 * the other side wants to have a reconnect.
+	 *
+	 * However changing to this behaviour will break backwards compatible.
+	 * In a DLM protocol major version upgrade we should remove this!
+	 */
 	struct connection *othercon;
-	struct connection *sendcon;
-	struct work_struct rwork; /* Receive workqueue */
-	struct work_struct swork; /* Send workqueue */
-	wait_queue_head_t shutdown_wait; /* wait for graceful shutdown */
-	unsigned char *rx_buf;
-	int rx_buflen;
+	struct work_struct rwork; /* receive worker */
+	struct work_struct swork; /* send worker */
+	unsigned char rx_leftover_buf[DLM_MAX_SOCKET_BUFSIZE];
 	int rx_leftover;
+	int mark;
+	int addr_count;
+	int curr_addr_index;
+	struct sockaddr_storage addr[DLM_MAX_ADDR_COUNT];
+	spinlock_t addrs_lock;
 	struct rcu_head rcu;
 };
 #define sock2con(x) ((struct connection *)(x)->sk_user_data)
@@ -136,13 +143,12 @@ struct dlm_msg {
 	struct kref ref;
 };
 
-struct dlm_node_addr {
-	struct list_head list;
+struct processqueue_entry {
+	unsigned char *buf;
 	int nodeid;
-	int mark;
-	int addr_count;
-	int curr_addr_index;
-	struct sockaddr_storage *addr[DLM_MAX_ADDR_COUNT];
+	int buflen;
+
+	struct list_head list;
 };
 
 struct dlm_proto_ops {
@@ -157,10 +163,6 @@ struct dlm_proto_ops {
 	int (*listen_validate)(void);
 	void (*listen_sockopts)(struct socket *sock);
 	int (*listen_bind)(struct socket *sock);
-	/* What to do to shutdown */
-	void (*shutdown_action)(struct connection *con);
-	/* What to do to eof check */
-	bool (*eof_condition)(struct connection *con);
 };
 
 static struct listen_sock_callbacks {
@@ -170,17 +172,13 @@ static struct listen_sock_callbacks {
 	void (*sk_write_space)(struct sock *);
 } listen_sock;
 
-static LIST_HEAD(dlm_node_addrs);
-static DEFINE_SPINLOCK(dlm_node_addrs_spin);
-
 static struct listen_connection listen_con;
-static struct sockaddr_storage *dlm_local_addr[DLM_MAX_ADDR_COUNT];
+static struct sockaddr_storage dlm_local_addr[DLM_MAX_ADDR_COUNT];
 static int dlm_local_count;
-int dlm_allow_conn;
 
 /* Work queues */
-static struct workqueue_struct *recv_workqueue;
-static struct workqueue_struct *send_workqueue;
+static struct workqueue_struct *io_workqueue;
+static struct workqueue_struct *process_workqueue;
 
 static struct hlist_head connection_hash[CONN_HASH_SIZE];
 static DEFINE_SPINLOCK(connections_lock);
@@ -188,8 +186,43 @@ DEFINE_STATIC_SRCU(connections_srcu);
 
 static const struct dlm_proto_ops *dlm_proto_ops;
 
+#define DLM_IO_SUCCESS 0
+#define DLM_IO_END 1
+#define DLM_IO_EOF 2
+#define DLM_IO_RESCHED 3
+
 static void process_recv_sockets(struct work_struct *work);
 static void process_send_sockets(struct work_struct *work);
+static void process_dlm_messages(struct work_struct *work);
+
+static DECLARE_WORK(process_work, process_dlm_messages);
+static DEFINE_SPINLOCK(processqueue_lock);
+static bool process_dlm_messages_pending;
+static LIST_HEAD(processqueue);
+
+bool dlm_lowcomms_is_running(void)
+{
+	return !!listen_con.sock;
+}
+
+static void lowcomms_queue_swork(struct connection *con)
+{
+	WARN_ON_ONCE(!lockdep_is_held(&con->writequeue_lock));
+
+	if (!test_bit(CF_IO_STOP, &con->flags) &&
+	    !test_bit(CF_APP_LIMITED, &con->flags) &&
+	    !test_and_set_bit(CF_SEND_PENDING, &con->flags))
+		queue_work(io_workqueue, &con->swork);
+}
+
+static void lowcomms_queue_rwork(struct connection *con)
+{
+	WARN_ON_ONCE(!lockdep_sock_is_held(con->sock->sk));
+
+	if (!test_bit(CF_IO_STOP, &con->flags) &&
+	    !test_and_set_bit(CF_RECV_PENDING, &con->flags))
+		queue_work(io_workqueue, &con->rwork);
+}
 
 static void writequeue_entry_ctor(void *data)
 {
@@ -214,15 +247,12 @@ static struct writequeue_entry *con_next_wq(struct connection *con)
 {
 	struct writequeue_entry *e;
 
-	if (list_empty(&con->writequeue))
-		return NULL;
-
-	e = list_first_entry(&con->writequeue, struct writequeue_entry,
-			     list);
+	e = list_first_entry_or_null(&con->writequeue, struct writequeue_entry,
+				     list);
 	/* if len is zero nothing is to send, if there are users filling
 	 * buffers we wait until the users are done so we can send more.
 	 */
-	if (e->users || e->len == 0)
+	if (!e || e->users || e->len == 0)
 		return NULL;
 
 	return e;
@@ -240,28 +270,15 @@ static struct connection *__find_con(int nodeid, int r)
 	return NULL;
 }
 
-static bool tcp_eof_condition(struct connection *con)
-{
-	return atomic_read(&con->writequeue_cnt);
-}
-
-static int dlm_con_init(struct connection *con, int nodeid)
+static void dlm_con_init(struct connection *con, int nodeid)
 {
-	con->rx_buflen = dlm_config.ci_buffer_size;
-	con->rx_buf = kmalloc(con->rx_buflen, GFP_NOFS);
-	if (!con->rx_buf)
-		return -ENOMEM;
-
 	con->nodeid = nodeid;
-	mutex_init(&con->sock_mutex);
+	init_rwsem(&con->sock_lock);
 	INIT_LIST_HEAD(&con->writequeue);
 	spin_lock_init(&con->writequeue_lock);
-	atomic_set(&con->writequeue_cnt, 0);
 	INIT_WORK(&con->swork, process_send_sockets);
 	INIT_WORK(&con->rwork, process_recv_sockets);
-	init_waitqueue_head(&con->shutdown_wait);
-
-	return 0;
+	spin_lock_init(&con->addrs_lock);
 }
 
 /*
@@ -271,7 +288,7 @@ static int dlm_con_init(struct connection *con, int nodeid)
 static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 {
 	struct connection *con, *tmp;
-	int r, ret;
+	int r;
 
 	r = nodeid_hash(nodeid);
 	con = __find_con(nodeid, r);
@@ -282,11 +299,7 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 	if (!con)
 		return NULL;
 
-	ret = dlm_con_init(con, nodeid);
-	if (ret) {
-		kfree(con);
-		return NULL;
-	}
+	dlm_con_init(con, nodeid);
 
 	spin_lock(&connections_lock);
 	/* Because multiple workqueues/threads calls this function it can
@@ -298,7 +311,6 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 	tmp = __find_con(nodeid, r);
 	if (tmp) {
 		spin_unlock(&connections_lock);
-		kfree(con->rx_buf);
 		kfree(con);
 		return tmp;
 	}
@@ -309,29 +321,6 @@ static struct connection *nodeid2con(int nodeid, gfp_t alloc)
 	return con;
 }
 
-/* Loop round all connections */
-static void foreach_conn(void (*conn_func)(struct connection *c))
-{
-	int i;
-	struct connection *con;
-
-	for (i = 0; i < CONN_HASH_SIZE; i++) {
-		hlist_for_each_entry_rcu(con, &connection_hash[i], list)
-			conn_func(con);
-	}
-}
-
-static struct dlm_node_addr *find_node_addr(int nodeid)
-{
-	struct dlm_node_addr *na;
-
-	list_for_each_entry(na, &dlm_node_addrs, list) {
-		if (na->nodeid == nodeid)
-			return na;
-	}
-	return NULL;
-}
-
 static int addr_compare(const struct sockaddr_storage *x,
 			const struct sockaddr_storage *y)
 {
@@ -365,40 +354,47 @@ static int nodeid_to_addr(int nodeid, struct sockaddr_storage *sas_out,
 			  unsigned int *mark)
 {
 	struct sockaddr_storage sas;
-	struct dlm_node_addr *na;
+	struct connection *con;
+	int idx;
 
 	if (!dlm_local_count)
 		return -1;
 
-	spin_lock(&dlm_node_addrs_spin);
-	na = find_node_addr(nodeid);
-	if (na && na->addr_count) {
-		memcpy(&sas, na->addr[na->curr_addr_index],
-		       sizeof(struct sockaddr_storage));
+	idx = srcu_read_lock(&connections_srcu);
+	con = nodeid2con(nodeid, 0);
+	if (!con) {
+		srcu_read_unlock(&connections_srcu, idx);
+		return -ENOENT;
+	}
 
-		if (try_new_addr) {
-			na->curr_addr_index++;
-			if (na->curr_addr_index == na->addr_count)
-				na->curr_addr_index = 0;
-		}
+	spin_lock(&con->addrs_lock);
+	if (!con->addr_count) {
+		spin_unlock(&con->addrs_lock);
+		srcu_read_unlock(&connections_srcu, idx);
+		return -ENOENT;
 	}
-	spin_unlock(&dlm_node_addrs_spin);
 
-	if (!na)
-		return -EEXIST;
+	memcpy(&sas, &con->addr[con->curr_addr_index],
+	       sizeof(struct sockaddr_storage));
 
-	if (!na->addr_count)
-		return -ENOENT;
+	if (try_new_addr) {
+		con->curr_addr_index++;
+		if (con->curr_addr_index == con->addr_count)
+			con->curr_addr_index = 0;
+	}
 
-	*mark = na->mark;
+	*mark = con->mark;
+	spin_unlock(&con->addrs_lock);
 
 	if (sas_out)
 		memcpy(sas_out, &sas, sizeof(struct sockaddr_storage));
 
-	if (!sa_out)
+	if (!sa_out) {
+		srcu_read_unlock(&connections_srcu, idx);
 		return 0;
+	}
 
-	if (dlm_local_addr[0]->ss_family == AF_INET) {
+	if (dlm_local_addr[0].ss_family == AF_INET) {
 		struct sockaddr_in *in4  = (struct sockaddr_in *) &sas;
 		struct sockaddr_in *ret4 = (struct sockaddr_in *) sa_out;
 		ret4->sin_addr.s_addr = in4->sin_addr.s_addr;
@@ -408,43 +404,46 @@ static int nodeid_to_addr(int nodeid, struct sockaddr_storage *sas_out,
 		ret6->sin6_addr = in6->sin6_addr;
 	}
 
+	srcu_read_unlock(&connections_srcu, idx);
 	return 0;
 }
 
 static int addr_to_nodeid(struct sockaddr_storage *addr, int *nodeid,
 			  unsigned int *mark)
 {
-	struct dlm_node_addr *na;
-	int rv = -EEXIST;
-	int addr_i;
-
-	spin_lock(&dlm_node_addrs_spin);
-	list_for_each_entry(na, &dlm_node_addrs, list) {
-		if (!na->addr_count)
-			continue;
-
-		for (addr_i = 0; addr_i < na->addr_count; addr_i++) {
-			if (addr_compare(na->addr[addr_i], addr)) {
-				*nodeid = na->nodeid;
-				*mark = na->mark;
-				rv = 0;
-				goto unlock;
+	struct connection *con;
+	int i, idx, addr_i;
+
+	idx = srcu_read_lock(&connections_srcu);
+	for (i = 0; i < CONN_HASH_SIZE; i++) {
+		hlist_for_each_entry_rcu(con, &connection_hash[i], list) {
+			WARN_ON_ONCE(!con->addr_count);
+
+			spin_lock(&con->addrs_lock);
+			for (addr_i = 0; addr_i < con->addr_count; addr_i++) {
+				if (addr_compare(&con->addr[addr_i], addr)) {
+					*nodeid = con->nodeid;
+					*mark = con->mark;
+					spin_unlock(&con->addrs_lock);
+					srcu_read_unlock(&connections_srcu, idx);
+					return 0;
+				}
 			}
+			spin_unlock(&con->addrs_lock);
 		}
 	}
-unlock:
-	spin_unlock(&dlm_node_addrs_spin);
-	return rv;
+	srcu_read_unlock(&connections_srcu, idx);
+
+	return -ENOENT;
 }
 
-/* caller need to held dlm_node_addrs_spin lock */
-static bool dlm_lowcomms_na_has_addr(const struct dlm_node_addr *na,
-				     const struct sockaddr_storage *addr)
+static bool dlm_lowcomms_con_has_addr(const struct connection *con,
+				      const struct sockaddr_storage *addr)
 {
 	int i;
 
-	for (i = 0; i < na->addr_count; i++) {
-		if (addr_compare(na->addr[i], addr))
+	for (i = 0; i < con->addr_count; i++) {
+		if (addr_compare(&con->addr[i], addr))
 			return true;
 	}
 
@@ -453,118 +452,82 @@ static bool dlm_lowcomms_na_has_addr(const struct dlm_node_addr *na,
 
 int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len)
 {
-	struct sockaddr_storage *new_addr;
-	struct dlm_node_addr *new_node, *na;
-	bool ret;
-
-	new_node = kzalloc(sizeof(struct dlm_node_addr), GFP_NOFS);
-	if (!new_node)
-		return -ENOMEM;
+	struct connection *con;
+	bool ret, idx;
 
-	new_addr = kzalloc(sizeof(struct sockaddr_storage), GFP_NOFS);
-	if (!new_addr) {
-		kfree(new_node);
+	idx = srcu_read_lock(&connections_srcu);
+	con = nodeid2con(nodeid, GFP_NOFS);
+	if (!con) {
+		srcu_read_unlock(&connections_srcu, idx);
 		return -ENOMEM;
 	}
 
-	memcpy(new_addr, addr, len);
-
-	spin_lock(&dlm_node_addrs_spin);
-	na = find_node_addr(nodeid);
-	if (!na) {
-		new_node->nodeid = nodeid;
-		new_node->addr[0] = new_addr;
-		new_node->addr_count = 1;
-		new_node->mark = dlm_config.ci_mark;
-		list_add(&new_node->list, &dlm_node_addrs);
-		spin_unlock(&dlm_node_addrs_spin);
+	spin_lock(&con->addrs_lock);
+	if (!con->addr_count) {
+		memcpy(&con->addr[0], addr, sizeof(*addr));
+		con->addr_count = 1;
+		con->mark = dlm_config.ci_mark;
+		spin_unlock(&con->addrs_lock);
+		srcu_read_unlock(&connections_srcu, idx);
 		return 0;
 	}
 
-	ret = dlm_lowcomms_na_has_addr(na, addr);
+	ret = dlm_lowcomms_con_has_addr(con, addr);
 	if (ret) {
-		spin_unlock(&dlm_node_addrs_spin);
-		kfree(new_addr);
-		kfree(new_node);
+		spin_unlock(&con->addrs_lock);
+		srcu_read_unlock(&connections_srcu, idx);
 		return -EEXIST;
 	}
 
-	if (na->addr_count >= DLM_MAX_ADDR_COUNT) {
-		spin_unlock(&dlm_node_addrs_spin);
-		kfree(new_addr);
-		kfree(new_node);
+	if (con->addr_count >= DLM_MAX_ADDR_COUNT) {
+		spin_unlock(&con->addrs_lock);
+		srcu_read_unlock(&connections_srcu, idx);
 		return -ENOSPC;
 	}
 
-	na->addr[na->addr_count++] = new_addr;
-	spin_unlock(&dlm_node_addrs_spin);
-	kfree(new_node);
+	memcpy(&con->addr[con->addr_count++], addr, sizeof(*addr));
+	srcu_read_unlock(&connections_srcu, idx);
+	spin_unlock(&con->addrs_lock);
 	return 0;
 }
 
 /* Data available on socket or listen socket received a connect */
 static void lowcomms_data_ready(struct sock *sk)
 {
-	struct connection *con;
+	struct connection *con = sock2con(sk);
 
-	con = sock2con(sk);
-	if (con && !test_and_set_bit(CF_READ_PENDING, &con->flags))
-		queue_work(recv_workqueue, &con->rwork);
-}
-
-static void lowcomms_listen_data_ready(struct sock *sk)
-{
-	if (!dlm_allow_conn)
-		return;
-
-	queue_work(recv_workqueue, &listen_con.rwork);
+	set_bit(CF_RECV_INTR, &con->flags);
+	lowcomms_queue_rwork(con);
 }
 
 static void lowcomms_write_space(struct sock *sk)
 {
-	struct connection *con;
-
-	con = sock2con(sk);
-	if (!con)
-		return;
-
-	if (!test_and_set_bit(CF_CONNECTED, &con->flags)) {
-		log_print("connected to node %d", con->nodeid);
-		queue_work(send_workqueue, &con->swork);
-		return;
-	}
+	struct connection *con = sock2con(sk);
 
 	clear_bit(SOCK_NOSPACE, &con->sock->flags);
 
+	spin_lock_bh(&con->writequeue_lock);
 	if (test_and_clear_bit(CF_APP_LIMITED, &con->flags)) {
 		con->sock->sk->sk_write_pending--;
 		clear_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags);
 	}
 
-	queue_work(send_workqueue, &con->swork);
-}
-
-static inline void lowcomms_connect_sock(struct connection *con)
-{
-	if (test_bit(CF_CLOSE, &con->flags))
-		return;
-	queue_work(send_workqueue, &con->swork);
-	cond_resched();
+	lowcomms_queue_swork(con);
+	spin_unlock_bh(&con->writequeue_lock);
 }
 
 static void lowcomms_state_change(struct sock *sk)
 {
 	/* SCTP layer is not calling sk_data_ready when the connection
-	 * is done, so we catch the signal through here. Also, it
-	 * doesn't switch socket state when entering shutdown, so we
-	 * skip the write in that case.
+	 * is done, so we catch the signal through here.
 	 */
-	if (sk->sk_shutdown) {
-		if (sk->sk_shutdown == RCV_SHUTDOWN)
-			lowcomms_data_ready(sk);
-	} else if (sk->sk_state == TCP_ESTABLISHED) {
-		lowcomms_write_space(sk);
-	}
+	if (sk->sk_shutdown == RCV_SHUTDOWN)
+		lowcomms_data_ready(sk);
+}
+
+static void lowcomms_listen_data_ready(struct sock *sk)
+{
+	queue_work(io_workqueue, &listen_con.rwork);
 }
 
 int dlm_lowcomms_connect_node(int nodeid)
@@ -576,47 +539,49 @@ int dlm_lowcomms_connect_node(int nodeid)
 		return 0;
 
 	idx = srcu_read_lock(&connections_srcu);
-	con = nodeid2con(nodeid, GFP_NOFS);
-	if (!con) {
+	con = nodeid2con(nodeid, 0);
+	if (WARN_ON_ONCE(!con)) {
 		srcu_read_unlock(&connections_srcu, idx);
-		return -ENOMEM;
+		return -ENOENT;
 	}
 
-	lowcomms_connect_sock(con);
+	down_read(&con->sock_lock);
+	if (!con->sock) {
+		spin_lock_bh(&con->writequeue_lock);
+		lowcomms_queue_swork(con);
+		spin_unlock_bh(&con->writequeue_lock);
+	}
+	up_read(&con->sock_lock);
 	srcu_read_unlock(&connections_srcu, idx);
 
+	cond_resched();
 	return 0;
 }
 
 int dlm_lowcomms_nodes_set_mark(int nodeid, unsigned int mark)
 {
-	struct dlm_node_addr *na;
+	struct connection *con;
+	int idx;
 
-	spin_lock(&dlm_node_addrs_spin);
-	na = find_node_addr(nodeid);
-	if (!na) {
-		spin_unlock(&dlm_node_addrs_spin);
+	idx = srcu_read_lock(&connections_srcu);
+	con = nodeid2con(nodeid, 0);
+	if (!con) {
+		srcu_read_unlock(&connections_srcu, idx);
 		return -ENOENT;
 	}
 
-	na->mark = mark;
-	spin_unlock(&dlm_node_addrs_spin);
-
+	spin_lock(&con->addrs_lock);
+	con->mark = mark;
+	spin_unlock(&con->addrs_lock);
+	srcu_read_unlock(&connections_srcu, idx);
 	return 0;
 }
 
 static void lowcomms_error_report(struct sock *sk)
 {
-	struct connection *con;
-	void (*orig_report)(struct sock *) = NULL;
+	struct connection *con = sock2con(sk);
 	struct inet_sock *inet;
 
-	con = sock2con(sk);
-	if (con == NULL)
-		goto out;
-
-	orig_report = listen_sock.sk_error_report;
-
 	inet = inet_sk(sk);
 	switch (sk->sk_family) {
 	case AF_INET:
@@ -642,66 +607,21 @@ static void lowcomms_error_report(struct sock *sk)
 				   "invalid socket family %d set, "
 				   "sk_err=%d/%d\n", dlm_our_nodeid(),
 				   sk->sk_family, sk->sk_err, sk->sk_err_soft);
-		goto out;
-	}
-
-	/* below sendcon only handling */
-	if (test_bit(CF_IS_OTHERCON, &con->flags))
-		con = con->sendcon;
-
-	switch (sk->sk_err) {
-	case ECONNREFUSED:
-		set_bit(CF_DELAY_CONNECT, &con->flags);
-		break;
-	default:
 		break;
 	}
 
-	if (!test_and_set_bit(CF_RECONNECT, &con->flags))
-		queue_work(send_workqueue, &con->swork);
-
-out:
-	if (orig_report)
-		orig_report(sk);
-}
-
-/* Note: sk_callback_lock must be locked before calling this function. */
-static void save_listen_callbacks(struct socket *sock)
-{
-	struct sock *sk = sock->sk;
-
-	listen_sock.sk_data_ready = sk->sk_data_ready;
-	listen_sock.sk_state_change = sk->sk_state_change;
-	listen_sock.sk_write_space = sk->sk_write_space;
-	listen_sock.sk_error_report = sk->sk_error_report;
+	listen_sock.sk_error_report(sk);
 }
 
-static void restore_callbacks(struct socket *sock)
+static void restore_callbacks(struct sock *sk)
 {
-	struct sock *sk = sock->sk;
+	WARN_ON_ONCE(!lockdep_sock_is_held(sk));
 
-	lock_sock(sk);
 	sk->sk_user_data = NULL;
 	sk->sk_data_ready = listen_sock.sk_data_ready;
 	sk->sk_state_change = listen_sock.sk_state_change;
 	sk->sk_write_space = listen_sock.sk_write_space;
 	sk->sk_error_report = listen_sock.sk_error_report;
-	release_sock(sk);
-}
-
-static void add_listen_sock(struct socket *sock, struct listen_connection *con)
-{
-	struct sock *sk = sock->sk;
-
-	lock_sock(sk);
-	save_listen_callbacks(sock);
-	con->sock = sock;
-
-	sk->sk_user_data = con;
-	sk->sk_allocation = GFP_NOFS;
-	/* Install a data_ready callback */
-	sk->sk_data_ready = lowcomms_listen_data_ready;
-	release_sock(sk);
 }
 
 /* Make a socket active */
@@ -713,10 +633,10 @@ static void add_sock(struct socket *sock, struct connection *con)
 	con->sock = sock;
 
 	sk->sk_user_data = con;
-	/* Install a data_ready callback */
 	sk->sk_data_ready = lowcomms_data_ready;
 	sk->sk_write_space = lowcomms_write_space;
-	sk->sk_state_change = lowcomms_state_change;
+	if (dlm_config.ci_protocol == DLM_PROTO_SCTP)
+		sk->sk_state_change = lowcomms_state_change;
 	sk->sk_allocation = GFP_NOFS;
 	sk->sk_error_report = lowcomms_error_report;
 	release_sock(sk);
@@ -727,7 +647,7 @@ static void add_sock(struct socket *sock, struct connection *con)
 static void make_sockaddr(struct sockaddr_storage *saddr, uint16_t port,
 			  int *addr_len)
 {
-	saddr->ss_family =  dlm_local_addr[0]->ss_family;
+	saddr->ss_family =  dlm_local_addr[0].ss_family;
 	if (saddr->ss_family == AF_INET) {
 		struct sockaddr_in *in4_addr = (struct sockaddr_in *)saddr;
 		in4_addr->sin_port = cpu_to_be16(port);
@@ -773,42 +693,64 @@ static void free_entry(struct writequeue_entry *e)
 	}
 
 	list_del(&e->list);
-	atomic_dec(&e->con->writequeue_cnt);
 	kref_put(&e->ref, dlm_page_release);
 }
 
 static void dlm_close_sock(struct socket **sock)
 {
 	if (*sock) {
-		restore_callbacks(*sock);
+		lock_sock((*sock)->sk);
+		restore_callbacks((*sock)->sk);
+		release_sock((*sock)->sk);
 		sock_release(*sock);
 		*sock = NULL;
 	}
 }
 
-/* Close a remote connection and tidy up */
-static void close_connection(struct connection *con, bool and_other,
-			     bool tx, bool rx)
+
+static void allow_connection_io(struct connection *con)
 {
-	bool closing = test_and_set_bit(CF_CLOSING, &con->flags);
-	struct writequeue_entry *e;
+	if (con->othercon)
+		clear_bit(CF_IO_STOP, &con->othercon->flags);
+	clear_bit(CF_IO_STOP, &con->flags);
+}
 
-	if (tx && !closing && cancel_work_sync(&con->swork)) {
-		log_print("canceled swork for node %d", con->nodeid);
-		clear_bit(CF_WRITE_PENDING, &con->flags);
-	}
-	if (rx && !closing && cancel_work_sync(&con->rwork)) {
-		log_print("canceled rwork for node %d", con->nodeid);
-		clear_bit(CF_READ_PENDING, &con->flags);
+static void stop_connection_io(struct connection *con)
+{
+	if (con->othercon)
+		stop_connection_io(con->othercon);
+
+	down_write(&con->sock_lock);
+	if (con->sock) {
+		lock_sock(con->sock->sk);
+		restore_callbacks(con->sock->sk);
+
+		spin_lock_bh(&con->writequeue_lock);
+		set_bit(CF_IO_STOP, &con->flags);
+		spin_unlock_bh(&con->writequeue_lock);
+		release_sock(con->sock->sk);
+	} else {
+		spin_lock_bh(&con->writequeue_lock);
+		set_bit(CF_IO_STOP, &con->flags);
+		spin_unlock_bh(&con->writequeue_lock);
 	}
+	up_write(&con->sock_lock);
+
+	cancel_work_sync(&con->swork);
+	cancel_work_sync(&con->rwork);
+}
+
 
-	mutex_lock(&con->sock_mutex);
+/* Close a remote connection and tidy up */
+static void close_connection(struct connection *con, bool and_other)
+{
+	struct writequeue_entry *e;
+
+	down_write(&con->sock_lock);
 	dlm_close_sock(&con->sock);
 
-	if (con->othercon && and_other) {
-		/* Will only re-enter once. */
-		close_connection(con->othercon, false, tx, rx);
-	}
+	if (con->othercon && and_other)
+		close_connection(con->othercon, false);
 
 	/* if we send a writequeue entry only a half way, we drop the
 	 * whole entry because reconnection and that we not start of the
@@ -821,200 +763,172 @@ static void close_connection(struct connection *con, bool and_other,
 	 * our policy is to start on a clean state when disconnects, we don't
 	 * know what's send/received on transport layer in this case.
 	 */
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	if (!list_empty(&con->writequeue)) {
 		e = list_first_entry(&con->writequeue, struct writequeue_entry,
 				     list);
 		if (e->dirty)
 			free_entry(e);
 	}
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 
 	con->rx_leftover = 0;
 	con->retries = 0;
 	clear_bit(CF_APP_LIMITED, &con->flags);
-	clear_bit(CF_CONNECTED, &con->flags);
-	clear_bit(CF_DELAY_CONNECT, &con->flags);
-	clear_bit(CF_RECONNECT, &con->flags);
-	clear_bit(CF_EOF, &con->flags);
-	mutex_unlock(&con->sock_mutex);
-	clear_bit(CF_CLOSING, &con->flags);
+	clear_bit(CF_RECV_PENDING, &con->flags);
+	clear_bit(CF_SEND_PENDING, &con->flags);
+	up_write(&con->sock_lock);
 }
 
-static void shutdown_connection(struct connection *con)
+static struct processqueue_entry *new_processqueue_entry(int nodeid,
+							 int buflen)
 {
-	int ret;
-
-	flush_work(&con->swork);
+	struct processqueue_entry *pentry;
 
-	mutex_lock(&con->sock_mutex);
-	/* nothing to shutdown */
-	if (!con->sock) {
-		mutex_unlock(&con->sock_mutex);
-		return;
-	}
+	pentry = kmalloc(sizeof(*pentry), GFP_NOFS);
+	if (!pentry)
+		return NULL;
 
-	set_bit(CF_SHUTDOWN, &con->flags);
-	ret = kernel_sock_shutdown(con->sock, SHUT_WR);
-	mutex_unlock(&con->sock_mutex);
-	if (ret) {
-		log_print("Connection %p failed to shutdown: %d will force close",
-			  con, ret);
-		goto force_close;
-	} else {
-		ret = wait_event_timeout(con->shutdown_wait,
-					 !test_bit(CF_SHUTDOWN, &con->flags),
-					 DLM_SHUTDOWN_WAIT_TIMEOUT);
-		if (ret == 0) {
-			log_print("Connection %p shutdown timed out, will force close",
-				  con);
-			goto force_close;
-		}
+	pentry->buf = kmalloc(buflen, GFP_NOFS);
+	if (!pentry->buf) {
+		kfree(pentry);
+		return NULL;
 	}
 
-	return;
-
-force_close:
-	clear_bit(CF_SHUTDOWN, &con->flags);
-	close_connection(con, false, true, true);
+	pentry->nodeid = nodeid;
+	return pentry;
 }
 
-static void dlm_tcp_shutdown(struct connection *con)
+static void free_processqueue_entry(struct processqueue_entry *pentry)
 {
-	if (con->othercon)
-		shutdown_connection(con->othercon);
-	shutdown_connection(con);
+	kfree(pentry->buf);
+	kfree(pentry);
 }
 
-static int con_realloc_receive_buf(struct connection *con, int newlen)
+static void process_dlm_messages(struct work_struct *work)
 {
-	unsigned char *newbuf;
+	struct processqueue_entry *pentry;
 
-	newbuf = kmalloc(newlen, GFP_NOFS);
-	if (!newbuf)
-		return -ENOMEM;
+	spin_lock(&processqueue_lock);
+	pentry = list_first_entry_or_null(&processqueue,
+					  struct processqueue_entry, list);
+	if (WARN_ON_ONCE(!pentry)) {
+		spin_unlock(&processqueue_lock);
+		return;
+	}
 
-	/* copy any leftover from last receive */
-	if (con->rx_leftover)
-		memmove(newbuf, con->rx_buf, con->rx_leftover);
+	list_del(&pentry->list);
+	spin_unlock(&processqueue_lock);
 
-	/* swap to new buffer space */
-	kfree(con->rx_buf);
-	con->rx_buflen = newlen;
-	con->rx_buf = newbuf;
+	for (;;) {
+		dlm_process_incoming_buffer(pentry->nodeid, pentry->buf,
+					    pentry->buflen);
+		free_processqueue_entry(pentry);
+
+		spin_lock(&processqueue_lock);
+		pentry = list_first_entry_or_null(&processqueue,
+						  struct processqueue_entry, list);
+		if (!pentry) {
+			process_dlm_messages_pending = false;
+			spin_unlock(&processqueue_lock);
+			break;
+		}
 
-	return 0;
+		list_del(&pentry->list);
+		spin_unlock(&processqueue_lock);
+	}
 }
 
 /* Data received from remote end */
-static int receive_from_sock(struct connection *con)
+static int receive_from_sock(struct connection *con, int buflen)
 {
+	struct processqueue_entry *pentry;
+	int ret, buflen_real;
 	struct msghdr msg;
 	struct kvec iov;
-	int ret, buflen;
 
-	mutex_lock(&con->sock_mutex);
+	pentry = new_processqueue_entry(con->nodeid, buflen);
+	if (!pentry)
+		return DLM_IO_RESCHED;
 
-	if (con->sock == NULL) {
-		ret = -EAGAIN;
-		goto out_close;
-	}
+	memcpy(pentry->buf, con->rx_leftover_buf, con->rx_leftover);
 
-	/* realloc if we get new buffer size to read out */
-	buflen = dlm_config.ci_buffer_size;
-	if (con->rx_buflen != buflen && con->rx_leftover <= buflen) {
-		ret = con_realloc_receive_buf(con, buflen);
-		if (ret < 0)
-			goto out_resched;
-	}
+	/* calculate new buffer parameter regarding last receive and
+	 * possible leftover bytes
+	 */
+	iov.iov_base = pentry->buf + con->rx_leftover;
+	iov.iov_len = buflen - con->rx_leftover;
 
-	for (;;) {
-		/* calculate new buffer parameter regarding last receive and
-		 * possible leftover bytes
-		 */
-		iov.iov_base = con->rx_buf + con->rx_leftover;
-		iov.iov_len = con->rx_buflen - con->rx_leftover;
-
-		memset(&msg, 0, sizeof(msg));
-		msg.msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
-		ret = kernel_recvmsg(con->sock, &msg, &iov, 1, iov.iov_len,
-				     msg.msg_flags);
-		trace_dlm_recv(con->nodeid, ret);
-		if (ret == -EAGAIN)
-			break;
-		else if (ret <= 0)
-			goto out_close;
-
-		/* new buflen according readed bytes and leftover from last receive */
-		buflen = ret + con->rx_leftover;
-		ret = dlm_process_incoming_buffer(con->nodeid, con->rx_buf, buflen);
-		if (ret < 0)
-			goto out_close;
-
-		/* calculate leftover bytes from process and put it into begin of
-		 * the receive buffer, so next receive we have the full message
-		 * at the start address of the receive buffer.
-		 */
-		con->rx_leftover = buflen - ret;
-		if (con->rx_leftover) {
-			memmove(con->rx_buf, con->rx_buf + ret,
-				con->rx_leftover);
+	memset(&msg, 0, sizeof(msg));
+	msg.msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
+	clear_bit(CF_RECV_INTR, &con->flags);
+again:
+	ret = kernel_recvmsg(con->sock, &msg, &iov, 1, iov.iov_len,
+			     msg.msg_flags);
+	trace_dlm_recv(con->nodeid, ret);
+	if (ret == -EAGAIN) {
+		lock_sock(con->sock->sk);
+		if (test_and_clear_bit(CF_RECV_INTR, &con->flags)) {
+			release_sock(con->sock->sk);
+			goto again;
 		}
+
+		clear_bit(CF_RECV_PENDING, &con->flags);
+		release_sock(con->sock->sk);
+		free_processqueue_entry(pentry);
+		return DLM_IO_END;
+	} else if (ret == 0) {
+		/* close will clear CF_RECV_PENDING */
+		free_processqueue_entry(pentry);
+		return DLM_IO_EOF;
+	} else if (ret < 0) {
+		free_processqueue_entry(pentry);
+		return ret;
 	}
 
-	dlm_midcomms_receive_done(con->nodeid);
-	mutex_unlock(&con->sock_mutex);
-	return 0;
+	/* new buflen according readed bytes and leftover from last receive */
+	buflen_real = ret + con->rx_leftover;
+	ret = dlm_validate_incoming_buffer(con->nodeid, pentry->buf,
+					   buflen_real);
+	if (ret < 0) {
+		free_processqueue_entry(pentry);
+		return ret;
+	}
 
-out_resched:
-	if (!test_and_set_bit(CF_READ_PENDING, &con->flags))
-		queue_work(recv_workqueue, &con->rwork);
-	mutex_unlock(&con->sock_mutex);
-	return -EAGAIN;
-
-out_close:
-	if (ret == 0) {
-		log_print("connection %p got EOF from %d",
-			  con, con->nodeid);
-
-		if (dlm_proto_ops->eof_condition &&
-		    dlm_proto_ops->eof_condition(con)) {
-			set_bit(CF_EOF, &con->flags);
-			mutex_unlock(&con->sock_mutex);
-		} else {
-			mutex_unlock(&con->sock_mutex);
-			close_connection(con, false, true, false);
+	pentry->buflen = ret;
 
-			/* handling for tcp shutdown */
-			clear_bit(CF_SHUTDOWN, &con->flags);
-			wake_up(&con->shutdown_wait);
-		}
+	/* calculate leftover bytes from process and put it into begin of
+	 * the receive buffer, so next receive we have the full message
+	 * at the start address of the receive buffer.
+	 */
+	con->rx_leftover = buflen_real - ret;
+	memmove(con->rx_leftover_buf, pentry->buf + ret,
+		con->rx_leftover);
 
-		/* signal to breaking receive worker */
-		ret = -1;
-	} else {
-		mutex_unlock(&con->sock_mutex);
+	spin_lock(&processqueue_lock);
+	list_add_tail(&pentry->list, &processqueue);
+	if (!process_dlm_messages_pending) {
+		process_dlm_messages_pending = true;
+		queue_work(process_workqueue, &process_work);
 	}
-	return ret;
+	spin_unlock(&processqueue_lock);
+
+	return DLM_IO_SUCCESS;
 }
 
 /* Listening socket is busy, accept a connection */
-static int accept_from_sock(struct listen_connection *con)
+static int accept_from_sock(void)
 {
-	int result;
+	struct connection *newcon, *addcon;
 	struct sockaddr_storage peeraddr;
+	int len, idx, result, nodeid;
 	struct socket *newsock;
-	int len, idx;
-	int nodeid;
-	struct connection *newcon;
-	struct connection *addcon;
 	unsigned int mark;
 
-	if (!con->sock)
-		return -ENOTCONN;
-
-	result = kernel_accept(con->sock, &newsock, O_NONBLOCK);
-	if (result < 0)
+	result = kernel_accept(listen_con.sock, &newsock, O_NONBLOCK);
+	if (result == -EAGAIN)
+		return DLM_IO_END;
+	else if (result < 0)
 		goto accept_err;
 
 	/* Get the connected socket's peer */
@@ -1062,16 +976,16 @@ static int accept_from_sock(struct listen_connection *con)
 	 *  In this case we store the incoming one in "othercon"
 	 */
 	idx = srcu_read_lock(&connections_srcu);
-	newcon = nodeid2con(nodeid, GFP_NOFS);
-	if (!newcon) {
+	newcon = nodeid2con(nodeid, 0);
+	if (WARN_ON_ONCE(!newcon)) {
 		srcu_read_unlock(&connections_srcu, idx);
-		result = -ENOMEM;
+		result = -ENOENT;
 		goto accept_err;
 	}
 
 	sock_set_mark(newsock->sk, mark);
 
-	mutex_lock(&newcon->sock_mutex);
+	down_write(&newcon->sock_lock);
 	if (newcon->sock) {
 		struct connection *othercon = newcon->othercon;
 
@@ -1079,33 +993,24 @@ static int accept_from_sock(struct listen_connection *con)
 			othercon = kzalloc(sizeof(*othercon), GFP_NOFS);
 			if (!othercon) {
 				log_print("failed to allocate incoming socket");
-				mutex_unlock(&newcon->sock_mutex);
+				up_write(&newcon->sock_lock);
 				srcu_read_unlock(&connections_srcu, idx);
 				result = -ENOMEM;
 				goto accept_err;
 			}
 
-			result = dlm_con_init(othercon, nodeid);
-			if (result < 0) {
-				kfree(othercon);
-				mutex_unlock(&newcon->sock_mutex);
-				srcu_read_unlock(&connections_srcu, idx);
-				goto accept_err;
-			}
-
-			lockdep_set_subclass(&othercon->sock_mutex, 1);
-			set_bit(CF_IS_OTHERCON, &othercon->flags);
+			dlm_con_init(othercon, nodeid);
+			lockdep_set_subclass(&othercon->sock_lock, 1);
 			newcon->othercon = othercon;
-			othercon->sendcon = newcon;
 		} else {
 			/* close other sock con if we have something new */
-			close_connection(othercon, false, true, false);
+			close_connection(othercon, false);
 		}
 
-		mutex_lock(&othercon->sock_mutex);
+		down_write(&othercon->sock_lock);
 		add_sock(newsock, othercon);
 		addcon = othercon;
-		mutex_unlock(&othercon->sock_mutex);
+		up_write(&othercon->sock_lock);
 	}
 	else {
 		/* accept copies the sk after we've saved the callbacks, so we
@@ -1114,28 +1019,29 @@ static int accept_from_sock(struct listen_connection *con)
 		add_sock(newsock, newcon);
 		addcon = newcon;
 	}
-
-	set_bit(CF_CONNECTED, &addcon->flags);
-	mutex_unlock(&newcon->sock_mutex);
+	up_write(&newcon->sock_lock);
 
 	/*
 	 * Add it to the active queue in case we got data
 	 * between processing the accept adding the socket
 	 * to the read_sockets list
 	 */
-	if (!test_and_set_bit(CF_READ_PENDING, &addcon->flags))
-		queue_work(recv_workqueue, &addcon->rwork);
-
+	lock_sock(addcon->sock->sk);
+	lowcomms_queue_rwork(addcon);
+	release_sock(addcon->sock->sk);
+
+	spin_lock_bh(&addcon->writequeue_lock);
+	if (!list_empty(&addcon->writequeue))
+		lowcomms_queue_swork(addcon);
+	spin_unlock_bh(&addcon->writequeue_lock);
 	srcu_read_unlock(&connections_srcu, idx);
 
-	return 0;
+	return DLM_IO_SUCCESS;
 
 accept_err:
 	if (newsock)
 		sock_release(newsock);
 
-	if (result != -EAGAIN)
-		log_print("error accepting connection from node: %d", result);
 	return result;
 }
 
@@ -1167,7 +1073,7 @@ static int sctp_bind_addrs(struct socket *sock, uint16_t port)
 	int i, addr_len, result = 0;
 
 	for (i = 0; i < dlm_local_count; i++) {
-		memcpy(&localaddr, dlm_local_addr[i], sizeof(localaddr));
+		memcpy(&localaddr, &dlm_local_addr[i], sizeof(localaddr));
 		make_sockaddr(&localaddr, port, &addr_len);
 
 		if (!i)
@@ -1187,7 +1093,7 @@ static int sctp_bind_addrs(struct socket *sock, uint16_t port)
 /* Get local addresses */
 static void init_local(void)
 {
-	struct sockaddr_storage sas, *addr;
+	struct sockaddr_storage sas;
 	int i;
 
 	dlm_local_count = 0;
@@ -1195,21 +1101,10 @@ static void init_local(void)
 		if (dlm_our_addr(&sas, i))
 			break;
 
-		addr = kmemdup(&sas, sizeof(*addr), GFP_NOFS);
-		if (!addr)
-			break;
-		dlm_local_addr[dlm_local_count++] = addr;
+		memcpy(&dlm_local_addr[dlm_local_count++], &sas, sizeof(sas));
 	}
 }
 
-static void deinit_local(void)
-{
-	int i;
-
-	for (i = 0; i < dlm_local_count; i++)
-		kfree(dlm_local_addr[i]);
-}
-
 static struct writequeue_entry *new_writequeue_entry(struct connection *con)
 {
 	struct writequeue_entry *entry;
@@ -1240,7 +1135,7 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 {
 	struct writequeue_entry *e;
 
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	if (!list_empty(&con->writequeue)) {
 		e = list_last_entry(&con->writequeue, struct writequeue_entry, list);
 		if (DLM_WQ_REMAIN_BYTES(e) >= len) {
@@ -1263,14 +1158,13 @@ static struct writequeue_entry *new_wq_entry(struct connection *con, int len,
 	kref_get(&e->ref);
 	*ppc = page_address(e->page);
 	e->end += len;
-	atomic_inc(&con->writequeue_cnt);
 	if (cb)
 		cb(data);
 
 	list_add_tail(&e->list, &con->writequeue);
 
 out:
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 	return e;
 };
 
@@ -1319,13 +1213,13 @@ struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
 	    len < sizeof(struct dlm_header)) {
 		BUILD_BUG_ON(PAGE_SIZE < DLM_MAX_SOCKET_BUFSIZE);
 		log_print("failed to allocate a buffer of size %d", len);
-		WARN_ON(1);
+		WARN_ON_ONCE(1);
 		return NULL;
 	}
 
 	idx = srcu_read_lock(&connections_srcu);
-	con = nodeid2con(nodeid, allocation);
-	if (!con) {
+	con = nodeid2con(nodeid, 0);
+	if (WARN_ON_ONCE(!con)) {
 		srcu_read_unlock(&connections_srcu, idx);
 		return NULL;
 	}
@@ -1350,7 +1244,7 @@ static void _dlm_lowcomms_commit_msg(struct dlm_msg *msg)
 	struct connection *con = e->con;
 	int users;
 
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	kref_get(&msg->ref);
 	list_add(&msg->list, &e->msgs);
 
@@ -1359,13 +1253,11 @@ static void _dlm_lowcomms_commit_msg(struct dlm_msg *msg)
 		goto out;
 
 	e->len = DLM_WQ_LENGTH_BYTES(e);
-	spin_unlock(&con->writequeue_lock);
 
-	queue_work(send_workqueue, &con->swork);
-	return;
+	lowcomms_queue_swork(con);
 
 out:
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
 	return;
 }
 
@@ -1413,95 +1305,79 @@ int dlm_lowcomms_resend_msg(struct dlm_msg *msg)
 }
 
 /* Send a message */
-static void send_to_sock(struct connection *con)
+static int send_to_sock(struct connection *con)
 {
 	const int msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
 	struct writequeue_entry *e;
 	int len, offset, ret;
-	int count;
-
-again:
-	count = 0;
-
-	mutex_lock(&con->sock_mutex);
-	if (con->sock == NULL)
-		goto out_connect;
-
-	spin_lock(&con->writequeue_lock);
-	for (;;) {
-		e = con_next_wq(con);
-		if (!e)
-			break;
 
-		len = e->len;
-		offset = e->offset;
-		BUG_ON(len == 0 && e->users == 0);
-		spin_unlock(&con->writequeue_lock);
-
-		ret = kernel_sendpage(con->sock, e->page, offset, len,
-				      msg_flags);
-		trace_dlm_send(con->nodeid, ret);
-		if (ret == -EAGAIN || ret == 0) {
-			if (ret == -EAGAIN &&
-			    test_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags) &&
-			    !test_and_set_bit(CF_APP_LIMITED, &con->flags)) {
-				/* Notify TCP that we're limited by the
-				 * application window size.
-				 */
-				set_bit(SOCK_NOSPACE, &con->sock->flags);
-				con->sock->sk->sk_write_pending++;
-			}
-			cond_resched();
-			goto out;
-		} else if (ret < 0)
-			goto out;
+	spin_lock_bh(&con->writequeue_lock);
+	e = con_next_wq(con);
+	if (!e) {
+		clear_bit(CF_SEND_PENDING, &con->flags);
+		spin_unlock_bh(&con->writequeue_lock);
+		return DLM_IO_END;
+	}
 
-		spin_lock(&con->writequeue_lock);
-		writequeue_entry_complete(e, ret);
+	len = e->len;
+	offset = e->offset;
+	WARN_ON_ONCE(len == 0 && e->users == 0);
+	spin_unlock_bh(&con->writequeue_lock);
 
-		/* Don't starve people filling buffers */
-		if (++count >= MAX_SEND_MSG_COUNT) {
-			spin_unlock(&con->writequeue_lock);
-			mutex_unlock(&con->sock_mutex);
-			cond_resched();
-			goto again;
+	ret = kernel_sendpage(con->sock, e->page, offset, len,
+			      msg_flags);
+	trace_dlm_send(con->nodeid, ret);
+	if (ret == -EAGAIN || ret == 0) {
+		lock_sock(con->sock->sk);
+		spin_lock_bh(&con->writequeue_lock);
+		if (test_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags) &&
+		    !test_and_set_bit(CF_APP_LIMITED, &con->flags)) {
+			/* Notify TCP that we're limited by the
+			 * application window size.
+			 */
+			set_bit(SOCK_NOSPACE, &con->sock->sk->sk_socket->flags);
+			con->sock->sk->sk_write_pending++;
+
+			clear_bit(CF_SEND_PENDING, &con->flags);
+			spin_unlock_bh(&con->writequeue_lock);
+			release_sock(con->sock->sk);
+
+			/* wait for write_space() event */
+			return DLM_IO_END;
 		}
-	}
-	spin_unlock(&con->writequeue_lock);
-
-	/* close if we got EOF */
-	if (test_and_clear_bit(CF_EOF, &con->flags)) {
-		mutex_unlock(&con->sock_mutex);
-		close_connection(con, false, false, true);
+		spin_unlock_bh(&con->writequeue_lock);
+		release_sock(con->sock->sk);
 
-		/* handling for tcp shutdown */
-		clear_bit(CF_SHUTDOWN, &con->flags);
-		wake_up(&con->shutdown_wait);
-	} else {
-		mutex_unlock(&con->sock_mutex);
+		return DLM_IO_RESCHED;
+	} else if (ret < 0) {
+		return ret;
 	}
 
-	return;
-
-out:
-	mutex_unlock(&con->sock_mutex);
-	return;
+	spin_lock_bh(&con->writequeue_lock);
+	writequeue_entry_complete(e, ret);
+	spin_unlock_bh(&con->writequeue_lock);
 
-out_connect:
-	mutex_unlock(&con->sock_mutex);
-	queue_work(send_workqueue, &con->swork);
-	cond_resched();
+	return DLM_IO_SUCCESS;
 }
 
 static void clean_one_writequeue(struct connection *con)
 {
 	struct writequeue_entry *e, *safe;
 
-	spin_lock(&con->writequeue_lock);
+	spin_lock_bh(&con->writequeue_lock);
 	list_for_each_entry_safe(e, safe, &con->writequeue, list) {
 		free_entry(e);
 	}
-	spin_unlock(&con->writequeue_lock);
+	spin_unlock_bh(&con->writequeue_lock);
+}
+
+static void connection_release(struct rcu_head *rcu)
+{
+	struct connection *con = container_of(rcu, struct connection, rcu);
+
+	WARN_ON_ONCE(!list_empty(&con->writequeue));
+	WARN_ON_ONCE(con->sock);
+	kfree(con);
 }
 
 /* Called from recovery when it knows that a node has
@@ -1509,290 +1385,285 @@ static void clean_one_writequeue(struct connection *con)
 int dlm_lowcomms_close(int nodeid)
 {
 	struct connection *con;
-	struct dlm_node_addr *na;
 	int idx;
 
 	log_print("closing connection to node %d", nodeid);
+
 	idx = srcu_read_lock(&connections_srcu);
 	con = nodeid2con(nodeid, 0);
-	if (con) {
-		set_bit(CF_CLOSE, &con->flags);
-		close_connection(con, true, true, true);
-		clean_one_writequeue(con);
-		if (con->othercon)
-			clean_one_writequeue(con->othercon);
+	if (WARN_ON_ONCE(!con)) {
+		srcu_read_unlock(&connections_srcu, idx);
+		return -ENOENT;
 	}
-	srcu_read_unlock(&connections_srcu, idx);
 
-	spin_lock(&dlm_node_addrs_spin);
-	na = find_node_addr(nodeid);
-	if (na) {
-		list_del(&na->list);
-		while (na->addr_count--)
-			kfree(na->addr[na->addr_count]);
-		kfree(na);
+	spin_lock(&connections_lock);
+	hlist_del_rcu(&con->list);
+	spin_unlock(&connections_lock);
+
+	stop_connection_io(con);
+	close_connection(con, true);
+
+	clean_one_writequeue(con);
+	call_srcu(&connections_srcu, &con->rcu, connection_release);
+	if (con->othercon) {
+		clean_one_writequeue(con->othercon);
+		if (con->othercon)
+			call_srcu(&connections_srcu, &con->othercon->rcu, connection_release);
 	}
-	spin_unlock(&dlm_node_addrs_spin);
+	srcu_read_unlock(&connections_srcu, idx);
 
 	return 0;
 }
 
-/* Receive workqueue function */
+/* Receive worker function */
 static void process_recv_sockets(struct work_struct *work)
 {
 	struct connection *con = container_of(work, struct connection, rwork);
+	int ret, buflen;
 
-	clear_bit(CF_READ_PENDING, &con->flags);
-	receive_from_sock(con);
+	down_read(&con->sock_lock);
+	if (!con->sock) {
+		up_read(&con->sock_lock);
+		return;
+	}
+
+	buflen = READ_ONCE(dlm_config.ci_buffer_size);
+	do {
+		ret = receive_from_sock(con, buflen);
+	} while (ret == DLM_IO_SUCCESS);
+	up_read(&con->sock_lock);
+
+	switch (ret) {
+	case DLM_IO_END:
+		dlm_midcomms_receive_done(con->nodeid);
+		break;
+	case DLM_IO_EOF:
+		close_connection(con, false);
+		break;
+	case DLM_IO_RESCHED:
+		cond_resched();
+		queue_work(io_workqueue, &con->rwork);
+		break;
+	default:
+		if (ret < 0) {
+			log_print("node %d recv error %d", con->nodeid, ret);
+			close_connection(con, false);
+			dlm_midcomms_unack_msg_resend(con->nodeid);
+			break;
+		}
+
+		WARN_ON_ONCE(1);
+		break;
+	}
 }
 
 static void process_listen_recv_socket(struct work_struct *work)
 {
 	int ret;
 
+	if (WARN_ON_ONCE(!listen_con.sock))
+		return;
+
 	do {
-		ret = accept_from_sock(&listen_con);
-	} while (!ret);
+		ret = accept_from_sock();
+	} while (ret == DLM_IO_SUCCESS);
+
+	if (ret < 0)
+		log_print("critical error accepting connection: %d", ret);
 }
 
-static void dlm_connect(struct connection *con)
+static int dlm_connect(struct connection *con)
 {
 	struct sockaddr_storage addr;
 	int result, addr_len;
 	struct socket *sock;
 	unsigned int mark;
 
-	/* Some odd races can cause double-connects, ignore them */
-	if (con->retries++ > MAX_CONNECT_RETRIES)
-		return;
-
-	if (con->sock) {
-		log_print("node %d already connected.", con->nodeid);
-		return;
-	}
-
 	memset(&addr, 0, sizeof(addr));
 	result = nodeid_to_addr(con->nodeid, &addr, NULL,
 				dlm_proto_ops->try_new_addr, &mark);
 	if (result < 0) {
 		log_print("no address for nodeid %d", con->nodeid);
-		return;
+		return result;
 	}
 
 	/* Create a socket to communicate with */
-	result = sock_create_kern(&init_net, dlm_local_addr[0]->ss_family,
+	result = sock_create_kern(&init_net, dlm_local_addr[0].ss_family,
 				  SOCK_STREAM, dlm_proto_ops->proto, &sock);
 	if (result < 0)
-		goto socket_err;
+		return result;
 
 	sock_set_mark(sock->sk, mark);
 	dlm_proto_ops->sockopts(sock);
 
-	add_sock(sock, con);
-
 	result = dlm_proto_ops->bind(sock);
-	if (result < 0)
-		goto add_sock_err;
+	if (result < 0) {
+		sock_release(sock);
+		return result;
+	}
+
+	add_sock(sock, con);
 
 	log_print_ratelimited("connecting to %d", con->nodeid);
 	make_sockaddr(&addr, dlm_config.ci_tcp_port, &addr_len);
 	result = dlm_proto_ops->connect(con, sock, (struct sockaddr *)&addr,
 					addr_len);
-	if (result < 0)
-		goto add_sock_err;
-
-	return;
-
-add_sock_err:
-	dlm_close_sock(&con->sock);
+	switch (result) {
+	case -EINPROGRESS:
+		/* not an error */
+		fallthrough;
+	case 0:
+		break;
+	default:
+		if (result < 0)
+			dlm_close_sock(&con->sock);
 
-socket_err:
-	/*
-	 * Some errors are fatal and this list might need adjusting. For other
-	 * errors we try again until the max number of retries is reached.
-	 */
-	if (result != -EHOSTUNREACH &&
-	    result != -ENETUNREACH &&
-	    result != -ENETDOWN &&
-	    result != -EINVAL &&
-	    result != -EPROTONOSUPPORT) {
-		log_print("connect %d try %d error %d", con->nodeid,
-			  con->retries, result);
-		msleep(1000);
-		lowcomms_connect_sock(con);
+		break;
 	}
+
+	return result;
 }
 
-/* Send workqueue function */
+/* Send worker function */
 static void process_send_sockets(struct work_struct *work)
 {
 	struct connection *con = container_of(work, struct connection, swork);
+	int ret;
 
-	WARN_ON(test_bit(CF_IS_OTHERCON, &con->flags));
-
-	clear_bit(CF_WRITE_PENDING, &con->flags);
-
-	if (test_and_clear_bit(CF_RECONNECT, &con->flags)) {
-		close_connection(con, false, false, true);
-		dlm_midcomms_unack_msg_resend(con->nodeid);
+	down_read(&con->sock_lock);
+	if (!con->sock) {
+		up_read(&con->sock_lock);
+		down_write(&con->sock_lock);
+		if (!con->sock) {
+			ret = dlm_connect(con);
+			switch (ret) {
+			case 0:
+				break;
+			case -EINPROGRESS:
+				up_write(&con->sock_lock);
+				cond_resched();
+				queue_work(io_workqueue, &con->swork);
+				return;
+			default:
+				up_write(&con->sock_lock);
+				log_print("connect to node %d try %d error %d",
+					  con->nodeid, con->retries++, ret);
+				msleep(1000);
+				/* For now we try forever to reconnect. In
+				 * future we should send a event to cluster
+				 * manager to fence itself after certain amount
+				 * of retries.
+				 */
+				queue_work(io_workqueue, &con->swork);
+				return;
+			}
+		}
+		downgrade_write(&con->sock_lock);
 	}
 
-	if (con->sock == NULL) {
-		if (test_and_clear_bit(CF_DELAY_CONNECT, &con->flags))
-			msleep(1000);
+	do {
+		ret = send_to_sock(con);
+	} while (ret == DLM_IO_SUCCESS);
+	up_read(&con->sock_lock);
 
-		mutex_lock(&con->sock_mutex);
-		dlm_connect(con);
-		mutex_unlock(&con->sock_mutex);
-	}
+	switch (ret) {
+	case DLM_IO_END:
+		break;
+	case DLM_IO_RESCHED:
+		cond_resched();
+		queue_work(io_workqueue, &con->swork);
+		break;
+	default:
+		if (ret < 0) {
+			log_print("node %d send error %d", con->nodeid, ret);
+			close_connection(con, false);
+			dlm_midcomms_unack_msg_resend(con->nodeid);
+			break;
+		}
 
-	if (!list_empty(&con->writequeue))
-		send_to_sock(con);
+		WARN_ON_ONCE(1);
+		break;
+	}
 }
 
 static void work_stop(void)
 {
-	if (recv_workqueue) {
-		destroy_workqueue(recv_workqueue);
-		recv_workqueue = NULL;
+	if (io_workqueue) {
+		destroy_workqueue(io_workqueue);
+		io_workqueue = NULL;
 	}
 
-	if (send_workqueue) {
-		destroy_workqueue(send_workqueue);
-		send_workqueue = NULL;
+	if (process_workqueue) {
+		destroy_workqueue(process_workqueue);
+		process_workqueue = NULL;
 	}
 }
 
 static int work_start(void)
 {
-	recv_workqueue = alloc_ordered_workqueue("dlm_recv", WQ_MEM_RECLAIM);
-	if (!recv_workqueue) {
-		log_print("can't start dlm_recv");
+	io_workqueue = alloc_workqueue("dlm_io", WQ_HIGHPRI | WQ_MEM_RECLAIM,
+				       0);
+	if (!io_workqueue) {
+		log_print("can't start dlm_io");
 		return -ENOMEM;
 	}
 
-	send_workqueue = alloc_ordered_workqueue("dlm_send", WQ_MEM_RECLAIM);
-	if (!send_workqueue) {
-		log_print("can't start dlm_send");
-		destroy_workqueue(recv_workqueue);
-		recv_workqueue = NULL;
+	/* ordered dlm message process queue,
+	 * should be converted to a tasklet
+	 */
+	process_workqueue = alloc_ordered_workqueue("dlm_process",
+						    WQ_HIGHPRI | WQ_MEM_RECLAIM);
+	if (!process_workqueue) {
+		log_print("can't start dlm_process");
+		destroy_workqueue(io_workqueue);
+		io_workqueue = NULL;
 		return -ENOMEM;
 	}
 
 	return 0;
 }
 
-static void shutdown_conn(struct connection *con)
-{
-	if (dlm_proto_ops->shutdown_action)
-		dlm_proto_ops->shutdown_action(con);
-}
-
 void dlm_lowcomms_shutdown(void)
 {
-	int idx;
-
-	/* Set all the flags to prevent any
-	 * socket activity.
-	 */
-	dlm_allow_conn = 0;
-
-	if (recv_workqueue)
-		flush_workqueue(recv_workqueue);
-	if (send_workqueue)
-		flush_workqueue(send_workqueue);
+	/* stop lowcomms_listen_data_ready calls */
+	lock_sock(listen_con.sock->sk);
+	listen_con.sock->sk->sk_data_ready = listen_sock.sk_data_ready;
+	release_sock(listen_con.sock->sk);
 
+	cancel_work_sync(&listen_con.rwork);
 	dlm_close_sock(&listen_con.sock);
 
-	idx = srcu_read_lock(&connections_srcu);
-	foreach_conn(shutdown_conn);
-	srcu_read_unlock(&connections_srcu, idx);
-}
-
-static void _stop_conn(struct connection *con, bool and_other)
-{
-	mutex_lock(&con->sock_mutex);
-	set_bit(CF_CLOSE, &con->flags);
-	set_bit(CF_READ_PENDING, &con->flags);
-	set_bit(CF_WRITE_PENDING, &con->flags);
-	if (con->sock && con->sock->sk) {
-		lock_sock(con->sock->sk);
-		con->sock->sk->sk_user_data = NULL;
-		release_sock(con->sock->sk);
-	}
-	if (con->othercon && and_other)
-		_stop_conn(con->othercon, false);
-	mutex_unlock(&con->sock_mutex);
+	flush_workqueue(process_workqueue);
 }
 
-static void stop_conn(struct connection *con)
+void dlm_lowcomms_shutdown_node(int nodeid, bool force)
 {
-	_stop_conn(con, true);
-}
+	struct connection *con;
+	int idx;
 
-static void connection_release(struct rcu_head *rcu)
-{
-	struct connection *con = container_of(rcu, struct connection, rcu);
+	idx = srcu_read_lock(&connections_srcu);
+	con = nodeid2con(nodeid, 0);
+	if (WARN_ON_ONCE(!con)) {
+		srcu_read_unlock(&connections_srcu, idx);
+		return;
+	}
 
-	kfree(con->rx_buf);
-	kfree(con);
-}
+	flush_work(&con->swork);
+	stop_connection_io(con);
+	WARN_ON_ONCE(!force && !list_empty(&con->writequeue));
 
-static void free_conn(struct connection *con)
-{
-	close_connection(con, true, true, true);
-	spin_lock(&connections_lock);
-	hlist_del_rcu(&con->list);
-	spin_unlock(&connections_lock);
-	if (con->othercon) {
-		clean_one_writequeue(con->othercon);
-		call_srcu(&connections_srcu, &con->othercon->rcu,
-			  connection_release);
-	}
 	clean_one_writequeue(con);
-	call_srcu(&connections_srcu, &con->rcu, connection_release);
-}
-
-static void work_flush(void)
-{
-	int ok;
-	int i;
-	struct connection *con;
+	if (con->othercon)
+		clean_one_writequeue(con->othercon);
 
-	do {
-		ok = 1;
-		foreach_conn(stop_conn);
-		if (recv_workqueue)
-			flush_workqueue(recv_workqueue);
-		if (send_workqueue)
-			flush_workqueue(send_workqueue);
-		for (i = 0; i < CONN_HASH_SIZE && ok; i++) {
-			hlist_for_each_entry_rcu(con, &connection_hash[i],
-						 list) {
-				ok &= test_bit(CF_READ_PENDING, &con->flags);
-				ok &= test_bit(CF_WRITE_PENDING, &con->flags);
-				if (con->othercon) {
-					ok &= test_bit(CF_READ_PENDING,
-						       &con->othercon->flags);
-					ok &= test_bit(CF_WRITE_PENDING,
-						       &con->othercon->flags);
-				}
-			}
-		}
-	} while (!ok);
+	close_connection(con, true);
+	allow_connection_io(con);
+	srcu_read_unlock(&connections_srcu, idx);
 }
 
 void dlm_lowcomms_stop(void)
 {
-	int idx;
-
-	idx = srcu_read_lock(&connections_srcu);
-	work_flush();
-	foreach_conn(free_conn);
-	srcu_read_unlock(&connections_srcu, idx);
 	work_stop();
-	deinit_local();
-
 	dlm_proto_ops = NULL;
 }
 
@@ -1808,7 +1679,7 @@ static int dlm_listen_for_all(void)
 	if (result < 0)
 		return result;
 
-	result = sock_create_kern(&init_net, dlm_local_addr[0]->ss_family,
+	result = sock_create_kern(&init_net, dlm_local_addr[0].ss_family,
 				  SOCK_STREAM, dlm_proto_ops->proto, &sock);
 	if (result < 0) {
 		log_print("Can't create comms socket: %d", result);
@@ -1822,10 +1693,18 @@ static int dlm_listen_for_all(void)
 	if (result < 0)
 		goto out;
 
-	save_listen_callbacks(sock);
-	add_listen_sock(sock, &listen_con);
+	lock_sock(sock->sk);
+	listen_sock.sk_data_ready = sock->sk->sk_data_ready;
+	listen_sock.sk_write_space = sock->sk->sk_write_space;
+	listen_sock.sk_error_report = sock->sk->sk_error_report;
+	listen_sock.sk_state_change = sock->sk->sk_state_change;
+
+	listen_con.sock = sock;
+
+	sock->sk->sk_allocation = GFP_NOFS;
+	sock->sk->sk_data_ready = lowcomms_listen_data_ready;
+	release_sock(sock->sk);
 
-	INIT_WORK(&listen_con.rwork, process_listen_recv_socket);
 	result = sock->ops->listen(sock, 5);
 	if (result < 0) {
 		dlm_close_sock(&listen_con.sock);
@@ -1847,7 +1726,7 @@ static int dlm_tcp_bind(struct socket *sock)
 	/* Bind to our cluster-known address connecting to avoid
 	 * routing problems.
 	 */
-	memcpy(&src_addr, dlm_local_addr[0], sizeof(src_addr));
+	memcpy(&src_addr, &dlm_local_addr[0], sizeof(src_addr));
 	make_sockaddr(&src_addr, 0, &addr_len);
 
 	result = sock->ops->bind(sock, (struct sockaddr *)&src_addr,
@@ -1863,17 +1742,7 @@ static int dlm_tcp_bind(struct socket *sock)
 static int dlm_tcp_connect(struct connection *con, struct socket *sock,
 			   struct sockaddr *addr, int addr_len)
 {
-	int ret;
-
-	ret = sock->ops->connect(sock, addr, addr_len, O_NONBLOCK);
-	switch (ret) {
-	case -EINPROGRESS:
-		fallthrough;
-	case 0:
-		return 0;
-	}
-
-	return ret;
+	return sock->ops->connect(sock, addr, addr_len, O_NONBLOCK);
 }
 
 static int dlm_tcp_listen_validate(void)
@@ -1904,8 +1773,8 @@ static int dlm_tcp_listen_bind(struct socket *sock)
 	int addr_len;
 
 	/* Bind to our port */
-	make_sockaddr(dlm_local_addr[0], dlm_config.ci_tcp_port, &addr_len);
-	return sock->ops->bind(sock, (struct sockaddr *)dlm_local_addr[0],
+	make_sockaddr(&dlm_local_addr[0], dlm_config.ci_tcp_port, &addr_len);
+	return sock->ops->bind(sock, (struct sockaddr *)&dlm_local_addr[0],
 			       addr_len);
 }
 
@@ -1918,8 +1787,6 @@ static const struct dlm_proto_ops dlm_tcp_ops = {
 	.listen_validate = dlm_tcp_listen_validate,
 	.listen_sockopts = dlm_tcp_listen_sockopts,
 	.listen_bind = dlm_tcp_listen_bind,
-	.shutdown_action = dlm_tcp_shutdown,
-	.eof_condition = tcp_eof_condition,
 };
 
 static int dlm_sctp_bind(struct socket *sock)
@@ -1940,13 +1807,7 @@ static int dlm_sctp_connect(struct connection *con, struct socket *sock,
 	sock_set_sndtimeo(sock->sk, 5);
 	ret = sock->ops->connect(sock, addr, addr_len, 0);
 	sock_set_sndtimeo(sock->sk, 0);
-	if (ret < 0)
-		return ret;
-
-	if (!test_and_set_bit(CF_CONNECTED, &con->flags))
-		log_print("connected to node %d", con->nodeid);
-
-	return 0;
+	return ret;
 }
 
 static int dlm_sctp_listen_validate(void)
@@ -1986,11 +1847,7 @@ static const struct dlm_proto_ops dlm_sctp_ops = {
 
 int dlm_lowcomms_start(void)
 {
-	int error = -EINVAL;
-	int i;
-
-	for (i = 0; i < CONN_HASH_SIZE; i++)
-		INIT_HLIST_HEAD(&connection_hash[i]);
+	int error;
 
 	init_local();
 	if (!dlm_local_count) {
@@ -1999,13 +1856,9 @@ int dlm_lowcomms_start(void)
 		goto fail;
 	}
 
-	INIT_WORK(&listen_con.rwork, process_listen_recv_socket);
-
 	error = work_start();
 	if (error)
-		goto fail_local;
-
-	dlm_allow_conn = 1;
+		goto fail;
 
 	/* Start listening */
 	switch (dlm_config.ci_protocol) {
@@ -2031,24 +1884,38 @@ int dlm_lowcomms_start(void)
 fail_listen:
 	dlm_proto_ops = NULL;
 fail_proto_ops:
-	dlm_allow_conn = 0;
 	work_stop();
-fail_local:
-	deinit_local();
 fail:
 	return error;
 }
 
+void dlm_lowcomms_init(void)
+{
+	int i;
+
+	for (i = 0; i < CONN_HASH_SIZE; i++)
+		INIT_HLIST_HEAD(&connection_hash[i]);
+
+	INIT_WORK(&listen_con.rwork, process_listen_recv_socket);
+}
+
 void dlm_lowcomms_exit(void)
 {
-	struct dlm_node_addr *na, *safe;
+	struct connection *con;
+	int i, idx;
 
-	spin_lock(&dlm_node_addrs_spin);
-	list_for_each_entry_safe(na, safe, &dlm_node_addrs, list) {
-		list_del(&na->list);
-		while (na->addr_count--)
-			kfree(na->addr[na->addr_count]);
-		kfree(na);
+	idx = srcu_read_lock(&connections_srcu);
+	for (i = 0; i < CONN_HASH_SIZE; i++) {
+		hlist_for_each_entry_rcu(con, &connection_hash[i], list) {
+			spin_lock(&connections_lock);
+			hlist_del_rcu(&con->list);
+			spin_unlock(&connections_lock);
+
+			if (con->othercon)
+				call_srcu(&connections_srcu, &con->othercon->rcu,
+					  connection_release);
+			call_srcu(&connections_srcu, &con->rcu, connection_release);
+		}
 	}
-	spin_unlock(&dlm_node_addrs_spin);
+	srcu_read_unlock(&connections_srcu, idx);
 }
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 29369feea991..3e8dca66183b 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -29,12 +29,14 @@ static inline int nodeid_hash(int nodeid)
 	return nodeid & (CONN_HASH_SIZE-1);
 }
 
-/* switch to check if dlm is running */
-extern int dlm_allow_conn;
+/* check if dlm is running */
+bool dlm_lowcomms_is_running(void);
 
 int dlm_lowcomms_start(void);
 void dlm_lowcomms_shutdown(void);
+void dlm_lowcomms_shutdown_node(int nodeid, bool force);
 void dlm_lowcomms_stop(void);
+void dlm_lowcomms_init(void);
 void dlm_lowcomms_exit(void);
 int dlm_lowcomms_close(int nodeid);
 struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
diff --git a/fs/dlm/main.c b/fs/dlm/main.c
index 1c5be4b70ac1..a77338be3237 100644
--- a/fs/dlm/main.c
+++ b/fs/dlm/main.c
@@ -17,7 +17,7 @@
 #include "user.h"
 #include "memory.h"
 #include "config.h"
-#include "lowcomms.h"
+#include "midcomms.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/dlm.h>
@@ -30,6 +30,8 @@ static int __init init_dlm(void)
 	if (error)
 		goto out;
 
+	dlm_midcomms_init();
+
 	error = dlm_lockspace_init();
 	if (error)
 		goto out_mem;
@@ -66,6 +68,7 @@ static int __init init_dlm(void)
  out_lockspace:
 	dlm_lockspace_exit();
  out_mem:
+	dlm_midcomms_exit();
 	dlm_memory_exit();
  out:
 	return error;
@@ -79,7 +82,7 @@ static void __exit exit_dlm(void)
 	dlm_config_exit();
 	dlm_memory_exit();
 	dlm_lockspace_exit();
-	dlm_lowcomms_exit();
+	dlm_midcomms_exit();
 	dlm_unregister_debugfs();
 }
 
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 32194a750fe1..32a5d6478276 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -306,11 +306,11 @@ static void dlm_send_queue_flush(struct midcomms_node *node)
 	pr_debug("flush midcomms send queue of node %d\n", node->nodeid);
 
 	rcu_read_lock();
-	spin_lock(&node->send_queue_lock);
+	spin_lock_bh(&node->send_queue_lock);
 	list_for_each_entry_rcu(mh, &node->send_queue, list) {
 		dlm_mhandle_delete(node, mh);
 	}
-	spin_unlock(&node->send_queue_lock);
+	spin_unlock_bh(&node->send_queue_lock);
 	rcu_read_unlock();
 }
 
@@ -437,7 +437,7 @@ static void dlm_receive_ack(struct midcomms_node *node, uint32_t seq)
 		}
 	}
 
-	spin_lock(&node->send_queue_lock);
+	spin_lock_bh(&node->send_queue_lock);
 	list_for_each_entry_rcu(mh, &node->send_queue, list) {
 		if (before(mh->seq, seq)) {
 			dlm_mhandle_delete(node, mh);
@@ -446,7 +446,7 @@ static void dlm_receive_ack(struct midcomms_node *node, uint32_t seq)
 			break;
 		}
 	}
-	spin_unlock(&node->send_queue_lock);
+	spin_unlock_bh(&node->send_queue_lock);
 	rcu_read_unlock();
 }
 
@@ -890,12 +890,7 @@ static void dlm_midcomms_receive_buffer_3_1(union dlm_packet *p, int nodeid)
 	dlm_receive_buffer(p, nodeid);
 }
 
-/*
- * Called from the low-level comms layer to process a buffer of
- * commands.
- */
-
-int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
+int dlm_validate_incoming_buffer(int nodeid, unsigned char *buf, int len)
 {
 	const unsigned char *ptr = buf;
 	const struct dlm_header *hd;
@@ -930,6 +925,32 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 		if (msglen > len)
 			break;
 
+		ret += msglen;
+		len -= msglen;
+		ptr += msglen;
+	}
+
+	return ret;
+}
+/*
+ * Called from the low-level comms layer to process a buffer of
+ * commands.
+ */
+
+int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
+{
+	const unsigned char *ptr = buf;
+	const struct dlm_header *hd;
+	uint16_t msglen;
+	int ret = 0;
+
+	while (len >= sizeof(struct dlm_header)) {
+		hd = (struct dlm_header *)ptr;
+
+		msglen = le16_to_cpu(hd->h_length);
+		if (msglen > len)
+			break;
+
 		switch (hd->h_version) {
 		case cpu_to_le32(DLM_VERSION_3_1):
 			dlm_midcomms_receive_buffer_3_1((union dlm_packet *)ptr, nodeid);
@@ -1046,9 +1067,9 @@ static void midcomms_new_msg_cb(void *data)
 
 	atomic_inc(&mh->node->send_queue_cnt);
 
-	spin_lock(&mh->node->send_queue_lock);
+	spin_lock_bh(&mh->node->send_queue_lock);
 	list_add_tail_rcu(&mh->list, &mh->node->send_queue);
-	spin_unlock(&mh->node->send_queue_lock);
+	spin_unlock_bh(&mh->node->send_queue_lock);
 
 	mh->seq = mh->node->seq_send++;
 }
@@ -1203,13 +1224,28 @@ void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh,
 #endif
 
 int dlm_midcomms_start(void)
+{
+	return dlm_lowcomms_start();
+}
+
+void dlm_midcomms_stop(void)
+{
+	dlm_lowcomms_stop();
+}
+
+void dlm_midcomms_init(void)
 {
 	int i;
 
 	for (i = 0; i < CONN_HASH_SIZE; i++)
 		INIT_HLIST_HEAD(&node_hash[i]);
 
-	return dlm_lowcomms_start();
+	dlm_lowcomms_init();
+}
+
+void dlm_midcomms_exit(void)
+{
+	dlm_lowcomms_exit();
 }
 
 static void dlm_act_fin_ack_rcv(struct midcomms_node *node)
@@ -1409,11 +1445,13 @@ static void midcomms_shutdown(struct midcomms_node *node)
 		pr_debug("active shutdown timed out for node %d with state %s\n",
 			 node->nodeid, dlm_state_str(node->state));
 		midcomms_node_reset(node);
+		dlm_lowcomms_shutdown_node(node->nodeid, true);
 		return;
 	}
 
 	pr_debug("active shutdown done for node %d with state %s\n",
 		 node->nodeid, dlm_state_str(node->state));
+	dlm_lowcomms_shutdown_node(node->nodeid, false);
 }
 
 void dlm_midcomms_shutdown(void)
@@ -1421,6 +1459,8 @@ void dlm_midcomms_shutdown(void)
 	struct midcomms_node *node;
 	int i, idx;
 
+	dlm_lowcomms_shutdown();
+
 	mutex_lock(&close_lock);
 	idx = srcu_read_lock(&nodes_srcu);
 	for (i = 0; i < CONN_HASH_SIZE; i++) {
@@ -1438,8 +1478,6 @@ void dlm_midcomms_shutdown(void)
 	}
 	srcu_read_unlock(&nodes_srcu, idx);
 	mutex_unlock(&close_lock);
-
-	dlm_lowcomms_shutdown();
 }
 
 int dlm_midcomms_close(int nodeid)
diff --git a/fs/dlm/midcomms.h b/fs/dlm/midcomms.h
index d6286e80b077..bea1cee4279c 100644
--- a/fs/dlm/midcomms.h
+++ b/fs/dlm/midcomms.h
@@ -14,6 +14,7 @@
 
 struct midcomms_node;
 
+int dlm_validate_incoming_buffer(int nodeid, unsigned char *buf, int len);
 int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int buflen);
 struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 					     gfp_t allocation, char **ppc);
@@ -21,6 +22,9 @@ void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh, const void *name,
 				 int namelen);
 int dlm_midcomms_close(int nodeid);
 int dlm_midcomms_start(void);
+void dlm_midcomms_stop(void);
+void dlm_midcomms_init(void);
+void dlm_midcomms_exit(void);
 void dlm_midcomms_shutdown(void);
 void dlm_midcomms_add_member(int nodeid);
 void dlm_midcomms_remove_member(int nodeid);
-- 
2.31.1

