Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D2576BC09
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Aug 2023 20:12:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690913543;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W73EmopzpJPm8t+x9gAxSlpD6Nk5RFAOl+KgRKxNnYU=;
	b=EGUxzJ9IJvJltuzTClgI/ldtqi4EgS0i7nlLLkIbvHGQ9MjutCQavR3etXm8ikNCdTAzGo
	Qaf2VD3P+SOs3rfI1GDHyzydCQdywjJiyDq2du5rmJyoBYPUmZ/+xcz1K39X1djt9ZZM5s
	yAfp+pX8NOJhiTID4uSxDXHF0ChXV7M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-lMc3KnVFOSmvQFR451-24w-1; Tue, 01 Aug 2023 14:12:14 -0400
X-MC-Unique: lMc3KnVFOSmvQFR451-24w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D58B887111;
	Tue,  1 Aug 2023 18:12:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 61BE7200BA63;
	Tue,  1 Aug 2023 18:12:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2FC2F194720E;
	Tue,  1 Aug 2023 18:12:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 86BF41947207 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  1 Aug 2023 18:10:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5D699111F3D7; Tue,  1 Aug 2023 18:09:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37DDC1121325;
 Tue,  1 Aug 2023 18:09:56 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  1 Aug 2023 14:09:49 -0400
Message-Id: <20230801180950.3693180-13-aahringo@redhat.com>
In-Reply-To: <20230801180950.3693180-1-aahringo@redhat.com>
References: <20230801180950.3693180-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCHv2 dlm-next 12/13] fs: dlm: create midcomms
 nodes when configure
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch puts the life of a midcomms node the same as a lowcomms
connection. The lowcomms connection lifetime was changed by commit
6f0b0b5d7ae7 ("fs: dlm: remove dlm_node_addrs lookup list"). In the
future the midcomms node instances can be merged with lowcomms
connection structure as the lifetime is the same and states can be
controlled over values or flags.

Before midcomms nodes were generated during version detection. This is
not necessary anymore when the nodes are created when the cluster
manager configures DLM via configfs. When a midcomms node is created over
configfs it well set DLM_VERSION_NOT_SET as version. This indicates that
the version of the midcomms node is still unknown and need to be probed
via certain rcom messages.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c   |   2 +-
 fs/dlm/midcomms.c | 286 +++++++++++++++++-----------------------------
 fs/dlm/midcomms.h |   1 +
 3 files changed, 110 insertions(+), 179 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 2beceff024e3..e55e0a2cd2e8 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -664,7 +664,7 @@ static ssize_t comm_addr_store(struct config_item *item, const char *buf,
 
 	memcpy(addr, buf, len);
 
-	rv = dlm_lowcomms_addr(cm->nodeid, addr, len);
+	rv = dlm_midcomms_addr(cm->nodeid, addr, len);
 	if (rv) {
 		kfree(addr);
 		return rv;
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index c125496e03bf..f641b36a36db 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -330,18 +330,23 @@ static void midcomms_node_reset(struct midcomms_node *node)
 	wake_up(&node->shutdown_wait);
 }
 
-static struct midcomms_node *nodeid2node(int nodeid, gfp_t alloc)
+static struct midcomms_node *nodeid2node(int nodeid)
 {
-	struct midcomms_node *node, *tmp;
-	int r = nodeid_hash(nodeid);
+	return __find_node(nodeid, nodeid_hash(nodeid));
+}
+
+int dlm_midcomms_addr(int nodeid, struct sockaddr_storage *addr, int len)
+{
+	int ret, r = nodeid_hash(nodeid);
+	struct midcomms_node *node;
 
-	node = __find_node(nodeid, r);
-	if (node || !alloc)
-		return node;
+	ret = dlm_lowcomms_addr(nodeid, addr, len);
+	if (ret)
+		return ret;
 
-	node = kmalloc(sizeof(*node), alloc);
+	node = kmalloc(sizeof(*node), GFP_NOFS);
 	if (!node)
-		return NULL;
+		return -ENOMEM;
 
 	node->nodeid = nodeid;
 	spin_lock_init(&node->state_lock);
@@ -353,21 +358,11 @@ static struct midcomms_node *nodeid2node(int nodeid, gfp_t alloc)
 	midcomms_node_reset(node);
 
 	spin_lock(&nodes_lock);
-	/* check again if there was somebody else
-	 * earlier here to add the node
-	 */
-	tmp = __find_node(nodeid, r);
-	if (tmp) {
-		spin_unlock(&nodes_lock);
-		kfree(node);
-		return tmp;
-	}
-
 	hlist_add_head_rcu(&node->hlist, &node_hash[r]);
 	spin_unlock(&nodes_lock);
 
 	node->debugfs = dlm_create_debug_comms_file(nodeid, node);
-	return node;
+	return 0;
 }
 
 static int dlm_send_ack(int nodeid, uint32_t seq)
@@ -603,112 +598,6 @@ static void dlm_midcomms_receive_buffer(const union dlm_packet *p,
 	}
 }
 
-static struct midcomms_node *
-dlm_midcomms_recv_node_lookup(int nodeid, const union dlm_packet *p,
-			      uint16_t msglen, int (*cb)(struct midcomms_node *node))
-{
-	struct midcomms_node *node = NULL;
-	gfp_t allocation = 0;
-	int ret;
-
-	switch (p->header.h_cmd) {
-	case DLM_RCOM:
-		if (msglen < sizeof(struct dlm_rcom)) {
-			log_print("rcom msg too small: %u, will skip this message from node %d",
-				  msglen, nodeid);
-			return NULL;
-		}
-
-		switch (p->rcom.rc_type) {
-		case cpu_to_le32(DLM_RCOM_NAMES):
-			fallthrough;
-		case cpu_to_le32(DLM_RCOM_NAMES_REPLY):
-			fallthrough;
-		case cpu_to_le32(DLM_RCOM_STATUS):
-			fallthrough;
-		case cpu_to_le32(DLM_RCOM_STATUS_REPLY):
-			node = nodeid2node(nodeid, 0);
-			if (node) {
-				spin_lock(&node->state_lock);
-				if (node->state != DLM_ESTABLISHED)
-					pr_debug("receive begin RCOM msg from node %d with state %s\n",
-						 node->nodeid, dlm_state_str(node->state));
-
-				switch (node->state) {
-				case DLM_CLOSED:
-					node->state = DLM_ESTABLISHED;
-					pr_debug("switch node %d to state %s\n",
-						 node->nodeid, dlm_state_str(node->state));
-					break;
-				case DLM_ESTABLISHED:
-					break;
-				default:
-					spin_unlock(&node->state_lock);
-					return NULL;
-				}
-				spin_unlock(&node->state_lock);
-			}
-
-			allocation = GFP_NOFS;
-			break;
-		default:
-			break;
-		}
-
-		break;
-	default:
-		break;
-	}
-
-	node = nodeid2node(nodeid, allocation);
-	if (!node) {
-		switch (p->header.h_cmd) {
-		case DLM_OPTS:
-			if (msglen < sizeof(struct dlm_opts)) {
-				log_print("opts msg too small: %u, will skip this message from node %d",
-					  msglen, nodeid);
-				return NULL;
-			}
-
-			log_print_ratelimited("received dlm opts message nextcmd %d from node %d in an invalid sequence",
-					      p->opts.o_nextcmd, nodeid);
-			break;
-		default:
-			log_print_ratelimited("received dlm message cmd %d from node %d in an invalid sequence",
-					      p->header.h_cmd, nodeid);
-			break;
-		}
-
-		return NULL;
-	}
-
-	ret = cb(node);
-	if (ret < 0)
-		return NULL;
-
-	return node;
-}
-
-static int dlm_midcomms_version_check_3_2(struct midcomms_node *node)
-{
-	switch (node->version) {
-	case DLM_VERSION_NOT_SET:
-		node->version = DLM_VERSION_3_2;
-		wake_up(&node->shutdown_wait);
-		log_print("version 0x%08x for node %d detected", DLM_VERSION_3_2,
-			  node->nodeid);
-		break;
-	case DLM_VERSION_3_2:
-		break;
-	default:
-		log_print_ratelimited("version mismatch detected, assumed 0x%08x but node %d has 0x%08x",
-				      DLM_VERSION_3_2, node->nodeid, node->version);
-		return -1;
-	}
-
-	return 0;
-}
-
 static int dlm_opts_check_msglen(const union dlm_packet *p, uint16_t msglen,
 				 int nodeid)
 {
@@ -767,10 +656,37 @@ static void dlm_midcomms_receive_buffer_3_2(const union dlm_packet *p, int nodei
 	int ret, idx;
 
 	idx = srcu_read_lock(&nodes_srcu);
-	node = dlm_midcomms_recv_node_lookup(nodeid, p, msglen,
-					     dlm_midcomms_version_check_3_2);
-	if (!node)
+	node = nodeid2node(nodeid);
+	if (WARN_ON_ONCE(!node))
+		goto out;
+
+	switch (node->version) {
+	case DLM_VERSION_NOT_SET:
+		node->version = DLM_VERSION_3_2;
+		wake_up(&node->shutdown_wait);
+		log_print("version 0x%08x for node %d detected", DLM_VERSION_3_2,
+			  node->nodeid);
+
+		spin_lock(&node->state_lock);
+		switch (node->state) {
+		case DLM_CLOSED:
+			node->state = DLM_ESTABLISHED;
+			pr_debug("switch node %d to state %s\n",
+				 node->nodeid, dlm_state_str(node->state));
+			break;
+		default:
+			break;
+		}
+		spin_unlock(&node->state_lock);
+
+		break;
+	case DLM_VERSION_3_2:
+		break;
+	default:
+		log_print_ratelimited("version mismatch detected, assumed 0x%08x but node %d has 0x%08x",
+				      DLM_VERSION_3_2, node->nodeid, node->version);
 		goto out;
+	}
 
 	switch (p->header.h_cmd) {
 	case DLM_RCOM:
@@ -860,8 +776,19 @@ static void dlm_midcomms_receive_buffer_3_2(const union dlm_packet *p, int nodei
 	srcu_read_unlock(&nodes_srcu, idx);
 }
 
-static int dlm_midcomms_version_check_3_1(struct midcomms_node *node)
+static void dlm_midcomms_receive_buffer_3_1(const union dlm_packet *p, int nodeid)
 {
+	uint16_t msglen = le16_to_cpu(p->header.h_length);
+	struct midcomms_node *node;
+	int idx;
+
+	idx = srcu_read_lock(&nodes_srcu);
+	node = nodeid2node(nodeid);
+	if (WARN_ON_ONCE(!node)) {
+		srcu_read_unlock(&nodes_srcu, idx);
+		return;
+	}
+
 	switch (node->version) {
 	case DLM_VERSION_NOT_SET:
 		node->version = DLM_VERSION_3_1;
@@ -874,22 +801,6 @@ static int dlm_midcomms_version_check_3_1(struct midcomms_node *node)
 	default:
 		log_print_ratelimited("version mismatch detected, assumed 0x%08x but node %d has 0x%08x",
 				      DLM_VERSION_3_1, node->nodeid, node->version);
-		return -1;
-	}
-
-	return 0;
-}
-
-static void dlm_midcomms_receive_buffer_3_1(const union dlm_packet *p, int nodeid)
-{
-	uint16_t msglen = le16_to_cpu(p->header.h_length);
-	struct midcomms_node *node;
-	int idx;
-
-	idx = srcu_read_lock(&nodes_srcu);
-	node = dlm_midcomms_recv_node_lookup(nodeid, p, msglen,
-					     dlm_midcomms_version_check_3_1);
-	if (!node) {
 		srcu_read_unlock(&nodes_srcu, idx);
 		return;
 	}
@@ -1005,8 +916,8 @@ void dlm_midcomms_unack_msg_resend(int nodeid)
 	int idx, ret;
 
 	idx = srcu_read_lock(&nodes_srcu);
-	node = nodeid2node(nodeid, 0);
-	if (!node) {
+	node = nodeid2node(nodeid);
+	if (WARN_ON_ONCE(!node)) {
 		srcu_read_unlock(&nodes_srcu, idx);
 		return;
 	}
@@ -1092,11 +1003,9 @@ struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 	int idx;
 
 	idx = srcu_read_lock(&nodes_srcu);
-	node = nodeid2node(nodeid, 0);
-	if (!node) {
-		WARN_ON_ONCE(1);
+	node = nodeid2node(nodeid);
+	if (WARN_ON_ONCE(!node))
 		goto err;
-	}
 
 	/* this is a bug, however we going on and hope it will be resolved */
 	WARN_ON_ONCE(test_bit(DLM_NODE_FLAG_STOP_TX, &node->flags));
@@ -1237,8 +1146,34 @@ void dlm_midcomms_init(void)
 	dlm_lowcomms_init();
 }
 
+static void midcomms_node_release(struct rcu_head *rcu)
+{
+	struct midcomms_node *node = container_of(rcu, struct midcomms_node, rcu);
+
+	WARN_ON_ONCE(atomic_read(&node->send_queue_cnt));
+	dlm_send_queue_flush(node);
+	kfree(node);
+}
+
 void dlm_midcomms_exit(void)
 {
+	struct midcomms_node *node;
+	int i, idx;
+
+	idx = srcu_read_lock(&nodes_srcu);
+	for (i = 0; i < CONN_HASH_SIZE; i++) {
+		hlist_for_each_entry_rcu(node, &node_hash[i], hlist) {
+			dlm_delete_debug_comms_file(node->debugfs);
+
+			spin_lock(&nodes_lock);
+			hlist_del_rcu(&node->hlist);
+			spin_unlock(&nodes_lock);
+
+			call_srcu(&nodes_srcu, &node->rcu, midcomms_node_release);
+		}
+	}
+	srcu_read_unlock(&nodes_srcu, idx);
+
 	dlm_lowcomms_exit();
 }
 
@@ -1279,8 +1214,8 @@ void dlm_midcomms_add_member(int nodeid)
 	int idx;
 
 	idx = srcu_read_lock(&nodes_srcu);
-	node = nodeid2node(nodeid, GFP_NOFS);
-	if (!node) {
+	node = nodeid2node(nodeid);
+	if (WARN_ON_ONCE(!node)) {
 		srcu_read_unlock(&nodes_srcu, idx);
 		return;
 	}
@@ -1324,8 +1259,8 @@ void dlm_midcomms_remove_member(int nodeid)
 	int idx;
 
 	idx = srcu_read_lock(&nodes_srcu);
-	node = nodeid2node(nodeid, 0);
-	if (!node) {
+	node = nodeid2node(nodeid);
+	if (WARN_ON_ONCE(!node)) {
 		srcu_read_unlock(&nodes_srcu, idx);
 		return;
 	}
@@ -1369,15 +1304,6 @@ void dlm_midcomms_remove_member(int nodeid)
 	srcu_read_unlock(&nodes_srcu, idx);
 }
 
-static void midcomms_node_release(struct rcu_head *rcu)
-{
-	struct midcomms_node *node = container_of(rcu, struct midcomms_node, rcu);
-
-	WARN_ON_ONCE(atomic_read(&node->send_queue_cnt));
-	dlm_send_queue_flush(node);
-	kfree(node);
-}
-
 void dlm_midcomms_version_wait(void)
 {
 	struct midcomms_node *node;
@@ -1440,7 +1366,7 @@ static void midcomms_shutdown(struct midcomms_node *node)
 				 node->state == DLM_CLOSED ||
 				 test_bit(DLM_NODE_FLAG_CLOSE, &node->flags),
 				 DLM_SHUTDOWN_TIMEOUT);
-	if (!ret || test_bit(DLM_NODE_FLAG_CLOSE, &node->flags))
+	if (!ret)
 		pr_debug("active shutdown timed out for node %d with state %s\n",
 			 node->nodeid, dlm_state_str(node->state));
 	else
@@ -1458,14 +1384,6 @@ void dlm_midcomms_shutdown(void)
 	for (i = 0; i < CONN_HASH_SIZE; i++) {
 		hlist_for_each_entry_rcu(node, &node_hash[i], hlist) {
 			midcomms_shutdown(node);
-
-			dlm_delete_debug_comms_file(node->debugfs);
-
-			spin_lock(&nodes_lock);
-			hlist_del_rcu(&node->hlist);
-			spin_unlock(&nodes_lock);
-
-			call_srcu(&nodes_srcu, &node->rcu, midcomms_node_release);
 		}
 	}
 	srcu_read_unlock(&nodes_srcu, idx);
@@ -1481,7 +1399,7 @@ int dlm_midcomms_close(int nodeid)
 
 	idx = srcu_read_lock(&nodes_srcu);
 	/* Abort pending close/remove operation */
-	node = nodeid2node(nodeid, 0);
+	node = nodeid2node(nodeid);
 	if (node) {
 		/* let shutdown waiters leave */
 		set_bit(DLM_NODE_FLAG_CLOSE, &node->flags);
@@ -1493,7 +1411,7 @@ int dlm_midcomms_close(int nodeid)
 
 	mutex_lock(&close_lock);
 	idx = srcu_read_lock(&nodes_srcu);
-	node = nodeid2node(nodeid, 0);
+	node = nodeid2node(nodeid);
 	if (!node) {
 		srcu_read_unlock(&nodes_srcu, idx);
 		mutex_unlock(&close_lock);
@@ -1501,10 +1419,22 @@ int dlm_midcomms_close(int nodeid)
 	}
 
 	ret = dlm_lowcomms_close(nodeid);
-	spin_lock(&node->state_lock);
-	midcomms_node_reset(node);
-	spin_unlock(&node->state_lock);
+	dlm_delete_debug_comms_file(node->debugfs);
+
+	spin_lock(&nodes_lock);
+	hlist_del_rcu(&node->hlist);
+	spin_unlock(&nodes_lock);
 	srcu_read_unlock(&nodes_srcu, idx);
+
+	/* wait that all readers left until flush send queue */
+	synchronize_srcu(&nodes_srcu);
+
+	/* drop all pending dlm messages, this is fine as
+	 * this function get called when the node is fenced
+	 */
+	dlm_send_queue_flush(node);
+
+	call_srcu(&nodes_srcu, &node->rcu, midcomms_node_release);
 	mutex_unlock(&close_lock);
 
 	return ret;
diff --git a/fs/dlm/midcomms.h b/fs/dlm/midcomms.h
index 9f8c9605013d..e7246fb3ef57 100644
--- a/fs/dlm/midcomms.h
+++ b/fs/dlm/midcomms.h
@@ -20,6 +20,7 @@ struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 					     gfp_t allocation, char **ppc);
 void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh, const void *name,
 				 int namelen);
+int dlm_midcomms_addr(int nodeid, struct sockaddr_storage *addr, int len);
 void dlm_midcomms_version_wait(void);
 int dlm_midcomms_close(int nodeid);
 int dlm_midcomms_start(void);
-- 
2.31.1

