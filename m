Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E34435A9C83
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Sep 2022 18:05:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662048354;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mpdcGQ0GF+A0yYLLGVffsdC12t7hCV6cWDG/7dolI9U=;
	b=fpVAVHTrWvEpzj4m2rEjdo904MOTiSFJVxOFXBcONf/q/K9qe4pZwpb3p/RuoS0zIHcVLY
	6sPiGoTRLqq5d/6b6U8ez9Z55YaTTAZzPQNn26u80BKM3naUd0Ai0RgQoS0RFhsrpxFYWy
	F26Z0XJB6Z5tP2Xs+vtpSg5b67iy5+Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-mv5nNwBXP3ynQu_nluxn0g-1; Thu, 01 Sep 2022 12:05:49 -0400
X-MC-Unique: mv5nNwBXP3ynQu_nluxn0g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97F6D3C00089;
	Thu,  1 Sep 2022 16:05:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C0472166B26;
	Thu,  1 Sep 2022 16:05:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4C3F11942685;
	Thu,  1 Sep 2022 16:05:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D06581946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Sep 2022 16:05:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AEC942166B2A; Thu,  1 Sep 2022 16:05:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82F652166B26;
 Thu,  1 Sep 2022 16:05:35 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  1 Sep 2022 12:05:32 -0400
Message-Id: <20220901160532.2894491-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Cluster-devel] [PATCH] fs: dlm: fix possible use after free if
 tracing
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org, dan.carpenter@oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch fixes a possible use after free if tracing for the specific
event is enabled. To avoid the use after free we introduce a out_put
label like all other user lock specific requests and safe in a boolean
to do a put or not which depends on the execution path of
dlm_user_request().

Cc: stable@vger.kernel.org
Fixes: 7a3de7324c2b ("fs: dlm: trace user space callbacks")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index c830feb26384..94a72ede5764 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -5835,6 +5835,7 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 {
 	struct dlm_lkb *lkb;
 	struct dlm_args args;
+	bool do_put = true;
 	int error;
 
 	dlm_lock_recovery(ls);
@@ -5851,9 +5852,8 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 		ua->lksb.sb_lvbptr = kzalloc(DLM_USER_LVB_LEN, GFP_NOFS);
 		if (!ua->lksb.sb_lvbptr) {
 			kfree(ua);
-			__put_lkb(ls, lkb);
 			error = -ENOMEM;
-			goto out_trace_end;
+			goto out_put;
 		}
 	}
 #ifdef CONFIG_DLM_DEPRECATED_API
@@ -5867,8 +5867,7 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 		kfree(ua->lksb.sb_lvbptr);
 		ua->lksb.sb_lvbptr = NULL;
 		kfree(ua);
-		__put_lkb(ls, lkb);
-		goto out_trace_end;
+		goto out_put;
 	}
 
 	/* After ua is attached to lkb it will be freed by dlm_free_lkb().
@@ -5887,8 +5886,7 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 		error = 0;
 		fallthrough;
 	default:
-		__put_lkb(ls, lkb);
-		goto out_trace_end;
+		goto out_put;
 	}
 
 	/* add this new lkb to the per-process list of locks */
@@ -5896,8 +5894,11 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 	hold_lkb(lkb);
 	list_add_tail(&lkb->lkb_ownqueue, &ua->proc->locks);
 	spin_unlock(&ua->proc->locks_spin);
- out_trace_end:
+	do_put = false;
+ out_put:
 	trace_dlm_lock_end(ls, lkb, name, namelen, mode, flags, error, false);
+	if (do_put)
+		__put_lkb(ls, lkb);
  out:
 	dlm_unlock_recovery(ls);
 	return error;
-- 
2.31.1

