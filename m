Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD0453544E
	for <lists+cluster-devel@lfdr.de>; Thu, 26 May 2022 22:15:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653596158;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LI83VF9kM9f7Jfv7S1pfp5daNH+fQcdUOsgYCifhMiY=;
	b=CrmRH/9DdsLQaPTiM9krcNZzA2kXVog+tLqP6Y5HwO0H7dVw1KBmuVlAwlpWCLq6cV74SC
	CRqqC0mlXw5fmNdCMWWQWeWJb2gtWdv6Z1Bh6LH2Tis8YiWpqGdi6HSoFFNOO80K/J60qZ
	tikTWez51ih494hO1ViFjzwMrktcQW0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-UPA0bobzM1uYJwY2GYhHxA-1; Thu, 26 May 2022 16:15:57 -0400
X-MC-Unique: UPA0bobzM1uYJwY2GYhHxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F4941C08979;
	Thu, 26 May 2022 20:15:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 366F7401199B;
	Thu, 26 May 2022 20:15:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DF92D192EFFB;
	Thu, 26 May 2022 20:15:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2A73E1932129 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 26 May 2022 20:15:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 19DC441637F; Thu, 26 May 2022 20:15:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F170F40336E;
 Thu, 26 May 2022 20:15:53 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 26 May 2022 16:15:31 -0400
Message-Id: <20220526201532.463135-5-aahringo@redhat.com>
In-Reply-To: <20220526201532.463135-1-aahringo@redhat.com>
References: <20220526201532.463135-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm/next 5/6] fs: dlm: use dlm_plock_info
 for do_unlock_close
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will refactor do_unlock_close() by using only struct
dlm_plock_info as parameter. There is only one use of do_unlock_close()
and the same variables was copied before into the used dlm_plock_info
structure.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 868940c48e3a..cf7bba461bfd 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -79,8 +79,7 @@ static void send_op(struct plock_op *op)
    abandoned waiter.  So, we have to insert the unlock-close when the
    lock call is interrupted. */
 
-static void do_unlock_close(struct dlm_ls *ls, u64 number,
-			    struct file *file, struct file_lock *fl)
+static void do_unlock_close(const struct dlm_plock_info *info)
 {
 	struct plock_op *op;
 
@@ -89,15 +88,12 @@ static void do_unlock_close(struct dlm_ls *ls, u64 number,
 		return;
 
 	op->info.optype		= DLM_PLOCK_OP_UNLOCK;
-	op->info.pid		= fl->fl_pid;
-	op->info.fsid		= ls->ls_global_id;
-	op->info.number		= number;
+	op->info.pid		= info->pid;
+	op->info.fsid		= info->fsid;
+	op->info.number		= info->number;
 	op->info.start		= 0;
 	op->info.end		= OFFSET_MAX;
-	if (fl->fl_lmops && fl->fl_lmops->lm_grant)
-		op->info.owner	= (__u64) fl->fl_pid;
-	else
-		op->info.owner	= (__u64)(long) fl->fl_owner;
+	op->info.owner		= info->owner;
 
 	op->info.flags |= DLM_PLOCK_FL_CLOSE;
 	send_op(op);
@@ -167,7 +163,7 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 			  __func__, ls->ls_global_id,
 			  (unsigned long long)number, op->info.pid);
 		dlm_release_plock_op(op);
-		do_unlock_close(ls, number, file, fl);
+		do_unlock_close(&op->info);
 		goto out;
 	}
 
-- 
2.31.1

