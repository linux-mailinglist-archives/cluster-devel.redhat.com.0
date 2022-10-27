Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E35F161030F
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Oct 2022 22:46:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666903562;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K97pl36lIdmw2DMImoRNDbDA75jcZenDEwN3AMYG1xw=;
	b=a2bnjuu+8uC0fHh3KpYwWrBEaiV4ogTuunKWRuLizoJwnrlUEnGPwk1UNywqRUJmxtSS/J
	t1jLoBBPFroUT7esB5t30OAhTkSzTNdlzbLc+h3Omx0H5GN313Z8dmn4YBnszAqov5l/8y
	5H8DRFNS0E/lltFhJ9oDZmv7glOTi/M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-DCyN5SvZOfKS76tiemN0BQ-1; Thu, 27 Oct 2022 16:45:53 -0400
X-MC-Unique: DCyN5SvZOfKS76tiemN0BQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 989803C0F446;
	Thu, 27 Oct 2022 20:45:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D3C8422A9;
	Thu, 27 Oct 2022 20:45:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 45A5619465A4;
	Thu, 27 Oct 2022 20:45:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 341F1194704E for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 20:45:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6EFED112C07B; Thu, 27 Oct 2022 20:45:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 469CC1121325;
 Thu, 27 Oct 2022 20:45:36 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Oct 2022 16:45:16 -0400
Message-Id: <20221027204528.1119036-6-aahringo@redhat.com>
In-Reply-To: <20221027204528.1119036-1-aahringo@redhat.com>
References: <20221027204528.1119036-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v6.1-rc1 06/18] fs: dlm: let dlm_add_cb
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

