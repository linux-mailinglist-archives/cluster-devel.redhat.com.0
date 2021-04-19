Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 86ADC364A3F
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Apr 2021 21:11:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618859511;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bjtDUQjmGBn9AK6AncHNFyBBxlkrfItzCU+a9cDxtjI=;
	b=jNEys7jzwlcoOxgbnkDQDWurcg0LYBr2GgHFExJmaPfEBpP8FO3JCJps65Muanmoephbgg
	hhUn7vUG+50XDNzpt5RnjRWp1miaxjneVv8K1Qen91+gw/QYAuBlDyc8Nr8A7+wJbhaknG
	7FaLZR6Mrl69FdAudukszXwqZtbfymc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-9zO-j374OtqmxWVbztqcLA-1; Mon, 19 Apr 2021 15:11:48 -0400
X-MC-Unique: 9zO-j374OtqmxWVbztqcLA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 292E319253FC;
	Mon, 19 Apr 2021 19:11:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEF7E29762;
	Mon, 19 Apr 2021 19:11:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5470144A58;
	Mon, 19 Apr 2021 19:11:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13JJBWEV000941 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 15:11:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCBC760843; Mon, 19 Apr 2021 19:11:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D1357095A
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 19:11:31 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 19 Apr 2021 20:11:11 +0100
Message-Id: <20210419191117.297653-3-anprice@redhat.com>
In-Reply-To: <20210419191117.297653-1-anprice@redhat.com>
References: <20210419191117.297653-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 2/8] Remove HAS_UUID conditionals
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Now that we own our own gfs2_ondisk.h we know that it has sb_uuid so we
can use it unconditionally (and require libuuid unconditionally).

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 configure.ac              | 11 +----------
 gfs2/edit/gfs2hex.c       | 12 +++---------
 gfs2/libgfs2/lang.c       | 11 +----------
 gfs2/libgfs2/meta.c       |  9 +--------
 gfs2/libgfs2/ondisk.c     | 16 +++-------------
 gfs2/libgfs2/structures.c |  7 +------
 gfs2/mkfs/main_mkfs.c     | 16 +++++-----------
 gfs2/tune/super.c         | 16 ++--------------
 8 files changed, 17 insertions(+), 81 deletions(-)

diff --git a/configure.ac b/configure.ac
index 9a7e50ab..8c60741d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -106,9 +106,7 @@ AM_CONDITIONAL([HAVE_CHECK], [test "x$have_check" = "xyes"])
 PKG_CHECK_MODULES([zlib],[zlib])
 PKG_CHECK_MODULES([bzip2],[bzip2])
 PKG_CHECK_MODULES([blkid],[blkid])
-PKG_CHECK_MODULES([uuid],[uuid],
-                  [have_uuid=yes],
-                  [have_uuid=no])
+PKG_CHECK_MODULES([uuid],[uuid])
 
 # old versions of ncurses don't ship pkg-config files
 PKG_CHECK_MODULES([ncurses],[ncurses],,
@@ -128,8 +126,6 @@ AC_SUBST([udevdir], [$with_udevdir])
 AC_CHECK_HEADERS([fcntl.h libintl.h limits.h locale.h mntent.h stddef.h sys/file.h sys/ioctl.h sys/mount.h sys/time.h sys/vfs.h syslog.h termios.h])
 AC_CHECK_HEADER([linux/fs.h], [], [AC_MSG_ERROR([Unable to find linux/fs.h])])
 AC_CHECK_HEADER([linux/limits.h], [], [AC_MSG_ERROR([Unable to find linux/limits.h])])
-AC_CHECK_MEMBER([struct gfs2_sb.sb_uuid], [sb_has_uuid=yes], [sb_has_uuid=no],
-                [[#include <linux/gfs2_ondisk.h>]])
 AC_CHECK_MEMBER([struct gfs2_leaf.lf_inode],[AC_DEFINE([GFS2_HAS_LEAF_HINTS],[],[Leaf block hints])],
                 [], [[#include <linux/gfs2_ondisk.h>]])
 AC_CHECK_MEMBER([struct gfs2_dirent.de_rahead],[AC_DEFINE([GFS2_HAS_DE_RAHEAD],[],[Dirent readahead field])],
@@ -143,11 +139,6 @@ AC_CHECK_MEMBER([struct gfs2_rgrp.rg_data0],[AC_DEFINE([GFS2_HAS_RG_RI_FIELDS],[
 AC_CHECK_MEMBER([struct gfs2_log_header.lh_crc],[AC_DEFINE([GFS2_HAS_LH_V2],[],[v2 log header format])],
                 [], [[#include <linux/gfs2_ondisk.h>]])
 
-# libuuid is only required if struct gfs2_sb.sb_uuid exists
-if test "$sb_has_uuid" = "yes" -a "$have_uuid" = "no"; then
-	AC_MSG_ERROR([libuuid is required for this version of gfs2])
-fi
-
 # *FLAGS handling
 ENV_CFLAGS="$CFLAGS"
 ENV_CPPFLAGS="$CPPFLAGS"
diff --git a/gfs2/edit/gfs2hex.c b/gfs2/edit/gfs2hex.c
index 133a508e..5e6760f2 100644
--- a/gfs2/edit/gfs2hex.c
+++ b/gfs2/edit/gfs2hex.c
@@ -10,14 +10,12 @@
 #include <unistd.h>
 #include <errno.h>
 #include <curses.h>
+#include <uuid.h>
 
 #include "hexedit.h"
 #include "extended.h"
 #include "gfs2hex.h"
 #include "libgfs2.h"
-#ifdef GFS2_HAS_UUID
-#include <uuid.h>
-#endif
 
 #define pv(struct, member, fmt, fmt2) do {				\
 		print_it("  "#member, fmt, fmt2, struct->member);	\
@@ -386,6 +384,8 @@ static void gfs2_inum_print2(const char *title,struct gfs2_inum *no)
  */
 static void gfs2_sb_print2(struct gfs2_sb *sbp2)
 {
+	char readable_uuid[36+1];
+
 	gfs2_meta_header_print(&sbp2->sb_header);
 
 	pv(sbp2, sb_fs_format, "%u", "0x%x");
@@ -410,14 +410,8 @@ static void gfs2_sb_print2(struct gfs2_sb *sbp2)
 		gfs2_inum_print2("quota ino ", &gfs1_quota_di);
 		gfs2_inum_print2("license   ", &gfs1_license_di);
 	}
-#ifdef GFS2_HAS_UUID
-	{
-	char readable_uuid[36+1];
-
 	uuid_unparse(sbp2->sb_uuid, readable_uuid);
 	print_it("  sb_uuid", "%s", NULL, readable_uuid);
-	}
-#endif
 }
 
 /**
diff --git a/gfs2/libgfs2/lang.c b/gfs2/libgfs2/lang.c
index d48b123f..3faa5abd 100644
--- a/gfs2/libgfs2/lang.c
+++ b/gfs2/libgfs2/lang.c
@@ -7,12 +7,10 @@
 #include <errno.h>
 #include <limits.h>
 #include <ctype.h>
+#include <uuid.h>
 
 #include "lang.h"
 #include "parser.h"
-#ifdef GFS2_HAS_UUID
-#include <uuid.h>
-#endif
 
 const char* ast_type_string[] = {
 	[AST_NONE] = "NONE",
@@ -315,14 +313,12 @@ static int field_print(char *buf, uint64_t addr, const struct lgfs2_metadata *mt
 
 	printf("%s\t%"PRIu64"\t%u\t%u\t%s\t", mtype->name, addr, field->offset, field->length, field->name);
 	if (field->flags & LGFS2_MFF_UUID) {
-#ifdef GFS2_HAS_UUID
 		char readable_uuid[36+1];
 		uuid_t uuid;
 
 		memcpy(uuid, fieldp, sizeof(uuid_t));
 		uuid_unparse(uuid, readable_uuid);
 		printf("'%s'\n", readable_uuid);
-#endif
 	} else if (field->flags & LGFS2_MFF_STRING) {
 		printf("'%s'\n", fieldp);
 	} else {
@@ -471,7 +467,6 @@ static int ast_field_set(char *buf, const struct lgfs2_metafield *field,
 	int err = 0;
 
 	if (field->flags & LGFS2_MFF_UUID) {
-#ifdef GFS2_HAS_UUID
 		uuid_t uuid;
 
 		if (uuid_parse(val->ast_str, uuid) != 0) {
@@ -479,10 +474,6 @@ static int ast_field_set(char *buf, const struct lgfs2_metafield *field,
 			return AST_INTERP_INVAL;
 		}
 		err = lgfs2_field_assign(buf, field, uuid);
-#else
-		fprintf(stderr, "No UUID support\n");
-		err = 1;
-#endif
 	} else if (field->flags & LGFS2_MFF_STRING) {
 		err = lgfs2_field_assign(buf, field, val->ast_str);
 	} else {
diff --git a/gfs2/libgfs2/meta.c b/gfs2/libgfs2/meta.c
index 6e338d27..2be87045 100644
--- a/gfs2/libgfs2/meta.c
+++ b/gfs2/libgfs2/meta.c
@@ -1,12 +1,9 @@
 #include <stdint.h>
 #include <string.h>
+#include <uuid.h>
 #include "libgfs2.h"
 #include "clusterautoconfig.h"
 
-#ifdef GFS2_HAS_UUID
-#include <uuid.h>
-#endif
-
 #define ARRAY_SIZE(x) (sizeof(x)/sizeof(x[0]))
 #define SYM(x) { x, #x, 0 },
 #define PREFIX_SYM(p,x) { p##x, #p #x, sizeof #p - 1 },
@@ -183,9 +180,7 @@ F(sb_lockproto, .flags = LGFS2_MFF_STRING)
 F(sb_locktable, .flags = LGFS2_MFF_STRING)
 INR(__pad3, .points_to = (1 << LGFS2_MT_GFS2_DINODE))
 INR(__pad4, .points_to = (1 << LGFS2_MT_GFS2_DINODE))
-#ifdef GFS2_HAS_UUID
 F(sb_uuid, .flags = LGFS2_MFF_UUID)
-#endif
 };
 
 #undef STRUCT
@@ -880,14 +875,12 @@ int lgfs2_field_str(char *str, const size_t size, const char *blk, const struct
 		return 1;
 
 	if (field->flags & LGFS2_MFF_UUID) {
-#ifdef GFS2_HAS_UUID
 		char readable_uuid[36+1];
 		uuid_t uuid;
 
 		memcpy(uuid, fieldp, sizeof(uuid_t));
 		uuid_unparse(uuid, readable_uuid);
 		snprintf(str, size, "%s", readable_uuid);
-#endif
 	} else if (field->flags & LGFS2_MFF_STRING) {
 		snprintf(str, size, "%s", fieldp);
 	} else {
diff --git a/gfs2/libgfs2/ondisk.c b/gfs2/libgfs2/ondisk.c
index 4515e7ac..2185fd38 100644
--- a/gfs2/libgfs2/ondisk.c
+++ b/gfs2/libgfs2/ondisk.c
@@ -6,10 +6,8 @@
 #include <stdint.h>
 #include <inttypes.h>
 #include <ctype.h>
-#include "libgfs2.h"
-#ifdef GFS2_HAS_UUID
 #include <uuid.h>
-#endif
+#include "libgfs2.h"
 
 #define pv(struct, member, fmt, fmt2) do {				\
 		print_it("  "#member, fmt, fmt2, struct->member);	\
@@ -112,9 +110,7 @@ void gfs2_sb_in(struct gfs2_sb *sb, char *buf)
 	gfs2_inum_in(&sb->__pad2, (char *)&str->__pad2); /* gfs rindex */
 	gfs2_inum_in(&sb->__pad3, (char *)&str->__pad3); /* gfs quota */
 	gfs2_inum_in(&sb->__pad4, (char *)&str->__pad4); /* gfs license */
-#ifdef GFS2_HAS_UUID
 	CPIN_08(sb, str, sb_uuid, sizeof(sb->sb_uuid));
-#endif
 }
 
 void gfs2_sb_out(const struct gfs2_sb *sb, char *buf)
@@ -139,13 +135,13 @@ void gfs2_sb_out(const struct gfs2_sb *sb, char *buf)
 	gfs2_inum_out(&sb->__pad2, (char *)&str->__pad2); /* gfs rindex */
 	gfs2_inum_out(&sb->__pad3, (char *)&str->__pad3); /* gfs quota */
 	gfs2_inum_out(&sb->__pad4, (char *)&str->__pad4); /* gfs license */
-#ifdef GFS2_HAS_UUID
 	memcpy(str->sb_uuid, sb->sb_uuid, 16);
-#endif
 }
 
 void gfs2_sb_print(const struct gfs2_sb *sb)
 {
+	char readable_uuid[36+1];
+
 	gfs2_meta_header_print(&sb->sb_header);
 
 	pv(sb, sb_fs_format, "%u", "0x%x");
@@ -160,14 +156,8 @@ void gfs2_sb_print(const struct gfs2_sb *sb)
 	pv(sb, sb_lockproto, "%s", NULL);
 	pv(sb, sb_locktable, "%s", NULL);
 
-#ifdef GFS2_HAS_UUID
-	{
-	char readable_uuid[36+1];
-
 	uuid_unparse(sb->sb_uuid, readable_uuid);
 	print_it("  uuid", "%36s", NULL, readable_uuid);
-	}
-#endif
 }
 
 void gfs2_rindex_in(struct gfs2_rindex *ri, char *buf)
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index 10933683..789b9a63 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -11,15 +11,12 @@
 #include <unistd.h>
 #include <errno.h>
 #include <sys/time.h>
+#include <uuid.h>
 
 #include "libgfs2.h"
 #include "config.h"
 #include "crc32c.h"
 
-#ifdef GFS2_HAS_UUID
-#include <uuid.h>
-#endif
-
 int build_master(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inum inum;
@@ -62,9 +59,7 @@ void lgfs2_sb_init(struct gfs2_sb *sb, unsigned bsize, unsigned format)
 	sb->sb_multihost_format = GFS2_FORMAT_MULTI;
 	sb->sb_bsize = bsize;
 	sb->sb_bsize_shift = ffs(bsize) - 1;
-#ifdef GFS2_HAS_UUID
 	uuid_generate(sb->sb_uuid);
-#endif
 }
 
 int lgfs2_sb_write(const struct gfs2_sb *sb, int fd, const unsigned bsize)
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 9ed1d0c1..2400cc8e 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -22,6 +22,7 @@
 #include <limits.h>
 #include <blkid.h>
 #include <locale.h>
+#include <uuid.h>
 
 #define _(String) gettext(String)
 
@@ -29,10 +30,6 @@
 #include "gfs2_mkfs.h"
 #include "progress.h"
 
-#ifdef GFS2_HAS_UUID
-#include <uuid.h>
-#endif
-
 static void print_usage(const char *prog_name)
 {
 	int i;
@@ -640,6 +637,10 @@ static int opts_check(struct mkfs_opts *opts)
 
 static void print_results(struct gfs2_sb *sb, struct mkfs_opts *opts, uint64_t rgrps, uint64_t fssize)
 {
+	char readable_uuid[36+1];
+
+	uuid_unparse(sb->sb_uuid, readable_uuid);
+
 	printf("%-27s%s\n", _("Device:"), opts->dev.path);
 	printf("%-27s%u\n", _("Block size:"), sb->sb_bsize);
 	printf("%-27s%.2f %s (%"PRIu64" %s)\n", _("Device size:"),
@@ -653,15 +654,8 @@ static void print_results(struct gfs2_sb *sb, struct mkfs_opts *opts, uint64_t r
 	printf("%-27s%"PRIu64"\n", _("Resource groups:"), rgrps);
 	printf("%-27s\"%s\"\n", _("Locking protocol:"), opts->lockproto);
 	printf("%-27s\"%s\"\n", _("Lock table:"), opts->locktable);
-#ifdef GFS2_HAS_UUID
-	{
-	char readable_uuid[36+1];
-
-	uuid_unparse(sb->sb_uuid, readable_uuid);
 	/* Translators: "UUID" = universally unique identifier. */
 	printf("%-27s%s\n", _("UUID:"), readable_uuid);
-	}
-#endif
 }
 
 static int warn_of_destruction(const char *path)
diff --git a/gfs2/tune/super.c b/gfs2/tune/super.c
index 74e4a457..9e6578fb 100644
--- a/gfs2/tune/super.c
+++ b/gfs2/tune/super.c
@@ -12,11 +12,8 @@
 #define _(String) gettext(String)
 #include <linux_endian.h>
 #include <libgfs2.h>
-#include "tunegfs2.h"
-
-#ifdef GFS2_HAS_UUID
 #include <uuid.h>
-#endif
+#include "tunegfs2.h"
 
 int read_super(struct tunegfs2 *tfs)
 {
@@ -54,15 +51,11 @@ static int is_gfs2(const struct tunegfs2 *tfs)
 
 int print_super(const struct tunegfs2 *tfs)
 {
-	printf(_("File system volume name: %s\n"), tfs->sb->sb_locktable);
-#ifdef GFS2_HAS_UUID
-	{
 	char readable_uuid[36+1];
 
 	uuid_unparse(tfs->sb->sb_uuid, readable_uuid);
+	printf(_("File system volume name: %s\n"), tfs->sb->sb_locktable);
 	printf(_("File system UUID: %s\n"), readable_uuid);
-	}
-#endif
 	printf( _("File system magic number: 0x%X\n"), be32_to_cpu(tfs->sb->sb_header.mh_magic));
 	printf(_("File system format version: %"PRIu32"\n"), be32_to_cpu(tfs->sb->sb_fs_format));
 	printf(_("Block size: %d\n"), be32_to_cpu(tfs->sb->sb_bsize));
@@ -89,7 +82,6 @@ int write_super(const struct tunegfs2 *tfs)
 
 int change_uuid(struct tunegfs2 *tfs, const char *str)
 {
-#ifdef GFS2_HAS_UUID
 	uuid_t uuid;
 	int status;
 
@@ -97,10 +89,6 @@ int change_uuid(struct tunegfs2 *tfs, const char *str)
 	if (status == 0)
 		uuid_copy(tfs->sb->sb_uuid, uuid);
 	return status;
-#else
-	fprintf(stderr, _("UUID support unavailable in this build\n"));
-	return 1;
-#endif
 }
 
 int change_lockproto(struct tunegfs2 *tfs, const char *lockproto)
-- 
2.30.2

