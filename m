Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1482ED0F8
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Jan 2021 14:43:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610026981;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U/01WwU1LgP3oEbP+004g46yIEyuJXLKPSR+uqfw/Xk=;
	b=Z+5DqFesoKyLxNa6iN4nHtZ7dmM+XHCc1P8419sHMZ3hf8Unz8Z8Bbgd2BhZdj6PE/hX2A
	KmeVUn6mOJhP+ycF9qwJlg3xJ32/O2Z4UsAKY29aH4u8Hpn9pYUCHNruTA23wIUJf6rrpn
	/75uCwUqYrL9odwc0bNpG7HLT/Aiy60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-Pdm5OhE7Nw2k45DFiXIAsg-1; Thu, 07 Jan 2021 08:42:56 -0500
X-MC-Unique: Pdm5OhE7Nw2k45DFiXIAsg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F07ED107ACE6;
	Thu,  7 Jan 2021 13:42:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0FBD5D9DD;
	Thu,  7 Jan 2021 13:42:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C79B2180954D;
	Thu,  7 Jan 2021 13:42:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 107DgoqX028901 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 7 Jan 2021 08:42:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C226219813; Thu,  7 Jan 2021 13:42:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1113B197FA
	for <cluster-devel@redhat.com>; Thu,  7 Jan 2021 13:42:49 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  7 Jan 2021 13:42:40 +0000
Message-Id: <20210107134240.386547-4-anprice@redhat.com>
In-Reply-To: <20210107134240.386547-1-anprice@redhat.com>
References: <20210107134240.386547-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 3/3] tunegfs2: Add support for fs format
	versions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Add a new -r option to change sb_fs_format.  Only increasing the number
is supported. New tests added.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/libgfs2/libgfs2.h |  1 +
 gfs2/man/tunegfs2.8    |  5 +++++
 gfs2/tune/Makefile.am  |  3 ++-
 gfs2/tune/main.c       | 18 +++++++++++++-----
 gfs2/tune/super.c      | 20 ++++++++++++++++++++
 gfs2/tune/tunegfs2.h   |  5 +++--
 tests/Makefile.am      |  3 ++-
 tests/testsuite.at     |  1 +
 tests/tune.at          | 17 +++++++++++++++++
 9 files changed, 64 insertions(+), 9 deletions(-)
 create mode 100644 tests/tune.at

diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 6973c6f3..1f64b59e 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -327,6 +327,7 @@ struct metapath {
 
 #define LGFS2_FS_FORMAT_MIN (1801)
 #define LGFS2_FS_FORMAT_MAX (1802)
+#define LGFS2_FS_FORMAT_VALID(n) ((n) >= LGFS2_FS_FORMAT_MIN && (n) <= LGFS2_FS_FORMAT_MAX)
 
 /* meta.c */
 extern const struct lgfs2_metadata lgfs2_metadata[];
diff --git a/gfs2/man/tunegfs2.8 b/gfs2/man/tunegfs2.8
index c4446f44..660bf962 100644
--- a/gfs2/man/tunegfs2.8
+++ b/gfs2/man/tunegfs2.8
@@ -53,6 +53,11 @@ Set the filesystem UUID
 
 Print out the information on the version of the tool.
 
+.TP
+\fB-r\fP \fI<version>\fR
+
+Set the filesystem format version.
+
 .SH SEE ALSO
 
 \fBgfs2\fP(5)
diff --git a/gfs2/tune/Makefile.am b/gfs2/tune/Makefile.am
index b03f609a..6c4bbe1f 100644
--- a/gfs2/tune/Makefile.am
+++ b/gfs2/tune/Makefile.am
@@ -10,10 +10,11 @@ tunegfs2_SOURCES = \
 tunegfs2_CPPFLAGS = \
 	-D_FILE_OFFSET_BITS=64 \
 	-I$(top_srcdir)/gfs2/include \
-	-I$(top_srcdir)/group/include
+	-I$(top_srcdir)/gfs2/libgfs2
 tunegfs2_CFLAGS = \
 	$(uuid_CFLAGS)
 tunegfs2_LDADD = \
+	$(top_builddir)/gfs2/libgfs2/libgfs2.la \
 	$(uuid_LIBS)
 
 if HAVE_CHECK
diff --git a/gfs2/tune/main.c b/gfs2/tune/main.c
index 93f0f60c..d5998071 100644
--- a/gfs2/tune/main.c
+++ b/gfs2/tune/main.c
@@ -52,9 +52,9 @@ static void parse_mount_options(char *arg)
 
 static void usage(char *name)
 {
-	printf("%s %s [-hlV] [-L <%s>] [-U <%s>] [-o <%s>] <%s>\n",
+	printf("%s %s [-hlV] [-L <%s>] [-U <%s>] [-o <%s>] [-r <%s>] <%s>\n",
 	       _("Usage:"), basename(name), _("label"), _("UUID"),
-	       _("mount options"), _("device"));
+	       _("mount options"), _("version"), _("device"));
 }
 
 static void version(void)
@@ -68,7 +68,7 @@ int main(int argc, char **argv)
 	int c, status;
 
 	memset(tfs, 0, sizeof(struct tunegfs2));
-	while((c = getopt(argc, argv, "hL:U:lo:V")) != -1) {
+	while((c = getopt(argc, argv, "hL:U:lo:Vr:")) != -1) {
 		switch(c) {
 		case 'h':
 			usage(argv[0]);
@@ -90,6 +90,10 @@ int main(int argc, char **argv)
 		case 'V':
 			version();
 			return 0;
+		case 'r':
+			tfs->opt_format = 1;
+			tfs->format = optarg;
+			break;
 		default:
 			fprintf(stderr, _("Invalid option: %c\n"), c);
 			usage(argv[0]);
@@ -145,9 +149,13 @@ int main(int argc, char **argv)
 		if (status)
 			goto out;
 	}
-
+	if (tfs->opt_format) {
+		status = change_format(tfs, tfs->format);
+		if (status)
+			goto out;
+	}
 	if (tfs->opt_label || tfs->opt_uuid || tfs->opt_table ||
-	    tfs->opt_proto) {
+	    tfs->opt_proto || tfs->opt_format) {
 		status = write_super(tfs);
 		if (status)
 			goto out;
diff --git a/gfs2/tune/super.c b/gfs2/tune/super.c
index f4b7d85b..c3029fd1 100644
--- a/gfs2/tune/super.c
+++ b/gfs2/tune/super.c
@@ -12,6 +12,7 @@
 #define _(String) gettext(String)
 #include <linux_endian.h>
 #include <linux/gfs2_ondisk.h>
+#include <libgfs2.h>
 #include "tunegfs2.h"
 
 #ifdef GFS2_HAS_UUID
@@ -64,6 +65,7 @@ int print_super(const struct tunegfs2 *tfs)
 	}
 #endif
 	printf( _("File system magic number: 0x%X\n"), be32_to_cpu(tfs->sb->sb_header.mh_magic));
+	printf(_("File system format version: %"PRIu32"\n"), be32_to_cpu(tfs->sb->sb_fs_format));
 	printf(_("Block size: %d\n"), be32_to_cpu(tfs->sb->sb_bsize));
 	printf(_("Block shift: %d\n"), be32_to_cpu(tfs->sb->sb_bsize_shift));
 	printf(_("Root inode: %llu\n"), (unsigned long long)be64_to_cpu(tfs->sb->sb_root_dir.no_addr));
@@ -150,3 +152,21 @@ int change_locktable(struct tunegfs2 *tfs, const char *locktable)
 	return 0;
 }
 
+int change_format(struct tunegfs2 *tfs, const char *format)
+{
+	char *end;
+	long ln;
+
+	errno = 0;
+	ln = strtol(format, &end, 10);
+	if (errno || end == format || !LGFS2_FS_FORMAT_VALID(ln)) {
+		fprintf(stderr, _("Invalid format option '%s'\n"), format);
+		return EX_DATAERR;
+	}
+	if (ln < be32_to_cpu(tfs->sb->sb_fs_format)) {
+		fprintf(stderr, _("Regressing the filesystem format is not supported\n"));
+		return EX_DATAERR;
+	}
+	tfs->sb->sb_fs_format = cpu_to_be32(ln);
+	return 0;
+}
diff --git a/gfs2/tune/tunegfs2.h b/gfs2/tune/tunegfs2.h
index 3b28c58e..98c99696 100644
--- a/gfs2/tune/tunegfs2.h
+++ b/gfs2/tune/tunegfs2.h
@@ -1,8 +1,6 @@
 #ifndef __GFS2_TUNE_DOT_H__
 #define __GFS2_TUNE_DOT_H__
 
-#define GFS2_DEFAULT_BSIZE	4096
-
 struct tunegfs2 {
 	char *devicename;
 	int fd;
@@ -13,11 +11,13 @@ struct tunegfs2 {
 	char *table;
 	char *proto;
 	char *mount_options;
+	char *format;
 	int opt_list;
 	int opt_label;
 	int opt_uuid;
 	int opt_proto;
 	int opt_table;
+	int opt_format;
 };
 
 extern int print_super(const struct tunegfs2 *);
@@ -26,6 +26,7 @@ extern int write_super(const struct tunegfs2 *);
 extern int change_uuid(struct tunegfs2 *, const char *uuid);
 extern int change_lockproto(struct tunegfs2 *, const char *label);
 extern int change_locktable(struct tunegfs2 *, const char *label);
+extern int change_format(struct tunegfs2 *, const char *format);
 
 #endif
 
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 11d848cd..9109cf39 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -52,7 +52,8 @@ TESTSUITE_AT = \
 	testsuite.at \
 	mkfs.at \
 	fsck.at \
-	edit.at
+	edit.at \
+	tune.at
 
 TESTSUITE = testsuite
 
diff --git a/tests/testsuite.at b/tests/testsuite.at
index 98102183..1c1dc9e5 100644
--- a/tests/testsuite.at
+++ b/tests/testsuite.at
@@ -51,3 +51,4 @@ AT_COLOR_TESTS
 m4_include([mkfs.at])
 m4_include([fsck.at])
 m4_include([edit.at])
+m4_include([tune.at])
diff --git a/tests/tune.at b/tests/tune.at
new file mode 100644
index 00000000..b0158034
--- /dev/null
+++ b/tests/tune.at
@@ -0,0 +1,17 @@
+AT_TESTED([tunegfs2])
+AT_BANNER([tunegfs2 tests])
+
+AT_SETUP([Format version])
+AT_KEYWORDS(tunegfs2 tune)
+AT_CHECK([$GFS_MKFS -p lock_nolock -o format=1802 $GFS_TGT], 0, [ignore], [ignore])
+# Exit code 65 == EX_DATAERR (sysexits.h)
+AT_CHECK([tunegfs2 -r 0 $GFS_TGT], 65, [ignore], [ignore])
+# Regress not supported
+AT_CHECK([tunegfs2 -r 1801 $GFS_TGT], 65, [ignore], [ignore])
+# Format 1803 does not exist
+AT_CHECK([tunegfs2 -r 1803 $GFS_TGT], 65, [ignore], [ignore])
+# Normal version bump
+AT_CHECK([$GFS_MKFS -p lock_nolock -o format=1801 $GFS_TGT], 0, [ignore], [ignore])
+AT_CHECK([tunegfs2 -r 1802 $GFS_TGT], 0, [ignore], [ignore])
+AT_CHECK([fsck.gfs2 -n $GFS_TGT], 0, [ignore], [ignore])
+AT_CLEANUP
-- 
2.29.2

