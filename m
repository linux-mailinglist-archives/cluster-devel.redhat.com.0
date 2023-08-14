Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB3D77C222
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Aug 2023 23:11:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692047492;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+ha7qooP5xHAJkp/n5Tt2zY2sO83T4RUyDIe+tf4ioM=;
	b=c7+bHdfHF6V7+5fLInYMPVqnmSeuylnDhloBpYoZztWY0fVL1ETv7nAR/K+RRzcmMGHFbv
	RUhMVxFg2J2ZEaW+BAKbxAk1h2IYDQkus9Xny0+7rNvR+bren3sLNDh4SbArSxIL2Vh4IH
	btivR6Q+Mzzb0tVS/aqa0wtFDi2mdIY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-XYdGRxE2OICS9vWfWCv6hw-1; Mon, 14 Aug 2023 17:11:28 -0400
X-MC-Unique: XYdGRxE2OICS9vWfWCv6hw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6883F185A7A4;
	Mon, 14 Aug 2023 21:11:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0524CC15BAE;
	Mon, 14 Aug 2023 21:11:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3607D19465A4;
	Mon, 14 Aug 2023 21:11:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 136221946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 14 Aug 2023 21:11:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E3B6AC15BAE; Mon, 14 Aug 2023 21:11:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95902C15BAD;
 Mon, 14 Aug 2023 21:11:22 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: linux-nfs@vger.kernel.org
Date: Mon, 14 Aug 2023 17:11:11 -0400
Message-Id: <20230814211116.3224759-3-aahringo@redhat.com>
In-Reply-To: <20230814211116.3224759-1-aahringo@redhat.com>
References: <20230814211116.3224759-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [RFCv2 2/7] lockd: FILE_LOCK_DEFERRED only on
 FL_SLEEP
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
Cc: jlayton@kernel.org, cluster-devel@redhat.com, ocfs2-devel@lists.linux.dev,
 chuck.lever@oracle.com, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch removes to handle non-blocking lock requests as asynchronous
lock request returning FILE_LOCK_DEFERRED. When fl_lmops and lm_grant()
is set and a non-blocking lock request returns FILE_LOCK_DEFERRED will
end in an WARNING to signal the user the misusage of the API.

The reason why we moving to make non-blocking lock request as
synchronized call is that we already doing this behaviour for unlock or
cancellation as well. Those are POSIX lock operations which are handled
in an synchronized way and waiting for an answer. For non-blocking lock
requests the answer will probably arrive in the same time as unlock or
cancellation operations as those are trylock operations only.

In case of a blocking lock request we need to have it asynchronously
because the time when the lock request getting granted is unknown.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/lockd/svclock.c | 39 +++++++--------------------------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
index 7d63524bdb81..1e74a578d7de 100644
--- a/fs/lockd/svclock.c
+++ b/fs/lockd/svclock.c
@@ -440,31 +440,6 @@ static void nlmsvc_freegrantargs(struct nlm_rqst *call)
 	locks_release_private(&call->a_args.lock.fl);
 }
 
-/*
- * Deferred lock request handling for non-blocking lock
- */
-static __be32
-nlmsvc_defer_lock_rqst(struct svc_rqst *rqstp, struct nlm_block *block)
-{
-	__be32 status = nlm_lck_denied_nolocks;
-
-	block->b_flags |= B_QUEUED;
-
-	nlmsvc_insert_block(block, NLM_TIMEOUT);
-
-	block->b_cache_req = &rqstp->rq_chandle;
-	if (rqstp->rq_chandle.defer) {
-		block->b_deferred_req =
-			rqstp->rq_chandle.defer(block->b_cache_req);
-		if (block->b_deferred_req != NULL)
-			status = nlm_drop_reply;
-	}
-	dprintk("lockd: nlmsvc_defer_lock_rqst block %p flags %d status %d\n",
-		block, block->b_flags, ntohl(status));
-
-	return status;
-}
-
 /*
  * Attempt to establish a lock, and if it can't be granted, block it
  * if required.
@@ -569,14 +544,14 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
 			ret = async_block ? nlm_lck_blocked : nlm_lck_denied;
 			goto out_cb_mutex;
 		case FILE_LOCK_DEFERRED:
-			block->b_flags |= B_PENDING_CALLBACK;
+			/* lock requests without waiters are handled in
+			 * a non async way. Let assert this to inform
+			 * the user about a API violation.
+			 */
+			WARN_ON_ONCE(!wait);
 
-			if (wait)
-				break;
-			/* Filesystem lock operation is in progress
-			   Add it to the queue waiting for callback */
-			ret = nlmsvc_defer_lock_rqst(rqstp, block);
-			goto out_cb_mutex;
+			block->b_flags |= B_PENDING_CALLBACK;
+			break;
 		case -EDEADLK:
 			nlmsvc_remove_block(block);
 			ret = nlm_deadlock;
-- 
2.31.1

