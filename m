Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C55A5805C9
	for <lists+cluster-devel@lfdr.de>; Mon, 25 Jul 2022 22:38:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658781531;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1RKIBtu0FOweCY92vvZDLfDpbPY3XDlSi5UZ3Y5Tv6s=;
	b=MEOUMdNZi0fwTse7TyB/xLwfSUGV3YC/HB3d9NTTB/8VL3BlQISwgRqPEzMnpfCOC0XE8Z
	CVgUeh2JyAnn87cvrvWIWVAiaZzwSXEh4deF9HUBYhGbbk5aQaT5ZiajN/NI5zOBAuFpyC
	nOtr9TrgD28GmPE6ice1U4yZz8I4JFU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-5nVwUAxIMsi_KF0f0h9FBw-1; Mon, 25 Jul 2022 16:38:47 -0400
X-MC-Unique: 5nVwUAxIMsi_KF0f0h9FBw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95FB73C0D188;
	Mon, 25 Jul 2022 20:38:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8AE0D492CA2;
	Mon, 25 Jul 2022 20:38:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DCC111945D93;
	Mon, 25 Jul 2022 20:38:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7DF801945D86 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 25 Jul 2022 20:38:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6148940D2969; Mon, 25 Jul 2022 20:38:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 238ED40D282F;
 Mon, 25 Jul 2022 20:38:45 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 25 Jul 2022 16:38:33 -0400
Message-Id: <20220725203835.860277-4-aahringo@redhat.com>
In-Reply-To: <20220725203835.860277-1-aahringo@redhat.com>
References: <20220725203835.860277-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm/next 3/5] fs: dlm: trace user space
 callbacks
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
Cc: linux-raid@vger.kernel.org, joseph.qi@linux.alibaba.com, mark@fasheh.com,
 cluster-devel@redhat.com, song@kernel.org, jlbec@evilplan.org,
 ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds trace callbacks for user locks. Unfortenately user locks
are handled in a different way than kernel locks in some cases. User
locks never call the dlm_lock()/dlm_unlock() kernel API and use the next
step internal API of dlm. Adding those traces from user API callers
should make it possible for dlm trace system to see lock handling for
user locks as well.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c              | 24 ++++++++++++++++++++----
 fs/dlm/user.c              |  7 ++++++-
 include/trace/events/dlm.h | 23 +++++++++++++----------
 3 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 4c7ed4bec3f4..44c85930211d 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -3462,7 +3462,7 @@ int dlm_lock(dlm_lockspace_t *lockspace,
 	if (error == -EINPROGRESS)
 		error = 0;
  out_put:
-	trace_dlm_lock_end(ls, lkb, name, namelen, mode, flags, error);
+	trace_dlm_lock_end(ls, lkb, name, namelen, mode, flags, error, true);
 
 	if (convert || error)
 		__put_lkb(ls, lkb);
@@ -5835,13 +5835,15 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 		goto out;
 	}
 
+	trace_dlm_lock_start(ls, lkb, name, namelen, mode, flags);
+
 	if (flags & DLM_LKF_VALBLK) {
 		ua->lksb.sb_lvbptr = kzalloc(DLM_USER_LVB_LEN, GFP_NOFS);
 		if (!ua->lksb.sb_lvbptr) {
 			kfree(ua);
 			__put_lkb(ls, lkb);
 			error = -ENOMEM;
-			goto out;
+			goto out_trace_end;
 		}
 	}
 #ifdef CONFIG_DLM_DEPRECATED_API
@@ -5856,7 +5858,7 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 		ua->lksb.sb_lvbptr = NULL;
 		kfree(ua);
 		__put_lkb(ls, lkb);
-		goto out;
+		goto out_trace_end;
 	}
 
 	/* After ua is attached to lkb it will be freed by dlm_free_lkb().
@@ -5876,7 +5878,7 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 		fallthrough;
 	default:
 		__put_lkb(ls, lkb);
-		goto out;
+		goto out_trace_end;
 	}
 
 	/* add this new lkb to the per-process list of locks */
@@ -5884,6 +5886,8 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 	hold_lkb(lkb);
 	list_add_tail(&lkb->lkb_ownqueue, &ua->proc->locks);
 	spin_unlock(&ua->proc->locks_spin);
+ out_trace_end:
+	trace_dlm_lock_end(ls, lkb, name, namelen, mode, flags, error, false);
  out:
 	dlm_unlock_recovery(ls);
 	return error;
@@ -5909,6 +5913,8 @@ int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	if (error)
 		goto out;
 
+	trace_dlm_lock_start(ls, lkb, NULL, 0, mode, flags);
+
 	/* user can change the params on its lock when it converts it, or
 	   add an lvb that didn't exist before */
 
@@ -5946,6 +5952,7 @@ int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	if (error == -EINPROGRESS || error == -EAGAIN || error == -EDEADLK)
 		error = 0;
  out_put:
+	trace_dlm_lock_end(ls, lkb, NULL, 0, mode, flags, error, false);
 	dlm_put_lkb(lkb);
  out:
 	dlm_unlock_recovery(ls);
@@ -6038,6 +6045,8 @@ int dlm_user_unlock(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	if (error)
 		goto out;
 
+	trace_dlm_unlock_start(ls, lkb, flags);
+
 	ua = lkb->lkb_ua;
 
 	if (lvb_in && ua->lksb.sb_lvbptr)
@@ -6066,6 +6075,7 @@ int dlm_user_unlock(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 		list_move(&lkb->lkb_ownqueue, &ua->proc->unlocking);
 	spin_unlock(&ua->proc->locks_spin);
  out_put:
+	trace_dlm_unlock_end(ls, lkb, flags, error);
 	dlm_put_lkb(lkb);
  out:
 	dlm_unlock_recovery(ls);
@@ -6087,6 +6097,8 @@ int dlm_user_cancel(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	if (error)
 		goto out;
 
+	trace_dlm_unlock_start(ls, lkb, flags);
+
 	ua = lkb->lkb_ua;
 	if (ua_tmp->castparam)
 		ua->castparam = ua_tmp->castparam;
@@ -6104,6 +6116,7 @@ int dlm_user_cancel(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	if (error == -EBUSY)
 		error = 0;
  out_put:
+	trace_dlm_unlock_end(ls, lkb, flags, error);
 	dlm_put_lkb(lkb);
  out:
 	dlm_unlock_recovery(ls);
@@ -6125,6 +6138,8 @@ int dlm_user_deadlock(struct dlm_ls *ls, uint32_t flags, uint32_t lkid)
 	if (error)
 		goto out;
 
+	trace_dlm_unlock_start(ls, lkb, flags);
+
 	ua = lkb->lkb_ua;
 
 	error = set_unlock_args(flags, ua, &args);
@@ -6153,6 +6168,7 @@ int dlm_user_deadlock(struct dlm_ls *ls, uint32_t flags, uint32_t lkid)
 	if (error == -EBUSY)
 		error = 0;
  out_put:
+	trace_dlm_unlock_end(ls, lkb, flags, error);
 	dlm_put_lkb(lkb);
  out:
 	dlm_unlock_recovery(ls);
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index c6d38a06e94c..792a3efb8d60 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -16,6 +16,8 @@
 #include <linux/slab.h>
 #include <linux/sched/signal.h>
 
+#include <trace/events/dlm.h>
+
 #include "dlm_internal.h"
 #include "lockspace.h"
 #include "lock.h"
@@ -882,7 +884,9 @@ static ssize_t device_read(struct file *file, char __user *buf, size_t count,
 		goto try_another;
 	}
 
-	if (cb.flags & DLM_CB_CAST) {
+	if (cb.flags & DLM_CB_BAST) {
+		trace_dlm_bast(lkb->lkb_resource->res_ls, lkb, cb.mode);
+	} else if (cb.flags & DLM_CB_CAST) {
 		new_mode = cb.mode;
 
 		if (!cb.sb_status && lkb->lkb_lksb->sb_lvbptr &&
@@ -891,6 +895,7 @@ static ssize_t device_read(struct file *file, char __user *buf, size_t count,
 
 		lkb->lkb_lksb->sb_status = cb.sb_status;
 		lkb->lkb_lksb->sb_flags = cb.sb_flags;
+		trace_dlm_ast(lkb->lkb_resource->res_ls, lkb);
 	}
 
 	rv = copy_result_to_user(lkb->lkb_ua,
diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
index bad21222130e..92d263aab848 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -92,9 +92,10 @@ TRACE_EVENT(dlm_lock_start,
 TRACE_EVENT(dlm_lock_end,
 
 	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, void *name,
-		 unsigned int namelen, int mode, __u32 flags, int error),
+		 unsigned int namelen, int mode, __u32 flags, int error,
+		 bool kernel_lock),
 
-	TP_ARGS(ls, lkb, name, namelen, mode, flags, error),
+	TP_ARGS(ls, lkb, name, namelen, mode, flags, error, kernel_lock),
 
 	TP_STRUCT__entry(
 		__field(__u32, ls_id)
@@ -122,14 +123,16 @@ TRACE_EVENT(dlm_lock_end,
 			memcpy(__get_dynamic_array(res_name), name,
 			       __get_dynamic_array_len(res_name));
 
-		/* return value will be zeroed in those cases by dlm_lock()
-		 * we do it here again to not introduce more overhead if
-		 * trace isn't running and error reflects the return value.
-		 */
-		if (error == -EAGAIN || error == -EDEADLK)
-			__entry->error = 0;
-		else
-			__entry->error = error;
+		if (kernel_lock) {
+			/* return value will be zeroed in those cases by dlm_lock()
+			 * we do it here again to not introduce more overhead if
+			 * trace isn't running and error reflects the return value.
+			 */
+			if (error == -EAGAIN || error == -EDEADLK)
+				__entry->error = 0;
+			else
+				__entry->error = error;
+		}
 
 	),
 
-- 
2.31.1

