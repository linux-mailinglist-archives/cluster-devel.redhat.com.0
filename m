Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E9E7654E4
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 15:23:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690464201;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MvatUgmbO4MVOLtZrH6gE+jiZuwtj9DwnLZJ7kUEQJA=;
	b=bse+K3Q9EUEOjqnUIw8ZwS8IwgxQ7bOuSuRvyn5IZgesQSG9Mx0gn7TDcyV0v5mbbgQ9G3
	R12r2Yg32Mg/SwjF9nagGyx3g0btG0Yot85EEC4PqHbAo/SrQuIBannVdeoXIQyWdxfLJn
	edSsLCOVMh9EOt/kBuiwIAQgBIyNqYc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-FD6CWM6ZONu_MzSJAZDusw-1; Thu, 27 Jul 2023 09:23:17 -0400
X-MC-Unique: FD6CWM6ZONu_MzSJAZDusw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA2AE185A78F;
	Thu, 27 Jul 2023 13:23:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF78B201F11C;
	Thu, 27 Jul 2023 13:23:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 807371946A71;
	Thu, 27 Jul 2023 13:23:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 59C1A193F51D for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 13:23:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 496984094DC1; Thu, 27 Jul 2023 13:23:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27B214094DC0;
 Thu, 27 Jul 2023 13:23:10 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Jul 2023 09:23:00 -0400
Message-Id: <20230727132303.3352514-10-aahringo@redhat.com>
In-Reply-To: <20230727132303.3352514-1-aahringo@redhat.com>
References: <20230727132303.3352514-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm-next 10/13] fs: dlm: drop rxbuf
 manipulation in dlm_recover_master_copy
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

Currently dlm_recover_master_copy() manipulates the receive buffer of an
rcom lock message and modifies it on the fly so a later memcpy() to a
new rcom message with the same message has those new values. This patch
avoids manipulating the received rcom message by store the values for
the new rcom message in paremter assigned with call by reference. Later
when dlm_send_rcom_lock() constructs a new message and memcpy() the
receive buffer those values will be set on the new constructed message.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 10 +++++++---
 fs/dlm/lock.h |  3 ++-
 fs/dlm/rcom.c | 12 ++++++++----
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index b489da38e685..1cf666c7401d 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -5384,7 +5384,8 @@ static int receive_rcom_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
    back the rcom_lock struct we got but with the remid field filled in. */
 
 /* needs at least dlm_rcom + rcom_lock */
-int dlm_recover_master_copy(struct dlm_ls *ls, struct dlm_rcom *rc)
+int dlm_recover_master_copy(struct dlm_ls *ls, struct dlm_rcom *rc,
+			    __le32 *rl_remid, __le32 *rl_result)
 {
 	struct rcom_lock *rl = (struct rcom_lock *) rc->rc_buf;
 	struct dlm_rsb *r;
@@ -5393,6 +5394,9 @@ int dlm_recover_master_copy(struct dlm_ls *ls, struct dlm_rcom *rc)
 	int from_nodeid = le32_to_cpu(rc->rc_header.h_nodeid);
 	int error;
 
+	/* init rl_remid with rcom lock rl_remid */
+	*rl_remid = rl->rl_remid;
+
 	if (rl->rl_parent_lkid) {
 		error = -EOPNOTSUPP;
 		goto out;
@@ -5448,7 +5452,7 @@ int dlm_recover_master_copy(struct dlm_ls *ls, struct dlm_rcom *rc)
  out_remid:
 	/* this is the new value returned to the lock holder for
 	   saving in its process-copy lkb */
-	rl->rl_remid = cpu_to_le32(lkb->lkb_id);
+	*rl_remid = cpu_to_le32(lkb->lkb_id);
 
 	lkb->lkb_recover_seq = ls->ls_recover_seq;
 
@@ -5459,7 +5463,7 @@ int dlm_recover_master_copy(struct dlm_ls *ls, struct dlm_rcom *rc)
 	if (error && error != -EEXIST)
 		log_rinfo(ls, "dlm_recover_master_copy remote %d %x error %d",
 			  from_nodeid, remid, error);
-	rl->rl_result = cpu_to_le32(error);
+	*rl_result = cpu_to_le32(error);
 	return error;
 }
 
diff --git a/fs/dlm/lock.h b/fs/dlm/lock.h
index 222e682523b9..cd67ccfbbf9b 100644
--- a/fs/dlm/lock.h
+++ b/fs/dlm/lock.h
@@ -36,7 +36,8 @@ void dlm_purge_mstcpy_locks(struct dlm_rsb *r);
 void dlm_recover_grant(struct dlm_ls *ls);
 int dlm_recover_waiters_post(struct dlm_ls *ls);
 void dlm_recover_waiters_pre(struct dlm_ls *ls);
-int dlm_recover_master_copy(struct dlm_ls *ls, struct dlm_rcom *rc);
+int dlm_recover_master_copy(struct dlm_ls *ls, struct dlm_rcom *rc,
+			    __le32 *rl_remid, __le32 *rl_result);
 int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc,
 			     uint64_t seq);
 
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index efe45e68287f..0946431e370a 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -472,21 +472,25 @@ int dlm_send_rcom_lock(struct dlm_rsb *r, struct dlm_lkb *lkb, uint64_t seq)
 static void receive_rcom_lock(struct dlm_ls *ls, struct dlm_rcom *rc_in,
 			      uint64_t seq)
 {
+	__le32 rl_remid, rl_result;
+	struct rcom_lock *rl;
 	struct dlm_rcom *rc;
 	struct dlm_mhandle *mh;
 	int error, nodeid = le32_to_cpu(rc_in->rc_header.h_nodeid);
 
-	dlm_recover_master_copy(ls, rc_in);
+	dlm_recover_master_copy(ls, rc_in, &rl_remid, &rl_result);
 
 	error = create_rcom(ls, nodeid, DLM_RCOM_LOCK_REPLY,
 			    sizeof(struct rcom_lock), &rc, &mh, seq);
 	if (error)
 		return;
 
-	/* We send back the same rcom_lock struct we received, but
-	   dlm_recover_master_copy() has filled in rl_remid and rl_result */
-
 	memcpy(rc->rc_buf, rc_in->rc_buf, sizeof(struct rcom_lock));
+	rl = (struct rcom_lock *)rc->rc_buf;
+	/* set rl_remid and rl_result from dlm_recover_master_copy() */
+	rl->rl_remid = rl_remid;
+	rl->rl_result = rl_result;
+
 	rc->rc_id = rc_in->rc_id;
 	rc->rc_seq_reply = rc_in->rc_seq;
 
-- 
2.31.1

