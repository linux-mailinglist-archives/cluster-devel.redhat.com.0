Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1864BA9FA
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Feb 2022 20:40:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645126800;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1cC9HOfoH9wMFd/+WLyoxcYmaJpdCOPknF+st9Eus48=;
	b=VYJBbRBIOBy4P/HhlsFJeKomQ+HDvPHI1c4LY2dmLyY1IZXvIUzfAW2+f6KGPbnF01iBIe
	rx8L00pDTumEVhvNzADd4m+QT8MU6J414lYCgLZ24IAgazSX4FDaU/5Gx2AdIEeblGTIHY
	8FUJWMqSPDUEniV+wW4hMLlLeO/TPJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-qonU4FOhNYuCK2Z_M_PzDA-1; Thu, 17 Feb 2022 14:39:57 -0500
X-MC-Unique: qonU4FOhNYuCK2Z_M_PzDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21440801B0C;
	Thu, 17 Feb 2022 19:39:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1146A4BC5E;
	Thu, 17 Feb 2022 19:39:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EEB814A7C9;
	Thu, 17 Feb 2022 19:39:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21HJdmiF004269 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 17 Feb 2022 14:39:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4C250100EB3D; Thu, 17 Feb 2022 19:39:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F09BE1009962;
	Thu, 17 Feb 2022 19:39:47 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 17 Feb 2022 14:39:15 -0500
Message-Id: <20220217193917.3292717-5-aahringo@redhat.com>
In-Reply-To: <20220217193917.3292717-1-aahringo@redhat.com>
References: <20220217193917.3292717-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 4/6] fs: dlm: improve plock
	logging if interrupted
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

