Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7E94A146D93
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jan 2020 16:57:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579795025;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=btOPSq6Iv/Te/Q8jywv0ev1C8kKxM4TlnbxPBZIqTQA=;
	b=SUiV1VjUXuTKzBejvRg1JKZGB8ThMbrw7EThI1kykJsRQvCnaS/5PMUqKsgoQVcT1zDAzn
	Qajr1QFldaVmVLjDZdtodKMAysEmvG9vtrXW39h+u1mIctaIg/qNwA13hRraif2PtuX2XA
	CDLBKnIAmY36fJz34dagCvhZcx2gGpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-j2Fj0IgwPVGRHZ_rSKIM0A-1; Thu, 23 Jan 2020 10:57:01 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F867800D53;
	Thu, 23 Jan 2020 15:56:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B9C660C84;
	Thu, 23 Jan 2020 15:56:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D4D08594A;
	Thu, 23 Jan 2020 15:56:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NFuQaM012452 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 10:56:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 815AD60C81; Thu, 23 Jan 2020 15:56:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B616760BE1
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 15:56:25 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 23 Jan 2020 15:55:51 +0000
Message-Id: <20200123155552.1080247-13-anprice@redhat.com>
In-Reply-To: <20200123155552.1080247-1-anprice@redhat.com>
References: <20200123155552.1080247-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 12/13] restoremeta: Add bzip2 support
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
X-MC-Unique: j2Fj0IgwPVGRHZ_rSKIM0A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Implement the required functions for adding bzip2 support and add
functions for reading the initial chunk so that we can try each
compression method. gzip has to be tried last as zlib's read function
doesn't report if the file is not in gzip format, it just returns the
data as-is. Adds a dependency on libbzip2.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 configure.ac          |   1 +
 gfs2/edit/Makefile.am |   2 +
 gfs2/edit/savemeta.c  | 136 +++++++++++++++++++++++++++++++-----------
 3 files changed, 105 insertions(+), 34 deletions(-)

diff --git a/configure.ac b/configure.ac
index 0c1b0192..de9d5264 100644
--- a/configure.ac
+++ b/configure.ac
@@ -104,6 +104,7 @@ PKG_CHECK_MODULES([check], [check >=3D 0.9.8],
 AM_CONDITIONAL([HAVE_CHECK], [test "x$have_check" =3D "xyes"])
=20
 PKG_CHECK_MODULES([zlib],[zlib])
+PKG_CHECK_MODULES([bzip2],[bzip2])
 PKG_CHECK_MODULES([blkid],[blkid])
 PKG_CHECK_MODULES([uuid],[uuid],
                   [have_uuid=3Dyes],
diff --git a/gfs2/edit/Makefile.am b/gfs2/edit/Makefile.am
index 4a89502c..53a7dea6 100644
--- a/gfs2/edit/Makefile.am
+++ b/gfs2/edit/Makefile.am
@@ -23,11 +23,13 @@ gfs2_edit_CPPFLAGS =3D \
 gfs2_edit_CFLAGS =3D \
 =09$(ncurses_CFLAGS) \
 =09$(zlib_CFLAGS) \
+=09$(bzip2_CFLAGS) \
 =09$(uuid_CFLAGS)
=20
 gfs2_edit_LDADD =3D \
 =09$(top_builddir)/gfs2/libgfs2/libgfs2.la \
 =09$(ncurses_LIBS) \
 =09$(zlib_LIBS) \
+=09$(bzip2_LIBS) \
 =09$(uuid_LIBS)
=20
diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 7e47b810..e20b405d 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -19,6 +19,7 @@
 #include <sys/time.h>
 #include <linux/gfs2_ondisk.h>
 #include <zlib.h>
+#include <bzlib.h>
 #include <time.h>
=20
 #include <logging.h>
@@ -52,6 +53,7 @@ struct saved_metablock {
 struct metafd {
 =09int fd;
 =09gzFile gzfd;
+=09BZFILE *bzfd;
 =09const char *filename;
 =09int gziplevel;
 =09int eof;
@@ -60,6 +62,31 @@ struct metafd {
 =09const char* (*strerr)(struct metafd *mfd);
 };
=20
+char *restore_buf;
+ssize_t restore_left;
+off_t restore_off;
+#define RESTORE_BUF_SIZE (2 * 1024 * 1024)
+
+static char *restore_buf_next(struct metafd *mfd, size_t required_len)
+{
+=09if (restore_left < required_len) {
+=09=09char *tail =3D restore_buf + restore_off;
+=09=09int ret;
+
+=09=09memmove(restore_buf, tail, restore_left);
+=09=09ret =3D mfd->read(mfd, restore_buf + restore_left, RESTORE_BUF_SIZE =
- restore_left);
+=09=09if (ret < (int)required_len - restore_left)
+=09=09=09return NULL;
+=09=09restore_left +=3D ret;
+=09=09restore_off =3D 0;
+=09}
+=09restore_left -=3D required_len;
+=09restore_off +=3D required_len;
+=09return &restore_buf[restore_off - required_len];
+}
+
+/* gzip compression method */
+
 static const char *gz_strerr(struct metafd *mfd)
 {
 =09int err;
@@ -83,6 +110,76 @@ static void gz_close(struct metafd *mfd)
 =09gzclose(mfd->gzfd);
 }
=20
+/* This should be tried last because gzip doesn't distinguish between
+   decompressing a gzip file and reading an uncompressed file */
+static int restore_try_gzip(struct metafd *mfd)
+{
+=09mfd->read =3D gz_read;
+=09mfd->close =3D gz_close;
+=09mfd->strerr =3D gz_strerr;
+=09lseek(mfd->fd, 0, SEEK_SET);
+=09mfd->gzfd =3D gzdopen(mfd->fd, "rb");
+=09if (!mfd->gzfd)
+=09=09return 1;
+=09restore_left =3D mfd->read(mfd, restore_buf, RESTORE_BUF_SIZE);
+=09if (restore_left < 512)
+=09=09return -1;
+=09return 0;
+}
+
+/* bzip2 compression method */
+
+static const char *bz_strerr(struct metafd *mfd)
+{
+=09int err;
+=09const char *errstr =3D BZ2_bzerror(mfd->bzfd, &err);
+
+=09if (err =3D=3D BZ_IO_ERROR)
+=09=09return strerror(errno);
+=09return errstr;
+}
+
+static int bz_read(struct metafd *mfd, void *buf, unsigned len)
+{
+=09int bzerr =3D BZ_OK;
+=09int ret;
+
+=09ret =3D BZ2_bzRead(&bzerr, mfd->bzfd, buf, len);
+=09if (bzerr =3D=3D BZ_OK)
+=09=09return ret;
+=09if (bzerr =3D=3D BZ_STREAM_END) {
+=09=09mfd->eof =3D 1;
+=09=09return ret;
+=09}
+=09return -1;
+}
+
+static void bz_close(struct metafd *mfd)
+{
+=09BZ2_bzclose(mfd->bzfd);
+}
+
+static int restore_try_bzip(struct metafd *mfd)
+{
+=09int bzerr;
+=09FILE *f;
+
+=09f =3D fdopen(mfd->fd, "r");
+=09if (f =3D=3D NULL)
+=09=09return 1;
+
+=09mfd->read =3D bz_read;
+=09mfd->close =3D bz_close;
+=09mfd->strerr =3D bz_strerr;
+=09mfd->bzfd =3D BZ2_bzReadOpen(&bzerr, f, 0, 0, NULL, 0);
+=09if (!mfd->bzfd)
+=09=09return 1;
+=09restore_left =3D mfd->read(mfd, restore_buf, RESTORE_BUF_SIZE);
+=09if (restore_left < 512)
+=09=09return -1;
+=09return 0;
+}
+
 static uint64_t blks_saved;
 static uint64_t journal_blocks[MAX_JOURNALS_SAVED];
 static uint64_t gfs1_journal_size =3D 0; /* in blocks */
@@ -345,11 +442,13 @@ static void warm_fuzzy_stuff(uint64_t wfsblock, int f=
orce)
  */
 static struct metafd savemetaopen(char *out_fn, int gziplevel)
 {
-=09struct metafd mfd =3D {-1, NULL, NULL, gziplevel};
+=09struct metafd mfd =3D {0};
 =09char gzmode[3] =3D "w9";
 =09char dft_fn[] =3D DFT_SAVE_FILE;
 =09mode_t mask =3D umask(S_IXUSR | S_IRWXG | S_IRWXO);
=20
+=09mfd.gziplevel =3D gziplevel;
+
 =09if (!out_fn) {
 =09=09out_fn =3D dft_fn;
 =09=09mfd.fd =3D mkstemp(out_fn);
@@ -959,29 +1058,6 @@ void savemeta(char *out_fn, int saveoption, int gzipl=
evel)
 =09exit(0);
 }
=20
-char *restore_buf;
-ssize_t restore_left;
-off_t restore_off;
-#define RESTORE_BUF_SIZE (2 * 1024 * 1024)
-
-static char *restore_buf_next(struct metafd *mfd, size_t required_len)
-{
-=09if (restore_left < required_len) {
-=09=09char *tail =3D restore_buf + restore_off;
-=09=09int ret;
-
-=09=09memmove(restore_buf, tail, restore_left);
-=09=09ret =3D mfd->read(mfd, restore_buf + restore_left, RESTORE_BUF_SIZE =
- restore_left);
-=09=09if (ret < required_len - restore_left)
-=09=09=09return NULL;
-=09=09restore_left +=3D ret;
-=09=09restore_off =3D 0;
-=09}
-=09restore_left -=3D required_len;
-=09restore_off +=3D required_len;
-=09return &restore_buf[restore_off - required_len];
-}
-
 static int restore_block(struct metafd *mfd, struct saved_metablock *svb, =
char **buf, uint16_t maxlen)
 {
 =09struct saved_metablock *svb_be;
@@ -1140,16 +1216,8 @@ static int restore_init(const char *path, struct met=
afd *mfd, struct savemeta_he
 =09=09perror("Could not open metadata file");
 =09=09return 1;
 =09}
-=09mfd->read =3D gz_read;
-=09mfd->close =3D gz_close;
-=09mfd->strerr =3D gz_strerr;
-=09mfd->gzfd =3D gzdopen(mfd->fd, "rb");
-=09if (!mfd->gzfd) {
-=09=09perror("gzdopen");
-=09=09return 1;
-=09}
-=09restore_left =3D mfd->read(mfd, restore_buf, RESTORE_BUF_SIZE);
-=09if (restore_left < 512) {
+=09if (restore_try_bzip(mfd) !=3D 0 &&
+=09    restore_try_gzip(mfd) !=3D 0) {
 =09=09fprintf(stderr, "Failed to read metadata file header and superblock\=
n");
 =09=09return -1;
 =09}
--=20
2.24.1

