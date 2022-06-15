Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B833C54CB03
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jun 2022 16:15:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655302556;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zN4VvHAyug3oC58RXKM5CDXa9nJ9BgSz5QdipfzIBd8=;
	b=gdyW8SLrdBMwf/oyKeVZffwHveuK4G7A8lOdwTTiuPN6Ra1bKyMdbePGDukOeRJ8xgAvdX
	R5gd37I8Ub5+5Eitip36n5xzq8zDri+ir7pqCZilIzx+ZbfjCGyWmYwjSBmgYVoR7GZcOp
	bM4gVAwZLXnxxBAluNzbNOE6hIGgbLY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-Z_8TYDMUOQers0UUoC9yRg-1; Wed, 15 Jun 2022 10:15:53 -0400
X-MC-Unique: Z_8TYDMUOQers0UUoC9yRg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD5F81C004EE;
	Wed, 15 Jun 2022 14:15:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2AF5A1131D;
	Wed, 15 Jun 2022 14:15:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ADDD81947042;
	Wed, 15 Jun 2022 14:15:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C55E219466DF for <cluster-devel@listman.corp.redhat.com>;
 Wed, 15 Jun 2022 14:15:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 909F32166B2B; Wed, 15 Jun 2022 14:15:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EC762166B26;
 Wed, 15 Jun 2022 14:15:16 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 15 Jun 2022 10:14:59 -0400
Message-Id: <20220615141459.2275135-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: add dlm_is_member() check
 if fenced
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds an additional check if the "fenced" node is part of any
lockspace. A node should not be part of any lockspace when it's got
fenced. This is an additional requirement besides that all lockspace
activity should be stopped before calling dlm_midcomms_close().

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lockspace.c | 5 ++++-
 fs/dlm/lockspace.h | 2 +-
 fs/dlm/midcomms.c  | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 0c3613d09c5e..a4f492189a08 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -923,12 +923,15 @@ void dlm_stop_lockspaces(void)
 		log_print("dlm user daemon left %d lockspaces", count);
 }
 
-void dlm_stop_lockspaces_check(void)
+void dlm_stop_lockspaces_check(int nodeid)
 {
 	struct dlm_ls *ls;
 
 	spin_lock(&lslist_lock);
 	list_for_each_entry(ls, &lslist, ls_list) {
+		if (WARN_ON(dlm_is_member(ls, nodeid)))
+			break;
+
 		if (WARN_ON(!rwsem_is_locked(&ls->ls_in_recovery) ||
 			    !dlm_locking_stopped(ls)))
 			break;
diff --git a/fs/dlm/lockspace.h b/fs/dlm/lockspace.h
index 306fc4f4ea15..9d1ea1013650 100644
--- a/fs/dlm/lockspace.h
+++ b/fs/dlm/lockspace.h
@@ -19,7 +19,7 @@ struct dlm_ls *dlm_find_lockspace_local(void *id);
 struct dlm_ls *dlm_find_lockspace_device(int minor);
 void dlm_put_lockspace(struct dlm_ls *ls);
 void dlm_stop_lockspaces(void);
-void dlm_stop_lockspaces_check(void);
+void dlm_stop_lockspaces_check(int nodeid);
 
 #endif				/* __LOCKSPACE_DOT_H__ */
 
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 6489bc22ad61..22037183f565 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -1413,7 +1413,7 @@ int dlm_midcomms_close(int nodeid)
 	if (nodeid == dlm_our_nodeid())
 		return 0;
 
-	dlm_stop_lockspaces_check();
+	dlm_stop_lockspaces_check(nodeid);
 
 	idx = srcu_read_lock(&nodes_srcu);
 	/* Abort pending close/remove operation */
-- 
2.31.1

