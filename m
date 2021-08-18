Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8353F0CBB
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Aug 2021 22:27:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629318466;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1fUcZS5oM9I7y212e4YfoEzx9I6gR86uXC7eb+Y5WF8=;
	b=aSakdbs8yke+pTZmwMcLR816vaLPyo6P4jFkUVJIjjDgqPZkkssYIvrYIJG0dhMLIEt7QE
	vO92HW6ImcxQtmiopqJeesVa6hPnnGnLIPIDEptEi+VCxvdovJhVmYl/CKmL5QpGNTQzmD
	Uk3tKemtIhI9BqlTLf+YcaU9FNwL19w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-kntOX8ieNJSAr0AqtvPVmA-1; Wed, 18 Aug 2021 16:27:45 -0400
X-MC-Unique: kntOX8ieNJSAr0AqtvPVmA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0948787D544;
	Wed, 18 Aug 2021 20:27:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF38B61096;
	Wed, 18 Aug 2021 20:27:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D89BD4A7C8;
	Wed, 18 Aug 2021 20:27:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17IKRYnO011407 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 18 Aug 2021 16:27:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8012E5DA60; Wed, 18 Aug 2021 20:27:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3EA5C5D9C6;
	Wed, 18 Aug 2021 20:27:34 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 18 Aug 2021 16:27:15 -0400
Message-Id: <20210818202716.3094835-4-aahringo@redhat.com>
In-Reply-To: <20210818202716.3094835-1-aahringo@redhat.com>
References: <20210818202716.3094835-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND dlm/next 3/4] fs: dlm: initial
	support for tracepoints
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds initial support for dlm tracepoints. It will introduce
tracepoints to dlm main functionality dlm_lock()/dlm_unlock() and their
complete ast() callback or blocking bast() callback.

The lock/unlock functionality has a start and end tracepoint, this is
because there exists a race in case if would have a tracepoint at the
end position only the complete/blocking callbacks could occur before. To
work with eBPF tracing and using their lookup hash functionality there
could be problems that an entry was not inserted yet. However use the
start functionality for hash insert and check again in end functionality
if there was an dlm internal error so there is no ast callback. In further
it might also that locks with local masters will occur those callbacks
immediately so we must have such functionality.

I did not make everything accessible yet, although it seems eBPF can be
used to access a lot of internal datastructures if it's aware of the
struct definitions of the running kernel instance. We still can change
it, if you do eBPF experiments e.g. time measurements between lock and
callback functionality you can simple use the local lkb_id field as hash
value in combination with the lockspace id if you have multiple
lockspaces. Otherwise you can simple use trace-cmd for some functionality,
e.g. `trace-cmd record -e dlm` and `trace-cmd report` afterwards.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c               |   4 +
 fs/dlm/lock.c              |  10 ++
 fs/dlm/main.c              |   3 +
 include/trace/events/dlm.h | 212 +++++++++++++++++++++++++++++++++++++
 4 files changed, 229 insertions(+)
 create mode 100644 include/trace/events/dlm.h

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 283c7b94edda..0e7c6f6819ac 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -9,6 +9,8 @@
 *******************************************************************************
 ******************************************************************************/
 
+#include <trace/events/dlm.h>
+
 #include "dlm_internal.h"
 #include "lock.h"
 #include "user.h"
@@ -254,10 +256,12 @@ void dlm_callback_work(struct work_struct *work)
 			continue;
 		} else if (callbacks[i].flags & DLM_CB_BAST) {
 			bastfn(lkb->lkb_astparam, callbacks[i].mode);
+			trace_dlm_bast(ls, lkb, callbacks[i].mode);
 		} else if (callbacks[i].flags & DLM_CB_CAST) {
 			lkb->lkb_lksb->sb_status = callbacks[i].sb_status;
 			lkb->lkb_lksb->sb_flags = callbacks[i].sb_flags;
 			castfn(lkb->lkb_astparam);
+			trace_dlm_ast(ls, lkb, lkb->lkb_lksb);
 		}
 	}
 
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index c502c065d007..c9ac75a38ff8 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -53,6 +53,8 @@
                                    R: do_xxxx()
    L: receive_xxxx_reply()     <-  R: send_xxxx_reply()
 */
+#include <trace/events/dlm.h>
+
 #include <linux/types.h>
 #include <linux/rbtree.h>
 #include <linux/slab.h>
@@ -3437,6 +3439,8 @@ int dlm_lock(dlm_lockspace_t *lockspace,
 	if (error)
 		goto out;
 
+	trace_dlm_lock_start(ls, lkb, mode, flags);
+
 	error = set_lock_args(mode, lksb, flags, namelen, 0, ast,
 			      astarg, bast, &args);
 	if (error)
@@ -3454,6 +3458,8 @@ int dlm_lock(dlm_lockspace_t *lockspace,
 		__put_lkb(ls, lkb);
 	if (error == -EAGAIN || error == -EDEADLK)
 		error = 0;
+
+	trace_dlm_lock_end(ls, lkb, mode, flags, error);
  out:
 	dlm_unlock_recovery(ls);
 	dlm_put_lockspace(ls);
@@ -3481,6 +3487,8 @@ int dlm_unlock(dlm_lockspace_t *lockspace,
 	if (error)
 		goto out;
 
+	trace_dlm_unlock_start(ls, lkb, flags);
+
 	error = set_unlock_args(flags, astarg, &args);
 	if (error)
 		goto out_put;
@@ -3496,6 +3504,8 @@ int dlm_unlock(dlm_lockspace_t *lockspace,
 		error = 0;
  out_put:
 	dlm_put_lkb(lkb);
+
+	trace_dlm_unlock_end(ls, lkb, flags, error);
  out:
 	dlm_unlock_recovery(ls);
 	dlm_put_lockspace(ls);
diff --git a/fs/dlm/main.c b/fs/dlm/main.c
index afc66a1346d3..1c5be4b70ac1 100644
--- a/fs/dlm/main.c
+++ b/fs/dlm/main.c
@@ -19,6 +19,9 @@
 #include "config.h"
 #include "lowcomms.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/dlm.h>
+
 static int __init init_dlm(void)
 {
 	int error;
diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
new file mode 100644
index 000000000000..ad21d1759dd4
--- /dev/null
+++ b/include/trace/events/dlm.h
@@ -0,0 +1,212 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM dlm
+
+#if !defined(_TRACE_DLM_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_DLM_H
+
+#include <linux/dlm.h>
+#include <linux/dlmconstants.h>
+#include <linux/tracepoint.h>
+
+#include "../../../fs/dlm/dlm_internal.h"
+
+#define show_lock_flags(flags) __print_flags(flags, "|",	\
+	{ DLM_LKF_NOQUEUE,	"NOQUEUE" },			\
+	{ DLM_LKF_CANCEL,	"CANCEL" },			\
+	{ DLM_LKF_CONVERT,	"CONVERT" },			\
+	{ DLM_LKF_VALBLK,	"VALBLK" },			\
+	{ DLM_LKF_QUECVT,	"QUECVT" },			\
+	{ DLM_LKF_IVVALBLK,	"IVVALBLK" },			\
+	{ DLM_LKF_CONVDEADLK,	"CONVDEADLK" },			\
+	{ DLM_LKF_PERSISTENT,	"PERSISTENT" },			\
+	{ DLM_LKF_NODLCKWT,	"NODLCKWT" },			\
+	{ DLM_LKF_NODLCKBLK,	"NODLCKBLK" },			\
+	{ DLM_LKF_EXPEDITE,	"EXPEDITE" },			\
+	{ DLM_LKF_NOQUEUEBAST,	"NOQUEUEBAST" },		\
+	{ DLM_LKF_HEADQUE,	"HEADQUE" },			\
+	{ DLM_LKF_NOORDER,	"NOORDER" },			\
+	{ DLM_LKF_ORPHAN,	"ORPHAN" },			\
+	{ DLM_LKF_ALTPR,	"ALTPR" },			\
+	{ DLM_LKF_ALTCW,	"ALTCW" },			\
+	{ DLM_LKF_FORCEUNLOCK,	"FORCEUNLOCK" },		\
+	{ DLM_LKF_TIMEOUT,	"TIMEOUT" })
+
+#define show_lock_mode(mode) __print_symbolic(mode,		\
+	{ DLM_LOCK_IV,		"IV"},				\
+	{ DLM_LOCK_NL,		"NL"},				\
+	{ DLM_LOCK_CR,		"CR"},				\
+	{ DLM_LOCK_CW,		"CW"},				\
+	{ DLM_LOCK_PR,		"PR"},				\
+	{ DLM_LOCK_PW,		"PW"},				\
+	{ DLM_LOCK_EX,		"EX"})
+
+#define show_dlm_sb_flags(flags) __print_flags(flags, "|",	\
+	{ DLM_SBF_DEMOTED,	"DEMOTED" },			\
+	{ DLM_SBF_VALNOTVALID,	"VALNOTVALID" },		\
+	{ DLM_SBF_ALTMODE,	"ALTMODE" })
+
+/* not we begin tracing dlm_lock_start() only if ls and lkb are found */
+TRACE_EVENT(dlm_lock_start,
+
+	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, int mode,
+		 __u32 flags),
+
+	TP_ARGS(ls, lkb, mode, flags),
+
+	TP_STRUCT__entry(
+		__field(__u32, ls_id)
+		__field(__u32, lkb_id)
+		__field(int, mode)
+		__field(__u32, flags)
+	),
+
+	TP_fast_assign(
+		__entry->ls_id = ls->ls_global_id;
+		__entry->lkb_id = lkb->lkb_id;
+		__entry->mode = mode;
+		__entry->flags = flags;
+	),
+
+	TP_printk("ls_id=%u lkb_id=%x mode=%s flags=%s",
+		  __entry->ls_id, __entry->lkb_id,
+		  show_lock_mode(__entry->mode),
+		  show_lock_flags(__entry->flags))
+
+);
+
+TRACE_EVENT(dlm_lock_end,
+
+	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, int mode, __u32 flags,
+		 int error),
+
+	TP_ARGS(ls, lkb, mode, flags, error),
+
+	TP_STRUCT__entry(
+		__field(__u32, ls_id)
+		__field(__u32, lkb_id)
+		__field(int, mode)
+		__field(__u32, flags)
+		__field(int, error)
+	),
+
+	TP_fast_assign(
+		__entry->ls_id = ls->ls_global_id;
+		__entry->lkb_id = lkb->lkb_id;
+		__entry->mode = mode;
+		__entry->flags = flags;
+		__entry->error = error;
+	),
+
+	TP_printk("ls_id=%u lkb_id=%x mode=%s flags=%s error=%d",
+		  __entry->ls_id, __entry->lkb_id,
+		  show_lock_mode(__entry->mode),
+		  show_lock_flags(__entry->flags), __entry->error)
+
+);
+
+TRACE_EVENT(dlm_bast,
+
+	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, int mode),
+
+	TP_ARGS(ls, lkb, mode),
+
+	TP_STRUCT__entry(
+		__field(__u32, ls_id)
+		__field(__u32, lkb_id)
+		__field(int, mode)
+	),
+
+	TP_fast_assign(
+		__entry->ls_id = ls->ls_global_id;
+		__entry->lkb_id = lkb->lkb_id;
+		__entry->mode = mode;
+	),
+
+	TP_printk("ls_id=%u lkb_id=%x mode=%s", __entry->ls_id,
+		  __entry->lkb_id, show_lock_mode(__entry->mode))
+
+);
+
+TRACE_EVENT(dlm_ast,
+
+	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, struct dlm_lksb *lksb),
+
+	TP_ARGS(ls, lkb, lksb),
+
+	TP_STRUCT__entry(
+		__field(__u32, ls_id)
+		__field(__u32, lkb_id)
+		__field(u8, sb_flags)
+		__field(int, sb_status)
+	),
+
+	TP_fast_assign(
+		__entry->ls_id = ls->ls_global_id;
+		__entry->lkb_id = lkb->lkb_id;
+		__entry->sb_flags = lksb->sb_flags;
+		__entry->sb_status = lksb->sb_status;
+	),
+
+	TP_printk("ls_id=%u lkb_id=%x sb_flags=%s sb_status=%d",
+		  __entry->ls_id, __entry->lkb_id,
+		  show_dlm_sb_flags(__entry->sb_flags), __entry->sb_status)
+
+);
+
+/* not we begin tracing dlm_unlock_start() only if ls and lkb are found */
+TRACE_EVENT(dlm_unlock_start,
+
+	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, __u32 flags),
+
+	TP_ARGS(ls, lkb, flags),
+
+	TP_STRUCT__entry(
+		__field(__u32, ls_id)
+		__field(__u32, lkb_id)
+		__field(__u32, flags)
+	),
+
+	TP_fast_assign(
+		__entry->ls_id = ls->ls_global_id;
+		__entry->lkb_id = lkb->lkb_id;
+		__entry->flags = flags;
+	),
+
+	TP_printk("ls_id=%u lkb_id=%x flags=%s",
+		  __entry->ls_id, __entry->lkb_id,
+		  show_lock_flags(__entry->flags))
+
+);
+
+TRACE_EVENT(dlm_unlock_end,
+
+	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, __u32 flags,
+		 int error),
+
+	TP_ARGS(ls, lkb, flags, error),
+
+	TP_STRUCT__entry(
+		__field(__u32, ls_id)
+		__field(__u32, lkb_id)
+		__field(__u32, flags)
+		__field(int, error)
+	),
+
+	TP_fast_assign(
+		__entry->ls_id = ls->ls_global_id;
+		__entry->lkb_id = lkb->lkb_id;
+		__entry->flags = flags;
+		__entry->error = error;
+	),
+
+	TP_printk("ls_id=%u lkb_id=%x flags=%s error=%d",
+		  __entry->ls_id, __entry->lkb_id,
+		  show_lock_flags(__entry->flags), __entry->error)
+
+);
+
+#endif /* if !defined(_TRACE_DLM_H) || defined(TRACE_HEADER_MULTI_READ) */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.27.0

