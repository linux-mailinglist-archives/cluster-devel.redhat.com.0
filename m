Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A9975AE47
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Jul 2023 14:24:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689855861;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FD3hJMbcSOk43WGMty+fy86v8boCOc8cDDUnPU5WfVY=;
	b=edHXHW+UmdySCGVWcsvIPRZjZwu32eL1yjn3HS/s/VxCdpwdfbdtJTqqNu4PQGndugOiB5
	UXdPoK0hyKrm6UB3OUeUO393DL9dMIn4IYUe++zkJLA1N2XIqcnez7yGAFig6clJZUrSBY
	JQiTMJWhxhG0zBAUfvfMGgpQ816hoNM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-lUKiwKonP1-7X8rDe0HgFg-1; Thu, 20 Jul 2023 08:24:18 -0400
X-MC-Unique: lUKiwKonP1-7X8rDe0HgFg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A9A7185A795;
	Thu, 20 Jul 2023 12:24:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E5E7207B315;
	Thu, 20 Jul 2023 12:24:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8ECC019452C4;
	Thu, 20 Jul 2023 12:24:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0E5181946A5E for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Jul 2023 12:22:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3252F207B31A; Thu, 20 Jul 2023 12:22:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06DBD2017D0A;
 Thu, 20 Jul 2023 12:22:47 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 20 Jul 2023 08:22:41 -0400
Message-Id: <20230720122241.1381845-4-aahringo@redhat.com>
In-Reply-To: <20230720122241.1381845-1-aahringo@redhat.com>
References: <20230720122241.1381845-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCHv4 v6.5-rc2 3/3] fs: dlm: fix F_CANCELLK to
 cancel pending request
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch fixes the current handling of F_CANCELLK by not just doing a
unlock as we need to try to cancel a lock at first. A unlock makes sense
on a non-blocking lock request but if it's a blocking lock request we
need to cancel the request until it's not granted yet. This patch is fixing
this behaviour by first try to cancel a lock request and if it's failed
it's unlocking the lock which seems to be granted.

Note: currently the nfs locking handling was disabled by commit
40595cdc93ed ("nfs: block notification on fs with its own ->lock").
However DLM was never being updated regarding to this change. Future
patches will try to fix lockd lock requests for DLM. This patch is
currently assuming the upstream DLM lockd handling is correct.
---
 fs/dlm/plock.c            | 103 +++++++++++++++++++++++++++++++++-----
 fs/gfs2/file.c            |   9 ++--
 fs/ocfs2/stack_user.c     |  13 ++---
 include/linux/dlm_plock.h |   2 +
 4 files changed, 98 insertions(+), 29 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index a8ffa0760913..943d9f8e5564 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -42,6 +42,27 @@ static inline void set_version(struct dlm_plock_info *info)
 	info->version[2] = DLM_PLOCK_VERSION_PATCH;
 }
 
+static struct plock_op *plock_lookup_waiter(const struct dlm_plock_info *info)
+{
+	struct plock_op *op = NULL, *iter;
+
+	list_for_each_entry(iter, &recv_list, list) {
+		if (iter->info.fsid == info->fsid &&
+		    iter->info.number == info->number &&
+		    iter->info.owner == info->owner &&
+		    iter->info.pid == info->pid &&
+		    iter->info.start == info->start &&
+		    iter->info.end == info->end &&
+		    iter->info.ex == info->ex &&
+		    iter->info.wait) {
+			op = iter;
+			break;
+		}
+	}
+
+	return op;
+}
+
 static int check_version(struct dlm_plock_info *info)
 {
 	if ((DLM_PLOCK_VERSION_MAJOR != info->version[0]) ||
@@ -334,6 +355,74 @@ int dlm_posix_unlock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 }
 EXPORT_SYMBOL_GPL(dlm_posix_unlock);
 
+/*
+ * NOTE: This implementation can only handle async lock requests as nfs
+ * do it. It cannot handle cancellation of a pending lock request sitting
+ * in wait_event(), but for now only nfs is the only user local kernel
+ * user.
+ */
+int dlm_posix_cancel(dlm_lockspace_t *lockspace, u64 number, struct file *file,
+		     struct file_lock *fl)
+{
+	struct dlm_plock_info info;
+	struct plock_op *op;
+	struct dlm_ls *ls;
+	int rv;
+
+	/* this only works for async request for now and nfs is the only
+	 * kernel user right now.
+	 */
+	if (WARN_ON_ONCE(!fl->fl_lmops || !fl->fl_lmops->lm_grant))
+		return -EOPNOTSUPP;
+
+	ls = dlm_find_lockspace_local(lockspace);
+	if (!ls)
+		return -EINVAL;
+
+	memset(&info, 0, sizeof(info));
+	info.pid = fl->fl_pid;
+	info.ex = (fl->fl_type == F_WRLCK);
+	info.fsid = ls->ls_global_id;
+	dlm_put_lockspace(ls);
+	info.number = number;
+	info.start = fl->fl_start;
+	info.end = fl->fl_end;
+	info.owner = (__u64)fl->fl_pid;
+
+	rv = do_lock_cancel(&info);
+	switch (rv) {
+	case 0:
+		spin_lock(&ops_lock);
+		/* lock request to cancel must be on recv_list because
+		 * do_lock_cancel() synchronizes it.
+		 */
+		op = plock_lookup_waiter(&info);
+		if (WARN_ON_ONCE(!op)) {
+			rv = -ENOLCK;
+			break;
+		}
+
+		list_del(&op->list);
+		spin_unlock(&ops_lock);
+		WARN_ON(op->info.optype != DLM_PLOCK_OP_LOCK);
+		op->data->callback(op->data->fl, -EINTR);
+		dlm_release_plock_op(op);
+		rv = -EINTR;
+		break;
+	case -ENOENT:
+		/* if cancel wasn't successful we probably were to late
+		 * or it was a non-blocking lock request, so just unlock it.
+		 */
+		rv = dlm_posix_unlock(lockspace, number, file, fl);
+		break;
+	default:
+		break;
+	}
+
+	return rv;
+}
+EXPORT_SYMBOL_GPL(dlm_posix_cancel);
+
 int dlm_posix_get(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 		  struct file_lock *fl)
 {
@@ -457,19 +546,7 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 	 */
 	spin_lock(&ops_lock);
 	if (info.wait) {
-		list_for_each_entry(iter, &recv_list, list) {
-			if (iter->info.fsid == info.fsid &&
-			    iter->info.number == info.number &&
-			    iter->info.owner == info.owner &&
-			    iter->info.pid == info.pid &&
-			    iter->info.start == info.start &&
-			    iter->info.end == info.end &&
-			    iter->info.ex == info.ex &&
-			    iter->info.wait) {
-				op = iter;
-				break;
-			}
-		}
+		op = plock_lookup_waiter(&info);
 	} else {
 		list_for_each_entry(iter, &recv_list, list) {
 			if (!iter->info.wait) {
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 1bf3c4453516..386eceb2f574 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1436,17 +1436,14 @@ static int gfs2_lock(struct file *file, int cmd, struct file_lock *fl)
 
 	if (!(fl->fl_flags & FL_POSIX))
 		return -ENOLCK;
-	if (cmd == F_CANCELLK) {
-		/* Hack: */
-		cmd = F_SETLK;
-		fl->fl_type = F_UNLCK;
-	}
 	if (unlikely(gfs2_withdrawn(sdp))) {
 		if (fl->fl_type == F_UNLCK)
 			locks_lock_file_wait(file, fl);
 		return -EIO;
 	}
-	if (IS_GETLK(cmd))
+	if (cmd == F_CANCELLK)
+		return dlm_posix_cancel(ls->ls_dlm, ip->i_no_addr, file, fl);
+	else if (IS_GETLK(cmd))
 		return dlm_posix_get(ls->ls_dlm, ip->i_no_addr, file, fl);
 	else if (fl->fl_type == F_UNLCK)
 		return dlm_posix_unlock(ls->ls_dlm, ip->i_no_addr, file, fl);
diff --git a/fs/ocfs2/stack_user.c b/fs/ocfs2/stack_user.c
index 05d4414d0c33..9b76ee66aeb2 100644
--- a/fs/ocfs2/stack_user.c
+++ b/fs/ocfs2/stack_user.c
@@ -738,18 +738,11 @@ static int user_plock(struct ocfs2_cluster_connection *conn,
 	 *
 	 * Internally, fs/dlm will pass these to a misc device, which
 	 * a userspace daemon will read and write to.
-	 *
-	 * For now, cancel requests (which happen internally only),
-	 * are turned into unlocks. Most of this function taken from
-	 * gfs2_lock.
 	 */
 
-	if (cmd == F_CANCELLK) {
-		cmd = F_SETLK;
-		fl->fl_type = F_UNLCK;
-	}
-
-	if (IS_GETLK(cmd))
+	if (cmd == F_CANCELLK)
+		return dlm_posix_cancel(conn->cc_lockspace, ino, file, fl);
+	else if (IS_GETLK(cmd))
 		return dlm_posix_get(conn->cc_lockspace, ino, file, fl);
 	else if (fl->fl_type == F_UNLCK)
 		return dlm_posix_unlock(conn->cc_lockspace, ino, file, fl);
diff --git a/include/linux/dlm_plock.h b/include/linux/dlm_plock.h
index e6d76e8715a6..15fc856d198c 100644
--- a/include/linux/dlm_plock.h
+++ b/include/linux/dlm_plock.h
@@ -11,6 +11,8 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 		int cmd, struct file_lock *fl);
 int dlm_posix_unlock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 		struct file_lock *fl);
+int dlm_posix_cancel(dlm_lockspace_t *lockspace, u64 number, struct file *file,
+		     struct file_lock *fl);
 int dlm_posix_get(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 		struct file_lock *fl);
 #endif
-- 
2.31.1

