Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C61F62E7DF
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Nov 2022 23:12:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668723136;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b5d9A1rjPXfC6w5KVeXNodrqt4Wu4rDV4L9wscJiNQY=;
	b=EYKfAqrgwL0Wl2YEvuQivKIoipYzpYU6BsJ/wu/UJjwmZkIY8Bx6gzvQe4mVwfOHG/mXw+
	ZUVz48FKQueQsIVfW4j2QYrXFEJ5oLKWrVUgBZWtSZylnb/awZZxYzKye9HKetaB6slyyI
	iYWZYIBUNSwpzfQ8bXIK8gCRg1qRbZo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-tH0iVmtKMI64bLUmzsP9Fg-1; Thu, 17 Nov 2022 17:12:14 -0500
X-MC-Unique: tH0iVmtKMI64bLUmzsP9Fg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3056B806003;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D76F40C83EB;
	Thu, 17 Nov 2022 22:12:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9130219465B8;
	Thu, 17 Nov 2022 22:12:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 346DE19465A3 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 22:12:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 264582166B49; Thu, 17 Nov 2022 22:12:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02A852166B47;
 Thu, 17 Nov 2022 22:12:07 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Nov 2022 17:11:42 -0500
Message-Id: <20221117221157.2396743-3-aahringo@redhat.com>
In-Reply-To: <20221117221157.2396743-1-aahringo@redhat.com>
References: <20221117221157.2396743-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 03/18] fs: dlm: ast do
 WARN_ON_ONCE() on hotpath
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch changes the ast hotpath functionality in very unlikely cases
that we do WARN_ON_ONCE() instead of WARN_ON() to not spamming the
console output if we run into states that it would occur over and over
again.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c  | 6 +++---
 fs/dlm/user.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 982d093b80cd..7dd072b8ea38 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -161,12 +161,12 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
 		spin_unlock(&ls->ls_cb_lock);
 		break;
 	case DLM_ENQUEUE_CALLBACK_FAILURE:
-		WARN_ON(1);
+		WARN_ON_ONCE(1);
 		break;
 	case DLM_ENQUEUE_CALLBACK_SUCCESS:
 		break;
 	default:
-		WARN_ON(1);
+		WARN_ON_ONCE(1);
 		break;
 	}
 	spin_unlock(&lkb->lkb_cb_lock);
@@ -185,7 +185,7 @@ void dlm_callback_work(struct work_struct *work)
 	rv = dlm_dequeue_lkb_callback(lkb, &cb);
 	spin_unlock(&lkb->lkb_cb_lock);
 
-	if (WARN_ON(rv == DLM_DEQUEUE_CALLBACK_EMPTY))
+	if (WARN_ON_ONCE(rv == DLM_DEQUEUE_CALLBACK_EMPTY))
 		goto out;
 
 	for (;;) {
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index 6b530db4bc0b..edf722d6935a 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -214,7 +214,7 @@ void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
 	switch (rv) {
 	case DLM_ENQUEUE_CALLBACK_FAILURE:
 		spin_unlock(&proc->asts_spin);
-		WARN_ON(1);
+		WARN_ON_ONCE(1);
 		goto out;
 	case DLM_ENQUEUE_CALLBACK_NEED_SCHED:
 		kref_get(&lkb->lkb_ref);
@@ -224,7 +224,7 @@ void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
 	case DLM_ENQUEUE_CALLBACK_SUCCESS:
 		break;
 	default:
-		WARN_ON(1);
+		WARN_ON_ONCE(1);
 		break;
 	}
 	spin_unlock(&proc->asts_spin);
@@ -880,7 +880,7 @@ static ssize_t device_read(struct file *file, char __user *buf, size_t count,
 		spin_unlock(&proc->asts_spin);
 		/* removes ref for proc->asts, may cause lkb to be freed */
 		dlm_put_lkb(lkb);
-		WARN_ON(1);
+		WARN_ON_ONCE(1);
 		goto try_another;
 	case DLM_DEQUEUE_CALLBACK_LAST:
 		list_del_init(&lkb->lkb_cb_list);
@@ -890,7 +890,7 @@ static ssize_t device_read(struct file *file, char __user *buf, size_t count,
 	case DLM_DEQUEUE_CALLBACK_SUCCESS:
 		break;
 	default:
-		WARN_ON(1);
+		WARN_ON_ONCE(1);
 		break;
 	}
 	spin_unlock(&proc->asts_spin);
-- 
2.31.1

