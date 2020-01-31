Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 43B7414F1E2
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jan 2020 19:08:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580494081;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Rk1flxJ43GlvBIx1Nksllg3+Dj9tK+PJbQlS4wZPUr0=;
	b=ffZUbdQzdGpeyRlIZbKCatmBZYg5DRXWaXHawYg31ZHISaqCFp8FOOp9ClBWBmnWG2yvfW
	pWbTybp00SqA5DRgtrEXXWkRJmafWE+bUPmbgV3sdaUr/Q+Snx1ShAzPlW+4KAT2WsukJP
	ZyJjPsR2RitgHhnX5FY5KeUv8rT7/h4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-Iim_uCpvO1yEiaw6Kx2UYQ-1; Fri, 31 Jan 2020 13:07:59 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33A45A10B8;
	Fri, 31 Jan 2020 18:07:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2296C5E1AD;
	Fri, 31 Jan 2020 18:07:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09B6E18089C8;
	Fri, 31 Jan 2020 18:07:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VI7sUN026970 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 13:07:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CD81660BE1; Fri, 31 Jan 2020 18:07:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0354760BE0
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 18:07:53 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 31 Jan 2020 12:07:10 -0600
Message-Id: <20200131180723.178863-13-rpeterso@redhat.com>
In-Reply-To: <20200131180723.178863-1-rpeterso@redhat.com>
References: <20200131180723.178863-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 12/25] gfs2: move check_journal_clean
	to util.c for future use
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Iim_uCpvO1yEiaw6Kx2UYQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch function check_journal_clean was in ops_fstype.c.
This patch moves it to util.c so we can make use of it elsewhere
in a future patch.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/ops_fstype.c | 42 -----------------------------------------
 fs/gfs2/util.c       | 45 ++++++++++++++++++++++++++++++++++++++++++++
 fs/gfs2/util.h       |  1 +
 3 files changed, 46 insertions(+), 42 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index b3e904bcc02c..d19ee57c99ce 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -600,48 +600,6 @@ static int gfs2_jindex_hold(struct gfs2_sbd *sdp, stru=
ct gfs2_holder *ji_gh)
 =09return error;
 }
=20
-/**
- * check_journal_clean - Make sure a journal is clean for a spectator moun=
t
- * @sdp: The GFS2 superblock
- * @jd: The journal descriptor
- *
- * Returns: 0 if the journal is clean or locked, else an error
- */
-static int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd=
)
-{
-=09int error;
-=09struct gfs2_holder j_gh;
-=09struct gfs2_log_header_host head;
-=09struct gfs2_inode *ip;
-
-=09ip =3D GFS2_I(jd->jd_inode);
-=09error =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED, LM_FLAG_NOEXP |
-=09=09=09=09   GL_EXACT | GL_NOCACHE, &j_gh);
-=09if (error) {
-=09=09fs_err(sdp, "Error locking journal for spectator mount.\n");
-=09=09return -EPERM;
-=09}
-=09error =3D gfs2_jdesc_check(jd);
-=09if (error) {
-=09=09fs_err(sdp, "Error checking journal for spectator mount.\n");
-=09=09goto out_unlock;
-=09}
-=09error =3D gfs2_find_jhead(jd, &head, false);
-=09if (error) {
-=09=09fs_err(sdp, "Error parsing journal for spectator mount.\n");
-=09=09goto out_unlock;
-=09}
-=09if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
-=09=09error =3D -EPERM;
-=09=09fs_err(sdp, "jid=3D%u: Journal is dirty, so the first mounter "
-=09=09       "must not be a spectator.\n", jd->jd_jid);
-=09}
-
-out_unlock:
-=09gfs2_glock_dq_uninit(&j_gh);
-=09return error;
-}
-
 static int init_journal(struct gfs2_sbd *sdp, int undo)
 {
 =09struct inode *master =3D d_inode(sdp->sd_master_dir);
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 47cd40de08b1..86965e6089c6 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -16,7 +16,10 @@
 #include "gfs2.h"
 #include "incore.h"
 #include "glock.h"
+#include "lops.h"
+#include "recovery.h"
 #include "rgrp.h"
+#include "super.h"
 #include "util.h"
=20
 struct kmem_cache *gfs2_glock_cachep __read_mostly;
@@ -33,6 +36,48 @@ void gfs2_assert_i(struct gfs2_sbd *sdp)
 =09fs_emerg(sdp, "fatal assertion failed\n");
 }
=20
+/**
+ * check_journal_clean - Make sure a journal is clean for a spectator moun=
t
+ * @sdp: The GFS2 superblock
+ * @jd: The journal descriptor
+ *
+ * Returns: 0 if the journal is clean or locked, else an error
+ */
+int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd)
+{
+=09int error;
+=09struct gfs2_holder j_gh;
+=09struct gfs2_log_header_host head;
+=09struct gfs2_inode *ip;
+
+=09ip =3D GFS2_I(jd->jd_inode);
+=09error =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED, LM_FLAG_NOEXP |
+=09=09=09=09   GL_EXACT | GL_NOCACHE, &j_gh);
+=09if (error) {
+=09=09fs_err(sdp, "Error locking journal for spectator mount.\n");
+=09=09return -EPERM;
+=09}
+=09error =3D gfs2_jdesc_check(jd);
+=09if (error) {
+=09=09fs_err(sdp, "Error checking journal for spectator mount.\n");
+=09=09goto out_unlock;
+=09}
+=09error =3D gfs2_find_jhead(jd, &head, false);
+=09if (error) {
+=09=09fs_err(sdp, "Error parsing journal for spectator mount.\n");
+=09=09goto out_unlock;
+=09}
+=09if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
+=09=09error =3D -EPERM;
+=09=09fs_err(sdp, "jid=3D%u: Journal is dirty, so the first mounter "
+=09=09       "must not be a spectator.\n", jd->jd_jid);
+=09}
+
+out_unlock:
+=09gfs2_glock_dq_uninit(&j_gh);
+=09return error;
+}
+
 void gfs2_lm(struct gfs2_sbd *sdp, const char *fmt, ...)
 {
 =09struct va_format vaf;
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index 16b2cc6c4560..cf613497a20e 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -136,6 +136,7 @@ static inline void gfs2_metatype_set(struct buffer_head=
 *bh, u16 type,
=20
 int gfs2_io_error_i(struct gfs2_sbd *sdp, const char *function,
 =09=09    char *file, unsigned int line);
+int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd);
=20
 #define gfs2_io_error(sdp) \
 gfs2_io_error_i((sdp), __func__, __FILE__, __LINE__);
--=20
2.24.1

