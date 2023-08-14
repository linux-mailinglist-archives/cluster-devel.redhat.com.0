Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4456C77C225
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Aug 2023 23:11:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692047494;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tZEXFed81ekvMweSZpvZmhvnw/W3DW6CK17WR1HloMI=;
	b=FIQG0ulfH33BNDU5wEtKNpFqdNhckTijdyvYJ8cigFJ+++Pzedbl+Y82GzyhO0E7lmK8Vl
	7SK2rqizxiU9PSz0/+5Qli/mxH0jsLTqsUQEP9V8ho8yN/lEsWisdnLYdKk4Ecf60WICt6
	nJRQWVQDksY/tPXjB2zMsDml1WOBSPo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-YM5tSNpdOJGDS2Ujg0b6aw-1; Mon, 14 Aug 2023 17:11:30 -0400
X-MC-Unique: YM5tSNpdOJGDS2Ujg0b6aw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DB3B8DC66D;
	Mon, 14 Aug 2023 21:11:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FB2C140E950;
	Mon, 14 Aug 2023 21:11:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 42D0B194658D;
	Mon, 14 Aug 2023 21:11:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 76357194658F for <cluster-devel@listman.corp.redhat.com>;
 Mon, 14 Aug 2023 21:11:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 66F64C15BB8; Mon, 14 Aug 2023 21:11:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0000CC15BAD;
 Mon, 14 Aug 2023 21:11:23 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: linux-nfs@vger.kernel.org
Date: Mon, 14 Aug 2023 17:11:15 -0400
Message-Id: <20230814211116.3224759-7-aahringo@redhat.com>
In-Reply-To: <20230814211116.3224759-1-aahringo@redhat.com>
References: <20230814211116.3224759-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [RFCv2 6/7] dlm: use FL_SLEEP to check if blocking
 request
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
Cc: jlayton@kernel.org, cluster-devel@redhat.com, ocfs2-devel@lists.linux.dev,
 chuck.lever@oracle.com, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch uses the FL_SLEEP flag in struct file_lock to check if it's a
blocking request in case if the request coming from nfs lockd process
indicated by lm_grant() is set.

IF FL_SLEEP is set a asynchronous blocking request is being made and
it's waiting for lm_grant() callback being called to signal the lock was
granted. If it's not set a synchronous non-blocking request is being made.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 0094fa4004cc..524771002a2f 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -140,7 +140,6 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 	op->info.optype		= DLM_PLOCK_OP_LOCK;
 	op->info.pid		= fl->fl_pid;
 	op->info.ex		= (fl->fl_type == F_WRLCK);
-	op->info.wait		= IS_SETLKW(cmd);
 	op->info.fsid		= ls->ls_global_id;
 	op->info.number		= number;
 	op->info.start		= fl->fl_start;
@@ -148,24 +147,31 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 	op->info.owner = (__u64)(long)fl->fl_owner;
 	/* async handling */
 	if (fl->fl_lmops && fl->fl_lmops->lm_grant) {
-		op_data = kzalloc(sizeof(*op_data), GFP_NOFS);
-		if (!op_data) {
-			dlm_release_plock_op(op);
-			rv = -ENOMEM;
-			goto out;
-		}
+		if (fl->fl_flags & FL_SLEEP) {
+			op_data = kzalloc(sizeof(*op_data), GFP_NOFS);
+			if (!op_data) {
+				dlm_release_plock_op(op);
+				rv = -ENOMEM;
+				goto out;
+			}
 
-		op_data->callback = fl->fl_lmops->lm_grant;
-		locks_init_lock(&op_data->flc);
-		locks_copy_lock(&op_data->flc, fl);
-		op_data->fl		= fl;
-		op_data->file	= file;
+			op->info.wait = 1;
+			op_data->callback = fl->fl_lmops->lm_grant;
+			locks_init_lock(&op_data->flc);
+			locks_copy_lock(&op_data->flc, fl);
+			op_data->fl		= fl;
+			op_data->file	= file;
 
-		op->data = op_data;
+			op->data = op_data;
 
-		send_op(op);
-		rv = FILE_LOCK_DEFERRED;
-		goto out;
+			send_op(op);
+			rv = FILE_LOCK_DEFERRED;
+			goto out;
+		} else {
+			op->info.wait = 0;
+		}
+	} else {
+		op->info.wait = IS_SETLKW(cmd);
 	}
 
 	send_op(op);
-- 
2.31.1

