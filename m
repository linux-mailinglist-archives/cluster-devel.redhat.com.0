Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0679709B3C
	for <lists+cluster-devel@lfdr.de>; Fri, 19 May 2023 17:23:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684509827;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BRkDhHR9sOkSQoEYrVEYavIaDc4VsgCYNMUF/FKFGdk=;
	b=KifYbLRXVQd+etPPThLoKChNQR9yfSsnjnGEmHpW7XcamlxivW0xbECKRPp4G+S+JUgdSD
	a9vLQwO3dP24BiWt2iUkSuunLHAkIN7+iO49zgUiBx2SWAU8MimlcdJWl2Wu6noqUjGhUw
	rAdZy+PLOqunI8/KSKrM7jRiiBcslxU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-jx9G-_auOL-XtNfsHDW4eg-1; Fri, 19 May 2023 11:23:44 -0400
X-MC-Unique: jx9G-_auOL-XtNfsHDW4eg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 052C63C025CB;
	Fri, 19 May 2023 15:23:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE45E1121314;
	Fri, 19 May 2023 15:23:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B27A119465B9;
	Fri, 19 May 2023 15:23:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 718BC1946A41 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 19 May 2023 15:23:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 98631C54187; Fri, 19 May 2023 15:23:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F132C0004B;
 Fri, 19 May 2023 15:23:39 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 19 May 2023 11:23:36 -0400
Message-Id: <20230519152336.65815-2-aahringo@redhat.com>
In-Reply-To: <20230519152336.65815-1-aahringo@redhat.com>
References: <20230519152336.65815-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH dlm/next 2/2] fs: dlm: cleanup plock op
 lookup functionality
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will introduce plock_op_lookup() to lookup a plock op when a
result needs to lookup the plock op to find the original request.
Besides that we add additional sanity check to confirm the lookup is
still working in case of non F_SETLKW request as it requires a specific
order in recv_list.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 107 +++++++++++++++++++++++++++++++------------------
 1 file changed, 68 insertions(+), 39 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 578bf8a1325f..933fb575e83a 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -433,14 +433,58 @@ static ssize_t dev_read(struct file *file, char __user *u, size_t count,
 	return sizeof(info);
 }
 
+static struct plock_op *plock_op_lookup(const struct dlm_plock_info *info)
+{
+	struct plock_op *op = NULL, *iter;
+
+	if (info->wait) {
+		list_for_each_entry(iter, &recv_setlkw_list, list) {
+			if (iter->info.fsid == info->fsid &&
+			    iter->info.number == info->number &&
+			    iter->info.owner == info->owner &&
+			    iter->info.pid == info->pid &&
+			    iter->info.start == info->start &&
+			    iter->info.end == info->end) {
+				op = iter;
+				break;
+			}
+		}
+	} else {
+		op = list_first_entry_or_null(&recv_list, struct plock_op,
+					      list);
+		if (op) {
+			/* sanity check to check we got the right one */
+			switch (op->info.optype) {
+			case DLM_PLOCK_OP_GET:
+				/* we can't check on some fields on get */
+				WARN_ON(op->info.fsid != info->fsid ||
+					op->info.number != info->number ||
+					op->info.owner != info->owner ||
+					op->info.optype != info->optype);
+				break;
+			default:
+				WARN_ON(op->info.fsid != info->fsid ||
+					op->info.number != info->number ||
+					op->info.owner != info->owner ||
+					op->info.pid != info->pid ||
+					op->info.start != info->start ||
+					op->info.end != info->end ||
+					op->info.optype != info->optype);
+				break;
+			}
+		}
+	}
+
+	return op;
+}
+
 /* a write copies in one plock result that should match a plock_op
    on the recv list */
 static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 			 loff_t *ppos)
 {
-	struct plock_op *op = NULL, *iter;
 	struct dlm_plock_info info;
-	int do_callback = 0;
+	struct plock_op *op;
 
 	if (count != sizeof(info))
 		return -EINVAL;
@@ -452,46 +496,31 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 		return -EINVAL;
 
 	spin_lock(&ops_lock);
-	if (info.wait) {
-		list_for_each_entry(iter, &recv_setlkw_list, list) {
-			if (iter->info.fsid == info.fsid &&
-			    iter->info.number == info.number &&
-			    iter->info.owner == info.owner &&
-			    iter->info.pid == info.pid &&
-			    iter->info.start == info.start &&
-			    iter->info.end == info.end) {
-				list_del_init(&iter->list);
-				memcpy(&iter->info, &info, sizeof(info));
-				if (iter->data)
-					do_callback = 1;
-				else
-					iter->done = 1;
-				op = iter;
-				break;
-			}
-		}
+	op = plock_op_lookup(&info);
+	if (!op) {
+		spin_unlock(&ops_lock);
+		pr_debug("%s: no op %x %llx", __func__,
+			 info.fsid, (unsigned long long)info.number);
+		return count;
+	}
+
+	list_del_init(&op->list);
+	/* update set new fields by user space e.g. F_GETLK */
+	memcpy(&op->info, &info, sizeof(info));
+
+	/* check for async handling */
+	if (op->data) {
+		spin_unlock(&ops_lock);
+		dlm_plock_callback(op);
 	} else {
-		op = list_first_entry_or_null(&recv_list, struct plock_op,
-					      list);
-		if (op) {
-			list_del_init(&op->list);
-			memcpy(&op->info, &info, sizeof(info));
-			if (op->data)
-				do_callback = 1;
-			else
-				op->done = 1;
-		}
+		/* must be set under ops_lock, because retry in setlkw_wait()
+		 * if -ERESTARTSYS.
+		 */
+		op->done = 1;
+		spin_unlock(&ops_lock);
+		wake_up(&recv_wq);
 	}
-	spin_unlock(&ops_lock);
 
-	if (op) {
-		if (do_callback)
-			dlm_plock_callback(op);
-		else
-			wake_up(&recv_wq);
-	} else
-		pr_debug("%s: no op %x %llx", __func__,
-			 info.fsid, (unsigned long long)info.number);
 	return count;
 }
 
-- 
2.31.1

