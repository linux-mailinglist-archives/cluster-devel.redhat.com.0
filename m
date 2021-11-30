Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 818BB463ECA
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Nov 2021 20:47:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638301677;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UJK3ZOZoxTM5P2MWKyl7CBRlxc1hTt/xrESxkagrA9Y=;
	b=Nf5WBuKV3U3olhCZlL7qgBTPfrBqMdTDkH5VzMtHJNKSj8BqKsvsbm44b9zTYtNTZas769
	hcTvfEUUCLSOb1ciJ/rannnepMdfux/RYXnTpkyo0bzL04ZrbcUUYIhVhDc1QUoU6DkAbx
	26YdWDVZvJUyzVBWC3CmtX3pvnwP4zY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-Au4tIYZQPiSp9H21bpk7EA-1; Tue, 30 Nov 2021 14:47:53 -0500
X-MC-Unique: Au4tIYZQPiSp9H21bpk7EA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD4B083DCD3;
	Tue, 30 Nov 2021 19:47:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6A0310013D7;
	Tue, 30 Nov 2021 19:47:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 370844BB7C;
	Tue, 30 Nov 2021 19:47:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AUJlhOu022131 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Nov 2021 14:47:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DDFE445D6B; Tue, 30 Nov 2021 19:47:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8120A67842;
	Tue, 30 Nov 2021 19:47:43 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 30 Nov 2021 14:47:16 -0500
Message-Id: <20211130194720.666400-3-aahringo@redhat.com>
In-Reply-To: <20211130194720.666400-1-aahringo@redhat.com>
References: <20211130194720.666400-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 3/7] fs: dlm: use event based wait
	for pending remove
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will use an event based waitqueue to wait for a possible clash
with the ls_remove_name field of dlm_ls instead of doing busy waiting.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h |  1 +
 fs/dlm/lock.c         | 19 ++++++++++++-------
 fs/dlm/lockspace.c    |  1 +
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 019931804af9..74a9590a4dd5 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -576,6 +576,7 @@ struct dlm_ls {
 	struct list_head	ls_new_rsb;	/* new rsb structs */
 
 	spinlock_t		ls_remove_spin;
+	wait_queue_head_t	ls_remove_wait;
 	char			ls_remove_name[DLM_RESNAME_MAXLEN+1];
 	char			*ls_remove_names[DLM_REMOVE_NAMES_MAX];
 	int			ls_remove_len;
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 54705d367076..bdb51d209ba2 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1626,21 +1626,24 @@ static int remove_from_waiters_ms(struct dlm_lkb *lkb, struct dlm_message *ms)
 }
 
 /* If there's an rsb for the same resource being removed, ensure
-   that the remove message is sent before the new lookup message.
-   It should be rare to need a delay here, but if not, then it may
-   be worthwhile to add a proper wait mechanism rather than a delay. */
+ * that the remove message is sent before the new lookup message.
+ */
+
+#define DLM_WAIT_PENDING_COND(ls, r)		\
+	(ls->ls_remove_len &&			\
+	 !rsb_cmp(r, ls->ls_remove_name,	\
+		  ls->ls_remove_len))
 
 static void wait_pending_remove(struct dlm_rsb *r)
 {
 	struct dlm_ls *ls = r->res_ls;
  restart:
 	spin_lock(&ls->ls_remove_spin);
-	if (ls->ls_remove_len &&
-	    !rsb_cmp(r, ls->ls_remove_name, ls->ls_remove_len)) {
+	if (DLM_WAIT_PENDING_COND(ls, r)) {
 		log_debug(ls, "delay lookup for remove dir %d %s",
-		  	  r->res_dir_nodeid, r->res_name);
+			  r->res_dir_nodeid, r->res_name);
 		spin_unlock(&ls->ls_remove_spin);
-		msleep(1);
+		wait_event(ls->ls_remove_wait, !DLM_WAIT_PENDING_COND(ls, r));
 		goto restart;
 	}
 	spin_unlock(&ls->ls_remove_spin);
@@ -1792,6 +1795,7 @@ static void shrink_bucket(struct dlm_ls *ls, int b)
 		memcpy(ls->ls_remove_name, name, DLM_RESNAME_MAXLEN);
 		spin_unlock(&ls->ls_remove_spin);
 		spin_unlock(&ls->ls_rsbtbl[b].lock);
+		wake_up(&ls->ls_remove_wait);
 
 		send_remove(r);
 
@@ -4075,6 +4079,7 @@ static void send_repeat_remove(struct dlm_ls *ls, char *ms_name, int len)
 	memcpy(ls->ls_remove_name, name, DLM_RESNAME_MAXLEN);
 	spin_unlock(&ls->ls_remove_spin);
 	spin_unlock(&ls->ls_rsbtbl[b].lock);
+	wake_up(&ls->ls_remove_wait);
 
 	rv = _create_message(ls, sizeof(struct dlm_message) + len,
 			     dir_nodeid, DLM_MSG_REMOVE, &ms, &mh);
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 2e51bd2bdacc..31384e7d6f90 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -512,6 +512,7 @@ static int new_lockspace(const char *name, const char *cluster,
 	}
 
 	spin_lock_init(&ls->ls_remove_spin);
+	init_waitqueue_head(&ls->ls_remove_wait);
 
 	for (i = 0; i < DLM_REMOVE_NAMES_MAX; i++) {
 		ls->ls_remove_names[i] = kzalloc(DLM_RESNAME_MAXLEN+1,
-- 
2.27.0

