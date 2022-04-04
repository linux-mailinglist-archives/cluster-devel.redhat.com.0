Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F9E4F1A14
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Apr 2022 22:07:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649102845;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MtoiJcxD2sTLC3fpLojtXvjFHBQLK9QV6eVkY3DDpdI=;
	b=fiy+AFyUBYG4vN0GrSJndRM7n/7vxl1UH5UDQiimt4MN6oB15e4jUT38DwvVWJXHsgUcde
	dEvCcOLmhvcVgRfMxZRUidAQIOeIXQCJeFAm50u7s8lSQdQVPz4HrcsHAFCGjBUShnw7eU
	qW1ANdRuVxDyQGMzmJne7ZSnhlA9fwQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-B44okGgfNyqMcwWcWJOfjA-1; Mon, 04 Apr 2022 16:07:22 -0400
X-MC-Unique: B44okGgfNyqMcwWcWJOfjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD2A1101A52C;
	Mon,  4 Apr 2022 20:06:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6432F40E80F5;
	Mon,  4 Apr 2022 20:06:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 561B2194037B;
	Mon,  4 Apr 2022 20:06:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 57BF319451EF for <cluster-devel@listman.corp.redhat.com>;
 Mon,  4 Apr 2022 20:06:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 523F67AC4; Mon,  4 Apr 2022 20:06:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34C497C43;
 Mon,  4 Apr 2022 20:06:53 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Apr 2022 16:06:31 -0400
Message-Id: <20220404200646.3170301-5-aahringo@redhat.com>
In-Reply-To: <20220404200646.3170301-1-aahringo@redhat.com>
References: <20220404200646.3170301-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND v5.18-rc1 04/19] fs: dlm: replace
 sanity checks with WARN_ON
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

There are several sanity checks and recover handling if they occur in
the dlm plock handling. From my understanding those operation can't run
in parallel with any list manipulation which involved setting the list
holder of plock_op, if so we have a bug which this sanity check will
warn about. Previously if such sanity check occurred the dlm plock
handling was trying to recover from it by deleting the plock_op from a
list which the holder was set to. However there is a bug in the dlm
plock handling if this case ever happens. To make such bugs are more
visible for further investigations we add a WARN_ON() on those sanity
checks and remove the recovering handling because other possible side
effects.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 32 ++++----------------------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index a10d2bcfe75a..55fba2f0234f 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -157,13 +157,7 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 		goto out;
 	}
 
-	spin_lock(&ops_lock);
-	if (!list_empty(&op->list)) {
-		log_error(ls, "dlm_posix_lock: op on list %llx",
-			  (unsigned long long)number);
-		list_del(&op->list);
-	}
-	spin_unlock(&ops_lock);
+	WARN_ON(!list_empty(&op->list));
 
 	rv = op->info.rv;
 
@@ -190,13 +184,7 @@ static int dlm_plock_callback(struct plock_op *op)
 	struct plock_xop *xop = (struct plock_xop *)op;
 	int rv = 0;
 
-	spin_lock(&ops_lock);
-	if (!list_empty(&op->list)) {
-		log_print("dlm_plock_callback: op on list %llx",
-			  (unsigned long long)op->info.number);
-		list_del(&op->list);
-	}
-	spin_unlock(&ops_lock);
+	WARN_ON(!list_empty(&op->list));
 
 	/* check if the following 2 are still valid or make a copy */
 	file = xop->file;
@@ -289,13 +277,7 @@ int dlm_posix_unlock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 	send_op(op);
 	wait_event(recv_wq, (op->done != 0));
 
-	spin_lock(&ops_lock);
-	if (!list_empty(&op->list)) {
-		log_error(ls, "dlm_posix_unlock: op on list %llx",
-			  (unsigned long long)number);
-		list_del(&op->list);
-	}
-	spin_unlock(&ops_lock);
+	WARN_ON(!list_empty(&op->list));
 
 	rv = op->info.rv;
 
@@ -343,13 +325,7 @@ int dlm_posix_get(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 	send_op(op);
 	wait_event(recv_wq, (op->done != 0));
 
-	spin_lock(&ops_lock);
-	if (!list_empty(&op->list)) {
-		log_error(ls, "dlm_posix_get: op on list %llx",
-			  (unsigned long long)number);
-		list_del(&op->list);
-	}
-	spin_unlock(&ops_lock);
+	WARN_ON(!list_empty(&op->list));
 
 	/* info.rv from userspace is 1 for conflict, 0 for no-conflict,
 	   -ENOENT if there are no locks on the file */
-- 
2.31.1

