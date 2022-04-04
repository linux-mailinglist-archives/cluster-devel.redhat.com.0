Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B464F1A0A
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102842;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1cC9HOfoH9wMFd/+WLyoxcYmaJpdCOPknF+st9Eus48=;
	b=NHYXSzf8nQtYnuWtdua6AIPUR60EBWmmlv0IRm+TJ+WqMIkxnDkCffQEK1rsa6kKLCLJiC
	OONuVLxKjI6EnZLBKjWWnxbsmHFP/3UsHXmyO3aIKEmHpebhIodcd7KBb/l4koSnw4ZzLh
	CU6MXPB0+/g1zRx6xtYFDDvtkh0H+Kg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-50C-gJpNPnS1WRM6HQebXQ-1; Mon, 04 Apr 2022 16:07:19 -0400
X-MC-Unique: 50C-gJpNPnS1WRM6HQebXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C07783396F;
	Mon,  4 Apr 2022 20:07:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4339A40CFD1C;
	Mon,  4 Apr 2022 20:06:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6CD85193F6E1;
	Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C98B319451EF for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C41F77C43; Mon,  4 Apr 2022 20:06:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6F527C28;
 Mon,  4 Apr 2022 20:06:53 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:34 -0400
Message-Id: <20220404200646.3170301-8-aahringo@redhat.com>
In-Reply-To: <20220404200646.3170301-1-aahringo@redhat.com>
References: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 07/19] fs: dlm: improve
 plock logging if interrupted
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

This patch changes the log level if a plock is removed when interrupted
from debug to info. Additional it signals now that the plock entity was
removed to let the user know what's happening.

If on a dev_write() a pending plock cannot be find it will signal that
it might have been removed because wait interruption.

Before this patch there might be a "dev_write no op ..." info message
and the users can only guess that the plock was removed before because
the wait interruption. To be sure that is the case we log both messages
on the same log level.

Let both message be logged on info layer because it should not happened
a lot and if it happens it should be clear why the op was not found.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 757d9013788a..ce1af7986e16 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -161,11 +161,12 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 
 	rv = wait_event_interruptible(recv_wq, (op->done != 0));
 	if (rv == -ERESTARTSYS) {
-		log_debug(ls, "%s: wait killed %llx", __func__,
-			  (unsigned long long)number);
 		spin_lock(&ops_lock);
 		list_del(&op->list);
 		spin_unlock(&ops_lock);
+		log_print("%s: wait interrupted %x %llx, op removed",
+			  __func__, ls->ls_global_id,
+			  (unsigned long long)number);
 		dlm_release_plock_op(op);
 		do_unlock_close(ls, number, file, fl);
 		goto out;
@@ -443,8 +444,8 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 		else
 			wake_up(&recv_wq);
 	} else
-		log_print("dev_write no op %x %llx", info.fsid,
-			  (unsigned long long)info.number);
+		log_print("%s: no op %x %llx - may got interrupted?", __func__,
+			  info.fsid, (unsigned long long)info.number);
 	return count;
 }
 
-- 
2.31.1

