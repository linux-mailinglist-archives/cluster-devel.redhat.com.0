Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA767654DD
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 15:23:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690464199;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OHYidJggFCCKx3Ornz5VitZhs5TmiHVHL2wWxpClGJU=;
	b=AQaEFWG/iM1SszHZpCoJQOUIl0xsfO5Sm1v6nJ/TXnE2YC63TSI51ccJcvyQqOSUOti1NB
	xf7CGp1AiYQJaPeeftSxeoxwQG9A4ajVuznxF+N35S6h7QMOvqMl0894jM7A75S9u+Vnb1
	hxEQxGopG/GBpxtyXp9DyTpMliHk7kQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-VkfUFG1IM7iELrrUpzTMEQ-1; Thu, 27 Jul 2023 09:23:14 -0400
X-MC-Unique: VkfUFG1IM7iELrrUpzTMEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65D62104D517;
	Thu, 27 Jul 2023 13:23:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA4EF2166B27;
	Thu, 27 Jul 2023 13:23:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6A09C1946A74;
	Thu, 27 Jul 2023 13:23:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 19BB11946A74 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 13:23:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F08644094DC5; Thu, 27 Jul 2023 13:23:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC6754094DC0;
 Thu, 27 Jul 2023 13:23:09 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Jul 2023 09:22:58 -0400
Message-Id: <20230727132303.3352514-8-aahringo@redhat.com>
In-Reply-To: <20230727132303.3352514-1-aahringo@redhat.com>
References: <20230727132303.3352514-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm-next 08/13] fs: dlm: get recovery
 sequence number as parameter
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch removes a read of the ls->ls_recover_seq uint64_t number in
_create_rcom(). If the ls->ls_recover_seq is readed the ls_recover_lock
need to held. However this number was always readed before when any rcom
message is received and it's not necessary to read it again from a per
lockspace variable to use it for the replying message. This patch will
pass the sequence number as parameter so another read of ls->ls_recover_seq
and holding the ls->ls_recover_lock is not required.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dir.c      |  4 +--
 fs/dlm/dir.h      |  2 +-
 fs/dlm/lock.c     |  5 ++--
 fs/dlm/lock.h     |  3 ++-
 fs/dlm/member.c   |  6 ++---
 fs/dlm/rcom.c     | 68 ++++++++++++++++++++++++++---------------------
 fs/dlm/rcom.h     | 10 ++++---
 fs/dlm/recover.c  | 58 +++++++++++++++++++++-------------------
 fs/dlm/recover.h  | 12 ++++-----
 fs/dlm/recoverd.c | 16 +++++------
 10 files changed, 99 insertions(+), 85 deletions(-)

diff --git a/fs/dlm/dir.c b/fs/dlm/dir.c
index fb1981654bb2..3bf5bf7a37b4 100644
--- a/fs/dlm/dir.c
+++ b/fs/dlm/dir.c
@@ -58,7 +58,7 @@ void dlm_recover_dir_nodeid(struct dlm_ls *ls)
 	up_read(&ls->ls_root_sem);
 }
 
-int dlm_recover_directory(struct dlm_ls *ls)
+int dlm_recover_directory(struct dlm_ls *ls, uint64_t seq)
 {
 	struct dlm_member *memb;
 	char *b, *last_name = NULL;
@@ -90,7 +90,7 @@ int dlm_recover_directory(struct dlm_ls *ls)
 			}
 
 			error = dlm_rcom_names(ls, memb->nodeid,
-					       last_name, last_len);
+					       last_name, last_len, seq);
 			if (error)
 				goto out_free;
 
diff --git a/fs/dlm/dir.h b/fs/dlm/dir.h
index 03844d086be2..0635582da003 100644
--- a/fs/dlm/dir.h
+++ b/fs/dlm/dir.h
@@ -15,7 +15,7 @@
 int dlm_dir_nodeid(struct dlm_rsb *rsb);
 int dlm_hash2nodeid(struct dlm_ls *ls, uint32_t hash);
 void dlm_recover_dir_nodeid(struct dlm_ls *ls);
-int dlm_recover_directory(struct dlm_ls *ls);
+int dlm_recover_directory(struct dlm_ls *ls, uint64_t seq);
 void dlm_copy_master_names(struct dlm_ls *ls, char *inbuf, int inlen,
 	char *outbuf, int outlen, int nodeid);
 
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index f511a9d7d416..b489da38e685 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -5464,7 +5464,8 @@ int dlm_recover_master_copy(struct dlm_ls *ls, struct dlm_rcom *rc)
 }
 
 /* needs at least dlm_rcom + rcom_lock */
-int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc)
+int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc,
+			     uint64_t seq)
 {
 	struct rcom_lock *rl = (struct rcom_lock *) rc->rc_buf;
 	struct dlm_rsb *r;
@@ -5509,7 +5510,7 @@ int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc)
 			  lkid, le32_to_cpu(rc->rc_header.h_nodeid), remid,
 			  result);
 	
-		dlm_send_rcom_lock(r, lkb);
+		dlm_send_rcom_lock(r, lkb, seq);
 		goto out;
 	case -EEXIST:
 	case 0:
diff --git a/fs/dlm/lock.h b/fs/dlm/lock.h
index aa5ad44d902b..222e682523b9 100644
--- a/fs/dlm/lock.h
+++ b/fs/dlm/lock.h
@@ -37,7 +37,8 @@ void dlm_recover_grant(struct dlm_ls *ls);
 int dlm_recover_waiters_post(struct dlm_ls *ls);
 void dlm_recover_waiters_pre(struct dlm_ls *ls);
 int dlm_recover_master_copy(struct dlm_ls *ls, struct dlm_rcom *rc);
-int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc);
+int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc,
+			     uint64_t seq);
 
 int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua, int mode,
 	uint32_t flags, void *name, unsigned int namelen);
diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index f303ea8bd256..19f3cd96f3c0 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -449,7 +449,7 @@ static void make_member_array(struct dlm_ls *ls)
 
 /* send a status request to all members just to establish comms connections */
 
-static int ping_members(struct dlm_ls *ls)
+static int ping_members(struct dlm_ls *ls, uint64_t seq)
 {
 	struct dlm_member *memb;
 	int error = 0;
@@ -459,7 +459,7 @@ static int ping_members(struct dlm_ls *ls)
 			error = -EINTR;
 			break;
 		}
-		error = dlm_rcom_status(ls, memb->nodeid, 0);
+		error = dlm_rcom_status(ls, memb->nodeid, 0, seq);
 		if (error)
 			break;
 	}
@@ -607,7 +607,7 @@ int dlm_recover_members(struct dlm_ls *ls, struct dlm_recover *rv, int *neg_out)
 	make_member_array(ls);
 	*neg_out = neg;
 
-	error = ping_members(ls);
+	error = ping_members(ls, rv->seq);
 	log_rinfo(ls, "dlm_recover_members %d nodes", ls->ls_num_nodes);
 	return error;
 }
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index f4afdf892f78..efe45e68287f 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -28,7 +28,8 @@ static int rcom_response(struct dlm_ls *ls)
 }
 
 static void _create_rcom(struct dlm_ls *ls, int to_nodeid, int type, int len,
-			 struct dlm_rcom **rc_ret, char *mb, int mb_len)
+			 struct dlm_rcom **rc_ret, char *mb, int mb_len,
+			 uint64_t seq)
 {
 	struct dlm_rcom *rc;
 
@@ -41,16 +42,14 @@ static void _create_rcom(struct dlm_ls *ls, int to_nodeid, int type, int len,
 	rc->rc_header.h_cmd = DLM_RCOM;
 
 	rc->rc_type = cpu_to_le32(type);
-
-	spin_lock(&ls->ls_recover_lock);
-	rc->rc_seq = cpu_to_le64(ls->ls_recover_seq);
-	spin_unlock(&ls->ls_recover_lock);
+	rc->rc_seq = cpu_to_le64(seq);
 
 	*rc_ret = rc;
 }
 
 static int create_rcom(struct dlm_ls *ls, int to_nodeid, int type, int len,
-		       struct dlm_rcom **rc_ret, struct dlm_mhandle **mh_ret)
+		       struct dlm_rcom **rc_ret, struct dlm_mhandle **mh_ret,
+		       uint64_t seq)
 {
 	int mb_len = sizeof(struct dlm_rcom) + len;
 	struct dlm_mhandle *mh;
@@ -63,14 +62,14 @@ static int create_rcom(struct dlm_ls *ls, int to_nodeid, int type, int len,
 		return -ENOBUFS;
 	}
 
-	_create_rcom(ls, to_nodeid, type, len, rc_ret, mb, mb_len);
+	_create_rcom(ls, to_nodeid, type, len, rc_ret, mb, mb_len, seq);
 	*mh_ret = mh;
 	return 0;
 }
 
 static int create_rcom_stateless(struct dlm_ls *ls, int to_nodeid, int type,
 				 int len, struct dlm_rcom **rc_ret,
-				 struct dlm_msg **msg_ret)
+				 struct dlm_msg **msg_ret, uint64_t seq)
 {
 	int mb_len = sizeof(struct dlm_rcom) + len;
 	struct dlm_msg *msg;
@@ -84,7 +83,7 @@ static int create_rcom_stateless(struct dlm_ls *ls, int to_nodeid, int type,
 		return -ENOBUFS;
 	}
 
-	_create_rcom(ls, to_nodeid, type, len, rc_ret, mb, mb_len);
+	_create_rcom(ls, to_nodeid, type, len, rc_ret, mb, mb_len, seq);
 	*msg_ret = msg;
 	return 0;
 }
@@ -170,7 +169,8 @@ static void disallow_sync_reply(struct dlm_ls *ls)
  * node's rcom_config.
  */
 
-int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
+int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags,
+		    uint64_t seq)
 {
 	struct dlm_rcom *rc;
 	struct dlm_msg *msg;
@@ -186,7 +186,8 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 
 retry:
 	error = create_rcom_stateless(ls, nodeid, DLM_RCOM_STATUS,
-				      sizeof(struct rcom_status), &rc, &msg);
+				      sizeof(struct rcom_status), &rc, &msg,
+				      seq);
 	if (error)
 		goto out;
 
@@ -220,7 +221,8 @@ int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags)
 	return error;
 }
 
-static void receive_rcom_status(struct dlm_ls *ls, struct dlm_rcom *rc_in)
+static void receive_rcom_status(struct dlm_ls *ls, struct dlm_rcom *rc_in,
+				uint64_t seq)
 {
 	struct dlm_rcom *rc;
 	struct rcom_status *rs;
@@ -251,7 +253,7 @@ static void receive_rcom_status(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 
  do_create:
 	error = create_rcom_stateless(ls, nodeid, DLM_RCOM_STATUS_REPLY,
-				      len, &rc, &msg);
+				      len, &rc, &msg, seq);
 	if (error)
 		return;
 
@@ -302,7 +304,8 @@ static void receive_sync_reply(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	spin_unlock(&ls->ls_rcom_spin);
 }
 
-int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name, int last_len)
+int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name,
+		   int last_len, uint64_t seq)
 {
 	struct dlm_rcom *rc;
 	struct dlm_msg *msg;
@@ -312,7 +315,7 @@ int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name, int last_len)
 
 retry:
 	error = create_rcom_stateless(ls, nodeid, DLM_RCOM_NAMES, last_len,
-				      &rc, &msg);
+				      &rc, &msg, seq);
 	if (error)
 		goto out;
 	memcpy(rc->rc_buf, last_name, last_len);
@@ -330,7 +333,8 @@ int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name, int last_len)
 	return error;
 }
 
-static void receive_rcom_names(struct dlm_ls *ls, struct dlm_rcom *rc_in)
+static void receive_rcom_names(struct dlm_ls *ls, struct dlm_rcom *rc_in,
+			       uint64_t seq)
 {
 	struct dlm_rcom *rc;
 	int error, inlen, outlen, nodeid;
@@ -342,7 +346,7 @@ static void receive_rcom_names(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	outlen = DLM_MAX_APP_BUFSIZE - sizeof(struct dlm_rcom);
 
 	error = create_rcom_stateless(ls, nodeid, DLM_RCOM_NAMES_REPLY, outlen,
-				      &rc, &msg);
+				      &rc, &msg, seq);
 	if (error)
 		return;
 	rc->rc_id = rc_in->rc_id;
@@ -353,7 +357,7 @@ static void receive_rcom_names(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	send_rcom_stateless(msg, rc);
 }
 
-int dlm_send_rcom_lookup(struct dlm_rsb *r, int dir_nodeid)
+int dlm_send_rcom_lookup(struct dlm_rsb *r, int dir_nodeid, uint64_t seq)
 {
 	struct dlm_rcom *rc;
 	struct dlm_mhandle *mh;
@@ -361,7 +365,7 @@ int dlm_send_rcom_lookup(struct dlm_rsb *r, int dir_nodeid)
 	int error;
 
 	error = create_rcom(ls, dir_nodeid, DLM_RCOM_LOOKUP, r->res_length,
-			    &rc, &mh);
+			    &rc, &mh, seq);
 	if (error)
 		goto out;
 	memcpy(rc->rc_buf, r->res_name, r->res_length);
@@ -372,7 +376,8 @@ int dlm_send_rcom_lookup(struct dlm_rsb *r, int dir_nodeid)
 	return error;
 }
 
-static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
+static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in,
+				uint64_t seq)
 {
 	struct dlm_rcom *rc;
 	struct dlm_mhandle *mh;
@@ -387,7 +392,8 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 		return;
 	}
 
-	error = create_rcom(ls, nodeid, DLM_RCOM_LOOKUP_REPLY, 0, &rc, &mh);
+	error = create_rcom(ls, nodeid, DLM_RCOM_LOOKUP_REPLY, 0, &rc, &mh,
+			    seq);
 	if (error)
 		return;
 
@@ -437,7 +443,7 @@ static void pack_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb,
 		memcpy(rl->rl_lvb, lkb->lkb_lvbptr, r->res_ls->ls_lvblen);
 }
 
-int dlm_send_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb)
+int dlm_send_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb, uint64_t seq)
 {
 	struct dlm_ls *ls = r->res_ls;
 	struct dlm_rcom *rc;
@@ -448,7 +454,8 @@ int dlm_send_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb)
 	if (lkb->lkb_lvbptr)
 		len += ls->ls_lvblen;
 
-	error = create_rcom(ls, r->res_nodeid, DLM_RCOM_LOCK, len, &rc, &mh);
+	error = create_rcom(ls, r->res_nodeid, DLM_RCOM_LOCK, len, &rc, &mh,
+			    seq);
 	if (error)
 		goto out;
 
@@ -462,7 +469,8 @@ int dlm_send_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb)
 }
 
 /* needs at least dlm_rcom + rcom_lock */
-static void receive_rcom_lock(struct dlm_ls *ls, struct dlm_rcom *rc_in)
+static void receive_rcom_lock(struct dlm_ls *ls, struct dlm_rcom *rc_in,
+			      uint64_t seq)
 {
 	struct dlm_rcom *rc;
 	struct dlm_mhandle *mh;
@@ -471,7 +479,7 @@ static void receive_rcom_lock(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	dlm_recover_master_copy(ls, rc_in);
 
 	error = create_rcom(ls, nodeid, DLM_RCOM_LOCK_REPLY,
-			    sizeof(struct rcom_lock), &rc, &mh);
+			    sizeof(struct rcom_lock), &rc, &mh, seq);
 	if (error)
 		return;
 
@@ -620,21 +628,21 @@ void dlm_receive_rcom(struct dlm_ls *ls, struct dlm_rcom *rc, int nodeid)
 
 	switch (rc->rc_type) {
 	case cpu_to_le32(DLM_RCOM_STATUS):
-		receive_rcom_status(ls, rc);
+		receive_rcom_status(ls, rc, seq);
 		break;
 
 	case cpu_to_le32(DLM_RCOM_NAMES):
-		receive_rcom_names(ls, rc);
+		receive_rcom_names(ls, rc, seq);
 		break;
 
 	case cpu_to_le32(DLM_RCOM_LOOKUP):
-		receive_rcom_lookup(ls, rc);
+		receive_rcom_lookup(ls, rc, seq);
 		break;
 
 	case cpu_to_le32(DLM_RCOM_LOCK):
 		if (le16_to_cpu(rc->rc_header.h_length) < lock_size)
 			goto Eshort;
-		receive_rcom_lock(ls, rc);
+		receive_rcom_lock(ls, rc, seq);
 		break;
 
 	case cpu_to_le32(DLM_RCOM_STATUS_REPLY):
@@ -652,7 +660,7 @@ void dlm_receive_rcom(struct dlm_ls *ls, struct dlm_rcom *rc, int nodeid)
 	case cpu_to_le32(DLM_RCOM_LOCK_REPLY):
 		if (le16_to_cpu(rc->rc_header.h_length) < lock_size)
 			goto Eshort;
-		dlm_recover_process_copy(ls, rc);
+		dlm_recover_process_copy(ls, rc, seq);
 		break;
 
 	default:
diff --git a/fs/dlm/rcom.h b/fs/dlm/rcom.h
index 454d3c4814ab..9dd06d43ddb4 100644
--- a/fs/dlm/rcom.h
+++ b/fs/dlm/rcom.h
@@ -12,10 +12,12 @@
 #ifndef __RCOM_DOT_H__
 #define __RCOM_DOT_H__
 
-int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags);
-int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name,int last_len);
-int dlm_send_rcom_lookup(struct dlm_rsb *r, int dir_nodeid);
-int dlm_send_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb);
+int dlm_rcom_status(struct dlm_ls *ls, int nodeid, uint32_t status_flags,
+		    uint64_t seq);
+int dlm_rcom_names(struct dlm_ls *ls, int nodeid, char *last_name,
+		   int last_len, uint64_t seq);
+int dlm_send_rcom_lookup(struct dlm_rsb *r, int dir_nodeid, uint64_t seq);
+int dlm_send_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb, uint64_t seq);
 void dlm_receive_rcom(struct dlm_ls *ls, struct dlm_rcom *rc, int nodeid);
 int dlm_send_ls_not_ready(int nodeid, struct dlm_rcom *rc_in);
 
diff --git a/fs/dlm/recover.c b/fs/dlm/recover.c
index 29d71a5018d4..ddb6b3312cc1 100644
--- a/fs/dlm/recover.c
+++ b/fs/dlm/recover.c
@@ -93,7 +93,7 @@ void dlm_set_recover_status(struct dlm_ls *ls, uint32_t status)
 }
 
 static int wait_status_all(struct dlm_ls *ls, uint32_t wait_status,
-			   int save_slots)
+			   int save_slots, uint64_t seq)
 {
 	struct dlm_rcom *rc = ls->ls_recover_buf;
 	struct dlm_member *memb;
@@ -107,7 +107,7 @@ static int wait_status_all(struct dlm_ls *ls, uint32_t wait_status,
 				goto out;
 			}
 
-			error = dlm_rcom_status(ls, memb->nodeid, 0);
+			error = dlm_rcom_status(ls, memb->nodeid, 0, seq);
 			if (error)
 				goto out;
 
@@ -126,7 +126,7 @@ static int wait_status_all(struct dlm_ls *ls, uint32_t wait_status,
 }
 
 static int wait_status_low(struct dlm_ls *ls, uint32_t wait_status,
-			   uint32_t status_flags)
+			   uint32_t status_flags, uint64_t seq)
 {
 	struct dlm_rcom *rc = ls->ls_recover_buf;
 	int error = 0, delay = 0, nodeid = ls->ls_low_nodeid;
@@ -137,7 +137,7 @@ static int wait_status_low(struct dlm_ls *ls, uint32_t wait_status,
 			goto out;
 		}
 
-		error = dlm_rcom_status(ls, nodeid, status_flags);
+		error = dlm_rcom_status(ls, nodeid, status_flags, seq);
 		if (error)
 			break;
 
@@ -151,22 +151,22 @@ static int wait_status_low(struct dlm_ls *ls, uint32_t wait_status,
 	return error;
 }
 
-static int wait_status(struct dlm_ls *ls, uint32_t status)
+static int wait_status(struct dlm_ls *ls, uint32_t status, uint64_t seq)
 {
 	uint32_t status_all = status << 1;
 	int error;
 
 	if (ls->ls_low_nodeid == dlm_our_nodeid()) {
-		error = wait_status_all(ls, status, 0);
+		error = wait_status_all(ls, status, 0, seq);
 		if (!error)
 			dlm_set_recover_status(ls, status_all);
 	} else
-		error = wait_status_low(ls, status_all, 0);
+		error = wait_status_low(ls, status_all, 0, seq);
 
 	return error;
 }
 
-int dlm_recover_members_wait(struct dlm_ls *ls)
+int dlm_recover_members_wait(struct dlm_ls *ls, uint64_t seq)
 {
 	struct dlm_member *memb;
 	struct dlm_slot *slots;
@@ -180,7 +180,7 @@ int dlm_recover_members_wait(struct dlm_ls *ls)
 	}
 
 	if (ls->ls_low_nodeid == dlm_our_nodeid()) {
-		error = wait_status_all(ls, DLM_RS_NODES, 1);
+		error = wait_status_all(ls, DLM_RS_NODES, 1, seq);
 		if (error)
 			goto out;
 
@@ -199,7 +199,8 @@ int dlm_recover_members_wait(struct dlm_ls *ls)
 			dlm_set_recover_status(ls, DLM_RS_NODES_ALL);
 		}
 	} else {
-		error = wait_status_low(ls, DLM_RS_NODES_ALL, DLM_RSF_NEED_SLOTS);
+		error = wait_status_low(ls, DLM_RS_NODES_ALL,
+					DLM_RSF_NEED_SLOTS, seq);
 		if (error)
 			goto out;
 
@@ -209,19 +210,19 @@ int dlm_recover_members_wait(struct dlm_ls *ls)
 	return error;
 }
 
-int dlm_recover_directory_wait(struct dlm_ls *ls)
+int dlm_recover_directory_wait(struct dlm_ls *ls, uint64_t seq)
 {
-	return wait_status(ls, DLM_RS_DIR);
+	return wait_status(ls, DLM_RS_DIR, seq);
 }
 
-int dlm_recover_locks_wait(struct dlm_ls *ls)
+int dlm_recover_locks_wait(struct dlm_ls *ls, uint64_t seq)
 {
-	return wait_status(ls, DLM_RS_LOCKS);
+	return wait_status(ls, DLM_RS_LOCKS, seq);
 }
 
-int dlm_recover_done_wait(struct dlm_ls *ls)
+int dlm_recover_done_wait(struct dlm_ls *ls, uint64_t seq)
 {
-	return wait_status(ls, DLM_RS_DONE);
+	return wait_status(ls, DLM_RS_DONE, seq);
 }
 
 /*
@@ -441,7 +442,7 @@ static void set_new_master(struct dlm_rsb *r)
  * equals our_nodeid below).
  */
 
-static int recover_master(struct dlm_rsb *r, unsigned int *count)
+static int recover_master(struct dlm_rsb *r, unsigned int *count, uint64_t seq)
 {
 	struct dlm_ls *ls = r->res_ls;
 	int our_nodeid, dir_nodeid;
@@ -472,7 +473,7 @@ static int recover_master(struct dlm_rsb *r, unsigned int *count)
 		error = 0;
 	} else {
 		recover_idr_add(r);
-		error = dlm_send_rcom_lookup(r, dir_nodeid);
+		error = dlm_send_rcom_lookup(r, dir_nodeid, seq);
 	}
 
 	(*count)++;
@@ -520,7 +521,7 @@ static int recover_master_static(struct dlm_rsb *r, unsigned int *count)
  * the correct dir node.
  */
 
-int dlm_recover_masters(struct dlm_ls *ls)
+int dlm_recover_masters(struct dlm_ls *ls, uint64_t seq)
 {
 	struct dlm_rsb *r;
 	unsigned int total = 0;
@@ -542,7 +543,7 @@ int dlm_recover_masters(struct dlm_ls *ls)
 		if (nodir)
 			error = recover_master_static(r, &count);
 		else
-			error = recover_master(r, &count);
+			error = recover_master(r, &count, seq);
 		unlock_rsb(r);
 		cond_resched();
 		total++;
@@ -614,13 +615,14 @@ int dlm_recover_master_reply(struct dlm_ls *ls, struct dlm_rcom *rc)
  * an equal number of replies then recovery for the rsb is done
  */
 
-static int recover_locks_queue(struct dlm_rsb *r, struct list_head *head)
+static int recover_locks_queue(struct dlm_rsb *r, struct list_head *head,
+			       uint64_t seq)
 {
 	struct dlm_lkb *lkb;
 	int error = 0;
 
 	list_for_each_entry(lkb, head, lkb_statequeue) {
-	   	error = dlm_send_rcom_lock(r, lkb);
+		error = dlm_send_rcom_lock(r, lkb, seq);
 		if (error)
 			break;
 		r->res_recover_locks_count++;
@@ -629,7 +631,7 @@ static int recover_locks_queue(struct dlm_rsb *r, struct list_head *head)
 	return error;
 }
 
-static int recover_locks(struct dlm_rsb *r)
+static int recover_locks(struct dlm_rsb *r, uint64_t seq)
 {
 	int error = 0;
 
@@ -637,13 +639,13 @@ static int recover_locks(struct dlm_rsb *r)
 
 	DLM_ASSERT(!r->res_recover_locks_count, dlm_dump_rsb(r););
 
-	error = recover_locks_queue(r, &r->res_grantqueue);
+	error = recover_locks_queue(r, &r->res_grantqueue, seq);
 	if (error)
 		goto out;
-	error = recover_locks_queue(r, &r->res_convertqueue);
+	error = recover_locks_queue(r, &r->res_convertqueue, seq);
 	if (error)
 		goto out;
-	error = recover_locks_queue(r, &r->res_waitqueue);
+	error = recover_locks_queue(r, &r->res_waitqueue, seq);
 	if (error)
 		goto out;
 
@@ -656,7 +658,7 @@ static int recover_locks(struct dlm_rsb *r)
 	return error;
 }
 
-int dlm_recover_locks(struct dlm_ls *ls)
+int dlm_recover_locks(struct dlm_ls *ls, uint64_t seq)
 {
 	struct dlm_rsb *r;
 	int error, count = 0;
@@ -677,7 +679,7 @@ int dlm_recover_locks(struct dlm_ls *ls)
 			goto out;
 		}
 
-		error = recover_locks(r);
+		error = recover_locks(r, seq);
 		if (error) {
 			up_read(&ls->ls_root_sem);
 			goto out;
diff --git a/fs/dlm/recover.h b/fs/dlm/recover.h
index 235e0d25cd48..c5ce2ef13934 100644
--- a/fs/dlm/recover.h
+++ b/fs/dlm/recover.h
@@ -15,13 +15,13 @@
 int dlm_wait_function(struct dlm_ls *ls, int (*testfn) (struct dlm_ls *ls));
 uint32_t dlm_recover_status(struct dlm_ls *ls);
 void dlm_set_recover_status(struct dlm_ls *ls, uint32_t status);
-int dlm_recover_members_wait(struct dlm_ls *ls);
-int dlm_recover_directory_wait(struct dlm_ls *ls);
-int dlm_recover_locks_wait(struct dlm_ls *ls);
-int dlm_recover_done_wait(struct dlm_ls *ls);
-int dlm_recover_masters(struct dlm_ls *ls);
+int dlm_recover_members_wait(struct dlm_ls *ls, uint64_t seq);
+int dlm_recover_directory_wait(struct dlm_ls *ls, uint64_t seq);
+int dlm_recover_locks_wait(struct dlm_ls *ls, uint64_t seq);
+int dlm_recover_done_wait(struct dlm_ls *ls, uint64_t seq);
+int dlm_recover_masters(struct dlm_ls *ls, uint64_t seq);
 int dlm_recover_master_reply(struct dlm_ls *ls, struct dlm_rcom *rc);
-int dlm_recover_locks(struct dlm_ls *ls);
+int dlm_recover_locks(struct dlm_ls *ls, uint64_t seq);
 void dlm_recovered_lock(struct dlm_rsb *r);
 int dlm_create_root_list(struct dlm_ls *ls);
 void dlm_release_root_list(struct dlm_ls *ls);
diff --git a/fs/dlm/recoverd.c b/fs/dlm/recoverd.c
index 19da816cfb09..4d17491dea2f 100644
--- a/fs/dlm/recoverd.c
+++ b/fs/dlm/recoverd.c
@@ -90,7 +90,7 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 
 	dlm_set_recover_status(ls, DLM_RS_NODES);
 
-	error = dlm_recover_members_wait(ls);
+	error = dlm_recover_members_wait(ls, rv->seq);
 	if (error) {
 		log_rinfo(ls, "dlm_recover_members_wait error %d", error);
 		goto fail;
@@ -103,7 +103,7 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 	 * nodes their master rsb names that hash to us.
 	 */
 
-	error = dlm_recover_directory(ls);
+	error = dlm_recover_directory(ls, rv->seq);
 	if (error) {
 		log_rinfo(ls, "dlm_recover_directory error %d", error);
 		goto fail;
@@ -111,7 +111,7 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 
 	dlm_set_recover_status(ls, DLM_RS_DIR);
 
-	error = dlm_recover_directory_wait(ls);
+	error = dlm_recover_directory_wait(ls, rv->seq);
 	if (error) {
 		log_rinfo(ls, "dlm_recover_directory_wait error %d", error);
 		goto fail;
@@ -145,7 +145,7 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 		 * departed nodes.
 		 */
 
-		error = dlm_recover_masters(ls);
+		error = dlm_recover_masters(ls, rv->seq);
 		if (error) {
 			log_rinfo(ls, "dlm_recover_masters error %d", error);
 			goto fail;
@@ -155,7 +155,7 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 		 * Send our locks on remastered rsb's to the new masters.
 		 */
 
-		error = dlm_recover_locks(ls);
+		error = dlm_recover_locks(ls, rv->seq);
 		if (error) {
 			log_rinfo(ls, "dlm_recover_locks error %d", error);
 			goto fail;
@@ -163,7 +163,7 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 
 		dlm_set_recover_status(ls, DLM_RS_LOCKS);
 
-		error = dlm_recover_locks_wait(ls);
+		error = dlm_recover_locks_wait(ls, rv->seq);
 		if (error) {
 			log_rinfo(ls, "dlm_recover_locks_wait error %d", error);
 			goto fail;
@@ -187,7 +187,7 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 		 */
 		dlm_set_recover_status(ls, DLM_RS_LOCKS);
 
-		error = dlm_recover_locks_wait(ls);
+		error = dlm_recover_locks_wait(ls, rv->seq);
 		if (error) {
 			log_rinfo(ls, "dlm_recover_locks_wait error %d", error);
 			goto fail;
@@ -206,7 +206,7 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 
 	dlm_set_recover_status(ls, DLM_RS_DONE);
 
-	error = dlm_recover_done_wait(ls);
+	error = dlm_recover_done_wait(ls, rv->seq);
 	if (error) {
 		log_rinfo(ls, "dlm_recover_done_wait error %d", error);
 		goto fail;
-- 
2.31.1

