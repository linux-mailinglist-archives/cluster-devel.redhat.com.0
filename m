Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E84BE55EFC0
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Jun 2022 22:46:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656449183;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UJ28lpHMxANwjsFwVo8SWCUkkqxHqZ8kRWKJwGe1CCM=;
	b=ZC1wHQSXbO/tgCb/1/pYWvQe4DN3g6mVvER6sUqlUTuQF8k/W+98qIuS4d/HVBeurEL+D/
	4zf3pYSvG+NiyXP069/73JZk9k2XRG7Jqwz/3WmngBdwWSWsnvOYvL/Dzfo2xXN7vhZXKH
	BTePsIOsgY534tZK9TC7kUCNYKILd6w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-DJJb6k3-OimsZi02ppdQ9g-1; Tue, 28 Jun 2022 16:46:17 -0400
X-MC-Unique: DJJb6k3-OimsZi02ppdQ9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E4E31019C8D;
	Tue, 28 Jun 2022 20:46:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80548C2810D;
	Tue, 28 Jun 2022 20:46:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5C050194705C;
	Tue, 28 Jun 2022 20:46:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CC66119466DF for <cluster-devel@listman.corp.redhat.com>;
 Tue, 28 Jun 2022 20:46:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AC93A404E4C8; Tue, 28 Jun 2022 20:46:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE9B440C1240;
 Tue, 28 Jun 2022 20:46:14 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 28 Jun 2022 22:46:08 +0200
Message-Id: <20220628204611.651126-3-agruenba@redhat.com>
In-Reply-To: <20220628204611.651126-1-agruenba@redhat.com>
References: <20220628204611.651126-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH 2/5] gfs2: Add flocks to glockfd debugfs file
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
Cc: linux-fsdevel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Include flock glocks in the "glockfd" debugfs file.  Those are similar to the
iopen glocks; while an open file is holding an flock, it is holding the file's
flock glock.

We cannot take f_fl_mutex in gfs2_glockfd_seq_show_flock() or else dumping the
"glockfd" file would block on flock operations.  Instead, use the file->f_lock
spin lock to protect the f_fl_gh.gh_gl glock pointer.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/file.c  | 22 ++++++++++++++++++++--
 fs/gfs2/glock.c | 23 +++++++++++++++++++++++
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 2cceb193dcd8..25f4080bc973 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1444,6 +1444,22 @@ static int gfs2_lock(struct file *file, int cmd, struct file_lock *fl)
 		return dlm_posix_lock(ls->ls_dlm, ip->i_no_addr, file, cmd, fl);
 }
 
+static void __flock_holder_uninit(struct file *file, struct gfs2_holder *fl_gh)
+{
+	struct gfs2_glock *gl = fl_gh->gh_gl;
+
+	/*
+	 * Make sure gfs2_glock_put() won't sleep under the file->f_lock
+	 * spinlock.
+	 */
+
+	gfs2_glock_hold(gl);
+	spin_lock(&file->f_lock);
+	gfs2_holder_uninit(fl_gh);
+	spin_unlock(&file->f_lock);
+	gfs2_glock_put(gl);
+}
+
 static int do_flock(struct file *file, int cmd, struct file_lock *fl)
 {
 	struct gfs2_file *fp = file->private_data;
@@ -1475,7 +1491,9 @@ static int do_flock(struct file *file, int cmd, struct file_lock *fl)
 				       &gfs2_flock_glops, CREATE, &gl);
 		if (error)
 			goto out;
+		spin_lock(&file->f_lock);
 		gfs2_holder_init(gl, state, flags, fl_gh);
+		spin_unlock(&file->f_lock);
 		gfs2_glock_put(gl);
 	}
 	for (sleeptime = 1; sleeptime <= 4; sleeptime <<= 1) {
@@ -1486,7 +1504,7 @@ static int do_flock(struct file *file, int cmd, struct file_lock *fl)
 		msleep(sleeptime);
 	}
 	if (error) {
-		gfs2_holder_uninit(fl_gh);
+		__flock_holder_uninit(file, fl_gh);
 		if (error == GLR_TRYFAILED)
 			error = -EAGAIN;
 	} else {
@@ -1508,7 +1526,7 @@ static void do_unflock(struct file *file, struct file_lock *fl)
 	locks_lock_file_wait(file, fl);
 	if (gfs2_holder_initialized(fl_gh)) {
 		gfs2_glock_dq(fl_gh);
-		gfs2_holder_uninit(fl_gh);
+		__flock_holder_uninit(file, fl_gh);
 	}
 	mutex_unlock(&fp->f_fl_mutex);
 }
diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 63dbab6fa242..aa35f5d4eb54 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -2844,6 +2844,28 @@ static void gfs2_glockfd_seq_stop(struct seq_file *seq, void *iter_ptr)
 		put_task_struct(i->task);
 }
 
+static void gfs2_glockfd_seq_show_flock(struct seq_file *seq,
+					struct gfs2_glockfd_iter *i)
+{
+	struct gfs2_file *fp = i->file->private_data;
+	struct gfs2_holder *fl_gh = &fp->f_fl_gh;
+	struct lm_lockname gl_name = { .ln_type = LM_TYPE_RESERVED };
+
+	if (!READ_ONCE(fl_gh->gh_gl))
+		return;
+
+	spin_lock(&i->file->f_lock);
+	if (gfs2_holder_initialized(fl_gh))
+		gl_name = fl_gh->gh_gl->gl_name;
+	spin_unlock(&i->file->f_lock);
+
+	if (gl_name.ln_type != LM_TYPE_RESERVED) {
+		seq_printf(seq, "%d %u %u/%llx\n",
+			   i->tgid, i->fd, gl_name.ln_type,
+			   (unsigned long long)gl_name.ln_number);
+	}
+}
+
 static int gfs2_glockfd_seq_show(struct seq_file *seq, void *iter_ptr)
 {
 	struct gfs2_glockfd_iter *i = seq->private;
@@ -2857,6 +2879,7 @@ static int gfs2_glockfd_seq_show(struct seq_file *seq, void *iter_ptr)
 			   i->tgid, i->fd, gl->gl_name.ln_type,
 			   (unsigned long long)gl->gl_name.ln_number);
 	}
+	gfs2_glockfd_seq_show_flock(seq, i);
 	inode_unlock_shared(inode);
 	return 0;
 }
-- 
2.35.1

