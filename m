Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 259BF715100
	for <lists+cluster-devel@lfdr.de>; Mon, 29 May 2023 23:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685396689;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EaalMx5t9L/479ORaQaZNvDA8YmlHp0+0hNnc67s3Xg=;
	b=Lv7SKuL3AHab9lXDv9bV441vIpr2lnCe2AiMqg2YgA6ggoXsmQjFbAes2SS9m15K1xxHvI
	JMbdR29CxE5NX7rDnRzZrn41zu3f4eMdgebHrJxt0u9z+POMYiXK1XX5K3WEq9KoKtlrRk
	y1SXQaCRneDJqxuy9KR7iho4E6EaEtQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-B7GVAeyCNKKwpv21gpBJhQ-1; Mon, 29 May 2023 17:44:46 -0400
X-MC-Unique: B7GVAeyCNKKwpv21gpBJhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AB14811E78;
	Mon, 29 May 2023 21:44:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A662140D1B61;
	Mon, 29 May 2023 21:44:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A10F219465BB;
	Mon, 29 May 2023 21:44:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3045A194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 29 May 2023 21:44:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 23F802166B2E; Mon, 29 May 2023 21:44:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE82F2166B2B;
 Mon, 29 May 2023 21:44:41 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 29 May 2023 17:44:30 -0400
Message-Id: <20230529214440.2542721-2-aahringo@redhat.com>
In-Reply-To: <20230529214440.2542721-1-aahringo@redhat.com>
References: <20230529214440.2542721-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 02/12] fs: dlm: clear pending bit
 when queue was empty
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch clears the DLM_IFL_CB_PENDING_BIT flag which will be set when
there is callback work queued when there was no callback to dequeue. It
is a buggy case and should never happen, that's why there is a
WARN_ON(). However if the case happens we are prepared to somehow
recover from it.

Cc: stable@vger.kernel.org
Fixes: 61bed0baa4db ("fs: dlm: use a non-static queue for callbacks")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 700ff2e0515a..ff0ef4653535 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -181,10 +181,12 @@ void dlm_callback_work(struct work_struct *work)
 
 	spin_lock(&lkb->lkb_cb_lock);
 	rv = dlm_dequeue_lkb_callback(lkb, &cb);
-	spin_unlock(&lkb->lkb_cb_lock);
-
-	if (WARN_ON_ONCE(rv == DLM_DEQUEUE_CALLBACK_EMPTY))
+	if (WARN_ON_ONCE(rv == DLM_DEQUEUE_CALLBACK_EMPTY)) {
+		clear_bit(DLM_IFL_CB_PENDING_BIT, &lkb->lkb_iflags);
+		spin_unlock(&lkb->lkb_cb_lock);
 		goto out;
+	}
+	spin_unlock(&lkb->lkb_cb_lock);
 
 	for (;;) {
 		castfn = lkb->lkb_astfn;
-- 
2.31.1

