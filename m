Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE1E146DA2
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jan 2020 16:58:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579795117;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RqxHgl0C/eNcpbPeXKV7CzHWWcuKJMN0Q+FYlYGFs/Q=;
	b=DuK7dtXJYe3suLiHvqkzUt5i/XEjf40Ax47g/kKUIprs5O6Wc6RrGYkEnAch5vOnMGPusT
	flhY5KBSdZBeC1WOrF0iqZ2QMIsiKb2htov1cgypR225cHjWY1csU+nARRq3Li44oG8nbq
	aqGIJG2zz1idgWmq4NhX9qKO0voqRuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-NK3GkJIUNHSijD4bQQNXrQ-1; Thu, 23 Jan 2020 10:58:35 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37610801E6C;
	Thu, 23 Jan 2020 15:58:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2536C5C296;
	Thu, 23 Jan 2020 15:58:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A9E98594D;
	Thu, 23 Jan 2020 15:58:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NFuL0j012421 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 10:56:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3D4F560BE1; Thu, 23 Jan 2020 15:56:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 059BF60C81
	for <cluster-devel@redhat.com>; Thu, 23 Jan 2020 15:56:14 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 23 Jan 2020 15:55:48 +0000
Message-Id: <20200123155552.1080247-10-anprice@redhat.com>
In-Reply-To: <20200123155552.1080247-1-anprice@redhat.com>
References: <20200123155552.1080247-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 09/13] restoremeta: Metadata file reading
	overhaul
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
X-MC-Unique: NK3GkJIUNHSijD4bQQNXrQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Read the metadata file in large chunks for improved performance and
remove seeks so that we're just chomping through the file sequentially.
This is required to support other compression methods as compressed
seeking is a slow (emulated with reads) operation in zlib and not
supported at all by libbzip2.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 199 +++++++++++++++++++++----------------------
 1 file changed, 98 insertions(+), 101 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index dd203974..99b88e42 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -54,7 +54,6 @@ struct metafd {
 =09gzFile gzfd;
 =09const char *filename;
 =09int gziplevel;
-=09int (*seek)(struct metafd *mfd, off_t off, int whence);
 =09int (*read)(struct metafd *mfd, void *buf, unsigned len);
 =09int (*iseof)(struct metafd *mfd);
 =09void (*close)(struct metafd *mfd);
@@ -71,11 +70,6 @@ static const char *gz_strerr(struct metafd *mfd)
 =09return errstr;
 }
=20
-static int gz_seek(struct metafd *mfd, off_t off, int whence)
-{
-=09return gzseek(mfd->gzfd, off, whence);
-}
-
 static int gz_read(struct metafd *mfd, void *buf, unsigned len)
 {
 =09return gzread(mfd->gzfd, buf, len);
@@ -864,25 +858,14 @@ static int save_header(struct metafd *mfd, uint64_t f=
sbytes)
 =09return 0;
 }
=20
-static int read_header(struct metafd *mfd, struct savemeta_header *smh)
+static void parse_header(char *buf, struct savemeta_header *smh)
 {
-=09size_t rs;
-=09struct savemeta_header smh_be =3D {0};
-
-=09rs =3D mfd->read(mfd, &smh_be, sizeof(smh_be));
-=09if (rs =3D=3D -1) {
-=09=09perror("Failed to read savemeta file header");
-=09=09return -1;
-=09}
-=09if (rs !=3D sizeof(smh_be))
-=09=09return 1;
+=09struct savemeta_header *smh_be =3D (void *)buf;
=20
-=09smh->sh_magic =3D be32_to_cpu(smh_be.sh_magic);
-=09smh->sh_format =3D be32_to_cpu(smh_be.sh_format);
-=09smh->sh_time =3D be64_to_cpu(smh_be.sh_time);
-=09smh->sh_fs_bytes =3D be64_to_cpu(smh_be.sh_fs_bytes);
-
-=09return 0;
+=09smh->sh_magic =3D be32_to_cpu(smh_be->sh_magic);
+=09smh->sh_format =3D be32_to_cpu(smh_be->sh_format);
+=09smh->sh_time =3D be64_to_cpu(smh_be->sh_time);
+=09smh->sh_fs_bytes =3D be64_to_cpu(smh_be->sh_fs_bytes);
 }
=20
 static int check_header(struct savemeta_header *smh)
@@ -979,18 +962,40 @@ void savemeta(char *out_fn, int saveoption, int gzipl=
evel)
 =09exit(0);
 }
=20
-static int restore_block(struct metafd *mfd, struct saved_metablock *svb, =
char *buf, uint16_t maxlen)
+char *restore_buf;
+ssize_t restore_left;
+off_t restore_off;
+#define RESTORE_BUF_SIZE (2 * 1024 * 1024)
+
+static char *restore_buf_next(struct metafd *mfd, size_t required_len)
 {
-=09int ret;
-=09uint16_t checklen;
+=09if (restore_left < required_len) {
+=09=09char *tail =3D restore_buf + restore_off;
+=09=09int ret;
+
+=09=09memmove(restore_buf, tail, restore_left);
+=09=09ret =3D mfd->read(mfd, restore_buf + restore_left, RESTORE_BUF_SIZE =
- restore_left);
+=09=09if (ret < required_len - restore_left)
+=09=09=09return NULL;
+=09=09restore_left +=3D ret;
+=09=09restore_off =3D 0;
+=09}
+=09restore_left -=3D required_len;
+=09restore_off +=3D required_len;
+=09return &restore_buf[restore_off - required_len];
+}
+
+static int restore_block(struct metafd *mfd, struct saved_metablock *svb, =
char **buf, uint16_t maxlen)
+{
+=09struct saved_metablock *svb_be;
 =09const char *errstr;
+=09uint16_t checklen;
=20
-=09ret =3D mfd->read(mfd, svb, sizeof(*svb));
-=09if (ret < sizeof(*svb)) {
+=09svb_be =3D (struct saved_metablock *)(restore_buf_next(mfd, sizeof(*svb=
)));
+=09if (svb_be =3D=3D NULL)
 =09=09goto read_err;
-=09}
-=09svb->blk =3D be64_to_cpu(svb->blk);
-=09svb->siglen =3D be16_to_cpu(svb->siglen);
+=09svb->blk =3D be64_to_cpu(svb_be->blk);
+=09svb->siglen =3D be16_to_cpu(svb_be->siglen);
=20
 =09if (sbd.fssize && svb->blk >=3D sbd.fssize) {
 =09=09fprintf(stderr, "Error: File system is too small to restore this met=
adata.\n");
@@ -1011,12 +1016,10 @@ static int restore_block(struct metafd *mfd, struct=
 saved_metablock *svb, char *
 =09}
=20
 =09if (buf !=3D NULL && maxlen !=3D 0) {
-=09=09ret =3D mfd->read(mfd, buf, svb->siglen);
-=09=09if (ret < svb->siglen) {
+=09=09*buf =3D restore_buf_next(mfd, svb->siglen);
+=09=09if (*buf =3D=3D NULL)
 =09=09=09goto read_err;
-=09=09}
 =09}
-
 =09return 0;
=20
 read_err:
@@ -1028,49 +1031,34 @@ read_err:
 =09return -1;
 }
=20
-static int restore_super(struct metafd *mfd, off_t pos)
+static int restore_super(struct metafd *mfd, char *buf, int printonly)
 {
 =09int ret;
-=09struct saved_metablock svb =3D {0};
-=09char *buf;
-
-=09buf =3D calloc(1, sizeof(struct gfs2_sb));
-=09if (buf =3D=3D NULL) {
-=09=09perror("Failed to restore super block");
-=09=09exit(1);
-=09}
-=09mfd->seek(mfd, pos, SEEK_SET);
-=09ret =3D restore_block(mfd, &svb, buf, sizeof(struct gfs2_sb));
-=09if (ret =3D=3D 1) {
-=09=09fprintf(stderr, "Reached end of file while restoring superblock\n");
-=09=09goto err;
-=09} else if (ret !=3D 0) {
-=09=09goto err;
-=09}
=20
 =09gfs2_sb_in(&sbd.sd_sb, buf);
 =09sbd1 =3D (struct gfs_sb *)&sbd.sd_sb;
 =09ret =3D check_sb(&sbd.sd_sb);
 =09if (ret < 0) {
-=09=09fprintf(stderr,"Error: Invalid superblock data.\n");
-=09=09goto err;
+=09=09fprintf(stderr, "Error: Invalid superblock in metadata file.\n");
+=09=09return -1;
 =09}
 =09if (ret =3D=3D 1)
 =09=09sbd.gfs1 =3D 1;
 =09sbd.bsize =3D sbd.sd_sb.sb_bsize;
-=09free(buf);
+=09if ((!printonly) && lgfs2_sb_write(&sbd.sd_sb, sbd.device_fd, sbd.bsize=
)) {
+=09=09fprintf(stderr, "Failed to write superblock\n");
+=09=09return -1;
+=09}
 =09printf("Block size is %uB\n", sbd.bsize);
 =09return 0;
-err:
-=09free(buf);
-=09return -1;
 }
=20
-static int restore_data(int fd, struct metafd *mfd, off_t pos, int printon=
ly)
+static int restore_data(int fd, struct metafd *mfd, int printonly)
 {
 =09struct saved_metablock savedata =3D {0};
 =09uint64_t writes =3D 0;
 =09char *buf;
+=09char *bp;
=20
 =09buf =3D calloc(1, sbd.bsize);
 =09if (buf =3D=3D NULL) {
@@ -1078,11 +1066,11 @@ static int restore_data(int fd, struct metafd *mfd,=
 off_t pos, int printonly)
 =09=09exit(1);
 =09}
=20
-=09gzseek(mfd->gzfd, pos, SEEK_SET);
 =09blks_saved =3D 0;
 =09while (TRUE) {
 =09=09int err;
-=09=09err =3D restore_block(mfd, &savedata, buf, sbd.bsize);
+
+=09=09err =3D restore_block(mfd, &savedata, &bp, sbd.bsize);
 =09=09if (err =3D=3D 1)
 =09=09=09break;
 =09=09if (err !=3D 0) {
@@ -1092,7 +1080,7 @@ static int restore_data(int fd, struct metafd *mfd, o=
ff_t pos, int printonly)
=20
 =09=09if (printonly) {
 =09=09=09struct gfs2_buffer_head dummy_bh =3D {
-=09=09=09=09.b_data =3D buf,
+=09=09=09=09.b_data =3D bp,
 =09=09=09=09.b_blocknr =3D savedata.blk,
 =09=09=09};
 =09=09=09if (printonly > 1 && printonly =3D=3D savedata.blk) {
@@ -1105,6 +1093,7 @@ static int restore_data(int fd, struct metafd *mfd, o=
ff_t pos, int printonly)
 =09=09=09}
 =09=09} else {
 =09=09=09warm_fuzzy_stuff(savedata.blk, FALSE);
+=09=09=09memcpy(buf, bp, savedata.siglen);
 =09=09=09memset(buf + savedata.siglen, 0, sbd.bsize - savedata.siglen);
 =09=09=09if (pwrite(fd, buf, sbd.bsize, savedata.blk * sbd.bsize) !=3D sbd=
.bsize) {
 =09=09=09=09fprintf(stderr, "write error: %s from %s:%d: block %lld (0x%ll=
x)\n",
@@ -1133,14 +1122,20 @@ static void complain(const char *complaint)
 =09    "<dest file system>\n");
 }
=20
-static int restore_init(const char *path, struct metafd *mfd, struct savem=
eta_header *smh, off_t *pos)
+static int restore_init(const char *path, struct metafd *mfd, struct savem=
eta_header *smh, int printonly)
 {
-=09struct gfs2_meta_header sbmh;
-=09off_t startpos =3D 0;
-=09char buf[256];
-=09unsigned i;
-=09size_t rs;
-=09int err;
+=09struct gfs2_meta_header *sbmh;
+=09char *end;
+=09char *bp;
+=09int ret;
+
+=09restore_buf =3D malloc(RESTORE_BUF_SIZE);
+=09if (restore_buf =3D=3D NULL) {
+=09=09perror("Restore failed");
+=09=09return -1;
+=09}
+=09restore_off =3D 0;
+=09restore_left =3D 0;
=20
 =09mfd->filename =3D path;
 =09mfd->fd =3D open(path, O_RDONLY|O_CLOEXEC);
@@ -1148,7 +1143,6 @@ static int restore_init(const char *path, struct meta=
fd *mfd, struct savemeta_he
 =09=09perror("Could not open metadata file");
 =09=09return 1;
 =09}
-=09mfd->seek =3D gz_seek;
 =09mfd->read =3D gz_read;
 =09mfd->iseof =3D gz_iseof;
 =09mfd->close =3D gz_close;
@@ -1158,41 +1152,48 @@ static int restore_init(const char *path, struct me=
tafd *mfd, struct savemeta_he
 =09=09perror("gzdopen");
 =09=09return 1;
 =09}
-=09err =3D read_header(mfd, smh);
-=09if (err < 0) {
-=09=09return 1;
-=09} else if (check_header(smh) !=3D 0) {
-=09=09printf("No valid file header found. Falling back to old format...\n"=
);
-=09} else if (err =3D=3D 0) {
-=09=09startpos =3D sizeof(*smh);
+=09restore_left =3D mfd->read(mfd, restore_buf, RESTORE_BUF_SIZE);
+=09if (restore_left < 512) {
+=09=09fprintf(stderr, "Failed to read metadata file header and superblock\=
n");
+=09=09return -1;
 =09}
-=09mfd->seek(mfd, startpos, SEEK_SET);
-=09rs =3D mfd->read(mfd, buf, sizeof(buf));
-=09if (rs !=3D sizeof(buf)) {
-=09=09fprintf(stderr, "Error: File is too small.\n");
-=09=09return 1;
+=09bp =3D restore_buf;
+=09parse_header(bp, smh);
+=09if (check_header(smh) !=3D 0)
+=09=09printf("No valid file header found. Falling back to old format...\n"=
);
+=09else {
+=09=09bp =3D restore_buf + sizeof(*smh);
+=09=09restore_off =3D sizeof(*smh);
 =09}
-=09/* Scan for the beginning of the file body. Required to support old for=
mats(?). */
-=09for (i =3D 0; i < (256 - sizeof(struct saved_metablock) - sizeof(sbmh))=
; i++) {
-=09=09off_t off =3D i + sizeof(struct saved_metablock);
=20
-=09=09memcpy(&sbmh, &buf[off], sizeof(sbmh));
-=09=09if (sbmh.mh_magic =3D=3D cpu_to_be32(GFS2_MAGIC) &&
-=09=09     sbmh.mh_type =3D=3D cpu_to_be32(GFS2_METATYPE_SB))
+=09/* Scan for the position of the superblock. Required to support old for=
mats(?). */
+=09end =3D &restore_buf[256 + sizeof(struct saved_metablock) + sizeof(*sbm=
h)];
+=09while (bp <=3D end) {
+=09=09sbmh =3D (struct gfs2_meta_header *)(bp + sizeof(struct saved_metabl=
ock));
+=09=09if (sbmh->mh_magic =3D=3D cpu_to_be32(GFS2_MAGIC) &&
+=09=09    sbmh->mh_type =3D=3D cpu_to_be32(GFS2_METATYPE_SB))
 =09=09=09break;
+=09=09bp++;
+=09}
+=09if (bp > end) {
+=09=09fprintf(stderr, "No superblock found in metadata file\n");
+=09=09return -1;
 =09}
-=09if (i =3D=3D (sizeof(buf) - sizeof(struct saved_metablock) - sizeof(sbm=
h)))
-=09=09i =3D 0;
-=09*pos =3D startpos + i; /* File offset of saved sb */
+=09ret =3D restore_super(mfd, bp + sizeof(struct saved_metablock), printon=
ly);
+=09if (ret !=3D 0)
+=09=09return ret;
+
+=09bp +=3D sizeof(struct saved_metablock) + sizeof(sbd.sd_sb);
+=09restore_off =3D bp - restore_buf;
+=09restore_left -=3D restore_off;
 =09return 0;
 }
=20
 void restoremeta(const char *in_fn, const char *out_device, uint64_t print=
only)
 {
-=09int error;
-=09off_t pos =3D 0;
 =09struct savemeta_header smh =3D {0};
 =09struct metafd mfd =3D {0};
+=09int error;
=20
 =09termlines =3D 0;
 =09if (!in_fn)
@@ -1200,10 +1201,6 @@ void restoremeta(const char *in_fn, const char *out_=
device, uint64_t printonly)
 =09if (!printonly && !out_device)
 =09=09complain("No destination file system specified.");
=20
-=09error =3D restore_init(in_fn, &mfd, &smh, &pos);
-=09if (error !=3D 0)
-=09=09exit(error);
-
 =09if (!printonly) {
 =09=09sbd.device_fd =3D open(out_device, O_RDWR);
 =09=09if (sbd.device_fd < 0)
@@ -1213,9 +1210,9 @@ void restoremeta(const char *in_fn, const char *out_d=
evice, uint64_t printonly)
 =09=09=09=09  optional block no */
 =09=09printonly =3D check_keywords(out_device);
=20
-=09error =3D restore_super(&mfd, pos);
-=09if (error)
-=09=09exit(1);
+=09error =3D restore_init(in_fn, &mfd, &smh, printonly);
+=09if (error !=3D 0)
+=09=09exit(error);
=20
 =09if (smh.sh_fs_bytes > 0) {
 =09=09sbd.fssize =3D smh.sh_fs_bytes / sbd.bsize;
@@ -1230,7 +1227,7 @@ void restoremeta(const char *in_fn, const char *out_d=
evice, uint64_t printonly)
 =09=09printf("There are %"PRIu64" free blocks on the destination device.\n=
", space);
 =09}
=20
-=09error =3D restore_data(sbd.device_fd, &mfd, pos, printonly);
+=09error =3D restore_data(sbd.device_fd, &mfd, printonly);
 =09printf("File %s %s %s.\n", in_fn,
 =09       (printonly ? "print" : "restore"),
 =09       (error ? "error" : "successful"));
--=20
2.24.1

