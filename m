Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 62B2B3D95FB
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Jul 2021 21:20:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627500057;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iq45NY2dP3dpl6ULbN+NmiKRyerDlVoTZgdKcRMH2zQ=;
	b=bmT+WO9If2wLJaXJzDtRYkHrztDO1VvGrK1eejL37FkeF9ZbSW7cgjQfWkNKbPDmisn7ps
	M/AG2tCZCrjf9bq7s7LeuLrd498J2ZzHQxcUmNhv6lW7MScqLBV5Zc7zKgXPIk4TmoGryP
	Af+zXYgeDy+9+ObscHzmkRv6T+COrmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-M3d6SLzCNryX7499n9KPZw-1; Wed, 28 Jul 2021 15:20:56 -0400
X-MC-Unique: M3d6SLzCNryX7499n9KPZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD2E8193F564;
	Wed, 28 Jul 2021 19:20:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 906E617B64;
	Wed, 28 Jul 2021 19:20:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 42FB6180B7A2;
	Wed, 28 Jul 2021 19:20:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16SJK4nP020822 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Jul 2021 15:20:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7E42C19D9D; Wed, 28 Jul 2021 19:20:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30FE319C66;
	Wed, 28 Jul 2021 19:20:00 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 28 Jul 2021 15:19:44 -0400
Message-Id: <20210728191944.327629-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, paulmck@linux.ibm.com, dave@stgolabs.net
Subject: [Cluster-devel] [RFC dlm/next] fs: dlm: initial commit of
	locktorture
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will introduce a locktorture test for DLM subsystem. The idea
is to have a torture test to proof some performance indication for DLM.
This torture test will allocate for each writer a DLM lock and try to
acquire the lock as much as it can. In a homogeneous cluster (all nodes
have equal hardware) other nodes try to acquire those locks as well.
As I have some local patches to improve the DLM network handling I can
notice a higher value report number of lock acquire.

How I test on a three cluster setup (1, 2, 3):

run "modprobe dlm_locktorture cluster_name=$CLUSTER_NAME"

in order of node id 1, 2, 3. The order seems to be important as I think
it will declare the master of all locks on node 1. Ignore the first
reported value because it was recorded on setup. With my local network
improvements patch I get follow values:

50421-25950 = 24471
74888-50421 = 24467
99394-74888 = 24506
123878-99394 = 24484

without the changes:

49835-25879 = 23956
73800-49835 = 23965
97635-73800 = 23835
121527-97635 = 23892

Note that the stats will always report the total numbers of lock
acquire. That's why $TOTAL_NUM - $TOTAL_NUM_PREV = $INTERVAL_NUM

I repeated this benchmark test and get always identical values,
if I setup it in order as noticed above. As you can see the
difference is about 500 more lock acquire with my patches during
the default testing interval of 60 seconds.

May the improvement is only under load, may it will benefit on long time
runs only. However this is a initial commit to provide something like
that for DLM, when new features/improvements will be added it might
worth to test it with dlm locktorture. Also I did not add every lock
mode which is possible in DLM e.g. rw locks. I removed the is_held
warning from the original implementation, this only works if we have it
stored in a shared memory "thing" of all nodes. I think there are a lot
of improvements, I did not implement everything yet.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/Kconfig           |  16 ++
 fs/dlm/Makefile          |   1 +
 fs/dlm/dlm_locktorture.c | 548 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 565 insertions(+)
 create mode 100644 fs/dlm/dlm_locktorture.c

diff --git a/fs/dlm/Kconfig b/fs/dlm/Kconfig
index ee92634196a8..05bd8f6933cd 100644
--- a/fs/dlm/Kconfig
+++ b/fs/dlm/Kconfig
@@ -16,3 +16,19 @@ config DLM_DEBUG
 	Under the debugfs mount point, the name of each lockspace will
 	appear as a file in the "dlm" directory.  The output is the
 	list of resource and locks the local node knows about.
+
+config DLM_LOCKTORTURE
+	tristate "DLM locktorture"
+	depends on DLM
+	select TORTURE_TEST
+	help
+	This options provides a kernel module that runs torture tests on
+	the DLM subsystem. If loaded on a homogeneous cluster setup (e.g.
+	all cluster nodes have the same architecture) it will run
+	concurrent lock and unlock procedures. The printed stats will show
+	how many lock acquire was possible.
+
+	Please never use Y for this module as it requires a working cluster
+	manager at loading time.
+	Say M if you want the DLM lock torture tests to be build as a module.
+	Say N if you are unsure.
diff --git a/fs/dlm/Makefile b/fs/dlm/Makefile
index 3545fdafc6fb..3268a9922dd9 100644
--- a/fs/dlm/Makefile
+++ b/fs/dlm/Makefile
@@ -19,4 +19,5 @@ dlm-y :=			ast.o \
 				user.o \
 				util.o 
 dlm-$(CONFIG_DLM_DEBUG) +=	debug_fs.o
+obj-$(CONFIG_DLM_LOCKTORTURE) += dlm_locktorture.o
 
diff --git a/fs/dlm/dlm_locktorture.c b/fs/dlm/dlm_locktorture.c
new file mode 100644
index 000000000000..ad4f88bea550
--- /dev/null
+++ b/fs/dlm/dlm_locktorture.c
@@ -0,0 +1,548 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Module-based torture test facility for dlm locking
+ *
+ * Copyright (C) 2021 Red Hat, Inc.  All rights reserved.
+ * Copyright (C) IBM Corporation, 2014
+ *
+ * Authors: Alexander Aring <aahringo@redhat.com>
+ *
+ * Original Authors: Paul E. McKenney <paulmck@linux.ibm.com>
+ *		     Davidlohr Bueso <dave@stgolabs.net>
+ *
+ *	Based on kernel/locking/locktorture.c.
+ */
+
+#define pr_fmt(fmt) fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/kthread.h>
+#include <linux/sched/rt.h>
+#include <linux/smp.h>
+#include <linux/interrupt.h>
+#include <linux/sched.h>
+#include <uapi/linux/sched/types.h>
+#include <linux/atomic.h>
+#include <linux/moduleparam.h>
+#include <linux/delay.h>
+#include <linux/slab.h>
+#include <linux/torture.h>
+#include <linux/reboot.h>
+#include <linux/dlm.h>
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alexander Aring <aahringo@redhat.com>");
+
+torture_param(int, nwriters_stress, -1,
+	     "Number of write-locking stress-test threads");
+torture_param(int, shuffle_interval, 3,
+	     "Number of jiffies between shuffles, 0=disable");
+torture_param(int, shutdown_secs, 0, "Shutdown time (j), <= zero to disable.");
+torture_param(int, stat_interval, 60,
+	     "Number of seconds between stats printk()s");
+torture_param(int, verbose, 1,
+	     "Enable verbose debugging printk()s");
+
+static char *cluster_name = "";
+module_param(cluster_name, charp, 0444);
+MODULE_PARM_DESC(cluster_name,
+		 "Cluster that lockspace will join");
+
+static char *torture_type = "ex";
+module_param(torture_type, charp, 0444);
+MODULE_PARM_DESC(torture_type,
+		 "Type of lock to torture (nl, ex)");
+
+static struct task_struct *stats_task;
+static struct task_struct **writer_tasks;
+
+struct lock_stress_stats {
+	long n_lock_fail;
+	long n_lock_acquired;
+};
+
+#define DLM_LOCKTORTURE_RES_NAME_LEN	65
+
+struct lock_data {
+	struct lock_stress_stats s;
+	/* need to be 8 byte aligned */
+	char res_name[DLM_LOCKTORTURE_RES_NAME_LEN];
+	size_t res_name_len;
+};
+
+/* Forward reference. */
+static void lock_torture_cleanup(void);
+
+/*
+ * Operations vector for selecting different types of tests.
+ */
+struct lock_torture_ops {
+	int (*writelock)(struct dlm_lksb *lksb,
+			 const char *res_name, size_t res_name_len);
+	void (*write_delay)(struct torture_random_state *trsp);
+	int (*writeunlock)(struct dlm_lksb *lksb);
+	const char *res_prefix;
+
+	const char *name;
+};
+
+struct lock_torture_cxt {
+	int nrealwriters_stress;
+	atomic_t n_lock_torture_errors;
+	struct lock_torture_ops *cur_ops;
+	struct lock_data *lwd; /* writer data */
+};
+static struct lock_torture_cxt cxt = { 0, ATOMIC_INIT(0),
+				       NULL, NULL};
+static dlm_lockspace_t *ls;
+static struct completion ls_completion;
+static bool lockspace_init;
+
+static void ast(void *astarg)
+{
+	complete(astarg);
+	pr_debug("dlm_locktorture: %s\n", __func__);
+}
+
+static void bast(void *astarg, int mode)
+{
+	pr_debug("dlm_locktorture: %s\n", __func__);
+}
+
+static int dlm_locktorture_lock(int mode, struct dlm_lksb *lksb,
+				const char *res_name, size_t res_name_len)
+{
+	struct completion completion;
+	int ret;
+
+	init_completion(&completion);
+retry:
+	ret = dlm_lock(ls, mode, lksb,
+		       0, (char *)res_name, res_name_len,
+		       0, ast, &completion, bast);
+	switch (ret) {
+	case 0:
+		break;
+	case -EAGAIN:
+		goto retry;
+	default:
+		return ret;
+	}
+	wait_for_completion(&completion);
+
+	return 0;
+}
+
+static int dlm_locktorture_unlock(struct dlm_lksb *lksb)
+{
+	struct completion completion;
+	int ret;
+
+	init_completion(&completion);
+	ret = dlm_unlock(ls, lksb->sb_lkid, 0, lksb, &completion);
+	switch (ret) {
+	case 0:
+		break;
+	default:
+		return ret;
+	}
+	wait_for_completion(&completion);
+
+	return 0;
+}
+
+/* exclusive lock */
+
+static int torture_ex_lock(struct dlm_lksb *lksb, const char *res_name,
+			   size_t res_name_len)
+{
+	return dlm_locktorture_lock(DLM_LOCK_EX, lksb, res_name, res_name_len);
+}
+
+static void torture_delay(struct torture_random_state *trsp)
+{
+	const unsigned long longdelay_ms = 100;
+
+	/* We want a long delay occasionally to force massive contention.  */
+	if (!(torture_random(trsp) %
+	      (cxt.nrealwriters_stress * 2000 * longdelay_ms)))
+		mdelay(longdelay_ms * 5);
+	else
+		mdelay(longdelay_ms / 5);
+	if (!(torture_random(trsp) % (cxt.nrealwriters_stress * 20000)))
+		torture_preempt_schedule();  /* Allow test to be preempted. */
+}
+
+static int torture_unlock(struct dlm_lksb *lksb)
+{
+	return dlm_locktorture_unlock(lksb);
+}
+
+static struct lock_torture_ops ex_lock_ops = {
+	.writelock	= torture_ex_lock,
+	.write_delay	= torture_delay,
+	.writeunlock	= torture_unlock,
+	.res_prefix	= "EX_LOCK",
+	.name		= "ex"
+};
+
+/* null lock */
+
+static int torture_nl_lock(struct dlm_lksb *lksb, const char *res_name,
+			    size_t res_name_len)
+{
+	return dlm_locktorture_lock(DLM_LOCK_NL, lksb, res_name, res_name_len);
+}
+
+static struct lock_torture_ops nl_lock_ops = {
+	.writelock	= torture_nl_lock,
+	.write_delay	= torture_delay,
+	.writeunlock	= torture_unlock,
+	.res_prefix	= "NL_LOCK",
+	.name		= "nl"
+};
+
+/*
+ * Lock torture writer kthread.  Repeatedly acquires and releases
+ * the lock, checking for duplicate acquisitions.
+ */
+static int lock_torture_writer(void *arg)
+{
+	struct lock_data *lwd = arg;
+	DEFINE_TORTURE_RANDOM(rand);
+	struct dlm_lksb lksb;
+	int ret;
+
+	VERBOSE_TOROUT_STRING("lock_torture_writer task started");
+	set_user_nice(current, MAX_NICE);
+
+	do {
+		if ((torture_random(&rand) & 0xfffff) == 0)
+			schedule_timeout_uninterruptible(1);
+
+		ret = cxt.cur_ops->writelock(&lksb, lwd->res_name,
+					     lwd->res_name_len);
+		if (WARN_ON_ONCE(ret))
+			lwd->s.n_lock_fail++;
+
+		lwd->s.n_lock_acquired++;
+		cxt.cur_ops->write_delay(&rand);
+		ret = cxt.cur_ops->writeunlock(&lksb);
+		if (WARN_ON_ONCE(ret))
+			lwd->s.n_lock_fail++;
+	} while (!torture_must_stop());
+
+	torture_kthread_stopping("lock_torture_writer");
+	return 0;
+}
+
+/*
+ * Create an lock-torture-statistics message in the specified buffer.
+ */
+static void __torture_print_stats(char *page,
+				  struct lock_data *ld)
+{
+	bool fail = false;
+	int i, n_stress;
+	long max = 0, min = ld ? ld[0].s.n_lock_acquired : 0;
+	long long sum = 0;
+
+	n_stress = cxt.nrealwriters_stress;
+	for (i = 0; i < n_stress; i++) {
+		if (ld[i].s.n_lock_fail)
+			fail = true;
+		sum += ld[i].s.n_lock_acquired;
+		if (max < ld[i].s.n_lock_acquired)
+			max = ld[i].s.n_lock_acquired;
+		if (min > ld[i].s.n_lock_acquired)
+			min = ld[i].s.n_lock_acquired;
+	}
+	page += sprintf(page,
+			"%s:  Total: %lld  Max/Min: %ld/%ld %s  Fail: %d %s\n",
+			"Writes",
+			sum, max, min,
+			max / 2 > min ? "???" : "",
+			fail, fail ? "!!!" : "");
+	if (fail)
+		atomic_inc(&cxt.n_lock_torture_errors);
+}
+
+/*
+ * Print torture statistics.  Caller must ensure that there is only one
+ * call to this function at a given time!!!  This is normally accomplished
+ * by relying on the module system to only have one copy of the module
+ * loaded, and then by giving the lock_torture_stats kthread full control
+ * (or the init/cleanup functions when lock_torture_stats thread is not
+ * running).
+ */
+static void lock_torture_stats_print(void)
+{
+	int size = cxt.nrealwriters_stress * 200 + 8192;
+	char *buf;
+
+	buf = kmalloc(size, GFP_KERNEL);
+	if (!buf) {
+		pr_err("%s: Out of memory, need: %d",
+		       __func__, size);
+		return;
+	}
+
+	__torture_print_stats(buf, cxt.lwd);
+	pr_alert("%s", buf);
+	kfree(buf);
+}
+
+/*
+ * Periodically prints torture statistics, if periodic statistics printing
+ * was specified via the stat_interval module parameter.
+ *
+ * No need to worry about fullstop here, since this one doesn't reference
+ * volatile state or register callbacks.
+ */
+static int lock_torture_stats(void *arg)
+{
+	VERBOSE_TOROUT_STRING("lock_torture_stats task started");
+	do {
+		schedule_timeout_interruptible(stat_interval * HZ);
+		lock_torture_stats_print();
+		torture_shutdown_absorb("lock_torture_stats");
+	} while (!torture_must_stop());
+	torture_kthread_stopping("lock_torture_stats");
+	return 0;
+}
+
+static inline void
+lock_torture_print_module_parms(struct lock_torture_ops *cur_ops,
+				const char *tag)
+{
+	pr_alert("%s" TORTURE_FLAG
+		 "--- %s: nwriters_stress=%d stat_interval=%d verbose=%d shuffle_interval=%d shutdown_secs=%d\n",
+		 torture_type, tag,
+		 cxt.nrealwriters_stress, stat_interval,
+		 verbose, shuffle_interval, shutdown_secs);
+}
+
+static void lock_torture_cleanup(void)
+{
+	int i, ret;
+
+	if (torture_cleanup_begin())
+		return;
+
+	/*
+	 * Indicates early cleanup, meaning that the test has not run,
+	 * such as when passing bogus args when loading the module.
+	 * However cxt->cur_ops.init() may have been invoked, so beside
+	 * perform the underlying torture-specific cleanups, cur_ops.exit()
+	 * will be invoked if needed.
+	 */
+	if (!cxt.lwd)
+		goto end;
+
+	if (writer_tasks) {
+		for (i = 0; i < cxt.nrealwriters_stress; i++)
+			torture_stop_kthread(lock_torture_writer,
+					     writer_tasks[i]);
+		kfree(writer_tasks);
+		writer_tasks = NULL;
+	}
+
+	torture_stop_kthread(lock_torture_stats, stats_task);
+	lock_torture_stats_print();  /* -After- the stats thread is stopped! */
+
+	if (atomic_read(&cxt.n_lock_torture_errors))
+		lock_torture_print_module_parms(cxt.cur_ops,
+						"End of test: FAILURE");
+	else if (torture_onoff_failures())
+		lock_torture_print_module_parms(cxt.cur_ops,
+						"End of test: LOCK_HOTPLUG");
+	else
+		lock_torture_print_module_parms(cxt.cur_ops,
+						"End of test: SUCCESS");
+
+	kfree(cxt.lwd);
+	cxt.lwd = NULL;
+
+end:
+	torture_cleanup_end();
+
+	if (ls) {
+		ret = dlm_release_lockspace(ls, 0);
+		lockspace_init = false;
+		ls = NULL;
+		WARN_ON_ONCE(ret);
+	}
+}
+
+static void recover_prep(void *arg)
+{
+	pr_info("dlm_locktorture: %s\n", __func__);
+}
+
+static void recover_slot(void *arg, struct dlm_slot *slot)
+{
+	pr_info("dlm_locktorture: %s\n", __func__);
+}
+
+static void recover_done(void *arg, struct dlm_slot *slots,
+			 int num_slots, int our_slot,
+			 uint32_t generation)
+{
+	pr_info("dlm_locktorture: %s\n", __func__);
+
+	if (!lockspace_init)
+		complete(&ls_completion);
+}
+
+static const struct dlm_lockspace_ops torture_ls_ops = {
+	.recover_prep = recover_prep,
+	.recover_slot = recover_slot,
+	.recover_done = recover_done,
+};
+
+static int __init lock_torture_init(void)
+{
+	static struct lock_torture_ops *torture_ops[] = {
+		&ex_lock_ops,
+		&nl_lock_ops,
+	};
+	char str[DLM_LOCKTORTURE_RES_NAME_LEN];
+	int firsterr = 0;
+	int i, ret;
+
+	if (IS_BUILTIN(CONFIG_DLM_LOCKTORTURE)) {
+		pr_alert("lock-torture: WARNING DLM lock torture build as built-in will skip testing. Please build it as module and load after dlm user space is setup correctly\n");
+		return -EINVAL;
+	}
+
+	if (!torture_init_begin(torture_type, verbose))
+		return -EBUSY;
+
+	if (strcmp(cluster_name, "") == 0)
+		pr_alert("lock-torture: WARNING empty cluster_name. Please specify via cluster_name parameter\n");
+
+	/* Process args and tell the world that the torturer is on the job. */
+	for (i = 0; i < ARRAY_SIZE(torture_ops); i++) {
+		cxt.cur_ops = torture_ops[i];
+		if (strcmp(torture_type, cxt.cur_ops->name) == 0)
+			break;
+	}
+	if (i == ARRAY_SIZE(torture_ops)) {
+		pr_alert("lock-torture: invalid torture type: \"%s\"\n",
+			 torture_type);
+		pr_alert("lock-torture types:");
+		for (i = 0; i < ARRAY_SIZE(torture_ops); i++)
+			pr_alert(" %s", torture_ops[i]->name);
+		pr_alert("\n");
+		firsterr = -EINVAL;
+		goto unwind;
+	}
+
+	init_completion(&ls_completion);
+	firsterr = dlm_new_lockspace("locktorture", cluster_name, DLM_LSFL_FS,
+				     64, &torture_ls_ops, NULL, &ret, &ls);
+	if (firsterr || ret) {
+		if (ret)
+			firsterr = ret;
+
+		goto unwind;
+	}
+	wait_for_completion(&ls_completion);
+	lockspace_init = true;
+
+	if (nwriters_stress >= 0)
+		cxt.nrealwriters_stress = nwriters_stress;
+	else
+		cxt.nrealwriters_stress = 2 * num_online_cpus();
+
+	/* Initialize the statistics so that each run gets its own numbers. */
+	if (nwriters_stress) {
+		cxt.lwd = kmalloc_array(cxt.nrealwriters_stress,
+					sizeof(*cxt.lwd),
+					GFP_KERNEL);
+		if (cxt.lwd == NULL) {
+			VERBOSE_TOROUT_STRING("cxt.lwd: Out of memory");
+			firsterr = -ENOMEM;
+			goto unwind;
+		}
+
+		for (i = 0; i < cxt.nrealwriters_stress; i++) {
+			cxt.lwd[i].s.n_lock_fail = 0;
+			cxt.lwd[i].s.n_lock_acquired = 0;
+
+			snprintf(str, DLM_LOCKTORTURE_RES_NAME_LEN, "%s_%d",
+				 cxt.cur_ops->res_prefix, i);
+			snprintf(cxt.lwd[i].res_name, DLM_LOCKTORTURE_RES_NAME_LEN,
+				 "%-64s", str);
+			cxt.lwd[i].res_name_len = strlen(cxt.lwd[i].res_name);
+		}
+	}
+
+	lock_torture_print_module_parms(cxt.cur_ops, "Start of test");
+
+	/* Prepare torture context. */
+	if (shuffle_interval > 0) {
+		firsterr = torture_shuffle_init(shuffle_interval);
+		if (firsterr)
+			goto unwind;
+	}
+	if (shutdown_secs > 0) {
+		firsterr = torture_shutdown_init(shutdown_secs,
+						 lock_torture_cleanup);
+		if (firsterr)
+			goto unwind;
+	}
+
+	if (nwriters_stress) {
+		writer_tasks = kcalloc(cxt.nrealwriters_stress,
+				       sizeof(writer_tasks[0]),
+				       GFP_KERNEL);
+		if (writer_tasks == NULL) {
+			VERBOSE_TOROUT_ERRSTRING("writer_tasks: Out of memory");
+			firsterr = -ENOMEM;
+			goto unwind;
+		}
+	}
+
+	/*
+	 * Create the kthreads and start torturing (oh, those poor little locks).
+	 *
+	 * TODO: Note that we interleave writers with readers, giving writers a
+	 * slight advantage, by creating its kthread first. This can be modified
+	 * for very specific needs, or even let the user choose the policy, if
+	 * ever wanted.
+	 */
+	for (i = 0; i < cxt.nrealwriters_stress; i++) {
+		/* Create writer. */
+		firsterr = torture_create_kthread(lock_torture_writer, &cxt.lwd[i],
+						  writer_tasks[i]);
+		if (firsterr)
+			goto unwind;
+	}
+	if (stat_interval > 0) {
+		firsterr = torture_create_kthread(lock_torture_stats, NULL,
+						  stats_task);
+		if (firsterr)
+			goto unwind;
+	}
+	torture_init_end();
+	return 0;
+
+unwind:
+	torture_init_end();
+	lock_torture_cleanup();
+	if (ls) {
+		ret = dlm_release_lockspace(ls, 0);
+		ls = NULL;
+		WARN_ON_ONCE(ret);
+	}
+	if (shutdown_secs) {
+		WARN_ON(!IS_MODULE(CONFIG_LOCK_TORTURE_TEST));
+		kernel_power_off();
+	}
+	return firsterr;
+}
+
+module_init(lock_torture_init);
+module_exit(lock_torture_cleanup);
-- 
2.27.0

