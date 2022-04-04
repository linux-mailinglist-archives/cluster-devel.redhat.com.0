Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D24A4F1A13
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102845;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nJ8CjbG5ZFL7VynXXfUuVMOJnweHllom/mgxwY8JRpM=;
	b=J2pyyofLp0LqQ+aSCbfNzGWQYYns9tneLsxpyFfruVAlEa8rxq7zLiTremWNz/9PEUCwvU
	+i1i4tlb69+zBwG4dOMQovoix5p2wtk0823N+F5EbCZrU+vlJx09i9Z0ypQ1pNIS0iAiva
	QjnYqYbGH4PHpRHCFiGlwNOdd1tUedI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-jyHYg5rVMueyv4JzizRl8w-1; Mon, 04 Apr 2022 16:07:21 -0400
X-MC-Unique: jyHYg5rVMueyv4JzizRl8w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2181B296A61F;
	Mon,  4 Apr 2022 20:07:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0357742B924;
	Mon,  4 Apr 2022 20:07:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A7DDB193F50F;
	Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 01ACF193F6D9 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E80E97C28; Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C59988145;
 Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:41 -0400
Message-Id: <20220404200646.3170301-15-aahringo@redhat.com>
In-Reply-To: <20220404200646.3170301-1-aahringo@redhat.com>
References: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 14/19] fs: dlm: use __le
 types for dlm messages
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch changes to use __le types directly in the dlm message
structure which is casted at the right dlm message buffer positions.

The main goal what is reached here is to remove sparse warnings
regarding to host to little byte order conversion or vice versa. Leaving
those sparse issues ignored and always do it in out/in functionality
tends to leave it unknown in which byte order the variable is being
handled.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h |  36 +++---
 fs/dlm/lock.c         | 276 ++++++++++++++++++++++--------------------
 fs/dlm/requestqueue.c |  15 ++-
 fs/dlm/util.c         |  48 +-------
 fs/dlm/util.h         |   4 +-
 5 files changed, 174 insertions(+), 205 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 5db26550ae47..776c3ed519f0 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -409,24 +409,24 @@ struct dlm_header {
 
 struct dlm_message {
 	struct dlm_header	m_header;
-	uint32_t		m_type;		/* DLM_MSG_ */
-	uint32_t		m_nodeid;
-	uint32_t		m_pid;
-	uint32_t		m_lkid;		/* lkid on sender */
-	uint32_t		m_remid;	/* lkid on receiver */
-	uint32_t		m_parent_lkid;
-	uint32_t		m_parent_remid;
-	uint32_t		m_exflags;
-	uint32_t		m_sbflags;
-	uint32_t		m_flags;
-	uint32_t		m_lvbseq;
-	uint32_t		m_hash;
-	int			m_status;
-	int			m_grmode;
-	int			m_rqmode;
-	int			m_bastmode;
-	int			m_asts;
-	int			m_result;	/* 0 or -EXXX */
+	__le32			m_type;		/* DLM_MSG_ */
+	__le32			m_nodeid;
+	__le32			m_pid;
+	__le32			m_lkid;		/* lkid on sender */
+	__le32			m_remid;	/* lkid on receiver */
+	__le32			m_parent_lkid;
+	__le32			m_parent_remid;
+	__le32			m_exflags;
+	__le32			m_sbflags;
+	__le32			m_flags;
+	__le32			m_lvbseq;
+	__le32			m_hash;
+	__le32			m_status;
+	__le32			m_grmode;
+	__le32			m_rqmode;
+	__le32			m_bastmode;
+	__le32			m_asts;
+	__le32			m_result;	/* 0 or -EXXX */
 	char			m_extra[];	/* name or lvb */
 };
 
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index ff3dd79f5751..fd3a9bae5b5b 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1617,10 +1617,10 @@ static int remove_from_waiters_ms(struct dlm_lkb *lkb, struct dlm_message *ms)
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
 	int error;
 
-	if (ms->m_flags != DLM_IFL_STUB_MS)
+	if (ms->m_flags != cpu_to_le32(DLM_IFL_STUB_MS))
 		mutex_lock(&ls->ls_waiters_mutex);
-	error = _remove_from_waiters(lkb, ms->m_type, ms);
-	if (ms->m_flags != DLM_IFL_STUB_MS)
+	error = _remove_from_waiters(lkb, le32_to_cpu(ms->m_type), ms);
+	if (ms->m_flags != cpu_to_le32(DLM_IFL_STUB_MS))
 		mutex_unlock(&ls->ls_waiters_mutex);
 	return error;
 }
@@ -2051,7 +2051,7 @@ static void set_lvb_lock_pc(struct dlm_rsb *r, struct dlm_lkb *lkb,
 		if (len > r->res_ls->ls_lvblen)
 			len = r->res_ls->ls_lvblen;
 		memcpy(lkb->lkb_lvbptr, ms->m_extra, len);
-		lkb->lkb_lvbseq = ms->m_lvbseq;
+		lkb->lkb_lvbseq = le32_to_cpu(ms->m_lvbseq);
 	}
 }
 
@@ -2182,10 +2182,10 @@ static void munge_demoted(struct dlm_lkb *lkb)
 
 static void munge_altmode(struct dlm_lkb *lkb, struct dlm_message *ms)
 {
-	if (ms->m_type != DLM_MSG_REQUEST_REPLY &&
-	    ms->m_type != DLM_MSG_GRANT) {
+	if (ms->m_type != cpu_to_le32(DLM_MSG_REQUEST_REPLY) &&
+	    ms->m_type != cpu_to_le32(DLM_MSG_GRANT)) {
 		log_print("munge_altmode %x invalid reply type %d",
-			  lkb->lkb_id, ms->m_type);
+			  lkb->lkb_id, le32_to_cpu(ms->m_type));
 		return;
 	}
 
@@ -3570,7 +3570,7 @@ static int _create_message(struct dlm_ls *ls, int mb_len,
 	ms->m_header.h_length = cpu_to_le16(mb_len);
 	ms->m_header.h_cmd = DLM_MSG;
 
-	ms->m_type = mstype;
+	ms->m_type = cpu_to_le32(mstype);
 
 	*mh_ret = mh;
 	*ms_ret = ms;
@@ -3609,7 +3609,6 @@ static int create_message(struct dlm_rsb *r, struct dlm_lkb *lkb,
 
 static int send_message(struct dlm_mhandle *mh, struct dlm_message *ms)
 {
-	dlm_message_out(ms);
 	dlm_midcomms_commit_mhandle(mh);
 	return 0;
 }
@@ -3617,40 +3616,40 @@ static int send_message(struct dlm_mhandle *mh, struct dlm_message *ms)
 static void send_args(struct dlm_rsb *r, struct dlm_lkb *lkb,
 		      struct dlm_message *ms)
 {
-	ms->m_nodeid   = lkb->lkb_nodeid;
-	ms->m_pid      = lkb->lkb_ownpid;
-	ms->m_lkid     = lkb->lkb_id;
-	ms->m_remid    = lkb->lkb_remid;
-	ms->m_exflags  = lkb->lkb_exflags;
-	ms->m_sbflags  = lkb->lkb_sbflags;
-	ms->m_flags    = lkb->lkb_flags;
-	ms->m_lvbseq   = lkb->lkb_lvbseq;
-	ms->m_status   = lkb->lkb_status;
-	ms->m_grmode   = lkb->lkb_grmode;
-	ms->m_rqmode   = lkb->lkb_rqmode;
-	ms->m_hash     = r->res_hash;
+	ms->m_nodeid   = cpu_to_le32(lkb->lkb_nodeid);
+	ms->m_pid      = cpu_to_le32(lkb->lkb_ownpid);
+	ms->m_lkid     = cpu_to_le32(lkb->lkb_id);
+	ms->m_remid    = cpu_to_le32(lkb->lkb_remid);
+	ms->m_exflags  = cpu_to_le32(lkb->lkb_exflags);
+	ms->m_sbflags  = cpu_to_le32(lkb->lkb_sbflags);
+	ms->m_flags    = cpu_to_le32(lkb->lkb_flags);
+	ms->m_lvbseq   = cpu_to_le32(lkb->lkb_lvbseq);
+	ms->m_status   = cpu_to_le32(lkb->lkb_status);
+	ms->m_grmode   = cpu_to_le32(lkb->lkb_grmode);
+	ms->m_rqmode   = cpu_to_le32(lkb->lkb_rqmode);
+	ms->m_hash     = cpu_to_le32(r->res_hash);
 
 	/* m_result and m_bastmode are set from function args,
 	   not from lkb fields */
 
 	if (lkb->lkb_bastfn)
-		ms->m_asts |= DLM_CB_BAST;
+		ms->m_asts |= cpu_to_le32(DLM_CB_BAST);
 	if (lkb->lkb_astfn)
-		ms->m_asts |= DLM_CB_CAST;
+		ms->m_asts |= cpu_to_le32(DLM_CB_CAST);
 
 	/* compare with switch in create_message; send_remove() doesn't
 	   use send_args() */
 
 	switch (ms->m_type) {
-	case DLM_MSG_REQUEST:
-	case DLM_MSG_LOOKUP:
+	case cpu_to_le32(DLM_MSG_REQUEST):
+	case cpu_to_le32(DLM_MSG_LOOKUP):
 		memcpy(ms->m_extra, r->res_name, r->res_length);
 		break;
-	case DLM_MSG_CONVERT:
-	case DLM_MSG_UNLOCK:
-	case DLM_MSG_REQUEST_REPLY:
-	case DLM_MSG_CONVERT_REPLY:
-	case DLM_MSG_GRANT:
+	case cpu_to_le32(DLM_MSG_CONVERT):
+	case cpu_to_le32(DLM_MSG_UNLOCK):
+	case cpu_to_le32(DLM_MSG_REQUEST_REPLY):
+	case cpu_to_le32(DLM_MSG_CONVERT_REPLY):
+	case cpu_to_le32(DLM_MSG_GRANT):
 		if (!lkb->lkb_lvbptr)
 			break;
 		memcpy(ms->m_extra, lkb->lkb_lvbptr, r->res_ls->ls_lvblen);
@@ -3700,8 +3699,8 @@ static int send_convert(struct dlm_rsb *r, struct dlm_lkb *lkb)
 	/* down conversions go without a reply from the master */
 	if (!error && down_conversion(lkb)) {
 		remove_from_waiters(lkb, DLM_MSG_CONVERT_REPLY);
-		r->res_ls->ls_stub_ms.m_flags = DLM_IFL_STUB_MS;
-		r->res_ls->ls_stub_ms.m_type = DLM_MSG_CONVERT_REPLY;
+		r->res_ls->ls_stub_ms.m_flags = cpu_to_le32(DLM_IFL_STUB_MS);
+		r->res_ls->ls_stub_ms.m_type = cpu_to_le32(DLM_MSG_CONVERT_REPLY);
 		r->res_ls->ls_stub_ms.m_result = 0;
 		__receive_convert_reply(r, lkb, &r->res_ls->ls_stub_ms);
 	}
@@ -3758,7 +3757,7 @@ static int send_bast(struct dlm_rsb *r, struct dlm_lkb *lkb, int mode)
 
 	send_args(r, lkb, ms);
 
-	ms->m_bastmode = mode;
+	ms->m_bastmode = cpu_to_le32(mode);
 
 	error = send_message(mh, ms);
  out:
@@ -3806,7 +3805,7 @@ static int send_remove(struct dlm_rsb *r)
 		goto out;
 
 	memcpy(ms->m_extra, r->res_name, r->res_length);
-	ms->m_hash = r->res_hash;
+	ms->m_hash = cpu_to_le32(r->res_hash);
 
 	error = send_message(mh, ms);
  out:
@@ -3828,7 +3827,7 @@ static int send_common_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 
 	send_args(r, lkb, ms);
 
-	ms->m_result = rv;
+	ms->m_result = cpu_to_le32(to_dlm_errno(rv));
 
 	error = send_message(mh, ms);
  out:
@@ -3868,8 +3867,8 @@ static int send_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms_in,
 		goto out;
 
 	ms->m_lkid = ms_in->m_lkid;
-	ms->m_result = rv;
-	ms->m_nodeid = ret_nodeid;
+	ms->m_result = cpu_to_le32(to_dlm_errno(rv));
+	ms->m_nodeid = cpu_to_le32(ret_nodeid);
 
 	error = send_message(mh, ms);
  out:
@@ -3882,20 +3881,20 @@ static int send_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms_in,
 
 static void receive_flags(struct dlm_lkb *lkb, struct dlm_message *ms)
 {
-	lkb->lkb_exflags = ms->m_exflags;
-	lkb->lkb_sbflags = ms->m_sbflags;
+	lkb->lkb_exflags = le32_to_cpu(ms->m_exflags);
+	lkb->lkb_sbflags = le32_to_cpu(ms->m_sbflags);
 	lkb->lkb_flags = (lkb->lkb_flags & 0xFFFF0000) |
-		         (ms->m_flags & 0x0000FFFF);
+			  (le32_to_cpu(ms->m_flags) & 0x0000FFFF);
 }
 
 static void receive_flags_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 {
-	if (ms->m_flags == DLM_IFL_STUB_MS)
+	if (ms->m_flags == cpu_to_le32(DLM_IFL_STUB_MS))
 		return;
 
-	lkb->lkb_sbflags = ms->m_sbflags;
+	lkb->lkb_sbflags = le32_to_cpu(ms->m_sbflags);
 	lkb->lkb_flags = (lkb->lkb_flags & 0xFFFF0000) |
-		         (ms->m_flags & 0x0000FFFF);
+			 (le32_to_cpu(ms->m_flags) & 0x0000FFFF);
 }
 
 static int receive_extralen(struct dlm_message *ms)
@@ -3936,13 +3935,13 @@ static int receive_request_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 				struct dlm_message *ms)
 {
 	lkb->lkb_nodeid = le32_to_cpu(ms->m_header.h_nodeid);
-	lkb->lkb_ownpid = ms->m_pid;
-	lkb->lkb_remid = ms->m_lkid;
+	lkb->lkb_ownpid = le32_to_cpu(ms->m_pid);
+	lkb->lkb_remid = le32_to_cpu(ms->m_lkid);
 	lkb->lkb_grmode = DLM_LOCK_IV;
-	lkb->lkb_rqmode = ms->m_rqmode;
+	lkb->lkb_rqmode = le32_to_cpu(ms->m_rqmode);
 
-	lkb->lkb_bastfn = (ms->m_asts & DLM_CB_BAST) ? &fake_bastfn : NULL;
-	lkb->lkb_astfn = (ms->m_asts & DLM_CB_CAST) ? &fake_astfn : NULL;
+	lkb->lkb_bastfn = (ms->m_asts & cpu_to_le32(DLM_CB_BAST)) ? &fake_bastfn : NULL;
+	lkb->lkb_astfn = (ms->m_asts & cpu_to_le32(DLM_CB_CAST)) ? &fake_astfn : NULL;
 
 	if (lkb->lkb_exflags & DLM_LKF_VALBLK) {
 		/* lkb was just created so there won't be an lvb yet */
@@ -3963,8 +3962,8 @@ static int receive_convert_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	if (receive_lvb(ls, lkb, ms))
 		return -ENOMEM;
 
-	lkb->lkb_rqmode = ms->m_rqmode;
-	lkb->lkb_lvbseq = ms->m_lvbseq;
+	lkb->lkb_rqmode = le32_to_cpu(ms->m_rqmode);
+	lkb->lkb_lvbseq = le32_to_cpu(ms->m_lvbseq);
 
 	return 0;
 }
@@ -3984,7 +3983,7 @@ static void setup_stub_lkb(struct dlm_ls *ls, struct dlm_message *ms)
 {
 	struct dlm_lkb *lkb = &ls->ls_stub_lkb;
 	lkb->lkb_nodeid = le32_to_cpu(ms->m_header.h_nodeid);
-	lkb->lkb_remid = ms->m_lkid;
+	lkb->lkb_remid = le32_to_cpu(ms->m_lkid);
 }
 
 /* This is called after the rsb is locked so that we can safely inspect
@@ -3996,7 +3995,8 @@ static int validate_message(struct dlm_lkb *lkb, struct dlm_message *ms)
 	int error = 0;
 
 	/* currently mixing of user/kernel locks are not supported */
-	if (ms->m_flags & DLM_IFL_USER && ~lkb->lkb_flags & DLM_IFL_USER) {
+	if (ms->m_flags & cpu_to_le32(DLM_IFL_USER) &&
+	    ~lkb->lkb_flags & DLM_IFL_USER) {
 		log_error(lkb->lkb_resource->res_ls,
 			  "got user dlm message for a kernel lock");
 		error = -EINVAL;
@@ -4004,23 +4004,23 @@ static int validate_message(struct dlm_lkb *lkb, struct dlm_message *ms)
 	}
 
 	switch (ms->m_type) {
-	case DLM_MSG_CONVERT:
-	case DLM_MSG_UNLOCK:
-	case DLM_MSG_CANCEL:
+	case cpu_to_le32(DLM_MSG_CONVERT):
+	case cpu_to_le32(DLM_MSG_UNLOCK):
+	case cpu_to_le32(DLM_MSG_CANCEL):
 		if (!is_master_copy(lkb) || lkb->lkb_nodeid != from)
 			error = -EINVAL;
 		break;
 
-	case DLM_MSG_CONVERT_REPLY:
-	case DLM_MSG_UNLOCK_REPLY:
-	case DLM_MSG_CANCEL_REPLY:
-	case DLM_MSG_GRANT:
-	case DLM_MSG_BAST:
+	case cpu_to_le32(DLM_MSG_CONVERT_REPLY):
+	case cpu_to_le32(DLM_MSG_UNLOCK_REPLY):
+	case cpu_to_le32(DLM_MSG_CANCEL_REPLY):
+	case cpu_to_le32(DLM_MSG_GRANT):
+	case cpu_to_le32(DLM_MSG_BAST):
 		if (!is_process_copy(lkb) || lkb->lkb_nodeid != from)
 			error = -EINVAL;
 		break;
 
-	case DLM_MSG_REQUEST_REPLY:
+	case cpu_to_le32(DLM_MSG_REQUEST_REPLY):
 		if (!is_process_copy(lkb))
 			error = -EINVAL;
 		else if (lkb->lkb_nodeid != -1 && lkb->lkb_nodeid != from)
@@ -4035,8 +4035,8 @@ static int validate_message(struct dlm_lkb *lkb, struct dlm_message *ms)
 	if (error)
 		log_error(lkb->lkb_resource->res_ls,
 			  "ignore invalid message %d from %d %x %x %x %d",
-			  ms->m_type, from, lkb->lkb_id, lkb->lkb_remid,
-			  lkb->lkb_flags, lkb->lkb_nodeid);
+			  le32_to_cpu(ms->m_type), from, lkb->lkb_id,
+			  lkb->lkb_remid, lkb->lkb_flags, lkb->lkb_nodeid);
 	return error;
 }
 
@@ -4089,7 +4089,7 @@ static void send_repeat_remove(struct dlm_ls *ls, char *ms_name, int len)
 		return;
 
 	memcpy(ms->m_extra, name, len);
-	ms->m_hash = hash;
+	ms->m_hash = cpu_to_le32(hash);
 
 	send_message(mh, ms);
 
@@ -4179,7 +4179,7 @@ static int receive_request(struct dlm_ls *ls, struct dlm_message *ms)
 
 	if (error != -ENOTBLK) {
 		log_limit(ls, "receive_request %x from %d %d",
-			  ms->m_lkid, from_nodeid, error);
+			  le32_to_cpu(ms->m_lkid), from_nodeid, error);
 	}
 
 	if (namelen && error == -EBADR) {
@@ -4198,15 +4198,16 @@ static int receive_convert(struct dlm_ls *ls, struct dlm_message *ms)
 	struct dlm_rsb *r;
 	int error, reply = 1;
 
-	error = find_lkb(ls, ms->m_remid, &lkb);
+	error = find_lkb(ls, le32_to_cpu(ms->m_remid), &lkb);
 	if (error)
 		goto fail;
 
-	if (lkb->lkb_remid != ms->m_lkid) {
+	if (lkb->lkb_remid != le32_to_cpu(ms->m_lkid)) {
 		log_error(ls, "receive_convert %x remid %x recover_seq %llu "
 			  "remote %d %x", lkb->lkb_id, lkb->lkb_remid,
 			  (unsigned long long)lkb->lkb_recover_seq,
-			  le32_to_cpu(ms->m_header.h_nodeid), ms->m_lkid);
+			  le32_to_cpu(ms->m_header.h_nodeid),
+			  le32_to_cpu(ms->m_lkid));
 		error = -ENOENT;
 		dlm_put_lkb(lkb);
 		goto fail;
@@ -4253,14 +4254,15 @@ static int receive_unlock(struct dlm_ls *ls, struct dlm_message *ms)
 	struct dlm_rsb *r;
 	int error;
 
-	error = find_lkb(ls, ms->m_remid, &lkb);
+	error = find_lkb(ls, le32_to_cpu(ms->m_remid), &lkb);
 	if (error)
 		goto fail;
 
-	if (lkb->lkb_remid != ms->m_lkid) {
+	if (lkb->lkb_remid != le32_to_cpu(ms->m_lkid)) {
 		log_error(ls, "receive_unlock %x remid %x remote %d %x",
 			  lkb->lkb_id, lkb->lkb_remid,
-			  le32_to_cpu(ms->m_header.h_nodeid), ms->m_lkid);
+			  le32_to_cpu(ms->m_header.h_nodeid),
+			  le32_to_cpu(ms->m_lkid));
 		error = -ENOENT;
 		dlm_put_lkb(lkb);
 		goto fail;
@@ -4304,7 +4306,7 @@ static int receive_cancel(struct dlm_ls *ls, struct dlm_message *ms)
 	struct dlm_rsb *r;
 	int error;
 
-	error = find_lkb(ls, ms->m_remid, &lkb);
+	error = find_lkb(ls, le32_to_cpu(ms->m_remid), &lkb);
 	if (error)
 		goto fail;
 
@@ -4340,7 +4342,7 @@ static int receive_grant(struct dlm_ls *ls, struct dlm_message *ms)
 	struct dlm_rsb *r;
 	int error;
 
-	error = find_lkb(ls, ms->m_remid, &lkb);
+	error = find_lkb(ls, le32_to_cpu(ms->m_remid), &lkb);
 	if (error)
 		return error;
 
@@ -4371,7 +4373,7 @@ static int receive_bast(struct dlm_ls *ls, struct dlm_message *ms)
 	struct dlm_rsb *r;
 	int error;
 
-	error = find_lkb(ls, ms->m_remid, &lkb);
+	error = find_lkb(ls, le32_to_cpu(ms->m_remid), &lkb);
 	if (error)
 		return error;
 
@@ -4384,8 +4386,8 @@ static int receive_bast(struct dlm_ls *ls, struct dlm_message *ms)
 	if (error)
 		goto out;
 
-	queue_bast(r, lkb, ms->m_bastmode);
-	lkb->lkb_highbast = ms->m_bastmode;
+	queue_bast(r, lkb, le32_to_cpu(ms->m_bastmode));
+	lkb->lkb_highbast = le32_to_cpu(ms->m_bastmode);
  out:
 	unlock_rsb(r);
 	put_rsb(r);
@@ -4430,7 +4432,7 @@ static void receive_remove(struct dlm_ls *ls, struct dlm_message *ms)
 		return;
 	}
 
-	dir_nodeid = dlm_hash2nodeid(ls, ms->m_hash);
+	dir_nodeid = dlm_hash2nodeid(ls, le32_to_cpu(ms->m_hash));
 	if (dir_nodeid != dlm_our_nodeid()) {
 		log_error(ls, "receive_remove from %d bad nodeid %d",
 			  from_nodeid, dir_nodeid);
@@ -4503,7 +4505,7 @@ static void receive_remove(struct dlm_ls *ls, struct dlm_message *ms)
 
 static void receive_purge(struct dlm_ls *ls, struct dlm_message *ms)
 {
-	do_purge(ls, ms->m_nodeid, ms->m_pid);
+	do_purge(ls, le32_to_cpu(ms->m_nodeid), le32_to_cpu(ms->m_pid));
 }
 
 static int receive_request_reply(struct dlm_ls *ls, struct dlm_message *ms)
@@ -4513,7 +4515,7 @@ static int receive_request_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	int error, mstype, result;
 	int from_nodeid = le32_to_cpu(ms->m_header.h_nodeid);
 
-	error = find_lkb(ls, ms->m_remid, &lkb);
+	error = find_lkb(ls, le32_to_cpu(ms->m_remid), &lkb);
 	if (error)
 		return error;
 
@@ -4529,7 +4531,8 @@ static int receive_request_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	error = remove_from_waiters(lkb, DLM_MSG_REQUEST_REPLY);
 	if (error) {
 		log_error(ls, "receive_request_reply %x remote %d %x result %d",
-			  lkb->lkb_id, from_nodeid, ms->m_lkid, ms->m_result);
+			  lkb->lkb_id, from_nodeid, le32_to_cpu(ms->m_lkid),
+			  from_dlm_errno(le32_to_cpu(ms->m_result)));
 		dlm_dump_rsb(r);
 		goto out;
 	}
@@ -4543,7 +4546,7 @@ static int receive_request_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	}
 
 	/* this is the value returned from do_request() on the master */
-	result = ms->m_result;
+	result = from_dlm_errno(le32_to_cpu(ms->m_result));
 
 	switch (result) {
 	case -EAGAIN:
@@ -4557,7 +4560,7 @@ static int receive_request_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	case 0:
 		/* request was queued or granted on remote master */
 		receive_flags_reply(lkb, ms);
-		lkb->lkb_remid = ms->m_lkid;
+		lkb->lkb_remid = le32_to_cpu(ms->m_lkid);
 		if (is_altmode(lkb))
 			munge_altmode(lkb, ms);
 		if (result) {
@@ -4630,7 +4633,7 @@ static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 				    struct dlm_message *ms)
 {
 	/* this is the value returned from do_convert() on the master */
-	switch (ms->m_result) {
+	switch (from_dlm_errno(le32_to_cpu(ms->m_result))) {
 	case -EAGAIN:
 		/* convert would block (be queued) on remote master */
 		queue_cast(r, lkb, -EAGAIN);
@@ -4664,7 +4667,8 @@ static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 	default:
 		log_error(r->res_ls, "receive_convert_reply %x remote %d %x %d",
 			  lkb->lkb_id, le32_to_cpu(ms->m_header.h_nodeid),
-			  ms->m_lkid, ms->m_result);
+			  le32_to_cpu(ms->m_lkid),
+			  from_dlm_errno(le32_to_cpu(ms->m_result)));
 		dlm_print_rsb(r);
 		dlm_print_lkb(lkb);
 	}
@@ -4698,7 +4702,7 @@ static int receive_convert_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	struct dlm_lkb *lkb;
 	int error;
 
-	error = find_lkb(ls, ms->m_remid, &lkb);
+	error = find_lkb(ls, le32_to_cpu(ms->m_remid), &lkb);
 	if (error)
 		return error;
 
@@ -4726,7 +4730,7 @@ static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 
 	/* this is the value returned from do_unlock() on the master */
 
-	switch (ms->m_result) {
+	switch (from_dlm_errno(le32_to_cpu(ms->m_result))) {
 	case -DLM_EUNLOCK:
 		receive_flags_reply(lkb, ms);
 		remove_lock_pc(r, lkb);
@@ -4736,7 +4740,7 @@ static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 		break;
 	default:
 		log_error(r->res_ls, "receive_unlock_reply %x error %d",
-			  lkb->lkb_id, ms->m_result);
+			  lkb->lkb_id, from_dlm_errno(le32_to_cpu(ms->m_result)));
 	}
  out:
 	unlock_rsb(r);
@@ -4748,7 +4752,7 @@ static int receive_unlock_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	struct dlm_lkb *lkb;
 	int error;
 
-	error = find_lkb(ls, ms->m_remid, &lkb);
+	error = find_lkb(ls, le32_to_cpu(ms->m_remid), &lkb);
 	if (error)
 		return error;
 
@@ -4776,7 +4780,7 @@ static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 
 	/* this is the value returned from do_cancel() on the master */
 
-	switch (ms->m_result) {
+	switch (from_dlm_errno(le32_to_cpu(ms->m_result))) {
 	case -DLM_ECANCEL:
 		receive_flags_reply(lkb, ms);
 		revert_lock_pc(r, lkb);
@@ -4786,7 +4790,8 @@ static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 		break;
 	default:
 		log_error(r->res_ls, "receive_cancel_reply %x error %d",
-			  lkb->lkb_id, ms->m_result);
+			  lkb->lkb_id,
+			  from_dlm_errno(le32_to_cpu(ms->m_result)));
 	}
  out:
 	unlock_rsb(r);
@@ -4798,7 +4803,7 @@ static int receive_cancel_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	struct dlm_lkb *lkb;
 	int error;
 
-	error = find_lkb(ls, ms->m_remid, &lkb);
+	error = find_lkb(ls, le32_to_cpu(ms->m_remid), &lkb);
 	if (error)
 		return error;
 
@@ -4814,9 +4819,10 @@ static void receive_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	int error, ret_nodeid;
 	int do_lookup_list = 0;
 
-	error = find_lkb(ls, ms->m_lkid, &lkb);
+	error = find_lkb(ls, le32_to_cpu(ms->m_lkid), &lkb);
 	if (error) {
-		log_error(ls, "receive_lookup_reply no lkid %x", ms->m_lkid);
+		log_error(ls, "%s no lkid %x", __func__,
+			  le32_to_cpu(ms->m_lkid));
 		return;
 	}
 
@@ -4831,7 +4837,7 @@ static void receive_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	if (error)
 		goto out;
 
-	ret_nodeid = ms->m_nodeid;
+	ret_nodeid = le32_to_cpu(ms->m_nodeid);
 
 	/* We sometimes receive a request from the dir node for this
 	   rsb before we've received the dir node's loookup_reply for it.
@@ -4892,8 +4898,10 @@ static void _receive_message(struct dlm_ls *ls, struct dlm_message *ms,
 
 	if (!dlm_is_member(ls, le32_to_cpu(ms->m_header.h_nodeid))) {
 		log_limit(ls, "receive %d from non-member %d %x %x %d",
-			  ms->m_type, le32_to_cpu(ms->m_header.h_nodeid),
-			  ms->m_lkid, ms->m_remid, ms->m_result);
+			  le32_to_cpu(ms->m_type),
+			  le32_to_cpu(ms->m_header.h_nodeid),
+			  le32_to_cpu(ms->m_lkid), le32_to_cpu(ms->m_remid),
+			  from_dlm_errno(le32_to_cpu(ms->m_result)));
 		return;
 	}
 
@@ -4901,77 +4909,78 @@ static void _receive_message(struct dlm_ls *ls, struct dlm_message *ms,
 
 	/* messages sent to a master node */
 
-	case DLM_MSG_REQUEST:
+	case cpu_to_le32(DLM_MSG_REQUEST):
 		error = receive_request(ls, ms);
 		break;
 
-	case DLM_MSG_CONVERT:
+	case cpu_to_le32(DLM_MSG_CONVERT):
 		error = receive_convert(ls, ms);
 		break;
 
-	case DLM_MSG_UNLOCK:
+	case cpu_to_le32(DLM_MSG_UNLOCK):
 		error = receive_unlock(ls, ms);
 		break;
 
-	case DLM_MSG_CANCEL:
+	case cpu_to_le32(DLM_MSG_CANCEL):
 		noent = 1;
 		error = receive_cancel(ls, ms);
 		break;
 
 	/* messages sent from a master node (replies to above) */
 
-	case DLM_MSG_REQUEST_REPLY:
+	case cpu_to_le32(DLM_MSG_REQUEST_REPLY):
 		error = receive_request_reply(ls, ms);
 		break;
 
-	case DLM_MSG_CONVERT_REPLY:
+	case cpu_to_le32(DLM_MSG_CONVERT_REPLY):
 		error = receive_convert_reply(ls, ms);
 		break;
 
-	case DLM_MSG_UNLOCK_REPLY:
+	case cpu_to_le32(DLM_MSG_UNLOCK_REPLY):
 		error = receive_unlock_reply(ls, ms);
 		break;
 
-	case DLM_MSG_CANCEL_REPLY:
+	case cpu_to_le32(DLM_MSG_CANCEL_REPLY):
 		error = receive_cancel_reply(ls, ms);
 		break;
 
 	/* messages sent from a master node (only two types of async msg) */
 
-	case DLM_MSG_GRANT:
+	case cpu_to_le32(DLM_MSG_GRANT):
 		noent = 1;
 		error = receive_grant(ls, ms);
 		break;
 
-	case DLM_MSG_BAST:
+	case cpu_to_le32(DLM_MSG_BAST):
 		noent = 1;
 		error = receive_bast(ls, ms);
 		break;
 
 	/* messages sent to a dir node */
 
-	case DLM_MSG_LOOKUP:
+	case cpu_to_le32(DLM_MSG_LOOKUP):
 		receive_lookup(ls, ms);
 		break;
 
-	case DLM_MSG_REMOVE:
+	case cpu_to_le32(DLM_MSG_REMOVE):
 		receive_remove(ls, ms);
 		break;
 
 	/* messages sent from a dir node (remove has no reply) */
 
-	case DLM_MSG_LOOKUP_REPLY:
+	case cpu_to_le32(DLM_MSG_LOOKUP_REPLY):
 		receive_lookup_reply(ls, ms);
 		break;
 
 	/* other messages */
 
-	case DLM_MSG_PURGE:
+	case cpu_to_le32(DLM_MSG_PURGE):
 		receive_purge(ls, ms);
 		break;
 
 	default:
-		log_error(ls, "unknown message type %d", ms->m_type);
+		log_error(ls, "unknown message type %d",
+			  le32_to_cpu(ms->m_type));
 	}
 
 	/*
@@ -4987,24 +4996,26 @@ static void _receive_message(struct dlm_ls *ls, struct dlm_message *ms,
 
 	if (error == -ENOENT && noent) {
 		log_debug(ls, "receive %d no %x remote %d %x saved_seq %u",
-			  ms->m_type, ms->m_remid,
+			  le32_to_cpu(ms->m_type), le32_to_cpu(ms->m_remid),
 			  le32_to_cpu(ms->m_header.h_nodeid),
-			  ms->m_lkid, saved_seq);
+			  le32_to_cpu(ms->m_lkid), saved_seq);
 	} else if (error == -ENOENT) {
 		log_error(ls, "receive %d no %x remote %d %x saved_seq %u",
-			  ms->m_type, ms->m_remid,
+			  le32_to_cpu(ms->m_type), le32_to_cpu(ms->m_remid),
 			  le32_to_cpu(ms->m_header.h_nodeid),
-			  ms->m_lkid, saved_seq);
+			  le32_to_cpu(ms->m_lkid), saved_seq);
 
-		if (ms->m_type == DLM_MSG_CONVERT)
-			dlm_dump_rsb_hash(ls, ms->m_hash);
+		if (ms->m_type == cpu_to_le32(DLM_MSG_CONVERT))
+			dlm_dump_rsb_hash(ls, le32_to_cpu(ms->m_hash));
 	}
 
 	if (error == -EINVAL) {
 		log_error(ls, "receive %d inval from %d lkid %x remid %x "
 			  "saved_seq %u",
-			  ms->m_type, le32_to_cpu(ms->m_header.h_nodeid),
-			  ms->m_lkid, ms->m_remid, saved_seq);
+			  le32_to_cpu(ms->m_type),
+			  le32_to_cpu(ms->m_header.h_nodeid),
+			  le32_to_cpu(ms->m_lkid), le32_to_cpu(ms->m_remid),
+			  saved_seq);
 	}
 }
 
@@ -5025,7 +5036,7 @@ static void dlm_receive_message(struct dlm_ls *ls, struct dlm_message *ms,
 		   lockspace generation before we left. */
 		if (!ls->ls_generation) {
 			log_limit(ls, "receive %d from %d ignore old gen",
-				  ms->m_type, nodeid);
+				  le32_to_cpu(ms->m_type), nodeid);
 			return;
 		}
 
@@ -5058,8 +5069,7 @@ void dlm_receive_buffer(union dlm_packet *p, int nodeid)
 
 	switch (hd->h_cmd) {
 	case DLM_MSG:
-		dlm_message_in(&p->message);
-		type = p->message.m_type;
+		type = le32_to_cpu(p->message.m_type);
 		break;
 	case DLM_RCOM:
 		type = le32_to_cpu(p->rcom.rc_type);
@@ -5109,9 +5119,9 @@ static void recover_convert_waiter(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	if (middle_conversion(lkb)) {
 		hold_lkb(lkb);
 		memset(ms_stub, 0, sizeof(struct dlm_message));
-		ms_stub->m_flags = DLM_IFL_STUB_MS;
-		ms_stub->m_type = DLM_MSG_CONVERT_REPLY;
-		ms_stub->m_result = -EINPROGRESS;
+		ms_stub->m_flags = cpu_to_le32(DLM_IFL_STUB_MS);
+		ms_stub->m_type = cpu_to_le32(DLM_MSG_CONVERT_REPLY);
+		ms_stub->m_result = cpu_to_le32(to_dlm_errno(-EINPROGRESS));
 		ms_stub->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
 		_receive_convert_reply(lkb, ms_stub);
 
@@ -5231,9 +5241,9 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 		case DLM_MSG_UNLOCK:
 			hold_lkb(lkb);
 			memset(ms_stub, 0, sizeof(struct dlm_message));
-			ms_stub->m_flags = DLM_IFL_STUB_MS;
-			ms_stub->m_type = DLM_MSG_UNLOCK_REPLY;
-			ms_stub->m_result = stub_unlock_result;
+			ms_stub->m_flags = cpu_to_le32(DLM_IFL_STUB_MS);
+			ms_stub->m_type = cpu_to_le32(DLM_MSG_UNLOCK_REPLY);
+			ms_stub->m_result = cpu_to_le32(to_dlm_errno(stub_unlock_result));
 			ms_stub->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
 			_receive_unlock_reply(lkb, ms_stub);
 			dlm_put_lkb(lkb);
@@ -5242,9 +5252,9 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 		case DLM_MSG_CANCEL:
 			hold_lkb(lkb);
 			memset(ms_stub, 0, sizeof(struct dlm_message));
-			ms_stub->m_flags = DLM_IFL_STUB_MS;
-			ms_stub->m_type = DLM_MSG_CANCEL_REPLY;
-			ms_stub->m_result = stub_cancel_result;
+			ms_stub->m_flags = cpu_to_le32(DLM_IFL_STUB_MS);
+			ms_stub->m_type = cpu_to_le32(DLM_MSG_CANCEL_REPLY);
+			ms_stub->m_result = cpu_to_le32(to_dlm_errno(stub_cancel_result));
 			ms_stub->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
 			_receive_cancel_reply(lkb, ms_stub);
 			dlm_put_lkb(lkb);
@@ -6316,8 +6326,8 @@ static int send_purge(struct dlm_ls *ls, int nodeid, int pid)
 				DLM_MSG_PURGE, &ms, &mh);
 	if (error)
 		return error;
-	ms->m_nodeid = nodeid;
-	ms->m_pid = pid;
+	ms->m_nodeid = cpu_to_le32(nodeid);
+	ms->m_pid = cpu_to_le32(pid);
 
 	return send_message(mh, ms);
 }
diff --git a/fs/dlm/requestqueue.c b/fs/dlm/requestqueue.c
index 30355490c45c..036a9a0078f6 100644
--- a/fs/dlm/requestqueue.c
+++ b/fs/dlm/requestqueue.c
@@ -14,6 +14,7 @@
 #include "dir.h"
 #include "config.h"
 #include "requestqueue.h"
+#include "util.h"
 
 struct rq_entry {
 	struct list_head list;
@@ -83,8 +84,10 @@ int dlm_process_requestqueue(struct dlm_ls *ls)
 
 		log_limit(ls, "dlm_process_requestqueue msg %d from %d "
 			  "lkid %x remid %x result %d seq %u",
-			  ms->m_type, le32_to_cpu(ms->m_header.h_nodeid),
-			  ms->m_lkid, ms->m_remid, ms->m_result,
+			  le32_to_cpu(ms->m_type),
+			  le32_to_cpu(ms->m_header.h_nodeid),
+			  le32_to_cpu(ms->m_lkid), le32_to_cpu(ms->m_remid),
+			  from_dlm_errno(le32_to_cpu(ms->m_result)),
 			  e->recover_seq);
 
 		dlm_receive_message_saved(ls, &e->request, e->recover_seq);
@@ -125,7 +128,7 @@ void dlm_wait_requestqueue(struct dlm_ls *ls)
 
 static int purge_request(struct dlm_ls *ls, struct dlm_message *ms, int nodeid)
 {
-	uint32_t type = ms->m_type;
+	__le32 type = ms->m_type;
 
 	/* the ls is being cleaned up and freed by release_lockspace */
 	if (!atomic_read(&ls->ls_count))
@@ -137,9 +140,9 @@ static int purge_request(struct dlm_ls *ls, struct dlm_message *ms, int nodeid)
 	/* directory operations are always purged because the directory is
 	   always rebuilt during recovery and the lookups resent */
 
-	if (type == DLM_MSG_REMOVE ||
-	    type == DLM_MSG_LOOKUP ||
-	    type == DLM_MSG_LOOKUP_REPLY)
+	if (type == cpu_to_le32(DLM_MSG_REMOVE) ||
+	    type == cpu_to_le32(DLM_MSG_LOOKUP) ||
+	    type == cpu_to_le32(DLM_MSG_LOOKUP_REPLY))
 		return 1;
 
 	if (!dlm_no_directory(ls))
diff --git a/fs/dlm/util.c b/fs/dlm/util.c
index 657dbed1bd60..f2bc401f312f 100644
--- a/fs/dlm/util.c
+++ b/fs/dlm/util.c
@@ -23,7 +23,7 @@
 /* higher errno values are inconsistent across architectures, so select
    one set of values for on the wire */
 
-static int to_dlm_errno(int err)
+int to_dlm_errno(int err)
 {
 	switch (err) {
 	case -EDEADLK:
@@ -44,7 +44,7 @@ static int to_dlm_errno(int err)
 	return err;
 }
 
-static int from_dlm_errno(int err)
+int from_dlm_errno(int err)
 {
 	switch (err) {
 	case -DLM_ERRNO_EDEADLK:
@@ -64,47 +64,3 @@ static int from_dlm_errno(int err)
 	}
 	return err;
 }
-
-void dlm_message_out(struct dlm_message *ms)
-{
-	ms->m_type		= cpu_to_le32(ms->m_type);
-	ms->m_nodeid		= cpu_to_le32(ms->m_nodeid);
-	ms->m_pid		= cpu_to_le32(ms->m_pid);
-	ms->m_lkid		= cpu_to_le32(ms->m_lkid);
-	ms->m_remid		= cpu_to_le32(ms->m_remid);
-	ms->m_parent_lkid	= cpu_to_le32(ms->m_parent_lkid);
-	ms->m_parent_remid	= cpu_to_le32(ms->m_parent_remid);
-	ms->m_exflags		= cpu_to_le32(ms->m_exflags);
-	ms->m_sbflags		= cpu_to_le32(ms->m_sbflags);
-	ms->m_flags		= cpu_to_le32(ms->m_flags);
-	ms->m_lvbseq		= cpu_to_le32(ms->m_lvbseq);
-	ms->m_hash		= cpu_to_le32(ms->m_hash);
-	ms->m_status		= cpu_to_le32(ms->m_status);
-	ms->m_grmode		= cpu_to_le32(ms->m_grmode);
-	ms->m_rqmode		= cpu_to_le32(ms->m_rqmode);
-	ms->m_bastmode		= cpu_to_le32(ms->m_bastmode);
-	ms->m_asts		= cpu_to_le32(ms->m_asts);
-	ms->m_result		= cpu_to_le32(to_dlm_errno(ms->m_result));
-}
-
-void dlm_message_in(struct dlm_message *ms)
-{
-	ms->m_type		= le32_to_cpu(ms->m_type);
-	ms->m_nodeid		= le32_to_cpu(ms->m_nodeid);
-	ms->m_pid		= le32_to_cpu(ms->m_pid);
-	ms->m_lkid		= le32_to_cpu(ms->m_lkid);
-	ms->m_remid		= le32_to_cpu(ms->m_remid);
-	ms->m_parent_lkid	= le32_to_cpu(ms->m_parent_lkid);
-	ms->m_parent_remid	= le32_to_cpu(ms->m_parent_remid);
-	ms->m_exflags		= le32_to_cpu(ms->m_exflags);
-	ms->m_sbflags		= le32_to_cpu(ms->m_sbflags);
-	ms->m_flags		= le32_to_cpu(ms->m_flags);
-	ms->m_lvbseq		= le32_to_cpu(ms->m_lvbseq);
-	ms->m_hash		= le32_to_cpu(ms->m_hash);
-	ms->m_status		= le32_to_cpu(ms->m_status);
-	ms->m_grmode		= le32_to_cpu(ms->m_grmode);
-	ms->m_rqmode		= le32_to_cpu(ms->m_rqmode);
-	ms->m_bastmode		= le32_to_cpu(ms->m_bastmode);
-	ms->m_asts		= le32_to_cpu(ms->m_asts);
-	ms->m_result		= from_dlm_errno(le32_to_cpu(ms->m_result));
-}
diff --git a/fs/dlm/util.h b/fs/dlm/util.h
index cd099c4f5d6a..b6a4b8adca8d 100644
--- a/fs/dlm/util.h
+++ b/fs/dlm/util.h
@@ -11,8 +11,8 @@
 #ifndef __UTIL_DOT_H__
 #define __UTIL_DOT_H__
 
-void dlm_message_out(struct dlm_message *ms);
-void dlm_message_in(struct dlm_message *ms);
+int to_dlm_errno(int err);
+int from_dlm_errno(int err);
 
 #endif
 
-- 
2.31.1

