Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2582648CBEF
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015665;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yd2FBZIybyb6FM4Nuzk61YoELmwaxx48YBmu/kEhB9M=;
	b=b15CR3d2QYrnrov1I7AnbqJAta8i9/ISFpgsCx0FzbH6/xhr1eDytg5p/aqLq8G1eeEqZf
	3tsC2mkQd74ufohyqIusYTdEhvBwe394Q7Sm4QPJqY8rtwTQcpLnfXGPLcccikeuudwffi
	emf4nGb1Pf98xEJtRdZ33LgK4nrY/Q0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-rGnUJc62OBeqgQNOno654w-1; Wed, 12 Jan 2022 14:27:42 -0500
X-MC-Unique: rGnUJc62OBeqgQNOno654w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43F12344E4;
	Wed, 12 Jan 2022 19:27:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 343364EC7E;
	Wed, 12 Jan 2022 19:27:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CCCB1806D2D;
	Wed, 12 Jan 2022 19:27:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJRZc2009437 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4069745D67; Wed, 12 Jan 2022 19:27:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37F5E60657
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:33 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:50 +0000
Message-Id: <20220112192650.1426415-19-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 18/18] libgfs2: Remove print_it extern
	requirement
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

Now that libgfs2 doesn't depend on a print_it() function being provided
by the utils, the extern declaration can be removed from libgfs2.h. The
print_it functions in mkfs.gfs2 and gfs2_edit are moved into their
struct_print.c files and made static. All other print_it definitions are
removed or made static.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c  |  13 ---
 gfs2/edit/extended.c         |   7 --
 gfs2/edit/gfs2hex.c          | 135 -----------------------
 gfs2/edit/hexedit.c          |  33 ------
 gfs2/edit/hexedit.h          |   4 +-
 gfs2/edit/struct_print.c     | 200 +++++++++++++++++++++++++++++++----
 gfs2/edit/struct_print.h     |   4 +
 gfs2/fsck/main.c             |  11 --
 gfs2/glocktop/glocktop.c     |   3 +-
 gfs2/libgfs2/check_libgfs2.c |   3 -
 gfs2/libgfs2/gfs2l.c         |   3 -
 gfs2/libgfs2/libgfs2.h       |   2 -
 gfs2/mkfs/gfs2_mkfs.h        |  11 --
 gfs2/mkfs/struct_print.c     |  12 +++
 tests/nukerg.c               |   3 -
 15 files changed, 198 insertions(+), 246 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 5bfc616b..dc011d05 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -114,19 +114,6 @@ static unsigned orig_journals = 0;
 
 int print_level = MSG_NOTICE;
 
-/* ------------------------------------------------------------------------- */
-/* This function is for libgfs's sake.                                       */
-/* ------------------------------------------------------------------------- */
-void print_it(const char *label, const char *fmt, const char *fmt2, ...)
-{
-	va_list args;
-
-	va_start(args, fmt2);
-	printf("%s: ", label);
-	vprintf(fmt, args);
-	va_end(args);
-}
-
 /* ------------------------------------------------------------------------- */
 /* convert_bitmaps - Convert gfs1 bitmaps to gfs2 bitmaps.                   */
 /*                   Fixes all unallocated metadata bitmap states (which are */
diff --git a/gfs2/edit/extended.c b/gfs2/edit/extended.c
index 8ba3da3b..6e2e16db 100644
--- a/gfs2/edit/extended.c
+++ b/gfs2/edit/extended.c
@@ -421,13 +421,6 @@ static void print_block_details(struct iinfo *ind, int level, int cur_height,
 	free(more_indir);
 }
 
-static void gfs_jindex_print(struct gfs_jindex *ji)
-{
-	print_it("  ji_addr", "%"PRIu64, "0x%"PRIx64, be64_to_cpu(ji->ji_addr));
-	print_it("  ji_nsegment", "%"PRIu32, "0x%"PRIx32, be32_to_cpu(ji->ji_nsegment));
-	print_it("  ji_pad", "%"PRIu32, "0x%"PRIx32, be32_to_cpu(ji->ji_pad));
-}
-
 static int print_gfs_jindex(struct gfs2_inode *dij)
 {
 	int error, start_line;
diff --git a/gfs2/edit/gfs2hex.c b/gfs2/edit/gfs2hex.c
index 9c71ac60..610c7d2a 100644
--- a/gfs2/edit/gfs2hex.c
+++ b/gfs2/edit/gfs2hex.c
@@ -18,16 +18,6 @@
 #include "gfs2hex.h"
 #include "struct_print.h"
 
-#define pv(struct, member, fmt, fmt2) do {				\
-		print_it("  "#member, fmt, fmt2, struct->member);	\
-	} while (FALSE);
-#define pv2(struct, member, fmt, fmt2) do {				\
-		print_it("  ", fmt, fmt2, struct->member);		\
-	} while (FALSE);
-#define printbe32(struct, member) do { \
-		print_it("  "#member, "%"PRIu32, "0x%"PRIx32, be32_to_cpu(struct->member)); \
-	} while(0)
-
 struct gfs2_dinode *di;
 int line, termlines;
 char edit_fmt[80];
@@ -107,107 +97,6 @@ void print_gfs2(const char *fmt, ...)
 	va_end(args);
 }
 
-static void check_highlight(int highlight)
-{
-	if (!termlines || line >= termlines) /* If printing or out of bounds */
-		return;
-	if (dmode == HEX_MODE) {
-		if (line == (edit_row[dmode] * lines_per_row[dmode]) + 4) {
-			if (highlight) {
-				COLORS_HIGHLIGHT;
-				last_entry_onscreen[dmode] = print_entry_ndx;
-			} else
-				COLORS_NORMAL;
-		}
-	} else {
-		if ((line * lines_per_row[dmode]) - 4 == 
-			(edit_row[dmode] - start_row[dmode]) * lines_per_row[dmode]) {
-			if (highlight) {
-				COLORS_HIGHLIGHT;
-				last_entry_onscreen[dmode] = print_entry_ndx;
-			}
-			else
-				COLORS_NORMAL;
-		}
-	}
-}
-
-void print_it(const char *label, const char *fmt, const char *fmt2, ...)
-{
-	va_list args;
-	char tmp_string[NAME_MAX];
-	const char *fmtstring;
-	int decimalsize;
-
-	if (!termlines || line < termlines) {
-		va_start(args, fmt2);
-		check_highlight(TRUE);
-		if (termlines) {
-			move(line,0);
-			printw("%s", label);
-			move(line,24);
-		} else {
-			if (!strcmp(label, "  "))
-				printf("%-11s", label);
-			else
-				printf("%-24s", label);
-		}
-		vsprintf(tmp_string, fmt, args);
-
-		if (termlines)
-			printw("%s", tmp_string);
-		else
-			printf("%s", tmp_string);
-		check_highlight(FALSE);
-
-		if (fmt2) {
-			decimalsize = strlen(tmp_string);
-			va_end(args);
-			va_start(args, fmt2);
-			vsprintf(tmp_string, fmt2, args);
-			check_highlight(TRUE);
-			if (termlines) {
-				move(line, 50);
-				printw("%s", tmp_string);
-			} else {
-				int i;
-				for (i=20 - decimalsize; i > 0; i--)
-					printf(" ");
-				printf("%s", tmp_string);
-			}
-			check_highlight(FALSE);
-		} else {
-			if (strstr(fmt,"X") || strstr(fmt,"x"))
-				fmtstring="(hex)";
-			else if (strstr(fmt,"s"))
-				fmtstring="";
-			else
-				fmtstring="(decimal)";
-			if (termlines) {
-				move(line, 50);
-				printw("%s", fmtstring);
-			}
-			else
-				printf("%s", fmtstring);
-		}
-		if (termlines) {
-			refresh();
-			if (line == (edit_row[dmode] * lines_per_row[dmode]) + 4) {
-				strncpy(efield, label + 2, 63); /* it's indented */
-				efield[63] = '\0';
-				strcpy(estring, tmp_string);
-				strncpy(edit_fmt, fmt, 79);
-				edit_fmt[79] = '\0';
-				edit_size[dmode] = strlen(estring);
-				COLORS_NORMAL;
-			}
-			last_entry_onscreen[dmode] = (line / lines_per_row[dmode]) - 4;
-		}
-		eol(0);
-		va_end(args);
-	}
-}
-
 void idirent_in(struct idirent *id, void *dep)
 {
 	struct gfs2_dirent *de = dep;
@@ -370,30 +259,6 @@ static void do_eattr_extended(char *buf)
 	}
 }
 
-/**
- * gfs_sb_print - Print out a gfs1 superblock
- * @sbp: the big-endian buffer
- */
-static void gfs_sb_print(void *sbp)
-{
-	struct gfs_sb *sb = sbp;
-
-	meta_header_print(&sb->sb_header);
-	printbe32(sb, sb_fs_format);
-	printbe32(sb, sb_multihost_format);
-	printbe32(sb, sb_flags);
-	printbe32(sb, sb_bsize);
-	printbe32(sb, sb_bsize_shift);
-	printbe32(sb, sb_seg_size);
-	inum_print(&sb->sb_jindex_di);
-	inum_print(&sb->sb_rindex_di);
-	inum_print(&sb->sb_root_di);
-	pv(sb, sb_lockproto, "%.64s", NULL);
-	pv(sb, sb_locktable, "%.64s", NULL);
-	inum_print(&sb->sb_quota_di);
-	inum_print(&sb->sb_license_di);
-}
-
 void display_gfs2(void *buf)
 {
 	struct gfs2_meta_header *mh = buf;
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index d88bfcfe..13af4007 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -727,23 +727,6 @@ static uint64_t find_rgrp_block(struct gfs2_inode *dif, int rg)
 	return be64_to_cpu(ri.ri_addr);
 }
 
-/* ------------------------------------------------------------------------ */
-/* gfs_rgrp_print - print a gfs1 resource group                             */
-/* ------------------------------------------------------------------------ */
-void gfs_rgrp_print(void *rgp)
-{
-	struct gfs_rgrp *rg = rgp;
-
-	meta_header_print(&rg->rg_header);
-	printbe32(rg, rg_flags);
-	printbe32(rg, rg_free);
-	printbe32(rg, rg_useddi);
-	printbe32(rg, rg_freedi);
-	inum_print(&rg->rg_freedi_list);
-	printbe32(rg, rg_usedmeta);
-	printbe32(rg, rg_freemeta);
-}
-
 /* ------------------------------------------------------------------------ */
 /* get_rg_addr                                                              */
 /* ------------------------------------------------------------------------ */
@@ -2028,22 +2011,6 @@ static void interactive_mode(void)
     endwin();
 }/* interactive_mode */
 
-/* ------------------------------------------------------------------------ */
-/* gfs_log_header_print - print a gfs1-style log header                     */
-/* ------------------------------------------------------------------------ */
-void gfs_log_header_print(void *lhp)
-{
-	struct gfs_log_header *lh = lhp;
-
-	meta_header_print(&lh->lh_header);
-	print_it("  lh_flags", "%"PRIu32, "0x%.8"PRIx32, be32_to_cpu(lh->lh_flags));
-	print_it("  lh_pad", "%"PRIu32, "0x%"PRIx32, be32_to_cpu(lh->lh_pad));
-	print_it("  lh_first", "%"PRIu64, "0x%"PRIx64, be64_to_cpu(lh->lh_first));
-	print_it("  lh_sequence", "%"PRIu64, "0x%"PRIx64, be64_to_cpu(lh->lh_sequence));
-	print_it("  lh_tail", "%"PRIu64, "0x%"PRIx64, be64_to_cpu(lh->lh_tail));
-	print_it("  lh_last_dump", "%"PRIu64, "0x%"PRIx64, be64_to_cpu(lh->lh_last_dump));
-}
-
 /* ------------------------------------------------------------------------ */
 /* usage - print command line usage                                         */
 /* ------------------------------------------------------------------------ */
diff --git a/gfs2/edit/hexedit.h b/gfs2/edit/hexedit.h
index 29f465a0..156874da 100644
--- a/gfs2/edit/hexedit.h
+++ b/gfs2/edit/hexedit.h
@@ -5,6 +5,7 @@
 #include <inttypes.h>
 #include <limits.h>
 #include <string.h>
+#include <ncurses.h>
 
 #include "libgfs2.h"
 #include "copyright.cf"
@@ -20,9 +21,6 @@
 enum dsp_mode { HEX_MODE = 0, GFS2_MODE = 1, EXTENDED_MODE = 2, INIT_MODE = 3 };
 #define BLOCK_STACK_SIZE 256
 
-#define pv(struct, member, fmt, fmt2) do {				\
-		print_it("  "#member, fmt, fmt2, struct->member);	\
-	} while (FALSE);
 #define RGLIST_DUMMY_BLOCK -2
 #define JOURNALS_DUMMY_BLOCK -3
 
diff --git a/gfs2/edit/struct_print.c b/gfs2/edit/struct_print.c
index 88c9c609..896f648b 100644
--- a/gfs2/edit/struct_print.c
+++ b/gfs2/edit/struct_print.c
@@ -1,11 +1,116 @@
 #include <stddef.h>
+#include <stdarg.h>
 #include <string.h>
 #include <inttypes.h>
 #include <uuid.h>
 #include <libgfs2.h>
 
+#include "hexedit.h"
+#include "gfs2hex.h"
 #include "struct_print.h"
 
+static void check_highlight(int highlight)
+{
+	if (!termlines || line >= termlines) /* If printing or out of bounds */
+		return;
+	if (dmode == HEX_MODE) {
+		if (line == (edit_row[dmode] * lines_per_row[dmode]) + 4) {
+			if (highlight) {
+				COLORS_HIGHLIGHT;
+				last_entry_onscreen[dmode] = print_entry_ndx;
+			} else
+				COLORS_NORMAL;
+		}
+	} else {
+		if ((line * lines_per_row[dmode]) - 4 ==
+			(edit_row[dmode] - start_row[dmode]) * lines_per_row[dmode]) {
+			if (highlight) {
+				COLORS_HIGHLIGHT;
+				last_entry_onscreen[dmode] = print_entry_ndx;
+			}
+			else
+				COLORS_NORMAL;
+		}
+	}
+}
+
+__attribute__((format(printf,2,4)))
+static void print_it(const char *label, const char *fmt, const char *fmt2, ...)
+{
+	va_list args;
+	char tmp_string[NAME_MAX];
+	const char *fmtstring;
+	int decimalsize;
+
+	if (!termlines || line < termlines) {
+		va_start(args, fmt2);
+		check_highlight(TRUE);
+		if (termlines) {
+			move(line,0);
+			printw("%s", label);
+			move(line,24);
+		} else {
+			if (!strcmp(label, "  "))
+				printf("%-11s", label);
+			else
+				printf("%-24s", label);
+		}
+		vsprintf(tmp_string, fmt, args);
+
+		if (termlines)
+			printw("%s", tmp_string);
+		else
+			printf("%s", tmp_string);
+		check_highlight(FALSE);
+
+		if (fmt2) {
+			decimalsize = strlen(tmp_string);
+			va_end(args);
+			va_start(args, fmt2);
+			vsprintf(tmp_string, fmt2, args);
+			check_highlight(TRUE);
+			if (termlines) {
+				move(line, 50);
+				printw("%s", tmp_string);
+			} else {
+				int i;
+				for (i=20 - decimalsize; i > 0; i--)
+					printf(" ");
+				printf("%s", tmp_string);
+			}
+			check_highlight(FALSE);
+		} else {
+			if (strstr(fmt,"X") || strstr(fmt,"x"))
+				fmtstring="(hex)";
+			else if (strstr(fmt,"s"))
+				fmtstring="";
+			else
+				fmtstring="(decimal)";
+			if (termlines) {
+				move(line, 50);
+				printw("%s", fmtstring);
+			}
+			else
+				printf("%s", fmtstring);
+		}
+		if (termlines) {
+			refresh();
+			if (line == (edit_row[dmode] * lines_per_row[dmode]) + 4) {
+				strncpy(efield, label + 2, 63); /* it's indented */
+				efield[63] = '\0';
+				strcpy(estring, tmp_string);
+				strncpy(edit_fmt, fmt, 79);
+				edit_fmt[79] = '\0';
+				edit_size[dmode] = strlen(estring);
+				COLORS_NORMAL;
+			}
+			last_entry_onscreen[dmode] = (line / lines_per_row[dmode]) - 4;
+		}
+		eol(0);
+		va_end(args);
+	}
+}
+
 #define printbe16(struct, member) do { \
 		print_it("  "#member, "%"PRIu16, "0x%"PRIx16, be16_to_cpu(struct->member)); \
 	} while(0)
@@ -54,6 +159,26 @@ void sb_print(void *sbp)
 	print_it("  uuid", "%36s", NULL, readable_uuid);
 }
 
+void gfs_sb_print(void *sbp)
+{
+	struct gfs_sb *sb = sbp;
+
+	meta_header_print(&sb->sb_header);
+	printbe32(sb, sb_fs_format);
+	printbe32(sb, sb_multihost_format);
+	printbe32(sb, sb_flags);
+	printbe32(sb, sb_bsize);
+	printbe32(sb, sb_bsize_shift);
+	printbe32(sb, sb_seg_size);
+	inum_print(&sb->sb_jindex_di);
+	inum_print(&sb->sb_rindex_di);
+	inum_print(&sb->sb_root_di);
+	print_it("  sb_lockproto", "%.64s", NULL, sb->sb_lockproto);
+	print_it("  sb_locktable", "%.64s", NULL, sb->sb_locktable);
+	inum_print(&sb->sb_quota_di);
+	inum_print(&sb->sb_license_di);
+}
+
 void rindex_print(void *rip)
 {
 	struct gfs2_rindex *ri = rip;
@@ -81,6 +206,20 @@ void rgrp_print(void *rgp)
 	printbe32(rg, rg_crc);
 }
 
+void gfs_rgrp_print(void *rgp)
+{
+	struct gfs_rgrp *rg = rgp;
+
+	meta_header_print(&rg->rg_header);
+	printbe32(rg, rg_flags);
+	printbe32(rg, rg_free);
+	printbe32(rg, rg_useddi);
+	printbe32(rg, rg_freedi);
+	inum_print(&rg->rg_freedi_list);
+	printbe32(rg, rg_usedmeta);
+	printbe32(rg, rg_freemeta);
+}
+
 void quota_print(void *qp)
 {
 	struct gfs2_quota *q = qp;
@@ -92,30 +231,30 @@ void quota_print(void *qp)
 
 void dinode_print(void *dip)
 {
-	struct gfs2_dinode *di = dip;
+	struct gfs2_dinode *_di = dip;
 
-	meta_header_print(&di->di_header);
-	inum_print(&di->di_num);
+	meta_header_print(&_di->di_header);
+	inum_print(&_di->di_num);
 
 	print_it("  di_mode", "0%"PRIo32, NULL, be32_to_cpu(di->di_mode));
-	printbe32(di, di_uid);
-	printbe32(di, di_gid);
-	printbe32(di, di_nlink);
-	printbe64(di, di_size);
-	printbe64(di, di_blocks);
-	printbe64(di, di_atime);
-	printbe64(di, di_mtime);
-	printbe64(di, di_ctime);
-	printbe32(di, di_major);
-	printbe32(di, di_minor);
-	printbe64(di, di_goal_meta);
-	printbe64(di, di_goal_data);
-	print_it("  di_flags", "0x%.8"PRIX32, NULL, be32_to_cpu(di->di_flags));
-	printbe32(di, di_payload_format);
-	printbe16(di, di_height);
-	printbe16(di, di_depth);
-	printbe32(di, di_entries);
-	printbe64(di, di_eattr);
+	printbe32(_di, di_uid);
+	printbe32(_di, di_gid);
+	printbe32(_di, di_nlink);
+	printbe64(_di, di_size);
+	printbe64(_di, di_blocks);
+	printbe64(_di, di_atime);
+	printbe64(_di, di_mtime);
+	printbe64(_di, di_ctime);
+	printbe32(_di, di_major);
+	printbe32(_di, di_minor);
+	printbe64(_di, di_goal_meta);
+	printbe64(_di, di_goal_data);
+	print_it("  di_flags", "0x%.8"PRIX32, NULL, be32_to_cpu(_di->di_flags));
+	printbe32(_di, di_payload_format);
+	printbe16(_di, di_height);
+	printbe16(_di, di_depth);
+	printbe32(_di, di_entries);
+	printbe64(_di, di_eattr);
 }
 
 void leaf_print(void *lfp)
@@ -175,6 +314,19 @@ void log_header_print(void *lhp)
 	print_it("  lh_local_dinodes", "%"PRId64, "0x%"PRIx64, be64_to_cpu(lh->lh_local_dinodes));
 }
 
+void gfs_log_header_print(void *lhp)
+{
+	struct gfs_log_header *lh = lhp;
+
+	meta_header_print(&lh->lh_header);
+	print_it("  lh_flags", "%"PRIu32, "0x%.8"PRIx32, be32_to_cpu(lh->lh_flags));
+	print_it("  lh_pad", "%"PRIu32, "0x%"PRIx32, be32_to_cpu(lh->lh_pad));
+	print_it("  lh_first", "%"PRIu64, "0x%"PRIx64, be64_to_cpu(lh->lh_first));
+	print_it("  lh_sequence", "%"PRIu64, "0x%"PRIx64, be64_to_cpu(lh->lh_sequence));
+	print_it("  lh_tail", "%"PRIu64, "0x%"PRIx64, be64_to_cpu(lh->lh_tail));
+	print_it("  lh_last_dump", "%"PRIu64, "0x%"PRIx64, be64_to_cpu(lh->lh_last_dump));
+}
+
 void log_descriptor_print(void *ldp)
 {
 	struct gfs2_log_descriptor *ld = ldp;
@@ -204,3 +356,9 @@ void quota_change_print(void *qcp)
 	printbe32(qc, qc_id);
 }
 
+void gfs_jindex_print(struct gfs_jindex *ji)
+{
+	print_it("  ji_addr", "%"PRIu64, "0x%"PRIx64, be64_to_cpu(ji->ji_addr));
+	print_it("  ji_nsegment", "%"PRIu32, "0x%"PRIx32, be32_to_cpu(ji->ji_nsegment));
+	print_it("  ji_pad", "%"PRIu32, "0x%"PRIx32, be32_to_cpu(ji->ji_pad));
+}
diff --git a/gfs2/edit/struct_print.h b/gfs2/edit/struct_print.h
index 784c130d..be5bb1cb 100644
--- a/gfs2/edit/struct_print.h
+++ b/gfs2/edit/struct_print.h
@@ -5,8 +5,10 @@
 extern void inum_print(void *nop);
 extern void meta_header_print(void *mhp);
 extern void sb_print(void *sbp);
+extern void gfs_sb_print(void *sbp);
 extern void dinode_print(void *dip);
 extern void log_header_print(void *lhp);
+extern void gfs_log_header_print(void *lhp);
 extern void log_descriptor_print(void *ldp);
 extern void quota_print(void *qp);
 extern void quota_change_print(void *qcp);
@@ -15,5 +17,7 @@ extern void ea_header_print(void *eap);
 extern void leaf_print(void *lfp);
 extern void rindex_print(void *rip);
 extern void rgrp_print(void *rgp);
+extern void gfs_rgrp_print(void *rgp);
+extern void gfs_jindex_print(struct gfs_jindex *ji);
 
 #endif /* STRUCT_PRINT_H */
diff --git a/gfs2/fsck/main.c b/gfs2/fsck/main.c
index cb667815..82408245 100644
--- a/gfs2/fsck/main.c
+++ b/gfs2/fsck/main.c
@@ -45,17 +45,6 @@ static int preen = 0;
 static int force_check = 0;
 static const char *pass_name = "";
 
-/* This function is for libgfs2's sake.                                      */
-void print_it(const char *label, const char *fmt, const char *fmt2, ...)
-{
-	va_list args;
-
-	va_start(args, fmt2);
-	printf("%s: ", label);
-	vprintf(fmt, args);
-	va_end(args);
-}
-
 static void usage(char *name)
 {
 	printf("Usage: %s [-afhnpqvVy] <device> \n", basename(name));
diff --git a/gfs2/glocktop/glocktop.c b/gfs2/glocktop/glocktop.c
index 1eb84c21..9fc7bc64 100644
--- a/gfs2/glocktop/glocktop.c
+++ b/gfs2/glocktop/glocktop.c
@@ -550,7 +550,8 @@ static void eol(int col) /* end of line */
 	}
 }
 
-void print_it(const char *label, const char *fmt, const char *fmt2, ...)
+__attribute__((format(printf,2,4)))
+static void print_it(const char *label, const char *fmt, const char *fmt2, ...)
 {
 	va_list args;
 	char tmp_string[128];
diff --git a/gfs2/libgfs2/check_libgfs2.c b/gfs2/libgfs2/check_libgfs2.c
index a5d9df52..2ee5895d 100644
--- a/gfs2/libgfs2/check_libgfs2.c
+++ b/gfs2/libgfs2/check_libgfs2.c
@@ -1,9 +1,6 @@
 #include <check.h>
 #include "libgfs2.h"
 
-// TODO: Remove this when the extern is removed from libgfs2
-void print_it(const char *label, const char *fmt, const char *fmt2, ...) {}
-
 extern Suite *suite_meta(void);
 extern Suite *suite_ondisk(void);
 extern Suite *suite_rgrp(void);
diff --git a/gfs2/libgfs2/gfs2l.c b/gfs2/libgfs2/gfs2l.c
index 6fc6cd37..cc4f94fc 100644
--- a/gfs2/libgfs2/gfs2l.c
+++ b/gfs2/libgfs2/gfs2l.c
@@ -197,6 +197,3 @@ int main(int argc, char *argv[])
 	free(opts.fspath);
 	return 0;
 }
-
-// libgfs2 still requires an external print_it function
-void print_it(const char *label, const char *fmt, const char *fmt2, ...) { return; }
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 81fe5983..cf7ecf3f 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -796,8 +796,6 @@ extern int write_sb(struct gfs2_sbd *sdp);
 
 /* ondisk.c */
 extern uint32_t gfs2_disk_hash(const char *data, int len);
-extern void print_it(const char *label, const char *fmt, const char *fmt2, ...)
-	__attribute__((format(printf,2,4)));
 
 /* Translation functions */
 
diff --git a/gfs2/mkfs/gfs2_mkfs.h b/gfs2/mkfs/gfs2_mkfs.h
index 6237cd04..f3ff9b16 100644
--- a/gfs2/mkfs/gfs2_mkfs.h
+++ b/gfs2/mkfs/gfs2_mkfs.h
@@ -4,17 +4,6 @@
 #include <stdarg.h>
 #include "copyright.cf"
 
-/* This function is for libgfs2's sake. */
-void print_it(const char *label, const char *fmt, const char *fmt2, ...)
-{
-	va_list args;
-
-	va_start(args, fmt2);
-	printf("%s: ", label);
-	vprintf(fmt, args);
-	va_end(args);
-}
-
 /*
  * The following inode IOCTL macros and inode flags 
  * are copied from linux/fs.h, because we have duplicate 
diff --git a/gfs2/mkfs/struct_print.c b/gfs2/mkfs/struct_print.c
index 88c9c609..d038f27c 100644
--- a/gfs2/mkfs/struct_print.c
+++ b/gfs2/mkfs/struct_print.c
@@ -2,10 +2,22 @@
 #include <string.h>
 #include <inttypes.h>
 #include <uuid.h>
+#include <stdarg.h>
 #include <libgfs2.h>
 
 #include "struct_print.h"
 
+__attribute__((format(printf,2,4)))
+static void print_it(const char *label, const char *fmt, const char *fmt2, ...)
+{
+	va_list args;
+
+	va_start(args, fmt2);
+	printf("%s: ", label);
+	vprintf(fmt, args);
+	va_end(args);
+}
+
 #define printbe16(struct, member) do { \
 		print_it("  "#member, "%"PRIu16, "0x%"PRIx16, be16_to_cpu(struct->member)); \
 	} while(0)
diff --git a/tests/nukerg.c b/tests/nukerg.c
index 74b65abb..a831e459 100644
--- a/tests/nukerg.c
+++ b/tests/nukerg.c
@@ -343,6 +343,3 @@ int main(int argc, char **argv)
 	close(sbd.device_fd);
 	exit(0);
 }
-
-/* This function is for libgfs2's sake. */
-void print_it(const char *label, const char *fmt, const char *fmt2, ...) {}
-- 
2.34.1

