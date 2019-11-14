Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB22FC947
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Nov 2019 15:52:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573743150;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=YI9Pw4FYZ7R/9UDP970w65w97v78Z+GEpwW0OoEq3jU=;
	b=FscrESwoMHlIxZA/TA04ZMP1in4hgGo5rDhDLswZ899yYTwnIdt6c+wQ2we6zNrGJl4V8J
	cWvqlQhp2HyxuHUXIIJzYI9tAoEbrWgf0T0uXIhUTOzvqHza/IwtaiuIhU/pDMdB1Lr3eZ
	PUu53GO3n965seIbN2kNZmvvWfEaHrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-17NWyanvP_W11zkN3XRtlA-1; Thu, 14 Nov 2019 09:52:29 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD714800052;
	Thu, 14 Nov 2019 14:52:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A07810013A1;
	Thu, 14 Nov 2019 14:52:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E31218089CE;
	Thu, 14 Nov 2019 14:52:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEEqJqA023417 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 09:52:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A94055D9E2; Thu, 14 Nov 2019 14:52:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3A865E261
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 14:52:16 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0BDEB4BB5B
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 14:52:16 +0000 (UTC)
Date: Thu, 14 Nov 2019 09:52:15 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <788089991.29722188.1573743135983.JavaMail.zimbra@redhat.com>
In-Reply-To: <946265143.29711102.1573742986193.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.140, 10.4.195.18]
Thread-Topic: gfs2: Introduce function gfs2_withdrawn
Thread-Index: QVvLcHRHUBMYdxv+cDMWICCtSuTF7g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Introduce function gfs2_withdrawn
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 17NWyanvP_W11zkN3XRtlA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

This patch adds function gfs2_withdrawn and replaces all checks
for the SDF_WITHDRAWN bit to call it. This does not change the
logic or function of gfs2, and it facilitates later improvements
to the withdraw sequence.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c       |  4 ++--
 fs/gfs2/file.c       |  2 +-
 fs/gfs2/glock.c      |  7 +++----
 fs/gfs2/glops.c      |  2 +-
 fs/gfs2/meta_io.c    |  6 +++---
 fs/gfs2/ops_fstype.c |  3 +--
 fs/gfs2/quota.c      |  2 +-
 fs/gfs2/super.c      |  6 +++---
 fs/gfs2/sys.c        |  2 +-
 fs/gfs2/util.c       |  2 +-
 fs/gfs2/util.h       | 11 +++++++++++
 11 files changed, 28 insertions(+), 19 deletions(-)

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
index c45159133d8e..ec600b487498 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -258,7 +258,7 @@ void gfs2_io_error_bh_i(struct gfs2_sbd *sdp, struct bu=
ffer_head *bh,
 =09=09=09const char *function, char *file, unsigned int line,
 =09=09=09bool withdraw)
 {
-=09if (!test_bit(SDF_WITHDRAWN, &sdp->sd_flags))
+=09if (!gfs2_withdrawn(sdp))
 =09=09fs_err(sdp,
 =09=09       "fatal: I/O error\n"
 =09=09       "  block =3D %llu\n"
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index 4b68b2c1fe56..cddb7ead10df 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -164,6 +164,17 @@ static inline unsigned int gfs2_tune_get_i(struct gfs2=
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
+=09if (test_bit(SDF_WITHDRAWN, &sdp->sd_flags))
+=09=09return true;
+=09return false;
+}
+
 #define gfs2_tune_get(sdp, field) \
 gfs2_tune_get_i(&(sdp)->sd_tune, &(sdp)->sd_tune.field)
=20

