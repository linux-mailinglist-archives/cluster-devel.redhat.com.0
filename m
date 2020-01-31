Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EE9F714F1E4
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jan 2020 19:08:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580494085;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m2/4g2gN8Ht8x3MEqSWFYfjD2LBVHZdKSTWDhdc2zeM=;
	b=BNpp1jCH8awCMBpdi5OX3wA6/ZJ3v/bOqLGoTGWC6Ch6+IRN6VNR8V/GMy0iS9PhZ5Bykx
	iJNas9VlkhLePy8rYRXOGfFSMSlByxGltALtyEWxi5j+8/e89gutG5IEvQS+PnEARuCYP3
	FF6UBKJYsGV9FvT5G64gfGR7JtL+LHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-helknZiIOzqufr82Q5Dg8g-1; Fri, 31 Jan 2020 13:08:02 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21C0A192E002;
	Fri, 31 Jan 2020 18:08:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05AF677920;
	Fri, 31 Jan 2020 18:08:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB22E18089CD;
	Fri, 31 Jan 2020 18:07:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VI7w9D026995 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 13:07:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 869DE60BE1; Fri, 31 Jan 2020 18:07:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1C8B60BE0
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 18:07:56 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 31 Jan 2020 12:07:12 -0600
Message-Id: <20200131180723.178863-15-rpeterso@redhat.com>
In-Reply-To: <20200131180723.178863-1-rpeterso@redhat.com>
References: <20200131180723.178863-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 14/25] gfs2: Make secondary withdrawers
	wait for first withdrawer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: helknZiIOzqufr82Q5Dg8g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, if a process encountered an error and decided to
withdraw, if another process was already in the process of withdrawing,
the secondary withdraw would be silently ignored, which set it free
to proceed with its processing, unlock any locks, etc. That's correct
behavior if the original withdrawer encounters further errors down
the road. However, second withdrawers need to wait for the first
withdrawer to finish its withdraw before proceeding. If we don't wait
we could end up assuming everything is alright, unlock glocks and
telling other nodes they can have the glock, despite the fact that
a withdraw is still ongoing and may require a journal replay before
any locks are released. For example, if an rgrp glock is freed
by a process that didn't wait for the withdraw, a journal replay
could introduce file system corruption by replaying a rgrp block
that has already been granted to another node.

This patch makes secondary withdrawers wait with their processing until
the primary withdrawer is finished.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c      |  23 ++++++-
 fs/gfs2/glops.c      |  77 ++++++++++++++++++++-
 fs/gfs2/incore.h     |   9 +++
 fs/gfs2/lock_dlm.c   |  34 +++++++++
 fs/gfs2/meta_io.c    |   2 +-
 fs/gfs2/ops_fstype.c |  11 ++-
 fs/gfs2/quota.c      |   3 +
 fs/gfs2/super.c      |  73 +++++++++++++++-----
 fs/gfs2/util.c       | 160 ++++++++++++++++++++++++++++++++++++++++++-
 9 files changed, 362 insertions(+), 30 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 69c0c388e7be..7094ef07003c 100644
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
@@ -574,7 +574,8 @@ __acquires(&gl->gl_lockref.lock)
 =09unsigned int lck_flags =3D (unsigned int)(gh ? gh->gh_flags : 0);
 =09int ret;
=20
-=09if (target !=3D LM_ST_UNLOCKED && glock_blocked_by_withdraw(gl))
+=09if (target !=3D LM_ST_UNLOCKED && glock_blocked_by_withdraw(gl) &&
+=09    gh && !(gh->gh_flags & LM_FLAG_NOEXP))
 =09=09return;
 =09lck_flags &=3D (LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_NOEXP |
 =09=09      LM_FLAG_PRIORITY);
@@ -1220,7 +1221,7 @@ int gfs2_glock_nq(struct gfs2_holder *gh)
 =09struct gfs2_glock *gl =3D gh->gh_gl;
 =09int error =3D 0;
=20
-=09if (glock_blocked_by_withdraw(gl))
+=09if (glock_blocked_by_withdraw(gl) && !(gh->gh_flags & LM_FLAG_NOEXP))
 =09=09return -EIO;
=20
 =09if (test_bit(GLF_LRU, &gl->gl_flags))
@@ -1264,10 +1265,26 @@ int gfs2_glock_poll(struct gfs2_holder *gh)
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
index 0d1cca2ac3b9..259b1956e990 100644
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
@@ -618,6 +620,10 @@ enum {
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
@@ -768,6 +774,7 @@ struct gfs2_sbd {
 =09struct gfs2_jdesc *sd_jdesc;
 =09struct gfs2_holder sd_journal_gh;
 =09struct gfs2_holder sd_jinode_gh;
+=09struct gfs2_glock *sd_jinode_gl;
=20
 =09struct gfs2_holder sd_sc_gh;
 =09struct gfs2_holder sd_qc_gh;
@@ -829,6 +836,7 @@ struct gfs2_sbd {
 =09struct bio *sd_log_bio;
 =09wait_queue_head_t sd_log_flush_wait;
 =09int sd_log_error; /* First log error */
+=09wait_queue_head_t sd_withdraw_wait;
=20
 =09atomic_t sd_reserving_log;
 =09wait_queue_head_t sd_reserving_log_wait;
@@ -852,6 +860,7 @@ struct gfs2_sbd {
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
index d19ee57c99ce..a38d153f1815 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -652,7 +652,8 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
=20
 =09=09error =3D gfs2_glock_nq_num(sdp, sdp->sd_lockstruct.ls_jid,
 =09=09=09=09=09  &gfs2_journal_glops,
-=09=09=09=09=09  LM_ST_EXCLUSIVE, LM_FLAG_NOEXP,
+=09=09=09=09=09  LM_ST_EXCLUSIVE,
+=09=09=09=09=09  LM_FLAG_NOEXP | GL_NOCACHE,
 =09=09=09=09=09  &sdp->sd_journal_gh);
 =09=09if (error) {
 =09=09=09fs_err(sdp, "can't acquire journal glock: %d\n", error);
@@ -660,6 +661,7 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 =09=09}
=20
 =09=09ip =3D GFS2_I(sdp->sd_jdesc->jd_inode);
+=09=09sdp->sd_jinode_gl =3D ip->i_gl;
 =09=09error =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED,
 =09=09=09=09=09   LM_FLAG_NOEXP | GL_EXACT | GL_NOCACHE,
 =09=09=09=09=09   &sdp->sd_jinode_gh);
@@ -720,10 +722,13 @@ static int init_journal(struct gfs2_sbd *sdp, int und=
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
index 68cc7c291a81..782463d64ee9 100644
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
@@ -599,34 +603,63 @@ static void gfs2_dirty_inode(struct inode *inode, int=
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
@@ -677,8 +710,10 @@ static void gfs2_put_super(struct super_block *sb)
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
index 86965e6089c6..efcaad2fc5b8 100644
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
 void gfs2_lm(struct gfs2_sbd *sdp, const char *fmt, ...)
 {
 =09struct va_format vaf;
@@ -100,13 +241,23 @@ int gfs2_withdraw(struct gfs2_sbd *sdp)
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
@@ -117,8 +268,11 @@ int gfs2_withdraw(struct gfs2_sbd *sdp)
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

