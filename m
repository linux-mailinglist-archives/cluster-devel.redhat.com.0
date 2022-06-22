Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3CF55536B
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Jun 2022 20:46:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655923582;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7YYCH9Fen/gKtRUotSHmYhP9zctNtJfbHrGdwbVzhqc=;
	b=VH/ZYhug7kIy7LONlQv7nGU8BVGAz1wjbpSDnA4HLv0Ov2t2v+kgSbJ38ZDFpEWBH5zp02
	LalKLGBdZftvMumCzAHnBXObGcRCOLQlbtmileq/vRgtuJ2akTDce3Ql4yOSO1/WYsbA/x
	0asSM9lSSlAeV0SNvDdpZbfmBl8uXbs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-hHjs-1T4MAmXG3_s0EHZRg-1; Wed, 22 Jun 2022 14:46:18 -0400
X-MC-Unique: hHjs-1T4MAmXG3_s0EHZRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED954383328F;
	Wed, 22 Jun 2022 18:46:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D9E21121314;
	Wed, 22 Jun 2022 18:46:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0442C1947057;
	Wed, 22 Jun 2022 18:46:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CB8421947051 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 22 Jun 2022 18:45:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AEE6B40CFD0D; Wed, 22 Jun 2022 18:45:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9176840CFD0A;
 Wed, 22 Jun 2022 18:45:28 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 22 Jun 2022 14:45:17 -0400
Message-Id: <20220622184523.1886869-15-aahringo@redhat.com>
In-Reply-To: <20220622184523.1886869-1-aahringo@redhat.com>
References: <20220622184523.1886869-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Cluster-devel] [PATCH RESEND v5.19-rc3 14/20] fs: dlm: handle
 recovery -EAGAIN case as retry
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
 fs/dlm/recoverd.c | 71 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 23 deletions(-)

diff --git a/fs/dlm/recoverd.c b/fs/dlm/recoverd.c
index 90e8b7f440da..2bd3bbe53828 100644
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
@@ -269,30 +270,54 @@ static void do_ls_recovery(struct dlm_ls *ls)
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
+					  __func__, (unsigned long long)rv->seq,
+					  DLM_RECOVERY_MAX_RETRIES););
+
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
 
-			/* let new_lockspace() get aware of critical error */
-			ls->ls_recovery_result = error;
-			complete(&ls->ls_recovery_done);
-			break;
-		}
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

