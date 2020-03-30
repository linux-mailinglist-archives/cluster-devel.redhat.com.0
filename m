Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 01C35197D56
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:46:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576013;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C6KPB3mrP+66IqtcOT0JIy6sp+aBofIii9hZbbkHrA8=;
	b=hjYhVRff72AIvRgNVleGwu+TLHYgSoRKMu6OWmcFvX6G+UMvLpJAyYvF0HRWt3Dt7dKWkT
	kn0Akk5iT4N5lfIl6CtTc48LcT62laz7nwl5STZzfEGZ6nbW1/OpsRu8LX3aEhE2s0cG8W
	fefbBfewjB1qFHT52TGrEfTbEKCfn/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-bWXKE_t5MauAcirJjOc1sA-1; Mon, 30 Mar 2020 09:46:50 -0400
X-MC-Unique: bWXKE_t5MauAcirJjOc1sA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EF1085B6F6;
	Mon, 30 Mar 2020 13:46:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F16036031F;
	Mon, 30 Mar 2020 13:46:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D620618089CD;
	Mon, 30 Mar 2020 13:46:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkXGs020346 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B3A3696F88; Mon, 30 Mar 2020 13:46:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 767E95C1A8
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:33 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:45:58 -0500
Message-Id: <20200330134624.259349-14-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 13/39] gfs2: Allow some glocks to be
	used during withdraw
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

We need to allow some glocks to be enqueued, dequeued, promoted, and demote=
d
when we're withdrawn. For example, to maintain metadata integrity, we shoul=
d
disallow the use of inode and rgrp glocks when withdrawn. Other glocks, lik=
e
iopen or the transaction glocks may be safely used because none of their
metadata goes through the journal. So in general, we should disallow all
glocks with an address space, and allow all the others. One exception is:
we need to allow our active journal to be demoted so others may recover it.

Allowing glocks after withdraw gives us the ability to take appropriate
action (in a following patch) to have our journal properly replayed by
another node rather than just abandoning the current transactions and
pretending nothing bad happened, leaving the other nodes free to modify
the blocks we had in our journal, which may result in file system
corruption.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c      | 33 +++++++++++++++++++++++++++++----
 fs/gfs2/glops.c      | 10 +++++++---
 fs/gfs2/incore.h     |  8 +++++---
 fs/gfs2/ops_fstype.c |  4 ++++
 4 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 1cb471a8bc87..454d94dd8933 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -133,6 +133,33 @@ static void gfs2_glock_dealloc(struct rcu_head *rcu)
 =09}
 }
=20
+/**
+ * glock_blocked_by_withdraw - determine if we can still use a glock
+ * @gl: the glock
+ *
+ * We need to allow some glocks to be enqueued, dequeued, promoted, and de=
moted
+ * when we're withdrawn. For example, to maintain metadata integrity, we s=
hould
+ * disallow the use of inode and rgrp glocks when withdrawn. Other glocks,=
 like
+ * iopen or the transaction glocks may be safely used because none of thei=
r
+ * metadata goes through the journal. So in general, we should disallow al=
l
+ * glocks that are journaled, and allow all the others. One exception is:
+ * we need to allow our active journal to be promoted and demoted so other=
s
+ * may recover it and we can reacquire it when they're done.
+ */
+static bool glock_blocked_by_withdraw(struct gfs2_glock *gl)
+{
+=09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
+
+=09if (likely(!gfs2_withdrawn(sdp)))
+=09=09return false;
+=09if (gl->gl_ops->go_flags & GLOF_NONDISK)
+=09=09return false;
+=09if (!sdp->sd_jdesc ||
+=09    gl->gl_name.ln_number =3D=3D sdp->sd_jdesc->jd_no_addr)
+=09=09return false;
+=09return true;
+}
+
 void gfs2_glock_free(struct gfs2_glock *gl)
 {
 =09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
@@ -549,8 +576,7 @@ __acquires(&gl->gl_lockref.lock)
 =09unsigned int lck_flags =3D (unsigned int)(gh ? gh->gh_flags : 0);
 =09int ret;
=20
-=09if (unlikely(gfs2_withdrawn(sdp)) &&
-=09    target !=3D LM_ST_UNLOCKED)
+=09if (target !=3D LM_ST_UNLOCKED && glock_blocked_by_withdraw(gl))
 =09=09return;
 =09lck_flags &=3D (LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_NOEXP |
 =09=09      LM_FLAG_PRIORITY);
@@ -1194,10 +1220,9 @@ __acquires(&gl->gl_lockref.lock)
 int gfs2_glock_nq(struct gfs2_holder *gh)
 {
 =09struct gfs2_glock *gl =3D gh->gh_gl;
-=09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
 =09int error =3D 0;
=20
-=09if (unlikely(gfs2_withdrawn(sdp)))
+=09if (glock_blocked_by_withdraw(gl))
 =09=09return -EIO;
=20
 =09if (test_bit(GLF_LRU, &gl->gl_flags))
diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 1c557457c753..3553ca939337 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -579,6 +579,7 @@ static void iopen_go_callback(struct gfs2_glock *gl, bo=
ol remote)
=20
 const struct gfs2_glock_operations gfs2_meta_glops =3D {
 =09.go_type =3D LM_TYPE_META,
+=09.go_flags =3D GLOF_NONDISK,
 };
=20
 const struct gfs2_glock_operations gfs2_inode_glops =3D {
@@ -605,30 +606,33 @@ const struct gfs2_glock_operations gfs2_freeze_glops =
=3D {
 =09.go_xmote_bh =3D freeze_go_xmote_bh,
 =09.go_demote_ok =3D freeze_go_demote_ok,
 =09.go_type =3D LM_TYPE_NONDISK,
+=09.go_flags =3D GLOF_NONDISK,
 };
=20
 const struct gfs2_glock_operations gfs2_iopen_glops =3D {
 =09.go_type =3D LM_TYPE_IOPEN,
 =09.go_callback =3D iopen_go_callback,
-=09.go_flags =3D GLOF_LRU,
+=09.go_flags =3D GLOF_LRU | GLOF_NONDISK,
 };
=20
 const struct gfs2_glock_operations gfs2_flock_glops =3D {
 =09.go_type =3D LM_TYPE_FLOCK,
-=09.go_flags =3D GLOF_LRU,
+=09.go_flags =3D GLOF_LRU | GLOF_NONDISK,
 };
=20
 const struct gfs2_glock_operations gfs2_nondisk_glops =3D {
 =09.go_type =3D LM_TYPE_NONDISK,
+=09.go_flags =3D GLOF_NONDISK,
 };
=20
 const struct gfs2_glock_operations gfs2_quota_glops =3D {
 =09.go_type =3D LM_TYPE_QUOTA,
-=09.go_flags =3D GLOF_LVB | GLOF_LRU,
+=09.go_flags =3D GLOF_LVB | GLOF_LRU | GLOF_NONDISK,
 };
=20
 const struct gfs2_glock_operations gfs2_journal_glops =3D {
 =09.go_type =3D LM_TYPE_JOURNAL,
+=09.go_flags =3D GLOF_NONDISK,
 };
=20
 const struct gfs2_glock_operations *gfs2_glops_list[] =3D {
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index ab89f746b3b6..3072707aff7a 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -244,9 +244,10 @@ struct gfs2_glock_operations {
 =09void (*go_callback)(struct gfs2_glock *gl, bool remote);
 =09const int go_type;
 =09const unsigned long go_flags;
-#define GLOF_ASPACE 1
-#define GLOF_LVB    2
-#define GLOF_LRU    4
+#define GLOF_ASPACE 1 /* address space attached */
+#define GLOF_LVB    2 /* Lock Value Block attached */
+#define GLOF_LRU    4 /* LRU managed */
+#define GLOF_NONDISK   8 /* not I/O related */
 };
=20
 enum {
@@ -541,6 +542,7 @@ struct gfs2_jdesc {
 =09struct list_head jd_revoke_list;
 =09unsigned int jd_replay_tail;
=20
+=09u64 jd_no_addr;
 };
=20
 struct gfs2_statfs_change_host {
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index d19ee57c99ce..74389d856dd3 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -552,6 +552,8 @@ static int gfs2_jindex_hold(struct gfs2_sbd *sdp, struc=
t gfs2_holder *ji_gh)
 =09mutex_lock(&sdp->sd_jindex_mutex);
=20
 =09for (;;) {
+=09=09struct gfs2_inode *jip;
+
 =09=09error =3D gfs2_glock_nq_init(dip->i_gl, LM_ST_SHARED, 0, ji_gh);
 =09=09if (error)
 =09=09=09break;
@@ -591,6 +593,8 @@ static int gfs2_jindex_hold(struct gfs2_sbd *sdp, struc=
t gfs2_holder *ji_gh)
=20
 =09=09spin_lock(&sdp->sd_jindex_spin);
 =09=09jd->jd_jid =3D sdp->sd_journals++;
+=09=09jip =3D GFS2_I(jd->jd_inode);
+=09=09jd->jd_no_addr =3D jip->i_no_addr;
 =09=09list_add_tail(&jd->jd_list, &sdp->sd_jindex_list);
 =09=09spin_unlock(&sdp->sd_jindex_spin);
 =09}
--=20
2.25.1

