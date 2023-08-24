Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D3578799B
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Aug 2023 22:51:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692910315;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zyieofru4f+L086lWgLRxUdew0QSr5yULNgleBFxyJw=;
	b=horaXeX3CbdkRmoc70WJDU2xa3c0l6HoG4pv2O2SVxFv1QkH4nfEiNwjFQYfDSJ8J6urt9
	L7SB3QSU6dLhwrGMVc5NbPh+ZvLUubjX8lNM3WdSgKq+/Ox66NYHJpdGUFmAzbbZ/PUtxx
	VXFNIhQqbaUwq1GHVP4MhsLuasvy7/g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-ZNCOzBHOOqu1GzVlCByBAQ-1; Thu, 24 Aug 2023 16:51:50 -0400
X-MC-Unique: ZNCOzBHOOqu1GzVlCByBAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C72838015AB;
	Thu, 24 Aug 2023 20:51:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD72DC1602B;
	Thu, 24 Aug 2023 20:51:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5BDE519465A8;
	Thu, 24 Aug 2023 20:51:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 14D1A1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 20:51:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DACF240C207D; Thu, 24 Aug 2023 20:51:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A839B40C2073;
 Thu, 24 Aug 2023 20:51:45 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 24 Aug 2023 16:51:42 -0400
Message-Id: <20230824205142.2732984-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH dlm/next] dlm: fix plock lookup when using
 multiple lockspaces
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
Cc: cluster-devel@redhat.com, bmarson@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch fixes an issues when concurrent fcntl() syscalls are
executing on two different gfs2 filesystems. Each gfs2 filesystem
creates an DLM lockspace, it seems that VFS only allows fcntl() syscalls
at one time on a per filesystem basis. However if there are two
filesystems and we executing fcntl() syscalls our lookup mechanism on the
global plock op list does not work anymore.

It can be reproduced with two mounted gfs2 filesystems using DLM
locking. Then call stress-ng --fcntl 32 on each mount point. The kernel
log will show several:

WARNING: CPU: 4 PID: 943 at fs/dlm/plock.c:574 dev_write+0x15c/0x590

because we have a sanity check if it's was really the meant original
plock op when dev_write() does a lookup. This patch adds just a
additional check for fsid to find the right plock op which is an
indicator that the recv_list should be on a per lockspace basis and not
globally defined. After this patch the sanity check never warned again
that the wrong plock op was being looked up.

Cc: stable@vger.kernel.org
Reported-by: Barry Marson <bmarson@redhat.com>
Fixes: 57e2c2f2d94c ("fs: dlm: fix mismatch of plock results from userspace")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 00e1d802a81c..e6b4c1a21446 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -556,7 +556,8 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 		op = plock_lookup_waiter(&info);
 	} else {
 		list_for_each_entry(iter, &recv_list, list) {
-			if (!iter->info.wait) {
+			if (!iter->info.wait &&
+			    iter->info.fsid == info.fsid) {
 				op = iter;
 				break;
 			}
@@ -568,8 +569,7 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 		if (info.wait)
 			WARN_ON(op->info.optype != DLM_PLOCK_OP_LOCK);
 		else
-			WARN_ON(op->info.fsid != info.fsid ||
-				op->info.number != info.number ||
+			WARN_ON(op->info.number != info.number ||
 				op->info.owner != info.owner ||
 				op->info.optype != info.optype);
 
-- 
2.31.1

