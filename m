Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E76E761031A
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Oct 2022 22:46:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666903568;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oVu7nXM5I6bNyMI/c81KCRUX3aifjKAl0vmDWxVMWWw=;
	b=aXEH2pvp60gTnLUILmEClW11X7GrgGVg3LyQdQ6H5O2Z8cNDroTr9A8OLxAULj3bSH2oBv
	l1vcudjNMRt31hfUlPF7DlhTj2Drn6QAGr5JFIO2oezAPiJJwgQf/47J6Eov7OsIHcabuK
	2OnjXgDvvbzX9MSvwxpZBvA92m/pEks=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-a-bui28bMciI64HuVHC7Rg-1; Thu, 27 Oct 2022 16:46:06 -0400
X-MC-Unique: a-bui28bMciI64HuVHC7Rg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C428F801CF7;
	Thu, 27 Oct 2022 20:45:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B54ED2022AA5;
	Thu, 27 Oct 2022 20:45:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5DD551946A7F;
	Thu, 27 Oct 2022 20:45:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 326CB1946597 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 20:45:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C2D07112C082; Thu, 27 Oct 2022 20:45:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E6221121325;
 Thu, 27 Oct 2022 20:45:36 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Oct 2022 16:45:18 -0400
Message-Id: <20221027204528.1119036-8-aahringo@redhat.com>
In-Reply-To: <20221027204528.1119036-1-aahringo@redhat.com>
References: <20221027204528.1119036-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v6.1-rc1 08/18] fs: dlm: convert ls_cb_mutex
 mutex to spinlock
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch converts the ls_cb_mutex mutex to a spinlock, there is no
sleepable context when this lock is held.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/ast.c          | 12 ++++++------
 fs/dlm/dlm_internal.h |  2 +-
 fs/dlm/lockspace.c    |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 6e07c151ad28..daaa0dff6ef4 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -200,13 +200,13 @@ void dlm_add_cb(struct dlm_lkb *lkb, uint32_t flags, int mode, int status,
 	if (!prev_seq) {
 		kref_get(&lkb->lkb_ref);
 
-		mutex_lock(&ls->ls_cb_mutex);
+		spin_lock(&ls->ls_cb_lock);
 		if (test_bit(LSFL_CB_DELAY, &ls->ls_flags)) {
 			list_add(&lkb->lkb_cb_list, &ls->ls_cb_delay);
 		} else {
 			queue_work(ls->ls_callback_wq, &lkb->lkb_cb_work);
 		}
-		mutex_unlock(&ls->ls_cb_mutex);
+		spin_unlock(&ls->ls_cb_lock);
 	}
  out:
 	mutex_unlock(&lkb->lkb_cb_mutex);
@@ -289,9 +289,9 @@ void dlm_callback_stop(struct dlm_ls *ls)
 void dlm_callback_suspend(struct dlm_ls *ls)
 {
 	if (ls->ls_callback_wq) {
-		mutex_lock(&ls->ls_cb_mutex);
+		spin_lock(&ls->ls_cb_lock);
 		set_bit(LSFL_CB_DELAY, &ls->ls_flags);
-		mutex_unlock(&ls->ls_cb_mutex);
+		spin_unlock(&ls->ls_cb_lock);
 
 		flush_workqueue(ls->ls_callback_wq);
 	}
@@ -309,7 +309,7 @@ void dlm_callback_resume(struct dlm_ls *ls)
 		return;
 
 more:
-	mutex_lock(&ls->ls_cb_mutex);
+	spin_lock(&ls->ls_cb_lock);
 	list_for_each_entry_safe(lkb, safe, &ls->ls_cb_delay, lkb_cb_list) {
 		list_del_init(&lkb->lkb_cb_list);
 		queue_work(ls->ls_callback_wq, &lkb->lkb_cb_work);
@@ -320,7 +320,7 @@ void dlm_callback_resume(struct dlm_ls *ls)
 	empty = list_empty(&ls->ls_cb_delay);
 	if (empty)
 		clear_bit(LSFL_CB_DELAY, &ls->ls_flags);
-	mutex_unlock(&ls->ls_cb_mutex);
+	spin_unlock(&ls->ls_cb_lock);
 
 	sum += count;
 	if (!empty) {
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index e34c3d2639a5..647a6a61531c 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -631,7 +631,7 @@ struct dlm_ls {
 
 	/* recovery related */
 
-	struct mutex		ls_cb_mutex;
+	spinlock_t		ls_cb_lock;
 	struct list_head	ls_cb_delay; /* save for queue_work later */
 	struct timer_list	ls_timer;
 	struct task_struct	*ls_recoverd_task;
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index bae050df7abf..72fa8a9d7a40 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -567,7 +567,7 @@ static int new_lockspace(const char *name, const char *cluster,
 	init_completion(&ls->ls_recovery_done);
 	ls->ls_recovery_result = -1;
 
-	mutex_init(&ls->ls_cb_mutex);
+	spin_lock_init(&ls->ls_cb_lock);
 	INIT_LIST_HEAD(&ls->ls_cb_delay);
 
 	ls->ls_recoverd_task = NULL;
-- 
2.31.1

