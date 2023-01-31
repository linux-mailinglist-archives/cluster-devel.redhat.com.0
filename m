Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 529216820DF
	for <lists+cluster-devel@lfdr.de>; Tue, 31 Jan 2023 01:40:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675125612;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L/+u9rDhIsa6c4NpELmfi/pWJDOmcgK2r/h91cCeBhk=;
	b=B5zrI6kM9gqQ6WkjJ1joScvBfCXxzypMVjPyZ0mOZ95MmTxxlm4P5wwhTuEhenKO7Vl8S0
	HJ4Ye+wkvpiwJcKcu11QUGfSx8mFUMl8QNS0PZeqQdRvGrWuU/4xK9aeLJU76FTbrRm+3q
	S+ERkCZ8xo1fTOQcaXSNt+FGbGwsU9o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-vC4JsslaMbqmIiYC25kRsw-1; Mon, 30 Jan 2023 19:40:07 -0500
X-MC-Unique: vC4JsslaMbqmIiYC25kRsw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDE1A887402;
	Tue, 31 Jan 2023 00:40:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7EE3B40C2064;
	Tue, 31 Jan 2023 00:40:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6050F1946594;
	Tue, 31 Jan 2023 00:40:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9CCF31946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 31 Jan 2023 00:40:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8757F145D823; Tue, 31 Jan 2023 00:40:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 612B3140EBF6;
 Tue, 31 Jan 2023 00:40:04 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 30 Jan 2023 19:40:03 -0500
Message-Id: <20230131004003.3764850-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCHv2 dlm/next] fs: dlm: log plock operation time
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds more debug logging regarding to plock operation time.
Currently plocks are handled by user space and we are waiting for a
reply of the user space. To measure this upcall and downcall again we
introduce logging information of how much time the response took and
additional posix lock information to make a match with the user space
application.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
changes since v2:

instead using owner we printout the pid taken from
fl->fl_pid which is necessary to match with userspace
application such as dlm_controld logging.

 fs/dlm/plock.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 737f185aad8d..d3115d66eece 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -175,6 +175,13 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 		goto out;
 	}
 
+	log_debug(ls, "%s: op wait done %d %d %d %x %llx %llx-%llx %d %u",
+		  __func__, fl->fl_pid, fl->fl_type, cmd,
+		  ls->ls_global_id, (unsigned long long)number,
+		  (unsigned long long)fl->fl_start,
+		  (unsigned long long)fl->fl_end,
+		  op->info.rv, jiffies_to_usecs(rv));
+
 do_lock_wait:
 
 	WARN_ON(!list_empty(&op->list));
@@ -252,6 +259,7 @@ int dlm_posix_unlock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 	struct plock_op *op;
 	int rv;
 	unsigned char fl_flags = fl->fl_flags;
+	unsigned long t;
 
 	ls = dlm_find_lockspace_local(lockspace);
 	if (!ls)
@@ -295,8 +303,16 @@ int dlm_posix_unlock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 	}
 
 	send_op(op);
+	t = jiffies;
 	wait_event(recv_wq, (op->done != 0));
 
+	log_debug(ls, "%s: op wait done %d %d %x %llx %llx-%llx %d %u",
+		  __func__, fl->fl_pid, fl->fl_type,
+		  ls->ls_global_id, (unsigned long long)number,
+		  (unsigned long long)fl->fl_start,
+		  (unsigned long long)fl->fl_end,
+		  op->info.rv, jiffies_to_usecs(jiffies - t));
+
 	WARN_ON(!list_empty(&op->list));
 
 	rv = op->info.rv;
@@ -318,6 +334,7 @@ int dlm_posix_get(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 {
 	struct dlm_ls *ls;
 	struct plock_op *op;
+	unsigned long t;
 	int rv;
 
 	ls = dlm_find_lockspace_local(lockspace);
@@ -343,8 +360,16 @@ int dlm_posix_get(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 		op->info.owner	= (__u64)(long) fl->fl_owner;
 
 	send_op(op);
+	t = jiffies;
 	wait_event(recv_wq, (op->done != 0));
 
+	log_debug(ls, "%s: op wait done %d %d %x %llx %llx-%llx %d %u",
+		  __func__, fl->fl_pid, fl->fl_type,
+		  ls->ls_global_id, (unsigned long long)number,
+		  (unsigned long long)fl->fl_start,
+		  (unsigned long long)fl->fl_end,
+		  op->info.rv, jiffies_to_usecs(jiffies - t));
+
 	WARN_ON(!list_empty(&op->list));
 
 	/* info.rv from userspace is 1 for conflict, 0 for no-conflict,
-- 
2.31.1

