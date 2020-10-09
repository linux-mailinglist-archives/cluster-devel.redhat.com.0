Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2A12D28B09D
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 10:53:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-BjYTAIeTMjio_kCRZz133g-1; Mon, 12 Oct 2020 04:53:16 -0400
X-MC-Unique: BjYTAIeTMjio_kCRZz133g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6683AE82C;
	Mon, 12 Oct 2020 08:53:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B90F973674;
	Mon, 12 Oct 2020 08:53:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E75EA2215;
	Mon, 12 Oct 2020 08:53:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 099JqH5S019780 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 15:52:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B2725207ABFD; Fri,  9 Oct 2020 19:52:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A96E6207AD61
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:52:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D51F3811E7F
	for <cluster-devel@redhat.com>; Fri,  9 Oct 2020 19:52:14 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-203-6Q66nKKTNQuq6wdeqVFHFQ-1;
	Fri, 09 Oct 2020 15:52:12 -0400
X-MC-Unique: 6Q66nKKTNQuq6wdeqVFHFQ-1
IronPort-SDR: XiWbCFv3lI+cHcy/9EnuMJLSIdKNkCM3HUwVQ0Cga5QCN2mcmGb43nHNrfIAYcbjtoLBv9dQXQ
	D/m7m/ZeI87Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="250225923"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="250225923"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:51:07 -0700
IronPort-SDR: q86t8daZNt+V6d8RNukEYKSCMEs+oCo1U1vd6Yq1DOlnqrvHVUOvZ3CGMAsBzz1plldsK41yyY
	6uUXC42AACQg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="317146961"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga006-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:51:06 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:49:41 -0700
Message-Id: <20201009195033.3208459-7-ira.weiny@intel.com>
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 12 Oct 2020 04:53:05 -0400
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org,
	linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, Ben Segall <bsegall@google.com>,
	linux-mm@kvack.org, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
	samba-technical@lists.samba.org, Ira Weiny <ira.weiny@intel.com>,
	ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-rdma@vger.kernel.org, x86@kernel.org,
	amd-gfx@lists.freedesktop.org, io-uring@vger.kernel.org,
	cluster-devel@redhat.com, linux-cachefs@redhat.com,
	intel-wired-lan@lists.osuosl.org, Mel Gorman <mgorman@suse.de>,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	Fenghua Yu <fenghua.yu@intel.com>, linux-afs@lists.infradead.org,
	linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	reiserfs-devel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	drbd-dev@tron.linbit.com, Dan Williams <dan.j.williams@intel.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
	netdev@vger.kernel.org, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH RFC PKS/PMEM 06/58] kmap: Introduce
	k[un]map_thread debugging
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
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

From: Ira Weiny <ira.weiny@intel.com>

Most kmap() callers use the map within a single thread and have no need
for the protection domain to be enabled globally.

To differentiate these kmap users, new k[un]map_thread() calls were
introduced which are thread local.

To aid in debugging the new use of kmap_thread(), add a reference count,
a check on that count, and tracing to ID where mapping errors occur.

Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 include/linux/highmem.h            |  5 +++
 include/linux/sched.h              |  5 +++
 include/trace/events/kmap_thread.h | 56 ++++++++++++++++++++++++++++++
 init/init_task.c                   |  3 ++
 kernel/fork.c                      | 15 ++++++++
 lib/Kconfig.debug                  |  8 +++++
 mm/debug.c                         | 23 ++++++++++++
 7 files changed, 115 insertions(+)
 create mode 100644 include/trace/events/kmap_thread.h

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index ef7813544719..22d1c000802e 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -247,6 +247,10 @@ static inline void kunmap(struct page *page)
 	__kunmap(page, true);
 }
 
+#ifdef CONFIG_DEBUG_KMAP_THREAD
+void *kmap_thread(struct page *page);
+void kunmap_thread(struct page *page);
+#else
 static inline void *kmap_thread(struct page *page)
 {
 	return __kmap(page, false);
@@ -255,6 +259,7 @@ static inline void kunmap_thread(struct page *page)
 {
 	__kunmap(page, false);
 }
+#endif
 
 /*
  * Prevent people trying to call kunmap_atomic() as if it were kunmap()
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 25d97ab6c757..4627ea4a49e6 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1318,6 +1318,11 @@ struct task_struct {
 #ifdef CONFIG_ZONE_DEVICE_ACCESS_PROTECTION
 	unsigned int			dev_page_access_ref;
 #endif
+
+#ifdef CONFIG_DEBUG_KMAP_THREAD
+	unsigned int			kmap_thread_cnt;
+#endif
+
 	/*
 	 * New fields for task_struct should be added above here, so that
 	 * they are included in the randomized portion of task_struct.
diff --git a/include/trace/events/kmap_thread.h b/include/trace/events/kmap_thread.h
new file mode 100644
index 000000000000..e7143cfe0daf
--- /dev/null
+++ b/include/trace/events/kmap_thread.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB */
+
+/*
+ * Copyright (c) 2020 Intel Corporation.  All rights reserved.
+ *
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM kmap_thread
+
+#if !defined(_TRACE_KMAP_THREAD_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_KMAP_THREAD_H
+
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(kmap_thread_template,
+	TP_PROTO(struct task_struct *tsk, struct page *page,
+		 void *caller_addr, int cnt),
+	TP_ARGS(tsk, page, caller_addr, cnt),
+
+	TP_STRUCT__entry(
+		__field(int, pid)
+		__field(struct page *, page)
+		__field(void *, caller_addr)
+		__field(int, cnt)
+	),
+
+	TP_fast_assign(
+		__entry->pid = tsk->pid;
+		__entry->page = page;
+		__entry->caller_addr = caller_addr;
+		__entry->cnt = cnt;
+	),
+
+	TP_printk("PID %d; (%d) %pS %p",
+		__entry->pid,
+		__entry->cnt,
+		__entry->caller_addr,
+		__entry->page
+	)
+);
+
+DEFINE_EVENT(kmap_thread_template, kmap_thread,
+	TP_PROTO(struct task_struct *tsk, struct page *page,
+		 void *caller_addr, int cnt),
+	TP_ARGS(tsk, page, caller_addr, cnt));
+
+DEFINE_EVENT(kmap_thread_template, kunmap_thread,
+	TP_PROTO(struct task_struct *tsk, struct page *page,
+		 void *caller_addr, int cnt),
+	TP_ARGS(tsk, page, caller_addr, cnt));
+
+
+#endif /* _TRACE_KMAP_THREAD_H */
+
+#include <trace/define_trace.h>
diff --git a/init/init_task.c b/init/init_task.c
index 9b39f25de59b..19f09965eb34 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -212,6 +212,9 @@ struct task_struct init_task
 #ifdef CONFIG_ZONE_DEVICE_ACCESS_PROTECTION
 	.dev_page_access_ref = 0,
 #endif
+#ifdef CONFIG_DEBUG_KMAP_THREAD
+	.kmap_thread_cnt = 0,
+#endif
 };
 EXPORT_SYMBOL(init_task);
 
diff --git a/kernel/fork.c b/kernel/fork.c
index b6a3ee328a89..2c66e49b7614 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -722,6 +722,17 @@ static inline void put_signal_struct(struct signal_struct *sig)
 		free_signal_struct(sig);
 }
 
+#ifdef CONFIG_DEBUG_KMAP_THREAD
+static void check_outstanding_kmap_thread(struct task_struct *tsk)
+{
+	if (tsk->kmap_thread_cnt)
+		pr_warn(KERN_ERR "WARNING: PID %d; Failed to kunmap_thread() [cnt %d]\n",
+			tsk->pid, tsk->kmap_thread_cnt);
+}
+#else
+static void check_outstanding_kmap_thread(struct task_struct *tsk) { }
+#endif
+
 void __put_task_struct(struct task_struct *tsk)
 {
 	WARN_ON(!tsk->exit_state);
@@ -734,6 +745,7 @@ void __put_task_struct(struct task_struct *tsk)
 	exit_creds(tsk);
 	delayacct_tsk_free(tsk);
 	put_signal_struct(tsk->signal);
+	check_outstanding_kmap_thread(tsk);
 
 	if (!profile_handoff_task(tsk))
 		free_task(tsk);
@@ -943,6 +955,9 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
 #endif
 #ifdef CONFIG_ZONE_DEVICE_ACCESS_PROTECTION
 	tsk->dev_page_access_ref = 0;
+#endif
+#ifdef CONFIG_DEBUG_KMAP_THREAD
+	tsk->kmap_thread_cnt = 0;
 #endif
 	return tsk;
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f015c09ba5a1..6507b43d5b0c 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -858,6 +858,14 @@ config DEBUG_HIGHMEM
 	  This option enables additional error checking for high memory
 	  systems.  Disable for production systems.
 
+config DEBUG_KMAP_THREAD
+	bool "Kmap debugging"
+	depends on DEBUG_KERNEL
+	help
+	  This option enables additional error checking for kernel mapping code
+	  specifically the k[un]map_thread() calls.  Disable for production
+	  systems.
+
 config HAVE_DEBUG_STACKOVERFLOW
 	bool
 
diff --git a/mm/debug.c b/mm/debug.c
index ca8d1cacdecc..68d186f3570e 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -320,3 +320,26 @@ void page_init_poison(struct page *page, size_t size)
 }
 EXPORT_SYMBOL_GPL(page_init_poison);
 #endif		/* CONFIG_DEBUG_VM */
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/kmap_thread.h>
+
+#ifdef CONFIG_DEBUG_KMAP_THREAD
+void *kmap_thread(struct page *page)
+{
+	trace_kmap_thread(current, page, __builtin_return_address(0),
+			  current->kmap_thread_cnt);
+	current->kmap_thread_cnt++;
+	return __kmap(page, false);
+}
+EXPORT_SYMBOL_GPL(kmap_thread);
+
+void kunmap_thread(struct page *page)
+{
+	__kunmap(page, false);
+	current->kmap_thread_cnt--;
+	trace_kunmap_thread(current, page, __builtin_return_address(0),
+			    current->kmap_thread_cnt);
+}
+EXPORT_SYMBOL_GPL(kunmap_thread);
+#endif
-- 
2.28.0.rc0.12.gb6a658bd00c9

