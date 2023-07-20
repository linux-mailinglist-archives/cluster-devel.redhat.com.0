Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EE975AEE9
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Jul 2023 14:58:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689857925;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UUy1M7UsNjb1vyE9f94nUBKR0l9EKezxR8VVlMF4DT4=;
	b=a5jNKH4lA/2VsiIjSims0EkSvk1Bfuu1VlglkGCaujcKoJ9TIMVLJgWERXYnjxOmrjfWO3
	j9qxyfpd3qezc3Mi0tHQ9qDbi38XUbY8rpt6xafO3OebHppy9dVfyIgdFSd0KSXmsqE24u
	CcipxYEesDOV+1JRN6BKnoQ4yJmH040=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-0tHPpRXrPdi7Y5bHWT84XQ-1; Thu, 20 Jul 2023 08:58:42 -0400
X-MC-Unique: 0tHPpRXrPdi7Y5bHWT84XQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BA1E10504AC;
	Thu, 20 Jul 2023 12:58:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0A88492B02;
	Thu, 20 Jul 2023 12:58:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C7CB31946A69;
	Thu, 20 Jul 2023 12:58:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 824A419465BD for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Jul 2023 12:58:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 076E72166B27; Thu, 20 Jul 2023 12:58:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3C9F2166B25;
 Thu, 20 Jul 2023 12:58:14 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: chuck.lever@oracle.com
Date: Thu, 20 Jul 2023 08:58:05 -0400
Message-Id: <20230720125806.1385279-2-aahringo@redhat.com>
In-Reply-To: <20230720125806.1385279-1-aahringo@redhat.com>
References: <20230720125806.1385279-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [RFC v6.5-rc2 2/3] fs: lockd: fix race in async
 lock request handling
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

This patch fixes a race in async lock request handling between adding
the relevant struct nlm_block to nlm_blocked list after the request was
sent by vfs_lock_file() and nlmsvc_grant_deferred() does a lookup of the
nlm_block in the nlm_blocked list. It could be that the async request is
completed before the nlm_block was added to the list. This would end
in a -ENOENT and a kernel log message of "lockd: grant for unknown
block".

To solve this issue we add the nlm_block before the vfs_lock_file() call
to be sure it has been added when a possible nlmsvc_grant_deferred() is
called. If the vfs_lock_file() results in an case when it wouldn't be
added to nlm_blocked list, the nlm_block struct will be removed from
this list again.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/lockd/svclock.c          | 80 +++++++++++++++++++++++++++----------
 include/linux/lockd/lockd.h |  1 +
 2 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
index 28abec5c451d..62ef27a69a9e 100644
--- a/fs/lockd/svclock.c
+++ b/fs/lockd/svclock.c
@@ -297,6 +297,8 @@ static void nlmsvc_free_block(struct kref *kref)
 
 	dprintk("lockd: freeing block %p...\n", block);
 
+	WARN_ON_ONCE(block->b_flags & B_PENDING_CALLBACK);
+
 	/* Remove block from file's list of blocks */
 	list_del_init(&block->b_flist);
 	mutex_unlock(&file->f_mutex);
@@ -543,6 +545,12 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
 		goto out;
 	}
 
+	if (block->b_flags & B_PENDING_CALLBACK)
+		goto pending_request;
+
+	/* Append to list of blocked */
+	nlmsvc_insert_block(block, NLM_NEVER);
+
 	if (!wait)
 		lock->fl.fl_flags &= ~FL_SLEEP;
 	mode = lock_to_openmode(&lock->fl);
@@ -552,9 +560,13 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
 	dprintk("lockd: vfs_lock_file returned %d\n", error);
 	switch (error) {
 		case 0:
+			nlmsvc_remove_block(block);
 			ret = nlm_granted;
 			goto out;
 		case -EAGAIN:
+			if (!wait)
+				nlmsvc_remove_block(block);
+pending_request:
 			/*
 			 * If this is a blocking request for an
 			 * already pending lock request then we need
@@ -565,6 +577,8 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
 			ret = async_block ? nlm_lck_blocked : nlm_lck_denied;
 			goto out;
 		case FILE_LOCK_DEFERRED:
+			block->b_flags |= B_PENDING_CALLBACK;
+
 			if (wait)
 				break;
 			/* Filesystem lock operation is in progress
@@ -572,17 +586,16 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
 			ret = nlmsvc_defer_lock_rqst(rqstp, block);
 			goto out;
 		case -EDEADLK:
+			nlmsvc_remove_block(block);
 			ret = nlm_deadlock;
 			goto out;
 		default:			/* includes ENOLCK */
+			nlmsvc_remove_block(block);
 			ret = nlm_lck_denied_nolocks;
 			goto out;
 	}
 
 	ret = nlm_lck_blocked;
-
-	/* Append to list of blocked */
-	nlmsvc_insert_block(block, NLM_NEVER);
 out:
 	mutex_unlock(&file->f_mutex);
 	nlmsvc_release_block(block);
@@ -739,34 +752,59 @@ nlmsvc_update_deferred_block(struct nlm_block *block, int result)
 		block->b_flags |= B_TIMED_OUT;
 }
 
+static int __nlmsvc_grant_deferred(struct nlm_block *block,
+				   struct file_lock *fl,
+				   int result)
+{
+	int rc = 0;
+
+	dprintk("lockd: nlmsvc_notify_blocked block %p flags %d\n",
+					block, block->b_flags);
+	if (block->b_flags & B_QUEUED) {
+		if (block->b_flags & B_TIMED_OUT) {
+			rc = -ENOLCK;
+			goto out;
+		}
+		nlmsvc_update_deferred_block(block, result);
+	} else if (result == 0)
+		block->b_granted = 1;
+
+	nlmsvc_insert_block_locked(block, 0);
+	svc_wake_up(block->b_daemon);
+out:
+	return rc;
+}
+
 static int nlmsvc_grant_deferred(struct file_lock *fl, int result)
 {
-	struct nlm_block *block;
-	int rc = -ENOENT;
+	struct nlm_block *block = NULL;
+	int rc;
 
 	spin_lock(&nlm_blocked_lock);
 	list_for_each_entry(block, &nlm_blocked, b_list) {
 		if (nlm_compare_locks(&block->b_call->a_args.lock.fl, fl)) {
-			dprintk("lockd: nlmsvc_notify_blocked block %p flags %d\n",
-							block, block->b_flags);
-			if (block->b_flags & B_QUEUED) {
-				if (block->b_flags & B_TIMED_OUT) {
-					rc = -ENOLCK;
-					break;
-				}
-				nlmsvc_update_deferred_block(block, result);
-			} else if (result == 0)
-				block->b_granted = 1;
-
-			nlmsvc_insert_block_locked(block, 0);
-			svc_wake_up(block->b_daemon);
-			rc = 0;
+			kref_get(&block->b_count);
 			break;
 		}
 	}
 	spin_unlock(&nlm_blocked_lock);
-	if (rc == -ENOENT)
-		printk(KERN_WARNING "lockd: grant for unknown block\n");
+
+	if (!block) {
+		pr_warn("lockd: grant for unknown pending block\n");
+		return -ENOENT;
+	}
+
+	/* don't interfere with nlmsvc_lock() */
+	mutex_lock(&block->b_file->f_mutex);
+	block->b_flags &= ~B_PENDING_CALLBACK;
+
+	spin_lock(&nlm_blocked_lock);
+	WARN_ON_ONCE(list_empty(&block->b_list));
+	rc = __nlmsvc_grant_deferred(block, fl, result);
+	spin_unlock(&nlm_blocked_lock);
+	mutex_unlock(&block->b_file->f_mutex);
+
+	nlmsvc_release_block(block);
 	return rc;
 }
 
diff --git a/include/linux/lockd/lockd.h b/include/linux/lockd/lockd.h
index f42594a9efe0..a977be8bcc2c 100644
--- a/include/linux/lockd/lockd.h
+++ b/include/linux/lockd/lockd.h
@@ -189,6 +189,7 @@ struct nlm_block {
 #define B_QUEUED		1	/* lock queued */
 #define B_GOT_CALLBACK		2	/* got lock or conflicting lock */
 #define B_TIMED_OUT		4	/* filesystem too slow to respond */
+#define B_PENDING_CALLBACK	8	/* pending callback for lock request */
 };
 
 /*
-- 
2.31.1

