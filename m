Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6A532947C
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Mar 2021 23:05:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614636342;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UAWZEFZroo8ZZELfGHwlA/aRU+xg1rVrCHW7j3oCrzw=;
	b=RIi4x/81+OZHPsCezWWGl+sPe9HsnatyTeV6F71S62B7S84MTIPE4erNxiNpn545W0VGHL
	BUJWHIBF5wmgQAGi4gZMaOKCK1UEF6tPkAiOe4dPv8NcSxldZ/aYcLdD4aOeDTROjp6pSh
	pr4V8dVp4BzVD7vG3aRH9Aj+okAlvhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-9RRgRk4gORuZfvf-MhCYjg-1; Mon, 01 Mar 2021 17:05:40 -0500
X-MC-Unique: 9RRgRk4gORuZfvf-MhCYjg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29FF080196C;
	Mon,  1 Mar 2021 22:05:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC2D65C3E4;
	Mon,  1 Mar 2021 22:05:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DC3A18095CB;
	Mon,  1 Mar 2021 22:05:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 121M5U8s005892 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Mar 2021 17:05:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2238E1001B2C; Mon,  1 Mar 2021 22:05:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-35.rdu2.redhat.com [10.10.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E8A710013C1;
	Mon,  1 Mar 2021 22:05:29 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  1 Mar 2021 17:05:09 -0500
Message-Id: <20210301220520.514470-3-aahringo@redhat.com>
In-Reply-To: <20210301220520.514470-1-aahringo@redhat.com>
References: <20210301220520.514470-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 02/13] fs: dlm: fix mark setting
	deadlock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch fixes an deadlock issue when dlm_lowcomms_close() is called.
When dlm_lowcomms_close() is called the clusters_root.subsys.su_mutex is
held to remove configfs items. At this time we flushing (e.g.
cancel_work_sync()) the workers of send and recv workqueue. Due the fact
that we accessing configfs items (mark values), these workers will lock
clusters_root.subsys.su_mutex as well which are already hold by
dlm_lowcomms_close() and ends in a deadlock situation.

[67170.703046] ======================================================
[67170.703965] WARNING: possible circular locking dependency detected
[67170.704758] 5.11.0-rc4+ #22 Tainted: G        W
[67170.705433] ------------------------------------------------------
[67170.706228] dlm_controld/280 is trying to acquire lock:
[67170.706915] ffff9f2f475a6948 ((wq_completion)dlm_recv){+.+.}-{0:0}, at: __flush_work+0x203/0x4c0
[67170.708026]
               but task is already holding lock:
[67170.708758] ffffffffa132f878 (&clusters_root.subsys.su_mutex){+.+.}-{3:3}, at: configfs_rmdir+0x29b/0x310
[67170.710016]
               which lock already depends on the new lock.

The new behaviour adds the mark value to the node address configuration
which doesn't require to held the clusters_root.subsys.su_mutex by
accessing mark values in a separate datastructure. However the mark
values can be set now only after a node address was set which is the
case when the user is using dlm_controld.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c   | 29 ++++++++++------------------
 fs/dlm/config.h   |  1 -
 fs/dlm/lowcomms.c | 49 ++++++++++++++++++++++++++++++++---------------
 fs/dlm/lowcomms.h |  1 +
 4 files changed, 45 insertions(+), 35 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 49c5f9407098..582bffa09a66 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -688,6 +688,7 @@ static ssize_t comm_mark_show(struct config_item *item, char *buf)
 static ssize_t comm_mark_store(struct config_item *item, const char *buf,
 			       size_t len)
 {
+	struct dlm_comm *comm;
 	unsigned int mark;
 	int rc;
 
@@ -695,7 +696,15 @@ static ssize_t comm_mark_store(struct config_item *item, const char *buf,
 	if (rc)
 		return rc;
 
-	config_item_to_comm(item)->mark = mark;
+	if (mark == 0)
+		mark = dlm_config.ci_mark;
+
+	comm = config_item_to_comm(item);
+	rc = dlm_lowcomms_nodes_set_mark(comm->nodeid, mark);
+	if (rc)
+		return rc;
+
+	comm->mark = mark;
 	return len;
 }
 
@@ -870,24 +879,6 @@ int dlm_comm_seq(int nodeid, uint32_t *seq)
 	return 0;
 }
 
-void dlm_comm_mark(int nodeid, unsigned int *mark)
-{
-	struct dlm_comm *cm;
-
-	cm = get_comm(nodeid);
-	if (!cm) {
-		*mark = dlm_config.ci_mark;
-		return;
-	}
-
-	if (cm->mark)
-		*mark = cm->mark;
-	else
-		*mark = dlm_config.ci_mark;
-
-	put_comm(cm);
-}
-
 int dlm_our_nodeid(void)
 {
 	return local_comm ? local_comm->nodeid : 0;
diff --git a/fs/dlm/config.h b/fs/dlm/config.h
index c210250a2581..d2cd4bd20313 100644
--- a/fs/dlm/config.h
+++ b/fs/dlm/config.h
@@ -48,7 +48,6 @@ void dlm_config_exit(void);
 int dlm_config_nodes(char *lsname, struct dlm_config_node **nodes_out,
 		     int *count_out);
 int dlm_comm_seq(int nodeid, uint32_t *seq);
-void dlm_comm_mark(int nodeid, unsigned int *mark);
 int dlm_our_nodeid(void);
 int dlm_our_addr(struct sockaddr_storage *addr, int num);
 
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 372c34ff8594..440dce99d0d9 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -116,6 +116,7 @@ struct writequeue_entry {
 struct dlm_node_addr {
 	struct list_head list;
 	int nodeid;
+	int mark;
 	int addr_count;
 	int curr_addr_index;
 	struct sockaddr_storage *addr[DLM_MAX_ADDR_COUNT];
@@ -303,7 +304,8 @@ static int addr_compare(const struct sockaddr_storage *x,
 }
 
 static int nodeid_to_addr(int nodeid, struct sockaddr_storage *sas_out,
-			  struct sockaddr *sa_out, bool try_new_addr)
+			  struct sockaddr *sa_out, bool try_new_addr,
+			  unsigned int *mark)
 {
 	struct sockaddr_storage sas;
 	struct dlm_node_addr *na;
@@ -331,6 +333,8 @@ static int nodeid_to_addr(int nodeid, struct sockaddr_storage *sas_out,
 	if (!na->addr_count)
 		return -ENOENT;
 
+	*mark = na->mark;
+
 	if (sas_out)
 		memcpy(sas_out, &sas, sizeof(struct sockaddr_storage));
 
@@ -350,7 +354,8 @@ static int nodeid_to_addr(int nodeid, struct sockaddr_storage *sas_out,
 	return 0;
 }
 
-static int addr_to_nodeid(struct sockaddr_storage *addr, int *nodeid)
+static int addr_to_nodeid(struct sockaddr_storage *addr, int *nodeid,
+			  unsigned int *mark)
 {
 	struct dlm_node_addr *na;
 	int rv = -EEXIST;
@@ -364,6 +369,7 @@ static int addr_to_nodeid(struct sockaddr_storage *addr, int *nodeid)
 		for (addr_i = 0; addr_i < na->addr_count; addr_i++) {
 			if (addr_compare(na->addr[addr_i], addr)) {
 				*nodeid = na->nodeid;
+				*mark = na->mark;
 				rv = 0;
 				goto unlock;
 			}
@@ -412,6 +418,7 @@ int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len)
 		new_node->nodeid = nodeid;
 		new_node->addr[0] = new_addr;
 		new_node->addr_count = 1;
+		new_node->mark = dlm_config.ci_mark;
 		list_add(&new_node->list, &dlm_node_addrs);
 		spin_unlock(&dlm_node_addrs_spin);
 		return 0;
@@ -519,6 +526,23 @@ int dlm_lowcomms_connect_node(int nodeid)
 	return 0;
 }
 
+int dlm_lowcomms_nodes_set_mark(int nodeid, unsigned int mark)
+{
+	struct dlm_node_addr *na;
+
+	spin_lock(&dlm_node_addrs_spin);
+	na = find_node_addr(nodeid);
+	if (!na) {
+		spin_unlock(&dlm_node_addrs_spin);
+		return -ENOENT;
+	}
+
+	na->mark = mark;
+	spin_unlock(&dlm_node_addrs_spin);
+
+	return 0;
+}
+
 static void lowcomms_error_report(struct sock *sk)
 {
 	struct connection *con;
@@ -867,7 +891,7 @@ static int accept_from_sock(struct listen_connection *con)
 
 	/* Get the new node's NODEID */
 	make_sockaddr(&peeraddr, 0, &len);
-	if (addr_to_nodeid(&peeraddr, &nodeid)) {
+	if (addr_to_nodeid(&peeraddr, &nodeid, &mark)) {
 		unsigned char *b=(unsigned char *)&peeraddr;
 		log_print("connect from non cluster node");
 		print_hex_dump_bytes("ss: ", DUMP_PREFIX_NONE, 
@@ -876,9 +900,6 @@ static int accept_from_sock(struct listen_connection *con)
 		return -1;
 	}
 
-	dlm_comm_mark(nodeid, &mark);
-	sock_set_mark(newsock->sk, mark);
-
 	log_print("got connection from %d", nodeid);
 
 	/*  Check to see if we already have a connection to this node. This
@@ -892,6 +913,8 @@ static int accept_from_sock(struct listen_connection *con)
 		goto accept_err;
 	}
 
+	sock_set_mark(newsock->sk, mark);
+
 	mutex_lock(&newcon->sock_mutex);
 	if (newcon->sock) {
 		struct connection *othercon = newcon->othercon;
@@ -1015,8 +1038,6 @@ static void sctp_connect_to_sock(struct connection *con)
 	struct socket *sock;
 	unsigned int mark;
 
-	dlm_comm_mark(con->nodeid, &mark);
-
 	mutex_lock(&con->sock_mutex);
 
 	/* Some odd races can cause double-connects, ignore them */
@@ -1029,7 +1050,7 @@ static void sctp_connect_to_sock(struct connection *con)
 	}
 
 	memset(&daddr, 0, sizeof(daddr));
-	result = nodeid_to_addr(con->nodeid, &daddr, NULL, true);
+	result = nodeid_to_addr(con->nodeid, &daddr, NULL, true, &mark);
 	if (result < 0) {
 		log_print("no address for nodeid %d", con->nodeid);
 		goto out;
@@ -1104,13 +1125,11 @@ static void sctp_connect_to_sock(struct connection *con)
 static void tcp_connect_to_sock(struct connection *con)
 {
 	struct sockaddr_storage saddr, src_addr;
+	unsigned int mark;
 	int addr_len;
 	struct socket *sock = NULL;
-	unsigned int mark;
 	int result;
 
-	dlm_comm_mark(con->nodeid, &mark);
-
 	mutex_lock(&con->sock_mutex);
 	if (con->retries++ > MAX_CONNECT_RETRIES)
 		goto out;
@@ -1125,15 +1144,15 @@ static void tcp_connect_to_sock(struct connection *con)
 	if (result < 0)
 		goto out_err;
 
-	sock_set_mark(sock->sk, mark);
-
 	memset(&saddr, 0, sizeof(saddr));
-	result = nodeid_to_addr(con->nodeid, &saddr, NULL, false);
+	result = nodeid_to_addr(con->nodeid, &saddr, NULL, false, &mark);
 	if (result < 0) {
 		log_print("no address for nodeid %d", con->nodeid);
 		goto out_err;
 	}
 
+	sock_set_mark(sock->sk, mark);
+
 	add_sock(sock, con);
 
 	/* Bind to our cluster-known address connecting to avoid
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 0918f9376489..790d6703b17e 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -21,6 +21,7 @@ int dlm_lowcomms_close(int nodeid);
 void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc);
 void dlm_lowcomms_commit_buffer(void *mh);
 int dlm_lowcomms_connect_node(int nodeid);
+int dlm_lowcomms_nodes_set_mark(int nodeid, unsigned int mark);
 int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len);
 
 #endif				/* __LOWCOMMS_DOT_H__ */
-- 
2.26.2

