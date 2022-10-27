Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AEE61031E
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Oct 2022 22:46:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666903570;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RooqqS/vJm02/Xo4rP5q6/xTF0fttqonQEcBNjoTn0Y=;
	b=VmYYeik6dbIZKcjinlDBUAoY7707ruoSIqsuosFias6ClxLc2A383fTjTu5LsOsGHjrmVn
	O2yKCV4KBssWA0cuC8CFJiL0X6qIKIGoTwauOaspJbdj6egJr39zlGJ3OcH1yNZGiGmoL5
	l/icTcLqsV26ofw0VQF1nneDRaYP8bY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-NeJ6wfI-OBW4YTxpC_yWSA-1; Thu, 27 Oct 2022 16:46:03 -0400
X-MC-Unique: NeJ6wfI-OBW4YTxpC_yWSA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 678878058E0;
	Thu, 27 Oct 2022 20:45:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 591D939D6A;
	Thu, 27 Oct 2022 20:45:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3869B19466DF;
	Thu, 27 Oct 2022 20:45:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 381BC1947066 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 20:45:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A4B7A112C095; Thu, 27 Oct 2022 20:45:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 816001121325;
 Thu, 27 Oct 2022 20:45:37 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Oct 2022 16:45:23 -0400
Message-Id: <20221027204528.1119036-13-aahringo@redhat.com>
In-Reply-To: <20221027204528.1119036-1-aahringo@redhat.com>
References: <20221027204528.1119036-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v6.1-rc1 13/18] fs: dlm: remove
 ls_remove_wait waitqueue
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch removes the ls_remove_wait waitqueue handling. The current
handling tries to wait before a lookup is send out for a identically
resource name which is going to be removed. Hereby the remove message
should be send out before the new lookup message. The reason is that
after a lookup request and response will actually use the specific
remote rsb. A followed remove message would delete the rsb on the remote
side but it's still being used.

To reach a similar behaviour we simple send the remove message out while
the rsb lookup lock is held and the rsb is removed from the toss list.
Other find_rsb() calls would never have the change to get a rsb back to
live while a remove message will be send out (without holding the lock).

This behaviour requires a non-sleepable context which should be provided
now and might be the reason why it was not implemented so in the first
place.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h |  4 ----
 fs/dlm/lock.c         | 56 ++-----------------------------------------
 fs/dlm/lockspace.c    |  3 ---
 3 files changed, 2 insertions(+), 61 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index c03f34fed5e9..167998abf034 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -592,11 +592,7 @@ struct dlm_ls {
 	int			ls_new_rsb_count;
 	struct list_head	ls_new_rsb;	/* new rsb structs */
 
-	spinlock_t		ls_remove_spin;
-	wait_queue_head_t	ls_remove_wait;
-	char			ls_remove_name[DLM_RESNAME_MAXLEN+1];
 	char			*ls_remove_names[DLM_REMOVE_NAMES_MAX];
-	int			ls_remove_len;
 	int			ls_remove_lens[DLM_REMOVE_NAMES_MAX];
 
 	struct list_head	ls_nodes;	/* current nodes in ls */
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index a2930e33c134..e1adfa5aed05 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1589,37 +1589,6 @@ static int remove_from_waiters_ms(struct dlm_lkb *lkb, struct dlm_message *ms)
 	return error;
 }
 
-/* If there's an rsb for the same resource being removed, ensure
- * that the remove message is sent before the new lookup message.
- */
-
-#define DLM_WAIT_PENDING_COND(ls, r)		\
-	(ls->ls_remove_len &&			\
-	 !rsb_cmp(r, ls->ls_remove_name,	\
-		  ls->ls_remove_len))
-
-static void wait_pending_remove(struct dlm_rsb *r)
-{
-	struct dlm_ls *ls = r->res_ls;
- restart:
-	spin_lock(&ls->ls_remove_spin);
-	if (DLM_WAIT_PENDING_COND(ls, r)) {
-		log_debug(ls, "delay lookup for remove dir %d %s",
-			  r->res_dir_nodeid, r->res_name);
-		spin_unlock(&ls->ls_remove_spin);
-		wait_event(ls->ls_remove_wait, !DLM_WAIT_PENDING_COND(ls, r));
-		goto restart;
-	}
-	spin_unlock(&ls->ls_remove_spin);
-}
-
-/*
- * ls_remove_spin protects ls_remove_name and ls_remove_len which are
- * read by other threads in wait_pending_remove.  ls_remove_names
- * and ls_remove_lens are only used by the scan thread, so they do
- * not need protection.
- */
-
 static void shrink_bucket(struct dlm_ls *ls, int b)
 {
 	struct rb_node *n, *next;
@@ -1701,11 +1670,6 @@ static void shrink_bucket(struct dlm_ls *ls, int b)
 	 * list and sending the removal.  Keeping this gap small is
 	 * important to keep us (the master node) from being out of sync
 	 * with the remote dir node for very long.
-	 *
-	 * From the time the rsb is removed from toss until just after
-	 * send_remove, the rsb name is saved in ls_remove_name.  A new
-	 * lookup checks this to ensure that a new lookup message for the
-	 * same resource name is not sent just before the remove message.
 	 */
 
 	for (i = 0; i < remote_count; i++) {
@@ -1752,22 +1716,8 @@ static void shrink_bucket(struct dlm_ls *ls, int b)
 		}
 
 		rb_erase(&r->res_hashnode, &ls->ls_rsbtbl[b].toss);
-
-		/* block lookup of same name until we've sent remove */
-		spin_lock(&ls->ls_remove_spin);
-		ls->ls_remove_len = len;
-		memcpy(ls->ls_remove_name, name, DLM_RESNAME_MAXLEN);
-		spin_unlock(&ls->ls_remove_spin);
-		spin_unlock(&ls->ls_rsbtbl[b].lock);
-
 		send_remove(r);
-
-		/* allow lookup of name again */
-		spin_lock(&ls->ls_remove_spin);
-		ls->ls_remove_len = 0;
-		memset(ls->ls_remove_name, 0, DLM_RESNAME_MAXLEN);
-		spin_unlock(&ls->ls_remove_spin);
-		wake_up(&ls->ls_remove_wait);
+		spin_unlock(&ls->ls_rsbtbl[b].lock);
 
 		dlm_free_rsb(r);
 	}
@@ -2718,8 +2668,6 @@ static int set_master(struct dlm_rsb *r, struct dlm_lkb *lkb)
 		return 0;
 	}
 
-	wait_pending_remove(r);
-
 	r->res_first_lkid = lkb->lkb_id;
 	send_lookup(r, lkb);
 	return 1;
@@ -3813,7 +3761,7 @@ static int send_remove(struct dlm_rsb *r)
 	to_nodeid = dlm_dir_nodeid(r);
 
 	error = create_message(r, NULL, to_nodeid, DLM_MSG_REMOVE, &ms, &mh,
-			       GFP_NOFS);
+			       GFP_ATOMIC);
 	if (error)
 		goto out;
 
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 72fa8a9d7a40..c438b909f221 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -524,9 +524,6 @@ static int new_lockspace(const char *name, const char *cluster,
 		spin_lock_init(&ls->ls_rsbtbl[i].lock);
 	}
 
-	spin_lock_init(&ls->ls_remove_spin);
-	init_waitqueue_head(&ls->ls_remove_wait);
-
 	for (i = 0; i < DLM_REMOVE_NAMES_MAX; i++) {
 		ls->ls_remove_names[i] = kzalloc(DLM_RESNAME_MAXLEN+1,
 						 GFP_KERNEL);
-- 
2.31.1

