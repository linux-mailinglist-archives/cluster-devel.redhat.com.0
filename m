Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9B61D146D9F
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jan 2020 16:58:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579795115;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UerpSh/mmFvQSSJgOX32GXWZ176tPnDBbaArnp7jJmA=;
	b=EXoCCSeJraNuanPcSXGlI2uLXA7HfkOPrZJHT12OybpkmJwD3fcSfnNyoqO34brXO8jJ5V
	OIS6MyKUflshzy8Y9SeEPLDhcviHXB7O5wTwE0YzVLmoGielL5t8r6RWqp1g0xj2g8eW9f
	YC67Aob2zEFRARY1Cd74vJ5NZFlhNYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-YrQtbJsFNTmBHhIJ9viOUQ-1; Thu, 23 Jan 2020 10:58:34 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E69FDBA6;
	Thu, 23 Jan 2020 15:58:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CF8385753;
	Thu, 23 Jan 2020 15:58:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72F3C8594A;
	Thu, 23 Jan 2020 15:58:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NFu4RB012336 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 10:56:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D339C60C84; Thu, 23 Jan 2020 15:56:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13C3E60BE1
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 15:56:03 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 23 Jan 2020 15:55:43 +0000
Message-Id: <20200123155552.1080247-5-anprice@redhat.com>
In-Reply-To: <20200123155552.1080247-1-anprice@redhat.com>
References: <20200123155552.1080247-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 04/13] restoremeta: Abstract out
	decompression operations
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
X-MC-Unique: YrQtbJsFNTmBHhIJ9viOUQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Wrap the gzip functions that restoremeta uses and call them via
function pointers, to provide the framework for supporting other
compression methods.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 76 +++++++++++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 22 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 82d43d8f..ad565c1f 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -54,8 +54,43 @@ struct metafd {
 =09gzFile gzfd;
 =09const char *filename;
 =09int gziplevel;
+=09int (*seek)(struct metafd *mfd, off_t off, int whence);
+=09int (*read)(struct metafd *mfd, void *buf, unsigned len);
+=09int (*iseof)(struct metafd *mfd);
+=09void (*close)(struct metafd *mfd);
+=09const char* (*strerr)(struct metafd *mfd);
 };
=20
+static const char *gz_strerr(struct metafd *mfd)
+{
+=09int err;
+=09const char *errstr =3D gzerror(mfd->gzfd, &err);
+
+=09if (err =3D=3D Z_ERRNO)
+=09=09return strerror(errno);
+=09return errstr;
+}
+
+static int gz_seek(struct metafd *mfd, off_t off, int whence)
+{
+=09return gzseek(mfd->gzfd, off, whence);
+}
+
+static int gz_read(struct metafd *mfd, void *buf, unsigned len)
+{
+=09return gzread(mfd->gzfd, buf, len);
+}
+
+static int gz_iseof(struct metafd *mfd)
+{
+=09return gzeof(mfd->gzfd);
+}
+
+static void gz_close(struct metafd *mfd)
+{
+=09gzclose(mfd->gzfd);
+}
+
 static uint64_t blks_saved;
 static uint64_t journal_blocks[MAX_JOURNALS_SAVED];
 static uint64_t gfs1_journal_size =3D 0; /* in blocks */
@@ -853,8 +888,8 @@ static int read_header(struct metafd *mfd, struct savem=
eta_header *smh)
 =09size_t rs;
 =09struct savemeta_header smh_be =3D {0};
=20
-=09gzseek(mfd->gzfd, 0, SEEK_SET);
-=09rs =3D gzread(mfd->gzfd, &smh_be, sizeof(smh_be));
+=09mfd->seek(mfd, 0, SEEK_SET);
+=09rs =3D mfd->read(mfd, &smh_be, sizeof(smh_be));
 =09if (rs =3D=3D -1) {
 =09=09perror("Failed to read savemeta file header");
 =09=09return -1;
@@ -982,8 +1017,8 @@ static off_t restore_init(struct metafd *mfd, struct s=
avemeta_header *smh)
 =09=09startpos =3D sizeof(*smh);
 =09}
=20
-=09gzseek(mfd->gzfd, startpos, SEEK_SET);
-=09rs =3D gzread(mfd->gzfd, buf, sizeof(buf));
+=09mfd->seek(mfd, startpos, SEEK_SET);
+=09rs =3D mfd->read(mfd, buf, sizeof(buf));
 =09if (rs !=3D sizeof(buf)) {
 =09=09fprintf(stderr, "Error: File is too small.\n");
 =09=09exit(1);
@@ -1005,14 +1040,13 @@ static off_t restore_init(struct metafd *mfd, struc=
t savemeta_header *smh)
=20
 static int restore_block(struct metafd *mfd, struct saved_metablock *svb, =
char *buf, uint16_t maxlen)
 {
-=09int gzerr;
 =09int ret;
 =09uint16_t checklen;
 =09const char *errstr;
=20
-=09ret =3D gzread(mfd->gzfd, svb, sizeof(*svb));
+=09ret =3D mfd->read(mfd, svb, sizeof(*svb));
 =09if (ret < sizeof(*svb)) {
-=09=09goto gzread_err;
+=09=09goto read_err;
 =09}
 =09svb->blk =3D be64_to_cpu(svb->blk);
 =09svb->siglen =3D be16_to_cpu(svb->siglen);
@@ -1036,21 +1070,19 @@ static int restore_block(struct metafd *mfd, struct=
 saved_metablock *svb, char *
 =09}
=20
 =09if (buf !=3D NULL && maxlen !=3D 0) {
-=09=09ret =3D gzread(mfd->gzfd, buf, svb->siglen);
+=09=09ret =3D mfd->read(mfd, buf, svb->siglen);
 =09=09if (ret < svb->siglen) {
-=09=09=09goto gzread_err;
+=09=09=09goto read_err;
 =09=09}
 =09}
=20
 =09return 0;
=20
-gzread_err:
-=09if (gzeof(mfd->gzfd))
+read_err:
+=09if (mfd->iseof(mfd))
 =09=09return 1;
=20
-=09errstr =3D gzerror(mfd->gzfd, &gzerr);
-=09if (gzerr =3D=3D Z_ERRNO)
-=09=09errstr =3D strerror(errno);
+=09errstr =3D mfd->strerr(mfd);
 =09fprintf(stderr, "Failed to restore block: %s\n", errstr);
 =09return -1;
 }
@@ -1066,7 +1098,7 @@ static int restore_super(struct metafd *mfd, off_t po=
s)
 =09=09perror("Failed to restore super block");
 =09=09exit(1);
 =09}
-=09gzseek(mfd->gzfd, pos, SEEK_SET);
+=09mfd->seek(mfd, pos, SEEK_SET);
 =09ret =3D restore_block(mfd, &svb, buf, sizeof(struct gfs2_sb));
 =09if (ret =3D=3D 1) {
 =09=09fprintf(stderr, "Reached end of file while restoring superblock\n");
@@ -1100,7 +1132,7 @@ static int find_highest_block(struct metafd *mfd, off=
_t pos, uint64_t fssize)
 =09struct saved_metablock svb =3D {0};
=20
 =09while (1) {
-=09=09gzseek(mfd->gzfd, pos, SEEK_SET);
+=09=09mfd->seek(mfd, pos, SEEK_SET);
 =09=09err =3D restore_block(mfd, &svb, NULL, 0);
 =09=09if (err =3D=3D 1)
 =09=09=09break;
@@ -1199,6 +1231,11 @@ static int open_metadata(const char *path, struct me=
tafd *mfd)
 =09=09perror("Could not open metadata file");
 =09=09return 1;
 =09}
+=09mfd->seek =3D gz_seek;
+=09mfd->read =3D gz_read;
+=09mfd->iseof =3D gz_iseof;
+=09mfd->close =3D gz_close;
+=09mfd->strerr =3D gz_strerr;
 =09mfd->gzfd =3D gzdopen(mfd->fd, "rb");
 =09if (!mfd->gzfd) {
 =09=09perror("gzdopen");
@@ -1207,11 +1244,6 @@ static int open_metadata(const char *path, struct me=
tafd *mfd)
 =09return 0;
 }
=20
-static void close_metadata(struct metafd *mfd)
-{
-=09gzclose(mfd->gzfd);
-}
-
 void restoremeta(const char *in_fn, const char *out_device, uint64_t print=
only)
 {
 =09int error;
@@ -1259,7 +1291,7 @@ void restoremeta(const char *in_fn, const char *out_d=
evice, uint64_t printonly)
 =09       (printonly ? "print" : "restore"),
 =09       (error ? "error" : "successful"));
=20
-=09close_metadata(&mfd);
+=09mfd.close(&mfd);
 =09if (!printonly)
 =09=09close(sbd.device_fd);
 =09free(indirect);
--=20
2.24.1

