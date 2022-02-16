Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D34A24B8CEB
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Feb 2022 16:53:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645026814;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bDYQJeciG69bCyPehtOFlRI7Kk8HcphHhGpKqijWRss=;
	b=e4vOvqB2DV9xD1LQH3KQS7vKc5P7FimK7aAjTzwpJS3CnnVxWn4Mv680N64DRwCfQlACUU
	jmYU3V3ezgXHmbeQje4uF9FpT47aaGAa9OhqguZMSKnS/H0Tayvi98YZ8SioiGdq7pSSO/
	CojBKTmp0kt23+Fru+OEHQH0KRBxOdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-pQuhfZEGODOqdNIw4Kk54g-1; Wed, 16 Feb 2022 10:53:31 -0500
X-MC-Unique: pQuhfZEGODOqdNIw4Kk54g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E1CD18C8C00;
	Wed, 16 Feb 2022 15:53:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F9D37B9E0;
	Wed, 16 Feb 2022 15:53:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E36D4BB7B;
	Wed, 16 Feb 2022 15:53:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21GFrQ1p023125 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Feb 2022 10:53:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5ED18752CC; Wed, 16 Feb 2022 15:53:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1024A752D0;
	Wed, 16 Feb 2022 15:53:26 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 16 Feb 2022 10:53:06 -0500
Message-Id: <20220216155307.2994688-4-aahringo@redhat.com>
In-Reply-To: <20220216155307.2994688-1-aahringo@redhat.com>
References: <20220216155307.2994688-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 3/4] fs: dlm: rearrange async
	condition return
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch moves the return of FILE_LOCK_DEFERRED a little bit earlier
than checking afterwards again if the request was an asynchronous request.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 4e60dd657cb6..757d9013788a 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -149,26 +149,25 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 		op_data->file	= file;
 
 		op->data = op_data;
+
+		send_op(op);
+		rv = FILE_LOCK_DEFERRED;
+		goto out;
 	} else {
 		op->info.owner	= (__u64)(long) fl->fl_owner;
 	}
 
 	send_op(op);
 
-	if (!op->data) {
-		rv = wait_event_interruptible(recv_wq, (op->done != 0));
-		if (rv == -ERESTARTSYS) {
-			log_debug(ls, "dlm_posix_lock: wait killed %llx",
-				  (unsigned long long)number);
-			spin_lock(&ops_lock);
-			list_del(&op->list);
-			spin_unlock(&ops_lock);
-			dlm_release_plock_op(op);
-			do_unlock_close(ls, number, file, fl);
-			goto out;
-		}
-	} else {
-		rv = FILE_LOCK_DEFERRED;
+	rv = wait_event_interruptible(recv_wq, (op->done != 0));
+	if (rv == -ERESTARTSYS) {
+		log_debug(ls, "%s: wait killed %llx", __func__,
+			  (unsigned long long)number);
+		spin_lock(&ops_lock);
+		list_del(&op->list);
+		spin_unlock(&ops_lock);
+		dlm_release_plock_op(op);
+		do_unlock_close(ls, number, file, fl);
 		goto out;
 	}
 
-- 
2.31.1

