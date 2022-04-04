Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0923E4F1A18
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102849;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/dUXtgukUhH2gVeYk6OHMqwLTd5ab1R+yyG6wurTJNQ=;
	b=XC0GDqjc8vLF3qP6THyBl6wBl1Yxi256YCj36i7uAliHx4RMbWCnFbWiEx+Y1/rfD+Ak8D
	jCn/0vR94tUi8ys70ww+87Kr/TWx8nALMMiaM2L6glRfgRFa01GBA9E7XRLChGGjxTJ3So
	ghFeZYf8P3xj/C78yslMU/kjToe3XkQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-yOJ-otpINmuZVRh9_S-CFQ-1; Mon, 04 Apr 2022 16:07:24 -0400
X-MC-Unique: yOJ-otpINmuZVRh9_S-CFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F01680D2A2;
	Mon,  4 Apr 2022 20:07:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1754540E8114;
	Mon,  4 Apr 2022 20:07:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 91E97193F6E9;
	Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 60954193F6D9 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 413D47AC4; Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 240578145;
 Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:37 -0400
Message-Id: <20220404200646.3170301-11-aahringo@redhat.com>
In-Reply-To: <20220404200646.3170301-1-aahringo@redhat.com>
References: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 10/19] fs: dlm: add
 __CHECKER__ for false positives
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

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
index 6ed935ad8247..19e82f08c0e0 100644
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

