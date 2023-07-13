Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EF95F75255A
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Jul 2023 16:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689259276;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hQx1HCdN3vWpRnuecu66mt4M6OauanxpE7AnobbO0Fw=;
	b=Z2ZHaj2uu8GF+Es5koi6O17GkMUL7h0OS0N6DtAm5Jyu3HxqWUXt1sPUYHmV09RnXf4rXq
	QMiDRBAfdiNU1u4bOLSuBbQpSgc4kIdksg9l/pB8SPMv54qclIS0NqZ/nfifTN7Jwimuwj
	+w4TfSd9ocvdOnE4esxvfzTm/KLBtM8=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-z3I-wDE0P263pA9ZPMbwFw-1; Thu, 13 Jul 2023 10:41:12 -0400
X-MC-Unique: z3I-wDE0P263pA9ZPMbwFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 765923844FDC;
	Thu, 13 Jul 2023 14:40:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2209A111E3EA;
	Thu, 13 Jul 2023 14:40:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D212B19465A0;
	Thu, 13 Jul 2023 14:40:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3242F1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Jul 2023 14:40:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 152F44CD0C6; Thu, 13 Jul 2023 14:40:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D96374CD0CD;
 Thu, 13 Jul 2023 14:40:47 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 13 Jul 2023 10:40:29 -0400
Message-Id: <20230713144029.3342637-2-aahringo@redhat.com>
In-Reply-To: <20230713144029.3342637-1-aahringo@redhat.com>
References: <20230713144029.3342637-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH v6.5-rc1 2/2] fs: dlm: allow to F_SETLKW
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch implements dlm plock F_SETLKW interruption feature. If the
pending plock operation is not sent to user space yet it can simple be
dropped out of the send_list. In case it's already being sent we need to
try to remove the waiters in dlm user space tool. If it was successful a
reply with DLM_PLOCK_OP_CANCEL optype instead of DLM_PLOCK_OP_LOCK comes
back (flag DLM_PLOCK_FL_NO_REPLY was then being cleared in user space)
to signal the cancellation was successful. If a result with optype
DLM_PLOCK_OP_LOCK came back then the cancellation was not successful.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c                 | 91 ++++++++++++++++++++++++----------
 include/uapi/linux/dlm_plock.h |  1 +
 2 files changed, 66 insertions(+), 26 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 7fe9f4b922d3..5faa428fff1a 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -29,6 +29,9 @@ struct plock_async_data {
 
 struct plock_op {
 	struct list_head list;
+#define DLM_PLOCK_OP_FLAG_SENT		0
+#define DLM_PLOCK_OP_FLAG_INTERRUPTED	1
+	unsigned long flags;
 	int done;
 	struct dlm_plock_info info;
 	/* if set indicates async handling */
@@ -74,30 +77,25 @@ static void send_op(struct plock_op *op)
 	wake_up(&send_wq);
 }
 
-/* If a process was killed while waiting for the only plock on a file,
-   locks_remove_posix will not see any lock on the file so it won't
-   send an unlock-close to us to pass on to userspace to clean up the
-   abandoned waiter.  So, we have to insert the unlock-close when the
-   lock call is interrupted. */
-
-static void do_unlock_close(const struct dlm_plock_info *info)
+static int do_lock_cancel(const struct plock_op *orig_op)
 {
 	struct plock_op *op;
 
 	op = kzalloc(sizeof(*op), GFP_NOFS);
 	if (!op)
-		return;
+		return -ENOMEM;
+
+	op->info = orig_op->info;
+	op->info.optype = DLM_PLOCK_OP_CANCEL;
+	op->info.flags = DLM_PLOCK_FL_NO_REPLY;
 
-	op->info.optype		= DLM_PLOCK_OP_UNLOCK;
-	op->info.pid		= info->pid;
-	op->info.fsid		= info->fsid;
-	op->info.number		= info->number;
-	op->info.start		= 0;
-	op->info.end		= OFFSET_MAX;
-	op->info.owner		= info->owner;
-
-	op->info.flags |= (DLM_PLOCK_FL_CLOSE | DLM_PLOCK_FL_NO_REPLY);
 	send_op(op);
+	wait_event(recv_wq, (orig_op->done != 0));
+
+	if (orig_op->info.optype == DLM_PLOCK_OP_CANCEL)
+		return 0;
+
+	return 1;
 }
 
 int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
@@ -156,7 +154,7 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 	send_op(op);
 
 	if (op->info.wait) {
-		rv = wait_event_killable(recv_wq, (op->done != 0));
+		rv = wait_event_interruptible(recv_wq, (op->done != 0));
 		if (rv == -ERESTARTSYS) {
 			spin_lock(&ops_lock);
 			/* recheck under ops_lock if we got a done != 0,
@@ -166,17 +164,37 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 				spin_unlock(&ops_lock);
 				goto do_lock_wait;
 			}
-			list_del(&op->list);
-			spin_unlock(&ops_lock);
+
+			if (!test_bit(DLM_PLOCK_OP_FLAG_SENT, &op->flags)) {
+				/* part of send_list, user never saw the op */
+				list_del(&op->list);
+				spin_unlock(&ops_lock);
+				rv = -EINTR;
+			} else {
+				set_bit(DLM_PLOCK_OP_FLAG_INTERRUPTED, &op->flags);
+				spin_unlock(&ops_lock);
+				rv = do_lock_cancel(op);
+				switch (rv) {
+				case 0:
+					rv = -EINTR;
+					break;
+				case 1:
+					/* cancellation wasn't successful but op is done */
+					goto do_lock_wait;
+				default:
+					/* internal error doing cancel we need to wait */
+					goto wait;
+				}
+			}
 
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
 
@@ -392,10 +410,12 @@ static ssize_t dev_read(struct file *file, char __user *u, size_t count,
 	spin_lock(&ops_lock);
 	if (!list_empty(&send_list)) {
 		op = list_first_entry(&send_list, struct plock_op, list);
-		if (op->info.flags & DLM_PLOCK_FL_NO_REPLY)
+		if (op->info.flags & DLM_PLOCK_FL_NO_REPLY) {
 			list_del(&op->list);
-		else
+		} else {
 			list_move_tail(&op->list, &recv_list);
+			set_bit(DLM_PLOCK_OP_FLAG_SENT, &op->flags);
+		}
 		memcpy(&info, &op->info, sizeof(info));
 	}
 	spin_unlock(&ops_lock);
@@ -457,6 +477,27 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 	spin_lock(&ops_lock);
 	if (info.wait) {
 		list_for_each_entry(iter, &recv_list, list) {
+			/* A very specific posix lock case allows two
+			 * lock request with the same meaning by using
+			 * threads. It makes no sense from the application
+			 * to do such request, however it is possible.
+			 * We need to check the state for cancellation because
+			 * we need to know the instance which is interrupted
+			 * if two or more of the "same" lock requests are
+			 * in waiting state and got interrupted.
+			 *
+			 * TODO we should move to a instance reference from
+			 * request and reply and not go over lock states, but
+			 * it seems going over lock states and get the instance
+			 * does not make any problems (at least there were no
+			 * issues found yet) but it's much cleaner to not think
+			 * about all possible special cases and states to instance
+			 * has no 1:1 mapping anymore.
+			 */
+			if (info.optype == DLM_PLOCK_OP_CANCEL &&
+			    !test_bit(DLM_PLOCK_OP_FLAG_INTERRUPTED, &iter->flags))
+				continue;
+
 			if (iter->info.fsid == info.fsid &&
 			    iter->info.number == info.number &&
 			    iter->info.owner == info.owner &&
@@ -480,9 +521,7 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 
 	if (op) {
 		/* Sanity check that op and info match. */
-		if (info.wait)
-			WARN_ON(op->info.optype != DLM_PLOCK_OP_LOCK);
-		else
+		if (!info.wait)
 			WARN_ON(op->info.fsid != info.fsid ||
 				op->info.number != info.number ||
 				op->info.owner != info.owner ||
diff --git a/include/uapi/linux/dlm_plock.h b/include/uapi/linux/dlm_plock.h
index 8dfa272c929a..9c4c083c824a 100644
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

