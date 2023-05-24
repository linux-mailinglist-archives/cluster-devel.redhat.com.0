Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A070D70FC82
	for <lists+cluster-devel@lfdr.de>; Wed, 24 May 2023 19:19:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684948782;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/lPFcF4yzUaOtGivRTD62js6B6h3V/eRmtjcyR+K+TY=;
	b=Cdj7nYWNGHZFCM2DIQk/qgVd0n/2jBUzQI/0gb8w6GIvzA9hvW8vhuGC9ojioEclhYf6C1
	4mmu4SszMJrffC0lll6tdHB/S4Y2+WbQ7pRWIt26Ize/MxsISw1iOYbTViesXElrHHRqWL
	jab2Qai4pOTjSQOFPekqhC/SDUf6/fk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-ug5M61k5PiaJDuCajOikuA-1; Wed, 24 May 2023 13:19:41 -0400
X-MC-Unique: ug5M61k5PiaJDuCajOikuA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D00F1C05132;
	Wed, 24 May 2023 17:19:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0125B492B00;
	Wed, 24 May 2023 17:19:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BAED419465B3;
	Wed, 24 May 2023 17:19:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 730CE19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 24 May 2023 17:19:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 631672166B27; Wed, 24 May 2023 17:19:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 342C62166B25;
 Wed, 24 May 2023 17:19:35 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 24 May 2023 13:19:31 -0400
Message-Id: <20230524171932.1132564-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 1/2] fs: dlm: plock debugfs to
 check for pending operations
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In the past issues were found that there were still ongoing plock
operations in the kernel but it should cleanup routines should clear
them up because there were no plock activity by the user anymore. To
check that "dlm_tool plocks $LS" can be used, but this only shows
pending operations in dlm_controld daemon. To check the kernel part, if
the kernel waits for an answer of the user space, this patch introduces
a debugfs entry which reports if there are ongoing plock operations or
not.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/debug_fs.c     | 26 ++++++++++++++++++++++++++
 fs/dlm/dlm_internal.h |  5 +++++
 fs/dlm/plock.c        | 15 +++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index a1aca41c49d0..494a6e73f8e8 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -25,6 +25,7 @@ static struct mutex debug_buf_lock;
 
 static struct dentry *dlm_root;
 static struct dentry *dlm_comms;
+static struct dentry *dlm_plock;
 
 static char *print_lockmode(int mode)
 {
@@ -883,6 +884,30 @@ void dlm_delete_debug_comms_file(void *ctx)
 	debugfs_remove(ctx);
 }
 
+static int dlm_plock_ops_pending_show(struct seq_file *file, void *offset)
+{
+	seq_printf(file, "%d\n", dlm_plock_ops_pending());
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(dlm_plock_ops_pending);
+
+void dlm_create_debug_plock_file(void)
+{
+	/* TODO currently use case if only to look if everything got cleaned
+	 * up probably if user space dlm_tool plocks $LS shows no activity
+	 * anymore on all lockspaces.
+	 *
+	 * However in future a dump could be useful as well.
+	 */
+	debugfs_create_file("plock_ops_pending", 0444, dlm_plock, NULL,
+			    &dlm_plock_ops_pending_fops);
+}
+
+void dlm_remove_debug_plock_file(void)
+{
+	debugfs_remove(dlm_plock);
+}
+
 void dlm_create_debug_file(struct dlm_ls *ls)
 {
 	char name[DLM_LOCKSPACE_LEN + 8];
@@ -943,6 +968,7 @@ void __init dlm_register_debugfs(void)
 	mutex_init(&debug_buf_lock);
 	dlm_root = debugfs_create_dir("dlm", NULL);
 	dlm_comms = debugfs_create_dir("comms", dlm_root);
+	dlm_plock = debugfs_create_dir("plock", dlm_root);
 }
 
 void dlm_unregister_debugfs(void)
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 986a9d7b1f33..f5f741ee527b 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -805,6 +805,7 @@ static inline void dlm_set_sbflags_val(struct dlm_lkb *lkb, uint32_t val)
 			  __DLM_SBF_MAX_BIT);
 }
 
+int dlm_plock_ops_pending(void);
 int dlm_plock_init(void);
 void dlm_plock_exit(void);
 
@@ -815,6 +816,8 @@ void dlm_create_debug_file(struct dlm_ls *ls);
 void dlm_delete_debug_file(struct dlm_ls *ls);
 void *dlm_create_debug_comms_file(int nodeid, void *data);
 void dlm_delete_debug_comms_file(void *ctx);
+void dlm_create_debug_plock_file(void);
+void dlm_remove_debug_plock_file(void);
 #else
 static inline void dlm_register_debugfs(void) { }
 static inline void dlm_unregister_debugfs(void) { }
@@ -822,6 +825,8 @@ static inline void dlm_create_debug_file(struct dlm_ls *ls) { }
 static inline void dlm_delete_debug_file(struct dlm_ls *ls) { }
 static inline void *dlm_create_debug_comms_file(int nodeid, void *data) { return NULL; }
 static inline void dlm_delete_debug_comms_file(void *ctx) { }
+static inline void dlm_create_debug_plock_file(void) { };
+static inline void dlm_remove_debug_plock_file(void) { };
 #endif
 
 #endif				/* __DLM_INTERNAL_DOT_H__ */
diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 53d17dbbb716..d6ec70547b77 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -35,6 +35,18 @@ struct plock_op {
 	struct plock_async_data *data;
 };
 
+int dlm_plock_ops_pending(void)
+{
+	int rv;
+
+	spin_lock(&ops_lock);
+	rv = !list_empty(&send_list);
+	rv |= !list_empty(&recv_list);
+	spin_unlock(&ops_lock);
+
+	return rv;
+}
+
 static inline void set_version(struct dlm_plock_info *info)
 {
 	info->version[0] = DLM_PLOCK_VERSION_MAJOR;
@@ -509,11 +521,14 @@ int dlm_plock_init(void)
 	rv = misc_register(&plock_dev_misc);
 	if (rv)
 		log_print("dlm_plock_init: misc_register failed %d", rv);
+
+	dlm_create_debug_plock_file();
 	return rv;
 }
 
 void dlm_plock_exit(void)
 {
+	dlm_remove_debug_plock_file();
 	misc_deregister(&plock_dev_misc);
 }
 
-- 
2.31.1

