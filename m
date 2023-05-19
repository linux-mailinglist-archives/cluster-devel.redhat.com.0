Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A85709B2E
	for <lists+cluster-devel@lfdr.de>; Fri, 19 May 2023 17:21:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684509697;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nNY2NyL7yNeknDb3IM5QwvitC6u5LqIzCAFRVhDoV5M=;
	b=a+C5cjWg5qjLr4QH+05E6uEONV0d6Dx5kLLnTHj8TdlmwQtOiYmt34ck6LIu90ZqevSuVR
	NIKhik82KCqWt7jzFyT8NHTyErKsN+ea9m6fOaoHZmlxH2gh1NIvYuX00GKCJJZeY39PZ6
	jYWO/qLNBRjQ187IrR5XBwRb5jPeulc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-6pC26wXUOGeXy1B3ulJQ-Q-1; Fri, 19 May 2023 11:21:33 -0400
X-MC-Unique: 6pC26wXUOGeXy1B3ulJQ-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5410A8030D1;
	Fri, 19 May 2023 15:21:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4864E140E954;
	Fri, 19 May 2023 15:21:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 02DB919465BC;
	Fri, 19 May 2023 15:21:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E355619465BD for <cluster-devel@listman.corp.redhat.com>;
 Fri, 19 May 2023 15:21:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D4CED4F2DE2; Fri, 19 May 2023 15:21:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A64294F2DDE;
 Fri, 19 May 2023 15:21:30 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 19 May 2023 11:21:27 -0400
Message-Id: <20230519152128.65272-4-aahringo@redhat.com>
In-Reply-To: <20230519152128.65272-1-aahringo@redhat.com>
References: <20230519152128.65272-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH v6.4-rc2 4/5] fs: dlm: make F_SETLK not
 killable
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch changes that only F_SETLKW will be killable. As the man page
of fcntl() states out that F_SETLKW is the only one interruptible cmd as
I supposed it can block an unknown amount of time when it hits
contention. We use killable for the same reason just that the process
isn't alive anymore.

The command F_SETLK is a trylock command, a result can be expected very
close as the operation was send to the user space like unlock or get
operations which uses wait_event() only.

Cc: stable@vger.kernel.org
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 31bc601ee3d8..c9e1d5f54194 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -155,25 +155,29 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 
 	send_op(op);
 
-	rv = wait_event_killable(recv_wq, (op->done != 0));
-	if (rv == -ERESTARTSYS) {
-		spin_lock(&ops_lock);
-		/* recheck under ops_lock if we got a done != 0,
-		 * if so this interrupt case should be ignored
-		 */
-		if (op->done != 0) {
+	if (op->info.wait) {
+		rv = wait_event_killable(recv_wq, (op->done != 0));
+		if (rv == -ERESTARTSYS) {
+			spin_lock(&ops_lock);
+			/* recheck under ops_lock if we got a done != 0,
+			 * if so this interrupt case should be ignored
+			 */
+			if (op->done != 0) {
+				spin_unlock(&ops_lock);
+				goto do_lock_wait;
+			}
+			list_del(&op->list);
 			spin_unlock(&ops_lock);
-			goto do_lock_wait;
-		}
-		list_del(&op->list);
-		spin_unlock(&ops_lock);
 
-		log_debug(ls, "%s: wait interrupted %x %llx pid %d",
-			  __func__, ls->ls_global_id,
-			  (unsigned long long)number, op->info.pid);
-		do_unlock_close(&op->info);
-		dlm_release_plock_op(op);
-		goto out;
+			log_debug(ls, "%s: wait interrupted %x %llx pid %d",
+				  __func__, ls->ls_global_id,
+				  (unsigned long long)number, op->info.pid);
+			do_unlock_close(&op->info);
+			dlm_release_plock_op(op);
+			goto out;
+		}
+	} else {
+		wait_event(recv_wq, (op->done != 0));
 	}
 
 do_lock_wait:
-- 
2.31.1

