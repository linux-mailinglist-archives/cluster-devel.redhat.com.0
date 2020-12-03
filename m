Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0BB2CDA04
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Dec 2020 16:23:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607008979;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2B4lRtaegeGYfzTUnTZ0+Opgr2SotqJj1N575oAbmck=;
	b=Eqar3j4qRCcDCsqJsnWy9Cn+AjAOstwULiDoKMmRqctxICFmlt5rrEE9Zdb9OERQtmE5SP
	uTCbZGC5DVOMia/Ax1+iLM9n8VcLqHCpeuBzijRSLnak4OnOZS220tRTPQGlOBb8JtXdqb
	e4ZVCLhMaa9SAnF6nTuYRTyCI+CjmBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-LPrDWA78PYyMT6Q3QiUh4A-1; Thu, 03 Dec 2020 10:22:58 -0500
X-MC-Unique: LPrDWA78PYyMT6Q3QiUh4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D526F106F8AA;
	Thu,  3 Dec 2020 15:22:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B18E5D9CA;
	Thu,  3 Dec 2020 15:22:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D0A3180954D;
	Thu,  3 Dec 2020 15:22:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3FMpLP024314 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 10:22:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A4B88189A5; Thu,  3 Dec 2020 15:22:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-72.phx2.redhat.com [10.3.112.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 68B6218A2F
	for <cluster-devel@redhat.com>; Thu,  3 Dec 2020 15:22:48 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu,  3 Dec 2020 09:22:40 -0600
Message-Id: <20201203152241.71617-2-rpeterso@redhat.com>
In-Reply-To: <20201203152241.71617-1-rpeterso@redhat.com>
References: <20201203152241.71617-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RHEL7.9.z PATCH 1/2] gfs2: Add common helper for
	holding and releasing the freeze glock
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Many places in the gfs2 code queued and dequeued the freeze glock.
Almost all of them acquire it in SHARED mode, and need to specify the
same LM_FLAG_NOEXP and GL_EXACT flags.

This patch adds common helper functions gfs2_freeze_lock and gfs2_freeze_unlock
to make the code more readable, and to prepare for the next patch.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/ops_fstype.c |  6 ++----
 fs/gfs2/recovery.c   |  6 ++----
 fs/gfs2/super.c      | 45 +++++++++++++++-----------------------------
 fs/gfs2/util.c       | 35 ++++++++++++++++++++++++++++++++++
 fs/gfs2/util.h       |  3 +++
 5 files changed, 57 insertions(+), 38 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 61fce59cb4d3..4ee56f5e93cb 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1198,14 +1198,12 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (sb_rdonly(sb)) {
 		struct gfs2_holder freeze_gh;
 
-		error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED,
-					   LM_FLAG_NOEXP | GL_EXACT,
-					   &freeze_gh);
+		error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
 		if (error) {
 			fs_err(sdp, "can't make FS RO: %d\n", error);
 			goto fail_per_node;
 		}
-		gfs2_glock_dq_uninit(&freeze_gh);
+		gfs2_freeze_unlock(&freeze_gh);
 	} else {
 		error = gfs2_make_fs_rw(sdp);
 		if (error) {
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index c26c68ebd29d..2208b0e2dc8c 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -470,9 +470,7 @@ void gfs2_recover_func(struct work_struct *work)
 
 		/* Acquire a shared hold on the freeze lock */
 
-		error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED,
-					   LM_FLAG_NOEXP | LM_FLAG_PRIORITY |
-					   GL_EXACT, &thaw_gh);
+		error = gfs2_freeze_lock(sdp, &thaw_gh, LM_FLAG_PRIORITY);
 		if (error)
 			goto fail_gunlock_ji;
 
@@ -522,7 +520,7 @@ void gfs2_recover_func(struct work_struct *work)
 		clean_journal(jd, &head);
 		up_read(&sdp->sd_log_flush_lock);
 
-		gfs2_glock_dq_uninit(&thaw_gh);
+		gfs2_freeze_unlock(&thaw_gh);
 		t_rep = ktime_get();
 		fs_info(sdp, "jid=%u: Journal replayed in %lldms [jlck:%lldms, "
 			"jhead:%lldms, tlck:%lldms, replay:%lldms]\n",
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 2f56acc41c04..801361a05e6f 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -173,9 +173,7 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 	if (error)
 		return error;
 
-	error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED,
-				   LM_FLAG_NOEXP | GL_EXACT,
-				   &freeze_gh);
+	error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
 	if (error)
 		goto fail_threads;
 
@@ -205,12 +203,12 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 
 	set_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
 
-	gfs2_glock_dq_uninit(&freeze_gh);
+	gfs2_freeze_unlock(&freeze_gh);
 
 	return 0;
 
 fail:
-	gfs2_glock_dq_uninit(&freeze_gh);
+	gfs2_freeze_unlock(&freeze_gh);
 fail_threads:
 	if (sdp->sd_quotad_process)
 		kthread_stop(sdp->sd_quotad_process);
@@ -452,7 +450,7 @@ static int gfs2_lock_fs_check_clean(struct gfs2_sbd *sdp)
 	}
 
 	if (error)
-		gfs2_glock_dq_uninit(&sdp->sd_freeze_gh);
+		gfs2_freeze_unlock(&sdp->sd_freeze_gh);
 
 out:
 	while (!list_empty(&list)) {
@@ -614,23 +612,13 @@ int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 	int log_write_allowed = test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
 
 	gfs2_holder_mark_uninitialized(&freeze_gh);
-	if (sdp->sd_freeze_gl &&
-	    !gfs2_glock_is_locked_by_me(sdp->sd_freeze_gl)) {
-		if (!log_write_allowed) {
-			error = gfs2_glock_nq_init(sdp->sd_freeze_gl,
-						   LM_ST_SHARED, LM_FLAG_TRY |
-						   LM_FLAG_NOEXP | GL_EXACT,
-						   &freeze_gh);
-			if (error == GLR_TRYFAILED)
-				error = 0;
-		} else {
-			error = gfs2_glock_nq_init(sdp->sd_freeze_gl,
-						   LM_ST_SHARED,
-						   LM_FLAG_NOEXP | GL_EXACT,
-						   &freeze_gh);
-			if (error && !gfs2_withdrawn(sdp))
-				return error;
-		}
+	if (sdp->sd_freeze_gl) {
+		error = gfs2_freeze_lock(sdp, &freeze_gh,
+					 log_write_allowed ? 0 : LM_FLAG_TRY);
+		if (error == GLR_TRYFAILED)
+			error = 0;
+		if (error && !gfs2_withdrawn(sdp))
+			return error;
 	}
 
 	gfs2_flush_delete_work(sdp);
@@ -661,8 +649,7 @@ int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 				   atomic_read(&sdp->sd_reserving_log) == 0,
 				   HZ * 5);
 	}
-	if (gfs2_holder_initialized(&freeze_gh))
-		gfs2_glock_dq_uninit(&freeze_gh);
+	gfs2_freeze_unlock(&freeze_gh);
 
 	gfs2_quota_cleanup(sdp);
 
@@ -772,10 +759,8 @@ void gfs2_freeze_func(struct work_struct *work)
 	struct super_block *sb = sdp->sd_vfs;
 
 	atomic_inc(&sb->s_active);
-	error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED,
-				   LM_FLAG_NOEXP | GL_EXACT, &freeze_gh);
+	error = gfs2_freeze_lock(sdp, &freeze_gh, 0);
 	if (error) {
-		fs_info(sdp, "GFS2: couldn't get freeze lock : %d\n", error);
 		gfs2_assert_withdraw(sdp, 0);
 	} else {
 		atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
@@ -785,7 +770,7 @@ void gfs2_freeze_func(struct work_struct *work)
 				error);
 			gfs2_assert_withdraw(sdp, 0);
 		}
-		gfs2_glock_dq_uninit(&freeze_gh);
+		gfs2_freeze_unlock(&freeze_gh);
 	}
 	deactivate_super(sb);
 	clear_bit_unlock(SDF_FS_FROZEN, &sdp->sd_flags);
@@ -853,7 +838,7 @@ static int gfs2_unfreeze(struct super_block *sb)
                 return 0;
 	}
 
-	gfs2_glock_dq_uninit(&sdp->sd_freeze_gh);
+	gfs2_freeze_unlock(&sdp->sd_freeze_gh);
 	mutex_unlock(&sdp->sd_freeze_mutex);
 	return wait_on_bit(&sdp->sd_flags, SDF_FS_FROZEN, TASK_INTERRUPTIBLE);
 }
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index a374397f4273..9022ea1f5d50 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -91,6 +91,41 @@ int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 	return error;
 }
 
+/**
+ * gfs2_freeze_lock - hold the freeze glock
+ * @sdp: the superblock
+ * @freeze_gh: pointer to the requested holder
+ * @caller_flags: any additional flags needed by the caller
+ */
+int gfs2_freeze_lock(struct gfs2_sbd *sdp, struct gfs2_holder *freeze_gh,
+		     int caller_flags)
+{
+	int flags = LM_FLAG_NOEXP | GL_EXACT | caller_flags;
+	int error;
+
+	/*
+	 * We mark the caller's holder uninitialized here before the check to
+	 * see if it's already locked. If it's already locked, it may have been
+	 * locked with a different gh (as will be the case for some withdraws).
+	 * We don't want them trying to unlock what we didn't lock.
+	 */
+	gfs2_holder_mark_uninitialized(freeze_gh);
+	if (gfs2_glock_is_locked_by_me(sdp->sd_freeze_gl))
+		return 0;
+
+	error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED, flags,
+				   freeze_gh);
+	if (error && error != GLR_TRYFAILED)
+		fs_err(sdp, "can't lock the freeze lock: %d\n", error);
+	return error;
+}
+
+void gfs2_freeze_unlock(struct gfs2_holder *freeze_gh)
+{
+	if (gfs2_holder_initialized(freeze_gh))
+		gfs2_glock_dq_uninit(freeze_gh);
+}
+
 static void signal_our_withdraw(struct gfs2_sbd *sdp)
 {
 	struct gfs2_glock *gl = sdp->sd_live_gh.gh_gl;
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index a4443dd8a94b..69e1a0ae5a4d 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -149,6 +149,9 @@ int gfs2_io_error_i(struct gfs2_sbd *sdp, const char *function,
 
 extern int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 			       bool verbose);
+extern int gfs2_freeze_lock(struct gfs2_sbd *sdp,
+			    struct gfs2_holder *freeze_gh, int caller_flags);
+extern void gfs2_freeze_unlock(struct gfs2_holder *freeze_gh);
 
 #define gfs2_io_error(sdp) \
 gfs2_io_error_i((sdp), __func__, __FILE__, __LINE__)
-- 
2.28.0

