Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5775A77C221
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Aug 2023 23:11:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692047491;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3CdvUCR67HKTzgA8ywdTr8ioyoTx7c9EJeXX3FgxDN0=;
	b=CZilnZd3H+b+3flPZJEIo7NYPZWjysFSZkTofYXHVpiNLzZHWzE3CNeLTdirZP12++AGsE
	yvDCO4TfXyrwXdUKXhuat9jQAlPrwhJ/m8KKNntg1xqTuBY+HnwW+BLElusIjJU2l0cNrp
	mI6NJHo0ye/qydteJP2x1VTzqu9XsdI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-aAw4lQbfN5W2zkx-UCSnxw-1; Mon, 14 Aug 2023 17:11:27 -0400
X-MC-Unique: aAw4lQbfN5W2zkx-UCSnxw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD1568DC661;
	Mon, 14 Aug 2023 21:11:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B3294A9005;
	Mon, 14 Aug 2023 21:11:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EA9FF194658F;
	Mon, 14 Aug 2023 21:11:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 629451946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 14 Aug 2023 21:11:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 44665C15BB8; Mon, 14 Aug 2023 21:11:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9DD8C15BAD;
 Mon, 14 Aug 2023 21:11:22 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: linux-nfs@vger.kernel.org
Date: Mon, 14 Aug 2023 17:11:12 -0400
Message-Id: <20230814211116.3224759-4-aahringo@redhat.com>
In-Reply-To: <20230814211116.3224759-1-aahringo@redhat.com>
References: <20230814211116.3224759-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [RFCv2 3/7] lockd: introduce safe async lock op
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
Cc: jlayton@kernel.org, cluster-devel@redhat.com, ocfs2-devel@lists.linux.dev,
 chuck.lever@oracle.com, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch reverts mostly commit 40595cdc93ed ("nfs: block notification
on fs with its own ->lock") and introduces an EXPORT_OP_SAFE_ASYNC_LOCK
export flag to signal that the "own ->lock" implementation supports
async lock requests. The only main user is DLM that is used by GFS2 and
OCFS2 filesystem. Those implement their own lock() implementation and
return FILE_LOCK_DEFERRED as return value. Since commit 40595cdc93ed
("nfs: block notification on fs with its own ->lock") the DLM
implementation were never updated. This patch should prepare for DLM
to set the EXPORT_OP_SAFE_ASYNC_LOCK export flag and update the DLM
plock implementation regarding to it.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/lockd/svclock.c       |  5 ++---
 fs/nfsd/nfs4state.c      | 13 ++++++++++---
 include/linux/exportfs.h |  8 ++++++++
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
index 1e74a578d7de..b8bd2b841ee1 100644
--- a/fs/lockd/svclock.c
+++ b/fs/lockd/svclock.c
@@ -449,9 +449,7 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
 	    struct nlm_host *host, struct nlm_lock *lock, int wait,
 	    struct nlm_cookie *cookie, int reclaim)
 {
-#if IS_ENABLED(CONFIG_SUNRPC_DEBUG)
 	struct inode		*inode = nlmsvc_file_inode(file);
-#endif
 	struct nlm_block	*block = NULL;
 	int			error;
 	int			mode;
@@ -465,7 +463,8 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
 				(long long)lock->fl.fl_end,
 				wait);
 
-	if (nlmsvc_file_file(file)->f_op->lock) {
+	if (!export_op_support_safe_async_lock(inode->i_sb->s_export_op,
+					       nlmsvc_file_file(file)->f_op)) {
 		async_block = wait;
 		wait = 0;
 	}
diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index 3aefbad4cc09..14ca06424ff1 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -7430,6 +7430,7 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 	struct nfsd4_blocked_lock *nbl = NULL;
 	struct file_lock *file_lock = NULL;
 	struct file_lock *conflock = NULL;
+	struct super_block *sb;
 	__be32 status = 0;
 	int lkflg;
 	int err;
@@ -7451,6 +7452,7 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 		dprintk("NFSD: nfsd4_lock: permission denied!\n");
 		return status;
 	}
+	sb = cstate->current_fh.fh_dentry->d_sb;
 
 	if (lock->lk_is_new) {
 		if (nfsd4_has_session(cstate))
@@ -7502,7 +7504,9 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 	fp = lock_stp->st_stid.sc_file;
 	switch (lock->lk_type) {
 		case NFS4_READW_LT:
-			if (nfsd4_has_session(cstate))
+			if (nfsd4_has_session(cstate) ||
+			    export_op_support_safe_async_lock(sb->s_export_op,
+							      nf->nf_file->f_op))
 				fl_flags |= FL_SLEEP;
 			fallthrough;
 		case NFS4_READ_LT:
@@ -7514,7 +7518,9 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 			fl_type = F_RDLCK;
 			break;
 		case NFS4_WRITEW_LT:
-			if (nfsd4_has_session(cstate))
+			if (nfsd4_has_session(cstate) ||
+			    export_op_support_safe_async_lock(sb->s_export_op,
+							      nf->nf_file->f_op))
 				fl_flags |= FL_SLEEP;
 			fallthrough;
 		case NFS4_WRITE_LT:
@@ -7542,7 +7548,8 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 	 * for file locks), so don't attempt blocking lock notifications
 	 * on those filesystems:
 	 */
-	if (nf->nf_file->f_op->lock)
+	if (!export_op_support_safe_async_lock(sb->s_export_op,
+					       nf->nf_file->f_op))
 		fl_flags &= ~FL_SLEEP;
 
 	nbl = find_or_allocate_block(lock_sop, &fp->fi_fhandle, nn);
diff --git a/include/linux/exportfs.h b/include/linux/exportfs.h
index 11fbd0ee1370..10358a93cdc1 100644
--- a/include/linux/exportfs.h
+++ b/include/linux/exportfs.h
@@ -3,6 +3,7 @@
 #define LINUX_EXPORTFS_H 1
 
 #include <linux/types.h>
+#include <linux/fs.h>
 
 struct dentry;
 struct iattr;
@@ -224,9 +225,16 @@ struct export_operations {
 						  atomic attribute updates
 						*/
 #define EXPORT_OP_FLUSH_ON_CLOSE	(0x20) /* fs flushes file data on close */
+#define EXPORT_OP_SAFE_ASYNC_LOCK	(0x40) /* fs can do async lock request */
 	unsigned long	flags;
 };
 
+static inline bool export_op_support_safe_async_lock(const struct export_operations *export_ops,
+						     const struct file_operations *f_op)
+{
+	return (export_ops->flags & EXPORT_OP_SAFE_ASYNC_LOCK) || !f_op->lock;
+}
+
 extern int exportfs_encode_inode_fh(struct inode *inode, struct fid *fid,
 				    int *max_len, struct inode *parent,
 				    int flags);
-- 
2.31.1

