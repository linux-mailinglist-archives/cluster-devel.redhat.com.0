Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D4DAD20A610
	for <lists+cluster-devel@lfdr.de>; Thu, 25 Jun 2020 21:44:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593114267;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KEehnD+k5Uqp3aNCUtgQqtvwiTMZhTKsGYRJUlt4KEY=;
	b=i9uqIL1ia8spAu2JLo38xN8m7sGwGjQQd0E9VRh6Uxz6HFuzQlqGnNu8lloghT7ZxrTN/P
	dRuEp2Ei8b4GM8PnDhlndM01AJCVaXcAuMUl1tFhWqvw+L1czQVjBQRCBXk6LfRRS5zJIo
	JjR6I9ojDRquXFC0nOB2d7AaQgXG4yo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-AVoY8bL7MHuxwjNR3MrVGw-1; Thu, 25 Jun 2020 15:40:38 -0400
X-MC-Unique: AVoY8bL7MHuxwjNR3MrVGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFC70107ACF5;
	Thu, 25 Jun 2020 19:40:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E59E10013C4;
	Thu, 25 Jun 2020 19:40:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 654C51809547;
	Thu, 25 Jun 2020 19:40:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PJeSOu007867 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 15:40:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 99D91610F3; Thu, 25 Jun 2020 19:40:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F20B060C80;
	Thu, 25 Jun 2020 19:40:24 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 25 Jun 2020 15:40:05 -0400
Message-Id: <20200625194005.807313-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next] fs: dlm: wait for recovery when
	acquire plock
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch waits for recovery indicated by clearing the
LSFL_RECOVER_LOCK flag of the recovery state machine. This behaviour is
by default disabled and can be activated by the waitplock_recovery
cluster attribute.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c       |  6 ++++++
 fs/dlm/config.h       |  1 +
 fs/dlm/dlm_internal.h |  1 +
 fs/dlm/lockspace.c    |  1 +
 fs/dlm/plock.c        | 20 ++++++++++++++++++++
 fs/dlm/recoverd.c     |  1 +
 6 files changed, 30 insertions(+)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 3b21082e1b550..aee1be86adbdc 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -75,6 +75,7 @@ struct dlm_cluster {
 	unsigned int cl_protocol;
 	unsigned int cl_timewarn_cs;
 	unsigned int cl_waitwarn_us;
+	unsigned int cl_waitplock_recovery;
 	unsigned int cl_new_rsb_count;
 	unsigned int cl_recover_callbacks;
 	char cl_cluster_name[DLM_LOCKSPACE_LEN];
@@ -98,6 +99,7 @@ enum {
 	CLUSTER_ATTR_PROTOCOL,
 	CLUSTER_ATTR_TIMEWARN_CS,
 	CLUSTER_ATTR_WAITWARN_US,
+	CLUSTER_ATTR_WAITPLOCK_RECOVERY,
 	CLUSTER_ATTR_NEW_RSB_COUNT,
 	CLUSTER_ATTR_RECOVER_CALLBACKS,
 	CLUSTER_ATTR_CLUSTER_NAME,
@@ -170,6 +172,7 @@ CLUSTER_ATTR(log_info, 0);
 CLUSTER_ATTR(protocol, 0);
 CLUSTER_ATTR(timewarn_cs, 1);
 CLUSTER_ATTR(waitwarn_us, 0);
+CLUSTER_ATTR(waitplock_recovery, 0);
 CLUSTER_ATTR(new_rsb_count, 0);
 CLUSTER_ATTR(recover_callbacks, 0);
 
@@ -185,6 +188,7 @@ static struct configfs_attribute *cluster_attrs[] = {
 	[CLUSTER_ATTR_PROTOCOL] = &cluster_attr_protocol,
 	[CLUSTER_ATTR_TIMEWARN_CS] = &cluster_attr_timewarn_cs,
 	[CLUSTER_ATTR_WAITWARN_US] = &cluster_attr_waitwarn_us,
+	[CLUSTER_ATTR_WAITPLOCK_RECOVERY] = &cluster_attr_waitplock_recovery,
 	[CLUSTER_ATTR_NEW_RSB_COUNT] = &cluster_attr_new_rsb_count,
 	[CLUSTER_ATTR_RECOVER_CALLBACKS] = &cluster_attr_recover_callbacks,
 	[CLUSTER_ATTR_CLUSTER_NAME] = &cluster_attr_cluster_name,
@@ -857,6 +861,7 @@ int dlm_our_addr(struct sockaddr_storage *addr, int num)
 #define DEFAULT_PROTOCOL           0
 #define DEFAULT_TIMEWARN_CS      500 /* 5 sec = 500 centiseconds */
 #define DEFAULT_WAITWARN_US	   0
+#define DEFAULT_WAITPLOCK_RECOVERY 0
 #define DEFAULT_NEW_RSB_COUNT    128
 #define DEFAULT_RECOVER_CALLBACKS  0
 #define DEFAULT_CLUSTER_NAME      ""
@@ -873,6 +878,7 @@ struct dlm_config_info dlm_config = {
 	.ci_protocol = DEFAULT_PROTOCOL,
 	.ci_timewarn_cs = DEFAULT_TIMEWARN_CS,
 	.ci_waitwarn_us = DEFAULT_WAITWARN_US,
+	.ci_waitplock_recovery = DEFAULT_WAITPLOCK_RECOVERY,
 	.ci_new_rsb_count = DEFAULT_NEW_RSB_COUNT,
 	.ci_recover_callbacks = DEFAULT_RECOVER_CALLBACKS,
 	.ci_cluster_name = DEFAULT_CLUSTER_NAME
diff --git a/fs/dlm/config.h b/fs/dlm/config.h
index 2b471aae4e61c..0cf824367668c 100644
--- a/fs/dlm/config.h
+++ b/fs/dlm/config.h
@@ -33,6 +33,7 @@ struct dlm_config_info {
 	int ci_protocol;
 	int ci_timewarn_cs;
 	int ci_waitwarn_us;
+	int ci_waitplock_recovery;
 	int ci_new_rsb_count;
 	int ci_recover_callbacks;
 	char ci_cluster_name[DLM_LOCKSPACE_LEN];
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 04fe9f525ac78..4f94171d76f17 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -615,6 +615,7 @@ struct dlm_ls {
 	spinlock_t		ls_recover_idr_lock;
 	wait_queue_head_t	ls_wait_general;
 	wait_queue_head_t	ls_recover_lock_wait;
+	wait_queue_head_t	ls_posix_lock_wait;
 	struct mutex		ls_clear_proc_locks;
 
 	struct list_head	ls_root_list;	/* root resources */
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index e93670ecfae5b..4c5ebb5b7c672 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -605,6 +605,7 @@ static int new_lockspace(const char *name, const char *cluster,
 	}
 
 	init_waitqueue_head(&ls->ls_recover_lock_wait);
+	init_waitqueue_head(&ls->ls_posix_lock_wait);
 
 	/*
 	 * Once started, dlm_recoverd first looks for ls in lslist, then
diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index c38b2b8ffd1d3..8803093a9f3c2 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -153,6 +153,26 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 			do_unlock_close(ls, number, file, fl);
 			goto out;
 		}
+
+		/* due backward compatible we do this
+		 * behaviour only if enabled
+		 */
+		if (dlm_config.ci_waitplock_recovery) {
+			/* wait for recovery if recovery is running */
+			rv = wait_event_interruptible(ls->ls_posix_lock_wait,
+						      !test_bit(LSFL_RECOVER_LOCK,
+								&ls->ls_flags));
+			if (rv == -ERESTARTSYS) {
+				log_debug(ls, "%s: wait for recovery killed %llx",
+					  __func__, (unsigned long long)number);
+				spin_lock(&ops_lock);
+				list_del(&op->list);
+				spin_unlock(&ops_lock);
+				kfree(xop);
+				do_unlock_close(ls, number, file, fl);
+				goto out;
+			}
+		}
 	} else {
 		rv = FILE_LOCK_DEFERRED;
 		goto out;
diff --git a/fs/dlm/recoverd.c b/fs/dlm/recoverd.c
index 85e2453927153..c2fed5e78121d 100644
--- a/fs/dlm/recoverd.c
+++ b/fs/dlm/recoverd.c
@@ -40,6 +40,7 @@ static int enable_locking(struct dlm_ls *ls, uint64_t seq)
 		/* unblocks processes waiting to enter the dlm */
 		up_write(&ls->ls_in_recovery);
 		clear_bit(LSFL_RECOVER_LOCK, &ls->ls_flags);
+		wake_up(&ls->ls_posix_lock_wait);
 		error = 0;
 	}
 	spin_unlock(&ls->ls_recover_lock);
-- 
2.26.2

