Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A21C162E7ED
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Nov 2022 23:12:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668723140;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RL4GJqfX91xxGjG3MDXU9Fn4kki/Uz2De/m7PJaNqJc=;
	b=dDSixBU4S3WjCKFaQ6KXRbQXj1l4uKpHmFzrmVb/5gjxUa6lGjUZICuv6ElUUOMSgMcZsb
	yWjXeWXq2WCfZMczj/9knQRMUWbbKd9M5LgG/NakXv2o9nSgcnhtVRaM7pDmw8TR2yL1sZ
	kK8l1TBCJX3TZrB7vyX6es7pdo9Cga8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-OBxc4iyrNjaeRAKz1c0pwg-1; Thu, 17 Nov 2022 17:12:14 -0500
X-MC-Unique: OBxc4iyrNjaeRAKz1c0pwg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30A501012467;
	Thu, 17 Nov 2022 22:12:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD9D0C359B4;
	Thu, 17 Nov 2022 22:12:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 560F41946595;
	Thu, 17 Nov 2022 22:12:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5CB7B1946595 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 22:12:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 50A652166B48; Thu, 17 Nov 2022 22:12:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BF452166B29;
 Thu, 17 Nov 2022 22:12:08 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Nov 2022 17:11:43 -0500
Message-Id: <20221117221157.2396743-4-aahringo@redhat.com>
In-Reply-To: <20221117221157.2396743-1-aahringo@redhat.com>
References: <20221117221157.2396743-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 04/18] fs: dlm: rename
 DLM_IFL_NEED_SCHED to DLM_IFL_CB_PENDING
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

This patch renames DLM_IFL_NEED_SCHED to DLM_IFL_CB_PENDING because
CB_PENDING is a proper name to describe this flag. This flag is set when
callback enqueue will return DLM_ENQUEUE_CALLBACK_NEED_SCHED because the
callback worker need to be queued. The flag tells that callbacks are
currently pending to be called and will be unset if the callback work
for the specific lkb is done. The term need schedule is part of this
time but a proper name is to say that there are some callbacks pending
to being called.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c          | 9 ++++-----
 fs/dlm/dlm_internal.h | 2 +-
 fs/dlm/user.c         | 3 +--
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 7dd072b8ea38..26fef9945cc9 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -45,8 +45,7 @@ void dlm_purge_lkb_callbacks(struct dlm_lkb *lkb)
 		kref_put(&cb->ref, dlm_release_callback);
 	}
 
-	/* TODO */
-	lkb->lkb_flags &= ~DLM_IFL_NEED_SCHED;
+	lkb->lkb_flags &= ~DLM_IFL_CB_PENDING;
 
 	/* invalidate */
 	dlm_callback_set_last_ptr(&lkb->lkb_last_cast, NULL);
@@ -104,8 +103,8 @@ int dlm_enqueue_lkb_callback(struct dlm_lkb *lkb, uint32_t flags, int mode,
 	cb->sb_status = status;
 	cb->sb_flags = (sbflags & 0x000000FF);
 	kref_init(&cb->ref);
-	if (!(lkb->lkb_flags & DLM_IFL_NEED_SCHED)) {
-		lkb->lkb_flags |= DLM_IFL_NEED_SCHED;
+	if (!(lkb->lkb_flags & DLM_IFL_CB_PENDING)) {
+		lkb->lkb_flags |= DLM_IFL_CB_PENDING;
 		rv = DLM_ENQUEUE_CALLBACK_NEED_SCHED;
 	}
 	list_add_tail(&cb->list, &lkb->lkb_callbacks);
@@ -210,7 +209,7 @@ void dlm_callback_work(struct work_struct *work)
 		spin_lock(&lkb->lkb_cb_lock);
 		rv = dlm_dequeue_lkb_callback(lkb, &cb);
 		if (rv == DLM_DEQUEUE_CALLBACK_EMPTY) {
-			lkb->lkb_flags &= ~DLM_IFL_NEED_SCHED;
+			lkb->lkb_flags &= ~DLM_IFL_CB_PENDING;
 			spin_unlock(&lkb->lkb_cb_lock);
 			break;
 		}
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 6318e0f51bc9..ab1a55337a6e 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -211,7 +211,7 @@ struct dlm_args {
 #endif
 #define DLM_IFL_DEADLOCK_CANCEL	0x01000000
 #define DLM_IFL_STUB_MS		0x02000000 /* magic number for m_flags */
-#define DLM_IFL_NEED_SCHED	0x04000000
+#define DLM_IFL_CB_PENDING	0x04000000
 /* least significant 2 bytes are message changed, they are full transmitted
  * but at receive side only the 2 bytes LSB will be set.
  *
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index edf722d6935a..35129505ddda 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -884,8 +884,7 @@ static ssize_t device_read(struct file *file, char __user *buf, size_t count,
 		goto try_another;
 	case DLM_DEQUEUE_CALLBACK_LAST:
 		list_del_init(&lkb->lkb_cb_list);
-		/* TODO */
-		lkb->lkb_flags &= ~DLM_IFL_NEED_SCHED;
+		lkb->lkb_flags &= ~DLM_IFL_CB_PENDING;
 		break;
 	case DLM_DEQUEUE_CALLBACK_SUCCESS:
 		break;
-- 
2.31.1

