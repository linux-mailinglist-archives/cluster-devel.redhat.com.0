Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DA16E1667A6
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 20:54:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582228458;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9yzcYCXZHkuHeMIqqYTDSGdbXdC+n2FarkDo37+3268=;
	b=dfEOPOqsI7IHgXA/HbDxZbkFDw1UXYs9krfAWw/LA7Yt8Ejd0gUQJa5zRfMSIecOcPlqDU
	BWsrPfFDMynU2QJbkRoaSzyYmZdNOfbMtnjDDYkKJnUqlrQwoeRrkXHzrlSGEkiox6iDTh
	SZ3/RQNntieuXyA2Jgh5vN/dnQtbMBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-dpYltCnAPM-86NQtzjkUOA-1; Thu, 20 Feb 2020 14:54:12 -0500
X-MC-Unique: dpYltCnAPM-86NQtzjkUOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D677100DFC0;
	Thu, 20 Feb 2020 19:54:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5971F19E9C;
	Thu, 20 Feb 2020 19:54:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 38C9118089CD;
	Thu, 20 Feb 2020 19:54:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KJs8es009248 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 14:54:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BAE5890F65; Thu, 20 Feb 2020 19:54:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACF0190F74
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 19:54:06 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 20 Feb 2020 13:53:15 -0600
Message-Id: <20200220195329.952027-15-rpeterso@redhat.com>
In-Reply-To: <20200220195329.952027-1-rpeterso@redhat.com>
References: <20200220195329.952027-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 14/28] gfs2: Force withdraw to replay
	journals and wait for it to finish
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

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
overwrite blocks associated with a glock once it is held.

The "live" glock which is now used to signal when a withdraw
occurs. When a withdraw occurs, the node signals its withdraw by
dequeueing the "live" glock and trying to enqueue it in EX mode,
thus forcing the other nodes to all see a demote request, by way
of a "1CB" (one callback) try lock. The "live" glock is not
granted in EX; the callback is only just used to indicate a
withdraw has occurred.

Note that all nodes in the cluster must wait for the recovering
node to finish replaying the withdrawing node's journal before
continuing. To this end, it checks that the journals are clean
multiple times in a retry loop.

Also note that the withdraw function may be called from a wide
variety of situations, and therefore, we need to take extra
precautions to make sure pointers are valid before using them in
many circumstances.

We also need to take care when glocks decide to withdraw, since
the withdraw code now uses glocks.

Also, before this patch, if a process encountered an error and
decided to withdraw, if another process was already withdrawing,
the second withdraw would be silently ignored, which set it free
to unlock its glocks. That's correct behavior if the original
withdrawer encounters further errors down the road. But if
secondary waiters don't wait for the journal replay, unlocking
glocks will allow other nodes to use them, despite the fact that
the journal containing those blocks is being replayed. The
replay needs to finish before our glocks are released to other
nodes. IOW, secondary withdraws need to wait for the first
withdraw to finish.

For example, if an rgrp glock is unlocked by a process that didn't
wait for the first withdraw, a journal replay could introduce file
system corruption by replaying a rgrp block that has already been
granted to a different cluster node.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c      |  23 +++++-
 fs/gfs2/glops.c      |  77 +++++++++++++++++-
 fs/gfs2/incore.h     |   9 +++
 fs/gfs2/lock_dlm.c   |  34 ++++++++
 fs/gfs2/meta_io.c    |   2 +-
 fs/gfs2/ops_fstype.c |  11 ++-
 fs/gfs2/quota.c      |   3 +
 fs/gfs2/super.c      |  75 +++++++++++++-----
 fs/gfs2/super.h      |   1 -
 fs/gfs2/sys.c        |   2 +
 fs/gfs2/util.c       | 183 ++++++++++++++++++++++++++++++++++++++++++-
 11 files changed, 389 insertions(+), 31 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 454d94dd8933..7602d0e2492c 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -271,7 +271,7 @@ static void __gfs2_glock_put(struct gfs2_glock *gl)
 =09gfs2_glock_remove_from_lru(gl);
 =09spin_unlock(&gl->gl_lockref.lock);
 =09GLOCK_BUG_ON(gl, !list_empty(&gl->gl_holders));
-=09GLOCK_BUG_ON(gl, mapping && mapping->nrpages);
+=09GLOCK_BUG_ON(gl, mapping && mapping->nrpages && !gfs2_withdrawn(sdp));
 =09trace_gfs2_glock_put(gl);
 =09sdp->sd_lockstruct.ls_ops->lm_put_lock(gl);
 }
@@ -576,7 +576,8 @@ __acquires(&gl->gl_lockref.lock)
 =09unsigned int lck_flags =3D (unsigned int)(gh ? gh->gh_flags : 0);
 =09int ret;
=20
-=09if (target !=3D LM_ST_UNLOCKED && glock_blocked_by_withdraw(gl))
+=09if (target !=3D LM_ST_UNLOCKED && glock_blocked_by_withdraw(gl) &&
+=09    gh && !(gh->gh_flags & LM_FLAG_NOEXP))
 =09=09return;
 =09lck_flags &=3D (LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_NOEXP |
 =09=09      LM_FLAG_PRIORITY);
@@ -1222,7 +1223,7 @@ int gfs2_glock_nq(struct gfs2_holder *gh)
 =09struct gfs2_glock *gl =3D gh->gh_gl;
 =09int error =3D 0;
=20
-=09if (glock_blocked_by_withdraw(gl))
+=09if (glock_blocked_by_withdraw(gl) && !(gh->gh_flags & LM_FLAG_NOEXP))
 =09=09return -EIO;
=20
 =09if (test_bit(GLF_LRU, &gl->gl_flags))
@@ -1266,10 +1267,26 @@ int gfs2_glock_poll(struct gfs2_holder *gh)
 void gfs2_glock_dq(struct gfs2_holder *gh)
 {
 =09struct gfs2_glock *gl =3D gh->gh_gl;
+=09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
 =09unsigned delay =3D 0;
 =09int fast_path =3D 0;
=20
 =09spin_lock(&gl->gl_lockref.lock);
+=09/*
+=09 * If we're in the process of file system withdraw, we cannot just
+=09 * dequeue any glocks until our journal is recovered, lest we
+=09 * introduce file system corruption. We need two exceptions to this
+=09 * rule: We need to allow unlocking of nondisk glocks and the glock
+=09 * for our own journal that needs recovery.
+=09 */
+=09if (test_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags) &&
+=09    glock_blocked_by_withdraw(gl) &&
+=09    gh->gh_gl !=3D sdp->sd_jinode_gl) {
+=09=09sdp->sd_glock_dqs_held++;
+=09=09might_sleep();
+=09=09wait_on_bit(&sdp->sd_flags, SDF_WITHDRAW_RECOVERY,
+=09=09=09    TASK_UNINTERRUPTIBLE);
+=09}
 =09if (gh->gh_flags & GL_NOCACHE)
 =09=09handle_callback(gl, LM_ST_UNLOCKED, 0, false);
=20
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 3553ca939337..7cfacbe35e59 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -29,6 +29,8 @@
=20
 struct workqueue_struct *gfs2_freeze_wq;
=20
+extern struct workqueue_struct *gfs2_control_wq;
+
 static void gfs2_ail_error(struct gfs2_glock *gl, const struct buffer_head=
 *bh)
 {
 =09fs_err(gl->gl_name.ln_sbd,
@@ -496,13 +498,17 @@ static void freeze_go_sync(struct gfs2_glock *gl)
 =09int error =3D 0;
 =09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
=20
-=09if (gl->gl_state =3D=3D LM_ST_SHARED &&
+=09if (gl->gl_state =3D=3D LM_ST_SHARED && !gfs2_withdrawn(sdp) &&
 =09    test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags)) {
 =09=09atomic_set(&sdp->sd_freeze_state, SFS_STARTING_FREEZE);
 =09=09error =3D freeze_super(sdp->sd_vfs);
 =09=09if (error) {
 =09=09=09fs_info(sdp, "GFS2: couldn't freeze filesystem: %d\n",
 =09=09=09=09error);
+=09=09=09if (gfs2_withdrawn(sdp)) {
+=09=09=09=09atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
+=09=09=09=09return;
+=09=09=09}
 =09=09=09gfs2_assert_withdraw(sdp, 0);
 =09=09}
 =09=09queue_work(gfs2_freeze_wq, &sdp->sd_freeze_work);
@@ -577,6 +583,73 @@ static void iopen_go_callback(struct gfs2_glock *gl, b=
ool remote)
 =09}
 }
=20
+/**
+ * inode_go_free - wake up anyone waiting for dlm's unlock ast to free it
+ * @gl: glock being freed
+ *
+ * For now, this is only used for the journal inode glock. In withdraw
+ * situations, we need to wait for the glock to be freed so that we know
+ * other nodes may proceed with recovery / journal replay.
+ */
+static void inode_go_free(struct gfs2_glock *gl)
+{
+=09/* Note that we cannot reference gl_object because it's already set
+=09 * to NULL by this point in its lifecycle. */
+=09if (!test_bit(GLF_FREEING, &gl->gl_flags))
+=09=09return;
+=09clear_bit_unlock(GLF_FREEING, &gl->gl_flags);
+=09wake_up_bit(&gl->gl_flags, GLF_FREEING);
+}
+
+/**
+ * nondisk_go_callback - used to signal when a node did a withdraw
+ * @gl: the nondisk glock
+ * @remote: true if this came from a different cluster node
+ *
+ */
+static void nondisk_go_callback(struct gfs2_glock *gl, bool remote)
+{
+=09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
+
+=09/* Ignore the callback unless it's from another node, and it's the
+=09   live lock. */
+=09if (!remote || gl->gl_name.ln_number !=3D GFS2_LIVE_LOCK)
+=09=09return;
+
+=09/* First order of business is to cancel the demote request. We don't
+=09 * really want to demote a nondisk glock. At best it's just to inform
+=09 * us of another node's withdraw. We'll keep it in SH mode. */
+=09clear_bit(GLF_DEMOTE, &gl->gl_flags);
+=09clear_bit(GLF_PENDING_DEMOTE, &gl->gl_flags);
+
+=09/* Ignore the unlock if we're withdrawn, unmounting, or in recovery. */
+=09if (test_bit(SDF_NORECOVERY, &sdp->sd_flags) ||
+=09    test_bit(SDF_WITHDRAWN, &sdp->sd_flags) ||
+=09    test_bit(SDF_REMOTE_WITHDRAW, &sdp->sd_flags))
+=09=09return;
+
+=09/* We only care when a node wants us to unlock, because that means
+=09 * they want a journal recovered. */
+=09if (gl->gl_demote_state !=3D LM_ST_UNLOCKED)
+=09=09return;
+
+=09if (sdp->sd_args.ar_spectator) {
+=09=09fs_warn(sdp, "Spectator node cannot recover journals.\n");
+=09=09return;
+=09}
+
+=09fs_warn(sdp, "Some node has withdrawn; checking for recovery.\n");
+=09set_bit(SDF_REMOTE_WITHDRAW, &sdp->sd_flags);
+=09/*
+=09 * We can't call remote_withdraw directly here or gfs2_recover_journal
+=09 * because this is called from the glock unlock function and the
+=09 * remote_withdraw needs to enqueue and dequeue the same "live" glock
+=09 * we were called from. So we queue it to the control work queue in
+=09 * lock_dlm.
+=09 */
+=09queue_delayed_work(gfs2_control_wq, &sdp->sd_control_work, 0);
+}
+
 const struct gfs2_glock_operations gfs2_meta_glops =3D {
 =09.go_type =3D LM_TYPE_META,
 =09.go_flags =3D GLOF_NONDISK,
@@ -590,6 +663,7 @@ const struct gfs2_glock_operations gfs2_inode_glops =3D=
 {
 =09.go_dump =3D inode_go_dump,
 =09.go_type =3D LM_TYPE_INODE,
 =09.go_flags =3D GLOF_ASPACE | GLOF_LRU,
+=09.go_free =3D inode_go_free,
 };
=20
 const struct gfs2_glock_operations gfs2_rgrp_glops =3D {
@@ -623,6 +697,7 @@ const struct gfs2_glock_operations gfs2_flock_glops =3D=
 {
 const struct gfs2_glock_operations gfs2_nondisk_glops =3D {
 =09.go_type =3D LM_TYPE_NONDISK,
 =09.go_flags =3D GLOF_NONDISK,
+=09.go_callback =3D nondisk_go_callback,
 };
=20
 const struct gfs2_glock_operations gfs2_quota_glops =3D {
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 3072707aff7a..8cd564bcf5e6 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -242,6 +242,7 @@ struct gfs2_glock_operations {
 =09void (*go_dump)(struct seq_file *seq, struct gfs2_glock *gl,
 =09=09=09const char *fs_id_buf);
 =09void (*go_callback)(struct gfs2_glock *gl, bool remote);
+=09void (*go_free)(struct gfs2_glock *gl);
 =09const int go_type;
 =09const unsigned long go_flags;
 #define GLOF_ASPACE 1 /* address space attached */
@@ -343,6 +344,7 @@ enum {
 =09GLF_OBJECT=09=09=09=3D 14, /* Used only for tracing */
 =09GLF_BLOCKING=09=09=09=3D 15,
 =09GLF_INODE_CREATING=09=09=3D 16, /* Inode creation occurring */
+=09GLF_FREEING=09=09=09=3D 18, /* Wait for glock to be freed */
 };
=20
 struct gfs2_glock {
@@ -619,6 +621,10 @@ enum {
 =09SDF_FORCE_AIL_FLUSH     =3D 9,
 =09SDF_FS_FROZEN           =3D 10,
 =09SDF_WITHDRAWING=09=09=3D 11, /* Will withdraw eventually */
+=09SDF_WITHDRAW_IN_PROG=09=3D 12, /* Withdraw is in progress */
+=09SDF_REMOTE_WITHDRAW=09=3D 13, /* Performing remote recovery */
+=09SDF_WITHDRAW_RECOVERY=09=3D 14, /* Wait for journal recovery when we ar=
e
+=09=09=09=09=09 withdrawing */
 };
=20
 enum gfs2_freeze_state {
@@ -769,6 +775,7 @@ struct gfs2_sbd {
 =09struct gfs2_jdesc *sd_jdesc;
 =09struct gfs2_holder sd_journal_gh;
 =09struct gfs2_holder sd_jinode_gh;
+=09struct gfs2_glock *sd_jinode_gl;
=20
 =09struct gfs2_holder sd_sc_gh;
 =09struct gfs2_holder sd_qc_gh;
@@ -830,6 +837,7 @@ struct gfs2_sbd {
 =09struct bio *sd_log_bio;
 =09wait_queue_head_t sd_log_flush_wait;
 =09int sd_log_error; /* First log error */
+=09wait_queue_head_t sd_withdraw_wait;
=20
 =09atomic_t sd_reserving_log;
 =09wait_queue_head_t sd_reserving_log_wait;
@@ -853,6 +861,7 @@ struct gfs2_sbd {
=20
 =09unsigned long sd_last_warning;
 =09struct dentry *debugfs_dir;    /* debugfs directory */
+=09unsigned long sd_glock_dqs_held;
 };
=20
 static inline void gfs2_glstats_inc(struct gfs2_glock *gl, int which)
diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 57fdf53d2246..9f2b5609f225 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -16,6 +16,8 @@
=20
 #include "incore.h"
 #include "glock.h"
+#include "glops.h"
+#include "recovery.h"
 #include "util.h"
 #include "sys.h"
 #include "trace_gfs2.h"
@@ -124,6 +126,8 @@ static void gdlm_ast(void *arg)
=20
 =09switch (gl->gl_lksb.sb_status) {
 =09case -DLM_EUNLOCK: /* Unlocked, so glock can be freed */
+=09=09if (gl->gl_ops->go_free)
+=09=09=09gl->gl_ops->go_free(gl);
 =09=09gfs2_glock_free(gl);
 =09=09return;
 =09case -DLM_ECANCEL: /* Cancel while getting lock */
@@ -323,6 +327,7 @@ static void gdlm_cancel(struct gfs2_glock *gl)
 /*
  * dlm/gfs2 recovery coordination using dlm_recover callbacks
  *
+ *  0. gfs2 checks for another cluster node withdraw, needing journal repl=
ay
  *  1. dlm_controld sees lockspace members change
  *  2. dlm_controld blocks dlm-kernel locking activity
  *  3. dlm_controld within dlm-kernel notifies gfs2 (recover_prep)
@@ -571,6 +576,28 @@ static int control_lock(struct gfs2_sbd *sdp, int mode=
, uint32_t flags)
 =09=09=09 &ls->ls_control_lksb, "control_lock");
 }
=20
+/**
+ * remote_withdraw - react to a node withdrawing from the file system
+ * @sdp: The superblock
+ */
+static void remote_withdraw(struct gfs2_sbd *sdp)
+{
+=09struct gfs2_jdesc *jd;
+=09int ret =3D 0, count =3D 0;
+
+=09list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
+=09=09if (jd->jd_jid =3D=3D sdp->sd_lockstruct.ls_jid)
+=09=09=09continue;
+=09=09ret =3D gfs2_recover_journal(jd, true);
+=09=09if (ret)
+=09=09=09break;
+=09=09count++;
+=09}
+
+=09/* Now drop the additional reference we acquired */
+=09fs_err(sdp, "Journals checked: %d, ret =3D %d.\n", count, ret);
+}
+
 static void gfs2_control_func(struct work_struct *work)
 {
 =09struct gfs2_sbd *sdp =3D container_of(work, struct gfs2_sbd, sd_control=
_work.work);
@@ -581,6 +608,13 @@ static void gfs2_control_func(struct work_struct *work=
)
 =09int recover_size;
 =09int i, error;
=20
+=09/* First check for other nodes that may have done a withdraw. */
+=09if (test_bit(SDF_REMOTE_WITHDRAW, &sdp->sd_flags)) {
+=09=09remote_withdraw(sdp);
+=09=09clear_bit(SDF_REMOTE_WITHDRAW, &sdp->sd_flags);
+=09=09return;
+=09}
+
 =09spin_lock(&ls->ls_recover_spin);
 =09/*
 =09 * No MOUNT_DONE means we're still mounting; control_mount()
diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 0c3772974030..6bdbdb9b3cd5 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -251,7 +251,7 @@ int gfs2_meta_read(struct gfs2_glock *gl, u64 blkno, in=
t flags,
 =09struct buffer_head *bh, *bhs[2];
 =09int num =3D 0;
=20
-=09if (unlikely(gfs2_withdrawn(sdp))) {
+=09if (unlikely(gfs2_withdrawn(sdp)) && gl !=3D sdp->sd_jinode_gl) {
 =09=09*bhp =3D NULL;
 =09=09return -EIO;
 =09}
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 74389d856dd3..70d2abd000d8 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -656,7 +656,8 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
=20
 =09=09error =3D gfs2_glock_nq_num(sdp, sdp->sd_lockstruct.ls_jid,
 =09=09=09=09=09  &gfs2_journal_glops,
-=09=09=09=09=09  LM_ST_EXCLUSIVE, LM_FLAG_NOEXP,
+=09=09=09=09=09  LM_ST_EXCLUSIVE,
+=09=09=09=09=09  LM_FLAG_NOEXP | GL_NOCACHE,
 =09=09=09=09=09  &sdp->sd_journal_gh);
 =09=09if (error) {
 =09=09=09fs_err(sdp, "can't acquire journal glock: %d\n", error);
@@ -664,6 +665,7 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 =09=09}
=20
 =09=09ip =3D GFS2_I(sdp->sd_jdesc->jd_inode);
+=09=09sdp->sd_jinode_gl =3D ip->i_gl;
 =09=09error =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED,
 =09=09=09=09=09   LM_FLAG_NOEXP | GL_EXACT | GL_NOCACHE,
 =09=09=09=09=09   &sdp->sd_jinode_gh);
@@ -724,10 +726,13 @@ static int init_journal(struct gfs2_sbd *sdp, int und=
o)
 =09return 0;
=20
 fail_jinode_gh:
-=09if (!sdp->sd_args.ar_spectator)
+=09/* A withdraw may have done dq/uninit so now we need to check it */
+=09if (!sdp->sd_args.ar_spectator &&
+=09    gfs2_holder_initialized(&sdp->sd_jinode_gh))
 =09=09gfs2_glock_dq_uninit(&sdp->sd_jinode_gh);
 fail_journal_gh:
-=09if (!sdp->sd_args.ar_spectator)
+=09if (!sdp->sd_args.ar_spectator &&
+=09    gfs2_holder_initialized(&sdp->sd_journal_gh))
 =09=09gfs2_glock_dq_uninit(&sdp->sd_journal_gh);
 fail_jindex:
 =09gfs2_jindex_free(sdp);
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index dbe87b2b55af..43ffe5997098 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1541,6 +1541,8 @@ int gfs2_quotad(void *data)
=20
 =09while (!kthread_should_stop()) {
=20
+=09=09if (gfs2_withdrawn(sdp))
+=09=09=09goto bypass;
 =09=09/* Update the master statfs file */
 =09=09if (sdp->sd_statfs_force_sync) {
 =09=09=09int error =3D gfs2_statfs_sync(sdp->sd_vfs, 0);
@@ -1561,6 +1563,7 @@ int gfs2_quotad(void *data)
=20
 =09=09try_to_freeze();
=20
+bypass:
 =09=09t =3D min(quotad_timeo, statfs_timeo);
=20
 =09=09prepare_to_wait(&sdp->sd_quota_wait, &wait, TASK_INTERRUPTIBLE);
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 68cc7c291a81..693c6d13473c 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -61,11 +61,13 @@ void gfs2_jindex_free(struct gfs2_sbd *sdp)
 =09sdp->sd_journals =3D 0;
 =09spin_unlock(&sdp->sd_jindex_spin);
=20
+=09sdp->sd_jdesc =3D NULL;
 =09while (!list_empty(&list)) {
 =09=09jd =3D list_entry(list.next, struct gfs2_jdesc, jd_list);
 =09=09gfs2_free_journal_extents(jd);
 =09=09list_del(&jd->jd_list);
 =09=09iput(jd->jd_inode);
+=09=09jd->jd_inode =3D NULL;
 =09=09kfree(jd);
 =09}
 }
@@ -171,9 +173,13 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 =09=09goto fail_threads;
=20
 =09j_gl->gl_ops->go_inval(j_gl, DIO_METADATA);
+=09if (gfs2_withdrawn(sdp)) {
+=09=09error =3D -EIO;
+=09=09goto fail;
+=09}
=20
 =09error =3D gfs2_find_jhead(sdp->sd_jdesc, &head, false);
-=09if (error)
+=09if (error || gfs2_withdrawn(sdp))
 =09=09goto fail;
=20
 =09if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
@@ -187,7 +193,7 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 =09gfs2_log_pointers_init(sdp, head.lh_blkno);
=20
 =09error =3D gfs2_quota_init(sdp);
-=09if (error)
+=09if (error || gfs2_withdrawn(sdp))
 =09=09goto fail;
=20
 =09set_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
@@ -599,34 +605,63 @@ static void gfs2_dirty_inode(struct inode *inode, int=
 flags)
 int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 {
 =09struct gfs2_holder freeze_gh;
-=09int error;
-
-=09error =3D gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED, GL_NOCACH=
E,
-=09=09=09=09   &freeze_gh);
-=09if (error && !gfs2_withdrawn(sdp))
-=09=09return error;
+=09int error =3D 0;
+=09int log_write_allowed =3D test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
+
+=09gfs2_holder_mark_uninitialized(&freeze_gh);
+=09if (sdp->sd_freeze_gl &&
+=09    !gfs2_glock_is_locked_by_me(sdp->sd_freeze_gl)) {
+=09=09if (!log_write_allowed) {
+=09=09=09error =3D gfs2_glock_nq_init(sdp->sd_freeze_gl,
+=09=09=09=09=09=09   LM_ST_SHARED, GL_NOCACHE |
+=09=09=09=09=09=09   LM_FLAG_TRY, &freeze_gh);
+=09=09=09if (error =3D=3D GLR_TRYFAILED)
+=09=09=09=09error =3D 0;
+=09=09} else {
+=09=09=09error =3D gfs2_glock_nq_init(sdp->sd_freeze_gl,
+=09=09=09=09=09=09   LM_ST_SHARED, GL_NOCACHE,
+=09=09=09=09=09=09   &freeze_gh);
+=09=09=09if (error && !gfs2_withdrawn(sdp))
+=09=09=09=09return error;
+=09=09}
+=09}
=20
 =09flush_workqueue(gfs2_delete_workqueue);
-=09if (sdp->sd_quotad_process)
+=09if (!log_write_allowed && current =3D=3D sdp->sd_quotad_process)
+=09=09fs_warn(sdp, "The quotad daemon is withdrawing.\n");
+=09else if (sdp->sd_quotad_process)
 =09=09kthread_stop(sdp->sd_quotad_process);
 =09sdp->sd_quotad_process =3D NULL;
-=09if (sdp->sd_logd_process)
+
+=09if (!log_write_allowed && current =3D=3D sdp->sd_logd_process)
+=09=09fs_warn(sdp, "The logd daemon is withdrawing.\n");
+=09else if (sdp->sd_logd_process)
 =09=09kthread_stop(sdp->sd_logd_process);
 =09sdp->sd_logd_process =3D NULL;
=20
-=09gfs2_quota_sync(sdp->sd_vfs, 0);
-=09gfs2_statfs_sync(sdp->sd_vfs, 0);
-
-=09gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
-=09=09       GFS2_LFC_MAKE_FS_RO);
-=09wait_event(sdp->sd_reserving_log_wait, atomic_read(&sdp->sd_reserving_l=
og) =3D=3D 0);
-=09gfs2_assert_warn(sdp, atomic_read(&sdp->sd_log_blks_free) =3D=3D sdp->s=
d_jdesc->jd_blocks);
+=09if (log_write_allowed) {
+=09=09gfs2_quota_sync(sdp->sd_vfs, 0);
+=09=09gfs2_statfs_sync(sdp->sd_vfs, 0);
=20
+=09=09gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
+=09=09=09       GFS2_LFC_MAKE_FS_RO);
+=09=09wait_event(sdp->sd_reserving_log_wait,
+=09=09=09   atomic_read(&sdp->sd_reserving_log) =3D=3D 0);
+=09=09gfs2_assert_warn(sdp, atomic_read(&sdp->sd_log_blks_free) =3D=3D
+=09=09=09=09 sdp->sd_jdesc->jd_blocks);
+=09} else {
+=09=09wait_event_timeout(sdp->sd_reserving_log_wait,
+=09=09=09=09   atomic_read(&sdp->sd_reserving_log) =3D=3D 0,
+=09=09=09=09   HZ * 5);
+=09}
 =09if (gfs2_holder_initialized(&freeze_gh))
 =09=09gfs2_glock_dq_uninit(&freeze_gh);
=20
 =09gfs2_quota_cleanup(sdp);
=20
+=09if (!log_write_allowed)
+=09=09sdp->sd_vfs->s_flags |=3D SB_RDONLY;
+
 =09return error;
 }
=20
@@ -677,8 +712,10 @@ static void gfs2_put_super(struct super_block *sb)
 =09gfs2_glock_put(sdp->sd_freeze_gl);
=20
 =09if (!sdp->sd_args.ar_spectator) {
-=09=09gfs2_glock_dq_uninit(&sdp->sd_journal_gh);
-=09=09gfs2_glock_dq_uninit(&sdp->sd_jinode_gh);
+=09=09if (gfs2_holder_initialized(&sdp->sd_journal_gh))
+=09=09=09gfs2_glock_dq_uninit(&sdp->sd_journal_gh);
+=09=09if (gfs2_holder_initialized(&sdp->sd_jinode_gh))
+=09=09=09gfs2_glock_dq_uninit(&sdp->sd_jinode_gh);
 =09=09gfs2_glock_dq_uninit(&sdp->sd_sc_gh);
 =09=09gfs2_glock_dq_uninit(&sdp->sd_qc_gh);
 =09=09iput(sdp->sd_sc_inode);
diff --git a/fs/gfs2/super.h b/fs/gfs2/super.h
index b8bf811a1305..51900554ed81 100644
--- a/fs/gfs2/super.h
+++ b/fs/gfs2/super.h
@@ -26,7 +26,6 @@ extern void gfs2_jindex_free(struct gfs2_sbd *sdp);
=20
 extern struct gfs2_jdesc *gfs2_jdesc_find(struct gfs2_sbd *sdp, unsigned i=
nt jid);
 extern int gfs2_jdesc_check(struct gfs2_jdesc *jd);
-
 extern int gfs2_lookup_in_master_dir(struct gfs2_sbd *sdp, char *filename,
 =09=09=09=09     struct gfs2_inode **ipp);
=20
diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index a2eae5c578d6..d28c41bd69b0 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -435,6 +435,8 @@ int gfs2_recover_set(struct gfs2_sbd *sdp, unsigned jid=
)
 =09 * never clear the DFL_BLOCK_LOCKS flag, so all our locks would
 =09 * permanently stop working.
 =09 */
+=09if (!sdp->sd_jdesc)
+=09=09goto out;
 =09if (sdp->sd_jdesc->jd_jid =3D=3D jid && !sdp->sd_args.ar_spectator)
 =09=09goto out;
 =09rv =3D -ENOENT;
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 86965e6089c6..31a450b58dbd 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -11,11 +11,14 @@
 #include <linux/buffer_head.h>
 #include <linux/crc32.h>
 #include <linux/gfs2_ondisk.h>
+#include <linux/delay.h>
 #include <linux/uaccess.h>
=20
 #include "gfs2.h"
 #include "incore.h"
 #include "glock.h"
+#include "glops.h"
+#include "log.h"
 #include "lops.h"
 #include "recovery.h"
 #include "rgrp.h"
@@ -78,6 +81,167 @@ int check_journal_clean(struct gfs2_sbd *sdp, struct gf=
s2_jdesc *jd)
 =09return error;
 }
=20
+static void signal_our_withdraw(struct gfs2_sbd *sdp)
+{
+=09struct gfs2_glock *gl =3D sdp->sd_live_gh.gh_gl;
+=09struct inode *inode =3D sdp->sd_jdesc->jd_inode;
+=09struct gfs2_inode *ip =3D GFS2_I(inode);
+=09u64 no_formal_ino =3D ip->i_no_formal_ino;
+=09int ret =3D 0;
+=09int tries;
+
+=09if (test_bit(SDF_NORECOVERY, &sdp->sd_flags))
+=09=09return;
+
+=09/* Prevent any glock dq until withdraw recovery is complete */
+=09set_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags);
+=09/*
+=09 * Don't tell dlm we're bailing until we have no more buffers in the
+=09 * wind. If journal had an IO error, the log code should just purge
+=09 * the outstanding buffers rather than submitting new IO. Making the
+=09 * file system read-only will flush the journal, etc.
+=09 *
+=09 * During a normal unmount, gfs2_make_fs_ro calls gfs2_log_shutdown
+=09 * which clears SDF_JOURNAL_LIVE. In a withdraw, we must not write
+=09 * any UNMOUNT log header, so we can't call gfs2_log_shutdown, and
+=09 * therefore we need to clear SDF_JOURNAL_LIVE manually.
+=09 */
+=09clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
+=09if (sdp->sd_vfs && !sb_rdonly(sdp->sd_vfs))
+=09=09ret =3D gfs2_make_fs_ro(sdp);
+
+=09/*
+=09 * Drop the glock for our journal so another node can recover it.
+=09 */
+=09if (gfs2_holder_initialized(&sdp->sd_journal_gh)) {
+=09=09gfs2_glock_dq_wait(&sdp->sd_journal_gh);
+=09=09gfs2_holder_uninit(&sdp->sd_journal_gh);
+=09}
+=09sdp->sd_jinode_gh.gh_flags |=3D GL_NOCACHE;
+=09gfs2_glock_dq(&sdp->sd_jinode_gh);
+=09if (test_bit(SDF_FS_FROZEN, &sdp->sd_flags)) {
+=09=09/* Make sure gfs2_unfreeze works if partially-frozen */
+=09=09flush_workqueue(gfs2_freeze_wq);
+=09=09atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
+=09=09thaw_super(sdp->sd_vfs);
+=09} else {
+=09=09wait_on_bit(&gl->gl_flags, GLF_DEMOTE, TASK_UNINTERRUPTIBLE);
+=09}
+
+=09/*
+=09 * holder_uninit to force glock_put, to force dlm to let go
+=09 */
+=09gfs2_holder_uninit(&sdp->sd_jinode_gh);
+
+=09/*
+=09 * Note: We need to be careful here:
+=09 * Our iput of jd_inode will evict it. The evict will dequeue its
+=09 * glock, but the glock dq will wait for the withdraw unless we have
+=09 * exception code in glock_dq.
+=09 */
+=09iput(inode);
+=09/*
+=09 * Wait until the journal inode's glock is freed. This allows try locks
+=09 * on other nodes to be successful, otherwise we remain the owner of
+=09 * the glock as far as dlm is concerned.
+=09 */
+=09if (gl->gl_ops->go_free) {
+=09=09set_bit(GLF_FREEING, &gl->gl_flags);
+=09=09wait_on_bit(&gl->gl_flags, GLF_FREEING, TASK_UNINTERRUPTIBLE);
+=09}
+
+=09if (sdp->sd_lockstruct.ls_ops->lm_lock =3D=3D NULL) { /* lock_nolock */
+=09=09clear_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags);
+=09=09goto skip_recovery;
+=09}
+=09/*
+=09 * Dequeue the "live" glock, but keep a reference so it's never freed.
+=09 */
+=09gfs2_glock_hold(gl);
+=09gfs2_glock_dq_wait(&sdp->sd_live_gh);
+=09/*
+=09 * We enqueue the "live" glock in EX so that all other nodes
+=09 * get a demote request and act on it. We don't really want the
+=09 * lock in EX, so we send a "try" lock with 1CB to produce a callback.
+=09 */
+=09fs_warn(sdp, "Requesting recovery of jid %d.\n",
+=09=09sdp->sd_lockstruct.ls_jid);
+=09gfs2_holder_reinit(LM_ST_EXCLUSIVE, LM_FLAG_TRY_1CB | LM_FLAG_NOEXP,
+=09=09=09   &sdp->sd_live_gh);
+=09msleep(GL_GLOCK_MAX_HOLD);
+=09/*
+=09 * This will likely fail in a cluster, but succeed standalone:
+=09 */
+=09ret =3D gfs2_glock_nq(&sdp->sd_live_gh);
+
+=09/*
+=09 * If we actually got the "live" lock in EX mode, there are no other
+=09 * nodes available to replay our journal. So we try to replay it
+=09 * ourselves. We hold the "live" glock to prevent other mounters
+=09 * during recovery, then just dequeue it and reacquire it in our
+=09 * normal SH mode. Just in case the problem that caused us to
+=09 * withdraw prevents us from recovering our journal (e.g. io errors
+=09 * and such) we still check if the journal is clean before proceeding
+=09 * but we may wait forever until another mounter does the recovery.
+=09 */
+=09if (ret =3D=3D 0) {
+=09=09fs_warn(sdp, "No other mounters found. Trying to recover our "
+=09=09=09"own journal jid %d.\n", sdp->sd_lockstruct.ls_jid);
+=09=09if (gfs2_recover_journal(sdp->sd_jdesc, 1))
+=09=09=09fs_warn(sdp, "Unable to recover our journal jid %d.\n",
+=09=09=09=09sdp->sd_lockstruct.ls_jid);
+=09=09gfs2_glock_dq_wait(&sdp->sd_live_gh);
+=09=09gfs2_holder_reinit(LM_ST_SHARED, LM_FLAG_NOEXP | GL_EXACT,
+=09=09=09=09   &sdp->sd_live_gh);
+=09=09gfs2_glock_nq(&sdp->sd_live_gh);
+=09}
+
+=09gfs2_glock_queue_put(gl); /* drop the extra reference we acquired */
+=09clear_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags);
+
+=09/*
+=09 * At this point our journal is evicted, so we need to get a new inode
+=09 * for it. Once done, we need to call gfs2_find_jhead which
+=09 * calls gfs2_map_journal_extents to map it for us again.
+=09 *
+=09 * Note that we don't really want it to look up a FREE block. The
+=09 * GFS2_BLKST_FREE simply overrides a block check in gfs2_inode_lookup
+=09 * which would otherwise fail because it requires grabbing an rgrp
+=09 * glock, which would fail with -EIO because we're withdrawing.
+=09 */
+=09inode =3D gfs2_inode_lookup(sdp->sd_vfs, DT_UNKNOWN,
+=09=09=09=09  sdp->sd_jdesc->jd_no_addr, no_formal_ino,
+=09=09=09=09  GFS2_BLKST_FREE);
+=09if (IS_ERR(inode)) {
+=09=09fs_warn(sdp, "Reprocessing of jid %d failed with %ld.\n",
+=09=09=09sdp->sd_lockstruct.ls_jid, PTR_ERR(inode));
+=09=09goto skip_recovery;
+=09}
+=09sdp->sd_jdesc->jd_inode =3D inode;
+
+=09/*
+=09 * Now wait until recovery is complete.
+=09 */
+=09for (tries =3D 0; tries < 10; tries++) {
+=09=09ret =3D check_journal_clean(sdp, sdp->sd_jdesc);
+=09=09if (!ret)
+=09=09=09break;
+=09=09msleep(HZ);
+=09=09fs_warn(sdp, "Waiting for journal recovery jid %d.\n",
+=09=09=09sdp->sd_lockstruct.ls_jid);
+=09}
+skip_recovery:
+=09if (!ret)
+=09=09fs_warn(sdp, "Journal recovery complete for jid %d.\n",
+=09=09=09sdp->sd_lockstruct.ls_jid);
+=09else
+=09=09fs_warn(sdp, "Journal recovery skipped for %d until next "
+=09=09=09"mount.\n", sdp->sd_lockstruct.ls_jid);
+=09fs_warn(sdp, "Glock dequeues delayed: %lu\n", sdp->sd_glock_dqs_held);
+=09sdp->sd_glock_dqs_held =3D 0;
+=09wake_up_bit(&sdp->sd_flags, SDF_WITHDRAW_RECOVERY);
+}
+
 void gfs2_lm(struct gfs2_sbd *sdp, const char *fmt, ...)
 {
 =09struct va_format vaf;
@@ -100,13 +264,23 @@ int gfs2_withdraw(struct gfs2_sbd *sdp)
 =09const struct lm_lockops *lm =3D ls->ls_ops;
=20
 =09if (sdp->sd_args.ar_errors =3D=3D GFS2_ERRORS_WITHDRAW &&
-=09    test_and_set_bit(SDF_WITHDRAWN, &sdp->sd_flags))
-=09=09return 0;
+=09    test_and_set_bit(SDF_WITHDRAWN, &sdp->sd_flags)) {
+=09=09if (!test_bit(SDF_WITHDRAW_IN_PROG, &sdp->sd_flags))
+=09=09=09return -1;
+
+=09=09wait_on_bit(&sdp->sd_flags, SDF_WITHDRAW_IN_PROG,
+=09=09=09    TASK_UNINTERRUPTIBLE);
+=09=09return -1;
+=09}
+
+=09set_bit(SDF_WITHDRAW_IN_PROG, &sdp->sd_flags);
=20
 =09if (sdp->sd_args.ar_errors =3D=3D GFS2_ERRORS_WITHDRAW) {
 =09=09fs_err(sdp, "about to withdraw this file system\n");
 =09=09BUG_ON(sdp->sd_args.ar_debug);
=20
+=09=09signal_our_withdraw(sdp);
+
 =09=09kobject_uevent(&sdp->sd_kobj, KOBJ_OFFLINE);
=20
 =09=09if (!strcmp(sdp->sd_lockstruct.ls_ops->lm_proto_name, "lock_dlm"))
@@ -117,8 +291,11 @@ int gfs2_withdraw(struct gfs2_sbd *sdp)
 =09=09=09lm->lm_unmount(sdp);
 =09=09}
 =09=09set_bit(SDF_SKIP_DLM_UNLOCK, &sdp->sd_flags);
-=09=09fs_err(sdp, "withdrawn\n");
+=09=09fs_err(sdp, "File system withdrawn\n");
 =09=09dump_stack();
+=09=09clear_bit(SDF_WITHDRAW_IN_PROG, &sdp->sd_flags);
+=09=09smp_mb__after_atomic();
+=09=09wake_up_bit(&sdp->sd_flags, SDF_WITHDRAW_IN_PROG);
 =09}
=20
 =09if (sdp->sd_args.ar_errors =3D=3D GFS2_ERRORS_PANIC)
--=20
2.24.1

