Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB62E715105
	for <lists+cluster-devel@lfdr.de>; Mon, 29 May 2023 23:44:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685396691;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kz9rMCVMS9Ex9oATSXlfrtAWzb4IMWhldZT8mcvtTrA=;
	b=M/OmWvXbMK4QE2OMGw5JxEWkGMiqzrVrupLmVpitPBmxireGezu0qMnAHNRhHy1zxub4OB
	PhDDRlYXP3UyA2Dh+u3x6aZ2SaBd1Ph0a1g0bokAzF/e5KuFHNyDkfKnj6GW0it8w7Pl1V
	I5OL2b063seGjs95vE/EgJ8efjVV3no=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-i_hFkcjbMR-7jTaYewACUw-1; Mon, 29 May 2023 17:44:46 -0400
X-MC-Unique: i_hFkcjbMR-7jTaYewACUw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C399811E7F;
	Mon, 29 May 2023 21:44:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFFB3C154D2;
	Mon, 29 May 2023 21:44:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A9B9E1946A41;
	Mon, 29 May 2023 21:44:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 37C73194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 29 May 2023 21:44:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1D63E2166B2F; Mon, 29 May 2023 21:44:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E69082166B2B;
 Mon, 29 May 2023 21:44:42 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 29 May 2023 17:44:35 -0400
Message-Id: <20230529214440.2542721-7-aahringo@redhat.com>
In-Reply-To: <20230529214440.2542721-1-aahringo@redhat.com>
References: <20230529214440.2542721-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 07/12] fs: dlm: move
 dlm_purge_lkb_callbacks to user module
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch moves the dlm_purge_lkb_callbacks() function from ast to user
dlm module as it is only a function being used by dlm user
implementation. I got be hinted to hold specific locks regarding the
callback handling for dlm_purge_lkb_callbacks() but it was false
positive. It is confusing because ast dlm implementation uses a
different locking behaviour as user locks uses as DLM handles kernel and
user dlm locks differently. To avoid the confusing we move this function
to dlm user implementation.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c  | 17 -----------------
 fs/dlm/ast.h  |  1 -
 fs/dlm/user.c | 18 ++++++++++++++++++
 fs/dlm/user.h |  1 +
 4 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index ff0ef4653535..1f2f70a1b824 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -36,23 +36,6 @@ void dlm_callback_set_last_ptr(struct dlm_callback **from,
 	*from = to;
 }
 
-void dlm_purge_lkb_callbacks(struct dlm_lkb *lkb)
-{
-	struct dlm_callback *cb, *safe;
-
-	list_for_each_entry_safe(cb, safe, &lkb->lkb_callbacks, list) {
-		list_del(&cb->list);
-		kref_put(&cb->ref, dlm_release_callback);
-	}
-
-	clear_bit(DLM_IFL_CB_PENDING_BIT, &lkb->lkb_iflags);
-
-	/* invalidate */
-	dlm_callback_set_last_ptr(&lkb->lkb_last_cast, NULL);
-	dlm_callback_set_last_ptr(&lkb->lkb_last_cb, NULL);
-	lkb->lkb_last_bast_mode = -1;
-}
-
 int dlm_enqueue_lkb_callback(struct dlm_lkb *lkb, uint32_t flags, int mode,
 			     int status, uint32_t sbflags)
 {
diff --git a/fs/dlm/ast.h b/fs/dlm/ast.h
index 880b11882495..ce007892dc2d 100644
--- a/fs/dlm/ast.h
+++ b/fs/dlm/ast.h
@@ -26,7 +26,6 @@ void dlm_callback_set_last_ptr(struct dlm_callback **from,
 			       struct dlm_callback *to);
 
 void dlm_release_callback(struct kref *ref);
-void dlm_purge_lkb_callbacks(struct dlm_lkb *lkb);
 void dlm_callback_work(struct work_struct *work);
 int dlm_callback_start(struct dlm_ls *ls);
 void dlm_callback_stop(struct dlm_ls *ls);
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index d9c09fc0aba1..695e691b38b3 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -145,6 +145,24 @@ static void compat_output(struct dlm_lock_result *res,
 }
 #endif
 
+/* should held proc->asts_spin lock */
+void dlm_purge_lkb_callbacks(struct dlm_lkb *lkb)
+{
+	struct dlm_callback *cb, *safe;
+
+	list_for_each_entry_safe(cb, safe, &lkb->lkb_callbacks, list) {
+		list_del(&cb->list);
+		kref_put(&cb->ref, dlm_release_callback);
+	}
+
+	clear_bit(DLM_IFL_CB_PENDING_BIT, &lkb->lkb_iflags);
+
+	/* invalidate */
+	dlm_callback_set_last_ptr(&lkb->lkb_last_cast, NULL);
+	dlm_callback_set_last_ptr(&lkb->lkb_last_cb, NULL);
+	lkb->lkb_last_bast_mode = -1;
+}
+
 /* Figure out if this lock is at the end of its life and no longer
    available for the application to use.  The lkb still exists until
    the final ast is read.  A lock becomes EOL in three situations:
diff --git a/fs/dlm/user.h b/fs/dlm/user.h
index 33059452d79e..2caf8e6e24d5 100644
--- a/fs/dlm/user.h
+++ b/fs/dlm/user.h
@@ -6,6 +6,7 @@
 #ifndef __USER_DOT_H__
 #define __USER_DOT_H__
 
+void dlm_purge_lkb_callbacks(struct dlm_lkb *lkb);
 void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
 		      int status, uint32_t sbflags);
 int dlm_user_init(void);
-- 
2.31.1

