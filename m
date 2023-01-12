Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE7A6686B5
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Jan 2023 23:19:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673561957;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=807vON5CjAJ6VL52sPzWEGlF5ufc3dFWeXTWRbZPWRs=;
	b=EiXjzeLP+S6o9zzef5wJ0jo6uGWYs9v+w5vBoaXBFGWHmxDaZocbQ+5MQL15/U2AKrEVOH
	1xOAmf1Gx8gVwuf7PsRDYuJrcFRHtWt0xR/ClcEqbak0Z+V7dP0zJBxQ4LMWcttx8RpenW
	NqrhgCUJ6x0k/MEiwtNr6wfUHcNk32E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-mvGCzUssPlu-_c0ZK72Efw-1; Thu, 12 Jan 2023 17:19:14 -0500
X-MC-Unique: mvGCzUssPlu-_c0ZK72Efw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9395D101A521;
	Thu, 12 Jan 2023 22:19:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8645840C2064;
	Thu, 12 Jan 2023 22:19:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5BB391947051;
	Thu, 12 Jan 2023 22:19:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1F5C41947051 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 22:18:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D5F0C40C2007; Thu, 12 Jan 2023 22:18:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9635840C2064;
 Thu, 12 Jan 2023 22:18:52 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 12 Jan 2023 17:18:44 -0500
Message-Id: <20230112221849.1883104-4-aahringo@redhat.com>
In-Reply-To: <20230112221849.1883104-1-aahringo@redhat.com>
References: <20230112221849.1883104-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH dlm/next 3/8] fs: dlm: wait until all
 midcomms nodes detects version
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The current dlm version detection is very complex due backwards
compatiblilty with earlier dlm protocol versions. It took some time to
detect if a peer node has a specific DLM version, if it's not known we
just cut the socket connection. Now there could be cases where the node
didn't detected the version field yet but the peer node detected it and
we are trying to shutdown the dlm connection with a specific mechanism
to avoid synchronization issue when pending cluster lockspace
memberships are still on wire.

To make it more robust we introcude a "best effort" wait to wait for the
version detection before shutdown the dlm connection. This need to be
done before the kthread recoverd for recovery handling is stopped,
because recovery handling will trigger enough messages to have a version
detection going on.

It is a corner case which was detected by modprobe dlm_locktroture module
and rmmod dlm_locktroture module directly afterwards (in a looping
behaviour). In practice probably nobody would leave a lockspace immediately
after joining it.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lockspace.c |  3 +++
 fs/dlm/midcomms.c  | 23 +++++++++++++++++++++++
 fs/dlm/midcomms.h  |  1 +
 3 files changed, 27 insertions(+)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 99bc96f90779..d9dc0b734002 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -820,6 +820,9 @@ static int release_lockspace(struct dlm_ls *ls, int force)
 		return rv;
 	}
 
+	if (ls_count == 1)
+		dlm_midcomms_version_wait();
+
 	dlm_device_deregister(ls);
 
 	if (force < 3 && dlm_user_daemon_available())
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index dbc998b2748b..cf91a5a11b4f 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -657,6 +657,7 @@ static int dlm_midcomms_version_check_3_2(struct midcomms_node *node)
 	switch (node->version) {
 	case DLM_VERSION_NOT_SET:
 		node->version = DLM_VERSION_3_2;
+		wake_up(&node->shutdown_wait);
 		log_print("version 0x%08x for node %d detected", DLM_VERSION_3_2,
 			  node->nodeid);
 		break;
@@ -826,6 +827,7 @@ static int dlm_midcomms_version_check_3_1(struct midcomms_node *node)
 	switch (node->version) {
 	case DLM_VERSION_NOT_SET:
 		node->version = DLM_VERSION_3_1;
+		wake_up(&node->shutdown_wait);
 		log_print("version 0x%08x for node %d detected", DLM_VERSION_3_1,
 			  node->nodeid);
 		break;
@@ -1386,6 +1388,27 @@ static void midcomms_node_release(struct rcu_head *rcu)
 	kfree(node);
 }
 
+void dlm_midcomms_version_wait(void)
+{
+	struct midcomms_node *node;
+	int i, idx, ret;
+
+	idx = srcu_read_lock(&nodes_srcu);
+	for (i = 0; i < CONN_HASH_SIZE; i++) {
+		hlist_for_each_entry_rcu(node, &node_hash[i], hlist) {
+			ret = wait_event_timeout(node->shutdown_wait,
+						 node->version != DLM_VERSION_NOT_SET ||
+						 node->state == DLM_CLOSED ||
+						 test_bit(DLM_NODE_FLAG_CLOSE, &node->flags),
+						 DLM_SHUTDOWN_TIMEOUT);
+			if (!ret || test_bit(DLM_NODE_FLAG_CLOSE, &node->flags))
+				pr_debug("version wait timed out for node %d with state %s\n",
+					 node->nodeid, dlm_state_str(node->state));
+		}
+	}
+	srcu_read_unlock(&nodes_srcu, idx);
+}
+
 static void midcomms_shutdown(struct midcomms_node *node)
 {
 	int ret;
diff --git a/fs/dlm/midcomms.h b/fs/dlm/midcomms.h
index bea1cee4279c..9f8c9605013d 100644
--- a/fs/dlm/midcomms.h
+++ b/fs/dlm/midcomms.h
@@ -20,6 +20,7 @@ struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 					     gfp_t allocation, char **ppc);
 void dlm_midcomms_commit_mhandle(struct dlm_mhandle *mh, const void *name,
 				 int namelen);
+void dlm_midcomms_version_wait(void);
 int dlm_midcomms_close(int nodeid);
 int dlm_midcomms_start(void);
 void dlm_midcomms_stop(void);
-- 
2.31.1

