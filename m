Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B46957AB95
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Jul 2022 03:15:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658279700;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=55yHQ44rkH6DdWsZLM6+Nkqv8+VaygTgHAkn6qqUXbI=;
	b=G+wpM4Gzc2aJpKYskzOiQQTGGLWCN8uAQu0w6yLdVXZTbXekDjIQtyQRXnF0/NvB2anLF/
	PeX28U1l77NKUYPokaCfNXCR1ak2+OjLSuamc4mcsderlAr+bwwGGy6e60R0sBqhA5vIvR
	DetbTUW3Js43uz0OPb1+ntxDSF0l0r4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-By9M2cHeMwGRxjIKC1x4_A-1; Tue, 19 Jul 2022 21:14:55 -0400
X-MC-Unique: By9M2cHeMwGRxjIKC1x4_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2084B801231;
	Wed, 20 Jul 2022 01:14:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0FB61415121;
	Wed, 20 Jul 2022 01:14:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 95875194707F;
	Wed, 20 Jul 2022 01:14:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F04AE1945DA7 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 20 Jul 2022 01:14:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C200640D016A; Wed, 20 Jul 2022 01:14:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E73640D0160;
 Wed, 20 Jul 2022 01:14:50 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 19 Jul 2022 21:14:45 -0400
Message-Id: <20220720011445.2928575-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Cluster-devel] [PATCH dlm/next ] fs: dlm: handle -EBUSY as first
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In case of lock args validation we should at first check on -EBUSY then
on -EINVAL. The -EINVAL conditions checks against lkb state variables
which are not stable in case something is in -EBUSY lkb condition state
e.g. lkb->lkb_grmode. This patch checks at first if -EBUSY condition is
not met, then it's will check on -EINVAL condition.

Cc: stable@vger.kernel.org
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index dac7eb75dba9..c23413da40f5 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -2864,17 +2864,9 @@ static int set_unlock_args(uint32_t flags, void *astarg, struct dlm_args *args)
 static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 			      struct dlm_args *args)
 {
-	int rv = -EINVAL;
+	int rv = -EBUSY;
 
 	if (args->flags & DLM_LKF_CONVERT) {
-		if (lkb->lkb_flags & DLM_IFL_MSTCPY)
-			goto out;
-
-		if (args->flags & DLM_LKF_QUECVT &&
-		    !__quecvt_compat_matrix[lkb->lkb_grmode+1][args->mode+1])
-			goto out;
-
-		rv = -EBUSY;
 		if (lkb->lkb_status != DLM_LKSTS_GRANTED)
 			goto out;
 
@@ -2884,6 +2876,14 @@ static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 
 		if (is_overlap(lkb))
 			goto out;
+
+		rv = -EINVAL;
+		if (lkb->lkb_flags & DLM_IFL_MSTCPY)
+			goto out;
+
+		if (args->flags & DLM_LKF_QUECVT &&
+		    !__quecvt_compat_matrix[lkb->lkb_grmode+1][args->mode+1])
+			goto out;
 	}
 
 	lkb->lkb_exflags = args->flags;
-- 
2.31.1

