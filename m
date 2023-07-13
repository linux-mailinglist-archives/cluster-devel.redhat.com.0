Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F348275290C
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Jul 2023 18:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689266950;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rPQCRmRZHA8zWTxe2Vh/VZ6/UYSN4ePaycOGmRaOOLI=;
	b=didx43lKdSfQXlE5VI+wxuHXKBqLi1nmdwrCc0lE19mlwQFY+Lxy44xcUnPdh2a92q8zqQ
	OeErOxjyV/QP49KElznhw2YJBHpgW41kts+6x9Jr9t3IBfbAzUjQ+gwAaVWVvrNrwlq2zX
	MN7Nvg97ZBDKGLYqAiH8KqlnL8ZI+mE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-cIQ-ucmlOp2c-52aGye8JQ-1; Thu, 13 Jul 2023 12:49:09 -0400
X-MC-Unique: cIQ-ucmlOp2c-52aGye8JQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5955E185A78F;
	Thu, 13 Jul 2023 16:49:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1318440C2063;
	Thu, 13 Jul 2023 16:49:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 82C9C19465A0;
	Thu, 13 Jul 2023 16:49:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BB78C1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Jul 2023 16:49:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AAF222166B2A; Thu, 13 Jul 2023 16:49:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AC522166B26;
 Thu, 13 Jul 2023 16:49:02 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 13 Jul 2023 12:48:37 -0400
Message-Id: <20230713164838.3583052-3-aahringo@redhat.com>
In-Reply-To: <20230713164838.3583052-1-aahringo@redhat.com>
References: <20230713164838.3583052-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCHv2 v6.5-rc1 2/3] fs: dlm: introduce
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch introduces a new flag DLM_PLOCK_FL_NO_REPLY in case an dlm
plock operation should never send a reply back. Currently this is kind of
being handled in DLM_PLOCK_FL_CLOSE, but DLM_PLOCK_FL_CLOSE has more
meanings that it will remove all waiters for a specific nodeid/owner
values in by doing a unlock operation. That DLM_PLOCK_FL_CLOSE never
sends a reply back is not true in case of some user applications and
an error occurred. The new DLM_PLOCK_FL_NO_REPLY flag will tell the
user space application to never ever send a reply back. As this is
now combined with DLM_PLOCK_FL_CLOSE we can use DLM_PLOCK_FL_NO_REPLY to
check if older user space application still doing it and drop the message.

Expecting the user space applications is just copying flags from the
request to the reply, we can use now DLM_PLOCK_FL_NO_REPLY as workaround
to ignore replies from older dlm_controld versions.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c                 | 16 ++++++++++------
 include/uapi/linux/dlm_plock.h |  1 +
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index 869595a995f7..1fa5b04d0298 100644
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
@@ -434,11 +434,15 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 		return -EINVAL;
 
 	/* Some dlm user space software will send replies back,
-	 * even if DLM_PLOCK_FL_CLOSE is set e.g. if an error occur.
+	 * even if DLM_PLOCK_FL_NO_REPLY is set e.g. if an error
+	 * occur as the op is unknown, etc.
+	 *
 	 * We can't match them in recv_list because they were never
 	 * be part of it.
+	 *
+	 * In the future, this handling could be removed.
 	 */
-	if (info.flags & DLM_PLOCK_FL_CLOSE)
+	if (info.flags & DLM_PLOCK_FL_NO_REPLY)
 		return count;
 
 	/*
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

