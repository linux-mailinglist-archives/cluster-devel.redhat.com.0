Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ACD4F1A15
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102846;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7h3YGOrUhQqhwu31tVeczQpYj1/qrqqHAFNJKyJXRLw=;
	b=S9K42fWMEQjvIyEBvojprJCDzC6WNhFvO8i47g5NyNSKdJpw/Mu8/+wHctgUUwth0HMAYN
	8zNFbPpAD2n160kZlbu9JXbVN20er/GZ+yhOjXmoOKsHZ1d/CfoTFRz0dKb8sAYZDgbNNd
	CebQ4tmByMWCxwEr3fCb09x1sNx9A28=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-LuYEYKsrOBugQopRA7-4pQ-1; Mon, 04 Apr 2022 16:07:21 -0400
X-MC-Unique: LuYEYKsrOBugQopRA7-4pQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABA7B100BAD0;
	Mon,  4 Apr 2022 20:07:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E351428F0B;
	Mon,  4 Apr 2022 20:07:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 45B62194EB8B;
	Mon,  4 Apr 2022 20:06:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BD76B193F517 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B1E387C28; Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94EA67C2A;
 Mon,  4 Apr 2022 20:06:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:46 -0400
Message-Id: <20220404200646.3170301-20-aahringo@redhat.com>
In-Reply-To: <20220404200646.3170301-1-aahringo@redhat.com>
References: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 19/19] fs: dlm: check
 required context while close
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
 fs/dlm/lockspace.c | 12 ++++++++++++
 fs/dlm/lockspace.h |  1 +
 fs/dlm/midcomms.c  |  3 +++
 3 files changed, 16 insertions(+)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 0d3833a124a3..19ed41a5da93 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -922,3 +922,15 @@ void dlm_stop_lockspaces(void)
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
index 649efe120eee..6489bc22ad61 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -135,6 +135,7 @@
 #include <net/tcp.h>
 
 #include "dlm_internal.h"
+#include "lockspace.h"
 #include "lowcomms.h"
 #include "config.h"
 #include "memory.h"
@@ -1412,6 +1413,8 @@ int dlm_midcomms_close(int nodeid)
 	if (nodeid == dlm_our_nodeid())
 		return 0;
 
+	dlm_stop_lockspaces_check();
+
 	idx = srcu_read_lock(&nodes_srcu);
 	/* Abort pending close/remove operation */
 	node = nodeid2node(nodeid, 0);
-- 
2.31.1

