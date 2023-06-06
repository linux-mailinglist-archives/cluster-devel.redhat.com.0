Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9B7724F14
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Jun 2023 23:56:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686088597;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P5lAt7kRfYFDckAa7oTbGbS6kf9LQdARYfaNFuocyUg=;
	b=RLS85dUUR7BfCgBzhfxy2D+NR8r3iWlXCOAj7qWvZTU4xhqg9f1+3s6GknViGF42qCx0rc
	MJ/f6WZ83pK1nZUKaL6HgRGkq70vatGY55KJFVx4OhxyrE/tkTOjrdjzpAgKWFvRZQ9qac
	6jA8M4R8+4r9/wNO/WJ6MtcD0MXD++M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-ls5EtOFdNAaovlSslD8LLg-1; Tue, 06 Jun 2023 17:56:32 -0400
X-MC-Unique: ls5EtOFdNAaovlSslD8LLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14F5E80610E;
	Tue,  6 Jun 2023 21:56:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CAE7340CFD49;
	Tue,  6 Jun 2023 21:56:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 677C71946A45;
	Tue,  6 Jun 2023 21:56:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 55B9419465BA for <cluster-devel@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 21:56:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 272152166B27; Tue,  6 Jun 2023 21:56:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE20F2166B2A;
 Tue,  6 Jun 2023 21:56:27 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  6 Jun 2023 17:56:26 -0400
Message-Id: <20230606215626.327239-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: fix nfs async lock
 callback handling
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch is fixing the current the callback handling if it's a nfs
async lock request signaled if fl_lmops is set.

When using `stress-ng --fcntl 32` on the kernel log there are several
messages like:

[11185.123533] dlm: dlm_plock_callback: vfs lock error 5d5127 file 000000002dd10f4d fl 000000007d13afae
[11185.127135] dlm: dlm_plock_callback: vfs lock error 5d5127 file 000000002dd10f4d fl 00000000a6046fa0
[11185.142668] dlm: dlm_plock_callback: vfs lock error 5d5127 file 000000002dd10f4d fl 000000001d13dfa5

The commit 40595cdc93ed ("nfs: block notification on fs with its
own ->lock") using only trylocks in an asynchronous polling behaviour. The
behaviour before was however differently by evaluating F_SETLKW or F_SETLK
and evaluating FL_SLEEP which was the case before commit 40595cdc93ed
("nfs: block notification on fs with its own ->lock"). This behaviour
seems to be broken before. This patch will fix the behaviour for the
special nfs case before commit 40595cdc93ed ("nfs: block notification on
fs with its own ->lock").

There is still a TODO of solving the case when an nfs locking request
got interrupted.

Fixes: 40595cdc93ed ("nfs: block notification on fs with its own ->lock")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 70a4752ed913..6f0ecb2176b0 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -217,27 +217,7 @@ static int dlm_plock_callback(struct plock_op *op)
 	fl = op_data->fl;
 	notify = op_data->callback;
 
-	if (op->info.rv) {
-		notify(fl, op->info.rv);
-		goto out;
-	}
-
-	/* got fs lock; bookkeep locally as well: */
-	flc->fl_flags &= ~FL_SLEEP;
-	if (posix_lock_file(file, flc, NULL)) {
-		/*
-		 * This can only happen in the case of kmalloc() failure.
-		 * The filesystem's own lock is the authoritative lock,
-		 * so a failure to get the lock locally is not a disaster.
-		 * As long as the fs cannot reliably cancel locks (especially
-		 * in a low-memory situation), we're better off ignoring
-		 * this failure than trying to recover.
-		 */
-		log_print("dlm_plock_callback: vfs lock error %llx file %p fl %p",
-			  (unsigned long long)op->info.number, file, fl);
-	}
-
-	rv = notify(fl, 0);
+	rv = notify(fl, op->info.rv);
 	if (rv) {
 		/* XXX: We need to cancel the fs lock here: */
 		log_print("dlm_plock_callback: lock granted after lock request "
-- 
2.31.1

