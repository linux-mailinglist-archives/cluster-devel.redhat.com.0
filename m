Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2984814F1E3
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jan 2020 19:08:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580494084;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nLA7GPdmw3yZYwdMUQNwcfuT/xYgSCMPfaQhHQb3p4s=;
	b=icD7nqz8SKV+UoAhddrH2SRtSF6TerPY7pxD4vXyoarqdwDPAN2d9jK9m745CCDitNj2Z+
	RbYxBOeWKS32HGNOP1pxIdeyOdtN2bnoFsDZdtoDYkklusU1yxc+TZUdmOMWyDNUoC6SxA
	iaT2h9+MT8nXWMKbnGHK7nA+wP+h+Rw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-Gtb04_whOnKf6ZUGqlsd8g-1; Fri, 31 Jan 2020 13:08:01 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A99A80059D;
	Fri, 31 Jan 2020 18:07:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 671D360BE1;
	Fri, 31 Jan 2020 18:07:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D44985CE0;
	Fri, 31 Jan 2020 18:07:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VI7uLU026983 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 13:07:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 46AB360BE1; Fri, 31 Jan 2020 18:07:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5CEA160BE0
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 18:07:55 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 31 Jan 2020 12:07:11 -0600
Message-Id: <20200131180723.178863-14-rpeterso@redhat.com>
In-Reply-To: <20200131180723.178863-1-rpeterso@redhat.com>
References: <20200131180723.178863-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 13/25] gfs2: Allow some glocks to be
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Gtb04_whOnKf6ZUGqlsd8g-1
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
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c  | 31 +++++++++++++++++++++++++++----
 fs/gfs2/glops.c  | 10 +++++++---
 fs/gfs2/incore.h |  7 ++++---
 3 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 1cb471a8bc87..69c0c388e7be 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -133,6 +133,31 @@ static void gfs2_glock_dealloc(struct rcu_head *rcu)
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
+ * we need to allow our active journal to be demoted so others may recover=
 it.
+ */
+static bool glock_blocked_by_withdraw(struct gfs2_glock *gl)
+{
+=09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
+
+=09if (likely(!gfs2_withdrawn(sdp)))
+=09=09return false;
+=09if (gl->gl_ops->go_flags & GLOF_NONDISK)
+=09=09return false;
+=09if (!sdp->sd_jdesc || gl->gl_object =3D=3D sdp->sd_jdesc->jd_inode)
+=09=09return false;
+=09return true;
+}
+
 void gfs2_glock_free(struct gfs2_glock *gl)
 {
 =09struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
@@ -549,8 +574,7 @@ __acquires(&gl->gl_lockref.lock)
 =09unsigned int lck_flags =3D (unsigned int)(gh ? gh->gh_flags : 0);
 =09int ret;
=20
-=09if (unlikely(gfs2_withdrawn(sdp)) &&
-=09    target !=3D LM_ST_UNLOCKED)
+=09if (target !=3D LM_ST_UNLOCKED && glock_blocked_by_withdraw(gl))
 =09=09return;
 =09lck_flags &=3D (LM_FLAG_TRY | LM_FLAG_TRY_1CB | LM_FLAG_NOEXP |
 =09=09      LM_FLAG_PRIORITY);
@@ -1194,10 +1218,9 @@ __acquires(&gl->gl_lockref.lock)
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
index ab89f746b3b6..0d1cca2ac3b9 100644
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
--=20
2.24.1

