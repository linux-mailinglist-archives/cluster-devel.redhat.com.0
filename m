Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4A557D64F
	for <lists+cluster-devel@lfdr.de>; Thu, 21 Jul 2022 23:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658440455;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rcfNYTFwyREDaV1Nfvkh12HnpQ13aA8Y/GR8maGj63A=;
	b=TqdP8f58sYQrp+VEbkbQt0x+ipB4G+Aw2F6mbSi5sQO1cs1bMgY7zx/O61GXRs8CwQ5ZEO
	cJAoHaIZ06ICQJ+l46zMZm1m5xIzcmBklTDEudMm1dHwPv1X3RrY7RCrtWr1AauOcu817u
	lmCRnFlycMmzq+SzdCA8p1hNdRc8RBg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-II9iAUqvNmKpBWiIG5Ap4w-1; Thu, 21 Jul 2022 17:53:59 -0400
X-MC-Unique: II9iAUqvNmKpBWiIG5Ap4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D35FD1857F07;
	Thu, 21 Jul 2022 21:53:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE29C90A11;
	Thu, 21 Jul 2022 21:53:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2DCF31953559;
	Thu, 21 Jul 2022 21:53:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0619B1953544 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 21 Jul 2022 21:53:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EDA9A2024CB7; Thu, 21 Jul 2022 21:53:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA1E62026D64;
 Thu, 21 Jul 2022 21:53:50 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 21 Jul 2022 17:53:40 -0400
Message-Id: <20220721215340.936838-4-aahringo@redhat.com>
In-Reply-To: <20220721215340.936838-1-aahringo@redhat.com>
References: <20220721215340.936838-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Cluster-devel] [PATCH dlm/next 3/3] fs: dlm: fix refcount handling
 for dlm_add_cb()
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Each time dlm_add_cb() queues work or adds the lkb for queuing later to
the ls->ls_cb_delay list it increments a refcount. However if the work
is already queued or being added to the list we need to revert the
incrementation of the refcount. The function dlm_add_cb() can be called
multiple times without handling the related dlm_callback_work() work
function where it's get a put call. This patch reverts the kref_get()
when it's necessary in cases if already queued or not.

In case of dlm_callback_resume() we need to ensure that the
LSFL_CB_DELAY bit is cleared after all ls->ls_cb_delay lkbs are queued for
work. As the ls->ls_cb_delay list handling is there for queuing work for
later it should not be the case that a work was already queued, if so we
drop a warning.

Cc: stable@vger.kernel.org
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 0271796d36b1..68e09ed8234e 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -177,6 +177,7 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
 {
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
 	uint64_t new_seq, prev_seq;
+	bool queued = true;
 	int rv;
 
 	spin_lock(&dlm_cb_seq_spin);
@@ -202,13 +203,19 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
 
 		mutex_lock(&ls->ls_cb_mutex);
 		if (test_bit(LSFL_CB_DELAY, &ls->ls_flags)) {
-			if (list_empty(&lkb->lkb_cb_list))
+			if (list_empty(&lkb->lkb_cb_list)) {
 				list_add(&lkb->lkb_cb_list, &ls->ls_cb_delay);
+				queued = false;
+			}
 		} else {
-			queue_work(ls->ls_callback_wq, &lkb->lkb_cb_work);
+			queued = !queue_work(ls->ls_callback_wq, &lkb->lkb_cb_work);
 		}
 		mutex_unlock(&ls->ls_cb_mutex);
+
+		if (queued)
+			dlm_put_lkb(lkb);
 	}
+
  out:
 	mutex_unlock(&lkb->lkb_cb_mutex);
 }
@@ -303,9 +310,7 @@ void dlm_callback_resume(struct dlm_ls *ls)
 {
 	struct dlm_lkb *lkb, *safe;
 	int count = 0, sum = 0;
-	bool empty;
-
-	clear_bit(LSFL_CB_DELAY, &ls->ls_flags);
+	bool empty, queued;
 
 	if (!ls->ls_callback_wq)
 		return;
@@ -314,12 +319,16 @@ void dlm_callback_resume(struct dlm_ls *ls)
 	mutex_lock(&ls->ls_cb_mutex);
 	list_for_each_entry_safe(lkb, safe, &ls->ls_cb_delay, lkb_cb_list) {
 		list_del_init(&lkb->lkb_cb_list);
-		queue_work(ls->ls_callback_wq, &lkb->lkb_cb_work);
+		queued = queue_work(ls->ls_callback_wq, &lkb->lkb_cb_work);
+		WARN_ON_ONCE(!queued);
+
 		count++;
 		if (count == MAX_CB_QUEUE)
 			break;
 	}
 	empty = list_empty(&ls->ls_cb_delay);
+	if (empty)
+		clear_bit(LSFL_CB_DELAY, &ls->ls_flags);
 	mutex_unlock(&ls->ls_cb_mutex);
 
 	sum += count;
-- 
2.31.1

