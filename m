Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B68C6786261
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Aug 2023 23:34:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692826488;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a6joEGKWnnjVY5UbKUjhUBMyK3LpAKMDMx1lRCkXV9w=;
	b=GbYlLqq4N4dgjCCSpXhLakd4oc+nEd2F49w96zeKKmoPRO8GaU4LBISmoCbREJilBXVm5a
	iAfg/CH8wujr2VzP4GKWUkm6Od1TKRwBtEGS0fY30DxsYyXP5XprN90F+IE8TqDS+hG9sc
	ihvJF74ezOicvdOWwhB6FE95qY5OMh8=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-EubjAWMOM8-5IfMQMbKXMQ-1; Wed, 23 Aug 2023 17:34:43 -0400
X-MC-Unique: EubjAWMOM8-5IfMQMbKXMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08ACA1C05122;
	Wed, 23 Aug 2023 21:34:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F062B40C6F4C;
	Wed, 23 Aug 2023 21:34:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B89201946594;
	Wed, 23 Aug 2023 21:34:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 403651946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 23 Aug 2023 21:33:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 10DF240C6F4E; Wed, 23 Aug 2023 21:33:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA62040C6F4C;
 Wed, 23 Aug 2023 21:33:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: linux-nfs@vger.kernel.org
Date: Wed, 23 Aug 2023 17:33:49 -0400
Message-Id: <20230823213352.1971009-5-aahringo@redhat.com>
In-Reply-To: <20230823213352.1971009-1-aahringo@redhat.com>
References: <20230823213352.1971009-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 4/7] lockd: add doc to enable
 EXPORT_OP_SAFE_ASYNC_LOCK
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds a note to enable EXPORT_OP_SAFE_ASYNC_LOCK for
asynchronous lock request handling.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/locks.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/locks.c b/fs/locks.c
index df8b26a42524..edee02d1ca93 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -2255,11 +2255,13 @@ int fcntl_getlk(struct file *filp, unsigned int cmd, struct flock *flock)
  * To avoid blocking kernel daemons, such as lockd, that need to acquire POSIX
  * locks, the ->lock() interface may return asynchronously, before the lock has
  * been granted or denied by the underlying filesystem, if (and only if)
- * lm_grant is set. Callers expecting ->lock() to return asynchronously
- * will only use F_SETLK, not F_SETLKW; they will set FL_SLEEP if (and only if)
- * the request is for a blocking lock. When ->lock() does return asynchronously,
- * it must return FILE_LOCK_DEFERRED, and call ->lm_grant() when the lock
- * request completes.
+ * lm_grant is set. Additionally EXPORT_OP_SAFE_ASYNC_LOCK in export_operations
+ * flags need to be set.
+ *
+ * Callers expecting ->lock() to return asynchronously will only use F_SETLK,
+ * not F_SETLKW; they will set FL_SLEEP if (and only if) the request is for a
+ * blocking lock. When ->lock() does return asynchronously, it must return
+ * FILE_LOCK_DEFERRED, and call ->lm_grant() when the lock request completes.
  * If the request is for non-blocking lock the file system should return
  * FILE_LOCK_DEFERRED then try to get the lock and call the callback routine
  * with the result. If the request timed out the callback routine will return a
-- 
2.31.1

