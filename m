Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 44C2B3814AB
	for <lists+cluster-devel@lfdr.de>; Sat, 15 May 2021 02:36:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621038983;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N4E0rov6X/OZDsAizg9O3Ahk9gMpQTFqgW8B8Bwi9Ao=;
	b=KW/CsptiHWUTLJpdI7CuJ+6Iwx97I0avfGH4qrGvM+iLxD6Yz6G3CdUW4LHLKJZQI5kToL
	s23E8l5A/AVzJWOMU8fbpwUZnoZgRt/wV5Oo/IeheHuALJ47GcgPp0fgEZUz3MQL9I625N
	mFkLZtdO2KHY1f85KXKo+fJzsfhtCDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-lHeJfwT8PJGdwKvY6KBPvQ-1; Fri, 14 May 2021 20:36:21 -0400
X-MC-Unique: lHeJfwT8PJGdwKvY6KBPvQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EFC31854E21;
	Sat, 15 May 2021 00:36:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9211C5D6D1;
	Sat, 15 May 2021 00:36:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 821A5180B464;
	Sat, 15 May 2021 00:36:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14F0aHpO030960 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 14 May 2021 20:36:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 21A105D9FC; Sat, 15 May 2021 00:36:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-135.rdu2.redhat.com [10.10.115.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98A825D9CD;
	Sat, 15 May 2021 00:36:14 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 14 May 2021 20:35:48 -0400
Message-Id: <20210515003549.1118171-15-aahringo@redhat.com>
In-Reply-To: <20210515003549.1118171-1-aahringo@redhat.com>
References: <20210515003549.1118171-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv5 v5.13-rc1 dlm/next 14/15] fs: dlm: add
	midcomms debugfs functionality
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds functionality to debug midcomms per connection state
inside a comms directory which is similar like dlm configfs. Currently
there exists the possibility to read out two attributes which is the
send queue counter and the version of each midcomms node state.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/debug_fs.c     | 54 +++++++++++++++++++++++++++++++++++++++++++
 fs/dlm/dlm_internal.h |  4 ++++
 fs/dlm/midcomms.c     | 27 ++++++++++++++++++++++
 fs/dlm/midcomms.h     |  6 +++++
 4 files changed, 91 insertions(+)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index d5bd990bcab8..47e9d57e4cae 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 
 #include "dlm_internal.h"
+#include "midcomms.h"
 #include "lock.h"
 
 #define DLM_DEBUG_BUF_LEN 4096
@@ -23,6 +24,7 @@ static char debug_buf[DLM_DEBUG_BUF_LEN];
 static struct mutex debug_buf_lock;
 
 static struct dentry *dlm_root;
+static struct dentry *dlm_comms;
 
 static char *print_lockmode(int mode)
 {
@@ -738,6 +740,57 @@ void dlm_delete_debug_file(struct dlm_ls *ls)
 	debugfs_remove(ls->ls_debug_toss_dentry);
 }
 
+static int dlm_state_show(struct seq_file *file, void *offset)
+{
+	seq_printf(file, "%s\n", dlm_midcomms_state(file->private));
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(dlm_state);
+
+static int dlm_flags_show(struct seq_file *file, void *offset)
+{
+	seq_printf(file, "%lu\n", dlm_midcomms_flags(file->private));
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(dlm_flags);
+
+static int dlm_send_queue_cnt_show(struct seq_file *file, void *offset)
+{
+	seq_printf(file, "%d\n", dlm_midcomms_send_queue_cnt(file->private));
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(dlm_send_queue_cnt);
+
+static int dlm_version_show(struct seq_file *file, void *offset)
+{
+	seq_printf(file, "0x%08x\n", dlm_midcomms_version(file->private));
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(dlm_version);
+
+void *dlm_create_debug_comms_file(int nodeid, void *data)
+{
+	struct dentry *d_node;
+	char name[256];
+
+	memset(name, 0, sizeof(name));
+	snprintf(name, 256, "%d", nodeid);
+
+	d_node = debugfs_create_dir(name, dlm_comms);
+	debugfs_create_file("state", 0444, d_node, data, &dlm_state_fops);
+	debugfs_create_file("flags", 0444, d_node, data, &dlm_flags_fops);
+	debugfs_create_file("send_queue_count", 0444, d_node, data,
+			    &dlm_send_queue_cnt_fops);
+	debugfs_create_file("version", 0444, d_node, data, &dlm_version_fops);
+
+	return d_node;
+}
+
+void dlm_delete_debug_comms_file(void *ctx)
+{
+	debugfs_remove(ctx);
+}
+
 void dlm_create_debug_file(struct dlm_ls *ls)
 {
 	char name[DLM_LOCKSPACE_LEN + 8];
@@ -797,6 +850,7 @@ void __init dlm_register_debugfs(void)
 {
 	mutex_init(&debug_buf_lock);
 	dlm_root = debugfs_create_dir("dlm", NULL);
+	dlm_comms = debugfs_create_dir("comms", dlm_root);
 }
 
 void dlm_unregister_debugfs(void)
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 40917c878370..91d1ca3a121a 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -754,11 +754,15 @@ void dlm_register_debugfs(void);
 void dlm_unregister_debugfs(void);
 void dlm_create_debug_file(struct dlm_ls *ls);
 void dlm_delete_debug_file(struct dlm_ls *ls);
+void *dlm_create_debug_comms_file(int nodeid, void *data);
+void dlm_delete_debug_comms_file(void *ctx);
 #else
 static inline void dlm_register_debugfs(void) { }
 static inline void dlm_unregister_debugfs(void) { }
 static inline void dlm_create_debug_file(struct dlm_ls *ls) { }
 static inline void dlm_delete_debug_file(struct dlm_ls *ls) { }
+static inline void *dlm_create_debug_comms_file(int nodeid, void *data) { return NULL; }
+static inline void dlm_delete_debug_comms_file(void *ctx) { }
 #endif
 
 #endif				/* __DLM_INTERNAL_DOT_H__ */
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 9600fc19f903..67f990e45c61 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -190,6 +190,9 @@ struct midcomms_node {
 	 */
 	int users;
 
+	/* not protected by srcu, node_hash lifetime */
+	void *debugfs;
+
 	struct hlist_node hlist;
 	struct rcu_head rcu;
 };
@@ -245,6 +248,26 @@ static inline const char *dlm_state_str(int state)
 	}
 }
 
+const char *dlm_midcomms_state(struct midcomms_node *node)
+{
+	return dlm_state_str(node->state);
+}
+
+unsigned long dlm_midcomms_flags(struct midcomms_node *node)
+{
+	return node->flags;
+}
+
+int dlm_midcomms_send_queue_cnt(struct midcomms_node *node)
+{
+	return atomic_read(&node->send_queue_cnt);
+}
+
+uint32_t dlm_midcomms_version(struct midcomms_node *node)
+{
+	return node->version;
+}
+
 static struct midcomms_node *__find_node(int nodeid, int r)
 {
 	struct midcomms_node *node;
@@ -306,6 +329,8 @@ static struct midcomms_node *nodeid2node(int nodeid, gfp_t alloc)
 
 	hlist_add_head_rcu(&node->hlist, &node_hash[r]);
 	spin_unlock(&nodes_lock);
+
+	node->debugfs = dlm_create_debug_comms_file(nodeid, node);
 	return node;
 }
 
@@ -1307,6 +1332,8 @@ void dlm_midcomms_shutdown(void)
 		hlist_for_each_entry_rcu(node, &node_hash[i], hlist) {
 			midcomms_shutdown(node);
 
+			dlm_delete_debug_comms_file(node->debugfs);
+
 			spin_lock(&nodes_lock);
 			hlist_del_rcu(&node->hlist);
 			spin_unlock(&nodes_lock);
diff --git a/fs/dlm/midcomms.h b/fs/dlm/midcomms.h
index 1178b836315b..579abc6929be 100644
--- a/fs/dlm/midcomms.h
+++ b/fs/dlm/midcomms.h
@@ -12,6 +12,8 @@
 #ifndef __MIDCOMMS_DOT_H__
 #define __MIDCOMMS_DOT_H__
 
+struct midcomms_node;
+
 int dlm_process_incoming_buffer(int nodeid, unsigned char *buf, int buflen);
 struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 					     gfp_t allocation, char **ppc);
@@ -22,6 +24,10 @@ void dlm_midcomms_shutdown(void);
 void dlm_midcomms_add_member(int nodeid);
 void dlm_midcomms_remove_member(int nodeid);
 void dlm_midcomms_unack_msg_resend(int nodeid);
+const char *dlm_midcomms_state(struct midcomms_node *node);
+unsigned long dlm_midcomms_flags(struct midcomms_node *node);
+int dlm_midcomms_send_queue_cnt(struct midcomms_node *node);
+uint32_t dlm_midcomms_version(struct midcomms_node *node);
 
 #endif				/* __MIDCOMMS_DOT_H__ */
 
-- 
2.26.3

