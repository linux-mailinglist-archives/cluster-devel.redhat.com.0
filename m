Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2021D75842A
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Jul 2023 20:07:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689703668;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d9KMuHrGKjvNO0DeAr8h3Iy4FK2oCMn21nuOn9B2iKA=;
	b=WNiwGZmf/ZYUzbY2APv6kJbVHQNzwoEcFJlM60bbU/4/Y0UnImXwOPaCGfWNAs5oCqxyw1
	YK0IuFmA3liNXtevsNAbf6Lff7aCt0sScZkpwEVatNSZfC7P06OESiHIEFQYUSZ8mYla9e
	j9ElIj0jx0HIE1mdYcG3rZ6QP7ojJAE=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-oRZswfXjNeSVa0QFrAcxLQ-1; Tue, 18 Jul 2023 14:07:44 -0400
X-MC-Unique: oRZswfXjNeSVa0QFrAcxLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5236A3C11A02;
	Tue, 18 Jul 2023 18:07:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86F4B2166B25;
	Tue, 18 Jul 2023 18:07:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8D52C19465B2;
	Tue, 18 Jul 2023 18:07:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1F8D51946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 18 Jul 2023 18:07:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B5041207B315; Tue, 18 Jul 2023 18:07:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73306200BA8B;
 Tue, 18 Jul 2023 18:07:29 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 18 Jul 2023 14:07:20 -0400
Message-Id: <20230718180721.745569-3-aahringo@redhat.com>
In-Reply-To: <20230718180721.745569-1-aahringo@redhat.com>
References: <20230718180721.745569-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCHv3 v6.5-rc2 2/3] fs: dlm: allow to F_SETLKW
 getting interrupted
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
Cc: ocfs2-devel@lists.linux.dev, mark@fasheh.com, cluster-devel@redhat.com,
 joseph.qi@linux.alibaba.com, jlbec@evilplan.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch implements dlm plock F_SETLKW interruption feature. If a
blocking posix lock request got interrupted in user space by a signal a
cancellation request for a non granted lock request to the user space
lock manager will be send. The user lock manager answers either with
zero or a negative errno code. A errno of -ENOENT signals that there is
currently no blocking lock request waiting to being granted. In case of
-ENOENT it was probably to late to request a cancellation and the
pending lock got granted. In any error case we will wait until the lock
is being granted as cancellation failed, this causes also that in case
of an older user lock manager returning -EINVAL we will wait as
cancellation is not supported which should be fine. If a user requires
this feature the user should update dlm user space to support lock
request cancellation.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c                 | 56 ++++++++++++++++++++++------------
 include/uapi/linux/dlm_plock.h |  1 +
 2 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index a34f605d8505..a8ffa0760913 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -74,30 +74,26 @@ static void send_op(struct plock_op *op)
 	wake_up(&send_wq);
 }
 
-/* If a process was killed while waiting for the only plock on a file,
-   locks_remove_posix will not see any lock on the file so it won't
-   send an unlock-close to us to pass on to userspace to clean up the
-   abandoned waiter.  So, we have to insert the unlock-close when the
-   lock call is interrupted. */
-
-static void do_unlock_close(const struct dlm_plock_info *info)
+static int do_lock_cancel(const struct dlm_plock_info *orig_info)
 {
 	struct plock_op *op;
+	int rv;
 
 	op = kzalloc(sizeof(*op), GFP_NOFS);
 	if (!op)
-		return;
+		return -ENOMEM;
+
+	op->info = *orig_info;
+	op->info.optype = DLM_PLOCK_OP_CANCEL;
+	op->info.wait = 0;
 
-	op->info.optype		= DLM_PLOCK_OP_UNLOCK;
-	op->info.pid		= info->pid;
-	op->info.fsid		= info->fsid;
-	op->info.number		= info->number;
-	op->info.start		= 0;
-	op->info.end		= OFFSET_MAX;
-	op->info.owner		= info->owner;
-
-	op->info.flags |= DLM_PLOCK_FL_CLOSE;
 	send_op(op);
+	wait_event(recv_wq, (op->done != 0));
+
+	rv = op->info.rv;
+
+	dlm_release_plock_op(op);
+	return rv;
 }
 
 int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
@@ -156,7 +152,7 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 	send_op(op);
 
 	if (op->info.wait) {
-		rv = wait_event_killable(recv_wq, (op->done != 0));
+		rv = wait_event_interruptible(recv_wq, (op->done != 0));
 		if (rv == -ERESTARTSYS) {
 			spin_lock(&ops_lock);
 			/* recheck under ops_lock if we got a done != 0,
@@ -166,17 +162,37 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 				spin_unlock(&ops_lock);
 				goto do_lock_wait;
 			}
-			list_del(&op->list);
 			spin_unlock(&ops_lock);
 
+			rv = do_lock_cancel(&op->info);
+			switch (rv) {
+			case 0:
+				/* waiter was deleted in user space, answer will never come
+				 * remove original request. The original request must be
+				 * on recv_list because the answer of do_lock_cancel()
+				 * synchronized it.
+				 */
+				spin_lock(&ops_lock);
+				list_del(&op->list);
+				spin_unlock(&ops_lock);
+				rv = -EINTR;
+				break;
+			case -ENOENT:
+				/* cancellation wasn't successful but op should be done */
+				fallthrough;
+			default:
+				/* internal error doing cancel we need to wait */
+				goto wait;
+			}
+
 			log_debug(ls, "%s: wait interrupted %x %llx pid %d",
 				  __func__, ls->ls_global_id,
 				  (unsigned long long)number, op->info.pid);
-			do_unlock_close(&op->info);
 			dlm_release_plock_op(op);
 			goto out;
 		}
 	} else {
+wait:
 		wait_event(recv_wq, (op->done != 0));
 	}
 
diff --git a/include/uapi/linux/dlm_plock.h b/include/uapi/linux/dlm_plock.h
index 63b6c1fd9169..eb66afcac40e 100644
--- a/include/uapi/linux/dlm_plock.h
+++ b/include/uapi/linux/dlm_plock.h
@@ -22,6 +22,7 @@ enum {
 	DLM_PLOCK_OP_LOCK = 1,
 	DLM_PLOCK_OP_UNLOCK,
 	DLM_PLOCK_OP_GET,
+	DLM_PLOCK_OP_CANCEL,
 };
 
 #define DLM_PLOCK_FL_CLOSE 1
-- 
2.31.1

