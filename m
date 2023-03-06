Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7456ACF7E
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Mar 2023 21:48:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678135718;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4yeRXtROR1XMa9ups37m0VTdCpsUtzf5KGudiLG7Hxs=;
	b=J9BgS5C+PaPps0MYWj/lmwktbtOpcWDYK5y+ecDaKCIhSshV+5PwTf94y/VOgd2VoYx8rj
	i2lt0MJ1HEHJUj5SoOuBtcC5/2sTQ9PDfqFb1ZfDHWb2RdL61AXTYt9sWU5DOL4KG8kU7H
	2FOzLHRmymhZ1p0vFRrmXixSzcyEuVg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-x_fWUj7GMaKifsEDS3O1ig-1; Mon, 06 Mar 2023 15:48:31 -0500
X-MC-Unique: x_fWUj7GMaKifsEDS3O1ig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7027A1869B6D;
	Mon,  6 Mar 2023 20:48:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62F65C16029;
	Mon,  6 Mar 2023 20:48:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3C83719465A4;
	Mon,  6 Mar 2023 20:48:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8E44F1946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 20:48:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8372E440E1; Mon,  6 Mar 2023 20:48:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C26E175AD;
 Mon,  6 Mar 2023 20:48:26 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  6 Mar 2023 15:48:11 -0500
Message-Id: <20230306204819.2747646-5-aahringo@redhat.com>
In-Reply-To: <20230306204819.2747646-1-aahringo@redhat.com>
References: <20230306204819.2747646-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v6.3-rc1 04/12] fs: dlm: remove deprecated
 code parts
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch removes code parts which was declared deprecated by
commit 6b0afc0cc3e9 ("fs: dlm: don't use deprecated timeout features by
default"). This contains the following dlm functionality:

- start a cancel of a dlm request did not complete after certain timeout:
  The current way how dlm cancellation works and interfering with other
  dlm requests triggered by the user can end in an overlapping and
  returning in -EBUSY. The most user don't handle this case and are
  unaware that DLM can return such errno in such situation. Due the
  timeout the user are mostly unaware when this happens.
- start a netlink warning messages for user space if dlm requests did
  not complete after certain timeout:
  This feature was never being built in the only known dlm user space side.
  As we are to remove the timeout cancellation feature we can directly
  remove this feature as well.

There might be the possibility to bring the timeout cancellation feature
back. However the current way of handling the -EBUSY case which is only
a software limitation and not a hardware limitation should be changed.
We minimize the current code base in DLM cancellation feature to not have
to deal with those existing features while solving the DLM cancellation
feature in general.

UAPI define DLM_LSFL_TIMEWARN is commented as deprecated and reserved
value. We should avoid at first to give it a new meaning but let
possible users still compile by keeping this define. In far future we
can give this flag a new meaning. The same for the DLM_LKF_TIMEOUT lock
request flag.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/Kconfig                    |   9 --
 fs/dlm/Makefile                   |   1 -
 fs/dlm/config.c                   |  21 ----
 fs/dlm/config.h                   |   3 -
 fs/dlm/dlm_internal.h             |  29 -----
 fs/dlm/lock.c                     | 195 ------------------------------
 fs/dlm/lock.h                     |  17 ---
 fs/dlm/lockspace.c                |  23 ----
 fs/dlm/main.c                     |   9 +-
 fs/dlm/netlink.c                  | 139 ---------------------
 fs/dlm/recoverd.c                 |   2 -
 fs/dlm/user.c                     |  22 ----
 include/linux/dlm.h               |   3 -
 include/uapi/linux/dlm.h          |   1 +
 include/uapi/linux/dlm_netlink.h  |  60 ---------
 include/uapi/linux/dlmconstants.h |   5 +-
 16 files changed, 6 insertions(+), 533 deletions(-)
 delete mode 100644 fs/dlm/netlink.c
 delete mode 100644 include/uapi/linux/dlm_netlink.h

diff --git a/fs/dlm/Kconfig b/fs/dlm/Kconfig
index b3b86dbdc187..f82a4952769d 100644
--- a/fs/dlm/Kconfig
+++ b/fs/dlm/Kconfig
@@ -8,15 +8,6 @@ menuconfig DLM
 	A general purpose distributed lock manager for kernel or userspace
 	applications.
 
-config DLM_DEPRECATED_API
-	bool "DLM deprecated API"
-	depends on DLM
-	help
-	Enables deprecated DLM timeout features that will be removed in
-        later Linux kernel releases.
-
-	If you are unsure, say N.
-
 config DLM_DEBUG
 	bool "DLM debugging"
 	depends on DLM
diff --git a/fs/dlm/Makefile b/fs/dlm/Makefile
index 71dab733cf9a..5a471af1d1fe 100644
--- a/fs/dlm/Makefile
+++ b/fs/dlm/Makefile
@@ -17,6 +17,5 @@ dlm-y :=			ast.o \
 				requestqueue.o \
 				user.o \
 				util.o 
-dlm-$(CONFIG_DLM_DEPRECATED_API) +=	netlink.o
 dlm-$(CONFIG_DLM_DEBUG) +=	debug_fs.o
 
diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 20b60709eccf..d31319d08581 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -75,9 +75,6 @@ struct dlm_cluster {
 	unsigned int cl_log_info;
 	unsigned int cl_protocol;
 	unsigned int cl_mark;
-#ifdef CONFIG_DLM_DEPRECATED_API
-	unsigned int cl_timewarn_cs;
-#endif
 	unsigned int cl_new_rsb_count;
 	unsigned int cl_recover_callbacks;
 	char cl_cluster_name[DLM_LOCKSPACE_LEN];
@@ -103,9 +100,6 @@ enum {
 	CLUSTER_ATTR_LOG_INFO,
 	CLUSTER_ATTR_PROTOCOL,
 	CLUSTER_ATTR_MARK,
-#ifdef CONFIG_DLM_DEPRECATED_API
-	CLUSTER_ATTR_TIMEWARN_CS,
-#endif
 	CLUSTER_ATTR_NEW_RSB_COUNT,
 	CLUSTER_ATTR_RECOVER_CALLBACKS,
 	CLUSTER_ATTR_CLUSTER_NAME,
@@ -226,9 +220,6 @@ CLUSTER_ATTR(log_debug, NULL);
 CLUSTER_ATTR(log_info, NULL);
 CLUSTER_ATTR(protocol, dlm_check_protocol_and_dlm_running);
 CLUSTER_ATTR(mark, NULL);
-#ifdef CONFIG_DLM_DEPRECATED_API
-CLUSTER_ATTR(timewarn_cs, dlm_check_zero);
-#endif
 CLUSTER_ATTR(new_rsb_count, NULL);
 CLUSTER_ATTR(recover_callbacks, NULL);
 
@@ -243,9 +234,6 @@ static struct configfs_attribute *cluster_attrs[] = {
 	[CLUSTER_ATTR_LOG_INFO] = &cluster_attr_log_info,
 	[CLUSTER_ATTR_PROTOCOL] = &cluster_attr_protocol,
 	[CLUSTER_ATTR_MARK] = &cluster_attr_mark,
-#ifdef CONFIG_DLM_DEPRECATED_API
-	[CLUSTER_ATTR_TIMEWARN_CS] = &cluster_attr_timewarn_cs,
-#endif
 	[CLUSTER_ATTR_NEW_RSB_COUNT] = &cluster_attr_new_rsb_count,
 	[CLUSTER_ATTR_RECOVER_CALLBACKS] = &cluster_attr_recover_callbacks,
 	[CLUSTER_ATTR_CLUSTER_NAME] = &cluster_attr_cluster_name,
@@ -436,9 +424,6 @@ static struct config_group *make_cluster(struct config_group *g,
 	cl->cl_log_debug = dlm_config.ci_log_debug;
 	cl->cl_log_info = dlm_config.ci_log_info;
 	cl->cl_protocol = dlm_config.ci_protocol;
-#ifdef CONFIG_DLM_DEPRECATED_API
-	cl->cl_timewarn_cs = dlm_config.ci_timewarn_cs;
-#endif
 	cl->cl_new_rsb_count = dlm_config.ci_new_rsb_count;
 	cl->cl_recover_callbacks = dlm_config.ci_recover_callbacks;
 	memcpy(cl->cl_cluster_name, dlm_config.ci_cluster_name,
@@ -959,9 +944,6 @@ int dlm_our_addr(struct sockaddr_storage *addr, int num)
 #define DEFAULT_LOG_INFO           1
 #define DEFAULT_PROTOCOL           DLM_PROTO_TCP
 #define DEFAULT_MARK               0
-#ifdef CONFIG_DLM_DEPRECATED_API
-#define DEFAULT_TIMEWARN_CS      500 /* 5 sec = 500 centiseconds */
-#endif
 #define DEFAULT_NEW_RSB_COUNT    128
 #define DEFAULT_RECOVER_CALLBACKS  0
 #define DEFAULT_CLUSTER_NAME      ""
@@ -977,9 +959,6 @@ struct dlm_config_info dlm_config = {
 	.ci_log_info = DEFAULT_LOG_INFO,
 	.ci_protocol = DEFAULT_PROTOCOL,
 	.ci_mark = DEFAULT_MARK,
-#ifdef CONFIG_DLM_DEPRECATED_API
-	.ci_timewarn_cs = DEFAULT_TIMEWARN_CS,
-#endif
 	.ci_new_rsb_count = DEFAULT_NEW_RSB_COUNT,
 	.ci_recover_callbacks = DEFAULT_RECOVER_CALLBACKS,
 	.ci_cluster_name = DEFAULT_CLUSTER_NAME
diff --git a/fs/dlm/config.h b/fs/dlm/config.h
index 55c5f2c13ebd..4c91fcca0fd4 100644
--- a/fs/dlm/config.h
+++ b/fs/dlm/config.h
@@ -37,9 +37,6 @@ struct dlm_config_info {
 	int ci_log_info;
 	int ci_protocol;
 	int ci_mark;
-#ifdef CONFIG_DLM_DEPRECATED_API
-	int ci_timewarn_cs;
-#endif
 	int ci_new_rsb_count;
 	int ci_recover_callbacks;
 	char ci_cluster_name[DLM_LOCKSPACE_LEN];
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 9bf70962bc49..66863dc15b8f 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -145,9 +145,6 @@ struct dlm_args {
 	void			(*bastfn) (void *astparam, int mode);
 	int			mode;
 	struct dlm_lksb		*lksb;
-#ifdef CONFIG_DLM_DEPRECATED_API
-	unsigned long		timeout;
-#endif
 };
 
 
@@ -205,10 +202,6 @@ struct dlm_args {
 #define DLM_IFL_OVERLAP_UNLOCK  0x00080000
 #define DLM_IFL_OVERLAP_CANCEL  0x00100000
 #define DLM_IFL_ENDOFLIFE	0x00200000
-#ifdef CONFIG_DLM_DEPRECATED_API
-#define DLM_IFL_WATCH_TIMEWARN	0x00400000
-#define DLM_IFL_TIMEOUT_CANCEL	0x00800000
-#endif
 #define DLM_IFL_DEADLOCK_CANCEL	0x01000000
 #define DLM_IFL_STUB_MS		0x02000000 /* magic number for m_flags */
 
@@ -266,11 +259,6 @@ struct dlm_lkb {
 	struct list_head	lkb_ownqueue;	/* list of locks for a process */
 	ktime_t			lkb_timestamp;
 
-#ifdef CONFIG_DLM_DEPRECATED_API
-	struct list_head	lkb_time_list;
-	unsigned long		lkb_timeout_cs;
-#endif
-
 	spinlock_t		lkb_cb_lock;
 	struct work_struct	lkb_cb_work;
 	struct list_head	lkb_cb_list; /* for ls_cb_delay or proc->asts */
@@ -586,11 +574,6 @@ struct dlm_ls {
 	struct mutex		ls_orphans_mutex;
 	struct list_head	ls_orphans;
 
-#ifdef CONFIG_DLM_DEPRECATED_API
-	struct mutex		ls_timeout_mutex;
-	struct list_head	ls_timeout;
-#endif
-
 	spinlock_t		ls_new_rsb_spin;
 	int			ls_new_rsb_count;
 	struct list_head	ls_new_rsb;	/* new rsb structs */
@@ -704,9 +687,6 @@ struct dlm_ls {
 #define LSFL_RCOM_READY		5
 #define LSFL_RCOM_WAIT		6
 #define LSFL_UEVENT_WAIT	7
-#ifdef CONFIG_DLM_DEPRECATED_API
-#define LSFL_TIMEWARN		8
-#endif
 #define LSFL_CB_DELAY		9
 #define LSFL_NODIR		10
 
@@ -759,15 +739,6 @@ static inline int dlm_no_directory(struct dlm_ls *ls)
 	return test_bit(LSFL_NODIR, &ls->ls_flags);
 }
 
-#ifdef CONFIG_DLM_DEPRECATED_API
-int dlm_netlink_init(void);
-void dlm_netlink_exit(void);
-void dlm_timeout_warn(struct dlm_lkb *lkb);
-#else
-static inline int dlm_netlink_init(void) { return 0; }
-static inline void dlm_netlink_exit(void) { };
-static inline void dlm_timeout_warn(struct dlm_lkb *lkb) { };
-#endif
 int dlm_plock_init(void);
 void dlm_plock_exit(void);
 
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index e1adfa5aed05..9a7679f16eee 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -89,7 +89,6 @@ static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 				    struct dlm_message *ms);
 static int receive_extralen(struct dlm_message *ms);
 static void do_purge(struct dlm_ls *ls, int nodeid, int pid);
-static void del_timeout(struct dlm_lkb *lkb);
 static void toss_rsb(struct kref *kref);
 
 /*
@@ -292,19 +291,8 @@ static void queue_cast(struct dlm_rsb *r, struct dlm_lkb *lkb, int rv)
 	if (is_master_copy(lkb))
 		return;
 
-	del_timeout(lkb);
-
 	DLM_ASSERT(lkb->lkb_lksb, dlm_print_lkb(lkb););
 
-#ifdef CONFIG_DLM_DEPRECATED_API
-	/* if the operation was a cancel, then return -DLM_ECANCEL, if a
-	   timeout caused the cancel then return -ETIMEDOUT */
-	if (rv == -DLM_ECANCEL && (lkb->lkb_flags & DLM_IFL_TIMEOUT_CANCEL)) {
-		lkb->lkb_flags &= ~DLM_IFL_TIMEOUT_CANCEL;
-		rv = -ETIMEDOUT;
-	}
-#endif
-
 	if (rv == -DLM_ECANCEL && (lkb->lkb_flags & DLM_IFL_DEADLOCK_CANCEL)) {
 		lkb->lkb_flags &= ~DLM_IFL_DEADLOCK_CANCEL;
 		rv = -EDEADLK;
@@ -1215,9 +1203,6 @@ static int _create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret,
 	kref_init(&lkb->lkb_ref);
 	INIT_LIST_HEAD(&lkb->lkb_ownqueue);
 	INIT_LIST_HEAD(&lkb->lkb_rsb_lookup);
-#ifdef CONFIG_DLM_DEPRECATED_API
-	INIT_LIST_HEAD(&lkb->lkb_time_list);
-#endif
 	INIT_LIST_HEAD(&lkb->lkb_cb_list);
 	INIT_LIST_HEAD(&lkb->lkb_callbacks);
 	spin_lock_init(&lkb->lkb_cb_lock);
@@ -1735,133 +1720,6 @@ void dlm_scan_rsbs(struct dlm_ls *ls)
 	}
 }
 
-#ifdef CONFIG_DLM_DEPRECATED_API
-static void add_timeout(struct dlm_lkb *lkb)
-{
-	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
-
-	if (is_master_copy(lkb))
-		return;
-
-	if (test_bit(LSFL_TIMEWARN, &ls->ls_flags) &&
-	    !(lkb->lkb_exflags & DLM_LKF_NODLCKWT)) {
-		lkb->lkb_flags |= DLM_IFL_WATCH_TIMEWARN;
-		goto add_it;
-	}
-	if (lkb->lkb_exflags & DLM_LKF_TIMEOUT)
-		goto add_it;
-	return;
-
- add_it:
-	DLM_ASSERT(list_empty(&lkb->lkb_time_list), dlm_print_lkb(lkb););
-	mutex_lock(&ls->ls_timeout_mutex);
-	hold_lkb(lkb);
-	list_add_tail(&lkb->lkb_time_list, &ls->ls_timeout);
-	mutex_unlock(&ls->ls_timeout_mutex);
-}
-
-static void del_timeout(struct dlm_lkb *lkb)
-{
-	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
-
-	mutex_lock(&ls->ls_timeout_mutex);
-	if (!list_empty(&lkb->lkb_time_list)) {
-		list_del_init(&lkb->lkb_time_list);
-		unhold_lkb(lkb);
-	}
-	mutex_unlock(&ls->ls_timeout_mutex);
-}
-
-/* FIXME: is it safe to look at lkb_exflags, lkb_flags, lkb_timestamp, and
-   lkb_lksb_timeout without lock_rsb?  Note: we can't lock timeout_mutex
-   and then lock rsb because of lock ordering in add_timeout.  We may need
-   to specify some special timeout-related bits in the lkb that are just to
-   be accessed under the timeout_mutex. */
-
-void dlm_scan_timeout(struct dlm_ls *ls)
-{
-	struct dlm_rsb *r;
-	struct dlm_lkb *lkb = NULL, *iter;
-	int do_cancel, do_warn;
-	s64 wait_us;
-
-	for (;;) {
-		if (dlm_locking_stopped(ls))
-			break;
-
-		do_cancel = 0;
-		do_warn = 0;
-		mutex_lock(&ls->ls_timeout_mutex);
-		list_for_each_entry(iter, &ls->ls_timeout, lkb_time_list) {
-
-			wait_us = ktime_to_us(ktime_sub(ktime_get(),
-							iter->lkb_timestamp));
-
-			if ((iter->lkb_exflags & DLM_LKF_TIMEOUT) &&
-			    wait_us >= (iter->lkb_timeout_cs * 10000))
-				do_cancel = 1;
-
-			if ((iter->lkb_flags & DLM_IFL_WATCH_TIMEWARN) &&
-			    wait_us >= dlm_config.ci_timewarn_cs * 10000)
-				do_warn = 1;
-
-			if (!do_cancel && !do_warn)
-				continue;
-			hold_lkb(iter);
-			lkb = iter;
-			break;
-		}
-		mutex_unlock(&ls->ls_timeout_mutex);
-
-		if (!lkb)
-			break;
-
-		r = lkb->lkb_resource;
-		hold_rsb(r);
-		lock_rsb(r);
-
-		if (do_warn) {
-			/* clear flag so we only warn once */
-			lkb->lkb_flags &= ~DLM_IFL_WATCH_TIMEWARN;
-			if (!(lkb->lkb_exflags & DLM_LKF_TIMEOUT))
-				del_timeout(lkb);
-			dlm_timeout_warn(lkb);
-		}
-
-		if (do_cancel) {
-			log_debug(ls, "timeout cancel %x node %d %s",
-				  lkb->lkb_id, lkb->lkb_nodeid, r->res_name);
-			lkb->lkb_flags &= ~DLM_IFL_WATCH_TIMEWARN;
-			lkb->lkb_flags |= DLM_IFL_TIMEOUT_CANCEL;
-			del_timeout(lkb);
-			_cancel_lock(r, lkb);
-		}
-
-		unlock_rsb(r);
-		unhold_rsb(r);
-		dlm_put_lkb(lkb);
-	}
-}
-
-/* This is only called by dlm_recoverd, and we rely on dlm_ls_stop() stopping
-   dlm_recoverd before checking/setting ls_recover_begin. */
-
-void dlm_adjust_timeouts(struct dlm_ls *ls)
-{
-	struct dlm_lkb *lkb;
-	u64 adj_us = jiffies_to_usecs(jiffies - ls->ls_recover_begin);
-
-	ls->ls_recover_begin = 0;
-	mutex_lock(&ls->ls_timeout_mutex);
-	list_for_each_entry(lkb, &ls->ls_timeout, lkb_time_list)
-		lkb->lkb_timestamp = ktime_add_us(lkb->lkb_timestamp, adj_us);
-	mutex_unlock(&ls->ls_timeout_mutex);
-}
-#else
-static void add_timeout(struct dlm_lkb *lkb) { }
-static void del_timeout(struct dlm_lkb *lkb) { }
-#endif
-
 /* lkb is master or local copy */
 
 static void set_lvb_lock(struct dlm_rsb *r, struct dlm_lkb *lkb)
@@ -2723,20 +2581,11 @@ static void confirm_master(struct dlm_rsb *r, int error)
 	}
 }
 
-#ifdef CONFIG_DLM_DEPRECATED_API
-static int set_lock_args(int mode, struct dlm_lksb *lksb, uint32_t flags,
-			 int namelen, unsigned long timeout_cs,
-			 void (*ast) (void *astparam),
-			 void *astparam,
-			 void (*bast) (void *astparam, int mode),
-			 struct dlm_args *args)
-#else
 static int set_lock_args(int mode, struct dlm_lksb *lksb, uint32_t flags,
 			 int namelen, void (*ast)(void *astparam),
 			 void *astparam,
 			 void (*bast)(void *astparam, int mode),
 			 struct dlm_args *args)
-#endif
 {
 	int rv = -EINVAL;
 
@@ -2789,9 +2638,6 @@ static int set_lock_args(int mode, struct dlm_lksb *lksb, uint32_t flags,
 	args->astfn = ast;
 	args->astparam = astparam;
 	args->bastfn = bast;
-#ifdef CONFIG_DLM_DEPRECATED_API
-	args->timeout = timeout_cs;
-#endif
 	args->mode = mode;
 	args->lksb = lksb;
 	rv = 0;
@@ -2847,9 +2693,6 @@ static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	lkb->lkb_lksb = args->lksb;
 	lkb->lkb_lvbptr = args->lksb->sb_lvbptr;
 	lkb->lkb_ownpid = (int) current->pid;
-#ifdef CONFIG_DLM_DEPRECATED_API
-	lkb->lkb_timeout_cs = args->timeout;
-#endif
 	rv = 0;
  out:
 	switch (rv) {
@@ -2934,9 +2777,6 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 		if (is_overlap(lkb))
 			goto out;
 
-		/* don't let scand try to do a cancel */
-		del_timeout(lkb);
-
 		if (lkb->lkb_flags & DLM_IFL_RESEND) {
 			lkb->lkb_flags |= DLM_IFL_OVERLAP_CANCEL;
 			rv = -EBUSY;
@@ -2975,9 +2815,6 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
 		if (is_overlap_unlock(lkb))
 			goto out;
 
-		/* don't let scand try to do a cancel */
-		del_timeout(lkb);
-
 		if (lkb->lkb_flags & DLM_IFL_RESEND) {
 			lkb->lkb_flags |= DLM_IFL_OVERLAP_UNLOCK;
 			rv = -EBUSY;
@@ -3045,7 +2882,6 @@ static int do_request(struct dlm_rsb *r, struct dlm_lkb *lkb)
 	if (can_be_queued(lkb)) {
 		error = -EINPROGRESS;
 		add_lkb(r, lkb, DLM_LKSTS_WAITING);
-		add_timeout(lkb);
 		goto out;
 	}
 
@@ -3114,7 +2950,6 @@ static int do_convert(struct dlm_rsb *r, struct dlm_lkb *lkb)
 		error = -EINPROGRESS;
 		del_lkb(r, lkb);
 		add_lkb(r, lkb, DLM_LKSTS_CONVERT);
-		add_timeout(lkb);
 		goto out;
 	}
 
@@ -3401,13 +3236,8 @@ int dlm_lock(dlm_lockspace_t *lockspace,
 
 	trace_dlm_lock_start(ls, lkb, name, namelen, mode, flags);
 
-#ifdef CONFIG_DLM_DEPRECATED_API
-	error = set_lock_args(mode, lksb, flags, namelen, 0, ast,
-			      astarg, bast, &args);
-#else
 	error = set_lock_args(mode, lksb, flags, namelen, ast, astarg, bast,
 			      &args);
-#endif
 	if (error)
 		goto out_put;
 
@@ -4454,7 +4284,6 @@ static int receive_request_reply(struct dlm_ls *ls, struct dlm_message *ms)
 			munge_altmode(lkb, ms);
 		if (result) {
 			add_lkb(r, lkb, DLM_LKSTS_WAITING);
-			add_timeout(lkb);
 		} else {
 			grant_lock_pc(r, lkb, ms);
 			queue_cast(r, lkb, 0);
@@ -4541,7 +4370,6 @@ static void __receive_convert_reply(struct dlm_rsb *r, struct dlm_lkb *lkb,
 			munge_demoted(lkb);
 		del_lkb(r, lkb);
 		add_lkb(r, lkb, DLM_LKSTS_CONVERT);
-		add_timeout(lkb);
 		break;
 
 	case 0:
@@ -5708,14 +5536,8 @@ int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc)
 	return 0;
 }
 
-#ifdef CONFIG_DLM_DEPRECATED_API
-int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
-		     int mode, uint32_t flags, void *name, unsigned int namelen,
-		     unsigned long timeout_cs)
-#else
 int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 		     int mode, uint32_t flags, void *name, unsigned int namelen)
-#endif
 {
 	struct dlm_lkb *lkb;
 	struct dlm_args args;
@@ -5740,13 +5562,8 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 			goto out_put;
 		}
 	}
-#ifdef CONFIG_DLM_DEPRECATED_API
-	error = set_lock_args(mode, &ua->lksb, flags, namelen, timeout_cs,
-			      fake_astfn, ua, fake_bastfn, &args);
-#else
 	error = set_lock_args(mode, &ua->lksb, flags, namelen, fake_astfn, ua,
 			      fake_bastfn, &args);
-#endif
 	if (error) {
 		kfree(ua->lksb.sb_lvbptr);
 		ua->lksb.sb_lvbptr = NULL;
@@ -5788,14 +5605,8 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 	return error;
 }
 
-#ifdef CONFIG_DLM_DEPRECATED_API
-int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
-		     int mode, uint32_t flags, uint32_t lkid, char *lvb_in,
-		     unsigned long timeout_cs)
-#else
 int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 		     int mode, uint32_t flags, uint32_t lkid, char *lvb_in)
-#endif
 {
 	struct dlm_lkb *lkb;
 	struct dlm_args args;
@@ -5832,13 +5643,8 @@ int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	ua->bastaddr = ua_tmp->bastaddr;
 	ua->user_lksb = ua_tmp->user_lksb;
 
-#ifdef CONFIG_DLM_DEPRECATED_API
-	error = set_lock_args(mode, &ua->lksb, flags, 0, timeout_cs,
-			      fake_astfn, ua, fake_bastfn, &args);
-#else
 	error = set_lock_args(mode, &ua->lksb, flags, 0, fake_astfn, ua,
 			      fake_bastfn, &args);
-#endif
 	if (error)
 		goto out_put;
 
@@ -6155,7 +5961,6 @@ void dlm_clear_proc_locks(struct dlm_ls *ls, struct dlm_user_proc *proc)
 		lkb = del_proc_lock(ls, proc);
 		if (!lkb)
 			break;
-		del_timeout(lkb);
 		if (lkb->lkb_exflags & DLM_LKF_PERSISTENT)
 			orphan_proc_lock(ls, lkb);
 		else
diff --git a/fs/dlm/lock.h b/fs/dlm/lock.h
index 40c76b5544da..aa5ad44d902b 100644
--- a/fs/dlm/lock.h
+++ b/fs/dlm/lock.h
@@ -25,14 +25,6 @@ void dlm_scan_rsbs(struct dlm_ls *ls);
 int dlm_lock_recovery_try(struct dlm_ls *ls);
 void dlm_unlock_recovery(struct dlm_ls *ls);
 
-#ifdef CONFIG_DLM_DEPRECATED_API
-void dlm_scan_timeout(struct dlm_ls *ls);
-void dlm_adjust_timeouts(struct dlm_ls *ls);
-#else
-static inline void dlm_scan_timeout(struct dlm_ls *ls) { }
-static inline void dlm_adjust_timeouts(struct dlm_ls *ls) { }
-#endif
-
 int dlm_master_lookup(struct dlm_ls *ls, int nodeid, char *name, int len,
 		      unsigned int flags, int *r_nodeid, int *result);
 
@@ -47,19 +39,10 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls);
 int dlm_recover_master_copy(struct dlm_ls *ls, struct dlm_rcom *rc);
 int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc);
 
-#ifdef CONFIG_DLM_DEPRECATED_API
-int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua, int mode,
-	uint32_t flags, void *name, unsigned int namelen,
-	unsigned long timeout_cs);
-int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
-	int mode, uint32_t flags, uint32_t lkid, char *lvb_in,
-	unsigned long timeout_cs);
-#else
 int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua, int mode,
 	uint32_t flags, void *name, unsigned int namelen);
 int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	int mode, uint32_t flags, uint32_t lkid, char *lvb_in);
-#endif
 int dlm_user_adopt_orphan(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	int mode, uint32_t flags, void *name, unsigned int namelen,
 	uint32_t *lkid);
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 7325acbd1af7..ed785130fb60 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -273,7 +273,6 @@ static int dlm_scand(void *data)
 			if (dlm_lock_recovery_try(ls)) {
 				ls->ls_scan_time = jiffies;
 				dlm_scan_rsbs(ls);
-				dlm_scan_timeout(ls);
 				dlm_unlock_recovery(ls);
 			} else {
 				ls->ls_scan_time += HZ;
@@ -488,28 +487,10 @@ static int new_lockspace(const char *name, const char *cluster,
 		ls->ls_ops_arg = ops_arg;
 	}
 
-#ifdef CONFIG_DLM_DEPRECATED_API
-	if (flags & DLM_LSFL_TIMEWARN) {
-		pr_warn_once("===============================================================\n"
-			     "WARNING: the dlm DLM_LSFL_TIMEWARN flag is being deprecated and\n"
-			     "         will be removed in v6.2!\n"
-			     "         Inclusive DLM_LSFL_TIMEWARN define in UAPI header!\n"
-			     "===============================================================\n");
-
-		set_bit(LSFL_TIMEWARN, &ls->ls_flags);
-	}
-
-	/* ls_exflags are forced to match among nodes, and we don't
-	 * need to require all nodes to have some flags set
-	 */
-	ls->ls_exflags = (flags & ~(DLM_LSFL_TIMEWARN | DLM_LSFL_FS |
-				    DLM_LSFL_NEWEXCL));
-#else
 	/* ls_exflags are forced to match among nodes, and we don't
 	 * need to require all nodes to have some flags set
 	 */
 	ls->ls_exflags = (flags & ~(DLM_LSFL_FS | DLM_LSFL_NEWEXCL));
-#endif
 
 	size = READ_ONCE(dlm_config.ci_rsbtbl_size);
 	ls->ls_rsbtbl_size = size;
@@ -537,10 +518,6 @@ static int new_lockspace(const char *name, const char *cluster,
 	mutex_init(&ls->ls_waiters_mutex);
 	INIT_LIST_HEAD(&ls->ls_orphans);
 	mutex_init(&ls->ls_orphans_mutex);
-#ifdef CONFIG_DLM_DEPRECATED_API
-	INIT_LIST_HEAD(&ls->ls_timeout);
-	mutex_init(&ls->ls_timeout_mutex);
-#endif
 
 	INIT_LIST_HEAD(&ls->ls_new_rsb);
 	spin_lock_init(&ls->ls_new_rsb_spin);
diff --git a/fs/dlm/main.c b/fs/dlm/main.c
index a77338be3237..93755f83a30d 100644
--- a/fs/dlm/main.c
+++ b/fs/dlm/main.c
@@ -46,20 +46,14 @@ static int __init init_dlm(void)
 	if (error)
 		goto out_debug;
 
-	error = dlm_netlink_init();
-	if (error)
-		goto out_user;
-
 	error = dlm_plock_init();
 	if (error)
-		goto out_netlink;
+		goto out_user;
 
 	printk("DLM installed\n");
 
 	return 0;
 
- out_netlink:
-	dlm_netlink_exit();
  out_user:
 	dlm_user_exit();
  out_debug:
@@ -77,7 +71,6 @@ static int __init init_dlm(void)
 static void __exit exit_dlm(void)
 {
 	dlm_plock_exit();
-	dlm_netlink_exit();
 	dlm_user_exit();
 	dlm_config_exit();
 	dlm_memory_exit();
diff --git a/fs/dlm/netlink.c b/fs/dlm/netlink.c
deleted file mode 100644
index 4de4b8651c6c..000000000000
--- a/fs/dlm/netlink.c
+++ /dev/null
@@ -1,139 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2007 Red Hat, Inc.  All rights reserved.
- */
-
-#include <net/genetlink.h>
-#include <linux/dlm.h>
-#include <linux/dlm_netlink.h>
-#include <linux/gfp.h>
-
-#include "dlm_internal.h"
-
-static uint32_t dlm_nl_seqnum;
-static uint32_t listener_nlportid;
-
-static struct genl_family family;
-
-static int prepare_data(u8 cmd, struct sk_buff **skbp, size_t size)
-{
-	struct sk_buff *skb;
-	void *data;
-
-	skb = genlmsg_new(size, GFP_NOFS);
-	if (!skb)
-		return -ENOMEM;
-
-	/* add the message headers */
-	data = genlmsg_put(skb, 0, dlm_nl_seqnum++, &family, 0, cmd);
-	if (!data) {
-		nlmsg_free(skb);
-		return -EINVAL;
-	}
-
-	*skbp = skb;
-	return 0;
-}
-
-static struct dlm_lock_data *mk_data(struct sk_buff *skb)
-{
-	struct nlattr *ret;
-
-	ret = nla_reserve(skb, DLM_TYPE_LOCK, sizeof(struct dlm_lock_data));
-	if (!ret)
-		return NULL;
-	return nla_data(ret);
-}
-
-static int send_data(struct sk_buff *skb)
-{
-	struct genlmsghdr *genlhdr = nlmsg_data((struct nlmsghdr *)skb->data);
-	void *data = genlmsg_data(genlhdr);
-
-	genlmsg_end(skb, data);
-
-	return genlmsg_unicast(&init_net, skb, listener_nlportid);
-}
-
-static int user_cmd(struct sk_buff *skb, struct genl_info *info)
-{
-	listener_nlportid = info->snd_portid;
-	printk("user_cmd nlpid %u\n", listener_nlportid);
-	return 0;
-}
-
-static const struct genl_small_ops dlm_nl_ops[] = {
-	{
-		.cmd	= DLM_CMD_HELLO,
-		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
-		.doit	= user_cmd,
-	},
-};
-
-static struct genl_family family __ro_after_init = {
-	.name		= DLM_GENL_NAME,
-	.version	= DLM_GENL_VERSION,
-	.small_ops	= dlm_nl_ops,
-	.n_small_ops	= ARRAY_SIZE(dlm_nl_ops),
-	.resv_start_op	= DLM_CMD_HELLO + 1,
-	.module		= THIS_MODULE,
-};
-
-int __init dlm_netlink_init(void)
-{
-	return genl_register_family(&family);
-}
-
-void dlm_netlink_exit(void)
-{
-	genl_unregister_family(&family);
-}
-
-static void fill_data(struct dlm_lock_data *data, struct dlm_lkb *lkb)
-{
-	struct dlm_rsb *r = lkb->lkb_resource;
-
-	memset(data, 0, sizeof(struct dlm_lock_data));
-
-	data->version = DLM_LOCK_DATA_VERSION;
-	data->nodeid = lkb->lkb_nodeid;
-	data->ownpid = lkb->lkb_ownpid;
-	data->id = lkb->lkb_id;
-	data->remid = lkb->lkb_remid;
-	data->status = lkb->lkb_status;
-	data->grmode = lkb->lkb_grmode;
-	data->rqmode = lkb->lkb_rqmode;
-	if (lkb->lkb_ua)
-		data->xid = lkb->lkb_ua->xid;
-	if (r) {
-		data->lockspace_id = r->res_ls->ls_global_id;
-		data->resource_namelen = r->res_length;
-		memcpy(data->resource_name, r->res_name, r->res_length);
-	}
-}
-
-void dlm_timeout_warn(struct dlm_lkb *lkb)
-{
-	struct sk_buff *send_skb;
-	struct dlm_lock_data *data;
-	size_t size;
-	int rv;
-
-	size = nla_total_size(sizeof(struct dlm_lock_data)) +
-	       nla_total_size(0); /* why this? */
-
-	rv = prepare_data(DLM_CMD_TIMEOUT, &send_skb, size);
-	if (rv < 0)
-		return;
-
-	data = mk_data(send_skb);
-	if (!data) {
-		nlmsg_free(send_skb);
-		return;
-	}
-
-	fill_data(data, lkb);
-
-	send_data(send_skb);
-}
-
diff --git a/fs/dlm/recoverd.c b/fs/dlm/recoverd.c
index e15eb511b04b..19da816cfb09 100644
--- a/fs/dlm/recoverd.c
+++ b/fs/dlm/recoverd.c
@@ -214,8 +214,6 @@ static int ls_recover(struct dlm_ls *ls, struct dlm_recover *rv)
 
 	dlm_clear_members_gone(ls);
 
-	dlm_adjust_timeouts(ls);
-
 	dlm_callback_resume(ls);
 
 	error = enable_locking(ls, rv->seq);
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index 688a480879e4..0951ca5754e2 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -259,14 +259,6 @@ static int device_user_lock(struct dlm_user_proc *proc,
 		goto out;
 	}
 
-#ifdef CONFIG_DLM_DEPRECATED_API
-	if (params->timeout)
-		pr_warn_once("========================================================\n"
-			     "WARNING: the lkb timeout feature is being deprecated and\n"
-			     "         will be removed in v6.2!\n"
-			     "========================================================\n");
-#endif
-
 	ua = kzalloc(sizeof(struct dlm_user_args), GFP_NOFS);
 	if (!ua)
 		goto out;
@@ -279,16 +271,9 @@ static int device_user_lock(struct dlm_user_proc *proc,
 	ua->xid = params->xid;
 
 	if (params->flags & DLM_LKF_CONVERT) {
-#ifdef CONFIG_DLM_DEPRECATED_API
-		error = dlm_user_convert(ls, ua,
-				         params->mode, params->flags,
-				         params->lkid, params->lvb,
-					 (unsigned long) params->timeout);
-#else
 		error = dlm_user_convert(ls, ua,
 					 params->mode, params->flags,
 					 params->lkid, params->lvb);
-#endif
 	} else if (params->flags & DLM_LKF_ORPHAN) {
 		error = dlm_user_adopt_orphan(ls, ua,
 					 params->mode, params->flags,
@@ -297,16 +282,9 @@ static int device_user_lock(struct dlm_user_proc *proc,
 		if (!error)
 			error = lkid;
 	} else {
-#ifdef CONFIG_DLM_DEPRECATED_API
-		error = dlm_user_request(ls, ua,
-					 params->mode, params->flags,
-					 params->name, params->namelen,
-					 (unsigned long) params->timeout);
-#else
 		error = dlm_user_request(ls, ua,
 					 params->mode, params->flags,
 					 params->name, params->namelen);
-#endif
 		if (!error)
 			error = ua->lksb.sb_lkid;
 	}
diff --git a/include/linux/dlm.h b/include/linux/dlm.h
index c6bc2b5ee7e6..c58c4f790c04 100644
--- a/include/linux/dlm.h
+++ b/include/linux/dlm.h
@@ -53,9 +53,6 @@ struct dlm_lockspace_ops {
  *   The dlm should not use a resource directory, but statically assign
  *   resource mastery to nodes based on the name hash that is otherwise
  *   used to select the directory node.  Must be the same on all nodes.
- * DLM_LSFL_TIMEWARN
- *   The dlm should emit netlink messages if locks have been waiting
- *   for a configurable amount of time.  (Unused.)
  * DLM_LSFL_NEWEXCL
  *   dlm_new_lockspace() should return -EEXIST if the lockspace exists.
  *
diff --git a/include/uapi/linux/dlm.h b/include/uapi/linux/dlm.h
index 1923f4f3b05e..e7e905fb0bb2 100644
--- a/include/uapi/linux/dlm.h
+++ b/include/uapi/linux/dlm.h
@@ -68,6 +68,7 @@ struct dlm_lksb {
 
 /* dlm_new_lockspace() flags */
 
+/* DLM_LSFL_TIMEWARN is deprecated and reserved. DO NOT USE! */
 #define DLM_LSFL_TIMEWARN	0x00000002
 #define DLM_LSFL_NEWEXCL     	0x00000008
 
diff --git a/include/uapi/linux/dlm_netlink.h b/include/uapi/linux/dlm_netlink.h
deleted file mode 100644
index 5dc3a67d353d..000000000000
--- a/include/uapi/linux/dlm_netlink.h
+++ /dev/null
@@ -1,60 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * Copyright (C) 2007 Red Hat, Inc.  All rights reserved.
- *
- * This copyrighted material is made available to anyone wishing to use,
- * modify, copy, or redistribute it subject to the terms and conditions
- * of the GNU General Public License v.2.
- */
-
-#ifndef _DLM_NETLINK_H
-#define _DLM_NETLINK_H
-
-#include <linux/types.h>
-#include <linux/dlmconstants.h>
-
-enum {
-	DLM_STATUS_WAITING = 1,
-	DLM_STATUS_GRANTED = 2,
-	DLM_STATUS_CONVERT = 3,
-};
-
-#define DLM_LOCK_DATA_VERSION 1
-
-struct dlm_lock_data {
-	__u16 version;
-	__u32 lockspace_id;
-	int nodeid;
-	int ownpid;
-	__u32 id;
-	__u32 remid;
-	__u64 xid;
-	__s8 status;
-	__s8 grmode;
-	__s8 rqmode;
-	unsigned long timestamp;
-	int resource_namelen;
-	char resource_name[DLM_RESNAME_MAXLEN];
-};
-
-enum {
-	DLM_CMD_UNSPEC = 0,
-	DLM_CMD_HELLO,		/* user->kernel */
-	DLM_CMD_TIMEOUT,	/* kernel->user */
-	__DLM_CMD_MAX,
-};
-
-#define DLM_CMD_MAX (__DLM_CMD_MAX - 1)
-
-enum {
-	DLM_TYPE_UNSPEC = 0,
-	DLM_TYPE_LOCK,
-	__DLM_TYPE_MAX,
-};
-
-#define DLM_TYPE_MAX (__DLM_TYPE_MAX - 1)
-
-#define DLM_GENL_VERSION 0x1
-#define DLM_GENL_NAME "DLM"
-
-#endif /* _DLM_NETLINK_H */
diff --git a/include/uapi/linux/dlmconstants.h b/include/uapi/linux/dlmconstants.h
index a8ae47c32a37..6ca77a6388bc 100644
--- a/include/uapi/linux/dlmconstants.h
+++ b/include/uapi/linux/dlmconstants.h
@@ -87,7 +87,6 @@
  * DLM_LKF_NODLCKWT
  *
  * Do not cancel the lock if it gets into conversion deadlock.
- * Exclude this lock from being monitored due to DLM_LSFL_TIMEWARN.
  *
  * DLM_LKF_NODLCKBLK
  *
@@ -132,6 +131,10 @@
  * Unlock the lock even if it is converting or waiting or has sublocks.
  * Only really for use by the userland device.c code.
  *
+ * DLM_LKF_TIMEOUT
+ *
+ * This value is deprecated and reserved. DO NOT USE!
+ *
  */
 
 #define DLM_LKF_NOQUEUE		0x00000001
-- 
2.31.1

