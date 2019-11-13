Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 543BBFBACB
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680649;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mkozN6wBJX+7l8eb10tJuYsCq0RqjA2M07n+WTUH+78=;
	b=Uwuu9x9lfVJazz6VUH3C0TigB987Zwt3B+uBFZ5kYNsYtp/tG+oGUmbwG2SUeTrtkNWLhM
	L0QL47y44jOddl68A+4b+KYCMN/nF+yAEOSsUTBJayOvIWEW5Kn4gv+uNW02iwOd4npcw6
	mv6tidTO4MHVHOAT13jWvGziyhhM5r4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-Nmy7E0tDNquXRUrVlZkqQQ-1; Wed, 13 Nov 2019 16:30:47 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC64910766DE;
	Wed, 13 Nov 2019 21:30:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9994B81C0C;
	Wed, 13 Nov 2019 21:30:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E1DA4E56D;
	Wed, 13 Nov 2019 21:30:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUdKE005279 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 072186973C; Wed, 13 Nov 2019 21:30:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B68CA5C1BB
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:38 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:11 -0600
Message-Id: <20191113213030.237431-14-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 13/32] gfs2: Force withdraw to replay
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Nmy7E0tDNquXRUrVlZkqQQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c      |  24 ++++++-
 fs/gfs2/glops.c      |  77 ++++++++++++++++++++++-
 fs/gfs2/incore.h     |   7 +++
 fs/gfs2/lock_dlm.c   |  34 ++++++++++
 fs/gfs2/meta_io.c    |   2 +-
 fs/gfs2/ops_fstype.c |   4 +-
 fs/gfs2/quota.c      |   4 ++
 fs/gfs2/super.c      |  67 ++++++++++++++------
 fs/gfs2/util.c       | 145 ++++++++++++++++++++++++++++++++++++++++++-
 9 files changed, 340 insertions(+), 24 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 15ff968e8192..d8e48b72026e 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -269,7 +269,7 @@ static void __gfs2_glock_put(struct gfs2_glock *gl)
 =09gfs2_glock_remove_from_lru(gl);
 =09spin_unlock(&gl->gl_lockref.lock);
 =09GLOCK_BUG_ON(gl, !list_empty(&gl->gl_holders));
-=09GLOCK_BUG_ON(gl, mapping && mapping->nrpages);
+=09GLOCK_BUG_ON(gl, mapping && mapping->nrpages && !gfs2_withdrawn(sdp));
 =09trace_gfs2_glock_put(gl);
 =09sdp->sd_lockstruct.ls_ops->lm_put_lock(gl);
 }
@@ -575,6 +575,7 @@ __acquires(&gl->gl_lockref.lock)
 =09int ret;
=20
 =09if (unlikely(gfs2_withdrawn(sdp)) && !allow_while_withdrawn(gl) &&
+=09    (gh && !(LM_FLAG_NOEXP & gh->gh_flags)) &&
 =09    target !=3D LM_ST_UNLOCKED)
 =09=09return;
 =09lck_flags &=3D (LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_NOEXP |
@@ -1215,7 +1216,8 @@ int gfs2_glock_nq(struct gfs2_holder *gh)
 =09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
 =09int error =3D 0;
=20
-=09if (unlikely(gfs2_withdrawn(sdp)) && !allow_while_withdrawn(gl))
+=09if (unlikely(gfs2_withdrawn(sdp)) && !allow_while_withdrawn(gl) &&
+=09    !(LM_FLAG_NOEXP & gh->gh_flags))
 =09=09return -EIO;
=20
 =09if (test_bit(GLF_LRU, &gl->gl_flags))
@@ -1259,11 +1261,29 @@ int gfs2_glock_poll(struct gfs2_holder *gh)
 void gfs2_glock_dq(struct gfs2_holder *gh)
 {
 =09struct gfs2_glock *gl =3D gh->gh_gl;
+=09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
 =09const struct gfs2_glock_operations *glops =3D gl->gl_ops;
 =09unsigned delay =3D 0;
 =09int fast_path =3D 0;
=20
 =09spin_lock(&gl->gl_lockref.lock);
+=09/*
+=09 * If we're in the process of file system withdraw, we cannot just
+=09 * dequeue any glocks until our journal is recovered, lest we
+=09 * introduce file system corruption. We need two exceptions to this
+=09 * rule: We need to allow unlocking of nondisk glocks and the glock
+=09 * for our own journal that needs recovery. Note that evict may also
+=09 * call this for the journal inode, but without using sdp->sd_jinode_gh
+=09 * so we need to check the glock, not just the holder of the glock.
+=09 */
+=09if (test_bit(SDF_WITHDRAWN, &sdp->sd_flags) &&
+=09    test_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags) &&
+=09    !allow_while_withdrawn(gl) && gh->gh_gl !=3D sdp->sd_jinode_gl) {
+=09=09sdp->sd_glock_dqs_held++;
+=09=09might_sleep();
+=09=09wait_on_bit(&sdp->sd_flags, SDF_WITHDRAW_RECOVERY,
+=09=09=09    TASK_UNINTERRUPTIBLE);
+=09}
 =09if (gh->gh_flags & GL_NOCACHE)
 =09=09handle_callback(gl, LM_ST_UNLOCKED, 0, false);
=20
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 04f55e5b8bf1..3904e4892a65 100644
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
@@ -495,13 +497,17 @@ static void freeze_go_sync(struct gfs2_glock *gl)
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
@@ -576,6 +582,73 @@ static void iopen_go_callback(struct gfs2_glock *gl, b=
ool remote)
 =09}
 }
=20
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
+=09 * us of a another node's withdraw. We'll keep it in SH mode. */
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
 const struct gfs2_glock_operations gfs2_meta_glops =3D {
 =09.go_type =3D LM_TYPE_META,
 };
@@ -588,6 +661,7 @@ const struct gfs2_glock_operations gfs2_inode_glops =3D=
 {
 =09.go_dump =3D inode_go_dump,
 =09.go_type =3D LM_TYPE_INODE,
 =09.go_flags =3D GLOF_ASPACE | GLOF_LRU | GLOF_JOURNALED,
+=09.go_free =3D inode_go_free,
 };
=20
 const struct gfs2_glock_operations gfs2_rgrp_glops =3D {
@@ -619,6 +693,7 @@ const struct gfs2_glock_operations gfs2_flock_glops =3D=
 {
=20
 const struct gfs2_glock_operations gfs2_nondisk_glops =3D {
 =09.go_type =3D LM_TYPE_NONDISK,
+=09.go_callback =3D nondisk_go_callback,
 };
=20
 const struct gfs2_glock_operations gfs2_quota_glops =3D {
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 6e713bf536a1..a15ddd2f9bf4 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -242,6 +242,7 @@ struct gfs2_glock_operations {
 =09void (*go_dump)(struct seq_file *seq, struct gfs2_glock *gl,
 =09=09=09const char *fs_id_buf);
 =09void (*go_callback)(struct gfs2_glock *gl, bool remote);
+=09void (*go_free)(struct gfs2_glock *gl);
 =09const int go_type;
 =09const unsigned long go_flags;
 #define GLOF_ASPACE 1
@@ -343,6 +344,7 @@ enum {
 =09GLF_OBJECT=09=09=09=3D 14, /* Used only for tracing */
 =09GLF_BLOCKING=09=09=09=3D 15,
 =09GLF_INODE_CREATING=09=09=3D 16, /* Inode creation occurring */
+=09GLF_FREEING=09=09=09=3D 18, /* Wait for glock to be freed */
 };
=20
 struct gfs2_glock {
@@ -620,6 +622,9 @@ enum {
 =09SDF_FS_FROZEN           =3D 10,
 =09SDF_WITHDRAWING=09=09=3D 11, /* Will withdraw eventually */
 =09SDF_WITHDRAW_IN_PROG=09=3D 12, /* Withdraw is in progress */
+=09SDF_REMOTE_WITHDRAW=09=3D 13, /* Performing remote recovery */
+=09SDF_WITHDRAW_RECOVERY=09=3D 14, /* Wait for journal recovery when we ar=
e
+=09=09=09=09=09 withdrawing */
 };
=20
 enum gfs2_freeze_state {
@@ -769,6 +774,7 @@ struct gfs2_sbd {
 =09struct gfs2_jdesc *sd_jdesc;
 =09struct gfs2_holder sd_journal_gh;
 =09struct gfs2_holder sd_jinode_gh;
+=09struct gfs2_glock *sd_jinode_gl;
=20
 =09struct gfs2_holder sd_sc_gh;
 =09struct gfs2_holder sd_qc_gh;
@@ -855,6 +861,7 @@ struct gfs2_sbd {
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
index fc3a560793c8..d49741bf5a0f 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -650,7 +650,8 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
=20
 =09=09error =3D gfs2_glock_nq_num(sdp, sdp->sd_lockstruct.ls_jid,
 =09=09=09=09=09  &gfs2_journal_glops,
-=09=09=09=09=09  LM_ST_EXCLUSIVE, LM_FLAG_NOEXP,
+=09=09=09=09=09  LM_ST_EXCLUSIVE,
+=09=09=09=09=09  LM_FLAG_NOEXP | GL_NOCACHE,
 =09=09=09=09=09  &sdp->sd_journal_gh);
 =09=09if (error) {
 =09=09=09fs_err(sdp, "can't acquire journal glock: %d\n", error);
@@ -658,6 +659,7 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 =09=09}
=20
 =09=09ip =3D GFS2_I(sdp->sd_jdesc->jd_inode);
+=09=09sdp->sd_jinode_gl =3D ip->i_gl;
 =09=09error =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED,
 =09=09=09=09=09   LM_FLAG_NOEXP | GL_EXACT | GL_NOCACHE,
 =09=09=09=09=09   &sdp->sd_jinode_gh);
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index dbe87b2b55af..3fb5bfdb1c64 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1572,6 +1572,10 @@ int gfs2_quotad(void *data)
 =09=09else
 =09=09=09t =3D 0;
 =09=09finish_wait(&sdp->sd_quota_wait, &wait);
+
+=09=09if (atomic_read(&sdp->sd_withdrawer) =3D=3D
+=09=09    pid_nr(task_pid(current)))
+=09=09=09break;
 =09}
=20
 =09return 0;
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 8154c38e488b..a696663bf5e5 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -171,9 +171,13 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
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
@@ -187,7 +191,7 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
 =09gfs2_log_pointers_init(sdp, head.lh_blkno);
=20
 =09error =3D gfs2_quota_init(sdp);
-=09if (error)
+=09if (error || gfs2_withdrawn(sdp))
 =09=09goto fail;
=20
 =09set_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
@@ -599,33 +603,58 @@ int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
 {
 =09struct gfs2_holder freeze_gh;
 =09int error;
-
-=09error =3D gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED, GL_NOCACH=
E,
-=09=09=09=09   &freeze_gh);
-=09if (error && !gfs2_withdrawn(sdp))
-=09=09return error;
+=09int log_write_allowed =3D test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
+
+=09gfs2_holder_mark_uninitialized(&freeze_gh);
+=09if (!log_write_allowed && sdp->sd_freeze_gl &&
+=09    !gfs2_glock_is_locked_by_me(sdp->sd_freeze_gl)) {
+=09=09error =3D gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED,
+=09=09=09=09   GL_NOCACHE | LM_FLAG_TRY, &freeze_gh);
+=09=09if (error =3D=3D GLR_TRYFAILED)
+=09=09=09error =3D 0;
+=09} else {
+=09=09error =3D gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED,
+=09=09=09=09=09   GL_NOCACHE, &freeze_gh);
+=09=09if (error && !gfs2_withdrawn(sdp))
+=09=09=09return error;
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
@@ -676,8 +705,10 @@ static void gfs2_put_super(struct super_block *sb)
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
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 4ef5218303d7..0d6ee69fab40 100644
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
@@ -78,6 +81,144 @@ int check_journal_clean(struct gfs2_sbd *sdp, struct gf=
s2_jdesc *jd)
 =09return error;
 }
=20
+static void signal_our_withdraw(struct gfs2_sbd *sdp)
+{
+=09struct gfs2_glock *gl =3D sdp->sd_live_gh.gh_gl;
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
+=09 * Func gfs2_jindex_free calls iput on jd_inode, which will evict it.
+=09 * The evict, in turn, will dequeue its glock, but the glock dq will
+=09 * wait for the withdraw unless we have exception code in glock_dq.
+=09 */
+=09gfs2_jindex_free(sdp);
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
+=09 * Now wait until recovery complete.
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
 int gfs2_lm_withdraw(struct gfs2_sbd *sdp, const char *fmt, ...)
 {
 =09struct lm_lockstruct *ls =3D &sdp->sd_lockstruct;
@@ -118,6 +259,8 @@ int gfs2_lm_withdraw(struct gfs2_sbd *sdp, const char *=
fmt, ...)
 =09=09fs_err(sdp, "about to withdraw this file system\n");
 =09=09BUG_ON(sdp->sd_args.ar_debug);
=20
+=09=09signal_our_withdraw(sdp);
+
 =09=09kobject_uevent(&sdp->sd_kobj, KOBJ_OFFLINE);
=20
 =09=09if (!strcmp(sdp->sd_lockstruct.ls_ops->lm_proto_name, "lock_dlm"))
@@ -128,7 +271,7 @@ int gfs2_lm_withdraw(struct gfs2_sbd *sdp, const char *=
fmt, ...)
 =09=09=09lm->lm_unmount(sdp);
 =09=09}
 =09=09set_bit(SDF_SKIP_DLM_UNLOCK, &sdp->sd_flags);
-=09=09fs_err(sdp, "withdrawn\n");
+=09=09fs_err(sdp, "File system withdrawn\n");
 =09=09dump_stack();
 =09=09clear_bit(SDF_WITHDRAW_IN_PROG, &sdp->sd_flags);
 =09=09smp_mb__after_atomic();
--=20
2.23.0

