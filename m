Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 66361FBAC0
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680645;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hlLioqQbdeaZL4DM7IN37F52XMkOG7TMrTxfbVWGZUs=;
	b=AdujuivU0J6r3LK8mBYsbKEEHPX5P/drVisPCzFX6mERSm3XrcpAvG6uy3m/706pletR6F
	dvassVQbkIvNXIE2PsrbCMDNV0OWZlN19GJ7VxyAoYE/7XnBaxUNSHhxOcxPGykRMdq45B
	ZcfGbJEzbm5ZKwD5XKozn1JY0LY6lqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-I7m4nP5fOLeBW48tD-pnLg-1; Wed, 13 Nov 2019 16:30:43 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FF50189DC04;
	Wed, 13 Nov 2019 21:30:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C9A65E276;
	Wed, 13 Nov 2019 21:30:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6AEE04E567;
	Wed, 13 Nov 2019 21:30:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUYcR005181 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B76676973B; Wed, 13 Nov 2019 21:30:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7281069739
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:34 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:29:59 -0600
Message-Id: <20191113213030.237431-2-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 01/32] gfs2: Introduce concept of a pending
	withdraw
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
X-MC-Unique: I7m4nP5fOLeBW48tD-pnLg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

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
 fs/gfs2/util.c       | 14 +++++++-------
 fs/gfs2/util.h       | 12 ++++++++++++
 13 files changed, 44 insertions(+), 37 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 765e40aad985..9c6df721321a 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -497,7 +497,7 @@ static int __gfs2_readpage(void *file, struct page *pag=
e)
 =09=09error =3D mpage_readpage(page, gfs2_block_map);
 =09}
=20
-=09if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags)))
+=09if (unlikely(gfs2_withdrawn(sdp)))
 =09=09return -EIO;
=20
 =09return error;
@@ -614,7 +614,7 @@ static int gfs2_readpages(struct file *file, struct add=
ress_space *mapping,
 =09gfs2_glock_dq(&gh);
 out_uninit:
 =09gfs2_holder_uninit(&gh);
-=09if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags)))
+=09if (unlikely(gfs2_withdrawn(sdp)))
 =09=09ret =3D -EIO;
 =09return ret;
 }
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 92524a946d03..62cc5bd12d09 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1194,7 +1194,7 @@ static int gfs2_lock(struct file *file, int cmd, stru=
ct file_lock *fl)
 =09=09cmd =3D F_SETLK;
 =09=09fl->fl_type =3D F_UNLCK;
 =09}
-=09if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags))) {
+=09if (unlikely(gfs2_withdrawn(sdp))) {
 =09=09if (fl->fl_type =3D=3D F_UNLCK)
 =09=09=09locks_lock_file_wait(file, fl);
 =09=09return -EIO;
diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 0290a22ebccf..faa88bd594e2 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -549,7 +549,7 @@ __acquires(&gl->gl_lockref.lock)
 =09unsigned int lck_flags =3D (unsigned int)(gh ? gh->gh_flags : 0);
 =09int ret;
=20
-=09if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags)) &&
+=09if (unlikely(gfs2_withdrawn(sdp)) &&
 =09    target !=3D LM_ST_UNLOCKED)
 =09=09return;
 =09lck_flags &=3D (LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_NOEXP |
@@ -586,8 +586,7 @@ __acquires(&gl->gl_lockref.lock)
 =09=09}
 =09=09else if (ret) {
 =09=09=09fs_err(sdp, "lm_lock ret %d\n", ret);
-=09=09=09GLOCK_BUG_ON(gl, !test_bit(SDF_WITHDRAWN,
-=09=09=09=09=09=09   &sdp->sd_flags));
+=09=09=09GLOCK_BUG_ON(gl, !gfs2_withdrawn(sdp));
 =09=09}
 =09} else { /* lock_nolock */
 =09=09finish_xmote(gl, target);
@@ -1191,7 +1190,7 @@ int gfs2_glock_nq(struct gfs2_holder *gh)
 =09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
 =09int error =3D 0;
=20
-=09if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags)))
+=09if (unlikely(gfs2_withdrawn(sdp)))
 =09=09return -EIO;
=20
 =09if (test_bit(GLF_LRU, &gl->gl_flags))
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 0e019f5a72d1..4ede1f18de85 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -540,7 +540,7 @@ static int freeze_go_xmote_bh(struct gfs2_glock *gl, st=
ruct gfs2_holder *gh)
 =09=09=09gfs2_consist(sdp);
=20
 =09=09/*  Initialize some head of the log stuff  */
-=09=09if (!test_bit(SDF_WITHDRAWN, &sdp->sd_flags)) {
+=09=09if (!gfs2_withdrawn(sdp)) {
 =09=09=09sdp->sd_log_sequence =3D head.lh_sequence + 1;
 =09=09=09gfs2_log_pointers_init(sdp, head.lh_blkno);
 =09=09}
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 5f89c515f5bb..6042babb7324 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -619,6 +619,7 @@ enum {
 =09SDF_FORCE_AIL_FLUSH     =3D 9,
 =09SDF_AIL1_IO_ERROR=09=3D 10,
 =09SDF_FS_FROZEN           =3D 11,
+=09SDF_WITHDRAWING=09=09=3D 12, /* Will withdraw eventually */
 };
=20
 enum gfs2_freeze_state {
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 162246fafc2e..877610e1e3c0 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -89,8 +89,7 @@ static void gfs2_remove_from_ail(struct gfs2_bufdata *bd)
=20
 static int gfs2_ail1_start_one(struct gfs2_sbd *sdp,
 =09=09=09       struct writeback_control *wbc,
-=09=09=09       struct gfs2_trans *tr,
-=09=09=09       bool *withdraw)
+=09=09=09       struct gfs2_trans *tr)
 __releases(&sdp->sd_ail_lock)
 __acquires(&sdp->sd_ail_lock)
 {
@@ -109,7 +108,7 @@ __acquires(&sdp->sd_ail_lock)
 =09=09=09    !test_and_set_bit(SDF_AIL1_IO_ERROR,
 =09=09=09=09=09      &sdp->sd_flags)) {
 =09=09=09=09gfs2_io_error_bh(sdp, bh);
-=09=09=09=09*withdraw =3D true;
+=09=09=09=09set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
 =09=09=09}
 =09=09=09list_move(&bd->bd_ail_st_list, &tr->tr_ail2_list);
 =09=09=09continue;
@@ -150,7 +149,6 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct write=
back_control *wbc)
 =09struct list_head *head =3D &sdp->sd_ail1_list;
 =09struct gfs2_trans *tr;
 =09struct blk_plug plug;
-=09bool withdraw =3D false;
=20
 =09trace_gfs2_ail_flush(sdp, wbc, 1);
 =09blk_start_plug(&plug);
@@ -159,12 +157,12 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct wri=
teback_control *wbc)
 =09list_for_each_entry_reverse(tr, head, tr_list) {
 =09=09if (wbc->nr_to_write <=3D 0)
 =09=09=09break;
-=09=09if (gfs2_ail1_start_one(sdp, wbc, tr, &withdraw))
+=09=09if (gfs2_ail1_start_one(sdp, wbc, tr))
 =09=09=09goto restart;
 =09}
 =09spin_unlock(&sdp->sd_ail_lock);
 =09blk_finish_plug(&plug);
-=09if (withdraw)
+=09if (test_bit(SDF_WITHDRAWING, &sdp->sd_flags))
 =09=09gfs2_lm_withdraw(sdp, NULL);
 =09trace_gfs2_ail_flush(sdp, wbc, 0);
 }
@@ -193,8 +191,7 @@ static void gfs2_ail1_start(struct gfs2_sbd *sdp)
  *
  */
=20
-static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *t=
r,
-=09=09=09=09bool *withdraw)
+static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *t=
r)
 {
 =09struct gfs2_bufdata *bd, *s;
 =09struct buffer_head *bh;
@@ -208,7 +205,7 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, s=
truct gfs2_trans *tr,
 =09=09if (!buffer_uptodate(bh) &&
 =09=09    !test_and_set_bit(SDF_AIL1_IO_ERROR, &sdp->sd_flags)) {
 =09=09=09gfs2_io_error_bh(sdp, bh);
-=09=09=09*withdraw =3D true;
+=09=09=09set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
 =09=09}
 =09=09list_move(&bd->bd_ail_st_list, &tr->tr_ail2_list);
 =09}
@@ -226,11 +223,10 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp)
 =09struct gfs2_trans *tr, *s;
 =09int oldest_tr =3D 1;
 =09int ret;
-=09bool withdraw =3D false;
=20
 =09spin_lock(&sdp->sd_ail_lock);
 =09list_for_each_entry_safe_reverse(tr, s, &sdp->sd_ail1_list, tr_list) {
-=09=09gfs2_ail1_empty_one(sdp, tr, &withdraw);
+=09=09gfs2_ail1_empty_one(sdp, tr);
 =09=09if (list_empty(&tr->tr_ail1_list) && oldest_tr)
 =09=09=09list_move(&tr->tr_list, &sdp->sd_ail2_list);
 =09=09else
@@ -239,7 +235,7 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp)
 =09ret =3D list_empty(&sdp->sd_ail1_list);
 =09spin_unlock(&sdp->sd_ail_lock);
=20
-=09if (withdraw)
+=09if (test_bit(SDF_WITHDRAWING, &sdp->sd_flags))
 =09=09gfs2_lm_withdraw(sdp, "fatal: I/O error(s)\n");
=20
 =09return ret;
diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 662ef36c1874..0c3772974030 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -251,7 +251,7 @@ int gfs2_meta_read(struct gfs2_glock *gl, u64 blkno, in=
t flags,
 =09struct buffer_head *bh, *bhs[2];
 =09int num =3D 0;
=20
-=09if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags))) {
+=09if (unlikely(gfs2_withdrawn(sdp))) {
 =09=09*bhp =3D NULL;
 =09=09return -EIO;
 =09}
@@ -309,7 +309,7 @@ int gfs2_meta_read(struct gfs2_glock *gl, u64 blkno, in=
t flags,
=20
 int gfs2_meta_wait(struct gfs2_sbd *sdp, struct buffer_head *bh)
 {
-=09if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags)))
+=09if (unlikely(gfs2_withdrawn(sdp)))
 =09=09return -EIO;
=20
 =09wait_on_buffer(bh);
@@ -320,7 +320,7 @@ int gfs2_meta_wait(struct gfs2_sbd *sdp, struct buffer_=
head *bh)
 =09=09=09gfs2_io_error_bh_wd(sdp, bh);
 =09=09return -EIO;
 =09}
-=09if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags)))
+=09if (unlikely(gfs2_withdrawn(sdp)))
 =09=09return -EIO;
=20
 =09return 0;
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index de8f156adf7a..e8b7b0ce8404 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1006,8 +1006,7 @@ static int gfs2_lm_mount(struct gfs2_sbd *sdp, int si=
lent)
 void gfs2_lm_unmount(struct gfs2_sbd *sdp)
 {
 =09const struct lm_lockops *lm =3D sdp->sd_lockstruct.ls_ops;
-=09if (likely(!test_bit(SDF_WITHDRAWN, &sdp->sd_flags)) &&
-=09    lm->lm_unmount)
+=09if (likely(!gfs2_withdrawn(sdp)) && lm->lm_unmount)
 =09=09lm->lm_unmount(sdp);
 }
=20
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 8206fa0e8d2c..e9f93045eb01 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1475,7 +1475,7 @@ static void quotad_error(struct gfs2_sbd *sdp, const =
char *msg, int error)
 {
 =09if (error =3D=3D 0 || error =3D=3D -EROFS)
 =09=09return;
-=09if (!test_bit(SDF_WITHDRAWN, &sdp->sd_flags)) {
+=09if (!gfs2_withdrawn(sdp)) {
 =09=09fs_err(sdp, "gfs2_quotad: %s error %d\n", msg, error);
 =09=09sdp->sd_log_error =3D error;
 =09=09wake_up(&sdp->sd_logd_waitq);
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 5fa1eec4fb4f..478015bc6890 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -553,7 +553,7 @@ static void gfs2_dirty_inode(struct inode *inode, int f=
lags)
=20
 =09if (!(flags & I_DIRTY_INODE))
 =09=09return;
-=09if (unlikely(test_bit(SDF_WITHDRAWN, &sdp->sd_flags)))
+=09if (unlikely(gfs2_withdrawn(sdp)))
 =09=09return;
 =09if (!gfs2_glock_is_locked_by_me(ip->i_gl)) {
 =09=09ret =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
@@ -602,7 +602,7 @@ int gfs2_make_fs_ro(struct gfs2_sbd *sdp)
=20
 =09error =3D gfs2_glock_nq_init(sdp->sd_freeze_gl, LM_ST_SHARED, GL_NOCACH=
E,
 =09=09=09=09   &freeze_gh);
-=09if (error && !test_bit(SDF_WITHDRAWN, &sdp->sd_flags))
+=09if (error && !gfs2_withdrawn(sdp))
 =09=09return error;
=20
 =09flush_workqueue(gfs2_delete_workqueue);
@@ -761,7 +761,7 @@ static int gfs2_freeze(struct super_block *sb)
 =09if (atomic_read(&sdp->sd_freeze_state) !=3D SFS_UNFROZEN)
 =09=09goto out;
=20
-=09if (test_bit(SDF_WITHDRAWN, &sdp->sd_flags)) {
+=09if (gfs2_withdrawn(sdp)) {
 =09=09error =3D -EINVAL;
 =09=09goto out;
 =09}
diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index dd15b8e4af2c..8ccb68f4ed16 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -118,7 +118,7 @@ static ssize_t freeze_store(struct gfs2_sbd *sdp, const=
 char *buf, size_t len)
=20
 static ssize_t withdraw_show(struct gfs2_sbd *sdp, char *buf)
 {
-=09unsigned int b =3D test_bit(SDF_WITHDRAWN, &sdp->sd_flags);
+=09unsigned int b =3D gfs2_withdrawn(sdp);
 =09return snprintf(buf, PAGE_SIZE, "%u\n", b);
 }
=20
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index c45159133d8e..7305a7036c3e 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -258,13 +258,13 @@ void gfs2_io_error_bh_i(struct gfs2_sbd *sdp, struct =
buffer_head *bh,
 =09=09=09const char *function, char *file, unsigned int line,
 =09=09=09bool withdraw)
 {
-=09if (!test_bit(SDF_WITHDRAWN, &sdp->sd_flags))
-=09=09fs_err(sdp,
-=09=09       "fatal: I/O error\n"
-=09=09       "  block =3D %llu\n"
-=09=09       "  function =3D %s, file =3D %s, line =3D %u\n",
-=09=09       (unsigned long long)bh->b_blocknr,
-=09=09       function, file, line);
+=09if (gfs2_withdrawn(sdp))
+=09=09return;
+
+=09fs_err(sdp, "fatal: I/O error\n"
+=09       "  block =3D %llu\n"
+=09       "  function =3D %s, file =3D %s, line =3D %u\n",
+=09       (unsigned long long)bh->b_blocknr, function, file, line);
 =09if (withdraw)
 =09=09gfs2_lm_withdraw(sdp, NULL);
 }
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index 4b68b2c1fe56..858ab5b15a6c 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -164,6 +164,18 @@ static inline unsigned int gfs2_tune_get_i(struct gfs2=
_tune *gt,
 =09return x;
 }
=20
+/**
+ * gfs2_withdrawn - test whether the file system is withdrawing or withdra=
wn
+ * @sdp: the superblock
+ */
+static inline bool gfs2_withdrawn(struct gfs2_sbd *sdp)
+{
+=09if (test_bit(SDF_WITHDRAWN, &sdp->sd_flags) ||
+=09    test_bit(SDF_WITHDRAWING, &sdp->sd_flags))
+=09=09return true;
+=09return false;
+}
+
 #define gfs2_tune_get(sdp, field) \
 gfs2_tune_get_i(&(sdp)->sd_tune, &(sdp)->sd_tune.field)
=20
--=20
2.23.0

