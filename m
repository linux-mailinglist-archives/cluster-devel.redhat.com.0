Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 654604D9BAB
	for <lists+cluster-devel@lfdr.de>; Tue, 15 Mar 2022 13:57:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647349032;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gXUTYYV0iQ/6I6loda5ThR70xnGJy6TmUYg2S0b5/GE=;
	b=ISRMoI5QSlGeYOui45M8Qcit4Ur9QxF7Ea7lE+ttfom9552+yetq1bChB85hP64OkNwMWT
	LG2IMFpZxiXbafF2pz6XpB4m8NT+AdQEP6zp9e7KnQU+YXvlI4Jpv7FaBC/lDRTGhhgqdJ
	Aa7OctLAdmwlDcMTYQZH+GACD0Et3NM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-9mIVi6RZOOy2CORUM3fRsg-1; Tue, 15 Mar 2022 08:57:09 -0400
X-MC-Unique: 9mIVi6RZOOy2CORUM3fRsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41D461C0337E;
	Tue, 15 Mar 2022 12:57:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42699141DC28;
	Tue, 15 Mar 2022 12:57:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D223F195357A;
	Tue, 15 Mar 2022 12:57:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 72E9C194E021 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 15 Mar 2022 12:57:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2FA164B6948; Tue, 15 Mar 2022 12:57:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10883426342;
 Tue, 15 Mar 2022 12:57:04 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 15 Mar 2022 08:56:58 -0400
Message-Id: <20220315125658.4093984-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCHv3 dlm/next] fs: dlm: check required context
 while close
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds a WARN_ON() check to validate the right context while
dlm_midcomms_close() is called. Even before commit 489d8e559c65
("fs: dlm: add reliable connection if reconnect") in this context
dlm_lowcomms_close() flushes all ongoing transmission triggered by dlm
application stack. If we do that, it's required that no new message will
be triggered by the dlm application stack. The function
dlm_midcomms_close() is not called often so we can check if all
lockspaces are in such context.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
v2:
 - fix WARN_ON() brackets to include !dlm_locking_stopped
v3:
 - fix identation because fix of v2

 fs/dlm/lockspace.c | 13 +++++++++++++
 fs/dlm/lockspace.h |  1 +
 fs/dlm/midcomms.c  |  3 +++
 3 files changed, 17 insertions(+)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 31384e7d6f90..9e5d1051d6bd 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -923,3 +923,16 @@ void dlm_stop_lockspaces(void)
 		log_print("dlm user daemon left %d lockspaces", count);
 }
 
+void dlm_stop_lockspaces_check(void)
+{
+	struct dlm_ls *ls;
+
+	spin_lock(&lslist_lock);
+	list_for_each_entry(ls, &lslist, ls_list) {
+		if (WARN_ON(!rwsem_is_locked(&ls->ls_in_recovery) ||
+			    !dlm_locking_stopped(ls)))
+			break;
+	}
+	spin_unlock(&lslist_lock);
+}
+
diff --git a/fs/dlm/lockspace.h b/fs/dlm/lockspace.h
index a78d853b9342..306fc4f4ea15 100644
--- a/fs/dlm/lockspace.h
+++ b/fs/dlm/lockspace.h
@@ -19,6 +19,7 @@ struct dlm_ls *dlm_find_lockspace_local(void *id);
 struct dlm_ls *dlm_find_lockspace_device(int minor);
 void dlm_put_lockspace(struct dlm_ls *ls);
 void dlm_stop_lockspaces(void);
+void dlm_stop_lockspaces_check(void);
 
 #endif				/* __LOCKSPACE_DOT_H__ */
 
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 3635e42b0669..e156457e0045 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -135,6 +135,7 @@
 #include <net/tcp.h>
 
 #include "dlm_internal.h"
+#include "lockspace.h"
 #include "lowcomms.h"
 #include "config.h"
 #include "memory.h"
@@ -1406,6 +1407,8 @@ int dlm_midcomms_close(int nodeid)
 	if (nodeid == dlm_our_nodeid())
 		return 0;
 
+	dlm_stop_lockspaces_check();
+
 	idx = srcu_read_lock(&nodes_srcu);
 	/* Abort pending close/remove operation */
 	node = nodeid2node(nodeid, 0);
-- 
2.31.1

