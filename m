Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F1D5383C4
	for <lists+cluster-devel@lfdr.de>; Mon, 30 May 2022 16:55:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653922548;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AnJxEMKyxaGmkU+MKKGbEi6kIaddS3qAQVEbawTHBIo=;
	b=JbUGJD4zXhWMuse3p6jFvqDmPKonfb5tQ04MifULI7Bjk4skxLHcG3eVydZr7n6KKGaDeF
	qBme24KDl1iyhRIcxWJepw44JpJYgYIo9yLnovdXIUqUsLK9fVwecpzv+Iejxc6WVNd+9Z
	TDCIxY0EnUaQ+vruFGZFBKkOgsEHPoo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-F11_10I1Ma66tBVjpOjtvA-1; Mon, 30 May 2022 10:55:45 -0400
X-MC-Unique: F11_10I1Ma66tBVjpOjtvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14EA63801158;
	Mon, 30 May 2022 14:55:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A28B82026D64;
	Mon, 30 May 2022 14:55:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DC8C81947058;
	Mon, 30 May 2022 14:55:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 26BBD19466DF for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 May 2022 14:55:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EBCC940EC003; Mon, 30 May 2022 14:55:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF6E540EC002;
 Mon, 30 May 2022 14:55:39 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 30 May 2022 10:55:27 -0400
Message-Id: <20220530145528.1264681-2-aahringo@redhat.com>
In-Reply-To: <20220530145528.1264681-1-aahringo@redhat.com>
References: <20220530145528.1264681-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm/next 2/3] fs: remove additional
 dereference of lkbsb
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

This patch removes a dereference of lkbsb of lkb when calling ast
tracepoint. First it reduces additional overhead, even if traces are not
acitivated. Second we can deference it in TP_fast_assign over the
already passed lkb parameter.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c               | 2 +-
 include/trace/events/dlm.h | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index df25c3e785cf..19ef136f9e4f 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -260,7 +260,7 @@ void dlm_callback_work(struct work_struct *work)
 		} else if (callbacks[i].flags & DLM_CB_CAST) {
 			lkb->lkb_lksb->sb_status = callbacks[i].sb_status;
 			lkb->lkb_lksb->sb_flags = callbacks[i].sb_flags;
-			trace_dlm_ast(ls, lkb, lkb->lkb_lksb);
+			trace_dlm_ast(ls, lkb);
 			castfn(lkb->lkb_astparam);
 		}
 	}
diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
index 32088c603244..e333176ecfaf 100644
--- a/include/trace/events/dlm.h
+++ b/include/trace/events/dlm.h
@@ -138,9 +138,9 @@ TRACE_EVENT(dlm_bast,
 
 TRACE_EVENT(dlm_ast,
 
-	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, struct dlm_lksb *lksb),
+	TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb),
 
-	TP_ARGS(ls, lkb, lksb),
+	TP_ARGS(ls, lkb),
 
 	TP_STRUCT__entry(
 		__field(__u32, ls_id)
@@ -152,8 +152,8 @@ TRACE_EVENT(dlm_ast,
 	TP_fast_assign(
 		__entry->ls_id = ls->ls_global_id;
 		__entry->lkb_id = lkb->lkb_id;
-		__entry->sb_flags = lksb->sb_flags;
-		__entry->sb_status = lksb->sb_status;
+		__entry->sb_flags = lkb->lkb_lksb->sb_flags;
+		__entry->sb_status = lkb->lkb_lksb->sb_status;
 	),
 
 	TP_printk("ls_id=%u lkb_id=%x sb_flags=%s sb_status=%d",
-- 
2.31.1

