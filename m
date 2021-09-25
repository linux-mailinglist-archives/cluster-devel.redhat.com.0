Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTP id 77DC2417EA4
	for <lists+cluster-devel@lfdr.de>; Sat, 25 Sep 2021 02:31:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632529867;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ogu+CinRavNBEheLs5x1e2quYoD0987vU+Bosn2fNOI=;
	b=E+ghCRhb2H/wRBUn+ZIxzQDKRrYfSH2rsx/TXN6g7SumBhTs+5qoW/9K/n/oAodJuMjEXa
	/taTEqBbZCpRpdTUgdRxVCPr/XCWA6zLRgTNCwplDP2c+e4dMVeCKd4rofxMaNsYb87Auo
	gvx78e+HqSjjYdAH9mIoxtxLLw/KVLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-VpI76r26PgGh4DTu1ARusw-1; Fri, 24 Sep 2021 20:31:06 -0400
X-MC-Unique: VpI76r26PgGh4DTu1ARusw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32A021006AA6;
	Sat, 25 Sep 2021 00:31:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23E251000358;
	Sat, 25 Sep 2021 00:31:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0EAC61803B30;
	Sat, 25 Sep 2021 00:31:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18P0V2ar008955 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Sep 2021 20:31:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A62B16091B; Sat, 25 Sep 2021 00:31:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 668B760936;
	Sat, 25 Sep 2021 00:31:02 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 24 Sep 2021 20:30:15 -0400
Message-Id: <20210925003015.1862586-5-aahringo@redhat.com>
In-Reply-To: <20210925003015.1862586-1-aahringo@redhat.com>
References: <20210925003015.1862586-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 5/5] fs: dlm: avoid ls_waiter_mutex
	circular lock dependency warning
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

This patch avoids to get the following circular lock dependency warning:

[  619.855891] ======================================================
[  619.856858] WARNING: possible circular locking dependency detected
[  619.857865] 5.14.0-1.el9.x86_64+debug #1 Not tainted
[  619.858646] ------------------------------------------------------
[  619.859646] dlm_recoverd/3961 is trying to acquire lock:
[  619.860478] ffff888019dcd628 (&r->res_mutex){+.+.}-{3:3}, at: _receive_unlock_reply+0x78/0x600 [dlm]
[  619.861999]
[  619.861999] but task is already holding lock:
[  619.862933] ffff88800ee901a8 (&ls->ls_waiters_mutex){+.+.}-{3:3}, at: dlm_recover_waiters_pre+0x72/0xc80 [dlm]
[  619.864529]
[  619.864529] which lock already depends on the new lock.
[  619.864529]
[  619.865837]
[  619.865837] the existing dependency chain (in reverse order) is:
[  619.866993]
[  619.866993] -> #1 (&ls->ls_waiters_mutex){+.+.}-{3:3}:
[  619.868088]        __lock_acquire+0xb72/0x1870
[  619.868861]        lock_acquire+0x1ca/0x570
[  619.869554]        __mutex_lock+0x14c/0x1170
[  619.870283]        add_to_waiters+0x6a/0x500 [dlm]
[  619.871047]        _request_lock+0x39f/0x9f0 [dlm]
[  619.871860]        request_lock.part.0+0x1ae/0x220 [dlm]
[  619.872713]        dlm_user_request+0x237/0x5a0 [dlm]
[  619.873555]        device_user_lock+0x42c/0x660 [dlm]
[  619.874366]        device_write+0x5ff/0x8d0 [dlm]
[  619.875116]        vfs_write+0x1c7/0x850
[  619.875762]        ksys_write+0xf9/0x1d0
[  619.876385]        do_syscall_64+0x3b/0x90
[  619.877034]        entry_SYSCALL_64_after_hwframe+0x44/0xae
[  619.877972]
[  619.877972] -> #0 (&r->res_mutex){+.+.}-{3:3}:
[  619.878931]        check_prev_add+0x15e/0x20f0
[  619.879699]        validate_chain+0xaba/0xde0
[  619.880404]        __lock_acquire+0xb72/0x1870
[  619.881100]        lock_acquire+0x1ca/0x570
[  619.881823]        __mutex_lock+0x14c/0x1170
[  619.882506]        _receive_unlock_reply+0x78/0x600 [dlm]
[  619.883365]        dlm_recover_waiters_pre+0x6e8/0xc80 [dlm]
[  619.884262]        ls_recover.isra.0+0x517/0x1090 [dlm]
[  619.885087]        dlm_recoverd+0x348/0x430 [dlm]
[  619.885844]        kthread+0x329/0x3e0
[  619.886456]        ret_from_fork+0x22/0x30
[  619.887113]
[  619.887113] other info that might help us debug this:
[  619.887113]
[  619.888376]  Possible unsafe locking scenario:
[  619.888376]
[  619.889359]        CPU0                    CPU1
[  619.890064]        ----                    ----
[  619.890775]   lock(&ls->ls_waiters_mutex);
[  619.891436]                                lock(&r->res_mutex);
[  619.892378]                                lock(&ls->ls_waiters_mutex);
[  619.893436]   lock(&r->res_mutex);
[  619.893991]
[  619.893991]  *** DEADLOCK ***
[  619.893991]
[  619.894930] 3 locks held by dlm_recoverd/3961:
[  619.895647]  #0: ffff88800ee90d78 (&ls->ls_in_recovery){++++}-{3:3}, at: dlm_recoverd+0x1d1/0x430 [dlm]
[  619.897173]  #1: ffff88800ee90c68 (&ls->ls_recoverd_active){+.+.}-{3:3}, at: ls_recover.isra.0+0xf9/0x1090 [dlm]
[  619.898759]  #2: ffff88800ee901a8 (&ls->ls_waiters_mutex){+.+.}-{3:3}, at: dlm_recover_waiters_pre+0x72/0xc80 [dlm]
[  619.900439]
[  619.900439] stack backtrace:
[  619.901145] CPU: 1 PID: 3961 Comm: dlm_recoverd Not tainted 5.14.0-1.el9.x86_64+debug #1
[  619.902461] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[  619.903390] Call Trace:
[  619.903808]  dump_stack_lvl+0x57/0x7d
[  619.904493]  check_noncircular+0x26a/0x310
[  619.905155]  ? print_circular_bug+0x1f0/0x1f0
[  619.905839]  ? alloc_chain_hlocks+0x1de/0x530
[  619.906528]  check_prev_add+0x15e/0x20f0
[  619.907155]  validate_chain+0xaba/0xde0
[  619.907787]  ? check_prev_add+0x20f0/0x20f0
[  619.908489]  __lock_acquire+0xb72/0x1870
[  619.909147]  lock_acquire+0x1ca/0x570
[  619.909730]  ? _receive_unlock_reply+0x78/0x600 [dlm]
[  619.910554]  ? rcu_read_unlock+0x40/0x40
[  619.911183]  ? __lock_acquired+0x1d2/0x8c0
[  619.911826]  ? dlm_recoverd+0x348/0x430 [dlm]
[  619.912541]  __mutex_lock+0x14c/0x1170
[  619.913160]  ? _receive_unlock_reply+0x78/0x600 [dlm]
[  619.913997]  ? _receive_unlock_reply+0x78/0x600 [dlm]
[  619.914838]  ? mutex_lock_io_nested+0xfc0/0xfc0
[  619.915552]  ? dlm_recover_waiters_pre+0x72/0xc80 [dlm]
[  619.916380]  ? io_schedule_timeout+0x150/0x150
[  619.917072]  ? mutex_lock_io_nested+0xfc0/0xfc0
[  619.917833]  ? lockdep_hardirqs_on_prepare.part.0+0x19a/0x350
[  619.918738]  ? _receive_unlock_reply+0x78/0x600 [dlm]
[  619.919568]  _receive_unlock_reply+0x78/0x600 [dlm]
[  619.920352]  dlm_recover_waiters_pre+0x6e8/0xc80 [dlm]
[  619.921186]  ls_recover.isra.0+0x517/0x1090 [dlm]
[  619.921941]  ? dlm_clear_toss+0x280/0x280 [dlm]
[  619.922666]  ? dlm_recoverd+0x33d/0x430 [dlm]
[  619.923384]  dlm_recoverd+0x348/0x430 [dlm]
[  619.924053]  ? ls_recover.isra.0+0x1090/0x1090 [dlm]
[  619.924896]  kthread+0x329/0x3e0
[  619.925422]  ? _raw_spin_unlock_irq+0x24/0x30
[  619.926100]  ? set_kthread_struct+0x100/0x100
[  619.926788]  ret_from_fork+0x22/0x30

The problem here what this warning is telling us is pretty simple. We
have sometimes a different lock order between
"lock(&ls->ls_waiters_mutex);" and "lock(&r->res_mutex);" which could
occur a deadlock.

This warning is a false-positive because while
"dlm_recover_waiters_pre()" runs every lock operation is stopped by
"ls->ls_in_recovery" lock which is held during
"dlm_recover_waiters_pre()". However it's annoying to see this message
and this patch is avoiding the message by removing the
ls->ls_waiters_mutex lock and replacing it by sleepable rcu mechanism.
There is one problem to solve, with srcu it's possible that we have
multiple readers of "ls->ls_waiters" list. Concurrent iterations are
not anymore protected by "ls->ls_waiters_mutex". The assumption is here
that the "ls->ls_waiters_mutex" lock is used before to mostly protect list
manipulations while iteration and this can be easily replaced by rcu.

The following functions are problematic and how I argument why it's okay
to have possible lkb access while iterate which was previously protected
by "ls->ls_waiters_mutex":

- waiters_read()

Only used for debugging, the srcu_read_lock() should prevent freeing of
the resource while iterating.

- dlm_recover_waiters_pre()

As note above, this function can't concurrent run with
_remove_from_waiters() or dlm_recover_waiters_post() which accessing the
same fields of a lkb. It's protected by "ls->ls_in_recovery".

- dlm_adjust_timeouts()
- find_resend_waiter()

This is to access lkb_wait_time, I introduced the lkb_wait_time_lock to
protect read/updates while others might using it. This behaviour can maybe
improved by deference it once and update atomically.

- release_lockspace()

To be sure no reader is running while freeing lkbs by
"idr_for_each(&ls->ls_lkbidr, lkb_idr_free, ls);" we call
"synchronize_srcu(&ls->ls_lkb_srcu);cleanup_srcu_struct(&ls->ls_lkb_srcu);"
before to avoid use after free.

- _remove_from_waiters()
- dlm_recover_waiters_post()

Those function can be called concurrent and mostly accessing the same
fields. In this case the r->res_mutex of the resource which belongs to
the lkb is held and should protecting that those fields are protected by
this lock.

All references which are held and ls->ls_lkb_srcu is not held is
assumed to work as previously and program logic prevents that a lkb
can't be freed.

Reported-by: Nate Straz <nstraz@redhat.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/debug_fs.c     |   7 +--
 fs/dlm/dlm_internal.h |   6 ++-
 fs/dlm/lock.c         | 109 +++++++++++++++++++++++-------------------
 fs/dlm/lockspace.c    |   9 +++-
 4 files changed, 76 insertions(+), 55 deletions(-)

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
index 49cf83e04c80..cae06a26fedb 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -257,6 +257,7 @@ struct dlm_lkb {
 	struct list_head	lkb_ownqueue;	/* list of locks for a process */
 	struct list_head	lkb_time_list;
 	ktime_t			lkb_timestamp;
+	spinlock_t		lkb_wait_time_lock;
 	ktime_t			lkb_wait_time;
 	unsigned long		lkb_timeout_cs;
 
@@ -279,6 +280,7 @@ struct dlm_lkb {
 		void			*lkb_astparam;	/* caller's ast arg */
 		struct dlm_user_args	*lkb_ua;
 	};
+	struct rcu_head		rcu;
 };
 
 /*
@@ -568,7 +570,9 @@ struct dlm_ls {
 	struct dlm_rsbtable	*ls_rsbtbl;
 	uint32_t		ls_rsbtbl_size;
 
-	struct mutex		ls_waiters_mutex;
+	struct srcu_struct	ls_lkb_srcu;
+
+	spinlock_t		ls_waiters_lock;
 	struct list_head	ls_waiters;	/* lkbs needing a reply */
 
 	struct mutex		ls_orphans_mutex;
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index c502c065d007..dbd3ef8a94b6 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1196,6 +1196,7 @@ static int create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret)
 	INIT_LIST_HEAD(&lkb->lkb_cb_list);
 	mutex_init(&lkb->lkb_cb_mutex);
 	INIT_WORK(&lkb->lkb_cb_work, dlm_callback_work);
+	spin_lock_init(&lkb->lkb_wait_time_lock);
 
 	idr_preload(GFP_NOFS);
 	spin_lock(&ls->ls_lkbidr_spin);
@@ -1239,6 +1240,20 @@ static void kill_lkb(struct kref *kref)
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
 
@@ -1251,12 +1266,7 @@ static int __put_lkb(struct dlm_ls *ls, struct dlm_lkb *lkb)
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
@@ -1399,24 +1409,30 @@ void dlm_scan_waiters(struct dlm_ls *ls)
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
+		spin_lock(&lkb->lkb_wait_time_lock);
+		if (!lkb->lkb_wait_time) {
+			spin_unlock(&lkb->lkb_wait_time_lock);
 			continue;
+		}
 
 		debug_scanned++;
 
 		us = ktime_to_us(ktime_sub(ktime_get(), lkb->lkb_wait_time));
 
-		if (us < dlm_config.ci_waitwarn_us)
+		if (us < dlm_config.ci_waitwarn_us) {
+			spin_unlock(&lkb->lkb_wait_time_lock);
 			continue;
+		}
 
 		lkb->lkb_wait_time = 0;
+		spin_unlock(&lkb->lkb_wait_time_lock);
 
 		debug_expired++;
 		if (us > debug_maxus)
@@ -1435,7 +1451,7 @@ void dlm_scan_waiters(struct dlm_ls *ls)
 			  "node %d", lkb->lkb_id, (long long)us,
 			  dlm_config.ci_waitwarn_us, lkb->lkb_wait_nodeid);
 	}
-	mutex_unlock(&ls->ls_waiters_mutex);
+	srcu_read_unlock(&ls->ls_lkb_srcu, idx);
 	kfree(warned);
 
 	if (debug_expired)
@@ -1452,8 +1468,6 @@ static int add_to_waiters(struct dlm_lkb *lkb, int mstype, int to_nodeid)
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
 	int error = 0;
 
-	mutex_lock(&ls->ls_waiters_mutex);
-
 	if (is_overlap_unlock(lkb) ||
 	    (is_overlap_cancel(lkb) && (mstype == DLM_MSG_CANCEL))) {
 		error = -EINVAL;
@@ -1487,16 +1501,19 @@ static int add_to_waiters(struct dlm_lkb *lkb, int mstype, int to_nodeid)
 
 	lkb->lkb_wait_count++;
 	lkb->lkb_wait_type = mstype;
+	spin_lock(&ls->ls_waiters_lock);
 	lkb->lkb_wait_time = ktime_get();
+	spin_unlock(&ls->ls_waiters_lock);
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
 
@@ -1584,21 +1601,18 @@ static int _remove_from_waiters(struct dlm_lkb *lkb, int mstype,
 
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
 
 /* Handles situations where we might be processing a "fake" or "stub" reply in
@@ -1606,15 +1620,7 @@ static int remove_from_waiters(struct dlm_lkb *lkb, int mstype)
 
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
@@ -1922,6 +1928,7 @@ void dlm_adjust_timeouts(struct dlm_ls *ls)
 {
 	struct dlm_lkb *lkb;
 	u64 adj_us = jiffies_to_usecs(jiffies - ls->ls_recover_begin);
+	int idx;
 
 	ls->ls_recover_begin = 0;
 	mutex_lock(&ls->ls_timeout_mutex);
@@ -1932,12 +1939,14 @@ void dlm_adjust_timeouts(struct dlm_ls *ls)
 	if (!dlm_config.ci_waitwarn_us)
 		return;
 
-	mutex_lock(&ls->ls_waiters_mutex);
-	list_for_each_entry(lkb, &ls->ls_waiters, lkb_wait_reply) {
+	idx = srcu_read_lock(&ls->ls_lkb_srcu);
+	spin_lock(&lkb->lkb_wait_time_lock);
+	list_for_each_entry_rcu(lkb, &ls->ls_waiters, lkb_wait_reply) {
 		if (ktime_to_us(lkb->lkb_wait_time))
 			lkb->lkb_wait_time = ktime_get();
 	}
-	mutex_unlock(&ls->ls_waiters_mutex);
+	spin_lock(&lkb->lkb_wait_time_lock);
+	srcu_read_unlock(&ls->ls_lkb_srcu, idx);
 }
 
 /* lkb is master or local copy */
@@ -5116,18 +5125,17 @@ static int waiter_needs_recovery(struct dlm_ls *ls, struct dlm_lkb *lkb,
 
 void dlm_recover_waiters_pre(struct dlm_ls *ls)
 {
-	struct dlm_lkb *lkb, *safe;
 	struct dlm_message *ms_stub;
 	int wait_type, stub_unlock_result, stub_cancel_result;
-	int dir_nodeid;
+	struct dlm_lkb *lkb;
+	int dir_nodeid, idx;
 
 	ms_stub = kmalloc(sizeof(*ms_stub), GFP_KERNEL);
 	if (!ms_stub)
 		return;
 
-	mutex_lock(&ls->ls_waiters_mutex);
-
-	list_for_each_entry_safe(lkb, safe, &ls->ls_waiters, lkb_wait_reply) {
+	idx = srcu_read_lock(&ls->ls_lkb_srcu);
+	list_for_each_entry_rcu(lkb, &ls->ls_waiters, lkb_wait_reply) {
 
 		dir_nodeid = dlm_dir_nodeid(lkb->lkb_resource);
 
@@ -5221,7 +5229,8 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 		}
 		schedule();
 	}
-	mutex_unlock(&ls->ls_waiters_mutex);
+	srcu_read_unlock(&ls->ls_lkb_srcu, idx);
+
 	kfree(ms_stub);
 }
 
@@ -5230,15 +5239,13 @@ static struct dlm_lkb *find_resend_waiter(struct dlm_ls *ls)
 	struct dlm_lkb *lkb;
 	int found = 0;
 
-	mutex_lock(&ls->ls_waiters_mutex);
-	list_for_each_entry(lkb, &ls->ls_waiters, lkb_wait_reply) {
+	list_for_each_entry_rcu(lkb, &ls->ls_waiters, lkb_wait_reply) {
 		if (lkb->lkb_flags & DLM_IFL_RESEND) {
 			hold_lkb(lkb);
 			found = 1;
 			break;
 		}
 	}
-	mutex_unlock(&ls->ls_waiters_mutex);
 
 	if (!found)
 		lkb = NULL;
@@ -5265,8 +5272,9 @@ int dlm_recover_waiters_post(struct dlm_ls *ls)
 {
 	struct dlm_lkb *lkb;
 	struct dlm_rsb *r;
-	int error = 0, mstype, err, oc, ou;
+	int error = 0, mstype, err, oc, ou, idx;
 
+	idx = srcu_read_lock(&ls->ls_lkb_srcu);
 	while (1) {
 		if (dlm_locking_stopped(ls)) {
 			log_debug(ls, "recover_waiters_post aborted");
@@ -5302,9 +5310,9 @@ int dlm_recover_waiters_post(struct dlm_ls *ls)
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
@@ -5353,6 +5361,7 @@ int dlm_recover_waiters_post(struct dlm_ls *ls)
 		put_rsb(r);
 		dlm_put_lkb(lkb);
 	}
+	srcu_read_unlock(&ls->ls_lkb_srcu, idx);
 
 	return error;
 }
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 2896f96cf2d3..46e68219a9e6 100644
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
+	synchronize_srcu(&ls->ls_lkb_srcu);
+	cleanup_srcu_struct(&ls->ls_lkb_srcu);
+
 	/*
 	 * Free all lkb's in idr
 	 */
-- 
2.27.0

