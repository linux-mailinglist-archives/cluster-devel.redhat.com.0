Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3816A48CBEE
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jan 2022 20:27:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642015662;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7i28dBM8KQq2Nx45s6gxGZ7Fr+rWVRDX6lXFnsI6kPY=;
	b=JiYNnbhNxfYgUTrm9eD8Xop1iJ9fs+xPkFs3BQWg2GUoEcaS9HIzdBzO7Z/fjywkHAgUXU
	T/lB0YMhVTXLj2xhe8FXG7Q9LiH3ruLRGotWC8mA3u1Rn3aMDIXtGArtuUSsT/giPm5nIT
	K4cAavmT1mL39NCWoLQObALHfk1WZjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-eT-yqMJAOXWuALj0QTi3_A-1; Wed, 12 Jan 2022 14:27:38 -0500
X-MC-Unique: eT-yqMJAOXWuALj0QTi3_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94472101AFA9;
	Wed, 12 Jan 2022 19:27:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 811F54E2A3;
	Wed, 12 Jan 2022 19:27:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DE9D4A707;
	Wed, 12 Jan 2022 19:27:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20CJRX7x009427 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 14:27:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B255C45D67; Wed, 12 Jan 2022 19:27:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CD9260657
	for <cluster-devel@redhat.com>; Wed, 12 Jan 2022 19:27:31 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 12 Jan 2022 19:26:49 +0000
Message-Id: <20220112192650.1426415-18-anprice@redhat.com>
In-Reply-To: <20220112192650.1426415-1-anprice@redhat.com>
References: <20220112192650.1426415-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 17/18] libgfs2: Move struct printing
	functions out of libgfs2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Now that libgfs2 itself doesn't use these functions, they can be moved
into the two utils that use them. This does duplicate the code but that
means the utils are free to change the way that they're printed to suit
their interfaces. We're still using the "print_it" extern that libgfs2.h
requires but that can be removed next.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/Makefile.am    |   2 +
 gfs2/edit/extended.c     |  11 ++-
 gfs2/edit/gfs2hex.c      |  33 ++++---
 gfs2/edit/hexedit.c      |   9 +-
 gfs2/edit/struct_print.c | 206 +++++++++++++++++++++++++++++++++++++++
 gfs2/edit/struct_print.h |  19 ++++
 gfs2/libgfs2/libgfs2.h   |  15 ---
 gfs2/libgfs2/ondisk.c    | 199 -------------------------------------
 gfs2/mkfs/Makefile.am    |   2 +
 gfs2/mkfs/main_mkfs.c    |  27 ++---
 gfs2/mkfs/struct_print.c | 206 +++++++++++++++++++++++++++++++++++++++
 gfs2/mkfs/struct_print.h |  19 ++++
 12 files changed, 496 insertions(+), 252 deletions(-)
 create mode 100644 gfs2/edit/struct_print.c
 create mode 100644 gfs2/edit/struct_print.h
 create mode 100644 gfs2/mkfs/struct_print.c
 create mode 100644 gfs2/mkfs/struct_print.h

diff --git a/gfs2/edit/Makefile.am b/gfs2/edit/Makefile.am
index cee327a9..28a8908c 100644
--- a/gfs2/edit/Makefile.am
+++ b/gfs2/edit/Makefile.am
@@ -6,6 +6,7 @@ noinst_HEADERS = \
 	gfs2hex.h \
 	hexedit.h \
 	extended.h \
+	struct_print.h \
 	journal.h
 
 gfs2_edit_SOURCES = \
@@ -13,6 +14,7 @@ gfs2_edit_SOURCES = \
 	hexedit.c \
 	savemeta.c \
 	extended.c \
+	struct_print.c \
 	journal.c
 
 gfs2_edit_CPPFLAGS = \
diff --git a/gfs2/edit/extended.c b/gfs2/edit/extended.c
index 8d914681..8ba3da3b 100644
--- a/gfs2/edit/extended.c
+++ b/gfs2/edit/extended.c
@@ -17,13 +17,14 @@
 #include <sys/ioctl.h>
 #include <sys/mount.h>
 #include <dirent.h>
+#include <libgfs2.h>
 
 #include "copyright.cf"
 
 #include "hexedit.h"
-#include "libgfs2.h"
 #include "extended.h"
 #include "gfs2hex.h"
+#include "struct_print.h"
 
 static void print_block_details(struct iinfo *ind, int level, int cur_height,
 				int pndx, uint64_t file_offset);
@@ -534,7 +535,7 @@ static int parse_rindex(struct gfs2_inode *dip, int print_rindex)
 			if (edit_row[dmode] == print_entry_ndx)
 				COLORS_NORMAL;
 			if (print_rindex)
-				lgfs2_rindex_print(&ri);
+				rindex_print(&ri);
 			else {
 				struct gfs2_rgrp r = {0};
 				ssize_t ret;
@@ -545,7 +546,7 @@ static int parse_rindex(struct gfs2_inode *dip, int print_rindex)
 				} else if (sbd.gfs1) {
 					gfs_rgrp_print(&r);
 				} else {
-					lgfs2_rgrp_print(&r);
+					rgrp_print(&r);
 				}
 			}
 			last_entry_onscreen[dmode] = print_entry_ndx;
@@ -597,7 +598,7 @@ static int print_statfs(struct gfs2_inode *dis)
 	}
 	print_gfs2("statfs file contents:");
 	eol(0);
-	lgfs2_statfs_change_print(&sc);
+	statfs_change_print(&sc);
 	return 0;
 }
 
@@ -621,7 +622,7 @@ static int print_quota(struct gfs2_inode *diq)
 		}
 		print_gfs2("Entry #%d", i + 1);
 		eol(0);
-		lgfs2_quota_print(&q);
+		quota_print(&q);
 	}
 	return 0;
 }
diff --git a/gfs2/edit/gfs2hex.c b/gfs2/edit/gfs2hex.c
index 219a20ea..9c71ac60 100644
--- a/gfs2/edit/gfs2hex.c
+++ b/gfs2/edit/gfs2hex.c
@@ -11,11 +11,12 @@
 #include <errno.h>
 #include <curses.h>
 #include <uuid.h>
+#include <libgfs2.h>
 
 #include "hexedit.h"
 #include "extended.h"
 #include "gfs2hex.h"
-#include "libgfs2.h"
+#include "struct_print.h"
 
 #define pv(struct, member, fmt, fmt2) do {				\
 		print_it("  "#member, fmt, fmt2, struct->member);	\
@@ -364,7 +365,7 @@ static void do_eattr_extended(char *buf)
 		eol(0);
 		buf += x;
 		ea = (struct gfs2_ea_header *)buf;
-		lgfs2_ea_header_print(ea);
+		ea_header_print(ea);
 		rec_len = be32_to_cpu(ea->ea_rec_len);
 	}
 }
@@ -377,20 +378,20 @@ static void gfs_sb_print(void *sbp)
 {
 	struct gfs_sb *sb = sbp;
 
-	lgfs2_meta_header_print(&sb->sb_header);
+	meta_header_print(&sb->sb_header);
 	printbe32(sb, sb_fs_format);
 	printbe32(sb, sb_multihost_format);
 	printbe32(sb, sb_flags);
 	printbe32(sb, sb_bsize);
 	printbe32(sb, sb_bsize_shift);
 	printbe32(sb, sb_seg_size);
-	lgfs2_inum_print(&sb->sb_jindex_di);
-	lgfs2_inum_print(&sb->sb_rindex_di);
-	lgfs2_inum_print(&sb->sb_root_di);
+	inum_print(&sb->sb_jindex_di);
+	inum_print(&sb->sb_rindex_di);
+	inum_print(&sb->sb_root_di);
 	pv(sb, sb_lockproto, "%.64s", NULL);
 	pv(sb, sb_locktable, "%.64s", NULL);
-	lgfs2_inum_print(&sb->sb_quota_di);
-	lgfs2_inum_print(&sb->sb_license_di);
+	inum_print(&sb->sb_quota_di);
+	inum_print(&sb->sb_license_di);
 }
 
 void display_gfs2(void *buf)
@@ -418,41 +419,41 @@ void display_gfs2(void *buf)
 		if (sbd.gfs1)
 			gfs_sb_print(buf);
 		else
-			lgfs2_sb_print(buf);
+			sb_print(buf);
 		break;
 	case GFS2_METATYPE_RG:
 		if (sbd.gfs1)
 			gfs_rgrp_print(buf);
 		else
-			lgfs2_rgrp_print(buf);
+			rgrp_print(buf);
 		break;
 	case GFS2_METATYPE_DI:
-		lgfs2_dinode_print(di);
+		dinode_print(di);
 		break;
 	case GFS2_METATYPE_LF:
-		lgfs2_leaf_print(buf);
+		leaf_print(buf);
 		break;
 	case GFS2_METATYPE_LH:
 		if (sbd.gfs1)
 			gfs_log_header_print(buf);
 		else
-			lgfs2_log_header_print(buf);
+			log_header_print(buf);
 		break;
 	case GFS2_METATYPE_LD:
-		lgfs2_log_descriptor_print(buf);
+		log_descriptor_print(buf);
 		break;
 	case GFS2_METATYPE_EA:
 		do_eattr_extended(buf);
 		break;
 	case GFS2_METATYPE_QC:
-		lgfs2_quota_change_print(buf);
+		quota_change_print(buf);
 		break;
 	case GFS2_METATYPE_RB:
 	case GFS2_METATYPE_IN:
 	case GFS2_METATYPE_JD:
 	case GFS2_METATYPE_ED:
 	case GFS2_METATYPE_LB:
-		lgfs2_meta_header_print(mh);
+		meta_header_print(mh);
 		break;
 	default:
 		print_gfs2("Unknown block type");
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index 0662fc3f..d88bfcfe 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -25,6 +25,7 @@
 #include "gfs2hex.h"
 #include "extended.h"
 #include "journal.h"
+#include "struct_print.h"
 
 #define printbe32(struct, member) do { \
 		print_it("  "#member, "%"PRIu32, "0x%"PRIx32, be32_to_cpu(struct->member)); \
@@ -733,12 +734,12 @@ void gfs_rgrp_print(void *rgp)
 {
 	struct gfs_rgrp *rg = rgp;
 
-	lgfs2_meta_header_print(&rg->rg_header);
+	meta_header_print(&rg->rg_header);
 	printbe32(rg, rg_flags);
 	printbe32(rg, rg_free);
 	printbe32(rg, rg_useddi);
 	printbe32(rg, rg_freedi);
-	lgfs2_inum_print(&rg->rg_freedi_list);
+	inum_print(&rg->rg_freedi_list);
 	printbe32(rg, rg_usedmeta);
 	printbe32(rg, rg_freemeta);
 }
@@ -799,7 +800,7 @@ static void set_rgrp_flags(int rgnum, uint32_t new_flags, int modify, int full)
 			if (sbd.gfs1)
 				gfs_rgrp_print(rg);
 			else
-				lgfs2_rgrp_print(rg);
+				rgrp_print(rg);
 		}
 		else
 			printf("RG #%d (block %"PRIu64" / 0x%"PRIx64") rg_flags = 0x%08x\n",
@@ -2034,7 +2035,7 @@ void gfs_log_header_print(void *lhp)
 {
 	struct gfs_log_header *lh = lhp;
 
-	lgfs2_meta_header_print(&lh->lh_header);
+	meta_header_print(&lh->lh_header);
 	print_it("  lh_flags", "%"PRIu32, "0x%.8"PRIx32, be32_to_cpu(lh->lh_flags));
 	print_it("  lh_pad", "%"PRIu32, "0x%"PRIx32, be32_to_cpu(lh->lh_pad));
 	print_it("  lh_first", "%"PRIu64, "0x%"PRIx64, be64_to_cpu(lh->lh_first));
diff --git a/gfs2/edit/struct_print.c b/gfs2/edit/struct_print.c
new file mode 100644
index 00000000..88c9c609
--- /dev/null
+++ b/gfs2/edit/struct_print.c
@@ -0,0 +1,206 @@
+#include <stddef.h>
+#include <string.h>
+#include <inttypes.h>
+#include <uuid.h>
+#include <libgfs2.h>
+
+#include "struct_print.h"
+
+#define printbe16(struct, member) do { \
+		print_it("  "#member, "%"PRIu16, "0x%"PRIx16, be16_to_cpu(struct->member)); \
+	} while(0)
+#define printbe32(struct, member) do { \
+		print_it("  "#member, "%"PRIu32, "0x%"PRIx32, be32_to_cpu(struct->member)); \
+	} while(0)
+#define printbe64(struct, member) do { \
+		print_it("  "#member, "%"PRIu64, "0x%"PRIx64, be64_to_cpu(struct->member)); \
+	} while(0)
+#define print8(struct, member) do { \
+		print_it("  "#member, "%"PRIu8, "0x%"PRIx8, struct->member); \
+	} while(0)
+
+void inum_print(void *nop)
+{
+	struct gfs2_inum *no = nop;
+
+	printbe64(no, no_formal_ino);
+	printbe64(no, no_addr);
+}
+
+void meta_header_print(void *mhp)
+{
+	struct gfs2_meta_header *mh = mhp;
+
+	print_it("  mh_magic", "0x%08"PRIX32, NULL, be32_to_cpu(mh->mh_magic));
+	printbe32(mh, mh_type);
+	printbe32(mh, mh_format);
+}
+
+void sb_print(void *sbp)
+{
+	struct gfs2_sb *sb = sbp;
+	char readable_uuid[36+1];
+
+	meta_header_print(&sb->sb_header);
+	printbe32(sb, sb_fs_format);
+	printbe32(sb, sb_multihost_format);
+	printbe32(sb, sb_bsize);
+	printbe32(sb, sb_bsize_shift);
+	inum_print(&sb->sb_master_dir);
+	inum_print(&sb->sb_root_dir);
+	print_it("  sb_lockproto", "%.64s", NULL, sb->sb_lockproto);
+	print_it("  sb_locktable", "%.64s", NULL, sb->sb_locktable);
+	uuid_unparse(sb->sb_uuid, readable_uuid);
+	print_it("  uuid", "%36s", NULL, readable_uuid);
+}
+
+void rindex_print(void *rip)
+{
+	struct gfs2_rindex *ri = rip;
+
+	printbe64(ri, ri_addr);
+	printbe32(ri, ri_length);
+	printbe64(ri, ri_data0);
+	printbe32(ri, ri_data);
+	printbe32(ri, ri_bitbytes);
+}
+
+void rgrp_print(void *rgp)
+{
+	struct gfs2_rgrp *rg = rgp;
+
+	meta_header_print(&rg->rg_header);
+	printbe32(rg, rg_flags);
+	printbe32(rg, rg_free);
+	printbe32(rg, rg_dinodes);
+	printbe32(rg, rg_skip);
+	printbe64(rg, rg_igeneration);
+	printbe64(rg, rg_data0);
+	printbe32(rg, rg_data);
+	printbe32(rg, rg_bitbytes);
+	printbe32(rg, rg_crc);
+}
+
+void quota_print(void *qp)
+{
+	struct gfs2_quota *q = qp;
+
+	printbe64(q, qu_limit);
+	printbe64(q, qu_warn);
+	printbe64(q, qu_value);
+}
+
+void dinode_print(void *dip)
+{
+	struct gfs2_dinode *di = dip;
+
+	meta_header_print(&di->di_header);
+	inum_print(&di->di_num);
+
+	print_it("  di_mode", "0%"PRIo32, NULL, be32_to_cpu(di->di_mode));
+	printbe32(di, di_uid);
+	printbe32(di, di_gid);
+	printbe32(di, di_nlink);
+	printbe64(di, di_size);
+	printbe64(di, di_blocks);
+	printbe64(di, di_atime);
+	printbe64(di, di_mtime);
+	printbe64(di, di_ctime);
+	printbe32(di, di_major);
+	printbe32(di, di_minor);
+	printbe64(di, di_goal_meta);
+	printbe64(di, di_goal_data);
+	print_it("  di_flags", "0x%.8"PRIX32, NULL, be32_to_cpu(di->di_flags));
+	printbe32(di, di_payload_format);
+	printbe16(di, di_height);
+	printbe16(di, di_depth);
+	printbe32(di, di_entries);
+	printbe64(di, di_eattr);
+}
+
+void leaf_print(void *lfp)
+{
+	struct gfs2_leaf *lf = lfp;
+
+	meta_header_print(&lf->lf_header);
+	printbe16(lf, lf_depth);
+	printbe16(lf, lf_entries);
+	printbe32(lf, lf_dirent_format);
+	printbe64(lf, lf_next);
+	printbe64(lf, lf_inode);
+	printbe32(lf, lf_dist);
+	printbe32(lf, lf_nsec);
+	printbe64(lf, lf_sec);
+}
+
+void ea_header_print(void *eap)
+{
+	char buf[GFS2_EA_MAX_NAME_LEN + 1];
+	struct gfs2_ea_header *ea = eap;
+	unsigned len = ea->ea_name_len;
+
+	printbe32(ea, ea_rec_len);
+	printbe32(ea, ea_data_len);
+	print8(ea, ea_name_len);
+	print8(ea, ea_type);
+	print8(ea, ea_flags);
+	print8(ea, ea_num_ptrs);
+
+	if (len > GFS2_EA_MAX_NAME_LEN)
+		len = GFS2_EA_MAX_NAME_LEN;
+	memcpy(buf, ea + 1, len);
+	buf[len] = '\0';
+	print_it("  name", "%s", NULL, buf);
+}
+
+void log_header_print(void *lhp)
+{
+	struct gfs2_log_header *lh = lhp;
+
+	meta_header_print(&lh->lh_header);
+	printbe64(lh, lh_sequence);
+	print_it("  lh_flags", "0x%.8"PRIX32, NULL, be32_to_cpu(lh->lh_flags));
+	printbe32(lh, lh_tail);
+	printbe32(lh, lh_blkno);
+	print_it("  lh_hash", "0x%.8"PRIX32, NULL, be32_to_cpu(lh->lh_hash));
+	print_it("  lh_crc", "0x%.8"PRIX32, NULL, be32_to_cpu(lh->lh_crc));
+	printbe32(lh, lh_nsec);
+	printbe64(lh, lh_sec);
+	printbe64(lh, lh_addr);
+	printbe64(lh, lh_jinode);
+	printbe64(lh, lh_statfs_addr);
+	printbe64(lh, lh_quota_addr);
+	print_it("  lh_local_total", "%"PRId64, "0x%"PRIx64, be64_to_cpu(lh->lh_local_total));
+	print_it("  lh_local_free", "%"PRId64, "0x%"PRIx64, be64_to_cpu(lh->lh_local_free));
+	print_it("  lh_local_dinodes", "%"PRId64, "0x%"PRIx64, be64_to_cpu(lh->lh_local_dinodes));
+}
+
+void log_descriptor_print(void *ldp)
+{
+	struct gfs2_log_descriptor *ld = ldp;
+
+	meta_header_print(&ld->ld_header);
+	printbe32(ld, ld_type);
+	printbe32(ld, ld_length);
+	printbe32(ld, ld_data1);
+	printbe32(ld, ld_data2);
+}
+
+void statfs_change_print(void *scp)
+{
+	struct gfs2_statfs_change *sc = scp;
+
+	print_it("  sc_total", "%"PRId64, "0x%"PRIx64, be64_to_cpu(sc->sc_total));
+	print_it("  sc_free", "%"PRId64, "0x%"PRIx64, be64_to_cpu(sc->sc_free));
+	print_it("  sc_dinodes", "%"PRId64, "0x%"PRIx64, be64_to_cpu(sc->sc_dinodes));
+}
+
+void quota_change_print(void *qcp)
+{
+	struct gfs2_quota_change *qc = qcp;
+
+	print_it("  qc_change", "%"PRId64, "0x%"PRIx64, be64_to_cpu(qc->qc_change));
+	print_it("  qc_flags", "0x%.8"PRIX32, NULL, be32_to_cpu(qc->qc_flags));
+	printbe32(qc, qc_id);
+}
+
diff --git a/gfs2/edit/struct_print.h b/gfs2/edit/struct_print.h
new file mode 100644
index 00000000..784c130d
--- /dev/null
+++ b/gfs2/edit/struct_print.h
@@ -0,0 +1,19 @@
+#ifndef STRUCT_PRINT_H
+#define STRUCT_PRINT_H
+
+/* Printing functions. These expect on-disk data */
+extern void inum_print(void *nop);
+extern void meta_header_print(void *mhp);
+extern void sb_print(void *sbp);
+extern void dinode_print(void *dip);
+extern void log_header_print(void *lhp);
+extern void log_descriptor_print(void *ldp);
+extern void quota_print(void *qp);
+extern void quota_change_print(void *qcp);
+extern void statfs_change_print(void *scp);
+extern void ea_header_print(void *eap);
+extern void leaf_print(void *lfp);
+extern void rindex_print(void *rip);
+extern void rgrp_print(void *rgp);
+
+#endif /* STRUCT_PRINT_H */
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 20d8d57e..81fe5983 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -816,21 +816,6 @@ extern void lgfs2_dirent_out(struct lgfs2_dirent *d, void *dep);
 extern void lgfs2_leaf_in(struct lgfs2_leaf *lf, void *lfp);
 extern void lgfs2_leaf_out(struct lgfs2_leaf *lf, void *lfp);
 
-/* Printing functions. These expect on-disk data */
-extern void lgfs2_inum_print(void *nop);
-extern void lgfs2_meta_header_print(void *mhp);
-extern void lgfs2_sb_print(void *sbp);
-extern void lgfs2_dinode_print(void *dip);
-extern void lgfs2_log_header_print(void *lhp);
-extern void lgfs2_log_descriptor_print(void *ldp);
-extern void lgfs2_quota_print(void *qp);
-extern void lgfs2_quota_change_print(void *qcp);
-extern void lgfs2_statfs_change_print(void *scp);
-extern void lgfs2_ea_header_print(void *eap);
-extern void lgfs2_leaf_print(void *lfp);
-extern void lgfs2_rindex_print(void *rip);
-extern void lgfs2_rgrp_print(void *rgp);
-
 __END_DECLS
 
 #endif /* __LIBGFS2_DOT_H__ */
diff --git a/gfs2/libgfs2/ondisk.c b/gfs2/libgfs2/ondisk.c
index 4daf1be1..8cddfec9 100644
--- a/gfs2/libgfs2/ondisk.c
+++ b/gfs2/libgfs2/ondisk.c
@@ -9,19 +9,6 @@
 #include <uuid.h>
 #include "libgfs2.h"
 
-#define printbe16(struct, member) do { \
-		print_it("  "#member, "%"PRIu16, "0x%"PRIx16, be16_to_cpu(struct->member)); \
-	} while(0)
-#define printbe32(struct, member) do { \
-		print_it("  "#member, "%"PRIu32, "0x%"PRIx32, be32_to_cpu(struct->member)); \
-	} while(0)
-#define printbe64(struct, member) do { \
-		print_it("  "#member, "%"PRIu64, "0x%"PRIx64, be64_to_cpu(struct->member)); \
-	} while(0)
-#define print8(struct, member) do { \
-		print_it("  "#member, "%"PRIu8, "0x%"PRIx8, struct->member); \
-	} while(0)
-
 void lgfs2_inum_in(struct lgfs2_inum *i, void *inp)
 {
 	struct gfs2_inum *in = inp;
@@ -38,23 +25,6 @@ void lgfs2_inum_out(const struct lgfs2_inum *i, void *inp)
 	in->no_addr = cpu_to_be64(i->in_addr);
 }
 
-void lgfs2_inum_print(void *nop)
-{
-	struct gfs2_inum *no = nop;
-
-	printbe64(no, no_formal_ino);
-	printbe64(no, no_addr);
-}
-
-void lgfs2_meta_header_print(void *mhp)
-{
-	struct gfs2_meta_header *mh = mhp;
-
-	print_it("  mh_magic", "0x%08"PRIX32, NULL, be32_to_cpu(mh->mh_magic));
-	printbe32(mh, mh_type);
-	printbe32(mh, mh_format);
-}
-
 void lgfs2_sb_in(struct gfs2_sbd *sdp, void *buf)
 {
 	struct gfs2_sb *sb = buf;
@@ -100,24 +70,6 @@ void lgfs2_sb_out(const struct gfs2_sbd *sdp, void *buf)
 	memcpy(sb->sb_uuid, sdp->sd_uuid, 16);
 }
 
-void lgfs2_sb_print(void *sbp)
-{
-	struct gfs2_sb *sb = sbp;
-	char readable_uuid[36+1];
-
-	lgfs2_meta_header_print(&sb->sb_header);
-	printbe32(sb, sb_fs_format);
-	printbe32(sb, sb_multihost_format);
-	printbe32(sb, sb_bsize);
-	printbe32(sb, sb_bsize_shift);
-	lgfs2_inum_print(&sb->sb_master_dir);
-	lgfs2_inum_print(&sb->sb_root_dir);
-	print_it("  sb_lockproto", "%.64s", NULL, sb->sb_lockproto);
-	print_it("  sb_locktable", "%.64s", NULL, sb->sb_locktable);
-	uuid_unparse(sb->sb_uuid, readable_uuid);
-	print_it("  uuid", "%36s", NULL, readable_uuid);
-}
-
 void lgfs2_rindex_in(lgfs2_rgrp_t rg, void *buf)
 {
 	struct gfs2_rindex *ri = buf;
@@ -140,17 +92,6 @@ void lgfs2_rindex_out(const lgfs2_rgrp_t rg, void *buf)
 	ri->ri_bitbytes = cpu_to_be32(rg->rt_bitbytes);
 }
 
-void lgfs2_rindex_print(void *rip)
-{
-	struct gfs2_rindex *ri = rip;
-
-	printbe64(ri, ri_addr);
-	printbe32(ri, ri_length);
-	printbe64(ri, ri_data0);
-	printbe32(ri, ri_data);
-	printbe32(ri, ri_bitbytes);
-}
-
 void lgfs2_rgrp_in(lgfs2_rgrp_t rg, void *buf)
 {
 	struct gfs2_rgrp *r = buf;
@@ -183,31 +124,6 @@ void lgfs2_rgrp_out(const lgfs2_rgrp_t rg, void *buf)
 	lgfs2_rgrp_crc_set(buf);
 }
 
-void lgfs2_rgrp_print(void *rgp)
-{
-	struct gfs2_rgrp *rg = rgp;
-
-	lgfs2_meta_header_print(&rg->rg_header);
-	printbe32(rg, rg_flags);
-	printbe32(rg, rg_free);
-	printbe32(rg, rg_dinodes);
-	printbe32(rg, rg_skip);
-	printbe64(rg, rg_igeneration);
-	printbe64(rg, rg_data0);
-	printbe32(rg, rg_data);
-	printbe32(rg, rg_bitbytes);
-	printbe32(rg, rg_crc);
-}
-
-void lgfs2_quota_print(void *qp)
-{
-	struct gfs2_quota *q = qp;
-
-	printbe64(q, qu_limit);
-	printbe64(q, qu_warn);
-	printbe64(q, qu_value);
-}
-
 void lgfs2_dinode_in(struct gfs2_inode *ip, char *buf)
 {
 	struct gfs2_dinode *di = (struct gfs2_dinode *)buf;
@@ -274,34 +190,6 @@ void lgfs2_dinode_out(struct gfs2_inode *ip, char *buf)
 	di->di_ctime_nsec = cpu_to_be32(ip->i_ctime_nsec);
 }
 
-void lgfs2_dinode_print(void *dip)
-{
-	struct gfs2_dinode *di = dip;
-
-	lgfs2_meta_header_print(&di->di_header);
-	lgfs2_inum_print(&di->di_num);
-
-	print_it("  di_mode", "0%"PRIo32, NULL, be32_to_cpu(di->di_mode));
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
-}
-
 void lgfs2_dirent_in(struct lgfs2_dirent *d, void *dep)
 {
 	struct gfs2_dirent *de = dep;
@@ -353,90 +241,3 @@ void lgfs2_leaf_out(struct lgfs2_leaf *lf, void *lfp)
 	l->lf_nsec = cpu_to_be32(lf->lf_nsec);
 	l->lf_sec = cpu_to_be64(lf->lf_sec);
 }
-
-void lgfs2_leaf_print(void *lfp)
-{
-	struct gfs2_leaf *lf = lfp;
-
-	lgfs2_meta_header_print(&lf->lf_header);
-	printbe16(lf, lf_depth);
-	printbe16(lf, lf_entries);
-	printbe32(lf, lf_dirent_format);
-	printbe64(lf, lf_next);
-	printbe64(lf, lf_inode);
-	printbe32(lf, lf_dist);
-	printbe32(lf, lf_nsec);
-	printbe64(lf, lf_sec);
-}
-
-void lgfs2_ea_header_print(void *eap)
-{
-	char buf[GFS2_EA_MAX_NAME_LEN + 1];
-	struct gfs2_ea_header *ea = eap;
-	unsigned len = ea->ea_name_len;
-
-	printbe32(ea, ea_rec_len);
-	printbe32(ea, ea_data_len);
-	print8(ea, ea_name_len);
-	print8(ea, ea_type);
-	print8(ea, ea_flags);
-	print8(ea, ea_num_ptrs);
-
-	if (len > GFS2_EA_MAX_NAME_LEN)
-		len = GFS2_EA_MAX_NAME_LEN;
-	memcpy(buf, ea + 1, len);
-	buf[len] = '\0';
-	print_it("  name", "%s", NULL, buf);
-}
-
-void lgfs2_log_header_print(void *lhp)
-{
-	struct gfs2_log_header *lh = lhp;
-
-	lgfs2_meta_header_print(&lh->lh_header);
-	printbe64(lh, lh_sequence);
-	print_it("  lh_flags", "0x%.8"PRIX32, NULL, be32_to_cpu(lh->lh_flags));
-	printbe32(lh, lh_tail);
-	printbe32(lh, lh_blkno);
-	print_it("  lh_hash", "0x%.8"PRIX32, NULL, be32_to_cpu(lh->lh_hash));
-	print_it("  lh_crc", "0x%.8"PRIX32, NULL, be32_to_cpu(lh->lh_crc));
-	printbe32(lh, lh_nsec);
-	printbe64(lh, lh_sec);
-	printbe64(lh, lh_addr);
-	printbe64(lh, lh_jinode);
-	printbe64(lh, lh_statfs_addr);
-	printbe64(lh, lh_quota_addr);
-	print_it("  lh_local_total", "%"PRId64, "0x%"PRIx64, be64_to_cpu(lh->lh_local_total));
-	print_it("  lh_local_free", "%"PRId64, "0x%"PRIx64, be64_to_cpu(lh->lh_local_free));
-	print_it("  lh_local_dinodes", "%"PRId64, "0x%"PRIx64, be64_to_cpu(lh->lh_local_dinodes));
-}
-
-void lgfs2_log_descriptor_print(void *ldp)
-{
-	struct gfs2_log_descriptor *ld = ldp;
-
-	lgfs2_meta_header_print(&ld->ld_header);
-	printbe32(ld, ld_type);
-	printbe32(ld, ld_length);
-	printbe32(ld, ld_data1);
-	printbe32(ld, ld_data2);
-}
-
-void lgfs2_statfs_change_print(void *scp)
-{
-	struct gfs2_statfs_change *sc = scp;
-
-	print_it("  sc_total", "%"PRId64, "0x%"PRIx64, be64_to_cpu(sc->sc_total));
-	print_it("  sc_free", "%"PRId64, "0x%"PRIx64, be64_to_cpu(sc->sc_free));
-	print_it("  sc_dinodes", "%"PRId64, "0x%"PRIx64, be64_to_cpu(sc->sc_dinodes));
-}
-
-void lgfs2_quota_change_print(void *qcp)
-{
-	struct gfs2_quota_change *qc = qcp;
-
-	print_it("  qc_change", "%"PRId64, "0x%"PRIx64, be64_to_cpu(qc->qc_change));
-	print_it("  qc_flags", "0x%.8"PRIX32, NULL, be32_to_cpu(qc->qc_flags));
-	printbe32(qc, qc_id);
-}
-
diff --git a/gfs2/mkfs/Makefile.am b/gfs2/mkfs/Makefile.am
index fd00fdd5..41c535c0 100644
--- a/gfs2/mkfs/Makefile.am
+++ b/gfs2/mkfs/Makefile.am
@@ -14,10 +14,12 @@ sbin_PROGRAMS = \
 
 noinst_HEADERS = \
 	gfs2_mkfs.h \
+	struct_print.h \
 	metafs.h
 
 mkfs_gfs2_SOURCES = \
 	main_mkfs.c \
+	struct_print.c \
 	progress.c \
 	progress.h
 
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 8f8d8f04..435ea0a7 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -29,6 +29,7 @@
 #include "libgfs2.h"
 #include "gfs2_mkfs.h"
 #include "progress.h"
+#include "struct_print.h"
 
 static void print_usage(const char *prog_name)
 {
@@ -702,7 +703,7 @@ static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 		}
 		if (opts->debug) {
 			printf("\nInum Range %u:\n", j);
-			lgfs2_dinode_print(ip->i_bh->b_data);
+			dinode_print(ip->i_bh->b_data);
 		}
 		inode_put(&ip);
 
@@ -714,7 +715,7 @@ static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 		}
 		if (opts->debug) {
 			printf("\nStatFS Change %u:\n", j);
-			lgfs2_dinode_print(ip->i_bh->b_data);
+			dinode_print(ip->i_bh->b_data);
 		}
 		inode_put(&ip);
 
@@ -726,13 +727,13 @@ static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 		}
 		if (opts->debug) {
 			printf("\nQuota Change %u:\n", j);
-			lgfs2_dinode_print(ip->i_bh->b_data);
+			dinode_print(ip->i_bh->b_data);
 		}
 		inode_put(&ip);
 	}
 	if (opts->debug) {
 		printf("\nper_node:\n");
-		lgfs2_dinode_print(per_node->i_bh->b_data);
+		dinode_print(per_node->i_bh->b_data);
 	}
 	inode_put(&per_node);
 	return 0;
@@ -856,7 +857,7 @@ static int place_rgrp(struct gfs2_sbd *sdp, lgfs2_rgrp_t rg, int debug)
 		return -1;
 	}
 	if (debug) {
-		lgfs2_rindex_print(&ri);
+		rindex_print(&ri);
 		printf("\n");
 	}
 	sdp->blks_total += be32_to_cpu(ri.ri_data);
@@ -1009,7 +1010,7 @@ static int create_jindex(struct gfs2_sbd *sdp, struct mkfs_opts *opts, struct lg
 	}
 	if (opts->debug) {
 		printf("Jindex:\n");
-		lgfs2_dinode_print(jindex->i_bh->b_data);
+		dinode_print(jindex->i_bh->b_data);
 	}
 	inode_put(&jindex);
 	return 0;
@@ -1284,7 +1285,7 @@ int main(int argc, char *argv[])
 	}
 	if (opts.debug) {
 		printf("Metafs inode:\n");
-		lgfs2_dinode_print(sbd.master_dir->i_bh->b_data);
+		dinode_print(sbd.master_dir->i_bh->b_data);
 	}
 	sbd.sd_meta_dir = sbd.master_dir->i_num;
 
@@ -1304,7 +1305,7 @@ int main(int argc, char *argv[])
 	}
 	if (opts.debug) {
 		printf("\nInum Inode:\n");
-		lgfs2_dinode_print(sbd.md.inum->i_bh->b_data);
+		dinode_print(sbd.md.inum->i_bh->b_data);
 	}
 	sbd.md.statfs = build_statfs(&sbd);
 	if (sbd.md.statfs == NULL) {
@@ -1313,7 +1314,7 @@ int main(int argc, char *argv[])
 	}
 	if (opts.debug) {
 		printf("\nStatFS Inode:\n");
-		lgfs2_dinode_print(sbd.md.statfs->i_bh->b_data);
+		dinode_print(sbd.md.statfs->i_bh->b_data);
 	}
 	ip = build_rindex(&sbd);
 	if (ip == NULL) {
@@ -1322,7 +1323,7 @@ int main(int argc, char *argv[])
 	}
 	if (opts.debug) {
 		printf("\nResource Index:\n");
-		lgfs2_dinode_print(ip->i_bh->b_data);
+		dinode_print(ip->i_bh->b_data);
 	}
 	inode_put(&ip);
 	if (!opts.quiet) {
@@ -1336,7 +1337,7 @@ int main(int argc, char *argv[])
 	}
 	if (opts.debug) {
 		printf("\nQuota:\n");
-		lgfs2_dinode_print(ip->i_bh->b_data);
+		dinode_print(ip->i_bh->b_data);
 	}
 	inode_put(&ip);
 	if (!opts.quiet)
@@ -1345,7 +1346,7 @@ int main(int argc, char *argv[])
 	build_root(&sbd);
 	if (opts.debug) {
 		printf("\nRoot directory:\n");
-		lgfs2_dinode_print(sbd.md.rooti->i_bh->b_data);
+		dinode_print(sbd.md.rooti->i_bh->b_data);
 	}
 	sbd.sd_root_dir = sbd.md.rooti->i_num;
 
@@ -1361,7 +1362,7 @@ int main(int argc, char *argv[])
 	do_init_statfs(&sbd, &sc);
 	if (opts.debug) {
 		printf("\nStatfs:\n");
-		lgfs2_statfs_change_print(&sc);
+		statfs_change_print(&sc);
 	}
 	inode_put(&sbd.md.rooti);
 	inode_put(&sbd.master_dir);
diff --git a/gfs2/mkfs/struct_print.c b/gfs2/mkfs/struct_print.c
new file mode 100644
index 00000000..88c9c609
--- /dev/null
+++ b/gfs2/mkfs/struct_print.c
@@ -0,0 +1,206 @@
+#include <stddef.h>
+#include <string.h>
+#include <inttypes.h>
+#include <uuid.h>
+#include <libgfs2.h>
+
+#include "struct_print.h"
+
+#define printbe16(struct, member) do { \
+		print_it("  "#member, "%"PRIu16, "0x%"PRIx16, be16_to_cpu(struct->member)); \
+	} while(0)
+#define printbe32(struct, member) do { \
+		print_it("  "#member, "%"PRIu32, "0x%"PRIx32, be32_to_cpu(struct->member)); \
+	} while(0)
+#define printbe64(struct, member) do { \
+		print_it("  "#member, "%"PRIu64, "0x%"PRIx64, be64_to_cpu(struct->member)); \
+	} while(0)
+#define print8(struct, member) do { \
+		print_it("  "#member, "%"PRIu8, "0x%"PRIx8, struct->member); \
+	} while(0)
+
+void inum_print(void *nop)
+{
+	struct gfs2_inum *no = nop;
+
+	printbe64(no, no_formal_ino);
+	printbe64(no, no_addr);
+}
+
+void meta_header_print(void *mhp)
+{
+	struct gfs2_meta_header *mh = mhp;
+
+	print_it("  mh_magic", "0x%08"PRIX32, NULL, be32_to_cpu(mh->mh_magic));
+	printbe32(mh, mh_type);
+	printbe32(mh, mh_format);
+}
+
+void sb_print(void *sbp)
+{
+	struct gfs2_sb *sb = sbp;
+	char readable_uuid[36+1];
+
+	meta_header_print(&sb->sb_header);
+	printbe32(sb, sb_fs_format);
+	printbe32(sb, sb_multihost_format);
+	printbe32(sb, sb_bsize);
+	printbe32(sb, sb_bsize_shift);
+	inum_print(&sb->sb_master_dir);
+	inum_print(&sb->sb_root_dir);
+	print_it("  sb_lockproto", "%.64s", NULL, sb->sb_lockproto);
+	print_it("  sb_locktable", "%.64s", NULL, sb->sb_locktable);
+	uuid_unparse(sb->sb_uuid, readable_uuid);
+	print_it("  uuid", "%36s", NULL, readable_uuid);
+}
+
+void rindex_print(void *rip)
+{
+	struct gfs2_rindex *ri = rip;
+
+	printbe64(ri, ri_addr);
+	printbe32(ri, ri_length);
+	printbe64(ri, ri_data0);
+	printbe32(ri, ri_data);
+	printbe32(ri, ri_bitbytes);
+}
+
+void rgrp_print(void *rgp)
+{
+	struct gfs2_rgrp *rg = rgp;
+
+	meta_header_print(&rg->rg_header);
+	printbe32(rg, rg_flags);
+	printbe32(rg, rg_free);
+	printbe32(rg, rg_dinodes);
+	printbe32(rg, rg_skip);
+	printbe64(rg, rg_igeneration);
+	printbe64(rg, rg_data0);
+	printbe32(rg, rg_data);
+	printbe32(rg, rg_bitbytes);
+	printbe32(rg, rg_crc);
+}
+
+void quota_print(void *qp)
+{
+	struct gfs2_quota *q = qp;
+
+	printbe64(q, qu_limit);
+	printbe64(q, qu_warn);
+	printbe64(q, qu_value);
+}
+
+void dinode_print(void *dip)
+{
+	struct gfs2_dinode *di = dip;
+
+	meta_header_print(&di->di_header);
+	inum_print(&di->di_num);
+
+	print_it("  di_mode", "0%"PRIo32, NULL, be32_to_cpu(di->di_mode));
+	printbe32(di, di_uid);
+	printbe32(di, di_gid);
+	printbe32(di, di_nlink);
+	printbe64(di, di_size);
+	printbe64(di, di_blocks);
+	printbe64(di, di_atime);
+	printbe64(di, di_mtime);
+	printbe64(di, di_ctime);
+	printbe32(di, di_major);
+	printbe32(di, di_minor);
+	printbe64(di, di_goal_meta);
+	printbe64(di, di_goal_data);
+	print_it("  di_flags", "0x%.8"PRIX32, NULL, be32_to_cpu(di->di_flags));
+	printbe32(di, di_payload_format);
+	printbe16(di, di_height);
+	printbe16(di, di_depth);
+	printbe32(di, di_entries);
+	printbe64(di, di_eattr);
+}
+
+void leaf_print(void *lfp)
+{
+	struct gfs2_leaf *lf = lfp;
+
+	meta_header_print(&lf->lf_header);
+	printbe16(lf, lf_depth);
+	printbe16(lf, lf_entries);
+	printbe32(lf, lf_dirent_format);
+	printbe64(lf, lf_next);
+	printbe64(lf, lf_inode);
+	printbe32(lf, lf_dist);
+	printbe32(lf, lf_nsec);
+	printbe64(lf, lf_sec);
+}
+
+void ea_header_print(void *eap)
+{
+	char buf[GFS2_EA_MAX_NAME_LEN + 1];
+	struct gfs2_ea_header *ea = eap;
+	unsigned len = ea->ea_name_len;
+
+	printbe32(ea, ea_rec_len);
+	printbe32(ea, ea_data_len);
+	print8(ea, ea_name_len);
+	print8(ea, ea_type);
+	print8(ea, ea_flags);
+	print8(ea, ea_num_ptrs);
+
+	if (len > GFS2_EA_MAX_NAME_LEN)
+		len = GFS2_EA_MAX_NAME_LEN;
+	memcpy(buf, ea + 1, len);
+	buf[len] = '\0';
+	print_it("  name", "%s", NULL, buf);
+}
+
+void log_header_print(void *lhp)
+{
+	struct gfs2_log_header *lh = lhp;
+
+	meta_header_print(&lh->lh_header);
+	printbe64(lh, lh_sequence);
+	print_it("  lh_flags", "0x%.8"PRIX32, NULL, be32_to_cpu(lh->lh_flags));
+	printbe32(lh, lh_tail);
+	printbe32(lh, lh_blkno);
+	print_it("  lh_hash", "0x%.8"PRIX32, NULL, be32_to_cpu(lh->lh_hash));
+	print_it("  lh_crc", "0x%.8"PRIX32, NULL, be32_to_cpu(lh->lh_crc));
+	printbe32(lh, lh_nsec);
+	printbe64(lh, lh_sec);
+	printbe64(lh, lh_addr);
+	printbe64(lh, lh_jinode);
+	printbe64(lh, lh_statfs_addr);
+	printbe64(lh, lh_quota_addr);
+	print_it("  lh_local_total", "%"PRId64, "0x%"PRIx64, be64_to_cpu(lh->lh_local_total));
+	print_it("  lh_local_free", "%"PRId64, "0x%"PRIx64, be64_to_cpu(lh->lh_local_free));
+	print_it("  lh_local_dinodes", "%"PRId64, "0x%"PRIx64, be64_to_cpu(lh->lh_local_dinodes));
+}
+
+void log_descriptor_print(void *ldp)
+{
+	struct gfs2_log_descriptor *ld = ldp;
+
+	meta_header_print(&ld->ld_header);
+	printbe32(ld, ld_type);
+	printbe32(ld, ld_length);
+	printbe32(ld, ld_data1);
+	printbe32(ld, ld_data2);
+}
+
+void statfs_change_print(void *scp)
+{
+	struct gfs2_statfs_change *sc = scp;
+
+	print_it("  sc_total", "%"PRId64, "0x%"PRIx64, be64_to_cpu(sc->sc_total));
+	print_it("  sc_free", "%"PRId64, "0x%"PRIx64, be64_to_cpu(sc->sc_free));
+	print_it("  sc_dinodes", "%"PRId64, "0x%"PRIx64, be64_to_cpu(sc->sc_dinodes));
+}
+
+void quota_change_print(void *qcp)
+{
+	struct gfs2_quota_change *qc = qcp;
+
+	print_it("  qc_change", "%"PRId64, "0x%"PRIx64, be64_to_cpu(qc->qc_change));
+	print_it("  qc_flags", "0x%.8"PRIX32, NULL, be32_to_cpu(qc->qc_flags));
+	printbe32(qc, qc_id);
+}
+
diff --git a/gfs2/mkfs/struct_print.h b/gfs2/mkfs/struct_print.h
new file mode 100644
index 00000000..784c130d
--- /dev/null
+++ b/gfs2/mkfs/struct_print.h
@@ -0,0 +1,19 @@
+#ifndef STRUCT_PRINT_H
+#define STRUCT_PRINT_H
+
+/* Printing functions. These expect on-disk data */
+extern void inum_print(void *nop);
+extern void meta_header_print(void *mhp);
+extern void sb_print(void *sbp);
+extern void dinode_print(void *dip);
+extern void log_header_print(void *lhp);
+extern void log_descriptor_print(void *ldp);
+extern void quota_print(void *qp);
+extern void quota_change_print(void *qcp);
+extern void statfs_change_print(void *scp);
+extern void ea_header_print(void *eap);
+extern void leaf_print(void *lfp);
+extern void rindex_print(void *rip);
+extern void rgrp_print(void *rgp);
+
+#endif /* STRUCT_PRINT_H */
-- 
2.34.1

