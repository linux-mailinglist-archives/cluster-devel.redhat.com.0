Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E2679912E
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Sep 2023 22:46:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694205990;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vL9RzFjA+hQTtJCcsBgDf7efYVYFkMWcdp+Nkzt8hq4=;
	b=JscyDlOIpV2SJJCP8YgxVYwm63QVPCzQpL3bi9KGkXWgo2XYdBkMHIRPcIxtEqm0GyYyGK
	mo9MC8yaUydSKVozkKys+/S/0CB3FGfsesAnjoYi1NeEpVByHFeiRrIC35M6uiuVj3n/kT
	gUYq2JiBmwrepu4t/ju9y1FCCuYf59E=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-JviVesPrNqG1qiRS4FNHOA-1; Fri, 08 Sep 2023 16:46:26 -0400
X-MC-Unique: JviVesPrNqG1qiRS4FNHOA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 524BD1C0CCD1;
	Fri,  8 Sep 2023 20:46:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 208E740411F;
	Fri,  8 Sep 2023 20:46:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DD7111946A47;
	Fri,  8 Sep 2023 20:46:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 35CF21946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  8 Sep 2023 20:46:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2584A21EE566; Fri,  8 Sep 2023 20:46:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F02EB21EE56C;
 Fri,  8 Sep 2023 20:46:22 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri,  8 Sep 2023 16:46:05 -0400
Message-Id: <20230908204611.1910601-4-aahringo@redhat.com>
In-Reply-To: <20230908204611.1910601-1-aahringo@redhat.com>
References: <20230908204611.1910601-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [RFC dlm/next 04/10] fs: dlm: convert
 ls_waiters_mutex to spinlock
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
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch converts the per dlm lockspace waiters lock from a mutex to a
spinlock.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/debug_fs.c     |  4 ++--
 fs/dlm/dlm_internal.h |  2 +-
 fs/dlm/lock.c         | 33 +++++++++++++++++----------------
 fs/dlm/lockspace.c    |  2 +-
 4 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 698d6b7a20f8..9d726971ba47 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -824,7 +824,7 @@ static ssize_t waiters_read(struct file *file, char __user *userbuf,
 	size_t len = DLM_DEBUG_BUF_LEN, pos = 0, ret, rv;
 
 	mutex_lock(&debug_buf_lock);
-	mutex_lock(&ls->ls_waiters_mutex);
+	spin_lock(&ls->ls_waiters_lock);
 	memset(debug_buf, 0, sizeof(debug_buf));
 
 	list_for_each_entry(lkb, &ls->ls_waiters, lkb_wait_reply) {
@@ -835,7 +835,7 @@ static ssize_t waiters_read(struct file *file, char __user *userbuf,
 			break;
 		pos += ret;
 	}
-	mutex_unlock(&ls->ls_waiters_mutex);
+	spin_unlock(&ls->ls_waiters_lock);
 
 	rv = simple_read_from_buffer(userbuf, count, ppos, debug_buf, pos);
 	mutex_unlock(&debug_buf_lock);
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index dfc444dad329..2f32e053a9dc 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -564,7 +564,7 @@ struct dlm_ls {
 	struct dlm_rsbtable	*ls_rsbtbl;
 	uint32_t		ls_rsbtbl_size;
 
-	struct mutex		ls_waiters_mutex;
+	spinlock_t		ls_waiters_lock;
 	struct list_head	ls_waiters;	/* lkbs needing a reply */
 
 	struct mutex		ls_orphans_mutex;
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 61eb285c613c..5631623ce01a 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1407,7 +1407,7 @@ static int add_to_waiters(struct dlm_lkb *lkb, int mstype, int to_nodeid)
 	int error = 0;
 	int wc;
 
-	mutex_lock(&ls->ls_waiters_mutex);
+	spin_lock(&ls->ls_waiters_lock);
 
 	if (is_overlap_unlock(lkb) ||
 	    (is_overlap_cancel(lkb) && (mstype == DLM_MSG_CANCEL))) {
@@ -1447,7 +1447,7 @@ static int add_to_waiters(struct dlm_lkb *lkb, int mstype, int to_nodeid)
 		log_error(ls, "addwait error %x %d flags %x %d %d %s",
 			  lkb->lkb_id, error, dlm_iflags_val(lkb), mstype,
 			  lkb->lkb_wait_type, lkb->lkb_resource->res_name);
-	mutex_unlock(&ls->ls_waiters_mutex);
+	spin_unlock(&ls->ls_waiters_lock);
 	return error;
 }
 
@@ -1546,14 +1546,15 @@ static int remove_from_waiters(struct dlm_lkb *lkb, int mstype)
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
 	int error;
 
-	mutex_lock(&ls->ls_waiters_mutex);
+	spin_lock(&ls->ls_waiters_lock);
 	error = _remove_from_waiters(lkb, mstype, NULL);
-	mutex_unlock(&ls->ls_waiters_mutex);
+	spin_unlock(&ls->ls_waiters_lock);
 	return error;
 }
 
 /* Handles situations where we might be processing a "fake" or "local" reply in
-   which we can't try to take waiters_mutex again. */
+ * which we can't try to take waiters_lock again.
+ */
 
 static int remove_from_waiters_ms(struct dlm_lkb *lkb,
 				  const struct dlm_message *ms, bool local)
@@ -1562,10 +1563,10 @@ static int remove_from_waiters_ms(struct dlm_lkb *lkb,
 	int error;
 
 	if (!local)
-		mutex_lock(&ls->ls_waiters_mutex);
+		spin_lock(&ls->ls_waiters_lock);
 	error = _remove_from_waiters(lkb, le32_to_cpu(ms->m_type), ms);
 	if (!local)
-		mutex_unlock(&ls->ls_waiters_mutex);
+		spin_unlock(&ls->ls_waiters_lock);
 	return error;
 }
 
@@ -4395,7 +4396,7 @@ static void _receive_convert_reply(struct dlm_lkb *lkb,
 	if (error)
 		goto out;
 
-	/* local reply can happen with waiters_mutex held */
+	/* local reply can happen with waiters_lock held */
 	error = remove_from_waiters_ms(lkb, ms, local);
 	if (error)
 		goto out;
@@ -4434,7 +4435,7 @@ static void _receive_unlock_reply(struct dlm_lkb *lkb,
 	if (error)
 		goto out;
 
-	/* local reply can happen with waiters_mutex held */
+	/* local reply can happen with waiters_lock held */
 	error = remove_from_waiters_ms(lkb, ms, local);
 	if (error)
 		goto out;
@@ -4486,7 +4487,7 @@ static void _receive_cancel_reply(struct dlm_lkb *lkb,
 	if (error)
 		goto out;
 
-	/* local reply can happen with waiters_mutex held */
+	/* local reply can happen with waiters_lock held */
 	error = remove_from_waiters_ms(lkb, ms, local);
 	if (error)
 		goto out;
@@ -4887,7 +4888,7 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 	if (!ms_local)
 		return;
 
-	mutex_lock(&ls->ls_waiters_mutex);
+	spin_lock(&ls->ls_waiters_lock);
 
 	list_for_each_entry_safe(lkb, safe, &ls->ls_waiters, lkb_wait_reply) {
 
@@ -4980,7 +4981,7 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 				  lkb->lkb_wait_type, wait_type);
 		}
 	}
-	mutex_unlock(&ls->ls_waiters_mutex);
+	spin_unlock(&ls->ls_waiters_lock);
 	kfree(ms_local);
 }
 
@@ -4988,7 +4989,7 @@ static struct dlm_lkb *find_resend_waiter(struct dlm_ls *ls)
 {
 	struct dlm_lkb *lkb = NULL, *iter;
 
-	mutex_lock(&ls->ls_waiters_mutex);
+	spin_lock(&ls->ls_waiters_lock);
 	list_for_each_entry(iter, &ls->ls_waiters, lkb_wait_reply) {
 		if (test_bit(DLM_IFL_RESEND_BIT, &iter->lkb_iflags)) {
 			hold_lkb(iter);
@@ -4996,7 +4997,7 @@ static struct dlm_lkb *find_resend_waiter(struct dlm_ls *ls)
 			break;
 		}
 	}
-	mutex_unlock(&ls->ls_waiters_mutex);
+	spin_unlock(&ls->ls_waiters_lock);
 
 	return lkb;
 }
@@ -5063,9 +5064,9 @@ int dlm_recover_waiters_post(struct dlm_ls *ls)
 		while (!atomic_dec_and_test(&lkb->lkb_wait_count))
 			unhold_lkb(lkb);
 
-		mutex_lock(&ls->ls_waiters_mutex);
+		spin_lock(&ls->ls_waiters_lock);
 		list_del_init(&lkb->lkb_wait_reply);
-		mutex_unlock(&ls->ls_waiters_mutex);
+		spin_unlock(&ls->ls_waiters_lock);
 
 		if (oc || ou) {
 			/* do an unlock or cancel instead of resending */
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 0455dddb0797..79dd516bde5f 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -515,7 +515,7 @@ static int new_lockspace(const char *name, const char *cluster,
 	spin_lock_init(&ls->ls_lkbidr_spin);
 
 	INIT_LIST_HEAD(&ls->ls_waiters);
-	mutex_init(&ls->ls_waiters_mutex);
+	spin_lock_init(&ls->ls_waiters_lock);
 	INIT_LIST_HEAD(&ls->ls_orphans);
 	mutex_init(&ls->ls_orphans_mutex);
 
-- 
2.31.1

