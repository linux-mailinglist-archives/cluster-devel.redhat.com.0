Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA66B62E7E0
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Nov 2022 23:12:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668723136;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GSR8SpeUT4WDSYkR/q3XhuumdRiX6Fk/2Uo04zAFyKw=;
	b=ERfEXXgAreP6JK5ItHVep8uvlm+CUCVK/3gj+TjuwkYPOa8xVE/fqWp/jMi+O7HN0Pp53c
	O6FJP1+SCEXRsrICM0gKYwiDKaol2Je3X0+cs9CH1zW6Nv8K/xwBy+hyIc4+XC7O4AtnV4
	XHgr1GIfX7LZMQ2G9NhgAbipBoT987g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-e9MCZ62xMv6GLVb-81HDzw-1; Thu, 17 Nov 2022 17:12:14 -0500
X-MC-Unique: e9MCZ62xMv6GLVb-81HDzw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 312FD1C068C8;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 017174B4014;
	Thu, 17 Nov 2022 22:12:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 31A5219465B9;
	Thu, 17 Nov 2022 22:12:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 895281946595 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 22:12:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 79E872166B46; Thu, 17 Nov 2022 22:12:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 564E02166B44;
 Thu, 17 Nov 2022 22:12:08 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Nov 2022 17:11:44 -0500
Message-Id: <20221117221157.2396743-5-aahringo@redhat.com>
In-Reply-To: <20221117221157.2396743-1-aahringo@redhat.com>
References: <20221117221157.2396743-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 05/18] fs: dlm: rename seq to h_seq
 for msg tracing
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch renames seq to h_seq as it is named in the dlm header
structure.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 include/trace/events/dlm.h | 44 +++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
index 4ec47828d55e..212f30aec7cf 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -342,12 +342,12 @@ TRACE_EVENT(dlm_unlock_end,
 
 DECLARE_EVENT_CLASS(dlm_rcom_template,
 
-	TP_PROTO(uint32_t seq, const struct dlm_rcom *rc),
+	TP_PROTO(uint32_t h_seq, const struct dlm_rcom *rc),
 
-	TP_ARGS(seq, rc),
+	TP_ARGS(h_seq, rc),
 
 	TP_STRUCT__entry(
-		__field(uint32_t, seq)
+		__field(uint32_t, h_seq)
 		__field(uint32_t, h_version)
 		__field(uint32_t, h_lockspace)
 		__field(uint32_t, h_nodeid)
@@ -363,7 +363,7 @@ DECLARE_EVENT_CLASS(dlm_rcom_template,
 	),
 
 	TP_fast_assign(
-		__entry->seq = seq;
+		__entry->h_seq = h_seq;
 		__entry->h_version = le32_to_cpu(rc->rc_header.h_version);
 		__entry->h_lockspace = le32_to_cpu(rc->rc_header.u.h_lockspace);
 		__entry->h_nodeid = le32_to_cpu(rc->rc_header.h_nodeid);
@@ -378,10 +378,10 @@ DECLARE_EVENT_CLASS(dlm_rcom_template,
 		       __get_dynamic_array_len(rc_buf));
 	),
 
-	TP_printk("seq=%u, h_version=%s h_lockspace=%u h_nodeid=%u "
+	TP_printk("h_seq=%u h_version=%s h_lockspace=%u h_nodeid=%u "
 		  "h_length=%u h_cmd=%s rc_type=%s rc_result=%d "
 		  "rc_id=%llu rc_seq=%llu rc_seq_reply=%llu "
-		  "rc_buf=0x%s", __entry->seq,
+		  "rc_buf=0x%s", __entry->h_seq,
 		  show_message_version(__entry->h_version),
 		  __entry->h_lockspace, __entry->h_nodeid, __entry->h_length,
 		  show_header_cmd(__entry->h_cmd),
@@ -394,22 +394,22 @@ DECLARE_EVENT_CLASS(dlm_rcom_template,
 );
 
 DEFINE_EVENT(dlm_rcom_template, dlm_send_rcom,
-	     TP_PROTO(uint32_t seq, const struct dlm_rcom *rc),
-	     TP_ARGS(seq, rc));
+	     TP_PROTO(uint32_t h_seq, const struct dlm_rcom *rc),
+	     TP_ARGS(h_seq, rc));
 
 DEFINE_EVENT(dlm_rcom_template, dlm_recv_rcom,
-	     TP_PROTO(uint32_t seq, const struct dlm_rcom *rc),
-	     TP_ARGS(seq, rc));
+	     TP_PROTO(uint32_t h_seq, const struct dlm_rcom *rc),
+	     TP_ARGS(h_seq, rc));
 
 TRACE_EVENT(dlm_send_message,
 
-	TP_PROTO(uint32_t seq, const struct dlm_message *ms,
+	TP_PROTO(uint32_t h_seq, const struct dlm_message *ms,
 		 const void *name, int namelen),
 
-	TP_ARGS(seq, ms, name, namelen),
+	TP_ARGS(h_seq, ms, name, namelen),
 
 	TP_STRUCT__entry(
-		__field(uint32_t, seq)
+		__field(uint32_t, h_seq)
 		__field(uint32_t, h_version)
 		__field(uint32_t, h_lockspace)
 		__field(uint32_t, h_nodeid)
@@ -439,7 +439,7 @@ TRACE_EVENT(dlm_send_message,
 	),
 
 	TP_fast_assign(
-		__entry->seq = seq;
+		__entry->h_seq = h_seq;
 		__entry->h_version = le32_to_cpu(ms->m_header.h_version);
 		__entry->h_lockspace = le32_to_cpu(ms->m_header.u.h_lockspace);
 		__entry->h_nodeid = le32_to_cpu(ms->m_header.h_nodeid);
@@ -469,14 +469,14 @@ TRACE_EVENT(dlm_send_message,
 		       __get_dynamic_array_len(res_name));
 	),
 
-	TP_printk("seq=%u h_version=%s h_lockspace=%u h_nodeid=%u "
+	TP_printk("h_seq=%u h_version=%s h_lockspace=%u h_nodeid=%u "
 		  "h_length=%u h_cmd=%s m_type=%s m_nodeid=%u "
 		  "m_pid=%u m_lkid=%u m_remid=%u m_parent_lkid=%u "
 		  "m_parent_remid=%u m_exflags=%s m_sbflags=%s m_flags=%s "
 		  "m_lvbseq=%u m_hash=%u m_status=%d m_grmode=%s "
 		  "m_rqmode=%s m_bastmode=%s m_asts=%d m_result=%d "
 		  "m_extra=0x%s res_name=0x%s",
-		  __entry->seq, show_message_version(__entry->h_version),
+		  __entry->h_seq, show_message_version(__entry->h_version),
 		  __entry->h_lockspace, __entry->h_nodeid, __entry->h_length,
 		  show_header_cmd(__entry->h_cmd),
 		  show_message_type(__entry->m_type),
@@ -499,12 +499,12 @@ TRACE_EVENT(dlm_send_message,
 
 TRACE_EVENT(dlm_recv_message,
 
-	TP_PROTO(uint32_t seq, const struct dlm_message *ms),
+	TP_PROTO(uint32_t h_seq, const struct dlm_message *ms),
 
-	TP_ARGS(seq, ms),
+	TP_ARGS(h_seq, ms),
 
 	TP_STRUCT__entry(
-		__field(uint32_t, seq)
+		__field(uint32_t, h_seq)
 		__field(uint32_t, h_version)
 		__field(uint32_t, h_lockspace)
 		__field(uint32_t, h_nodeid)
@@ -533,7 +533,7 @@ TRACE_EVENT(dlm_recv_message,
 	),
 
 	TP_fast_assign(
-		__entry->seq = seq;
+		__entry->h_seq = h_seq;
 		__entry->h_version = le32_to_cpu(ms->m_header.h_version);
 		__entry->h_lockspace = le32_to_cpu(ms->m_header.u.h_lockspace);
 		__entry->h_nodeid = le32_to_cpu(ms->m_header.h_nodeid);
@@ -561,14 +561,14 @@ TRACE_EVENT(dlm_recv_message,
 		       __get_dynamic_array_len(m_extra));
 	),
 
-	TP_printk("seq=%u h_version=%s h_lockspace=%u h_nodeid=%u "
+	TP_printk("h_seq=%u h_version=%s h_lockspace=%u h_nodeid=%u "
 		  "h_length=%u h_cmd=%s m_type=%s m_nodeid=%u "
 		  "m_pid=%u m_lkid=%u m_remid=%u m_parent_lkid=%u "
 		  "m_parent_remid=%u m_exflags=%s m_sbflags=%s m_flags=%s "
 		  "m_lvbseq=%u m_hash=%u m_status=%d m_grmode=%s "
 		  "m_rqmode=%s m_bastmode=%s m_asts=%d m_result=%d "
 		  "m_extra=0x%s",
-		  __entry->seq, show_message_version(__entry->h_version),
+		  __entry->h_seq, show_message_version(__entry->h_version),
 		  __entry->h_lockspace, __entry->h_nodeid, __entry->h_length,
 		  show_header_cmd(__entry->h_cmd),
 		  show_message_type(__entry->m_type),
-- 
2.31.1

