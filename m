Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B298E4218E2
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Oct 2021 22:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633381133;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TlUbcuMYsSEOiae54/E0cSlmjXkm3ZDW0+4mwAUXm98=;
	b=PbAdg9Ybnam1jCFUPwK7fzblI8ixYXG4UgwEMl3SmTJqnX2OXmxT0PEgOozTMGIikVL/1s
	BLpaDS7SG3zMw3EvV4mVEVyYwdyaWn760gCro+CxOgnV99dt5QWDLE5NEmew5wD8mWUh/H
	6ZpcWYpy8pjMJcavsntkY/clYwVRunw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-NIWFJVKUPQ2g23ccCd5l-A-1; Mon, 04 Oct 2021 16:58:52 -0400
X-MC-Unique: NIWFJVKUPQ2g23ccCd5l-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B1648145E5;
	Mon,  4 Oct 2021 20:58:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0FF65F4F7;
	Mon,  4 Oct 2021 20:58:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7FC1F4EA2A;
	Mon,  4 Oct 2021 20:58:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 194Kweuo017427 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 4 Oct 2021 16:58:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B20325DF2F; Mon,  4 Oct 2021 20:58:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 627325DEFB;
	Mon,  4 Oct 2021 20:58:40 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Oct 2021 16:58:05 -0400
Message-Id: <20211004205805.3938460-3-aahringo@redhat.com>
In-Reply-To: <20211004205805.3938460-1-aahringo@redhat.com>
References: <20211004205805.3938460-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC PATCH dlm/next 2/2] fs: dlm: change dlm logic
	locking behaviour
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will try to make some lock behaviour better inside the central
dlm locking logic functionality. This behaviour is that ls_waiter_mutex
and res_mutex is sometimes locked in a reverse order. The reverse order
can happen between the locking functionality dlm_lock()/dlm_unlock() and
recovery handling dlm_recover_waiters_pre().

The reverse order is not the only problem. DLM has a internal flag to
signal a different lock order between ls_waiter_mutex and res_mutex by
setting the DLM_IFL_STUB_MS flag so the ls_waiter_mutex will not get
held because it is already hold in case of dlm_recover_waiters_pre().

To somehow unwind this behaviour we remove the ls_waiter_mutex and
replace it with rcu handling. To lock anything else while central dlm
locking logic functionality is running concurrent this patch introduces
the lkb_lock and it's lock_lkb() and unlock_lkb() functionality similar
like the existing rsb lock.

Being able to not holding the ls_waiter_mutex before iterate ls_waiters
list allows us to never run a different lock order by using internal
lockless central dlm locking logic functionality and hold the requiered
locks lkb/rsb lock in each iteration before call dlm locking functionality.

As benefit we move the per lockspace ls_waiter_mutex to a per lkb lock.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/debug_fs.c     |   7 +-
 fs/dlm/dlm_internal.h |   5 +-
 fs/dlm/lock.c         | 190 ++++++++++++++++++++++++++----------------
 fs/dlm/lock.h         |  10 +++
 fs/dlm/lockspace.c    |   9 +-
 fs/dlm/recover.c      |   5 ++
 6 files changed, 147 insertions(+), 79 deletions(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 47e9d57e4cae..d51da780ea12 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -704,12 +704,13 @@ static ssize_t waiters_read(struct file *file, char __user *userbuf,
 	struct dlm_ls *ls = file->private_data;
 	struct dlm_lkb *lkb;
 	size_t len = DLM_DEBUG_BUF_LEN, pos = 0, ret, rv;
+	int idx;
 
 	mutex_lock(&debug_buf_lock);
-	mutex_lock(&ls->ls_waiters_mutex);
 	memset(debug_buf, 0, sizeof(debug_buf));
 
-	list_for_each_entry(lkb, &ls->ls_waiters, lkb_wait_reply) {
+	idx = srcu_read_lock(&ls->ls_lkb_srcu);
+	list_for_each_entry_rcu(lkb, &ls->ls_waiters, lkb_wait_reply) {
 		ret = snprintf(debug_buf + pos, len - pos, "%x %d %d %s\n",
 			       lkb->lkb_id, lkb->lkb_wait_type,
 			       lkb->lkb_nodeid, lkb->lkb_resource->res_name);
@@ -717,7 +718,7 @@ static ssize_t waiters_read(struct file *file, char __user *userbuf,
 			break;
 		pos += ret;
 	}
-	mutex_unlock(&ls->ls_waiters_mutex);
+	srcu_read_unlock(&ls->ls_lkb_srcu, idx);
 
 	rv = simple_read_from_buffer(userbuf, count, ppos, debug_buf, pos);
 	mutex_unlock(&debug_buf_lock);
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 3fb610dfea19..4ac0d513d307 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -279,6 +279,8 @@ struct dlm_lkb {
 		void			*lkb_astparam;	/* caller's ast arg */
 		struct dlm_user_args	*lkb_ua;
 	};
+	struct mutex		lkb_mutex;
+	struct rcu_head		rcu;
 };
 
 /*
@@ -568,7 +570,8 @@ struct dlm_ls {
 	struct dlm_rsbtable	*ls_rsbtbl;
 	uint32_t		ls_rsbtbl_size;
 
-	struct mutex		ls_waiters_mutex;
+	struct srcu_struct	ls_lkb_srcu;
+	spinlock_t		ls_waiters_lock;
 	struct list_head	ls_waiters;	/* lkbs needing a reply */
 
 	struct mutex		ls_orphans_mutex;
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index c419a5b5b7c0..78c7addcb3c8 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1199,6 +1199,7 @@ static int create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret)
 	INIT_LIST_HEAD(&lkb->lkb_cb_list);
 	mutex_init(&lkb->lkb_cb_mutex);
 	INIT_WORK(&lkb->lkb_cb_work, dlm_callback_work);
+	mutex_init(&lkb->lkb_mutex);
 
 	idr_preload(GFP_NOFS);
 	spin_lock(&ls->ls_lkbidr_spin);
@@ -1242,6 +1243,20 @@ static void kill_lkb(struct kref *kref)
 	DLM_ASSERT(!lkb->lkb_status, dlm_print_lkb(lkb););
 }
 
+
+static void _dlm_free_lkb(struct rcu_head *rcu)
+{
+	struct dlm_lkb *lkb = container_of(rcu, struct dlm_lkb, rcu);
+
+	detach_lkb(lkb);
+
+	/* for local/process lkbs, lvbptr points to caller's lksb */
+	if (lkb->lkb_lvbptr && is_master_copy(lkb))
+		dlm_free_lvb(lkb->lkb_lvbptr);
+
+	dlm_free_lkb(lkb);
+}
+
 /* __put_lkb() is used when an lkb may not have an rsb attached to
    it so we need to provide the lockspace explicitly */
 
@@ -1254,12 +1269,7 @@ static int __put_lkb(struct dlm_ls *ls, struct dlm_lkb *lkb)
 		idr_remove(&ls->ls_lkbidr, lkid);
 		spin_unlock(&ls->ls_lkbidr_spin);
 
-		detach_lkb(lkb);
-
-		/* for local/process lkbs, lvbptr points to caller's lksb */
-		if (lkb->lkb_lvbptr && is_master_copy(lkb))
-			dlm_free_lvb(lkb->lkb_lvbptr);
-		dlm_free_lkb(lkb);
+		call_srcu(&ls->ls_lkb_srcu, &lkb->rcu, _dlm_free_lkb);
 		return 1;
 	} else {
 		spin_unlock(&ls->ls_lkbidr_spin);
@@ -1402,22 +1412,27 @@ void dlm_scan_waiters(struct dlm_ls *ls)
 	u32 debug_expired = 0;
 	int num_nodes = 0;
 	int *warned = NULL;
+	int idx;
 
 	if (!dlm_config.ci_waitwarn_us)
 		return;
 
-	mutex_lock(&ls->ls_waiters_mutex);
-
-	list_for_each_entry(lkb, &ls->ls_waiters, lkb_wait_reply) {
-		if (!lkb->lkb_wait_time)
+	idx = srcu_read_lock(&ls->ls_lkb_srcu);
+	list_for_each_entry_rcu(lkb, &ls->ls_waiters, lkb_wait_reply) {
+		lock_lkb(lkb);
+		if (!lkb->lkb_wait_time) {
+			unlock_lkb(lkb);
 			continue;
+		}
 
 		debug_scanned++;
 
 		us = ktime_to_us(ktime_sub(ktime_get(), lkb->lkb_wait_time));
 
-		if (us < dlm_config.ci_waitwarn_us)
+		if (us < dlm_config.ci_waitwarn_us) {
+			unlock_lkb(lkb);
 			continue;
+		}
 
 		lkb->lkb_wait_time = 0;
 
@@ -1429,16 +1444,21 @@ void dlm_scan_waiters(struct dlm_ls *ls)
 			num_nodes = ls->ls_num_nodes;
 			warned = kcalloc(num_nodes, sizeof(int), GFP_KERNEL);
 		}
-		if (!warned)
+		if (!warned) {
+			unlock_lkb(lkb);
 			continue;
-		if (nodeid_warned(lkb->lkb_wait_nodeid, num_nodes, warned))
+		}
+		if (nodeid_warned(lkb->lkb_wait_nodeid, num_nodes, warned)) {
+			unlock_lkb(lkb);
 			continue;
+		}
 
 		log_error(ls, "waitwarn %x %lld %d us check connection to "
 			  "node %d", lkb->lkb_id, (long long)us,
 			  dlm_config.ci_waitwarn_us, lkb->lkb_wait_nodeid);
+		unlock_lkb(lkb);
 	}
-	mutex_unlock(&ls->ls_waiters_mutex);
+	srcu_read_unlock(&ls->ls_lkb_srcu, idx);
 	kfree(warned);
 
 	if (debug_expired)
@@ -1455,8 +1475,6 @@ static int add_to_waiters(struct dlm_lkb *lkb, int mstype, int to_nodeid)
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
 	int error = 0;
 
-	mutex_lock(&ls->ls_waiters_mutex);
-
 	if (is_overlap_unlock(lkb) ||
 	    (is_overlap_cancel(lkb) && (mstype == DLM_MSG_CANCEL))) {
 		error = -EINVAL;
@@ -1493,13 +1511,14 @@ static int add_to_waiters(struct dlm_lkb *lkb, int mstype, int to_nodeid)
 	lkb->lkb_wait_time = ktime_get();
 	lkb->lkb_wait_nodeid = to_nodeid; /* for debugging */
 	hold_lkb(lkb);
-	list_add(&lkb->lkb_wait_reply, &ls->ls_waiters);
+	spin_lock(&ls->ls_waiters_lock);
+	list_add_rcu(&lkb->lkb_wait_reply, &ls->ls_waiters);
+	spin_unlock(&ls->ls_waiters_lock);
  out:
 	if (error)
 		log_error(ls, "addwait error %x %d flags %x %d %d %s",
 			  lkb->lkb_id, error, lkb->lkb_flags, mstype,
 			  lkb->lkb_wait_type, lkb->lkb_resource->res_name);
-	mutex_unlock(&ls->ls_waiters_mutex);
 	return error;
 }
 
@@ -1587,37 +1606,23 @@ static int _remove_from_waiters(struct dlm_lkb *lkb, int mstype,
 
 	lkb->lkb_flags &= ~DLM_IFL_RESEND;
 	lkb->lkb_wait_count--;
-	if (!lkb->lkb_wait_count)
-		list_del_init(&lkb->lkb_wait_reply);
+	if (!lkb->lkb_wait_count) {
+		spin_lock(&ls->ls_waiters_lock);
+		list_del_rcu(&lkb->lkb_wait_reply);
+		spin_unlock(&ls->ls_waiters_lock);
+	}
 	unhold_lkb(lkb);
 	return 0;
 }
 
 static int remove_from_waiters(struct dlm_lkb *lkb, int mstype)
 {
-	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
-	int error;
-
-	mutex_lock(&ls->ls_waiters_mutex);
-	error = _remove_from_waiters(lkb, mstype, NULL);
-	mutex_unlock(&ls->ls_waiters_mutex);
-	return error;
+	return _remove_from_waiters(lkb, mstype, NULL);
 }
 
-/* Handles situations where we might be processing a "fake" or "stub" reply in
-   which we can't try to take waiters_mutex again. */
-
 static int remove_from_waiters_ms(struct dlm_lkb *lkb, struct dlm_message *ms)
 {
-	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
-	int error;
-
-	if (ms->m_flags != DLM_IFL_STUB_MS)
-		mutex_lock(&ls->ls_waiters_mutex);
-	error = _remove_from_waiters(lkb, ms->m_type, ms);
-	if (ms->m_flags != DLM_IFL_STUB_MS)
-		mutex_unlock(&ls->ls_waiters_mutex);
-	return error;
+	return _remove_from_waiters(lkb, ms->m_type, ms);
 }
 
 /* If there's an rsb for the same resource being removed, ensure
@@ -1925,6 +1930,7 @@ void dlm_adjust_timeouts(struct dlm_ls *ls)
 {
 	struct dlm_lkb *lkb;
 	u64 adj_us = jiffies_to_usecs(jiffies - ls->ls_recover_begin);
+	int idx;
 
 	ls->ls_recover_begin = 0;
 	mutex_lock(&ls->ls_timeout_mutex);
@@ -1935,12 +1941,14 @@ void dlm_adjust_timeouts(struct dlm_ls *ls)
 	if (!dlm_config.ci_waitwarn_us)
 		return;
 
-	mutex_lock(&ls->ls_waiters_mutex);
-	list_for_each_entry(lkb, &ls->ls_waiters, lkb_wait_reply) {
+	idx = srcu_read_lock(&ls->ls_lkb_srcu);
+	list_for_each_entry_rcu(lkb, &ls->ls_waiters, lkb_wait_reply) {
+		lock_lkb(lkb);
 		if (ktime_to_us(lkb->lkb_wait_time))
 			lkb->lkb_wait_time = ktime_get();
+		unlock_lkb(lkb);
 	}
-	mutex_unlock(&ls->ls_waiters_mutex);
+	srcu_read_unlock(&ls->ls_lkb_srcu, idx);
 }
 
 /* lkb is master or local copy */
@@ -3328,6 +3336,7 @@ static int request_lock(struct dlm_ls *ls, struct dlm_lkb *lkb, char *name,
 	if (error)
 		return error;
 
+	lock_lkb(lkb);
 	lock_rsb(r);
 
 	attach_lkb(r, lkb);
@@ -3337,6 +3346,7 @@ static int request_lock(struct dlm_ls *ls, struct dlm_lkb *lkb, char *name,
 
 	unlock_rsb(r);
 	put_rsb(r);
+	unlock_lkb(lkb);
 	return error;
 }
 
@@ -3346,6 +3356,7 @@ static int convert_lock(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	struct dlm_rsb *r;
 	int error;
 
+	lock_lkb(lkb);
 	r = lkb->lkb_resource;
 
 	hold_rsb(r);
@@ -3359,6 +3370,7 @@ static int convert_lock(struct dlm_ls *ls, struct dlm_lkb *lkb,
  out:
 	unlock_rsb(r);
 	put_rsb(r);
+	unlock_lkb(lkb);
 	return error;
 }
 
@@ -3368,6 +3380,7 @@ static int unlock_lock(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	struct dlm_rsb *r;
 	int error;
 
+	lock_lkb(lkb);
 	r = lkb->lkb_resource;
 
 	hold_rsb(r);
@@ -3381,6 +3394,7 @@ static int unlock_lock(struct dlm_ls *ls, struct dlm_lkb *lkb,
  out:
 	unlock_rsb(r);
 	put_rsb(r);
+	unlock_lkb(lkb);
 	return error;
 }
 
@@ -3390,6 +3404,7 @@ static int cancel_lock(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	struct dlm_rsb *r;
 	int error;
 
+	lock_lkb(lkb);
 	r = lkb->lkb_resource;
 
 	hold_rsb(r);
@@ -3403,6 +3418,7 @@ static int cancel_lock(struct dlm_ls *ls, struct dlm_lkb *lkb,
  out:
 	unlock_rsb(r);
 	put_rsb(r);
+	unlock_lkb(lkb);
 	return error;
 }
 
@@ -4661,7 +4677,10 @@ static void _receive_convert_reply_lockless(struct dlm_lkb *lkb,
 
 static void _receive_convert_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 {
-	struct dlm_rsb *r = lkb->lkb_resource;
+	struct dlm_rsb *r;
+
+	lock_lkb(lkb);
+	r = lkb->lkb_resource;
 
 	hold_rsb(r);
 	lock_rsb(r);
@@ -4670,6 +4689,7 @@ static void _receive_convert_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 
 	unlock_rsb(r);
 	put_rsb(r);
+	unlock_lkb(lkb);
 }
 
 static int receive_convert_reply(struct dlm_ls *ls, struct dlm_message *ms)
@@ -4719,7 +4739,10 @@ static void _receive_unlock_reply_lockless(struct dlm_lkb *lkb,
 
 static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 {
-	struct dlm_rsb *r = lkb->lkb_resource;
+	struct dlm_rsb *r;
+
+	lock_lkb(lkb);
+	r = lkb->lkb_resource;
 
 	hold_rsb(r);
 	lock_rsb(r);
@@ -4728,6 +4751,7 @@ static void _receive_unlock_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 
 	unlock_rsb(r);
 	put_rsb(r);
+	unlock_lkb(lkb);
 }
 
 static int receive_unlock_reply(struct dlm_ls *ls, struct dlm_message *ms)
@@ -4777,7 +4801,10 @@ static void _receive_cancel_reply_lockless(struct dlm_lkb *lkb,
 
 static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 {
-	struct dlm_rsb *r = lkb->lkb_resource;
+	struct dlm_rsb *r;
+
+	lock_lkb(lkb);
+	r = lkb->lkb_resource;
 
 	hold_rsb(r);
 	lock_rsb(r);
@@ -4786,6 +4813,7 @@ static void _receive_cancel_reply(struct dlm_lkb *lkb, struct dlm_message *ms)
 
 	unlock_rsb(r);
 	put_rsb(r);
+	unlock_lkb(lkb);
 }
 
 static int receive_cancel_reply(struct dlm_ls *ls, struct dlm_message *ms)
@@ -4818,7 +4846,9 @@ static void receive_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms)
 	/* ms->m_result is the value returned by dlm_master_lookup on dir node
 	   FIXME: will a non-zero error ever be returned? */
 
+	lock_lkb(lkb);
 	r = lkb->lkb_resource;
+
 	hold_rsb(r);
 	lock_rsb(r);
 
@@ -4877,6 +4907,7 @@ static void receive_lookup_reply(struct dlm_ls *ls, struct dlm_message *ms)
  out:
 	unlock_rsb(r);
 	put_rsb(r);
+	unlock_lkb(lkb);
 	dlm_put_lkb(lkb);
 }
 
@@ -5096,7 +5127,8 @@ void dlm_receive_buffer(union dlm_packet *p, int nodeid)
 }
 
 static void recover_convert_waiter(struct dlm_ls *ls, struct dlm_lkb *lkb,
-				   struct dlm_message *ms_stub)
+				   struct dlm_message *ms_stub,
+				   struct dlm_rsb *r)
 {
 	if (middle_conversion(lkb)) {
 		hold_lkb(lkb);
@@ -5105,11 +5137,11 @@ static void recover_convert_waiter(struct dlm_ls *ls, struct dlm_lkb *lkb,
 		ms_stub->m_type = DLM_MSG_CONVERT_REPLY;
 		ms_stub->m_result = -EINPROGRESS;
 		ms_stub->m_header.h_nodeid = lkb->lkb_nodeid;
-		_receive_convert_reply(lkb, ms_stub);
+		_receive_convert_reply_lockless(lkb, ms_stub, r);
 
 		/* Same special case as in receive_rcom_lock_args() */
 		lkb->lkb_grmode = DLM_LOCK_IV;
-		rsb_set_flag(lkb->lkb_resource, RSB_RECOVER_CONVERT);
+		rsb_set_flag(r, RSB_RECOVER_CONVERT);
 		unhold_lkb(lkb);
 
 	} else if (lkb->lkb_rqmode >= lkb->lkb_grmode) {
@@ -5143,28 +5175,23 @@ static int waiter_needs_recovery(struct dlm_ls *ls, struct dlm_lkb *lkb,
 
 void dlm_recover_waiters_pre(struct dlm_ls *ls)
 {
-	struct dlm_lkb *lkb, *safe;
 	struct dlm_message *ms_stub;
 	int wait_type, stub_unlock_result, stub_cancel_result;
-	int dir_nodeid;
+	struct dlm_lkb *lkb;
+	int dir_nodeid, idx;
+	struct dlm_rsb *r;
 
 	ms_stub = kmalloc(sizeof(*ms_stub), GFP_KERNEL);
 	if (!ms_stub)
 		return;
 
-	/* we do mutex_lock_nested() here in a different lockclass to avoid
-	 * a false positive report about a possible circular lock dependency.
-	 * The lockclass should be the same but doing it avoids the false
-	 * positive report. This report is about a different lock order
-	 * regarding to ls_waiters_mutex lock and res_mutex of lkb between here
-	 * and during lock operations. However lock operations cannot run in
-	 * parallel with dlm_recover_waiters_pre() because certain locks are
-	 * held which DLM_ASSERT_OPS_LOCKED(ls) is checking on.
-	 */
-	DLM_ASSERT_OPS_LOCKED(ls);
-	mutex_lock_nested(&ls->ls_waiters_mutex, 1);
+	idx = srcu_read_lock(&ls->ls_lkb_srcu);
+	list_for_each_entry_rcu(lkb, &ls->ls_waiters, lkb_wait_reply) {
+		lock_lkb(lkb);
+		r = lkb->lkb_resource;
 
-	list_for_each_entry_safe(lkb, safe, &ls->ls_waiters, lkb_wait_reply) {
+		hold_rsb(r);
+		lock_rsb(r);
 
 		dir_nodeid = dlm_dir_nodeid(lkb->lkb_resource);
 
@@ -5188,11 +5215,18 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 
 		if (lkb->lkb_wait_type == DLM_MSG_LOOKUP) {
 			lkb->lkb_flags |= DLM_IFL_RESEND;
+			unlock_rsb(r);
+			put_rsb(r);
+			unlock_lkb(lkb);
 			continue;
 		}
 
-		if (!waiter_needs_recovery(ls, lkb, dir_nodeid))
+		if (!waiter_needs_recovery(ls, lkb, dir_nodeid)) {
+			unlock_rsb(r);
+			put_rsb(r);
+			unlock_lkb(lkb);
 			continue;
+		}
 
 		wait_type = lkb->lkb_wait_type;
 		stub_unlock_result = -DLM_EUNLOCK;
@@ -5227,7 +5261,7 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 			break;
 
 		case DLM_MSG_CONVERT:
-			recover_convert_waiter(ls, lkb, ms_stub);
+			recover_convert_waiter(ls, lkb, ms_stub, r);
 			break;
 
 		case DLM_MSG_UNLOCK:
@@ -5237,7 +5271,7 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 			ms_stub->m_type = DLM_MSG_UNLOCK_REPLY;
 			ms_stub->m_result = stub_unlock_result;
 			ms_stub->m_header.h_nodeid = lkb->lkb_nodeid;
-			_receive_unlock_reply(lkb, ms_stub);
+			_receive_unlock_reply_lockless(lkb, ms_stub, r);
 			dlm_put_lkb(lkb);
 			break;
 
@@ -5248,7 +5282,7 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 			ms_stub->m_type = DLM_MSG_CANCEL_REPLY;
 			ms_stub->m_result = stub_cancel_result;
 			ms_stub->m_header.h_nodeid = lkb->lkb_nodeid;
-			_receive_cancel_reply(lkb, ms_stub);
+			_receive_cancel_reply_lockless(lkb, ms_stub, r);
 			dlm_put_lkb(lkb);
 			break;
 
@@ -5256,9 +5290,13 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 			log_error(ls, "invalid lkb wait_type %d %d",
 				  lkb->lkb_wait_type, wait_type);
 		}
+		unlock_rsb(r);
+		put_rsb(r);
+		unlock_lkb(lkb);
 		schedule();
 	}
-	mutex_unlock(&ls->ls_waiters_mutex);
+	srcu_read_unlock(&ls->ls_lkb_srcu, idx);
+
 	kfree(ms_stub);
 }
 
@@ -5267,15 +5305,15 @@ static struct dlm_lkb *find_resend_waiter(struct dlm_ls *ls)
 	struct dlm_lkb *lkb;
 	int found = 0;
 
-	mutex_lock(&ls->ls_waiters_mutex);
-	list_for_each_entry(lkb, &ls->ls_waiters, lkb_wait_reply) {
+	list_for_each_entry_rcu(lkb, &ls->ls_waiters, lkb_wait_reply) {
+		lock_lkb(lkb);
 		if (lkb->lkb_flags & DLM_IFL_RESEND) {
 			hold_lkb(lkb);
 			found = 1;
 			break;
 		}
+		unlock_lkb(lkb);
 	}
-	mutex_unlock(&ls->ls_waiters_mutex);
 
 	if (!found)
 		lkb = NULL;
@@ -5302,8 +5340,9 @@ int dlm_recover_waiters_post(struct dlm_ls *ls)
 {
 	struct dlm_lkb *lkb;
 	struct dlm_rsb *r;
-	int error = 0, mstype, err, oc, ou;
+	int error = 0, mstype, err, oc, ou, idx;
 
+	idx = srcu_read_lock(&ls->ls_lkb_srcu);
 	while (1) {
 		if (dlm_locking_stopped(ls)) {
 			log_debug(ls, "recover_waiters_post aborted");
@@ -5339,9 +5378,9 @@ int dlm_recover_waiters_post(struct dlm_ls *ls)
 		lkb->lkb_flags &= ~DLM_IFL_OVERLAP_CANCEL;
 		lkb->lkb_wait_type = 0;
 		lkb->lkb_wait_count = 0;
-		mutex_lock(&ls->ls_waiters_mutex);
-		list_del_init(&lkb->lkb_wait_reply);
-		mutex_unlock(&ls->ls_waiters_mutex);
+		spin_lock(&ls->ls_waiters_lock);
+		list_del_rcu(&lkb->lkb_wait_reply);
+		spin_unlock(&ls->ls_waiters_lock);
 		unhold_lkb(lkb); /* for waiters list */
 
 		if (oc || ou) {
@@ -5385,11 +5424,14 @@ int dlm_recover_waiters_post(struct dlm_ls *ls)
 				  "dir_nodeid %d overlap %d %d",
 				  lkb->lkb_id, mstype, r->res_nodeid,
 				  dlm_dir_nodeid(r), oc, ou);
+			unlock_lkb(lkb);
 		}
 		unlock_rsb(r);
 		put_rsb(r);
+		unlock_lkb(lkb);
 		dlm_put_lkb(lkb);
 	}
+	srcu_read_unlock(&ls->ls_lkb_srcu, idx);
 
 	return error;
 }
diff --git a/fs/dlm/lock.h b/fs/dlm/lock.h
index 456c6ec3ef6f..8029aa96e47c 100644
--- a/fs/dlm/lock.h
+++ b/fs/dlm/lock.h
@@ -74,5 +74,15 @@ static inline void unlock_rsb(struct dlm_rsb *r)
 	mutex_unlock(&r->res_mutex);
 }
 
+static inline void lock_lkb(struct dlm_lkb *lkb)
+{
+	mutex_lock(&lkb->lkb_mutex);
+}
+
+static inline void unlock_lkb(struct dlm_lkb *lkb)
+{
+	mutex_unlock(&lkb->lkb_mutex);
+}
+
 #endif
 
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 2896f96cf2d3..e1199c41301f 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -524,7 +524,8 @@ static int new_lockspace(const char *name, const char *cluster,
 	spin_lock_init(&ls->ls_lkbidr_spin);
 
 	INIT_LIST_HEAD(&ls->ls_waiters);
-	mutex_init(&ls->ls_waiters_mutex);
+	init_srcu_struct(&ls->ls_lkb_srcu);
+	spin_lock_init(&ls->ls_waiters_lock);
 	INIT_LIST_HEAD(&ls->ls_orphans);
 	mutex_init(&ls->ls_orphans_mutex);
 	INIT_LIST_HEAD(&ls->ls_timeout);
@@ -810,6 +811,12 @@ static int release_lockspace(struct dlm_ls *ls, int force)
 	idr_destroy(&ls->ls_recover_idr);
 	kfree(ls->ls_recover_buf);
 
+	/*
+	 * wait all readers of ls_waiters and srcu callers are left before free
+	 */
+	srcu_barrier(&ls->ls_lkb_srcu);
+	cleanup_srcu_struct(&ls->ls_lkb_srcu);
+
 	/*
 	 * Free all lkb's in idr
 	 */
diff --git a/fs/dlm/recover.c b/fs/dlm/recover.c
index 8928e99dfd47..ed5a248af641 100644
--- a/fs/dlm/recover.c
+++ b/fs/dlm/recover.c
@@ -939,6 +939,11 @@ void dlm_clear_toss(struct dlm_ls *ls)
 	unsigned int count = 0;
 	int i;
 
+	/* _dlm_free_lkb() called by ls_lkb_srcu will clear toss as well,
+	 * so call srcu_barrier() to be sure all pending srcu are done
+	 */
+	srcu_barrier(&ls->ls_lkb_srcu);
+
 	for (i = 0; i < ls->ls_rsbtbl_size; i++) {
 		spin_lock(&ls->ls_rsbtbl[i].lock);
 		for (n = rb_first(&ls->ls_rsbtbl[i].toss); n; n = next) {
-- 
2.27.0

