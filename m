Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEA2535450
	for <lists+cluster-devel@lfdr.de>; Thu, 26 May 2022 22:16:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653596160;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=96tvGBSzk5QVfkC/+ZU9Yjmte+olira1SYlYvOMd1Nc=;
	b=V41pyGM19k6SUWzDqe3EyaAvs4c9x0ZKVO4ImeE3M7PycgDcyH11PtYthnA/aH1GsynGi0
	rVGtAysOFsynm9XDssD5d2lITPbCDxZ7yKI+5ccGO4X5FinF1Z3zIiB+8mqDTmGbs2GM+6
	j8ViSuFNLKjFwl2rLlL5cR/ylgf6nP0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-Qo9dOJlkPI21CfQRXDbCzA-1; Thu, 26 May 2022 16:15:57 -0400
X-MC-Unique: Qo9dOJlkPI21CfQRXDbCzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 863968041A0;
	Thu, 26 May 2022 20:15:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A2611415101;
	Thu, 26 May 2022 20:15:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E99D7192B8D8;
	Thu, 26 May 2022 20:15:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 49BD21932129 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 26 May 2022 20:15:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3EB30416379; Thu, 26 May 2022 20:15:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21E49401E23;
 Thu, 26 May 2022 20:15:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 26 May 2022 16:15:32 -0400
Message-Id: <20220526201532.463135-6-aahringo@redhat.com>
In-Reply-To: <20220526201532.463135-1-aahringo@redhat.com>
References: <20220526201532.463135-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm/next 6/6] fs: dlm: change posix lock
 sigint handling
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will change the handling if a plock operation was interrupted
while waiting for a user space reply (probably dlm_controld). This is
not while the posix lock waits in lock blocking state which is done by
locks_lock_file_wait(). However the lock operation should be always
interruptible, doesn't matter which wait is currently blocking the
process.

If an interruption due waiting on a user space reply occurs the current
behaviour is that we remove the already transmitted operation request to
the user space from an list which is used to make a lookup if a reply
comes back. This has as side effect that we see some:

dev_write no op...

in the kernel log because the lookup failed. This is easily reproducible
by running:

stress-ng --fcntl 100

and hitting strg-c afterwards.

Instead of removing the op from the lookup list, we wait until the
operation is completed. When the operation was completed we check if the
wait was interrupted, if so we don't handle the request anymore and
cleanup the original lock request. When there are still "dev_write no op"
messages around it signals an issue that we removed an op while is hasn't
been completed yet. This situation should never happen.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index cf7bba461bfd..737f185aad8d 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -29,6 +29,8 @@ struct plock_async_data {
 struct plock_op {
 	struct list_head list;
 	int done;
+	/* if lock op got interrupted while waiting dlm_controld reply */
+	bool sigint;
 	struct dlm_plock_info info;
 	/* if set indicates async handling */
 	struct plock_async_data *data;
@@ -157,16 +159,24 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 	rv = wait_event_interruptible(recv_wq, (op->done != 0));
 	if (rv == -ERESTARTSYS) {
 		spin_lock(&ops_lock);
-		list_del(&op->list);
+		/* recheck under ops_lock if we got a done != 0,
+		 * if so this interrupt case should be ignored
+		 */
+		if (op->done != 0) {
+			spin_unlock(&ops_lock);
+			goto do_lock_wait;
+		}
+
+		op->sigint = true;
 		spin_unlock(&ops_lock);
 		log_debug(ls, "%s: wait interrupted %x %llx pid %d",
 			  __func__, ls->ls_global_id,
 			  (unsigned long long)number, op->info.pid);
-		dlm_release_plock_op(op);
-		do_unlock_close(&op->info);
 		goto out;
 	}
 
+do_lock_wait:
+
 	WARN_ON(!list_empty(&op->list));
 
 	rv = op->info.rv;
@@ -421,6 +431,19 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 		if (iter->info.fsid == info.fsid &&
 		    iter->info.number == info.number &&
 		    iter->info.owner == info.owner) {
+			if (iter->sigint) {
+				list_del(&iter->list);
+				spin_unlock(&ops_lock);
+
+				pr_debug("%s: sigint cleanup %x %llx pid %d",
+					  __func__, iter->info.fsid,
+					  (unsigned long long)iter->info.number,
+					  iter->info.pid);
+				do_unlock_close(&iter->info);
+				memcpy(&iter->info, &info, sizeof(info));
+				dlm_release_plock_op(iter);
+				return count;
+			}
 			list_del_init(&iter->list);
 			memcpy(&iter->info, &info, sizeof(info));
 			if (iter->data)
-- 
2.31.1

