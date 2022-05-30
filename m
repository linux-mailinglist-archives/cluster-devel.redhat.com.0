Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B40B25383C5
	for <lists+cluster-devel@lfdr.de>; Mon, 30 May 2022 16:55:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653922550;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yGz+rdNk/FLpMe4I1T5ANTLfU5ZKUbrdcIcj/lzlg88=;
	b=RAW0dIE4oO5bi68Amczn6AbVLo/9GTdNiG6Fi7zUnV2yCJkROij9ETH+vYqHJk7TCf+mHz
	lSoIliS367qhadcsntqLPwiow2NIKzDD+xPmFFctX27z70YNJb5+IRjsnZfbt9GZOJT9sO
	vTIgiSuKy9EI8xz164cTom0mEh0tzVU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-RLu-rkoIP8a2YlJtpu8wQA-1; Mon, 30 May 2022 10:55:44 -0400
X-MC-Unique: RLu-rkoIP8a2YlJtpu8wQA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14E633C0E766;
	Mon, 30 May 2022 14:55:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D2AB40EC002;
	Mon, 30 May 2022 14:55:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C45101947051;
	Mon, 30 May 2022 14:55:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DE69119466DF for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 May 2022 14:55:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C700A40EC005; Mon, 30 May 2022 14:55:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A99A940EC002;
 Mon, 30 May 2022 14:55:39 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 30 May 2022 10:55:26 -0400
Message-Id: <20220530145528.1264681-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm/next 1/3] fs: change ast and bast trace
 order
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch changes the order to call trace functionality before calling
the traced callback. The intention is always to see at first that a dlm
callback occurred and then optionally see dlm user traces in the ast or
bast callback. Currently the behaviour is vice versa, the user sees that
dlm ast or bast callback occurred after the dlm user callback for ast or
bast was called.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index bfac462dd3e8..df25c3e785cf 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -255,13 +255,13 @@ void dlm_callback_work(struct work_struct *work)
 		if (callbacks[i].flags & DLM_CB_SKIP) {
 			continue;
 		} else if (callbacks[i].flags & DLM_CB_BAST) {
-			bastfn(lkb->lkb_astparam, callbacks[i].mode);
 			trace_dlm_bast(ls, lkb, callbacks[i].mode);
+			bastfn(lkb->lkb_astparam, callbacks[i].mode);
 		} else if (callbacks[i].flags & DLM_CB_CAST) {
 			lkb->lkb_lksb->sb_status = callbacks[i].sb_status;
 			lkb->lkb_lksb->sb_flags = callbacks[i].sb_flags;
-			castfn(lkb->lkb_astparam);
 			trace_dlm_ast(ls, lkb, lkb->lkb_lksb);
+			castfn(lkb->lkb_astparam);
 		}
 	}
 
-- 
2.31.1

