Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC6354FE05
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Jun 2022 22:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655496051;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/JVuD/M2LF+poDK+EH2e8sppQd8c2rlE1Wjjt3ktdqE=;
	b=KNtXZ3U/tkzywDEXhgN/wLZ0SwWEeehDjpftPxUwnq52uerxVbx+wcMEmOwweFMiIFvnr6
	H/X4mEeOSkJ9xCSuSYUxhx5wZ1n1yjf8eQY2iIFS/3f7B0cmGPnRCKxxc0WAAiwjehTRlq
	pviOwiz0dpLbl1S5+N153U81yYXmWpI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-sThqv3djNZ6odAbSNFAFhg-1; Fri, 17 Jun 2022 16:00:48 -0400
X-MC-Unique: sThqv3djNZ6odAbSNFAFhg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DC17294EDD3;
	Fri, 17 Jun 2022 20:00:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0B9F814B;
	Fri, 17 Jun 2022 20:00:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 240C8194706D;
	Fri, 17 Jun 2022 20:00:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2692A1947063 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 17 Jun 2022 20:00:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 08598492C3B; Fri, 17 Jun 2022 20:00:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFACE492CA5;
 Fri, 17 Jun 2022 20:00:39 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 17 Jun 2022 16:00:33 -0400
Message-Id: <20220617200036.251778-3-aahringo@redhat.com>
In-Reply-To: <20220617200036.251778-1-aahringo@redhat.com>
References: <20220617200036.251778-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH dlm/next 2/5] fs: dlm: remove warn waiter
 handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch removes a feature in DLM to warn about if we don't get an
answer back if we send a DLM message out and we wait for a reply
message. There are in my opinion two reasons to add such warning, first
is to know there might be a communication error and a message drop due
communication errors. Second the other side dropped the message on stack
because some reason.

However the first reason the midcomms layer will notify us if a message
was received otherwise midcomms debugfs can tell us if there are still
pending messages around.

For the second reason we can check the other nodes debug messages to see
if there was a drop on application layer. However I think the initial
idea of this feature was to check for the first reason.

This patch also removes the configfs entry waitwarn_us which is not
being set by official dlm user space software, we assume fail to setting
this configfs entry will not end in an critical error.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c       |  7 ----
 fs/dlm/config.h       |  1 -
 fs/dlm/dlm_internal.h |  1 -
 fs/dlm/lock.c         | 80 -------------------------------------------
 fs/dlm/lockspace.c    |  1 -
 5 files changed, 90 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 42eee2783756..081fd201e3a8 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -76,7 +76,6 @@ struct dlm_cluster {
 	unsigned int cl_protocol;
 	unsigned int cl_mark;
 	unsigned int cl_timewarn_cs;
-	unsigned int cl_waitwarn_us;
 	unsigned int cl_new_rsb_count;
 	unsigned int cl_recover_callbacks;
 	char cl_cluster_name[DLM_LOCKSPACE_LEN];
@@ -103,7 +102,6 @@ enum {
 	CLUSTER_ATTR_PROTOCOL,
 	CLUSTER_ATTR_MARK,
 	CLUSTER_ATTR_TIMEWARN_CS,
-	CLUSTER_ATTR_WAITWARN_US,
 	CLUSTER_ATTR_NEW_RSB_COUNT,
 	CLUSTER_ATTR_RECOVER_CALLBACKS,
 	CLUSTER_ATTR_CLUSTER_NAME,
@@ -225,7 +223,6 @@ CLUSTER_ATTR(log_info, NULL);
 CLUSTER_ATTR(protocol, dlm_check_protocol_and_dlm_running);
 CLUSTER_ATTR(mark, NULL);
 CLUSTER_ATTR(timewarn_cs, dlm_check_zero);
-CLUSTER_ATTR(waitwarn_us, NULL);
 CLUSTER_ATTR(new_rsb_count, NULL);
 CLUSTER_ATTR(recover_callbacks, NULL);
 
@@ -241,7 +238,6 @@ static struct configfs_attribute *cluster_attrs[] = {
 	[CLUSTER_ATTR_PROTOCOL] = &cluster_attr_protocol,
 	[CLUSTER_ATTR_MARK] = &cluster_attr_mark,
 	[CLUSTER_ATTR_TIMEWARN_CS] = &cluster_attr_timewarn_cs,
-	[CLUSTER_ATTR_WAITWARN_US] = &cluster_attr_waitwarn_us,
 	[CLUSTER_ATTR_NEW_RSB_COUNT] = &cluster_attr_new_rsb_count,
 	[CLUSTER_ATTR_RECOVER_CALLBACKS] = &cluster_attr_recover_callbacks,
 	[CLUSTER_ATTR_CLUSTER_NAME] = &cluster_attr_cluster_name,
@@ -433,7 +429,6 @@ static struct config_group *make_cluster(struct config_group *g,
 	cl->cl_log_info = dlm_config.ci_log_info;
 	cl->cl_protocol = dlm_config.ci_protocol;
 	cl->cl_timewarn_cs = dlm_config.ci_timewarn_cs;
-	cl->cl_waitwarn_us = dlm_config.ci_waitwarn_us;
 	cl->cl_new_rsb_count = dlm_config.ci_new_rsb_count;
 	cl->cl_recover_callbacks = dlm_config.ci_recover_callbacks;
 	memcpy(cl->cl_cluster_name, dlm_config.ci_cluster_name,
@@ -955,7 +950,6 @@ int dlm_our_addr(struct sockaddr_storage *addr, int num)
 #define DEFAULT_PROTOCOL           DLM_PROTO_TCP
 #define DEFAULT_MARK               0
 #define DEFAULT_TIMEWARN_CS      500 /* 5 sec = 500 centiseconds */
-#define DEFAULT_WAITWARN_US	   0
 #define DEFAULT_NEW_RSB_COUNT    128
 #define DEFAULT_RECOVER_CALLBACKS  0
 #define DEFAULT_CLUSTER_NAME      ""
@@ -972,7 +966,6 @@ struct dlm_config_info dlm_config = {
 	.ci_protocol = DEFAULT_PROTOCOL,
 	.ci_mark = DEFAULT_MARK,
 	.ci_timewarn_cs = DEFAULT_TIMEWARN_CS,
-	.ci_waitwarn_us = DEFAULT_WAITWARN_US,
 	.ci_new_rsb_count = DEFAULT_NEW_RSB_COUNT,
 	.ci_recover_callbacks = DEFAULT_RECOVER_CALLBACKS,
 	.ci_cluster_name = DEFAULT_CLUSTER_NAME
diff --git a/fs/dlm/config.h b/fs/dlm/config.h
index df92b0a07fc6..cb23d018e863 100644
--- a/fs/dlm/config.h
+++ b/fs/dlm/config.h
@@ -38,7 +38,6 @@ struct dlm_config_info {
 	int ci_protocol;
 	int ci_mark;
 	int ci_timewarn_cs;
-	int ci_waitwarn_us;
 	int ci_new_rsb_count;
 	int ci_recover_callbacks;
 	char ci_cluster_name[DLM_LOCKSPACE_LEN];
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 151f98fc3f22..19136b7374a1 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -258,7 +258,6 @@ struct dlm_lkb {
 	struct list_head	lkb_ownqueue;	/* list of locks for a process */
 	struct list_head	lkb_time_list;
 	ktime_t			lkb_timestamp;
-	ktime_t			lkb_wait_time;
 	unsigned long		lkb_timeout_cs;
 
 	struct mutex		lkb_cb_mutex;
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index e80d42ba64ae..080cd216a9a4 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1402,75 +1402,6 @@ static int msg_reply_type(int mstype)
 	return -1;
 }
 
-static int nodeid_warned(int nodeid, int num_nodes, int *warned)
-{
-	int i;
-
-	for (i = 0; i < num_nodes; i++) {
-		if (!warned[i]) {
-			warned[i] = nodeid;
-			return 0;
-		}
-		if (warned[i] == nodeid)
-			return 1;
-	}
-	return 0;
-}
-
-void dlm_scan_waiters(struct dlm_ls *ls)
-{
-	struct dlm_lkb *lkb;
-	s64 us;
-	s64 debug_maxus = 0;
-	u32 debug_scanned = 0;
-	u32 debug_expired = 0;
-	int num_nodes = 0;
-	int *warned = NULL;
-
-	if (!dlm_config.ci_waitwarn_us)
-		return;
-
-	mutex_lock(&ls->ls_waiters_mutex);
-
-	list_for_each_entry(lkb, &ls->ls_waiters, lkb_wait_reply) {
-		if (!lkb->lkb_wait_time)
-			continue;
-
-		debug_scanned++;
-
-		us = ktime_to_us(ktime_sub(ktime_get(), lkb->lkb_wait_time));
-
-		if (us < dlm_config.ci_waitwarn_us)
-			continue;
-
-		lkb->lkb_wait_time = 0;
-
-		debug_expired++;
-		if (us > debug_maxus)
-			debug_maxus = us;
-
-		if (!num_nodes) {
-			num_nodes = ls->ls_num_nodes;
-			warned = kcalloc(num_nodes, sizeof(int), GFP_KERNEL);
-		}
-		if (!warned)
-			continue;
-		if (nodeid_warned(lkb->lkb_wait_nodeid, num_nodes, warned))
-			continue;
-
-		log_error(ls, "waitwarn %x %lld %d us check connection to "
-			  "node %d", lkb->lkb_id, (long long)us,
-			  dlm_config.ci_waitwarn_us, lkb->lkb_wait_nodeid);
-	}
-	mutex_unlock(&ls->ls_waiters_mutex);
-	kfree(warned);
-
-	if (debug_expired)
-		log_debug(ls, "scan_waiters %u warn %u over %d us max %lld us",
-			  debug_scanned, debug_expired,
-			  dlm_config.ci_waitwarn_us, (long long)debug_maxus);
-}
-
 /* add/remove lkb from global waiters list of lkb's waiting for
    a reply from a remote node */
 
@@ -1514,7 +1445,6 @@ static int add_to_waiters(struct dlm_lkb *lkb, int mstype, int to_nodeid)
 
 	lkb->lkb_wait_count++;
 	lkb->lkb_wait_type = mstype;
-	lkb->lkb_wait_time = ktime_get();
 	lkb->lkb_wait_nodeid = to_nodeid; /* for debugging */
 	hold_lkb(lkb);
 	list_add(&lkb->lkb_wait_reply, &ls->ls_waiters);
@@ -1962,16 +1892,6 @@ void dlm_adjust_timeouts(struct dlm_ls *ls)
 	list_for_each_entry(lkb, &ls->ls_timeout, lkb_time_list)
 		lkb->lkb_timestamp = ktime_add_us(lkb->lkb_timestamp, adj_us);
 	mutex_unlock(&ls->ls_timeout_mutex);
-
-	if (!dlm_config.ci_waitwarn_us)
-		return;
-
-	mutex_lock(&ls->ls_waiters_mutex);
-	list_for_each_entry(lkb, &ls->ls_waiters, lkb_wait_reply) {
-		if (ktime_to_us(lkb->lkb_wait_time))
-			lkb->lkb_wait_time = ktime_get();
-	}
-	mutex_unlock(&ls->ls_waiters_mutex);
 }
 
 /* lkb is master or local copy */
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index a4f492189a08..f9cbf35b3db1 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -275,7 +275,6 @@ static int dlm_scand(void *data)
 				ls->ls_scan_time = jiffies;
 				dlm_scan_rsbs(ls);
 				dlm_scan_timeout(ls);
-				dlm_scan_waiters(ls);
 				dlm_unlock_recovery(ls);
 			} else {
 				ls->ls_scan_time += HZ;
-- 
2.31.1

