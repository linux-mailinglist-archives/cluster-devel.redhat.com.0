Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E5B7584D8
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Jul 2023 20:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689705075;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6/IOWvZlNuHw1WuABsaf27BLy/abLei4+VfF2m5HSJw=;
	b=KvJJz92vQIo5fKY4GkNLgG1nu2TVxH2s3c1XpCWIhOn/XbP9F5cCpBrSV159YfOtAXpNVw
	3rFDaoFFV42YknCZUE4dZWUNcbXo1oPqxqFKGCxrTCkXQe6OcgYi50lF6Bw/PoF+t4j0bY
	JIYBmCLWlfw7mFuq4uRXgOZFsOC932s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-tsLV-eHPNl2DKmVl8kvOtA-1; Tue, 18 Jul 2023 14:31:14 -0400
X-MC-Unique: tsLV-eHPNl2DKmVl8kvOtA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43959936D25;
	Tue, 18 Jul 2023 18:31:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E363E2166B25;
	Tue, 18 Jul 2023 18:31:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AF0741946595;
	Tue, 18 Jul 2023 18:31:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 24516194658D for <cluster-devel@listman.corp.redhat.com>;
 Tue, 18 Jul 2023 18:31:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F3C322014F88; Tue, 18 Jul 2023 18:31:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8643200BA8B;
 Tue, 18 Jul 2023 18:31:06 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 18 Jul 2023 14:31:05 -0400
Message-Id: <20230718183105.770594-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCHv2 dlm-tool] fs: dlm: implement
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch implements DLM_PLOCK_OP_CANCEL to try to delete waiters for a
lock request which are waiting to being granted. If the waiter can be
deleted the reply is 0. If the waiter cannot be found it will return
-ENOENT to the kernel, either that there never was be a waiter or we were
to late to cancel the lock request.
---
changes since v2:

- drop the no reply flag
- always send a reply on DLM_PLOCK_OP_CANCEL
- return -ENOENT instead of 1 to indicated cancellation failed

 dlm_controld/plock.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index a91aecb0..1944cd59 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -9,6 +9,10 @@
 #include "dlm_daemon.h"
 #include <linux/dlm_plock.h>
 
+#ifndef DLM_PLOCK_OP_CANCEL
+#define DLM_PLOCK_OP_CANCEL 4
+#endif
+
 static uint32_t plock_read_count;
 static uint32_t plock_recv_count;
 static uint32_t plock_rate_delays;
@@ -132,6 +136,8 @@ static const char *op_str(int optype)
 	switch (optype) {
 	case DLM_PLOCK_OP_LOCK:
 		return "LK";
+	case DLM_PLOCK_OP_CANCEL:
+		return "CL";
 	case DLM_PLOCK_OP_UNLOCK:
 		return "UN";
 	case DLM_PLOCK_OP_GET:
@@ -741,6 +747,40 @@ static void do_lock(struct lockspace *ls, struct dlm_plock_info *in,
 	put_resource(ls, r);
 }
 
+static int remove_waiter(const struct resource *r, const struct dlm_plock_info *in)
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
+	if (in->nodeid == our_nodeid)
+		write_result(in, rv);
+
+	put_resource(ls, r);
+}
+
 static void do_unlock(struct lockspace *ls, struct dlm_plock_info *in,
 		      struct resource *r)
 {
@@ -806,6 +846,10 @@ static void __receive_plock(struct lockspace *ls, struct dlm_plock_info *in,
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

