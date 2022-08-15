Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E3E593A7F
	for <lists+cluster-devel@lfdr.de>; Mon, 15 Aug 2022 21:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660592621;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0ztMMmVyEo94ZGCVdrQofzK1Sk/YuZ5XygRfS9Bjm9A=;
	b=N6XKEjV92Lcu6mVS41EXzfXpJpnXNfMQwJ0V5O/yZ+ldrStRXDqkrQDRyfN9KaVqfyPeFx
	l3sH/1D1+KHpGEBy9nvxEqMx1wvDpTtt3RrfN3tWb+Dy1/xCS32DvCIHZiM+0AMvfGaaK4
	qkvsx3K1lvyXed87kKw1pMy7rNdeQdg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-BPT7TH0tMXOnvP0Rj6mtHQ-1; Mon, 15 Aug 2022 15:43:37 -0400
X-MC-Unique: BPT7TH0tMXOnvP0Rj6mtHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46D3D3C01C0E;
	Mon, 15 Aug 2022 19:43:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A189140EBE3;
	Mon, 15 Aug 2022 19:43:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DE89E1940351;
	Mon, 15 Aug 2022 19:43:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C9A331940353 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 15 Aug 2022 19:43:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 850891121320; Mon, 15 Aug 2022 19:43:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D2EB112131E;
 Mon, 15 Aug 2022 19:43:31 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 15 Aug 2022 15:43:24 -0400
Message-Id: <20220815194328.2208580-13-aahringo@redhat.com>
In-Reply-To: <20220815194328.2208580-1-aahringo@redhat.com>
References: <20220815194328.2208580-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [RESEND dlm/next 12/16] fs: dlm: trace user space
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
 include/trace/events/dlm.h | 22 ++++++++++++----------
 3 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 65a7a0631ec8..cef25f8ac82e 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -3466,7 +3466,7 @@ int dlm_lock(dlm_lockspace_t *lockspace,
 	if (error == -EINPROGRESS)
 		error = 0;
  out_put:
-	trace_dlm_lock_end(ls, lkb, name, namelen, mode, flags, error);
+	trace_dlm_lock_end(ls, lkb, name, namelen, mode, flags, error, true);
 
 	if (convert || error)
 		__put_lkb(ls, lkb);
@@ -5842,13 +5842,15 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
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
@@ -5863,7 +5865,7 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 		ua->lksb.sb_lvbptr = NULL;
 		kfree(ua);
 		__put_lkb(ls, lkb);
-		goto out;
+		goto out_trace_end;
 	}
 
 	/* After ua is attached to lkb it will be freed by dlm_free_lkb().
@@ -5883,7 +5885,7 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 		fallthrough;
 	default:
 		__put_lkb(ls, lkb);
-		goto out;
+		goto out_trace_end;
 	}
 
 	/* add this new lkb to the per-process list of locks */
@@ -5891,6 +5893,8 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 	hold_lkb(lkb);
 	list_add_tail(&lkb->lkb_ownqueue, &ua->proc->locks);
 	spin_unlock(&ua->proc->locks_spin);
+ out_trace_end:
+	trace_dlm_lock_end(ls, lkb, name, namelen, mode, flags, error, false);
  out:
 	dlm_unlock_recovery(ls);
 	return error;
@@ -5916,6 +5920,8 @@ int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	if (error)
 		goto out;
 
+	trace_dlm_lock_start(ls, lkb, NULL, 0, mode, flags);
+
 	/* user can change the params on its lock when it converts it, or
 	   add an lvb that didn't exist before */
 
@@ -5953,6 +5959,7 @@ int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	if (error == -EINPROGRESS || error == -EAGAIN || error == -EDEADLK)
 		error = 0;
  out_put:
+	trace_dlm_lock_end(ls, lkb, NULL, 0, mode, flags, error, false);
 	dlm_put_lkb(lkb);
  out:
 	dlm_unlock_recovery(ls);
@@ -6045,6 +6052,8 @@ int dlm_user_unlock(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	if (error)
 		goto out;
 
+	trace_dlm_unlock_start(ls, lkb, flags);
+
 	ua = lkb->lkb_ua;
 
 	if (lvb_in && ua->lksb.sb_lvbptr)
@@ -6073,6 +6082,7 @@ int dlm_user_unlock(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 		list_move(&lkb->lkb_ownqueue, &ua->proc->unlocking);
 	spin_unlock(&ua->proc->locks_spin);
  out_put:
+	trace_dlm_unlock_end(ls, lkb, flags, error);
 	dlm_put_lkb(lkb);
  out:
 	dlm_unlock_recovery(ls);
@@ -6094,6 +6104,8 @@ int dlm_user_cancel(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	if (error)
 		goto out;
 
+	trace_dlm_unlock_start(ls, lkb, flags);
+
 	ua = lkb->lkb_ua;
 	if (ua_tmp->castparam)
 		ua->castparam = ua_tmp->castparam;
@@ -6111,6 +6123,7 @@ int dlm_user_cancel(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	if (error == -EBUSY)
 		error = 0;
  out_put:
+	trace_dlm_unlock_end(ls, lkb, flags, error);
 	dlm_put_lkb(lkb);
  out:
 	dlm_unlock_recovery(ls);
@@ -6132,6 +6145,8 @@ int dlm_user_deadlock(struct dlm_ls *ls, uint32_t flags, uint32_t lkid)
 	if (error)
 		goto out;
 
+	trace_dlm_unlock_start(ls, lkb, flags);
+
 	ua = lkb->lkb_ua;
 
 	error = set_unlock_args(flags, ua, &args);
@@ -6160,6 +6175,7 @@ int dlm_user_deadlock(struct dlm_ls *ls, uint32_t flags, uint32_t lkid)
 	if (error == -EBUSY)
 		error = 0;
  out_put:
+	trace_dlm_unlock_end(ls, lkb, flags, error);
 	dlm_put_lkb(lkb);
  out:
 	dlm_unlock_recovery(ls);
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index df6215c73239..ca27f276a3f5 100644
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
index bad21222130e..18575206295f 100644
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
@@ -113,6 +114,7 @@ TRACE_EVENT(dlm_lock_end,
 		__entry->lkb_id = lkb->lkb_id;
 		__entry->mode = mode;
 		__entry->flags = flags;
+		__entry->error = error;
 
 		r = lkb->lkb_resource;
 		if (r)
@@ -122,14 +124,14 @@ TRACE_EVENT(dlm_lock_end,
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
+		}
 
 	),
 
-- 
2.31.1

