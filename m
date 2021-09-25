Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAAC417EA2
	for <lists+cluster-devel@lfdr.de>; Sat, 25 Sep 2021 02:31:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632529867;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eYKjHpNPbRp774Ayx66DgzNRIJcpfs4q98J6TGJgHP8=;
	b=g2xCwNlUMdqsUlIcWD9zHc+81eSv4Si04CImCPXlK+/9mTnUnUhdQOil6+hxDZz1wmSvzP
	kdOOMxRE86XIJZAhXY3CTwa9YPz1Vqzr3aUa0c+LF5Y1HafqSioakRHEKPFBfvmtA8y+Xt
	Al8iY4E6dNTgZ+W986EoOh5nD9bh8S0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-krVnazCKOwqj55OHrFt1fw-1; Fri, 24 Sep 2021 20:31:06 -0400
X-MC-Unique: krVnazCKOwqj55OHrFt1fw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4B5F5074F;
	Sat, 25 Sep 2021 00:31:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D43CA60936;
	Sat, 25 Sep 2021 00:31:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BAFFA4E58F;
	Sat, 25 Sep 2021 00:31:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18P0V1Eu008935 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Sep 2021 20:31:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1B5E60936; Sat, 25 Sep 2021 00:31:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1D256060F;
	Sat, 25 Sep 2021 00:31:01 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 24 Sep 2021 20:30:13 -0400
Message-Id: <20210925003015.1862586-3-aahringo@redhat.com>
In-Reply-To: <20210925003015.1862586-1-aahringo@redhat.com>
References: <20210925003015.1862586-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 3/5] fs: dlm: requestqueue busy
	wait to event based wait
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch changes the requestqueue busy waiting algorithm to use
atomic counter values and wait_event() to wait until the requestqueue is
empty. It will slightly reduce the number of holding ls_requestqueue_mutex
mutex.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h |  2 ++
 fs/dlm/lockspace.c    |  2 ++
 fs/dlm/requestqueue.c | 15 +++++++--------
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index de6c9fb5dd30..fc6505067c80 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -632,6 +632,8 @@ struct dlm_ls {
 	struct rw_semaphore	ls_in_recovery;	/* block local requests */
 	struct rw_semaphore	ls_recv_active;	/* block dlm_recv */
 	struct list_head	ls_requestqueue;/* queue remote requests */
+	atomic_t		ls_requestqueue_cnt;
+	wait_queue_head_t	ls_requestqueue_wait;
 	struct mutex		ls_requestqueue_mutex;
 	struct dlm_rcom		*ls_recover_buf;
 	int			ls_recover_nodeid; /* for debugging */
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 353a0ee21467..de1c4af5eb8c 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -564,6 +564,8 @@ static int new_lockspace(const char *name, const char *cluster,
 	init_rwsem(&ls->ls_in_recovery);
 	init_rwsem(&ls->ls_recv_active);
 	INIT_LIST_HEAD(&ls->ls_requestqueue);
+	atomic_set(&ls->ls_requestqueue_cnt, 0);
+	init_waitqueue_head(&ls->ls_requestqueue_wait);
 	mutex_init(&ls->ls_requestqueue_mutex);
 	mutex_init(&ls->ls_clear_proc_locks);
 
diff --git a/fs/dlm/requestqueue.c b/fs/dlm/requestqueue.c
index e89e0ff8bfa3..d0cf68570dcf 100644
--- a/fs/dlm/requestqueue.c
+++ b/fs/dlm/requestqueue.c
@@ -44,6 +44,7 @@ void dlm_add_requestqueue(struct dlm_ls *ls, int nodeid, struct dlm_message *ms)
 	e->nodeid = nodeid;
 	memcpy(&e->request, ms, ms->m_header.h_length);
 
+	atomic_inc(&ls->ls_requestqueue_cnt);
 	mutex_lock(&ls->ls_requestqueue_mutex);
 	list_add_tail(&e->list, &ls->ls_requestqueue);
 	mutex_unlock(&ls->ls_requestqueue_mutex);
@@ -89,6 +90,8 @@ int dlm_process_requestqueue(struct dlm_ls *ls)
 
 		mutex_lock(&ls->ls_requestqueue_mutex);
 		list_del(&e->list);
+		if (atomic_dec_and_test(&ls->ls_requestqueue_cnt))
+			wake_up(&ls->ls_requestqueue_wait);
 		kfree(e);
 
 		if (dlm_locking_stopped(ls)) {
@@ -115,14 +118,8 @@ int dlm_process_requestqueue(struct dlm_ls *ls)
 
 void dlm_wait_requestqueue(struct dlm_ls *ls)
 {
-	for (;;) {
-		mutex_lock(&ls->ls_requestqueue_mutex);
-		if (list_empty(&ls->ls_requestqueue))
-			break;
-		mutex_unlock(&ls->ls_requestqueue_mutex);
-		schedule();
-	}
-	mutex_unlock(&ls->ls_requestqueue_mutex);
+	wait_event(ls->ls_requestqueue_wait,
+		   atomic_read(&ls->ls_requestqueue_cnt) == 0);
 }
 
 static int purge_request(struct dlm_ls *ls, struct dlm_message *ms, int nodeid)
@@ -161,6 +158,8 @@ void dlm_purge_requestqueue(struct dlm_ls *ls)
 
 		if (purge_request(ls, ms, e->nodeid)) {
 			list_del(&e->list);
+			if (atomic_dec_and_test(&ls->ls_requestqueue_cnt))
+				wake_up(&ls->ls_requestqueue_wait);
 			kfree(e);
 		}
 	}
-- 
2.27.0

