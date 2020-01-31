Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAF914F1DD
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jan 2020 19:07:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580494071;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TpRt4UMJNcgJNjt1bWMXgUjgN3u+OIxokEBmQiakKD4=;
	b=VAqSd5RPUZN30bWp/islkBqPyph/dnvyzKJVFiHZX3PToRXNOGy2U6ckZTyneGKbo2+9i5
	/Wfyog+e5JZXQedqcuy6mvoDMlAkjKnayNiC2suGxu9nRf8KSGqrQb1X9HFGg5DZDyQAlH
	6AkXr75Q/0nHNoFNmk73aSLu9h+z0i8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-oyqk2DzbMDK8uYk6OqVgUg-1; Fri, 31 Jan 2020 13:07:46 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1DA5805751;
	Fri, 31 Jan 2020 18:07:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F8DE60BE1;
	Fri, 31 Jan 2020 18:07:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D39285CE2;
	Fri, 31 Jan 2020 18:07:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VI7Vie026860 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 13:07:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DDE3960C81; Fri, 31 Jan 2020 18:07:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2DB560BE0
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 18:07:30 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 31 Jan 2020 12:06:59 -0600
Message-Id: <20200131180723.178863-2-rpeterso@redhat.com>
In-Reply-To: <20200131180723.178863-1-rpeterso@redhat.com>
References: <20200131180723.178863-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 01/25] gfs2: Split gfs2_lm_withdraw
	into two functions
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
X-MC-Unique: oyqk2DzbMDK8uYk6OqVgUg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Andreas Gruenbacher <agruenba@redhat.com>

Split gfs2_lm_withdraw into a function that prints an error message and a
function that withdraws the filesystem.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c |   3 +-
 fs/gfs2/log.c   |  19 ++++----
 fs/gfs2/sys.c   |   3 +-
 fs/gfs2/util.c  | 124 +++++++++++++++++++++++++-----------------------
 fs/gfs2/util.h  |   3 +-
 5 files changed, 82 insertions(+), 70 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 061d22e1ceb6..58431f67665e 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -39,7 +39,8 @@ static void gfs2_ail_error(struct gfs2_glock *gl, const s=
truct buffer_head *bh)
 =09fs_err(gl->gl_name.ln_sbd, "AIL glock %u:%llu mapping %p\n",
 =09       gl->gl_name.ln_type, gl->gl_name.ln_number,
 =09       gfs2_glock2aspace(gl));
-=09gfs2_lm_withdraw(gl->gl_name.ln_sbd, "AIL error\n");
+=09gfs2_lm(gl->gl_name.ln_sbd, "AIL error\n");
+=09gfs2_withdraw(gl->gl_name.ln_sbd);
 }
=20
 /**
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 00a2e721a374..c4c7c013f7a7 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -165,7 +165,7 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct write=
back_control *wbc)
 =09spin_unlock(&sdp->sd_ail_lock);
 =09blk_finish_plug(&plug);
 =09if (withdraw)
-=09=09gfs2_lm_withdraw(sdp, NULL);
+=09=09gfs2_withdraw(sdp);
 =09trace_gfs2_ail_flush(sdp, wbc, 0);
 }
=20
@@ -239,8 +239,10 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp)
 =09ret =3D list_empty(&sdp->sd_ail1_list);
 =09spin_unlock(&sdp->sd_ail_lock);
=20
-=09if (withdraw)
-=09=09gfs2_lm_withdraw(sdp, "fatal: I/O error(s)\n");
+=09if (withdraw) {
+=09=09gfs2_lm(sdp, "fatal: I/O error(s)\n");
+=09=09gfs2_withdraw(sdp);
+=09}
=20
 =09return ret;
 }
@@ -1016,11 +1018,12 @@ int gfs2_logd(void *data)
=20
 =09=09/* Check for errors writing to the journal */
 =09=09if (sdp->sd_log_error) {
-=09=09=09gfs2_lm_withdraw(sdp,
-=09=09=09=09=09 "GFS2: fsid=3D%s: error %d: "
-=09=09=09=09=09 "withdrawing the file system to "
-=09=09=09=09=09 "prevent further damage.\n",
-=09=09=09=09=09 sdp->sd_fsname, sdp->sd_log_error);
+=09=09=09gfs2_lm(sdp,
+=09=09=09=09"GFS2: fsid=3D%s: error %d: "
+=09=09=09=09"withdrawing the file system to "
+=09=09=09=09"prevent further damage.\n",
+=09=09=09=09sdp->sd_fsname, sdp->sd_log_error);
+=09=09=09gfs2_withdraw(sdp);
 =09=09}
=20
 =09=09did_flush =3D false;
diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index 8ccb68f4ed16..a2eae5c578d6 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -136,7 +136,8 @@ static ssize_t withdraw_store(struct gfs2_sbd *sdp, con=
st char *buf, size_t len)
 =09if (val !=3D 1)
 =09=09return -EINVAL;
=20
-=09gfs2_lm_withdraw(sdp, "withdrawing from cluster at user's request\n");
+=09gfs2_lm(sdp, "withdrawing from cluster at user's request\n");
+=09gfs2_withdraw(sdp);
=20
 =09return len;
 }
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index ec600b487498..322012e2064e 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -33,28 +33,31 @@ void gfs2_assert_i(struct gfs2_sbd *sdp)
 =09fs_emerg(sdp, "fatal assertion failed\n");
 }
=20
-int gfs2_lm_withdraw(struct gfs2_sbd *sdp, const char *fmt, ...)
+void gfs2_lm(struct gfs2_sbd *sdp, const char *fmt, ...)
+{
+=09struct va_format vaf;
+=09va_list args;
+
+=09if (sdp->sd_args.ar_errors =3D=3D GFS2_ERRORS_WITHDRAW &&
+=09    test_bit(SDF_WITHDRAWN, &sdp->sd_flags))
+=09=09return;
+
+=09va_start(args, fmt);
+=09vaf.fmt =3D fmt;
+=09vaf.va =3D &args;
+=09fs_err(sdp, "%pV", &vaf);
+=09va_end(args);
+}
+
+int gfs2_withdraw(struct gfs2_sbd *sdp)
 {
 =09struct lm_lockstruct *ls =3D &sdp->sd_lockstruct;
 =09const struct lm_lockops *lm =3D ls->ls_ops;
-=09va_list args;
-=09struct va_format vaf;
=20
 =09if (sdp->sd_args.ar_errors =3D=3D GFS2_ERRORS_WITHDRAW &&
 =09    test_and_set_bit(SDF_WITHDRAWN, &sdp->sd_flags))
 =09=09return 0;
=20
-=09if (fmt) {
-=09=09va_start(args, fmt);
-
-=09=09vaf.fmt =3D fmt;
-=09=09vaf.va =3D &args;
-
-=09=09fs_err(sdp, "%pV", &vaf);
-
-=09=09va_end(args);
-=09}
-
 =09if (sdp->sd_args.ar_errors =3D=3D GFS2_ERRORS_WITHDRAW) {
 =09=09fs_err(sdp, "about to withdraw this file system\n");
 =09=09BUG_ON(sdp->sd_args.ar_debug);
@@ -89,10 +92,12 @@ int gfs2_assert_withdraw_i(struct gfs2_sbd *sdp, char *=
assertion,
 =09=09=09   const char *function, char *file, unsigned int line)
 {
 =09int me;
-=09me =3D gfs2_lm_withdraw(sdp,
-=09=09=09      "fatal: assertion \"%s\" failed\n"
-=09=09=09      "   function =3D %s, file =3D %s, line =3D %u\n",
-=09=09=09      assertion, function, file, line);
+
+=09gfs2_lm(sdp,
+=09=09"fatal: assertion \"%s\" failed\n"
+=09=09"   function =3D %s, file =3D %s, line =3D %u\n",
+=09=09assertion, function, file, line);
+=09me =3D gfs2_withdraw(sdp);
 =09dump_stack();
 =09return (me) ? -1 : -2;
 }
@@ -140,11 +145,10 @@ int gfs2_assert_warn_i(struct gfs2_sbd *sdp, char *as=
sertion,
 int gfs2_consist_i(struct gfs2_sbd *sdp, int cluster_wide, const char *fun=
ction,
 =09=09   char *file, unsigned int line)
 {
-=09int rv;
-=09rv =3D gfs2_lm_withdraw(sdp,
-=09=09=09      "fatal: filesystem consistency error - function =3D %s, fil=
e =3D %s, line =3D %u\n",
-=09=09=09      function, file, line);
-=09return rv;
+=09gfs2_lm(sdp,
+=09=09"fatal: filesystem consistency error - function =3D %s, file =3D %s,=
 line =3D %u\n",
+=09=09function, file, line);
+=09return gfs2_withdraw(sdp);
 }
=20
 /**
@@ -157,15 +161,15 @@ int gfs2_consist_inode_i(struct gfs2_inode *ip, int c=
luster_wide,
 =09=09=09 const char *function, char *file, unsigned int line)
 {
 =09struct gfs2_sbd *sdp =3D GFS2_SB(&ip->i_inode);
-=09int rv;
-=09rv =3D gfs2_lm_withdraw(sdp,
-=09=09=09      "fatal: filesystem consistency error\n"
-=09=09=09      "  inode =3D %llu %llu\n"
-=09=09=09      "  function =3D %s, file =3D %s, line =3D %u\n",
-=09=09=09      (unsigned long long)ip->i_no_formal_ino,
-=09=09=09      (unsigned long long)ip->i_no_addr,
-=09=09=09      function, file, line);
-=09return rv;
+
+=09gfs2_lm(sdp,
+=09=09"fatal: filesystem consistency error\n"
+=09=09"  inode =3D %llu %llu\n"
+=09=09"  function =3D %s, file =3D %s, line =3D %u\n",
+=09=09(unsigned long long)ip->i_no_formal_ino,
+=09=09(unsigned long long)ip->i_no_addr,
+=09=09function, file, line);
+=09return gfs2_withdraw(sdp);
 }
=20
 /**
@@ -179,17 +183,16 @@ int gfs2_consist_rgrpd_i(struct gfs2_rgrpd *rgd, int =
cluster_wide,
 {
 =09struct gfs2_sbd *sdp =3D rgd->rd_sbd;
 =09char fs_id_buf[sizeof(sdp->sd_fsname) + 7];
-=09int rv;
=20
 =09sprintf(fs_id_buf, "fsid=3D%s: ", sdp->sd_fsname);
 =09gfs2_rgrp_dump(NULL, rgd->rd_gl, fs_id_buf);
-=09rv =3D gfs2_lm_withdraw(sdp,
-=09=09=09      "fatal: filesystem consistency error\n"
-=09=09=09      "  RG =3D %llu\n"
-=09=09=09      "  function =3D %s, file =3D %s, line =3D %u\n",
-=09=09=09      (unsigned long long)rgd->rd_addr,
-=09=09=09      function, file, line);
-=09return rv;
+=09gfs2_lm(sdp,
+=09=09"fatal: filesystem consistency error\n"
+=09=09"  RG =3D %llu\n"
+=09=09"  function =3D %s, file =3D %s, line =3D %u\n",
+=09=09(unsigned long long)rgd->rd_addr,
+=09=09function, file, line);
+=09return gfs2_withdraw(sdp);
 }
=20
 /**
@@ -203,12 +206,14 @@ int gfs2_meta_check_ii(struct gfs2_sbd *sdp, struct b=
uffer_head *bh,
 =09=09       unsigned int line)
 {
 =09int me;
-=09me =3D gfs2_lm_withdraw(sdp,
-=09=09=09      "fatal: invalid metadata block\n"
-=09=09=09      "  bh =3D %llu (%s)\n"
-=09=09=09      "  function =3D %s, file =3D %s, line =3D %u\n",
-=09=09=09      (unsigned long long)bh->b_blocknr, type,
-=09=09=09      function, file, line);
+
+=09gfs2_lm(sdp,
+=09=09"fatal: invalid metadata block\n"
+=09=09"  bh =3D %llu (%s)\n"
+=09=09"  function =3D %s, file =3D %s, line =3D %u\n",
+=09=09(unsigned long long)bh->b_blocknr, type,
+=09=09function, file, line);
+=09me =3D gfs2_withdraw(sdp);
 =09return (me) ? -1 : -2;
 }
=20
@@ -223,12 +228,14 @@ int gfs2_metatype_check_ii(struct gfs2_sbd *sdp, stru=
ct buffer_head *bh,
 =09=09=09   char *file, unsigned int line)
 {
 =09int me;
-=09me =3D gfs2_lm_withdraw(sdp,
-=09=09=09      "fatal: invalid metadata block\n"
-=09=09=09      "  bh =3D %llu (type: exp=3D%u, found=3D%u)\n"
-=09=09=09      "  function =3D %s, file =3D %s, line =3D %u\n",
-=09=09=09      (unsigned long long)bh->b_blocknr, type, t,
-=09=09=09      function, file, line);
+
+=09gfs2_lm(sdp,
+=09=09"fatal: invalid metadata block\n"
+=09=09"  bh =3D %llu (type: exp=3D%u, found=3D%u)\n"
+=09=09"  function =3D %s, file =3D %s, line =3D %u\n",
+=09=09(unsigned long long)bh->b_blocknr, type, t,
+=09=09function, file, line);
+=09me =3D gfs2_withdraw(sdp);
 =09return (me) ? -1 : -2;
 }
=20
@@ -241,12 +248,11 @@ int gfs2_metatype_check_ii(struct gfs2_sbd *sdp, stru=
ct buffer_head *bh,
 int gfs2_io_error_i(struct gfs2_sbd *sdp, const char *function, char *file=
,
 =09=09    unsigned int line)
 {
-=09int rv;
-=09rv =3D gfs2_lm_withdraw(sdp,
-=09=09=09      "fatal: I/O error\n"
-=09=09=09      "  function =3D %s, file =3D %s, line =3D %u\n",
-=09=09=09      function, file, line);
-=09return rv;
+=09gfs2_lm(sdp,
+=09=09"fatal: I/O error\n"
+=09=09"  function =3D %s, file =3D %s, line =3D %u\n",
+=09=09function, file, line);
+=09return gfs2_withdraw(sdp);
 }
=20
 /**
@@ -266,6 +272,6 @@ void gfs2_io_error_bh_i(struct gfs2_sbd *sdp, struct bu=
ffer_head *bh,
 =09=09       (unsigned long long)bh->b_blocknr,
 =09=09       function, file, line);
 =09if (withdraw)
-=09=09gfs2_lm_withdraw(sdp, NULL);
+=09=09gfs2_withdraw(sdp);
 }
=20
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index f2702bc9837c..fdc218a28609 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -177,6 +177,7 @@ static inline bool gfs2_withdrawn(struct gfs2_sbd *sdp)
 gfs2_tune_get_i(&(sdp)->sd_tune, &(sdp)->sd_tune.field)
=20
 __printf(2, 3)
-int gfs2_lm_withdraw(struct gfs2_sbd *sdp, const char *fmt, ...);
+void gfs2_lm(struct gfs2_sbd *sdp, const char *fmt, ...);
+int gfs2_withdraw(struct gfs2_sbd *sdp);
=20
 #endif /* __UTIL_DOT_H__ */
--=20
2.24.1

