Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D7675AEEA
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Jul 2023 14:58:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689857926;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Cs+3mPINUu7CIziTneRZX33fBd+VO6ZuLx7iYDNN/64=;
	b=AVoM/46KrX1vqU0qMKlM1DAg1KQXsQgFOiuPDYF1kOYdMfiCH8DQaZ5/Skb6gLQkdrIKiX
	SJJYHyQdGXVH5C2Ql5Kk9chPBCVtvW6978KemhXBB3xtF2UxaNA3LhNfDqXFy2qOk5zoCO
	4vU20YNgnt/Ww1dtJBioreLTnitO04I=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-jGxcKhxCMk64QKOWS5cDjw-1; Thu, 20 Jul 2023 08:58:42 -0400
X-MC-Unique: jGxcKhxCMk64QKOWS5cDjw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 309BE2999B37;
	Thu, 20 Jul 2023 12:58:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25B78492B02;
	Thu, 20 Jul 2023 12:58:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D778F1946A6E;
	Thu, 20 Jul 2023 12:58:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 84E101946A43 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Jul 2023 12:58:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 626F12166B28; Thu, 20 Jul 2023 12:58:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C3832166B25;
 Thu, 20 Jul 2023 12:58:15 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: chuck.lever@oracle.com
Date: Thu, 20 Jul 2023 08:58:06 -0400
Message-Id: <20230720125806.1385279-3-aahringo@redhat.com>
In-Reply-To: <20230720125806.1385279-1-aahringo@redhat.com>
References: <20230720125806.1385279-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [RFC v6.5-rc2 3/3] fs: lockd: introduce safe async
 lock op
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
Cc: cluster-devel@redhat.com, linux-nfs@vger.kernel.org, neilb@suse.de,
 jlayton@kernel.org, Dai.Ngo@oracle.com, tom@talpey.com, kolga@netapp.com,
 anna@kernel.org, trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
 fs/nfsd/nfs4state.c      | 11 ++++++++---
 include/linux/exportfs.h |  1 +
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
index 62ef27a69a9e..54a67bd33843 100644
--- a/fs/lockd/svclock.c
+++ b/fs/lockd/svclock.c
@@ -483,9 +483,7 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
 	    struct nlm_host *host, struct nlm_lock *lock, int wait,
 	    struct nlm_cookie *cookie, int reclaim)
 {
-#if IS_ENABLED(CONFIG_SUNRPC_DEBUG)
 	struct inode		*inode = nlmsvc_file_inode(file);
-#endif
 	struct nlm_block	*block = NULL;
 	int			error;
 	int			mode;
@@ -499,7 +497,8 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
 				(long long)lock->fl.fl_end,
 				wait);
 
-	if (nlmsvc_file_file(file)->f_op->lock) {
+	if (!(inode->i_sb->s_export_op->flags & EXPORT_OP_SAFE_ASYNC_LOCK) &&
+	    nlmsvc_file_file(file)->f_op->lock) {
 		async_block = wait;
 		wait = 0;
 	}
diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index 6e61fa3acaf1..efcea229d640 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -7432,6 +7432,7 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 	struct nfsd4_blocked_lock *nbl = NULL;
 	struct file_lock *file_lock = NULL;
 	struct file_lock *conflock = NULL;
+	struct super_block *sb;
 	__be32 status = 0;
 	int lkflg;
 	int err;
@@ -7453,6 +7454,7 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 		dprintk("NFSD: nfsd4_lock: permission denied!\n");
 		return status;
 	}
+	sb = cstate->current_fh.fh_dentry->d_sb;
 
 	if (lock->lk_is_new) {
 		if (nfsd4_has_session(cstate))
@@ -7504,7 +7506,8 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 	fp = lock_stp->st_stid.sc_file;
 	switch (lock->lk_type) {
 		case NFS4_READW_LT:
-			if (nfsd4_has_session(cstate))
+			if (sb->s_export_op->flags & EXPORT_OP_SAFE_ASYNC_LOCK &&
+			    nfsd4_has_session(cstate))
 				fl_flags |= FL_SLEEP;
 			fallthrough;
 		case NFS4_READ_LT:
@@ -7516,7 +7519,8 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 			fl_type = F_RDLCK;
 			break;
 		case NFS4_WRITEW_LT:
-			if (nfsd4_has_session(cstate))
+			if (sb->s_export_op->flags & EXPORT_OP_SAFE_ASYNC_LOCK &&
+			    nfsd4_has_session(cstate))
 				fl_flags |= FL_SLEEP;
 			fallthrough;
 		case NFS4_WRITE_LT:
@@ -7544,7 +7548,8 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 	 * for file locks), so don't attempt blocking lock notifications
 	 * on those filesystems:
 	 */
-	if (nf->nf_file->f_op->lock)
+	if (!(sb->s_export_op->flags & EXPORT_OP_SAFE_ASYNC_LOCK) &&
+	    nf->nf_file->f_op->lock)
 		fl_flags &= ~FL_SLEEP;
 
 	nbl = find_or_allocate_block(lock_sop, &fp->fi_fhandle, nn);
diff --git a/include/linux/exportfs.h b/include/linux/exportfs.h
index 11fbd0ee1370..da742abbaf3e 100644
--- a/include/linux/exportfs.h
+++ b/include/linux/exportfs.h
@@ -224,6 +224,7 @@ struct export_operations {
 						  atomic attribute updates
 						*/
 #define EXPORT_OP_FLUSH_ON_CLOSE	(0x20) /* fs flushes file data on close */
+#define EXPORT_OP_SAFE_ASYNC_LOCK	(0x40) /* fs can do async lock request */
 	unsigned long	flags;
 };
 
-- 
2.31.1

