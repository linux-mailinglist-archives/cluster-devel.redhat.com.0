Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF9A364A42
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Apr 2021 21:11:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618859515;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1ad3CXDaW9X6kjZ5rNYNuUEVAjeT4SvzzpxJyPdrFhU=;
	b=ixXLUiv2XFViFkuuKVY+LIRmxnP1tU80LkrTArHcGvRiXQnxj0Jfl4qZWH0ABPUulj2SmS
	Y2prYlR2SGFbJIhN0qkCvKya8ytwZHub361ZLSHDwY+gEx+O97V8Jzp1DsgPYq7+m5yv9l
	x1fuXjJdnfRtLZvXDJq9om8/yctneEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-VWyO_fiIPFi_L7dFdhNlgQ-1; Mon, 19 Apr 2021 15:11:53 -0400
X-MC-Unique: VWyO_fiIPFi_L7dFdhNlgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6219839A4F;
	Mon, 19 Apr 2021 19:11:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6E345D9CA;
	Mon, 19 Apr 2021 19:11:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C63571809C82;
	Mon, 19 Apr 2021 19:11:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13JJBdfj001000 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 15:11:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6234A7094D; Mon, 19 Apr 2021 19:11:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7775660843
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 19:11:38 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 19 Apr 2021 20:11:17 +0100
Message-Id: <20210419191117.297653-9-anprice@redhat.com>
In-Reply-To: <20210419191117.297653-1-anprice@redhat.com>
References: <20210419191117.297653-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 8/8] Use PRI* when printing gfs2 structures
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

Now that we have gfs2 structs defined in terms of standard userspace
types instead of kernel types we can use these defines from inttypes.h
to print their fields in a consistent way across architectures.

Fixes a number of -Wformat warnings on x86_64.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/extended.c     |  37 ++++-----
 gfs2/edit/gfs2hex.c      |  28 +++----
 gfs2/edit/journal.c      |  13 ++-
 gfs2/fsck/fs_recovery.c  |  10 +--
 gfs2/fsck/initialize.c   |  47 ++++++-----
 gfs2/fsck/lost_n_found.c |  10 +--
 gfs2/fsck/pass1.c        |   5 +-
 gfs2/fsck/pass2.c        |   2 +-
 gfs2/fsck/rgrepair.c     |  37 ++++-----
 gfs2/libgfs2/ondisk.c    | 168 +++++++++++++++++++--------------------
 10 files changed, 170 insertions(+), 187 deletions(-)

diff --git a/gfs2/edit/extended.c b/gfs2/edit/extended.c
index 91609bd2..30e227d1 100644
--- a/gfs2/edit/extended.c
+++ b/gfs2/edit/extended.c
@@ -308,9 +308,9 @@ static int display_leaf(struct iinfo *ind)
 	if (gfs2_struct_type == GFS2_METATYPE_SB)
 		print_gfs2("The superblock has 2 directories");
 	else
-		print_gfs2("Directory block: lf_depth:%d, lf_entries:%d, "
+		print_gfs2("Directory block: lf_depth:%"PRIu16", lf_entries:%"PRIu16", "
 		           LEAF_HINT_FMTS
-			   "fmt:%d next=0x%llx (%d dirents).",
+			   "fmt:%"PRIu32" next=0x%"PRIx64" (%d dirents).",
 			   leaf->lf_depth, leaf->lf_entries,
 		           LEAF_HINT_FIELDS(leaf)
 			   leaf->lf_dirent_format,
@@ -330,12 +330,11 @@ static int display_leaf(struct iinfo *ind)
 				    line - start_line - 1 ==
 				    edit_row[dmode] - start_row[dmode]) {
 					COLORS_HIGHLIGHT;
-					sprintf(estring, "%llx",
-						(unsigned long long)ind->ii[0].dirent[d].block);
+					sprintf(estring, "%"PRIx64, ind->ii[0].dirent[d].block);
 					strcpy(edit_fmt, "%llx");
 				}
 			}
-			print_gfs2("%d/%d [%08x] %lld/%"PRId64" (0x%llx/0x%"PRIx64") +%"PRIu16": ",
+			print_gfs2("%d/%d [%08"PRIX32"] %"PRIu64"/%"PRIu64" (0x%"PRIx64"/0x%"PRIx64") +%"PRIu16": ",
 				   total_dirents, d + 1,
 				   ind->ii[0].dirent[d].dirent.de_hash,
 				   ind->ii[0].dirent[d].dirent.de_inum.no_formal_ino,
@@ -388,11 +387,9 @@ static void print_block_details(struct iinfo *ind, int level, int cur_height,
 	while (thisblk) {
 		/* read in the desired block */
 		if (pread(sbd.device_fd, tmpbuf, sbd.bsize, thisblk * sbd.bsize) != sbd.bsize) {
-			fprintf(stderr, "bad read: %s from %s:%d: block %lld "
-				"(0x%llx)\n", strerror(errno), __FUNCTION__,
-				__LINE__,
-				(unsigned long long)ind->ii[pndx].block,
-				(unsigned long long)ind->ii[pndx].block);
+			fprintf(stderr, "bad read: %s from %s:%d: block %"PRIu64
+				" (0x%"PRIx64")\n", strerror(errno), __FUNCTION__,
+				__LINE__, ind->ii[pndx].block, ind->ii[pndx].block);
 			exit(-1);
 		}
 		thisblk = 0;
@@ -428,9 +425,9 @@ static void print_block_details(struct iinfo *ind, int level, int cur_height,
 
 static void gfs_jindex_print(struct gfs_jindex *ji)
 {
-        pv((unsigned long long)ji, ji_addr, "%llu", "0x%llx");
-        pv(ji, ji_nsegment, "%u", "0x%x");
-        pv(ji, ji_pad, "%u", "0x%x");
+        pv(ji, ji_addr, "%"PRIu64, "0x%"PRIx64);
+        pv(ji, ji_nsegment, "%"PRIu32, "0x%"PRIx32);
+        pv(ji, ji_pad, "%"PRIu32, "0x%"PRIx32);
 }
 
 static int print_gfs_jindex(struct gfs2_inode *dij)
@@ -440,7 +437,7 @@ static int print_gfs_jindex(struct gfs2_inode *dij)
 	char jbuf[sizeof(struct gfs_jindex)];
 
 	start_line = line;
-	print_gfs2("Journal index entries found: %lld.",
+	print_gfs2("Journal index entries found: %"PRIu64".",
 		   dij->i_di.di_size / sizeof(struct gfs_jindex));
 	eol(0);
 	lines_per_row[dmode] = 4;
@@ -458,7 +455,7 @@ static int print_gfs_jindex(struct gfs2_inode *dij)
 			if (edit_row[dmode] == print_entry_ndx) {
 				COLORS_HIGHLIGHT;
 				strcpy(efield, "ji_addr");
-				sprintf(estring, "%llx", (unsigned long long)ji.ji_addr);
+				sprintf(estring, "%"PRIx64, ji.ji_addr);
 			}
 			print_gfs2("Journal #%d", print_entry_ndx);
 			eol(0);
@@ -482,7 +479,7 @@ static int print_gfs2_jindex(void)
 		if (strncmp(indirect->ii[0].dirent[d].filename, "journal", 7))
 			continue;
 		ip = lgfs2_inode_read(&sbd, indirect->ii[0].dirent[d].block);
-		print_gfs2("%s: 0x%-5"PRIx64" %lldMB ",
+		print_gfs2("%s: 0x%-5"PRIx64" %"PRIu64"MB ",
 			   indirect->ii[0].dirent[d].filename,
 			   indirect->ii[0].dirent[d].block,
 			   ip->i_di.di_size / 1048576);
@@ -509,7 +506,7 @@ static int parse_rindex(struct gfs2_inode *dip, int print_rindex)
 	char highlighted_addr[32];
 
 	start_line = line;
-	print_gfs2("RG index entries found: %lld.", dip->i_di.di_size /
+	print_gfs2("RG index entries found: %"PRIu64".", dip->i_di.di_size /
 		   sizeof(struct gfs2_rindex));
 	eol(0);
 	lines_per_row[dmode] = 6;
@@ -531,11 +528,11 @@ static int parse_rindex(struct gfs2_inode *dip, int print_rindex)
 			 termlines - start_line - 2)) {
 			if (edit_row[dmode] == print_entry_ndx) {
 				COLORS_HIGHLIGHT;
-				sprintf(highlighted_addr, "%llx", (unsigned long long)ri.ri_addr);
+				sprintf(highlighted_addr, "%"PRIx64, ri.ri_addr);
 			}
 			print_gfs2("RG #%d", print_entry_ndx);
 			if (!print_rindex)
-				print_gfs2(" located at: %llu (0x%llx)",
+				print_gfs2(" located at: %"PRIu64" (0x%"PRIx64")",
 					   ri.ri_addr, ri.ri_addr);
 			eol(0);
 			if (edit_row[dmode] == print_entry_ndx)
@@ -619,7 +616,7 @@ static int print_quota(struct gfs2_inode *diq)
 	
 	print_gfs2("quota file contents:");
 	eol(0);
-	print_gfs2("quota entries found: %lld.", diq->i_di.di_size / sizeof(q));
+	print_gfs2("quota entries found: %"PRIu64".", diq->i_di.di_size / sizeof(q));
 	eol(0);
 	for (i=0; ; i++) {
 		error = gfs2_readi(diq, (void *)&qbuf, i * sizeof(q), sizeof(qbuf));
diff --git a/gfs2/edit/gfs2hex.c b/gfs2/edit/gfs2hex.c
index 5e6760f2..5e79009a 100644
--- a/gfs2/edit/gfs2hex.c
+++ b/gfs2/edit/gfs2hex.c
@@ -372,10 +372,10 @@ static void gfs2_inum_print2(const char *title,struct gfs2_inum *no)
 	}
 	else
 		printf("  %s:",title);
-	pv2(no, no_formal_ino, "%llu", "0x%llx");
+	pv2(no, no_formal_ino, "%"PRIu64, "0x%"PRIx64);
 	if (!termlines)
 		printf("        addr:");
-	pv2(no, no_addr, "%llu", "0x%llx");
+	pv2(no, no_addr, "%"PRIu64, "0x%"PRIx64);
 }
 
 /**
@@ -388,15 +388,15 @@ static void gfs2_sb_print2(struct gfs2_sb *sbp2)
 
 	gfs2_meta_header_print(&sbp2->sb_header);
 
-	pv(sbp2, sb_fs_format, "%u", "0x%x");
-	pv(sbp2, sb_multihost_format, "%u", "0x%x");
+	pv(sbp2, sb_fs_format, "%"PRIu32, "0x%"PRIx32);
+	pv(sbp2, sb_multihost_format, "%"PRIu32, "0x%"PRIx32);
 
 	if (sbd.gfs1)
-		pv(sbd1, sb_flags, "%u", "0x%x");
-	pv(sbp2, sb_bsize, "%u", "0x%x");
-	pv(sbp2, sb_bsize_shift, "%u", "0x%x");
+		pv(sbd1, sb_flags, "%"PRIu32, "0x%"PRIx32);
+	pv(sbp2, sb_bsize, "%"PRIu32, "0x%"PRIx32);
+	pv(sbp2, sb_bsize_shift, "%"PRIu32, "0x%"PRIx32);
 	if (sbd.gfs1) {
-		pv(sbd1, sb_seg_size, "%u", "0x%x");
+		pv(sbd1, sb_seg_size, "%"PRIu32, "0x%"PRIx32);
 		gfs2_inum_print2("jindex ino", &sbd1->sb_jindex_di);
 		gfs2_inum_print2("rindex ino", &sbd1->sb_rindex_di);
 	}
@@ -438,14 +438,14 @@ static void gfs1_rgrp_in(struct gfs_rgrp *rgrp, const char *buf)
 static void gfs1_rgrp_print(struct gfs_rgrp *rg)
 {
         gfs2_meta_header_print(&rg->rg_header);
-        pv(rg, rg_flags, "%u", "0x%x");
-        pv(rg, rg_free, "%u", "0x%x");
-        pv(rg, rg_useddi, "%u", "0x%x");
-        pv(rg, rg_freedi, "%u", "0x%x");
+        pv(rg, rg_flags, "%"PRIu32, "0x%"PRIx32);
+        pv(rg, rg_free, "%"PRIu32, "0x%"PRIx32);
+        pv(rg, rg_useddi, "%"PRIu32, "0x%"PRIx32);
+        pv(rg, rg_freedi, "%"PRIu32, "0x%"PRIx32);
         gfs2_inum_print(&rg->rg_freedi_list);
 
-        pv(rg, rg_usedmeta, "%u", "0x%x");
-        pv(rg, rg_freemeta, "%u", "0x%x");
+        pv(rg, rg_usedmeta, "%"PRIu32, "0x%"PRIx32);
+        pv(rg, rg_freemeta, "%"PRIu32, "0x%"PRIx32);
 }
 
 int display_gfs2(char *buf)
diff --git a/gfs2/edit/journal.c b/gfs2/edit/journal.c
index 313f18f2..859919aa 100644
--- a/gfs2/edit/journal.c
+++ b/gfs2/edit/journal.c
@@ -534,7 +534,7 @@ void dump_journal(const char *journal, int tblk)
 			uint64_t o;
 			int bmap = 0;
 
-			print_gfs2("rgd: 0x%llx for 0x%x, ", rgd->ri.ri_addr,
+			print_gfs2("rgd: 0x%"PRIx64" for 0x%"PRIx32", ", rgd->ri.ri_addr,
 				   rgd->ri.ri_length);
 			o = tblk - rgd->ri.ri_data0;
 			if (o >= (rgd->bits->bi_start +
@@ -544,8 +544,7 @@ void dump_journal(const char *journal, int tblk)
 					* GFS2_NBBY;
 			bmap = o / sbd.sd_blocks_per_bitmap;
 			bitblk = rgd->ri.ri_addr + bmap;
-			print_gfs2("bitmap: %d, bitblk: 0x%llx", bmap,
-				   (unsigned long long)bitblk);
+			print_gfs2("bitmap: %d, bitblk: 0x%"PRIx64, bmap, bitblk);
 			eol(0);
 		}
 
@@ -597,8 +596,8 @@ void dump_journal(const char *journal, int tblk)
 				check_journal_wrap(lh1.lh_sequence,
 						   &highest_seq);
 				print_gfs2("0x%"PRIx64" (j+%4"PRIx64"): Log header: "
-					   "Flags:%x, Seq: 0x%llx, 1st: 0x%llx, "
-					   "tail: 0x%llx, last: 0x%llx",
+					   "Flags:%"PRIx32", Seq: 0x%"PRIx64", 1st: 0x%"PRIx64", "
+					   "tail: 0x%"PRIx64", last: 0x%"PRIx64,
 					   abs_block, jb + wrappt,
 					   lh1.lh_flags, lh1.lh_sequence,
 					   lh1.lh_first, lh1.lh_tail,
@@ -612,8 +611,8 @@ void dump_journal(const char *journal, int tblk)
 				lgfs2_field_str(flags_str, sizeof(flags_str),
 						buf, lh_flags_field,
 						(dmode == HEX_MODE));
-				print_gfs2("0x%"PRIx64" (j+%4"PRIx64"): Log header: Seq"
-					   ": 0x%llx, tail: 0x%x, blk: 0x%x [%s]",
+				print_gfs2("0x%"PRIx64" (j+%4"PRIx64"): Log header: Seq: "
+					   "0x%"PRIx64", tail: 0x%"PRIx32", blk: 0x%"PRIx32" [%s]",
 					   abs_block, ((jb + wrappt) % j_size)
 					   / sbd.bsize, lh.lh_sequence,
 					   lh.lh_tail, lh.lh_blkno,
diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index ac6e0cee..820df1d0 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -428,19 +428,17 @@ static int check_journal_seq_no(struct gfs2_inode *ip, int fix)
 			prev_seq = lh.lh_sequence;
 			continue;
 		}
-		log_err( _("Journal block %u (0x%x): sequence no. 0x%llx "
+		log_err(_("Journal block %"PRIu32" (0x%"PRIx32"): sequence no. 0x%"PRIx64" "
 			   "out of order.\n"), blk, blk, lh.lh_sequence);
-		log_info( _("Low: 0x%llx, High: 0x%llx, Prev: 0x%llx\n"),
-			  (unsigned long long)lowest_seq,
-			  (unsigned long long)highest_seq,
-			  (unsigned long long)prev_seq);
+		log_info(_("Low: 0x%"PRIx64", High: 0x%"PRIx64", Prev: 0x%"PRIx64"\n"),
+		         lowest_seq, highest_seq, prev_seq);
 		seq_errors++;
 		if (!fix)
 			continue;
 		highest_seq++;
 		lh.lh_sequence = highest_seq;
 		prev_seq = lh.lh_sequence;
-		log_warn( _("Renumbering it as 0x%llx\n"), lh.lh_sequence);
+		log_warn(_("Renumbering it as 0x%"PRIx64"\n"), lh.lh_sequence);
 		block_map(ip, blk, &new, &dblock, NULL, 0);
 		bh = bread(ip->i_sbd, dblock);
 		gfs2_log_header_out(&lh, bh->b_data);
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index 58dd23d3..17f2d6cd 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -1014,7 +1014,7 @@ static void peruse_system_dinode(struct gfs2_sbd *sdp, struct gfs2_dinode *di,
 	if (di->di_num.no_formal_ino == 2) {
 		if (sdp->sd_sb.sb_master_dir.no_addr)
 			return;
-		log_warn(_("Found system master directory at: 0x%llx.\n"),
+		log_warn(_("Found system master directory at: 0x%"PRIx64".\n"),
 			 di->di_num.no_addr);
 		sdp->sd_sb.sb_master_dir.no_addr = di->di_num.no_addr;
 		return;
@@ -1029,7 +1029,7 @@ static void peruse_system_dinode(struct gfs2_sbd *sdp, struct gfs2_dinode *di,
 	     (di->di_size % sizeof(struct gfs_jindex) == 0))) {
 		if (fix_md.jiinode || is_journal_copy(ip, bh))
 			goto out_discard_ip;
-		log_warn(_("Found system jindex file at: 0x%llx\n"),
+		log_warn(_("Found system jindex file at: 0x%"PRIx64"\n"),
 			 di->di_num.no_addr);
 		fix_md.jiinode = ip;
 	} else if (!sdp->gfs1 && is_dir(di, sdp->gfs1)) {
@@ -1043,8 +1043,8 @@ static void peruse_system_dinode(struct gfs2_sbd *sdp, struct gfs2_dinode *di,
 			}
 			fix_md.jiinode = child_ip;
 			sdp->sd_sb.sb_master_dir.no_addr = di->di_num.no_addr;
-			log_warn(_("Found system master directory at: "
-				   "0x%llx\n"), di->di_num.no_addr);
+			log_warn(_("Found system master directory at: 0x%"PRIx64"\n"),
+			         di->di_num.no_addr);
 			return;
 		}
 
@@ -1055,39 +1055,38 @@ static void peruse_system_dinode(struct gfs2_sbd *sdp, struct gfs2_dinode *di,
 			inode_put(&child_ip);
 			if (fix_md.pinode || is_journal_copy(ip, bh))
 				goto out_discard_ip;
-			log_warn(_("Found system per_node directory at: "
-				   "0x%llx\n"), ip->i_di.di_num.no_addr);
+			log_warn(_("Found system per_node directory at: 0x%"PRIx64"\n"),
+			         ip->i_di.di_num.no_addr);
 			fix_md.pinode = ip;
 			error = dir_search(ip, "..", 2, NULL, &inum);
 			if (!error && inum.no_addr) {
 				sdp->sd_sb.sb_master_dir.no_addr =
 					inum.no_addr;
-				log_warn(_("From per_node\'s \'..\' I "
-					   "backtracked the master directory "
-					   "to: 0x%llx\n"), inum.no_addr);
+				log_warn(_("From per_node's '..' master directory backtracked to: "
+					   "0x%"PRIx64"\n"), inum.no_addr);
 			}
 			return;
 		}
-		log_debug(_("Unknown system directory at block 0x%llx\n"),
+		log_debug(_("Unknown system directory at block 0x%"PRIx64"\n"),
 			  di->di_num.no_addr);
 		goto out_discard_ip;
 	} else if (!sdp->gfs1 && di->di_size == 8) {
 		if (fix_md.inum || is_journal_copy(ip, bh))
 			goto out_discard_ip;
 		fix_md.inum = ip;
-		log_warn(_("Found system inum file at: 0x%llx\n"),
+		log_warn(_("Found system inum file at: 0x%"PRIx64"\n"),
 			 di->di_num.no_addr);
 	} else if (di->di_size == 24) {
 		if (fix_md.statfs || is_journal_copy(ip, bh))
 			goto out_discard_ip;
 		fix_md.statfs = ip;
-		log_warn(_("Found system statfs file at: 0x%llx\n"),
+		log_warn(_("Found system statfs file at: 0x%"PRIx64"\n"),
 			 di->di_num.no_addr);
 	} else if ((di->di_size % 96) == 0) {
 		if (fix_md.riinode || is_journal_copy(ip, bh))
 			goto out_discard_ip;
 		fix_md.riinode = ip;
-		log_warn(_("Found system rindex file at: 0x%llx\n"),
+		log_warn(_("Found system rindex file at: 0x%"PRIx64"\n"),
 			 di->di_num.no_addr);
 	} else if (!fix_md.qinode && di->di_size >= 176 &&
 		   di->di_num.no_formal_ino >= 12 &&
@@ -1095,7 +1094,7 @@ static void peruse_system_dinode(struct gfs2_sbd *sdp, struct gfs2_dinode *di,
 		if (is_journal_copy(ip, bh))
 			goto out_discard_ip;
 		fix_md.qinode = ip;
-		log_warn(_("Found system quota file at: 0x%llx\n"),
+		log_warn(_("Found system quota file at: 0x%"PRIx64"\n"),
 			 di->di_num.no_addr);
 	} else {
 out_discard_ip:
@@ -1123,17 +1122,17 @@ static void peruse_user_dinode(struct gfs2_sbd *sdp, struct gfs2_dinode *di,
 		struct gfs2_buffer_head *root_bh;
 
 		if (di->di_num.no_addr == bh->b_blocknr) {
-			log_warn(_("Found the root directory at: 0x%llx.\n"),
+			log_warn(_("Found the root directory at: 0x%"PRIx64".\n"),
 				 di->di_num.no_addr);
 			sdp->sd_sb.sb_root_dir.no_addr = di->di_num.no_addr;
 			return;
 		}
-		log_warn(_("The root dinode should be at block 0x%llx but it "
+		log_warn(_("The root dinode should be at block 0x%"PRIx64" but it "
 			   "seems to be destroyed.\n"),
-			 (unsigned long long)di->di_num.no_addr);
+			 di->di_num.no_addr);
 		log_warn(_("Found a copy of the root directory in a journal "
-			   "at block: 0x%llx.\n"),
-			 (unsigned long long)bh->b_blocknr);
+			   "at block: 0x%"PRIx64".\n"),
+			 bh->b_blocknr);
 		if (!query(_("Do you want to replace the root dinode from the "
 			     "copy? (y/n)"))) {
 			log_err(_("Damaged root dinode not fixed.\n"));
@@ -1155,7 +1154,7 @@ static void peruse_user_dinode(struct gfs2_sbd *sdp, struct gfs2_dinode *di,
 		gfs2_lookupi(ip, "..", 2, &parent_ip);
 		if (parent_ip && parent_ip->i_di.di_num.no_addr ==
 		    ip->i_di.di_num.no_addr) {
-			log_warn(_("Found the root directory at: 0x%llx\n"),
+			log_warn(_("Found the root directory at: 0x%"PRIx64"\n"),
 				 ip->i_di.di_num.no_addr);
 			sdp->sd_sb.sb_root_dir.no_addr =
 				ip->i_di.di_num.no_addr;
@@ -1171,8 +1170,8 @@ static void peruse_user_dinode(struct gfs2_sbd *sdp, struct gfs2_dinode *di,
 	error = dir_search(ip, "..", 2, NULL, &inum);
 	if (!error && inum.no_addr && inum.no_addr < possible_root) {
 			possible_root = inum.no_addr;
-			log_debug(_("Found a possible root at: 0x%llx\n"),
-				  (unsigned long long)possible_root);
+			log_debug(_("Found a possible root at: 0x%"PRIx64"\n"),
+				  possible_root);
 	}
 	inode_put(&ip);
 }
@@ -1361,7 +1360,7 @@ static int sb_repair(struct gfs2_sbd *sdp)
 	/* Step 3 - Rebuild the lock protocol and file system table name */
 	if (query(_("Okay to fix the GFS2 superblock? (y/n)"))) {
 		struct gfs2_sb sb;
-		log_info(_("Found system master directory at: 0x%llx\n"),
+		log_info(_("Found system master directory at: 0x%"PRIx64"\n"),
 			 sdp->sd_sb.sb_master_dir.no_addr);
 		sdp->master_dir = lgfs2_inode_read(sdp,
 					     sdp->sd_sb.sb_master_dir.no_addr);
@@ -1371,7 +1370,7 @@ static int sb_repair(struct gfs2_sbd *sdp)
 		}
 		sdp->master_dir->i_di.di_num.no_addr =
 			sdp->sd_sb.sb_master_dir.no_addr;
-		log_info(_("Found the root directory at: 0x%llx\n"),
+		log_info(_("Found the root directory at: 0x%"PRIx64"\n"),
 			 sdp->sd_sb.sb_root_dir.no_addr);
 		sdp->md.rooti = lgfs2_inode_read(sdp,
 					   sdp->sd_sb.sb_root_dir.no_addr);
diff --git a/gfs2/fsck/lost_n_found.c b/gfs2/fsck/lost_n_found.c
index 4d5d52c8..ebe616af 100644
--- a/gfs2/fsck/lost_n_found.c
+++ b/gfs2/fsck/lost_n_found.c
@@ -61,11 +61,11 @@ static void add_dotdot(struct gfs2_inode *ip)
 			  bmodified(dip->i_bh);
 			}
 		} else {
-			log_debug(_("Directory (0x%llx)'s link to parent "
-				    "(0x%llx) had a formal inode discrepancy: "
-				    "was 0x%llx, expected 0x%llx\n"),
-				  (unsigned long long)ip->i_di.di_num.no_addr,
-				  (unsigned long long)di->dotdot_parent.no_addr,
+			log_debug(_("Directory (0x%"PRIx64")'s link to parent "
+				    "(0x%"PRIx64") had a formal inode discrepancy: "
+				    "was 0x%"PRIx64", expected 0x%"PRIx64"\n"),
+				  ip->i_di.di_num.no_addr,
+				  di->dotdot_parent.no_addr,
 				  di->dotdot_parent.no_formal_ino,
 				  dip->i_di.di_num.no_formal_ino);
 			log_debug(_("The parent directory was not changed.\n"));
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index 88fc4dc4..70549a3a 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -2209,11 +2209,10 @@ int pass1(struct gfs2_sbd *sdp)
 			goto out;
 		}
 		next = osi_next(n);
-		log_debug("Checking metadata in resource group #%llu\n",
-				 (unsigned long long)rg_count);
+		log_debug("Checking metadata in resource group #%"PRIu64"\n", rg_count);
 		rgd = (struct rgrp_tree *)n;
 		for (i = 0; i < rgd->ri.ri_length; i++) {
-			log_debug("rgrp block %lld (0x%llx) is now marked as 'rgrp data'\n",
+			log_debug("rgrp block %"PRIu64" (0x%"PRIx64") is now marked as 'rgrp data'\n",
 				   rgd->ri.ri_addr + i, rgd->ri.ri_addr + i);
 			if (gfs2_blockmap_set(bl, rgd->ri.ri_addr + i,
 					      GFS2_BLKST_USED)) {
diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index 19b8e70d..b6a047c3 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -1947,7 +1947,7 @@ static int check_pernode_for(int x, struct gfs2_inode *pernode, const char *fn,
 	else if (multiple && (ip->i_di.di_size % filelen))
 		valid_size = 0;
 	if (!valid_size) {
-		log_err(_("System file %s has an invalid size. Is %llu, "
+		log_err(_("System file %s has an invalid size. Is %"PRIu64", "
 			  "should be %llu.\n"), fn, ip->i_di.di_size, filelen);
 		if (!query( _("Rebuild the system file? (y/n) ")))
 			goto out_good;
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index 637e5271..cc7c9c9d 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -414,11 +414,8 @@ static uint64_t find_next_rgrp_dist(struct gfs2_sbd *sdp, uint64_t blk,
 			rgrp_dist++;
 		}
 		if (found) {
-			log_info( _("rgrp found at 0x%llx, length=%d, "
-				    "used=%llu, free=%d\n"),
-				  prevrgd->ri.ri_addr, length,
-				  (unsigned long long)used_blocks,
-				  free_blocks);
+			log_info(_("rgrp found at 0x%"PRIx64", length=%d, used=%"PRIu64", free=%d\n"),
+			         prevrgd->ri.ri_addr, length, used_blocks, free_blocks);
 			break;
 		}
 	}
@@ -686,11 +683,9 @@ static int rindex_rebuild(struct gfs2_sbd *sdp, int *num_rgs, int gfs_grow)
 	for (n = osi_first(&sdp->rgcalc), rgi = 0; n; n = next, rgi++) {
 		next = osi_next(n);
 		calc_rgd = (struct rgrp_tree *)n;
-                log_debug("%d: 0x%llx / %x / 0x%llx"
-			  " / 0x%x / 0x%x\n", rgi + 1,
-			  (unsigned long long)calc_rgd->ri.ri_addr,
-			  calc_rgd->ri.ri_length,
-			  calc_rgd->ri.ri_data0, calc_rgd->ri.ri_data, 
+                log_debug("%d: 0x%"PRIx64"/%"PRIx32"/0x%"PRIx64"/0x%"PRIx32"/0x%"PRIx32"\n",
+		          rgi + 1, calc_rgd->ri.ri_addr, calc_rgd->ri.ri_length,
+			  calc_rgd->ri.ri_data0, calc_rgd->ri.ri_data,
 			  calc_rgd->ri.ri_bitbytes);
         }
 	*num_rgs = number_of_rgs;
@@ -1138,16 +1133,14 @@ int rg_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 		if (actual->ri.ri_addr < expected->ri.ri_addr) {
 			n = next;
 			discrepancies++;
-			log_info(_("%d addr: 0x%llx < 0x%llx * mismatch\n"),
-				 rg + 1, actual->ri.ri_addr,
-				 expected->ri.ri_addr);
+			log_info(_("%d addr: 0x%"PRIx64" < 0x%"PRIx64" * mismatch\n"),
+				 rg + 1, actual->ri.ri_addr, expected->ri.ri_addr);
 			continue;
 		} else if (expected->ri.ri_addr < actual->ri.ri_addr) {
 			e = enext;
 			discrepancies++;
-			log_info(_("%d addr: 0x%llx > 0x%llx * mismatch\n"),
-				 rg + 1, actual->ri.ri_addr,
-				 expected->ri.ri_addr);
+			log_info(_("%d addr: 0x%"PRIx64" > 0x%"PRIx64" * mismatch\n"),
+				 rg + 1, actual->ri.ri_addr, expected->ri.ri_addr);
 			continue;
 		}
 		if (!ri_equal(actual->ri, expected->ri, ri_length) ||
@@ -1155,9 +1148,8 @@ int rg_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 		    !ri_equal(actual->ri, expected->ri, ri_data) ||
 		    !ri_equal(actual->ri, expected->ri, ri_bitbytes)) {
 			discrepancies++;
-			log_info(_("%d addr: 0x%llx 0x%llx * has mismatch\n"),
-				 rg + 1, actual->ri.ri_addr,
-				 expected->ri.ri_addr);
+			log_info(_("%d addr: 0x%"PRIx64" 0x%"PRIx64" * has mismatch\n"),
+				 rg + 1, actual->ri.ri_addr, expected->ri.ri_addr);
 		}
 		n = next;
 		e = enext;
@@ -1199,10 +1191,9 @@ int rg_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 		   damage, fill in a new one with the expected values. */
 		if (!n || /* end of actual rindex */
 		    expected->ri.ri_addr < actual->ri.ri_addr) {
-			log_err( _("Entry missing from rindex: 0x%llx\n"),
-				 (unsigned long long)expected->ri.ri_addr);
-			actual = rgrp_insert(&sdp->rgtree,
-					     expected->ri.ri_addr);
+			log_err(_("Entry missing from rindex: 0x%"PRIx64"\n"),
+			        expected->ri.ri_addr);
+			actual = rgrp_insert(&sdp->rgtree, expected->ri.ri_addr);
 			if (!actual) {
 				log_err(_("Out of memory!\n"));
 				break;
diff --git a/gfs2/libgfs2/ondisk.c b/gfs2/libgfs2/ondisk.c
index 0d68de8f..35a0b3db 100644
--- a/gfs2/libgfs2/ondisk.c
+++ b/gfs2/libgfs2/ondisk.c
@@ -57,8 +57,8 @@ void gfs2_inum_out(const struct gfs2_inum *no, char *buf)
 
 void gfs2_inum_print(const struct gfs2_inum *no)
 {
-	pv(no, no_formal_ino, "%llu", "0x%llx");
-	pv(no, no_addr, "%llu", "0x%llx");
+	pv(no, no_formal_ino, "%"PRIu64, "0x%"PRIx64);
+	pv(no, no_addr, "%"PRIu64, "0x%"PRIx64);
 }
 
 void gfs2_meta_header_in(struct gfs2_meta_header *mh, const char *buf)
@@ -83,9 +83,9 @@ void gfs2_meta_header_out(const struct gfs2_meta_header *mh, char *buf)
 
 void gfs2_meta_header_print(const struct gfs2_meta_header *mh)
 {
-	pv(mh, mh_magic, "0x%08X", NULL);
-	pv(mh, mh_type, "%u", "0x%x");
-	pv(mh, mh_format, "%u", "0x%x");
+	pv(mh, mh_magic, "0x%08"PRIX32, NULL);
+	pv(mh, mh_type, "%"PRIu32, "0x%"PRIx32);
+	pv(mh, mh_format, "%"PRIu32, "0x%"PRIx32);
 }
 
 void gfs2_sb_in(struct gfs2_sb *sb, char *buf)
@@ -144,11 +144,11 @@ void gfs2_sb_print(const struct gfs2_sb *sb)
 
 	gfs2_meta_header_print(&sb->sb_header);
 
-	pv(sb, sb_fs_format, "%u", "0x%x");
-	pv(sb, sb_multihost_format, "%u", "0x%x");
+	pv(sb, sb_fs_format, "%"PRIu32, "0x%"PRIx32);
+	pv(sb, sb_multihost_format, "%"PRIu32, "0x%"PRIx32);
 
-	pv(sb, sb_bsize, "%u", "0x%x");
-	pv(sb, sb_bsize_shift, "%u", "0x%x");
+	pv(sb, sb_bsize, "%"PRIu32, "0x%"PRIx32);
+	pv(sb, sb_bsize_shift, "%"PRIu32, "0x%"PRIx32);
 
 	gfs2_inum_print(&sb->sb_master_dir);
 	gfs2_inum_print(&sb->sb_root_dir);
@@ -191,13 +191,13 @@ void gfs2_rindex_out(const struct gfs2_rindex *ri, char *buf)
 
 void gfs2_rindex_print(const struct gfs2_rindex *ri)
 {
-	pv(ri, ri_addr, "%llu", "0x%llx");
-	pv(ri, ri_length, "%u", "0x%x");
+	pv(ri, ri_addr, "%"PRIu64, "0x%"PRIx64);
+	pv(ri, ri_length, "%"PRIu32, "0x%"PRIx32);
 
-	pv(ri, ri_data0, "%llu", "0x%llx");
-	pv(ri, ri_data, "%u", "0x%x");
+	pv(ri, ri_data0, "%"PRIu64, "0x%"PRIx64);
+	pv(ri, ri_data, "%"PRIu32, "0x%"PRIx32);
 
-	pv(ri, ri_bitbytes, "%u", "0x%x");
+	pv(ri, ri_bitbytes, "%"PRIu32, "0x%"PRIx32);
 }
 
 void gfs2_rgrp_in(struct gfs2_rgrp *rg, char *buf)
@@ -237,15 +237,15 @@ void gfs2_rgrp_out(const struct gfs2_rgrp *rg, char *buf)
 void gfs2_rgrp_print(const struct gfs2_rgrp *rg)
 {
 	gfs2_meta_header_print(&rg->rg_header);
-	pv(rg, rg_flags, "%u", "0x%x");
-	pv(rg, rg_free, "%u", "0x%x");
-	pv(rg, rg_dinodes, "%u", "0x%x");
-	pv(rg, rg_skip, "%u", "0x%x");
-	pv(rg, rg_igeneration, "%llu", "0x%llx");
-	pv(rg, rg_data0, "%llu", "0x%llx");
-	pv(rg, rg_data, "%u", "0x%x");
-	pv(rg, rg_bitbytes, "%u", "0x%x");
-	pv(rg, rg_crc, "%u", "0x%x");
+	pv(rg, rg_flags, "%"PRIu32, "0x%"PRIx32);
+	pv(rg, rg_free, "%"PRIu32, "0x%"PRIx32);
+	pv(rg, rg_dinodes, "%"PRIu32, "0x%"PRIx32);
+	pv(rg, rg_skip, "%"PRIu32, "0x%"PRIx32);
+	pv(rg, rg_igeneration, "%"PRIu64, "0x%"PRIx64);
+	pv(rg, rg_data0, "%"PRIu64, "0x%"PRIx64);
+	pv(rg, rg_data, "%"PRIu32, "0x%"PRIx32);
+	pv(rg, rg_bitbytes, "%"PRIu32, "0x%"PRIx32);
+	pv(rg, rg_crc, "%"PRIu32, "0x%"PRIx32);
 }
 
 void gfs2_quota_in(struct gfs2_quota *qu, char *buf)
@@ -270,9 +270,9 @@ void gfs2_quota_out(struct gfs2_quota *qu, char *buf)
 
 void gfs2_quota_print(const struct gfs2_quota *qu)
 {
-	pv(qu, qu_limit, "%llu", "0x%llx");
-	pv(qu, qu_warn, "%llu", "0x%llx");
-	pv(qu, qu_value, "%lld", "0x%llx");
+	pv(qu, qu_limit, "%"PRIu64, "0x%"PRIx64);
+	pv(qu, qu_warn, "%"PRIu64, "0x%"PRIx64);
+	pv(qu, qu_value, "%"PRIu64, "0x%"PRIx64);
 }
 
 void gfs2_dinode_in(struct gfs2_dinode *di, char *buf)
@@ -350,29 +350,29 @@ void gfs2_dinode_print(const struct gfs2_dinode *di)
 	gfs2_meta_header_print(&di->di_header);
 	gfs2_inum_print(&di->di_num);
 
-	pv(di, di_mode, "0%o", NULL);
-	pv(di, di_uid, "%u", "0x%x");
-	pv(di, di_gid, "%u", "0x%x");
-	pv(di, di_nlink, "%u", "0x%x");
-	pv(di, di_size, "%llu", "0x%llx");
-	pv(di, di_blocks, "%llu", "0x%llx");
-	pv(di, di_atime, "%lld", "0x%llx");
-	pv(di, di_mtime, "%lld", "0x%llx");
-	pv(di, di_ctime, "%lld", "0x%llx");
-	pv(di, di_major, "%u", "0x%llx");
-	pv(di, di_minor, "%u", "0x%llx");
+	pv(di, di_mode, "0%"PRIo32, NULL);
+	pv(di, di_uid, "%"PRIu32, "0x%"PRIx32);
+	pv(di, di_gid, "%"PRIu32, "0x%"PRIx32);
+	pv(di, di_nlink, "%"PRIu32, "0x%"PRIx32);
+	pv(di, di_size, "%"PRIu64, "0x%"PRIx64);
+	pv(di, di_blocks, "%"PRIu64, "0x%"PRIx64);
+	pv(di, di_atime, "%"PRIu64, "0x%"PRIx64);
+	pv(di, di_mtime, "%"PRIu64, "0x%"PRIx64);
+	pv(di, di_ctime, "%"PRIu64, "0x%"PRIx64);
+	pv(di, di_major, "%"PRIu32, "0x%"PRIx32);
+	pv(di, di_minor, "%"PRIu32, "0x%"PRIx32);
 
-	pv(di, di_goal_meta, "%llu", "0x%llx");
-	pv(di, di_goal_data, "%llu", "0x%llx");
+	pv(di, di_goal_meta, "%"PRIu64, "0x%"PRIx64);
+	pv(di, di_goal_data, "%"PRIu64, "0x%"PRIx64);
 
-	pv(di, di_flags, "0x%.8X", NULL);
-	pv(di, di_payload_format, "%u", "0x%x");
-	pv(di, di_height, "%u", "0x%x");
+	pv(di, di_flags, "0x%.8"PRIX32, NULL);
+	pv(di, di_payload_format, "%"PRIu32, "0x%"PRIx32);
+	pv(di, di_height, "%"PRIu16, "0x%"PRIx16);
 
-	pv(di, di_depth, "%u", "0x%x");
-	pv(di, di_entries, "%u", "0x%x");
+	pv(di, di_depth, "%"PRIu16, "0x%"PRIx16);
+	pv(di, di_entries, "%"PRIu32, "0x%"PRIx32);
 
-	pv(di, di_eattr, "%llu", "0x%llx");
+	pv(di, di_eattr, "%"PRIu64, "0x%"PRIx64);
 }
 
 void gfs2_dirent_in(struct gfs2_dirent *de, char *buf)
@@ -438,14 +438,14 @@ void gfs2_leaf_out(struct gfs2_leaf *lf, char *buf)
 void gfs2_leaf_print(const struct gfs2_leaf *lf)
 {
 	gfs2_meta_header_print(&lf->lf_header);
-	pv(lf, lf_depth, "%u", "0x%x");
-	pv(lf, lf_entries, "%u", "0x%x");
-	pv(lf, lf_dirent_format, "%u", "0x%x");
-	pv(lf, lf_next, "%llu", "0x%llx");
-	pv(lf, lf_inode, "%llu", "0x%llx");
-	pv(lf, lf_dist, "%u", "0x%x");
-	pv(lf, lf_nsec, "%u", "0x%x");
-	pv(lf, lf_sec, "%llu", "0x%llx");
+	pv(lf, lf_depth, "%"PRIu16, "0x%"PRIx16);
+	pv(lf, lf_entries, "%"PRIu16, "0x%"PRIx16);
+	pv(lf, lf_dirent_format, "%"PRIu32, "0x%"PRIx32);
+	pv(lf, lf_next, "%"PRIu64, "0x%"PRIx64);
+	pv(lf, lf_inode, "%"PRIu64, "0x%"PRIx64);
+	pv(lf, lf_dist, "%"PRIu32, "0x%"PRIx32);
+	pv(lf, lf_nsec, "%"PRIu32, "0x%"PRIx32);
+	pv(lf, lf_sec, "%"PRIu64, "0x%"PRIx64);
 }
 
 void gfs2_ea_header_in(struct gfs2_ea_header *ea, char *buf)
@@ -464,12 +464,12 @@ void gfs2_ea_header_print(const struct gfs2_ea_header *ea, char *name)
 {
 	char buf[GFS2_EA_MAX_NAME_LEN + 1];
 
-	pv(ea, ea_rec_len, "%u", "0x%x");
-	pv(ea, ea_data_len, "%u", "0x%x");
-	pv(ea, ea_name_len, "%u", "0x%x");
-	pv(ea, ea_type, "%u", "0x%x");
-	pv(ea, ea_flags, "%u", "0x%x");
-	pv(ea, ea_num_ptrs, "%u", "0x%x");
+	pv(ea, ea_rec_len, "%"PRIu32, "0x%"PRIx32);
+	pv(ea, ea_data_len, "%"PRIu32, "0x%"PRIx32);
+	pv(ea, ea_name_len, "%"PRIu8, "0x%"PRIx8);
+	pv(ea, ea_type, "%"PRIu8, "0x%"PRIx8);
+	pv(ea, ea_flags, "%"PRIu8, "0x%"PRIx8);
+	pv(ea, ea_num_ptrs, "%"PRIu8, "0x%"PRIx8);
 
 	memset(buf, 0, GFS2_EA_MAX_NAME_LEN + 1);
 	memcpy(buf, name, ea->ea_name_len);
@@ -523,21 +523,21 @@ void gfs2_log_header_out(struct gfs2_log_header *lh, char *buf)
 void gfs2_log_header_print(const struct gfs2_log_header *lh)
 {
 	gfs2_meta_header_print(&lh->lh_header);
-	pv(lh, lh_sequence, "%llu", "0x%llx");
-	pv(lh, lh_flags, "0x%.8X", NULL);
-	pv(lh, lh_tail, "%u", "0x%x");
-	pv(lh, lh_blkno, "%u", "0x%x");
-	pv(lh, lh_hash, "0x%.8X", NULL);
-	pv(lh, lh_crc, "0x%.8X", NULL);
-	pv(lh, lh_nsec, "%u", "0x%x");
-	pv(lh, lh_sec, "%llu", "0x%llx");
-	pv(lh, lh_addr, "%llu", "0x%llx");
-	pv(lh, lh_jinode, "%llu", "0x%llx");
-	pv(lh, lh_statfs_addr, "%llu", "0x%llx");
-	pv(lh, lh_quota_addr, "%llu", "0x%llx");
-	pv(lh, lh_local_total, "%lld", "0x%llx");
-	pv(lh, lh_local_free, "%lld", "0x%llx");
-	pv(lh, lh_local_dinodes, "%lld", "0x%llx");
+	pv(lh, lh_sequence, "%"PRIu64, "0x%"PRIx64);
+	pv(lh, lh_flags, "0x%.8"PRIX32, NULL);
+	pv(lh, lh_tail, "%"PRIu32, "0x%"PRIx32);
+	pv(lh, lh_blkno, "%"PRIu32, "0x%"PRIx32);
+	pv(lh, lh_hash, "0x%.8"PRIX32, NULL);
+	pv(lh, lh_crc, "0x%.8"PRIX32, NULL);
+	pv(lh, lh_nsec, "%"PRIu32, "0x%"PRIx32);
+	pv(lh, lh_sec, "%"PRIu64, "0x%"PRIx64);
+	pv(lh, lh_addr, "%"PRIu64, "0x%"PRIx64);
+	pv(lh, lh_jinode, "%"PRIu64, "0x%"PRIx64);
+	pv(lh, lh_statfs_addr, "%"PRIu64, "0x%"PRIx64);
+	pv(lh, lh_quota_addr, "%"PRIu64, "0x%"PRIx64);
+	pv(lh, lh_local_total, "%"PRId64, "0x%"PRIx64);
+	pv(lh, lh_local_free, "%"PRId64, "0x%"PRIx64);
+	pv(lh, lh_local_dinodes, "%"PRId64, "0x%"PRIx64);
 }
 
 void gfs2_log_descriptor_in(struct gfs2_log_descriptor *ld, char *buf)
@@ -569,10 +569,10 @@ void gfs2_log_descriptor_out(struct gfs2_log_descriptor *ld, char *buf)
 void gfs2_log_descriptor_print(const struct gfs2_log_descriptor *ld)
 {
 	gfs2_meta_header_print(&ld->ld_header);
-	pv(ld, ld_type, "%u", "0x%x");
-	pv(ld, ld_length, "%u", "0x%x");
-	pv(ld, ld_data1, "%u", "0x%x");
-	pv(ld, ld_data2, "%u", "0x%x");
+	pv(ld, ld_type, "%"PRIu32, "0x%"PRIx32);
+	pv(ld, ld_length, "%"PRIu32, "0x%"PRIx32);
+	pv(ld, ld_data1, "%"PRIu32, "0x%"PRIx32);
+	pv(ld, ld_data2, "%"PRIu32, "0x%"PRIx32);
 }
 
 void gfs2_statfs_change_in(struct gfs2_statfs_change *sc, char *buf)
@@ -595,9 +595,9 @@ void gfs2_statfs_change_out(struct gfs2_statfs_change *sc, char *buf)
 
 void gfs2_statfs_change_print(const struct gfs2_statfs_change *sc)
 {
-	pv(sc, sc_total, "%lld", "0x%llx");
-	pv(sc, sc_free, "%lld", "0x%llx");
-	pv(sc, sc_dinodes, "%lld", "0x%llx");
+	pv(sc, sc_total, "%"PRId64, "0x%"PRIx64);
+	pv(sc, sc_free, "%"PRId64, "0x%"PRIx64);
+	pv(sc, sc_dinodes, "%"PRId64, "0x%"PRIx64);
 }
 
 void gfs2_quota_change_in(struct gfs2_quota_change *qc, char *buf)
@@ -622,8 +622,8 @@ void gfs2_quota_change_out(struct gfs2_quota_change *qc, char *buf)
 
 void gfs2_quota_change_print(const struct gfs2_quota_change *qc)
 {
-	pv(qc, qc_change, "%lld", "0x%llx");
-	pv(qc, qc_flags, "0x%.8X", NULL);
-	pv(qc, qc_id, "%u", "0x%x");
+	pv(qc, qc_change, "%"PRId64, "0x%"PRIx64);
+	pv(qc, qc_flags, "0x%.8"PRIX32, NULL);
+	pv(qc, qc_id, "%"PRIu32, "0x%"PRIx32);
 }
 
-- 
2.30.2

