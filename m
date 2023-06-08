Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 676C4727D5E
	for <lists+cluster-devel@lfdr.de>; Thu,  8 Jun 2023 12:58:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686221911;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uGF1QnRDPmXMvdo+ZBshyWxIyf+UKkHcu59ywxUVh7g=;
	b=Y0j/gWCZqzNJ3zZrTyMN2+eSzH9YDxs0Bpn//kgyImFiOOrznv8yzt7z7/aFBJwy7ma5o9
	enJjwC0blorQa8ENWVrActICs/rI438PhXikJjwklMJOYnLtnkImYkQBUk23f8JEXyUtoI
	dlEP4XimRVAyD7Dcl741Loo521+S2Lg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-hiYlDZLjMI6YrpADjGVHCQ-1; Thu, 08 Jun 2023 06:58:28 -0400
X-MC-Unique: hiYlDZLjMI6YrpADjGVHCQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67C491C05AF8;
	Thu,  8 Jun 2023 10:58:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DCB3C1603B;
	Thu,  8 Jun 2023 10:58:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EC79E19451C1;
	Thu,  8 Jun 2023 10:58:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D7CEF194658C for <cluster-devel@listman.corp.redhat.com>;
 Thu,  8 Jun 2023 10:58:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C79C440CFD48; Thu,  8 Jun 2023 10:58:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F20240CFD46;
 Thu,  8 Jun 2023 10:58:24 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  8 Jun 2023 06:58:21 -0400
Message-Id: <20230608105821.354272-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCHv2 dlm/next] fs: dlm: fix nfs async lock
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch is fixing the current the callback handling if a nfs async
lock request signaled if fl_lmops is set.

When using `stress-ng --fcntl 32` on the kernel log there are several
messages like:

[11185.123533] dlm: dlm_plock_callback: vfs lock error 5d5127 file 000000002dd10f4d fl 000000007d13afae
[11185.127135] dlm: dlm_plock_callback: vfs lock error 5d5127 file 000000002dd10f4d fl 00000000a6046fa0
[11185.142668] dlm: dlm_plock_callback: vfs lock error 5d5127 file 000000002dd10f4d fl 000000001d13dfa5

The commit 40595cdc93ed ("nfs: block notification on fs with its
own ->lock") removed the FL_SLEEP handling if the filesystem implements
its own ->lock. The strategy is now that the most clients polling
blocked requests by using trylock functionality.

Before commit 40595cdc93ed ("nfs: block notification on fs with its own
->lock") FL_SLEEP was used even with an own ->lock() callback. The fs
implementation needed to handle it to make a difference between a
blocking and non-blocking lock request. This was never being implemented
in such way in DLM plock handling. Every lock request doesn't matter if
it was a blocking request or not was handled as a non-blocking lock
request.

This patch fixes the behaviour until commit 40595cdc93ed ("nfs: block
notification on fs with its own ->lock"), but it was probably broken
long time before.

Fixes: 40595cdc93ed ("nfs: block notification on fs with its own ->lock")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
changes since v2:
 - rephrase commit msg
 - add cc stable

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

