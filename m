Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E27DB5BB257
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Sep 2022 20:43:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663353814;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q6DkrpuZ31Ea7E7r/I31cR/ydeta1ASOvH42EwOjg58=;
	b=Ob2vQE4oeSpZa9+0uCrkBt/V1Uq8T6UT2vz9RZADlCk7OMuqLO8eLOjVyiQ/np30mGAIur
	nw2N4h4Z7i3aF32Lzy/X9haTYEPrkViLtj0gEfn26ZSxOu4HnIgnrN7T3FTc1/AvSXQPrD
	t09m3NSZSqSciR7LuuWxgqBonmlOOiQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-0gvVAIsDP0q-lz-JVGwYCQ-1; Fri, 16 Sep 2022 14:43:31 -0400
X-MC-Unique: 0gvVAIsDP0q-lz-JVGwYCQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1F568027EA;
	Fri, 16 Sep 2022 18:43:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE32C492B05;
	Fri, 16 Sep 2022 18:43:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 26AF91946A6D;
	Fri, 16 Sep 2022 18:43:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 781581946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 16 Sep 2022 18:43:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5DC7B2166B2D; Fri, 16 Sep 2022 18:43:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B6B42166B26;
 Fri, 16 Sep 2022 18:43:27 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 16 Sep 2022 14:43:08 -0400
Message-Id: <20220916184309.3179451-5-aahringo@redhat.com>
In-Reply-To: <20220916184309.3179451-1-aahringo@redhat.com>
References: <20220916184309.3179451-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH/RFC dlm/next 5/6] fs: dlm: move last cast
 bast time to function call
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch moves the debugging information of the last cast and bast
time when calling the last and bast function call.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 314ce5c7cd66..c3fc4551e9c4 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -158,15 +158,11 @@ int dlm_rem_lkb_callback(struct dlm_ls *ls, struct dlm_lkb *lkb,
 		}
 	}
 
-	if (cb->flags & DLM_CB_CAST) {
+	if (cb->flags & DLM_CB_CAST)
 		memcpy(&lkb->lkb_last_cast, cb, sizeof(struct dlm_callback));
-		lkb->lkb_last_cast_time = ktime_get();
-	}
 
-	if (cb->flags & DLM_CB_BAST) {
+	if (cb->flags & DLM_CB_BAST)
 		memcpy(&lkb->lkb_last_bast, cb, sizeof(struct dlm_callback));
-		lkb->lkb_last_bast_time = ktime_get();
-	}
 	rv = 0;
  out:
 	return rv;
@@ -256,11 +252,13 @@ void dlm_callback_work(struct work_struct *work)
 			continue;
 		} else if (callbacks[i].flags & DLM_CB_BAST) {
 			trace_dlm_bast(ls, lkb, callbacks[i].mode);
+			lkb->lkb_last_bast_time = ktime_get();
 			bastfn(lkb->lkb_astparam, callbacks[i].mode);
 		} else if (callbacks[i].flags & DLM_CB_CAST) {
 			lkb->lkb_lksb->sb_status = callbacks[i].sb_status;
 			lkb->lkb_lksb->sb_flags = callbacks[i].sb_flags;
 			trace_dlm_ast(ls, lkb);
+			lkb->lkb_last_cast_time = ktime_get();
 			castfn(lkb->lkb_astparam);
 		}
 	}
-- 
2.31.1

