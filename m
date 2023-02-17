Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F92F69A36C
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Feb 2023 02:32:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676597559;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FSz6Q5UMv6YGZiWBgrNCqUX8IElWDi1pPz+vAamZeWg=;
	b=We1i5dUUOIkxoFfzzCnej8XPywcAbw4lDfq7NboLQDcvwRYs7NHFOZGgP1w2edGKPZ6xU6
	ixDQMVAZPqMqmhCW63bzAu60wXpQdFfq2HsHmT9Io1/bevtlbR/m6ZZPPZi4xODhpYcA6Y
	03aQwUWKazCVfC3MCbk7h+At/mqfhs4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-UTr960x1MoG9WUuE_vRQNQ-1; Thu, 16 Feb 2023 20:32:35 -0500
X-MC-Unique: UTr960x1MoG9WUuE_vRQNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1DF41875041;
	Fri, 17 Feb 2023 01:32:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A68F2C15BA0;
	Fri, 17 Feb 2023 01:32:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 76F2A1946597;
	Fri, 17 Feb 2023 01:32:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C7F2A1946588 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 17 Feb 2023 01:32:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AA67D141510F; Fri, 17 Feb 2023 01:32:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84728140EBF6;
 Fri, 17 Feb 2023 01:32:32 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 16 Feb 2023 20:32:26 -0500
Message-Id: <20230217013226.3299315-2-aahringo@redhat.com>
In-Reply-To: <20230217013226.3299315-1-aahringo@redhat.com>
References: <20230217013226.3299315-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCHv2 dlm/next 2/2] fs: dlm: remove
 DLM_IFL_STUB_MS flag
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The DLM_IFL_STUB_MS flag is an internal non shared flag but used in
m_flags of dlm messages. It is not shared because it is only used for
local messaging. Instead using DLM_IFL_STUB_MS in dlm messages we pass a
parameter around to signal local messaging or not. This patch is adding
the stub parameter to signal local messaging. Finally this patch removes
the read/mask/write operation to lkb->lkb_flags which is not only used
for shared internal flags like DLM_IFL_USER and DLM_IFL_ORPHAN.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h      | 13 ++-----
 fs/dlm/lock.c              | 71 +++++++++++++++++++-------------------
 include/trace/events/dlm.h |  1 -
 3 files changed, 37 insertions(+), 48 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index ce0a15858ae3..86b253aa9a09 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -213,19 +213,10 @@ struct dlm_args {
 #define DLM_IFLNS_DEADLOCK_CANCEL 9
 
 
-/* lkb_flags
- *
- * least significant 2 bytes are message changed, they are full transmitted
- * but at receive side only the 2 bytes LSB will be set.
- *
- * Even wireshark dlm dissector does only evaluate the lower bytes and note
- * that they may not be used on transceiver side, we assume the higher bytes
- * are for internal use or reserved so long they are not parsed on receiver
- * side.
- */
+/* lkb_flags */
+
 #define DLM_IFL_USER		0x00000001
 #define DLM_IFL_ORPHAN		0x00000002
-#define DLM_IFL_STUB_MS		0x00010000
 
 #define DLM_CB_CAST		0x00000001
 #define DLM_CB_BAST		0x00000002
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 49d68cf4cd96..e4df2579048b 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -86,7 +86,7 @@ static int send_remove(struct dlm_rsb *r);
 static int _request_lock(struct dlm_rsb *r, struct dlm_lkb *lkb);
 static int _cancel_lock(struct dlm_rsb *r, struct dlm_lkb *lkb);
 static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
-				    struct dlm_message *ms);
+				    struct dlm_message *ms, bool stub);
 static int receive_extralen(struct dlm_message *ms);
 static void do_purge(struct dlm_ls *ls, int nodeid, int pid);
 static void del_timeout(struct dlm_lkb *lkb);
@@ -1572,15 +1572,16 @@ static int remove_from_waiters(struct dlm_lkb *lkb, int mstype)
 /* Handles situations where we might be processing a "fake" or "stub" reply in
    which we can't try to take waiters_mutex again. */
 
-static int remove_from_waiters_ms(struct dlm_lkb *lkb, struct dlm_message *ms)
+static int remove_from_waiters_ms(struct dlm_lkb *lkb, struct dlm_message *ms,
+				  bool stub)
 {
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
 	int error;
 
-	if (ms->m_flags != cpu_to_le32(DLM_IFL_STUB_MS))
+	if (!stub)
 		mutex_lock(&ls->ls_waiters_mutex);
 	error = _remove_from_waiters(lkb, le32_to_cpu(ms->m_type), ms);
-	if (ms->m_flags != cpu_to_le32(DLM_IFL_STUB_MS))
+	if (!stub)
 		mutex_unlock(&ls->ls_waiters_mutex);
 	return error;
 }
@@ -3652,10 +3653,9 @@ static int send_convert(struct dlm_rsb *r, struct dlm_lkb *lkb)
 	/* down conversions go without a reply from the master */
 	if (!error && down_conversion(lkb)) {
 		remove_from_waiters(lkb, DLM_MSG_CONVERT_REPLY);
-		r->res_ls->ls_stub_ms.m_flags = cpu_to_le32(DLM_IFL_STUB_MS);
 		r->res_ls->ls_stub_ms.m_type = cpu_to_le32(DLM_MSG_CONVERT_REPLY);
 		r->res_ls->ls_stub_ms.m_result = 0;
-		__receive_convert_reply(r, lkb, &r->res_ls->ls_stub_ms);
+		__receive_convert_reply(r, lkb, &r->res_ls->ls_stub_ms, true);
 	}
 
 	return error;
@@ -3841,18 +3841,17 @@ static void receive_flags(struct dlm_lkb *lkb, struct dlm_message *ms)
 {
 	lkb->lkb_exflags = le32_to_cpu(ms->m_exflags);
 	lkb->lkb_sbflags = le32_to_cpu(ms->m_sbflags);
-	lkb->lkb_flags = (lkb->lkb_flags & 0xFFFF0000) |
-			  (le32_to_cpu(ms->m_flags) & 0x0000FFFF);
+	lkb->lkb_flags = le32_to_cpu(ms->m_flags);
 }
 
-static void receive_flags_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
+static void receive_flags_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
+				bool stub)
 {
-	if (ms->m_flags == cpu_to_le32(DLM_IFL_STUB_MS))
+	if (stub)
 		return;
 
 	lkb->lkb_sbflags = le32_to_cpu(ms->m_sbflags);
-	lkb->lkb_flags = (lkb->lkb_flags & 0xFFFF0000) |
-			 (le32_to_cpu(ms->m_flags) & 0x0000FFFF);
+	lkb->lkb_flags = le32_to_cpu(ms->m_flags);
 }
 
 static int receive_extralen(struct dlm_message *ms)
@@ -4240,7 +4239,7 @@ static int receive_grant(struct dlm_ls *ls, struct dlm_message *ms)
 	if (error)
 		goto out;
 
-	receive_flags_reply(lkb, ms);
+	receive_flags_reply(lkb, ms, false);
 	if (is_altmode(lkb))
 		munge_altmode(lkb, ms);
 	grant_lock_pc(r, lkb, ms);
@@ -4444,7 +4443,7 @@ static int receive_request_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	case -EINPROGRESS:
 	case 0:
 		/* request was queued or granted on remote master */
-		receive_flags_reply(lkb, ms);
+		receive_flags_reply(lkb, ms, false);
 		lkb->lkb_remid = le32_to_cpu(ms->m_lkid);
 		if (is_altmode(lkb))
 			munge_altmode(lkb, ms);
@@ -4515,7 +4514,7 @@ static int receive_request_reply(struct dlm_ls *ls, struct dlm_message *ms)
 }
 
 static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
-				    struct dlm_message *ms)
+				    struct dlm_message *ms, bool stub)
 {
 	/* this is the value returned from do_convert() on the master */
 	switch (from_dlm_errno(le32_to_cpu(ms->m_result))) {
@@ -4525,14 +4524,14 @@ static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 		break;
 
 	case -EDEADLK:
-		receive_flags_reply(lkb, ms);
+		receive_flags_reply(lkb, ms, stub);
 		revert_lock_pc(r, lkb);
 		queue_cast(r, lkb, -EDEADLK);
 		break;
 
 	case -EINPROGRESS:
 		/* convert was queued on remote master */
-		receive_flags_reply(lkb, ms);
+		receive_flags_reply(lkb, ms, stub);
 		if (is_demoted(lkb))
 			munge_demoted(lkb);
 		del_lkb(r, lkb);
@@ -4542,7 +4541,7 @@ static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 
 	case 0:
 		/* convert was granted on remote master */
-		receive_flags_reply(lkb, ms);
+		receive_flags_reply(lkb, ms, stub);
 		if (is_demoted(lkb))
 			munge_demoted(lkb);
 		grant_lock_pc(r, lkb, ms);
@@ -4559,7 +4558,8 @@ static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 	}
 }
 
-static void _receive_convert_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
+static void _receive_convert_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
+				   bool stub)
 {
 	struct dlm_rsb *r = lkb->lkb_resource;
 	int error;
@@ -4572,11 +4572,11 @@ static void _receive_convert_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 		goto out;
 
 	/* stub reply can happen with waiters_mutex held */
-	error = remove_from_waiters_ms(lkb, ms);
+	error = remove_from_waiters_ms(lkb, ms, stub);
 	if (error)
 		goto out;
 
-	__receive_convert_reply(r, lkb, ms);
+	__receive_convert_reply(r, lkb, ms, stub);
  out:
 	unlock_rsb(r);
 	put_rsb(r);
@@ -4591,12 +4591,13 @@ static int receive_convert_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	if (error)
 		return error;
 
-	_receive_convert_reply(lkb, ms);
+	_receive_convert_reply(lkb, ms, false);
 	dlm_put_lkb(lkb);
 	return 0;
 }
 
-static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
+static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
+				  bool stub)
 {
 	struct dlm_rsb *r = lkb->lkb_resource;
 	int error;
@@ -4609,7 +4610,7 @@ static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 		goto out;
 
 	/* stub reply can happen with waiters_mutex held */
-	error = remove_from_waiters_ms(lkb, ms);
+	error = remove_from_waiters_ms(lkb, ms, stub);
 	if (error)
 		goto out;
 
@@ -4617,7 +4618,7 @@ static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 
 	switch (from_dlm_errno(le32_to_cpu(ms->m_result))) {
 	case -DLM_EUNLOCK:
-		receive_flags_reply(lkb, ms);
+		receive_flags_reply(lkb, ms, stub);
 		remove_lock_pc(r, lkb);
 		queue_cast(r, lkb, -DLM_EUNLOCK);
 		break;
@@ -4641,12 +4642,13 @@ static int receive_unlock_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	if (error)
 		return error;
 
-	_receive_unlock_reply(lkb, ms);
+	_receive_unlock_reply(lkb, ms, false);
 	dlm_put_lkb(lkb);
 	return 0;
 }
 
-static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
+static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms,
+				  bool stub)
 {
 	struct dlm_rsb *r = lkb->lkb_resource;
 	int error;
@@ -4659,7 +4661,7 @@ static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 		goto out;
 
 	/* stub reply can happen with waiters_mutex held */
-	error = remove_from_waiters_ms(lkb, ms);
+	error = remove_from_waiters_ms(lkb, ms, stub);
 	if (error)
 		goto out;
 
@@ -4667,7 +4669,7 @@ static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 
 	switch (from_dlm_errno(le32_to_cpu(ms->m_result))) {
 	case -DLM_ECANCEL:
-		receive_flags_reply(lkb, ms);
+		receive_flags_reply(lkb, ms, stub);
 		revert_lock_pc(r, lkb);
 		queue_cast(r, lkb, -DLM_ECANCEL);
 		break;
@@ -4692,7 +4694,7 @@ static int receive_cancel_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	if (error)
 		return error;
 
-	_receive_cancel_reply(lkb, ms);
+	_receive_cancel_reply(lkb, ms, false);
 	dlm_put_lkb(lkb);
 	return 0;
 }
@@ -5007,11 +5009,10 @@ static void recover_convert_waiter(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	if (middle_conversion(lkb)) {
 		hold_lkb(lkb);
 		memset(ms_stub, 0, sizeof(struct dlm_message));
-		ms_stub->m_flags = cpu_to_le32(DLM_IFL_STUB_MS);
 		ms_stub->m_type = cpu_to_le32(DLM_MSG_CONVERT_REPLY);
 		ms_stub->m_result = cpu_to_le32(to_dlm_errno(-EINPROGRESS));
 		ms_stub->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
-		_receive_convert_reply(lkb, ms_stub);
+		_receive_convert_reply(lkb, ms_stub, true);
 
 		/* Same special case as in receive_rcom_lock_args() */
 		lkb->lkb_grmode = DLM_LOCK_IV;
@@ -5129,22 +5130,20 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 		case DLM_MSG_UNLOCK:
 			hold_lkb(lkb);
 			memset(ms_stub, 0, sizeof(struct dlm_message));
-			ms_stub->m_flags = cpu_to_le32(DLM_IFL_STUB_MS);
 			ms_stub->m_type = cpu_to_le32(DLM_MSG_UNLOCK_REPLY);
 			ms_stub->m_result = cpu_to_le32(to_dlm_errno(stub_unlock_result));
 			ms_stub->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
-			_receive_unlock_reply(lkb, ms_stub);
+			_receive_unlock_reply(lkb, ms_stub, true);
 			dlm_put_lkb(lkb);
 			break;
 
 		case DLM_MSG_CANCEL:
 			hold_lkb(lkb);
 			memset(ms_stub, 0, sizeof(struct dlm_message));
-			ms_stub->m_flags = cpu_to_le32(DLM_IFL_STUB_MS);
 			ms_stub->m_type = cpu_to_le32(DLM_MSG_CANCEL_REPLY);
 			ms_stub->m_result = cpu_to_le32(to_dlm_errno(stub_cancel_result));
 			ms_stub->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
-			_receive_cancel_reply(lkb, ms_stub);
+			_receive_cancel_reply(lkb, ms_stub, true);
 			dlm_put_lkb(lkb);
 			break;
 
diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
index a34cd2e62691..612d93e35e04 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -47,7 +47,6 @@
 	{ DLM_SBF_ALTMODE,	"ALTMODE" })
 
 #define show_lkb_flags(flags) __print_flags(flags, "|",		\
-	{ DLM_IFL_STUB_MS,	"STUB_MS" },			\
 	{ DLM_IFL_USER,		"USER" },			\
 	{ DLM_IFL_ORPHAN,	"ORPHAN" })
 
-- 
2.31.1

