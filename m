Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5977654DC
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 15:23:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690464199;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qFlkjJdH5UFY2BdM+g4dwGNLSIlhj8vROYVGNqhUJ2A=;
	b=K/JszUBgEHmDHd5wHFstXCq1M6EBTLzE0ln9gGCbQ1EF7o9zPhllgaaO9x3BHahduHXLKT
	iSSiL6vUzliQRgqtabPi82Cpu4WQxlP9+8pw6eKfuK4wwN3fOCTJ8kz2AlBO+kiwKy5Ec4
	4kystlL/LCU0THE8vJYpF5nmYPQp0ck=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-1LuNN2D3MpyHEOldDGwpvQ-1; Thu, 27 Jul 2023 09:23:14 -0400
X-MC-Unique: 1LuNN2D3MpyHEOldDGwpvQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61ADC381495B;
	Thu, 27 Jul 2023 13:23:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E0E5201EE6E;
	Thu, 27 Jul 2023 13:23:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CF02B1946A71;
	Thu, 27 Jul 2023 13:23:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 890D11946586 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 13:23:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 783944094DC0; Thu, 27 Jul 2023 13:23:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 569C44094DC2;
 Thu, 27 Jul 2023 13:23:09 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Jul 2023 09:22:55 -0400
Message-Id: <20230727132303.3352514-5-aahringo@redhat.com>
In-Reply-To: <20230727132303.3352514-1-aahringo@redhat.com>
References: <20230727132303.3352514-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm-next 05/13] fs: dlm: add plock dev
 tracepoints
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

I currently debug nfs plock handling and introduce those two tracepoints
for getting more information about what is happening there if the user
space reads plock operations from kernel and writing the result back.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c             |  6 +++++
 include/trace/events/dlm.h | 51 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 5c2cc8d940ef..00e1d802a81c 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -11,6 +11,8 @@
 #include <linux/dlm_plock.h>
 #include <linux/slab.h>
 
+#include <trace/events/dlm.h>
+
 #include "dlm_internal.h"
 #include "lockspace.h"
 
@@ -509,6 +511,8 @@ static ssize_t dev_read(struct file *file, char __user *u, size_t count,
 	if (!op)
 		return -EAGAIN;
 
+	trace_dlm_plock_read(&info);
+
 	/* there is no need to get a reply from userspace for unlocks
 	   that were generated by the vfs cleaning up for a close
 	   (the process did not make an unlock call). */
@@ -536,6 +540,8 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 	if (copy_from_user(&info, u, sizeof(info)))
 		return -EFAULT;
 
+	trace_dlm_plock_write(&info);
+
 	if (check_version(&info))
 		return -EINVAL;
 
diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
index 2b09574e1243..c1a146f9fc91 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -7,6 +7,7 @@
 
 #include <linux/dlm.h>
 #include <linux/dlmconstants.h>
+#include <uapi/linux/dlm_plock.h>
 #include <linux/tracepoint.h>
 
 #include "../../../fs/dlm/dlm_internal.h"
@@ -585,6 +586,56 @@ TRACE_EVENT(dlm_recv_message,
 
 );
 
+DECLARE_EVENT_CLASS(dlm_plock_template,
+
+	TP_PROTO(const struct dlm_plock_info *info),
+
+	TP_ARGS(info),
+
+	TP_STRUCT__entry(
+		__field(uint8_t, optype)
+		__field(uint8_t, ex)
+		__field(uint8_t, wait)
+		__field(uint8_t, flags)
+		__field(uint32_t, pid)
+		__field(int32_t, nodeid)
+		__field(int32_t, rv)
+		__field(uint32_t, fsid)
+		__field(uint64_t, number)
+		__field(uint64_t, start)
+		__field(uint64_t, end)
+		__field(uint64_t, owner)
+	),
+
+	TP_fast_assign(
+		__entry->optype = info->optype;
+		__entry->ex = info->ex;
+		__entry->wait = info->wait;
+		__entry->flags = info->flags;
+		__entry->pid = info->pid;
+		__entry->nodeid = info->nodeid;
+		__entry->rv = info->rv;
+		__entry->fsid = info->fsid;
+		__entry->number = info->number;
+		__entry->start = info->start;
+		__entry->end = info->end;
+		__entry->owner = info->owner;
+	),
+
+	TP_printk("fsid=%u number=%llx owner=%llx optype=%d ex=%d wait=%d flags=%x pid=%u nodeid=%d rv=%d start=%llx end=%llx",
+		  __entry->fsid, __entry->number, __entry->owner,
+		  __entry->optype, __entry->ex, __entry->wait,
+		  __entry->flags, __entry->pid, __entry->nodeid,
+		  __entry->rv, __entry->start, __entry->end)
+
+);
+
+DEFINE_EVENT(dlm_plock_template, dlm_plock_read,
+	     TP_PROTO(const struct dlm_plock_info *info), TP_ARGS(info));
+
+DEFINE_EVENT(dlm_plock_template, dlm_plock_write,
+	     TP_PROTO(const struct dlm_plock_info *info), TP_ARGS(info));
+
 TRACE_EVENT(dlm_send,
 
 	TP_PROTO(int nodeid, int ret),
-- 
2.31.1

