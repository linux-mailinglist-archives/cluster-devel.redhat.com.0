Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBEA610320
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Oct 2022 22:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666903571;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fVDw4MRlMSnsg4qX6qKoeYivajkw7+0Pe9jsl7Ea0Yk=;
	b=UHy7zTdRaKhiRNDcjpZFLJlKClWyQ2DW3m22xIQirdqmUydkBzR/vQc5kj+1EVoOaWOLS7
	l1HQWWInUhAwf9GiRbbOtjnBjvQ9Dbxw8jwXZnazhe0T0eR13h4HelbeWhfsq9cxohA9+T
	vSL+KSqh6SusD++7LzU7qefgyE+rr4k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-Lkzq-aGgNZ-BYqnq4qwKJg-1; Thu, 27 Oct 2022 16:46:07 -0400
X-MC-Unique: Lkzq-aGgNZ-BYqnq4qwKJg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72AF82A2AD49;
	Thu, 27 Oct 2022 20:45:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4255E42238;
	Thu, 27 Oct 2022 20:45:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D03E619466DF;
	Thu, 27 Oct 2022 20:45:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 11E361946A40 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 20:45:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 40F26112C074; Thu, 27 Oct 2022 20:45:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 167511121325;
 Thu, 27 Oct 2022 20:45:36 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Oct 2022 16:45:15 -0400
Message-Id: <20221027204528.1119036-5-aahringo@redhat.com>
In-Reply-To: <20221027204528.1119036-1-aahringo@redhat.com>
References: <20221027204528.1119036-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v6.1-rc1 05/18] fd: dlm: trace send/recv of
 dlm message and rcom
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds tracepoints for send and recv cases of dlm messages and
dlm rcom messages. In case of send and dlm message we add the dlm rsb
resource name this dlm messages belongs to. This has the advantage to
follow dlm messages on a per lock basis. In case of recv message the
resource name can be extracted by follow the send message sequence
number.

The dlm message DLM_MSG_PURGE doesn't belong to a lock request and will
not set the resource name in a dlm_message trace. The same for all rcom
messages.

There is additional handling required for this debugging functionality
which is tried to be small as possible. Also the midcomms layer gets
aware of lock resource names, for now this is required to make a
connection between sequence number and lock resource names. It is for
debugging purpose only.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c              |  21 +--
 fs/dlm/midcomms.c          |  45 +++++-
 fs/dlm/midcomms.h          |   3 +-
 fs/dlm/rcom.c              |   4 +-
 include/trace/events/dlm.h | 297 +++++++++++++++++++++++++++++++++++++
 5 files changed, 353 insertions(+), 17 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index b246d71b5e17..0b1bc24536ce 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -3611,9 +3611,10 @@ static int create_message(struct dlm_rsb *r, struct dlm_lkb *lkb,
 /* further lowcomms enhancements or alternate implementations may make
    the return value from this function useful at some point */
 
-static int send_message(struct dlm_mhandle *mh, struct dlm_message *ms)
+static int send_message(struct dlm_mhandle *mh, struct dlm_message *ms,
+			const void *name, int namelen)
 {
-	dlm_midcomms_commit_mhandle(mh);
+	dlm_midcomms_commit_mhandle(mh, name, namelen);
 	return 0;
 }
 
@@ -3679,7 +3680,7 @@ static int send_common(struct dlm_rsb *r, struct dlm_lkb *lkb, int mstype)
 
 	send_args(r, lkb, ms);
 
-	error = send_message(mh, ms);
+	error = send_message(mh, ms, r->res_name, r->res_length);
 	if (error)
 		goto fail;
 	return 0;
@@ -3742,7 +3743,7 @@ static int send_grant(struct dlm_rsb *r, struct dlm_lkb *lkb)
 
 	ms->m_result = 0;
 
-	error = send_message(mh, ms);
+	error = send_message(mh, ms, r->res_name, r->res_length);
  out:
 	return error;
 }
@@ -3763,7 +3764,7 @@ static int send_bast(struct dlm_rsb *r, struct dlm_lkb *lkb, int mode)
 
 	ms->m_bastmode = cpu_to_le32(mode);
 
-	error = send_message(mh, ms);
+	error = send_message(mh, ms, r->res_name, r->res_length);
  out:
 	return error;
 }
@@ -3786,7 +3787,7 @@ static int send_lookup(struct dlm_rsb *r, struct dlm_lkb *lkb)
 
 	send_args(r, lkb, ms);
 
-	error = send_message(mh, ms);
+	error = send_message(mh, ms, r->res_name, r->res_length);
 	if (error)
 		goto fail;
 	return 0;
@@ -3811,7 +3812,7 @@ static int send_remove(struct dlm_rsb *r)
 	memcpy(ms->m_extra, r->res_name, r->res_length);
 	ms->m_hash = cpu_to_le32(r->res_hash);
 
-	error = send_message(mh, ms);
+	error = send_message(mh, ms, r->res_name, r->res_length);
  out:
 	return error;
 }
@@ -3833,7 +3834,7 @@ static int send_common_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 
 	ms->m_result = cpu_to_le32(to_dlm_errno(rv));
 
-	error = send_message(mh, ms);
+	error = send_message(mh, ms, r->res_name, r->res_length);
  out:
 	return error;
 }
@@ -3874,7 +3875,7 @@ static int send_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms_in,
 	ms->m_result = cpu_to_le32(to_dlm_errno(rv));
 	ms->m_nodeid = cpu_to_le32(ret_nodeid);
 
-	error = send_message(mh, ms);
+	error = send_message(mh, ms, ms_in->m_extra, receive_extralen(ms_in));
  out:
 	return error;
 }
@@ -6300,7 +6301,7 @@ static int send_purge(struct dlm_ls *ls, int nodeid, int pid)
 	ms->m_nodeid = cpu_to_le32(nodeid);
 	ms->m_pid = cpu_to_le32(pid);
 
-	return send_message(mh, ms);
+	return send_message(mh, ms, NULL, 0);
 }
 
 int dlm_user_purge(struct dlm_ls *ls, struct dlm_user_proc *proc,
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 4eed40d66da1..e10a6e97df44 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -132,6 +132,7 @@
  */
 #define DLM_DEBUG_FENCE_TERMINATION	0
 
+#include <trace/events/dlm.h>
 #include <net/tcp.h>
 
 #include "dlm_internal.h"
@@ -415,7 +416,7 @@ static int dlm_send_fin(struct midcomms_node *node,
 	m_header->h_cmd = DLM_FIN;
 
 	pr_debug("sending fin msg to node %d\n", node->nodeid);
-	dlm_midcomms_commit_mhandle(mh);
+	dlm_midcomms_commit_mhandle(mh, NULL, 0);
 	set_bit(DLM_NODE_FLAG_STOP_TX, &node->flags);
 
 	return 0;
@@ -474,6 +475,20 @@ static void dlm_pas_fin_ack_rcv(struct midcomms_node *node)
 	spin_unlock(&node->state_lock);
 }
 
+static void dlm_receive_buffer_3_2_trace(uint32_t seq, union dlm_packet *p)
+{
+	switch (p->header.h_cmd) {
+	case DLM_MSG:
+		trace_dlm_recv_message(seq, &p->message);
+		break;
+	case DLM_RCOM:
+		trace_dlm_recv_rcom(seq, &p->rcom);
+		break;
+	default:
+		break;
+	}
+}
+
 static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 					struct midcomms_node *node,
 					uint32_t seq)
@@ -534,6 +549,7 @@ static void dlm_midcomms_receive_buffer(union dlm_packet *p,
 			break;
 		default:
 			WARN_ON(test_bit(DLM_NODE_FLAG_STOP_RX, &node->flags));
+			dlm_receive_buffer_3_2_trace(seq, p);
 			dlm_receive_buffer(p, node->nodeid);
 			set_bit(DLM_NODE_ULP_DELIVERED, &node->flags);
 			break;
@@ -1130,11 +1146,30 @@ struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 }
 #endif
 
-static void dlm_midcomms_commit_msg_3_2(struct dlm_mhandle *mh)
+static void dlm_midcomms_commit_msg_3_2_trace(const struct dlm_mhandle *mh,
+					      const void *name, int namelen)
+{
+	switch (mh->inner_p->header.h_cmd) {
+	case DLM_MSG:
+		trace_dlm_send_message(mh->seq, &mh->inner_p->message,
+				       name, namelen);
+		break;
+	case DLM_RCOM:
+		trace_dlm_send_rcom(mh->seq, &mh->inner_p->rcom);
+		break;
+	default:
+		/* nothing to trace */
+		break;
+	}
+}
+
+static void dlm_midcomms_commit_msg_3_2(struct dlm_mhandle *mh,
+					const void *name, int namelen)
 {
 	/* nexthdr chain for fast lookup */
 	mh->opts->o_nextcmd = mh->inner_p->header.h_cmd;
 	mh->committed = true;
+	dlm_midcomms_commit_msg_3_2_trace(mh, name, namelen);
 	dlm_lowcomms_commit_msg(mh->msg);
 }
 
@@ -1142,8 +1177,10 @@ static void dlm_midcomms_commit_msg_3_2(struct dlm_mhandle *mh)
  * dlm_midcomms_get_mhandle
  */
 #ifndef __CHECKER__
-void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh)
+void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh,
+				 const void *name, int namelen)
 {
+
 	switch (mh->node->version) {
 	case DLM_VERSION_3_1:
 		srcu_read_unlock(&nodes_srcu, mh->idx);
@@ -1154,7 +1191,7 @@ void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh)
 		dlm_free_mhandle(mh);
 		break;
 	case DLM_VERSION_3_2:
-		dlm_midcomms_commit_msg_3_2(mh);
+		dlm_midcomms_commit_msg_3_2(mh, name, namelen);
 		srcu_read_unlock(&nodes_srcu, mh->idx);
 		break;
 	default:
diff --git a/fs/dlm/midcomms.h b/fs/dlm/midcomms.h
index 82bcd9661922..d6286e80b077 100644
--- a/fs/dlm/midcomms.h
+++ b/fs/dlm/midcomms.h
@@ -17,7 +17,8 @@ struct midcomms_node;
 int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int buflen);
 struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 					     gfp_t allocation, char **ppc);
-void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh);
+void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh, const void *name,
+				 int namelen);
 int dlm_midcomms_close(int nodeid);
 int dlm_midcomms_start(void);
 void dlm_midcomms_shutdown(void);
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index f19860315043..b76d52e2f6bd 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -91,7 +91,7 @@ static int create_rcom_stateless(struct dlm_ls *ls, int to_nodeid, int type,
 
 static void send_rcom(struct dlm_mhandle *mh, struct dlm_rcom *rc)
 {
-	dlm_midcomms_commit_mhandle(mh);
+	dlm_midcomms_commit_mhandle(mh, NULL, 0);
 }
 
 static void send_rcom_stateless(struct dlm_msg *msg, struct dlm_rcom *rc)
@@ -516,7 +516,7 @@ int dlm_send_ls_not_ready(int nodeid, struct dlm_rcom *rc_in)
 	rf = (struct rcom_config *) rc->rc_buf;
 	rf->rf_lvblen = cpu_to_le32(~0U);
 
-	dlm_midcomms_commit_mhandle(mh);
+	dlm_midcomms_commit_mhandle(mh, NULL, 0);
 
 	return 0;
 }
diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
index da0eaae98fa3..4ec47828d55e 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -46,6 +46,56 @@
 	{ DLM_SBF_VALNOTVALID,	"VALNOTVALID" },		\
 	{ DLM_SBF_ALTMODE,	"ALTMODE" })
 
+#define show_lkb_flags(flags) __print_flags(flags, "|",		\
+	{ DLM_IFL_MSTCPY,	"MSTCPY" },			\
+	{ DLM_IFL_RESEND,	"RESEND" },			\
+	{ DLM_IFL_DEAD,		"DEAD" },			\
+	{ DLM_IFL_OVERLAP_UNLOCK, "OVERLAP_UNLOCK" },		\
+	{ DLM_IFL_OVERLAP_CANCEL, "OVERLAP_CANCEL" },		\
+	{ DLM_IFL_ENDOFLIFE,	"ENDOFLIFE" },			\
+	{ DLM_IFL_DEADLOCK_CANCEL, "DEADLOCK_CANCEL" },		\
+	{ DLM_IFL_STUB_MS,	"STUB_MS" },			\
+	{ DLM_IFL_USER,		"USER" },			\
+	{ DLM_IFL_ORPHAN,	"ORPHAN" })
+
+#define show_header_cmd(cmd) __print_symbolic(cmd,		\
+	{ DLM_MSG,		"MSG"},				\
+	{ DLM_RCOM,		"RCOM"},			\
+	{ DLM_OPTS,		"OPTS"},			\
+	{ DLM_ACK,		"ACK"},				\
+	{ DLM_FIN,		"FIN"})
+
+#define show_message_version(version) __print_symbolic(version,	\
+	{ DLM_VERSION_3_1,	"3.1"},				\
+	{ DLM_VERSION_3_2,	"3.2"})
+
+#define show_message_type(type) __print_symbolic(type,		\
+	{ DLM_MSG_REQUEST,	"REQUEST"},			\
+	{ DLM_MSG_CONVERT,	"CONVERT"},			\
+	{ DLM_MSG_UNLOCK,	"UNLOCK"},			\
+	{ DLM_MSG_CANCEL,	"CANCEL"},			\
+	{ DLM_MSG_REQUEST_REPLY, "REQUEST_REPLY"},		\
+	{ DLM_MSG_CONVERT_REPLY, "CONVERT_REPLY"},		\
+	{ DLM_MSG_UNLOCK_REPLY,	"UNLOCK_REPLY"},		\
+	{ DLM_MSG_CANCEL_REPLY,	"CANCEL_REPLY"},		\
+	{ DLM_MSG_GRANT,	"GRANT"},			\
+	{ DLM_MSG_BAST,		"BAST"},			\
+	{ DLM_MSG_LOOKUP,	"LOOKUP"},			\
+	{ DLM_MSG_REMOVE,	"REMOVE"},			\
+	{ DLM_MSG_LOOKUP_REPLY,	"LOOKUP_REPLY"},		\
+	{ DLM_MSG_PURGE,	"PURGE"})
+
+#define show_rcom_type(type) __print_symbolic(type,            \
+	{ DLM_RCOM_STATUS,              "STATUS"},              \
+	{ DLM_RCOM_NAMES,               "NAMES"},               \
+	{ DLM_RCOM_LOOKUP,              "LOOKUP"},              \
+	{ DLM_RCOM_LOCK,                "LOCK"},                \
+	{ DLM_RCOM_STATUS_REPLY,        "STATUS_REPLY"},        \
+	{ DLM_RCOM_NAMES_REPLY,         "NAMES_REPLY"},         \
+	{ DLM_RCOM_LOOKUP_REPLY,        "LOOKUP_REPLY"},        \
+	{ DLM_RCOM_LOCK_REPLY,          "LOCK_REPLY"})
+
+
 /* note: we begin tracing dlm_lock_start() only if ls and lkb are found */
 TRACE_EVENT(dlm_lock_start,
 
@@ -290,6 +340,253 @@ TRACE_EVENT(dlm_unlock_end,
 
 );
 
+DECLARE_EVENT_CLASS(dlm_rcom_template,
+
+	TP_PROTO(uint32_t seq, const struct dlm_rcom *rc),
+
+	TP_ARGS(seq, rc),
+
+	TP_STRUCT__entry(
+		__field(uint32_t, seq)
+		__field(uint32_t, h_version)
+		__field(uint32_t, h_lockspace)
+		__field(uint32_t, h_nodeid)
+		__field(uint16_t, h_length)
+		__field(uint8_t, h_cmd)
+		__field(uint32_t, rc_type)
+		__field(int32_t, rc_result)
+		__field(uint64_t, rc_id)
+		__field(uint64_t, rc_seq)
+		__field(uint64_t, rc_seq_reply)
+		__dynamic_array(unsigned char, rc_buf,
+				le16_to_cpu(rc->rc_header.h_length) - sizeof(*rc))
+	),
+
+	TP_fast_assign(
+		__entry->seq = seq;
+		__entry->h_version = le32_to_cpu(rc->rc_header.h_version);
+		__entry->h_lockspace = le32_to_cpu(rc->rc_header.u.h_lockspace);
+		__entry->h_nodeid = le32_to_cpu(rc->rc_header.h_nodeid);
+		__entry->h_length = le16_to_cpu(rc->rc_header.h_length);
+		__entry->h_cmd = rc->rc_header.h_cmd;
+		__entry->rc_type = le32_to_cpu(rc->rc_type);
+		__entry->rc_result = le32_to_cpu(rc->rc_result);
+		__entry->rc_id = le64_to_cpu(rc->rc_id);
+		__entry->rc_seq = le64_to_cpu(rc->rc_seq);
+		__entry->rc_seq_reply = le64_to_cpu(rc->rc_seq_reply);
+		memcpy(__get_dynamic_array(rc_buf), rc->rc_buf,
+		       __get_dynamic_array_len(rc_buf));
+	),
+
+	TP_printk("seq=%u, h_version=%s h_lockspace=%u h_nodeid=%u "
+		  "h_length=%u h_cmd=%s rc_type=%s rc_result=%d "
+		  "rc_id=%llu rc_seq=%llu rc_seq_reply=%llu "
+		  "rc_buf=0x%s", __entry->seq,
+		  show_message_version(__entry->h_version),
+		  __entry->h_lockspace, __entry->h_nodeid, __entry->h_length,
+		  show_header_cmd(__entry->h_cmd),
+		  show_rcom_type(__entry->rc_type),
+		  __entry->rc_result, __entry->rc_id, __entry->rc_seq,
+		  __entry->rc_seq_reply,
+		  __print_hex_str(__get_dynamic_array(rc_buf),
+				  __get_dynamic_array_len(rc_buf)))
+
+);
+
+DEFINE_EVENT(dlm_rcom_template, dlm_send_rcom,
+	     TP_PROTO(uint32_t seq, const struct dlm_rcom *rc),
+	     TP_ARGS(seq, rc));
+
+DEFINE_EVENT(dlm_rcom_template, dlm_recv_rcom,
+	     TP_PROTO(uint32_t seq, const struct dlm_rcom *rc),
+	     TP_ARGS(seq, rc));
+
+TRACE_EVENT(dlm_send_message,
+
+	TP_PROTO(uint32_t seq, const struct dlm_message *ms,
+		 const void *name, int namelen),
+
+	TP_ARGS(seq, ms, name, namelen),
+
+	TP_STRUCT__entry(
+		__field(uint32_t, seq)
+		__field(uint32_t, h_version)
+		__field(uint32_t, h_lockspace)
+		__field(uint32_t, h_nodeid)
+		__field(uint16_t, h_length)
+		__field(uint8_t, h_cmd)
+		__field(uint32_t, m_type)
+		__field(uint32_t, m_nodeid)
+		__field(uint32_t, m_pid)
+		__field(uint32_t, m_lkid)
+		__field(uint32_t, m_remid)
+		__field(uint32_t, m_parent_lkid)
+		__field(uint32_t, m_parent_remid)
+		__field(uint32_t, m_exflags)
+		__field(uint32_t, m_sbflags)
+		__field(uint32_t, m_flags)
+		__field(uint32_t, m_lvbseq)
+		__field(uint32_t, m_hash)
+		__field(int32_t, m_status)
+		__field(int32_t, m_grmode)
+		__field(int32_t, m_rqmode)
+		__field(int32_t, m_bastmode)
+		__field(int32_t, m_asts)
+		__field(int32_t, m_result)
+		__dynamic_array(unsigned char, m_extra,
+				le16_to_cpu(ms->m_header.h_length) - sizeof(*ms))
+		__dynamic_array(unsigned char, res_name, namelen)
+	),
+
+	TP_fast_assign(
+		__entry->seq = seq;
+		__entry->h_version = le32_to_cpu(ms->m_header.h_version);
+		__entry->h_lockspace = le32_to_cpu(ms->m_header.u.h_lockspace);
+		__entry->h_nodeid = le32_to_cpu(ms->m_header.h_nodeid);
+		__entry->h_length = le16_to_cpu(ms->m_header.h_length);
+		__entry->h_cmd = ms->m_header.h_cmd;
+		__entry->m_type = le32_to_cpu(ms->m_type);
+		__entry->m_nodeid = le32_to_cpu(ms->m_nodeid);
+		__entry->m_pid = le32_to_cpu(ms->m_pid);
+		__entry->m_lkid = le32_to_cpu(ms->m_lkid);
+		__entry->m_remid = le32_to_cpu(ms->m_remid);
+		__entry->m_parent_lkid = le32_to_cpu(ms->m_parent_lkid);
+		__entry->m_parent_remid = le32_to_cpu(ms->m_parent_remid);
+		__entry->m_exflags = le32_to_cpu(ms->m_exflags);
+		__entry->m_sbflags = le32_to_cpu(ms->m_sbflags);
+		__entry->m_flags = le32_to_cpu(ms->m_flags);
+		__entry->m_lvbseq = le32_to_cpu(ms->m_lvbseq);
+		__entry->m_hash = le32_to_cpu(ms->m_hash);
+		__entry->m_status = le32_to_cpu(ms->m_status);
+		__entry->m_grmode = le32_to_cpu(ms->m_grmode);
+		__entry->m_rqmode = le32_to_cpu(ms->m_rqmode);
+		__entry->m_bastmode = le32_to_cpu(ms->m_bastmode);
+		__entry->m_asts = le32_to_cpu(ms->m_asts);
+		__entry->m_result = le32_to_cpu(ms->m_result);
+		memcpy(__get_dynamic_array(m_extra), ms->m_extra,
+		       __get_dynamic_array_len(m_extra));
+		memcpy(__get_dynamic_array(res_name), name,
+		       __get_dynamic_array_len(res_name));
+	),
+
+	TP_printk("seq=%u h_version=%s h_lockspace=%u h_nodeid=%u "
+		  "h_length=%u h_cmd=%s m_type=%s m_nodeid=%u "
+		  "m_pid=%u m_lkid=%u m_remid=%u m_parent_lkid=%u "
+		  "m_parent_remid=%u m_exflags=%s m_sbflags=%s m_flags=%s "
+		  "m_lvbseq=%u m_hash=%u m_status=%d m_grmode=%s "
+		  "m_rqmode=%s m_bastmode=%s m_asts=%d m_result=%d "
+		  "m_extra=0x%s res_name=0x%s",
+		  __entry->seq, show_message_version(__entry->h_version),
+		  __entry->h_lockspace, __entry->h_nodeid, __entry->h_length,
+		  show_header_cmd(__entry->h_cmd),
+		  show_message_type(__entry->m_type),
+		  __entry->m_nodeid, __entry->m_pid, __entry->m_lkid,
+		  __entry->m_remid, __entry->m_parent_lkid,
+		  __entry->m_parent_remid, show_lock_flags(__entry->m_exflags),
+		  show_dlm_sb_flags(__entry->m_sbflags),
+		  show_lkb_flags(__entry->m_flags), __entry->m_lvbseq,
+		  __entry->m_hash, __entry->m_status,
+		  show_lock_mode(__entry->m_grmode),
+		  show_lock_mode(__entry->m_rqmode),
+		  show_lock_mode(__entry->m_bastmode),
+		  __entry->m_asts, __entry->m_result,
+		  __print_hex_str(__get_dynamic_array(m_extra),
+				  __get_dynamic_array_len(m_extra)),
+		  __print_hex_str(__get_dynamic_array(res_name),
+				  __get_dynamic_array_len(res_name)))
+
+);
+
+TRACE_EVENT(dlm_recv_message,
+
+	TP_PROTO(uint32_t seq, const struct dlm_message *ms),
+
+	TP_ARGS(seq, ms),
+
+	TP_STRUCT__entry(
+		__field(uint32_t, seq)
+		__field(uint32_t, h_version)
+		__field(uint32_t, h_lockspace)
+		__field(uint32_t, h_nodeid)
+		__field(uint16_t, h_length)
+		__field(uint8_t, h_cmd)
+		__field(uint32_t, m_type)
+		__field(uint32_t, m_nodeid)
+		__field(uint32_t, m_pid)
+		__field(uint32_t, m_lkid)
+		__field(uint32_t, m_remid)
+		__field(uint32_t, m_parent_lkid)
+		__field(uint32_t, m_parent_remid)
+		__field(uint32_t, m_exflags)
+		__field(uint32_t, m_sbflags)
+		__field(uint32_t, m_flags)
+		__field(uint32_t, m_lvbseq)
+		__field(uint32_t, m_hash)
+		__field(int32_t, m_status)
+		__field(int32_t, m_grmode)
+		__field(int32_t, m_rqmode)
+		__field(int32_t, m_bastmode)
+		__field(int32_t, m_asts)
+		__field(int32_t, m_result)
+		__dynamic_array(unsigned char, m_extra,
+				le16_to_cpu(ms->m_header.h_length) - sizeof(*ms))
+	),
+
+	TP_fast_assign(
+		__entry->seq = seq;
+		__entry->h_version = le32_to_cpu(ms->m_header.h_version);
+		__entry->h_lockspace = le32_to_cpu(ms->m_header.u.h_lockspace);
+		__entry->h_nodeid = le32_to_cpu(ms->m_header.h_nodeid);
+		__entry->h_length = le16_to_cpu(ms->m_header.h_length);
+		__entry->h_cmd = ms->m_header.h_cmd;
+		__entry->m_type = le32_to_cpu(ms->m_type);
+		__entry->m_nodeid = le32_to_cpu(ms->m_nodeid);
+		__entry->m_pid = le32_to_cpu(ms->m_pid);
+		__entry->m_lkid = le32_to_cpu(ms->m_lkid);
+		__entry->m_remid = le32_to_cpu(ms->m_remid);
+		__entry->m_parent_lkid = le32_to_cpu(ms->m_parent_lkid);
+		__entry->m_parent_remid = le32_to_cpu(ms->m_parent_remid);
+		__entry->m_exflags = le32_to_cpu(ms->m_exflags);
+		__entry->m_sbflags = le32_to_cpu(ms->m_sbflags);
+		__entry->m_flags = le32_to_cpu(ms->m_flags);
+		__entry->m_lvbseq = le32_to_cpu(ms->m_lvbseq);
+		__entry->m_hash = le32_to_cpu(ms->m_hash);
+		__entry->m_status = le32_to_cpu(ms->m_status);
+		__entry->m_grmode = le32_to_cpu(ms->m_grmode);
+		__entry->m_rqmode = le32_to_cpu(ms->m_rqmode);
+		__entry->m_bastmode = le32_to_cpu(ms->m_bastmode);
+		__entry->m_asts = le32_to_cpu(ms->m_asts);
+		__entry->m_result = le32_to_cpu(ms->m_result);
+		memcpy(__get_dynamic_array(m_extra), ms->m_extra,
+		       __get_dynamic_array_len(m_extra));
+	),
+
+	TP_printk("seq=%u h_version=%s h_lockspace=%u h_nodeid=%u "
+		  "h_length=%u h_cmd=%s m_type=%s m_nodeid=%u "
+		  "m_pid=%u m_lkid=%u m_remid=%u m_parent_lkid=%u "
+		  "m_parent_remid=%u m_exflags=%s m_sbflags=%s m_flags=%s "
+		  "m_lvbseq=%u m_hash=%u m_status=%d m_grmode=%s "
+		  "m_rqmode=%s m_bastmode=%s m_asts=%d m_result=%d "
+		  "m_extra=0x%s",
+		  __entry->seq, show_message_version(__entry->h_version),
+		  __entry->h_lockspace, __entry->h_nodeid, __entry->h_length,
+		  show_header_cmd(__entry->h_cmd),
+		  show_message_type(__entry->m_type),
+		  __entry->m_nodeid, __entry->m_pid, __entry->m_lkid,
+		  __entry->m_remid, __entry->m_parent_lkid,
+		  __entry->m_parent_remid, show_lock_flags(__entry->m_exflags),
+		  show_dlm_sb_flags(__entry->m_sbflags),
+		  show_lkb_flags(__entry->m_flags), __entry->m_lvbseq,
+		  __entry->m_hash, __entry->m_status,
+		  show_lock_mode(__entry->m_grmode),
+		  show_lock_mode(__entry->m_rqmode),
+		  show_lock_mode(__entry->m_bastmode),
+		  __entry->m_asts, __entry->m_result,
+		  __print_hex_str(__get_dynamic_array(m_extra),
+				  __get_dynamic_array_len(m_extra)))
+
+);
+
 TRACE_EVENT(dlm_send,
 
 	TP_PROTO(int nodeid, int ret),
-- 
2.31.1

