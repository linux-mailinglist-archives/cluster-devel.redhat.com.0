Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C71E5BB25B
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Sep 2022 20:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663353815;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vKa5KMWVJPDiTI1f4nzACXXyX3U339pqXfimbm0T1JQ=;
	b=ceR19mPb2auHXLD7CZPdv1ZLaXBJ5lyl74i2r1t060a/Hb9fw17/08+pST7z3oAjjngeMS
	vL2bmnSPGBdT5musra2S19uF6d22Jg+zIOEsosC6/ufrJ1zQ3zfYJxcbSo3TzpLDUpvuhC
	Pvv+CZodLzW2rjR9m807XQk6SGviKuM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-9dtsXiYkPHirJ1o6j_f6uA-1; Fri, 16 Sep 2022 14:43:31 -0400
X-MC-Unique: 9dtsXiYkPHirJ1o6j_f6uA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A167F1C0758E;
	Fri, 16 Sep 2022 18:43:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 523402166B29;
	Fri, 16 Sep 2022 18:43:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EC32619465A3;
	Fri, 16 Sep 2022 18:43:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0FA691946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 16 Sep 2022 18:43:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E89DD2166B29; Fri, 16 Sep 2022 18:43:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5C1B2166B26;
 Fri, 16 Sep 2022 18:43:26 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 16 Sep 2022 14:43:06 -0400
Message-Id: <20220916184309.3179451-3-aahringo@redhat.com>
In-Reply-To: <20220916184309.3179451-1-aahringo@redhat.com>
References: <20220916184309.3179451-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH/RFC dlm/next 3/6] fs: dlm: change the ls cb
 mutex to rw lock
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch changes the ls_cb_mutex to a rw lock. The hotpath in
dlm_add_cb() can be called by different lkbs at the same time. Currently
parallel dlm_add_cb() could block because the cb mutex. To change that
we using a rw lock and use a readers lock in dlm_add_cb() only. The cb
mutex is only needed that dlm_callback_suspend() and
dlm_callback_resume() cannot run at the same time as the specific part
in dlm_add_cb() those will use a writers lock to stop any callback
queueing in dlm_add_cb().

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c          | 12 ++++++------
 fs/dlm/dlm_internal.h |  2 +-
 fs/dlm/lockspace.c    |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 6e07c151ad28..43588c8ab5fc 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -200,13 +200,13 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
 	if (!prev_seq) {
 		kref_get(&lkb->lkb_ref);
 
-		mutex_lock(&ls->ls_cb_mutex);
+		read_lock(&ls->ls_cb_lock);
 		if (test_bit(LSFL_CB_DELAY, &ls->ls_flags)) {
 			list_add(&lkb->lkb_cb_list, &ls->ls_cb_delay);
 		} else {
 			queue_work(ls->ls_callback_wq, &lkb->lkb_cb_work);
 		}
-		mutex_unlock(&ls->ls_cb_mutex);
+		read_unlock(&ls->ls_cb_lock);
 	}
  out:
 	mutex_unlock(&lkb->lkb_cb_mutex);
@@ -289,9 +289,9 @@ void dlm_callback_stop(struct dlm_ls *ls)
 void dlm_callback_suspend(struct dlm_ls *ls)
 {
 	if (ls->ls_callback_wq) {
-		mutex_lock(&ls->ls_cb_mutex);
+		write_lock(&ls->ls_cb_lock);
 		set_bit(LSFL_CB_DELAY, &ls->ls_flags);
-		mutex_unlock(&ls->ls_cb_mutex);
+		write_unlock(&ls->ls_cb_lock);
 
 		flush_workqueue(ls->ls_callback_wq);
 	}
@@ -309,7 +309,7 @@ void dlm_callback_resume(struct dlm_ls *ls)
 		return;
 
 more:
-	mutex_lock(&ls->ls_cb_mutex);
+	write_lock(&ls->ls_cb_lock);
 	list_for_each_entry_safe(lkb, safe, &ls->ls_cb_delay, lkb_cb_list) {
 		list_del_init(&lkb->lkb_cb_list);
 		queue_work(ls->ls_callback_wq, &lkb->lkb_cb_work);
@@ -320,7 +320,7 @@ void dlm_callback_resume(struct dlm_ls *ls)
 	empty = list_empty(&ls->ls_cb_delay);
 	if (empty)
 		clear_bit(LSFL_CB_DELAY, &ls->ls_flags);
-	mutex_unlock(&ls->ls_cb_mutex);
+	write_unlock(&ls->ls_cb_lock);
 
 	sum += count;
 	if (!empty) {
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index e34c3d2639a5..67f928544d26 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -631,7 +631,7 @@ struct dlm_ls {
 
 	/* recovery related */
 
-	struct mutex		ls_cb_mutex;
+	rwlock_t		ls_cb_lock;
 	struct list_head	ls_cb_delay; /* save for queue_work later */
 	struct timer_list	ls_timer;
 	struct task_struct	*ls_recoverd_task;
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index bae050df7abf..b15956e82842 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -567,7 +567,7 @@ static int new_lockspace(const char *name, const char *cluster,
 	init_completion(&ls->ls_recovery_done);
 	ls->ls_recovery_result = -1;
 
-	mutex_init(&ls->ls_cb_mutex);
+	rwlock_init(&ls->ls_cb_lock);
 	INIT_LIST_HEAD(&ls->ls_cb_delay);
 
 	ls->ls_recoverd_task = NULL;
-- 
2.31.1

