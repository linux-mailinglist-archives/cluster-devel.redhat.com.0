Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1589E715104
	for <lists+cluster-devel@lfdr.de>; Mon, 29 May 2023 23:44:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685396691;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8RQeuQkxI5R0AMNkY/+q+IFSl/ylLlW7h2ErXHX50iw=;
	b=hsj3N8FcKh5ueZR21uQLe2SYc8eqV50cUR5cVcyMobpMfchCrKogXqfBw4EF2rgl8du5k3
	BxPR7IMn0vzioYb9bWkQr0Va/zmnlgi37VVL6+cDysLJD76dDpY50Ww4h5iRxk9Qu1KsQM
	vIo7Q6r/aNJD26kYSu3F8haakSFaBsM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-zpcEfSOLPOuq-9GGZF0Bog-1; Mon, 29 May 2023 17:44:46 -0400
X-MC-Unique: zpcEfSOLPOuq-9GGZF0Bog-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3175101AA6F;
	Mon, 29 May 2023 21:44:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2CCD40D1B6B;
	Mon, 29 May 2023 21:44:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7D8441946A41;
	Mon, 29 May 2023 21:44:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C5B351946595 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 29 May 2023 21:44:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AB1B02166B2E; Mon, 29 May 2023 21:44:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81A282166B2B;
 Mon, 29 May 2023 21:44:43 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 29 May 2023 17:44:38 -0400
Message-Id: <20230529214440.2542721-10-aahringo@redhat.com>
In-Reply-To: <20230529214440.2542721-1-aahringo@redhat.com>
References: <20230529214440.2542721-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 10/12] fs: dlm: handle lkb wait
 count as atomic_t
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Currently the lkb_wait_count is locked by the rsb lock and it should be
fine to handle lkb_wait_count as non atomic_t value. However for the
overall process of reducing locking this patch converts it to an
atomic_t value.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h |  2 +-
 fs/dlm/lock.c         | 32 ++++++++++++++------------------
 2 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 986a9d7b1f33..c8156770205e 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -246,7 +246,7 @@ struct dlm_lkb {
 	int8_t			lkb_highbast;	/* highest mode bast sent for */
 
 	int8_t			lkb_wait_type;	/* type of reply waiting for */
-	int8_t			lkb_wait_count;
+	atomic_t		lkb_wait_count;
 	int			lkb_wait_nodeid; /* for debugging */
 
 	struct list_head	lkb_statequeue;	/* rsb g/c/w list */
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index ede903246fa4..f511a9d7d416 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1407,6 +1407,7 @@ static int add_to_waiters(struct dlm_lkb *lkb, int mstype, int to_nodeid)
 {
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
 	int error = 0;
+	int wc;
 
 	mutex_lock(&ls->ls_waiters_mutex);
 
@@ -1428,20 +1429,17 @@ static int add_to_waiters(struct dlm_lkb *lkb, int mstype, int to_nodeid)
 			error = -EBUSY;
 			goto out;
 		}
-		lkb->lkb_wait_count++;
+		wc = atomic_inc_return(&lkb->lkb_wait_count);
 		hold_lkb(lkb);
 
 		log_debug(ls, "addwait %x cur %d overlap %d count %d f %x",
-			  lkb->lkb_id, lkb->lkb_wait_type, mstype,
-			  lkb->lkb_wait_count, dlm_iflags_val(lkb));
+			  lkb->lkb_id, lkb->lkb_wait_type, mstype, wc,
+			  dlm_iflags_val(lkb));
 		goto out;
 	}
 
-	DLM_ASSERT(!lkb->lkb_wait_count,
-		   dlm_print_lkb(lkb);
-		   printk("wait_count %d\n", lkb->lkb_wait_count););
-
-	lkb->lkb_wait_count++;
+	wc = atomic_fetch_inc(&lkb->lkb_wait_count);
+	DLM_ASSERT(!wc, dlm_print_lkb(lkb); printk("wait_count %d\n", wc););
 	lkb->lkb_wait_type = mstype;
 	lkb->lkb_wait_nodeid = to_nodeid; /* for debugging */
 	hold_lkb(lkb);
@@ -1504,7 +1502,7 @@ static int _remove_from_waiters(struct dlm_lkb *lkb, int mstype,
 		log_debug(ls, "remwait %x convert_reply zap overlap_cancel",
 			  lkb->lkb_id);
 		lkb->lkb_wait_type = 0;
-		lkb->lkb_wait_count--;
+		atomic_dec(&lkb->lkb_wait_count);
 		unhold_lkb(lkb);
 		goto out_del;
 	}
@@ -1531,16 +1529,15 @@ static int _remove_from_waiters(struct dlm_lkb *lkb, int mstype,
 	if (overlap_done && lkb->lkb_wait_type) {
 		log_error(ls, "remwait error %x reply %d wait_type %d overlap",
 			  lkb->lkb_id, mstype, lkb->lkb_wait_type);
-		lkb->lkb_wait_count--;
+		atomic_dec(&lkb->lkb_wait_count);
 		unhold_lkb(lkb);
 		lkb->lkb_wait_type = 0;
 	}
 
-	DLM_ASSERT(lkb->lkb_wait_count, dlm_print_lkb(lkb););
+	DLM_ASSERT(atomic_read(&lkb->lkb_wait_count), dlm_print_lkb(lkb););
 
 	clear_bit(DLM_IFL_RESEND_BIT, &lkb->lkb_iflags);
-	lkb->lkb_wait_count--;
-	if (!lkb->lkb_wait_count)
+	if (atomic_dec_and_test(&lkb->lkb_wait_count))
 		list_del_init(&lkb->lkb_wait_reply);
 	unhold_lkb(lkb);
 	return 0;
@@ -2669,7 +2666,7 @@ static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 			goto out;
 
 		/* lock not allowed if there's any op in progress */
-		if (lkb->lkb_wait_type || lkb->lkb_wait_count)
+		if (lkb->lkb_wait_type || atomic_read(&lkb->lkb_wait_count))
 			goto out;
 
 		if (is_overlap(lkb))
@@ -2731,7 +2728,7 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 
 	/* normal unlock not allowed if there's any op in progress */
 	if (!(args->flags & (DLM_LKF_CANCEL | DLM_LKF_FORCEUNLOCK)) &&
-	    (lkb->lkb_wait_type || lkb->lkb_wait_count))
+	    (lkb->lkb_wait_type || atomic_read(&lkb->lkb_wait_count)))
 		goto out;
 
 	/* an lkb may be waiting for an rsb lookup to complete where the
@@ -5066,10 +5063,9 @@ int dlm_recover_waiters_post(struct dlm_ls *ls)
 		/* drop all wait_count references we still
 		 * hold a reference for this iteration.
 		 */
-		while (lkb->lkb_wait_count) {
-			lkb->lkb_wait_count--;
+		while (!atomic_dec_and_test(&lkb->lkb_wait_count))
 			unhold_lkb(lkb);
-		}
+
 		mutex_lock(&ls->ls_waiters_mutex);
 		list_del_init(&lkb->lkb_wait_reply);
 		mutex_unlock(&ls->ls_waiters_mutex);
-- 
2.31.1

