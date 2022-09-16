Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 649E35BB25C
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Sep 2022 20:43:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663353816;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WtemOQsAnrE4Fwai1P3V5Xakb8EsgCbCzKFq8/k4XW8=;
	b=EiFie9rtrKbeDuFR5fAU9bZlk+EkWh5uMZ7TjlAF+Ez1lydawjvxzDkbqx3093z/a1Bf+y
	rrTeyM9p0c04Hsb74VvkOl1u/DOrHmCK1hJsfT2PoWBKWy2qDFRSb1yi4ofSbEmc9sCcdk
	pic6P+6R78RcptXsrAq2qDfcvz178DM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-GNtKHWEZPrSU-XY51sNH6Q-1; Fri, 16 Sep 2022 14:43:31 -0400
X-MC-Unique: GNtKHWEZPrSU-XY51sNH6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A172F3C11726;
	Fri, 16 Sep 2022 18:43:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88C7F140EBF3;
	Fri, 16 Sep 2022 18:43:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 03A3019465B2;
	Fri, 16 Sep 2022 18:43:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 53C321946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 16 Sep 2022 18:43:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 36B722166B2D; Fri, 16 Sep 2022 18:43:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED8A32166B26;
 Fri, 16 Sep 2022 18:43:26 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 16 Sep 2022 14:43:07 -0400
Message-Id: <20220916184309.3179451-4-aahringo@redhat.com>
In-Reply-To: <20220916184309.3179451-1-aahringo@redhat.com>
References: <20220916184309.3179451-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH/RFC dlm/next 4/6] fs: dlm: use spin lock
 instead of mutex
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

There is no need to use a mutex in those hot path sections. We change it
to spin lock to serve callbacks more faster by not allowing schedule.
The locked sections will not be locked for a long time.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c          | 8 ++++----
 fs/dlm/dlm_internal.h | 2 +-
 fs/dlm/lock.c         | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 43588c8ab5fc..314ce5c7cd66 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -190,7 +190,7 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
 		return;
 	}
 
-	mutex_lock(&lkb->lkb_cb_mutex);
+	spin_lock(&lkb->lkb_cb_lock);
 	prev_seq = lkb->lkb_callbacks[0].seq;
 
 	rv = dlm_add_lkb_callback(lkb, flags, mode, status, sbflags, new_seq);
@@ -209,7 +209,7 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
 		read_unlock(&ls->ls_cb_lock);
 	}
  out:
-	mutex_unlock(&lkb->lkb_cb_mutex);
+	spin_unlock(&lkb->lkb_cb_lock);
 }
 
 void dlm_callback_work(struct work_struct *work)
@@ -223,7 +223,7 @@ void dlm_callback_work(struct work_struct *work)
 
 	memset(&callbacks, 0, sizeof(callbacks));
 
-	mutex_lock(&lkb->lkb_cb_mutex);
+	spin_lock(&lkb->lkb_cb_lock);
 	if (!lkb->lkb_callbacks[0].seq) {
 		/* no callback work exists, shouldn't happen */
 		log_error(ls, "dlm_callback_work %x no work", lkb->lkb_id);
@@ -244,7 +244,7 @@ void dlm_callback_work(struct work_struct *work)
 		dlm_print_lkb(lkb);
 		dlm_dump_lkb_callbacks(lkb);
 	}
-	mutex_unlock(&lkb->lkb_cb_mutex);
+	spin_unlock(&lkb->lkb_cb_lock);
 
 	castfn = lkb->lkb_astfn;
 	bastfn = lkb->lkb_bastfn;
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 67f928544d26..e5a5d0b16392 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -268,7 +268,7 @@ struct dlm_lkb {
 	unsigned long		lkb_timeout_cs;
 #endif
 
-	struct mutex		lkb_cb_mutex;
+	spinlock_t		lkb_cb_lock;
 	struct work_struct	lkb_cb_work;
 	struct list_head	lkb_cb_list; /* for ls_cb_delay or proc->asts */
 	struct dlm_callback	lkb_callbacks[DLM_CALLBACKS_SIZE];
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 1b4b62f2ea02..5a04d306a684 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1218,7 +1218,7 @@ static int _create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret,
 	INIT_LIST_HEAD(&lkb->lkb_time_list);
 #endif
 	INIT_LIST_HEAD(&lkb->lkb_cb_list);
-	mutex_init(&lkb->lkb_cb_mutex);
+	spin_lock_init(&lkb->lkb_cb_lock);
 	INIT_WORK(&lkb->lkb_cb_work, dlm_callback_work);
 
 	idr_preload(GFP_NOFS);
-- 
2.31.1

