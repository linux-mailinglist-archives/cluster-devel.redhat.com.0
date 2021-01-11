Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 41CB92F1D67
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Jan 2021 19:04:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610388240;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dP5kGygtvYZE9kJ40iREjCQ8l5a8dm/D/1MPe+D8G8Y=;
	b=Tr629cYehlI/ZXI+5eCJWL3poB6u0pyMz2gV6UG8qhRnLwf2TtKUWjwWveKO0ue2WEQqxo
	J8iLpicTxB8I7eSEYRl7Sw1DHZUQDVXlACNIqt8MEfrqUz3FCByNOl7VFggU3FFlghxuk1
	X3S2/uNSxnPlT9UqoQqbNRErI3GtUis=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-Jkrc5QYAPsivXK9AwAWzmw-1; Mon, 11 Jan 2021 13:03:56 -0500
X-MC-Unique: Jkrc5QYAPsivXK9AwAWzmw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 818B5CC623;
	Mon, 11 Jan 2021 18:03:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F2396F139;
	Mon, 11 Jan 2021 18:03:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59EC75002C;
	Mon, 11 Jan 2021 18:03:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10BI3mGj032417 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Jan 2021 13:03:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B66295D9FC; Mon, 11 Jan 2021 18:03:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-187.rdu2.redhat.com [10.10.116.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EBF5A5D9DB;
	Mon, 11 Jan 2021 18:03:47 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 11 Jan 2021 13:03:07 -0500
Message-Id: <20210111180310.122451-18-aahringo@redhat.com>
In-Reply-To: <20210111180310.122451-1-aahringo@redhat.com>
References: <20210111180310.122451-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv4 dlm/next 17/20] fs: dlm: add reliable
	connection if reconnect
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
acknowledge messages are dropped.

To explain the basic functionality take a look into the
dlm_midcomms_receive_buffer() function. This function will take care
that dlm messages are delivered according to their sequence numbers and
request re-transmission via sending acknowledge messages. However there
exists three cases:

1. sequence number is the one which is expected. That means everything
   is working fine. Additional there is always a check if the next
   message was already queued for future, this will occur when there was
   some messages drops before.

2. A sequence number is in the future, in this case we queue it for might
   future delivery, see case 1.

3. A sequence number is in the past, in this case we drop this message
   because it was already delivered.

To send acknowledge we always send the sequence number which is
expected, if the other node sends multiple acknowledge for the same
sequence numbers it will trigger a re-transmission. In case no acknowledge
is send back, a timer with a timeout handling is running and will trigger
a re-tranmission as well. Sending multiple ack's with the same sequence or
messages with the same sequence should not have any effects that breaks
dlm. Only messages in the far future can break dlm, that's why important
that the closing connection is right synchronized with DLM_FIN which
also resets the sequence numbers.

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
 fs/dlm/lowcomms.h     |    7 +-
 fs/dlm/midcomms.c     | 1232 +++++++++++++++++++++++++++++++++++++++--
 3 files changed, 1216 insertions(+), 53 deletions(-)

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
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index c4c789a68cf6..53b993f58508 100644
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
index 71a1f0c910b3..d6487f0142e6 100644
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
@@ -12,68 +12,845 @@
 /*
  * midcomms.c
  *
- * This is the appallingly named "mid-level" comms layer.
+ * This is the appallingly named "mid-level" comms layer. It takes care
+ * about deliver an on application layer "reliable" communication above
+ * the used lowcomms transport layer.
  *
- * Its purpose is to take packets from the "real" comms layer,
- * split them up into packets and pass them to the interested
- * part of the locking mechanism.
+ * How it works:
+ *
+ * The basic implementation about the implemented re-transmission algorithm
+ * is based on:
+ *
+ * https://web.archive.org/web/20200813052233/https://www.isi.edu/nsnam/DIRECTED_RESEARCH/DR_WANIDA/DR/JavisInActionFastRetransmitFrame.html
+ *
+ * There are two cases when a re-transmission occurs, both are described in
+ * the link above:
+ *
+ * - Multiple acks for the same sequence number are received, known as
+ *   "fast re-transmit".
+ * - Ack timeout, if we don't receive an ack in a time of "DLM_RTO". Note
+ *   that the this timeout will only be checked in the re-transmission
+ *   time which runs ever "DLM_RTO_TIMER".
+ *
+ * Each node has a send_queue and recv_queue. The send_queue contains a
+ * reference to each msg handle of lowcomms and keeps the message alive
+ * so far it has not been acked. This is necessary to keep the message
+ * for a possible re-transmission.
+ *
+ * The recv_queue is used to keep messages saved which are having a
+ * sequence number in the future of the expected sequence number. If
+ * the expected sequence number and we have the next sequence number
+ * inside this queue it will be delivered to the upper layer. This
+ * queue should have entries only if there was a drop.
+ *
+ * How version detection works:
+ *
+ * Due the fact that dlm has pre-configured node addresses on every side
+ * it is it's nature that every side connects at starts to transmit
+ * dlm messages. However DLM_RCOM_NAMES, DLM_RCOM_STATUS and their replies
+ * are the first messages which are exchanges. Due backwards compatibility
+ * these messages are not covered by the midcomms re-transmission layer.
+ * However these messages have their own re-transmission handling on inside
+ * the dlm application layer as well. The version field of every node will
+ * be set on RCOM messages as soon as they arrived and the node isn't inside
+ * the nodes hash. There exists also logic to detect version mismatched if
+ * something weird going on or the first messages isn't a RCOM one.
+ *
+ * How ack handling basically works:
+ *
+ * We ack every message with the "expected sequence number". A connection
+ * starts with the sequence number of 0. Receiving an ack will ack all
+ * dlm messages below it's sequence number. It's possible that an ack
+ * message can ack multiple dlm messages as the other side will send an
+ * sequence number back of it's expected sequence number. If there are
+ * multiple ack's received with the same sequence number it means that
+ * there was a drop and the other side telling us which message was
+ * dropped. The parameter "DLM_RETRANS_ACK_COUNT" can be used to change
+ * the amount of how many ack we need to received. It's 3 but 2
+ * should be fine as well as it's ery unlikely that we have out of order
+ * issues as RFC 2001 says to use 3. I can only think about multiple
+ * re-connection in a row where with drops which we might get ordering
+ * issues.
+ *
+ * In cases where everything nobody transmits any messages anymore but
+ * there was drops the re-transmission timer will kick in to resend
+ * messages which have an ack timeout.
+ *
+ * Sequence number cases:
+ *
+ * As a message arrived in function "dlm_midcomms_receive_buffer()" will
+ * detect if a message is:
+ *
+ * - as expected => everything is fine
+ * - in the future => there was a drop, queue msg in recv_queue queue
+ * - in the past => ignore that message, because already delivered
+ *
+ * However we will always send an ack message to the other node to signal
+ * which is the current expected sequence number. This either acks
+ * messages or re-transmit on the other side, see ack handling.
+ *
+ * Termination:
+ *
+ * As this layer was implemented there exists a problem with drops during
+ * connection termination. At midcomms_stop() call which occurs at the
+ * last dlm lockspace release the other side was still sending dlm
+ * messages after the connection was terminated. With the re-transmission
+ * layer this ends in a endless re-transmission behaviour. However that
+ * is an issue with the dlm protocol and was solved by introducing the
+ * DLM_FIN message command to synchronize the termination and make sure
+ * both nodes has nothing to send anymore. The parameter
+ * "DLM_QUEUE_TIMEOUT" defines the timeout to wait for pending dlm
+ * messages if Termination occurs. The parameter "DLM_FIN_TIMEOUT" will
+ * wait that the other side has no pending dlm messages anymore.
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
  *
- * It also takes messages from the locking layer, formats them
- * into packets and sends them to the comms layer.
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
 #include "dlm_internal.h"
 #include "lowcomms.h"
 #include "config.h"
 #include "lock.h"
+#include "util.h"
 #include "midcomms.h"
 
-void *dlm_midcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
+/* init value for sequence numbers for testing purpose only e.g. overflows */
+#define DLM_SEQ_INIT		0
+/* if we get duplicates amount of acks we will start retransmit */
+#define DLM_RETRANS_ACK_COUNT	3
+/* timer timeout to start retransmit if we don't get an ack back */
+#define DLM_RTO			msecs_to_jiffies(30 * 1000)
+#define DLM_RTO_TIMER		msecs_to_jiffies(60 * 1000)
+/* 10 minutes wait to sync ending of dlm */
+#define DLM_QUEUE_TIMEOUT	msecs_to_jiffies(10 * 60 * 1000)
+/* 3 minutes wait to wait for a fin message */
+#define DLM_FIN_TIMEOUT		msecs_to_jiffies(3 * 60 * 1000)
+#define DLM_VERSION_NOT_SET	0
+
+struct midcomms_node {
+	int nodeid;
+	uint32_t version;
+	uint32_t seq_send;
+	uint32_t seq_next;
+	uint32_t seq_last;
+	/* note: this list may not sorted according to their seq */
+	struct list_head send_queue;
+	struct list_head recv_queue;
+	spinlock_t send_queue_lock;
+	atomic_t send_queue_cnt;
+	atomic_t recv_queue_cnt;
+#define DLM_NODE_FLAG_FIN	1
+#define DLM_NODE_FLAG_CLOSE	2
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
+	unsigned long timeout;
+	int ack_count;
+	uint32_t seq;
+	void *mh;
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
+static struct timer_list dlm_retransmit_timer;
+
+static struct hlist_head node_hash[CONN_HASH_SIZE];
+static DEFINE_SPINLOCK(nodes_lock);
+static DEFINE_MUTEX(close_lock);
+DEFINE_STATIC_SRCU(nodes_srcu);
+
+static struct midcomms_node *__find_node(int nodeid, int r)
 {
-	return dlm_lowcomms_new_buffer(nodeid, len, allocation, ppc, NULL,
-				       NULL);
+	struct midcomms_node *node;
+	int idx;
+
+	idx = srcu_read_lock(&nodes_srcu);
+	hlist_for_each_entry_rcu(node, &node_hash[r], hlist) {
+		if (node->nodeid == nodeid) {
+			srcu_read_unlock(&nodes_srcu, idx);
+			return node;
+		}
+	}
+	srcu_read_unlock(&nodes_srcu, idx);
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
+	node->seq_last = DLM_SEQ_INIT;
+	spin_lock_init(&node->send_queue_lock);
+	atomic_set(&node->send_queue_cnt, 0);
+	INIT_LIST_HEAD(&node->send_queue);
+	atomic_set(&node->recv_queue_cnt, 0);
+	INIT_LIST_HEAD(&node->recv_queue);
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
+static int dlm_send_fin(int nodeid)
 {
-	dlm_lowcomms_commit_buffer(mh);
-	dlm_lowcomms_put_buffer(mh);
+	int mb_len = sizeof(struct dlm_header);
+	struct dlm_header *m_header;
+	char *ppc;
+	void *mh;
+
+	mh = dlm_midcomms_get_buffer(nodeid, mb_len, GFP_NOFS, &ppc);
+	if (!mh)
+		return -ENOMEM;
+
+	m_header = (struct dlm_header *)ppc;
+
+	m_header->h_version = (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
+	m_header->h_nodeid = dlm_our_nodeid();
+	m_header->h_length = mb_len;
+	m_header->h_cmd = DLM_FIN;
+
+	header_out(m_header);
+	dlm_midcomms_commit_buffer(mh);
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
+static void dlm_recv_queue_flush(struct midcomms_node *node)
 {
-	return dlm_lowcomms_start();
+	struct dlm_recv_msg *msg, *tmp;
+
+	list_for_each_entry_safe(msg, tmp, &node->recv_queue, list) {
+		list_del(&msg->list);
+		if (atomic_dec_and_test(&node->recv_queue_cnt))
+			wake_up(&node->fin_wait);
+
+		kfree(msg->p);
+		kfree(msg);
+	}
 }
 
-void dlm_midcomms_stop(void)
+static void dlm_midcomms_seq_receive_buffer(struct midcomms_node *node,
+					    union dlm_packet *p)
 {
-	dlm_lowcomms_stop();
+	dlm_receive_buffer(p, node->nodeid);
+	node->seq_next++;
+}
+
+static void dlm_overflow_upper_ack(struct midcomms_node *node)
+{
+	struct dlm_send_msg *msg;
+
+	/* stop all seq transmissions for this node to ack all upper */
+	spin_lock(&node->send_queue_lock);
+	list_for_each_entry_rcu(msg, &node->send_queue, list) {
+		if (msg->seq > node->seq_send) {
+			log_print("seq overflow handling, will ack message %u from node %d",
+				  msg->seq, node->nodeid);
+			dlm_send_msg_del(node, msg);
+		}
+	}
+	spin_unlock(&node->send_queue_lock);
+}
+
+static void dlm_receive_ack(struct midcomms_node *node, uint32_t seq)
+{
+	struct dlm_send_msg *msg;
+
+	rcu_read_lock();
+	if (seq < node->seq_last) {
+		log_print("dlm seq overflow detected from node %d",
+			  node->nodeid);
+		dlm_overflow_upper_ack(node);
+	}
+
+	list_for_each_entry_rcu(msg, &node->send_queue, list) {
+		if (msg->seq < seq) {
+			spin_lock(&node->send_queue_lock);
+			dlm_send_msg_del(node, msg);
+			spin_unlock(&node->send_queue_lock);
+		} else if (msg->seq == seq) {
+			msg->ack_count++;
+			if (msg->ack_count >= DLM_RETRANS_ACK_COUNT) {
+				log_print("retransmit because multiple acks received. message seq %u, nodeid: %d",
+					  seq, node->nodeid);
+				dlm_lowcomms_resend_buffer(msg->mh);
+			}
+		}
+	}
+	rcu_read_unlock();
+
+	/* for overflow detection */
+	node->seq_last = seq;
+}
+
+static struct dlm_recv_msg *dlm_recv_create_msg(const union dlm_packet *p,
+						uint32_t seq)
+{
+	int mb_len = le16_to_cpu(p->header.h_length);
+	struct dlm_recv_msg *msg;
+
+	msg = kzalloc(sizeof(*msg), GFP_NOFS);
+	if (!msg)
+		return NULL;
+
+	msg->p = kzalloc(mb_len, GFP_NOFS);
+	if (!msg)
+		return NULL;
+
+	memcpy(msg->p, p, mb_len);
+	msg->seq = seq;
+
+	return msg;
+}
+
+static struct dlm_recv_msg *dlm_recv_get_msg_by_seq(struct midcomms_node *node,
+						    uint32_t seq)
+{
+	struct dlm_recv_msg *msg;
+
+	list_for_each_entry(msg, &node->recv_queue, list) {
+		if (msg->seq == seq)
+			return msg;
+	}
+
+	return NULL;
+}
+
+static int dlm_recv_queue_future_msg(struct midcomms_node *node,
+				     const union dlm_packet *p,
+				     uint32_t seq)
+{
+	struct dlm_recv_msg *msg;
+
+	/* check if we already got the message */
+	msg = dlm_recv_get_msg_by_seq(node, seq);
+	if (msg)
+		return 0;
+
+	log_print("received message for the future, will queue it. expected seq: %u, message seq: %u, nodeid: %d",
+		  node->seq_next, seq, node->nodeid);
+
+	msg = dlm_recv_create_msg(p, seq);
+	if (!msg)
+		return -ENOMEM;
+
+	atomic_inc(&node->recv_queue_cnt);
+	list_add_tail(&msg->list, &node->recv_queue);
+
+	return 0;
+}
+
+static void dlm_recv_queue_lookup_and_deliver_next(struct midcomms_node *node)
+{
+	struct dlm_recv_msg *msg;
+
+	msg = dlm_recv_get_msg_by_seq(node, node->seq_next);
+	while (msg) {
+		list_del(&msg->list);
+
+		log_print("deliver message from the queue because it was received in the past. message seq: %u, nodeid: %d",
+			  node->seq_next, node->nodeid);
+		dlm_midcomms_seq_receive_buffer(node, msg->p);
+
+		if (atomic_dec_and_test(&node->recv_queue_cnt))
+			wake_up(&node->fin_wait);
+
+		kfree(msg->p);
+		kfree(msg);
+
+		msg = dlm_recv_get_msg_by_seq(node, node->seq_next);
+	}
+}
+
+static void dlm_midcomms_receive_buffer(union dlm_packet *p,
+					struct midcomms_node *node,
+					uint32_t seq)
+{
+	if (seq == node->seq_next) {
+		/* case when we received the expected next message */
+		dlm_midcomms_seq_receive_buffer(node, p);
+
+		/* lookup if we have the next message in the queue beceause
+		 * we might got some message for the future in the past as
+		 * we dropped some message which arrived now.
+		 */
+		dlm_recv_queue_lookup_and_deliver_next(node);
+	} else if (seq > node->seq_next) {
+		/* We got some message in the future, we will queue it so
+		 * we can deliver the message when the next message arrived.
+		 */
+		dlm_recv_queue_future_msg(node, p, seq);
+	} else {
+		log_print("ignore message because it was already delivered. message seq: %u, expected: %u, nodeid: %d",
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
+		switch (p->header.h_cmd) {
+		case DLM_OPTS:
+			if (msglen < sizeof(struct dlm_opts)) {
+				log_print("opts msg too small: %u, will skip this message from node %d",
+					  msglen, nodeid);
+				return NULL;
+			}
+
+			/* we only alloc a new node at receiving for the above
+			 * RCOM messages. It can be that the other side is
+			 * already gone and we cannot ack FIN messages anymore,
+			 * we ignore it until the other side runs into an
+			 * timeout. FIN messages are application stateless and
+			 * it's not imortant to be acked since it is the last
+			 * message before disconnect.
+			 *
+			 * we don't print a warning in this case.
+			 */
+			switch (p->opts.o_nextcmd) {
+			case DLM_FIN:
+				return NULL;
+			default:
+				break;
+			}
+
+			break;
+		default:
+			break;
+		}
+
+		log_print("received dlm message cmd %d from node %d in an invalid sequence",
+			  p->header.h_cmd, nodeid);
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
+	/* we only trust outer header msglen because
+	 * it's checked against receive buffer length.
+	 */
+	if (msglen < sizeof(struct dlm_opts))
+		return -1;
+	msglen -= sizeof(struct dlm_opts);
+
+	if (msglen < le16_to_cpu(p->opts.o_optlen))
+		return -1;
+	msglen -= le16_to_cpu(p->opts.o_optlen);
+
+	switch (p->opts.o_nextcmd) {
+	case DLM_FIN:
+		if (msglen < sizeof(struct dlm_header)) {
+			log_print("fin too small: %u, will skip this message from node %d",
+				  msglen, nodeid);
+			return -1;
+		}
+
+		break;
+	case DLM_MSG:
+		if (msglen < sizeof(struct dlm_message)) {
+			log_print("msg too small: %u, will skip this message from node %d",
+				  msglen, nodeid);
+			return -1;
+		}
+
+		break;
+	case DLM_RCOM:
+		if (msglen < sizeof(struct dlm_rcom)) {
+			log_print("rcom msg too small: %u, will skip this message from node %d",
+				  msglen, nodeid);
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
+	int ret;
+
+	node = dlm_midcomms_recv_node_lookup(nodeid, p, msglen,
+					     dlm_midcomms_version_check_3_2);
+	if (!node)
+		return;
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
+			return;
+		}
+
+		dlm_receive_buffer(p, nodeid);
+		return;
+	case DLM_OPTS:
+		seq = le32_to_cpu(p->header.u.h_seq);
+
+		ret = dlm_opts_check_msglen(p, msglen, nodeid);
+		if (ret < 0) {
+			log_print("opts msg too small: %u, will skip this message from node %d",
+				  msglen, nodeid);
+			return;
+		}
+#if 0
+		ret = dlm_parse_opts(p->opts.o_opts, p->opts.o_optlen);
+		if (ret < 0)
+			return;
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
+				return;
+			}
+
+			break;
+		case DLM_MSG:
+			if (msglen < sizeof(struct dlm_message)) {
+				log_print("inner msg too small: %u, will skip this message from node %d",
+					  msglen, nodeid);
+				return;
+			}
+
+			break;
+		case DLM_FIN:
+			if (msglen < sizeof(struct dlm_header)) {
+				log_print("inner fin too small: %u, will skip this message from node %d",
+					  msglen, nodeid);
+				return;
+			}
+
+			if (seq != node->seq_next) {
+				dlm_send_ack(nodeid, node->seq_next);
+				return;
+			}
+
+			dlm_send_ack(nodeid, seq + 1);
+			set_bit(DLM_NODE_FLAG_FIN, &node->flags);
+			wake_up(&node->fin_wait);
+			return;
+		default:
+			log_print("unsupported inner h_cmd received: %u, will skip this message from node %d",
+				  msglen, nodeid);
+			return;
+		}
+
+		dlm_midcomms_receive_buffer(p, node, seq);
+		return;
+	case DLM_ACK:
+		seq = le32_to_cpu(p->header.u.h_seq);
+		dlm_receive_ack(node, seq);
+		return;
+	default:
+		log_print("unsupported h_cmd received: %u, will skip this message from node %d",
+			  p->header.h_cmd, nodeid);
+		return;
+	}
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
+
+	node = dlm_midcomms_recv_node_lookup(nodeid, p, msglen,
+					     dlm_midcomms_version_check_3_1);
+	if (!node)
+		return;
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
@@ -89,7 +866,7 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 	int ret = 0;
 
 	while (len >= sizeof(struct dlm_header)) {
-		hd = (struct dlm_header *)ptr;
+		hd = (const struct dlm_header *)ptr;
 
 		/* no message should be more than DEFAULT_BUFFER_SIZE or
 		 * less than dlm_header size.
@@ -116,32 +893,19 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
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
 
-		dlm_receive_buffer((union dlm_packet *)buf, nodeid);
-
-skip:
 		ret += msglen;
 		len -= msglen;
 		ptr += msglen;
@@ -149,3 +913,371 @@ int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int len)
 
 	return ret;
 }
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
+
+	node = nodeid2node(nodeid, 0);
+	if (!node) {
+		WARN_ON_ONCE(1);
+		return NULL;
+	}
+
+	msg = kzalloc(sizeof(*msg), GFP_NOFS);
+	if (!msg)
+		return NULL;
+
+	msg->node = node;
+
+	switch (node->version) {
+	case DLM_VERSION_3_1:
+		mh = dlm_midcomms_stateless_get_buffer(nodeid, len, allocation,
+						       ppc);
+		if (!mh) {
+			kfree(msg);
+			return NULL;
+		}
+
+		break;
+	case DLM_VERSION_3_2:
+		mh = dlm_midcomms_get_buffer_3_2(msg, nodeid, len, allocation,
+						 ppc);
+		if (!mh) {
+			kfree(msg);
+			return NULL;
+		}
+
+		break;
+	default:
+		kfree(msg);
+		WARN_ON(1);
+		return NULL;
+	}
+
+	msg->mh = mh;
+
+	return msg;
+}
+
+static void dlm_midcomms_commit_buffer_3_2(struct dlm_send_msg *msg,
+					   struct midcomms_node *node)
+{
+	atomic_inc(&node->send_queue_cnt);
+
+	/* nexthdr chain for fast lookup */
+	msg->opts->o_nextcmd = msg->inner_hd->h_cmd;
+
+	/* required to set before list_add because timer */
+	msg->timeout = jiffies + DLM_RTO;
+
+	spin_lock(&node->send_queue_lock);
+	list_add_tail_rcu(&msg->list, &node->send_queue);
+	spin_unlock(&node->send_queue_lock);
+
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
+		dlm_midcomms_commit_buffer_3_1(msg->mh);
+		/* msg is not part of rcu list in this case */
+		kfree(msg);
+		break;
+	case DLM_VERSION_3_2:
+		dlm_midcomms_commit_buffer_3_2(msg, msg->node);
+		break;
+	default:
+		WARN_ON(1);
+		break;
+	}
+}
+
+void midcomms_add_member(int nodeid)
+{
+	struct midcomms_node *node;
+
+	if (nodeid == dlm_our_nodeid())
+		return;
+
+	node = nodeid2node(nodeid, GFP_NOFS);
+	if (!node)
+		return;
+
+	node->users++;
+}
+
+static void midcomms_drain_and_fin(struct midcomms_node *node)
+{
+	int ret;
+
+	/* old protocol, we don't wait for pending operations */
+	if (node->version == DLM_VERSION_3_1)
+		return;
+
+	/* wait until dlm is done */
+	ret = wait_event_timeout(node->fin_wait,
+				 (!atomic_read(&node->send_queue_cnt) &&
+				  !atomic_read(&node->recv_queue_cnt)) ||
+				 test_bit(DLM_NODE_FLAG_CLOSE, &node->flags),
+				 DLM_QUEUE_TIMEOUT);
+	if (!ret)
+		log_print("queues timed out from node %d", node->nodeid);
+
+	if (DLM_DEBUG_FENCE_TERMINATION)
+		msleep(5000);
+
+	/* send to other side we are done with dlm */
+	dlm_send_fin(node->nodeid);
+
+	/* still be able to receive and wait for other end dlm done */
+	ret = wait_event_timeout(node->fin_wait,
+				 (!atomic_read(&node->send_queue_cnt) &&
+				  !atomic_read(&node->recv_queue_cnt) &&
+				  test_bit(DLM_NODE_FLAG_FIN, &node->flags)) ||
+				 test_bit(DLM_NODE_FLAG_CLOSE, &node->flags),
+				 DLM_FIN_TIMEOUT);
+
+	/* if other side not response anymore flush everything
+	 * this has something to do with the FIN message and
+	 * we might didn't received an ACK because drops.
+	 */
+	if (!ret || test_bit(DLM_NODE_FLAG_CLOSE, &node->flags)) {
+		log_print("fin timed out from node %d", node->nodeid);
+		dlm_send_queue_flush(node);
+		synchronize_rcu();
+
+		dlm_recv_queue_flush(node);
+	}
+}
+
+static void midcomms_node_release(struct rcu_head *rcu)
+{
+	struct midcomms_node *node = container_of(rcu, struct midcomms_node, rcu);
+
+	kfree(node);
+}
+
+void midcomms_remove_member(int nodeid)
+{
+	struct midcomms_node *node;
+
+	if (nodeid == dlm_our_nodeid())
+		return;
+
+	mutex_lock(&close_lock);
+	node = nodeid2node(nodeid, 0);
+	if (!node) {
+		mutex_unlock(&close_lock);
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
+		midcomms_drain_and_fin(node);
+
+		spin_lock(&nodes_lock);
+		hlist_del_rcu(&node->hlist);
+		spin_unlock(&nodes_lock);
+
+		call_srcu(&nodes_srcu, &node->rcu, midcomms_node_release);
+	}
+	mutex_unlock(&close_lock);
+}
+
+static void dlm_retransmit_timer_expires(struct timer_list *timer)
+{
+
+	unsigned long now = jiffies;
+	struct midcomms_node *node;
+	struct dlm_send_msg *msg;
+	int idx, i;
+
+	rcu_read_lock();
+	idx = srcu_read_lock(&nodes_srcu);
+	for (i = 0; i < CONN_HASH_SIZE; i++) {
+		hlist_for_each_entry_rcu(node, &node_hash[i], hlist) {
+			list_for_each_entry_rcu(msg, &node->send_queue, list) {
+				if (time_before_eq(msg->timeout, now)) {
+					log_print("retransmit because ack timeout. message seq %u, nodeid %d",
+						  msg->seq, node->nodeid);
+
+					dlm_lowcomms_resend_buffer(msg->mh);
+				}
+			}
+		}
+	}
+	srcu_read_unlock(&nodes_srcu, idx);
+	rcu_read_unlock();
+
+	mod_timer(timer, jiffies + DLM_RTO_TIMER);
+}
+
+int dlm_midcomms_start(void)
+{
+	int i, ret;
+
+	for (i = 0; i < CONN_HASH_SIZE; i++)
+		INIT_HLIST_HEAD(&node_hash[i]);
+
+	ret = dlm_lowcomms_start();
+	if (ret == 0) {
+		timer_setup(&dlm_retransmit_timer,
+			    dlm_retransmit_timer_expires, TIMER_DEFERRABLE);
+		mod_timer(&dlm_retransmit_timer,
+			  jiffies + DLM_RTO_TIMER);
+	}
+
+	return ret;
+}
+
+void dlm_midcomms_stop(void)
+{
+	struct midcomms_node *node;
+	int i, idx;
+
+	mutex_lock(&close_lock);
+	idx = srcu_read_lock(&nodes_srcu);
+	for (i = 0; i < CONN_HASH_SIZE; i++) {
+		hlist_for_each_entry_rcu(node, &node_hash[i], hlist) {
+			midcomms_drain_and_fin(node);
+		}
+	}
+
+	del_timer_sync(&dlm_retransmit_timer);
+	dlm_lowcomms_stop();
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
+	/* keep nodes_srcu read lock to prevent node is released, because
+	 * close can occur any time and we can't hold the close_lock.
+	 */
+	idx = srcu_read_lock(&nodes_srcu);
+	/* Abort pending close/remove operation */
+	node = nodeid2node(nodeid, 0);
+	if (node) {
+		set_bit(DLM_NODE_FLAG_CLOSE, &node->flags);
+		wake_up(&node->fin_wait);
+	}
+	srcu_read_unlock(&nodes_srcu, idx);
+
+	mutex_lock(&close_lock);
+	node = nodeid2node(nodeid, 0);
+	if (!node) {
+		mutex_unlock(&close_lock);
+		return dlm_lowcomms_close(nodeid);
+	}
+
+	dlm_lowcomms_rx_flush(nodeid);
+
+	spin_lock(&nodes_lock);
+	hlist_del_rcu(&node->hlist);
+	spin_unlock(&nodes_lock);
+
+	/* wait until there are all readers left */
+	synchronize_srcu(&nodes_srcu);
+
+	ret = dlm_lowcomms_close(nodeid);
+
+	/* cut current queues for 3.2 */
+	if (node->version == DLM_VERSION_3_2) {
+		dlm_send_queue_flush(node);
+		synchronize_rcu();
+
+		dlm_recv_queue_flush(node);
+	}
+
+	mutex_unlock(&close_lock);
+
+	call_srcu(&nodes_srcu, &node->rcu, midcomms_node_release);
+
+	return ret;
+}
-- 
2.26.2

