Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F1B05146DA0
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jan 2020 16:58:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579795116;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4gbXRHDzIQz5NoXll0760LcFjOAoHvNJySz76QkguDU=;
	b=jReAB1FlXwiWeEeNjnxKI0QTIyzkVadeS0/Qgy64y50EUxdC28rAjWfQAQfCATfhIivy/s
	xKH7R75YCqKx+tOsuf/GRvxVgu3100BQAOr+7kJJ2AcNjF90xnOM9xm9THXa9tQk8hsPgF
	0/sOs7THtPlpKmCc/KACC4NX+SuXG4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-Itr_ESkMN8Sxyfzt---aKA-1; Thu, 23 Jan 2020 10:58:34 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B4641B18BC2;
	Thu, 23 Jan 2020 15:58:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1979F60C81;
	Thu, 23 Jan 2020 15:58:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F3E531832DEE;
	Thu, 23 Jan 2020 15:58:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NFu6Kj012350 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 10:56:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 853C960C81; Thu, 23 Jan 2020 15:56:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74D2D60BE1
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 15:56:05 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 23 Jan 2020 15:55:44 +0000
Message-Id: <20200123155552.1080247-6-anprice@redhat.com>
In-Reply-To: <20200123155552.1080247-1-anprice@redhat.com>
References: <20200123155552.1080247-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 05/13] restoremeta: Combine restore_init()
	and open_metadata()
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
X-MC-Unique: Itr_ESkMN8Sxyfzt---aKA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Later we'll need to know which compression method to use for the
metadata file in order to initialise a valid metadata file descriptor,
and that requires reading an initial chunk. So it makes sense to combine
the open_metadata() function with restore_init() which reads the
preamble from the metadata file.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 77 ++++++++++++++++++++------------------------
 1 file changed, 35 insertions(+), 42 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index ad565c1f..f77c6bf7 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -999,45 +999,6 @@ void savemeta(char *out_fn, int saveoption, int gziple=
vel)
 =09exit(0);
 }
=20
-static off_t restore_init(struct metafd *mfd, struct savemeta_header *smh)
-{
-=09int err;
-=09unsigned i;
-=09size_t rs;
-=09char buf[256];
-=09off_t startpos =3D 0;
-=09struct gfs2_meta_header sbmh;
-
-=09err =3D read_header(mfd, smh);
-=09if (err < 0) {
-=09=09exit(1);
-=09} else if (check_header(smh) !=3D 0) {
-=09=09printf("No valid file header found. Falling back to old format...\n"=
);
-=09} else if (err =3D=3D 0) {
-=09=09startpos =3D sizeof(*smh);
-=09}
-
-=09mfd->seek(mfd, startpos, SEEK_SET);
-=09rs =3D mfd->read(mfd, buf, sizeof(buf));
-=09if (rs !=3D sizeof(buf)) {
-=09=09fprintf(stderr, "Error: File is too small.\n");
-=09=09exit(1);
-=09}
-=09/* Scan for the beginning of the file body. Required to support old for=
mats(?). */
-=09for (i =3D 0; i < (256 - sizeof(struct saved_metablock) - sizeof(sbmh))=
; i++) {
-=09=09off_t off =3D i + sizeof(struct saved_metablock);
-
-=09=09memcpy(&sbmh, &buf[off], sizeof(sbmh));
-=09=09if (sbmh.mh_magic =3D=3D cpu_to_be32(GFS2_MAGIC) &&
-=09=09     sbmh.mh_type =3D=3D cpu_to_be32(GFS2_METATYPE_SB))
-=09=09=09break;
-=09}
-=09if (i =3D=3D (sizeof(buf) - sizeof(struct saved_metablock) - sizeof(sbm=
h)))
-=09=09i =3D 0;
-=09return startpos + i; /* File offset of saved sb */
-}
-
-
 static int restore_block(struct metafd *mfd, struct saved_metablock *svb, =
char *buf, uint16_t maxlen)
 {
 =09int ret;
@@ -1223,8 +1184,15 @@ static void complain(const char *complaint)
 =09    "<dest file system>\n");
 }
=20
-static int open_metadata(const char *path, struct metafd *mfd)
+static int restore_init(const char *path, struct metafd *mfd, struct savem=
eta_header *smh, off_t *pos)
 {
+=09struct gfs2_meta_header sbmh;
+=09off_t startpos =3D 0;
+=09char buf[256];
+=09unsigned i;
+=09size_t rs;
+=09int err;
+
 =09mfd->filename =3D path;
 =09mfd->fd =3D open(path, O_RDONLY|O_CLOEXEC);
 =09if (mfd->fd < 0) {
@@ -1241,6 +1209,32 @@ static int open_metadata(const char *path, struct me=
tafd *mfd)
 =09=09perror("gzdopen");
 =09=09return 1;
 =09}
+=09err =3D read_header(mfd, smh);
+=09if (err < 0) {
+=09=09return 1;
+=09} else if (check_header(smh) !=3D 0) {
+=09=09printf("No valid file header found. Falling back to old format...\n"=
);
+=09} else if (err =3D=3D 0) {
+=09=09startpos =3D sizeof(*smh);
+=09}
+=09mfd->seek(mfd, startpos, SEEK_SET);
+=09rs =3D mfd->read(mfd, buf, sizeof(buf));
+=09if (rs !=3D sizeof(buf)) {
+=09=09fprintf(stderr, "Error: File is too small.\n");
+=09=09return 1;
+=09}
+=09/* Scan for the beginning of the file body. Required to support old for=
mats(?). */
+=09for (i =3D 0; i < (256 - sizeof(struct saved_metablock) - sizeof(sbmh))=
; i++) {
+=09=09off_t off =3D i + sizeof(struct saved_metablock);
+
+=09=09memcpy(&sbmh, &buf[off], sizeof(sbmh));
+=09=09if (sbmh.mh_magic =3D=3D cpu_to_be32(GFS2_MAGIC) &&
+=09=09     sbmh.mh_type =3D=3D cpu_to_be32(GFS2_METATYPE_SB))
+=09=09=09break;
+=09}
+=09if (i =3D=3D (sizeof(buf) - sizeof(struct saved_metablock) - sizeof(sbm=
h)))
+=09=09i =3D 0;
+=09*pos =3D startpos + i; /* File offset of saved sb */
 =09return 0;
 }
=20
@@ -1257,7 +1251,7 @@ void restoremeta(const char *in_fn, const char *out_d=
evice, uint64_t printonly)
 =09if (!printonly && !out_device)
 =09=09complain("No destination file system specified.");
=20
-=09error =3D open_metadata(in_fn, &mfd);
+=09error =3D restore_init(in_fn, &mfd, &smh, &pos);
 =09if (error !=3D 0)
 =09=09exit(error);
=20
@@ -1270,7 +1264,6 @@ void restoremeta(const char *in_fn, const char *out_d=
evice, uint64_t printonly)
 =09=09=09=09  optional block no */
 =09=09printonly =3D check_keywords(out_device);
=20
-=09pos =3D restore_init(&mfd, &smh);
 =09error =3D restore_super(&mfd, pos);
 =09if (error)
 =09=09exit(1);
--=20
2.24.1

