Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5929063777
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jul 2019 16:08:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09D6CC05B03B;
	Tue,  9 Jul 2019 14:08:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80DC953E1A;
	Tue,  9 Jul 2019 14:08:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60F3118184AD;
	Tue,  9 Jul 2019 14:08:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69E7GrO016038 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 10:07:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1CF37831C5; Tue,  9 Jul 2019 14:07:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24329831B7;
	Tue,  9 Jul 2019 14:07:14 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  9 Jul 2019 16:06:46 +0200
Message-Id: <20190709140657.19064-8-agruenba@redhat.com>
In-Reply-To: <20190709140657.19064-1-agruenba@redhat.com>
References: <20190709140657.19064-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 07/18] gfs2: Rename SDF_SHUTDOWN to
	SDF_WITHDRAWN
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 09 Jul 2019 14:08:51 +0000 (UTC)

From: Bob Peterson <rpeterso@redhat.com>

Before this patch, the superblock flag indicating when a file system
is withdrawn was called SDF_SHUTDOWN. This patch simply renames it to
the more obvious SDF_WITHDRAWN.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/aops.c       | 4 ++--
 fs/gfs2/file.c       | 2 +-
 fs/gfs2/glock.c      | 6 +++---
 fs/gfs2/glops.c      | 2 +-
 fs/gfs2/incore.h     | 2 +-
 fs/gfs2/meta_io.c    | 6 +++---
 fs/gfs2/ops_fstype.c | 2 +-
 fs/gfs2/quota.c      | 2 +-
 fs/gfs2/super.c      | 6 +++---
 fs/gfs2/sys.c        | 2 +-
 fs/gfs2/util.c       | 4 ++--
 11 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index abeac61cfed3..1463b399285c 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -518,7 +518,7 @@ static int __gfs2_readpage(void *file, struct page *page)
 		error = mpage_readpage(page, gfs2_block_map);
 	}
 
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags)))
+	if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags)))
 		return -EIO;
 
 	return error;
@@ -635,7 +635,7 @@ static int gfs2_readpages(struct file *file, struct address_space *mapping,
 	gfs2_glock_dq(&gh);
 out_uninit:
 	gfs2_holder_uninit(&gh);
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags)))
+	if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags)))
 		ret = -EIO;
 	return ret;
 }
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index d174b1f8fd08..28bdbeb11030 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1166,7 +1166,7 @@ static int gfs2_lock(struct file *file, int cmd, struct file_lock *fl)
 		cmd = F_SETLK;
 		fl->fl_type = F_UNLCK;
 	}
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags))) {
+	if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags))) {
 		if (fl->fl_type == F_UNLCK)
 			locks_lock_file_wait(file, fl);
 		return -EIO;
diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 44718098cc60..f114a4045fcc 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -544,7 +544,7 @@ __acquires(&gl->gl_lockref.lock)
 	unsigned int lck_flags = (unsigned int)(gh ? gh->gh_flags : 0);
 	int ret;
 
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags)) &&
+	if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags)) &&
 	    target != LM_ST_UNLOCKED)
 		return;
 	lck_flags &= (LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_NOEXP |
@@ -581,7 +581,7 @@ __acquires(&gl->gl_lockref.lock)
 		}
 		else if (ret) {
 			fs_err(sdp, "lm_lock ret %d\n", ret);
-			GLOCK_BUG_ON(gl, !test_bit(SDF_SHUTDOWN,
+			GLOCK_BUG_ON(gl, !test_bit(SDF_WITHDRAWN,
 						   &sdp->sd_flags));
 		}
 	} else { /* lock_nolock */
@@ -1094,7 +1094,7 @@ int gfs2_glock_nq(struct gfs2_holder *gh)
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	int error = 0;
 
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags)))
+	if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags)))
 		return -EIO;
 
 	if (test_bit(GLF_LRU, &gl->gl_flags))
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index cf4c767005b1..ade4b45a36ca 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -536,7 +536,7 @@ static int freeze_go_xmote_bh(struct gfs2_glock *gl, struct gfs2_holder *gh)
 			gfs2_consist(sdp);
 
 		/*  Initialize some head of the log stuff  */
-		if (!test_bit(SDF_SHUTDOWN, &sdp->sd_flags)) {
+		if (!test_bit(SDF_WITHDRAWN, &sdp->sd_flags)) {
 			sdp->sd_log_sequence = head.lh_sequence + 1;
 			gfs2_log_pointers_init(sdp, head.lh_blkno);
 		}
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 6b7cfc278ce2..3ac57afa694a 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -608,7 +608,7 @@ struct gfs2_tune {
 enum {
 	SDF_JOURNAL_CHECKED	= 0,
 	SDF_JOURNAL_LIVE	= 1,
-	SDF_SHUTDOWN		= 2,
+	SDF_WITHDRAWN		= 2,
 	SDF_NOBARRIERS		= 3,
 	SDF_NORECOVERY		= 4,
 	SDF_DEMOTE		= 5,
diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 456763e18def..662ef36c1874 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -251,7 +251,7 @@ int gfs2_meta_read(struct gfs2_glock *gl, u64 blkno, int flags,
 	struct buffer_head *bh, *bhs[2];
 	int num = 0;
 
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags))) {
+	if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags))) {
 		*bhp = NULL;
 		return -EIO;
 	}
@@ -309,7 +309,7 @@ int gfs2_meta_read(struct gfs2_glock *gl, u64 blkno, int flags,
 
 int gfs2_meta_wait(struct gfs2_sbd *sdp, struct buffer_head *bh)
 {
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags)))
+	if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags)))
 		return -EIO;
 
 	wait_on_buffer(bh);
@@ -320,7 +320,7 @@ int gfs2_meta_wait(struct gfs2_sbd *sdp, struct buffer_head *bh)
 			gfs2_io_error_bh_wd(sdp, bh);
 		return -EIO;
 	}
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags)))
+	if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags)))
 		return -EIO;
 
 	return 0;
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index c199d1d813fc..4a8e5a7310f0 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1004,7 +1004,7 @@ static int gfs2_lm_mount(struct gfs2_sbd *sdp, int silent)
 void gfs2_lm_unmount(struct gfs2_sbd *sdp)
 {
 	const struct lm_lockops *lm = sdp->sd_lockstruct.ls_ops;
-	if (likely(!test_bit(SDF_SHUTDOWN, &sdp->sd_flags)) &&
+	if (likely(!test_bit(SDF_WITHDRAWN, &sdp->sd_flags)) &&
 	    lm->lm_unmount)
 		lm->lm_unmount(sdp);
 }
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 8189b581236d..69c4b77f127b 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1475,7 +1475,7 @@ static void quotad_error(struct gfs2_sbd *sdp, const char *msg, int error)
 {
 	if (error == 0 || error == -EROFS)
 		return;
-	if (!test_bit(SDF_SHUTDOWN, &sdp->sd_flags)) {
+	if (!test_bit(SDF_WITHDRAWN, &sdp->sd_flags)) {
 		fs_err(sdp, "gfs2_quotad: %s error %d\n", msg, error);
 		sdp->sd_log_error = error;
 		wake_up(&sdp->sd_logd_waitq);
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 31147d89399d..129ae4376af4 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -805,7 +805,7 @@ static void gfs2_dirty_inode(struct inode *inode, int flags)
 
 	if (!(flags & I_DIRTY_INODE))
 		return;
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags)))
+	if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags)))
 		return;
 	if (!gfs2_glock_is_locked_by_me(ip->i_gl)) {
 		ret = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
@@ -854,7 +854,7 @@ static int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 
 	error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED, GL_NOCACHE,
 				   &freeze_gh);
-	if (error && !test_bit(SDF_SHUTDOWN, &sdp->sd_flags))
+	if (error && !test_bit(SDF_WITHDRAWN, &sdp->sd_flags))
 		return error;
 
 	flush_workqueue(gfs2_delete_workqueue);
@@ -1013,7 +1013,7 @@ static int gfs2_freeze(struct super_block *sb)
 	if (atomic_read(&sdp->sd_freeze_state) != SFS_UNFROZEN)
 		goto out;
 
-	if (test_bit(SDF_SHUTDOWN, &sdp->sd_flags)) {
+	if (test_bit(SDF_WITHDRAWN, &sdp->sd_flags)) {
 		error = -EINVAL;
 		goto out;
 	}
diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index 325612ce1c6b..289328831e24 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -118,7 +118,7 @@ static ssize_t freeze_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
 
 static ssize_t withdraw_show(struct gfs2_sbd *sdp, char *buf)
 {
-	unsigned int b = test_bit(SDF_SHUTDOWN, &sdp->sd_flags);
+	unsigned int b = test_bit(SDF_WITHDRAWN, &sdp->sd_flags);
 	return snprintf(buf, PAGE_SIZE, "%u\n", b);
 }
 
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index a7e55234211f..6aea0146e0c8 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -41,7 +41,7 @@ int gfs2_lm_withdraw(struct gfs2_sbd *sdp, const char *fmt, ...)
 	struct va_format vaf;
 
 	if (sdp->sd_args.ar_errors == GFS2_ERRORS_WITHDRAW &&
-	    test_and_set_bit(SDF_SHUTDOWN, &sdp->sd_flags))
+	    test_and_set_bit(SDF_WITHDRAWN, &sdp->sd_flags))
 		return 0;
 
 	if (fmt) {
@@ -256,7 +256,7 @@ void gfs2_io_error_bh_i(struct gfs2_sbd *sdp, struct buffer_head *bh,
 			const char *function, char *file, unsigned int line,
 			bool withdraw)
 {
-	if (!test_bit(SDF_SHUTDOWN, &sdp->sd_flags))
+	if (!test_bit(SDF_WITHDRAWN, &sdp->sd_flags))
 		fs_err(sdp,
 		       "fatal: I/O error\n"
 		       "  block = %llu\n"
-- 
2.20.1

