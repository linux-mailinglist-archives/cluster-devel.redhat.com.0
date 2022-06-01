Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B44BF53AEBB
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Jun 2022 00:45:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654123509;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yGz+rdNk/FLpMe4I1T5ANTLfU5ZKUbrdcIcj/lzlg88=;
	b=cdKYvOxFVX8T0zAufuDWqqrAo3T17hRBGGEbDh5rE9ZvEV8aM3FsJgtPNmH4hrgr8zX7eq
	gMsFaHTqF3SbuojT4BT8m/ceIJFCsC6S1gY2awa8eYNDt2ZkXnnmD2kHFo+OIDCd59nOCU
	iMcMm7FPNSOpQQ4DSSE/sZdaKW7Q8wc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-bHiB-nVwOZW-_eWfM9twcw-1; Wed, 01 Jun 2022 18:45:04 -0400
X-MC-Unique: bHiB-nVwOZW-_eWfM9twcw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04C7E2949BBD;
	Wed,  1 Jun 2022 22:45:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72E242026D64;
	Wed,  1 Jun 2022 22:45:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 03DAD1947B8F;
	Wed,  1 Jun 2022 22:45:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D85B419452D8 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  1 Jun 2022 22:44:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B877F8288A; Wed,  1 Jun 2022 22:44:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AAC082886;
 Wed,  1 Jun 2022 22:44:58 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  1 Jun 2022 18:44:52 -0400
Message-Id: <20220601224454.1640688-2-aahringo@redhat.com>
In-Reply-To: <20220601224454.1640688-1-aahringo@redhat.com>
References: <20220601224454.1640688-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCHv2 dlm/next 1/3] fs: change ast and bast
 trace order
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

