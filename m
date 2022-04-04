Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D21864F1A10
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102844;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S+2CNF6dfj/CTHzk4dMoVaeDtUD0MAq7UaApZ1/6tYw=;
	b=Z5QaYECpHIHEEjbz1WeVFEW30qjm+oCGZx18/JlCy2I/QYWmLasksNROqDRZd97WOlLCp5
	fj5m6m44sG3vKDiED9k5FpIfIqXEEoL0J+uc3jvuPknyi6Xv7KknazRVVzZ1vxaGgcf4YC
	x1xwZzfAup2+N+ZTinHrJ+krlKnD+iE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-k4B3qPtoN9SyFCgcgW0KPA-1; Mon, 04 Apr 2022 16:07:21 -0400
X-MC-Unique: k4B3qPtoN9SyFCgcgW0KPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 825B6811E7A;
	Mon,  4 Apr 2022 20:07:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8492F40D0167;
	Mon,  4 Apr 2022 20:07:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B3B8A193F514;
	Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B3474193F6D9 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 949C47C2A; Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71AA58145;
 Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:39 -0400
Message-Id: <20220404200646.3170301-13-aahringo@redhat.com>
In-Reply-To: <20220404200646.3170301-1-aahringo@redhat.com>
References: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 12/19] fs: dlm: use __le
 types for dlm header
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch changes to use __le types directly in the dlm header
structure which is casted at the right dlm message buffer positions.

The main goal what is reached here is to remove sparse warnings
regarding to host to little byte order conversion or vice versa. Leaving
those sparse issues ignored and always do it in out/in functionality
tends to leave it unknown in which byte order the variable is being
handled.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dir.c          |  2 +-
 fs/dlm/dlm_internal.h | 10 ++---
 fs/dlm/lock.c         | 95 +++++++++++++++++++++++--------------------
 fs/dlm/member.c       |  2 +-
 fs/dlm/midcomms.c     | 28 ++++++-------
 fs/dlm/rcom.c         | 42 ++++++++++---------
 fs/dlm/requestqueue.c |  7 ++--
 fs/dlm/util.c         | 26 ------------
 fs/dlm/util.h         |  2 -
 9 files changed, 98 insertions(+), 116 deletions(-)

diff --git a/fs/dlm/dir.c b/fs/dlm/dir.c
index b6692f81ec83..fb1981654bb2 100644
--- a/fs/dlm/dir.c
+++ b/fs/dlm/dir.c
@@ -101,7 +101,7 @@ int dlm_recover_directory(struct dlm_ls *ls)
 			 */
 
 			b = ls->ls_recover_buf->rc_buf;
-			left = ls->ls_recover_buf->rc_header.h_length;
+			left = le16_to_cpu(ls->ls_recover_buf->rc_header.h_length);
 			left -= sizeof(struct dlm_rcom);
 
 			for (;;) {
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 2bd1b249f2ee..0412a5ad8f52 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -379,15 +379,15 @@ static inline int rsb_flag(struct dlm_rsb *r, enum rsb_flags flag)
 #define DLM_FIN			5
 
 struct dlm_header {
-	uint32_t		h_version;
+	__le32			h_version;
 	union {
 		/* for DLM_MSG and DLM_RCOM */
-		uint32_t	h_lockspace;
+		__le32		h_lockspace;
 		/* for DLM_ACK and DLM_OPTS */
-		uint32_t	h_seq;
+		__le32		h_seq;
 	} u;
-	uint32_t		h_nodeid;	/* nodeid of sender */
-	uint16_t		h_length;
+	__le32			h_nodeid;	/* nodeid of sender */
+	__le16			h_length;
 	uint8_t			h_cmd;		/* DLM_MSG, DLM_RCOM */
 	uint8_t			h_pad;
 };
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index e72f1a063aeb..a889d7a6784d 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1571,8 +1571,8 @@ static int _remove_from_waiters(struct dlm_lkb *lkb, int mstype,
 	}
 
 	log_error(ls, "remwait error %x remote %d %x msg %d flags %x no wait",
-		  lkb->lkb_id, ms ? ms->m_header.h_nodeid : 0, lkb->lkb_remid,
-		  mstype, lkb->lkb_flags);
+		  lkb->lkb_id, ms ? le32_to_cpu(ms->m_header.h_nodeid) : 0,
+		  lkb->lkb_remid, mstype, lkb->lkb_flags);
 	return -1;
 
  out_del:
@@ -3564,10 +3564,10 @@ static int _create_message(struct dlm_ls *ls, int mb_len,
 
 	ms = (struct dlm_message *) mb;
 
-	ms->m_header.h_version = (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
-	ms->m_header.u.h_lockspace = ls->ls_global_id;
-	ms->m_header.h_nodeid = dlm_our_nodeid();
-	ms->m_header.h_length = mb_len;
+	ms->m_header.h_version = cpu_to_le32(DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
+	ms->m_header.u.h_lockspace = cpu_to_le32(ls->ls_global_id);
+	ms->m_header.h_nodeid = cpu_to_le32(dlm_our_nodeid());
+	ms->m_header.h_length = cpu_to_le16(mb_len);
 	ms->m_header.h_cmd = DLM_MSG;
 
 	ms->m_type = mstype;
@@ -3861,7 +3861,7 @@ static int send_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms_in,
 	struct dlm_rsb *r = &ls->ls_stub_rsb;
 	struct dlm_message *ms;
 	struct dlm_mhandle *mh;
-	int error, nodeid = ms_in->m_header.h_nodeid;
+	int error, nodeid = le32_to_cpu(ms_in->m_header.h_nodeid);
 
 	error = create_message(r, NULL, nodeid, DLM_MSG_LOOKUP_REPLY, &ms, &mh);
 	if (error)
@@ -3900,7 +3900,8 @@ static void receive_flags_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 
 static int receive_extralen(struct dlm_message *ms)
 {
-	return (ms->m_header.h_length - sizeof(struct dlm_message));
+	return (le16_to_cpu(ms->m_header.h_length) -
+		sizeof(struct dlm_message));
 }
 
 static int receive_lvb(struct dlm_ls *ls, struct dlm_lkb *lkb,
@@ -3934,7 +3935,7 @@ static void fake_astfn(void *astparam)
 static int receive_request_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 				struct dlm_message *ms)
 {
-	lkb->lkb_nodeid = ms->m_header.h_nodeid;
+	lkb->lkb_nodeid = le32_to_cpu(ms->m_header.h_nodeid);
 	lkb->lkb_ownpid = ms->m_pid;
 	lkb->lkb_remid = ms->m_lkid;
 	lkb->lkb_grmode = DLM_LOCK_IV;
@@ -3982,7 +3983,7 @@ static int receive_unlock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 static void setup_stub_lkb(struct dlm_ls *ls, struct dlm_message *ms)
 {
 	struct dlm_lkb *lkb = &ls->ls_stub_lkb;
-	lkb->lkb_nodeid = ms->m_header.h_nodeid;
+	lkb->lkb_nodeid = le32_to_cpu(ms->m_header.h_nodeid);
 	lkb->lkb_remid = ms->m_lkid;
 }
 
@@ -3991,7 +3992,7 @@ static void setup_stub_lkb(struct dlm_ls *ls, struct dlm_message *ms)
 
 static int validate_message(struct dlm_lkb *lkb, struct dlm_message *ms)
 {
-	int from = ms->m_header.h_nodeid;
+	int from = le32_to_cpu(ms->m_header.h_nodeid);
 	int error = 0;
 
 	/* currently mixing of user/kernel locks are not supported */
@@ -4105,7 +4106,7 @@ static int receive_request(struct dlm_ls *ls, struct dlm_message *ms)
 	int from_nodeid;
 	int error, namelen = 0;
 
-	from_nodeid = ms->m_header.h_nodeid;
+	from_nodeid = le32_to_cpu(ms->m_header.h_nodeid);
 
 	error = create_lkb(ls, &lkb);
 	if (error)
@@ -4205,7 +4206,7 @@ static int receive_convert(struct dlm_ls *ls, struct dlm_message *ms)
 		log_error(ls, "receive_convert %x remid %x recover_seq %llu "
 			  "remote %d %x", lkb->lkb_id, lkb->lkb_remid,
 			  (unsigned long long)lkb->lkb_recover_seq,
-			  ms->m_header.h_nodeid, ms->m_lkid);
+			  le32_to_cpu(ms->m_header.h_nodeid), ms->m_lkid);
 		error = -ENOENT;
 		dlm_put_lkb(lkb);
 		goto fail;
@@ -4259,7 +4260,7 @@ static int receive_unlock(struct dlm_ls *ls, struct dlm_message *ms)
 	if (lkb->lkb_remid != ms->m_lkid) {
 		log_error(ls, "receive_unlock %x remid %x remote %d %x",
 			  lkb->lkb_id, lkb->lkb_remid,
-			  ms->m_header.h_nodeid, ms->m_lkid);
+			  le32_to_cpu(ms->m_header.h_nodeid), ms->m_lkid);
 		error = -ENOENT;
 		dlm_put_lkb(lkb);
 		goto fail;
@@ -4396,7 +4397,7 @@ static void receive_lookup(struct dlm_ls *ls, struct dlm_message *ms)
 {
 	int len, error, ret_nodeid, from_nodeid, our_nodeid;
 
-	from_nodeid = ms->m_header.h_nodeid;
+	from_nodeid = le32_to_cpu(ms->m_header.h_nodeid);
 	our_nodeid = dlm_our_nodeid();
 
 	len = receive_extralen(ms);
@@ -4419,7 +4420,7 @@ static void receive_remove(struct dlm_ls *ls, struct dlm_message *ms)
 	uint32_t hash, b;
 	int rv, len, dir_nodeid, from_nodeid;
 
-	from_nodeid = ms->m_header.h_nodeid;
+	from_nodeid = le32_to_cpu(ms->m_header.h_nodeid);
 
 	len = receive_extralen(ms);
 
@@ -4510,7 +4511,7 @@ static int receive_request_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	struct dlm_lkb *lkb;
 	struct dlm_rsb *r;
 	int error, mstype, result;
-	int from_nodeid = ms->m_header.h_nodeid;
+	int from_nodeid = le32_to_cpu(ms->m_header.h_nodeid);
 
 	error = find_lkb(ls, ms->m_remid, &lkb);
 	if (error)
@@ -4662,8 +4663,8 @@ static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 
 	default:
 		log_error(r->res_ls, "receive_convert_reply %x remote %d %x %d",
-			  lkb->lkb_id, ms->m_header.h_nodeid, ms->m_lkid,
-			  ms->m_result);
+			  lkb->lkb_id, le32_to_cpu(ms->m_header.h_nodeid),
+			  ms->m_lkid, ms->m_result);
 		dlm_print_rsb(r);
 		dlm_print_lkb(lkb);
 	}
@@ -4842,8 +4843,8 @@ static void receive_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms)
 		/* This should never happen */
 		log_error(ls, "receive_lookup_reply %x from %d ret %d "
 			  "master %d dir %d our %d first %x %s",
-			  lkb->lkb_id, ms->m_header.h_nodeid, ret_nodeid,
-			  r->res_master_nodeid, r->res_dir_nodeid,
+			  lkb->lkb_id, le32_to_cpu(ms->m_header.h_nodeid),
+			  ret_nodeid, r->res_master_nodeid, r->res_dir_nodeid,
 			  dlm_our_nodeid(), r->res_first_lkid, r->res_name);
 	}
 
@@ -4855,7 +4856,7 @@ static void receive_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	} else if (ret_nodeid == -1) {
 		/* the remote node doesn't believe it's the dir node */
 		log_error(ls, "receive_lookup_reply %x from %d bad ret_nodeid",
-			  lkb->lkb_id, ms->m_header.h_nodeid);
+			  lkb->lkb_id, le32_to_cpu(ms->m_header.h_nodeid));
 		r->res_master_nodeid = 0;
 		r->res_nodeid = -1;
 		lkb->lkb_nodeid = -1;
@@ -4889,10 +4890,10 @@ static void _receive_message(struct dlm_ls *ls, struct dlm_message *ms,
 {
 	int error = 0, noent = 0;
 
-	if (!dlm_is_member(ls, ms->m_header.h_nodeid)) {
+	if (!dlm_is_member(ls, le32_to_cpu(ms->m_header.h_nodeid))) {
 		log_limit(ls, "receive %d from non-member %d %x %x %d",
-			  ms->m_type, ms->m_header.h_nodeid, ms->m_lkid,
-			  ms->m_remid, ms->m_result);
+			  ms->m_type, le32_to_cpu(ms->m_header.h_nodeid),
+			  ms->m_lkid, ms->m_remid, ms->m_result);
 		return;
 	}
 
@@ -4986,11 +4987,13 @@ static void _receive_message(struct dlm_ls *ls, struct dlm_message *ms,
 
 	if (error == -ENOENT && noent) {
 		log_debug(ls, "receive %d no %x remote %d %x saved_seq %u",
-			  ms->m_type, ms->m_remid, ms->m_header.h_nodeid,
+			  ms->m_type, ms->m_remid,
+			  le32_to_cpu(ms->m_header.h_nodeid),
 			  ms->m_lkid, saved_seq);
 	} else if (error == -ENOENT) {
 		log_error(ls, "receive %d no %x remote %d %x saved_seq %u",
-			  ms->m_type, ms->m_remid, ms->m_header.h_nodeid,
+			  ms->m_type, ms->m_remid,
+			  le32_to_cpu(ms->m_header.h_nodeid),
 			  ms->m_lkid, saved_seq);
 
 		if (ms->m_type == DLM_MSG_CONVERT)
@@ -5000,7 +5003,7 @@ static void _receive_message(struct dlm_ls *ls, struct dlm_message *ms,
 	if (error == -EINVAL) {
 		log_error(ls, "receive %d inval from %d lkid %x remid %x "
 			  "saved_seq %u",
-			  ms->m_type, ms->m_header.h_nodeid,
+			  ms->m_type, le32_to_cpu(ms->m_header.h_nodeid),
 			  ms->m_lkid, ms->m_remid, saved_seq);
 	}
 }
@@ -5067,18 +5070,20 @@ void dlm_receive_buffer(union dlm_packet *p, int nodeid)
 		return;
 	}
 
-	if (hd->h_nodeid != nodeid) {
+	if (le32_to_cpu(hd->h_nodeid) != nodeid) {
 		log_print("invalid h_nodeid %d from %d lockspace %x",
-			  hd->h_nodeid, nodeid, hd->u.h_lockspace);
+			  le32_to_cpu(hd->h_nodeid), nodeid,
+			  le32_to_cpu(hd->u.h_lockspace));
 		return;
 	}
 
-	ls = dlm_find_lockspace_global(hd->u.h_lockspace);
+	ls = dlm_find_lockspace_global(le32_to_cpu(hd->u.h_lockspace));
 	if (!ls) {
 		if (dlm_config.ci_log_debug) {
 			printk_ratelimited(KERN_DEBUG "dlm: invalid lockspace "
 				"%u from %d cmd %d type %d\n",
-				hd->u.h_lockspace, nodeid, hd->h_cmd, type);
+				le32_to_cpu(hd->u.h_lockspace), nodeid,
+				hd->h_cmd, type);
 		}
 
 		if (hd->h_cmd == DLM_RCOM && type == DLM_RCOM_STATUS)
@@ -5108,7 +5113,7 @@ static void recover_convert_waiter(struct dlm_ls *ls, struct dlm_lkb *lkb,
 		ms_stub->m_flags = DLM_IFL_STUB_MS;
 		ms_stub->m_type = DLM_MSG_CONVERT_REPLY;
 		ms_stub->m_result = -EINPROGRESS;
-		ms_stub->m_header.h_nodeid = lkb->lkb_nodeid;
+		ms_stub->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
 		_receive_convert_reply(lkb, ms_stub);
 
 		/* Same special case as in receive_rcom_lock_args() */
@@ -5230,7 +5235,7 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 			ms_stub->m_flags = DLM_IFL_STUB_MS;
 			ms_stub->m_type = DLM_MSG_UNLOCK_REPLY;
 			ms_stub->m_result = stub_unlock_result;
-			ms_stub->m_header.h_nodeid = lkb->lkb_nodeid;
+			ms_stub->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
 			_receive_unlock_reply(lkb, ms_stub);
 			dlm_put_lkb(lkb);
 			break;
@@ -5241,7 +5246,7 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 			ms_stub->m_flags = DLM_IFL_STUB_MS;
 			ms_stub->m_type = DLM_MSG_CANCEL_REPLY;
 			ms_stub->m_result = stub_cancel_result;
-			ms_stub->m_header.h_nodeid = lkb->lkb_nodeid;
+			ms_stub->m_header.h_nodeid = cpu_to_le32(lkb->lkb_nodeid);
 			_receive_cancel_reply(lkb, ms_stub);
 			dlm_put_lkb(lkb);
 			break;
@@ -5606,7 +5611,7 @@ static int receive_rcom_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 {
 	struct rcom_lock *rl = (struct rcom_lock *) rc->rc_buf;
 
-	lkb->lkb_nodeid = rc->rc_header.h_nodeid;
+	lkb->lkb_nodeid = le32_to_cpu(rc->rc_header.h_nodeid);
 	lkb->lkb_ownpid = le32_to_cpu(rl->rl_ownpid);
 	lkb->lkb_remid = le32_to_cpu(rl->rl_lkid);
 	lkb->lkb_exflags = le32_to_cpu(rl->rl_exflags);
@@ -5621,8 +5626,8 @@ static int receive_rcom_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	lkb->lkb_astfn = (rl->rl_asts & DLM_CB_CAST) ? &fake_astfn : NULL;
 
 	if (lkb->lkb_exflags & DLM_LKF_VALBLK) {
-		int lvblen = rc->rc_header.h_length - sizeof(struct dlm_rcom) -
-			 sizeof(struct rcom_lock);
+		int lvblen = le16_to_cpu(rc->rc_header.h_length) -
+			sizeof(struct dlm_rcom) - sizeof(struct rcom_lock);
 		if (lvblen > ls->ls_lvblen)
 			return -EINVAL;
 		lkb->lkb_lvbptr = dlm_allocate_lvb(ls);
@@ -5658,7 +5663,7 @@ int dlm_recover_master_copy(struct dlm_ls *ls, struct dlm_rcom *rc)
 	struct dlm_rsb *r;
 	struct dlm_lkb *lkb;
 	uint32_t remid = 0;
-	int from_nodeid = rc->rc_header.h_nodeid;
+	int from_nodeid = le32_to_cpu(rc->rc_header.h_nodeid);
 	int error;
 
 	if (rl->rl_parent_lkid) {
@@ -5748,7 +5753,8 @@ int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc)
 	error = find_lkb(ls, lkid, &lkb);
 	if (error) {
 		log_error(ls, "dlm_recover_process_copy no %x remote %d %x %d",
-			  lkid, rc->rc_header.h_nodeid, remid, result);
+			  lkid, le32_to_cpu(rc->rc_header.h_nodeid), remid,
+			  result);
 		return error;
 	}
 
@@ -5758,7 +5764,8 @@ int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc)
 
 	if (!is_process_copy(lkb)) {
 		log_error(ls, "dlm_recover_process_copy bad %x remote %d %x %d",
-			  lkid, rc->rc_header.h_nodeid, remid, result);
+			  lkid, le32_to_cpu(rc->rc_header.h_nodeid), remid,
+			  result);
 		dlm_dump_rsb(r);
 		unlock_rsb(r);
 		put_rsb(r);
@@ -5773,7 +5780,8 @@ int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc)
 		   a barrier between recover_masters and recover_locks. */
 
 		log_debug(ls, "dlm_recover_process_copy %x remote %d %x %d",
-			  lkid, rc->rc_header.h_nodeid, remid, result);
+			  lkid, le32_to_cpu(rc->rc_header.h_nodeid), remid,
+			  result);
 	
 		dlm_send_rcom_lock(r, lkb);
 		goto out;
@@ -5783,7 +5791,8 @@ int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc)
 		break;
 	default:
 		log_error(ls, "dlm_recover_process_copy %x remote %d %x %d unk",
-			  lkid, rc->rc_header.h_nodeid, remid, result);
+			  lkid, le32_to_cpu(rc->rc_header.h_nodeid), remid,
+			  result);
 	}
 
 	/* an ack for dlm_recover_locks() which waits for replies from
diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 61f906e705db..4b05b0c1e76b 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -20,7 +20,7 @@
 
 int dlm_slots_version(struct dlm_header *h)
 {
-	if ((h->h_version & 0x0000FFFF) < DLM_HEADER_SLOTS)
+	if ((le32_to_cpu(h->h_version) & 0x0000FFFF) < DLM_HEADER_SLOTS)
 		return 0;
 	return 1;
 }
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index f95f6f40c404..bd4bed09ab2b 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -380,13 +380,12 @@ static int dlm_send_ack(int nodeid, uint32_t seq)
 
 	m_header = (struct dlm_header *)ppc;
 
-	m_header->h_version = (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
-	m_header->h_nodeid = dlm_our_nodeid();
-	m_header->h_length = mb_len;
+	m_header->h_version = cpu_to_le32(DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
+	m_header->h_nodeid = cpu_to_le32(dlm_our_nodeid());
+	m_header->h_length = cpu_to_le16(mb_len);
 	m_header->h_cmd = DLM_ACK;
-	m_header->u.h_seq = seq;
+	m_header->u.h_seq = cpu_to_le32(seq);
 
-	header_out(m_header);
 	dlm_lowcomms_commit_msg(msg);
 	dlm_lowcomms_put_msg(msg);
 
@@ -409,13 +408,11 @@ static int dlm_send_fin(struct midcomms_node *node,
 
 	m_header = (struct dlm_header *)ppc;
 
-	m_header->h_version = (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
-	m_header->h_nodeid = dlm_our_nodeid();
-	m_header->h_length = mb_len;
+	m_header->h_version = cpu_to_le32(DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
+	m_header->h_nodeid = cpu_to_le32(dlm_our_nodeid());
+	m_header->h_length = cpu_to_le16(mb_len);
 	m_header->h_cmd = DLM_FIN;
 
-	header_out(m_header);
-
 	pr_debug("sending fin msg to node %d\n", node->nodeid);
 	dlm_midcomms_commit_mhandle(mh);
 	set_bit(DLM_NODE_FLAG_STOP_TX, &node->flags);
@@ -1020,11 +1017,10 @@ static void dlm_fill_opts_header(struct dlm_opts *opts, uint16_t inner_len,
 				 uint32_t seq)
 {
 	opts->o_header.h_cmd = DLM_OPTS;
-	opts->o_header.h_version = (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
-	opts->o_header.h_nodeid = dlm_our_nodeid();
-	opts->o_header.h_length = DLM_MIDCOMMS_OPT_LEN + inner_len;
-	opts->o_header.u.h_seq = seq;
-	header_out(&opts->o_header);
+	opts->o_header.h_version = cpu_to_le32(DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
+	opts->o_header.h_nodeid = cpu_to_le32(dlm_our_nodeid());
+	opts->o_header.h_length = cpu_to_le16(DLM_MIDCOMMS_OPT_LEN + inner_len);
+	opts->o_header.u.h_seq = cpu_to_le32(seq);
 }
 
 static void midcomms_new_msg_cb(void *data)
@@ -1465,7 +1461,7 @@ static void midcomms_new_rawmsg_cb(void *data)
 		switch (h->h_cmd) {
 		case DLM_OPTS:
 			if (!h->u.h_seq)
-				h->u.h_seq = rd->node->seq_send++;
+				h->u.h_seq = cpu_to_le32(rd->node->seq_send++);
 			break;
 		default:
 			break;
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 5821b777a1a7..02b3fd2c0c19 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -34,10 +34,10 @@ static void _create_rcom(struct dlm_ls *ls, int to_nodeid, int type, int len,
 
 	rc = (struct dlm_rcom *) mb;
 
-	rc->rc_header.h_version = (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
-	rc->rc_header.u.h_lockspace = ls->ls_global_id;
-	rc->rc_header.h_nodeid = dlm_our_nodeid();
-	rc->rc_header.h_length = mb_len;
+	rc->rc_header.h_version = cpu_to_le32(DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
+	rc->rc_header.u.h_lockspace = cpu_to_le32(ls->ls_global_id);
+	rc->rc_header.h_nodeid = cpu_to_le32(dlm_our_nodeid());
+	rc->rc_header.h_length = cpu_to_le16(mb_len);
 	rc->rc_header.h_cmd = DLM_RCOM;
 
 	rc->rc_type = type;
@@ -127,10 +127,10 @@ static int check_rcom_config(struct dlm_ls *ls, struct dlm_rcom *rc, int nodeid)
 {
 	struct rcom_config *rf = (struct rcom_config *) rc->rc_buf;
 
-	if ((rc->rc_header.h_version & 0xFFFF0000) != DLM_HEADER_MAJOR) {
+	if ((le32_to_cpu(rc->rc_header.h_version) & 0xFFFF0000) != DLM_HEADER_MAJOR) {
 		log_error(ls, "version mismatch: %x nodeid %d: %x",
 			  DLM_HEADER_MAJOR | DLM_HEADER_MINOR, nodeid,
-			  rc->rc_header.h_version);
+			  le32_to_cpu(rc->rc_header.h_version));
 		return -EPROTO;
 	}
 
@@ -227,7 +227,7 @@ static void receive_rcom_status(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	struct dlm_rcom *rc;
 	struct rcom_status *rs;
 	uint32_t status;
-	int nodeid = rc_in->rc_header.h_nodeid;
+	int nodeid = le32_to_cpu(rc_in->rc_header.h_nodeid);
 	int len = sizeof(struct rcom_config);
 	struct dlm_msg *msg;
 	int num_slots = 0;
@@ -289,12 +289,14 @@ static void receive_sync_reply(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	if (!test_bit(LSFL_RCOM_WAIT, &ls->ls_flags) ||
 	    rc_in->rc_id != ls->ls_rcom_seq) {
 		log_debug(ls, "reject reply %d from %d seq %llx expect %llx",
-			  rc_in->rc_type, rc_in->rc_header.h_nodeid,
+			  rc_in->rc_type,
+			  le32_to_cpu(rc_in->rc_header.h_nodeid),
 			  (unsigned long long)rc_in->rc_id,
 			  (unsigned long long)ls->ls_rcom_seq);
 		goto out;
 	}
-	memcpy(ls->ls_recover_buf, rc_in, rc_in->rc_header.h_length);
+	memcpy(ls->ls_recover_buf, rc_in,
+	       le16_to_cpu(rc_in->rc_header.h_length));
 	set_bit(LSFL_RCOM_READY, &ls->ls_flags);
 	clear_bit(LSFL_RCOM_WAIT, &ls->ls_flags);
 	wake_up(&ls->ls_wait_general);
@@ -336,8 +338,9 @@ static void receive_rcom_names(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	int error, inlen, outlen, nodeid;
 	struct dlm_msg *msg;
 
-	nodeid = rc_in->rc_header.h_nodeid;
-	inlen = rc_in->rc_header.h_length - sizeof(struct dlm_rcom);
+	nodeid = le32_to_cpu(rc_in->rc_header.h_nodeid);
+	inlen = le16_to_cpu(rc_in->rc_header.h_length) -
+		sizeof(struct dlm_rcom);
 	outlen = DLM_MAX_APP_BUFSIZE - sizeof(struct dlm_rcom);
 
 	error = create_rcom_stateless(ls, nodeid, DLM_RCOM_NAMES_REPLY, outlen,
@@ -375,8 +378,9 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 {
 	struct dlm_rcom *rc;
 	struct dlm_mhandle *mh;
-	int error, ret_nodeid, nodeid = rc_in->rc_header.h_nodeid;
-	int len = rc_in->rc_header.h_length - sizeof(struct dlm_rcom);
+	int error, ret_nodeid, nodeid = le32_to_cpu(rc_in->rc_header.h_nodeid);
+	int len = le16_to_cpu(rc_in->rc_header.h_length) -
+		sizeof(struct dlm_rcom);
 
 	/* Old code would send this special id to trigger a debug dump. */
 	if (rc_in->rc_id == 0xFFFFFFFF) {
@@ -464,7 +468,7 @@ static void receive_rcom_lock(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 {
 	struct dlm_rcom *rc;
 	struct dlm_mhandle *mh;
-	int error, nodeid = rc_in->rc_header.h_nodeid;
+	int error, nodeid = le32_to_cpu(rc_in->rc_header.h_nodeid);
 
 	dlm_recover_master_copy(ls, rc_in);
 
@@ -500,10 +504,10 @@ int dlm_send_ls_not_ready(int nodeid, struct dlm_rcom *rc_in)
 
 	rc = (struct dlm_rcom *) mb;
 
-	rc->rc_header.h_version = (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
+	rc->rc_header.h_version = cpu_to_le32(DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
 	rc->rc_header.u.h_lockspace = rc_in->rc_header.u.h_lockspace;
-	rc->rc_header.h_nodeid = dlm_our_nodeid();
-	rc->rc_header.h_length = mb_len;
+	rc->rc_header.h_nodeid = cpu_to_le32(dlm_our_nodeid());
+	rc->rc_header.h_length = cpu_to_le16(mb_len);
 	rc->rc_header.h_cmd = DLM_RCOM;
 
 	rc->rc_type = DLM_RCOM_STATUS_REPLY;
@@ -631,7 +635,7 @@ void dlm_receive_rcom(struct dlm_ls *ls, struct dlm_rcom *rc, int nodeid)
 		break;
 
 	case DLM_RCOM_LOCK:
-		if (rc->rc_header.h_length < lock_size)
+		if (le16_to_cpu(rc->rc_header.h_length) < lock_size)
 			goto Eshort;
 		receive_rcom_lock(ls, rc);
 		break;
@@ -649,7 +653,7 @@ void dlm_receive_rcom(struct dlm_ls *ls, struct dlm_rcom *rc, int nodeid)
 		break;
 
 	case DLM_RCOM_LOCK_REPLY:
-		if (rc->rc_header.h_length < lock_size)
+		if (le16_to_cpu(rc->rc_header.h_length) < lock_size)
 			goto Eshort;
 		dlm_recover_process_copy(ls, rc);
 		break;
diff --git a/fs/dlm/requestqueue.c b/fs/dlm/requestqueue.c
index ccb5307c21e9..30355490c45c 100644
--- a/fs/dlm/requestqueue.c
+++ b/fs/dlm/requestqueue.c
@@ -32,7 +32,8 @@ struct rq_entry {
 void dlm_add_requestqueue(struct dlm_ls *ls, int nodeid, struct dlm_message *ms)
 {
 	struct rq_entry *e;
-	int length = ms->m_header.h_length - sizeof(struct dlm_message);
+	int length = le16_to_cpu(ms->m_header.h_length) -
+		sizeof(struct dlm_message);
 
 	e = kmalloc(sizeof(struct rq_entry) + length, GFP_NOFS);
 	if (!e) {
@@ -42,7 +43,7 @@ void dlm_add_requestqueue(struct dlm_ls *ls, int nodeid, struct dlm_message *ms)
 
 	e->recover_seq = ls->ls_recover_seq & 0xFFFFFFFF;
 	e->nodeid = nodeid;
-	memcpy(&e->request, ms, ms->m_header.h_length);
+	memcpy(&e->request, ms, le16_to_cpu(ms->m_header.h_length));
 
 	atomic_inc(&ls->ls_requestqueue_cnt);
 	mutex_lock(&ls->ls_requestqueue_mutex);
@@ -82,7 +83,7 @@ int dlm_process_requestqueue(struct dlm_ls *ls)
 
 		log_limit(ls, "dlm_process_requestqueue msg %d from %d "
 			  "lkid %x remid %x result %d seq %u",
-			  ms->m_type, ms->m_header.h_nodeid,
+			  ms->m_type, le32_to_cpu(ms->m_header.h_nodeid),
 			  ms->m_lkid, ms->m_remid, ms->m_result,
 			  e->recover_seq);
 
diff --git a/fs/dlm/util.c b/fs/dlm/util.c
index 58acbcc2081a..66b9a123768d 100644
--- a/fs/dlm/util.c
+++ b/fs/dlm/util.c
@@ -20,24 +20,6 @@
 #define DLM_ERRNO_ETIMEDOUT	       110
 #define DLM_ERRNO_EINPROGRESS	       115
 
-void header_out(struct dlm_header *hd)
-{
-	hd->h_version		= cpu_to_le32(hd->h_version);
-	/* does it for others u32 in union as well */
-	hd->u.h_lockspace	= cpu_to_le32(hd->u.h_lockspace);
-	hd->h_nodeid		= cpu_to_le32(hd->h_nodeid);
-	hd->h_length		= cpu_to_le16(hd->h_length);
-}
-
-void header_in(struct dlm_header *hd)
-{
-	hd->h_version		= le32_to_cpu(hd->h_version);
-	/* does it for others u32 in union as well */
-	hd->u.h_lockspace	= le32_to_cpu(hd->u.h_lockspace);
-	hd->h_nodeid		= le32_to_cpu(hd->h_nodeid);
-	hd->h_length		= le16_to_cpu(hd->h_length);
-}
-
 /* higher errno values are inconsistent across architectures, so select
    one set of values for on the wire */
 
@@ -85,8 +67,6 @@ static int from_dlm_errno(int err)
 
 void dlm_message_out(struct dlm_message *ms)
 {
-	header_out(&ms->m_header);
-
 	ms->m_type		= cpu_to_le32(ms->m_type);
 	ms->m_nodeid		= cpu_to_le32(ms->m_nodeid);
 	ms->m_pid		= cpu_to_le32(ms->m_pid);
@@ -109,8 +89,6 @@ void dlm_message_out(struct dlm_message *ms)
 
 void dlm_message_in(struct dlm_message *ms)
 {
-	header_in(&ms->m_header);
-
 	ms->m_type		= le32_to_cpu(ms->m_type);
 	ms->m_nodeid		= le32_to_cpu(ms->m_nodeid);
 	ms->m_pid		= le32_to_cpu(ms->m_pid);
@@ -133,8 +111,6 @@ void dlm_message_in(struct dlm_message *ms)
 
 void dlm_rcom_out(struct dlm_rcom *rc)
 {
-	header_out(&rc->rc_header);
-
 	rc->rc_type		= cpu_to_le32(rc->rc_type);
 	rc->rc_result		= cpu_to_le32(rc->rc_result);
 	rc->rc_id		= cpu_to_le64(rc->rc_id);
@@ -144,8 +120,6 @@ void dlm_rcom_out(struct dlm_rcom *rc)
 
 void dlm_rcom_in(struct dlm_rcom *rc)
 {
-	header_in(&rc->rc_header);
-
 	rc->rc_type		= le32_to_cpu(rc->rc_type);
 	rc->rc_result		= le32_to_cpu(rc->rc_result);
 	rc->rc_id		= le64_to_cpu(rc->rc_id);
diff --git a/fs/dlm/util.h b/fs/dlm/util.h
index d46f23c7a6a0..cc719ca9397e 100644
--- a/fs/dlm/util.h
+++ b/fs/dlm/util.h
@@ -15,8 +15,6 @@ void dlm_message_out(struct dlm_message *ms);
 void dlm_message_in(struct dlm_message *ms);
 void dlm_rcom_out(struct dlm_rcom *rc);
 void dlm_rcom_in(struct dlm_rcom *rc);
-void header_out(struct dlm_header *hd);
-void header_in(struct dlm_header *hd);
 
 #endif
 
-- 
2.31.1

