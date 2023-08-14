Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7791877C223
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Aug 2023 23:11:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692047492;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/wqENBbj5y41JI93zB5OgbUzN7ReqPGhx+L0gn4tfM8=;
	b=UOQJRN8CLMdRHOcPGIwjK7TLSZEg7ZJa+RuKc2HCo9zDtv+FaGvl3awTYAZJQZTcMVw8Xl
	jHI4IJnqyHXr0RD4G5I7vr97q0ntsSMPvPmmtKKkGvOW8czAx/yFQKNIefpFFzCcm0vF/4
	VKpwiWsgCKFxqkMlnxHG7nw9bkPICM8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-9Sf3MbVOP72SvE1MJBbe_A-1; Mon, 14 Aug 2023 17:11:28 -0400
X-MC-Unique: 9Sf3MbVOP72SvE1MJBbe_A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6777D185A78F;
	Mon, 14 Aug 2023 21:11:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24AA3401E6A;
	Mon, 14 Aug 2023 21:11:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DFD3E1946594;
	Mon, 14 Aug 2023 21:11:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B614E1946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 14 Aug 2023 21:11:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9982BC15BB8; Mon, 14 Aug 2023 21:11:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A510C15BAD;
 Mon, 14 Aug 2023 21:11:23 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: linux-nfs@vger.kernel.org
Date: Mon, 14 Aug 2023 17:11:13 -0400
Message-Id: <20230814211116.3224759-5-aahringo@redhat.com>
In-Reply-To: <20230814211116.3224759-1-aahringo@redhat.com>
References: <20230814211116.3224759-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [RFCv2 4/7] locks: update lock callback
 documentation
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

This patch updates the existing documentation regarding recent changes
to vfs_lock_file() and lm_grant() is set. In case of lm_grant() is set
we only handle FILE_LOCK_DEFERRED in case of FL_SLEEP in fl_flags is not
set. This is the case of an blocking lock request. Non-blocking lock
requests, when FL_SLEEP is not set, are handled in a synchronized way.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/locks.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/locks.c b/fs/locks.c
index df8b26a42524..a8e51f462b43 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -2255,21 +2255,21 @@ int fcntl_getlk(struct file *filp, unsigned int cmd, struct flock *flock)
  * To avoid blocking kernel daemons, such as lockd, that need to acquire POSIX
  * locks, the ->lock() interface may return asynchronously, before the lock has
  * been granted or denied by the underlying filesystem, if (and only if)
- * lm_grant is set. Callers expecting ->lock() to return asynchronously
- * will only use F_SETLK, not F_SETLKW; they will set FL_SLEEP if (and only if)
- * the request is for a blocking lock. When ->lock() does return asynchronously,
- * it must return FILE_LOCK_DEFERRED, and call ->lm_grant() when the lock
- * request completes.
- * If the request is for non-blocking lock the file system should return
- * FILE_LOCK_DEFERRED then try to get the lock and call the callback routine
- * with the result. If the request timed out the callback routine will return a
+ * lm_grant and FL_SLEEP in fl_flags is set. Callers expecting ->lock() to return
+ * asynchronously will only use F_SETLK, not F_SETLKW; When ->lock() does return
+ * asynchronously, it must return FILE_LOCK_DEFERRED, and call ->lm_grant() when
+ * the lock request completes. The lm_grant() callback must be called in a
+ * sleepable context.
+ *
+ * If the request timed out the ->lm_grant() callback routine will return a
  * nonzero return code and the file system should release the lock. The file
- * system is also responsible to keep a corresponding posix lock when it
- * grants a lock so the VFS can find out which locks are locally held and do
- * the correct lock cleanup when required.
- * The underlying filesystem must not drop the kernel lock or call
- * ->lm_grant() before returning to the caller with a FILE_LOCK_DEFERRED
- * return code.
+ * system is also responsible to keep a corresponding posix lock when it grants
+ * a lock so the VFS can find out which locks are locally held and do the correct
+ * lock cleanup when required.
+ *
+ * If the request is for non-blocking lock (when F_SETLK and FL_SLEEP in fl_flags is not set)
+ * the file system should return -EAGAIN if failed to acquire or zero if acquiring was
+ * successfully without calling the ->lm_grant() callback routine.
  */
 int vfs_lock_file(struct file *filp, unsigned int cmd, struct file_lock *fl, struct file_lock *conf)
 {
-- 
2.31.1

