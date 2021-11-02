Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6344F44365B
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Nov 2021 20:18:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635880689;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z0PJXrBlyjcdeGW1BIrEkRuPMXRU1pm/ZOaEnTL56gg=;
	b=YUd9tK3BBd0nO1fOmeVSQu35wLUwXLh4U/5UCW3TYdw+ShmA834hYqCxB3cHIiMg7wn0zK
	4iGCmwTHb43b0Z4FiGM3zEOPOVNYyH/EcKmRUr30pnrU9mVOmcskH0FnByjy/X4ZHZ51qU
	0KoY2IaBPuWMP8sVAmzKN+2Anq8kPd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-CnBNagkiMVy1EcoKBMY81A-1; Tue, 02 Nov 2021 15:18:08 -0400
X-MC-Unique: CnBNagkiMVy1EcoKBMY81A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34FB0FC26;
	Tue,  2 Nov 2021 19:18:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 285F960657;
	Tue,  2 Nov 2021 19:18:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 75E904EA37;
	Tue,  2 Nov 2021 19:18:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A2JHwaQ020785 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Nov 2021 15:17:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B442260657; Tue,  2 Nov 2021 19:17:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 657EF652AC;
	Tue,  2 Nov 2021 19:17:58 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  2 Nov 2021 15:17:18 -0400
Message-Id: <20211102191724.210095-13-aahringo@redhat.com>
In-Reply-To: <20211102191724.210095-1-aahringo@redhat.com>
References: <20211102191724.210095-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND v5.15-rc7 12/18] fs: dlm: ls_count
	busy wait to event based wait
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch changes the ls_count busy wait to use atomic counter values
and wait_event() to wait until ls_count reach zero. It will slightly
reduce the number of holding lslist_lock. At remove lockspace we need to
retry the wait because it a lockspace get could interefere between
wait_event() and holding the lock which deletes the lockspace list entry.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h |  3 ++-
 fs/dlm/lockspace.c    | 33 +++++++++++++++++----------------
 fs/dlm/requestqueue.c |  2 +-
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index fd1c7a8c4485..019931804af9 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -548,8 +548,9 @@ struct dlm_ls {
 	uint32_t		ls_generation;
 	uint32_t		ls_exflags;
 	int			ls_lvblen;
-	int			ls_count;	/* refcount of processes in
+	atomic_t		ls_count;	/* refcount of processes in
 						   the dlm using this ls */
+	wait_queue_head_t	ls_count_wait;
 	int			ls_create_count; /* create/release refcount */
 	unsigned long		ls_flags;	/* LSFL_ */
 	unsigned long		ls_scan_time;
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 4e4181304ca1..2e51bd2bdacc 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -314,7 +314,7 @@ struct dlm_ls *dlm_find_lockspace_global(uint32_t id)
 
 	list_for_each_entry(ls, &lslist, ls_list) {
 		if (ls->ls_global_id == id) {
-			ls->ls_count++;
+			atomic_inc(&ls->ls_count);
 			goto out;
 		}
 	}
@@ -331,7 +331,7 @@ struct dlm_ls *dlm_find_lockspace_local(dlm_lockspace_t *lockspace)
 	spin_lock(&lslist_lock);
 	list_for_each_entry(ls, &lslist, ls_list) {
 		if (ls->ls_local_handle == lockspace) {
-			ls->ls_count++;
+			atomic_inc(&ls->ls_count);
 			goto out;
 		}
 	}
@@ -348,7 +348,7 @@ struct dlm_ls *dlm_find_lockspace_device(int minor)
 	spin_lock(&lslist_lock);
 	list_for_each_entry(ls, &lslist, ls_list) {
 		if (ls->ls_device.minor == minor) {
-			ls->ls_count++;
+			atomic_inc(&ls->ls_count);
 			goto out;
 		}
 	}
@@ -360,24 +360,24 @@ struct dlm_ls *dlm_find_lockspace_device(int minor)
 
 void dlm_put_lockspace(struct dlm_ls *ls)
 {
-	spin_lock(&lslist_lock);
-	ls->ls_count--;
-	spin_unlock(&lslist_lock);
+	if (atomic_dec_and_test(&ls->ls_count))
+		wake_up(&ls->ls_count_wait);
 }
 
 static void remove_lockspace(struct dlm_ls *ls)
 {
-	for (;;) {
-		spin_lock(&lslist_lock);
-		if (ls->ls_count == 0) {
-			WARN_ON(ls->ls_create_count != 0);
-			list_del(&ls->ls_list);
-			spin_unlock(&lslist_lock);
-			return;
-		}
+retry:
+	wait_event(ls->ls_count_wait, atomic_read(&ls->ls_count) == 0);
+
+	spin_lock(&lslist_lock);
+	if (atomic_read(&ls->ls_count) != 0) {
 		spin_unlock(&lslist_lock);
-		ssleep(1);
+		goto retry;
 	}
+
+	WARN_ON(ls->ls_create_count != 0);
+	list_del(&ls->ls_list);
+	spin_unlock(&lslist_lock);
 }
 
 static int threads_start(void)
@@ -481,7 +481,8 @@ static int new_lockspace(const char *name, const char *cluster,
 	memcpy(ls->ls_name, name, namelen);
 	ls->ls_namelen = namelen;
 	ls->ls_lvblen = lvblen;
-	ls->ls_count = 0;
+	atomic_set(&ls->ls_count, 0);
+	init_waitqueue_head(&ls->ls_count_wait);
 	ls->ls_flags = 0;
 	ls->ls_scan_time = jiffies;
 
diff --git a/fs/dlm/requestqueue.c b/fs/dlm/requestqueue.c
index d0cf68570dcf..ccb5307c21e9 100644
--- a/fs/dlm/requestqueue.c
+++ b/fs/dlm/requestqueue.c
@@ -127,7 +127,7 @@ static int purge_request(struct dlm_ls *ls, struct dlm_message *ms, int nodeid)
 	uint32_t type = ms->m_type;
 
 	/* the ls is being cleaned up and freed by release_lockspace */
-	if (!ls->ls_count)
+	if (!atomic_read(&ls->ls_count))
 		return 1;
 
 	if (dlm_is_removed(ls, nodeid))
-- 
2.27.0

