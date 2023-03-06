Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0222A6ACF7F
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Mar 2023 21:49:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678135744;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OhIJUz33xQA/cwIewrCPqdSFjpwbH7G7J2Wg7uqkwjA=;
	b=O2xNYTXmvz4G8Olb9WlabWGz+g4fXmkIjSDMeQJrg7m+WM4oXYcAb5DGAn3rlBqoST2WfN
	UAk2DP+68FReqAPC1XsJza+0oU+9uQtY/sJGd7MBmSMRy/BwoQ/HITKgTwxisIMkltgTyz
	DIAdgZoo9386+Y0ABSXf/HQL/17yYrs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-JDZj21T2MLS0oDJ0zAATsw-1; Mon, 06 Mar 2023 15:48:30 -0500
X-MC-Unique: JDZj21T2MLS0oDJ0zAATsw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66C2A299E765;
	Mon,  6 Mar 2023 20:48:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 59D58492C14;
	Mon,  6 Mar 2023 20:48:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1AE4F1946595;
	Mon,  6 Mar 2023 20:48:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A40151946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 98A0F440DF; Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39271175AD;
 Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  6 Mar 2023 15:48:16 -0500
Message-Id: <20230306204819.2747646-10-aahringo@redhat.com>
In-Reply-To: <20230306204819.2747646-1-aahringo@redhat.com>
References: <20230306204819.2747646-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v6.3-rc1 09/12] fs: dlm: move internal flags
 to atomic ops
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

This patch will move the lkb_flags value to the recently introduced
lkb_iflags value. For lkb_iflags we use atomic bit operations because
some flags like DLM_IFL_CB_PENDING are used while non rsb lock is held
to avoid issues with other flag manipulations which might run at the
same time we switch to atomic bit operations. Snapshot the bit values to
an uint32_t value is only used for debugging/logging use cases and don't
need to be 100% correct.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/debug_fs.c     |   4 +-
 fs/dlm/dlm_internal.h |  30 ++++++----
 fs/dlm/lock.c         | 127 +++++++++++++++++++++---------------------
 fs/dlm/lockspace.c    |   2 +-
 fs/dlm/recover.c      |   2 +-
 fs/dlm/user.c         |   8 +--
 6 files changed, 90 insertions(+), 83 deletions(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 370a0c81a0b3..a1aca41c49d0 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -188,7 +188,7 @@ static void print_format2_lock(struct seq_file *s, struct dlm_lkb *lkb,
 		   lkb->lkb_ownpid,
 		   (unsigned long long)xid,
 		   lkb->lkb_exflags,
-		   lkb->lkb_flags,
+		   dlm_iflags_val(lkb),
 		   lkb->lkb_status,
 		   lkb->lkb_grmode,
 		   lkb->lkb_rqmode,
@@ -242,7 +242,7 @@ static void print_format3_lock(struct seq_file *s, struct dlm_lkb *lkb,
 		   lkb->lkb_ownpid,
 		   (unsigned long long)xid,
 		   lkb->lkb_exflags,
-		   lkb->lkb_flags,
+		   dlm_iflags_val(lkb),
 		   lkb->lkb_status,
 		   lkb->lkb_grmode,
 		   lkb->lkb_rqmode,
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index cd4f89217ee1..b33473d9e3cf 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -194,17 +194,18 @@ struct dlm_args {
 #define DLM_LKSTS_GRANTED	2
 #define DLM_LKSTS_CONVERT	3
 
-/* lkb_flags */
-
-#define DLM_IFL_MSTCPY		0x00010000
-#define DLM_IFL_RESEND		0x00020000
-#define DLM_IFL_DEAD		0x00040000
-#define DLM_IFL_OVERLAP_UNLOCK  0x00080000
-#define DLM_IFL_OVERLAP_CANCEL  0x00100000
-#define DLM_IFL_ENDOFLIFE	0x00200000
-#define DLM_IFL_DEADLOCK_CANCEL	0x01000000
-
-#define DLM_IFL_CB_PENDING_BIT	0
+/* lkb_iflags */
+
+#define DLM_IFL_MSTCPY_BIT	16
+#define __DLM_IFL_MIN_BIT	DLM_IFL_MSTCPY_BIT
+#define DLM_IFL_RESEND_BIT	17
+#define DLM_IFL_DEAD_BIT	18
+#define DLM_IFL_OVERLAP_UNLOCK_BIT 19
+#define DLM_IFL_OVERLAP_CANCEL_BIT 20
+#define DLM_IFL_ENDOFLIFE_BIT	21
+#define DLM_IFL_DEADLOCK_CANCEL_BIT 24
+#define DLM_IFL_CB_PENDING_BIT	25
+#define __DLM_IFL_MAX_BIT	DLM_IFL_CB_PENDING_BIT
 
 /* lkb_dflags */
 
@@ -235,7 +236,6 @@ struct dlm_lkb {
 	uint32_t		lkb_remid;	/* lock ID on remote partner */
 	uint32_t		lkb_exflags;	/* external flags from caller */
 	uint32_t		lkb_sbflags;	/* lksb flags */
-	uint32_t		lkb_flags;	/* internal flags */
 	unsigned long		lkb_dflags;	/* distributed flags */
 	unsigned long		lkb_iflags;	/* internal flags */
 	uint32_t		lkb_lvbseq;	/* lvb sequence number */
@@ -748,6 +748,12 @@ static inline uint32_t dlm_flags_val(const unsigned long *addr,
 	return val;
 }
 
+static inline uint32_t dlm_iflags_val(const struct dlm_lkb *lkb)
+{
+	return dlm_flags_val(&lkb->lkb_iflags, __DLM_IFL_MIN_BIT,
+			     __DLM_IFL_MAX_BIT);
+}
+
 static inline uint32_t dlm_dflags_val(const struct dlm_lkb *lkb)
 {
 	return dlm_flags_val(&lkb->lkb_dflags, __DLM_DFL_MIN_BIT,
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 70737352d595..ecb2deef6eae 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -163,7 +163,7 @@ void dlm_print_lkb(struct dlm_lkb *lkb)
 	printk(KERN_ERR "lkb: nodeid %d id %x remid %x exflags %x flags %x "
 	       "sts %d rq %d gr %d wait_type %d wait_nodeid %d seq %llu\n",
 	       lkb->lkb_nodeid, lkb->lkb_id, lkb->lkb_remid, lkb->lkb_exflags,
-	       lkb->lkb_flags, lkb->lkb_status, lkb->lkb_rqmode,
+	       dlm_iflags_val(lkb), lkb->lkb_status, lkb->lkb_rqmode,
 	       lkb->lkb_grmode, lkb->lkb_wait_type, lkb->lkb_wait_nodeid,
 	       (unsigned long long)lkb->lkb_recover_seq);
 }
@@ -249,12 +249,13 @@ static inline int is_remote(struct dlm_rsb *r)
 
 static inline int is_process_copy(struct dlm_lkb *lkb)
 {
-	return (lkb->lkb_nodeid && !(lkb->lkb_flags & DLM_IFL_MSTCPY));
+	return lkb->lkb_nodeid &&
+	       !test_bit(DLM_IFL_MSTCPY_BIT, &lkb->lkb_iflags);
 }
 
 static inline int is_master_copy(struct dlm_lkb *lkb)
 {
-	return (lkb->lkb_flags & DLM_IFL_MSTCPY) ? 1 : 0;
+	return test_bit(DLM_IFL_MSTCPY_BIT, &lkb->lkb_iflags);
 }
 
 static inline int middle_conversion(struct dlm_lkb *lkb)
@@ -272,18 +273,18 @@ static inline int down_conversion(struct dlm_lkb *lkb)
 
 static inline int is_overlap_unlock(struct dlm_lkb *lkb)
 {
-	return lkb->lkb_flags & DLM_IFL_OVERLAP_UNLOCK;
+	return test_bit(DLM_IFL_OVERLAP_UNLOCK_BIT, &lkb->lkb_iflags);
 }
 
 static inline int is_overlap_cancel(struct dlm_lkb *lkb)
 {
-	return lkb->lkb_flags & DLM_IFL_OVERLAP_CANCEL;
+	return test_bit(DLM_IFL_OVERLAP_CANCEL_BIT, &lkb->lkb_iflags);
 }
 
 static inline int is_overlap(struct dlm_lkb *lkb)
 {
-	return (lkb->lkb_flags & (DLM_IFL_OVERLAP_UNLOCK |
-				  DLM_IFL_OVERLAP_CANCEL));
+	return test_bit(DLM_IFL_OVERLAP_UNLOCK_BIT, &lkb->lkb_iflags) ||
+	       test_bit(DLM_IFL_OVERLAP_CANCEL_BIT, &lkb->lkb_iflags);
 }
 
 static void queue_cast(struct dlm_rsb *r, struct dlm_lkb *lkb, int rv)
@@ -293,10 +294,9 @@ static void queue_cast(struct dlm_rsb *r, struct dlm_lkb *lkb, int rv)
 
 	DLM_ASSERT(lkb->lkb_lksb, dlm_print_lkb(lkb););
 
-	if (rv == -DLM_ECANCEL && (lkb->lkb_flags & DLM_IFL_DEADLOCK_CANCEL)) {
-		lkb->lkb_flags &= ~DLM_IFL_DEADLOCK_CANCEL;
+	if (rv == -DLM_ECANCEL &&
+	    test_and_clear_bit(DLM_IFL_DEADLOCK_CANCEL_BIT, &lkb->lkb_iflags))
 		rv = -EDEADLK;
-	}
 
 	dlm_add_cb(lkb, DLM_CB_CAST, lkb->lkb_grmode, rv, lkb->lkb_sbflags);
 }
@@ -1419,10 +1419,10 @@ static int add_to_waiters(struct dlm_lkb *lkb, int mstype, int to_nodeid)
 	if (lkb->lkb_wait_type || is_overlap_cancel(lkb)) {
 		switch (mstype) {
 		case DLM_MSG_UNLOCK:
-			lkb->lkb_flags |= DLM_IFL_OVERLAP_UNLOCK;
+			set_bit(DLM_IFL_OVERLAP_UNLOCK_BIT, &lkb->lkb_iflags);
 			break;
 		case DLM_MSG_CANCEL:
-			lkb->lkb_flags |= DLM_IFL_OVERLAP_CANCEL;
+			set_bit(DLM_IFL_OVERLAP_CANCEL_BIT, &lkb->lkb_iflags);
 			break;
 		default:
 			error = -EBUSY;
@@ -1433,7 +1433,7 @@ static int add_to_waiters(struct dlm_lkb *lkb, int mstype, int to_nodeid)
 
 		log_debug(ls, "addwait %x cur %d overlap %d count %d f %x",
 			  lkb->lkb_id, lkb->lkb_wait_type, mstype,
-			  lkb->lkb_wait_count, lkb->lkb_flags);
+			  lkb->lkb_wait_count, dlm_iflags_val(lkb));
 		goto out;
 	}
 
@@ -1449,7 +1449,7 @@ static int add_to_waiters(struct dlm_lkb *lkb, int mstype, int to_nodeid)
  out:
 	if (error)
 		log_error(ls, "addwait error %x %d flags %x %d %d %s",
-			  lkb->lkb_id, error, lkb->lkb_flags, mstype,
+			  lkb->lkb_id, error, dlm_iflags_val(lkb), mstype,
 			  lkb->lkb_wait_type, lkb->lkb_resource->res_name);
 	mutex_unlock(&ls->ls_waiters_mutex);
 	return error;
@@ -1466,16 +1466,16 @@ static int _remove_from_waiters(struct dlm_lkb *lkb, int mstype,
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
 	int overlap_done = 0;
 
-	if (is_overlap_unlock(lkb) && (mstype == DLM_MSG_UNLOCK_REPLY)) {
+	if (mstype == DLM_MSG_UNLOCK_REPLY &&
+	    test_and_clear_bit(DLM_IFL_OVERLAP_UNLOCK_BIT, &lkb->lkb_iflags)) {
 		log_debug(ls, "remwait %x unlock_reply overlap", lkb->lkb_id);
-		lkb->lkb_flags &= ~DLM_IFL_OVERLAP_UNLOCK;
 		overlap_done = 1;
 		goto out_del;
 	}
 
-	if (is_overlap_cancel(lkb) && (mstype == DLM_MSG_CANCEL_REPLY)) {
+	if (mstype == DLM_MSG_CANCEL_REPLY &&
+	    test_and_clear_bit(DLM_IFL_OVERLAP_CANCEL_BIT, &lkb->lkb_iflags)) {
 		log_debug(ls, "remwait %x cancel_reply overlap", lkb->lkb_id);
-		lkb->lkb_flags &= ~DLM_IFL_OVERLAP_CANCEL;
 		overlap_done = 1;
 		goto out_del;
 	}
@@ -1499,12 +1499,11 @@ static int _remove_from_waiters(struct dlm_lkb *lkb, int mstype,
 	   lingering state of the cancel and fail with -EBUSY. */
 
 	if ((mstype == DLM_MSG_CONVERT_REPLY) &&
-	    (lkb->lkb_wait_type == DLM_MSG_CONVERT) &&
-	    is_overlap_cancel(lkb) && ms && !ms->m_result) {
+	    (lkb->lkb_wait_type == DLM_MSG_CONVERT) && ms && !ms->m_result &&
+	    test_and_clear_bit(DLM_IFL_OVERLAP_CANCEL_BIT, &lkb->lkb_iflags)) {
 		log_debug(ls, "remwait %x convert_reply zap overlap_cancel",
 			  lkb->lkb_id);
 		lkb->lkb_wait_type = 0;
-		lkb->lkb_flags &= ~DLM_IFL_OVERLAP_CANCEL;
 		lkb->lkb_wait_count--;
 		unhold_lkb(lkb);
 		goto out_del;
@@ -1520,7 +1519,7 @@ static int _remove_from_waiters(struct dlm_lkb *lkb, int mstype,
 
 	log_error(ls, "remwait error %x remote %d %x msg %d flags %x no wait",
 		  lkb->lkb_id, ms ? le32_to_cpu(ms->m_header.h_nodeid) : 0,
-		  lkb->lkb_remid, mstype, lkb->lkb_flags);
+		  lkb->lkb_remid, mstype, dlm_iflags_val(lkb));
 	return -1;
 
  out_del:
@@ -1539,7 +1538,7 @@ static int _remove_from_waiters(struct dlm_lkb *lkb, int mstype,
 
 	DLM_ASSERT(lkb->lkb_wait_count, dlm_print_lkb(lkb););
 
-	lkb->lkb_flags &= ~DLM_IFL_RESEND;
+	clear_bit(DLM_IFL_RESEND_BIT, &lkb->lkb_iflags);
 	lkb->lkb_wait_count--;
 	if (!lkb->lkb_wait_count)
 		list_del_init(&lkb->lkb_wait_reply);
@@ -2677,7 +2676,7 @@ static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 			goto out;
 
 		rv = -EINVAL;
-		if (lkb->lkb_flags & DLM_IFL_MSTCPY)
+		if (test_bit(DLM_IFL_MSTCPY_BIT, &lkb->lkb_iflags))
 			goto out;
 
 		if (args->flags & DLM_LKF_QUECVT &&
@@ -2703,13 +2702,13 @@ static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 		/* annoy the user because dlm usage is wrong */
 		WARN_ON(1);
 		log_error(ls, "%s %d %x %x %x %d %d %s", __func__,
-			  rv, lkb->lkb_id, lkb->lkb_flags, args->flags,
+			  rv, lkb->lkb_id, dlm_iflags_val(lkb), args->flags,
 			  lkb->lkb_status, lkb->lkb_wait_type,
 			  lkb->lkb_resource->res_name);
 		break;
 	default:
 		log_debug(ls, "%s %d %x %x %x %d %d %s", __func__,
-			  rv, lkb->lkb_id, lkb->lkb_flags, args->flags,
+			  rv, lkb->lkb_id, dlm_iflags_val(lkb), args->flags,
 			  lkb->lkb_status, lkb->lkb_wait_type,
 			  lkb->lkb_resource->res_name);
 		break;
@@ -2752,7 +2751,7 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 	}
 
 	rv = -EINVAL;
-	if (lkb->lkb_flags & DLM_IFL_MSTCPY) {
+	if (test_bit(DLM_IFL_MSTCPY_BIT, &lkb->lkb_iflags)) {
 		log_error(ls, "unlock on MSTCPY %x", lkb->lkb_id);
 		dlm_print_lkb(lkb);
 		goto out;
@@ -2763,7 +2762,7 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 	 * locks; return same error as if the lkid had not been found at all
 	 */
 
-	if (lkb->lkb_flags & DLM_IFL_ENDOFLIFE) {
+	if (test_bit(DLM_IFL_ENDOFLIFE_BIT, &lkb->lkb_iflags)) {
 		log_debug(ls, "unlock on ENDOFLIFE %x", lkb->lkb_id);
 		rv = -ENOENT;
 		goto out;
@@ -2778,8 +2777,8 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 		if (is_overlap(lkb))
 			goto out;
 
-		if (lkb->lkb_flags & DLM_IFL_RESEND) {
-			lkb->lkb_flags |= DLM_IFL_OVERLAP_CANCEL;
+		if (test_bit(DLM_IFL_RESEND_BIT, &lkb->lkb_iflags)) {
+			set_bit(DLM_IFL_OVERLAP_CANCEL_BIT, &lkb->lkb_iflags);
 			rv = -EBUSY;
 			goto out;
 		}
@@ -2794,7 +2793,7 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 		switch (lkb->lkb_wait_type) {
 		case DLM_MSG_LOOKUP:
 		case DLM_MSG_REQUEST:
-			lkb->lkb_flags |= DLM_IFL_OVERLAP_CANCEL;
+			set_bit(DLM_IFL_OVERLAP_CANCEL_BIT, &lkb->lkb_iflags);
 			rv = -EBUSY;
 			goto out;
 		case DLM_MSG_UNLOCK:
@@ -2816,8 +2815,8 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 		if (is_overlap_unlock(lkb))
 			goto out;
 
-		if (lkb->lkb_flags & DLM_IFL_RESEND) {
-			lkb->lkb_flags |= DLM_IFL_OVERLAP_UNLOCK;
+		if (test_bit(DLM_IFL_RESEND_BIT, &lkb->lkb_iflags)) {
+			set_bit(DLM_IFL_OVERLAP_UNLOCK_BIT, &lkb->lkb_iflags);
 			rv = -EBUSY;
 			goto out;
 		}
@@ -2825,7 +2824,7 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 		switch (lkb->lkb_wait_type) {
 		case DLM_MSG_LOOKUP:
 		case DLM_MSG_REQUEST:
-			lkb->lkb_flags |= DLM_IFL_OVERLAP_UNLOCK;
+			set_bit(DLM_IFL_OVERLAP_UNLOCK_BIT, &lkb->lkb_iflags);
 			rv = -EBUSY;
 			goto out;
 		case DLM_MSG_UNLOCK:
@@ -2848,13 +2847,13 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 		/* annoy the user because dlm usage is wrong */
 		WARN_ON(1);
 		log_error(ls, "%s %d %x %x %x %x %d %s", __func__, rv,
-			  lkb->lkb_id, lkb->lkb_flags, lkb->lkb_exflags,
+			  lkb->lkb_id, dlm_iflags_val(lkb), lkb->lkb_exflags,
 			  args->flags, lkb->lkb_wait_type,
 			  lkb->lkb_resource->res_name);
 		break;
 	default:
 		log_debug(ls, "%s %d %x %x %x %x %d %s", __func__, rv,
-			  lkb->lkb_id, lkb->lkb_flags, lkb->lkb_exflags,
+			  lkb->lkb_id, dlm_iflags_val(lkb), lkb->lkb_exflags,
 			  args->flags, lkb->lkb_wait_type,
 			  lkb->lkb_resource->res_name);
 		break;
@@ -3827,7 +3826,8 @@ static int validate_message(struct dlm_lkb *lkb, struct dlm_message *ms)
 		log_error(lkb->lkb_resource->res_ls,
 			  "ignore invalid message %d from %d %x %x %x %d",
 			  le32_to_cpu(ms->m_type), from, lkb->lkb_id,
-			  lkb->lkb_remid, lkb->lkb_flags, lkb->lkb_nodeid);
+			  lkb->lkb_remid, dlm_iflags_val(lkb),
+			  lkb->lkb_nodeid);
 	return error;
 }
 
@@ -3845,7 +3845,7 @@ static int receive_request(struct dlm_ls *ls, struct dlm_message *ms)
 		goto fail;
 
 	receive_flags(lkb, ms);
-	lkb->lkb_flags |= DLM_IFL_MSTCPY;
+	set_bit(DLM_IFL_MSTCPY_BIT, &lkb->lkb_iflags);
 	error = receive_request_args(ls, lkb, ms);
 	if (error) {
 		__put_lkb(ls, lkb);
@@ -4324,20 +4324,21 @@ static int receive_request_reply(struct dlm_ls *ls, struct dlm_message *ms)
 			  lkb->lkb_id, result);
 	}
 
-	if (is_overlap_unlock(lkb) && (result == 0 || result == -EINPROGRESS)) {
+	if ((result == 0 || result == -EINPROGRESS) &&
+	    test_and_clear_bit(DLM_IFL_OVERLAP_UNLOCK_BIT, &lkb->lkb_iflags)) {
 		log_debug(ls, "receive_request_reply %x result %d unlock",
 			  lkb->lkb_id, result);
-		lkb->lkb_flags &= ~DLM_IFL_OVERLAP_UNLOCK;
-		lkb->lkb_flags &= ~DLM_IFL_OVERLAP_CANCEL;
+		clear_bit(DLM_IFL_OVERLAP_CANCEL_BIT, &lkb->lkb_iflags);
 		send_unlock(r, lkb);
-	} else if (is_overlap_cancel(lkb) && (result == -EINPROGRESS)) {
+	} else if ((result == -EINPROGRESS) &&
+		   test_and_clear_bit(DLM_IFL_OVERLAP_CANCEL_BIT,
+				      &lkb->lkb_iflags)) {
 		log_debug(ls, "receive_request_reply %x cancel", lkb->lkb_id);
-		lkb->lkb_flags &= ~DLM_IFL_OVERLAP_UNLOCK;
-		lkb->lkb_flags &= ~DLM_IFL_OVERLAP_CANCEL;
+		clear_bit(DLM_IFL_OVERLAP_UNLOCK_BIT, &lkb->lkb_iflags);
 		send_cancel(r, lkb);
 	} else {
-		lkb->lkb_flags &= ~DLM_IFL_OVERLAP_CANCEL;
-		lkb->lkb_flags &= ~DLM_IFL_OVERLAP_UNLOCK;
+		clear_bit(DLM_IFL_OVERLAP_CANCEL_BIT, &lkb->lkb_iflags);
+		clear_bit(DLM_IFL_OVERLAP_UNLOCK_BIT, &lkb->lkb_iflags);
 	}
  out:
 	unlock_rsb(r);
@@ -4593,7 +4594,7 @@ static void receive_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms)
 
 	if (is_overlap(lkb)) {
 		log_debug(ls, "receive_lookup_reply %x unlock %x",
-			  lkb->lkb_id, lkb->lkb_flags);
+			  lkb->lkb_id, dlm_iflags_val(lkb));
 		queue_cast_overlap(r, lkb);
 		unhold_lkb(lkb); /* undoes create_lkb() */
 		goto out_list;
@@ -4852,7 +4853,7 @@ static void recover_convert_waiter(struct dlm_ls *ls, struct dlm_lkb *lkb,
 		unhold_lkb(lkb);
 
 	} else if (lkb->lkb_rqmode >= lkb->lkb_grmode) {
-		lkb->lkb_flags |= DLM_IFL_RESEND;
+		set_bit(DLM_IFL_RESEND_BIT, &lkb->lkb_iflags);
 	}
 
 	/* lkb->lkb_rqmode < lkb->lkb_grmode shouldn't happen since down
@@ -4916,7 +4917,7 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 		   resent after recovery is done */
 
 		if (lkb->lkb_wait_type == DLM_MSG_LOOKUP) {
-			lkb->lkb_flags |= DLM_IFL_RESEND;
+			set_bit(DLM_IFL_RESEND_BIT, &lkb->lkb_iflags);
 			continue;
 		}
 
@@ -4945,14 +4946,14 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 			}
 
 			log_debug(ls, "rwpre overlap %x %x %d %d %d",
-				  lkb->lkb_id, lkb->lkb_flags, wait_type,
+				  lkb->lkb_id, dlm_iflags_val(lkb), wait_type,
 				  local_cancel_result, local_unlock_result);
 		}
 
 		switch (wait_type) {
 
 		case DLM_MSG_REQUEST:
-			lkb->lkb_flags |= DLM_IFL_RESEND;
+			set_bit(DLM_IFL_RESEND_BIT, &lkb->lkb_iflags);
 			break;
 
 		case DLM_MSG_CONVERT:
@@ -4995,7 +4996,7 @@ static struct dlm_lkb *find_resend_waiter(struct dlm_ls *ls)
 
 	mutex_lock(&ls->ls_waiters_mutex);
 	list_for_each_entry(iter, &ls->ls_waiters, lkb_wait_reply) {
-		if (iter->lkb_flags & DLM_IFL_RESEND) {
+		if (test_bit(DLM_IFL_RESEND_BIT, &iter->lkb_iflags)) {
 			hold_lkb(iter);
 			lkb = iter;
 			break;
@@ -5044,8 +5045,10 @@ int dlm_recover_waiters_post(struct dlm_ls *ls)
 		lock_rsb(r);
 
 		mstype = lkb->lkb_wait_type;
-		oc = is_overlap_cancel(lkb);
-		ou = is_overlap_unlock(lkb);
+		oc = test_and_clear_bit(DLM_IFL_OVERLAP_CANCEL_BIT,
+					&lkb->lkb_iflags);
+		ou = test_and_clear_bit(DLM_IFL_OVERLAP_UNLOCK_BIT,
+					&lkb->lkb_iflags);
 		err = 0;
 
 		log_debug(ls, "waiter %x remote %x msg %d r_nodeid %d "
@@ -5058,9 +5061,7 @@ int dlm_recover_waiters_post(struct dlm_ls *ls)
 		   previous op or overlap op on this lock.  First, do a big
 		   remove_from_waiters() for all previous ops. */
 
-		lkb->lkb_flags &= ~DLM_IFL_RESEND;
-		lkb->lkb_flags &= ~DLM_IFL_OVERLAP_UNLOCK;
-		lkb->lkb_flags &= ~DLM_IFL_OVERLAP_CANCEL;
+		clear_bit(DLM_IFL_RESEND_BIT, &lkb->lkb_iflags);
 		lkb->lkb_wait_type = 0;
 		/* drop all wait_count references we still
 		 * hold a reference for this iteration.
@@ -5346,7 +5347,7 @@ static int receive_rcom_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	lkb->lkb_remid = le32_to_cpu(rl->rl_lkid);
 	lkb->lkb_exflags = le32_to_cpu(rl->rl_exflags);
 	dlm_set_dflags_val(lkb, le32_to_cpu(rl->rl_flags));
-	lkb->lkb_flags |= DLM_IFL_MSTCPY;
+	set_bit(DLM_IFL_MSTCPY_BIT, &lkb->lkb_iflags);
 	lkb->lkb_lvbseq = le32_to_cpu(rl->rl_lvbseq);
 	lkb->lkb_rqmode = rl->rl_rqmode;
 	lkb->lkb_grmode = rl->rl_grmode;
@@ -5855,7 +5856,7 @@ int dlm_user_deadlock(struct dlm_ls *ls, uint32_t flags, uint32_t lkid)
 	error = validate_unlock_args(lkb, &args);
 	if (error)
 		goto out_r;
-	lkb->lkb_flags |= DLM_IFL_DEADLOCK_CANCEL;
+	set_bit(DLM_IFL_DEADLOCK_CANCEL_BIT, &lkb->lkb_iflags);
 
 	error = _cancel_lock(r, lkb);
  out_r:
@@ -5934,7 +5935,7 @@ static struct dlm_lkb *del_proc_lock(struct dlm_ls *ls,
 	if (lkb->lkb_exflags & DLM_LKF_PERSISTENT)
 		set_bit(DLM_DFL_ORPHAN_BIT, &lkb->lkb_dflags);
 	else
-		lkb->lkb_flags |= DLM_IFL_DEAD;
+		set_bit(DLM_IFL_DEAD_BIT, &lkb->lkb_iflags);
  out:
 	spin_unlock(&ls->ls_clear_proc_locks);
 	return lkb;
@@ -5977,7 +5978,7 @@ void dlm_clear_proc_locks(struct dlm_ls *ls, struct dlm_user_proc *proc)
 	/* in-progress unlocks */
 	list_for_each_entry_safe(lkb, safe, &proc->unlocking, lkb_ownqueue) {
 		list_del_init(&lkb->lkb_ownqueue);
-		lkb->lkb_flags |= DLM_IFL_DEAD;
+		set_bit(DLM_IFL_DEAD_BIT, &lkb->lkb_iflags);
 		dlm_put_lkb(lkb);
 	}
 
@@ -6008,7 +6009,7 @@ static void purge_proc_locks(struct dlm_ls *ls, struct dlm_user_proc *proc)
 		if (!lkb)
 			break;
 
-		lkb->lkb_flags |= DLM_IFL_DEAD;
+		set_bit(DLM_IFL_DEAD_BIT, &lkb->lkb_iflags);
 		unlock_proc_lock(ls, lkb);
 		dlm_put_lkb(lkb); /* ref from proc->locks list */
 	}
@@ -6016,7 +6017,7 @@ static void purge_proc_locks(struct dlm_ls *ls, struct dlm_user_proc *proc)
 	spin_lock(&proc->locks_spin);
 	list_for_each_entry_safe(lkb, safe, &proc->unlocking, lkb_ownqueue) {
 		list_del_init(&lkb->lkb_ownqueue);
-		lkb->lkb_flags |= DLM_IFL_DEAD;
+		set_bit(DLM_IFL_DEAD_BIT, &lkb->lkb_iflags);
 		dlm_put_lkb(lkb);
 	}
 	spin_unlock(&proc->locks_spin);
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index de9bb775236d..67261b7b1f0e 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -741,7 +741,7 @@ static int lkb_idr_free(int id, void *p, void *data)
 {
 	struct dlm_lkb *lkb = p;
 
-	if (lkb->lkb_lvbptr && lkb->lkb_flags & DLM_IFL_MSTCPY)
+	if (lkb->lkb_lvbptr && test_bit(DLM_IFL_MSTCPY_BIT, &lkb->lkb_iflags))
 		dlm_free_lvb(lkb->lkb_lvbptr);
 
 	dlm_free_lkb(lkb);
diff --git a/fs/dlm/recover.c b/fs/dlm/recover.c
index ccff1791803f..29d71a5018d4 100644
--- a/fs/dlm/recover.c
+++ b/fs/dlm/recover.c
@@ -403,7 +403,7 @@ static void set_lock_master(struct list_head *queue, int nodeid)
 	struct dlm_lkb *lkb;
 
 	list_for_each_entry(lkb, queue, lkb_statequeue) {
-		if (!(lkb->lkb_flags & DLM_IFL_MSTCPY)) {
+		if (!test_bit(DLM_IFL_MSTCPY_BIT, &lkb->lkb_iflags)) {
 			lkb->lkb_nodeid = nodeid;
 			lkb->lkb_remid = 0;
 		}
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index 233c88e46710..d9c09fc0aba1 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -184,7 +184,7 @@ void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
 	int rv;
 
 	if (test_bit(DLM_DFL_ORPHAN_BIT, &lkb->lkb_dflags) ||
-	    lkb->lkb_flags & DLM_IFL_DEAD)
+	    test_bit(DLM_IFL_DEAD_BIT, &lkb->lkb_iflags))
 		return;
 
 	ls = lkb->lkb_resource->res_ls;
@@ -197,7 +197,7 @@ void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
 	   began before clear_proc_locks did its cancel/unlock. */
 
 	if (test_bit(DLM_DFL_ORPHAN_BIT, &lkb->lkb_dflags) ||
-	    lkb->lkb_flags & DLM_IFL_DEAD)
+	    test_bit(DLM_IFL_DEAD_BIT, &lkb->lkb_iflags))
 		goto out;
 
 	DLM_ASSERT(lkb->lkb_ua, dlm_print_lkb(lkb););
@@ -208,7 +208,7 @@ void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
 		goto out;
 
 	if ((flags & DLM_CB_CAST) && lkb_is_endoflife(mode, status))
-		lkb->lkb_flags |= DLM_IFL_ENDOFLIFE;
+		set_bit(DLM_IFL_ENDOFLIFE_BIT, &lkb->lkb_iflags);
 
 	spin_lock(&proc->asts_spin);
 
@@ -231,7 +231,7 @@ void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
 	}
 	spin_unlock(&proc->asts_spin);
 
-	if (lkb->lkb_flags & DLM_IFL_ENDOFLIFE) {
+	if (test_bit(DLM_IFL_ENDOFLIFE_BIT, &lkb->lkb_iflags)) {
 		/* N.B. spin_lock locks_spin, not asts_spin */
 		spin_lock(&proc->locks_spin);
 		if (!list_empty(&lkb->lkb_ownqueue)) {
-- 
2.31.1

