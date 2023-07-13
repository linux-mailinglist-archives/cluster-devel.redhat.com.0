Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 421A475255B
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Jul 2023 16:41:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689259277;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qi8sOM1Fwy6UoMm9AVpPCrwHoOD27cN4FT58wjcPlJw=;
	b=QZaNA9Ii4z9fMj85OS4v4xvmYiTkBAnTJZe79+meBBM0/4Wfu+UppNZlsSVVZk3BwfRO76
	9+W94nnwPu+qTH4AbCWcIFdLLUSkx44lQ9T/2Eg/k7OdMD1unk2qkaq8UWdQXTm7AM/ebh
	YV07RX2EtmVge7NLUp9vQr9vHffJIDs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-OdokkLfHNDKmU6yEPqfh6w-1; Thu, 13 Jul 2023 10:41:13 -0400
X-MC-Unique: OdokkLfHNDKmU6yEPqfh6w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D33B905948;
	Thu, 13 Jul 2023 14:40:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 81D4C492B03;
	Thu, 13 Jul 2023 14:40:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2D09D19465B7;
	Thu, 13 Jul 2023 14:40:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F2E461946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Jul 2023 14:40:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D3BF64CD0CE; Thu, 13 Jul 2023 14:40:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0705492C13;
 Thu, 13 Jul 2023 14:40:47 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 13 Jul 2023 10:40:28 -0400
Message-Id: <20230713144029.3342637-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH v6.5-rc1 1/2] fs: dlm: introduce
 DLM_PLOCK_FL_NO_REPLY flag
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

This patch introduces a new flag DLM_PLOCK_FL_NO_REPLY in case an dlm
plock operation should not send a reply back. Currently this is kind of
being handled in DLM_PLOCK_FL_CLOSE, but DLM_PLOCK_FL_CLOSE has more
meanings that it will remove all waiters for a specific nodeid/owner
values in by doing a unlock operation. In case of an error in dlm user
space software e.g. dlm_controld we get an reply with an error back.
This cannot be matched because there is no op to match in recv_list. We
filter now on DLM_PLOCK_FL_NO_REPLY in case we had an error back as
reply. In newer dlm_controld version it will never send a result back
when DLM_PLOCK_FL_NO_REPLY is set. This filter is a workaround to handle
older dlm_controld versions.

Fixes: 901025d2f319 ("dlm: make plock operation killable")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c                 | 23 +++++++++++++++++++----
 include/uapi/linux/dlm_plock.h |  1 +
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 70a4752ed913..7fe9f4b922d3 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -96,7 +96,7 @@ static void do_unlock_close(const struct dlm_plock_info *info)
 	op->info.end		= OFFSET_MAX;
 	op->info.owner		= info->owner;
 
-	op->info.flags |= DLM_PLOCK_FL_CLOSE;
+	op->info.flags |= (DLM_PLOCK_FL_CLOSE | DLM_PLOCK_FL_NO_REPLY);
 	send_op(op);
 }
 
@@ -293,7 +293,7 @@ int dlm_posix_unlock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 		op->info.owner	= (__u64)(long) fl->fl_owner;
 
 	if (fl->fl_flags & FL_CLOSE) {
-		op->info.flags |= DLM_PLOCK_FL_CLOSE;
+		op->info.flags |= (DLM_PLOCK_FL_CLOSE | DLM_PLOCK_FL_NO_REPLY);
 		send_op(op);
 		rv = 0;
 		goto out;
@@ -392,7 +392,7 @@ static ssize_t dev_read(struct file *file, char __user *u, size_t count,
 	spin_lock(&ops_lock);
 	if (!list_empty(&send_list)) {
 		op = list_first_entry(&send_list, struct plock_op, list);
-		if (op->info.flags & DLM_PLOCK_FL_CLOSE)
+		if (op->info.flags & DLM_PLOCK_FL_NO_REPLY)
 			list_del(&op->list);
 		else
 			list_move_tail(&op->list, &recv_list);
@@ -407,7 +407,7 @@ static ssize_t dev_read(struct file *file, char __user *u, size_t count,
 	   that were generated by the vfs cleaning up for a close
 	   (the process did not make an unlock call). */
 
-	if (op->info.flags & DLM_PLOCK_FL_CLOSE)
+	if (op->info.flags & DLM_PLOCK_FL_NO_REPLY)
 		dlm_release_plock_op(op);
 
 	if (copy_to_user(u, &info, sizeof(info)))
@@ -433,6 +433,21 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 	if (check_version(&info))
 		return -EINVAL;
 
+	/* Some old dlm user space software will send replies back,
+	 * even if DLM_PLOCK_FL_NO_REPLY is set (because the flag is
+	 * new) e.g. if a error occur. We can't match them in recv_list
+	 * because they were never be part of it. We filter it here,
+	 * new dlm user space software will filter it in user space.
+	 *
+	 * In future this handling can be removed.
+	 */
+	if (info.flags & DLM_PLOCK_FL_NO_REPLY) {
+		pr_info("Received unexpected reply from op %d, "
+			"please update DLM user space software!\n",
+			info.optype);
+		return count;
+	}
+
 	/*
 	 * The results for waiting ops (SETLKW) can be returned in any
 	 * order, so match all fields to find the op.  The results for
diff --git a/include/uapi/linux/dlm_plock.h b/include/uapi/linux/dlm_plock.h
index 63b6c1fd9169..8dfa272c929a 100644
--- a/include/uapi/linux/dlm_plock.h
+++ b/include/uapi/linux/dlm_plock.h
@@ -25,6 +25,7 @@ enum {
 };
 
 #define DLM_PLOCK_FL_CLOSE 1
+#define DLM_PLOCK_FL_NO_REPLY 2
 
 struct dlm_plock_info {
 	__u32 version[3];
-- 
2.31.1

