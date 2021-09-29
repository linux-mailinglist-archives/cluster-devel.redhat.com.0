Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9E22741CAE5
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Sep 2021 19:11:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632935468;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=E4DM7/ZUV6kcZlCxHigc1Sxfow1snZ4ZA6y3Mho25L0=;
	b=i38egvuMcDn0KvXyhS+2lqXBiT9JEFJjift63suX1uvTa+lcPU4tipjiH1zbeuIgpBi53I
	e68x5dcx06aeJUuDCDk9tuNYa5ij/8ZocY44Ct3QQqBEml2z59iNd7L/8D3peeOhb0aKAT
	gTo2rcQAWUN8RxfTyMk7An/j6i4/ypw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-YTNagG-uO2679MaOnjytXg-1; Wed, 29 Sep 2021 13:11:07 -0400
X-MC-Unique: YTNagG-uO2679MaOnjytXg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D0C71922023;
	Wed, 29 Sep 2021 17:11:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF18F60657;
	Wed, 29 Sep 2021 17:11:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4CA94E58E;
	Wed, 29 Sep 2021 17:11:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18THAw0p028366 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 29 Sep 2021 13:10:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF2C81346F; Wed, 29 Sep 2021 17:10:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6ED8019811;
	Wed, 29 Sep 2021 17:10:58 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 29 Sep 2021 13:10:54 -0400
Message-Id: <20210929171054.2623204-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: avoid ls_waiter_mutex
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds comments about a very specific DLM behaviour which we
require to avoid a deadlock. The behaviour is about a state when new DLM
operations and processing of DLM messages are stopped. This DLM state
indicates that a certain group of function in DLM can't occur e.g.
any central locking logic stages functionality of fs/dlm/lock.c .
To check on this state a new assert "DLM_ASSERT_OPS_LOCKED" was introduced
to be sure that the required locks are held when this state is required.

One of the function where this state is required is
"dlm_recover_waiters_pre()", otherwise a deadlock can occur because a
different lock order between ls_waiters_mutex and res_mutex. A reverse
lock order of dlm_recover_waiters_pre() can't happen because the right
locks are hold to stop all "lock operations" as DLM_ASSERT_OPS_LOCKED()
checks on it. This patch moves the "ls_waiters_mutex" to a different
lockclass to avoid a lockdep warning about a possible deadlock.
The lock should be the same lockclass but so far I understand the only
way to tell lockdep to handle the lock in dlm_recover_waiters_pre()
differently than other ls_waiters_mutex lock calls.

It should avoid the following warning:

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

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h | 22 ++++++++++++++++++++++
 fs/dlm/lock.c         | 12 +++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 49cf83e04c80..3fb610dfea19 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -746,6 +746,28 @@ static inline int dlm_no_directory(struct dlm_ls *ls)
 	return test_bit(LSFL_NODIR, &ls->ls_flags);
 }
 
+#ifdef CONFIG_PROVE_LOCKING
+static inline int dlm_assert_ops_unlocked(struct dlm_ls *ls)
+{
+	int ret = 0;
+
+	/* will block all new DLM-API from user */
+	ret |= !rwsem_is_locked(&ls->ls_in_recovery);
+	/* assumed this flag was set while ls_recv_active was locked.
+	 * This will make sure no receiving is processed and every
+	 * further receivings are queued into the requestqueue.
+	 */
+	ret |= !dlm_locking_stopped(ls);
+
+	return ret;
+}
+#define DLM_ASSERT_OPS_LOCKED(ls)			\
+	DLM_ASSERT(dlm_assert_ops_unlocked(ls) == 0,	\
+		   printk("Locking active in ls: %s\n", ls->ls_name);)
+#else
+#define DLM_ASSERT_OPS_LOCKED(ls)
+#endif /* CONFIG_PROVE_LOCKING */
+
 int dlm_netlink_init(void);
 void dlm_netlink_exit(void);
 void dlm_timeout_warn(struct dlm_lkb *lkb);
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index c502c065d007..4231edb3c614 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -5125,7 +5125,17 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
 	if (!ms_stub)
 		return;
 
-	mutex_lock(&ls->ls_waiters_mutex);
+	/* we do mutex_lock_nested() here in a different lockclass to avoid
+	 * a false positive report about a possible circular lock dependency.
+	 * The lockclass should be the same but doing it avoids the false
+	 * positive report. This report is about a different lock order
+	 * regarding to ls_waiters_mutex lock and res_mutex of lkb between here
+	 * and during lock operations. However lock operations cannot run in
+	 * parallel with dlm_recover_waiters_pre() because certain locks are
+	 * held which DLM_ASSERT_OPS_LOCKED(ls) is checking on.
+	 */
+	DLM_ASSERT_OPS_LOCKED(ls);
+	mutex_lock_nested(&ls->ls_waiters_mutex, 1);
 
 	list_for_each_entry_safe(lkb, safe, &ls->ls_waiters, lkb_wait_reply) {
 
-- 
2.27.0

