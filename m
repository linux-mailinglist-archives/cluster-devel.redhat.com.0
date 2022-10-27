Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5571F610318
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Oct 2022 22:46:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666903568;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Hau1SFTGF4pEdurjiXVTRJOB8Smr5PeFcWcedE7Mm74=;
	b=NIRt04bv5irhXRcUO6lVetpVp8qcdxtvAjTv2vwv+nNu/yArdoyCdBp5/mIbZVWvsFi8Ju
	FmkTeA7pT3Z3L7CuVkTjf7LjQ1Tqiv8VQx1u+nsZnJBvAu7rQ4iyH2IEXbLR+JPvlhHR+M
	GliIgAuuSXXdyXWlfuTkz7dnstf3SG0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-dsXTLcr8NpyfPgEppW0bNA-1; Thu, 27 Oct 2022 16:46:06 -0400
X-MC-Unique: dsXTLcr8NpyfPgEppW0bNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76EE587A9F3;
	Thu, 27 Oct 2022 20:45:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41CFEC15BA8;
	Thu, 27 Oct 2022 20:45:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EA6491946A40;
	Thu, 27 Oct 2022 20:45:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 33A561946A7F for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 20:45:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2153F112C088; Thu, 27 Oct 2022 20:45:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0EF31121325;
 Thu, 27 Oct 2022 20:45:36 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Oct 2022 16:45:20 -0400
Message-Id: <20221027204528.1119036-10-aahringo@redhat.com>
In-Reply-To: <20221027204528.1119036-1-aahringo@redhat.com>
References: <20221027204528.1119036-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v6.1-rc1 10/18] fs: dlm: move last cast bast
 time to function call
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

This patch moves the debugging information of the last cast and bast
time when calling the last and bast function call.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 3e76ec75bc55..8393d2090c1c 100644
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

