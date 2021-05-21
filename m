Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3E77638CDFA
	for <lists+cluster-devel@lfdr.de>; Fri, 21 May 2021 21:09:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621624166;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OOP5GOwrsz2A1YszqCl55vgecBQY11CwMn4JDk+2C/4=;
	b=XIUMCF/nK48413BAqTITKw6ok9kYLGRuFIP7qNFMjQ5jYVMThveCuptteC/GhszCcO0sUl
	52bPtadPcf3n6VR+XJgSn25nXO2YMuwVGsnN08L+hT9agtGbeBBjHSbdy7seFTSxObAKEa
	gO70iHLb/hAYv3jlDuw3nF6XrawfjFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-VJ0Q7fGaPI-if3Fx4cl6wA-1; Fri, 21 May 2021 15:09:24 -0400
X-MC-Unique: VJ0Q7fGaPI-if3Fx4cl6wA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5D408015F5;
	Fri, 21 May 2021 19:09:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C83FC5D6CF;
	Fri, 21 May 2021 19:09:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B830944A66;
	Fri, 21 May 2021 19:09:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14LJ9L7A005262 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 May 2021 15:09:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38FAA5C890; Fri, 21 May 2021 19:09:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-19.rdu2.redhat.com [10.10.115.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A7605C1BB;
	Fri, 21 May 2021 19:09:17 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 21 May 2021 15:08:46 -0400
Message-Id: <20210521190848.350176-15-aahringo@redhat.com>
In-Reply-To: <20210521190848.350176-1-aahringo@redhat.com>
References: <20210521190848.350176-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv6 v5.13-rc1 dlm/next 14/16] fs: dlm: add
	reliable connection if reconnect
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

This provides a 4 way handshake for connection termination inclusive
support for half-closed connections. It's provided on application layer
because SCTP doesn't support half-closed sockets, the shutdown() call
can interrupted by e.g. TCP resets itself and a hard logic to implement
it because the othercon paradigm in lowcomms. The 4-way termination
handshake also solve problems to synchronize peer EOF arrival and that
the cluster manager removes the peer in the node membership handling of
DLM. In some cases messages can be still transmitted in this time and we
need to wait for the node membership event.

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
 fs/dlm/lowcomms.c     |    4 +-
 fs/dlm/lowcomms.h     |    7 +-
 fs/dlm/midcomms.c     | 1290 +++++++++++++++++++++++++++++++++++++++--
 fs/dlm/midcomms.h     |    1 +
 fs/dlm/rcom.c         |    4 +-
 7 files changed, 1292 insertions(+), 51 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 8f5980909d80..40917c878370 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -371,18 +371,26 @@ static inline int rsb_flag(struct dlm_rsb *r, enum rsb_flags flag)
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
@@ -390,7 +398,6 @@ struct dlm_header {
 	uint8_t			h_pad;
 };
 
-
 #define DLM_MSG_REQUEST		1
 #define DLM_MSG_CONVERT		2
 #define DLM_MSG_UNLOCK		3
@@ -458,10 +465,29 @@ struct dlm_rcom {
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
index 1f2759cfda09..fe9113bd5ba0 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1762,8 +1762,10 @@ static void process_send_sockets(struct work_struct *work)
 
 	clear_bit(CF_WRITE_PENDING, &con->flags);
 
-	if (test_and_clear_bit(CF_RECONNECT, &con->flags))
+	if (test_and_clear_bit(CF_RECONNECT, &con->flags)) {
 		close_connection(con, false, false, true);
+		dlm_midcomms_unack_msg_resend(con->nodeid);
+	}
 
 	if (con->sock == NULL) { /* not mutex protected so check it inside too */
 		if (test_and_clear_bit(CF_DELAY_CONNECT, &con->flags))
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 66dc1bb3de7f..730c34317183 100644
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
index aadb3781bebe..eef3938a363e 100644
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
@@ -12,53 +12,817 @@
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
+ * The midcomms layer does a 4 way handshake for termination on DLM protocol
+ * like TCP supports it with half-closed socket support. SCTP doesn't support
+ * half-closed socket, so we do it on DLM layer. Also socket shutdown() can be
+ * interrupted by .e.g. tcp reset itself. Additional there exists the othercon
+ * paradigm in lowcomms which cannot be easily without breaking backwards
+ * compatibility. A node cannot send anything to another node when a DLM_FIN
+ * message was send. There exists additional logic to print a warning if
+ * DLM wants to do it. There exists a state handling like RFC 793 but reduced
+ * to termination only. The event "member removal event" describes the cluster
+ * manager removed the node from internal lists, at this point DLM does not
+ * send any message to the other node. There exists two cases:
+ *
+ * 1. The cluster member was removed and we received a FIN
+ * OR
+ * 2. We received a FIN but the member was not removed yet
+ *
+ * One of these cases will do the CLOSE_WAIT to LAST_ACK change.
+ *
+ *
+ *                              +---------+
+ *                              | CLOSED  |
+ *                              +---------+
+ *                                   | add member/receive RCOM version
+ *                                   |            detection msg
+ *                                   V
+ *                              +---------+
+ *                              |  ESTAB  |
+ *                              +---------+
+ *                       CLOSE    |     |    rcv FIN
+ *                      -------   |     |    -------
+ * +---------+          snd FIN  /       \   snd ACK          +---------+
+ * |  FIN    |<-----------------           ------------------>|  CLOSE  |
+ * | WAIT-1  |------------------                              |   WAIT  |
+ * +---------+          rcv FIN  \                            +---------+
+ * | rcv ACK of FIN   -------   |                            CLOSE  | member
+ * | --------------   snd ACK   |                           ------- | removal
+ * V        x                   V                           snd FIN V event
+ * +---------+                  +---------+                   +---------+
+ * |FINWAIT-2|                  | CLOSING |                   | LAST-ACK|
+ * +---------+                  +---------+                   +---------+
+ * |                rcv ACK of FIN |                 rcv ACK of FIN |
+ * |  rcv FIN       -------------- |                 -------------- |
+ * |  -------              x       V                        x       V
+ *  \ snd ACK                 +---------+                   +---------+
+ *   ------------------------>| CLOSED  |                   | CLOSED  |
+ *                            +---------+                   +---------+
+ *
+ * NOTE: any state can interrupted by midcomms_close() and state will be
+ * switched to CLOSED in case of fencing. There exists also some timeout
+ * handling when we receive the version detection RCOM messages which is
+ * made by observation.
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
 
-struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
-					     gfp_t allocation, char **ppc)
+/* init value for sequence numbers for testing purpose only e.g. overflows */
+#define DLM_SEQ_INIT		0
+/* 3 minutes wait to sync ending of dlm */
+#define DLM_SHUTDOWN_TIMEOUT	msecs_to_jiffies(3 * 60 * 1000)
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
+#define DLM_NODE_FLAG_CLOSE	1
+#define DLM_NODE_FLAG_STOP_TX	2
+#define DLM_NODE_FLAG_STOP_RX	3
+	unsigned long flags;
+	wait_queue_head_t shutdown_wait;
+
+	/* dlm tcp termination state */
+#define DLM_CLOSED	1
+#define DLM_ESTABLISHED	2
+#define DLM_FIN_WAIT1	3
+#define DLM_FIN_WAIT2	4
+#define DLM_CLOSE_WAIT	5
+#define DLM_LAST_ACK	6
+#define DLM_CLOSING	7
+	int state;
+	spinlock_t state_lock;
+
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
+struct dlm_mhandle {
+	const struct dlm_header *inner_hd;
+	struct midcomms_node *node;
+	struct dlm_opts *opts;
+	struct dlm_msg *msg;
+	bool committed;
+	uint32_t seq;
+
+	void (*ack_rcv)(struct midcomms_node *node);
+
+	/* get_mhandle/commit srcu idx exchange */
+	int idx;
+
+	struct list_head list;
+	struct rcu_head rcu;
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
+static inline const char *dlm_state_str(int state)
 {
-	return (struct dlm_mhandle *)dlm_lowcomms_new_msg(nodeid, len,
-							  allocation, ppc,
-							  NULL, NULL);
+	switch (state) {
+	case DLM_CLOSED:
+		return "CLOSED";
+	case DLM_ESTABLISHED:
+		return "ESTABLISHED";
+	case DLM_FIN_WAIT1:
+		return "FIN_WAIT1";
+	case DLM_FIN_WAIT2:
+		return "FIN_WAIT2";
+	case DLM_CLOSE_WAIT:
+		return "CLOSE_WAIT";
+	case DLM_LAST_ACK:
+		return "LAST_ACK";
+	case DLM_CLOSING:
+		return "CLOSING";
+	default:
+		return "UNKNOWN";
+	}
 }
 
-void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh)
+static struct midcomms_node *__find_node(int nodeid, int r)
 {
-	dlm_lowcomms_commit_msg((struct dlm_msg *)mh);
-	dlm_lowcomms_put_msg((struct dlm_msg *)mh);
+	struct midcomms_node *node;
+
+	hlist_for_each_entry_rcu(node, &node_hash[r], hlist) {
+		if (node->nodeid == nodeid)
+			return node;
+	}
+
+	return NULL;
 }
 
-void dlm_midcomms_add_member(int nodeid) { }
+static void dlm_mhandle_release(struct rcu_head *rcu)
+{
+	struct dlm_mhandle *mh = container_of(rcu, struct dlm_mhandle, rcu);
 
-void dlm_midcomms_remove_member(int nodeid) { }
+	dlm_lowcomms_put_msg(mh->msg);
+	kfree(mh);
+}
 
-int dlm_midcomms_start(void)
+static void dlm_send_queue_flush(struct midcomms_node *node)
 {
-	return dlm_lowcomms_start();
+	struct dlm_mhandle *mh;
+
+	pr_debug("flush midcomms send queue of node %d\n", node->nodeid);
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(mh, &node->send_queue, list) {
+		spin_lock(&node->send_queue_lock);
+		list_del_rcu(&mh->list);
+		spin_unlock(&node->send_queue_lock);
+
+		atomic_dec(&node->send_queue_cnt);
+
+		call_rcu(&mh->rcu, dlm_mhandle_release);
+	}
+	rcu_read_unlock();
 }
 
-void dlm_midcomms_shutdown(void)
+static void midcomms_node_reset(struct midcomms_node *node)
 {
-	dlm_lowcomms_shutdown();
+	pr_debug("reset node %d\n", node->nodeid);
+
+	node->seq_next = DLM_SEQ_INIT;
+	node->seq_send = DLM_SEQ_INIT;
+	node->version = DLM_VERSION_NOT_SET;
+	node->flags = 0;
+
+	dlm_send_queue_flush(node);
+	node->state = DLM_CLOSED;
+	wake_up(&node->shutdown_wait);
 }
 
-int dlm_midcomms_close(int nodeid)
+static struct midcomms_node *nodeid2node(int nodeid, gfp_t alloc)
+{
+	struct midcomms_node *node, *tmp;
+	int r = nodeid_hash(nodeid);
+
+	node = __find_node(nodeid, r);
+	if (node || !alloc)
+		return node;
+
+	node = kmalloc(sizeof(*node), alloc);
+	if (!node)
+		return NULL;
+
+	node->nodeid = nodeid;
+	spin_lock_init(&node->state_lock);
+	spin_lock_init(&node->send_queue_lock);
+	atomic_set(&node->send_queue_cnt, 0);
+	INIT_LIST_HEAD(&node->send_queue);
+	init_waitqueue_head(&node->shutdown_wait);
+	node->users = 0;
+	midcomms_node_reset(node);
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
+	return node;
+}
+
+static int dlm_send_ack(int nodeid, uint32_t seq)
+{
+	int mb_len = sizeof(struct dlm_header);
+	struct dlm_header *m_header;
+	struct dlm_msg *msg;
+	char *ppc;
+
+	msg = dlm_lowcomms_new_msg(nodeid, mb_len, GFP_NOFS, &ppc,
+				   NULL, NULL);
+	if (!msg)
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
+	dlm_lowcomms_commit_msg(msg);
+	dlm_lowcomms_put_msg(msg);
+
+	return 0;
+}
+
+static int dlm_send_fin(struct midcomms_node *node,
+			void (*ack_rcv)(struct midcomms_node *node))
+{
+	int mb_len = sizeof(struct dlm_header);
+	struct dlm_header *m_header;
+	struct dlm_mhandle *mh;
+	char *ppc;
+
+	mh = dlm_midcomms_get_mhandle(node->nodeid, mb_len, GFP_NOFS, &ppc);
+	if (!mh)
+		return -ENOMEM;
+
+	mh->ack_rcv = ack_rcv;
+
+	m_header = (struct dlm_header *)ppc;
+
+	m_header->h_version = (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
+	m_header->h_nodeid = dlm_our_nodeid();
+	m_header->h_length = mb_len;
+	m_header->h_cmd = DLM_FIN;
+
+	header_out(m_header);
+
+	pr_debug("sending fin msg to node %d\n", node->nodeid);
+	dlm_midcomms_commit_mhandle(mh);
+	set_bit(DLM_NODE_FLAG_STOP_TX, &node->flags);
+
+	return 0;
+}
+
+static void dlm_receive_ack(struct midcomms_node *node, uint32_t seq)
+{
+	struct dlm_mhandle *mh;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(mh, &node->send_queue, list) {
+		if (before(mh->seq, seq)) {
+			spin_lock(&node->send_queue_lock);
+			list_del_rcu(&mh->list);
+			spin_unlock(&node->send_queue_lock);
+
+			atomic_dec(&node->send_queue_cnt);
+
+			if (mh->ack_rcv)
+				mh->ack_rcv(node);
+
+			call_rcu(&mh->rcu, dlm_mhandle_release);
+		} else {
+			/* send queue should be ordered */
+			break;
+		}
+	}
+	rcu_read_unlock();
+}
+
+static void dlm_pas_fin_ack_rcv(struct midcomms_node *node)
+{
+	spin_lock(&node->state_lock);
+	pr_debug("receive passive fin ack from node %d with state %s\n",
+		 node->nodeid, dlm_state_str(node->state));
+
+	switch (node->state) {
+	case DLM_LAST_ACK:
+		/* DLM_CLOSED */
+		midcomms_node_reset(node);
+		break;
+	case DLM_CLOSED:
+		/* not valid but somehow we got what we want */
+		wake_up(&node->shutdown_wait);
+		break;
+	default:
+		spin_unlock(&node->state_lock);
+		log_print("%s: unexpected state: %d\n",
+			  __func__, node->state);
+		WARN_ON(1);
+		return;
+	}
+	spin_unlock(&node->state_lock);
+}
+
+static void dlm_midcomms_receive_buffer(union dlm_packet *p,
+					struct midcomms_node *node,
+					uint32_t seq)
+{
+	if (seq == node->seq_next) {
+		node->seq_next++;
+		/* send ack before fin */
+		dlm_send_ack(node->nodeid, node->seq_next);
+
+		switch (p->header.h_cmd) {
+		case DLM_FIN:
+			spin_lock(&node->state_lock);
+			pr_debug("receive fin msg from node %d with state %s\n",
+				 node->nodeid, dlm_state_str(node->state));
+
+			switch (node->state) {
+			case DLM_ESTABLISHED:
+				node->state = DLM_CLOSE_WAIT;
+				pr_debug("switch node %d to state %s\n",
+					 node->nodeid, dlm_state_str(node->state));
+				/* passive shutdown DLM_LAST_ACK case 1
+				 * additional we check if the node is used by
+				 * cluster manager events at all.
+				 */
+				if (node->users == 0) {
+					node->state = DLM_LAST_ACK;
+					pr_debug("switch node %d to state %s case 1\n",
+						 node->nodeid, dlm_state_str(node->state));
+					spin_unlock(&node->state_lock);
+					goto send_fin;
+				}
+				break;
+			case DLM_FIN_WAIT1:
+				node->state = DLM_CLOSING;
+				pr_debug("switch node %d to state %s\n",
+					 node->nodeid, dlm_state_str(node->state));
+				break;
+			case DLM_FIN_WAIT2:
+				midcomms_node_reset(node);
+				pr_debug("switch node %d to state %s\n",
+					 node->nodeid, dlm_state_str(node->state));
+				wake_up(&node->shutdown_wait);
+				break;
+			case DLM_LAST_ACK:
+				/* probably remove_member caught it, do nothing */
+				break;
+			default:
+				spin_unlock(&node->state_lock);
+				log_print("%s: unexpected state: %d\n",
+					  __func__, node->state);
+				WARN_ON(1);
+				return;
+			}
+			spin_unlock(&node->state_lock);
+
+			set_bit(DLM_NODE_FLAG_STOP_RX, &node->flags);
+			break;
+		default:
+			WARN_ON(test_bit(DLM_NODE_FLAG_STOP_RX, &node->flags));
+			dlm_receive_buffer(p, node->nodeid);
+			break;
+		}
+	} else {
+		/* retry to ack message which we already have by sending back
+		 * current node->seq_next number as ack.
+		 */
+		if (seq < node->seq_next)
+			dlm_send_ack(node->nodeid, node->seq_next);
+
+		log_print_ratelimited("ignore dlm msg because seq mismatch, seq: %u, expected: %u, nodeid: %d",
+				      seq, node->seq_next, node->nodeid);
+	}
+
+	return;
+
+send_fin:
+	set_bit(DLM_NODE_FLAG_STOP_RX, &node->flags);
+	dlm_send_fin(node, dlm_pas_fin_ack_rcv);
+}
+
+static struct midcomms_node *
+dlm_midcomms_recv_node_lookup(int nodeid, const union dlm_packet *p,
+			      uint16_t msglen, int (*cb)(struct midcomms_node *node))
+{
+	struct midcomms_node *node = NULL;
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
+			node = nodeid2node(nodeid, 0);
+			if (node) {
+				spin_lock(&node->state_lock);
+				if (node->state != DLM_ESTABLISHED)
+					pr_debug("receive begin RCOM msg from node %d with state %s\n",
+						 node->nodeid, dlm_state_str(node->state));
+
+				switch (node->state) {
+				case DLM_CLOSED:
+					node->state = DLM_ESTABLISHED;
+					pr_debug("switch node %d to state %s\n",
+						 node->nodeid, dlm_state_str(node->state));
+					break;
+				case DLM_ESTABLISHED:
+					break;
+				default:
+					/* some invalid state passive shutdown
+					 * was failed, we try to reset and
+					 * hope it will go on.
+					 */
+					log_print("reset node %d because shutdown stucked",
+						  node->nodeid);
+
+					midcomms_node_reset(node);
+					node->state = DLM_ESTABLISHED;
+					break;
+				}
+				spin_unlock(&node->state_lock);
+			}
+
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
+		log_print_ratelimited("received dlm message cmd %d nextcmd %d from node %d in an invalid sequence",
+				      p->header.h_cmd, p->opts.o_nextcmd, nodeid);
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
+		log_print_ratelimited("version mismatch detected, assumed 0x%08x but node %d has 0x%08x",
+				      DLM_VERSION_3_2, node->nodeid, node->version);
+		return -1;
+	}
+
+	return 0;
+}
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
+		WARN_ON(test_bit(DLM_NODE_FLAG_STOP_RX, &node->flags));
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
+			break;
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
 {
-	return dlm_lowcomms_close(nodeid);
+	switch (node->version) {
+	case DLM_VERSION_NOT_SET:
+		node->version = DLM_VERSION_3_1;
+		log_print("version 0x%08x for node %d detected", DLM_VERSION_3_1,
+			  node->nodeid);
+		break;
+	case DLM_VERSION_3_1:
+		break;
+	default:
+		log_print_ratelimited("version mismatch detected, assumed 0x%08x but node %d has 0x%08x",
+				      DLM_VERSION_3_1, node->nodeid, node->version);
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
@@ -101,32 +865,19 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
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
@@ -134,3 +885,454 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 
 	return ret;
 }
+
+void dlm_midcomms_unack_msg_resend(int nodeid)
+{
+	struct midcomms_node *node;
+	struct dlm_mhandle *mh;
+	int idx, ret;
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
+	list_for_each_entry_rcu(mh, &node->send_queue, list) {
+		if (!mh->committed)
+			continue;
+
+		ret = dlm_lowcomms_resend_msg(mh->msg);
+		if (!ret)
+			log_print_ratelimited("retransmit dlm msg, seq %u, nodeid %d",
+					      mh->seq, node->nodeid);
+	}
+	rcu_read_unlock();
+	srcu_read_unlock(&nodes_srcu, idx);
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
+static void midcomms_new_msg_cb(struct dlm_mhandle *mh)
+{
+	atomic_inc(&mh->node->send_queue_cnt);
+
+	spin_lock(&mh->node->send_queue_lock);
+	list_add_tail_rcu(&mh->list, &mh->node->send_queue);
+	spin_unlock(&mh->node->send_queue_lock);
+
+	mh->seq = mh->node->seq_send++;
+}
+
+static struct dlm_msg *dlm_midcomms_get_msg_3_2(struct dlm_mhandle *mh, int nodeid,
+						int len, gfp_t allocation, char **ppc)
+{
+	struct dlm_opts *opts;
+	struct dlm_msg *msg;
+
+	msg = dlm_lowcomms_new_msg(nodeid, len + DLM_MIDCOMMS_OPT_LEN,
+				   allocation, ppc, midcomms_new_msg_cb, mh);
+	if (!msg)
+		return NULL;
+
+	opts = (struct dlm_opts *)*ppc;
+	mh->opts = opts;
+
+	/* add possible options here */
+	dlm_fill_opts_header(opts, len, mh->seq);
+
+	*ppc += sizeof(*opts);
+	mh->inner_hd = (const struct dlm_header *)*ppc;
+	return msg;
+}
+
+struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
+					     gfp_t allocation, char **ppc)
+{
+	struct midcomms_node *node;
+	struct dlm_mhandle *mh;
+	struct dlm_msg *msg;
+	int idx;
+
+	idx = srcu_read_lock(&nodes_srcu);
+	node = nodeid2node(nodeid, 0);
+	if (!node) {
+		WARN_ON_ONCE(1);
+		goto err;
+	}
+
+	/* this is a bug, however we going on and hope it will be resolved */
+	WARN_ON(test_bit(DLM_NODE_FLAG_STOP_TX, &node->flags));
+
+	mh = kzalloc(sizeof(*mh), GFP_NOFS);
+	if (!mh)
+		goto err;
+
+	mh->idx = idx;
+	mh->node = node;
+
+	switch (node->version) {
+	case DLM_VERSION_3_1:
+		msg = dlm_lowcomms_new_msg(nodeid, len, allocation, ppc,
+					   NULL, NULL);
+		if (!msg) {
+			kfree(mh);
+			goto err;
+		}
+
+		break;
+	case DLM_VERSION_3_2:
+		msg = dlm_midcomms_get_msg_3_2(mh, nodeid, len, allocation,
+					       ppc);
+		if (!msg) {
+			kfree(mh);
+			goto err;
+		}
+
+		break;
+	default:
+		kfree(mh);
+		WARN_ON(1);
+		goto err;
+	}
+
+	mh->msg = msg;
+
+	/* keep in mind that is a must to call
+	 * dlm_midcomms_commit_msg() which releases
+	 * nodes_srcu using mh->idx which is assumed
+	 * here that the application will call it.
+	 */
+	return mh;
+
+err:
+	srcu_read_unlock(&nodes_srcu, idx);
+	return NULL;
+}
+
+static void dlm_midcomms_commit_msg_3_2(struct dlm_mhandle *mh)
+{
+	/* nexthdr chain for fast lookup */
+	mh->opts->o_nextcmd = mh->inner_hd->h_cmd;
+	mh->committed = true;
+	dlm_lowcomms_commit_msg(mh->msg);
+}
+
+void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh)
+{
+	switch (mh->node->version) {
+	case DLM_VERSION_3_1:
+		srcu_read_unlock(&nodes_srcu, mh->idx);
+
+		dlm_lowcomms_commit_msg(mh->msg);
+		dlm_lowcomms_put_msg(mh->msg);
+		/* mh is not part of rcu list in this case */
+		kfree(mh);
+		break;
+	case DLM_VERSION_3_2:
+		dlm_midcomms_commit_msg_3_2(mh);
+		srcu_read_unlock(&nodes_srcu, mh->idx);
+		break;
+	default:
+		srcu_read_unlock(&nodes_srcu, mh->idx);
+		WARN_ON(1);
+		break;
+	}
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
+static void dlm_act_fin_ack_rcv(struct midcomms_node *node)
+{
+	spin_lock(&node->state_lock);
+	pr_debug("receive active fin ack from node %d with state %s\n",
+		 node->nodeid, dlm_state_str(node->state));
+
+	switch (node->state) {
+	case DLM_FIN_WAIT1:
+		node->state = DLM_FIN_WAIT2;
+		pr_debug("switch node %d to state %s\n",
+			 node->nodeid, dlm_state_str(node->state));
+		break;
+	case DLM_CLOSING:
+		midcomms_node_reset(node);
+		pr_debug("switch node %d to state %s\n",
+			 node->nodeid, dlm_state_str(node->state));
+		wake_up(&node->shutdown_wait);
+		break;
+	case DLM_CLOSED:
+		/* not valid but somehow we got what we want */
+		wake_up(&node->shutdown_wait);
+		break;
+	default:
+		spin_unlock(&node->state_lock);
+		log_print("%s: unexpected state: %d\n",
+			  __func__, node->state);
+		WARN_ON(1);
+		return;
+	}
+	spin_unlock(&node->state_lock);
+}
+
+void dlm_midcomms_add_member(int nodeid)
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
+	spin_lock(&node->state_lock);
+	if (!node->users) {
+		pr_debug("receive add member from node %d with state %s\n",
+			 node->nodeid, dlm_state_str(node->state));
+		switch (node->state) {
+		case DLM_ESTABLISHED:
+			break;
+		case DLM_CLOSED:
+			node->state = DLM_ESTABLISHED;
+			pr_debug("switch node %d to state %s\n",
+				 node->nodeid, dlm_state_str(node->state));
+			break;
+		default:
+			/* some invalid state passive shutdown
+			 * was failed, we try to reset and
+			 * hope it will go on.
+			 */
+			log_print("reset node %d because shutdown stucked",
+				  node->nodeid);
+
+			midcomms_node_reset(node);
+			node->state = DLM_ESTABLISHED;
+			break;
+		}
+	}
+
+	node->users++;
+	pr_debug("users inc count %d\n", node->users);
+	spin_unlock(&node->state_lock);
+
+	srcu_read_unlock(&nodes_srcu, idx);
+}
+
+void dlm_midcomms_remove_member(int nodeid)
+{
+	struct midcomms_node *node;
+	int idx;
+
+	if (nodeid == dlm_our_nodeid())
+		return;
+
+	idx = srcu_read_lock(&nodes_srcu);
+	node = nodeid2node(nodeid, 0);
+	if (!node) {
+		srcu_read_unlock(&nodes_srcu, idx);
+		return;
+	}
+
+	spin_lock(&node->state_lock);
+	node->users--;
+	pr_debug("users dec count %d\n", node->users);
+
+	/* hitting users count to zero means the
+	 * other side is running dlm_midcomms_stop()
+	 * we meet us to have a clean disconnect.
+	 */
+	if (node->users == 0) {
+		pr_debug("receive remove member from node %d with state %s\n",
+			 node->nodeid, dlm_state_str(node->state));
+		switch (node->state) {
+		case DLM_ESTABLISHED:
+			break;
+		case DLM_CLOSE_WAIT:
+			/* passive shutdown DLM_LAST_ACK case 2 */
+			node->state = DLM_LAST_ACK;
+			spin_unlock(&node->state_lock);
+
+			pr_debug("switch node %d to state %s case 2\n",
+				 node->nodeid, dlm_state_str(node->state));
+			goto send_fin;
+		case DLM_LAST_ACK:
+			/* probably receive fin caught it, do nothing */
+			break;
+		case DLM_CLOSED:
+			/* already gone, do nothing */
+			break;
+		default:
+			log_print("%s: unexpected state: %d\n",
+				  __func__, node->state);
+			break;
+		}
+	}
+	spin_unlock(&node->state_lock);
+
+	srcu_read_unlock(&nodes_srcu, idx);
+	return;
+
+send_fin:
+	set_bit(DLM_NODE_FLAG_STOP_RX, &node->flags);
+	dlm_send_fin(node, dlm_pas_fin_ack_rcv);
+	srcu_read_unlock(&nodes_srcu, idx);
+}
+
+static void midcomms_node_release(struct rcu_head *rcu)
+{
+	struct midcomms_node *node = container_of(rcu, struct midcomms_node, rcu);
+
+	WARN_ON(atomic_read(&node->send_queue_cnt));
+	kfree(node);
+}
+
+static void midcomms_shutdown(struct midcomms_node *node)
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
+	spin_lock(&node->state_lock);
+	pr_debug("receive active shutdown for node %d with state %s\n",
+		 node->nodeid, dlm_state_str(node->state));
+	switch (node->state) {
+	case DLM_ESTABLISHED:
+		node->state = DLM_FIN_WAIT1;
+		pr_debug("switch node %d to state %s case 2\n",
+			 node->nodeid, dlm_state_str(node->state));
+		break;
+	case DLM_CLOSED:
+		/* we have what we want */
+		spin_unlock(&node->state_lock);
+		return;
+	default:
+		/* busy to enter DLM_FIN_WAIT1, wait until passive
+		 * done in shutdown_wait to enter DLM_CLOSED.
+		 */
+		break;
+	}
+	spin_unlock(&node->state_lock);
+
+	if (node->state == DLM_FIN_WAIT1) {
+		dlm_send_fin(node, dlm_act_fin_ack_rcv);
+
+		if (DLM_DEBUG_FENCE_TERMINATION)
+			msleep(5000);
+	}
+
+	/* wait for other side dlm + fin */
+	ret = wait_event_timeout(node->shutdown_wait,
+				 node->state == DLM_CLOSED ||
+				 test_bit(DLM_NODE_FLAG_CLOSE, &node->flags),
+				 DLM_SHUTDOWN_TIMEOUT);
+	if (!ret || test_bit(DLM_NODE_FLAG_CLOSE, &node->flags)) {
+		pr_debug("active shutdown timed out for node %d with state %s\n",
+			 node->nodeid, dlm_state_str(node->state));
+		midcomms_node_reset(node);
+		return;
+	}
+
+	pr_debug("active shutdown done for node %d with state %s\n",
+		 node->nodeid, dlm_state_str(node->state));
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
+			midcomms_shutdown(node);
+
+			spin_lock(&nodes_lock);
+			hlist_del_rcu(&node->hlist);
+			spin_unlock(&nodes_lock);
+
+			call_srcu(&nodes_srcu, &node->rcu, midcomms_node_release);
+		}
+	}
+	srcu_read_unlock(&nodes_srcu, idx);
+	mutex_unlock(&close_lock);
+
+	dlm_lowcomms_shutdown();
+}
+
+int dlm_midcomms_close(int nodeid)
+{
+	struct midcomms_node *node;
+	int idx, ret;
+
+	if (nodeid == dlm_our_nodeid())
+		return 0;
+
+	idx = srcu_read_lock(&nodes_srcu);
+	/* Abort pending close/remove operation */
+	node = nodeid2node(nodeid, 0);
+	if (node) {
+		/* let shutdown waiters leave */
+		set_bit(DLM_NODE_FLAG_CLOSE, &node->flags);
+		wake_up(&node->shutdown_wait);
+	}
+	srcu_read_unlock(&nodes_srcu, idx);
+
+	synchronize_srcu(&nodes_srcu);
+
+	idx = srcu_read_lock(&nodes_srcu);
+	mutex_lock(&close_lock);
+	node = nodeid2node(nodeid, 0);
+	if (!node) {
+		mutex_unlock(&close_lock);
+		srcu_read_unlock(&nodes_srcu, idx);
+		return dlm_lowcomms_close(nodeid);
+	}
+
+	ret = dlm_lowcomms_close(nodeid);
+	spin_lock(&node->state_lock);
+	midcomms_node_reset(node);
+	spin_unlock(&node->state_lock);
+	srcu_read_unlock(&nodes_srcu, idx);
+	mutex_unlock(&close_lock);
+
+	return ret;
+}
diff --git a/fs/dlm/midcomms.h b/fs/dlm/midcomms.h
index 9ac1190ce277..1178b836315b 100644
--- a/fs/dlm/midcomms.h
+++ b/fs/dlm/midcomms.h
@@ -21,6 +21,7 @@ int dlm_midcomms_start(void);
 void dlm_midcomms_shutdown(void);
 void dlm_midcomms_add_member(int nodeid);
 void dlm_midcomms_remove_member(int nodeid);
+void dlm_midcomms_unack_msg_resend(int nodeid);
 
 #endif				/* __MIDCOMMS_DOT_H__ */
 
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 7c1a06bcd418..085f21966c72 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -202,7 +202,7 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 	set_rcom_status(ls, (struct rcom_status *)rc->rc_buf, status_flags);
 
 	allow_sync_reply(ls, &rc->rc_id);
-	memset(ls->ls_recover_buf, 0, LOWCOMMS_MAX_TX_BUFFER_LEN);
+	memset(ls->ls_recover_buf, 0, DEFAULT_BUFFER_SIZE);
 
 	send_rcom_stateless(ls, msg, rc);
 
@@ -325,7 +325,7 @@ int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name, int last_len)
 	memcpy(rc->rc_buf, last_name, last_len);
 
 	allow_sync_reply(ls, &rc->rc_id);
-	memset(ls->ls_recover_buf, 0, LOWCOMMS_MAX_TX_BUFFER_LEN);
+	memset(ls->ls_recover_buf, 0, DEFAULT_BUFFER_SIZE);
 
 	send_rcom_stateless(ls, msg, rc);
 
-- 
2.26.3

