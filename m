Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3415849CFE3
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jan 2022 17:41:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643215275;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tKG9yvCFCtuyotX48K4rTxyaI0mf/wEw1Ks0hodWnUA=;
	b=iD9wHTgGtaQB0v/S5Ke4zvn5djLI4ic8JyBMJ6/7YQhsBuAUIPhyfk0t5EO7lh8YwoZ1dp
	6EI8WW0Hwji6X+sHhBugyBvdupmw+1QDZP+XAj+Q63CZlVrb3//h0L0pYCDgLPt9e4DFSj
	RhAUcG7G3yJ54CbJ5Q9u3zUc4jgdyDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-DZN20ZDLMXqQm2WYcw9o1g-1; Wed, 26 Jan 2022 11:41:12 -0500
X-MC-Unique: DZN20ZDLMXqQm2WYcw9o1g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A3F679EFF;
	Wed, 26 Jan 2022 16:41:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 912B85CC6A;
	Wed, 26 Jan 2022 16:41:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 634D41809CB8;
	Wed, 26 Jan 2022 16:41:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20QGf23T024735 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jan 2022 11:41:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 596EB79A2C; Wed, 26 Jan 2022 16:41:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A8DF79A29;
	Wed, 26 Jan 2022 16:41:01 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 26 Jan 2022 11:40:59 -0500
Message-Id: <20220126164059.3846926-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: fix false positives for
	checkers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will adds #ifndef __CHECKER__ for false positives warnings
about a missing lock/unlock srcu handling. Which are shown by running
sparse checks. Using __CHECKER__ will tell sparse to ignore these
sections.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
There are still endianess warnings running sparse, I will let them
there. They are false-postives but there exists a better way to avoid
those warnings by using __le types in DLM.

 fs/dlm/lowcomms.c | 10 ++++++++++
 fs/dlm/midcomms.c | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index e284d696c1fd..a7f3791ea44b 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1303,6 +1303,10 @@ static struct dlm_msg *dlm_lowcomms_new_msg_con(struct connection *con, int len,
 	return msg;
 }
 
+/* avoid false positive for nodes_srcu, unlock happens in
+ * dlm_midcomms_get_mhandle which is a must call if success
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

