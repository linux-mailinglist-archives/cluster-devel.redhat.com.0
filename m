Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E87506ACF76
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Mar 2023 21:48:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678135712;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6cZk+1dbqzOY0dY+5hcaUR43FKfjBM0fm0T8xnjhcNw=;
	b=iz0e+aDjShTYmJbnsXi4dYyuVLFcPDMQvmZRUQvhecpeJ8S+ZkE0G23X902Ox4uGUW8I+A
	x924OEGsSi26+0Gcs+fVkDASGoAX2iEVnArDPyogG4kaoYdiYxu4ktslYEkH6wP9aCt0jg
	DrBu5gjcdvtlxG9YOSov9hgJ/N6n0Oc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-yRaHJp_pOz6N8KAmOlGMqQ-1; Mon, 06 Mar 2023 15:48:29 -0500
X-MC-Unique: yRaHJp_pOz6N8KAmOlGMqQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4585A3813F2E;
	Mon,  6 Mar 2023 20:48:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B3FF2026D4B;
	Mon,  6 Mar 2023 20:48:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0D51E1946595;
	Mon,  6 Mar 2023 20:48:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F099E19465B1 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 20:48:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D4B94440DE; Mon,  6 Mar 2023 20:48:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B14DD51FF;
 Mon,  6 Mar 2023 20:48:26 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  6 Mar 2023 15:48:13 -0500
Message-Id: <20230306204819.2747646-7-aahringo@redhat.com>
In-Reply-To: <20230306204819.2747646-1-aahringo@redhat.com>
References: <20230306204819.2747646-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v6.3-rc1 06/12] fs: dlm: remove
 DLM_IFL_LOCAL_MS flag
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The DLM_IFL_LOCAL_MS flag is an internal non shared flag but used in
m_flags of dlm messages. It is not shared because it is only used for
local messaging. Instead using DLM_IFL_LOCAL_MS in dlm messages we pass a
parameter around to signal local messaging or not. This patch is adding
the local parameter to signal local messaging.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h      |  1 -
 fs/dlm/lock.c              | 65 +++++++++++++++++++-------------------
 include/trace/events/dlm.h |  1 -
 3 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 5e886b1f3519..3bdb2f4e132e 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -203,7 +203,6 @@ struct dlm_args {
 #define DLM_IFL_OVERLAP_CANCEL  0x00100000
 #define DLM_IFL_ENDOFLIFE	0x00200000
 #define DLM_IFL_DEADLOCK_CANCEL	0x01000000
-#define DLM_IFL_LOCAL_MS	0x02000000 /* magic number for m_flags */
 
 #define DLM_IFL_CB_PENDING_BIT	0
 
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index b680e1ef0b6c..74dd297e0857 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -86,7 +86,7 @@ static int send_remove(struct dlm_rsb *r);
 static int _request_lock(struct dlm_rsb *r, struct dlm_lkb *lkb);
 static int _cancel_lock(struct dlm_rsb *r, struct dlm_lkb *lkb);
 static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
-				    struct dlm_message *ms);
+				    struct dlm_message *ms, bool local);
 static int receive_extralen(struct dlm_message *ms);
 static void do_purge(struct dlm_ls *ls, int nodeid, int pid);
 static void toss_rsb(struct kref *kref);
@@ -1561,15 +1561,16 @@ static int remove_from_waiters(struct dlm_lkb *lkb, int mstype)
 /* Handles situations where we might be processing a "fake" or "local" reply in
    which we can't try to take waiters_mutex again. */
 
-static int remove_from_waiters_ms(struct dlm_lkb *lkb, struct dlm_message *ms)
+static int remove_from_waiters_ms(struct dlm_lkb *lkb, struct dlm_message *ms,
+				  bool local)
 {
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
 	int error;
 
-	if (ms->m_flags != cpu_to_le32(DLM_IFL_LOCAL_MS))
+	if (!local)
 		mutex_lock(&ls->ls_waiters_mutex);
 	error = _remove_from_waiters(lkb, le32_to_cpu(ms->m_type), ms);
-	if (ms->m_flags != cpu_to_le32(DLM_IFL_LOCAL_MS))
+	if (!local)
 		mutex_unlock(&ls->ls_waiters_mutex);
 	return error;
 }
@@ -3486,10 +3487,9 @@ static int send_convert(struct dlm_rsb *r, struct dlm_lkb *lkb)
 	/* down conversions go without a reply from the master */
 	if (!error && down_conversion(lkb)) {
 		remove_from_waiters(lkb, DLM_MSG_CONVERT_REPLY);
-		r->res_ls->ls_local_ms.m_flags = cpu_to_le32(DLM_IFL_LOCAL_MS);
 		r->res_ls->ls_local_ms.m_type = cpu_to_le32(DLM_MSG_CONVERT_REPLY);
 		r->res_ls->ls_local_ms.m_result = 0;
-		__receive_convert_reply(r, lkb, &r->res_ls->ls_local_ms);
+		__receive_convert_reply(r, lkb, &r->res_ls->ls_local_ms, true);
 	}
 
 	return error;
@@ -3679,9 +3679,10 @@ static void receive_flags(struct dlm_lkb *lkb, struct dlm_message *ms)
 			  (le32_to_cpu(ms->m_flags) & 0x0000FFFF);
 }
 
-static void receive_flags_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
+static void receive_flags_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
+				bool local)
 {
-	if (ms->m_flags == cpu_to_le32(DLM_IFL_LOCAL_MS))
+	if (local)
 		return;
 
 	lkb->lkb_sbflags = le32_to_cpu(ms->m_sbflags);
@@ -4074,7 +4075,7 @@ static int receive_grant(struct dlm_ls *ls, struct dlm_message *ms)
 	if (error)
 		goto out;
 
-	receive_flags_reply(lkb, ms);
+	receive_flags_reply(lkb, ms, false);
 	if (is_altmode(lkb))
 		munge_altmode(lkb, ms);
 	grant_lock_pc(r, lkb, ms);
@@ -4278,7 +4279,7 @@ static int receive_request_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	case -EINPROGRESS:
 	case 0:
 		/* request was queued or granted on remote master */
-		receive_flags_reply(lkb, ms);
+		receive_flags_reply(lkb, ms, false);
 		lkb->lkb_remid = le32_to_cpu(ms->m_lkid);
 		if (is_altmode(lkb))
 			munge_altmode(lkb, ms);
@@ -4348,7 +4349,7 @@ static int receive_request_reply(struct dlm_ls *ls, struct dlm_message *ms)
 }
 
 static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
-				    struct dlm_message *ms)
+				    struct dlm_message *ms, bool local)
 {
 	/* this is the value returned from do_convert() on the master */
 	switch (from_dlm_errno(le32_to_cpu(ms->m_result))) {
@@ -4358,14 +4359,14 @@ static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 		break;
 
 	case -EDEADLK:
-		receive_flags_reply(lkb, ms);
+		receive_flags_reply(lkb, ms, local);
 		revert_lock_pc(r, lkb);
 		queue_cast(r, lkb, -EDEADLK);
 		break;
 
 	case -EINPROGRESS:
 		/* convert was queued on remote master */
-		receive_flags_reply(lkb, ms);
+		receive_flags_reply(lkb, ms, local);
 		if (is_demoted(lkb))
 			munge_demoted(lkb);
 		del_lkb(r, lkb);
@@ -4374,7 +4375,7 @@ static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 
 	case 0:
 		/* convert was granted on remote master */
-		receive_flags_reply(lkb, ms);
+		receive_flags_reply(lkb, ms, local);
 		if (is_demoted(lkb))
 			munge_demoted(lkb);
 		grant_lock_pc(r, lkb, ms);
@@ -4391,7 +4392,8 @@ static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 	}
 }
 
-static void _receive_convert_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
+static void _receive_convert_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
+				   bool local)
 {
 	struct dlm_rsb *r = lkb->lkb_resource;
 	int error;
@@ -4404,11 +4406,11 @@ static void _receive_convert_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 		goto out;
 
 	/* local reply can happen with waiters_mutex held */
-	error = remove_from_waiters_ms(lkb, ms);
+	error = remove_from_waiters_ms(lkb, ms, local);
 	if (error)
 		goto out;
 
-	__receive_convert_reply(r, lkb, ms);
+	__receive_convert_reply(r, lkb, ms, local);
  out:
 	unlock_rsb(r);
 	put_rsb(r);
@@ -4423,12 +4425,13 @@ static int receive_convert_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	if (error)
 		return error;
 
-	_receive_convert_reply(lkb, ms);
+	_receive_convert_reply(lkb, ms, false);
 	dlm_put_lkb(lkb);
 	return 0;
 }
 
-static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
+static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
+				  bool local)
 {
 	struct dlm_rsb *r = lkb->lkb_resource;
 	int error;
@@ -4441,7 +4444,7 @@ static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 		goto out;
 
 	/* local reply can happen with waiters_mutex held */
-	error = remove_from_waiters_ms(lkb, ms);
+	error = remove_from_waiters_ms(lkb, ms, local);
 	if (error)
 		goto out;
 
@@ -4449,7 +4452,7 @@ static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 
 	switch (from_dlm_errno(le32_to_cpu(ms->m_result))) {
 	case -DLM_EUNLOCK:
-		receive_flags_reply(lkb, ms);
+		receive_flags_reply(lkb, ms, local);
 		remove_lock_pc(r, lkb);
 		queue_cast(r, lkb, -DLM_EUNLOCK);
 		break;
@@ -4473,12 +4476,13 @@ static int receive_unlock_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	if (error)
 		return error;
 
-	_receive_unlock_reply(lkb, ms);
+	_receive_unlock_reply(lkb, ms, false);
 	dlm_put_lkb(lkb);
 	return 0;
 }
 
-static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
+static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
+				  bool local)
 {
 	struct dlm_rsb *r = lkb->lkb_resource;
 	int error;
@@ -4491,7 +4495,7 @@ static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 		goto out;
 
 	/* local reply can happen with waiters_mutex held */
-	error = remove_from_waiters_ms(lkb, ms);
+	error = remove_from_waiters_ms(lkb, ms, local);
 	if (error)
 		goto out;
 
@@ -4499,7 +4503,7 @@ static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 
 	switch (from_dlm_errno(le32_to_cpu(ms->m_result))) {
 	case -DLM_ECANCEL:
-		receive_flags_reply(lkb, ms);
+		receive_flags_reply(lkb, ms, local);
 		revert_lock_pc(r, lkb);
 		queue_cast(r, lkb, -DLM_ECANCEL);
 		break;
@@ -4524,7 +4528,7 @@ static int receive_cancel_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	if (error)
 		return error;
 
-	_receive_cancel_reply(lkb, ms);
+	_receive_cancel_reply(lkb, ms, false);
 	dlm_put_lkb(lkb);
 	return 0;
 }
@@ -4839,11 +4843,10 @@ static void recover_convert_waiter(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	if (middle_conversion(lkb)) {
 		hold_lkb(lkb);
 		memset(ms_local, 0, sizeof(struct dlm_message));
-		ms_local->m_flags = cpu_to_le32(DLM_IFL_LOCAL_MS);
 		ms_local->m_type = cpu_to_le32(DLM_MSG_CONVERT_REPLY);
 		ms_local->m_result = cpu_to_le32(to_dlm_errno(-EINPROGRESS));
 		ms_local->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
-		_receive_convert_reply(lkb, ms_local);
+		_receive_convert_reply(lkb, ms_local, true);
 
 		/* Same special case as in receive_rcom_lock_args() */
 		lkb->lkb_grmode = DLM_LOCK_IV;
@@ -4961,22 +4964,20 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 		case DLM_MSG_UNLOCK:
 			hold_lkb(lkb);
 			memset(ms_local, 0, sizeof(struct dlm_message));
-			ms_local->m_flags = cpu_to_le32(DLM_IFL_LOCAL_MS);
 			ms_local->m_type = cpu_to_le32(DLM_MSG_UNLOCK_REPLY);
 			ms_local->m_result = cpu_to_le32(to_dlm_errno(local_unlock_result));
 			ms_local->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
-			_receive_unlock_reply(lkb, ms_local);
+			_receive_unlock_reply(lkb, ms_local, true);
 			dlm_put_lkb(lkb);
 			break;
 
 		case DLM_MSG_CANCEL:
 			hold_lkb(lkb);
 			memset(ms_local, 0, sizeof(struct dlm_message));
-			ms_local->m_flags = cpu_to_le32(DLM_IFL_LOCAL_MS);
 			ms_local->m_type = cpu_to_le32(DLM_MSG_CANCEL_REPLY);
 			ms_local->m_result = cpu_to_le32(to_dlm_errno(local_cancel_result));
 			ms_local->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
-			_receive_cancel_reply(lkb, ms_local);
+			_receive_cancel_reply(lkb, ms_local, true);
 			dlm_put_lkb(lkb);
 			break;
 
diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
index 2d3ff2f1a4a6..cd00b2d34e33 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -54,7 +54,6 @@
 	{ DLM_IFL_OVERLAP_CANCEL, "OVERLAP_CANCEL" },		\
 	{ DLM_IFL_ENDOFLIFE,	"ENDOFLIFE" },			\
 	{ DLM_IFL_DEADLOCK_CANCEL, "DEADLOCK_CANCEL" },		\
-	{ DLM_IFL_LOCAL_MS,	"LOCAL_MS" },			\
 	{ DLM_IFL_USER,		"USER" },			\
 	{ DLM_IFL_ORPHAN,	"ORPHAN" })
 
-- 
2.31.1

