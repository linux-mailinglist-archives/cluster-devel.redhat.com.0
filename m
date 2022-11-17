Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B230662E7F2
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Nov 2022 23:12:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668723147;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hWyALA9c1aY8hYSF30K8WBmn4LrNTFRKlcLHTjmGEAI=;
	b=UeytJbAoiboSdiUidymX3N54VXb96NdMKX6hdQAUb1PHlluBrHkLh3qlW/04R3KI9DDgy5
	ghSj/XjzMAOIGSWRiGTz+ruESNHzTFR8nhYQXJquIZ1HPL1JfqJo2yBJCQxIiGsS+kIxA3
	IPk2+hSakaK5zcsSlfrQcp2QvOSFu3o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-tVHerlE0OoCkWHiVmYOHew-1; Thu, 17 Nov 2022 17:12:15 -0500
X-MC-Unique: tVHerlE0OoCkWHiVmYOHew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B652F38005D7;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8BFEC8E401;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 89E6E1946595;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 14FC419465B9 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 22:12:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0B5082166B44; Thu, 17 Nov 2022 22:12:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC1222166B29;
 Thu, 17 Nov 2022 22:12:09 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Nov 2022 17:11:53 -0500
Message-Id: <20221117221157.2396743-14-aahringo@redhat.com>
In-Reply-To: <20221117221157.2396743-1-aahringo@redhat.com>
References: <20221117221157.2396743-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 14/18] fs: dlm: remove
 dlm_node_addrs lookup list
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch merges the dlm_node_addrs lookup list to the connection
structure. It is a per node mapping to some configuration setup by
configfs. We don't need two lookup structures. The connection hash has
now a lifetime like the dlm_node_addrs entries. Means we add only new
entries when configure cluster and not while new connections are coming
in, remove connection when a node got fenced and cleanup all connection
when the dlm exits. It should work the same and even will show more
issues because we don't try to somehow keep those two data structures in
sync with the current cluster configuration.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 290 ++++++++++++++++++++++------------------------
 1 file changed, 136 insertions(+), 154 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 0883394cfbeb..ed3cd3757199 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -93,6 +93,11 @@ struct connection {
 	unsigned char *rx_buf;
 	int rx_buflen;
 	int rx_leftover;
+	int mark;
+	int addr_count;
+	int curr_addr_index;
+	struct sockaddr_storage addr[DLM_MAX_ADDR_COUNT];
+	spinlock_t addrs_lock;
 	struct rcu_head rcu;
 };
 #define sock2con(x) ((struct connection *)(x)->sk_user_data)
@@ -131,15 +136,6 @@ struct dlm_msg {
 	struct kref ref;
 };
 
-struct dlm_node_addr {
-	struct list_head list;
-	int nodeid;
-	int mark;
-	int addr_count;
-	int curr_addr_index;
-	struct sockaddr_storage *addr[DLM_MAX_ADDR_COUNT];
-};
-
 struct dlm_proto_ops {
 	bool try_new_addr;
 	const char *name;
@@ -161,9 +157,6 @@ static struct listen_sock_callbacks {
 	void (*sk_write_space)(struct sock *);
 } listen_sock;
 
-static LIST_HEAD(dlm_node_addrs);
-static DEFINE_SPINLOCK(dlm_node_addrs_spin);
-
 static struct listen_connection listen_con;
 static struct sockaddr_storage dlm_local_addr[DLM_MAX_ADDR_COUNT];
 static int dlm_local_count;
@@ -306,17 +299,6 @@ static void foreach_conn(void (*conn_func)(struct connection *c))
 	}
 }
 
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
@@ -350,38 +332,45 @@ static int nodeid_to_addr(int nodeid, struct sockaddr_storage *sas_out,
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
 
 	if (dlm_local_addr[0].ss_family == AF_INET) {
 		struct sockaddr_in *in4  = (struct sockaddr_in *) &sas;
@@ -393,43 +382,46 @@ static int nodeid_to_addr(int nodeid, struct sockaddr_storage *sas_out,
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
 
@@ -438,52 +430,42 @@ static bool dlm_lowcomms_na_has_addr(const struct dlm_node_addr *na,
 
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
 
@@ -558,10 +540,10 @@ int dlm_lowcomms_connect_node(int nodeid)
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
 
 	lowcomms_connect_sock(con);
@@ -572,18 +554,20 @@ int dlm_lowcomms_connect_node(int nodeid)
 
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
 
@@ -960,10 +944,10 @@ static int accept_from_sock(struct listen_connection *con)
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
 
@@ -1210,8 +1194,8 @@ struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
 	}
 
 	idx = srcu_read_lock(&connections_srcu);
-	con = nodeid2con(nodeid, allocation);
-	if (!con) {
+	con = nodeid2con(nodeid, 0);
+	if (WARN_ON_ONCE(!con)) {
 		srcu_read_unlock(&connections_srcu, idx);
 		return NULL;
 	}
@@ -1376,35 +1360,44 @@ static void clean_one_writequeue(struct connection *con)
 	spin_unlock(&con->writequeue_lock);
 }
 
+static void connection_release(struct rcu_head *rcu)
+{
+	struct connection *con = container_of(rcu, struct connection, rcu);
+
+	kfree(con->rx_buf);
+	kfree(con);
+}
+
 /* Called from recovery when it knows that a node has
    left the cluster */
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
+	close_connection(con, true, true, true);
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
@@ -1607,27 +1600,9 @@ static void stop_conn(struct connection *con)
 	_stop_conn(con, true);
 }
 
-static void connection_release(struct rcu_head *rcu)
-{
-	struct connection *con = container_of(rcu, struct connection, rcu);
-
-	kfree(con->rx_buf);
-	kfree(con);
-}
-
 static void free_conn(struct connection *con)
 {
 	close_connection(con, true, true, true);
-	spin_lock(&connections_lock);
-	hlist_del_rcu(&con->list);
-	spin_unlock(&connections_lock);
-	if (con->othercon) {
-		clean_one_writequeue(con->othercon);
-		call_srcu(&connections_srcu, &con->othercon->rcu,
-			  connection_release);
-	}
-	clean_one_writequeue(con);
-	call_srcu(&connections_srcu, &con->rcu, connection_release);
 }
 
 static void work_flush(void)
@@ -1922,14 +1897,21 @@ void dlm_lowcomms_init(void)
 
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
-- 
2.31.1

