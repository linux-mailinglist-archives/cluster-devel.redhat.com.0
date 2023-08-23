Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5087862B7
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Aug 2023 23:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692827177;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pJjn0CQwyqlhlZhAb4qX8Pfq4Wy5CGCCkFzUT+vOXgU=;
	b=g/HfLycZbpXe8Qm40r84cu7V99evEFoUM3uJ/ZVw8pTiu8f8us6HPLw9FG3P0G8eXeg/SR
	BQbxhm3XmdAfl4GHf6aiAyG7Ubd5NYu0sZySlLNfQHv++Ck0LwBdTTcQCEmDIYfOpGyk17
	tTtH1NfauClNkg04OjC9TBVpKCVfAhg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-vzhM8Fn6OCOpaN3JcDHXbQ-1; Wed, 23 Aug 2023 17:46:12 -0400
X-MC-Unique: vzhM8Fn6OCOpaN3JcDHXbQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91BD4857A84;
	Wed, 23 Aug 2023 21:46:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A947C15BAE;
	Wed, 23 Aug 2023 21:46:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E833E194658F;
	Wed, 23 Aug 2023 21:46:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D53F71946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 23 Aug 2023 21:33:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B5BD640C6E8A; Wed, 23 Aug 2023 21:33:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6915D400E02F;
 Wed, 23 Aug 2023 21:33:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: linux-nfs@vger.kernel.org
Date: Wed, 23 Aug 2023 17:33:48 -0400
Message-Id: <20230823213352.1971009-4-aahringo@redhat.com>
In-Reply-To: <20230823213352.1971009-1-aahringo@redhat.com>
References: <20230823213352.1971009-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 3/7] lockd: fix race in async lock request
 handling
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

The introducing of the new B_PENDING_CALLBACK nlm_block flag will handle
async lock requests on a pending lock requests as a retry on the caller
level to hit the -EAGAIN case.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/lockd/svclock.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
index aa4174fbaf5b..3b158446203b 100644
--- a/fs/lockd/svclock.c
+++ b/fs/lockd/svclock.c
@@ -546,6 +546,9 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
 		ret = nlm_lck_blocked;
 		goto out;
 	}
+
+	/* Append to list of blocked */
+	nlmsvc_insert_block_locked(block, NLM_NEVER);
 	spin_unlock(&nlm_blocked_lock);
 
 	if (!wait)
@@ -557,9 +560,12 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
 	dprintk("lockd: vfs_lock_file returned %d\n", error);
 	switch (error) {
 		case 0:
+			nlmsvc_remove_block(block);
 			ret = nlm_granted;
 			goto out;
 		case -EAGAIN:
+			if (!wait)
+				nlmsvc_remove_block(block);
 			ret = async_block ? nlm_lck_blocked : nlm_lck_denied;
 			goto out;
 		case FILE_LOCK_DEFERRED:
@@ -570,17 +576,16 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
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
-- 
2.31.1

