Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E323B76BC04
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Aug 2023 20:12:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690913532;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2IEoLkEaMOTTF17ZO398BNvn0xY0zlqLNTR0WXzTOxw=;
	b=ZK9sHbw4w7LT2M+95yw8gPcVHVVSHXifJ8IbSfs6YT2hxKJ3d+nvZG+h9F1rQiPW2QdY3Y
	eCwvuRxWl6fTz5RqoafwsVVJuonMEaTx8MlEqmcro3jc/kDTGAyVWHAsBAksHlj+9WUv5n
	25EmqiR/jOzjsiXN9eXlXtEqymtzDS0=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-6Lg0eS7pN6irivVgMJV2yg-1; Tue, 01 Aug 2023 14:12:08 -0400
X-MC-Unique: 6Lg0eS7pN6irivVgMJV2yg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 215943C0F677;
	Tue,  1 Aug 2023 18:12:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15AC040C206F;
	Tue,  1 Aug 2023 18:12:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B36FD1947209;
	Tue,  1 Aug 2023 18:12:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4702E1947209 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  1 Aug 2023 18:09:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BC6CF1121339; Tue,  1 Aug 2023 18:09:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96AFC1121325;
 Tue,  1 Aug 2023 18:09:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  1 Aug 2023 14:09:40 -0400
Message-Id: <20230801180950.3693180-4-aahringo@redhat.com>
In-Reply-To: <20230801180950.3693180-1-aahringo@redhat.com>
References: <20230801180950.3693180-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCHv2 dlm-next 03/13] fs: dlm: debugfs for
 queued callbacks
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

It was useful to debug an issue with the callback queue to check if any
callbacks in any lkb are for some reason not processed by the callback
workqueue. The mentioned issue was fixed by commit a034c1370ded ("fs:
dlm: fix DLM_IFL_CB_PENDING gets overwritten"). If there are similar
issue that looks like a ast callback was not processed, we can confirm
now that it is not sitting to be processed by the callback workqueue
anymore.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/debug_fs.c     | 101 +++++++++++++++++++++++++++++++++++++++++-
 fs/dlm/dlm_internal.h |   1 +
 2 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index a1aca41c49d0..5aabcb6f0f15 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -18,6 +18,7 @@
 #include "dlm_internal.h"
 #include "midcomms.h"
 #include "lock.h"
+#include "ast.h"
 
 #define DLM_DEBUG_BUF_LEN 4096
 static char debug_buf[DLM_DEBUG_BUF_LEN];
@@ -365,6 +366,52 @@ static void print_format4(struct dlm_rsb *r, struct seq_file *s)
 	unlock_rsb(r);
 }
 
+static void print_format5_lock(struct seq_file *s, struct dlm_lkb *lkb)
+{
+	struct dlm_callback *cb;
+
+	/* lkb_id lkb_flags mode flags sb_status sb_flags */
+
+	spin_lock(&lkb->lkb_cb_lock);
+	list_for_each_entry(cb, &lkb->lkb_callbacks, list) {
+		seq_printf(s, "%x %x %d %x %d %x\n",
+			   lkb->lkb_id,
+			   dlm_iflags_val(lkb),
+			   cb->mode,
+			   cb->flags,
+			   cb->sb_status,
+			   cb->sb_flags);
+	}
+	spin_unlock(&lkb->lkb_cb_lock);
+}
+
+static void print_format5(struct dlm_rsb *r, struct seq_file *s)
+{
+	struct dlm_lkb *lkb;
+
+	lock_rsb(r);
+
+	list_for_each_entry(lkb, &r->res_grantqueue, lkb_statequeue) {
+		print_format5_lock(s, lkb);
+		if (seq_has_overflowed(s))
+			goto out;
+	}
+
+	list_for_each_entry(lkb, &r->res_convertqueue, lkb_statequeue) {
+		print_format5_lock(s, lkb);
+		if (seq_has_overflowed(s))
+			goto out;
+	}
+
+	list_for_each_entry(lkb, &r->res_waitqueue, lkb_statequeue) {
+		print_format5_lock(s, lkb);
+		if (seq_has_overflowed(s))
+			goto out;
+	}
+ out:
+	unlock_rsb(r);
+}
+
 struct rsbtbl_iter {
 	struct dlm_rsb *rsb;
 	unsigned bucket;
@@ -408,6 +455,13 @@ static int table_seq_show(struct seq_file *seq, void *iter_ptr)
 		}
 		print_format4(ri->rsb, seq);
 		break;
+	case 5:
+		if (ri->header) {
+			seq_puts(seq, "lkb_id lkb_flags mode flags sb_status sb_flags\n");
+			ri->header = 0;
+		}
+		print_format5(ri->rsb, seq);
+		break;
 	}
 
 	return 0;
@@ -417,6 +471,7 @@ static const struct seq_operations format1_seq_ops;
 static const struct seq_operations format2_seq_ops;
 static const struct seq_operations format3_seq_ops;
 static const struct seq_operations format4_seq_ops;
+static const struct seq_operations format5_seq_ops;
 
 static void *table_seq_start(struct seq_file *seq, loff_t *pos)
 {
@@ -448,6 +503,8 @@ static void *table_seq_start(struct seq_file *seq, loff_t *pos)
 		ri->format = 3;
 	if (seq->op == &format4_seq_ops)
 		ri->format = 4;
+	if (seq->op == &format5_seq_ops)
+		ri->format = 5;
 
 	tree = toss ? &ls->ls_rsbtbl[bucket].toss : &ls->ls_rsbtbl[bucket].keep;
 
@@ -602,10 +659,18 @@ static const struct seq_operations format4_seq_ops = {
 	.show  = table_seq_show,
 };
 
+static const struct seq_operations format5_seq_ops = {
+	.start = table_seq_start,
+	.next  = table_seq_next,
+	.stop  = table_seq_stop,
+	.show  = table_seq_show,
+};
+
 static const struct file_operations format1_fops;
 static const struct file_operations format2_fops;
 static const struct file_operations format3_fops;
 static const struct file_operations format4_fops;
+static const struct file_operations format5_fops;
 
 static int table_open1(struct inode *inode, struct file *file)
 {
@@ -683,7 +748,21 @@ static int table_open4(struct inode *inode, struct file *file)
 	struct seq_file *seq;
 	int ret;
 
-	ret = seq_open(file, &format4_seq_ops);
+	ret = seq_open(file, &format5_seq_ops);
+	if (ret)
+		return ret;
+
+	seq = file->private_data;
+	seq->private = inode->i_private; /* the dlm_ls */
+	return 0;
+}
+
+static int table_open5(struct inode *inode, struct file *file)
+{
+	struct seq_file *seq;
+	int ret;
+
+	ret = seq_open(file, &format5_seq_ops);
 	if (ret)
 		return ret;
 
@@ -725,6 +804,14 @@ static const struct file_operations format4_fops = {
 	.release = seq_release
 };
 
+static const struct file_operations format5_fops = {
+	.owner   = THIS_MODULE,
+	.open    = table_open5,
+	.read    = seq_read,
+	.llseek  = seq_lseek,
+	.release = seq_release
+};
+
 /*
  * dump lkb's on the ls_waiters list
  */
@@ -793,6 +880,7 @@ void dlm_delete_debug_file(struct dlm_ls *ls)
 	debugfs_remove(ls->ls_debug_locks_dentry);
 	debugfs_remove(ls->ls_debug_all_dentry);
 	debugfs_remove(ls->ls_debug_toss_dentry);
+	debugfs_remove(ls->ls_debug_queued_asts_dentry);
 }
 
 static int dlm_state_show(struct seq_file *file, void *offset)
@@ -936,6 +1024,17 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 							  dlm_root,
 							  ls,
 							  &waiters_fops);
+
+	/* format 5 */
+
+	memset(name, 0, sizeof(name));
+	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_queued_asts", ls->ls_name);
+
+	ls->ls_debug_queued_asts_dentry = debugfs_create_file(name,
+							      0644,
+							      dlm_root,
+							      ls,
+							      &format5_fops);
 }
 
 void __init dlm_register_debugfs(void)
diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index c8156770205e..dfc444dad329 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -598,6 +598,7 @@ struct dlm_ls {
 	struct dentry		*ls_debug_locks_dentry; /* debugfs */
 	struct dentry		*ls_debug_all_dentry; /* debugfs */
 	struct dentry		*ls_debug_toss_dentry; /* debugfs */
+	struct dentry		*ls_debug_queued_asts_dentry; /* debugfs */
 
 	wait_queue_head_t	ls_uevent_wait;	/* user part of join/leave */
 	int			ls_uevent_result;
-- 
2.31.1

