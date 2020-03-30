Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7F9197D66
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:47:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576020;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hG1bY8ORiI/zyXihuggFdDMC1e5URpZufDX9pNQMpic=;
	b=Cy43yOfyj4/btNA9cLngAyRze7L/wyn2X75JFg/QkdrusTeF31LA1DIDlMhOMX+buEl4cq
	i9DTIBauJdPeVnconB9j6glIyGbP88190f45C0+P3jsrhabnfDs9+1olAfBKKedrKqrv6S
	NeyMuWpOuXhw7WUlnIGPMJoaru/lTog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-DtPlfN-qMm2yNPN3nqP2PQ-1; Mon, 30 Mar 2020 09:46:58 -0400
X-MC-Unique: DtPlfN-qMm2yNPN3nqP2PQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47B04800D50;
	Mon, 30 Mar 2020 13:46:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38FF396B7D;
	Mon, 30 Mar 2020 13:46:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F9EC18089CF;
	Mon, 30 Mar 2020 13:46:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkZtR020432 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F29B448; Mon, 30 Mar 2020 13:46:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B739497B17
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:34 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:46:01 -0500
Message-Id: <20200330134624.259349-17-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 16/39] gfs2: Add verbose option to
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, function check_journal_clean would give messages
related to journal recovery. That's fine for mount time, but when a
node withdraws and forces replay that way, we don't want all those
distracting and misleading messages. This patch adds a new parameter
to make those messages optional.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/ops_fstype.c |  2 +-
 fs/gfs2/util.c       | 23 ++++++++++++++++-------
 fs/gfs2/util.h       |  4 +++-
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 70d2abd000d8..1aeb591bfd28 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -696,7 +696,7 @@ static int init_journal(struct gfs2_sbd *sdp, int undo)
 =09=09=09struct gfs2_jdesc *jd =3D gfs2_jdesc_find(sdp, x);
=20
 =09=09=09if (sdp->sd_args.ar_spectator) {
-=09=09=09=09error =3D check_journal_clean(sdp, jd);
+=09=09=09=09error =3D check_journal_clean(sdp, jd, true);
 =09=09=09=09if (error)
 =09=09=09=09=09goto fail_jinode_gh;
 =09=09=09=09continue;
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 155a2249a32b..20a5860841e2 100644
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
@@ -223,7 +232,7 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 =09 * Now wait until recovery is complete.
 =09 */
 =09for (tries =3D 0; tries < 10; tries++) {
-=09=09ret =3D check_journal_clean(sdp, sdp->sd_jdesc);
+=09=09ret =3D check_journal_clean(sdp, sdp->sd_jdesc, false);
 =09=09if (!ret)
 =09=09=09break;
 =09=09msleep(HZ);
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index cf613497a20e..97117a766bde 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -136,7 +136,9 @@ static inline void gfs2_metatype_set(struct buffer_head=
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
2.25.1

