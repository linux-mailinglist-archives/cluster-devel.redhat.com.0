Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B4C6ACF7C
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Mar 2023 21:48:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678135714;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ABZgLira8ZelHyLqyct3xs14+5AsS/a4D2VlJXGjZhE=;
	b=LmQwRel8ifHUeeKQwVyvJs+now+E2vfekSts78/iir3TC6iN5SV/jIYPrysRdoPLSuM7xO
	EuDuraaTlzQZ5AJB4LElh8736b/r7du8eVCXiHMpndoJ5KUgd7xO9KCTObNwZgjKPMrs9D
	TvdKAE8sFHhsolpf/rk5g7YTzAeJQaE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-nNzTcyYFMC-B9rfQjdU7Qw-1; Mon, 06 Mar 2023 15:48:31 -0500
X-MC-Unique: nNzTcyYFMC-B9rfQjdU7Qw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E05B1C29D4C;
	Mon,  6 Mar 2023 20:48:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62D0914171C3;
	Mon,  6 Mar 2023 20:48:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 337781946594;
	Mon,  6 Mar 2023 20:48:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 422D41946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 32F6D51FF; Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F2DE175AD;
 Mon,  6 Mar 2023 20:48:27 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  6 Mar 2023 15:48:15 -0500
Message-Id: <20230306204819.2747646-9-aahringo@redhat.com>
In-Reply-To: <20230306204819.2747646-1-aahringo@redhat.com>
References: <20230306204819.2747646-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v6.3-rc1 08/12] fs: dlm: change dflags to
 use atomic bits
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Currently manipulating lkb_dflags assumes to held the rsb lock assigned
to the lkb. This is held by dlm message processing after certain
time to lookup the right rsb from the received lkb message id. For user
space locks flags, which is currently the only use case for lkb_dflags,
flags are also being set during dlm character device handling without
holding the rsb lock. To minimize the risk that bit operations are
getting corrupted we switch to atomic bit operations. This patch will
also introduce helpers to snapshot atomic bit values in an non atomic
way. There might be still issues with the flag handling e.g. running in
case of manipulating bit ops and snapshot them at the same time, but this
patch minimize them and will start to use atomic bit operations.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c               |  2 +-
 fs/dlm/debug_fs.c          |  4 ++--
 fs/dlm/dlm_internal.h      | 46 +++++++++++++++++++++++++++++++++++---
 fs/dlm/lock.c              | 26 ++++++++++-----------
 fs/dlm/memory.c            |  2 +-
 fs/dlm/rcom.c              |  2 +-
 fs/dlm/user.c              |  4 ++--
 include/trace/events/dlm.h |  4 ++--
 8 files changed, 65 insertions(+), 25 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 28b7b5288bd4..700ff2e0515a 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -139,7 +139,7 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
 	int rv;
 
-	if (lkb->lkb_dflags & DLM_DFL_USER) {
+	if (test_bit(DLM_DFL_USER_BIT, &lkb->lkb_dflags)) {
 		dlm_user_add_ast(lkb, flags, mode, status, sbflags);
 		return;
 	}
diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 65cfb58eaa6b..370a0c81a0b3 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -170,7 +170,7 @@ static void print_format2_lock(struct seq_file *s, struct dlm_lkb *lkb,
 	u64 xid = 0;
 	u64 us;
 
-	if (lkb->lkb_dflags & DLM_DFL_USER) {
+	if (test_bit(DLM_DFL_USER_BIT, &lkb->lkb_dflags)) {
 		if (lkb->lkb_ua)
 			xid = lkb->lkb_ua->xid;
 	}
@@ -230,7 +230,7 @@ static void print_format3_lock(struct seq_file *s, struct dlm_lkb *lkb,
 {
 	u64 xid = 0;
 
-	if (lkb->lkb_dflags & DLM_DFL_USER) {
+	if (test_bit(DLM_DFL_USER_BIT, &lkb->lkb_dflags)) {
 		if (lkb->lkb_ua)
 			xid = lkb->lkb_ua->xid;
 	}
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 748bb483da1c..cd4f89217ee1 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -208,8 +208,10 @@ struct dlm_args {
 
 /* lkb_dflags */
 
-#define DLM_DFL_USER		0x00000001
-#define DLM_DFL_ORPHAN		0x00000002
+#define DLM_DFL_USER_BIT	0
+#define __DLM_DFL_MIN_BIT	DLM_DFL_USER_BIT
+#define DLM_DFL_ORPHAN_BIT	1
+#define __DLM_DFL_MAX_BIT	DLM_DFL_ORPHAN_BIT
 
 #define DLM_CB_CAST		0x00000001
 #define DLM_CB_BAST		0x00000002
@@ -234,7 +236,7 @@ struct dlm_lkb {
 	uint32_t		lkb_exflags;	/* external flags from caller */
 	uint32_t		lkb_sbflags;	/* lksb flags */
 	uint32_t		lkb_flags;	/* internal flags */
-	uint32_t		lkb_dflags;	/* distributed flags */
+	unsigned long		lkb_dflags;	/* distributed flags */
 	unsigned long		lkb_iflags;	/* internal flags */
 	uint32_t		lkb_lvbseq;	/* lvb sequence number */
 
@@ -733,6 +735,44 @@ static inline int dlm_no_directory(struct dlm_ls *ls)
 	return test_bit(LSFL_NODIR, &ls->ls_flags);
 }
 
+/* takes a snapshot from dlm atomic flags */
+static inline uint32_t dlm_flags_val(const unsigned long *addr,
+				     uint32_t min, uint32_t max)
+{
+	uint32_t bit = min, val = 0;
+
+	for_each_set_bit_from(bit, addr, max + 1) {
+		val |= BIT(bit);
+	}
+
+	return val;
+}
+
+static inline uint32_t dlm_dflags_val(const struct dlm_lkb *lkb)
+{
+	return dlm_flags_val(&lkb->lkb_dflags, __DLM_DFL_MIN_BIT,
+			     __DLM_DFL_MAX_BIT);
+}
+
+static inline void dlm_set_flags_val(unsigned long *addr, uint32_t val,
+				     uint32_t min, uint32_t max)
+{
+	uint32_t bit;
+
+	for (bit = min; bit < (max + 1); bit++) {
+		if (val & BIT(bit))
+			set_bit(bit, addr);
+		else
+			clear_bit(bit, addr);
+	}
+}
+
+static inline void dlm_set_dflags_val(struct dlm_lkb *lkb, uint32_t val)
+{
+	dlm_set_flags_val(&lkb->lkb_dflags, val, __DLM_DFL_MIN_BIT,
+			  __DLM_DFL_MAX_BIT);
+}
+
 int dlm_plock_init(void);
 void dlm_plock_exit(void);
 
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 21c7abd7ef77..70737352d595 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -3410,7 +3410,7 @@ static void send_args(struct dlm_rsb *r, struct dlm_lkb *lkb,
 	ms->m_remid    = cpu_to_le32(lkb->lkb_remid);
 	ms->m_exflags  = cpu_to_le32(lkb->lkb_exflags);
 	ms->m_sbflags  = cpu_to_le32(lkb->lkb_sbflags);
-	ms->m_flags    = cpu_to_le32(lkb->lkb_flags);
+	ms->m_flags    = cpu_to_le32(dlm_dflags_val(lkb));
 	ms->m_lvbseq   = cpu_to_le32(lkb->lkb_lvbseq);
 	ms->m_status   = cpu_to_le32(lkb->lkb_status);
 	ms->m_grmode   = cpu_to_le32(lkb->lkb_grmode);
@@ -3675,7 +3675,7 @@ static void receive_flags(struct dlm_lkb *lkb, struct dlm_message *ms)
 {
 	lkb->lkb_exflags = le32_to_cpu(ms->m_exflags);
 	lkb->lkb_sbflags = le32_to_cpu(ms->m_sbflags);
-	lkb->lkb_dflags = le32_to_cpu(ms->m_flags);
+	dlm_set_dflags_val(lkb, le32_to_cpu(ms->m_flags));
 }
 
 static void receive_flags_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
@@ -3685,7 +3685,7 @@ static void receive_flags_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
 		return;
 
 	lkb->lkb_sbflags = le32_to_cpu(ms->m_sbflags);
-	lkb->lkb_dflags = le32_to_cpu(ms->m_flags);
+	dlm_set_dflags_val(lkb, le32_to_cpu(ms->m_flags));
 }
 
 static int receive_extralen(struct dlm_message *ms)
@@ -3786,8 +3786,8 @@ static int validate_message(struct dlm_lkb *lkb, struct dlm_message *ms)
 	int error = 0;
 
 	/* currently mixing of user/kernel locks are not supported */
-	if (ms->m_flags & cpu_to_le32(DLM_DFL_USER) &&
-	    ~lkb->lkb_dflags & DLM_DFL_USER) {
+	if (ms->m_flags & cpu_to_le32(BIT(DLM_DFL_USER_BIT)) &&
+	    !test_bit(DLM_DFL_USER_BIT, &lkb->lkb_dflags)) {
 		log_error(lkb->lkb_resource->res_ls,
 			  "got user dlm message for a kernel lock");
 		error = -EINVAL;
@@ -5345,7 +5345,7 @@ static int receive_rcom_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	lkb->lkb_ownpid = le32_to_cpu(rl->rl_ownpid);
 	lkb->lkb_remid = le32_to_cpu(rl->rl_lkid);
 	lkb->lkb_exflags = le32_to_cpu(rl->rl_exflags);
-	lkb->lkb_dflags = le32_to_cpu(rl->rl_flags);
+	dlm_set_dflags_val(lkb, le32_to_cpu(rl->rl_flags));
 	lkb->lkb_flags |= DLM_IFL_MSTCPY;
 	lkb->lkb_lvbseq = le32_to_cpu(rl->rl_lvbseq);
 	lkb->lkb_rqmode = rl->rl_rqmode;
@@ -5571,9 +5571,9 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 	}
 
 	/* After ua is attached to lkb it will be freed by dlm_free_lkb().
-	   When DLM_DFL_USER is set, the dlm knows that this is a userspace
+	   When DLM_DFL_USER_BIT is set, the dlm knows that this is a userspace
 	   lock and that lkb_astparam is the dlm_user_args structure. */
-	lkb->lkb_dflags |= DLM_DFL_USER;
+	set_bit(DLM_DFL_USER_BIT, &lkb->lkb_dflags);
 	error = request_lock(ls, lkb, name, namelen, &args);
 
 	switch (error) {
@@ -5688,7 +5688,7 @@ int dlm_user_adopt_orphan(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 
 		lkb = iter;
 		list_del_init(&iter->lkb_ownqueue);
-		iter->lkb_dflags &= ~DLM_DFL_ORPHAN;
+		clear_bit(DLM_DFL_ORPHAN_BIT, &iter->lkb_dflags);
 		*lkid = iter->lkb_id;
 		break;
 	}
@@ -5932,7 +5932,7 @@ static struct dlm_lkb *del_proc_lock(struct dlm_ls *ls,
 	list_del_init(&lkb->lkb_ownqueue);
 
 	if (lkb->lkb_exflags & DLM_LKF_PERSISTENT)
-		lkb->lkb_dflags |= DLM_DFL_ORPHAN;
+		set_bit(DLM_DFL_ORPHAN_BIT, &lkb->lkb_dflags);
 	else
 		lkb->lkb_flags |= DLM_IFL_DEAD;
  out:
@@ -6091,7 +6091,7 @@ int dlm_debug_add_lkb(struct dlm_ls *ls, uint32_t lkb_id, char *name, int len,
 	int error;
 
 	/* we currently can't set a valid user lock */
-	if (lkb_dflags & DLM_DFL_USER)
+	if (lkb_dflags & BIT(DLM_DFL_USER_BIT))
 		return -EOPNOTSUPP;
 
 	lksb = kzalloc(sizeof(*lksb), GFP_NOFS);
@@ -6104,11 +6104,11 @@ int dlm_debug_add_lkb(struct dlm_ls *ls, uint32_t lkb_id, char *name, int len,
 		return error;
 	}
 
-	lkb->lkb_dflags = lkb_dflags;
+	dlm_set_dflags_val(lkb, lkb_dflags);
 	lkb->lkb_nodeid = lkb_nodeid;
 	lkb->lkb_lksb = lksb;
 	/* user specific pointer, just don't have it NULL for kernel locks */
-	if (~lkb_dflags & DLM_DFL_USER)
+	if (~lkb_dflags & BIT(DLM_DFL_USER_BIT))
 		lkb->lkb_astparam = (void *)0xDEADBEEF;
 
 	error = find_rsb(ls, name, len, 0, R_REQUEST, &r);
diff --git a/fs/dlm/memory.c b/fs/dlm/memory.c
index c1a832e8a72b..64f212a066cf 100644
--- a/fs/dlm/memory.c
+++ b/fs/dlm/memory.c
@@ -118,7 +118,7 @@ struct dlm_lkb *dlm_allocate_lkb(struct dlm_ls *ls)
 
 void dlm_free_lkb(struct dlm_lkb *lkb)
 {
-	if (lkb->lkb_dflags & DLM_DFL_USER) {
+	if (test_bit(DLM_DFL_USER_BIT, &lkb->lkb_dflags)) {
 		struct dlm_user_args *ua;
 		ua = lkb->lkb_ua;
 		if (ua) {
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 005ee85218c5..f4afdf892f78 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -415,7 +415,7 @@ static void pack_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb,
 	rl->rl_ownpid = cpu_to_le32(lkb->lkb_ownpid);
 	rl->rl_lkid = cpu_to_le32(lkb->lkb_id);
 	rl->rl_exflags = cpu_to_le32(lkb->lkb_exflags);
-	rl->rl_flags = cpu_to_le32(lkb->lkb_dflags);
+	rl->rl_flags = cpu_to_le32(dlm_dflags_val(lkb));
 	rl->rl_lvbseq = cpu_to_le32(lkb->lkb_lvbseq);
 	rl->rl_rqmode = lkb->lkb_rqmode;
 	rl->rl_grmode = lkb->lkb_grmode;
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index dd4b9c8f226c..233c88e46710 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -183,7 +183,7 @@ void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
 	struct dlm_user_proc *proc;
 	int rv;
 
-	if (lkb->lkb_dflags & DLM_DFL_ORPHAN ||
+	if (test_bit(DLM_DFL_ORPHAN_BIT, &lkb->lkb_dflags) ||
 	    lkb->lkb_flags & DLM_IFL_DEAD)
 		return;
 
@@ -196,7 +196,7 @@ void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
 	   for cases where a completion ast is received for an operation that
 	   began before clear_proc_locks did its cancel/unlock. */
 
-	if (lkb->lkb_dflags & DLM_DFL_ORPHAN ||
+	if (test_bit(DLM_DFL_ORPHAN_BIT, &lkb->lkb_dflags) ||
 	    lkb->lkb_flags & DLM_IFL_DEAD)
 		goto out;
 
diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
index 6fa4798e1939..2b09574e1243 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -47,8 +47,8 @@
 	{ DLM_SBF_ALTMODE,	"ALTMODE" })
 
 #define show_lkb_flags(flags) __print_flags(flags, "|",		\
-	{ DLM_DFL_USER,		"USER" },			\
-	{ DLM_DFL_ORPHAN,	"ORPHAN" })
+	{ BIT(DLM_DFL_USER_BIT), "USER" },			\
+	{ BIT(DLM_DFL_ORPHAN_BIT), "ORPHAN" })
 
 #define show_header_cmd(cmd) __print_symbolic(cmd,		\
 	{ DLM_MSG,		"MSG"},				\
-- 
2.31.1

