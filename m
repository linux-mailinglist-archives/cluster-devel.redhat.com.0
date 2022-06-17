Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF7554FE06
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Jun 2022 22:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655496052;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p1p8I6foKzjk/S/Dq6h3y7TTQ7mC4HJ0oBzsTBLcG/Y=;
	b=J8/GkMTUn+/MhcpA3GRq9kC4cVG1rbJxsrPbSfvvcrTerCqnME9EXyZgX4xFulhQS7s++n
	ylTGki6DHqN7qUIxcRv3wQBt2c7mQD/7jk7nhOTg1v0V9K5nhK4WKSV5oPpUvRkO7i9Y3W
	rzJqglXQOwhTtikMVxBxWF5pc8CsNNk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-w461D7KIMtu7D1EqUdgTwA-1; Fri, 17 Jun 2022 16:00:46 -0400
X-MC-Unique: w461D7KIMtu7D1EqUdgTwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EE3A85A580;
	Fri, 17 Jun 2022 20:00:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9913C2026985;
	Fri, 17 Jun 2022 20:00:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6D9211947065;
	Fri, 17 Jun 2022 20:00:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4D727194706C for <cluster-devel@listman.corp.redhat.com>;
 Fri, 17 Jun 2022 20:00:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2E946492CA6; Fri, 17 Jun 2022 20:00:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10A59492CA3;
 Fri, 17 Jun 2022 20:00:40 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 17 Jun 2022 16:00:34 -0400
Message-Id: <20220617200036.251778-4-aahringo@redhat.com>
In-Reply-To: <20220617200036.251778-1-aahringo@redhat.com>
References: <20220617200036.251778-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH dlm/next 3/5] fs: dlm: remove timeout from
 dlm_user_adopt_orphan
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch removes the timeout parameter from dlm_user_adopt_orphan(),
it's never been used.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 2 +-
 fs/dlm/lock.h | 2 +-
 fs/dlm/user.c | 1 -
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 080cd216a9a4..12d4cc742308 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -5886,7 +5886,7 @@ int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 
 int dlm_user_adopt_orphan(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 		     int mode, uint32_t flags, void *name, unsigned int namelen,
-		     unsigned long timeout_cs, uint32_t *lkid)
+		     uint32_t *lkid)
 {
 	struct dlm_lkb *lkb = NULL, *iter;
 	struct dlm_user_args *ua;
diff --git a/fs/dlm/lock.h b/fs/dlm/lock.h
index 252a5898f908..59089bb7c532 100644
--- a/fs/dlm/lock.h
+++ b/fs/dlm/lock.h
@@ -49,7 +49,7 @@ int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	unsigned long timeout_cs);
 int dlm_user_adopt_orphan(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	int mode, uint32_t flags, void *name, unsigned int namelen,
-	unsigned long timeout_cs, uint32_t *lkid);
+	uint32_t *lkid);
 int dlm_user_unlock(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	uint32_t flags, uint32_t lkid, char *lvb_in);
 int dlm_user_cancel(struct dlm_ls *ls,  struct dlm_user_args *ua_tmp,
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index 1060b24f18d4..4b2a24a6a15d 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -270,7 +270,6 @@ static int device_user_lock(struct dlm_user_proc *proc,
 		error = dlm_user_adopt_orphan(ls, ua,
 					 params->mode, params->flags,
 					 params->name, params->namelen,
-					 (unsigned long) params->timeout,
 					 &lkid);
 		if (!error)
 			error = lkid;
-- 
2.31.1

