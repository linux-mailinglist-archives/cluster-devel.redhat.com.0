Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6036A546B42
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Jun 2022 19:06:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654880791;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YAz0zorVpaJOauz3Hyej/zpYPbV9EhgasOmUIhgYNlw=;
	b=emczloOmr0vTamI+aBQZ7vPd/U92e6bdaRSMZGcF27eUh1NskXpSxbhYMpQcFp/HUijqnd
	xFhoOQPm2IhasbqKURaBcD/5CasWfPHOeapIiX00DszMYr1cv+JGZ5akFKZZ35/eIJ+Tgi
	0ItSa2uIUWcnQ8C4GWBUCl8T+MJbakA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-D9LUlk4lNkmsJ7MTC7TVBA-1; Fri, 10 Jun 2022 13:06:28 -0400
X-MC-Unique: D9LUlk4lNkmsJ7MTC7TVBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 731E1181E061;
	Fri, 10 Jun 2022 17:06:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 671811121314;
	Fri, 10 Jun 2022 17:06:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3C74A1947055;
	Fri, 10 Jun 2022 17:06:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8016B1947052 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Jun 2022 17:06:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 70FD51131A; Fri, 10 Jun 2022 17:06:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5260818EA8;
 Fri, 10 Jun 2022 17:06:23 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 10 Jun 2022 13:06:14 -0400
Message-Id: <20220610170616.3480642-6-aahringo@redhat.com>
In-Reply-To: <20220610170616.3480642-1-aahringo@redhat.com>
References: <20220610170616.3480642-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v5.19-rc1 5/7] fs: dlm: handle recovery
 -EAGAIN case as retry
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds additional functionality if recovery returns -EAGAIN
error code to not deliver this failure to the potential caller of
dlm_new_lockspace(). If -EAGAIN is returned we try to run recovery again
and hope with a additional schedule() it doesn't return -EAGAIN anymore.
If a maximum amount is hit, we fence ourself by running panic().

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/recoverd.c | 70 +++++++++++++++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 23 deletions(-)

diff --git a/fs/dlm/recoverd.c b/fs/dlm/recoverd.c
index 90e8b7f440da..eeb221c175a2 100644
--- a/fs/dlm/recoverd.c
+++ b/fs/dlm/recoverd.c
@@ -20,6 +20,7 @@
 #include "requestqueue.h"
 #include "recoverd.h"
 
+#define DLM_RECOVERY_MAX_RETRIES 5
 
 /* If the start for which we're re-enabling locking (seq) has been superseded
    by a newer stop (ls_recover_seq), we need to leave locking disabled.
@@ -259,7 +260,7 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 static void do_ls_recovery(struct dlm_ls *ls)
 {
 	struct dlm_recover *rv = NULL;
-	int error;
+	int error, count = 0;
 
 	spin_lock(&ls->ls_recover_lock);
 	rv = ls->ls_recover_args;
@@ -269,30 +270,53 @@ static void do_ls_recovery(struct dlm_ls *ls)
 	spin_unlock(&ls->ls_recover_lock);
 
 	if (rv) {
-		error = ls_recover(ls, rv);
-		switch (error) {
-		case 0:
-			ls->ls_recovery_result = 0;
-			complete(&ls->ls_recovery_done);
-
-			dlm_lsop_recover_done(ls);
-			break;
-		case -EINTR:
-			/* if recovery was interrupted -EINTR we wait for the next
-			 * ls_recover() iteration until it hopefully succeeds.
+		do {
+			/* we try DLM_MAX_RECOVERY_RETRIES times again to run
+			 * recovery, if any -EAGAIN is not resolved this
+			 * time we will let DLM_ASSERT() fence ourself.
 			 */
-			log_rinfo(ls, "%s %llu interrupted and should be queued to run again",
-				  __func__, (unsigned long long)rv->seq);
-			break;
-		default:
-			log_rinfo(ls, "%s %llu error %d", __func__,
-				  (unsigned long long)rv->seq, error);
+			DLM_ASSERT(count < DLM_RECOVERY_MAX_RETRIES,
+				   pr_err("%s %llu too many recovery retries %d\n",
+					  __func__, (unsigned long long)rv->seq););
 
-			/* let new_lockspace() get aware of critical error */
-			ls->ls_recovery_result = error;
-			complete(&ls->ls_recovery_done);
-			break;
-		}
+			error = ls_recover(ls, rv);
+			switch (error) {
+			case 0:
+				ls->ls_recovery_result = 0;
+				complete(&ls->ls_recovery_done);
+
+				dlm_lsop_recover_done(ls);
+				break;
+			case -EINTR:
+				/* if recovery was interrupted -EINTR we wait for the next
+				 * ls_recover() iteration until it hopefully succeeds.
+				 */
+				log_rinfo(ls,
+					  "%s %llu interrupted and should be queued to run again",
+					  __func__, (unsigned long long)rv->seq);
+				break;
+			case -EAGAIN:
+				/* either API is returning -EAGAIN or some critical errors
+				 * returning -EAGAIN which let the recovery run again. There
+				 * is a schedule() between it in the hope that the error resolves
+				 * itself. If not the above DLM_ASSERT() will hit.
+				 */
+				log_rinfo(ls, "%s %llu recovery wants to run again",
+					  __func__, (unsigned long long)rv->seq);
+				schedule();
+				break;
+			default:
+				log_rinfo(ls, "%s %llu error %d", __func__,
+					  (unsigned long long)rv->seq, error);
+
+				/* let new_lockspace() get aware of critical error */
+				ls->ls_recovery_result = error;
+				complete(&ls->ls_recovery_done);
+				break;
+			}
+
+			count++;
+		} while (error == -EAGAIN);
 
 		kfree(rv->nodes);
 		kfree(rv);
-- 
2.31.1

