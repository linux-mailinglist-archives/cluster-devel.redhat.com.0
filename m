Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E056D7862AC
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Aug 2023 23:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692826811;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=htB9ruBs/M3gzRN+MQhu18/VcxVtJfis4P4SxexSrGE=;
	b=Ed/c9dO5Ify4n0aObssHdABNEMcHdiMQXBNdE9i2Wq1Y5o7g2rY3W0QgdMGctNw/kihcRh
	DgYdS5gtfrTvNJeY7Oy8/8VaoKwOX49CBqytaGZhadMyzNGrbI0jKE9SCEfBjCYr7oGZ4g
	vd04QoOQ3Rzch9KnJkyGl/Yp7gpHSzo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-ET8G3kgJNyeIZBaPfNSa6A-1; Wed, 23 Aug 2023 17:40:08 -0400
X-MC-Unique: ET8G3kgJNyeIZBaPfNSa6A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFA76858EED;
	Wed, 23 Aug 2023 21:40:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C9F42166B27;
	Wed, 23 Aug 2023 21:40:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 424D1194658F;
	Wed, 23 Aug 2023 21:40:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 89E0F1946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 23 Aug 2023 21:33:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 63A2540C6F4E; Wed, 23 Aug 2023 21:33:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1971640C6F4C;
 Wed, 23 Aug 2023 21:33:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: linux-nfs@vger.kernel.org
Date: Wed, 23 Aug 2023 17:33:47 -0400
Message-Id: <20230823213352.1971009-3-aahringo@redhat.com>
In-Reply-To: <20230823213352.1971009-1-aahringo@redhat.com>
References: <20230823213352.1971009-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 2/7] lockd: don't call vfs_lock_file() for
 pending requests
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch returns nlm_lck_blocked in nlmsvc_lock() when an asynchronous
lock request is pending. During testing I ran into the case with the
side-effects that lockd is waiting for only one lm_grant() callback
because it's already part of the nlm_blocked list. If another
asynchronous for the same nlm_block is triggered two lm_grant()
callbacks will occur but lockd was only waiting for one.

To avoid any change of existing users this handling will only being made
when export_op_support_safe_async_lock() returns true.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/lockd/svclock.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
index 6e3b230e8317..aa4174fbaf5b 100644
--- a/fs/lockd/svclock.c
+++ b/fs/lockd/svclock.c
@@ -531,6 +531,23 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
 		goto out;
 	}
 
+	spin_lock(&nlm_blocked_lock);
+	/*
+	 * If this is a lock request for an already pending
+	 * lock request we return nlm_lck_blocked without calling
+	 * vfs_lock_file() again. Otherwise we have two pending
+	 * requests on the underlaying ->lock() implementation but
+	 * only one nlm_block to being granted by lm_grant().
+	 */
+	if (export_op_support_safe_async_lock(inode->i_sb->s_export_op,
+					      nlmsvc_file_file(file)->f_op) &&
+	    !list_empty(&block->b_list)) {
+		spin_unlock(&nlm_blocked_lock);
+		ret = nlm_lck_blocked;
+		goto out;
+	}
+	spin_unlock(&nlm_blocked_lock);
+
 	if (!wait)
 		lock->fl.fl_flags &= ~FL_SLEEP;
 	mode = lock_to_openmode(&lock->fl);
@@ -543,13 +560,6 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
 			ret = nlm_granted;
 			goto out;
 		case -EAGAIN:
-			/*
-			 * If this is a blocking request for an
-			 * already pending lock request then we need
-			 * to put it back on lockd's block list
-			 */
-			if (wait)
-				break;
 			ret = async_block ? nlm_lck_blocked : nlm_lck_denied;
 			goto out;
 		case FILE_LOCK_DEFERRED:
-- 
2.31.1

