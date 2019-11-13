Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A9218FBAC7
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680648;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Kp+5y8S1jzz/LwVGZctNdPUaTm/C+TsAuymLvw1+gtQ=;
	b=VIti7gK/8uNgNr/7554eukpCUmXM7l7jHXtxF/DMNo99GPbupNONLutJYNMtdBJHyhX0YQ
	M4iwGwak9vDaUxGGnjMs4kjiwVEp5nDYk777aVi0lAizm0FEeEVZo1AYAsTL5C2FQM6/4g
	rsCJLU+TqefxLIeMst8farM5d2JuXjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-ou4UdsGoOiWd3qiNcBcgXQ-1; Wed, 13 Nov 2019 16:30:46 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 356198AB932;
	Wed, 13 Nov 2019 21:30:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 214311036C6E;
	Wed, 13 Nov 2019 21:30:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 04CA518034F0;
	Wed, 13 Nov 2019 21:30:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUdsD005305 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B257769739; Wed, 13 Nov 2019 21:30:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D1005C1BB
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:39 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:13 -0600
Message-Id: <20191113213030.237431-16-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 15/32] gfs2: Add verbose option to
	check_journal_clean
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
X-MC-Unique: ou4UdsGoOiWd3qiNcBcgXQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Before this patch, function check_journal_clean would give messages
related to journal recovery. That's fine for mount time, but when a
node withdraws and forces replay that way, we don't want all those
distracting and misleading messages. This patch adds a new parameter
to make those messages optional.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/ops_fstype.c |  2 +-
 fs/gfs2/util.c       | 23 ++++++++++++++++-------
 fs/gfs2/util.h       |  4 +++-
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index d49741bf5a0f..22df012cbbd6 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -690,7 +690,7 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 =09=09=09struct gfs2_jdesc *jd =3D gfs2_jdesc_find(sdp, x);
=20
 =09=09=09if (sdp->sd_args.ar_spectator) {
-=09=09=09=09error =3D check_journal_clean(sdp, jd);
+=09=09=09=09error =3D check_journal_clean(sdp, jd, true);
 =09=09=09=09if (error)
 =09=09=09=09=09goto fail_jinode_gh;
 =09=09=09=09continue;
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 0d6ee69fab40..690a2f575709 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -46,7 +46,8 @@ void gfs2_assert_i(struct gfs2_sbd *sdp)
  *
  * Returns: 0 if the journal is clean or locked, else an error
  */
-int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd)
+int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
+=09=09=09bool verbose)
 {
 =09int error;
 =09struct gfs2_holder j_gh;
@@ -57,23 +58,31 @@ int check_journal_clean(struct gfs2_sbd *sdp, struct gf=
s2_jdesc *jd)
 =09error =3D gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED, LM_FLAG_NOEXP |
 =09=09=09=09   GL_EXACT | GL_NOCACHE, &j_gh);
 =09if (error) {
-=09=09fs_err(sdp, "Error locking journal for spectator mount.\n");
+=09=09if (verbose)
+=09=09=09fs_err(sdp, "Error %d locking journal for spectator "
+=09=09=09       "mount.\n", error);
 =09=09return -EPERM;
 =09}
 =09error =3D gfs2_jdesc_check(jd);
 =09if (error) {
-=09=09fs_err(sdp, "Error checking journal for spectator mount.\n");
+=09=09if (verbose)
+=09=09=09fs_err(sdp, "Error checking journal for spectator "
+=09=09=09       "mount.\n");
 =09=09goto out_unlock;
 =09}
 =09error =3D gfs2_find_jhead(jd, &head, false);
 =09if (error) {
-=09=09fs_err(sdp, "Error parsing journal for spectator mount.\n");
+=09=09if (verbose)
+=09=09=09fs_err(sdp, "Error parsing journal for spectator "
+=09=09=09       "mount.\n");
 =09=09goto out_unlock;
 =09}
 =09if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
 =09=09error =3D -EPERM;
-=09=09fs_err(sdp, "jid=3D%u: Journal is dirty, so the first mounter "
-=09=09       "must not be a spectator.\n", jd->jd_jid);
+=09=09if (verbose)
+=09=09=09fs_err(sdp, "jid=3D%u: Journal is dirty, so the first "
+=09=09=09       "mounter must not be a spectator.\n",
+=09=09=09       jd->jd_jid);
 =09}
=20
 out_unlock:
@@ -200,7 +209,7 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 =09 * Now wait until recovery complete.
 =09 */
 =09for (tries =3D 0; tries < 10; tries++) {
-=09=09ret =3D check_journal_clean(sdp, sdp->sd_jdesc);
+=09=09ret =3D check_journal_clean(sdp, sdp->sd_jdesc, false);
 =09=09if (!ret)
 =09=09=09break;
 =09=09msleep(HZ);
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index babdae6476ee..297eabc29856 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -128,7 +128,9 @@ static inline void gfs2_metatype_set(struct buffer_head=
 *bh, u16 type,
=20
 int gfs2_io_error_i(struct gfs2_sbd *sdp, const char *function,
 =09=09    char *file, unsigned int line);
-int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd);
+
+extern int check_journal_clean(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd=
,
+=09=09=09       bool verbose);
=20
 #define gfs2_io_error(sdp) \
 gfs2_io_error_i((sdp), __func__, __FILE__, __LINE__);
--=20
2.23.0

