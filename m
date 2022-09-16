Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEC65BB259
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Sep 2022 20:43:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663353814;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K97pl36lIdmw2DMImoRNDbDA75jcZenDEwN3AMYG1xw=;
	b=Bt4+Tyrf82BKz+8qhAmo5icG3rggw/shHHYtqyZOrhMqgGRRAjTpxOOtFhAIBvHQDObd8k
	rWDCsav1TBgSoT6SgfaA1SJV5z3ivTgls+iX9ZU1OWkEBUW4BaGU7++SpvZ0MRXGZpC864
	F2Ypqk4GdfYdCsnE8uu+4xyEeEGU+jo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-Xox2n8rmOd-nYMGcVNFTtg-1; Fri, 16 Sep 2022 14:43:31 -0400
X-MC-Unique: Xox2n8rmOd-nYMGcVNFTtg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1C3B80206D;
	Fri, 16 Sep 2022 18:43:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2FDCC15BA5;
	Fri, 16 Sep 2022 18:43:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1E13219465B9;
	Fri, 16 Sep 2022 18:43:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BAB5B1946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 16 Sep 2022 18:43:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 98A882166B2A; Fri, 16 Sep 2022 18:43:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E9B62166B26;
 Fri, 16 Sep 2022 18:43:26 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 16 Sep 2022 14:43:04 -0400
Message-Id: <20220916184309.3179451-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH/RFC dlm/next 1/6] fs: dlm: let dlm_add_cb
 queue work after resume only
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

We should allow dlm_add_cb() to call queue_work() only after the
recovery queued pending for delayed lkbs. This patch will move the
switch LSFL_CB_DELAY after the delayed lkb work was processed.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index d60a8d8f109d..6e07c151ad28 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -308,8 +308,6 @@ void dlm_callback_resume(struct dlm_ls *ls)
 	if (!ls->ls_callback_wq)
 		return;
 
-	clear_bit(LSFL_CB_DELAY, &ls->ls_flags);
-
 more:
 	mutex_lock(&ls->ls_cb_mutex);
 	list_for_each_entry_safe(lkb, safe, &ls->ls_cb_delay, lkb_cb_list) {
@@ -320,6 +318,8 @@ void dlm_callback_resume(struct dlm_ls *ls)
 			break;
 	}
 	empty = list_empty(&ls->ls_cb_delay);
+	if (empty)
+		clear_bit(LSFL_CB_DELAY, &ls->ls_flags);
 	mutex_unlock(&ls->ls_cb_mutex);
 
 	sum += count;
-- 
2.31.1

