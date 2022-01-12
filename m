Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2CE48CE41
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 23:13:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642025616;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lyxA6H5RHdoYhobi6rMUc3cIIfO1GgTYbtJdSaMTSPA=;
	b=QYbDCNFPW3IchcJs8RY3TQKEdTz0Rbx82yzDjgDgblp+ChxIegyIajNd9Q492aibHry7JJ
	fyAW3vh7rCVgdTJMITGfUaD10P9kMC5cKV623o7PoBsQ0ZNIQvNgw+9Gxqb/hTUm1XDAwe
	Fzq4vubLtp59gq7cRzS+HlQvI8a/idE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-5W9PKFCAMS-fvrnkzdkMpg-1; Wed, 12 Jan 2022 17:13:33 -0500
X-MC-Unique: 5W9PKFCAMS-fvrnkzdkMpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64D6290D90A;
	Wed, 12 Jan 2022 22:11:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B94A5E48C;
	Wed, 12 Jan 2022 22:11:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 78E391809CB8;
	Wed, 12 Jan 2022 22:11:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CMAw7d019480 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 17:10:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8F9B456F83; Wed, 12 Jan 2022 22:10:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3EC1856F8F;
	Wed, 12 Jan 2022 22:10:58 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 12 Jan 2022 17:10:53 -0500
Message-Id: <20220112221053.222091-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: improve plock logging if
	interrupted
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch changes the log level if a plock is removed when interrupted
from debug to info. Additional it signals now that the plock entity was
removed to let the user know what's happening.

If on a dev_write() a pending plock cannot be find it will signal that
it might have been removed because interruption.

Before this patch there might be a "dev_write no op ..." info message
and I assume that the plock was removed before because interruption. To
be sure that is the case we log both messages on the same log level.

Let both message be logged on info layer because it should not happened
a lot.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index c38b2b8ffd1d..6ff61ccccb0b 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -144,11 +144,12 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 	if (xop->callback == NULL) {
 		rv = wait_event_interruptible(recv_wq, (op->done != 0));
 		if (rv == -ERESTARTSYS) {
-			log_debug(ls, "dlm_posix_lock: wait killed %llx",
-				  (unsigned long long)number);
 			spin_lock(&ops_lock);
 			list_del(&op->list);
 			spin_unlock(&ops_lock);
+			log_print("%s: wait interrupted %x %llx and removed",
+				  __func__, ls->ls_global_id,
+				  (unsigned long long)number);
 			kfree(xop);
 			do_unlock_close(ls, number, file, fl);
 			goto out;
@@ -455,8 +456,8 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
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

