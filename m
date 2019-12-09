Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 59E2D1170A0
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Dec 2019 16:37:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575905846;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XGvT9eud3yTtUyDm1csUjY3B/RkQfixByjPqghqhNfE=;
	b=IO2w4LOq6zK07mK2An38UhYq8TqmMpzjllKCEkWetis9qSEJfhULxXxzimbxOCswS6UMia
	hMhaMhHxmhcaKVutGgREGrp7oUPgL8lRU9x844S8dYanxjNuVQnooqi0e73jg0ptTfWx0K
	StmNz0Lj8MaCDkyLUCElkM/oTtmxp+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-Y-HcfwccMvy_3zYD-Y4cSw-1; Mon, 09 Dec 2019 10:37:24 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D948107B786;
	Mon,  9 Dec 2019 15:37:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79D416E3FC;
	Mon,  9 Dec 2019 15:37:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5146183554;
	Mon,  9 Dec 2019 15:37:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9Fb8v2004931 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 10:37:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5C3455DA75; Mon,  9 Dec 2019 15:37:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-248.phx2.redhat.com [10.3.116.248])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 289A35D9D6
	for <cluster-devel@redhat.com>; Mon,  9 Dec 2019 15:37:08 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon,  9 Dec 2019 09:36:50 -0600
Message-Id: <20191209153700.700208-13-rpeterso@redhat.com>
In-Reply-To: <20191209153700.700208-1-rpeterso@redhat.com>
References: <20191209153700.700208-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v8 PATCH 12/22] gfs2: Add verbose option to
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Y-HcfwccMvy_3zYD-Y4cSw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
index ab48583542bb..2f03c1c07da6 100644
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
index 0eec67b9900d..f23cced3809e 100644
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

