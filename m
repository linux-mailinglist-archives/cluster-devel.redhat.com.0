Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DB962E7E2
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Nov 2022 23:12:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668723137;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oR4vKbkLoaOiSDuXSkGYYtRfV8DtdQO1heds+nNv3ow=;
	b=fQ5DvRmZTFAWgZfCYO2CyrNJ1aYYBmWwKXiP7e3W54Bl2UJaPSLCVasSiRyrxisipWE7MF
	6F0EpX9/EvVJThk9cG4MVUuXp0kucKrts2MkvkIvuBZq8KL86HOrvO6siVuWAlzibSYHUo
	wZik19QewxZYMKGBZPoJ7t+fYLJY+3E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-m-TOzlTtPLGNoGadjfLfmQ-1; Thu, 17 Nov 2022 17:12:14 -0500
X-MC-Unique: m-TOzlTtPLGNoGadjfLfmQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30884857F8F;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2698940C959A;
	Thu, 17 Nov 2022 22:12:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 411821946A49;
	Thu, 17 Nov 2022 22:12:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CE8621946595 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 22:12:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A446A2166B47; Thu, 17 Nov 2022 22:12:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FF822166B29;
 Thu, 17 Nov 2022 22:12:08 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Nov 2022 17:11:45 -0500
Message-Id: <20221117221157.2396743-6-aahringo@redhat.com>
In-Reply-To: <20221117221157.2396743-1-aahringo@redhat.com>
References: <20221117221157.2396743-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 06/18] fs: dlm: add dst nodeid for
 msg tracing
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In DLM when we send a dlm message it is easy to add the lock resource
name, but additional lookup is required when to trace the receive
message side. The idea here is to move the lookup work to the user by
using a lookup to find the right send message with recv message. As note
DLM can't drop any message which is guaranteed by a special session
layer.

For doing the lookup a 3 tupel is required as an unique identification
which is dst nodeid, src nodeid and sequence number. This patch adds the
destination nodeid to the dlm message trace points. The source nodeid is
given by the h_nodeid field inside the header.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c          | 10 ++++++----
 include/trace/events/dlm.h | 38 ++++++++++++++++++++++----------------
 2 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 32194a750fe1..960def5ab530 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -479,10 +479,10 @@ static void dlm_receive_buffer_3_2_trace(uint32_t seq, union dlm_packet *p)
 {
 	switch (p->header.h_cmd) {
 	case DLM_MSG:
-		trace_dlm_recv_message(seq, &p->message);
+		trace_dlm_recv_message(dlm_our_nodeid(), seq, &p->message);
 		break;
 	case DLM_RCOM:
-		trace_dlm_recv_rcom(seq, &p->rcom);
+		trace_dlm_recv_rcom(dlm_our_nodeid(), seq, &p->rcom);
 		break;
 	default:
 		break;
@@ -1151,11 +1151,13 @@ static void dlm_midcomms_commit_msg_3_2_trace(const struct dlm_mhandle *mh,
 {
 	switch (mh->inner_p->header.h_cmd) {
 	case DLM_MSG:
-		trace_dlm_send_message(mh->seq, &mh->inner_p->message,
+		trace_dlm_send_message(mh->node->nodeid, mh->seq,
+				       &mh->inner_p->message,
 				       name, namelen);
 		break;
 	case DLM_RCOM:
-		trace_dlm_send_rcom(mh->seq, &mh->inner_p->rcom);
+		trace_dlm_send_rcom(mh->node->nodeid, mh->seq,
+				    &mh->inner_p->rcom);
 		break;
 	default:
 		/* nothing to trace */
diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
index 212f30aec7cf..37eb79e29b28 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -342,11 +342,12 @@ TRACE_EVENT(dlm_unlock_end,
 
 DECLARE_EVENT_CLASS(dlm_rcom_template,
 
-	TP_PROTO(uint32_t h_seq, const struct dlm_rcom *rc),
+	TP_PROTO(uint32_t dst, uint32_t h_seq, const struct dlm_rcom *rc),
 
-	TP_ARGS(h_seq, rc),
+	TP_ARGS(dst, h_seq, rc),
 
 	TP_STRUCT__entry(
+		__field(uint32_t, dst)
 		__field(uint32_t, h_seq)
 		__field(uint32_t, h_version)
 		__field(uint32_t, h_lockspace)
@@ -363,6 +364,7 @@ DECLARE_EVENT_CLASS(dlm_rcom_template,
 	),
 
 	TP_fast_assign(
+		__entry->dst = dst;
 		__entry->h_seq = h_seq;
 		__entry->h_version = le32_to_cpu(rc->rc_header.h_version);
 		__entry->h_lockspace = le32_to_cpu(rc->rc_header.u.h_lockspace);
@@ -378,10 +380,10 @@ DECLARE_EVENT_CLASS(dlm_rcom_template,
 		       __get_dynamic_array_len(rc_buf));
 	),
 
-	TP_printk("h_seq=%u h_version=%s h_lockspace=%u h_nodeid=%u "
+	TP_printk("dst=%u h_seq=%u h_version=%s h_lockspace=%u h_nodeid=%u "
 		  "h_length=%u h_cmd=%s rc_type=%s rc_result=%d "
 		  "rc_id=%llu rc_seq=%llu rc_seq_reply=%llu "
-		  "rc_buf=0x%s", __entry->h_seq,
+		  "rc_buf=0x%s", __entry->dst, __entry->h_seq,
 		  show_message_version(__entry->h_version),
 		  __entry->h_lockspace, __entry->h_nodeid, __entry->h_length,
 		  show_header_cmd(__entry->h_cmd),
@@ -394,21 +396,22 @@ DECLARE_EVENT_CLASS(dlm_rcom_template,
 );
 
 DEFINE_EVENT(dlm_rcom_template, dlm_send_rcom,
-	     TP_PROTO(uint32_t h_seq, const struct dlm_rcom *rc),
-	     TP_ARGS(h_seq, rc));
+	     TP_PROTO(uint32_t dst, uint32_t h_seq, const struct dlm_rcom *rc),
+	     TP_ARGS(dst, h_seq, rc));
 
 DEFINE_EVENT(dlm_rcom_template, dlm_recv_rcom,
-	     TP_PROTO(uint32_t h_seq, const struct dlm_rcom *rc),
-	     TP_ARGS(h_seq, rc));
+	     TP_PROTO(uint32_t dst, uint32_t h_seq, const struct dlm_rcom *rc),
+	     TP_ARGS(dst, h_seq, rc));
 
 TRACE_EVENT(dlm_send_message,
 
-	TP_PROTO(uint32_t h_seq, const struct dlm_message *ms,
+	TP_PROTO(uint32_t dst, uint32_t h_seq, const struct dlm_message *ms,
 		 const void *name, int namelen),
 
-	TP_ARGS(h_seq, ms, name, namelen),
+	TP_ARGS(dst, h_seq, ms, name, namelen),
 
 	TP_STRUCT__entry(
+		__field(uint32_t, dst)
 		__field(uint32_t, h_seq)
 		__field(uint32_t, h_version)
 		__field(uint32_t, h_lockspace)
@@ -439,6 +442,7 @@ TRACE_EVENT(dlm_send_message,
 	),
 
 	TP_fast_assign(
+		__entry->dst = dst;
 		__entry->h_seq = h_seq;
 		__entry->h_version = le32_to_cpu(ms->m_header.h_version);
 		__entry->h_lockspace = le32_to_cpu(ms->m_header.u.h_lockspace);
@@ -469,13 +473,13 @@ TRACE_EVENT(dlm_send_message,
 		       __get_dynamic_array_len(res_name));
 	),
 
-	TP_printk("h_seq=%u h_version=%s h_lockspace=%u h_nodeid=%u "
+	TP_printk("dst=%u h_seq=%u h_version=%s h_lockspace=%u h_nodeid=%u "
 		  "h_length=%u h_cmd=%s m_type=%s m_nodeid=%u "
 		  "m_pid=%u m_lkid=%u m_remid=%u m_parent_lkid=%u "
 		  "m_parent_remid=%u m_exflags=%s m_sbflags=%s m_flags=%s "
 		  "m_lvbseq=%u m_hash=%u m_status=%d m_grmode=%s "
 		  "m_rqmode=%s m_bastmode=%s m_asts=%d m_result=%d "
-		  "m_extra=0x%s res_name=0x%s",
+		  "m_extra=0x%s res_name=0x%s", __entry->dst,
 		  __entry->h_seq, show_message_version(__entry->h_version),
 		  __entry->h_lockspace, __entry->h_nodeid, __entry->h_length,
 		  show_header_cmd(__entry->h_cmd),
@@ -499,11 +503,12 @@ TRACE_EVENT(dlm_send_message,
 
 TRACE_EVENT(dlm_recv_message,
 
-	TP_PROTO(uint32_t h_seq, const struct dlm_message *ms),
+	TP_PROTO(uint32_t dst, uint32_t h_seq, const struct dlm_message *ms),
 
-	TP_ARGS(h_seq, ms),
+	TP_ARGS(dst, h_seq, ms),
 
 	TP_STRUCT__entry(
+		__field(uint32_t, dst)
 		__field(uint32_t, h_seq)
 		__field(uint32_t, h_version)
 		__field(uint32_t, h_lockspace)
@@ -533,6 +538,7 @@ TRACE_EVENT(dlm_recv_message,
 	),
 
 	TP_fast_assign(
+		__entry->dst = dst;
 		__entry->h_seq = h_seq;
 		__entry->h_version = le32_to_cpu(ms->m_header.h_version);
 		__entry->h_lockspace = le32_to_cpu(ms->m_header.u.h_lockspace);
@@ -561,13 +567,13 @@ TRACE_EVENT(dlm_recv_message,
 		       __get_dynamic_array_len(m_extra));
 	),
 
-	TP_printk("h_seq=%u h_version=%s h_lockspace=%u h_nodeid=%u "
+	TP_printk("dst=%u h_seq=%u h_version=%s h_lockspace=%u h_nodeid=%u "
 		  "h_length=%u h_cmd=%s m_type=%s m_nodeid=%u "
 		  "m_pid=%u m_lkid=%u m_remid=%u m_parent_lkid=%u "
 		  "m_parent_remid=%u m_exflags=%s m_sbflags=%s m_flags=%s "
 		  "m_lvbseq=%u m_hash=%u m_status=%d m_grmode=%s "
 		  "m_rqmode=%s m_bastmode=%s m_asts=%d m_result=%d "
-		  "m_extra=0x%s",
+		  "m_extra=0x%s", __entry->dst,
 		  __entry->h_seq, show_message_version(__entry->h_version),
 		  __entry->h_lockspace, __entry->h_nodeid, __entry->h_length,
 		  show_header_cmd(__entry->h_cmd),
-- 
2.31.1

