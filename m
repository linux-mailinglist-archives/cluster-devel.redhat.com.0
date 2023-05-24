Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6E970FC81
	for <lists+cluster-devel@lfdr.de>; Wed, 24 May 2023 19:19:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684948782;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ltO9dZ5AiLF3haPZ34Nb2+w/XQ2pYIxau65oUHJHBKw=;
	b=CyB258fGhxcpPd5rUkRtZiZzen1PqNNVq+jZnLVLPZtScQMh6lnGsQvKZVnjW/Iy1AIMbN
	Vdxe4WNW7voQl8LEuSLW4piX4WXdMbQ4nkMXIsl1LG5j+7qzkwS9EjopJin02m9iPMJVHQ
	2O1g1O3N0yx+yGV6sIE3Vs90+H85QDA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-BlYjEiupNx6h_xPc8YlJ5w-1; Wed, 24 May 2023 13:19:39 -0400
X-MC-Unique: BlYjEiupNx6h_xPc8YlJ5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30E1E101A597;
	Wed, 24 May 2023 17:19:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E4E7C090D9;
	Wed, 24 May 2023 17:19:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 579B419465B3;
	Wed, 24 May 2023 17:19:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BCC0119465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 24 May 2023 17:19:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AF72E2166B2B; Wed, 24 May 2023 17:19:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6750D2166B25;
 Wed, 24 May 2023 17:19:35 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 24 May 2023 13:19:32 -0400
Message-Id: <20230524171932.1132564-2-aahringo@redhat.com>
In-Reply-To: <20230524171932.1132564-1-aahringo@redhat.com>
References: <20230524171932.1132564-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
 fs/dlm/plock.c | 117 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 78 insertions(+), 39 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index d6ec70547b77..b2b6635fcb28 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -423,66 +423,105 @@ static ssize_t dev_read(struct file *file, char __user *u, size_t count,
 	return sizeof(info);
 }
 
-/* a write copies in one plock result that should match a plock_op
-   on the recv list */
-static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
-			 loff_t *ppos)
+static struct plock_op *plock_op_lookup(const struct dlm_plock_info *info)
 {
 	struct plock_op *op = NULL, *iter;
-	struct dlm_plock_info info;
-	int do_callback = 0;
-
-	if (count != sizeof(info))
-		return -EINVAL;
-
-	if (copy_from_user(&info, u, sizeof(info)))
-		return -EFAULT;
-
-	if (check_version(&info))
-		return -EINVAL;
 
-	spin_lock(&ops_lock);
-	if (info.wait) {
+	/* F_SETLKW does not have an order in recv_list */
+	if (info->wait) {
 		list_for_each_entry(iter, &recv_list, list) {
-			if (iter->info.fsid == info.fsid &&
-			    iter->info.number == info.number &&
-			    iter->info.owner == info.owner &&
-			    iter->info.pid == info.pid &&
-			    iter->info.start == info.start &&
-			    iter->info.end == info.end &&
-			    iter->info.ex == info.ex &&
+			if (iter->info.fsid == info->fsid &&
+			    iter->info.number == info->number &&
+			    iter->info.owner == info->owner &&
+			    iter->info.pid == info->pid &&
+			    iter->info.start == info->start &&
+			    iter->info.end == info->end &&
+			    iter->info.ex == info->ex &&
 			    iter->info.wait) {
 				op = iter;
+
+				/* sanity check should be DLM_PLOCK_OP_LOCK */
+				WARN_ON(op->info.optype != DLM_PLOCK_OP_LOCK);
 				break;
 			}
 		}
 	} else {
+		/* others than F_SETLKW have an order in recv_list we
+		 * need to jump over all F_SETLKW ops (info->wait) and match
+		 * the first one.
+		 */
 		list_for_each_entry(iter, &recv_list, list) {
 			if (!iter->info.wait) {
 				op = iter;
+
+				/* sanity check to check we got the right one */
+				WARN_ON(op->info.fsid != info->fsid ||
+					op->info.number != info->number ||
+					op->info.owner != info->owner ||
+					op->info.optype != info->optype);
+
+				switch (op->info.optype) {
+				case DLM_PLOCK_OP_GET:
+					break;
+				default:
+					WARN_ON(op->info.pid != info->pid ||
+						op->info.start != info->start ||
+						op->info.end != info->end ||
+						op->info.ex != info->ex);
+					break;
+				}
 				break;
 			}
 		}
 	}
 
-	if (op) {
-		list_del_init(&op->list);
-		memcpy(&op->info, &info, sizeof(info));
-		if (op->data)
-			do_callback = 1;
-		else
-			op->done = 1;
-	}
-	spin_unlock(&ops_lock);
+	return op;
+}
 
-	if (op) {
-		if (do_callback)
-			dlm_plock_callback(op);
-		else
-			wake_up(&recv_wq);
-	} else
+/* a write copies in one plock result that should match a plock_op
+ * on the recv list
+ */
+static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
+			 loff_t *ppos)
+{
+	struct dlm_plock_info info;
+	struct plock_op *op;
+
+	if (count != sizeof(info))
+		return -EINVAL;
+
+	if (copy_from_user(&info, u, sizeof(info)))
+		return -EFAULT;
+
+	if (check_version(&info))
+		return -EINVAL;
+
+	spin_lock(&ops_lock);
+	op = plock_op_lookup(&info);
+	if (!op) {
+		spin_unlock(&ops_lock);
 		pr_debug("%s: no op %x %llx", __func__,
 			 info.fsid, (unsigned long long)info.number);
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
+	} else {
+		/* must be set under ops_lock, because retry in setlkw_wait()
+		 * if -ERESTARTSYS.
+		 */
+		op->done = 1;
+		spin_unlock(&ops_lock);
+		wake_up(&recv_wq);
+	}
+
 	return count;
 }
 
-- 
2.31.1

