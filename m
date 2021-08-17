Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 919733EEED4
	for <lists+cluster-devel@lfdr.de>; Tue, 17 Aug 2021 16:57:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629212232;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WQ9oouKNusJFZkc0L8XEmbd1qeAMFid+zphxp0SX/C4=;
	b=hw+NrGMm4O/nLUOUoMIY6Iyp4xRSFX53g2btSzFqV+ohSW4zJJnYIkCQqS/IdWHLC0fr3u
	DoEwGVLPZny2NBWB9+lfsB97hJpzz9NImXRF4c+G1Er2qEJ+7yNA8OMsz23EgrsDAE/LgV
	svaoQIxfUzJ2ptwQOYylJEJgi4M30w0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-MerXwbzQOpO_ybl2CP3Arw-1; Tue, 17 Aug 2021 10:57:11 -0400
X-MC-Unique: MerXwbzQOpO_ybl2CP3Arw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79D7D107ACF5;
	Tue, 17 Aug 2021 14:57:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7DD060C17;
	Tue, 17 Aug 2021 14:57:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7876181A2A6;
	Tue, 17 Aug 2021 14:57:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17HEmgvq007758 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 17 Aug 2021 10:48:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A84401036D2A; Tue, 17 Aug 2021 14:48:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 665C11036D36;
	Tue, 17 Aug 2021 14:48:42 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 17 Aug 2021 10:48:24 -0400
Message-Id: <20210817144824.2127457-3-aahringo@redhat.com>
In-Reply-To: <20210817144824.2127457-1-aahringo@redhat.com>
References: <20210817144824.2127457-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 2/2] fs: dlm: trace socket handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds tracepoints for dlm socket receive and send
functionality. We can use it to track how much data was send or received
to or from a specific nodeid.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c          |  4 ++++
 include/trace/events/dlm.h | 40 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index cce1d50aa09f..7529d7072b8c 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -53,6 +53,8 @@
 #include <net/sctp/sctp.h>
 #include <net/ipv6.h>
 
+#include <trace/events/dlm.h>
+
 #include "dlm_internal.h"
 #include "lowcomms.h"
 #include "midcomms.h"
@@ -925,6 +927,7 @@ static int receive_from_sock(struct connection *con)
 		msg.msg_flags = MSG_DONTWAIT | MSG_NOSIGNAL;
 		ret = kernel_recvmsg(con->sock, &msg, &iov, 1, iov.iov_len,
 				     msg.msg_flags);
+		trace_dlm_recv(con->nodeid, ret);
 		if (ret == -EAGAIN)
 			break;
 		else if (ret <= 0)
@@ -1410,6 +1413,7 @@ static void send_to_sock(struct connection *con)
 
 		ret = kernel_sendpage(con->sock, e->page, offset, len,
 				      msg_flags);
+		trace_dlm_send(con->nodeid, ret);
 		if (ret == -EAGAIN || ret == 0) {
 			if (ret == -EAGAIN &&
 			    test_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags) &&
diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
index 5887a4db3dfa..bf336aaf10b4 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -153,6 +153,46 @@ TRACE_EVENT(dlm_ast,
 
 );
 
+TRACE_EVENT(dlm_send,
+
+	TP_PROTO(int nodeid, int ret),
+
+	TP_ARGS(nodeid, ret),
+
+	TP_STRUCT__entry(
+		__field(int, nodeid)
+		__field(int, ret)
+	),
+
+	TP_fast_assign(
+		__entry->nodeid = nodeid;
+		__entry->ret = ret;
+	),
+
+	TP_printk("nodeid=%d ret=%d", __entry->nodeid, __entry->ret)
+
+);
+
+TRACE_EVENT(dlm_recv,
+
+	TP_PROTO(int nodeid, int ret),
+
+	TP_ARGS(nodeid, ret),
+
+	TP_STRUCT__entry(
+		__field(int, nodeid)
+		__field(int, ret)
+	),
+
+	TP_fast_assign(
+		__entry->nodeid = nodeid;
+		__entry->ret = ret;
+	),
+
+	TP_printk("nodeid=%d ret=%d", __entry->nodeid, __entry->ret)
+
+);
+
 #endif /* if !defined(_TRACE_DLM_H) || defined(TRACE_HEADER_MULTI_READ) */
 
 /* This part must be outside protection */
-- 
2.27.0

