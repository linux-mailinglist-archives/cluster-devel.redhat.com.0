Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2673A4C19A2
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Feb 2022 18:13:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645636426;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y3cUSEu34GiywJHYq7GuHlbTWz8euJSsLbT1Lwn5HpU=;
	b=B1AIusU/dmBU8130nhFH9vGLT9TeKEXFUwrKxmtkoMSonPc0Z0FPLSgYUt23U3Vsa0dlFk
	oKVy5l0grOYbtjlEnfI7i2jT3DtEzEenoXyRheDN9es4XUCfG8gY6eLlYgyK1MLBhYm4wc
	AM/OLcVtiJC0MgrhYRU/8bGpoPDmo2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-y8aHmbhDOvWshh6MfM_amQ-1; Wed, 23 Feb 2022 12:13:42 -0500
X-MC-Unique: y8aHmbhDOvWshh6MfM_amQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73CA1800425;
	Wed, 23 Feb 2022 17:13:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A76286B8D;
	Wed, 23 Feb 2022 17:13:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 227EB4EE76;
	Wed, 23 Feb 2022 17:13:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21NH8qx6009263 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Feb 2022 12:08:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 72226838E9; Wed, 23 Feb 2022 17:08:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 13CDE838E6;
	Wed, 23 Feb 2022 17:08:52 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Feb 2022 12:08:24 -0500
Message-Id: <20220223170829.830864-5-aahringo@redhat.com>
In-Reply-To: <20220223170829.830864-1-aahringo@redhat.com>
References: <20220223170829.830864-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, viro@zeniv.linux.org.uk
Subject: [Cluster-devel] [PATCH/RFC dlm/next 4/9] fs: dlm: use __le types
	for rcom messages
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

This patch changes to use __le types directly in the dlm rcom
structure which is casted at the right dlm message buffer positions.

The main goal what is reached here is to remove sparse warnings
regarding to host to little byte order conversion or vice versa. Leaving
those sparse issues ignored and always do it in out/in functionality
tends to leave it unknown in which byte order the variable is being
handled.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h | 10 +++---
 fs/dlm/lock.c         |  3 +-
 fs/dlm/member.c       |  9 ++---
 fs/dlm/rcom.c         | 80 +++++++++++++++++++++----------------------
 fs/dlm/recover.c      | 10 +++---
 fs/dlm/util.c         | 18 ----------
 fs/dlm/util.h         |  2 --
 7 files changed, 52 insertions(+), 80 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 0412a5ad8f52..5db26550ae47 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -451,11 +451,11 @@ struct dlm_message {
 
 struct dlm_rcom {
 	struct dlm_header	rc_header;
-	uint32_t		rc_type;	/* DLM_RCOM_ */
-	int			rc_result;	/* multi-purpose */
-	uint64_t		rc_id;		/* match reply with request */
-	uint64_t		rc_seq;		/* sender's ls_recover_seq */
-	uint64_t		rc_seq_reply;	/* remote ls_recover_seq */
+	__le32			rc_type;	/* DLM_RCOM_ */
+	__le32			rc_result;	/* multi-purpose */
+	__le64			rc_id;		/* match reply with request */
+	__le64			rc_seq;		/* sender's ls_recover_seq */
+	__le64			rc_seq_reply;	/* remote ls_recover_seq */
 	char			rc_buf[];
 };
 
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index c9b164f23d40..d98bf2bede78 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -5061,8 +5061,7 @@ void dlm_receive_buffer(union dlm_packet *p, int nodeid)
 		type = p->message.m_type;
 		break;
 	case DLM_RCOM:
-		dlm_rcom_in(&p->rcom);
-		type = p->rcom.rc_type;
+		type = le32_to_cpu(p->rcom.rc_type);
 		break;
 	default:
 		log_print("invalid h_cmd %d from %u", hd->h_cmd, nodeid);
diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 4b05b0c1e76b..98084e0cfccf 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -120,18 +120,13 @@ int dlm_slots_copy_in(struct dlm_ls *ls)
 
 	ro0 = (struct rcom_slot *)(rc->rc_buf + sizeof(struct rcom_config));
 
-	for (i = 0, ro = ro0; i < num_slots; i++, ro++) {
-		ro->ro_nodeid = le32_to_cpu(ro->ro_nodeid);
-		ro->ro_slot = le16_to_cpu(ro->ro_slot);
-	}
-
 	log_slots(ls, gen, num_slots, ro0, NULL, 0);
 
 	list_for_each_entry(memb, &ls->ls_nodes, list) {
 		for (i = 0, ro = ro0; i < num_slots; i++, ro++) {
-			if (ro->ro_nodeid != memb->nodeid)
+			if (le32_to_cpu(ro->ro_nodeid) != memb->nodeid)
 				continue;
-			memb->slot = ro->ro_slot;
+			memb->slot = le16_to_cpu(ro->ro_slot);
 			memb->slot_prev = memb->slot;
 			break;
 		}
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 02b3fd2c0c19..a73464bccda7 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -40,10 +40,10 @@ static void _create_rcom(struct dlm_ls *ls, int to_nodeid, int type, int len,
 	rc->rc_header.h_length = cpu_to_le16(mb_len);
 	rc->rc_header.h_cmd = DLM_RCOM;
 
-	rc->rc_type = type;
+	rc->rc_type = cpu_to_le32(type);
 
 	spin_lock(&ls->ls_recover_lock);
-	rc->rc_seq = ls->ls_recover_seq;
+	rc->rc_seq = cpu_to_le64(ls->ls_recover_seq);
 	spin_unlock(&ls->ls_recover_lock);
 
 	*rc_ret = rc;
@@ -91,13 +91,11 @@ static int create_rcom_stateless(struct dlm_ls *ls, int to_nodeid, int type,
 
 static void send_rcom(struct dlm_mhandle *mh, struct dlm_rcom *rc)
 {
-	dlm_rcom_out(rc);
 	dlm_midcomms_commit_mhandle(mh);
 }
 
 static void send_rcom_stateless(struct dlm_msg *msg, struct dlm_rcom *rc)
 {
-	dlm_rcom_out(rc);
 	dlm_lowcomms_commit_msg(msg);
 	dlm_lowcomms_put_msg(msg);
 }
@@ -145,10 +143,10 @@ static int check_rcom_config(struct dlm_ls *ls, struct dlm_rcom *rc, int nodeid)
 	return 0;
 }
 
-static void allow_sync_reply(struct dlm_ls *ls, uint64_t *new_seq)
+static void allow_sync_reply(struct dlm_ls *ls, __le64 *new_seq)
 {
 	spin_lock(&ls->ls_rcom_spin);
-	*new_seq = ++ls->ls_rcom_seq;
+	*new_seq = cpu_to_le64(++ls->ls_rcom_seq);
 	set_bit(LSFL_RCOM_WAIT, &ls->ls_flags);
 	spin_unlock(&ls->ls_rcom_spin);
 }
@@ -182,7 +180,7 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 
 	if (nodeid == dlm_our_nodeid()) {
 		rc = ls->ls_recover_buf;
-		rc->rc_result = dlm_recover_status(ls);
+		rc->rc_result = cpu_to_le32(dlm_recover_status(ls));
 		goto out;
 	}
 
@@ -208,7 +206,7 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 
 	rc = ls->ls_recover_buf;
 
-	if (rc->rc_result == -ESRCH) {
+	if (rc->rc_result == cpu_to_le32(-ESRCH)) {
 		/* we pretend the remote lockspace exists with 0 status */
 		log_debug(ls, "remote node %d not ready", nodeid);
 		rc->rc_result = 0;
@@ -259,7 +257,7 @@ static void receive_rcom_status(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 
 	rc->rc_id = rc_in->rc_id;
 	rc->rc_seq_reply = rc_in->rc_seq;
-	rc->rc_result = status;
+	rc->rc_result = cpu_to_le32(status);
 
 	set_rcom_config(ls, (struct rcom_config *)rc->rc_buf, num_slots);
 
@@ -287,11 +285,11 @@ static void receive_sync_reply(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 {
 	spin_lock(&ls->ls_rcom_spin);
 	if (!test_bit(LSFL_RCOM_WAIT, &ls->ls_flags) ||
-	    rc_in->rc_id != ls->ls_rcom_seq) {
+	    le64_to_cpu(rc_in->rc_id) != ls->ls_rcom_seq) {
 		log_debug(ls, "reject reply %d from %d seq %llx expect %llx",
-			  rc_in->rc_type,
+			  le32_to_cpu(rc_in->rc_type),
 			  le32_to_cpu(rc_in->rc_header.h_nodeid),
-			  (unsigned long long)rc_in->rc_id,
+			  (unsigned long long)le64_to_cpu(rc_in->rc_id),
 			  (unsigned long long)ls->ls_rcom_seq);
 		goto out;
 	}
@@ -367,7 +365,7 @@ int dlm_send_rcom_lookup(struct dlm_rsb *r, int dir_nodeid)
 	if (error)
 		goto out;
 	memcpy(rc->rc_buf, r->res_name, r->res_length);
-	rc->rc_id = (unsigned long) r->res_id;
+	rc->rc_id = cpu_to_le64(r->res_id);
 
 	send_rcom(mh, rc);
  out:
@@ -383,7 +381,7 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 		sizeof(struct dlm_rcom);
 
 	/* Old code would send this special id to trigger a debug dump. */
-	if (rc_in->rc_id == 0xFFFFFFFF) {
+	if (rc_in->rc_id == cpu_to_le64(0xFFFFFFFF)) {
 		log_error(ls, "receive_rcom_lookup dump from %d", nodeid);
 		dlm_dump_rsb_name(ls, rc_in->rc_buf, len);
 		return;
@@ -397,7 +395,7 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 				  DLM_LU_RECOVER_MASTER, &ret_nodeid, NULL);
 	if (error)
 		ret_nodeid = error;
-	rc->rc_result = ret_nodeid;
+	rc->rc_result = cpu_to_le32(ret_nodeid);
 	rc->rc_id = rc_in->rc_id;
 	rc->rc_seq_reply = rc_in->rc_seq;
 
@@ -456,7 +454,7 @@ int dlm_send_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb)
 
 	rl = (struct rcom_lock *) rc->rc_buf;
 	pack_rcom_lock(r, lkb, rl);
-	rc->rc_id = (unsigned long) r;
+	rc->rc_id = cpu_to_le64(r);
 
 	send_rcom(mh, rc);
  out:
@@ -510,15 +508,14 @@ int dlm_send_ls_not_ready(int nodeid, struct dlm_rcom *rc_in)
 	rc->rc_header.h_length = cpu_to_le16(mb_len);
 	rc->rc_header.h_cmd = DLM_RCOM;
 
-	rc->rc_type = DLM_RCOM_STATUS_REPLY;
+	rc->rc_type = cpu_to_le32(DLM_RCOM_STATUS_REPLY);
 	rc->rc_id = rc_in->rc_id;
 	rc->rc_seq_reply = rc_in->rc_seq;
-	rc->rc_result = -ESRCH;
+	rc->rc_result = cpu_to_le32(-ESRCH);
 
 	rf = (struct rcom_config *) rc->rc_buf;
 	rf->rf_lvblen = cpu_to_le32(~0U);
 
-	dlm_rcom_out(rc);
 	dlm_midcomms_commit_mhandle(mh);
 
 	return 0;
@@ -577,27 +574,27 @@ void dlm_receive_rcom(struct dlm_ls *ls, struct dlm_rcom *rc, int nodeid)
 	uint64_t seq;
 
 	switch (rc->rc_type) {
-	case DLM_RCOM_STATUS_REPLY:
+	case cpu_to_le32(DLM_RCOM_STATUS_REPLY):
 		reply = 1;
 		break;
-	case DLM_RCOM_NAMES:
+	case cpu_to_le32(DLM_RCOM_NAMES):
 		names = 1;
 		break;
-	case DLM_RCOM_NAMES_REPLY:
+	case cpu_to_le32(DLM_RCOM_NAMES_REPLY):
 		names = 1;
 		reply = 1;
 		break;
-	case DLM_RCOM_LOOKUP:
+	case cpu_to_le32(DLM_RCOM_LOOKUP):
 		lookup = 1;
 		break;
-	case DLM_RCOM_LOOKUP_REPLY:
+	case cpu_to_le32(DLM_RCOM_LOOKUP_REPLY):
 		lookup = 1;
 		reply = 1;
 		break;
-	case DLM_RCOM_LOCK:
+	case cpu_to_le32(DLM_RCOM_LOCK):
 		lock = 1;
 		break;
-	case DLM_RCOM_LOCK_REPLY:
+	case cpu_to_le32(DLM_RCOM_LOCK_REPLY):
 		lock = 1;
 		reply = 1;
 		break;
@@ -609,10 +606,10 @@ void dlm_receive_rcom(struct dlm_ls *ls, struct dlm_rcom *rc, int nodeid)
 	seq = ls->ls_recover_seq;
 	spin_unlock(&ls->ls_recover_lock);
 
-	if (stop && (rc->rc_type != DLM_RCOM_STATUS))
+	if (stop && (rc->rc_type != cpu_to_le32(DLM_RCOM_STATUS)))
 		goto ignore;
 
-	if (reply && (rc->rc_seq_reply != seq))
+	if (reply && (le64_to_cpu(rc->rc_seq_reply) != seq))
 		goto ignore;
 
 	if (!(status & DLM_RS_NODES) && (names || lookup || lock))
@@ -622,59 +619,60 @@ void dlm_receive_rcom(struct dlm_ls *ls, struct dlm_rcom *rc, int nodeid)
 		goto ignore;
 
 	switch (rc->rc_type) {
-	case DLM_RCOM_STATUS:
+	case cpu_to_le32(DLM_RCOM_STATUS):
 		receive_rcom_status(ls, rc);
 		break;
 
-	case DLM_RCOM_NAMES:
+	case cpu_to_le32(DLM_RCOM_NAMES):
 		receive_rcom_names(ls, rc);
 		break;
 
-	case DLM_RCOM_LOOKUP:
+	case cpu_to_le32(DLM_RCOM_LOOKUP):
 		receive_rcom_lookup(ls, rc);
 		break;
 
-	case DLM_RCOM_LOCK:
+	case cpu_to_le32(DLM_RCOM_LOCK):
 		if (le16_to_cpu(rc->rc_header.h_length) < lock_size)
 			goto Eshort;
 		receive_rcom_lock(ls, rc);
 		break;
 
-	case DLM_RCOM_STATUS_REPLY:
+	case cpu_to_le32(DLM_RCOM_STATUS_REPLY):
 		receive_sync_reply(ls, rc);
 		break;
 
-	case DLM_RCOM_NAMES_REPLY:
+	case cpu_to_le32(DLM_RCOM_NAMES_REPLY):
 		receive_sync_reply(ls, rc);
 		break;
 
-	case DLM_RCOM_LOOKUP_REPLY:
+	case cpu_to_le32(DLM_RCOM_LOOKUP_REPLY):
 		receive_rcom_lookup_reply(ls, rc);
 		break;
 
-	case DLM_RCOM_LOCK_REPLY:
+	case cpu_to_le32(DLM_RCOM_LOCK_REPLY):
 		if (le16_to_cpu(rc->rc_header.h_length) < lock_size)
 			goto Eshort;
 		dlm_recover_process_copy(ls, rc);
 		break;
 
 	default:
-		log_error(ls, "receive_rcom bad type %d", rc->rc_type);
+		log_error(ls, "receive_rcom bad type %d",
+			  le32_to_cpu(rc->rc_type));
 	}
 	return;
 
 ignore:
 	log_limit(ls, "dlm_receive_rcom ignore msg %d "
 		  "from %d %llu %llu recover seq %llu sts %x gen %u",
-		   rc->rc_type,
+		   le32_to_cpu(rc->rc_type),
 		   nodeid,
-		   (unsigned long long)rc->rc_seq,
-		   (unsigned long long)rc->rc_seq_reply,
+		   (unsigned long long)le64_to_cpu(rc->rc_seq),
+		   (unsigned long long)le64_to_cpu(rc->rc_seq_reply),
 		   (unsigned long long)seq,
 		   status, ls->ls_generation);
 	return;
 Eshort:
 	log_error(ls, "recovery message %d from %d is too short",
-		  rc->rc_type, nodeid);
+		  le32_to_cpu(rc->rc_type), nodeid);
 }
 
diff --git a/fs/dlm/recover.c b/fs/dlm/recover.c
index 8928e99dfd47..dfd504bf1ecf 100644
--- a/fs/dlm/recover.c
+++ b/fs/dlm/recover.c
@@ -114,7 +114,7 @@ static int wait_status_all(struct dlm_ls *ls, uint32_t wait_status,
 			if (save_slots)
 				dlm_slot_save(ls, rc, memb);
 
-			if (rc->rc_result & wait_status)
+			if (le32_to_cpu(rc->rc_result) & wait_status)
 				break;
 			if (delay < 1000)
 				delay += 20;
@@ -141,7 +141,7 @@ static int wait_status_low(struct dlm_ls *ls, uint32_t wait_status,
 		if (error)
 			break;
 
-		if (rc->rc_result & wait_status)
+		if (le32_to_cpu(rc->rc_result) & wait_status)
 			break;
 		if (delay < 1000)
 			delay += 20;
@@ -568,14 +568,14 @@ int dlm_recover_master_reply(struct dlm_ls *ls, struct dlm_rcom *rc)
 	struct dlm_rsb *r;
 	int ret_nodeid, new_master;
 
-	r = recover_idr_find(ls, rc->rc_id);
+	r = recover_idr_find(ls, le64_to_cpu(rc->rc_id));
 	if (!r) {
 		log_error(ls, "dlm_recover_master_reply no id %llx",
-			  (unsigned long long)rc->rc_id);
+			  (unsigned long long)le64_to_cpu(rc->rc_id));
 		goto out;
 	}
 
-	ret_nodeid = rc->rc_result;
+	ret_nodeid = le32_to_cpu(rc->rc_result);
 
 	if (ret_nodeid == dlm_our_nodeid())
 		new_master = 0;
diff --git a/fs/dlm/util.c b/fs/dlm/util.c
index 66b9a123768d..657dbed1bd60 100644
--- a/fs/dlm/util.c
+++ b/fs/dlm/util.c
@@ -108,21 +108,3 @@ void dlm_message_in(struct dlm_message *ms)
 	ms->m_asts		= le32_to_cpu(ms->m_asts);
 	ms->m_result		= from_dlm_errno(le32_to_cpu(ms->m_result));
 }
-
-void dlm_rcom_out(struct dlm_rcom *rc)
-{
-	rc->rc_type		= cpu_to_le32(rc->rc_type);
-	rc->rc_result		= cpu_to_le32(rc->rc_result);
-	rc->rc_id		= cpu_to_le64(rc->rc_id);
-	rc->rc_seq		= cpu_to_le64(rc->rc_seq);
-	rc->rc_seq_reply	= cpu_to_le64(rc->rc_seq_reply);
-}
-
-void dlm_rcom_in(struct dlm_rcom *rc)
-{
-	rc->rc_type		= le32_to_cpu(rc->rc_type);
-	rc->rc_result		= le32_to_cpu(rc->rc_result);
-	rc->rc_id		= le64_to_cpu(rc->rc_id);
-	rc->rc_seq		= le64_to_cpu(rc->rc_seq);
-	rc->rc_seq_reply	= le64_to_cpu(rc->rc_seq_reply);
-}
diff --git a/fs/dlm/util.h b/fs/dlm/util.h
index cc719ca9397e..cd099c4f5d6a 100644
--- a/fs/dlm/util.h
+++ b/fs/dlm/util.h
@@ -13,8 +13,6 @@
 
 void dlm_message_out(struct dlm_message *ms);
 void dlm_message_in(struct dlm_message *ms);
-void dlm_rcom_out(struct dlm_rcom *rc);
-void dlm_rcom_in(struct dlm_rcom *rc);
 
 #endif
 
-- 
2.31.1

