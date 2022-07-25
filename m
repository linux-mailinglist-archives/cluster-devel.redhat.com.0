Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC4E5805CB
	for <lists+cluster-devel@lfdr.de>; Mon, 25 Jul 2022 22:38:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658781532;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TFks5NMd4f1nVcmXW8iPb003X6v5Rn8Pambi3h60UGU=;
	b=g5Rutw925DZwmYSPGA7URcOzdOY44GHOWUN5G/EfKnlaQyEcDGsKwVm7nTenjUOlUMlo8q
	oxD02IyPw2Lb1Nu+5AgFdDTtGvwUXVntam68ZVAr04UUkjDli9m3UlbarueNASIcZ46NVc
	h2fk6ENbU4J6N5mDrJjmnaL3rAvLrEI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-MkviAtEfPim2nEPC-jJPiA-1; Mon, 25 Jul 2022 16:38:48 -0400
X-MC-Unique: MkviAtEfPim2nEPC-jJPiA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F29F3811767;
	Mon, 25 Jul 2022 20:38:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E30C31415123;
	Mon, 25 Jul 2022 20:38:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 638D21945D98;
	Mon, 25 Jul 2022 20:38:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 378561945D86 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 25 Jul 2022 20:38:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1A3F3403D0CA; Mon, 25 Jul 2022 20:38:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0B13403D0D9;
 Mon, 25 Jul 2022 20:38:44 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 25 Jul 2022 16:38:32 -0400
Message-Id: <20220725203835.860277-3-aahringo@redhat.com>
In-Reply-To: <20220725203835.860277-1-aahringo@redhat.com>
References: <20220725203835.860277-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm/next 2/5] fs: dlm: change
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
Cc: linux-raid@vger.kernel.org, joseph.qi@linux.alibaba.com, mark@fasheh.com,
 cluster-devel@redhat.com, song@kernel.org, jlbec@evilplan.org,
 ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
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
index 061fa96fc978..4c7ed4bec3f4 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -6208,7 +6208,7 @@ static struct dlm_lkb *del_proc_lock(struct dlm_ls *ls,
 {
 	struct dlm_lkb *lkb = NULL;
 
-	mutex_lock(&ls->ls_clear_proc_locks);
+	spin_lock(&ls->ls_clear_proc_locks);
 	if (list_empty(&proc->locks))
 		goto out;
 
@@ -6220,7 +6220,7 @@ static struct dlm_lkb *del_proc_lock(struct dlm_ls *ls,
 	else
 		lkb->lkb_flags |= DLM_IFL_DEAD;
  out:
-	mutex_unlock(&ls->ls_clear_proc_locks);
+	spin_unlock(&ls->ls_clear_proc_locks);
 	return lkb;
 }
 
@@ -6257,7 +6257,7 @@ void dlm_clear_proc_locks(struct dlm_ls *ls, struct dlm_user_proc *proc)
 		dlm_put_lkb(lkb);
 	}
 
-	mutex_lock(&ls->ls_clear_proc_locks);
+	spin_lock(&ls->ls_clear_proc_locks);
 
 	/* in-progress unlocks */
 	list_for_each_entry_safe(lkb, safe, &proc->unlocking, lkb_ownqueue) {
@@ -6273,7 +6273,7 @@ void dlm_clear_proc_locks(struct dlm_ls *ls, struct dlm_user_proc *proc)
 		dlm_put_lkb(lkb);
 	}
 
-	mutex_unlock(&ls->ls_clear_proc_locks);
+	spin_unlock(&ls->ls_clear_proc_locks);
 	dlm_unlock_recovery(ls);
 }
 
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 6e449abdc5f4..3cf4790dfb8b 100644
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
index 999918348b31..c6d38a06e94c 100644
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

