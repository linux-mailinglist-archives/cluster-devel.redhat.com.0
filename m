Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F01056070A
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Jun 2022 19:10:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656522640;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Eejy47gey9dYsdiTejrOWxcxI+P9LV9hdYcNKTPsRs8=;
	b=gbAFwdfXF6vaNBlXdH00BnMtxuHyKH/x1ldCZKlBTfdygRuPFOOJMNpudYMUrmcxoj1BUS
	lzHvgRWXSM7cUGvKdzwB2MIFmnNJfgTpU1koWXtZFSEVvayXRELbRO23lTNllEcIWnG8Tg
	Sgv/lE8MaY8faQ/MJyzJZIhTMFdvZBI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-hkZe1AdnPJKGndpngvnZZw-1; Wed, 29 Jun 2022 13:10:36 -0400
X-MC-Unique: hkZe1AdnPJKGndpngvnZZw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 385633C0D185;
	Wed, 29 Jun 2022 17:10:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C9D6C28115;
	Wed, 29 Jun 2022 17:10:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ACD751947061;
	Wed, 29 Jun 2022 17:10:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9B7A31947058 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 16:37:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8F498492CA3; Wed, 29 Jun 2022 16:37:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C0D4492C3B;
 Wed, 29 Jun 2022 16:37:13 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 29 Jun 2022 18:37:04 +0200
Message-Id: <20220629163711.732931-3-agruenba@redhat.com>
In-Reply-To: <20220629163711.732931-1-agruenba@redhat.com>
References: <20220629163711.732931-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 2/9] gfs2: Instantiate glocks ouside of
 glock state engine
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Instantiate glocks outside of the glock state engine: there is no real
reason for instantiating them inside the glock state engine; it only
complicates the code.

Instead, instantiate them in gfs2_glock_wait() and gfs2_glock_async_wait()
using the new gfs2_glock_holder_ready() helper.  On top of that, the only
other place that acquires a glock without using gfs2_glock_wait() or
gfs2_glock_async_wait() is gfs2_upgrade_iopen_glock(), so call
gfs2_glock_holder_ready() there as well.

If a dinode has a pending truncate, the glock-specific instantiate function
for inodes wakes up the truncate function in the quota daemon.  Waiting for
the completion of the truncate was previously done by the glock state
engine, but we now need to wait in inode_go_instantiate().

This also means that gfs2_instantiate() will now no longer return any
"special" error codes.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 66 ++++++++++++++++++++++++-------------------------
 fs/gfs2/glock.h |  2 ++
 fs/gfs2/glops.c |  2 +-
 fs/gfs2/super.c |  2 +-
 4 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index f8a98fcbc04c..41bee3db8c0d 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -478,8 +478,7 @@ find_first_strong_holder(struct gfs2_glock *gl)
  * gfs2_instantiate - Call the glops instantiate function
  * @gh: The glock holder
  *
- * Returns: 0 if instantiate was successful, 2 if type specific operation is
- * underway, or error.
+ * Returns: 0 if instantiate was successful, or error.
  */
 int gfs2_instantiate(struct gfs2_holder *gh)
 {
@@ -524,18 +523,12 @@ int gfs2_instantiate(struct gfs2_holder *gh)
  */
 
 static int do_promote(struct gfs2_glock *gl)
-__releases(&gl->gl_lockref.lock)
-__acquires(&gl->gl_lockref.lock)
 {
 	struct gfs2_holder *gh, *tmp, *first_gh;
 	bool incompat_holders_demoted = false;
-	bool lock_released;
-	int ret;
 
-restart:
 	first_gh = find_first_strong_holder(gl);
 	list_for_each_entry_safe(gh, tmp, &gl->gl_holders, gh_list) {
-		lock_released = false;
 		if (test_bit(HIF_HOLDER, &gh->gh_iflags))
 			continue;
 		if (!may_grant(gl, first_gh, gh)) {
@@ -554,32 +547,9 @@ __acquires(&gl->gl_lockref.lock)
 			incompat_holders_demoted = true;
 			first_gh = gh;
 		}
-		if (test_bit(GLF_INSTANTIATE_NEEDED, &gl->gl_flags) &&
-		    !(gh->gh_flags & GL_SKIP) && gl->gl_ops->go_instantiate) {
-			lock_released = true;
-			spin_unlock(&gl->gl_lockref.lock);
-			ret = gfs2_instantiate(gh);
-			spin_lock(&gl->gl_lockref.lock);
-			if (ret) {
-				if (ret == 1)
-					return 2;
-				gh->gh_error = ret;
-				list_del_init(&gh->gh_list);
-				trace_gfs2_glock_queue(gh, 0);
-				gfs2_holder_wake(gh);
-				goto restart;
-			}
-		}
 		set_bit(HIF_HOLDER, &gh->gh_iflags);
 		trace_gfs2_promote(gh);
 		gfs2_holder_wake(gh);
-		/*
-		 * If we released the gl_lockref.lock the holders list may have
-		 * changed. For that reason, we start again at the start of
-		 * the holders queue.
-		 */
-		if (lock_released)
-			goto restart;
 	}
 	return 0;
 }
@@ -1313,6 +1283,25 @@ static void gfs2_glock_update_hold_time(struct gfs2_glock *gl,
 	}
 }
 
+/**
+ * gfs2_glock_holder_ready - holder is ready and its error code can be collected
+ * @gh: the glock holder
+ *
+ * Called when a glock holder no longer needs to be waited for because it is
+ * now either held (HIF_HOLDER set; gh_error == 0), or acquiring the lock has
+ * failed (gh_error != 0).
+ */
+
+int gfs2_glock_holder_ready(struct gfs2_holder *gh)
+{
+	if (gh->gh_error || (gh->gh_flags & GL_SKIP))
+		return gh->gh_error;
+	gh->gh_error = gfs2_instantiate(gh);
+	if (gh->gh_error)
+		gfs2_glock_dq(gh);
+	return gh->gh_error;
+}
+
 /**
  * gfs2_glock_wait - wait on a glock acquisition
  * @gh: the glock holder
@@ -1327,7 +1316,7 @@ int gfs2_glock_wait(struct gfs2_holder *gh)
 	might_sleep();
 	wait_on_bit(&gh->gh_iflags, HIF_WAIT, TASK_UNINTERRUPTIBLE);
 	gfs2_glock_update_hold_time(gh->gh_gl, start_time);
-	return gh->gh_error;
+	return gfs2_glock_holder_ready(gh);
 }
 
 static int glocks_pending(unsigned int num_gh, struct gfs2_holder *ghs)
@@ -1372,13 +1361,15 @@ int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs)
 
 	for (i = 0; i < num_gh; i++) {
 		struct gfs2_holder *gh = &ghs[i];
+		int ret2;
 
 		if (test_bit(HIF_HOLDER, &gh->gh_iflags)) {
 			gfs2_glock_update_hold_time(gh->gh_gl,
 						    start_time);
 		}
+		ret2 = gfs2_glock_holder_ready(gh);
 		if (!ret)
-			ret = gh->gh_error;
+			ret = ret2;
 	}
 
 out:
@@ -2233,9 +2224,18 @@ void gfs2_glock_finish_truncate(struct gfs2_inode *ip)
 	spin_lock(&gl->gl_lockref.lock);
 	clear_bit(GLF_LOCK, &gl->gl_flags);
 	run_queue(gl, 1);
+	wake_up_glock(gl);
 	spin_unlock(&gl->gl_lockref.lock);
 }
 
+void gfs2_wait_truncate(struct gfs2_inode *ip)
+{
+	struct gfs2_glock *gl = ip->i_gl;
+	wait_queue_head_t *wq = glock_waitqueue(&gl->gl_name);
+
+	wait_event(*wq, !(ip->i_diskflags & GFS2_DIF_TRUNC_IN_PROG));
+}
+
 static const char *state2str(unsigned state)
 {
 	switch(state) {
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index c0ae9100a0bc..2796d5414ec9 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -213,6 +213,7 @@ extern void gfs2_holder_uninit(struct gfs2_holder *gh);
 extern int gfs2_glock_nq(struct gfs2_holder *gh);
 extern int gfs2_glock_poll(struct gfs2_holder *gh);
 extern int gfs2_instantiate(struct gfs2_holder *gh);
+extern int gfs2_glock_holder_ready(struct gfs2_holder *gh);
 extern int gfs2_glock_wait(struct gfs2_holder *gh);
 extern int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs);
 extern void gfs2_glock_dq(struct gfs2_holder *gh);
@@ -274,6 +275,7 @@ extern bool gfs2_delete_work_queued(const struct gfs2_glock *gl);
 extern void gfs2_flush_delete_work(struct gfs2_sbd *sdp);
 extern void gfs2_gl_hash_clear(struct gfs2_sbd *sdp);
 extern void gfs2_glock_finish_truncate(struct gfs2_inode *ip);
+extern void gfs2_wait_truncate(struct gfs2_inode *ip);
 extern void gfs2_glock_thaw(struct gfs2_sbd *sdp);
 extern void gfs2_glock_add_to_lru(struct gfs2_glock *gl);
 extern void gfs2_glock_free(struct gfs2_glock *gl);
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 392800f082a6..6bc096610654 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -510,7 +510,7 @@ static int inode_go_instantiate(struct gfs2_holder *gh)
 			list_add(&ip->i_trunc_list, &sdp->sd_trunc_list);
 		spin_unlock(&sdp->sd_trunc_lock);
 		wake_up(&sdp->sd_quota_wait);
-		error = 1;
+		gfs2_wait_truncate(ip);
 	}
 
 out:
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index bdb773e5c88f..b5b0f285b27f 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1196,7 +1196,7 @@ static bool gfs2_upgrade_iopen_glock(struct inode *inode)
 		gfs2_glock_dq(gh);
 		return false;
 	}
-	return true;
+	return gfs2_glock_holder_ready(gh) == 0;
 }
 
 /**
-- 
2.35.1

