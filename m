Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB006ACF7D
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Mar 2023 21:48:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678135718;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sV2Uo3zkBSozTWv1LghYMYyTE8MR3DAM5lONpwCE6dM=;
	b=MsZUko0L3lZ0iXhNAI1TPAE5q0nb0XovHpYNy+AWrTmcZIt5LEPL3600nkXDGiZaRXgt/N
	j3vgvbXVhZPoTP0PkCA81h6kFUjrWJtnSLkGyzxrZEHPiE2fSCOq22VYrIRbd2UERkDVbC
	JEiIzk4pEjK3gUqCgmfJW4/nbL6cQuw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-lnWA1nbuPG2pA4bZ4x-LdA-1; Mon, 06 Mar 2023 15:48:31 -0500
X-MC-Unique: lnWA1nbuPG2pA4bZ4x-LdA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88B2C800B23;
	Mon,  6 Mar 2023 20:48:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E3091121314;
	Mon,  6 Mar 2023 20:48:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2518019465B3;
	Mon,  6 Mar 2023 20:48:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BAE2E1946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 20:48:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AC1D3440DE; Mon,  6 Mar 2023 20:48:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88167440E0;
 Mon,  6 Mar 2023 20:48:26 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  6 Mar 2023 15:48:12 -0500
Message-Id: <20230306204819.2747646-6-aahringo@redhat.com>
In-Reply-To: <20230306204819.2747646-1-aahringo@redhat.com>
References: <20230306204819.2747646-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v6.3-rc1 05/12] fs: dlm: rename stub to
 local message flag
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

This patch renames DLM_IFL_STUB_MS to DLM_IFL_LOCAL_MS flag. The
DLM_IFL_STUB_MS flag is somewhat misnamed, it means the dlm message is
used for local message transfer only. It is used by recovery to resolve
lock states if a node got fenced.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h      |   8 +--
 fs/dlm/lock.c              | 106 ++++++++++++++++++-------------------
 fs/dlm/lockspace.c         |   4 +-
 include/trace/events/dlm.h |   2 +-
 4 files changed, 60 insertions(+), 60 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 66863dc15b8f..5e886b1f3519 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -203,7 +203,7 @@ struct dlm_args {
 #define DLM_IFL_OVERLAP_CANCEL  0x00100000
 #define DLM_IFL_ENDOFLIFE	0x00200000
 #define DLM_IFL_DEADLOCK_CANCEL	0x01000000
-#define DLM_IFL_STUB_MS		0x02000000 /* magic number for m_flags */
+#define DLM_IFL_LOCAL_MS	0x02000000 /* magic number for m_flags */
 
 #define DLM_IFL_CB_PENDING_BIT	0
 
@@ -593,9 +593,9 @@ struct dlm_ls {
 	int			ls_slots_size;
 	struct dlm_slot		*ls_slots;
 
-	struct dlm_rsb		ls_stub_rsb;	/* for returning errors */
-	struct dlm_lkb		ls_stub_lkb;	/* for returning errors */
-	struct dlm_message	ls_stub_ms;	/* for faking a reply */
+	struct dlm_rsb		ls_local_rsb;	/* for returning errors */
+	struct dlm_lkb		ls_local_lkb;	/* for returning errors */
+	struct dlm_message	ls_local_ms;	/* for faking a reply */
 
 	struct dentry		*ls_debug_rsb_dentry; /* debugfs */
 	struct dentry		*ls_debug_waiters_dentry; /* debugfs */
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 9a7679f16eee..b680e1ef0b6c 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1558,7 +1558,7 @@ static int remove_from_waiters(struct dlm_lkb *lkb, int mstype)
 	return error;
 }
 
-/* Handles situations where we might be processing a "fake" or "stub" reply in
+/* Handles situations where we might be processing a "fake" or "local" reply in
    which we can't try to take waiters_mutex again. */
 
 static int remove_from_waiters_ms(struct dlm_lkb *lkb, struct dlm_message *ms)
@@ -1566,10 +1566,10 @@ static int remove_from_waiters_ms(struct dlm_lkb *lkb, struct dlm_message *ms)
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
 	int error;
 
-	if (ms->m_flags != cpu_to_le32(DLM_IFL_STUB_MS))
+	if (ms->m_flags != cpu_to_le32(DLM_IFL_LOCAL_MS))
 		mutex_lock(&ls->ls_waiters_mutex);
 	error = _remove_from_waiters(lkb, le32_to_cpu(ms->m_type), ms);
-	if (ms->m_flags != cpu_to_le32(DLM_IFL_STUB_MS))
+	if (ms->m_flags != cpu_to_le32(DLM_IFL_LOCAL_MS))
 		mutex_unlock(&ls->ls_waiters_mutex);
 	return error;
 }
@@ -3486,10 +3486,10 @@ static int send_convert(struct dlm_rsb *r, struct dlm_lkb *lkb)
 	/* down conversions go without a reply from the master */
 	if (!error && down_conversion(lkb)) {
 		remove_from_waiters(lkb, DLM_MSG_CONVERT_REPLY);
-		r->res_ls->ls_stub_ms.m_flags = cpu_to_le32(DLM_IFL_STUB_MS);
-		r->res_ls->ls_stub_ms.m_type = cpu_to_le32(DLM_MSG_CONVERT_REPLY);
-		r->res_ls->ls_stub_ms.m_result = 0;
-		__receive_convert_reply(r, lkb, &r->res_ls->ls_stub_ms);
+		r->res_ls->ls_local_ms.m_flags = cpu_to_le32(DLM_IFL_LOCAL_MS);
+		r->res_ls->ls_local_ms.m_type = cpu_to_le32(DLM_MSG_CONVERT_REPLY);
+		r->res_ls->ls_local_ms.m_result = 0;
+		__receive_convert_reply(r, lkb, &r->res_ls->ls_local_ms);
 	}
 
 	return error;
@@ -3648,7 +3648,7 @@ static int send_cancel_reply(struct dlm_rsb *r, struct dlm_lkb *lkb, int rv)
 static int send_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms_in,
 			     int ret_nodeid, int rv)
 {
-	struct dlm_rsb *r = &ls->ls_stub_rsb;
+	struct dlm_rsb *r = &ls->ls_local_rsb;
 	struct dlm_message *ms;
 	struct dlm_mhandle *mh;
 	int error, nodeid = le32_to_cpu(ms_in->m_header.h_nodeid);
@@ -3681,7 +3681,7 @@ static void receive_flags(struct dlm_lkb *lkb, struct dlm_message *ms)
 
 static void receive_flags_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 {
-	if (ms->m_flags == cpu_to_le32(DLM_IFL_STUB_MS))
+	if (ms->m_flags == cpu_to_le32(DLM_IFL_LOCAL_MS))
 		return;
 
 	lkb->lkb_sbflags = le32_to_cpu(ms->m_sbflags);
@@ -3768,12 +3768,12 @@ static int receive_unlock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	return 0;
 }
 
-/* We fill in the stub-lkb fields with the info that send_xxxx_reply()
+/* We fill in the local-lkb fields with the info that send_xxxx_reply()
    uses to send a reply and that the remote end uses to process the reply. */
 
-static void setup_stub_lkb(struct dlm_ls *ls, struct dlm_message *ms)
+static void setup_local_lkb(struct dlm_ls *ls, struct dlm_message *ms)
 {
-	struct dlm_lkb *lkb = &ls->ls_stub_lkb;
+	struct dlm_lkb *lkb = &ls->ls_local_lkb;
 	lkb->lkb_nodeid = le32_to_cpu(ms->m_header.h_nodeid);
 	lkb->lkb_remid = le32_to_cpu(ms->m_lkid);
 }
@@ -3906,8 +3906,8 @@ static int receive_request(struct dlm_ls *ls, struct dlm_message *ms)
 			  le32_to_cpu(ms->m_lkid), from_nodeid, error);
 	}
 
-	setup_stub_lkb(ls, ms);
-	send_request_reply(&ls->ls_stub_rsb, &ls->ls_stub_lkb, error);
+	setup_local_lkb(ls, ms);
+	send_request_reply(&ls->ls_local_rsb, &ls->ls_local_lkb, error);
 	return error;
 }
 
@@ -3962,8 +3962,8 @@ static int receive_convert(struct dlm_ls *ls, struct dlm_message *ms)
 	return 0;
 
  fail:
-	setup_stub_lkb(ls, ms);
-	send_convert_reply(&ls->ls_stub_rsb, &ls->ls_stub_lkb, error);
+	setup_local_lkb(ls, ms);
+	send_convert_reply(&ls->ls_local_rsb, &ls->ls_local_lkb, error);
 	return error;
 }
 
@@ -4014,8 +4014,8 @@ static int receive_unlock(struct dlm_ls *ls, struct dlm_message *ms)
 	return 0;
 
  fail:
-	setup_stub_lkb(ls, ms);
-	send_unlock_reply(&ls->ls_stub_rsb, &ls->ls_stub_lkb, error);
+	setup_local_lkb(ls, ms);
+	send_unlock_reply(&ls->ls_local_rsb, &ls->ls_local_lkb, error);
 	return error;
 }
 
@@ -4050,8 +4050,8 @@ static int receive_cancel(struct dlm_ls *ls, struct dlm_message *ms)
 	return 0;
 
  fail:
-	setup_stub_lkb(ls, ms);
-	send_cancel_reply(&ls->ls_stub_rsb, &ls->ls_stub_lkb, error);
+	setup_local_lkb(ls, ms);
+	send_cancel_reply(&ls->ls_local_rsb, &ls->ls_local_lkb, error);
 	return error;
 }
 
@@ -4403,7 +4403,7 @@ static void _receive_convert_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 	if (error)
 		goto out;
 
-	/* stub reply can happen with waiters_mutex held */
+	/* local reply can happen with waiters_mutex held */
 	error = remove_from_waiters_ms(lkb, ms);
 	if (error)
 		goto out;
@@ -4440,7 +4440,7 @@ static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 	if (error)
 		goto out;
 
-	/* stub reply can happen with waiters_mutex held */
+	/* local reply can happen with waiters_mutex held */
 	error = remove_from_waiters_ms(lkb, ms);
 	if (error)
 		goto out;
@@ -4490,7 +4490,7 @@ static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 	if (error)
 		goto out;
 
-	/* stub reply can happen with waiters_mutex held */
+	/* local reply can happen with waiters_mutex held */
 	error = remove_from_waiters_ms(lkb, ms);
 	if (error)
 		goto out;
@@ -4834,16 +4834,16 @@ void dlm_receive_buffer(union dlm_packet *p, int nodeid)
 }
 
 static void recover_convert_waiter(struct dlm_ls *ls, struct dlm_lkb *lkb,
-				   struct dlm_message *ms_stub)
+				   struct dlm_message *ms_local)
 {
 	if (middle_conversion(lkb)) {
 		hold_lkb(lkb);
-		memset(ms_stub, 0, sizeof(struct dlm_message));
-		ms_stub->m_flags = cpu_to_le32(DLM_IFL_STUB_MS);
-		ms_stub->m_type = cpu_to_le32(DLM_MSG_CONVERT_REPLY);
-		ms_stub->m_result = cpu_to_le32(to_dlm_errno(-EINPROGRESS));
-		ms_stub->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
-		_receive_convert_reply(lkb, ms_stub);
+		memset(ms_local, 0, sizeof(struct dlm_message));
+		ms_local->m_flags = cpu_to_le32(DLM_IFL_LOCAL_MS);
+		ms_local->m_type = cpu_to_le32(DLM_MSG_CONVERT_REPLY);
+		ms_local->m_result = cpu_to_le32(to_dlm_errno(-EINPROGRESS));
+		ms_local->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
+		_receive_convert_reply(lkb, ms_local);
 
 		/* Same special case as in receive_rcom_lock_args() */
 		lkb->lkb_grmode = DLM_LOCK_IV;
@@ -4882,12 +4882,12 @@ static int waiter_needs_recovery(struct dlm_ls *ls, struct dlm_lkb *lkb,
 void dlm_recover_waiters_pre(struct dlm_ls *ls)
 {
 	struct dlm_lkb *lkb, *safe;
-	struct dlm_message *ms_stub;
-	int wait_type, stub_unlock_result, stub_cancel_result;
+	struct dlm_message *ms_local;
+	int wait_type, local_unlock_result, local_cancel_result;
 	int dir_nodeid;
 
-	ms_stub = kmalloc(sizeof(*ms_stub), GFP_KERNEL);
-	if (!ms_stub)
+	ms_local = kmalloc(sizeof(*ms_local), GFP_KERNEL);
+	if (!ms_local)
 		return;
 
 	mutex_lock(&ls->ls_waiters_mutex);
@@ -4923,8 +4923,8 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 			continue;
 
 		wait_type = lkb->lkb_wait_type;
-		stub_unlock_result = -DLM_EUNLOCK;
-		stub_cancel_result = -DLM_ECANCEL;
+		local_unlock_result = -DLM_EUNLOCK;
+		local_cancel_result = -DLM_ECANCEL;
 
 		/* Main reply may have been received leaving a zero wait_type,
 		   but a reply for the overlapping op may not have been
@@ -4935,17 +4935,17 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 			if (is_overlap_cancel(lkb)) {
 				wait_type = DLM_MSG_CANCEL;
 				if (lkb->lkb_grmode == DLM_LOCK_IV)
-					stub_cancel_result = 0;
+					local_cancel_result = 0;
 			}
 			if (is_overlap_unlock(lkb)) {
 				wait_type = DLM_MSG_UNLOCK;
 				if (lkb->lkb_grmode == DLM_LOCK_IV)
-					stub_unlock_result = -ENOENT;
+					local_unlock_result = -ENOENT;
 			}
 
 			log_debug(ls, "rwpre overlap %x %x %d %d %d",
 				  lkb->lkb_id, lkb->lkb_flags, wait_type,
-				  stub_cancel_result, stub_unlock_result);
+				  local_cancel_result, local_unlock_result);
 		}
 
 		switch (wait_type) {
@@ -4955,28 +4955,28 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 			break;
 
 		case DLM_MSG_CONVERT:
-			recover_convert_waiter(ls, lkb, ms_stub);
+			recover_convert_waiter(ls, lkb, ms_local);
 			break;
 
 		case DLM_MSG_UNLOCK:
 			hold_lkb(lkb);
-			memset(ms_stub, 0, sizeof(struct dlm_message));
-			ms_stub->m_flags = cpu_to_le32(DLM_IFL_STUB_MS);
-			ms_stub->m_type = cpu_to_le32(DLM_MSG_UNLOCK_REPLY);
-			ms_stub->m_result = cpu_to_le32(to_dlm_errno(stub_unlock_result));
-			ms_stub->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
-			_receive_unlock_reply(lkb, ms_stub);
+			memset(ms_local, 0, sizeof(struct dlm_message));
+			ms_local->m_flags = cpu_to_le32(DLM_IFL_LOCAL_MS);
+			ms_local->m_type = cpu_to_le32(DLM_MSG_UNLOCK_REPLY);
+			ms_local->m_result = cpu_to_le32(to_dlm_errno(local_unlock_result));
+			ms_local->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
+			_receive_unlock_reply(lkb, ms_local);
 			dlm_put_lkb(lkb);
 			break;
 
 		case DLM_MSG_CANCEL:
 			hold_lkb(lkb);
-			memset(ms_stub, 0, sizeof(struct dlm_message));
-			ms_stub->m_flags = cpu_to_le32(DLM_IFL_STUB_MS);
-			ms_stub->m_type = cpu_to_le32(DLM_MSG_CANCEL_REPLY);
-			ms_stub->m_result = cpu_to_le32(to_dlm_errno(stub_cancel_result));
-			ms_stub->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
-			_receive_cancel_reply(lkb, ms_stub);
+			memset(ms_local, 0, sizeof(struct dlm_message));
+			ms_local->m_flags = cpu_to_le32(DLM_IFL_LOCAL_MS);
+			ms_local->m_type = cpu_to_le32(DLM_MSG_CANCEL_REPLY);
+			ms_local->m_result = cpu_to_le32(to_dlm_errno(local_cancel_result));
+			ms_local->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
+			_receive_cancel_reply(lkb, ms_local);
 			dlm_put_lkb(lkb);
 			break;
 
@@ -4987,7 +4987,7 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 		schedule();
 	}
 	mutex_unlock(&ls->ls_waiters_mutex);
-	kfree(ms_stub);
+	kfree(ms_local);
 }
 
 static struct dlm_lkb *find_resend_waiter(struct dlm_ls *ls)
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index ed785130fb60..de9bb775236d 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -529,8 +529,8 @@ static int new_lockspace(const char *name, const char *cluster,
 	ls->ls_total_weight = 0;
 	ls->ls_node_array = NULL;
 
-	memset(&ls->ls_stub_rsb, 0, sizeof(struct dlm_rsb));
-	ls->ls_stub_rsb.res_ls = ls;
+	memset(&ls->ls_local_rsb, 0, sizeof(struct dlm_rsb));
+	ls->ls_local_rsb.res_ls = ls;
 
 	ls->ls_debug_rsb_dentry = NULL;
 	ls->ls_debug_waiters_dentry = NULL;
diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
index 37eb79e29b28..2d3ff2f1a4a6 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -54,7 +54,7 @@
 	{ DLM_IFL_OVERLAP_CANCEL, "OVERLAP_CANCEL" },		\
 	{ DLM_IFL_ENDOFLIFE,	"ENDOFLIFE" },			\
 	{ DLM_IFL_DEADLOCK_CANCEL, "DEADLOCK_CANCEL" },		\
-	{ DLM_IFL_STUB_MS,	"STUB_MS" },			\
+	{ DLM_IFL_LOCAL_MS,	"LOCAL_MS" },			\
 	{ DLM_IFL_USER,		"USER" },			\
 	{ DLM_IFL_ORPHAN,	"ORPHAN" })
 
-- 
2.31.1

