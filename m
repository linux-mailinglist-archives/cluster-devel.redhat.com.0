Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBEE593A7B
	for <lists+cluster-devel@lfdr.de>; Mon, 15 Aug 2022 21:43:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660592620;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/2O2fb5KzmBi5XcFxRhSW73jKBDNAhBJnGnCwB4qNB4=;
	b=E4tdvq7hWGlLlJ70Xzlq1vof+P2+x6gJk+RSabvWZRULzeqUK7cUvr4pOV6OUP82//aZZz
	6VW+H/TbL43klLsPmbff3e3WCN/fSYDj2dNc2FKYVpUL0gVvYkMuNFyUsaxFHKI8omYw/4
	3XUcmwE+oTgJPDnefW8KSfLGCBr7I5I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-O7NSfd_FN6mTspgAa-SgEg-1; Mon, 15 Aug 2022 15:43:37 -0400
X-MC-Unique: O7NSfd_FN6mTspgAa-SgEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 089EA38005D4;
	Mon, 15 Aug 2022 19:43:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EFE0A1121319;
	Mon, 15 Aug 2022 19:43:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4B7EC194035E;
	Mon, 15 Aug 2022 19:43:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C9408194034C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 15 Aug 2022 19:43:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 64142112131B; Mon, 15 Aug 2022 19:43:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BB731121315;
 Mon, 15 Aug 2022 19:43:31 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 15 Aug 2022 15:43:23 -0400
Message-Id: <20220815194328.2208580-12-aahringo@redhat.com>
In-Reply-To: <20220815194328.2208580-1-aahringo@redhat.com>
References: <20220815194328.2208580-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [RESEND dlm/next 11/16] fs: dlm: change
 ls_clear_proc_locks to spinlock
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch changes the ls_clear_proc_locks to a spinlock because there
is no need to handle it as a mutex as there is no sleepable context when
ls_clear_proc_locks is held. This allows us to call those functionality
in non-sleepable contexts.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h | 2 +-
 fs/dlm/lock.c         | 8 ++++----
 fs/dlm/lockspace.c    | 2 +-
 fs/dlm/user.c         | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 8aca8085d24e..e34c3d2639a5 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -661,7 +661,7 @@ struct dlm_ls {
 	spinlock_t		ls_recover_idr_lock;
 	wait_queue_head_t	ls_wait_general;
 	wait_queue_head_t	ls_recover_lock_wait;
-	struct mutex		ls_clear_proc_locks;
+	spinlock_t		ls_clear_proc_locks;
 
 	struct list_head	ls_root_list;	/* root resources */
 	struct rw_semaphore	ls_root_sem;	/* protect root_list */
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index c41aa8ab3230..65a7a0631ec8 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -6215,7 +6215,7 @@ static struct dlm_lkb *del_proc_lock(struct dlm_ls *ls,
 {
 	struct dlm_lkb *lkb = NULL;
 
-	mutex_lock(&ls->ls_clear_proc_locks);
+	spin_lock(&ls->ls_clear_proc_locks);
 	if (list_empty(&proc->locks))
 		goto out;
 
@@ -6227,7 +6227,7 @@ static struct dlm_lkb *del_proc_lock(struct dlm_ls *ls,
 	else
 		lkb->lkb_flags |= DLM_IFL_DEAD;
  out:
-	mutex_unlock(&ls->ls_clear_proc_locks);
+	spin_unlock(&ls->ls_clear_proc_locks);
 	return lkb;
 }
 
@@ -6264,7 +6264,7 @@ void dlm_clear_proc_locks(struct dlm_ls *ls, struct dlm_user_proc *proc)
 		dlm_put_lkb(lkb);
 	}
 
-	mutex_lock(&ls->ls_clear_proc_locks);
+	spin_lock(&ls->ls_clear_proc_locks);
 
 	/* in-progress unlocks */
 	list_for_each_entry_safe(lkb, safe, &proc->unlocking, lkb_ownqueue) {
@@ -6280,7 +6280,7 @@ void dlm_clear_proc_locks(struct dlm_ls *ls, struct dlm_user_proc *proc)
 		dlm_put_lkb(lkb);
 	}
 
-	mutex_unlock(&ls->ls_clear_proc_locks);
+	spin_unlock(&ls->ls_clear_proc_locks);
 	dlm_unlock_recovery(ls);
 }
 
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 56c79926e7be..41a6504cfab5 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -584,7 +584,7 @@ static int new_lockspace(const char *name, const char *cluster,
 	atomic_set(&ls->ls_requestqueue_cnt, 0);
 	init_waitqueue_head(&ls->ls_requestqueue_wait);
 	mutex_init(&ls->ls_requestqueue_mutex);
-	mutex_init(&ls->ls_clear_proc_locks);
+	spin_lock_init(&ls->ls_clear_proc_locks);
 
 	/* Due backwards compatibility with 3.1 we need to use maximum
 	 * possible dlm message size to be sure the message will fit and
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index 99e8f0744513..df6215c73239 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -184,7 +184,7 @@ void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
 		return;
 
 	ls = lkb->lkb_resource->res_ls;
-	mutex_lock(&ls->ls_clear_proc_locks);
+	spin_lock(&ls->ls_clear_proc_locks);
 
 	/* If ORPHAN/DEAD flag is set, it means the process is dead so an ast
 	   can't be delivered.  For ORPHAN's, dlm_clear_proc_locks() freed
@@ -230,7 +230,7 @@ void dlm_user_add_ast(struct dlm_lkb *lkb, uint32_t flags, int mode,
 		spin_unlock(&proc->locks_spin);
 	}
  out:
-	mutex_unlock(&ls->ls_clear_proc_locks);
+	spin_unlock(&ls->ls_clear_proc_locks);
 }
 
 static int device_user_lock(struct dlm_user_proc *proc,
-- 
2.31.1

