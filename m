Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D2975298B
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Jul 2023 19:08:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689268122;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Rzl0RhqBeVc4NEN7nT74sHSWsRmo3VdpwL2p0IGlie0=;
	b=FH+w6gqNF785Uf+k8uT0t3m4+eHf7kdkqq5+Qmsf9V/cPO5hK9m/CXxsWGUvAlwd3LN1NG
	s1x437bWQ+mTA/Yg8R2QboK5Hyzo0pc9GZN5mJzH6OKiTJ/685qeGF/SOj47YKzAHYBVBj
	VHuwoXjCt0rd3+yolH8XHiSUCYZQuP4=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-a1McMrnmNh2h7-nVWXacnQ-1; Thu, 13 Jul 2023 13:08:41 -0400
X-MC-Unique: a1McMrnmNh2h7-nVWXacnQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCE1C3C0C495;
	Thu, 13 Jul 2023 17:08:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55A0E40C206F;
	Thu, 13 Jul 2023 17:08:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E425F19465B6;
	Thu, 13 Jul 2023 17:08:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 792CF1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Jul 2023 17:08:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 68E982166B28; Thu, 13 Jul 2023 17:08:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EB562166B26;
 Thu, 13 Jul 2023 17:08:38 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 13 Jul 2023 13:08:36 -0400
Message-Id: <20230713170836.3583715-2-aahringo@redhat.com>
In-Reply-To: <20230713170836.3583715-1-aahringo@redhat.com>
References: <20230713170836.3583715-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm-tool 2/2] fs: dlm: implement
 DLM_PLOCK_OP_CANCEL
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch implements DLM_PLOCK_OP_CANCEL to try to delete waiters for a
lock request which are waiting to being granted. If the waiter can be
deleted the reply to the kernel will be replaced from
DLM_PLOCK_OP_LOCK to the sent DLM_PLOCK_OP_CANCEL and clearing the
DLM_PLOCK_FL_NO_REPLY flag.
---
 dlm_controld/plock.c | 47 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index ab19e8d7..fd2bd2cf 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -9,6 +9,10 @@
 #include "dlm_daemon.h"
 #include <linux/dlm_plock.h>
 
+#ifndef DLM_PLOCK_OP_CANCEL
+#define DLM_PLOCK_OP_CANCEL 4
+#endif
+
 #ifndef DLM_PLOCK_FL_NO_REPLY
 #define DLM_PLOCK_FL_NO_REPLY 2
 #endif
@@ -136,6 +140,8 @@ static const char *op_str(int optype)
 	switch (optype) {
 	case DLM_PLOCK_OP_LOCK:
 		return "LK";
+	case DLM_PLOCK_OP_CANCEL:
+		return "CL";
 	case DLM_PLOCK_OP_UNLOCK:
 		return "UN";
 	case DLM_PLOCK_OP_GET:
@@ -751,6 +757,43 @@ static void do_lock(struct lockspace *ls, struct dlm_plock_info *in,
 	put_resource(ls, r);
 }
 
+static int remove_waiter(const struct resource *r, struct dlm_plock_info *in)
+{
+	struct lock_waiter *w;
+
+	list_for_each_entry(w, &r->waiters, list) {
+		if (w->info.nodeid == in->nodeid &&
+		    w->info.fsid == in->fsid &&
+		    w->info.number == in->number &&
+		    w->info.owner == in->owner &&
+		    w->info.pid == in->pid &&
+		    w->info.start == in->start &&
+		    w->info.end == in->end &&
+		    w->info.ex == in->ex) {
+			list_del(&w->list);
+			free(w);
+			return 0;
+		}
+	}
+
+	return -ENOENT;
+}
+
+static void do_cancel(struct lockspace *ls, struct dlm_plock_info *in,
+		      struct resource *r)
+{
+	int rv;
+
+	rv = remove_waiter(r, in);
+	if (in->nodeid == our_nodeid && rv == 0) {
+		/* we replacing a reply because we canceled waiter */
+		in->flags &= ~DLM_PLOCK_FL_NO_REPLY;
+		write_result(in, rv);
+	}
+
+	put_resource(ls, r);
+}
+
 static void do_unlock(struct lockspace *ls, struct dlm_plock_info *in,
 		      struct resource *r)
 {
@@ -816,6 +859,10 @@ static void __receive_plock(struct lockspace *ls, struct dlm_plock_info *in,
 		ls->last_plock_time = monotime();
 		do_lock(ls, in, r);
 		break;
+	case DLM_PLOCK_OP_CANCEL:
+		ls->last_plock_time = monotime();
+		do_cancel(ls, in, r);
+		break;
 	case DLM_PLOCK_OP_UNLOCK:
 		ls->last_plock_time = monotime();
 		do_unlock(ls, in, r);
-- 
2.31.1

