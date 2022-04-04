Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A82074F1A0B
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102842;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lUclY2u8cnuSIWGP6aCx/6AUA5dJZeABqTIPOYZ8msQ=;
	b=IaUyvRiZ98pc4nSQRikGYqF4BZ95Oz2Fon8sVQCZcbe6FT3+l5tP1P0mwYCjk9V14oa7ID
	UUXYRnnAljcnPuLTaVy9I/4askf/n+uYPw0517fvRuo7AXQTjOclLpGWH5mIcnkQF2nNFk
	Y/XTWEbJM7GOG7CrcG4KMPSmfXMnakY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-BVRZBQDIPkefIffVt3ajDA-1; Mon, 04 Apr 2022 16:07:19 -0400
X-MC-Unique: BVRZBQDIPkefIffVt3ajDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C1B985A5A8;
	Mon,  4 Apr 2022 20:07:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ADC0540E8100;
	Mon,  4 Apr 2022 20:06:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6118B193F6DC;
	Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7D4E519451EF for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 78C6F8145; Mon,  4 Apr 2022 20:06:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B0507C28;
 Mon,  4 Apr 2022 20:06:53 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:32 -0400
Message-Id: <20220404200646.3170301-6-aahringo@redhat.com>
In-Reply-To: <20220404200646.3170301-1-aahringo@redhat.com>
References: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 05/19] fs: dlm: cleanup
 plock_op vs plock_xop
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

Lately the different casting between plock_op and plock_xop and list
holders which was involved showed some issues which were hard to see.
This patch removes the "plock_xop" structure and introduces a
"struct plock_async_data". This structure will be set in "struct plock_op"
in case of asynchronous lock handling as the original "plock_xop" was
made for. There is no need anymore to cast pointers around for
additional fields in case of asynchronous lock handling.  As disadvantage
another allocation was introduces but only needed in the asynchronous
case which is currently only used in combination with nfs lockd.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 77 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 46 insertions(+), 31 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 55fba2f0234f..4e60dd657cb6 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -19,20 +19,20 @@ static struct list_head recv_list;
 static wait_queue_head_t send_wq;
 static wait_queue_head_t recv_wq;
 
-struct plock_op {
-	struct list_head list;
-	int done;
-	struct dlm_plock_info info;
-	int (*callback)(struct file_lock *fl, int result);
-};
-
-struct plock_xop {
-	struct plock_op xop;
+struct plock_async_data {
 	void *fl;
 	void *file;
 	struct file_lock flc;
+	int (*callback)(struct file_lock *fl, int result);
 };
 
+struct plock_op {
+	struct list_head list;
+	int done;
+	struct dlm_plock_info info;
+	/* if set indicates async handling */
+	struct plock_async_data *data;
+};
 
 static inline void set_version(struct dlm_plock_info *info)
 {
@@ -58,6 +58,12 @@ static int check_version(struct dlm_plock_info *info)
 	return 0;
 }
 
+static void dlm_release_plock_op(struct plock_op *op)
+{
+	kfree(op->data);
+	kfree(op);
+}
+
 static void send_op(struct plock_op *op)
 {
 	set_version(&op->info);
@@ -101,22 +107,21 @@ static void do_unlock_close(struct dlm_ls *ls, u64 number,
 int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 		   int cmd, struct file_lock *fl)
 {
+	struct plock_async_data *op_data;
 	struct dlm_ls *ls;
 	struct plock_op *op;
-	struct plock_xop *xop;
 	int rv;
 
 	ls = dlm_find_lockspace_local(lockspace);
 	if (!ls)
 		return -EINVAL;
 
-	xop = kzalloc(sizeof(*xop), GFP_NOFS);
-	if (!xop) {
+	op = kzalloc(sizeof(*op), GFP_NOFS);
+	if (!op) {
 		rv = -ENOMEM;
 		goto out;
 	}
 
-	op = &xop->xop;
 	op->info.optype		= DLM_PLOCK_OP_LOCK;
 	op->info.pid		= fl->fl_pid;
 	op->info.ex		= (fl->fl_type == F_WRLCK);
@@ -125,22 +130,32 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 	op->info.number		= number;
 	op->info.start		= fl->fl_start;
 	op->info.end		= fl->fl_end;
+	/* async handling */
 	if (fl->fl_lmops && fl->fl_lmops->lm_grant) {
+		op_data = kzalloc(sizeof(*op_data), GFP_NOFS);
+		if (!op_data) {
+			dlm_release_plock_op(op);
+			rv = -ENOMEM;
+			goto out;
+		}
+
 		/* fl_owner is lockd which doesn't distinguish
 		   processes on the nfs client */
 		op->info.owner	= (__u64) fl->fl_pid;
-		op->callback	= fl->fl_lmops->lm_grant;
-		locks_init_lock(&xop->flc);
-		locks_copy_lock(&xop->flc, fl);
-		xop->fl		= fl;
-		xop->file	= file;
+		op_data->callback = fl->fl_lmops->lm_grant;
+		locks_init_lock(&op_data->flc);
+		locks_copy_lock(&op_data->flc, fl);
+		op_data->fl		= fl;
+		op_data->file	= file;
+
+		op->data = op_data;
 	} else {
 		op->info.owner	= (__u64)(long) fl->fl_owner;
 	}
 
 	send_op(op);
 
-	if (!op->callback) {
+	if (!op->data) {
 		rv = wait_event_interruptible(recv_wq, (op->done != 0));
 		if (rv == -ERESTARTSYS) {
 			log_debug(ls, "dlm_posix_lock: wait killed %llx",
@@ -148,7 +163,7 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 			spin_lock(&ops_lock);
 			list_del(&op->list);
 			spin_unlock(&ops_lock);
-			kfree(xop);
+			dlm_release_plock_op(op);
 			do_unlock_close(ls, number, file, fl);
 			goto out;
 		}
@@ -167,7 +182,7 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 				  (unsigned long long)number);
 	}
 
-	kfree(xop);
+	dlm_release_plock_op(op);
 out:
 	dlm_put_lockspace(ls);
 	return rv;
@@ -177,20 +192,20 @@ EXPORT_SYMBOL_GPL(dlm_posix_lock);
 /* Returns failure iff a successful lock operation should be canceled */
 static int dlm_plock_callback(struct plock_op *op)
 {
+	struct plock_async_data *op_data = op->data;
 	struct file *file;
 	struct file_lock *fl;
 	struct file_lock *flc;
 	int (*notify)(struct file_lock *fl, int result) = NULL;
-	struct plock_xop *xop = (struct plock_xop *)op;
 	int rv = 0;
 
 	WARN_ON(!list_empty(&op->list));
 
 	/* check if the following 2 are still valid or make a copy */
-	file = xop->file;
-	flc = &xop->flc;
-	fl = xop->fl;
-	notify = op->callback;
+	file = op_data->file;
+	flc = &op_data->flc;
+	fl = op_data->fl;
+	notify = op_data->callback;
 
 	if (op->info.rv) {
 		notify(fl, op->info.rv);
@@ -221,7 +236,7 @@ static int dlm_plock_callback(struct plock_op *op)
 	}
 
 out:
-	kfree(xop);
+	dlm_release_plock_op(op);
 	return rv;
 }
 
@@ -285,7 +300,7 @@ int dlm_posix_unlock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 		rv = 0;
 
 out_free:
-	kfree(op);
+	dlm_release_plock_op(op);
 out:
 	dlm_put_lockspace(ls);
 	fl->fl_flags = fl_flags;
@@ -345,7 +360,7 @@ int dlm_posix_get(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 		rv = 0;
 	}
 
-	kfree(op);
+	dlm_release_plock_op(op);
 out:
 	dlm_put_lockspace(ls);
 	return rv;
@@ -381,7 +396,7 @@ static ssize_t dev_read(struct file *file, char __user *u, size_t count,
 	   (the process did not make an unlock call). */
 
 	if (op->info.flags & DLM_PLOCK_FL_CLOSE)
-		kfree(op);
+		dlm_release_plock_op(op);
 
 	if (copy_to_user(u, &info, sizeof(info)))
 		return -EFAULT;
@@ -413,7 +428,7 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 		    op->info.owner == info.owner) {
 			list_del_init(&op->list);
 			memcpy(&op->info, &info, sizeof(info));
-			if (op->callback)
+			if (op->data)
 				do_callback = 1;
 			else
 				op->done = 1;
-- 
2.31.1

