Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83854715101
	for <lists+cluster-devel@lfdr.de>; Mon, 29 May 2023 23:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685396689;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qwAUpK4a0J9dnz49/qMvbT7hbZUh6ED2xd6uRMiNwmk=;
	b=eEXXBclKT+SA+GX2b/J1HTqyE+eeArgnaknJlMD0ozPIXyI8kHpJrAkQhFMJyPfA9IKMiu
	NBVNm2Kj/zVKGATjmnxDluG1LErPEOfct3wxmVbbJKh70Ds/kwqct2SH3pbzk0ST+dD8Au
	SBkb6Uc3DgADqsWUkG+mQqonldUo8SE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-2A6xErFUPNaCMgfietKCSg-1; Mon, 29 May 2023 17:44:46 -0400
X-MC-Unique: 2A6xErFUPNaCMgfietKCSg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A309101A55C;
	Mon, 29 May 2023 21:44:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EAB0B40CFD45;
	Mon, 29 May 2023 21:44:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4EDA519465B2;
	Mon, 29 May 2023 21:44:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 110FB194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 29 May 2023 21:44:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E8D692166B2E; Mon, 29 May 2023 21:44:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B51002166B2B;
 Mon, 29 May 2023 21:44:41 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 29 May 2023 17:44:29 -0400
Message-Id: <20230529214440.2542721-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 01/12] fs: dlm: revert check
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch reverts commit 2c3fa6ae4d52 ("dlm: check required context
while close"). The function dlm_midcomms_close(), which will call later
dlm_lowcomms_close(), is called when the cluster manager tells the node
got fenced which means on midcomms/lowcomms layer to disconnect the node
from the cluster communication. The node can rejoin the cluster later.
This patch was ensuring no new message were able to be triggered when we
are in the close() function context. This was done by checking if the
lockspace has been stopped. However there is a missing check that we
only need to check specific lockspaces where the fenced node is member
of. This is currently complicated because there is no way to easily
check if a node is part of a specific lockspace without stopping the
recovery. For now we just revert this commit as it is just a check to
finding possible leaks of stopping lockspaces before close() is called.

Cc: stable@vger.kernel.org
Fixes: 2c3fa6ae4d52 ("dlm: check required context while close")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lockspace.c | 12 ------------
 fs/dlm/lockspace.h |  1 -
 fs/dlm/midcomms.c  |  3 ---
 3 files changed, 16 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 67261b7b1f0e..0455dddb0797 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -935,15 +935,3 @@ void dlm_stop_lockspaces(void)
 		log_print("dlm user daemon left %d lockspaces", count);
 }
 
-void dlm_stop_lockspaces_check(void)
-{
-	struct dlm_ls *ls;
-
-	spin_lock(&lslist_lock);
-	list_for_each_entry(ls, &lslist, ls_list) {
-		if (WARN_ON(!rwsem_is_locked(&ls->ls_in_recovery) ||
-			    !dlm_locking_stopped(ls)))
-			break;
-	}
-	spin_unlock(&lslist_lock);
-}
diff --git a/fs/dlm/lockspace.h b/fs/dlm/lockspace.h
index 03f4a4a3a871..47ebd4411926 100644
--- a/fs/dlm/lockspace.h
+++ b/fs/dlm/lockspace.h
@@ -27,7 +27,6 @@ struct dlm_ls *dlm_find_lockspace_local(void *id);
 struct dlm_ls *dlm_find_lockspace_device(int minor);
 void dlm_put_lockspace(struct dlm_ls *ls);
 void dlm_stop_lockspaces(void);
-void dlm_stop_lockspaces_check(void);
 int dlm_new_user_lockspace(const char *name, const char *cluster,
 			   uint32_t flags, int lvblen,
 			   const struct dlm_lockspace_ops *ops,
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index c02c43e4980a..3df916a568ba 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -136,7 +136,6 @@
 #include <net/tcp.h>
 
 #include "dlm_internal.h"
-#include "lockspace.h"
 #include "lowcomms.h"
 #include "config.h"
 #include "memory.h"
@@ -1491,8 +1490,6 @@ int dlm_midcomms_close(int nodeid)
 	if (nodeid == dlm_our_nodeid())
 		return 0;
 
-	dlm_stop_lockspaces_check();
-
 	idx = srcu_read_lock(&nodes_srcu);
 	/* Abort pending close/remove operation */
 	node = nodeid2node(nodeid, 0);
-- 
2.31.1

