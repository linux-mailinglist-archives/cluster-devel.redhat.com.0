Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 660E46ACF78
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Mar 2023 21:48:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678135713;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m/IohWdpUZeUqAeNZwSg1h/YdKMGcBT/snXFN4vofhU=;
	b=dIjva1TFG70/KmjHeyyOYqeebM6xIlPld/xY6AJo8MAJSdrvJnZAYGGmBo8MUhpaslLgwz
	3faAHyjyHK3B1EHl5rSWh4zTY/xx4pMCXG5dDUAJO0KTtVQNoGYHdkfZcd6UQ3ulJgyDDY
	xUhjztobVCAdBb12/2gbjC4mT3JJvNU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-UaOxb8mENyi4RxqrIuw91g-1; Mon, 06 Mar 2023 15:48:29 -0500
X-MC-Unique: UaOxb8mENyi4RxqrIuw91g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48B051024D28;
	Mon,  6 Mar 2023 20:48:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DC221121314;
	Mon,  6 Mar 2023 20:48:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 189FE19465A8;
	Mon,  6 Mar 2023 20:48:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 259B519465B1 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0937451FF; Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA260175AD;
 Mon,  6 Mar 2023 20:48:26 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  6 Mar 2023 15:48:14 -0500
Message-Id: <20230306204819.2747646-8-aahringo@redhat.com>
In-Reply-To: <20230306204819.2747646-1-aahringo@redhat.com>
References: <20230306204819.2747646-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v6.3-rc1 07/12] fs: dlm: store lkb
 distributed flags into own value
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

This patch stores lkb distributed flags value in an separate value
instead of sharing internal and distributed flags in lkb->lkb_flags value.
This has the advantage to not mask/write back flag values in
receive_flags() functionality. The dlm debug_fs does not provide the
distributed flags anymore, those can be added in future.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c               |  2 +-
 fs/dlm/debug_fs.c          |  4 ++--
 fs/dlm/dlm_internal.h      | 15 +++++----------
 fs/dlm/lock.c              | 28 +++++++++++++---------------
 fs/dlm/memory.c            |  2 +-
 fs/dlm/rcom.c              |  2 +-
 fs/dlm/user.c              |  6 ++++--
 include/trace/events/dlm.h | 11 ++---------
 8 files changed, 29 insertions(+), 41 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 39805aea3336..28b7b5288bd4 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -139,7 +139,7 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
 	int rv;
 
-	if (lkb->lkb_flags & DLM_IFL_USER) {
+	if (lkb->lkb_dflags & DLM_DFL_USER) {
 		dlm_user_add_ast(lkb, flags, mode, status, sbflags);
 		return;
 	}
diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 8a0e1b1f74ad..65cfb58eaa6b 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -170,7 +170,7 @@ static void print_format2_lock(struct seq_file *s, struct dlm_lkb *lkb,
 	u64 xid = 0;
 	u64 us;
 
-	if (lkb->lkb_flags & DLM_IFL_USER) {
+	if (lkb->lkb_dflags & DLM_DFL_USER) {
 		if (lkb->lkb_ua)
 			xid = lkb->lkb_ua->xid;
 	}
@@ -230,7 +230,7 @@ static void print_format3_lock(struct seq_file *s, struct dlm_lkb *lkb,
 {
 	u64 xid = 0;
 
-	if (lkb->lkb_flags & DLM_IFL_USER) {
+	if (lkb->lkb_dflags & DLM_DFL_USER) {
 		if (lkb->lkb_ua)
 			xid = lkb->lkb_ua->xid;
 	}
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 3bdb2f4e132e..748bb483da1c 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -206,16 +206,10 @@ struct dlm_args {
 
 #define DLM_IFL_CB_PENDING_BIT	0
 
-/* least significant 2 bytes are message changed, they are full transmitted
- * but at receive side only the 2 bytes LSB will be set.
- *
- * Even wireshark dlm dissector does only evaluate the lower bytes and note
- * that they may not be used on transceiver side, we assume the higher bytes
- * are for internal use or reserved so long they are not parsed on receiver
- * side.
- */
-#define DLM_IFL_USER		0x00000001
-#define DLM_IFL_ORPHAN		0x00000002
+/* lkb_dflags */
+
+#define DLM_DFL_USER		0x00000001
+#define DLM_DFL_ORPHAN		0x00000002
 
 #define DLM_CB_CAST		0x00000001
 #define DLM_CB_BAST		0x00000002
@@ -240,6 +234,7 @@ struct dlm_lkb {
 	uint32_t		lkb_exflags;	/* external flags from caller */
 	uint32_t		lkb_sbflags;	/* lksb flags */
 	uint32_t		lkb_flags;	/* internal flags */
+	uint32_t		lkb_dflags;	/* distributed flags */
 	unsigned long		lkb_iflags;	/* internal flags */
 	uint32_t		lkb_lvbseq;	/* lvb sequence number */
 
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 74dd297e0857..21c7abd7ef77 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -3675,8 +3675,7 @@ static void receive_flags(struct dlm_lkb *lkb, struct dlm_message *ms)
 {
 	lkb->lkb_exflags = le32_to_cpu(ms->m_exflags);
 	lkb->lkb_sbflags = le32_to_cpu(ms->m_sbflags);
-	lkb->lkb_flags = (lkb->lkb_flags & 0xFFFF0000) |
-			  (le32_to_cpu(ms->m_flags) & 0x0000FFFF);
+	lkb->lkb_dflags = le32_to_cpu(ms->m_flags);
 }
 
 static void receive_flags_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
@@ -3686,8 +3685,7 @@ static void receive_flags_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
 		return;
 
 	lkb->lkb_sbflags = le32_to_cpu(ms->m_sbflags);
-	lkb->lkb_flags = (lkb->lkb_flags & 0xFFFF0000) |
-			 (le32_to_cpu(ms->m_flags) & 0x0000FFFF);
+	lkb->lkb_dflags = le32_to_cpu(ms->m_flags);
 }
 
 static int receive_extralen(struct dlm_message *ms)
@@ -3788,8 +3786,8 @@ static int validate_message(struct dlm_lkb *lkb, struct dlm_message *ms)
 	int error = 0;
 
 	/* currently mixing of user/kernel locks are not supported */
-	if (ms->m_flags & cpu_to_le32(DLM_IFL_USER) &&
-	    ~lkb->lkb_flags & DLM_IFL_USER) {
+	if (ms->m_flags & cpu_to_le32(DLM_DFL_USER) &&
+	    ~lkb->lkb_dflags & DLM_DFL_USER) {
 		log_error(lkb->lkb_resource->res_ls,
 			  "got user dlm message for a kernel lock");
 		error = -EINVAL;
@@ -5347,7 +5345,7 @@ static int receive_rcom_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	lkb->lkb_ownpid = le32_to_cpu(rl->rl_ownpid);
 	lkb->lkb_remid = le32_to_cpu(rl->rl_lkid);
 	lkb->lkb_exflags = le32_to_cpu(rl->rl_exflags);
-	lkb->lkb_flags = le32_to_cpu(rl->rl_flags) & 0x0000FFFF;
+	lkb->lkb_dflags = le32_to_cpu(rl->rl_flags);
 	lkb->lkb_flags |= DLM_IFL_MSTCPY;
 	lkb->lkb_lvbseq = le32_to_cpu(rl->rl_lvbseq);
 	lkb->lkb_rqmode = rl->rl_rqmode;
@@ -5573,9 +5571,9 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 	}
 
 	/* After ua is attached to lkb it will be freed by dlm_free_lkb().
-	   When DLM_IFL_USER is set, the dlm knows that this is a userspace
+	   When DLM_DFL_USER is set, the dlm knows that this is a userspace
 	   lock and that lkb_astparam is the dlm_user_args structure. */
-	lkb->lkb_flags |= DLM_IFL_USER;
+	lkb->lkb_dflags |= DLM_DFL_USER;
 	error = request_lock(ls, lkb, name, namelen, &args);
 
 	switch (error) {
@@ -5690,7 +5688,7 @@ int dlm_user_adopt_orphan(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 
 		lkb = iter;
 		list_del_init(&iter->lkb_ownqueue);
-		iter->lkb_flags &= ~DLM_IFL_ORPHAN;
+		iter->lkb_dflags &= ~DLM_DFL_ORPHAN;
 		*lkid = iter->lkb_id;
 		break;
 	}
@@ -5934,7 +5932,7 @@ static struct dlm_lkb *del_proc_lock(struct dlm_ls *ls,
 	list_del_init(&lkb->lkb_ownqueue);
 
 	if (lkb->lkb_exflags & DLM_LKF_PERSISTENT)
-		lkb->lkb_flags |= DLM_IFL_ORPHAN;
+		lkb->lkb_dflags |= DLM_DFL_ORPHAN;
 	else
 		lkb->lkb_flags |= DLM_IFL_DEAD;
  out:
@@ -6085,7 +6083,7 @@ int dlm_user_purge(struct dlm_ls *ls, struct dlm_user_proc *proc,
 
 /* debug functionality */
 int dlm_debug_add_lkb(struct dlm_ls *ls, uint32_t lkb_id, char *name, int len,
-		      int lkb_nodeid, unsigned int lkb_flags, int lkb_status)
+		      int lkb_nodeid, unsigned int lkb_dflags, int lkb_status)
 {
 	struct dlm_lksb *lksb;
 	struct dlm_lkb *lkb;
@@ -6093,7 +6091,7 @@ int dlm_debug_add_lkb(struct dlm_ls *ls, uint32_t lkb_id, char *name, int len,
 	int error;
 
 	/* we currently can't set a valid user lock */
-	if (lkb_flags & DLM_IFL_USER)
+	if (lkb_dflags & DLM_DFL_USER)
 		return -EOPNOTSUPP;
 
 	lksb = kzalloc(sizeof(*lksb), GFP_NOFS);
@@ -6106,11 +6104,11 @@ int dlm_debug_add_lkb(struct dlm_ls *ls, uint32_t lkb_id, char *name, int len,
 		return error;
 	}
 
-	lkb->lkb_flags = lkb_flags;
+	lkb->lkb_dflags = lkb_dflags;
 	lkb->lkb_nodeid = lkb_nodeid;
 	lkb->lkb_lksb = lksb;
 	/* user specific pointer, just don't have it NULL for kernel locks */
-	if (~lkb_flags & DLM_IFL_USER)
+	if (~lkb_dflags & DLM_DFL_USER)
 		lkb->lkb_astparam = (void *)0xDEADBEEF;
 
 	error = find_rsb(ls, name, len, 0, R_REQUEST, &r);
diff --git a/fs/dlm/memory.c b/fs/dlm/memory.c
index cdbaa452fc05..c1a832e8a72b 100644
--- a/fs/dlm/memory.c
+++ b/fs/dlm/memory.c
@@ -118,7 +118,7 @@ struct dlm_lkb *dlm_allocate_lkb(struct dlm_ls *ls)
 
 void dlm_free_lkb(struct dlm_lkb *lkb)
 {
-	if (lkb->lkb_flags & DLM_IFL_USER) {
+	if (lkb->lkb_dflags & DLM_DFL_USER) {
 		struct dlm_user_args *ua;
 		ua = lkb->lkb_ua;
 		if (ua) {
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index b76d52e2f6bd..005ee85218c5 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -415,7 +415,7 @@ static void pack_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb,
 	rl->rl_ownpid = cpu_to_le32(lkb->lkb_ownpid);
 	rl->rl_lkid = cpu_to_le32(lkb->lkb_id);
 	rl->rl_exflags = cpu_to_le32(lkb->lkb_exflags);
-	rl->rl_flags = cpu_to_le32(lkb->lkb_flags);
+	rl->rl_flags = cpu_to_le32(lkb->lkb_dflags);
 	rl->rl_lvbseq = cpu_to_le32(lkb->lkb_lvbseq);
 	rl->rl_rqmode = lkb->lkb_rqmode;
 	rl->rl_grmode = lkb->lkb_grmode;
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index 0951ca5754e2..dd4b9c8f226c 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -183,7 +183,8 @@ void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
 	struct dlm_user_proc *proc;
 	int rv;
 
-	if (lkb->lkb_flags & (DLM_IFL_ORPHAN | DLM_IFL_DEAD))
+	if (lkb->lkb_dflags & DLM_DFL_ORPHAN ||
+	    lkb->lkb_flags & DLM_IFL_DEAD)
 		return;
 
 	ls = lkb->lkb_resource->res_ls;
@@ -195,7 +196,8 @@ void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
 	   for cases where a completion ast is received for an operation that
 	   began before clear_proc_locks did its cancel/unlock. */
 
-	if (lkb->lkb_flags & (DLM_IFL_ORPHAN | DLM_IFL_DEAD))
+	if (lkb->lkb_dflags & DLM_DFL_ORPHAN ||
+	    lkb->lkb_flags & DLM_IFL_DEAD)
 		goto out;
 
 	DLM_ASSERT(lkb->lkb_ua, dlm_print_lkb(lkb););
diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
index cd00b2d34e33..6fa4798e1939 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -47,15 +47,8 @@
 	{ DLM_SBF_ALTMODE,	"ALTMODE" })
 
 #define show_lkb_flags(flags) __print_flags(flags, "|",		\
-	{ DLM_IFL_MSTCPY,	"MSTCPY" },			\
-	{ DLM_IFL_RESEND,	"RESEND" },			\
-	{ DLM_IFL_DEAD,		"DEAD" },			\
-	{ DLM_IFL_OVERLAP_UNLOCK, "OVERLAP_UNLOCK" },		\
-	{ DLM_IFL_OVERLAP_CANCEL, "OVERLAP_CANCEL" },		\
-	{ DLM_IFL_ENDOFLIFE,	"ENDOFLIFE" },			\
-	{ DLM_IFL_DEADLOCK_CANCEL, "DEADLOCK_CANCEL" },		\
-	{ DLM_IFL_USER,		"USER" },			\
-	{ DLM_IFL_ORPHAN,	"ORPHAN" })
+	{ DLM_DFL_USER,		"USER" },			\
+	{ DLM_DFL_ORPHAN,	"ORPHAN" })
 
 #define show_header_cmd(cmd) __print_symbolic(cmd,		\
 	{ DLM_MSG,		"MSG"},				\
-- 
2.31.1

