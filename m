Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF1E10309
	for <lists+cluster-devel@lfdr.de>; Wed,  1 May 2019 01:03:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C834B305B886;
	Tue, 30 Apr 2019 23:03:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0B006D09F;
	Tue, 30 Apr 2019 23:03:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8EAA53FAF4;
	Tue, 30 Apr 2019 23:03:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UN3P2h023056 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 19:03:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1A017C850; Tue, 30 Apr 2019 23:03:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-20.phx2.redhat.com [10.3.116.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AFD4681742
	for <cluster-devel@redhat.com>; Tue, 30 Apr 2019 23:03:25 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 30 Apr 2019 17:03:15 -0600
Message-Id: <20190430230319.10375-16-rpeterso@redhat.com>
In-Reply-To: <20190430230319.10375-1-rpeterso@redhat.com>
References: <20190430230319.10375-1-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v3 15/19] gfs2: Force withdraw to
	replay journals and wait for it to finish
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 30 Apr 2019 23:03:32 +0000 (UTC)

When a node withdraws from a file system, it often leaves its journal
in an incomplete state. This is especially true when the withdraw is
caused by io errors writing to the journal. Before this patch, a
withdraw would try to write a "shutdown" record to the journal, tell
dlm it's done with the file system, and none of the other nodes
know about the problem. Later, when the problem is fixed and the
withdrawn node is rebooted, it would then discover that its own
journal was incomplete, and replay it. However, replaying it at this
point is almost guaranteed to introduce corruption because the other
nodes are likely to have used affected resource groups that appeared
in the journal since the time of the withdraw. Replaying the journal
later will overwrite any changes made, and not through any fault of
dlm, which was instructed during the withdraw to release those
resources.

This patch makes file system withdraws seen by the entire cluster.
Withdrawing nodes dequeue their journal glock to allow recovery.

The remaining nodes check all the journals to see if they are
clean or in need of replay. They try to replay dirty journals, but
only the journals of withdrawn nodes will be "not busy" and
therefore available for replay.

Until the journal replay is complete, no i/o related glocks may be
given out, to ensure that the replay does not cause the
aforementioned corruption: We cannot allow any journal replay to
overwrite blocks associated with a glock once it is held. The
glocks not affected by a withdraw are permitted to be passed
around as normal during a withdraw. A new glops flag, called
GLOF_OK_AT_WITHDRAW, indicates glocks that may be passed around
freely while a withdraw is taking place.

One such glock is the "live" glock which is now used to signal when
a withdraw occurs. When a withdraw occurs, the node signals its
withdraw by dequeueing the "live" glock and trying to enqueue it
in EX mode, thus forcing the other nodes to all see a demote
request, by way of a "1CB" (one callback) try lock. The "live"
glock is not granted in EX; the callback is only just used to
indicate a withdraw has occurred.

Note that all nodes in the cluster must wait for the recovering
node to finish replaying the withdrawing node's journal before
continuing. To this end, it checks that the journals are clean
multiple times in a retry loop.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c      |  32 ++++++++++--
 fs/gfs2/glock.h      |   1 +
 fs/gfs2/glops.c      |  56 +++++++++++++++++++++
 fs/gfs2/incore.h     |   5 ++
 fs/gfs2/lock_dlm.c   |  32 ++++++++++++
 fs/gfs2/log.c        |   1 +
 fs/gfs2/meta_io.c    |   2 +-
 fs/gfs2/ops_fstype.c |   4 +-
 fs/gfs2/quota.c      |   4 ++
 fs/gfs2/super.c      |  47 ++++++++++++------
 fs/gfs2/super.h      |   1 +
 fs/gfs2/util.c       | 116 ++++++++++++++++++++++++++++++++++++++++++-
 12 files changed, 281 insertions(+), 20 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index eeb84d8d21f3..3d1b9bdfd0de 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -247,7 +247,7 @@ static void __gfs2_glock_put(struct gfs2_glock *gl)
 	gfs2_glock_remove_from_lru(gl);
 	spin_unlock(&gl->gl_lockref.lock);
 	GLOCK_BUG_ON(gl, !list_empty(&gl->gl_holders));
-	GLOCK_BUG_ON(gl, mapping && mapping->nrpages);
+	GLOCK_BUG_ON(gl, mapping && mapping->nrpages && !gfs2_withdrawn(sdp));
 	trace_gfs2_glock_put(gl);
 	sdp->sd_lockstruct.ls_ops->lm_put_lock(gl);
 }
@@ -548,7 +548,9 @@ __acquires(&gl->gl_lockref.lock)
 	int ret;
 
 	if (unlikely(gfs2_withdrawn(sdp)) &&
-	    (glops->go_flags & GLOF_JOURNALED) && target != LM_ST_UNLOCKED)
+	    (glops->go_flags & GLOF_JOURNALED) &&
+	    (gh && !(LM_FLAG_NOEXP & gh->gh_flags)) &&
+	    target != LM_ST_UNLOCKED)
 		return;
 	lck_flags &= (LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_NOEXP |
 		      LM_FLAG_PRIORITY);
@@ -1096,7 +1098,7 @@ int gfs2_glock_nq(struct gfs2_holder *gh)
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	int error = 0;
 
-	if (unlikely(gfs2_withdrawn(sdp)) &&
+	if (unlikely(gfs2_withdrawn(sdp)) && !(LM_FLAG_NOEXP & gh->gh_flags) &&
 	    (gl->gl_ops->go_flags & GLOF_JOURNALED))
 		return -EIO;
 
@@ -1141,11 +1143,30 @@ int gfs2_glock_poll(struct gfs2_holder *gh)
 void gfs2_glock_dq(struct gfs2_holder *gh)
 {
 	struct gfs2_glock *gl = gh->gh_gl;
+	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	const struct gfs2_glock_operations *glops = gl->gl_ops;
 	unsigned delay = 0;
 	int fast_path = 0;
 
 	spin_lock(&gl->gl_lockref.lock);
+	/**
+	 * If we're in the process of file system withdraw, we cannot just
+	 * dequeue any glocks until our journal is recovered, lest we
+	 * introduce file system corruption. We need two exceptions to this
+	 * rule: We need to allow unlocking of nondisk glocks and the glock
+	 * for our own journal that needs recovery. Note that evict may also
+	 * call this for the journal inode, but without using sdp->sd_jinode_gh
+	 * so we need to check the glock, not just the holder of the glock.
+	 */
+	if (test_bit(SDF_SHUTDOWN, &sdp->sd_flags) &&
+	    test_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags) &&
+	    (gl->gl_ops->go_flags & GLOF_JOURNALED) &&
+	    gh->gh_gl != sdp->sd_jinode_gl) {
+		sdp->sd_glock_dqs_held++;
+		might_sleep();
+		wait_on_bit(&sdp->sd_flags, SDF_WITHDRAW_RECOVERY,
+			    TASK_UNINTERRUPTIBLE);
+	}
 	if (gh->gh_flags & GL_NOCACHE)
 		handle_callback(gl, LM_ST_UNLOCKED, 0, false);
 
@@ -1625,6 +1646,11 @@ static void dump_glock_func(struct gfs2_glock *gl)
 	dump_glock(NULL, gl);
 }
 
+void gfs2_gl_flushwork(struct gfs2_sbd *sdp)
+{
+	flush_workqueue(glock_workqueue);
+}
+
 /**
  * gfs2_gl_hash_clear - Empty out the glock hash table
  * @sdp: the filesystem
diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index 936b3295839c..c1c40e2dbd96 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -202,6 +202,7 @@ extern int gfs2_glock_nq_num(struct gfs2_sbd *sdp, u64 number,
 			     struct gfs2_holder *gh);
 extern int gfs2_glock_nq_m(unsigned int num_gh, struct gfs2_holder *ghs);
 extern void gfs2_glock_dq_m(unsigned int num_gh, struct gfs2_holder *ghs);
+extern void gfs2_gl_flushwork(struct gfs2_sbd *sdp);
 extern void gfs2_dump_glock(struct seq_file *seq, struct gfs2_glock *gl);
 #define GLOCK_BUG_ON(gl,x) do { if (unlikely(x)) { gfs2_dump_glock(NULL, gl); BUG(); } } while(0)
 extern __printf(2, 3)
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index d2b44bdca17e..ff50013c6aa9 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -31,6 +31,8 @@
 
 struct workqueue_struct *gfs2_freeze_wq;
 
+extern struct workqueue_struct *gfs2_control_wq;
+
 static void gfs2_ail_error(struct gfs2_glock *gl, const struct buffer_head *bh)
 {
 	fs_err(gl->gl_name.ln_sbd,
@@ -506,6 +508,10 @@ static void freeze_go_sync(struct gfs2_glock *gl)
 		error = freeze_super(sdp->sd_vfs);
 		if (error) {
 			printk(KERN_INFO "GFS2: couldn't freeze filesystem: %d\n", error);
+			if (gfs2_withdrawn(sdp)) {
+				atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
+				return;
+			}
 			gfs2_assert_withdraw(sdp, 0);
 		}
 		queue_work(gfs2_freeze_wq, &sdp->sd_freeze_work);
@@ -580,6 +586,55 @@ static void iopen_go_callback(struct gfs2_glock *gl, bool remote)
 	}
 }
 
+/**
+ * nondisk_go_callback - used to signal when a node did a withdraw
+ * @gl: the nondisk glock
+ * @remote: true if this came from a different cluster node
+ *
+ */
+static void nondisk_go_callback(struct gfs2_glock *gl, bool remote)
+{
+	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
+
+	/* Ignore the callback unless it's from another node, and it's the
+	   live lock. */
+	if (!remote || gl->gl_name.ln_number != GFS2_LIVE_LOCK)
+		return;
+
+	/* First order of business is to cancel the demote request. We don't
+	 * really want to demote a nondisk glock. At best it's just to inform
+	 * us of a another node's withdraw. We'll keep it in SH mode. */
+	clear_bit(GLF_DEMOTE, &gl->gl_flags);
+	clear_bit(GLF_PENDING_DEMOTE, &gl->gl_flags);
+
+	/* Ignore the unlock if we're withdrawn, unmounting, or in recovery. */
+	if (test_bit(SDF_NORECOVERY, &sdp->sd_flags) ||
+	    test_bit(SDF_SHUTDOWN, &sdp->sd_flags) ||
+	    test_bit(SDF_REMOTE_WITHDRAW, &sdp->sd_flags))
+		return;
+
+	/* We only care when a node wants us to unlock, because that means
+	 * they want a journal recovered. */
+	if (gl->gl_demote_state != LM_ST_UNLOCKED)
+		return;
+
+	if (sdp->sd_args.ar_spectator) {
+		fs_warn(sdp, "Spectator node cannot recover journals.\n");
+		return;
+	}
+
+	fs_warn(sdp, "Some node has withdrawn; checking for recovery.\n");
+	set_bit(SDF_REMOTE_WITHDRAW, &sdp->sd_flags);
+	/**
+	 * We can't call remote_withdraw directly here or gfs2_recover_journal
+	 * because this is called from the glock unlock function and the
+	 * remote_withdraw needs to enqueue and dequeue the same "live" glock
+	 * we were called from. So we queue it to the control work queue in
+	 * lock_dlm.
+	 */
+	queue_delayed_work(gfs2_control_wq, &sdp->sd_control_work, 0);
+}
+
 const struct gfs2_glock_operations gfs2_meta_glops = {
 	.go_type = LM_TYPE_META,
 };
@@ -634,6 +689,7 @@ const struct gfs2_glock_operations gfs2_flock_glops = {
 
 const struct gfs2_glock_operations gfs2_nondisk_glops = {
 	.go_type = LM_TYPE_NONDISK,
+	.go_callback = nondisk_go_callback,
 };
 
 const struct gfs2_glock_operations gfs2_quota_glops = {
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 0b283bbd20ea..60b094bad47e 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -629,6 +629,9 @@ enum {
 	SDF_FORCE_AIL_FLUSH     = 9,
 	SDF_WITHDRAW		= 10, /* Will withdraw eventually */
 	SDF_WITHDRAW_IN_PROG	= 11, /* Withdraw is in progress */
+	SDF_REMOTE_WITHDRAW	= 12, /* Performing remote recovery */
+	SDF_WITHDRAW_RECOVERY	= 13, /* Wait for journal recovery when we are
+					 withdrawing */
 };
 
 enum gfs2_freeze_state {
@@ -777,6 +780,7 @@ struct gfs2_sbd {
 	struct gfs2_jdesc *sd_jdesc;
 	struct gfs2_holder sd_journal_gh;
 	struct gfs2_holder sd_jinode_gh;
+	struct gfs2_glock *sd_jinode_gl;
 
 	struct gfs2_holder sd_sc_gh;
 	struct gfs2_holder sd_qc_gh;
@@ -863,6 +867,7 @@ struct gfs2_sbd {
 
 	unsigned long sd_last_warning;
 	struct dentry *debugfs_dir;    /* debugfs directory */
+	unsigned long sd_glock_dqs_held;
 };
 
 static inline void gfs2_glstats_inc(struct gfs2_glock *gl, int which)
diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 9329f86ffcbe..444c481f985d 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -19,6 +19,8 @@
 
 #include "incore.h"
 #include "glock.h"
+#include "glops.h"
+#include "recovery.h"
 #include "util.h"
 #include "sys.h"
 #include "trace_gfs2.h"
@@ -325,6 +327,7 @@ static void gdlm_cancel(struct gfs2_glock *gl)
 /*
  * dlm/gfs2 recovery coordination using dlm_recover callbacks
  *
+ *  0. gfs2 checks for another cluster node withdraw, needing journal replay
  *  1. dlm_controld sees lockspace members change
  *  2. dlm_controld blocks dlm-kernel locking activity
  *  3. dlm_controld within dlm-kernel notifies gfs2 (recover_prep)
@@ -573,6 +576,28 @@ static int control_lock(struct gfs2_sbd *sdp, int mode, uint32_t flags)
 			 &ls->ls_control_lksb, "control_lock");
 }
 
+/**
+ * remote_withdraw - react to a node withdrawing from the file system
+ * @sdp: The superblock
+ */
+static void remote_withdraw(struct gfs2_sbd *sdp)
+{
+	struct gfs2_jdesc *jd;
+	int ret = 0, count = 0;
+
+	list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
+		if (jd->jd_jid == sdp->sd_lockstruct.ls_jid)
+			continue;
+		ret = gfs2_recover_journal(jd, true);
+		if (ret)
+			break;
+		count++;
+	}
+
+	/* Now drop the additional reference we acquired */
+	fs_err(sdp, "Journals checked: %d, ret = %d.\n", count, ret);
+}
+
 static void gfs2_control_func(struct work_struct *work)
 {
 	struct gfs2_sbd *sdp = container_of(work, struct gfs2_sbd, sd_control_work.work);
@@ -583,6 +608,13 @@ static void gfs2_control_func(struct work_struct *work)
 	int recover_size;
 	int i, error;
 
+	/* First check for other nodes that may have done a withdraw. */
+	if (test_bit(SDF_REMOTE_WITHDRAW, &sdp->sd_flags)) {
+		remote_withdraw(sdp);
+		clear_bit(SDF_REMOTE_WITHDRAW, &sdp->sd_flags);
+		return;
+	}
+
 	spin_lock(&ls->ls_recover_spin);
 	/*
 	 * No MOUNT_DONE means we're still mounting; control_mount()
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 771589b2e225..732b585f33be 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -1023,6 +1023,7 @@ int gfs2_logd(void *data)
 					 "withdrawing the file system to "
 					 "prevent further damage.\n",
 					 sdp->sd_fsname, sdp->sd_log_error);
+			break;
 		}
 
 		did_flush = false;
diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index b125008f064f..49adeadd5868 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -255,7 +255,7 @@ int gfs2_meta_read(struct gfs2_glock *gl, u64 blkno, int flags,
 	struct buffer_head *bh, *bhs[2];
 	int num = 0;
 
-	if (unlikely(gfs2_withdrawn(sdp))) {
+	if (unlikely(gfs2_withdrawn(sdp)) && gl != sdp->sd_jinode_gl) {
 		*bhp = NULL;
 		return -EIO;
 	}
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 531c1870de8e..c4222c1fa735 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -650,7 +650,8 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 
 		error = gfs2_glock_nq_num(sdp, sdp->sd_lockstruct.ls_jid,
 					  &gfs2_journal_glops,
-					  LM_ST_EXCLUSIVE, LM_FLAG_NOEXP,
+					  LM_ST_EXCLUSIVE,
+					  LM_FLAG_NOEXP | GL_NOCACHE,
 					  &sdp->sd_journal_gh);
 		if (error) {
 			fs_err(sdp, "can't acquire journal glock: %d\n", error);
@@ -658,6 +659,7 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 		}
 
 		ip = GFS2_I(sdp->sd_jdesc->jd_inode);
+		sdp->sd_jinode_gl = ip->i_gl;
 		error = gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED,
 					   LM_FLAG_NOEXP | GL_EXACT | GL_NOCACHE,
 					   &sdp->sd_jinode_gh);
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index acb6cbdd1431..6075d26c9d78 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1575,6 +1575,10 @@ int gfs2_quotad(void *data)
 		else
 			t = 0;
 		finish_wait(&sdp->sd_quota_wait, &wait);
+
+		if (atomic_read(&sdp->sd_withdrawer) ==
+		    pid_nr(task_pid(current)))
+			break;
 	}
 
 	return 0;
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 4ae23c338034..1582cb11866e 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -845,35 +845,52 @@ static void gfs2_dirty_inode(struct inode *inode, int flags)
 /**
  * gfs2_make_fs_ro - Turn a Read-Write FS into a Read-Only one
  * @sdp: the filesystem
+ * @withdrawing: if 1, we're withdrawing so only do what's necessary
  *
  * Returns: errno
  */
 
-static int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
+int gfs2_make_fs_ro(struct gfs2_sbd *sdp, int withdrawing)
 {
 	struct gfs2_holder freeze_gh;
+	int flags = GL_NOCACHE;
 	int error;
 
-	error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED, GL_NOCACHE,
+	if (withdrawing)
+		flags |= LM_FLAG_TRY;
+	gfs2_holder_mark_uninitialized(&freeze_gh);
+	error = gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED, flags,
 				   &freeze_gh);
+	if (error == GLR_TRYFAILED)
+		error = 0;
+
 	if (error && !gfs2_withdrawn(sdp))
 		return error;
 
 	flush_workqueue(gfs2_delete_workqueue);
-	if (sdp->sd_quotad_process)
+
+	if (current == sdp->sd_quotad_process)
+		fs_warn(sdp, "The quotad daemon is withdrawing.\n");
+	else if (sdp->sd_quotad_process)
 		kthread_stop(sdp->sd_quotad_process);
 	sdp->sd_quotad_process = NULL;
-	if (sdp->sd_logd_process)
+
+	if (current == sdp->sd_logd_process)
+		fs_warn(sdp, "The logd daemon is withdrawing.\n");
+	else if (sdp->sd_logd_process)
 		kthread_stop(sdp->sd_logd_process);
 	sdp->sd_logd_process = NULL;
 
-	gfs2_quota_sync(sdp->sd_vfs, 0);
-	gfs2_statfs_sync(sdp->sd_vfs, 0);
-
-	gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
-		       GFS2_LFC_MAKE_FS_RO);
+	if (!withdrawing) {
+		gfs2_quota_sync(sdp->sd_vfs, 0);
+		gfs2_statfs_sync(sdp->sd_vfs, 0);
+		gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
+			       GFS2_LFC_MAKE_FS_RO);
+	}
 	wait_event(sdp->sd_reserving_log_wait, atomic_read(&sdp->sd_reserving_log) == 0);
-	gfs2_assert_warn(sdp, atomic_read(&sdp->sd_log_blks_free) == sdp->sd_jdesc->jd_blocks);
+	if (!withdrawing)
+		gfs2_assert_warn(sdp, atomic_read(&sdp->sd_log_blks_free) ==
+				 sdp->sd_jdesc->jd_blocks);
 
 	if (gfs2_holder_initialized(&freeze_gh))
 		gfs2_glock_dq_uninit(&freeze_gh);
@@ -913,7 +930,7 @@ static void gfs2_put_super(struct super_block *sb)
 	spin_unlock(&sdp->sd_jindex_spin);
 
 	if (!sb_rdonly(sb)) {
-		error = gfs2_make_fs_ro(sdp);
+		error = gfs2_make_fs_ro(sdp, 0);
 		if (error)
 			gfs2_io_error(sdp);
 	}
@@ -930,8 +947,10 @@ static void gfs2_put_super(struct super_block *sb)
 	gfs2_glock_put(sdp->sd_freeze_gl);
 
 	if (!sdp->sd_args.ar_spectator) {
-		gfs2_glock_dq_uninit(&sdp->sd_journal_gh);
-		gfs2_glock_dq_uninit(&sdp->sd_jinode_gh);
+		if (gfs2_holder_initialized(&sdp->sd_journal_gh))
+			gfs2_glock_dq_uninit(&sdp->sd_journal_gh);
+		if (gfs2_holder_initialized(&sdp->sd_jinode_gh))
+			gfs2_glock_dq_uninit(&sdp->sd_jinode_gh);
 		gfs2_glock_dq_uninit(&sdp->sd_sc_gh);
 		gfs2_glock_dq_uninit(&sdp->sd_qc_gh);
 		iput(sdp->sd_sc_inode);
@@ -1279,7 +1298,7 @@ static int gfs2_remount_fs(struct super_block *sb, int *flags, char *data)
 
 	if ((sb->s_flags ^ *flags) & SB_RDONLY) {
 		if (*flags & SB_RDONLY)
-			error = gfs2_make_fs_ro(sdp);
+			error = gfs2_make_fs_ro(sdp, 0);
 		else
 			error = gfs2_make_fs_rw(sdp);
 	}
diff --git a/fs/gfs2/super.h b/fs/gfs2/super.h
index 73c97dccae21..e859c6d5bb3e 100644
--- a/fs/gfs2/super.h
+++ b/fs/gfs2/super.h
@@ -45,6 +45,7 @@ extern void gfs2_statfs_change_in(struct gfs2_statfs_change_host *sc,
 extern void update_statfs(struct gfs2_sbd *sdp, struct buffer_head *m_bh,
 			  struct buffer_head *l_bh);
 extern int gfs2_statfs_sync(struct super_block *sb, int type);
+extern int gfs2_make_fs_ro(struct gfs2_sbd *sdp, int withdrawing);
 extern void gfs2_freeze_func(struct work_struct *work);
 
 extern struct file_system_type gfs2_fs_type;
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index ad56f934ff0f..5e39859d58d8 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -14,11 +14,13 @@
 #include <linux/buffer_head.h>
 #include <linux/crc32.h>
 #include <linux/gfs2_ondisk.h>
+#include <linux/delay.h>
 #include <linux/uaccess.h>
 
 #include "gfs2.h"
 #include "incore.h"
 #include "glock.h"
+#include "log.h"
 #include "lops.h"
 #include "recovery.h"
 #include "rgrp.h"
@@ -81,6 +83,116 @@ int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd)
 	return error;
 }
 
+static void signal_our_withdraw(struct gfs2_sbd *sdp)
+{
+	struct gfs2_glock *gl = sdp->sd_live_gh.gh_gl;
+	int ret = 0;
+	int tries;
+
+	if (test_bit(SDF_NORECOVERY, &sdp->sd_flags))
+		return;
+
+	/* Prevent any glock dq until withdraw recovery is complete */
+	set_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags);
+	/**
+	 * Don't tell dlm we're bailing until we have no more buffers in the
+	 * wind. If journal had an IO error, the log code should just purge
+	 * the outstanding buffers rather than submitting new IO. Making the
+	 * file system read-only will flush the journal, etc.
+	 *
+	 * During a normal unmount, gfs2_make_fs_ro calls gfs2_log_shutdown
+	 * which clears SDF_JOURNAL_LIVE. In a withdraw, we must not write
+	 * any UNMOUNT log header, so we can't call gfs2_log_shutdown, and
+	 * therefore we need to clear SDF_JOURNAL_LIVE manually.
+	 */
+	clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
+	if (!sb_rdonly(sdp->sd_vfs)) {
+		ret = gfs2_make_fs_ro(sdp, 1);
+		sdp->sd_vfs->s_flags |= SB_RDONLY;
+	}
+
+	/* Drop the glock for our journal so another node can recover it. */
+	gfs2_glock_dq_wait(&sdp->sd_journal_gh);
+	gfs2_holder_uninit(&sdp->sd_journal_gh);
+	sdp->sd_jinode_gh.gh_flags |= GL_NOCACHE;
+	gfs2_glock_dq_wait(&sdp->sd_jinode_gh);
+	/* holder_uninit to force glock_put, to force dlm to let go */
+	gfs2_holder_uninit(&sdp->sd_jinode_gh);
+	/* Note: We need to be careful here:
+	 * Func gfs2_jindex_free calls iput on jd_inode, which will evict it.
+	 * The evict, in turn, will dequeue its glock, but the glock dq will
+	 * wait for the withdraw unless we have exception code in glock_dq. */
+	gfs2_jindex_free(sdp);
+	/* Flush the glock work so the glock is freed. This allows try locks
+	 * on other nodes to be successful, otherwise we remain the owner of
+	 * the glock until the workqueue gets around to running. */
+	gfs2_gl_flushwork(sdp);
+
+	if (sdp->sd_lockstruct.ls_ops->lm_lock == NULL) { /* lock_nolock */
+		clear_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags);
+		goto skip_recovery;
+	}
+	/**
+	 * Dequeue the "live" glock, but keep a reference so it's never freed.
+	 */
+	gfs2_glock_hold(gl);
+	gfs2_glock_dq_wait(&sdp->sd_live_gh);
+	/**
+	 * We enqueue the "live" glock in EX so that all other nodes
+	 * get a demote request and act on it. We don't really want the
+	 * lock in EX, so we send a "try" lock with 1CB to produce a callback.
+	 */
+	fs_warn(sdp, "Requesting recovery of jid %d.\n",
+		sdp->sd_lockstruct.ls_jid);
+	gfs2_holder_reinit(LM_ST_EXCLUSIVE, LM_FLAG_TRY_1CB | LM_FLAG_NOEXP,
+			   &sdp->sd_live_gh);
+	msleep(GL_GLOCK_MAX_HOLD);
+	/* This will likely fail in a cluster, but succeed standalone: */
+	ret = gfs2_glock_nq(&sdp->sd_live_gh);
+	/* If we actually got the "live" lock in EX mode, there are no other
+	 * nodes available to replay our journal. So we try to replay it
+	 * ourselves. We hold the "live" glock to prevent other mounters
+	 * during recovery, then just dequeue it and reacquire it in our
+	 * normal SH mode. Just in case the problem that caused us to
+	 * withdraw prevents us from recovering our journal (e.g. io errors
+	 * and such) we still check if the journal is clean before proceeding
+	 * but we may wait forever until another mounter does the recovery. */
+	if (ret == 0) {
+		fs_warn(sdp, "No other mounters found. Trying to recover our "
+			"own journal jid %d.\n", sdp->sd_lockstruct.ls_jid);
+		if (gfs2_recover_journal(sdp->sd_jdesc, 1))
+			fs_warn(sdp, "Unable to recover our journal jid %d.\n",
+				sdp->sd_lockstruct.ls_jid);
+		gfs2_glock_dq_wait(&sdp->sd_live_gh);
+		gfs2_holder_reinit(LM_ST_SHARED, LM_FLAG_NOEXP | GL_EXACT,
+				   &sdp->sd_live_gh);
+		gfs2_glock_nq(&sdp->sd_live_gh);
+	}
+	/* Now drop the additional reference we acquired */
+	gfs2_glock_queue_put(gl);
+	clear_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags);
+
+	/* Now wait until recovery complete. */
+	for (tries = 0; tries < 10; tries++) {
+		ret = check_journal_clean(sdp, sdp->sd_jdesc);
+		if (!ret)
+			break;
+		msleep(HZ);
+		fs_warn(sdp, "Waiting for journal recovery jid %d.\n",
+			sdp->sd_lockstruct.ls_jid);
+	}
+skip_recovery:
+	if (!ret)
+		fs_warn(sdp, "Journal recovery complete for jid %d.\n",
+			sdp->sd_lockstruct.ls_jid);
+	else
+		fs_warn(sdp, "Journal recovery skipped for %d until next "
+			"mount.\n", sdp->sd_lockstruct.ls_jid);
+	fs_warn(sdp, "Glock dequeues delayed: %lu\n", sdp->sd_glock_dqs_held);
+	sdp->sd_glock_dqs_held = 0;
+	wake_up_bit(&sdp->sd_flags, SDF_WITHDRAW_RECOVERY);
+}
+
 int gfs2_lm_withdraw(struct gfs2_sbd *sdp, const char *fmt, ...)
 {
 	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
@@ -121,6 +233,8 @@ int gfs2_lm_withdraw(struct gfs2_sbd *sdp, const char *fmt, ...)
 		fs_err(sdp, "about to withdraw this file system\n");
 		BUG_ON(sdp->sd_args.ar_debug);
 
+		signal_our_withdraw(sdp);
+
 		kobject_uevent(&sdp->sd_kobj, KOBJ_OFFLINE);
 
 		if (!strcmp(sdp->sd_lockstruct.ls_ops->lm_proto_name, "lock_dlm"))
@@ -131,7 +245,7 @@ int gfs2_lm_withdraw(struct gfs2_sbd *sdp, const char *fmt, ...)
 			lm->lm_unmount(sdp);
 		}
 		set_bit(SDF_SKIP_DLM_UNLOCK, &sdp->sd_flags);
-		fs_err(sdp, "withdrawn\n");
+		fs_err(sdp, "File system withdrawn\n");
 		dump_stack();
 		clear_bit(SDF_WITHDRAW_IN_PROG, &sdp->sd_flags);
 		smp_mb__after_atomic();
-- 
2.20.1

