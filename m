Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A28F57B7F5
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Jul 2022 15:52:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658325165;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FnaczCSRmSgdncjM/JfK+f0GhJ+Fn4a3DxFpAcz9hWk=;
	b=W43tP7wlWb9VMOsTJw+wzIQ7AjNd58k9+0eQgKD31Cmn1Irioj5aGKOoTtZRBJLyx/zQZC
	NUmGVUXS4ayNISoD/KsgUTOVY0VQOLtz0TIMXX/8mCC2muJRyj8GPjmGZ3ZxD24+++EUHz
	0i6jOdjQ9C1zblx77TExsKME7IdInhk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-J0uagRIfOYyEVyxgNgpjlg-1; Wed, 20 Jul 2022 09:52:42 -0400
X-MC-Unique: J0uagRIfOYyEVyxgNgpjlg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D27C85A584;
	Wed, 20 Jul 2022 13:52:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42180401473;
	Wed, 20 Jul 2022 13:52:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C9757194707F;
	Wed, 20 Jul 2022 13:52:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0299A1947066 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 20 Jul 2022 13:51:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B63E4492C3B; Wed, 20 Jul 2022 13:51:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 943F2401E7B;
 Wed, 20 Jul 2022 13:51:47 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 20 Jul 2022 09:51:44 -0400
Message-Id: <20220720135144.2969104-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: handle -EBUSY as first
 for unlock
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch checks on -EBUSY for dlm_unlock() for non CANCEL or
FORCEUNLOCK case validation at first. Similar like it's done for
dlm_lock(). Although the current way looks okay we should anyway
moving the -EBUSY check at first after doing a check on -EINVAL
regarding to the lkb state. If new -EINVAL checks are added it
should be considered that some lkb fields are in a stable state
only when the lkb is in a non -EBUSY state. This patch is trying to
avoid such future mistake.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 7d5f94867e45..75313435b39d 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -2928,23 +2928,12 @@ static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 {
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
-	int rv = -EINVAL;
-
-	if (lkb->lkb_flags & DLM_IFL_MSTCPY) {
-		log_error(ls, "unlock on MSTCPY %x", lkb->lkb_id);
-		dlm_print_lkb(lkb);
-		goto out;
-	}
-
-	/* an lkb may still exist even though the lock is EOL'ed due to a
-	   cancel, unlock or failed noqueue request; an app can't use these
-	   locks; return same error as if the lkid had not been found at all */
+	int rv = -EBUSY;
 
-	if (lkb->lkb_flags & DLM_IFL_ENDOFLIFE) {
-		log_debug(ls, "unlock on ENDOFLIFE %x", lkb->lkb_id);
-		rv = -ENOENT;
+	/* normal unlock not allowed if there's any op in progress */
+	if (!(args->flags & (DLM_LKF_CANCEL | DLM_LKF_FORCEUNLOCK)) &&
+	    (lkb->lkb_wait_type || lkb->lkb_wait_count))
 		goto out;
-	}
 
 	/* an lkb may be waiting for an rsb lookup to complete where the
 	   lookup was initiated by another lock */
@@ -2959,7 +2948,24 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 			unhold_lkb(lkb); /* undoes create_lkb() */
 		}
 		/* caller changes -EBUSY to 0 for CANCEL and FORCEUNLOCK */
-		rv = -EBUSY;
+		goto out;
+	}
+
+	rv = -EINVAL;
+	if (lkb->lkb_flags & DLM_IFL_MSTCPY) {
+		log_error(ls, "unlock on MSTCPY %x", lkb->lkb_id);
+		dlm_print_lkb(lkb);
+		goto out;
+	}
+
+	/* an lkb may still exist even though the lock is EOL'ed due to a
+	 * cancel, unlock or failed noqueue request; an app can't use these
+	 * locks; return same error as if the lkid had not been found at all
+	 */
+
+	if (lkb->lkb_flags & DLM_IFL_ENDOFLIFE) {
+		log_debug(ls, "unlock on ENDOFLIFE %x", lkb->lkb_id);
+		rv = -ENOENT;
 		goto out;
 	}
 
@@ -3032,14 +3038,8 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 			goto out;
 		}
 		/* add_to_waiters() will set OVERLAP_UNLOCK */
-		goto out_ok;
 	}
 
-	/* normal unlock not allowed if there's any op in progress */
-	rv = -EBUSY;
-	if (lkb->lkb_wait_type || lkb->lkb_wait_count)
-		goto out;
-
  out_ok:
 	/* an overlapping op shouldn't blow away exflags from other op */
 	lkb->lkb_exflags |= args->flags;
-- 
2.31.1

