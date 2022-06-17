Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1774D54FE03
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Jun 2022 22:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655496050;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VD0dkD9yDa49yju6QmSsW0+OS+r3GiPIqpIfsnAEfSg=;
	b=UgxwY4k3H0Zr6jVIxOW4EM2p/vhoau38nsMY4ZGM8D030ySfLOUimaCQl3WSyK/LHPRn74
	VyAczaKXkPVchdf4rautG3AsV+HsPRT5g+mLYzxrHd6FCaNGbDloRDh/Ovs81gHhHTmNYk
	RjWldEDjgZE2gQQ320u8O85zEroE8gA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-hsCv_F9HPUWgGf8aUBRLSw-1; Fri, 17 Jun 2022 16:00:46 -0400
X-MC-Unique: hsCv_F9HPUWgGf8aUBRLSw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 513C685A582;
	Fri, 17 Jun 2022 20:00:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 516551415109;
	Fri, 17 Jun 2022 20:00:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 363A11947069;
	Fri, 17 Jun 2022 20:00:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 88DA6194705F for <cluster-devel@listman.corp.redhat.com>;
 Fri, 17 Jun 2022 20:00:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7AD7F492CA7; Fri, 17 Jun 2022 20:00:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D812492CA3;
 Fri, 17 Jun 2022 20:00:40 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 17 Jun 2022 16:00:36 -0400
Message-Id: <20220617200036.251778-6-aahringo@redhat.com>
In-Reply-To: <20220617200036.251778-1-aahringo@redhat.com>
References: <20220617200036.251778-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH dlm/next 5/5] fs: dlm: don't use deprecated
 API by default
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will disable the usage of current deprecated API if
CONFIG_DLM_DEPRECATED_API is not set. This API will be removed in
upcoming kernel release v5.22. I marked some places with a ifdef around
deprecated API, at other places I used a no-op function replacement,
depending on the situation how it's used and what was simpler to
implement.

This patch disables the configfs entry timewarn_cs which will be set by
official dlm user space software but does not end in a critical error.
We assume it should be save to remove it.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/Makefile       |  2 +-
 fs/dlm/config.c       | 14 +++++++++++++
 fs/dlm/config.h       |  2 ++
 fs/dlm/dlm_internal.h | 19 ++++++++++++++++-
 fs/dlm/lock.c         | 49 +++++++++++++++++++++++++++++++++++++++++++
 fs/dlm/lock.h         |  7 +++++++
 fs/dlm/lockspace.c    | 14 ++++++++++---
 fs/dlm/user.c         | 12 +++++++++++
 8 files changed, 114 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/Makefile b/fs/dlm/Makefile
index 3545fdafc6fb..71dab733cf9a 100644
--- a/fs/dlm/Makefile
+++ b/fs/dlm/Makefile
@@ -9,7 +9,6 @@ dlm-y :=			ast.o \
 				member.o \
 				memory.o \
 				midcomms.o \
-				netlink.o \
 				lowcomms.o \
 				plock.o \
 				rcom.o \
@@ -18,5 +17,6 @@ dlm-y :=			ast.o \
 				requestqueue.o \
 				user.o \
 				util.o 
+dlm-$(CONFIG_DLM_DEPRECATED_API) +=	netlink.o
 dlm-$(CONFIG_DLM_DEBUG) +=	debug_fs.o
 
diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 081fd201e3a8..ac8b62106ce0 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -75,7 +75,9 @@ struct dlm_cluster {
 	unsigned int cl_log_info;
 	unsigned int cl_protocol;
 	unsigned int cl_mark;
+#ifdef CONFIG_DLM_DEPRECATED_API
 	unsigned int cl_timewarn_cs;
+#endif
 	unsigned int cl_new_rsb_count;
 	unsigned int cl_recover_callbacks;
 	char cl_cluster_name[DLM_LOCKSPACE_LEN];
@@ -101,7 +103,9 @@ enum {
 	CLUSTER_ATTR_LOG_INFO,
 	CLUSTER_ATTR_PROTOCOL,
 	CLUSTER_ATTR_MARK,
+#ifdef CONFIG_DLM_DEPRECATED_API
 	CLUSTER_ATTR_TIMEWARN_CS,
+#endif
 	CLUSTER_ATTR_NEW_RSB_COUNT,
 	CLUSTER_ATTR_RECOVER_CALLBACKS,
 	CLUSTER_ATTR_CLUSTER_NAME,
@@ -222,7 +226,9 @@ CLUSTER_ATTR(log_debug, NULL);
 CLUSTER_ATTR(log_info, NULL);
 CLUSTER_ATTR(protocol, dlm_check_protocol_and_dlm_running);
 CLUSTER_ATTR(mark, NULL);
+#ifdef CONFIG_DLM_DEPRECATED_API
 CLUSTER_ATTR(timewarn_cs, dlm_check_zero);
+#endif
 CLUSTER_ATTR(new_rsb_count, NULL);
 CLUSTER_ATTR(recover_callbacks, NULL);
 
@@ -237,7 +243,9 @@ static struct configfs_attribute *cluster_attrs[] = {
 	[CLUSTER_ATTR_LOG_INFO] = &cluster_attr_log_info,
 	[CLUSTER_ATTR_PROTOCOL] = &cluster_attr_protocol,
 	[CLUSTER_ATTR_MARK] = &cluster_attr_mark,
+#ifdef CONFIG_DLM_DEPRECATED_API
 	[CLUSTER_ATTR_TIMEWARN_CS] = &cluster_attr_timewarn_cs,
+#endif
 	[CLUSTER_ATTR_NEW_RSB_COUNT] = &cluster_attr_new_rsb_count,
 	[CLUSTER_ATTR_RECOVER_CALLBACKS] = &cluster_attr_recover_callbacks,
 	[CLUSTER_ATTR_CLUSTER_NAME] = &cluster_attr_cluster_name,
@@ -428,7 +436,9 @@ static struct config_group *make_cluster(struct config_group *g,
 	cl->cl_log_debug = dlm_config.ci_log_debug;
 	cl->cl_log_info = dlm_config.ci_log_info;
 	cl->cl_protocol = dlm_config.ci_protocol;
+#ifdef CONFIG_DLM_DEPRECATED_API
 	cl->cl_timewarn_cs = dlm_config.ci_timewarn_cs;
+#endif
 	cl->cl_new_rsb_count = dlm_config.ci_new_rsb_count;
 	cl->cl_recover_callbacks = dlm_config.ci_recover_callbacks;
 	memcpy(cl->cl_cluster_name, dlm_config.ci_cluster_name,
@@ -949,7 +959,9 @@ int dlm_our_addr(struct sockaddr_storage *addr, int num)
 #define DEFAULT_LOG_INFO           1
 #define DEFAULT_PROTOCOL           DLM_PROTO_TCP
 #define DEFAULT_MARK               0
+#ifdef CONFIG_DLM_DEPRECATED_API
 #define DEFAULT_TIMEWARN_CS      500 /* 5 sec = 500 centiseconds */
+#endif
 #define DEFAULT_NEW_RSB_COUNT    128
 #define DEFAULT_RECOVER_CALLBACKS  0
 #define DEFAULT_CLUSTER_NAME      ""
@@ -965,7 +977,9 @@ struct dlm_config_info dlm_config = {
 	.ci_log_info = DEFAULT_LOG_INFO,
 	.ci_protocol = DEFAULT_PROTOCOL,
 	.ci_mark = DEFAULT_MARK,
+#ifdef CONFIG_DLM_DEPRECATED_API
 	.ci_timewarn_cs = DEFAULT_TIMEWARN_CS,
+#endif
 	.ci_new_rsb_count = DEFAULT_NEW_RSB_COUNT,
 	.ci_recover_callbacks = DEFAULT_RECOVER_CALLBACKS,
 	.ci_cluster_name = DEFAULT_CLUSTER_NAME
diff --git a/fs/dlm/config.h b/fs/dlm/config.h
index cb23d018e863..55c5f2c13ebd 100644
--- a/fs/dlm/config.h
+++ b/fs/dlm/config.h
@@ -37,7 +37,9 @@ struct dlm_config_info {
 	int ci_log_info;
 	int ci_protocol;
 	int ci_mark;
+#ifdef CONFIG_DLM_DEPRECATED_API
 	int ci_timewarn_cs;
+#endif
 	int ci_new_rsb_count;
 	int ci_recover_callbacks;
 	char ci_cluster_name[DLM_LOCKSPACE_LEN];
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 19136b7374a1..f65b9a0e3718 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -145,7 +145,9 @@ struct dlm_args {
 	void			(*bastfn) (void *astparam, int mode);
 	int			mode;
 	struct dlm_lksb		*lksb;
+#ifdef CONFIG_DLM_DEPRECATED_API
 	unsigned long		timeout;
+#endif
 };
 
 
@@ -203,8 +205,10 @@ struct dlm_args {
 #define DLM_IFL_OVERLAP_UNLOCK  0x00080000
 #define DLM_IFL_OVERLAP_CANCEL  0x00100000
 #define DLM_IFL_ENDOFLIFE	0x00200000
+#ifdef CONFIG_DLM_DEPRECATED_API
 #define DLM_IFL_WATCH_TIMEWARN	0x00400000
 #define DLM_IFL_TIMEOUT_CANCEL	0x00800000
+#endif
 #define DLM_IFL_DEADLOCK_CANCEL	0x01000000
 #define DLM_IFL_STUB_MS		0x02000000 /* magic number for m_flags */
 /* least significant 2 bytes are message changed, they are full transmitted
@@ -256,9 +260,12 @@ struct dlm_lkb {
 	struct list_head	lkb_rsb_lookup;	/* waiting for rsb lookup */
 	struct list_head	lkb_wait_reply;	/* waiting for remote reply */
 	struct list_head	lkb_ownqueue;	/* list of locks for a process */
-	struct list_head	lkb_time_list;
 	ktime_t			lkb_timestamp;
+
+#ifdef CONFIG_DLM_DEPRECATED_API
+	struct list_head	lkb_time_list;
 	unsigned long		lkb_timeout_cs;
+#endif
 
 	struct mutex		lkb_cb_mutex;
 	struct work_struct	lkb_cb_work;
@@ -574,8 +581,10 @@ struct dlm_ls {
 	struct mutex		ls_orphans_mutex;
 	struct list_head	ls_orphans;
 
+#ifdef CONFIG_DLM_DEPRECATED_API
 	struct mutex		ls_timeout_mutex;
 	struct list_head	ls_timeout;
+#endif
 
 	spinlock_t		ls_new_rsb_spin;
 	int			ls_new_rsb_count;
@@ -694,7 +703,9 @@ struct dlm_ls {
 #define LSFL_RCOM_READY		5
 #define LSFL_RCOM_WAIT		6
 #define LSFL_UEVENT_WAIT	7
+#ifdef CONFIG_DLM_DEPRECATED_API
 #define LSFL_TIMEWARN		8
+#endif
 #define LSFL_CB_DELAY		9
 #define LSFL_NODIR		10
 
@@ -747,9 +758,15 @@ static inline int dlm_no_directory(struct dlm_ls *ls)
 	return test_bit(LSFL_NODIR, &ls->ls_flags);
 }
 
+#ifdef CONFIG_DLM_DEPRECATED_API
 int dlm_netlink_init(void);
 void dlm_netlink_exit(void);
 void dlm_timeout_warn(struct dlm_lkb *lkb);
+#else
+static inline int dlm_netlink_init(void) { return 0; }
+static inline void dlm_netlink_exit(void) { };
+static inline void dlm_timeout_warn(struct dlm_lkb *lkb) { };
+#endif
 int dlm_plock_init(void);
 void dlm_plock_exit(void);
 
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 12d4cc742308..bac57f95b8c9 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -296,12 +296,14 @@ static void queue_cast(struct dlm_rsb *r, struct dlm_lkb *lkb, int rv)
 
 	DLM_ASSERT(lkb->lkb_lksb, dlm_print_lkb(lkb););
 
+#ifdef CONFIG_DLM_DEPRECATED_API
 	/* if the operation was a cancel, then return -DLM_ECANCEL, if a
 	   timeout caused the cancel then return -ETIMEDOUT */
 	if (rv == -DLM_ECANCEL && (lkb->lkb_flags & DLM_IFL_TIMEOUT_CANCEL)) {
 		lkb->lkb_flags &= ~DLM_IFL_TIMEOUT_CANCEL;
 		rv = -ETIMEDOUT;
 	}
+#endif
 
 	if (rv == -DLM_ECANCEL && (lkb->lkb_flags & DLM_IFL_DEADLOCK_CANCEL)) {
 		lkb->lkb_flags &= ~DLM_IFL_DEADLOCK_CANCEL;
@@ -1210,7 +1212,9 @@ static int _create_lkb(struct dlm_ls *ls, struct dlm_lkb **lkb_ret,
 	kref_init(&lkb->lkb_ref);
 	INIT_LIST_HEAD(&lkb->lkb_ownqueue);
 	INIT_LIST_HEAD(&lkb->lkb_rsb_lookup);
+#ifdef CONFIG_DLM_DEPRECATED_API
 	INIT_LIST_HEAD(&lkb->lkb_time_list);
+#endif
 	INIT_LIST_HEAD(&lkb->lkb_cb_list);
 	mutex_init(&lkb->lkb_cb_mutex);
 	INIT_WORK(&lkb->lkb_cb_work, dlm_callback_work);
@@ -1772,6 +1776,7 @@ void dlm_scan_rsbs(struct dlm_ls *ls)
 	}
 }
 
+#ifdef CONFIG_DLM_DEPRECATED_API
 static void add_timeout(struct dlm_lkb *lkb)
 {
 	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
@@ -1893,6 +1898,13 @@ void dlm_adjust_timeouts(struct dlm_ls *ls)
 		lkb->lkb_timestamp = ktime_add_us(lkb->lkb_timestamp, adj_us);
 	mutex_unlock(&ls->ls_timeout_mutex);
 }
+#else
+static void add_timeout(struct dlm_lkb *lkb) { }
+static void del_timeout(struct dlm_lkb *lkb) { }
+void dlm_scan_timeout(struct dlm_ls *ls) { }
+void dlm_adjust_timeouts(struct dlm_ls *ls) { }
+#endif
+
 
 /* lkb is master or local copy */
 
@@ -2757,12 +2769,20 @@ static void confirm_master(struct dlm_rsb *r, int error)
 	}
 }
 
+#ifdef CONFIG_DLM_DEPRECATED_API
 static int set_lock_args(int mode, struct dlm_lksb *lksb, uint32_t flags,
 			 int namelen, unsigned long timeout_cs,
 			 void (*ast) (void *astparam),
 			 void *astparam,
 			 void (*bast) (void *astparam, int mode),
 			 struct dlm_args *args)
+#else
+static int set_lock_args(int mode, struct dlm_lksb *lksb, uint32_t flags,
+			 int namelen, void (*ast)(void *astparam),
+			 void *astparam,
+			 void (*bast)(void *astparam, int mode),
+			 struct dlm_args *args)
+#endif
 {
 	int rv = -EINVAL;
 
@@ -2815,7 +2835,9 @@ static int set_lock_args(int mode, struct dlm_lksb *lksb, uint32_t flags,
 	args->astfn = ast;
 	args->astparam = astparam;
 	args->bastfn = bast;
+#ifdef CONFIG_DLM_DEPRECATED_API
 	args->timeout = timeout_cs;
+#endif
 	args->mode = mode;
 	args->lksb = lksb;
 	rv = 0;
@@ -2871,7 +2893,9 @@ static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
 	lkb->lkb_lksb = args->lksb;
 	lkb->lkb_lvbptr = args->lksb->sb_lvbptr;
 	lkb->lkb_ownpid = (int) current->pid;
+#ifdef CONFIG_DLM_DEPRECATED_API
 	lkb->lkb_timeout_cs = args->timeout;
+#endif
 	rv = 0;
  out:
 	if (rv)
@@ -3394,8 +3418,13 @@ int dlm_lock(dlm_lockspace_t *lockspace,
 
 	trace_dlm_lock_start(ls, lkb, name, namelen, mode, flags);
 
+#ifdef CONFIG_DLM_DEPRECATED_API
 	error = set_lock_args(mode, lksb, flags, namelen, 0, ast,
 			      astarg, bast, &args);
+#else
+	error = set_lock_args(mode, lksb, flags, namelen, ast, astarg, bast,
+			      &args);
+#endif
 	if (error)
 		goto out_put;
 
@@ -5759,9 +5788,14 @@ int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc)
 	return 0;
 }
 
+#ifdef CONFIG_DLM_DEPRECATED_API
 int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 		     int mode, uint32_t flags, void *name, unsigned int namelen,
 		     unsigned long timeout_cs)
+#else
+int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
+		     int mode, uint32_t flags, void *name, unsigned int namelen)
+#endif
 {
 	struct dlm_lkb *lkb;
 	struct dlm_args args;
@@ -5784,8 +5818,13 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 			goto out;
 		}
 	}
+#ifdef CONFIG_DLM_DEPRECATED_API
 	error = set_lock_args(mode, &ua->lksb, flags, namelen, timeout_cs,
 			      fake_astfn, ua, fake_bastfn, &args);
+#else
+	error = set_lock_args(mode, &ua->lksb, flags, namelen, fake_astfn, ua,
+			      fake_bastfn, &args);
+#endif
 	if (error) {
 		kfree(ua->lksb.sb_lvbptr);
 		ua->lksb.sb_lvbptr = NULL;
@@ -5824,9 +5863,14 @@ int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
 	return error;
 }
 
+#ifdef CONFIG_DLM_DEPRECATED_API
 int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 		     int mode, uint32_t flags, uint32_t lkid, char *lvb_in,
 		     unsigned long timeout_cs)
+#else
+int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
+		     int mode, uint32_t flags, uint32_t lkid, char *lvb_in)
+#endif
 {
 	struct dlm_lkb *lkb;
 	struct dlm_args args;
@@ -5861,8 +5905,13 @@ int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	ua->bastaddr = ua_tmp->bastaddr;
 	ua->user_lksb = ua_tmp->user_lksb;
 
+#ifdef CONFIG_DLM_DEPRECATED_API
 	error = set_lock_args(mode, &ua->lksb, flags, 0, timeout_cs,
 			      fake_astfn, ua, fake_bastfn, &args);
+#else
+	error = set_lock_args(mode, &ua->lksb, flags, 0, fake_astfn, ua,
+			      fake_bastfn, &args);
+#endif
 	if (error)
 		goto out_put;
 
diff --git a/fs/dlm/lock.h b/fs/dlm/lock.h
index 59089bb7c532..3f121b0a5115 100644
--- a/fs/dlm/lock.h
+++ b/fs/dlm/lock.h
@@ -41,12 +41,19 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls);
 int dlm_recover_master_copy(struct dlm_ls *ls, struct dlm_rcom *rc);
 int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc);
 
+#ifdef CONFIG_DLM_DEPRECATED_API
 int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua, int mode,
 	uint32_t flags, void *name, unsigned int namelen,
 	unsigned long timeout_cs);
 int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	int mode, uint32_t flags, uint32_t lkid, char *lvb_in,
 	unsigned long timeout_cs);
+#else
+int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua, int mode,
+	uint32_t flags, void *name, unsigned int namelen);
+int dlm_user_convert(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
+	int mode, uint32_t flags, uint32_t lkid, char *lvb_in);
+#endif
 int dlm_user_adopt_orphan(struct dlm_ls *ls, struct dlm_user_args *ua_tmp,
 	int mode, uint32_t flags, void *name, unsigned int namelen,
 	uint32_t *lkid);
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index ac227a30141c..3918616c7f2f 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -489,22 +489,28 @@ static int new_lockspace(const char *name, const char *cluster,
 		ls->ls_ops_arg = ops_arg;
 	}
 
-	if (flags & DLM_LSFL_TIMEWARN) {
 #ifdef CONFIG_DLM_DEPRECATED_API
+	if (flags & DLM_LSFL_TIMEWARN) {
 		pr_warn_once("===============================================================\n"
 			     "WARNING: the dlm DLM_LSFL_TIMEWARN flag is being deprecated and\n"
 			     "         will be removed in v5.22!\n"
 			     "         Inclusive DLM_LSFL_TIMEWARN define in UAPI header!\n"
 			     "===============================================================\n");
-#endif
 
 		set_bit(LSFL_TIMEWARN, &ls->ls_flags);
 	}
 
 	/* ls_exflags are forced to match among nodes, and we don't
-	   need to require all nodes to have some flags set */
+	 * need to require all nodes to have some flags set
+	 */
 	ls->ls_exflags = (flags & ~(DLM_LSFL_TIMEWARN | DLM_LSFL_FS |
 				    DLM_LSFL_NEWEXCL));
+#else
+	/* ls_exflags are forced to match among nodes, and we don't
+	 * need to require all nodes to have some flags set
+	 */
+	ls->ls_exflags = (flags & ~(DLM_LSFL_FS | DLM_LSFL_NEWEXCL));
+#endif
 
 	size = READ_ONCE(dlm_config.ci_rsbtbl_size);
 	ls->ls_rsbtbl_size = size;
@@ -535,8 +541,10 @@ static int new_lockspace(const char *name, const char *cluster,
 	mutex_init(&ls->ls_waiters_mutex);
 	INIT_LIST_HEAD(&ls->ls_orphans);
 	mutex_init(&ls->ls_orphans_mutex);
+#ifdef CONFIG_DLM_DEPRECATED_API
 	INIT_LIST_HEAD(&ls->ls_timeout);
 	mutex_init(&ls->ls_timeout_mutex);
+#endif
 
 	INIT_LIST_HEAD(&ls->ls_new_rsb);
 	spin_lock_init(&ls->ls_new_rsb_spin);
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index 1fccb08bd825..999918348b31 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -270,10 +270,16 @@ static int device_user_lock(struct dlm_user_proc *proc,
 	ua->xid = params->xid;
 
 	if (params->flags & DLM_LKF_CONVERT) {
+#ifdef CONFIG_DLM_DEPRECATED_API
 		error = dlm_user_convert(ls, ua,
 				         params->mode, params->flags,
 				         params->lkid, params->lvb,
 					 (unsigned long) params->timeout);
+#else
+		error = dlm_user_convert(ls, ua,
+					 params->mode, params->flags,
+					 params->lkid, params->lvb);
+#endif
 	} else if (params->flags & DLM_LKF_ORPHAN) {
 		error = dlm_user_adopt_orphan(ls, ua,
 					 params->mode, params->flags,
@@ -282,10 +288,16 @@ static int device_user_lock(struct dlm_user_proc *proc,
 		if (!error)
 			error = lkid;
 	} else {
+#ifdef CONFIG_DLM_DEPRECATED_API
 		error = dlm_user_request(ls, ua,
 					 params->mode, params->flags,
 					 params->name, params->namelen,
 					 (unsigned long) params->timeout);
+#else
+		error = dlm_user_request(ls, ua,
+					 params->mode, params->flags,
+					 params->name, params->namelen);
+#endif
 		if (!error)
 			error = ua->lksb.sb_lkid;
 	}
-- 
2.31.1

