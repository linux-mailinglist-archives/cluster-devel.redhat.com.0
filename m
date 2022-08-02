Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 705655880EA
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Aug 2022 19:21:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659460879;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/wjuMnUG/dMclAmUsbWFTM2Rd0eh9vwVg7HpDbgjdGo=;
	b=SG6TnQCk3qPrOWrBQZ08nrGBzivAJLEkAAjLrSzsrmMyAO38aWKOqU6DQ3FiB4qgt9TWNl
	K8DjLN/MZ2n96TQl5lxRUOHCIt/lOUSKOHkz5Pl8/Af0Bfx88Kq9xexshd+pqlQ9FRxALQ
	ehJIuuAVT7ulHWEXzNxH+rwq1jRdOK8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-ZE1XNn5FPPWzPF5q9bCLyg-1; Tue, 02 Aug 2022 13:21:16 -0400
X-MC-Unique: ZE1XNn5FPPWzPF5q9bCLyg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FE8B3C0E217;
	Tue,  2 Aug 2022 17:21:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B74A492C3B;
	Tue,  2 Aug 2022 17:21:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C06B31946A57;
	Tue,  2 Aug 2022 17:21:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D09321946A51 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 17:21:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C13901121315; Tue,  2 Aug 2022 17:21:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98EA61121314;
 Tue,  2 Aug 2022 17:21:11 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  2 Aug 2022 13:21:08 -0400
Message-Id: <20220802172108.3396447-3-aahringo@redhat.com>
In-Reply-To: <20220802172108.3396447-1-aahringo@redhat.com>
References: <20220802172108.3396447-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCH dlm/next 3/3] fs: dlm: initial commit of
 locktorture
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
Cc: cluster-devel@redhat.com, dave@stgolabs.net, josh@joshtriplett.org,
 paulmck@kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will introduce a locktorture test for DLM subsystem. The idea
is to have a torture test to proof some performance indication for DLM.
This torture test will allocate for each lock task a DLM lock and try to
acquire the lock as much as it can. In a homogeneous cluster (all nodes
have equal hardware) other nodes will try to acquire those locks as well.

You can run it by "modprobe dlm_locktorture cluster=$CLUSTER_NAME", note
that cluster is required to provide a cluster name for the cluster
manager.

Currently there is only one simple lock operation which is to create a
lock in NL state and switch to EX and NL with a little bit of delay in
the middle to simulate lock contention. This locktorture module uses the
locktorture API from the linux kernel to provide such functionality.
However the lock ops are very different and currently handled as
start/stop and a iteration of a "testing step" e.g. switch to EX and NL
over some looping behaviour. In future we can add more test regarding
different lock modes in dlm or pressure tests for functionality such as
lock request cancellation functionality.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/Kconfig           |  11 +
 fs/dlm/Makefile          |   1 +
 fs/dlm/dlm_locktorture.c | 514 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 526 insertions(+)
 create mode 100644 fs/dlm/dlm_locktorture.c

diff --git a/fs/dlm/Kconfig b/fs/dlm/Kconfig
index 1105ce3c80cb..50313d598489 100644
--- a/fs/dlm/Kconfig
+++ b/fs/dlm/Kconfig
@@ -25,3 +25,14 @@ config DLM_DEBUG
 	Under the debugfs mount point, the name of each lockspace will
 	appear as a file in the "dlm" directory.  The output is the
 	list of resource and locks the local node knows about.
+
+config DLM_LOCKTORTURE
+	tristate "DLM locktorture"
+	depends on DLM && m
+	select TORTURE_TEST
+	help
+	This options provides a kernel module that runs torture tests on
+	the DLM subsystem. If loaded on a homogeneous cluster setup (e.g.
+	all cluster nodes have the same architecture) it will run
+	concurrent lock and unlock procedures. The printed stats will show
+	how many lock acquire were possible.
diff --git a/fs/dlm/Makefile b/fs/dlm/Makefile
index 71dab733cf9a..4d333b4502ba 100644
--- a/fs/dlm/Makefile
+++ b/fs/dlm/Makefile
@@ -19,4 +19,5 @@ dlm-y :=			ast.o \
 				util.o 
 dlm-$(CONFIG_DLM_DEPRECATED_API) +=	netlink.o
 dlm-$(CONFIG_DLM_DEBUG) +=	debug_fs.o
+obj-$(CONFIG_DLM_LOCKTORTURE) += dlm_locktorture.o
 
diff --git a/fs/dlm/dlm_locktorture.c b/fs/dlm/dlm_locktorture.c
new file mode 100644
index 000000000000..00ac6ac5fe42
--- /dev/null
+++ b/fs/dlm/dlm_locktorture.c
@@ -0,0 +1,514 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Module-based torture test facility for dlm locking
+ *
+ * Copyright (C) 2022 Red Hat, Inc.  All rights reserved.
+ * Copyright (C) IBM Corporation, 2014
+ *
+ * Authors: Alexander Aring <aahringo@redhat.com>
+ *
+ * Original Authors: Paul E. McKenney <paulmck@linux.ibm.com>
+ *		     Davidlohr Bueso <dave@stgolabs.net>
+ *
+ * Based on kernel/locking/locktorture.c.
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
+torture_param(int, nlock_stress, -1,
+	      "Number of locking stress-test threads");
+torture_param(int, shuffle_interval, 3,
+	      "Number of jiffies between shuffles, 0=disable");
+torture_param(int, shutdown_secs, 0, "Shutdown time (j), <= zero to disable.");
+torture_param(int, stat_interval, 60,
+	      "Number of seconds between stats printk()s");
+torture_param(int, verbose, 1,
+	      "Enable verbose debugging printk()s");
+/* because torture_param() wants to use charp */
+typedef char *charp;
+torture_param(charp, cluster, NULL,
+	      "Cluster name that lockspace will join");
+
+#define DLM_LOCKTORTURE_RES_NAME_LEN (DLM_RESNAME_MAXLEN + 1)
+
+static struct task_struct **lock_tasks;
+static struct task_struct *stats_task;
+static char *torture_type = "exnl";
+static dlm_lockspace_t *ls;
+static long long prev_sum;
+
+struct lock_stress_stats {
+	long n_iter;
+};
+
+struct lock_data {
+	struct lock_stress_stats s;
+
+	char res_name[DLM_LOCKTORTURE_RES_NAME_LEN];
+	size_t res_name_len;
+};
+
+/*
+ * Operations vector for selecting different types of tests.
+ */
+struct lock_torture_ops {
+	int (*start)(struct dlm_lksb *lksb, const char *res_name,
+		     size_t res_name_len);
+	int (*iter)(struct dlm_lksb *lksb, const char *res_name,
+		    size_t res_name_len, struct torture_random_state *trsp);
+	int (*stop)(struct dlm_lksb *lksb);
+
+	const char *name;
+};
+
+struct lock_torture_cxt {
+	int nreallock_stress;
+	struct lock_torture_ops *cur_ops;
+	struct lock_data *lwd;
+};
+static struct lock_torture_cxt cxt = { 0, NULL, NULL};
+
+static void ast(void *astarg)
+{
+	complete(astarg);
+	pr_debug("dlm_locktorture: %s\n", __func__);
+}
+
+static void bast(void *astarg, int mode)
+{
+	pr_debug("dlm_locktorture: %s mode: %d\n", __func__, mode);
+}
+
+static void torture_delay(struct torture_random_state *trsp)
+{
+	const unsigned long longdelay_ms = 100;
+
+	/* We want a long delay occasionally to force massive contention.  */
+	if (!(torture_random(trsp) %
+	      (cxt.nreallock_stress * 2000 * longdelay_ms)))
+		mdelay(longdelay_ms * 5);
+	else
+		mdelay(longdelay_ms / 5);
+	if (!(torture_random(trsp) % (cxt.nreallock_stress * 20000)))
+		torture_preempt_schedule();  /* Allow test to be preempted. */
+}
+
+static int torture_dlm_lock_sync(int mode, uint32_t flags,
+				 struct dlm_lksb *lksb, const char *res_name,
+				 size_t res_name_len)
+{
+	struct completion completion;
+	int ret;
+
+	init_completion(&completion);
+retry:
+	ret = dlm_lock(ls, mode, lksb, flags, res_name, res_name_len, 0, ast,
+		       &completion, bast);
+	switch (ret) {
+	case 0:
+		wait_for_completion(&completion);
+		return 0;
+	case -EBUSY:
+		goto retry;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int torture_start(struct dlm_lksb *lksb, const char *res_name,
+			 size_t res_name_len)
+{
+	return torture_dlm_lock_sync(DLM_LOCK_NL, 0, lksb, res_name,
+				     res_name_len);
+}
+
+static int torture_stop(struct dlm_lksb *lksb)
+{
+	struct completion completion;
+	int ret;
+
+	init_completion(&completion);
+retry:
+	ret = dlm_unlock(ls, lksb->sb_lkid, 0, lksb, &completion);
+	switch (ret) {
+	case 0:
+		wait_for_completion(&completion);
+		return 0;
+	case -EBUSY:
+		goto retry;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+/* exclusive lock case, switch between EX and NL */
+
+static int torture_ex_iter(struct dlm_lksb *lksb, const char *res_name,
+			   size_t res_name_len, struct torture_random_state *trsp)
+{
+	int ret;
+
+	ret = torture_dlm_lock_sync(DLM_LOCK_EX, DLM_LKF_CONVERT,
+				    lksb, res_name, res_name_len);
+	if (ret)
+		return ret;
+
+	/* fake lock contention */
+	torture_delay(trsp);
+
+	ret = torture_dlm_lock_sync(DLM_LOCK_NL, DLM_LKF_CONVERT,
+				    lksb, res_name, res_name_len);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static struct lock_torture_ops exnl_lock_ops = {
+	.start		= torture_start,
+	.iter		= torture_ex_iter,
+	.stop		= torture_stop,
+	.name           = "exnl"
+};
+
+/*
+ * Lock torture lock kthread.  Repeatedly acquires and releases
+ * the lock, checking for duplicate acquisitions.
+ */
+static int lock_torture(void *arg)
+{
+	struct lock_data *lwd = arg;
+	DEFINE_TORTURE_RANDOM(rand);
+	struct dlm_lksb lksb;
+	int ret;
+
+	VERBOSE_TOROUT_STRING("lock_torture task started");
+	set_user_nice(current, MAX_NICE);
+
+	ret = cxt.cur_ops->start(&lksb, lwd->res_name, lwd->res_name_len);
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
+	do {
+		if ((torture_random(&rand) & 0xfffff) == 0)
+			schedule_timeout_uninterruptible(1);
+
+		ret = cxt.cur_ops->iter(&lksb, lwd->res_name,
+					lwd->res_name_len, &rand);
+		if (WARN_ON_ONCE(ret))
+			break;
+
+		lwd->s.n_iter++;
+	} while (!torture_must_stop());
+
+	ret = cxt.cur_ops->stop(&lksb);
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
+	torture_kthread_stopping("lock_torture");
+	return 0;
+}
+
+/*
+ * Create an lock-torture-statistics message in the specified buffer.
+ */
+static void __torture_print_stats(char *page,
+				  struct lock_data *ld)
+{
+	long long sum = 0, sum_diff;
+	int i, n_stress;
+
+	n_stress = cxt.nreallock_stress;
+	for (i = 0; i < n_stress; i++)
+		sum += ld[i].s.n_iter;
+
+	sum_diff = sum - prev_sum;
+	prev_sum = sum;
+
+	page += sprintf(page, "Iterations: %lld\n", sum_diff);
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
+	int size = cxt.nreallock_stress * 200 + 8192;
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
+		 "--- %s: cluser=%s nlock_stress=%d stat_interval=%d verbose=%d shuffle_interval=%d shutdown_secs=%d\n",
+		 torture_type, tag, cluster, cxt.nreallock_stress,
+		 stat_interval, verbose, shuffle_interval, shutdown_secs);
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
+	if (lock_tasks) {
+		for (i = 0; i < cxt.nreallock_stress; i++)
+			torture_stop_kthread(lock_torture, lock_tasks[i]);
+
+		kfree(lock_tasks);
+		lock_tasks = NULL;
+
+		ret = dlm_release_lockspace(ls, 2);
+		WARN_ON(ret);
+		ls = NULL;
+	}
+
+	torture_stop_kthread(lock_torture_stats, stats_task);
+
+	lock_torture_stats_print();  /* -After- the stats thread is stopped! */
+
+	if (torture_onoff_failures())
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
+}
+
+static void recover_prep(void *arg)
+{
+	pr_info("dlm_locktorture: %s\n", __func__);
+}
+
+static void recover_slot(void *arg, struct dlm_slot *slot)
+{
+	pr_info("dlm_locktorture: %s nodeid: %d slot: %d\n", __func__,
+		slot->nodeid, slot->slot);
+}
+
+static void recover_done(void *arg, struct dlm_slot *slots,
+			 int num_slots, int our_slot,
+			 uint32_t generation)
+{
+	int i;
+
+	pr_info("dlm_locktorture: %s num_slots: %d our_slot: %d generation: %u\n",
+		__func__, num_slots, our_slot, generation);
+
+	for (i = 0; i < num_slots; i++) {
+		pr_info("dlm_locktorture: %s slot->nodeid: %d slot->slot: %d\n",
+			__func__, slots[i].nodeid, slots[i].slot);
+	}
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
+		&exnl_lock_ops,
+	};
+	char str[DLM_LOCKTORTURE_RES_NAME_LEN];
+	int i, ret;
+
+	if (!cluster) {
+		pr_err("dlm_locktorture: cluster parameter required\n");
+		return -EINVAL;
+	}
+
+	if (!torture_init_begin(torture_type, verbose))
+		return -EBUSY;
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
+		ret = -EINVAL;
+		goto err;
+	}
+
+	if (nlock_stress >= 0)
+		cxt.nreallock_stress = nlock_stress;
+	else
+		cxt.nreallock_stress = 2 * num_online_cpus();
+
+	/* Initialize the statistics so that each run gets its own numbers. */
+	if (nlock_stress) {
+		cxt.lwd = kmalloc_array(cxt.nreallock_stress,
+					sizeof(*cxt.lwd),
+					GFP_KERNEL);
+		if (cxt.lwd == NULL) {
+			VERBOSE_TOROUT_STRING("cxt.lwd: Out of memory");
+			ret = -ENOMEM;
+			goto err;
+		}
+
+		for (i = 0; i < cxt.nreallock_stress; i++) {
+			cxt.lwd[i].s.n_iter = 0;
+
+			snprintf(str, DLM_LOCKTORTURE_RES_NAME_LEN, "%s_%d",
+				 cxt.cur_ops->name, i);
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
+		ret = torture_shuffle_init(shuffle_interval);
+		if (ret)
+			goto err;
+	}
+
+	if (shutdown_secs > 0) {
+		ret = torture_shutdown_init(shutdown_secs,
+					    lock_torture_cleanup);
+		if (ret)
+			goto err;
+	}
+
+	if (nlock_stress) {
+		lock_tasks = kcalloc(cxt.nreallock_stress,
+				     sizeof(lock_tasks[0]), GFP_KERNEL);
+		if (lock_tasks == NULL) {
+			TOROUT_ERRSTRING("lock_tasks: Out of memory");
+			ret = -ENOMEM;
+			goto err;
+		}
+
+		ret = dlm_new_lockspace("locktorture", cluster, 0, 64, &torture_ls_ops,
+					NULL, &ret, &ls);
+		if (ret)
+			goto err;
+	}
+
+	/*
+	 * Create the kthreads and start torturing (oh, those poor little dlm locks).
+	 */
+	for (i = 0; i < cxt.nreallock_stress; i++) {
+		/* Create lockers. */
+		ret = torture_create_kthread(lock_torture, &cxt.lwd[i],
+					     lock_tasks[i]);
+		if (ret)
+			goto err;
+	}
+
+	if (stat_interval > 0) {
+		ret = torture_create_kthread(lock_torture_stats, NULL,
+					     stats_task);
+		if (ret)
+			goto err;
+	}
+
+	torture_init_end();
+
+	return 0;
+
+err:
+	torture_init_end();
+
+	if (ls) {
+		ret = dlm_release_lockspace(ls, 2);
+		WARN_ON(ret);
+	}
+
+	if (shutdown_secs)
+		kernel_power_off();
+
+	return ret;
+}
+
+module_init(lock_torture_init);
+module_exit(lock_torture_cleanup);
-- 
2.31.1

