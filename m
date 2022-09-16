Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1735B5BB25A
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Sep 2022 20:43:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663353815;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m19pv1/au1a5ZdoajsROaZs1lYz9RMSqNHpyHRNJblE=;
	b=KBj2CNp5wNhNvpFPLG6fh/E0MqhbNhH3CH4zJxJFdzdxiMqf+/8r61voLKuG8iQkJ4/sHp
	f0B/7LOdMH+gxLrbSQ3kH/l0vXoPZlmQOpvLI4TDs5AGTJhlP+L45wIH5sZW3FR8J7aTWY
	YO1sPCECtCwdBRuow/H83bt+P1mvpAM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-E8mwb9rqONW1ZMPEEFlTWg-1; Fri, 16 Sep 2022 14:43:31 -0400
X-MC-Unique: E8mwb9rqONW1ZMPEEFlTWg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A37213804081;
	Fri, 16 Sep 2022 18:43:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4FA1B4B3FC6;
	Fri, 16 Sep 2022 18:43:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 31F1E19465A2;
	Fri, 16 Sep 2022 18:43:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B636F1946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 16 Sep 2022 18:43:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8B4552166B2C; Fri, 16 Sep 2022 18:43:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 644D62166B26;
 Fri, 16 Sep 2022 18:43:27 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 16 Sep 2022 14:43:09 -0400
Message-Id: <20220916184309.3179451-6-aahringo@redhat.com>
In-Reply-To: <20220916184309.3179451-1-aahringo@redhat.com>
References: <20220916184309.3179451-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH/RFC dlm/next 6/6] fs: dlm: use a non-static
 queue for callbacks
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will introducde a queue implementation for callbacks by using
the Linux lists. The current callback queue handling is implemented by a
static limit of 6 entries, see DLM_CALLBACKS_SIZE. The sequence number
inside the callback structure was used to see if the entries inside the
static entry is valid or not. We don't need any sequence numbers anymore
with a dynamic datastructure with grows and shrinks during runtime to
offer such functionality.

We assume that every callback will be delivered to the DLM user if once
queued. Therefore the callback flag DLM_CB_SKIP was dropped and the
check for skipping bast was moved before worker handling and not skip
while the callback worker executes. This will reduce unnecessary queues
of the callback worker.

All last callback saves are pointers now and don't need to copied over.
There is a reference counter for callback structures which will care
about to free the callback structures at the right time if they are not
referenced anymore.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c          | 287 +++++++++++++++++-------------------------
 fs/dlm/ast.h          |  17 ++-
 fs/dlm/debug_fs.c     |   2 +-
 fs/dlm/dlm_internal.h |  15 +--
 fs/dlm/lock.c         |   8 +-
 fs/dlm/memory.c       |  27 ++++
 fs/dlm/memory.h       |   2 +
 fs/dlm/user.c         |  69 +++++-----
 fs/dlm/user.h         |   2 +-
 9 files changed, 211 insertions(+), 218 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index c3fc4551e9c4..7fe6408acd9b 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -12,55 +12,66 @@
 #include <trace/events/dlm.h>
 
 #include "dlm_internal.h"
+#include "memory.h"
 #include "lock.h"
 #include "user.h"
 #include "ast.h"
 
-static uint64_t dlm_cb_seq;
-static DEFINE_SPINLOCK(dlm_cb_seq_spin);
+void dlm_release_callback(struct kref *ref)
+{
+	struct dlm_callback *cb = container_of(ref, struct dlm_callback, ref);
+
+	dlm_free_cb(cb);
+}
+
+void dlm_callback_set_last_ptr(struct dlm_callback **from,
+			       struct dlm_callback *to)
+{
+	if (*from)
+		kref_put(&(*from)->ref, dlm_release_callback);
+
+	if (to)
+		kref_get(&to->ref);
+
+	*from = to;
+}
 
-static void dlm_dump_lkb_callbacks(struct dlm_lkb *lkb)
+void dlm_purge_lkb_callbacks(struct dlm_lkb *lkb)
 {
-	int i;
-
-	log_print("last_bast %x %llu flags %x mode %d sb %d %x",
-		  lkb->lkb_id,
-		  (unsigned long long)lkb->lkb_last_bast.seq,
-		  lkb->lkb_last_bast.flags,
-		  lkb->lkb_last_bast.mode,
-		  lkb->lkb_last_bast.sb_status,
-		  lkb->lkb_last_bast.sb_flags);
-
-	log_print("last_cast %x %llu flags %x mode %d sb %d %x",
-		  lkb->lkb_id,
-		  (unsigned long long)lkb->lkb_last_cast.seq,
-		  lkb->lkb_last_cast.flags,
-		  lkb->lkb_last_cast.mode,
-		  lkb->lkb_last_cast.sb_status,
-		  lkb->lkb_last_cast.sb_flags);
-
-	for (i = 0; i < DLM_CALLBACKS_SIZE; i++) {
-		log_print("cb %x %llu flags %x mode %d sb %d %x",
-			  lkb->lkb_id,
-			  (unsigned long long)lkb->lkb_callbacks[i].seq,
-			  lkb->lkb_callbacks[i].flags,
-			  lkb->lkb_callbacks[i].mode,
-			  lkb->lkb_callbacks[i].sb_status,
-			  lkb->lkb_callbacks[i].sb_flags);
+	struct dlm_callback *cb, *safe;
+
+	list_for_each_entry_safe(cb, safe, &lkb->lkb_callbacks, list) {
+		list_del(&cb->list);
+		atomic_dec(&lkb->lkb_callbacks_count);
+		kref_put(&cb->ref, dlm_release_callback);
 	}
+
+	/* invalidate */
+	dlm_callback_set_last_ptr(&lkb->lkb_last_cast, NULL);
+	dlm_callback_set_last_ptr(&lkb->lkb_last_bast, NULL);
+	dlm_callback_set_last_ptr(&lkb->lkb_last_cb, NULL);
 }
 
-int dlm_add_lkb_callback(struct dlm_lkb *lkb, uint32_t flags, int mode,
-			 int status, uint32_t sbflags, uint64_t seq)
+int dlm_enqueue_lkb_callback(struct dlm_lkb *lkb, uint32_t flags, int mode,
+			     int status, uint32_t sbflags)
 {
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
-	uint64_t prev_seq;
+	int rv = DLM_ENQUEUE_CALLBACK_SUCCESS;
+	struct dlm_callback *cb;
 	int prev_mode;
-	int i, rv;
 
-	for (i = 0; i < DLM_CALLBACKS_SIZE; i++) {
-		if (lkb->lkb_callbacks[i].seq)
-			continue;
+	if (flags & DLM_CB_BAST) {
+		/* if cb is a bast, it should be skipped if the blocking mode is
+		 * compatible with the last granted mode
+		 */
+		if (lkb->lkb_last_cast) {
+			if (dlm_modes_compat(mode, lkb->lkb_last_cast->mode)) {
+				log_debug(ls, "skip %x bast mode %d for cast mode %d",
+					  lkb->lkb_id, mode,
+					  lkb->lkb_last_cast->mode);
+				goto out;
+			}
+		}
 
 		/*
 		 * Suppress some redundant basts here, do more on removal.
@@ -68,132 +79,77 @@ int dlm_add_lkb_callback(struct dlm_lkb *lkb, uint32_t flags, int mode,
 		 * is a bast for the same mode or a more restrictive mode.
 		 * (the addional > PR check is needed for PR/CW inversion)
 		 */
-
-		if ((i > 0) && (flags & DLM_CB_BAST) &&
-		    (lkb->lkb_callbacks[i-1].flags & DLM_CB_BAST)) {
-
-			prev_seq = lkb->lkb_callbacks[i-1].seq;
-			prev_mode = lkb->lkb_callbacks[i-1].mode;
+		if (lkb->lkb_last_cb && lkb->lkb_last_cb->flags & DLM_CB_BAST) {
+			prev_mode = lkb->lkb_last_cb->mode;
 
 			if ((prev_mode == mode) ||
 			    (prev_mode > mode && prev_mode > DLM_LOCK_PR)) {
-
-				log_debug(ls, "skip %x add bast %llu mode %d "
-					  "for bast %llu mode %d",
-					  lkb->lkb_id,
-					  (unsigned long long)seq,
-					  mode,
-					  (unsigned long long)prev_seq,
-					  prev_mode);
-				rv = 0;
+				log_debug(ls, "skip %x add bast mode %d for bast mode %d",
+					  lkb->lkb_id, mode, prev_mode);
 				goto out;
 			}
 		}
-
-		lkb->lkb_callbacks[i].seq = seq;
-		lkb->lkb_callbacks[i].flags = flags;
-		lkb->lkb_callbacks[i].mode = mode;
-		lkb->lkb_callbacks[i].sb_status = status;
-		lkb->lkb_callbacks[i].sb_flags = (sbflags & 0x000000FF);
-		rv = 0;
-		break;
-	}
-
-	if (i == DLM_CALLBACKS_SIZE) {
-		log_error(ls, "no callbacks %x %llu flags %x mode %d sb %d %x",
-			  lkb->lkb_id, (unsigned long long)seq,
-			  flags, mode, status, sbflags);
-		dlm_dump_lkb_callbacks(lkb);
-		rv = -1;
-		goto out;
 	}
- out:
-	return rv;
-}
 
-int dlm_rem_lkb_callback(struct dlm_ls *ls, struct dlm_lkb *lkb,
-			 struct dlm_callback *cb, int *resid)
-{
-	int i, rv;
-
-	*resid = 0;
-
-	if (!lkb->lkb_callbacks[0].seq) {
-		rv = -ENOENT;
+	cb = dlm_allocate_cb();
+	if (!cb) {
+		rv = DLM_ENQUEUE_CALLBACK_FAILURE;
 		goto out;
 	}
 
-	/* oldest undelivered cb is callbacks[0] */
-
-	memcpy(cb, &lkb->lkb_callbacks[0], sizeof(struct dlm_callback));
-	memset(&lkb->lkb_callbacks[0], 0, sizeof(struct dlm_callback));
+	cb->flags = flags;
+	cb->mode = mode;
+	cb->sb_status = status;
+	cb->sb_flags = (sbflags & 0x000000FF);
+	kref_init(&cb->ref);
+	if (!atomic_fetch_inc(&lkb->lkb_callbacks_count))
+		rv = DLM_ENQUEUE_CALLBACK_NEED_SCHED;
+	list_add_tail(&cb->list, &lkb->lkb_callbacks);
 
-	/* shift others down */
+	if (flags & DLM_CB_CAST)
+		dlm_callback_set_last_ptr(&lkb->lkb_last_cast, cb);
 
-	for (i = 1; i < DLM_CALLBACKS_SIZE; i++) {
-		if (!lkb->lkb_callbacks[i].seq)
-			break;
-		memcpy(&lkb->lkb_callbacks[i-1], &lkb->lkb_callbacks[i],
-		       sizeof(struct dlm_callback));
-		memset(&lkb->lkb_callbacks[i], 0, sizeof(struct dlm_callback));
-		(*resid)++;
-	}
-
-	/* if cb is a bast, it should be skipped if the blocking mode is
-	   compatible with the last granted mode */
-
-	if ((cb->flags & DLM_CB_BAST) && lkb->lkb_last_cast.seq) {
-		if (dlm_modes_compat(cb->mode, lkb->lkb_last_cast.mode)) {
-			cb->flags |= DLM_CB_SKIP;
-
-			log_debug(ls, "skip %x bast %llu mode %d "
-				  "for cast %llu mode %d",
-				  lkb->lkb_id,
-				  (unsigned long long)cb->seq,
-				  cb->mode,
-				  (unsigned long long)lkb->lkb_last_cast.seq,
-				  lkb->lkb_last_cast.mode);
-			rv = 0;
-			goto out;
-		}
-	}
+	if (flags & DLM_CB_BAST)
+		dlm_callback_set_last_ptr(&lkb->lkb_last_bast, cb);
 
-	if (cb->flags & DLM_CB_CAST)
-		memcpy(&lkb->lkb_last_cast, cb, sizeof(struct dlm_callback));
+	dlm_callback_set_last_ptr(&lkb->lkb_last_cb, cb);
 
-	if (cb->flags & DLM_CB_BAST)
-		memcpy(&lkb->lkb_last_bast, cb, sizeof(struct dlm_callback));
-	rv = 0;
  out:
 	return rv;
 }
 
+int dlm_dequeue_lkb_callback(struct dlm_lkb *lkb, struct dlm_callback **cb)
+{
+	/* oldest undelivered cb is callbacks first entry */
+	*cb = list_first_entry_or_null(&lkb->lkb_callbacks,
+				       struct dlm_callback, list);
+	if (!*cb)
+		return DLM_DEQUEUE_CALLBACK_FAILURE;
+
+	/* remove it from callbacks so shift others down */
+	list_del(&(*cb)->list);
+	if (atomic_dec_and_test(&lkb->lkb_callbacks_count))
+		return DLM_DEQUEUE_CALLBACK_LAST;
+
+	return DLM_DEQUEUE_CALLBACK_SUCCESS;
+}
+
 void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
 		uint32_t sbflags)
 {
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
-	uint64_t new_seq, prev_seq;
 	int rv;
 
-	spin_lock(&dlm_cb_seq_spin);
-	new_seq = ++dlm_cb_seq;
-	if (!dlm_cb_seq)
-		new_seq = ++dlm_cb_seq;
-	spin_unlock(&dlm_cb_seq_spin);
-
 	if (lkb->lkb_flags & DLM_IFL_USER) {
-		dlm_user_add_ast(lkb, flags, mode, status, sbflags, new_seq);
+		dlm_user_add_ast(lkb, flags, mode, status, sbflags);
 		return;
 	}
 
 	spin_lock(&lkb->lkb_cb_lock);
-	prev_seq = lkb->lkb_callbacks[0].seq;
-
-	rv = dlm_add_lkb_callback(lkb, flags, mode, status, sbflags, new_seq);
-	if (rv < 0)
-		goto out;
-
-	if (!prev_seq) {
+	rv = dlm_enqueue_lkb_callback(lkb, flags, mode, status, sbflags);
+	spin_unlock(&lkb->lkb_cb_lock);
+	switch (rv) {
+	case DLM_ENQUEUE_CALLBACK_NEED_SCHED:
 		kref_get(&lkb->lkb_ref);
 
 		read_lock(&ls->ls_cb_lock);
@@ -203,9 +159,16 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
 			queue_work(ls->ls_callback_wq, &lkb->lkb_cb_work);
 		}
 		read_unlock(&ls->ls_cb_lock);
+		break;
+	case DLM_ENQUEUE_CALLBACK_FAILURE:
+		WARN_ON(1);
+		break;
+	case DLM_ENQUEUE_CALLBACK_SUCCESS:
+		break;
+	default:
+		WARN_ON(1);
+		break;
 	}
- out:
-	spin_unlock(&lkb->lkb_cb_lock);
 }
 
 void dlm_callback_work(struct work_struct *work)
@@ -214,54 +177,36 @@ void dlm_callback_work(struct work_struct *work)
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
 	void (*castfn) (void *astparam);
 	void (*bastfn) (void *astparam, int mode);
-	struct dlm_callback callbacks[DLM_CALLBACKS_SIZE];
-	int i, rv, resid;
+	struct dlm_callback *cb;
+	int rv;
 
-	memset(&callbacks, 0, sizeof(callbacks));
+	WARN_ON(!atomic_read(&lkb->lkb_callbacks_count));
 
-	spin_lock(&lkb->lkb_cb_lock);
-	if (!lkb->lkb_callbacks[0].seq) {
-		/* no callback work exists, shouldn't happen */
-		log_error(ls, "dlm_callback_work %x no work", lkb->lkb_id);
-		dlm_print_lkb(lkb);
-		dlm_dump_lkb_callbacks(lkb);
-	}
+	do {
+		spin_lock(&lkb->lkb_cb_lock);
+		rv = dlm_dequeue_lkb_callback(lkb, &cb);
+		spin_unlock(&lkb->lkb_cb_lock);
 
-	for (i = 0; i < DLM_CALLBACKS_SIZE; i++) {
-		rv = dlm_rem_lkb_callback(ls, lkb, &callbacks[i], &resid);
-		if (rv < 0)
+		if (WARN_ON(rv == DLM_DEQUEUE_CALLBACK_FAILURE))
 			break;
-	}
-
-	if (resid) {
-		/* cbs remain, loop should have removed all, shouldn't happen */
-		log_error(ls, "dlm_callback_work %x resid %d", lkb->lkb_id,
-			  resid);
-		dlm_print_lkb(lkb);
-		dlm_dump_lkb_callbacks(lkb);
-	}
-	spin_unlock(&lkb->lkb_cb_lock);
 
-	castfn = lkb->lkb_astfn;
-	bastfn = lkb->lkb_bastfn;
+		castfn = lkb->lkb_astfn;
+		bastfn = lkb->lkb_bastfn;
 
-	for (i = 0; i < DLM_CALLBACKS_SIZE; i++) {
-		if (!callbacks[i].seq)
-			break;
-		if (callbacks[i].flags & DLM_CB_SKIP) {
-			continue;
-		} else if (callbacks[i].flags & DLM_CB_BAST) {
-			trace_dlm_bast(ls, lkb, callbacks[i].mode);
+		if (cb->flags & DLM_CB_BAST) {
+			trace_dlm_bast(ls, lkb, cb->mode);
 			lkb->lkb_last_bast_time = ktime_get();
-			bastfn(lkb->lkb_astparam, callbacks[i].mode);
-		} else if (callbacks[i].flags & DLM_CB_CAST) {
-			lkb->lkb_lksb->sb_status = callbacks[i].sb_status;
-			lkb->lkb_lksb->sb_flags = callbacks[i].sb_flags;
+			bastfn(lkb->lkb_astparam, cb->mode);
+		} else if (cb->flags & DLM_CB_CAST) {
+			lkb->lkb_lksb->sb_status = cb->sb_status;
+			lkb->lkb_lksb->sb_flags = cb->sb_flags;
 			trace_dlm_ast(ls, lkb);
 			lkb->lkb_last_cast_time = ktime_get();
 			castfn(lkb->lkb_astparam);
 		}
-	}
+
+		kref_put(&cb->ref, dlm_release_callback);
+	} while (rv != DLM_DEQUEUE_CALLBACK_LAST);
 
 	/* undo kref_get from dlm_add_callback, may cause lkb to be freed */
 	dlm_put_lkb(lkb);
diff --git a/fs/dlm/ast.h b/fs/dlm/ast.h
index e5e05fcc5813..b0023b90d2a1 100644
--- a/fs/dlm/ast.h
+++ b/fs/dlm/ast.h
@@ -11,13 +11,22 @@
 #ifndef __ASTD_DOT_H__
 #define __ASTD_DOT_H__
 
-int dlm_add_lkb_callback(struct dlm_lkb *lkb, uint32_t flags, int mode,
-                         int status, uint32_t sbflags, uint64_t seq);
-int dlm_rem_lkb_callback(struct dlm_ls *ls, struct dlm_lkb *lkb,
-                         struct dlm_callback *cb, int *resid);
+#define DLM_ENQUEUE_CALLBACK_NEED_SCHED	1
+#define DLM_ENQUEUE_CALLBACK_SUCCESS	0
+#define DLM_ENQUEUE_CALLBACK_FAILURE	-1
+int dlm_enqueue_lkb_callback(struct dlm_lkb *lkb, uint32_t flags, int mode,
+			     int status, uint32_t sbflags);
+#define DLM_DEQUEUE_CALLBACK_LAST	1
+#define DLM_DEQUEUE_CALLBACK_SUCCESS	0
+#define DLM_DEQUEUE_CALLBACK_FAILURE	-1
+int dlm_dequeue_lkb_callback(struct dlm_lkb *lkb, struct dlm_callback **cb);
 void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
                 uint32_t sbflags);
+void dlm_callback_set_last_ptr(struct dlm_callback **from,
+			       struct dlm_callback *to);
 
+void dlm_release_callback(struct kref *ref);
+void dlm_purge_lkb_callbacks(struct dlm_lkb *lkb);
 void dlm_callback_work(struct work_struct *work);
 int dlm_callback_start(struct dlm_ls *ls);
 void dlm_callback_stop(struct dlm_ls *ls);
diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 8fb04ebbafb5..8d5b1701f47a 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -246,7 +246,7 @@ static void print_format3_lock(struct seq_file *s, struct dlm_lkb *lkb,
 		   lkb->lkb_status,
 		   lkb->lkb_grmode,
 		   lkb->lkb_rqmode,
-		   lkb->lkb_last_bast.mode,
+		   lkb->lkb_last_bast->mode,
 		   rsb_lookup,
 		   lkb->lkb_wait_type,
 		   lkb->lkb_lvbseq,
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index e5a5d0b16392..33792f90ebf5 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -222,18 +222,17 @@ struct dlm_args {
 #define DLM_IFL_USER		0x00000001
 #define DLM_IFL_ORPHAN		0x00000002
 
-#define DLM_CALLBACKS_SIZE	6
-
 #define DLM_CB_CAST		0x00000001
 #define DLM_CB_BAST		0x00000002
-#define DLM_CB_SKIP		0x00000004
 
 struct dlm_callback {
-	uint64_t		seq;
 	uint32_t		flags;		/* DLM_CBF_ */
 	int			sb_status;	/* copy to lksb status */
 	uint8_t			sb_flags;	/* copy to lksb flags */
 	int8_t			mode; /* rq mode of bast, gr mode of cast */
+
+	struct list_head	list;
+	struct kref		ref;
 };
 
 struct dlm_lkb {
@@ -271,9 +270,11 @@ struct dlm_lkb {
 	spinlock_t		lkb_cb_lock;
 	struct work_struct	lkb_cb_work;
 	struct list_head	lkb_cb_list; /* for ls_cb_delay or proc->asts */
-	struct dlm_callback	lkb_callbacks[DLM_CALLBACKS_SIZE];
-	struct dlm_callback	lkb_last_cast;
-	struct dlm_callback	lkb_last_bast;
+	struct list_head	lkb_callbacks;
+	atomic_t		lkb_callbacks_count;
+	struct dlm_callback	*lkb_last_cast;
+	struct dlm_callback	*lkb_last_bast;
+	struct dlm_callback	*lkb_last_cb;
 	ktime_t			lkb_last_cast_time;	/* for debugging */
 	ktime_t			lkb_last_bast_time;	/* for debugging */
 
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 5a04d306a684..12dba0b5cfdc 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1218,6 +1218,8 @@ static int _create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret,
 	INIT_LIST_HEAD(&lkb->lkb_time_list);
 #endif
 	INIT_LIST_HEAD(&lkb->lkb_cb_list);
+	INIT_LIST_HEAD(&lkb->lkb_callbacks);
+	atomic_set(&lkb->lkb_callbacks_count, 0);
 	spin_lock_init(&lkb->lkb_cb_lock);
 	INIT_WORK(&lkb->lkb_cb_work, dlm_callback_work);
 
@@ -6220,8 +6222,7 @@ void dlm_clear_proc_locks(struct dlm_ls *ls, struct dlm_user_proc *proc)
 	}
 
 	list_for_each_entry_safe(lkb, safe, &proc->asts, lkb_cb_list) {
-		memset(&lkb->lkb_callbacks, 0,
-		       sizeof(struct dlm_callback) * DLM_CALLBACKS_SIZE);
+		dlm_purge_lkb_callbacks(lkb);
 		list_del_init(&lkb->lkb_cb_list);
 		dlm_put_lkb(lkb);
 	}
@@ -6262,8 +6263,7 @@ static void purge_proc_locks(struct dlm_ls *ls, struct dlm_user_proc *proc)
 
 	spin_lock(&proc->asts_spin);
 	list_for_each_entry_safe(lkb, safe, &proc->asts, lkb_cb_list) {
-		memset(&lkb->lkb_callbacks, 0,
-		       sizeof(struct dlm_callback) * DLM_CALLBACKS_SIZE);
+		dlm_purge_lkb_callbacks(lkb);
 		list_del_init(&lkb->lkb_cb_list);
 		dlm_put_lkb(lkb);
 	}
diff --git a/fs/dlm/memory.c b/fs/dlm/memory.c
index ce35c3c19aeb..8bb0da1fa63c 100644
--- a/fs/dlm/memory.c
+++ b/fs/dlm/memory.c
@@ -14,12 +14,14 @@
 #include "lowcomms.h"
 #include "config.h"
 #include "memory.h"
+#include "ast.h"
 
 static struct kmem_cache *writequeue_cache;
 static struct kmem_cache *mhandle_cache;
 static struct kmem_cache *msg_cache;
 static struct kmem_cache *lkb_cache;
 static struct kmem_cache *rsb_cache;
+static struct kmem_cache *cb_cache;
 
 
 int __init dlm_memory_init(void)
@@ -46,8 +48,16 @@ int __init dlm_memory_init(void)
 	if (!rsb_cache)
 		goto rsb;
 
+	cb_cache = kmem_cache_create("dlm_cb", sizeof(struct dlm_callback),
+				     __alignof__(struct dlm_callback), 0,
+				     NULL);
+	if (!rsb_cache)
+		goto cb;
+
 	return 0;
 
+cb:
+	kmem_cache_destroy(rsb_cache);
 rsb:
 	kmem_cache_destroy(msg_cache);
 msg:
@@ -67,6 +77,7 @@ void dlm_memory_exit(void)
 	kmem_cache_destroy(msg_cache);
 	kmem_cache_destroy(lkb_cache);
 	kmem_cache_destroy(rsb_cache);
+	kmem_cache_destroy(cb_cache);
 }
 
 char *dlm_allocate_lvb(struct dlm_ls *ls)
@@ -115,6 +126,12 @@ void dlm_free_lkb(struct dlm_lkb *lkb)
 			kfree(ua);
 		}
 	}
+
+	/* drop references if they are set */
+	dlm_callback_set_last_ptr(&lkb->lkb_last_cast, NULL);
+	dlm_callback_set_last_ptr(&lkb->lkb_last_bast, NULL);
+	dlm_callback_set_last_ptr(&lkb->lkb_last_cb, NULL);
+
 	kmem_cache_free(lkb_cache, lkb);
 }
 
@@ -147,3 +164,13 @@ void dlm_free_msg(struct dlm_msg *msg)
 {
 	kmem_cache_free(msg_cache, msg);
 }
+
+struct dlm_callback *dlm_allocate_cb(void)
+{
+	return kmem_cache_alloc(cb_cache, GFP_ATOMIC);
+}
+
+void dlm_free_cb(struct dlm_callback *cb)
+{
+	kmem_cache_free(cb_cache, cb);
+}
diff --git a/fs/dlm/memory.h b/fs/dlm/memory.h
index 7bd3f1a391ca..c1583ec8b2cf 100644
--- a/fs/dlm/memory.h
+++ b/fs/dlm/memory.h
@@ -26,6 +26,8 @@ struct writequeue_entry *dlm_allocate_writequeue(void);
 void dlm_free_writequeue(struct writequeue_entry *writequeue);
 struct dlm_msg *dlm_allocate_msg(gfp_t allocation);
 void dlm_free_msg(struct dlm_msg *msg);
+struct dlm_callback *dlm_allocate_cb(void);
+void dlm_free_cb(struct dlm_callback *cb);
 
 #endif		/* __MEMORY_DOT_H__ */
 
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index 6a5de0918a96..e27575736bfb 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -25,6 +25,7 @@
 #include "user.h"
 #include "ast.h"
 #include "config.h"
+#include "memory.h"
 
 static const char name_prefix[] = "dlm";
 static const struct file_operations device_fops;
@@ -175,7 +176,7 @@ static int lkb_is_endoflife(int mode, int status)
    being removed and then remove that lkb from the orphans list and free it */
 
 void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
-		      int status, uint32_t sbflags, uint64_t seq)
+		      int status, uint32_t sbflags)
 {
 	struct dlm_ls *ls;
 	struct dlm_user_args *ua;
@@ -209,16 +210,22 @@ void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
 
 	spin_lock(&proc->asts_spin);
 
-	rv = dlm_add_lkb_callback(lkb, flags, mode, status, sbflags, seq);
-	if (rv < 0) {
+	rv = dlm_enqueue_lkb_callback(lkb, flags, mode, status, sbflags);
+	switch (rv) {
+	case DLM_ENQUEUE_CALLBACK_FAILURE:
 		spin_unlock(&proc->asts_spin);
+		WARN_ON(1);
 		goto out;
-	}
-
-	if (list_empty(&lkb->lkb_cb_list)) {
+	case DLM_ENQUEUE_CALLBACK_NEED_SCHED:
 		kref_get(&lkb->lkb_ref);
 		list_add_tail(&lkb->lkb_cb_list, &proc->asts);
 		wake_up_interruptible(&proc->wait);
+		break;
+	case DLM_ENQUEUE_CALLBACK_SUCCESS:
+		break;
+	default:
+		WARN_ON(1);
+		break;
 	}
 	spin_unlock(&proc->asts_spin);
 
@@ -800,8 +807,8 @@ static ssize_t device_read(struct file *file, char __user *buf, size_t count,
 	struct dlm_user_proc *proc = file->private_data;
 	struct dlm_lkb *lkb;
 	DECLARE_WAITQUEUE(wait, current);
-	struct dlm_callback cb;
-	int rv, resid, copy_lvb = 0;
+	struct dlm_callback *cb;
+	int rv, copy_lvb = 0;
 	int old_mode, new_mode;
 
 	if (count == sizeof(struct dlm_device_version)) {
@@ -860,50 +867,52 @@ static ssize_t device_read(struct file *file, char __user *buf, size_t count,
 	lkb = list_first_entry(&proc->asts, struct dlm_lkb, lkb_cb_list);
 
 	/* rem_lkb_callback sets a new lkb_last_cast */
-	old_mode = lkb->lkb_last_cast.mode;
+	old_mode = lkb->lkb_last_cast->mode;
 
-	rv = dlm_rem_lkb_callback(lkb->lkb_resource->res_ls, lkb, &cb, &resid);
-	if (rv < 0) {
+	rv = dlm_dequeue_lkb_callback(lkb, &cb);
+	switch (rv) {
+	case DLM_DEQUEUE_CALLBACK_FAILURE:
 		/* this shouldn't happen; lkb should have been removed from
-		   list when resid was zero */
+		 * list when last item was dequeued
+		 */
 		log_print("dlm_rem_lkb_callback empty %x", lkb->lkb_id);
 		list_del_init(&lkb->lkb_cb_list);
 		spin_unlock(&proc->asts_spin);
 		/* removes ref for proc->asts, may cause lkb to be freed */
 		dlm_put_lkb(lkb);
 		goto try_another;
-	}
-	if (!resid)
+	case DLM_DEQUEUE_CALLBACK_LAST:
 		list_del_init(&lkb->lkb_cb_list);
-	spin_unlock(&proc->asts_spin);
-
-	if (cb.flags & DLM_CB_SKIP) {
-		/* removes ref for proc->asts, may cause lkb to be freed */
-		if (!resid)
-			dlm_put_lkb(lkb);
-		goto try_another;
+		break;
+	case DLM_DEQUEUE_CALLBACK_SUCCESS:
+		break;
+	default:
+		break;
 	}
+	spin_unlock(&proc->asts_spin);
 
-	if (cb.flags & DLM_CB_BAST) {
-		trace_dlm_bast(lkb->lkb_resource->res_ls, lkb, cb.mode);
-	} else if (cb.flags & DLM_CB_CAST) {
-		new_mode = cb.mode;
+	if (cb->flags & DLM_CB_BAST) {
+		trace_dlm_bast(lkb->lkb_resource->res_ls, lkb, cb->mode);
+	} else if (cb->flags & DLM_CB_CAST) {
+		new_mode = cb->mode;
 
-		if (!cb.sb_status && lkb->lkb_lksb->sb_lvbptr &&
+		if (!cb->sb_status && lkb->lkb_lksb->sb_lvbptr &&
 		    dlm_lvb_operations[old_mode + 1][new_mode + 1])
 			copy_lvb = 1;
 
-		lkb->lkb_lksb->sb_status = cb.sb_status;
-		lkb->lkb_lksb->sb_flags = cb.sb_flags;
+		lkb->lkb_lksb->sb_status = cb->sb_status;
+		lkb->lkb_lksb->sb_flags = cb->sb_flags;
 		trace_dlm_ast(lkb->lkb_resource->res_ls, lkb);
 	}
 
 	rv = copy_result_to_user(lkb->lkb_ua,
 				 test_bit(DLM_PROC_FLAGS_COMPAT, &proc->flags),
-				 cb.flags, cb.mode, copy_lvb, buf, count);
+				 cb->flags, cb->mode, copy_lvb, buf, count);
+
+	kref_put(&cb->ref, dlm_release_callback);
 
 	/* removes ref for proc->asts, may cause lkb to be freed */
-	if (!resid)
+	if (rv == DLM_DEQUEUE_CALLBACK_LAST)
 		dlm_put_lkb(lkb);
 
 	return rv;
diff --git a/fs/dlm/user.h b/fs/dlm/user.h
index 6b9bce6b96e0..33059452d79e 100644
--- a/fs/dlm/user.h
+++ b/fs/dlm/user.h
@@ -7,7 +7,7 @@
 #define __USER_DOT_H__
 
 void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
-                      int status, uint32_t sbflags, uint64_t seq);
+		      int status, uint32_t sbflags);
 int dlm_user_init(void);
 void dlm_user_exit(void);
 int dlm_device_deregister(struct dlm_ls *ls);
-- 
2.31.1

