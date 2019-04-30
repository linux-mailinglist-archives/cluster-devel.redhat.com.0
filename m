Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A83E10305
	for <lists+cluster-devel@lfdr.de>; Wed,  1 May 2019 01:03:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F18CC5D608;
	Tue, 30 Apr 2019 23:03:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAD0D721C6;
	Tue, 30 Apr 2019 23:03:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA7FD3FAF4;
	Tue, 30 Apr 2019 23:03:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UN3Nnl022973 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 19:03:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5314281742; Tue, 30 Apr 2019 23:03:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-20.phx2.redhat.com [10.3.116.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D0647C850
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 23:03:23 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 30 Apr 2019 17:03:05 -0600
Message-Id: <20190430230319.10375-6-rpeterso@redhat.com>
In-Reply-To: <20190430230319.10375-1-rpeterso@redhat.com>
References: <20190430230319.10375-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v3 05/19] gfs2: Introduce concept of a
	pending withdraw
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Tue, 30 Apr 2019 23:03:31 +0000 (UTC)

File system withdraws can be delayed when inconsistencies are
discovered when we cannot withdraw immediately, for example, when
critical spin_locks are held. But delaying the withdraw can cause
gfs2 to ignore the error and keep running for a short period of time.
For example, an rgrp glock may be dequeued and demoted while there
are still buffers that haven't been properly revoked, due to io
errors writing to the journal.

This patch introduces a new concept of a pending withdraw, which
means an inconsistency has been discovered and we need to withdraw
at the earliest possible opportunity. In these cases, we aren't
quite withdrawn yet, but we still need to not dequeue glocks and
other critical things. If we dequeue the glocks and the withdraw
results in our journal being replayed, the replay could overwrite
data that's been modified by a different node that acquired the
glock in the meantime.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c       |  4 ++--
 fs/gfs2/file.c       |  2 +-
 fs/gfs2/glock.c      |  7 +++----
 fs/gfs2/glops.c      |  2 +-
 fs/gfs2/incore.h     |  1 +
 fs/gfs2/log.c        | 20 ++++++++------------
 fs/gfs2/meta_io.c    |  6 +++---
 fs/gfs2/ops_fstype.c |  3 +--
 fs/gfs2/quota.c      |  2 +-
 fs/gfs2/super.c      |  6 +++---
 fs/gfs2/sys.c        |  2 +-
 fs/gfs2/util.h       | 12 ++++++++++++
 12 files changed, 37 insertions(+), 30 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 05dd78f4b2b3..2bacce032a34 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -521,7 +521,7 @@ static int __gfs2_readpage(void *file, struct page *page)
 		error = mpage_readpage(page, gfs2_block_map);
 	}
 
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags)))
+	if (unlikely(gfs2_withdrawn(sdp)))
 		return -EIO;
 
 	return error;
@@ -638,7 +638,7 @@ static int gfs2_readpages(struct file *file, struct address_space *mapping,
 	gfs2_glock_dq(&gh);
 out_uninit:
 	gfs2_holder_uninit(&gh);
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags)))
+	if (unlikely(gfs2_withdrawn(sdp)))
 		ret = -EIO;
 	return ret;
 }
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 58a768e59712..bba39c73a43c 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1169,7 +1169,7 @@ static int gfs2_lock(struct file *file, int cmd, struct file_lock *fl)
 		cmd = F_SETLK;
 		fl->fl_type = F_UNLCK;
 	}
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags))) {
+	if (unlikely(gfs2_withdrawn(sdp))) {
 		if (fl->fl_type == F_UNLCK)
 			locks_lock_file_wait(file, fl);
 		return -EIO;
diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 15c605cfcfc8..fe9f9a22426e 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -547,7 +547,7 @@ __acquires(&gl->gl_lockref.lock)
 	unsigned int lck_flags = (unsigned int)(gh ? gh->gh_flags : 0);
 	int ret;
 
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags)) &&
+	if (unlikely(gfs2_withdrawn(sdp)) &&
 	    target != LM_ST_UNLOCKED)
 		return;
 	lck_flags &= (LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_NOEXP |
@@ -584,8 +584,7 @@ __acquires(&gl->gl_lockref.lock)
 		}
 		else if (ret) {
 			fs_err(sdp, "lm_lock ret %d\n", ret);
-			GLOCK_BUG_ON(gl, !test_bit(SDF_SHUTDOWN,
-						   &sdp->sd_flags));
+			GLOCK_BUG_ON(gl, !gfs2_withdrawn(sdp));
 		}
 	} else { /* lock_nolock */
 		finish_xmote(gl, target);
@@ -1097,7 +1096,7 @@ int gfs2_glock_nq(struct gfs2_holder *gh)
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	int error = 0;
 
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags)))
+	if (unlikely(gfs2_withdrawn(sdp)))
 		return -EIO;
 
 	if (test_bit(GLF_LRU, &gl->gl_flags))
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 78510ab91835..b9f36a85a4d4 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -538,7 +538,7 @@ static int freeze_go_xmote_bh(struct gfs2_glock *gl, struct gfs2_holder *gh)
 			gfs2_consist(sdp);
 
 		/*  Initialize some head of the log stuff  */
-		if (!test_bit(SDF_SHUTDOWN, &sdp->sd_flags)) {
+		if (!gfs2_withdrawn(sdp)) {
 			sdp->sd_log_sequence = head.lh_sequence + 1;
 			gfs2_log_pointers_init(sdp, head.lh_blkno);
 		}
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index c54800385298..003d9da937b4 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -620,6 +620,7 @@ enum {
 	SDF_SKIP_DLM_UNLOCK	= 8,
 	SDF_FORCE_AIL_FLUSH     = 9,
 	SDF_AIL1_IO_ERROR	= 10,
+	SDF_WITHDRAW		= 11, /* Will withdraw eventually */
 };
 
 enum gfs2_freeze_state {
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 76da6f046379..944aaf3d1816 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -92,8 +92,7 @@ static void gfs2_remove_from_ail(struct gfs2_bufdata *bd)
 
 static int gfs2_ail1_start_one(struct gfs2_sbd *sdp,
 			       struct writeback_control *wbc,
-			       struct gfs2_trans *tr,
-			       bool *withdraw)
+			       struct gfs2_trans *tr)
 __releases(&sdp->sd_ail_lock)
 __acquires(&sdp->sd_ail_lock)
 {
@@ -112,7 +111,7 @@ __acquires(&sdp->sd_ail_lock)
 			    !test_and_set_bit(SDF_AIL1_IO_ERROR,
 					      &sdp->sd_flags)) {
 				gfs2_io_error_bh(sdp, bh);
-				*withdraw = true;
+				set_bit(SDF_WITHDRAW, &sdp->sd_flags);
 			}
 			list_move(&bd->bd_ail_st_list, &tr->tr_ail2_list);
 			continue;
@@ -153,7 +152,6 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writeback_control *wbc)
 	struct list_head *head = &sdp->sd_ail1_list;
 	struct gfs2_trans *tr;
 	struct blk_plug plug;
-	bool withdraw = false;
 
 	trace_gfs2_ail_flush(sdp, wbc, 1);
 	blk_start_plug(&plug);
@@ -162,12 +160,12 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writeback_control *wbc)
 	list_for_each_entry_reverse(tr, head, tr_list) {
 		if (wbc->nr_to_write <= 0)
 			break;
-		if (gfs2_ail1_start_one(sdp, wbc, tr, &withdraw))
+		if (gfs2_ail1_start_one(sdp, wbc, tr))
 			goto restart;
 	}
 	spin_unlock(&sdp->sd_ail_lock);
 	blk_finish_plug(&plug);
-	if (withdraw)
+	if (test_bit(SDF_WITHDRAW, &sdp->sd_flags))
 		gfs2_lm_withdraw(sdp, NULL);
 	trace_gfs2_ail_flush(sdp, wbc, 0);
 }
@@ -196,8 +194,7 @@ static void gfs2_ail1_start(struct gfs2_sbd *sdp)
  *
  */
 
-static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
-				bool *withdraw)
+static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 {
 	struct gfs2_bufdata *bd, *s;
 	struct buffer_head *bh;
@@ -211,7 +208,7 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
 		if (!buffer_uptodate(bh) &&
 		    !test_and_set_bit(SDF_AIL1_IO_ERROR, &sdp->sd_flags)) {
 			gfs2_io_error_bh(sdp, bh);
-			*withdraw = true;
+			set_bit(SDF_WITHDRAW, &sdp->sd_flags);
 		}
 		list_move(&bd->bd_ail_st_list, &tr->tr_ail2_list);
 	}
@@ -229,11 +226,10 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp)
 	struct gfs2_trans *tr, *s;
 	int oldest_tr = 1;
 	int ret;
-	bool withdraw = false;
 
 	spin_lock(&sdp->sd_ail_lock);
 	list_for_each_entry_safe_reverse(tr, s, &sdp->sd_ail1_list, tr_list) {
-		gfs2_ail1_empty_one(sdp, tr, &withdraw);
+		gfs2_ail1_empty_one(sdp, tr);
 		if (list_empty(&tr->tr_ail1_list) && oldest_tr)
 			list_move(&tr->tr_list, &sdp->sd_ail2_list);
 		else
@@ -242,7 +238,7 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp)
 	ret = list_empty(&sdp->sd_ail1_list);
 	spin_unlock(&sdp->sd_ail_lock);
 
-	if (withdraw)
+	if (test_bit(SDF_WITHDRAW, &sdp->sd_flags))
 		gfs2_lm_withdraw(sdp, "fatal: I/O error(s)\n");
 
 	return ret;
diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 3201342404a7..b125008f064f 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -255,7 +255,7 @@ int gfs2_meta_read(struct gfs2_glock *gl, u64 blkno, int flags,
 	struct buffer_head *bh, *bhs[2];
 	int num = 0;
 
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags))) {
+	if (unlikely(gfs2_withdrawn(sdp))) {
 		*bhp = NULL;
 		return -EIO;
 	}
@@ -313,7 +313,7 @@ int gfs2_meta_read(struct gfs2_glock *gl, u64 blkno, int flags,
 
 int gfs2_meta_wait(struct gfs2_sbd *sdp, struct buffer_head *bh)
 {
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags)))
+	if (unlikely(gfs2_withdrawn(sdp)))
 		return -EIO;
 
 	wait_on_buffer(bh);
@@ -324,7 +324,7 @@ int gfs2_meta_wait(struct gfs2_sbd *sdp, struct buffer_head *bh)
 			gfs2_io_error_bh_wd(sdp, bh);
 		return -EIO;
 	}
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags)))
+	if (unlikely(gfs2_withdrawn(sdp)))
 		return -EIO;
 
 	return 0;
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index abfaecde0e3d..075f64075ff6 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -998,8 +998,7 @@ static int gfs2_lm_mount(struct gfs2_sbd *sdp, int silent)
 void gfs2_lm_unmount(struct gfs2_sbd *sdp)
 {
 	const struct lm_lockops *lm = sdp->sd_lockstruct.ls_ops;
-	if (likely(!test_bit(SDF_SHUTDOWN, &sdp->sd_flags)) &&
-	    lm->lm_unmount)
+	if (likely(!gfs2_withdrawn(sdp)) && lm->lm_unmount)
 		lm->lm_unmount(sdp);
 }
 
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 2ae5a109eea7..a8dfc86fd682 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1478,7 +1478,7 @@ static void quotad_error(struct gfs2_sbd *sdp, const char *msg, int error)
 {
 	if (error == 0 || error == -EROFS)
 		return;
-	if (!test_bit(SDF_SHUTDOWN, &sdp->sd_flags)) {
+	if (!gfs2_withdrawn(sdp)) {
 		fs_err(sdp, "gfs2_quotad: %s error %d\n", msg, error);
 		sdp->sd_log_error = error;
 		wake_up(&sdp->sd_logd_waitq);
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index dc4ec1ca3d4e..378519beb6c3 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -807,7 +807,7 @@ static void gfs2_dirty_inode(struct inode *inode, int flags)
 
 	if (!(flags & I_DIRTY_INODE))
 		return;
-	if (unlikely(test_bit(SDF_SHUTDOWN, &sdp->sd_flags)))
+	if (unlikely(gfs2_withdrawn(sdp)))
 		return;
 	if (!gfs2_glock_is_locked_by_me(ip->i_gl)) {
 		ret = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
@@ -856,7 +856,7 @@ static int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 
 	error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED, GL_NOCACHE,
 				   &freeze_gh);
-	if (error && !test_bit(SDF_SHUTDOWN, &sdp->sd_flags))
+	if (error && !gfs2_withdrawn(sdp))
 		return error;
 
 	flush_workqueue(gfs2_delete_workqueue);
@@ -1014,7 +1014,7 @@ static int gfs2_freeze(struct super_block *sb)
 	if (atomic_read(&sdp->sd_freeze_state) != SFS_UNFROZEN)
 		goto out;
 
-	if (test_bit(SDF_SHUTDOWN, &sdp->sd_flags)) {
+	if (gfs2_withdrawn(sdp)) {
 		error = -EINVAL;
 		goto out;
 	}
diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index 1787d295834e..b772ff5509bb 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -121,7 +121,7 @@ static ssize_t freeze_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
 
 static ssize_t withdraw_show(struct gfs2_sbd *sdp, char *buf)
 {
-	unsigned int b = test_bit(SDF_SHUTDOWN, &sdp->sd_flags);
+	unsigned int b = gfs2_withdrawn(sdp);
 	return snprintf(buf, PAGE_SIZE, "%u\n", b);
 }
 
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index 9278fecba632..0df65555545f 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -167,6 +167,18 @@ static inline unsigned int gfs2_tune_get_i(struct gfs2_tune *gt,
 	return x;
 }
 
+/**
+ * gfs2_withdrawn - test whether the file system is withdrawing or withdrawn
+ * @sdp: the superblock
+ */
+static inline bool gfs2_withdrawn(struct gfs2_sbd *sdp)
+{
+	if (test_bit(SDF_SHUTDOWN, &sdp->sd_flags) ||
+	    test_bit(SDF_WITHDRAW, &sdp->sd_flags))
+		return true;
+	return false;
+}
+
 #define gfs2_tune_get(sdp, field) \
 gfs2_tune_get_i(&(sdp)->sd_tune, &(sdp)->sd_tune.field)
 
-- 
2.20.1

