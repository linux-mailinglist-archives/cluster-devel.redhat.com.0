Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3AC443663
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Nov 2021 20:18:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635880692;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mc1xB3W633hoEjqzCiB1Dr5PEwIcFaCV7GjUV+9Wr7A=;
	b=eN8a0CDCRjwAPuwx6FUYU6mY9NLiMyOjddHrDijvXCl6mlJkLdTMyzfJGBytTIOxz18TSH
	o5I9LyUhuj7aQ7QgXmfQp0Ops1JYS9A+omWfMLHA8rF9XZVBgsbMaiFex8noUgvSmrB3wO
	cPvx0ZGfExIDmDe2RVu9Dr6pEw//ie0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-j26kl7JaO2iYypDBG5Tv9A-1; Tue, 02 Nov 2021 15:18:09 -0400
X-MC-Unique: j26kl7JaO2iYypDBG5Tv9A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD13A1808326;
	Tue,  2 Nov 2021 19:18:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEFC160C0F;
	Tue,  2 Nov 2021 19:18:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5CF5C1832DD4;
	Tue,  2 Nov 2021 19:18:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A2JI0MO020833 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Nov 2021 15:18:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E0FEA2B060; Tue,  2 Nov 2021 19:18:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 90C2967840;
	Tue,  2 Nov 2021 19:18:00 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  2 Nov 2021 15:17:23 -0400
Message-Id: <20211102191724.210095-18-aahringo@redhat.com>
In-Reply-To: <20211102191724.210095-1-aahringo@redhat.com>
References: <20211102191724.210095-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND v5.15-rc7 17/18] fs: dlm: add lkb
	waiters debugfs functionality
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds functionality to put a lkb to the waiters state. It can
be useful to combine this feature with the "rawmsg" debugfs
functionality. It will bring the DLM lkb into a state that a message
will be parsed by the kernel.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/debug_fs.c | 27 ++++++++++++++++++++++++++-
 fs/dlm/lock.c     | 15 +++++++++++++++
 fs/dlm/lock.h     |  2 ++
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 2ead4751d655..df6f3f107be4 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -754,10 +754,35 @@ static ssize_t waiters_read(struct file *file, char __user *userbuf,
 	return rv;
 }
 
+static ssize_t waiters_write(struct file *file, const char __user *user_buf,
+			     size_t count, loff_t *ppos)
+{
+	struct dlm_ls *ls = file->private_data;
+	int mstype, to_nodeid;
+	char buf[128] = {};
+	uint32_t lkb_id;
+	int n, error;
+
+	if (copy_from_user(buf, user_buf,
+			   min_t(size_t, sizeof(buf) - 1, count)))
+		return -EFAULT;
+
+	n = sscanf(buf, "%x %d %d", &lkb_id, &mstype, &to_nodeid);
+	if (n != 3)
+		return -EINVAL;
+
+	error = dlm_debug_add_lkb_to_waiters(ls, lkb_id, mstype, to_nodeid);
+	if (error)
+		return error;
+
+	return count;
+}
+
 static const struct file_operations waiters_fops = {
 	.owner   = THIS_MODULE,
 	.open    = simple_open,
 	.read    = waiters_read,
+	.write   = waiters_write,
 	.llseek  = default_llseek,
 };
 
@@ -907,7 +932,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_waiters", ls->ls_name);
 
 	ls->ls_debug_waiters_dentry = debugfs_create_file(name,
-							  S_IFREG | S_IRUGO,
+							  0644,
 							  dlm_root,
 							  ls,
 							  &waiters_fops);
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index aeb793693d8c..0dbe273566c0 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -6363,3 +6363,18 @@ int dlm_debug_add_lkb(struct dlm_ls *ls, uint32_t lkb_id, char *name, int len,
 	return 0;
 }
 
+int dlm_debug_add_lkb_to_waiters(struct dlm_ls *ls, uint32_t lkb_id,
+				 int mstype, int to_nodeid)
+{
+	struct dlm_lkb *lkb;
+	int error;
+
+	error = find_lkb(ls, lkb_id, &lkb);
+	if (error)
+		return error;
+
+	error = add_to_waiters(lkb, mstype, to_nodeid);
+	dlm_put_lkb(lkb);
+	return error;
+}
+
diff --git a/fs/dlm/lock.h b/fs/dlm/lock.h
index 863a66e128a2..252a5898f908 100644
--- a/fs/dlm/lock.h
+++ b/fs/dlm/lock.h
@@ -60,6 +60,8 @@ int dlm_user_deadlock(struct dlm_ls *ls, uint32_t flags, uint32_t lkid);
 void dlm_clear_proc_locks(struct dlm_ls *ls, struct dlm_user_proc *proc);
 int dlm_debug_add_lkb(struct dlm_ls *ls, uint32_t lkb_id, char *name, int len,
 		      int lkb_nodeid, unsigned int lkb_flags, int lkb_status);
+int dlm_debug_add_lkb_to_waiters(struct dlm_ls *ls, uint32_t lkb_id,
+				 int mstype, int to_nodeid);
 
 static inline int is_master(struct dlm_rsb *r)
 {
-- 
2.27.0

