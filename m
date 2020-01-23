Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D7C16146D8C
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jan 2020 16:57:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579795019;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O03FnT7OvKEmsdYqHmj4VlgYwX7iB5Q3zs022tkqkmM=;
	b=IiOVFkizYzK/zLVplXtbkQUl9g1DF9d1u+0Js4hsVEL0/mKeioGvNRoKz/o/M4k34ZEAme
	5KhDUX4819k6fjrmhk80Dz9PThijlV/PuDKdVwGtd1wWlutq0IksPK0+qbmZ0mNqFULj7K
	houoPolcozlcj6gi/Buijtv2zvWy1Js=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-Yl9jZr8iNb6rAC-frJ4Tsg-1; Thu, 23 Jan 2020 10:56:58 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F5341937FCC;
	Thu, 23 Jan 2020 15:56:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE98C10016EB;
	Thu, 23 Jan 2020 15:56:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD29285941;
	Thu, 23 Jan 2020 15:56:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NFu3kw012330 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 10:56:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7708160C81; Thu, 23 Jan 2020 15:56:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 838EA60BE1
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 15:56:02 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 23 Jan 2020 15:55:42 +0000
Message-Id: <20200123155552.1080247-4-anprice@redhat.com>
In-Reply-To: <20200123155552.1080247-1-anprice@redhat.com>
References: <20200123155552.1080247-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 03/13] restoremeta: Use metafd instead of
	gzFile for parameters
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
X-MC-Unique: Yl9jZr8iNb6rAC-frJ4Tsg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

More decoupling of the restoremeta code from zlib functions and types.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 50 ++++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index a20d7aa0..82d43d8f 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -848,13 +848,13 @@ static int save_header(struct metafd *mfd, uint64_t f=
sbytes)
 =09return 0;
 }
=20
-static int read_header(gzFile gzin_fd, struct savemeta_header *smh)
+static int read_header(struct metafd *mfd, struct savemeta_header *smh)
 {
 =09size_t rs;
 =09struct savemeta_header smh_be =3D {0};
=20
-=09gzseek(gzin_fd, 0, SEEK_SET);
-=09rs =3D gzread(gzin_fd, &smh_be, sizeof(smh_be));
+=09gzseek(mfd->gzfd, 0, SEEK_SET);
+=09rs =3D gzread(mfd->gzfd, &smh_be, sizeof(smh_be));
 =09if (rs =3D=3D -1) {
 =09=09perror("Failed to read savemeta file header");
 =09=09return -1;
@@ -964,7 +964,7 @@ void savemeta(char *out_fn, int saveoption, int gziplev=
el)
 =09exit(0);
 }
=20
-static off_t restore_init(gzFile gzfd, struct savemeta_header *smh)
+static off_t restore_init(struct metafd *mfd, struct savemeta_header *smh)
 {
 =09int err;
 =09unsigned i;
@@ -973,7 +973,7 @@ static off_t restore_init(gzFile gzfd, struct savemeta_=
header *smh)
 =09off_t startpos =3D 0;
 =09struct gfs2_meta_header sbmh;
=20
-=09err =3D read_header(gzfd, smh);
+=09err =3D read_header(mfd, smh);
 =09if (err < 0) {
 =09=09exit(1);
 =09} else if (check_header(smh) !=3D 0) {
@@ -982,8 +982,8 @@ static off_t restore_init(gzFile gzfd, struct savemeta_=
header *smh)
 =09=09startpos =3D sizeof(*smh);
 =09}
=20
-=09gzseek(gzfd, startpos, SEEK_SET);
-=09rs =3D gzread(gzfd, buf, sizeof(buf));
+=09gzseek(mfd->gzfd, startpos, SEEK_SET);
+=09rs =3D gzread(mfd->gzfd, buf, sizeof(buf));
 =09if (rs !=3D sizeof(buf)) {
 =09=09fprintf(stderr, "Error: File is too small.\n");
 =09=09exit(1);
@@ -1003,14 +1003,14 @@ static off_t restore_init(gzFile gzfd, struct savem=
eta_header *smh)
 }
=20
=20
-static int restore_block(gzFile gzfd, struct saved_metablock *svb, char *b=
uf, uint16_t maxlen)
+static int restore_block(struct metafd *mfd, struct saved_metablock *svb, =
char *buf, uint16_t maxlen)
 {
 =09int gzerr;
 =09int ret;
 =09uint16_t checklen;
 =09const char *errstr;
=20
-=09ret =3D gzread(gzfd, svb, sizeof(*svb));
+=09ret =3D gzread(mfd->gzfd, svb, sizeof(*svb));
 =09if (ret < sizeof(*svb)) {
 =09=09goto gzread_err;
 =09}
@@ -1036,7 +1036,7 @@ static int restore_block(gzFile gzfd, struct saved_me=
tablock *svb, char *buf, ui
 =09}
=20
 =09if (buf !=3D NULL && maxlen !=3D 0) {
-=09=09ret =3D gzread(gzfd, buf, svb->siglen);
+=09=09ret =3D gzread(mfd->gzfd, buf, svb->siglen);
 =09=09if (ret < svb->siglen) {
 =09=09=09goto gzread_err;
 =09=09}
@@ -1045,17 +1045,17 @@ static int restore_block(gzFile gzfd, struct saved_=
metablock *svb, char *buf, ui
 =09return 0;
=20
 gzread_err:
-=09if (gzeof(gzfd))
+=09if (gzeof(mfd->gzfd))
 =09=09return 1;
=20
-=09errstr =3D gzerror(gzfd, &gzerr);
+=09errstr =3D gzerror(mfd->gzfd, &gzerr);
 =09if (gzerr =3D=3D Z_ERRNO)
 =09=09errstr =3D strerror(errno);
 =09fprintf(stderr, "Failed to restore block: %s\n", errstr);
 =09return -1;
 }
=20
-static int restore_super(gzFile gzfd, off_t pos)
+static int restore_super(struct metafd *mfd, off_t pos)
 {
 =09int ret;
 =09struct saved_metablock svb =3D {0};
@@ -1066,8 +1066,8 @@ static int restore_super(gzFile gzfd, off_t pos)
 =09=09perror("Failed to restore super block");
 =09=09exit(1);
 =09}
-=09gzseek(gzfd, pos, SEEK_SET);
-=09ret =3D restore_block(gzfd, &svb, buf, sizeof(struct gfs2_sb));
+=09gzseek(mfd->gzfd, pos, SEEK_SET);
+=09ret =3D restore_block(mfd, &svb, buf, sizeof(struct gfs2_sb));
 =09if (ret =3D=3D 1) {
 =09=09fprintf(stderr, "Reached end of file while restoring superblock\n");
 =09=09goto err;
@@ -1093,15 +1093,15 @@ err:
 =09return -1;
 }
=20
-static int find_highest_block(gzFile gzfd, off_t pos, uint64_t fssize)
+static int find_highest_block(struct metafd *mfd, off_t pos, uint64_t fssi=
ze)
 {
 =09int err =3D 0;
 =09uint64_t highest =3D 0;
 =09struct saved_metablock svb =3D {0};
=20
 =09while (1) {
-=09=09gzseek(gzfd, pos, SEEK_SET);
-=09=09err =3D restore_block(gzfd, &svb, NULL, 0);
+=09=09gzseek(mfd->gzfd, pos, SEEK_SET);
+=09=09err =3D restore_block(mfd, &svb, NULL, 0);
 =09=09if (err =3D=3D 1)
 =09=09=09break;
 =09=09if (err !=3D 0)
@@ -1124,7 +1124,7 @@ static int find_highest_block(gzFile gzfd, off_t pos,=
 uint64_t fssize)
 =09return 0;
 }
=20
-static int restore_data(int fd, gzFile gzin_fd, off_t pos, int printonly)
+static int restore_data(int fd, struct metafd *mfd, off_t pos, int printon=
ly)
 {
 =09struct saved_metablock savedata =3D {0};
 =09uint64_t writes =3D 0;
@@ -1136,11 +1136,11 @@ static int restore_data(int fd, gzFile gzin_fd, off=
_t pos, int printonly)
 =09=09exit(1);
 =09}
=20
-=09gzseek(gzin_fd, pos, SEEK_SET);
+=09gzseek(mfd->gzfd, pos, SEEK_SET);
 =09blks_saved =3D 0;
 =09while (TRUE) {
 =09=09int err;
-=09=09err =3D restore_block(gzin_fd, &savedata, buf, sbd.bsize);
+=09=09err =3D restore_block(mfd, &savedata, buf, sbd.bsize);
 =09=09if (err =3D=3D 1)
 =09=09=09break;
 =09=09if (err !=3D 0) {
@@ -1238,8 +1238,8 @@ void restoremeta(const char *in_fn, const char *out_d=
evice, uint64_t printonly)
 =09=09=09=09  optional block no */
 =09=09printonly =3D check_keywords(out_device);
=20
-=09pos =3D restore_init(mfd.gzfd, &smh);
-=09error =3D restore_super(mfd.gzfd, pos);
+=09pos =3D restore_init(&mfd, &smh);
+=09error =3D restore_super(&mfd, pos);
 =09if (error)
 =09=09exit(1);
=20
@@ -1250,11 +1250,11 @@ void restoremeta(const char *in_fn, const char *out=
_device, uint64_t printonly)
 =09=09printf("There are %"PRIu64" free blocks on the destination device.\n=
", space);
 =09}
=20
-=09error =3D find_highest_block(mfd.gzfd, pos, sbd.fssize);
+=09error =3D find_highest_block(&mfd, pos, sbd.fssize);
 =09if (error)
 =09=09exit(1);
=20
-=09error =3D restore_data(sbd.device_fd, mfd.gzfd, pos, printonly);
+=09error =3D restore_data(sbd.device_fd, &mfd, pos, printonly);
 =09printf("File %s %s %s.\n", in_fn,
 =09       (printonly ? "print" : "restore"),
 =09       (error ? "error" : "successful"));
--=20
2.24.1

