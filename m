Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDD535A17A
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Apr 2021 16:49:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617979764;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iTPmCd8YHeukOjMf1p5LRgK7PKLuISBFqOf3HGdyn+A=;
	b=PeedvaQGZ+t0HINmLYqvHpA/RJ/pjqGbGat1uo43NHsQRv/JeJ0tPwP6yn+OWBZRxrKYnI
	T5gHgnAEweWMV2jmUPogmqQhxgdYoq5niP3lW/fcoStEaTMv1t3cRcL1gxocLnKLXhzXsY
	u6zQYX5D3a6LiCDr8+V3H6Zm08oOLqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-NGmhHPdWOImJtnoI54_rGg-1; Fri, 09 Apr 2021 10:49:19 -0400
X-MC-Unique: NGmhHPdWOImJtnoI54_rGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28F3283DD20;
	Fri,  9 Apr 2021 14:49:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17D306064B;
	Fri,  9 Apr 2021 14:49:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99C2B5534B;
	Fri,  9 Apr 2021 14:49:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139EnEsZ022755 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 10:49:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ABC9C6A97E; Fri,  9 Apr 2021 14:49:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6ABA6B8DD;
	Fri,  9 Apr 2021 14:49:13 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri,  9 Apr 2021 10:48:58 -0400
Message-Id: <20210409144859.48385-8-aahringo@redhat.com>
In-Reply-To: <20210409144859.48385-1-aahringo@redhat.com>
References: <20210409144859.48385-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com, gnault@redhat.com
Subject: [Cluster-devel] [PATCHv4 dlm/next 7/8] fs: dlm: add reliable
	connection if reconnect
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch introduce to make a tcp lowcomms connection reliable even if
reconnects occurs. This is done by an application layer re-transmission
handling and sequence numbers in dlm protocols. There are three new dlm
commands:

DLM_OPTS:

This will encapsulate an existing dlm message (and rcom message if they
don't have an own application side re-transmission handling). As optional
handling additional tlv's (type length fields) can be appended. This can
be for example a sequence number field. However because in DLM_OPTS the
lockspace field is unused and a sequence number is a mandatory field it
isn't made as a tlv and we put the sequence number inside the lockspace
id. The possibility to add optional options are still there for future
purposes.

DLM_ACK:

Just a dlm header to acknowledge the receive of a DLM_OPTS message to
it's sender.

DLM_FIN:

A new DLM message to synchronize pending message to the other dlm end if
the node want to disconnects. Each side waits until it receives this
message and disconnects. It's important that this message has nothing to
do with the application logic because it might run in a timeout if
acknowledge messages are dropped. The problem which we try to solve with
DLM_FIN is that the node membership is handled by the cluster manager and
not the kernel dlm protocol itself, DLM_FIN tries to synchronize the kernel
dlm protocol with cluster manager message handling.

To provide a reliable connection the node will retransmit all
unacknowledges message to it's peer on reconnect. The receiver will then
filtering out the next received message and drop all messages which are
duplicates.

As RCOM_STATUS and RCOM_NAMES messages are the first messages which are
exchanged and they have they own re-transmission handling, there exists
logic that these messages must be first. If these messages arrives we
store the dlm version field. This handling is on DLM 3.1 and after this
patch 3.2 the same. A backwards compatibility handling has been added
which seems to work on tests without tcpkill, however it's not recommended
to use DLM 3.1 and 3.2 at the same time, because DLM 3.2 tries to fix long
term bugs in the DLM protocol.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h |   30 +-
 fs/dlm/lockspace.c    |    7 +-
 fs/dlm/lowcomms.c     |    5 +-
 fs/dlm/lowcomms.h     |    7 +-
 fs/dlm/midcomms.c     | 1096 +++++++++++++++++++++++++++++++++++++++--
 fs/dlm/midcomms.h     |    1 +
 fs/dlm/rcom.c         |    4 +-
 7 files changed, 1094 insertions(+), 56 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 917de7367a32..da2297705713 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -368,18 +368,26 @@ static inline int rsb_flag(struct dlm_rsb *r, enum rsb_flags flag)
 /* dlm_header is first element of all structs sent between nodes */
 
 #define DLM_HEADER_MAJOR	0x00030000
-#define DLM_HEADER_MINOR	0x00000001
+#define DLM_HEADER_MINOR	0x00000002
+
+#define DLM_VERSION_3_1		0x00030001
+#define DLM_VERSION_3_2		0x00030002
 
 #define DLM_HEADER_SLOTS	0x00000001
 
 #define DLM_MSG			1
 #define DLM_RCOM		2
+#define DLM_OPTS		3
+#define DLM_ACK			4
+#define DLM_FIN			5
 
 struct dlm_header {
 	uint32_t		h_version;
 	union {
 		/* for DLM_MSG and DLM_RCOM */
 		uint32_t	h_lockspace;
+		/* for DLM_ACK and DLM_OPTS */
+		uint32_t	h_seq;
 	} u;
 	uint32_t		h_nodeid;	/* nodeid of sender */
 	uint16_t		h_length;
@@ -387,7 +395,6 @@ struct dlm_header {
 	uint8_t			h_pad;
 };
 
-
 #define DLM_MSG_REQUEST		1
 #define DLM_MSG_CONVERT		2
 #define DLM_MSG_UNLOCK		3
@@ -455,10 +462,29 @@ struct dlm_rcom {
 	char			rc_buf[];
 };
 
+struct dlm_opt_header {
+	uint16_t	t_type;
+	uint16_t	t_length;
+	uint32_t	o_pad;
+	/* need to be 8 byte aligned */
+	char		t_value[];
+};
+
+/* encapsulation header */
+struct dlm_opts {
+	struct dlm_header	o_header;
+	uint8_t			o_nextcmd;
+	uint8_t			o_pad;
+	uint16_t		o_optlen;
+	uint32_t		o_pad2;
+	char			o_opts[];
+};
+
 union dlm_packet {
 	struct dlm_header	header;		/* common to other two */
 	struct dlm_message	message;
 	struct dlm_rcom		rcom;
+	struct dlm_opts		opts;
 };
 
 #define DLM_RSF_NEED_SLOTS	0x00000001
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index bf5c55ef9d0d..2b738be8d7e4 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -567,7 +567,12 @@ static int new_lockspace(const char *name, const char *cluster,
 	mutex_init(&ls->ls_requestqueue_mutex);
 	mutex_init(&ls->ls_clear_proc_locks);
 
-	ls->ls_recover_buf = kmalloc(LOWCOMMS_MAX_TX_BUFFER_LEN, GFP_NOFS);
+	/* Due backwards compatibility with 3.1 we need to use maximum
+	 * possible dlm message size to be sure the message will fit and
+	 * not having out of bounds issues. However on sending side 3.2
+	 * might send less.
+	 */
+	ls->ls_recover_buf = kmalloc(DEFAULT_BUFFER_SIZE, GFP_NOFS);
 	if (!ls->ls_recover_buf)
 		goto out_lkbidr;
 
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 0e08a59e489c..d61a1117b1d7 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -955,6 +955,7 @@ static int accept_from_sock(struct listen_connection *con)
 		   result in calling sk_error_report recursively. */
 		add_sock(newsock, newcon);
 		addcon = newcon;
+		dlm_midcomms_unack_msg_resend(nodeid);
 	}
 
 	set_bit(CF_CONNECTED, &addcon->flags);
@@ -1677,8 +1678,10 @@ static void process_send_sockets(struct work_struct *work)
 	struct connection *con = container_of(work, struct connection, swork);
 
 	clear_bit(CF_WRITE_PENDING, &con->flags);
-	if (con->sock == NULL) /* not mutex protected so check it inside too */
+	if (con->sock == NULL) { /* not mutex protected so check it inside too */
 		con->connect_action(con);
+		dlm_midcomms_unack_msg_resend(con->nodeid);
+	}
 	if (!list_empty(&con->writequeue))
 		send_to_sock(con);
 }
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index cacfc5620f54..1554d8c078c9 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -12,7 +12,12 @@
 #ifndef __LOWCOMMS_DOT_H__
 #define __LOWCOMMS_DOT_H__
 
-#define LOWCOMMS_MAX_TX_BUFFER_LEN	4096
+#include "dlm_internal.h"
+
+#define DLM_MIDCOMMS_OPT_LEN		sizeof(struct dlm_opts)
+#define LOWCOMMS_MAX_TX_BUFFER_LEN	(DEFAULT_BUFFER_SIZE - \
+					 DLM_MIDCOMMS_OPT_LEN)
+
 #define CONN_HASH_SIZE 32
 
 /* This is deliberately very simple because most clusters have simple
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index d86dcc95f736..1d6da6ad6f58 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -3,7 +3,7 @@
 *******************************************************************************
 **
 **  Copyright (C) Sistina Software, Inc.  1997-2003  All rights reserved.
-**  Copyright (C) 2004-2008 Red Hat, Inc.  All rights reserved.
+**  Copyright (C) 2004-2021 Red Hat, Inc.  All rights reserved.
 **
 **
 *******************************************************************************
@@ -12,68 +12,665 @@
 /*
  * midcomms.c
  *
- * This is the appallingly named "mid-level" comms layer.
+ * This is the appallingly named "mid-level" comms layer. It takes care about
+ * deliver an on application layer "reliable" communication above the used
+ * lowcomms transport layer.
  *
- * Its purpose is to take packets from the "real" comms layer,
- * split them up into packets and pass them to the interested
- * part of the locking mechanism.
+ * How it works:
  *
- * It also takes messages from the locking layer, formats them
- * into packets and sends them to the comms layer.
+ * Each nodes keeps track of all send DLM messages in send_queue with a sequence
+ * number. The receive will send an DLM_ACK message back for every DLM message
+ * received at the other side. If a reconnect happens in lowcomms we will send
+ * all unacknowledged dlm messages again. The receiving side might drop any already
+ * received message by comparing sequence numbers.
+ *
+ * How version detection works:
+ *
+ * Due the fact that dlm has pre-configured node addresses on every side
+ * it is in it's nature that every side connects at starts to transmit
+ * dlm messages which ends in a race. However DLM_RCOM_NAMES, DLM_RCOM_STATUS
+ * and their replies are the first messages which are exchanges. Due backwards
+ * compatibility these messages are not covered by the midcomms re-transmission
+ * layer. These messages have their own re-transmission handling in the dlm
+ * application layer. The version field of every node will be set on these RCOM
+ * messages as soon as they arrived and the node isn't yet part of the nodes
+ * hash. There exists also logic to detect version mismatched if something weird
+ * going on or the first messages isn't an expected one.
+ *
+ * Termination:
+ *
+ * As this layer was implemented there was a problem discovered during
+ * connection termination. At midcomms_stop() call which occurs at the
+ * last dlm lockspace release the other side was still sending dlm
+ * messages after the connection was terminated. Further investigations
+ * shows that the membership organization is done by the cluster manager
+ * and not the kernel dlm protocol itself. To make sure the node membership
+ * of a lockspace is synchronized with the kernel a DLM_FIN message was
+ * introduced. It is part of a synchronization mechanism to wait for
+ * the specific cluster manager events on both endpoints so a termination
+ * of sockets can be initiated. The "DLM_QUEUE_TIMEOUT" defines some
+ * timeout handling to wait for some synchronization points at
+ * connection termination.
+ *
+ * Future improvements:
+ *
+ * There exists some known issues/improvements of the dlm handling. Some
+ * of them should be done in a next major dlm version bump which makes
+ * it incompatible with previous versions.
+ *
+ * Unaligned memory access:
+ *
+ * There exists cases when the dlm message buffer length is not aligned
+ * to 8 byte. However seems nobody detected any problem with it. This
+ * can be fixed in the next major version bump of dlm.
+ *
+ * Version detection:
+ *
+ * The version detection and how it's done is related to backwards
+ * compatibility. There exists better ways to make a better handling.
+ * However this should be changed in the next major version bump of dlm.
+ *
+ * Ack handling:
+ *
+ * Currently we send an ack message for every dlm message. However we
+ * can ack multiple dlm messages with one ack by just delaying the ack
+ * message. Will reduce some traffic but makes the drop detection slower.
+ *
+ * Termination:
+ *
+ * Maybe handle nodes membership of lockspaces in dlm protocol itself,
+ * but that requires still synchronization with the cluster manager.
+ *
+ * Tail Size checking:
+ *
+ * There exists a message tail payload in e.g. DLM_MSG however we don't
+ * check it against the message length yet regarding to the receive buffer
+ * length. That need to be validated.
+ *
+ * Fencing bad nodes:
+ *
+ * At timeout places or weird sequence number behaviours we should send
+ * a fencing request to the cluster manager.
  */
 
+/* Debug switch to enable a 5 seconds sleep waiting of a termination.
+ * This can be useful to test fencing while termination is running.
+ * This requires a setup with only gfs2 as dlm user, so that the
+ * last umount will terminate the connection.
+ *
+ * However it became useful to test, while the 5 seconds block in umount
+ * just press the reset button. In a lot of dropping the termination
+ * process can could take several seconds.
+ */
+#define DLM_DEBUG_FENCE_TERMINATION	0
+
+#include <net/tcp.h>
+
 #include "dlm_internal.h"
 #include "lowcomms.h"
 #include "config.h"
 #include "lock.h"
+#include "util.h"
 #include "midcomms.h"
 
-void *dlm_midcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
+/* init value for sequence numbers for testing purpose only e.g. overflows */
+#define DLM_SEQ_INIT		0
+/* 3 minutes wait to sync ending of dlm */
+#define DLM_QUEUE_TIMEOUT	msecs_to_jiffies(3 * 60 * 1000)
+#define DLM_FIN_TIMEOUT		msecs_to_jiffies(10 * 1000)
+#define DLM_VERSION_NOT_SET	0
+
+struct midcomms_node {
+	int nodeid;
+	uint32_t version;
+	uint32_t seq_send;
+	uint32_t seq_next;
+	/* These queues are unbound because we cannot drop any message in dlm.
+	 * We could send a fence signal for a specific node to the cluster
+	 * manager if queues hits some maximum value, however this handling
+	 * not supported yet.
+	 */
+	struct list_head send_queue;
+	spinlock_t send_queue_lock;
+	atomic_t send_queue_cnt;
+#define DLM_NODE_FLAG_FIN	1
+#define DLM_NODE_FLAG_FIN_ACK   2
+#define DLM_NODE_FLAG_CLOSE	3
+#define DLM_NODE_FLAG_STOP_TX	4
+#define DLM_NODE_FLAG_STOP_RX	5
+	unsigned long flags;
+	wait_queue_head_t fin_wait;
+	/* counts how many lockspaces are using this node
+	 * this refcount is necessary to determine if the
+	 * node wants to disconnect.
+	 */
+	int users;
+
+	struct hlist_node hlist;
+	struct rcu_head rcu;
+};
+
+struct dlm_send_msg {
+	const struct dlm_header *inner_hd;
+	struct midcomms_node *node;
+	struct dlm_opts *opts;
+	uint32_t seq;
+	void *mh;
+
+	void (*ack)(struct midcomms_node *node);
+	/* get_buffer/commit srcu idx exchange */
+	int idx;
+
+	struct list_head list;
+	struct rcu_head rcu;
+};
+
+struct dlm_recv_msg {
+	union dlm_packet *p;
+	uint32_t seq;
+
+	struct list_head list;
+};
+
+static struct hlist_head node_hash[CONN_HASH_SIZE];
+static DEFINE_SPINLOCK(nodes_lock);
+DEFINE_STATIC_SRCU(nodes_srcu);
+
+/* This mutex prevents that midcomms_close() is running while
+ * stop() or remove(). As I experienced invalid memory access
+ * behaviours when DLM_DEBUG_FENCE_TERMINATION is enabled and
+ * resetting machines. I will end in some double deletion in nodes
+ * datastructure.
+ */
+static DEFINE_MUTEX(close_lock);
+
+static struct midcomms_node *__find_node(int nodeid, int r)
 {
-	return dlm_lowcomms_new_buffer(nodeid, len, allocation, ppc, NULL,
-				       NULL);
+	struct midcomms_node *node;
+
+	hlist_for_each_entry_rcu(node, &node_hash[r], hlist) {
+		if (node->nodeid == nodeid)
+			return node;
+	}
+
+	return NULL;
 }
 
-void dlm_midcomms_commit_buffer(void *mh)
+static struct midcomms_node *nodeid2node(int nodeid, gfp_t alloc)
 {
-	dlm_lowcomms_commit_buffer(mh);
-	dlm_lowcomms_put_buffer(mh);
+	struct midcomms_node *node, *tmp;
+	int r = nodeid_hash(nodeid);
+
+	node = __find_node(nodeid, r);
+	if (node || !alloc)
+		return node;
+
+	node = kzalloc(sizeof(*node), alloc);
+	if (!node)
+		return NULL;
+
+	node->nodeid = nodeid;
+	node->seq_next = DLM_SEQ_INIT;
+	node->seq_send = DLM_SEQ_INIT;
+	spin_lock_init(&node->send_queue_lock);
+	atomic_set(&node->send_queue_cnt, 0);
+	INIT_LIST_HEAD(&node->send_queue);
+	init_waitqueue_head(&node->fin_wait);
+
+	spin_lock(&nodes_lock);
+	/* check again if there was somebody else
+	 * earlier here to add the node
+	 */
+	tmp = __find_node(nodeid, r);
+	if (tmp) {
+		spin_unlock(&nodes_lock);
+		kfree(node);
+		return tmp;
+	}
+
+	hlist_add_head_rcu(&node->hlist, &node_hash[r]);
+	spin_unlock(&nodes_lock);
+
+	return node;
 }
 
-void *dlm_midcomms_stateless_get_buffer(int nodeid, int len, gfp_t allocation,
-					char **ppc)
+static int dlm_send_ack(int nodeid, uint32_t seq)
 {
-	return dlm_lowcomms_new_buffer(nodeid, len, allocation, ppc, NULL,
-				       NULL);
+	int mb_len = sizeof(struct dlm_header);
+	struct dlm_header *m_header;
+	char *ppc;
+	void *mh;
+
+	mh = dlm_midcomms_stateless_get_buffer(nodeid, mb_len, GFP_NOFS, &ppc);
+	if (!mh)
+		return -ENOMEM;
+
+	m_header = (struct dlm_header *)ppc;
+
+	m_header->h_version = (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
+	m_header->h_nodeid = dlm_our_nodeid();
+	m_header->h_length = mb_len;
+	m_header->h_cmd = DLM_ACK;
+	m_header->u.h_seq = seq;
+
+	header_out(m_header);
+	dlm_midcomms_stateless_commit_buffer(mh);
+
+	return 0;
 }
 
-void dlm_midcomms_stateless_commit_buffer(void *mh)
+static int dlm_send_fin(int nodeid, void (*ack)(struct midcomms_node *node))
 {
-	dlm_lowcomms_commit_buffer(mh);
-	dlm_lowcomms_put_buffer(mh);
+	int mb_len = sizeof(struct dlm_header);
+	struct dlm_header *m_header;
+	struct dlm_send_msg *msg;
+	char *ppc;
+
+	msg = dlm_midcomms_get_buffer(nodeid, mb_len, GFP_NOFS, &ppc);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->ack = ack;
+
+	m_header = (struct dlm_header *)ppc;
+
+	m_header->h_version = (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
+	m_header->h_nodeid = dlm_our_nodeid();
+	m_header->h_length = mb_len;
+	m_header->h_cmd = DLM_FIN;
+
+	header_out(m_header);
+	dlm_midcomms_commit_buffer(msg);
+
+	return 0;
 }
 
-void midcomms_add_member(int nodeid)
+static void dlm_send_msg_release(struct rcu_head *rcu)
 {
+	struct dlm_send_msg *msg = container_of(rcu, struct dlm_send_msg, rcu);
+
+	dlm_lowcomms_put_buffer(msg->mh);
+	kfree(msg);
 }
 
-void midcomms_remove_member(int nodeid)
+/* send_queue_lock must be held */
+static void dlm_send_msg_del(struct midcomms_node *node,
+			     struct dlm_send_msg *msg)
 {
+	list_del_rcu(&msg->list);
+
+	if (msg->ack)
+		msg->ack(node);
+
+	if (atomic_dec_and_test(&node->send_queue_cnt))
+		wake_up(&node->fin_wait);
+
+	call_rcu(&msg->rcu, dlm_send_msg_release);
 }
 
-int dlm_midcomms_close(int nodeid)
+static void dlm_send_queue_flush(struct midcomms_node *node)
 {
-	return dlm_lowcomms_close(nodeid);
+	struct dlm_send_msg *msg;
+
+	rcu_read_lock();
+	spin_lock(&node->send_queue_lock);
+	list_for_each_entry_rcu(msg, &node->send_queue, list) {
+		dlm_send_msg_del(node, msg);
+	}
+	spin_unlock(&node->send_queue_lock);
+	rcu_read_unlock();
 }
 
-int dlm_midcomms_start(void)
+static void dlm_midcomms_seq_receive_buffer(struct midcomms_node *node,
+					    union dlm_packet *p)
 {
-	return dlm_lowcomms_start();
+	dlm_receive_buffer(p, node->nodeid);
+	node->seq_next++;
 }
 
-void dlm_midcomms_shutdown(void)
+static void dlm_receive_ack(struct midcomms_node *node, uint32_t seq)
 {
-	dlm_lowcomms_shutdown();
+	struct dlm_send_msg *msg;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(msg, &node->send_queue, list) {
+		if (before(msg->seq, seq)) {
+			spin_lock(&node->send_queue_lock);
+			dlm_send_msg_del(node, msg);
+			spin_unlock(&node->send_queue_lock);
+		}
+	}
+	rcu_read_unlock();
+}
+
+static void dlm_midcomms_receive_buffer(union dlm_packet *p,
+					struct midcomms_node *node,
+					uint32_t seq)
+{
+	if (seq == node->seq_next) {
+		dlm_midcomms_seq_receive_buffer(node, p);
+	} else {
+		log_print("ignore dlm msg because seq mismatch, seq: %u, expected: %u, nodeid: %d",
+			  seq, node->seq_next, node->nodeid);
+	}
+
+	dlm_send_ack(node->nodeid, node->seq_next);
+}
+
+static struct midcomms_node *
+dlm_midcomms_recv_node_lookup(int nodeid, const union dlm_packet *p,
+			      uint16_t msglen, int (*cb)(struct midcomms_node *node))
+{
+	struct midcomms_node *node;
+	gfp_t allocation = 0;
+	int ret;
+
+	switch (p->header.h_cmd) {
+	case DLM_RCOM:
+		if (msglen < sizeof(struct dlm_rcom)) {
+			log_print("rcom msg too small: %u, will skip this message from node %d",
+				  msglen, nodeid);
+			return NULL;
+		}
+
+		switch (le32_to_cpu(p->rcom.rc_type)) {
+		case DLM_RCOM_NAMES:
+			fallthrough;
+		case DLM_RCOM_NAMES_REPLY:
+			fallthrough;
+		case DLM_RCOM_STATUS:
+			fallthrough;
+		case DLM_RCOM_STATUS_REPLY:
+			allocation = GFP_NOFS;
+			break;
+		default:
+			break;
+		}
+
+		break;
+	default:
+		break;
+	}
+
+	node = nodeid2node(nodeid, allocation);
+	if (!node) {
+		log_print("received dlm message cmd %d from node %d in an invalid sequence",
+			  p->opts.o_nextcmd, nodeid);
+		return NULL;
+	}
+
+	if (test_bit(DLM_NODE_FLAG_STOP_RX, &node->flags)) {
+		WARN_ON(1);
+		return NULL;
+	}
+
+	ret = cb(node);
+	if (ret < 0)
+		return NULL;
+
+	return node;
+}
+
+static int dlm_midcomms_version_check_3_2(struct midcomms_node *node)
+{
+	switch (node->version) {
+	case DLM_VERSION_NOT_SET:
+		node->version = DLM_VERSION_3_2;
+		log_print("version 0x%08x for node %d detected", DLM_VERSION_3_2,
+			  node->nodeid);
+		break;
+	case DLM_VERSION_3_2:
+		break;
+	default:
+		log_print("version mismatch detected, assumed 0x%08x but node %d has 0x%08x",
+			  DLM_VERSION_3_2, node->nodeid, node->version);
+		return -1;
+	}
+
+	return 0;
+}
+
+#if 0
+static int dlm_parse_opts(void *opts, uint16_t optlen)
+{
+	struct dlm_opt_header *hd;
+	void *ptr = opts;
+	uint16_t length;
+
+	while (optlen > 0) {
+		hd = ptr;
+		switch (le16_to_cpu(hd->t_type)) {
+		/* add options here */
+		default:
+			break;
+		}
+
+		length = le16_to_cpu(hd->t_length);
+		ptr += length;
+		optlen -= length;
+	}
+
+	return 0;
+}
+#endif
+
+static int dlm_opts_check_msglen(union dlm_packet *p, uint16_t msglen, int nodeid)
+{
+	int len = msglen;
+
+	/* we only trust outer header msglen because
+	 * it's checked against receive buffer length.
+	 */
+	if (len < sizeof(struct dlm_opts))
+		return -1;
+	len -= sizeof(struct dlm_opts);
+
+	if (len < le16_to_cpu(p->opts.o_optlen))
+		return -1;
+	len -= le16_to_cpu(p->opts.o_optlen);
+
+	switch (p->opts.o_nextcmd) {
+	case DLM_FIN:
+		if (len < sizeof(struct dlm_header)) {
+			log_print("fin too small: %d, will skip this message from node %d",
+				  len, nodeid);
+			return -1;
+		}
+
+		break;
+	case DLM_MSG:
+		if (len < sizeof(struct dlm_message)) {
+			log_print("msg too small: %d, will skip this message from node %d",
+				  msglen, nodeid);
+			return -1;
+		}
+
+		break;
+	case DLM_RCOM:
+		if (len < sizeof(struct dlm_rcom)) {
+			log_print("rcom msg too small: %d, will skip this message from node %d",
+				  len, nodeid);
+			return -1;
+		}
+
+		break;
+	default:
+		log_print("unsupported o_nextcmd received: %u, will skip this message from node %d",
+			  p->opts.o_nextcmd, nodeid);
+		return -1;
+	}
+
+	return 0;
+}
+
+static void dlm_midcomms_receive_buffer_3_2(union dlm_packet *p, int nodeid)
+{
+	uint16_t msglen = le16_to_cpu(p->header.h_length);
+	struct midcomms_node *node;
+	uint32_t seq;
+	int ret, idx;
+
+	idx = srcu_read_lock(&nodes_srcu);
+	node = dlm_midcomms_recv_node_lookup(nodeid, p, msglen,
+					     dlm_midcomms_version_check_3_2);
+	if (!node)
+		goto out;
+
+	switch (p->header.h_cmd) {
+	case DLM_RCOM:
+		/* these rcom message we use to determine version.
+		 * they have their own retransmission handling and
+		 * are the first messages of dlm.
+		 *
+		 * length already checked.
+		 */
+		switch (le32_to_cpu(p->rcom.rc_type)) {
+		case DLM_RCOM_NAMES:
+			fallthrough;
+		case DLM_RCOM_NAMES_REPLY:
+			fallthrough;
+		case DLM_RCOM_STATUS:
+			fallthrough;
+		case DLM_RCOM_STATUS_REPLY:
+			break;
+		default:
+			log_print("unsupported rcom type received: %u, will skip this message from node %d",
+				  le32_to_cpu(p->rcom.rc_type), nodeid);
+			goto out;
+		}
+
+		dlm_receive_buffer(p, nodeid);
+		break;
+	case DLM_OPTS:
+		seq = le32_to_cpu(p->header.u.h_seq);
+
+		ret = dlm_opts_check_msglen(p, msglen, nodeid);
+		if (ret < 0) {
+			log_print("opts msg too small: %u, will skip this message from node %d",
+				  msglen, nodeid);
+			goto out;
+		}
+#if 0
+		ret = dlm_parse_opts(p->opts.o_opts, p->opts.o_optlen);
+		if (ret < 0)
+			goto out;
+#endif
+
+		p = (union dlm_packet *)((unsigned char *)p->opts.o_opts +
+					 le16_to_cpu(p->opts.o_optlen));
+
+		/* recheck inner msglen just if it's not garbage */
+		msglen = le16_to_cpu(p->header.h_length);
+		switch (p->header.h_cmd) {
+		case DLM_RCOM:
+			if (msglen < sizeof(struct dlm_rcom)) {
+				log_print("inner rcom msg too small: %u, will skip this message from node %d",
+					  msglen, nodeid);
+				goto out;
+			}
+
+			break;
+		case DLM_MSG:
+			if (msglen < sizeof(struct dlm_message)) {
+				log_print("inner msg too small: %u, will skip this message from node %d",
+					  msglen, nodeid);
+				goto out;
+			}
+
+			break;
+		case DLM_FIN:
+			if (msglen < sizeof(struct dlm_header)) {
+				log_print("inner fin too small: %u, will skip this message from node %d",
+					  msglen, nodeid);
+				goto out;
+			}
+
+			if (seq != node->seq_next) {
+				dlm_send_ack(nodeid, node->seq_next);
+				goto out;
+			}
+
+			dlm_send_ack(nodeid, seq + 1);
+
+			set_bit(DLM_NODE_FLAG_FIN, &node->flags);
+			wake_up(&node->fin_wait);
+			/* midcomms only */
+			goto out;
+		default:
+			log_print("unsupported inner h_cmd received: %u, will skip this message from node %d",
+				  msglen, nodeid);
+			goto out;
+		}
+
+		dlm_midcomms_receive_buffer(p, node, seq);
+		break;
+	case DLM_ACK:
+		seq = le32_to_cpu(p->header.u.h_seq);
+		dlm_receive_ack(node, seq);
+		break;
+	default:
+		log_print("unsupported h_cmd received: %u, will skip this message from node %d",
+			  p->header.h_cmd, nodeid);
+		break;
+	}
+
+out:
+	srcu_read_unlock(&nodes_srcu, idx);
+}
+
+static int dlm_midcomms_version_check_3_1(struct midcomms_node *node)
+{
+	switch (node->version) {
+	case DLM_VERSION_NOT_SET:
+		node->version = DLM_VERSION_3_1;
+		log_print("version 0x%08x for node %d detected", DLM_VERSION_3_1,
+			  node->nodeid);
+		break;
+	case DLM_VERSION_3_1:
+		break;
+	default:
+		log_print("version mismatch detected, assumed 0x%08x but node %d has 0x%08x",
+			  DLM_VERSION_3_1, node->nodeid, node->version);
+		return -1;
+	}
+
+	return 0;
+}
+
+static void dlm_midcomms_receive_buffer_3_1(union dlm_packet *p, int nodeid)
+{
+	uint16_t msglen = le16_to_cpu(p->header.h_length);
+	struct midcomms_node *node;
+	int idx;
+
+	idx = srcu_read_lock(&nodes_srcu);
+	node = dlm_midcomms_recv_node_lookup(nodeid, p, msglen,
+					     dlm_midcomms_version_check_3_1);
+	if (!node) {
+		srcu_read_unlock(&nodes_srcu, idx);
+		return;
+	}
+	srcu_read_unlock(&nodes_srcu, idx);
+
+	switch (p->header.h_cmd) {
+	case DLM_RCOM:
+		/* length already checked */
+		break;
+	case DLM_MSG:
+		if (msglen < sizeof(struct dlm_message)) {
+			log_print("msg too small: %u, will skip this message from node %d",
+				  msglen, nodeid);
+			return;
+		}
+
+		break;
+	default:
+		log_print("unsupported h_cmd received: %u, will skip this message from node %d",
+			  p->header.h_cmd, nodeid);
+		return;
+	}
+
+	dlm_receive_buffer(p, nodeid);
 }
 
 /*
@@ -116,32 +713,19 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 		if (msglen > len)
 			break;
 
-		switch (hd->h_cmd) {
-		case DLM_MSG:
-			if (msglen < sizeof(struct dlm_message)) {
-				log_print("dlm msg too small: %u, will skip this message",
-					  msglen);
-				goto skip;
-			}
-
+		switch (le32_to_cpu(hd->h_version)) {
+		case DLM_VERSION_3_1:
+			dlm_midcomms_receive_buffer_3_1((union dlm_packet *)ptr, nodeid);
 			break;
-		case DLM_RCOM:
-			if (msglen < sizeof(struct dlm_rcom)) {
-				log_print("dlm rcom msg too small: %u, will skip this message",
-					  msglen);
-				goto skip;
-			}
-
+		case DLM_VERSION_3_2:
+			dlm_midcomms_receive_buffer_3_2((union dlm_packet *)ptr, nodeid);
 			break;
 		default:
-			log_print("unsupported h_cmd received: %u, will skip this message",
-				  hd->h_cmd);
-			goto skip;
+			log_print("received invalid version header: %u from node %d, will skip this message",
+				  le32_to_cpu(hd->h_version), nodeid);
+			break;
 		}
 
-		dlm_receive_buffer((union dlm_packet *)ptr, nodeid);
-
-skip:
 		ret += msglen;
 		len -= msglen;
 		ptr += msglen;
@@ -149,3 +733,417 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 
 	return ret;
 }
+
+void dlm_midcomms_unack_msg_resend(int nodeid)
+{
+	struct midcomms_node *node;
+	struct dlm_send_msg *msg;
+	int idx;
+
+	idx = srcu_read_lock(&nodes_srcu);
+	node = nodeid2node(nodeid, 0);
+	if (!node) {
+		srcu_read_unlock(&nodes_srcu, idx);
+		return;
+	}
+
+	/* old protocol, we don't support to retransmit on failure */
+	switch (node->version) {
+	case DLM_VERSION_3_2:
+		break;
+	default:
+		srcu_read_unlock(&nodes_srcu, idx);
+		return;
+	}
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(msg, &node->send_queue, list) {
+		log_print("retransmit dlm msg, seq %u, nodeid %d",
+			  msg->seq, node->nodeid);
+		dlm_lowcomms_resend_buffer(msg->mh);
+	}
+	rcu_read_unlock();
+	srcu_read_unlock(&nodes_srcu, idx);
+}
+
+void *dlm_midcomms_stateless_get_buffer(int nodeid, int len, gfp_t allocation,
+					char **ppc)
+{
+	return dlm_lowcomms_new_buffer(nodeid, len, allocation,
+				       ppc, NULL, NULL);
+}
+
+void dlm_midcomms_stateless_commit_buffer(void *mh)
+{
+	dlm_lowcomms_commit_buffer(mh);
+	dlm_lowcomms_put_buffer(mh);
+}
+
+static void dlm_fill_opts_header(struct dlm_opts *opts, uint16_t inner_len,
+				 uint32_t seq)
+{
+	opts->o_header.h_cmd = DLM_OPTS;
+	opts->o_header.h_version = (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
+	opts->o_header.h_nodeid = dlm_our_nodeid();
+	opts->o_header.h_length = DLM_MIDCOMMS_OPT_LEN + inner_len;
+	opts->o_header.u.h_seq = seq;
+	header_out(&opts->o_header);
+}
+
+static void midcomms_get_buffer_cb(void *buf, void *priv)
+{
+	struct dlm_send_msg *msg = priv;
+
+	atomic_inc(&msg->node->send_queue_cnt);
+
+	spin_lock(&msg->node->send_queue_lock);
+	list_add_tail_rcu(&msg->list, &msg->node->send_queue);
+	spin_unlock(&msg->node->send_queue_lock);
+
+	msg->seq = msg->node->seq_send++;
+}
+
+static void *dlm_midcomms_get_buffer_3_2(struct dlm_send_msg *msg, int nodeid,
+					 int len, gfp_t allocation, char **ppc)
+{
+	struct dlm_opts *opts;
+	void *mh;
+
+	mh = dlm_lowcomms_new_buffer(nodeid, len + DLM_MIDCOMMS_OPT_LEN,
+				     allocation, ppc, midcomms_get_buffer_cb, msg);
+	if (!mh)
+		return NULL;
+
+	opts = (struct dlm_opts *)*ppc;
+	msg->opts = opts;
+
+	/* add possible options here */
+	dlm_fill_opts_header(opts, len, msg->seq);
+
+	*ppc += sizeof(*opts);
+	msg->inner_hd = (const struct dlm_header *)*ppc;
+	return mh;
+}
+
+void *dlm_midcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
+{
+	struct midcomms_node *node;
+	struct dlm_send_msg *msg;
+	void *mh;
+	int idx;
+
+	idx = srcu_read_lock(&nodes_srcu);
+	node = nodeid2node(nodeid, 0);
+	if (!node) {
+		WARN_ON_ONCE(1);
+		goto err;
+	}
+
+	if (test_bit(DLM_NODE_FLAG_STOP_TX, &node->flags)) {
+		WARN_ON(1);
+		goto err;
+	}
+
+	msg = kzalloc(sizeof(*msg), GFP_NOFS);
+	if (!msg)
+		goto err;
+
+	msg->idx = idx;
+	msg->node = node;
+
+	switch (node->version) {
+	case DLM_VERSION_3_1:
+		mh = dlm_midcomms_stateless_get_buffer(nodeid, len, allocation,
+						       ppc);
+		if (!mh) {
+			kfree(msg);
+			goto err;
+		}
+
+		break;
+	case DLM_VERSION_3_2:
+		mh = dlm_midcomms_get_buffer_3_2(msg, nodeid, len, allocation,
+						 ppc);
+		if (!mh) {
+			kfree(msg);
+			goto err;
+		}
+
+		break;
+	default:
+		kfree(msg);
+		WARN_ON(1);
+		goto err;
+	}
+
+	msg->mh = mh;
+
+	/* keep in mind that is a must to call
+	 * dlm_midcomms_commit_buffer() which releases
+	 * nodes_srcu using msg->idx which is assumed
+	 * here that the application will call it.
+	 */
+	return msg;
+
+err:
+	srcu_read_unlock(&nodes_srcu, idx);
+	return NULL;
+}
+
+static void dlm_midcomms_commit_buffer_3_2(struct dlm_send_msg *msg,
+					   struct midcomms_node *node)
+{
+	/* nexthdr chain for fast lookup */
+	msg->opts->o_nextcmd = msg->inner_hd->h_cmd;
+	dlm_lowcomms_commit_buffer(msg->mh);
+}
+
+static void dlm_midcomms_commit_buffer_3_1(void *mh)
+{
+	dlm_midcomms_stateless_commit_buffer(mh);
+}
+
+void dlm_midcomms_commit_buffer(void *mh)
+{
+	struct dlm_send_msg *msg = mh;
+
+	switch (msg->node->version) {
+	case DLM_VERSION_3_1:
+		srcu_read_unlock(&nodes_srcu, msg->idx);
+
+		dlm_midcomms_commit_buffer_3_1(msg->mh);
+		/* msg is not part of rcu list in this case */
+		kfree(msg);
+		break;
+	case DLM_VERSION_3_2:
+		dlm_midcomms_commit_buffer_3_2(msg, msg->node);
+		srcu_read_unlock(&nodes_srcu, msg->idx);
+		break;
+	default:
+		srcu_read_unlock(&nodes_srcu, msg->idx);
+		WARN_ON(1);
+		break;
+	}
+}
+
+void midcomms_add_member(int nodeid)
+{
+	struct midcomms_node *node;
+	int idx;
+
+	if (nodeid == dlm_our_nodeid())
+		return;
+
+	idx = srcu_read_lock(&nodes_srcu);
+	node = nodeid2node(nodeid, GFP_NOFS);
+	if (!node) {
+		srcu_read_unlock(&nodes_srcu, idx);
+		return;
+	}
+
+	node->users++;
+	srcu_read_unlock(&nodes_srcu, idx);
+}
+
+static void dlm_fin_ack(struct midcomms_node *node)
+{
+	set_bit(DLM_NODE_FLAG_FIN_ACK, &node->flags);
+	wake_up(&node->fin_wait);
+}
+
+static void midcomms_drain_and_fin(struct midcomms_node *node, bool active)
+{
+	int ret;
+
+	/* old protocol, we don't wait for pending operations */
+	switch (node->version) {
+	case DLM_VERSION_3_2:
+		break;
+	default:
+		return;
+	}
+
+	if (DLM_DEBUG_FENCE_TERMINATION)
+		msleep(5000);
+
+	ret = wait_event_timeout(node->fin_wait,
+				 !atomic_read(&node->send_queue_cnt) ||
+				 test_bit(DLM_NODE_FLAG_CLOSE, &node->flags),
+				 DLM_QUEUE_TIMEOUT);
+	if (!ret || test_bit(DLM_NODE_FLAG_CLOSE, &node->flags))
+		goto timed_out;
+
+	if (active) {
+		dlm_send_fin(node->nodeid, dlm_fin_ack);
+		set_bit(DLM_NODE_FLAG_STOP_TX, &node->flags);
+
+		/* wait for other side dlm + fin */
+		ret = wait_event_timeout(node->fin_wait,
+					 (!atomic_read(&node->send_queue_cnt) &&
+					  test_bit(DLM_NODE_FLAG_FIN_ACK, &node->flags) &&
+					  test_bit(DLM_NODE_FLAG_FIN, &node->flags)) ||
+					 test_bit(DLM_NODE_FLAG_CLOSE, &node->flags),
+					 DLM_FIN_TIMEOUT);
+		if (!ret || test_bit(DLM_NODE_FLAG_CLOSE, &node->flags))
+			goto timed_out;
+	} else {
+		/* wait other side is finished by it's fin */
+		ret = wait_event_timeout(node->fin_wait,
+					 test_bit(DLM_NODE_FLAG_FIN, &node->flags) ||
+					 test_bit(DLM_NODE_FLAG_CLOSE, &node->flags),
+					 DLM_FIN_TIMEOUT);
+		if (!ret || test_bit(DLM_NODE_FLAG_CLOSE, &node->flags))
+			goto timed_out;
+
+		dlm_send_fin(node->nodeid, dlm_fin_ack);
+		set_bit(DLM_NODE_FLAG_STOP_TX, &node->flags);
+
+		/* wait fin ack is back */
+		ret = wait_event_timeout(node->fin_wait,
+					 (!atomic_read(&node->send_queue_cnt) &&
+					  test_bit(DLM_NODE_FLAG_FIN_ACK, &node->flags)) ||
+					 test_bit(DLM_NODE_FLAG_CLOSE, &node->flags),
+					 DLM_FIN_TIMEOUT);
+		if (!ret || test_bit(DLM_NODE_FLAG_CLOSE, &node->flags))
+			goto timed_out;
+	}
+
+	set_bit(DLM_NODE_FLAG_STOP_RX, &node->flags);
+
+	return;
+
+timed_out:
+	if (!ret)
+		log_print("timed out from node %d", node->nodeid);
+
+	dlm_send_queue_flush(node);
+	synchronize_rcu();
+}
+
+static void midcomms_node_release(struct rcu_head *rcu)
+{
+	struct midcomms_node *node = container_of(rcu, struct midcomms_node, rcu);
+
+	/* warn if we have anything in queues which indicates a bug */
+	WARN_ON(atomic_read(&node->send_queue_cnt));
+
+	kfree(node);
+}
+
+void midcomms_remove_member(int nodeid)
+{
+	struct midcomms_node *node;
+	int idx;
+
+	if (nodeid == dlm_our_nodeid())
+		return;
+
+	idx = srcu_read_lock(&nodes_srcu);
+	mutex_lock(&close_lock);
+	node = nodeid2node(nodeid, 0);
+	if (!node) {
+		mutex_unlock(&close_lock);
+		srcu_read_unlock(&nodes_srcu, idx);
+		return;
+	}
+
+	node->users--;
+
+	/* hitting users count to zero means the
+	 * other side is running dlm_midcomms_stop()
+	 * we meet us to have a clean disconnect.
+	 */
+	if (!node->users) {
+		midcomms_drain_and_fin(node, false);
+
+		spin_lock(&nodes_lock);
+		hlist_del_rcu(&node->hlist);
+		spin_unlock(&nodes_lock);
+
+		call_srcu(&nodes_srcu, &node->rcu, midcomms_node_release);
+	}
+	mutex_unlock(&close_lock);
+	srcu_read_unlock(&nodes_srcu, idx);
+}
+
+int dlm_midcomms_start(void)
+{
+	int i;
+
+	for (i = 0; i < CONN_HASH_SIZE; i++)
+		INIT_HLIST_HEAD(&node_hash[i]);
+
+	return dlm_lowcomms_start();
+}
+
+void dlm_midcomms_shutdown(void)
+{
+	struct midcomms_node *node;
+	int i, idx;
+
+	mutex_lock(&close_lock);
+	idx = srcu_read_lock(&nodes_srcu);
+	for (i = 0; i < CONN_HASH_SIZE; i++) {
+		hlist_for_each_entry_rcu(node, &node_hash[i], hlist) {
+			midcomms_drain_and_fin(node, true);
+		}
+	}
+
+	dlm_lowcomms_shutdown();
+
+	for (i = 0; i < CONN_HASH_SIZE; i++) {
+		hlist_for_each_entry_rcu(node, &node_hash[i], hlist) {
+			spin_lock(&nodes_lock);
+			hlist_del_rcu(&node->hlist);
+			spin_unlock(&nodes_lock);
+
+			call_srcu(&nodes_srcu, &node->rcu, midcomms_node_release);
+		}
+	}
+	srcu_read_unlock(&nodes_srcu, idx);
+	mutex_unlock(&close_lock);
+}
+
+int dlm_midcomms_close(int nodeid)
+{
+	struct midcomms_node *node;
+	int ret, idx;
+
+	if (nodeid == dlm_our_nodeid())
+		return 0;
+
+	idx = srcu_read_lock(&nodes_srcu);
+	/* Abort pending close/remove operation */
+	node = nodeid2node(nodeid, 0);
+	if (node) {
+		set_bit(DLM_NODE_FLAG_STOP_TX, &node->flags);
+		set_bit(DLM_NODE_FLAG_CLOSE, &node->flags);
+		wake_up(&node->fin_wait);
+	}
+
+	mutex_lock(&close_lock);
+	node = nodeid2node(nodeid, 0);
+	if (!node) {
+		mutex_unlock(&close_lock);
+		srcu_read_unlock(&nodes_srcu, idx);
+		return dlm_lowcomms_close(nodeid);
+	}
+
+	spin_lock(&nodes_lock);
+	hlist_del_rcu(&node->hlist);
+	spin_unlock(&nodes_lock);
+
+	dlm_send_queue_flush(node);
+	synchronize_rcu();
+	srcu_read_unlock(&nodes_srcu, idx);
+
+	/* wait until all readers left srcu */
+	synchronize_srcu(&nodes_srcu);
+	/* wait until there are all readers left e.g. timer */
+	mutex_unlock(&close_lock);
+
+	ret = dlm_lowcomms_close(nodeid);
+	set_bit(DLM_NODE_FLAG_STOP_RX, &node->flags);
+	call_srcu(&nodes_srcu, &node->rcu, midcomms_node_release);
+	return ret;
+}
diff --git a/fs/dlm/midcomms.h b/fs/dlm/midcomms.h
index 6ce2f2947475..a81bfb6abb4b 100644
--- a/fs/dlm/midcomms.h
+++ b/fs/dlm/midcomms.h
@@ -23,6 +23,7 @@ void midcomms_remove_member(int nodeid);
 int dlm_midcomms_close(int nodeid);
 int dlm_midcomms_start(void);
 void dlm_midcomms_shutdown(void);
+void dlm_midcomms_unack_msg_resend(int nodeid);
 
 #endif				/* __MIDCOMMS_DOT_H__ */
 
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 06f7a5f1d99d..d731d9e65c3b 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -168,7 +168,7 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 	set_rcom_status(ls, (struct rcom_status *)rc->rc_buf, status_flags);
 
 	allow_sync_reply(ls, &rc->rc_id);
-	memset(ls->ls_recover_buf, 0, LOWCOMMS_MAX_TX_BUFFER_LEN);
+	memset(ls->ls_recover_buf, 0, DEFAULT_BUFFER_SIZE);
 
 	send_rcom(ls, mh, rc, true);
 
@@ -291,7 +291,7 @@ int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name, int last_len)
 	memcpy(rc->rc_buf, last_name, last_len);
 
 	allow_sync_reply(ls, &rc->rc_id);
-	memset(ls->ls_recover_buf, 0, LOWCOMMS_MAX_TX_BUFFER_LEN);
+	memset(ls->ls_recover_buf, 0, DEFAULT_BUFFER_SIZE);
 
 	send_rcom(ls, mh, rc, true);
 
-- 
2.26.3

