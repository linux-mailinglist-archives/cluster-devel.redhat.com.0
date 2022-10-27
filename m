Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 58788610310
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Oct 2022 22:46:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666903563;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3CkqE7AXySpi9/McWFiHik076/dbMn5F0DSRHyMlsC4=;
	b=OvgjTAePYjBKZRKf4yI2pvExZh/sR8qJvAB47v+QRS/JWz4gf4/JPka/GmaJTv/P657kFG
	GCzVTjUcLfu72Gl/2Y0FBDlYZM3aF6knzvrOH9lqF4SNI9erFZKfNGKdfWbAOJediYD3Ub
	pegqHytwcWMgC5nAXjVSBaLID/wH5D8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-lqepVwFpMOGIHzK73VikZw-1; Thu, 27 Oct 2022 16:46:00 -0400
X-MC-Unique: lqepVwFpMOGIHzK73VikZw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 891F3382C987;
	Thu, 27 Oct 2022 20:45:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73BF6475067;
	Thu, 27 Oct 2022 20:45:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2B1E21947066;
	Thu, 27 Oct 2022 20:45:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 34C271947055 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 20:45:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7BC93112C092; Thu, 27 Oct 2022 20:45:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 574331121325;
 Thu, 27 Oct 2022 20:45:37 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Oct 2022 16:45:22 -0400
Message-Id: <20221027204528.1119036-12-aahringo@redhat.com>
In-Reply-To: <20221027204528.1119036-1-aahringo@redhat.com>
References: <20221027204528.1119036-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v6.1-rc1 12/18] fs: dlm: allow different
 allocation context per _create_message
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch allows to give the use control about the allocation context
based on a per message basis. Currently all messages forced to be
created under GFP_NOFS context.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c     | 31 +++++++++++++++++++------------
 fs/dlm/memory.c   |  4 ++--
 fs/dlm/memory.h   |  2 +-
 fs/dlm/midcomms.c |  2 +-
 4 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index f4b2fb17bbb1..a2930e33c134 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -3554,7 +3554,8 @@ int dlm_unlock(dlm_lockspace_t *lockspace,
 static int _create_message(struct dlm_ls *ls, int mb_len,
 			   int to_nodeid, int mstype,
 			   struct dlm_message **ms_ret,
-			   struct dlm_mhandle **mh_ret)
+			   struct dlm_mhandle **mh_ret,
+			   gfp_t allocation)
 {
 	struct dlm_message *ms;
 	struct dlm_mhandle *mh;
@@ -3564,7 +3565,7 @@ static int _create_message(struct dlm_ls *ls, int mb_len,
 	   pass into midcomms_commit and a message buffer (mb) that we
 	   write our data into */
 
-	mh = dlm_midcomms_get_mhandle(to_nodeid, mb_len, GFP_NOFS, &mb);
+	mh = dlm_midcomms_get_mhandle(to_nodeid, mb_len, allocation, &mb);
 	if (!mh)
 		return -ENOBUFS;
 
@@ -3586,7 +3587,8 @@ static int _create_message(struct dlm_ls *ls, int mb_len,
 static int create_message(struct dlm_rsb *r, struct dlm_lkb *lkb,
 			  int to_nodeid, int mstype,
 			  struct dlm_message **ms_ret,
-			  struct dlm_mhandle **mh_ret)
+			  struct dlm_mhandle **mh_ret,
+			  gfp_t allocation)
 {
 	int mb_len = sizeof(struct dlm_message);
 
@@ -3607,7 +3609,7 @@ static int create_message(struct dlm_rsb *r, struct dlm_lkb *lkb,
 	}
 
 	return _create_message(r->res_ls, mb_len, to_nodeid, mstype,
-			       ms_ret, mh_ret);
+			       ms_ret, mh_ret, allocation);
 }
 
 /* further lowcomms enhancements or alternate implementations may make
@@ -3676,7 +3678,7 @@ static int send_common(struct dlm_rsb *r, struct dlm_lkb *lkb, int mstype)
 	if (error)
 		return error;
 
-	error = create_message(r, lkb, to_nodeid, mstype, &ms, &mh);
+	error = create_message(r, lkb, to_nodeid, mstype, &ms, &mh, GFP_NOFS);
 	if (error)
 		goto fail;
 
@@ -3737,7 +3739,8 @@ static int send_grant(struct dlm_rsb *r, struct dlm_lkb *lkb)
 
 	to_nodeid = lkb->lkb_nodeid;
 
-	error = create_message(r, lkb, to_nodeid, DLM_MSG_GRANT, &ms, &mh);
+	error = create_message(r, lkb, to_nodeid, DLM_MSG_GRANT, &ms, &mh,
+			       GFP_NOFS);
 	if (error)
 		goto out;
 
@@ -3758,7 +3761,8 @@ static int send_bast(struct dlm_rsb *r, struct dlm_lkb *lkb, int mode)
 
 	to_nodeid = lkb->lkb_nodeid;
 
-	error = create_message(r, NULL, to_nodeid, DLM_MSG_BAST, &ms, &mh);
+	error = create_message(r, NULL, to_nodeid, DLM_MSG_BAST, &ms, &mh,
+			       GFP_NOFS);
 	if (error)
 		goto out;
 
@@ -3783,7 +3787,8 @@ static int send_lookup(struct dlm_rsb *r, struct dlm_lkb *lkb)
 	if (error)
 		return error;
 
-	error = create_message(r, NULL, to_nodeid, DLM_MSG_LOOKUP, &ms, &mh);
+	error = create_message(r, NULL, to_nodeid, DLM_MSG_LOOKUP, &ms, &mh,
+			       GFP_NOFS);
 	if (error)
 		goto fail;
 
@@ -3807,7 +3812,8 @@ static int send_remove(struct dlm_rsb *r)
 
 	to_nodeid = dlm_dir_nodeid(r);
 
-	error = create_message(r, NULL, to_nodeid, DLM_MSG_REMOVE, &ms, &mh);
+	error = create_message(r, NULL, to_nodeid, DLM_MSG_REMOVE, &ms, &mh,
+			       GFP_NOFS);
 	if (error)
 		goto out;
 
@@ -3828,7 +3834,7 @@ static int send_common_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 
 	to_nodeid = lkb->lkb_nodeid;
 
-	error = create_message(r, lkb, to_nodeid, mstype, &ms, &mh);
+	error = create_message(r, lkb, to_nodeid, mstype, &ms, &mh, GFP_NOFS);
 	if (error)
 		goto out;
 
@@ -3869,7 +3875,8 @@ static int send_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms_in,
 	struct dlm_mhandle *mh;
 	int error, nodeid = le32_to_cpu(ms_in->m_header.h_nodeid);
 
-	error = create_message(r, NULL, nodeid, DLM_MSG_LOOKUP_REPLY, &ms, &mh);
+	error = create_message(r, NULL, nodeid, DLM_MSG_LOOKUP_REPLY, &ms, &mh,
+			       GFP_NOFS);
 	if (error)
 		goto out;
 
@@ -6295,7 +6302,7 @@ static int send_purge(struct dlm_ls *ls, int nodeid, int pid)
 	int error;
 
 	error = _create_message(ls, sizeof(struct dlm_message), nodeid,
-				DLM_MSG_PURGE, &ms, &mh);
+				DLM_MSG_PURGE, &ms, &mh, GFP_NOFS);
 	if (error)
 		return error;
 	ms->m_nodeid = cpu_to_le32(nodeid);
diff --git a/fs/dlm/memory.c b/fs/dlm/memory.c
index 61fe0d1f5646..eb7a08641fcf 100644
--- a/fs/dlm/memory.c
+++ b/fs/dlm/memory.c
@@ -134,9 +134,9 @@ void dlm_free_lkb(struct dlm_lkb *lkb)
 	kmem_cache_free(lkb_cache, lkb);
 }
 
-struct dlm_mhandle *dlm_allocate_mhandle(void)
+struct dlm_mhandle *dlm_allocate_mhandle(gfp_t allocation)
 {
-	return kmem_cache_alloc(mhandle_cache, GFP_NOFS);
+	return kmem_cache_alloc(mhandle_cache, allocation);
 }
 
 void dlm_free_mhandle(struct dlm_mhandle *mhandle)
diff --git a/fs/dlm/memory.h b/fs/dlm/memory.h
index c1583ec8b2cf..6b29563d24f7 100644
--- a/fs/dlm/memory.h
+++ b/fs/dlm/memory.h
@@ -20,7 +20,7 @@ struct dlm_lkb *dlm_allocate_lkb(struct dlm_ls *ls);
 void dlm_free_lkb(struct dlm_lkb *l);
 char *dlm_allocate_lvb(struct dlm_ls *ls);
 void dlm_free_lvb(char *l);
-struct dlm_mhandle *dlm_allocate_mhandle(void);
+struct dlm_mhandle *dlm_allocate_mhandle(gfp_t allocation);
 void dlm_free_mhandle(struct dlm_mhandle *mhandle);
 struct writequeue_entry *dlm_allocate_writequeue(void);
 void dlm_free_writequeue(struct writequeue_entry *writequeue);
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index e10a6e97df44..3a4e20d6cd2d 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -1097,7 +1097,7 @@ struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 	/* this is a bug, however we going on and hope it will be resolved */
 	WARN_ON(test_bit(DLM_NODE_FLAG_STOP_TX, &node->flags));
 
-	mh = dlm_allocate_mhandle();
+	mh = dlm_allocate_mhandle(allocation);
 	if (!mh)
 		goto err;
 
-- 
2.31.1

