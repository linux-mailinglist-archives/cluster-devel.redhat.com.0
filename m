Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 88421555376
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Jun 2022 20:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655923630;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kpte2VlOvhAHDQ3nJ9lC0zY7WWNKOMMxXwB60ZzsxWE=;
	b=B+H8p+VhqgGyEx2bLF91ei71oN0OjkfNBUJr7foEPKwlGChDU+mv2gGQAZnVS/1dIGSGjg
	kqKaZT9MnVW1ZFnLfK+5XLq7/sFs7C4yuI0vvF/GEJ+NcgPLZxQr8gLpIkflTRQfSxWAEw
	CE86+Si4uN0B7/63lSlmka4k3roW+ZA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-_09WRoZbMz-hhboDOLjeKA-1; Wed, 22 Jun 2022 14:47:09 -0400
X-MC-Unique: _09WRoZbMz-hhboDOLjeKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7938B3C41661;
	Wed, 22 Jun 2022 18:47:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C8429D63;
	Wed, 22 Jun 2022 18:47:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 17C22194706A;
	Wed, 22 Jun 2022 18:47:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 971101947051 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 22 Jun 2022 18:45:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 887F240CFD0D; Wed, 22 Jun 2022 18:45:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AD1440CFD0A;
 Wed, 22 Jun 2022 18:45:28 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 22 Jun 2022 14:45:16 -0400
Message-Id: <20220622184523.1886869-14-aahringo@redhat.com>
In-Reply-To: <20220622184523.1886869-1-aahringo@redhat.com>
References: <20220622184523.1886869-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Cluster-devel] [PATCH RESEND v5.19-rc3 13/20] fs: dlm: handle
 recovery result outside of ls_recover
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

This patch cleanups the recovery result handling by moving it outside of
ls_recover() to the caller function do_ls_recovery(). This way it's
clear how we react to recovery if it's successful or delivers different
error codes.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/recoverd.c | 42 ++++++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/fs/dlm/recoverd.c b/fs/dlm/recoverd.c
index 98c17f74927f..90e8b7f440da 100644
--- a/fs/dlm/recoverd.c
+++ b/fs/dlm/recoverd.c
@@ -243,27 +243,12 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 		  jiffies_to_msecs(jiffies - start));
 	mutex_unlock(&ls->ls_recoverd_active);
 
-	ls->ls_recovery_result = 0;
-	complete(&ls->ls_recovery_done);
-
-	dlm_lsop_recover_done(ls);
 	return 0;
 
  fail:
 	dlm_release_root_list(ls);
-	log_rinfo(ls, "dlm_recover %llu error %d",
-		  (unsigned long long)rv->seq, error);
 	mutex_unlock(&ls->ls_recoverd_active);
 
-	/* let new_lockspace() get aware of critical error if recovery
-	 * was interrupted -EINTR we wait for the next ls_recover()
-	 * iteration until it succeeds.
-	 */
-	if (error != -EINTR) {
-		ls->ls_recovery_result = error;
-		complete(&ls->ls_recovery_done);
-	}
-
 	return error;
 }
 
@@ -274,6 +259,7 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 static void do_ls_recovery(struct dlm_ls *ls)
 {
 	struct dlm_recover *rv = NULL;
+	int error;
 
 	spin_lock(&ls->ls_recover_lock);
 	rv = ls->ls_recover_args;
@@ -283,7 +269,31 @@ static void do_ls_recovery(struct dlm_ls *ls)
 	spin_unlock(&ls->ls_recover_lock);
 
 	if (rv) {
-		ls_recover(ls, rv);
+		error = ls_recover(ls, rv);
+		switch (error) {
+		case 0:
+			ls->ls_recovery_result = 0;
+			complete(&ls->ls_recovery_done);
+
+			dlm_lsop_recover_done(ls);
+			break;
+		case -EINTR:
+			/* if recovery was interrupted -EINTR we wait for the next
+			 * ls_recover() iteration until it hopefully succeeds.
+			 */
+			log_rinfo(ls, "%s %llu interrupted and should be queued to run again",
+				  __func__, (unsigned long long)rv->seq);
+			break;
+		default:
+			log_rinfo(ls, "%s %llu error %d", __func__,
+				  (unsigned long long)rv->seq, error);
+
+			/* let new_lockspace() get aware of critical error */
+			ls->ls_recovery_result = error;
+			complete(&ls->ls_recovery_done);
+			break;
+		}
+
 		kfree(rv->nodes);
 		kfree(rv);
 	}
-- 
2.31.1

