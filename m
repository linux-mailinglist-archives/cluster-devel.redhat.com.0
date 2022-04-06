Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A30044F5C09
	for <lists+cluster-devel@lfdr.de>; Wed,  6 Apr 2022 13:16:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649243809;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xJANEbU8Yxr9969xKZ7zHgxp0yaXsPuESIZQvdRJpWU=;
	b=Jc7cCVYV7Aq7JUXkXmbA3bWXfoDlDRFzSC7F5XabUIRKuvECuC3V7wQ1RIUHZFTTKc7BK3
	VL8eP6lViNCYl9uAMHm43Gpo/aFY6KIlZt+XF7potFjwZDQbl4gEf2kCNhAkWCPi5KYpDL
	8x0zrw0oPXG0qrTxvPNvyEJz2n6o4nc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-a-LRKmRlPRO4gJmzJXhaEw-1; Wed, 06 Apr 2022 07:16:46 -0400
X-MC-Unique: a-LRKmRlPRO4gJmzJXhaEw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC90D811E78;
	Wed,  6 Apr 2022 11:16:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 312F240D1B98;
	Wed,  6 Apr 2022 11:16:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AC3FA1949762;
	Wed,  6 Apr 2022 11:16:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6B4271940372 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  6 Apr 2022 11:16:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5663040D1B9D; Wed,  6 Apr 2022 11:16:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.195.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B998D40D1B98;
 Wed,  6 Apr 2022 11:16:42 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  6 Apr 2022 13:16:42 +0200
Message-Id: <20220406111642.972983-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Cluster-devel] [PATCH] gfs2: Add GL_NOPID flag for
 process-independent glock holders
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add a GL_NOPID flag to indicate that a holder isn't associated with the
current process.  This is useful for iopen glocks which are associated
with open files, as well as journal glock holders and similar which are
associated with the filesystem.

When the GL_NOPID flag is set, the pid and process name are only
reported while that process is still waiting for the holder to be
acquired.  After that, the pid is reported as 0 and the process name is
reported as "(none)".

When this flag is used (see the next patch), processes will no longer be
reported as holding glocks which they are not actually holding in the
glocks dump file.  So when a process is reported as having "(ended)",
this will actually indicate a bug.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 41 +++++++++++++++++++++++++++++++----------
 fs/gfs2/glock.h |  1 +
 2 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 630c6550eacf..106a994b20c0 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1461,6 +1461,15 @@ void gfs2_print_dbg(struct seq_file *seq, const char *fmt, ...)
 	va_end(args);
 }
 
+static inline bool pid_is_meaningful(const struct gfs2_holder *gh)
+{
+	if (!(gh->gh_flags & GL_NOPID))
+		return true;
+	if (gh->gh_state == LM_ST_UNLOCKED && !(gh->gh_flags & GL_ASYNC))
+		return true;
+	return false;
+}
+
 /**
  * add_to_queue - Add a holder to the wait queue (but look for recursion)
  * @gh: the holder structure to add
@@ -1497,10 +1506,17 @@ __acquires(&gl->gl_lockref.lock)
 	}
 
 	list_for_each_entry(gh2, &gl->gl_holders, gh_list) {
-		if (unlikely(gh2->gh_owner_pid == gh->gh_owner_pid &&
-		    (gh->gh_gl->gl_ops->go_type != LM_TYPE_FLOCK) &&
-		    !test_bit(HIF_MAY_DEMOTE, &gh2->gh_iflags)))
-			goto trap_recursive;
+		if (likely(gh2->gh_owner_pid != gh->gh_owner_pid))
+			continue;
+		if (gh->gh_gl->gl_ops->go_type == LM_TYPE_FLOCK)
+			continue;
+		if (test_bit(HIF_MAY_DEMOTE, &gh2->gh_iflags))
+			continue;
+		if (!pid_is_meaningful(gh2))
+			continue;
+		goto trap_recursive;
+	}
+	list_for_each_entry(gh2, &gl->gl_holders, gh_list) {
 		if (try_futile &&
 		    !(gh2->gh_flags & (LM_FLAG_TRY | LM_FLAG_TRY_1CB))) {
 fail:
@@ -2315,19 +2331,24 @@ static const char *hflags2str(char *buf, u16 flags, unsigned long iflags)
 static void dump_holder(struct seq_file *seq, const struct gfs2_holder *gh,
 			const char *fs_id_buf)
 {
-	struct task_struct *gh_owner = NULL;
+	const char *comm = "(none)";
+	pid_t owner_pid = 0;
 	char flags_buf[32];
 
 	rcu_read_lock();
-	if (gh->gh_owner_pid)
+	if (pid_is_meaningful(gh)) {
+		struct task_struct *gh_owner;
+
+		comm = "(ended)";
+		owner_pid = pid_nr(gh->gh_owner_pid);
 		gh_owner = pid_task(gh->gh_owner_pid, PIDTYPE_PID);
+		if (gh_owner)
+			comm = gh_owner->comm;
+	}
 	gfs2_print_dbg(seq, "%s H: s:%s f:%s e:%d p:%ld [%s] %pS\n",
 		       fs_id_buf, state2str(gh->gh_state),
 		       hflags2str(flags_buf, gh->gh_flags, gh->gh_iflags),
-		       gh->gh_error,
-		       gh->gh_owner_pid ? (long)pid_nr(gh->gh_owner_pid) : -1,
-		       gh_owner ? gh_owner->comm : "(ended)",
-		       (void *)gh->gh_ip);
+		       gh->gh_error, (long)owner_pid, comm, (void *)gh->gh_ip);
 	rcu_read_unlock();
 }
 
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index 4f8642301801..13e567645618 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -91,6 +91,7 @@ enum {
 #define GL_ASYNC		0x0040
 #define GL_EXACT		0x0080
 #define GL_SKIP			0x0100
+#define GL_NOPID		0x0200
 #define GL_NOCACHE		0x0400
   
 /*
-- 
2.35.1

