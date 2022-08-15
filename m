Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D452F593A7C
	for <lists+cluster-devel@lfdr.de>; Mon, 15 Aug 2022 21:43:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660592620;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WOcTs78AXIJgGs8bHQ6DZCAalkXdVlAgw1pE/RpnIdc=;
	b=Nq6UwX64B9ENQ7SZVfjAs2FMbdqUEpvlgB2Z07DpfdKJ1IGkl4VeKE7f2xtZsm/kNU05+m
	IxUStw9197Rhd78EeUTzLR3olPd8A3hliOp/5k8bO9LzNKlBAeJ8PenQIH/giMhFSVwAU9
	2JEZLJEPB3+AWaNDfXRM58+eAwt+vLY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-BdJ3A84CMimxPF0IHqeo3Q-1; Mon, 15 Aug 2022 15:43:36 -0400
X-MC-Unique: BdJ3A84CMimxPF0IHqeo3Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D9988041BE;
	Mon, 15 Aug 2022 19:43:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 19B84C15BC5;
	Mon, 15 Aug 2022 19:43:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 65CF31940352;
	Mon, 15 Aug 2022 19:43:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 29E77194034E for <cluster-devel@listman.corp.redhat.com>;
 Mon, 15 Aug 2022 19:43:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A663F1121325; Mon, 15 Aug 2022 19:43:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E0511121315;
 Mon, 15 Aug 2022 19:43:31 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 15 Aug 2022 15:43:25 -0400
Message-Id: <20220815194328.2208580-14-aahringo@redhat.com>
In-Reply-To: <20220815194328.2208580-1-aahringo@redhat.com>
References: <20220815194328.2208580-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [RESEND dlm/next 13/16] fs: dlm: move DLM_LSFL_FS
 out of uapi
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The DLM_LSFL_FS should be never part of the dlm lockspace uapi headers.
If a user space dlm user is using this flag it's doing something wrong
for user space flags. If their program doesn't compile anymore because
this flag is missing we do a favour for them by signaling them there is
a bug. Even the kernel lockspaces does not need to set this flag. This
patch will always set it for kernel space lockspaces and do not set it
for user space lockspaces so no mistake can happen anymore. In future we
hopefully can silently remove this flag and this bit can be get reused
for something else.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 drivers/md/md-cluster.c  |  4 ++--
 fs/dlm/lockspace.c       | 28 ++++++++++++++++++++++++----
 fs/dlm/lockspace.h       | 13 +++++++++++++
 fs/dlm/user.c            |  6 +++---
 fs/gfs2/lock_dlm.c       |  2 +-
 fs/ocfs2/stack_user.c    |  2 +-
 include/linux/dlm.h      |  3 ---
 include/uapi/linux/dlm.h |  1 -
 8 files changed, 44 insertions(+), 15 deletions(-)

diff --git a/drivers/md/md-cluster.c b/drivers/md/md-cluster.c
index 742b2349fea3..10e0c5381d01 100644
--- a/drivers/md/md-cluster.c
+++ b/drivers/md/md-cluster.c
@@ -876,8 +876,8 @@ static int join(struct mddev *mddev, int nodes)
 	memset(str, 0, 64);
 	sprintf(str, "%pU", mddev->uuid);
 	ret = dlm_new_lockspace(str, mddev->bitmap_info.cluster_name,
-				DLM_LSFL_FS, LVB_SIZE,
-				&md_ls_ops, mddev, &ops_rv, &cinfo->lockspace);
+				0, LVB_SIZE, &md_ls_ops, mddev,
+				&ops_rv, &cinfo->lockspace);
 	if (ret)
 		goto err;
 	wait_for_completion(&cinfo->completion);
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 41a6504cfab5..bae050df7abf 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -703,10 +703,11 @@ static int new_lockspace(const char *name, const char *cluster,
 	return error;
 }
 
-int dlm_new_lockspace(const char *name, const char *cluster,
-		      uint32_t flags, int lvblen,
-		      const struct dlm_lockspace_ops *ops, void *ops_arg,
-		      int *ops_result, dlm_lockspace_t **lockspace)
+static int __dlm_new_lockspace(const char *name, const char *cluster,
+			       uint32_t flags, int lvblen,
+			       const struct dlm_lockspace_ops *ops,
+			       void *ops_arg, int *ops_result,
+			       dlm_lockspace_t **lockspace)
 {
 	int error = 0;
 
@@ -732,6 +733,25 @@ int dlm_new_lockspace(const char *name, const char *cluster,
 	return error;
 }
 
+int dlm_new_lockspace(const char *name, const char *cluster, uint32_t flags,
+		      int lvblen, const struct dlm_lockspace_ops *ops,
+		      void *ops_arg, int *ops_result,
+		      dlm_lockspace_t **lockspace)
+{
+	return __dlm_new_lockspace(name, cluster, flags | DLM_LSFL_FS, lvblen,
+				   ops, ops_arg, ops_result, lockspace);
+}
+
+int dlm_new_user_lockspace(const char *name, const char *cluster,
+			   uint32_t flags, int lvblen,
+			   const struct dlm_lockspace_ops *ops,
+			   void *ops_arg, int *ops_result,
+			   dlm_lockspace_t **lockspace)
+{
+	return __dlm_new_lockspace(name, cluster, flags, lvblen, ops,
+				   ops_arg, ops_result, lockspace);
+}
+
 static int lkb_idr_is_local(int id, void *p, void *data)
 {
 	struct dlm_lkb *lkb = p;
diff --git a/fs/dlm/lockspace.h b/fs/dlm/lockspace.h
index 306fc4f4ea15..03f4a4a3a871 100644
--- a/fs/dlm/lockspace.h
+++ b/fs/dlm/lockspace.h
@@ -12,6 +12,14 @@
 #ifndef __LOCKSPACE_DOT_H__
 #define __LOCKSPACE_DOT_H__
 
+/* DLM_LSFL_FS
+ *   The lockspace user is in the kernel (i.e. filesystem).  Enables
+ *   direct bast/cast callbacks.
+ *
+ * internal lockspace flag - will be removed in future
+ */
+#define DLM_LSFL_FS	0x00000004
+
 int dlm_lockspace_init(void);
 void dlm_lockspace_exit(void);
 struct dlm_ls *dlm_find_lockspace_global(uint32_t id);
@@ -20,6 +28,11 @@ struct dlm_ls *dlm_find_lockspace_device(int minor);
 void dlm_put_lockspace(struct dlm_ls *ls);
 void dlm_stop_lockspaces(void);
 void dlm_stop_lockspaces_check(void);
+int dlm_new_user_lockspace(const char *name, const char *cluster,
+			   uint32_t flags, int lvblen,
+			   const struct dlm_lockspace_ops *ops,
+			   void *ops_arg, int *ops_result,
+			   dlm_lockspace_t **lockspace);
 
 #endif				/* __LOCKSPACE_DOT_H__ */
 
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index ca27f276a3f5..c5d27bccc3dc 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -423,9 +423,9 @@ static int device_create_lockspace(struct dlm_lspace_params *params)
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	error = dlm_new_lockspace(params->name, dlm_config.ci_cluster_name, params->flags,
-				  DLM_USER_LVB_LEN, NULL, NULL, NULL,
-				  &lockspace);
+	error = dlm_new_user_lockspace(params->name, dlm_config.ci_cluster_name,
+				       params->flags, DLM_USER_LVB_LEN, NULL,
+				       NULL, NULL, &lockspace);
 	if (error)
 		return error;
 
diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 6ce369b096d4..71911bf9ab34 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -1302,7 +1302,7 @@ static int gdlm_mount(struct gfs2_sbd *sdp, const char *table)
 	memcpy(cluster, table, strlen(table) - strlen(fsname));
 	fsname++;
 
-	flags = DLM_LSFL_FS | DLM_LSFL_NEWEXCL;
+	flags = DLM_LSFL_NEWEXCL;
 
 	/*
 	 * create/join lockspace
diff --git a/fs/ocfs2/stack_user.c b/fs/ocfs2/stack_user.c
index a75e2b7d67f5..64e6ddcfe329 100644
--- a/fs/ocfs2/stack_user.c
+++ b/fs/ocfs2/stack_user.c
@@ -991,7 +991,7 @@ static int user_cluster_connect(struct ocfs2_cluster_connection *conn)
 	lc->oc_type = NO_CONTROLD;
 
 	rc = dlm_new_lockspace(conn->cc_name, conn->cc_cluster_name,
-			       DLM_LSFL_FS | DLM_LSFL_NEWEXCL, DLM_LVB_LEN,
+			       DLM_LSFL_NEWEXCL, DLM_LVB_LEN,
 			       &ocfs2_ls_ops, conn, &ops_rv, &fsdlm);
 	if (rc) {
 		if (rc == -EEXIST || rc == -EPROTO)
diff --git a/include/linux/dlm.h b/include/linux/dlm.h
index ff951e9f6f20..f5f55c2138ae 100644
--- a/include/linux/dlm.h
+++ b/include/linux/dlm.h
@@ -56,9 +56,6 @@ struct dlm_lockspace_ops {
  * DLM_LSFL_TIMEWARN
  *   The dlm should emit netlink messages if locks have been waiting
  *   for a configurable amount of time.  (Unused.)
- * DLM_LSFL_FS
- *   The lockspace user is in the kernel (i.e. filesystem).  Enables
- *   direct bast/cast callbacks.
  * DLM_LSFL_NEWEXCL
  *   dlm_new_lockspace() should return -EEXIST if the lockspace exists.
  *
diff --git a/include/uapi/linux/dlm.h b/include/uapi/linux/dlm.h
index 0d2eca287567..1923f4f3b05e 100644
--- a/include/uapi/linux/dlm.h
+++ b/include/uapi/linux/dlm.h
@@ -69,7 +69,6 @@ struct dlm_lksb {
 /* dlm_new_lockspace() flags */
 
 #define DLM_LSFL_TIMEWARN	0x00000002
-#define DLM_LSFL_FS     	0x00000004
 #define DLM_LSFL_NEWEXCL     	0x00000008
 
 
-- 
2.31.1

