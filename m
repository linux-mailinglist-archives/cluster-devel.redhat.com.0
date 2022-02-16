Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC90D4B8CEC
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Feb 2022 16:53:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645026814;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nz+a6tlvrSCoLaKRsqMP5HC+LqvATQ7h8GXHia/RuFo=;
	b=fkVJ+QItPfNu0X34iC1AfJywZWcgsM6uh/t8xRBJjOvVSRYVlmtad4RJgshjhHuA1a//C6
	rdvwHue2e5sYwhfuIpMgloroMhxLEhv+Ga3TVcwnkIh1jwyhZOpDSeZ8G4oKAXUOddWmUr
	MRC3agtdf7Hv80Z5LNnDqp/ohDz1eZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-UoMGhDRlPfi6HiKdMJ2jtQ-1; Wed, 16 Feb 2022 10:53:31 -0500
X-MC-Unique: UoMGhDRlPfi6HiKdMJ2jtQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 359721091DA0;
	Wed, 16 Feb 2022 15:53:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22A6C7D728;
	Wed, 16 Feb 2022 15:53:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB8B34A7C9;
	Wed, 16 Feb 2022 15:53:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21GFrPgC023114 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Feb 2022 10:53:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7E397752D0; Wed, 16 Feb 2022 15:53:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2FD75752CB;
	Wed, 16 Feb 2022 15:53:25 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 16 Feb 2022 10:53:04 -0500
Message-Id: <20220216155307.2994688-2-aahringo@redhat.com>
In-Reply-To: <20220216155307.2994688-1-aahringo@redhat.com>
References: <20220216155307.2994688-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 1/4] fs: dlm: replace sanity checks
	with WARN_ON
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

There are several sanity checks and recover handling if they occur in
the dlm plock handling. They should never occur otherwise we have a bug
in the code. To make such bugs more visible we remove the recover
handling and add a WARN_ON() on those sanity checks.

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

