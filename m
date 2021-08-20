Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6DB3F34D0
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 21:51:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629489091;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CyK5RVTd1ZGh3mKaUmd7MiVx41w7x9OKeFLbf26SA28=;
	b=VStWWPvfkBhAxfNdSHBh/ZJeC3DNTJheHe2atPomkkQrERAZStljf07U4DZJaI3BCdtvJm
	wCy8Mp1CSZ7BNKSxyKN+YzwKZOEsh2oSCffsnLbNaTJU3WoxRA9o9sLp5KXagK8mDePsRo
	BzoRNBXp5ahm5UlnuaiJbAY4KuDf580=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-BgQWWLMlPwyrQFGf7Kt7Jg-1; Fri, 20 Aug 2021 15:51:29 -0400
X-MC-Unique: BgQWWLMlPwyrQFGf7Kt7Jg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9877A8799EC;
	Fri, 20 Aug 2021 19:51:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 899165C1BB;
	Fri, 20 Aug 2021 19:51:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71DAE4BB7C;
	Fri, 20 Aug 2021 19:51:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KJpPoP017820 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 15:51:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8EAF71346F; Fri, 20 Aug 2021 19:51:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 372F8604CC;
	Fri, 20 Aug 2021 19:51:25 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 20 Aug 2021 15:51:15 -0400
Message-Id: <20210820195115.1370171-4-aahringo@redhat.com>
In-Reply-To: <20210820195115.1370171-1-aahringo@redhat.com>
References: <20210820195115.1370171-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 3/3] fs: dlm: trace socket handling
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

This patch adds tracepoints for dlm socket receive and send
functionality. We can use it to track how much data was send or received
to or from a specific nodeid.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c          |  4 ++++
 include/trace/events/dlm.h | 40 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 8f715c620e1f..e5438f2e586a 100644
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
@@ -1411,6 +1414,7 @@ static void send_to_sock(struct connection *con)
 
 		ret = kernel_sendpage(con->sock, e->page, offset, len,
 				      msg_flags);
+		trace_dlm_send(con->nodeid, ret);
 		if (ret == -EAGAIN || ret == 0) {
 			if (ret == -EAGAIN &&
 			    test_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags) &&
diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
index cc2dd79f4ec7..9a2e3d869363 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -214,6 +214,46 @@ TRACE_EVENT(dlm_unlock_end,
 
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

