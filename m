Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3021043CDA3
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Oct 2021 17:34:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635348856;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Fa8SCnIhDvIkqTF6jNbyV3le+qR773mu4x5rDVxrEbA=;
	b=FVDPYTzNGqEqys64uhypTw8yNtvRK6vgyOaMXs6Xwv9Q4EZSqscln+geYk0IirgvmwhN2G
	NfyCAbAHLkFF9MQiyWyk+B4UTc7hqes4mbWCJ3gOj+97k2FALhxvrn93s/daSA9ERVHAOw
	QUvO/Oi/Nhuc/71WUbK44wI7rizX408=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-n4ujtzzpP6KxaJTPH7TXdA-1; Wed, 27 Oct 2021 11:34:13 -0400
X-MC-Unique: n4ujtzzpP6KxaJTPH7TXdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E809E80A5C3;
	Wed, 27 Oct 2021 15:34:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D904B100E12D;
	Wed, 27 Oct 2021 15:34:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DD634EA3C;
	Wed, 27 Oct 2021 15:34:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19RFNqQq009203 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Oct 2021 11:23:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0681F1042AEF; Wed, 27 Oct 2021 15:23:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9CDD10429D2;
	Wed, 27 Oct 2021 15:23:51 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 27 Oct 2021 11:23:20 -0400
Message-Id: <20211027152322.3236492-7-aahringo@redhat.com>
In-Reply-To: <20211027152322.3236492-1-aahringo@redhat.com>
References: <20211027152322.3236492-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 6/8] fs: dlm: add lkb debugfs
	functionality
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds functionality to add an lkb during runtime. This is a
highly debugging feature only, wrong input can crash the kernel. It is a
early state feature as well. The goal is to provide a user interface for
manipulate dlm state and combine it with the rawmsg feature. It is
debugfs functionality, we don't care about UAPI breakage. Even it's
possible to add lkb's/rsb's which could never be exists in such wat by
using normal DLM operation. The user of this interface always need to
think before using this feature, not every crash which happens can really
occur during normal dlm operation.

Future there should be more functionality to add a more realistic lkb
which reflects normal DLM state inside the kernel. For now this is
enough.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/debug_fs.c | 32 +++++++++++++++++++++++++++++++-
 fs/dlm/lock.c     | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/dlm/lock.h     |  2 ++
 3 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 555904eeea8e..2ead4751d655 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -635,6 +635,35 @@ static int table_open2(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static ssize_t table_write2(struct file *file, const char __user *user_buf,
+			    size_t count, loff_t *ppos)
+{
+	struct seq_file *seq = file->private_data;
+	int n, len, lkb_nodeid, lkb_status, error;
+	char name[DLM_RESNAME_MAXLEN] = {};
+	struct dlm_ls *ls = seq->private;
+	unsigned int lkb_flags;
+	char buf[256] = {};
+	uint32_t lkb_id;
+
+	if (copy_from_user(buf, user_buf,
+			   min_t(size_t, sizeof(buf) - 1, count)))
+		return -EFAULT;
+
+	n = sscanf(buf, "%x %" __stringify(DLM_RESNAME_MAXLEN) "s %x %d %d",
+		   &lkb_id, name, &lkb_flags, &lkb_nodeid, &lkb_status);
+	if (n != 5)
+		return -EINVAL;
+
+	len = strnlen(name, DLM_RESNAME_MAXLEN);
+	error = dlm_debug_add_lkb(ls, lkb_id, name, len, lkb_flags,
+				  lkb_nodeid, lkb_status);
+	if (error)
+		return error;
+
+	return count;
+}
+
 static int table_open3(struct inode *inode, struct file *file)
 {
 	struct seq_file *seq;
@@ -675,6 +704,7 @@ static const struct file_operations format2_fops = {
 	.owner   = THIS_MODULE,
 	.open    = table_open2,
 	.read    = seq_read,
+	.write   = table_write2,
 	.llseek  = seq_lseek,
 	.release = seq_release
 };
@@ -846,7 +876,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_locks", ls->ls_name);
 
 	ls->ls_debug_locks_dentry = debugfs_create_file(name,
-							S_IFREG | S_IRUGO,
+							0644,
 							dlm_root,
 							ls,
 							&format2_fops);
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 5f3c2c6bca8c..c10973230f94 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -6307,3 +6307,49 @@ int dlm_user_purge(struct dlm_ls *ls, struct dlm_user_proc *proc,
 	return error;
 }
 
+/* debug functionality */
+int dlm_debug_add_lkb(struct dlm_ls *ls, uint32_t lkb_id, char *name, int len,
+		      int lkb_nodeid, unsigned int lkb_flags, int lkb_status)
+{
+	struct dlm_lksb *lksb;
+	struct dlm_lkb *lkb;
+	struct dlm_rsb *r;
+	int error;
+
+	/* we currently can't set a valid user lock */
+	if (lkb_flags & DLM_IFL_USER)
+		return -EOPNOTSUPP;
+
+	lksb = kzalloc(sizeof(*lksb), GFP_NOFS);
+	if (!lksb)
+		return -ENOMEM;
+
+	error = _create_lkb(ls, &lkb, lkb_id, lkb_id + 1);
+	if (error) {
+		kfree(lksb);
+		return error;
+	}
+
+	lkb->lkb_flags = lkb_flags;
+	lkb->lkb_nodeid = lkb_nodeid;
+	lkb->lkb_lksb = lksb;
+	/* user specific pointer, just don't have it NULL for kernel locks */
+	if (~lkb_flags & DLM_IFL_USER)
+		lkb->lkb_astparam = (void *)0xDEADBEEF;
+
+	error = find_rsb(ls, name, len, 0, R_REQUEST, &r);
+	if (error) {
+		kfree(lksb);
+		__put_lkb(ls, lkb);
+		return error;
+	}
+
+	lock_rsb(r);
+	attach_lkb(r, lkb);
+	add_lkb(r, lkb, lkb_status);
+	unlock_rsb(r);
+	put_rsb(r);
+
+	return 0;
+}
+
diff --git a/fs/dlm/lock.h b/fs/dlm/lock.h
index 456c6ec3ef6f..863a66e128a2 100644
--- a/fs/dlm/lock.h
+++ b/fs/dlm/lock.h
@@ -58,6 +58,8 @@ int dlm_user_purge(struct dlm_ls *ls, struct dlm_user_proc *proc,
 	int nodeid, int pid);
 int dlm_user_deadlock(struct dlm_ls *ls, uint32_t flags, uint32_t lkid);
 void dlm_clear_proc_locks(struct dlm_ls *ls, struct dlm_user_proc *proc);
+int dlm_debug_add_lkb(struct dlm_ls *ls, uint32_t lkb_id, char *name, int len,
+		      int lkb_nodeid, unsigned int lkb_flags, int lkb_status);
 
 static inline int is_master(struct dlm_rsb *r)
 {
-- 
2.27.0

