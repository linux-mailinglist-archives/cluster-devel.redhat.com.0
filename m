Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8881F70FB44
	for <lists+cluster-devel@lfdr.de>; Wed, 24 May 2023 18:02:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684944151;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XW1novp52ntIBjNj6iBlsvszgbkCVEAxRTPQxoEFBPE=;
	b=aBR25jBB0DaSxhXjZd60f+ycfhw84plOhNosn5+vVWUQdF0ohC92Ku7FJ+29Oj7QuFZuzE
	rEFzeTKnaZlsG8SAxvYWmBxUI6zNEPBBIf2DNsbTB2kJS9cpr8effIES7lRsBPuhTvtOkq
	CaKHV6UP1sbS4BF+XRJDjkm1LRlVyq8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-nAKA9rwnP8avxKfsdZrrlQ-1; Wed, 24 May 2023 12:02:28 -0400
X-MC-Unique: nAKA9rwnP8avxKfsdZrrlQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B61C185A78B;
	Wed, 24 May 2023 16:02:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88CD8482060;
	Wed, 24 May 2023 16:02:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2A83719465B3;
	Wed, 24 May 2023 16:02:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0682419465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 24 May 2023 16:02:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E7FD7112131B; Wed, 24 May 2023 16:02:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7C3B1121314;
 Wed, 24 May 2023 16:02:24 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 24 May 2023 12:02:04 -0400
Message-Id: <20230524160204.1042858-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCHv2 dlm/next] fs: dlm: avoid F_SETLKW plock op
 lookup collisions
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch fixes a possible plock op collisions when using F_SETLKW lock
requests and fsid, number and owner are not enough to identify a result
for a pending request. The ltp testcases [0] and [1] are examples when
this is not enough in case of using classic posix locks with threads and
open filedescriptor posix locks.

The idea to fix the issue here is to place all lock request in order. In
case of non F_SETLKW lock request (indicated if wait is set or not) the
lock requests are ordered inside the recv_list. If a result comes back
the right plock op can be found by the first plock_op in recv_list which
has not info.wait set. This can be done only by non F_SETLKW plock ops as
dlm_controld always reads a specific plock op (list_move_tail() from
send_list to recv_mlist) and write the result immediately back.

This behaviour is for F_SETLKW not possible as multiple waiters can be
get a result back in an random order. To avoid a collisions in cases
like [0] or [1] this patch adds more fields to compare the plock
operations as the lock request is the same. This is also being made in
NFS to find an result for an asynchronous F_SETLKW lock request [2][3]. We
still can't find the exact lock request for a specific result if the
lock request is the same, but if this is the case we don't care the
order how the identical lock requests get their result back to grant the
lock.

[0] https://gitlab.com/netcoder/ltp/-/blob/dlm_fcntl_owner_testcase/testcases/kernel/syscalls/fcntl/fcntl40.c
[1] https://gitlab.com/netcoder/ltp/-/blob/dlm_fcntl_owner_testcase/testcases/kernel/syscalls/fcntl/fcntl41.c
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/lockd/lockd.h?h=v6.4-rc1#n373
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/lockd/svclock.c?h=v6.4-rc1#n731

Cc: stable@vger.kernel.org
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
change since v2:
 - don't split recv_list into recv_setlkw_list

 fs/dlm/plock.c | 43 ++++++++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 31bc601ee3d8..53d17dbbb716 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -391,7 +391,7 @@ static ssize_t dev_read(struct file *file, char __user *u, size_t count,
 		if (op->info.flags & DLM_PLOCK_FL_CLOSE)
 			list_del(&op->list);
 		else
-			list_move(&op->list, &recv_list);
+			list_move_tail(&op->list, &recv_list);
 		memcpy(&info, &op->info, sizeof(info));
 	}
 	spin_unlock(&ops_lock);
@@ -430,19 +430,36 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 		return -EINVAL;
 
 	spin_lock(&ops_lock);
-	list_for_each_entry(iter, &recv_list, list) {
-		if (iter->info.fsid == info.fsid &&
-		    iter->info.number == info.number &&
-		    iter->info.owner == info.owner) {
-			list_del_init(&iter->list);
-			memcpy(&iter->info, &info, sizeof(info));
-			if (iter->data)
-				do_callback = 1;
-			else
-				iter->done = 1;
-			op = iter;
-			break;
+	if (info.wait) {
+		list_for_each_entry(iter, &recv_list, list) {
+			if (iter->info.fsid == info.fsid &&
+			    iter->info.number == info.number &&
+			    iter->info.owner == info.owner &&
+			    iter->info.pid == info.pid &&
+			    iter->info.start == info.start &&
+			    iter->info.end == info.end &&
+			    iter->info.ex == info.ex &&
+			    iter->info.wait) {
+				op = iter;
+				break;
+			}
 		}
+	} else {
+		list_for_each_entry(iter, &recv_list, list) {
+			if (!iter->info.wait) {
+				op = iter;
+				break;
+			}
+		}
+	}
+
+	if (op) {
+		list_del_init(&op->list);
+		memcpy(&op->info, &info, sizeof(info));
+		if (op->data)
+			do_callback = 1;
+		else
+			op->done = 1;
 	}
 	spin_unlock(&ops_lock);
 
-- 
2.31.1

