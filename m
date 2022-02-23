Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D0B4C1993
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Feb 2022 18:11:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645636280;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=97hMSz6Lw5rf9cKpoeNkDmFiQlkNcVZk3MFHRCXC7CE=;
	b=VjNQUrjhZWo7NyCK4n3NNTUgbwE66FU5R4FZrBZ45ncMHqbMDz6mvJahgx17dp0NkGjj94
	5isijQPY7c+nyQPRFrdwm82z38xHpwRvMu5ZIoQEBRFlAylllaE3PYerbPLMgdPD8HDldd
	lkb9KGuyRIo9jJ0l6IiUibvmsjTOCzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-VOw8oRguOJ-gkSgNL1Xpnw-1; Wed, 23 Feb 2022 12:11:17 -0500
X-MC-Unique: VOw8oRguOJ-gkSgNL1Xpnw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0CE31006AA6;
	Wed, 23 Feb 2022 17:11:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75C60341FB;
	Wed, 23 Feb 2022 17:11:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 21B931809C98;
	Wed, 23 Feb 2022 17:11:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21NH8ox8009243 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Feb 2022 12:08:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DB0B4838EC; Wed, 23 Feb 2022 17:08:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B6CC838E6;
	Wed, 23 Feb 2022 17:08:50 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Feb 2022 12:08:21 -0500
Message-Id: <20220223170829.830864-2-aahringo@redhat.com>
In-Reply-To: <20220223170829.830864-1-aahringo@redhat.com>
References: <20220223170829.830864-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, viro@zeniv.linux.org.uk
Subject: [Cluster-devel] [PATCH/RFC dlm/next 1/9] fs: dlm: add __CHECKER__
	for false positives
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will adds #ifndef __CHECKER__ for false positives warnings
about an imbalance lock/unlock srcu handling. Which are shown by running
sparse checks:

fs/dlm/midcomms.c:1065:20: warning: context imbalance in 'dlm_midcomms_get_mhandle' - wrong count at exit

Using __CHECKER__ will tell sparse to ignore these sections.

Those imbalances are false positive because from upper layer it is
always required to call a function in sequence, e.g. if
dlm_midcomms_get_mhandle() is successful there must be a
dlm_midcomms_commit_mhandle() call afterwards.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 10 ++++++++++
 fs/dlm/midcomms.c | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index e284d696c1fd..d01d9ee871b0 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1303,6 +1303,10 @@ static struct dlm_msg *dlm_lowcomms_new_msg_con(struct connection *con, int len,
 	return msg;
 }
 
+/* avoid false positive for nodes_srcu, unlock happens in
+ * dlm_lowcomms_commit_msg which is a must call if success
+ */
+#ifndef __CHECKER__
 struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
 				     char **ppc, void (*cb)(void *data),
 				     void *data)
@@ -1336,6 +1340,7 @@ struct dlm_msg *dlm_lowcomms_new_msg(int nodeid, int len, gfp_t allocation,
 	msg->idx = idx;
 	return msg;
 }
+#endif
 
 static void _dlm_lowcomms_commit_msg(struct dlm_msg *msg)
 {
@@ -1362,11 +1367,16 @@ static void _dlm_lowcomms_commit_msg(struct dlm_msg *msg)
 	return;
 }
 
+/* avoid false positive for nodes_srcu, lock was happen in
+ * dlm_lowcomms_new_msg
+ */
+#ifndef __CHECKER__
 void dlm_lowcomms_commit_msg(struct dlm_msg *msg)
 {
 	_dlm_lowcomms_commit_msg(msg);
 	srcu_read_unlock(&connections_srcu, msg->idx);
 }
+#endif
 
 void dlm_lowcomms_put_msg(struct dlm_msg *msg)
 {
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 3635e42b0669..f95f6f40c404 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -1062,6 +1062,10 @@ static struct dlm_msg *dlm_midcomms_get_msg_3_2(struct dlm_mhandle *mh, int node
 	return msg;
 }
 
+/* avoid false positive for nodes_srcu, unlock happens in
+ * dlm_midcomms_commit_mhandle which is a must call if success
+ */
+#ifndef __CHECKER__
 struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 					     gfp_t allocation, char **ppc)
 {
@@ -1127,6 +1131,7 @@ struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 	srcu_read_unlock(&nodes_srcu, idx);
 	return NULL;
 }
+#endif
 
 static void dlm_midcomms_commit_msg_3_2(struct dlm_mhandle *mh)
 {
@@ -1136,6 +1141,10 @@ static void dlm_midcomms_commit_msg_3_2(struct dlm_mhandle *mh)
 	dlm_lowcomms_commit_msg(mh->msg);
 }
 
+/* avoid false positive for nodes_srcu, lock was happen in
+ * dlm_midcomms_get_mhandle
+ */
+#ifndef __CHECKER__
 void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh)
 {
 	switch (mh->node->version) {
@@ -1157,6 +1166,7 @@ void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh)
 		break;
 	}
 }
+#endif
 
 int dlm_midcomms_start(void)
 {
-- 
2.31.1

