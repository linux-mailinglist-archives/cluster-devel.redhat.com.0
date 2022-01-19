Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1214938C4
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:44:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589074;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OMBvofUEz0ypPjc2yQXgSzDZqDW5FJEnNMBkGTdB7FI=;
	b=J1tayoxWGRNT0r9DEZ5fR6R1R4pnsolchn8/1oK1VYr6t+VpTxSD9rki0poY0a3K8HqKXu
	b5cbc/IFh2cXIwsy3ZW9j8odicnHgOWwps4bSDQm6i2CeQFLEtXPCSAkNPojqo0Z3Nvp5q
	C0ctqu/VynvZ0pJwaH+pJ1xSKBssbpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-LESX-XSmPJO5WaMViHTfCQ-1; Wed, 19 Jan 2022 05:44:31 -0500
X-MC-Unique: LESX-XSmPJO5WaMViHTfCQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D606196E6C6;
	Wed, 19 Jan 2022 10:44:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AE974F85E;
	Wed, 19 Jan 2022 10:44:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 069444BB7C;
	Wed, 19 Jan 2022 10:44:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAiR97024518 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:44:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8373D78B18; Wed, 19 Jan 2022 10:44:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5939778B10
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:44:26 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:08 +0000
Message-Id: <20220119104316.2489995-14-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 13/21] libgfs2: Namespace improvements -
	struct gfs2_inode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Rename to struct lgfs2_inode.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c   |  46 ++++++------
 gfs2/edit/extended.c          |  14 ++--
 gfs2/edit/hexedit.c           |   4 +-
 gfs2/edit/journal.c           |   8 +--
 gfs2/edit/savemeta.c          |   4 +-
 gfs2/fsck/afterpass1_common.c |  24 +++----
 gfs2/fsck/afterpass1_common.h |  12 ++--
 gfs2/fsck/fs_recovery.c       |  28 ++++----
 gfs2/fsck/fsck.h              |  10 +--
 gfs2/fsck/initialize.c        |  20 +++---
 gfs2/fsck/link.c              |   6 +-
 gfs2/fsck/link.h              |   4 +-
 gfs2/fsck/lost_n_found.c      |   8 +--
 gfs2/fsck/lost_n_found.h      |   4 +-
 gfs2/fsck/main.c              |   2 +-
 gfs2/fsck/metawalk.c          |  58 +++++++--------
 gfs2/fsck/metawalk.h          |  48 ++++++-------
 gfs2/fsck/pass1.c             | 112 ++++++++++++++---------------
 gfs2/fsck/pass1b.c            |  34 ++++-----
 gfs2/fsck/pass2.c             |  74 +++++++++----------
 gfs2/fsck/pass3.c             |   4 +-
 gfs2/fsck/pass4.c             |   6 +-
 gfs2/fsck/rgrepair.c          |   2 +-
 gfs2/fsck/util.c              |  10 +--
 gfs2/fsck/util.h              |  14 ++--
 gfs2/glocktop/glocktop.c      |   4 +-
 gfs2/libgfs2/fs_ops.c         |  98 ++++++++++++-------------
 gfs2/libgfs2/gfs1.c           |  22 +++---
 gfs2/libgfs2/lang.c           |   2 +-
 gfs2/libgfs2/libgfs2.h        | 130 +++++++++++++++++-----------------
 gfs2/libgfs2/ondisk.c         |   4 +-
 gfs2/libgfs2/recovery.c       |  14 ++--
 gfs2/libgfs2/rgrp.c           |   2 +-
 gfs2/libgfs2/structures.c     |  44 ++++++------
 gfs2/mkfs/main_mkfs.c         |  10 +--
 35 files changed, 443 insertions(+), 443 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index c6b388a6..21611b1a 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -186,7 +186,7 @@ static int convert_rgs(struct gfs2_sbd *sbp)
 /* This is similar to lgfs2_calc_tree_height in libgfs2 but at the point this      */
 /* function is called, I have the wrong (gfs1 not gfs2) constants in place.  */
 /* ------------------------------------------------------------------------- */
-static unsigned int calc_gfs2_tree_height(struct gfs2_inode *ip, uint64_t size)
+static unsigned int calc_gfs2_tree_height(struct lgfs2_inode *ip, uint64_t size)
 {
 	uint64_t *arr;
 	unsigned int max, height;
@@ -258,7 +258,7 @@ static void mp_gfs1_to_gfs2(struct gfs2_sbd *sbp, int gfs1_h, int gfs2_h,
 /*                interested in rearranging the metadata while leaving the   */
 /*                actual data blocks intact.                                 */
 /* ------------------------------------------------------------------------- */
-static void fix_metatree(struct gfs2_sbd *sbp, struct gfs2_inode *ip,
+static void fix_metatree(struct gfs2_sbd *sbp, struct lgfs2_inode *ip,
 		  struct blocklist *blk, __be64 *first_nonzero_ptr,
 		  unsigned int size)
 {
@@ -416,7 +416,7 @@ static void jdata_mp_gfs1_to_gfs2(struct gfs2_sbd *sbp, int gfs1_h, int gfs2_h,
 	}
 }
 
-static uint64_t fix_jdatatree(struct gfs2_sbd *sbp, struct gfs2_inode *ip,
+static uint64_t fix_jdatatree(struct gfs2_sbd *sbp, struct lgfs2_inode *ip,
 			      struct blocklist *blk, char *srcptr,
 			      unsigned int size)
 {
@@ -485,7 +485,7 @@ static uint64_t fix_jdatatree(struct gfs2_sbd *sbp, struct gfs2_inode *ip,
 	return block;
 }
 
-static int get_inode_metablocks(struct gfs2_sbd *sbp, struct gfs2_inode *ip, struct blocklist *blocks)
+static int get_inode_metablocks(struct gfs2_sbd *sbp, struct lgfs2_inode *ip, struct blocklist *blocks)
 {
 	struct blocklist *blk, *newblk;
 	struct gfs2_buffer_head *bh, *dibh = ip->i_bh;
@@ -569,7 +569,7 @@ static int get_inode_metablocks(struct gfs2_sbd *sbp, struct gfs2_inode *ip, str
 	return 0;
 }
 
-static int fix_ind_reg_or_dir(struct gfs2_sbd *sbp, struct gfs2_inode *ip, uint32_t di_height,
+static int fix_ind_reg_or_dir(struct gfs2_sbd *sbp, struct lgfs2_inode *ip, uint32_t di_height,
 		       uint32_t gfs2_hgt, struct blocklist *blk, struct blocklist *blocks)
 {
 	unsigned int len, bufsize;
@@ -611,7 +611,7 @@ static int fix_ind_reg_or_dir(struct gfs2_sbd *sbp, struct gfs2_inode *ip, uint3
 	return 0;
 }
 
-static int fix_ind_jdata(struct gfs2_sbd *sbp, struct gfs2_inode *ip, uint32_t di_height, 
+static int fix_ind_jdata(struct gfs2_sbd *sbp, struct lgfs2_inode *ip, uint32_t di_height, 
 		  uint32_t gfs2_hgt, uint64_t dinode_size, struct blocklist *blk, 
 		  struct blocklist *blocks)
 {
@@ -681,7 +681,7 @@ static int fix_ind_jdata(struct gfs2_sbd *sbp, struct gfs2_inode *ip, uint32_t d
 	return 0;
 }
 
-static int adjust_indirect_blocks(struct gfs2_sbd *sbp, struct gfs2_inode *ip)
+static int adjust_indirect_blocks(struct gfs2_sbd *sbp, struct lgfs2_inode *ip)
 {
 	uint64_t dinode_size;
 	uint32_t gfs2_hgt, di_height;
@@ -774,7 +774,7 @@ static int has_cdpn(const char *str)
 	return 0;
 }
 
-static int fix_cdpn_symlink(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh, struct gfs2_inode *ip)
+static int fix_cdpn_symlink(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh, struct lgfs2_inode *ip)
 {
 	char *linkptr = NULL;
 
@@ -809,7 +809,7 @@ static int fix_cdpn_symlink(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh, s
  * to fix the header. gfs1 uses gfs_indirect as the header which is 64 bytes
  * bigger than gfs2_meta_header that gfs2 uses.
  */
-static int fix_xattr(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh, struct gfs2_inode *ip)
+static int fix_xattr(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh, struct lgfs2_inode *ip)
 {
 	int len, old_hdr_sz, new_hdr_sz;
 	struct gfs2_buffer_head *eabh;
@@ -845,7 +845,7 @@ static int fix_xattr(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh, struct g
 /* ------------------------------------------------------------------------- */
 static int adjust_inode(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh)
 {
-	struct gfs2_inode *inode;
+	struct lgfs2_inode *inode;
 	struct inode_block *fixdir;
 	int inode_was_gfs1;
 
@@ -1102,7 +1102,7 @@ static int inode_renumber(struct gfs2_sbd *sbp, uint64_t root_inode_addr, osi_li
 static int fetch_inum(struct gfs2_sbd *sbp, uint64_t iblock,
 		      struct lgfs2_inum *inum, uint64_t *eablk)
 {
-	struct gfs2_inode *fix_inode;
+	struct lgfs2_inode *fix_inode;
 
 	fix_inode = lgfs2_inode_read(sbp, iblock);
 	if (fix_inode == NULL)
@@ -1124,7 +1124,7 @@ static int fetch_inum(struct gfs2_sbd *sbp, uint64_t iblock,
 /*                                                                           */
 /* Returns: 0 on success, -1 on failure, -EISDIR when dentmod marked DT_DIR  */
 /* ------------------------------------------------------------------------- */
-static int process_dirent_info(struct gfs2_inode *dip, struct gfs2_sbd *sbp,
+static int process_dirent_info(struct lgfs2_inode *dip, struct gfs2_sbd *sbp,
 			       struct gfs2_buffer_head *bh, int dir_entries, uint64_t dentmod)
 {
 	int error = 0;
@@ -1244,7 +1244,7 @@ static int process_dirent_info(struct gfs2_inode *dip, struct gfs2_sbd *sbp,
 /*                                                                           */
 /* Returns: 0 on success, -1 on failure                                      */
 /* ------------------------------------------------------------------------- */
-static int fix_one_directory_exhash(struct gfs2_sbd *sbp, struct gfs2_inode *dip, uint64_t dentmod)
+static int fix_one_directory_exhash(struct gfs2_sbd *sbp, struct lgfs2_inode *dip, uint64_t dentmod)
 {
 	struct gfs2_buffer_head *bh_leaf;
 	int error;
@@ -1298,7 +1298,7 @@ static int fix_one_directory_exhash(struct gfs2_sbd *sbp, struct gfs2_inode *dip
 
 static int process_directory(struct gfs2_sbd *sbp, uint64_t dirblock, uint64_t dentmod)
 {
-	struct gfs2_inode *dip;
+	struct lgfs2_inode *dip;
 	int error = 0;
 	/* read in the directory inode */
 	dip = lgfs2_inode_read(sbp, dirblock);
@@ -1383,7 +1383,7 @@ static int fix_cdpn_symlinks(struct gfs2_sbd *sbp, osi_list_t *cdpn_to_fix)
 		struct lgfs2_inum fix, dir;
 		struct inode_dir_block *l_fix;
 		struct gfs2_buffer_head *bh = NULL;
-		struct gfs2_inode *fix_inode;
+		struct lgfs2_inode *fix_inode;
 		uint64_t eablk;
 
 		l_fix = osi_list_entry(tmp, struct inode_dir_block, list);
@@ -1434,7 +1434,7 @@ static int fix_cdpn_symlinks(struct gfs2_sbd *sbp, osi_list_t *cdpn_to_fix)
 /* ------------------------------------------------------------------------- */
 static int read_gfs1_jiindex(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip = sdp->md.jiinode;
+	struct lgfs2_inode *ip = sdp->md.jiinode;
 	char buf[sizeof(struct gfs_jindex)];
 	unsigned int j;
 	int error=0;
@@ -1896,7 +1896,7 @@ static int journ_space_to_rg(struct gfs2_sbd *sdp)
 /* ------------------------------------------------------------------------- */
 static void update_inode_file(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip = sdp->md.inum;
+	struct lgfs2_inode *ip = sdp->md.inum;
 	__be64 buf;
 	int count;
 
@@ -1915,7 +1915,7 @@ static void update_inode_file(struct gfs2_sbd *sdp)
  */
 static void write_statfs_file(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip = sdp->md.statfs;
+	struct lgfs2_inode *ip = sdp->md.statfs;
 	struct gfs2_statfs_change sc;
 	int count;
 
@@ -1970,7 +1970,7 @@ static int conv_build_jindex(struct gfs2_sbd *sdp)
 	}
 
 	sdp->md.journal = malloc(sdp->md.journals *
-				 sizeof(struct gfs2_inode *));
+				 sizeof(struct lgfs2_inode *));
 	if (sdp->md.journal == NULL) {
 		return errno;
 	}
@@ -2088,7 +2088,7 @@ static int check_fit(struct gfs2_sbd *sdp)
 
 static int build_per_node(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *per_node;
+	struct lgfs2_inode *per_node;
 	unsigned int j;
 
 	per_node = lgfs2_createi(sdp->master_dir, "per_node", S_IFDIR | 0700,
@@ -2098,7 +2098,7 @@ static int build_per_node(struct gfs2_sbd *sdp)
 		return -1;
 	}
 	for (j = 0; j < sdp->md.journals; j++) {
-		struct gfs2_inode *ip;
+		struct lgfs2_inode *ip;
 
 		ip = lgfs2_build_inum_range(per_node, j);
 		if (ip == NULL) {
@@ -2136,7 +2136,7 @@ static int build_per_node(struct gfs2_sbd *sdp)
 static void copy_quotas(struct gfs2_sbd *sdp)
 {
 	struct lgfs2_inum inum;
-	struct gfs2_inode *oq_ip, *nq_ip;
+	struct lgfs2_inode *oq_ip, *nq_ip;
 	int err;
 
 	err = lgfs2_lookupi(sdp->master_dir, "quota", 5, &nq_ip);
@@ -2295,7 +2295,7 @@ int main(int argc, char **argv)
 	/* Create our system files and directories.       */
 	/* ---------------------------------------------- */
 	if (!error) {
-		struct gfs2_inode *ip;
+		struct lgfs2_inode *ip;
 		int jreduce = 0;
 
 		/* Now we've got to treat it as a gfs2 file system */
diff --git a/gfs2/edit/extended.c b/gfs2/edit/extended.c
index ee410220..8aed9fa9 100644
--- a/gfs2/edit/extended.c
+++ b/gfs2/edit/extended.c
@@ -421,7 +421,7 @@ static void print_block_details(struct iinfo *ind, int level, int cur_height,
 	free(more_indir);
 }
 
-static int print_gfs_jindex(struct gfs2_inode *dij)
+static int print_gfs_jindex(struct lgfs2_inode *dij)
 {
 	int error, start_line;
 	struct gfs_jindex *ji;
@@ -464,7 +464,7 @@ static int print_gfs2_jindex(void)
 {
 	int d, error;
 	struct lgfs2_log_header head;
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 
 	for (d = 0; d < indirect->ii[0].dirents; d++) {
 		if (strncmp(indirect->ii[0].dirent[d].filename, "journal", 7))
@@ -489,7 +489,7 @@ static int print_gfs2_jindex(void)
 	return 0;
 }
 
-static int parse_rindex(struct gfs2_inode *dip, int print_rindex)
+static int parse_rindex(struct lgfs2_inode *dip, int print_rindex)
 {
 	int error, start_line;
 	struct gfs2_rindex ri;
@@ -550,7 +550,7 @@ static int parse_rindex(struct gfs2_inode *dip, int print_rindex)
 	return error;
 }
 
-static int print_inum(struct gfs2_inode *dii)
+static int print_inum(struct lgfs2_inode *dii)
 {
 	uint64_t inodenum;
 	__be64 inum;
@@ -573,7 +573,7 @@ static int print_inum(struct gfs2_inode *dii)
 	return 0;
 }
 
-static int print_statfs(struct gfs2_inode *dis)
+static int print_statfs(struct lgfs2_inode *dis)
 {
 	struct gfs2_statfs_change sc;
 	int rc;
@@ -595,7 +595,7 @@ static int print_statfs(struct gfs2_inode *dis)
 	return 0;
 }
 
-static int print_quota(struct gfs2_inode *diq)
+static int print_quota(struct lgfs2_inode *diq)
 {
 	struct gfs2_quota q;
 	int i, error;
@@ -622,7 +622,7 @@ static int print_quota(struct gfs2_inode *diq)
 
 int display_extended(void)
 {
-	struct gfs2_inode *tmp_inode;
+	struct lgfs2_inode *tmp_inode;
 	struct gfs2_buffer_head *tmp_bh;
 
 	dsplines = termlines - line - 1;
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index 3415b41f..f2c54b04 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -700,7 +700,7 @@ static void rgcount(void)
 /* ------------------------------------------------------------------------ */
 /* find_rgrp_block - locate the block for a given rgrp number               */
 /* ------------------------------------------------------------------------ */
-static uint64_t find_rgrp_block(struct gfs2_inode *dif, int rg)
+static uint64_t find_rgrp_block(struct lgfs2_inode *dif, int rg)
 {
 	int amt;
 	struct gfs2_rindex ri;
@@ -727,7 +727,7 @@ static uint64_t find_rgrp_block(struct gfs2_inode *dif, int rg)
 static uint64_t get_rg_addr(int rgnum)
 {
 	uint64_t rgblk = 0, gblock;
-	struct gfs2_inode *riinode;
+	struct lgfs2_inode *riinode;
 
 	if (sbd.gfs1)
 		gblock = sbd.sd_rindex_di.in_addr;
diff --git a/gfs2/edit/journal.c b/gfs2/edit/journal.c
index 2bc94514..b083e6dd 100644
--- a/gfs2/edit/journal.c
+++ b/gfs2/edit/journal.c
@@ -54,7 +54,7 @@ uint64_t find_journal_block(const char *journal, uint64_t *j_size)
 		do_dinode_extended(jindex_bh->b_data); /* parse dir. */
 
 	if (sbd.gfs1) {
-		struct gfs2_inode *jiinode;
+		struct lgfs2_inode *jiinode;
 		struct gfs_jindex jidx;
 
 		jiinode = lgfs2_inode_get(&sbd, jindex_bh);
@@ -102,7 +102,7 @@ static void check_journal_wrap(uint64_t seq, uint64_t *highest_seq)
  * fsck_readi - same as libgfs2's lgfs2_readi, but sets absolute block #
  *              of the first bit of data read.
  */
-static int fsck_readi(struct gfs2_inode *ip, void *rbuf, uint64_t roffset,
+static int fsck_readi(struct lgfs2_inode *ip, void *rbuf, uint64_t roffset,
 	       unsigned int size, uint64_t *abs_block)
 {
 	struct gfs2_sbd *sdp;
@@ -317,7 +317,7 @@ static int is_wrap_pt(void *buf, uint64_t *highest_seq)
  * find_wrap_pt - figure out where a journal wraps
  * Returns: The wrap point, in bytes
  */
-static uint64_t find_wrap_pt(struct gfs2_inode *ji, char *jbuf, uint64_t jblock, uint64_t j_size)
+static uint64_t find_wrap_pt(struct lgfs2_inode *ji, char *jbuf, uint64_t jblock, uint64_t j_size)
 {
 	uint64_t jb = 0;
 	uint64_t highest_seq = 0;
@@ -505,7 +505,7 @@ void dump_journal(const char *journal, uint64_t tblk)
 	struct gfs2_buffer_head *j_bh = NULL;
 	uint64_t jblock, j_size, jb, abs_block, saveblk, wrappt = 0;
 	int start_line, journal_num;
-	struct gfs2_inode *j_inode = NULL;
+	struct lgfs2_inode *j_inode = NULL;
 	int ld_blocks = 0, offset_from_ld = 0;
 	uint64_t tblk_off = 0, bblk_off = 0, bitblk = 0;
 	uint64_t highest_seq = 0;
diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index ffb11342..aa4c1296 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -266,7 +266,7 @@ static int insert_per_node_lookup(uint64_t blk)
 static int init_per_node_lookup(void)
 {
 	int i;
-	struct gfs2_inode *per_node_di;
+	struct lgfs2_inode *per_node_di;
 
 	if (sbd.gfs1)
 		return FALSE;
@@ -945,7 +945,7 @@ static void get_journal_inode_blocks(void)
 	for (journal = 0; ; journal++) { /* while journals exist */
 		uint64_t jblock;
 		int amt;
-		struct gfs2_inode *j_inode = NULL;
+		struct lgfs2_inode *j_inode = NULL;
 
 		if (sbd.gfs1) {
 			struct gfs_jindex *ji;
diff --git a/gfs2/fsck/afterpass1_common.c b/gfs2/fsck/afterpass1_common.c
index 04249e10..6ce2dfd2 100644
--- a/gfs2/fsck/afterpass1_common.c
+++ b/gfs2/fsck/afterpass1_common.c
@@ -22,7 +22,7 @@
  *
  * Returns: 1 if there are any remaining references to this block, else 0.
  */
-static int find_remove_dup(struct gfs2_inode *ip, uint64_t block,
+static int find_remove_dup(struct lgfs2_inode *ip, uint64_t block,
 			   const char *btype, int *removed_last_meta)
 {
 	struct duptree *dt;
@@ -73,7 +73,7 @@ more_refs:
  * If it has been identified as duplicate, remove the duplicate reference.
  * If all duplicate references have been removed, delete the block.
  */
-static int delete_block_if_notdup(struct gfs2_inode *ip, uint64_t block,
+static int delete_block_if_notdup(struct lgfs2_inode *ip, uint64_t block,
 				  struct gfs2_buffer_head **bh,
 				  const char *btype, int *was_duplicate,
 				  void *private)
@@ -109,7 +109,7 @@ static int delete_block_if_notdup(struct gfs2_inode *ip, uint64_t block,
 	return META_IS_GOOD;
 }
 
-static int remove_dentry(struct gfs2_inode *ip, struct gfs2_dirent *dent,
+static int remove_dentry(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			 struct gfs2_dirent *prev_de,
 			 struct gfs2_buffer_head *bh,
 			 char *filename, uint32_t *count, int *lindex,
@@ -135,7 +135,7 @@ int remove_dentry_from_dir(struct gfs2_sbd *sdp, uint64_t dir,
 			   uint64_t dentryblock)
 {
 	struct metawalk_fxns remove_dentry_fxns = {0};
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	int q;
 	int error;
 
@@ -169,7 +169,7 @@ int remove_dentry_from_dir(struct gfs2_sbd *sdp, uint64_t dir,
 int delete_metadata(struct iptr iptr, struct gfs2_buffer_head **bh, int h, int *is_valid,
 		    int *was_duplicate, void *private)
 {
-	struct gfs2_inode *ip = iptr.ipt_ip;
+	struct lgfs2_inode *ip = iptr.ipt_ip;
 	uint64_t block = iptr_block(iptr);
 
 	*is_valid = 1;
@@ -178,13 +178,13 @@ int delete_metadata(struct iptr iptr, struct gfs2_buffer_head **bh, int h, int *
 				      was_duplicate, private);
 }
 
-int delete_leaf(struct gfs2_inode *ip, uint64_t block, void *private)
+int delete_leaf(struct lgfs2_inode *ip, uint64_t block, void *private)
 {
 	return delete_block_if_notdup(ip, block, NULL, _("leaf"), NULL,
 				      private);
 }
 
-int delete_data(struct gfs2_inode *ip, uint64_t metablock,
+int delete_data(struct lgfs2_inode *ip, uint64_t metablock,
 		uint64_t block, void *private, struct gfs2_buffer_head *bh,
 		__be64 *ptr)
 {
@@ -192,7 +192,7 @@ int delete_data(struct gfs2_inode *ip, uint64_t metablock,
 				      private);
 }
 
-static int del_eattr_generic(struct gfs2_inode *ip, uint64_t block,
+static int del_eattr_generic(struct lgfs2_inode *ip, uint64_t block,
 			     uint64_t parent, struct gfs2_buffer_head **bh,
 			     void *private, const char *eatype)
 {
@@ -223,21 +223,21 @@ static int del_eattr_generic(struct gfs2_inode *ip, uint64_t block,
 	return ret;
 }
 
-int delete_eattr_indir(struct gfs2_inode *ip, uint64_t block, uint64_t parent,
+int delete_eattr_indir(struct lgfs2_inode *ip, uint64_t block, uint64_t parent,
 		       struct gfs2_buffer_head **bh, void *private)
 {
 	return del_eattr_generic(ip, block, parent, bh, private,
 				 _("extended attribute"));
 }
 
-int delete_eattr_leaf(struct gfs2_inode *ip, uint64_t block, uint64_t parent,
+int delete_eattr_leaf(struct lgfs2_inode *ip, uint64_t block, uint64_t parent,
 		      struct gfs2_buffer_head **bh, void *private)
 {
 	return del_eattr_generic(ip, block, parent, bh, private,
 				 _("indirect extended attribute"));
 }
 
-int delete_eattr_entry(struct gfs2_inode *ip, struct gfs2_buffer_head *leaf_bh,
+int delete_eattr_entry(struct lgfs2_inode *ip, struct gfs2_buffer_head *leaf_bh,
 		       struct gfs2_ea_header *ea_hdr,
 		       struct gfs2_ea_header *ea_hdr_prev, void *private)
 {
@@ -277,7 +277,7 @@ int delete_eattr_entry(struct gfs2_inode *ip, struct gfs2_buffer_head *leaf_bh,
 	return 0;
 }
 
-int delete_eattr_extentry(struct gfs2_inode *ip, int i, __be64 *ea_data_ptr,
+int delete_eattr_extentry(struct lgfs2_inode *ip, int i, __be64 *ea_data_ptr,
 			  struct gfs2_buffer_head *leaf_bh, uint32_t tot_ealen,
 			  struct gfs2_ea_header *ea_hdr,
 			  struct gfs2_ea_header *ea_hdr_prev, void *private)
diff --git a/gfs2/fsck/afterpass1_common.h b/gfs2/fsck/afterpass1_common.h
index 51cb2140..7b5fda25 100644
--- a/gfs2/fsck/afterpass1_common.h
+++ b/gfs2/fsck/afterpass1_common.h
@@ -6,20 +6,20 @@
 
 extern int delete_metadata(struct iptr iptr, struct gfs2_buffer_head **bh, int h, int *is_valid,
 			   int *was_duplicate, void *private);
-extern int delete_leaf(struct gfs2_inode *ip, uint64_t block, void *private);
-extern int delete_data(struct gfs2_inode *ip, uint64_t metablock,
+extern int delete_leaf(struct lgfs2_inode *ip, uint64_t block, void *private);
+extern int delete_data(struct lgfs2_inode *ip, uint64_t metablock,
 		       uint64_t block, void *private,
 		       struct gfs2_buffer_head *bh, __be64 *ptr);
-extern int delete_eattr_indir(struct gfs2_inode *ip, uint64_t block, uint64_t parent,
+extern int delete_eattr_indir(struct lgfs2_inode *ip, uint64_t block, uint64_t parent,
 		       struct gfs2_buffer_head **bh, void *private);
-extern int delete_eattr_leaf(struct gfs2_inode *ip, uint64_t block, uint64_t parent,
+extern int delete_eattr_leaf(struct lgfs2_inode *ip, uint64_t block, uint64_t parent,
 		      struct gfs2_buffer_head **bh, void *private);
-extern int delete_eattr_entry(struct gfs2_inode *ip,
+extern int delete_eattr_entry(struct lgfs2_inode *ip,
 			      struct gfs2_buffer_head *leaf_bh,
 			      struct gfs2_ea_header *ea_hdr,
 			      struct gfs2_ea_header *ea_hdr_prev,
 			      void *private);
-extern int delete_eattr_extentry(struct gfs2_inode *ip, int i,
+extern int delete_eattr_extentry(struct lgfs2_inode *ip, int i,
 				 __be64 *ea_data_ptr,
 				 struct gfs2_buffer_head *leaf_bh,
 				 uint32_t tot_ealen,
diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index 4a2d1259..c5f82e47 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -121,7 +121,7 @@ static void refresh_rgrp(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 	}
 }
 
-static int buf_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
+static int buf_lo_scan_elements(struct lgfs2_inode *ip, unsigned int start,
 				struct gfs2_log_descriptor *ld, __be64 *ptr,
 				int pass)
 {
@@ -182,7 +182,7 @@ static int buf_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 	return error;
 }
 
-static int revoke_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
+static int revoke_lo_scan_elements(struct lgfs2_inode *ip, unsigned int start,
 				   struct gfs2_log_descriptor *ld, __be64 *ptr,
 				   int pass)
 {
@@ -232,7 +232,7 @@ static int revoke_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 	return 0;
 }
 
-static int databuf_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
+static int databuf_lo_scan_elements(struct lgfs2_inode *ip, unsigned int start,
 				    struct gfs2_log_descriptor *ld,
 				    __be64 *ptr, int pass)
 {
@@ -298,7 +298,7 @@ static int databuf_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
  * Returns: errno
  */
 
-static int foreach_descriptor(struct gfs2_inode *ip, unsigned int start,
+static int foreach_descriptor(struct lgfs2_inode *ip, unsigned int start,
 		       unsigned int end, int pass)
 {
 	struct gfs2_buffer_head *bh;
@@ -385,7 +385,7 @@ static int foreach_descriptor(struct gfs2_inode *ip, unsigned int start,
  *
  * Returns: The number of sequencing errors (hopefully none).
  */
-static int check_journal_seq_no(struct gfs2_inode *ip, int fix)
+static int check_journal_seq_no(struct lgfs2_inode *ip, int fix)
 {
 	int error = 0, wrapped = 0;
 	uint32_t jd_blocks = ip->i_size / ip->i_sbd->sd_bsize;
@@ -476,7 +476,7 @@ int preen_is_safe(struct gfs2_sbd *sdp, int preen, int force_check)
  * Returns: errno
  */
 
-static int gfs2_recover_journal(struct gfs2_inode *ip, int j, int preen,
+static int gfs2_recover_journal(struct lgfs2_inode *ip, int j, int preen,
 				int force_check, int *was_clean)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -609,7 +609,7 @@ reinit:
 
 /* We can't use the rangecheck function from pass1 because we haven't gone
  * through initialization properly yet. */
-static int rangecheck_jblock(struct gfs2_inode *ip, uint64_t block)
+static int rangecheck_jblock(struct lgfs2_inode *ip, uint64_t block)
 {
 	if((block > ip->i_sbd->fssize) || (block <= LGFS2_SB_ADDR(ip->i_sbd))) {
 		log_info( _("Bad block pointer (out of range) found in "
@@ -623,7 +623,7 @@ static int rangecheck_jblock(struct gfs2_inode *ip, uint64_t block)
 static int rangecheck_jmeta(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
                             int *is_valid, int *was_duplicate, void *private)
 {
-	struct gfs2_inode *ip = iptr.ipt_ip;
+	struct lgfs2_inode *ip = iptr.ipt_ip;
 	uint64_t block = iptr_block(iptr);
 	int rc;
 
@@ -648,7 +648,7 @@ static int rangecheck_jmeta(struct iptr iptr, struct gfs2_buffer_head **bh, int
 	return rc;
 }
 
-static int rangecheck_jdata(struct gfs2_inode *ip, uint64_t metablock,
+static int rangecheck_jdata(struct lgfs2_inode *ip, uint64_t metablock,
 			    uint64_t block, void *private,
 			    struct gfs2_buffer_head *bh, __be64 *ptr)
 {
@@ -737,7 +737,7 @@ int replay_journals(struct gfs2_sbd *sdp, int preen, int force_check,
  */
 int ji_update(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *jip, *ip = sdp->md.jiinode;
+	struct lgfs2_inode *jip, *ip = sdp->md.jiinode;
 	char journal_name[JOURNAL_NAME_SIZE];
 	int i, error;
 	char buf[sizeof(struct gfs_jindex)];
@@ -759,7 +759,7 @@ int ji_update(struct gfs2_sbd *sdp)
 		sdp->md.journals = ip->i_entries - 2;
 
 	if (!(sdp->md.journal = calloc(sdp->md.journals,
-				       sizeof(struct gfs2_inode *)))) {
+				       sizeof(struct lgfs2_inode *)))) {
 		log_err(_("Unable to allocate journal index\n"));
 		return -1;
 	}
@@ -808,7 +808,7 @@ static void bad_journalname(const char *filename, int len)
  * This function makes sure the directory entries of the jindex are valid.
  * If they're not '.' or '..' they better have the form journalXXX.
  */
-static int check_jindex_dent(struct gfs2_inode *ip, struct gfs2_dirent *dent,
+static int check_jindex_dent(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			     struct gfs2_dirent *prev_de,
 			     struct gfs2_buffer_head *bh, char *filename,
 			     uint32_t *count, int *lindex, void *priv)
@@ -850,14 +850,14 @@ static struct metawalk_fxns jindex_check_fxns = {
 
 int build_jindex(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *jindex;
+	struct lgfs2_inode *jindex;
 
 	jindex = lgfs2_createi(sdp->master_dir, "jindex", S_IFDIR | 0700,
 			 GFS2_DIF_SYSTEM);
 	if (jindex == NULL) {
 		return errno;
 	}
-	sdp->md.journal = malloc(sdp->md.journals * sizeof(struct gfs2_inode *));
+	sdp->md.journal = malloc(sdp->md.journals * sizeof(struct lgfs2_inode *));
 	for (unsigned j = 0; j < sdp->md.journals; j++) {
 		int ret = lgfs2_build_journal(sdp, j, jindex);
 		if (ret)
diff --git a/gfs2/fsck/fsck.h b/gfs2/fsck/fsck.h
index 055ae975..6bfb6321 100644
--- a/gfs2/fsck/fsck.h
+++ b/gfs2/fsck/fsck.h
@@ -108,11 +108,11 @@ enum rgindex_trust_level { /* how far can we trust our RG index? */
 			   must have been converted from gfs2_convert. */
 };
 
-extern struct gfs2_inode *fsck_load_inode(struct gfs2_sbd *sdp, uint64_t block);
-extern struct gfs2_inode *fsck_inode_get(struct gfs2_sbd *sdp,
+extern struct lgfs2_inode *fsck_load_inode(struct gfs2_sbd *sdp, uint64_t block);
+extern struct lgfs2_inode *fsck_inode_get(struct gfs2_sbd *sdp,
 					 struct rgrp_tree *rgd,
 					 struct gfs2_buffer_head *bh);
-extern void fsck_inode_put(struct gfs2_inode **ip);
+extern void fsck_inode_put(struct lgfs2_inode **ip);
 
 extern int initialize(struct gfs2_sbd *sdp, int force_check, int preen,
 		      int *all_clean);
@@ -143,7 +143,7 @@ struct gfs2_options {
 };
 
 extern struct gfs2_options opts;
-extern struct gfs2_inode *lf_dip; /* Lost and found directory inode */
+extern struct lgfs2_inode *lf_dip; /* Lost and found directory inode */
 extern int lf_was_created;
 extern uint64_t last_fs_block, last_reported_block;
 extern int64_t last_reported_fblock;
@@ -173,7 +173,7 @@ static inline int rgrp_contains_block(struct rgrp_tree *rgd, uint64_t blk)
 	return 1;
 }
 
-static inline int valid_block_ip(struct gfs2_inode *ip, uint64_t blk)
+static inline int valid_block_ip(struct lgfs2_inode *ip, uint64_t blk)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	struct rgrp_tree *rgd = ip->i_rgd;
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index 2740fa7d..16e7f065 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -284,7 +284,7 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 				         diblock, diblock);
 				bh = lgfs2_bread(sdp, diblock);
 				if (!lgfs2_check_meta(bh->b_data, GFS2_METATYPE_DI)) {
-					struct gfs2_inode *ip =
+					struct lgfs2_inode *ip =
 						fsck_inode_get(sdp, rgd, bh);
 					if (ip->i_blocks > 1) {
 						blks_2free += ip->i_blocks - 1;
@@ -544,7 +544,7 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 			exit(FSCK_ERROR);
 		}
 	} else {
-		struct gfs2_inode *rip = lgfs2_build_rindex(sdp);
+		struct lgfs2_inode *rip = lgfs2_build_rindex(sdp);
 		if (rip == NULL) {
 			log_crit(_("Error building rindex inode: %s\n"), strerror(errno));
 			exit(FSCK_ERROR);
@@ -562,7 +562,7 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 			exit(FSCK_ERROR);
 		}
 	} else {
-		struct gfs2_inode *qip = lgfs2_build_quota(sdp);
+		struct lgfs2_inode *qip = lgfs2_build_quota(sdp);
 		if (qip == NULL) {
 			log_crit(_("Error building quota inode: %s\n"), strerror(errno));
 			exit(FSCK_ERROR);
@@ -951,7 +951,7 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
  * A real dinode will be located at the block number in its no_addr.
  * A journal-copy will be at a different block (inside the journal).
  */
-static int is_journal_copy(struct gfs2_inode *ip)
+static int is_journal_copy(struct lgfs2_inode *ip)
 {
 	if (ip->i_num.in_addr == ip->i_bh->b_blocknr)
 		return 0;
@@ -968,9 +968,9 @@ static int is_journal_copy(struct gfs2_inode *ip)
  * the per_node directory will have a ".." entry that will lead us to
  * the master dinode if it's been destroyed.
  */
-static void peruse_system_dinode(struct gfs2_sbd *sdp, struct gfs2_inode *ip)
+static void peruse_system_dinode(struct gfs2_sbd *sdp, struct lgfs2_inode *ip)
 {
-	struct gfs2_inode *child_ip;
+	struct lgfs2_inode *child_ip;
 	struct lgfs2_inum inum;
 	int error;
 
@@ -1057,9 +1057,9 @@ out_discard_ip:
  * peruse_user_dinode - process a user dinode trying to find the root directory
  *
  */
-static void peruse_user_dinode(struct gfs2_sbd *sdp, struct gfs2_inode *ip)
+static void peruse_user_dinode(struct gfs2_sbd *sdp, struct lgfs2_inode *ip)
 {
-	struct gfs2_inode *parent_ip;
+	struct lgfs2_inode *parent_ip;
 	struct lgfs2_inum inum;
 	int error;
 
@@ -1194,7 +1194,7 @@ static int peruse_metadata(struct gfs2_sbd *sdp, uint64_t startblock)
 {
 	uint64_t blk, max_rg_size;
 	struct gfs2_buffer_head *bh;
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 
 	max_rg_size = 2147483648ull / sdp->sd_bsize;
 	/* Max RG size is 2GB. 2G / bsize. */
@@ -1516,7 +1516,7 @@ static int reconstruct_journals(struct gfs2_sbd *sdp)
  */
 static int init_rindex(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 
 	if (sdp->gfs1)
 		sdp->md.riinode = lgfs2_inode_read(sdp, sdp->sd_rindex_di.in_addr);
diff --git a/gfs2/fsck/link.c b/gfs2/fsck/link.c
index d5421a0d..32893da5 100644
--- a/gfs2/fsck/link.c
+++ b/gfs2/fsck/link.c
@@ -35,7 +35,7 @@ int link1_set(struct gfs2_bmap *bmap, uint64_t bblock, int mark)
 	return 0;
 }
 
-int set_di_nlink(struct gfs2_inode *ip)
+int set_di_nlink(struct lgfs2_inode *ip)
 {
 	struct inode_info *ii;
 	struct dir_info *di;
@@ -77,12 +77,12 @@ int set_di_nlink(struct gfs2_inode *ip)
 		    "for (0x%"PRIx64") via %s\n"),                        \
 		  referenced_from, counted_links, no_addr, why);
 
-int incr_link_count(struct lgfs2_inum no, struct gfs2_inode *ip, const char *why)
+int incr_link_count(struct lgfs2_inum no, struct lgfs2_inode *ip, const char *why)
 {
 	struct inode_info *ii = NULL;
 	uint64_t referenced_from = ip ? ip->i_num.in_addr : 0;
 	struct dir_info *di;
-	struct gfs2_inode *link_ip;
+	struct lgfs2_inode *link_ip;
 
 	di = dirtree_find(no.in_addr);
 	if (di) {
diff --git a/gfs2/fsck/link.h b/gfs2/fsck/link.h
index 98872d7b..cd73deba 100644
--- a/gfs2/fsck/link.h
+++ b/gfs2/fsck/link.h
@@ -12,8 +12,8 @@ enum {
 };
 
 int link1_set(struct gfs2_bmap *bmap, uint64_t bblock, int mark);
-int set_di_nlink(struct gfs2_inode *ip);
-int incr_link_count(struct lgfs2_inum no, struct gfs2_inode *ip, const char *why);
+int set_di_nlink(struct lgfs2_inode *ip);
+int incr_link_count(struct lgfs2_inum no, struct lgfs2_inode *ip, const char *why);
 int decr_link_count(uint64_t inode_no, uint64_t referenced_from, int gfs1,
 		    const char *why);
 
diff --git a/gfs2/fsck/lost_n_found.c b/gfs2/fsck/lost_n_found.c
index 8c66bea8..9e5fae6f 100644
--- a/gfs2/fsck/lost_n_found.c
+++ b/gfs2/fsck/lost_n_found.c
@@ -18,7 +18,7 @@
 #include "metawalk.h"
 #include "util.h"
 
-static void add_dotdot(struct gfs2_inode *ip)
+static void add_dotdot(struct lgfs2_inode *ip)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	struct dir_info *di;
@@ -32,7 +32,7 @@ static void add_dotdot(struct gfs2_inode *ip)
 	   back out the links. */
 	di = dirtree_find(ip->i_num.in_addr);
 	if (di && valid_block(sdp, di->dotdot_parent.in_addr)) {
-		struct gfs2_inode *dip;
+		struct lgfs2_inode *dip;
 
 		log_debug(_("Directory (0x%"PRIx64") already had a '..' link to (0x%"PRIx64").\n"),
 		          ip->i_num.in_addr, di->dotdot_parent.in_addr);
@@ -90,7 +90,7 @@ static void add_dotdot(struct gfs2_inode *ip)
 	}
 }
 
-void make_sure_lf_exists(struct gfs2_inode *ip)
+void make_sure_lf_exists(struct lgfs2_inode *ip)
 {
 	struct dir_info *di;
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -170,7 +170,7 @@ void make_sure_lf_exists(struct gfs2_inode *ip)
  *
  * Returns: 0 on success, -1 on failure.
  */
-int add_inode_to_lf(struct gfs2_inode *ip){
+int add_inode_to_lf(struct lgfs2_inode *ip){
 	char tmp_name[256];
 	unsigned inode_type;
 	struct gfs2_sbd *sdp = ip->i_sbd;
diff --git a/gfs2/fsck/lost_n_found.h b/gfs2/fsck/lost_n_found.h
index 2b76cc2b..2e1c5d14 100644
--- a/gfs2/fsck/lost_n_found.h
+++ b/gfs2/fsck/lost_n_found.h
@@ -3,7 +3,7 @@
 
 #include "libgfs2.h"
 
-int add_inode_to_lf(struct gfs2_inode *ip);
-void make_sure_lf_exists(struct gfs2_inode *ip);
+int add_inode_to_lf(struct lgfs2_inode *ip);
+void make_sure_lf_exists(struct lgfs2_inode *ip);
 
 #endif /* __LOST_N_FOUND_H__ */
diff --git a/gfs2/fsck/main.c b/gfs2/fsck/main.c
index 3c432be8..2c78f2d7 100644
--- a/gfs2/fsck/main.c
+++ b/gfs2/fsck/main.c
@@ -26,7 +26,7 @@
 #include "util.h"
 
 struct gfs2_options opts = {0};
-struct gfs2_inode *lf_dip = NULL; /* Lost and found directory inode */
+struct lgfs2_inode *lf_dip = NULL; /* Lost and found directory inode */
 int lf_was_created = 0;
 uint64_t last_fs_block, last_reported_block = -1;
 int64_t last_reported_fblock = -1000000;
diff --git a/gfs2/fsck/metawalk.c b/gfs2/fsck/metawalk.c
index 2612b0cb..70e182bd 100644
--- a/gfs2/fsck/metawalk.c
+++ b/gfs2/fsck/metawalk.c
@@ -159,7 +159,7 @@ int check_n_fix_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 /*
  * _fsck_bitmap_set - Mark a block in the bitmap, and adjust free space.
  */
-int _fsck_bitmap_set(struct gfs2_inode *ip, uint64_t bblock,
+int _fsck_bitmap_set(struct lgfs2_inode *ip, uint64_t bblock,
 		     const char *btype, int mark,
 		     int error_on_dinode, const char *caller, int fline)
 {
@@ -224,7 +224,7 @@ struct duptree *dupfind(uint64_t block)
 	return NULL;
 }
 
-struct gfs2_inode *fsck_system_inode(struct gfs2_sbd *sdp, uint64_t block)
+struct lgfs2_inode *fsck_system_inode(struct gfs2_sbd *sdp, uint64_t block)
 {
 	int j;
 
@@ -252,9 +252,9 @@ struct gfs2_inode *fsck_system_inode(struct gfs2_sbd *sdp, uint64_t block)
 
 /* fsck_load_inode - same as gfs2_load_inode() in libgfs2 but system inodes
    get special treatment. */
-struct gfs2_inode *fsck_load_inode(struct gfs2_sbd *sdp, uint64_t block)
+struct lgfs2_inode *fsck_load_inode(struct gfs2_sbd *sdp, uint64_t block)
 {
-	struct gfs2_inode *ip = NULL;
+	struct lgfs2_inode *ip = NULL;
 
 	ip = fsck_system_inode(sdp, block);
 	if (ip)
@@ -266,11 +266,11 @@ struct gfs2_inode *fsck_load_inode(struct gfs2_sbd *sdp, uint64_t block)
 
 /* fsck_inode_get - same as inode_get() in libgfs2 but system inodes
    get special treatment. */
-struct gfs2_inode *fsck_inode_get(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
+struct lgfs2_inode *fsck_inode_get(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 				  struct gfs2_buffer_head *bh)
 {
-	struct gfs2_inode *sysip;
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *sysip;
+	struct lgfs2_inode *ip;
 
 	sysip = fsck_system_inode(sdp, bh->b_blocknr);
 	if (sysip)
@@ -289,10 +289,10 @@ struct gfs2_inode *fsck_inode_get(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 
 /* fsck_inode_put - same as lgfs2_inode_put() in libgfs2 but system inodes
    get special treatment. */
-void fsck_inode_put(struct gfs2_inode **ip_in)
+void fsck_inode_put(struct lgfs2_inode **ip_in)
 {
-	struct gfs2_inode *ip = *ip_in;
-	struct gfs2_inode *sysip;
+	struct lgfs2_inode *ip = *ip_in;
+	struct lgfs2_inode *sysip;
 
 	sysip = fsck_system_inode(ip->i_sbd, ip->i_num.in_addr);
 	if (!sysip)
@@ -310,7 +310,7 @@ void fsck_inode_put(struct gfs2_inode **ip_in)
  * This function tries to repair a corrupt directory entry.  All we
  * know at this point is that the length field is wrong.
  */
-static int dirent_repair(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
+static int dirent_repair(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
 		  struct lgfs2_dirent *d, struct gfs2_dirent *dent,
 		  int type, int first)
 {
@@ -353,7 +353,7 @@ static int dirent_repair(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
 /**
  * dirblk_truncate - truncate a directory block
  */
-static void dirblk_truncate(struct gfs2_inode *ip, struct gfs2_dirent *fixb,
+static void dirblk_truncate(struct lgfs2_inode *ip, struct gfs2_dirent *fixb,
 			    struct gfs2_buffer_head *bh)
 {
 	char *bh_end;
@@ -381,7 +381,7 @@ static void dirblk_truncate(struct gfs2_inode *ip, struct gfs2_dirent *fixb,
  * returns: 0 - good block or it was repaired to be good
  *         -1 - error occurred
  */
-static int check_entries(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
+static int check_entries(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
 			 int type, uint32_t *count, int lindex,
 			 struct metawalk_fxns *pass)
 {
@@ -511,7 +511,7 @@ static int check_entries(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
  * Reads in the leaf block
  * Leaves the buffer around for further analysis (caller must lgfs2_brelse)
  */
-int check_leaf(struct gfs2_inode *ip, int lindex, struct metawalk_fxns *pass,
+int check_leaf(struct lgfs2_inode *ip, int lindex, struct metawalk_fxns *pass,
 	       uint64_t *leaf_no, struct lgfs2_leaf *leaf, int *ref_count)
 {
 	int error = 0, fix;
@@ -659,7 +659,7 @@ static int u64cmp(const void *p1, const void *p2)
 	return 0;
 }
 
-static void dir_leaf_reada(struct gfs2_inode *ip, __be64 *tbl, unsigned hsize)
+static void dir_leaf_reada(struct lgfs2_inode *ip, __be64 *tbl, unsigned hsize)
 {
 	uint64_t *t = alloca(hsize * sizeof(uint64_t));
 	uint64_t leaf_no;
@@ -678,7 +678,7 @@ static void dir_leaf_reada(struct gfs2_inode *ip, __be64 *tbl, unsigned hsize)
 }
 
 /* Checks exhash directory entries */
-int check_leaf_blks(struct gfs2_inode *ip, struct metawalk_fxns *pass)
+int check_leaf_blks(struct lgfs2_inode *ip, struct metawalk_fxns *pass)
 {
 	int error = 0;
 	unsigned hsize = (1 << ip->i_depth);
@@ -836,7 +836,7 @@ int check_leaf_blks(struct gfs2_inode *ip, struct metawalk_fxns *pass)
 	return 0;
 }
 
-static int check_eattr_entries(struct gfs2_inode *ip,
+static int check_eattr_entries(struct lgfs2_inode *ip,
 			       struct gfs2_buffer_head *bh,
 			       struct metawalk_fxns *pass)
 {
@@ -912,7 +912,7 @@ static int check_eattr_entries(struct gfs2_inode *ip,
  *
  * Returns: 0 on success, 1 if removal is needed, -1 on error
  */
-static int check_leaf_eattr(struct gfs2_inode *ip, uint64_t block,
+static int check_leaf_eattr(struct lgfs2_inode *ip, uint64_t block,
 			    uint64_t parent, struct metawalk_fxns *pass)
 {
 	struct gfs2_buffer_head *bh = NULL;
@@ -952,7 +952,7 @@ static int check_leaf_eattr(struct gfs2_inode *ip, uint64_t block,
  *
  * Returns: 0 on success -1 on error
  */
-static int check_indirect_eattr(struct gfs2_inode *ip, uint64_t indirect,
+static int check_indirect_eattr(struct lgfs2_inode *ip, uint64_t indirect,
 				struct gfs2_buffer_head *indirect_buf,
 				struct metawalk_fxns *pass)
 {
@@ -1037,7 +1037,7 @@ static int check_indirect_eattr(struct gfs2_inode *ip, uint64_t indirect,
  *
  * Returns: 0 on success, -1 on error
  */
-int check_inode_eattr(struct gfs2_inode *ip, struct metawalk_fxns *pass)
+int check_inode_eattr(struct lgfs2_inode *ip, struct metawalk_fxns *pass)
 {
 	int error = 0;
 	struct gfs2_buffer_head *indirect_buf = NULL;
@@ -1074,7 +1074,7 @@ int check_inode_eattr(struct gfs2_inode *ip, struct metawalk_fxns *pass)
 /**
  * free_metalist - free all metadata on a multi-level metadata list
  */
-static void free_metalist(struct gfs2_inode *ip, osi_list_t *mlp)
+static void free_metalist(struct lgfs2_inode *ip, osi_list_t *mlp)
 {
 	unsigned int height = ip->i_height;
 	unsigned int i;
@@ -1095,7 +1095,7 @@ static void free_metalist(struct gfs2_inode *ip, osi_list_t *mlp)
 	}
 }
 
-static void file_ra(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
+static void file_ra(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
 		    int head_size, int maxptrs, int h)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -1152,7 +1152,7 @@ static void file_ra(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
 static int do_check_metalist(struct iptr iptr, int height, struct gfs2_buffer_head **bhp,
                              struct metawalk_fxns *pass)
 {
-	struct gfs2_inode *ip = iptr.ipt_ip;
+	struct lgfs2_inode *ip = iptr.ipt_ip;
 	uint64_t block = iptr_block(iptr);
 	int was_duplicate = 0;
 	int is_valid = 1;
@@ -1207,7 +1207,7 @@ static int do_check_metalist(struct iptr iptr, int height, struct gfs2_buffer_he
  * @ip:
  * @mlp:
  */
-static int build_and_check_metalist(struct gfs2_inode *ip, osi_list_t *mlp,
+static int build_and_check_metalist(struct lgfs2_inode *ip, osi_list_t *mlp,
 				    struct metawalk_fxns *pass)
 {
 	uint32_t height = ip->i_height;
@@ -1380,7 +1380,7 @@ static void report_data_error(uint64_t metablock, int offset, uint64_t block,
  *          1 if errors were found and corrected
  *          2 (ENOENT) is there were too many bad pointers
  */
-static int metawalk_check_data(struct gfs2_inode *ip, struct metawalk_fxns *pass,
+static int metawalk_check_data(struct lgfs2_inode *ip, struct metawalk_fxns *pass,
 		      struct gfs2_buffer_head *bh, unsigned int height,
 		      uint64_t *blks_checked, struct error_block *error_blk)
 {
@@ -1448,7 +1448,7 @@ static int report_undo_data_error(uint64_t metablock, int offset, uint64_t block
 	return 0;
 }
 
-static int undo_check_data(struct gfs2_inode *ip, struct metawalk_fxns *pass,
+static int undo_check_data(struct lgfs2_inode *ip, struct metawalk_fxns *pass,
 			   struct gfs2_buffer_head *bh, unsigned int height,
 			   struct error_block *error_blk, int error)
 {
@@ -1491,7 +1491,7 @@ static unsigned int should_check(struct gfs2_buffer_head *bh, unsigned int heigh
  * @pass: structure passed in from caller to determine the sub-functions
  *
  */
-int check_metatree(struct gfs2_inode *ip, struct metawalk_fxns *pass)
+int check_metatree(struct lgfs2_inode *ip, struct metawalk_fxns *pass)
 {
 	unsigned int height = ip->i_height;
 	osi_list_t *metalist = alloca((height + 1) * sizeof(*metalist));
@@ -1624,7 +1624,7 @@ out:
 }
 
 /* Checks stuffed inode directories */
-int check_linear_dir(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
+int check_linear_dir(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
 		     struct metawalk_fxns *pass)
 {
 	int error = 0;
@@ -1639,7 +1639,7 @@ int check_linear_dir(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
 	return error;
 }
 
-int check_dir(struct gfs2_sbd *sdp, struct gfs2_inode *ip, struct metawalk_fxns *pass)
+int check_dir(struct gfs2_sbd *sdp, struct lgfs2_inode *ip, struct metawalk_fxns *pass)
 {
 	int error = 0;
 
diff --git a/gfs2/fsck/metawalk.h b/gfs2/fsck/metawalk.h
index 6e4bcad6..ce2e8efd 100644
--- a/gfs2/fsck/metawalk.h
+++ b/gfs2/fsck/metawalk.h
@@ -8,25 +8,25 @@
 
 struct metawalk_fxns;
 
-extern int check_inode_eattr(struct gfs2_inode *ip,
+extern int check_inode_eattr(struct lgfs2_inode *ip,
 			     struct metawalk_fxns *pass);
-extern int check_metatree(struct gfs2_inode *ip, struct metawalk_fxns *pass);
-extern int check_leaf_blks(struct gfs2_inode *ip, struct metawalk_fxns *pass);
-extern int check_dir(struct gfs2_sbd *sdp, struct gfs2_inode *ip,
+extern int check_metatree(struct lgfs2_inode *ip, struct metawalk_fxns *pass);
+extern int check_leaf_blks(struct lgfs2_inode *ip, struct metawalk_fxns *pass);
+extern int check_dir(struct gfs2_sbd *sdp, struct lgfs2_inode *ip,
 		     struct metawalk_fxns *pass);
-extern int check_linear_dir(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
+extern int check_linear_dir(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
 			    struct metawalk_fxns *pass);
-extern int check_leaf(struct gfs2_inode *ip, int lindex,
+extern int check_leaf(struct lgfs2_inode *ip, int lindex,
 		      struct metawalk_fxns *pass, uint64_t *leaf_no,
 		      struct lgfs2_leaf *leaf, int *ref_count);
-extern int _fsck_bitmap_set(struct gfs2_inode *ip, uint64_t bblock,
+extern int _fsck_bitmap_set(struct lgfs2_inode *ip, uint64_t bblock,
 			    const char *btype, int mark, int error_on_dinode,
 			    const char *caller, int line);
 extern int check_n_fix_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 			      uint64_t blk, int error_on_dinode,
 			      int new_state);
 extern struct duptree *dupfind(uint64_t block);
-extern struct gfs2_inode *fsck_system_inode(struct gfs2_sbd *sdp,
+extern struct lgfs2_inode *fsck_system_inode(struct gfs2_sbd *sdp,
 					    uint64_t block);
 
 #define is_duplicate(dblock) ((dupfind(dblock)) ? 1 : 0)
@@ -43,7 +43,7 @@ enum meta_check_rc {
 };
 
 struct iptr {
-	struct gfs2_inode *ipt_ip;
+	struct lgfs2_inode *ipt_ip;
 	struct gfs2_buffer_head *ipt_bh;
 	unsigned ipt_off;
 };
@@ -72,9 +72,9 @@ struct metawalk_fxns {
 	void *private;
 	int invalid_meta_is_fatal;
 	int readahead;
-	int (*check_leaf_depth) (struct gfs2_inode *ip, uint64_t leaf_no,
+	int (*check_leaf_depth) (struct lgfs2_inode *ip, uint64_t leaf_no,
 				 int ref_count, struct gfs2_buffer_head *lbh);
-	int (*check_leaf) (struct gfs2_inode *ip, uint64_t block,
+	int (*check_leaf) (struct lgfs2_inode *ip, uint64_t block,
 			   void *private);
 	/* parameters to the check_metalist sub-functions:
 	   iptr: reference to the inode and its indirect pointer that we're analyzing
@@ -94,44 +94,44 @@ struct metawalk_fxns {
 			       struct gfs2_buffer_head **bh, int h,
 			       int *is_valid, int *was_duplicate,
 			       void *private);
-	int (*check_data) (struct gfs2_inode *ip, uint64_t metablock,
+	int (*check_data) (struct lgfs2_inode *ip, uint64_t metablock,
 			   uint64_t block, void *private,
 			   struct gfs2_buffer_head *bh, __be64 *ptr);
-	int (*check_eattr_indir) (struct gfs2_inode *ip, uint64_t block,
+	int (*check_eattr_indir) (struct lgfs2_inode *ip, uint64_t block,
 				  uint64_t parent,
 				  struct gfs2_buffer_head **bh, void *private);
-	int (*check_eattr_leaf) (struct gfs2_inode *ip, uint64_t block,
+	int (*check_eattr_leaf) (struct lgfs2_inode *ip, uint64_t block,
 				 uint64_t parent, struct gfs2_buffer_head **bh,
 				 void *private);
-	int (*check_dentry) (struct gfs2_inode *ip, struct gfs2_dirent *de,
+	int (*check_dentry) (struct lgfs2_inode *ip, struct gfs2_dirent *de,
 			     struct gfs2_dirent *prev,
 			     struct gfs2_buffer_head *bh,
 			     char *filename, uint32_t *count,
 			     int *lindex, void *private);
-	int (*check_eattr_entry) (struct gfs2_inode *ip,
+	int (*check_eattr_entry) (struct lgfs2_inode *ip,
 				  struct gfs2_buffer_head *leaf_bh,
 				  struct gfs2_ea_header *ea_hdr,
 				  struct gfs2_ea_header *ea_hdr_prev,
 				  void *private);
-	int (*check_eattr_extentry) (struct gfs2_inode *ip, int i,
+	int (*check_eattr_extentry) (struct lgfs2_inode *ip, int i,
 				     __be64 *ea_data_ptr,
 				     struct gfs2_buffer_head *leaf_bh,
 				     uint32_t tot_ealen,
 				     struct gfs2_ea_header *ea_hdr,
 				     struct gfs2_ea_header *ea_hdr_prev,
 				     void *private);
-	int (*finish_eattr_indir) (struct gfs2_inode *ip, int leaf_pointers,
+	int (*finish_eattr_indir) (struct lgfs2_inode *ip, int leaf_pointers,
 				   int leaf_pointer_errors, void *private);
-	void (*big_file_msg) (struct gfs2_inode *ip, uint64_t blks_checked);
-	int (*check_hash_tbl) (struct gfs2_inode *ip, __be64 *tbl,
+	void (*big_file_msg) (struct lgfs2_inode *ip, uint64_t blks_checked);
+	int (*check_hash_tbl) (struct lgfs2_inode *ip, __be64 *tbl,
 			       unsigned hsize, void *private);
-	int (*repair_leaf) (struct gfs2_inode *ip, uint64_t *leaf_no,
+	int (*repair_leaf) (struct lgfs2_inode *ip, uint64_t *leaf_no,
 			    int lindex, int ref_count, const char *msg);
-	int (*undo_check_meta) (struct gfs2_inode *ip, uint64_t block,
+	int (*undo_check_meta) (struct lgfs2_inode *ip, uint64_t block,
 				int h, void *private);
-	int (*undo_check_data) (struct gfs2_inode *ip, uint64_t block,
+	int (*undo_check_data) (struct lgfs2_inode *ip, uint64_t block,
 				void *private);
-	int (*delete_block) (struct gfs2_inode *ip, uint64_t block,
+	int (*delete_block) (struct lgfs2_inode *ip, uint64_t block,
 			     struct gfs2_buffer_head **bh, const char *btype,
 			     void *private);
 };
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index f747a7a5..a8e0fa47 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -38,38 +38,38 @@ struct block_count {
 	uint64_t ea_count;
 };
 
-static int p1check_leaf(struct gfs2_inode *ip, uint64_t block, void *private);
+static int p1check_leaf(struct lgfs2_inode *ip, uint64_t block, void *private);
 static int pass1_check_metalist(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
                                 int *is_valid, int *was_duplicate, void *private);
-static int undo_check_metalist(struct gfs2_inode *ip, uint64_t block,
+static int undo_check_metalist(struct lgfs2_inode *ip, uint64_t block,
 			       int h, void *private);
-static int pass1_check_data(struct gfs2_inode *ip, uint64_t metablock,
+static int pass1_check_data(struct lgfs2_inode *ip, uint64_t metablock,
 		      uint64_t block, void *private,
 		      struct gfs2_buffer_head *bh, __be64 *ptr);
-static int undo_check_data(struct gfs2_inode *ip, uint64_t block,
+static int undo_check_data(struct lgfs2_inode *ip, uint64_t block,
 			   void *private);
-static int check_eattr_indir(struct gfs2_inode *ip, uint64_t indirect,
+static int check_eattr_indir(struct lgfs2_inode *ip, uint64_t indirect,
 			     uint64_t parent, struct gfs2_buffer_head **bh,
 			     void *private);
-static int check_eattr_leaf(struct gfs2_inode *ip, uint64_t block,
+static int check_eattr_leaf(struct lgfs2_inode *ip, uint64_t block,
 			    uint64_t parent, struct gfs2_buffer_head **bh,
 			    void *private);
-static int check_eattr_entries(struct gfs2_inode *ip,
+static int check_eattr_entries(struct lgfs2_inode *ip,
 			       struct gfs2_buffer_head *leaf_bh,
 			       struct gfs2_ea_header *ea_hdr,
 			       struct gfs2_ea_header *ea_hdr_prev,
 			       void *private);
-static int check_extended_leaf_eattr(struct gfs2_inode *ip, int i,
+static int check_extended_leaf_eattr(struct lgfs2_inode *ip, int i,
 				     __be64 *data_ptr,
 				     struct gfs2_buffer_head *leaf_bh,
 				     uint32_t tot_ealen,
 				     struct gfs2_ea_header *ea_hdr,
 				     struct gfs2_ea_header *ea_hdr_prev,
 				     void *private);
-static int finish_eattr_indir(struct gfs2_inode *ip, int leaf_pointers,
+static int finish_eattr_indir(struct lgfs2_inode *ip, int leaf_pointers,
 			      int leaf_pointer_errors, void *private);
-static int handle_ip(struct gfs2_sbd *sdp, struct gfs2_inode *ip);
-static int delete_block(struct gfs2_inode *ip, uint64_t block,
+static int handle_ip(struct gfs2_sbd *sdp, struct lgfs2_inode *ip);
+static int delete_block(struct lgfs2_inode *ip, uint64_t block,
 			struct gfs2_buffer_head **bh, const char *btype,
 			void *private);
 
@@ -94,7 +94,7 @@ static int gfs2_blockmap_set(struct gfs2_bmap *bmap, uint64_t bblock, int mark)
  * _fsck_blockmap_set - Mark a block in the 4-bit blockmap and the 2-bit
  *                      bitmap, and adjust free space accordingly.
  */
-static int _fsck_blockmap_set(struct gfs2_inode *ip, uint64_t bblock,
+static int _fsck_blockmap_set(struct lgfs2_inode *ip, uint64_t bblock,
 			      const char *btype, int mark, int error_on_dinode,
 			      const char *caller, int fline)
 {
@@ -114,7 +114,7 @@ static int _fsck_blockmap_set(struct gfs2_inode *ip, uint64_t bblock,
 /**
  * delete_block - delete a block associated with an inode
  */
-static int delete_block(struct gfs2_inode *ip, uint64_t block,
+static int delete_block(struct lgfs2_inode *ip, uint64_t block,
 			struct gfs2_buffer_head **bh, const char *btype,
 			void *private)
 {
@@ -127,7 +127,7 @@ static int delete_block(struct gfs2_inode *ip, uint64_t block,
 
 /* This is a pass1-specific leaf repair. Since we are not allowed to do
  * block allocations, we do what we can. */
-static int pass1_repair_leaf(struct gfs2_inode *ip, uint64_t *leaf_no,
+static int pass1_repair_leaf(struct lgfs2_inode *ip, uint64_t *leaf_no,
 			     int lindex, int ref_count, const char *msg)
 {
 	uint64_t *cpyptr;
@@ -193,7 +193,7 @@ static int resuscitate_metalist(struct iptr iptr, struct gfs2_buffer_head **bh,
                                 int *is_valid, int *was_duplicate, void *private)
 {
 	struct block_count *bc = (struct block_count *)private;
-	struct gfs2_inode *ip = iptr.ipt_ip;
+	struct lgfs2_inode *ip = iptr.ipt_ip;
 	uint64_t block = iptr_block(iptr);
 
 	*is_valid = 1;
@@ -225,7 +225,7 @@ static int resuscitate_metalist(struct iptr iptr, struct gfs2_buffer_head **bh,
  * This function makes sure directory entries in system directories are
  * kept alive.  You don't want journal0 deleted from jindex, do you?
  */
-static int resuscitate_dentry(struct gfs2_inode *ip, struct gfs2_dirent *dent,
+static int resuscitate_dentry(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			      struct gfs2_dirent *prev_de,
 			      struct gfs2_buffer_head *bh, char *filename,
 			      uint32_t *count, int *lindex, void *priv)
@@ -272,7 +272,7 @@ static struct metawalk_fxns sysdir_fxns = {
 	.delete_block = delete_block,
 };
 
-static int p1check_leaf(struct gfs2_inode *ip, uint64_t block, void *private)
+static int p1check_leaf(struct lgfs2_inode *ip, uint64_t block, void *private)
 {
 	struct block_count *bc = (struct block_count *) private;
 	int q;
@@ -305,7 +305,7 @@ static int pass1_check_metalist(struct iptr iptr, struct gfs2_buffer_head **bh,
                                 int *is_valid, int *was_duplicate, void *private)
 {
 	struct block_count *bc = (struct block_count *)private;
-	struct gfs2_inode *ip = iptr.ipt_ip;
+	struct lgfs2_inode *ip = iptr.ipt_ip;
 	uint64_t block = iptr_block(iptr);
 	struct gfs2_buffer_head *nbh;
 	const char *blktypedesc;
@@ -390,7 +390,7 @@ static int pass1_check_metalist(struct iptr iptr, struct gfs2_buffer_head **bh,
  *          1 - We can't process the block as metadata.
  */
 
-static int undo_reference(struct gfs2_inode *ip, uint64_t block, int meta,
+static int undo_reference(struct lgfs2_inode *ip, uint64_t block, int meta,
 			  void *private)
 {
 	struct block_count *bc = (struct block_count *)private;
@@ -441,13 +441,13 @@ static int undo_reference(struct gfs2_inode *ip, uint64_t block, int meta,
 	return 0;
 }
 
-static int undo_check_metalist(struct gfs2_inode *ip, uint64_t block,
+static int undo_check_metalist(struct lgfs2_inode *ip, uint64_t block,
 			       int h, void *private)
 {
 	return undo_reference(ip, block, 1, private);
 }
 
-static int undo_check_data(struct gfs2_inode *ip, uint64_t block,
+static int undo_check_data(struct lgfs2_inode *ip, uint64_t block,
 			   void *private)
 {
 	return undo_reference(ip, block, 0, private);
@@ -461,7 +461,7 @@ static int undo_check_data(struct gfs2_inode *ip, uint64_t block,
  * Note that previous checks were done for duplicate references, so this
  * is checking for dinodes that we haven't processed yet.
  */
-static int blockmap_set_as_data(struct gfs2_inode *ip, uint64_t block)
+static int blockmap_set_as_data(struct lgfs2_inode *ip, uint64_t block)
 {
 	int error;
 	struct gfs2_buffer_head *bh;
@@ -495,7 +495,7 @@ out:
 	return error;
 }
 
-static int pass1_check_data(struct gfs2_inode *ip, uint64_t metablock,
+static int pass1_check_data(struct lgfs2_inode *ip, uint64_t metablock,
 		      uint64_t block, void *private,
 		      struct gfs2_buffer_head *bbh, __be64 *ptr)
 {
@@ -598,7 +598,7 @@ static int pass1_check_data(struct gfs2_inode *ip, uint64_t metablock,
 	return 0;
 }
 
-static int ask_remove_inode_eattr(struct gfs2_inode *ip,
+static int ask_remove_inode_eattr(struct lgfs2_inode *ip,
 				  struct block_count *bc)
 {
 	if (ip->i_eattr == 0)
@@ -619,7 +619,7 @@ static int ask_remove_inode_eattr(struct gfs2_inode *ip,
 	return 0;
 }
 
-static int undo_eattr_indir_or_leaf(struct gfs2_inode *ip, uint64_t block,
+static int undo_eattr_indir_or_leaf(struct lgfs2_inode *ip, uint64_t block,
 				    uint64_t parent,
 				    struct gfs2_buffer_head **bh,
 				    void *private)
@@ -657,14 +657,14 @@ static int undo_eattr_indir_or_leaf(struct gfs2_inode *ip, uint64_t block,
  * emsg      - what to tell the user about the eas being checked
  * Returns: 1 if the EA is fixed, else 0 if it was not fixed.
  */
-static void complain_eas(struct gfs2_inode *ip, uint64_t block,
+static void complain_eas(struct lgfs2_inode *ip, uint64_t block,
 			 const char *emsg)
 {
 	log_err(_("Inode #%"PRIu64" (0x%"PRIx64"): %s"), ip->i_num.in_addr, ip->i_num.in_addr, emsg);
 	log_err(_(" at block #%"PRIu64" (0x%"PRIx64").\n"), block, block);
 }
 
-static int check_eattr_indir(struct gfs2_inode *ip, uint64_t indirect,
+static int check_eattr_indir(struct lgfs2_inode *ip, uint64_t indirect,
 			     uint64_t parent, struct gfs2_buffer_head **bh,
 			     void *private)
 {
@@ -721,7 +721,7 @@ static int check_eattr_indir(struct gfs2_inode *ip, uint64_t indirect,
 	return ret;
 }
 
-static int finish_eattr_indir(struct gfs2_inode *ip, int leaf_pointers,
+static int finish_eattr_indir(struct lgfs2_inode *ip, int leaf_pointers,
 			      int leaf_pointer_errors, void *private)
 {
 	struct block_count *bc = (struct block_count *) private;
@@ -748,7 +748,7 @@ static int finish_eattr_indir(struct gfs2_inode *ip, int leaf_pointers,
 /* check_ealeaf_block
  *      checks an extended attribute (not directory) leaf block
  */
-static int check_ealeaf_block(struct gfs2_inode *ip, uint64_t block, int btype,
+static int check_ealeaf_block(struct lgfs2_inode *ip, uint64_t block, int btype,
 			      struct gfs2_buffer_head **bh, void *private)
 {
 	struct gfs2_buffer_head *leaf_bh = NULL;
@@ -812,7 +812,7 @@ static int check_ealeaf_block(struct gfs2_inode *ip, uint64_t block, int btype,
  *
  * Returns: 0 if correct[able], -1 if removal is needed
  */
-static int check_extended_leaf_eattr(struct gfs2_inode *ip, int i,
+static int check_extended_leaf_eattr(struct lgfs2_inode *ip, int i,
 				     __be64 *data_ptr,
 				     struct gfs2_buffer_head *leaf_bh,
 				     uint32_t tot_ealen,
@@ -863,7 +863,7 @@ static int check_extended_leaf_eattr(struct gfs2_inode *ip, int i,
 	return error;
 }
 
-static int check_eattr_leaf(struct gfs2_inode *ip, uint64_t block,
+static int check_eattr_leaf(struct lgfs2_inode *ip, uint64_t block,
 			    uint64_t parent, struct gfs2_buffer_head **bh,
 			    void *private)
 {
@@ -920,7 +920,7 @@ static int eatype_max(unsigned fs_format)
 	return max;
 }
 
-static int check_eattr_entries(struct gfs2_inode *ip,
+static int check_eattr_entries(struct lgfs2_inode *ip,
 			       struct gfs2_buffer_head *leaf_bh,
 			       struct gfs2_ea_header *ea_hdr,
 			       struct gfs2_ea_header *ea_hdr_prev,
@@ -1006,7 +1006,7 @@ static const char *btypes[5] = {
 	"metadata", "leaf", "data", "indirect extended attribute",
 	"extended attribute" };
 
-static int rangecheck_block(struct gfs2_inode *ip, uint64_t block,
+static int rangecheck_block(struct lgfs2_inode *ip, uint64_t block,
 			    struct gfs2_buffer_head **bh, enum b_types btype,
 			    void *private)
 {
@@ -1045,7 +1045,7 @@ static int rangecheck_block(struct gfs2_inode *ip, uint64_t block,
 static int rangecheck_metadata(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
                                int *is_valid, int *was_duplicate, void *private)
 {
-	struct gfs2_inode *ip = iptr.ipt_ip;
+	struct lgfs2_inode *ip = iptr.ipt_ip;
 	uint64_t block = iptr_block(iptr);
 
 	*is_valid = 1;
@@ -1053,27 +1053,27 @@ static int rangecheck_metadata(struct iptr iptr, struct gfs2_buffer_head **bh, i
 	return rangecheck_block(ip, block, bh, BTYPE_META, private);
 }
 
-static int rangecheck_leaf(struct gfs2_inode *ip, uint64_t block,
+static int rangecheck_leaf(struct lgfs2_inode *ip, uint64_t block,
 			   void *private)
 {
 	return rangecheck_block(ip, block, NULL, BTYPE_LEAF, private);
 }
 
-static int rangecheck_data(struct gfs2_inode *ip, uint64_t metablock,
+static int rangecheck_data(struct lgfs2_inode *ip, uint64_t metablock,
 			   uint64_t block, void *private,
 			   struct gfs2_buffer_head *bh, __be64 *ptr)
 {
 	return rangecheck_block(ip, block, NULL, BTYPE_DATA, private);
 }
 
-static int rangecheck_eattr_indir(struct gfs2_inode *ip, uint64_t block,
+static int rangecheck_eattr_indir(struct lgfs2_inode *ip, uint64_t block,
 				  uint64_t parent,
 				  struct gfs2_buffer_head **bh, void *private)
 {
 	return rangecheck_block(ip, block, NULL, BTYPE_IEATTR, private);
 }
 
-static int rangecheck_eattr_leaf(struct gfs2_inode *ip, uint64_t block,
+static int rangecheck_eattr_leaf(struct lgfs2_inode *ip, uint64_t block,
 				 uint64_t parent, struct gfs2_buffer_head **bh,
 				 void *private)
 {
@@ -1102,7 +1102,7 @@ static struct metawalk_fxns eattr_undo_fxns = {
  *
  * returns: 0 if no error, -EINVAL if dinode has a bad mode, -EPERM on error
  */
-static int set_ip_blockmap(struct gfs2_inode *ip)
+static int set_ip_blockmap(struct lgfs2_inode *ip)
 {
 	uint64_t block = ip->i_bh->b_blocknr;
 	struct lgfs2_inum no;
@@ -1152,7 +1152,7 @@ static int alloc_metalist(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
                           int *is_valid, int *was_duplicate, void *private)
 {
 	const char *desc = (const char *)private;
-	struct gfs2_inode *ip = iptr.ipt_ip;
+	struct lgfs2_inode *ip = iptr.ipt_ip;
 	uint64_t block = iptr_block(iptr);
 	int q;
 
@@ -1172,7 +1172,7 @@ static int alloc_metalist(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
 	return META_IS_GOOD;
 }
 
-static int alloc_data(struct gfs2_inode *ip, uint64_t metablock,
+static int alloc_data(struct lgfs2_inode *ip, uint64_t metablock,
 		      uint64_t block, void *private,
 		      struct gfs2_buffer_head *bh, __be64 *ptr)
 {
@@ -1191,7 +1191,7 @@ static int alloc_data(struct gfs2_inode *ip, uint64_t metablock,
 	return 0;
 }
 
-static int alloc_leaf(struct gfs2_inode *ip, uint64_t block, void *private)
+static int alloc_leaf(struct lgfs2_inode *ip, uint64_t block, void *private)
 {
 	int q;
 
@@ -1228,7 +1228,7 @@ static struct metawalk_fxns alloc_fxns = {
  * have been freed in the bitmap. We need to set the inode address as free
  * as well.
  */
-static int pass1_check_metatree(struct gfs2_inode *ip,
+static int pass1_check_metatree(struct lgfs2_inode *ip,
 				struct metawalk_fxns *pass)
 {
 	int error;
@@ -1256,7 +1256,7 @@ static int pass1_check_metatree(struct gfs2_inode *ip,
  * So it's only our blockmap that now disagrees with the rgrp bitmap, so we
  * need to fix only that.
  */
-static void reprocess_inode(struct gfs2_inode *ip, const char *desc)
+static void reprocess_inode(struct lgfs2_inode *ip, const char *desc)
 {
 	int error;
 
@@ -1273,7 +1273,7 @@ static void reprocess_inode(struct gfs2_inode *ip, const char *desc)
 /*
  * handle_ip - process an incore structure representing a dinode.
  */
-static int handle_ip(struct gfs2_sbd *sdp, struct gfs2_inode *ip)
+static int handle_ip(struct gfs2_sbd *sdp, struct lgfs2_inode *ip)
 {
 	int error;
 	struct block_count bc = {0};
@@ -1372,7 +1372,7 @@ bad_dinode:
 	return -1;
 }
 
-static void check_i_goal(struct gfs2_sbd *sdp, struct gfs2_inode *ip)
+static void check_i_goal(struct gfs2_sbd *sdp, struct lgfs2_inode *ip)
 {
 	if (sdp->gfs1 || ip->i_flags & GFS2_DIF_SYSTEM)
 		return;
@@ -1402,7 +1402,7 @@ static int handle_di(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 {
 	int error = 0;
 	uint64_t block = bh->b_blocknr;
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 
 	ip = fsck_inode_get(sdp, rgd, bh);
 
@@ -1441,10 +1441,10 @@ static int handle_di(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 /* We have to pass the sysinode as ** because the pointer may change out from
    under the reference by way of the builder() function.  */
 static int check_system_inode(struct gfs2_sbd *sdp,
-			      struct gfs2_inode **sysinode,
+			      struct lgfs2_inode **sysinode,
 			      const char *filename,
 			      int builder(struct gfs2_sbd *sdp), int isdir,
-			      struct gfs2_inode *sysdir, int needs_sysbit)
+			      struct lgfs2_inode *sysdir, int needs_sysbit)
 {
 	uint64_t iblock = 0;
 	struct dir_status ds = {0};
@@ -1579,7 +1579,7 @@ static int build_a_journal(struct gfs2_sbd *sdp)
 
 int build_per_node(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *per_node;
+	struct lgfs2_inode *per_node;
 	unsigned int j;
 
 	per_node = lgfs2_createi(sdp->master_dir, "per_node", S_IFDIR | 0700,
@@ -1589,7 +1589,7 @@ int build_per_node(struct gfs2_sbd *sdp)
 		return -1;
 	}
 	for (j = 0; j < sdp->md.journals; j++) {
-		struct gfs2_inode *ip;
+		struct lgfs2_inode *ip;
 
 		ip = lgfs2_build_inum_range(per_node, j);
 		if (ip == NULL) {
@@ -1621,7 +1621,7 @@ int build_per_node(struct gfs2_sbd *sdp)
 
 static int build_inum(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip = lgfs2_build_inum(sdp);
+	struct lgfs2_inode *ip = lgfs2_build_inum(sdp);
 	if (ip == NULL)
 		return -1;
 	lgfs2_inode_put(&ip);
@@ -1630,7 +1630,7 @@ static int build_inum(struct gfs2_sbd *sdp)
 
 static int build_statfs(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip = lgfs2_build_statfs(sdp);
+	struct lgfs2_inode *ip = lgfs2_build_statfs(sdp);
 	if (ip == NULL)
 		return -1;
 	lgfs2_inode_put(&ip);
@@ -1639,7 +1639,7 @@ static int build_statfs(struct gfs2_sbd *sdp)
 
 static int build_rindex(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip = lgfs2_build_rindex(sdp);
+	struct lgfs2_inode *ip = lgfs2_build_rindex(sdp);
 	if (ip == NULL)
 		return -1;
 	lgfs2_inode_put(&ip);
@@ -1648,7 +1648,7 @@ static int build_rindex(struct gfs2_sbd *sdp)
 
 static int build_quota(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip = lgfs2_build_quota(sdp);
+	struct lgfs2_inode *ip = lgfs2_build_quota(sdp);
 	if (ip == NULL)
 		return -1;
 	lgfs2_inode_put(&ip);
@@ -1756,7 +1756,7 @@ static int pass1_process_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd, uin
 	struct gfs2_buffer_head *bh;
 	unsigned i;
 	uint64_t block;
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	int q;
 	/* Readahead numbers arrived at by experiment */
 	unsigned rawin = 50;
diff --git a/gfs2/fsck/pass1b.c b/gfs2/fsck/pass1b.c
index 1fb1cc4c..6add4562 100644
--- a/gfs2/fsck/pass1b.c
+++ b/gfs2/fsck/pass1b.c
@@ -41,7 +41,7 @@ struct meta_blk_ref {
 	int off; /* offset to the reference within the buffer */
 };
 
-static int clone_data(struct gfs2_inode *ip, uint64_t metablock,
+static int clone_data(struct lgfs2_inode *ip, uint64_t metablock,
 		      uint64_t block, void *private,
 		      struct gfs2_buffer_head *bh, __be64 *ptr);
 
@@ -74,7 +74,7 @@ static int findref_meta(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
 	return META_IS_GOOD;
 }
 
-static int findref_data(struct gfs2_inode *ip, uint64_t metablock,
+static int findref_data(struct lgfs2_inode *ip, uint64_t metablock,
 			uint64_t block, void *private,
 			struct gfs2_buffer_head *bh, __be64 *ptr)
 {
@@ -99,7 +99,7 @@ static void clone_data_block(struct gfs2_sbd *sdp, struct duptree *dt,
 		.check_data = findref_data,
 	};
 	struct clone_target clone = {.dup_block = dt->block,};
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	struct gfs2_buffer_head *bh;
 	__be64 *ptr;
 
@@ -180,7 +180,7 @@ static void resolve_dup_references(struct gfs2_sbd *sdp, struct duptree *dt,
 				   struct dup_handler *dh,
 				   int inval, int acceptable_ref)
 {
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	struct inode_with_dups *id;
 	osi_list_t *tmp, *x;
 	struct metawalk_fxns pass1b_fxns_delete = {
@@ -373,7 +373,7 @@ static void resolve_dup_references(struct gfs2_sbd *sdp, struct duptree *dt,
 static int clone_check_meta(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
                             int *is_valid, int *was_duplicate, void *private)
 {
-	struct gfs2_inode *ip = iptr.ipt_ip;
+	struct lgfs2_inode *ip = iptr.ipt_ip;
 	uint64_t block = iptr_block(iptr);
 
 	*was_duplicate = 0;
@@ -387,7 +387,7 @@ static int clone_check_meta(struct iptr iptr, struct gfs2_buffer_head **bh, int
  * This function remembers the first reference to the specified block, and
  * clones all subsequent references to it (with permission).
  */
-static int clone_data(struct gfs2_inode *ip, uint64_t metablock,
+static int clone_data(struct lgfs2_inode *ip, uint64_t metablock,
 		      uint64_t block, void *private,
 		      struct gfs2_buffer_head *bh, __be64 *ptr)
 {
@@ -452,7 +452,7 @@ static int clone_data(struct gfs2_inode *ip, uint64_t metablock,
  * This function traverses the metadata tree of an inode, cloning all
  * but the first reference to a duplicate block reference.
  */
-static void clone_dup_ref_in_inode(struct gfs2_inode *ip, struct duptree *dt)
+static void clone_dup_ref_in_inode(struct lgfs2_inode *ip, struct duptree *dt)
 {
 	int error;
 	struct clone_target clonet = {.dup_block = dt->block, .first = 1};
@@ -472,7 +472,7 @@ static void clone_dup_ref_in_inode(struct gfs2_inode *ip, struct duptree *dt)
 	}
 }
 
-static int set_ip_bitmap(struct gfs2_inode *ip)
+static int set_ip_bitmap(struct lgfs2_inode *ip)
 {
 	uint64_t block = ip->i_bh->b_blocknr;
 	uint32_t mode;
@@ -515,7 +515,7 @@ static int set_ip_bitmap(struct gfs2_inode *ip)
 static void resolve_last_reference(struct gfs2_sbd *sdp, struct duptree *dt,
 				   enum dup_ref_type acceptable_ref)
 {
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	struct inode_with_dups *id;
 	osi_list_t *tmp;
 	int q;
@@ -730,7 +730,7 @@ static int handle_dup_blk(struct gfs2_sbd *sdp, struct duptree *dt)
 	return 0;
 }
 
-static int check_leaf_refs(struct gfs2_inode *ip, uint64_t block,
+static int check_leaf_refs(struct lgfs2_inode *ip, uint64_t block,
 			   void *private)
 {
 	return add_duplicate_ref(ip, block, REF_AS_META, 1, INODE_VALID);
@@ -739,7 +739,7 @@ static int check_leaf_refs(struct gfs2_inode *ip, uint64_t block,
 static int check_metalist_refs(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
                                int *is_valid, int *was_duplicate, void *private)
 {
-	struct gfs2_inode *ip = iptr.ipt_ip;
+	struct lgfs2_inode *ip = iptr.ipt_ip;
 	uint64_t block = iptr_block(iptr);
 
 	*was_duplicate = 0;
@@ -747,14 +747,14 @@ static int check_metalist_refs(struct iptr iptr, struct gfs2_buffer_head **bh, i
 	return add_duplicate_ref(ip, block, REF_AS_META, 1, INODE_VALID);
 }
 
-static int check_data_refs(struct gfs2_inode *ip, uint64_t metablock,
+static int check_data_refs(struct lgfs2_inode *ip, uint64_t metablock,
 			   uint64_t block, void *private,
 			   struct gfs2_buffer_head *bh, __be64 *ptr)
 {
 	return add_duplicate_ref(ip, block, REF_AS_DATA, 1, INODE_VALID);
 }
 
-static int check_eattr_indir_refs(struct gfs2_inode *ip, uint64_t block,
+static int check_eattr_indir_refs(struct lgfs2_inode *ip, uint64_t block,
 				  uint64_t parent,
 				  struct gfs2_buffer_head **bh, void *private)
 {
@@ -768,7 +768,7 @@ static int check_eattr_indir_refs(struct gfs2_inode *ip, uint64_t block,
 	return error;
 }
 
-static int check_eattr_leaf_refs(struct gfs2_inode *ip, uint64_t block,
+static int check_eattr_leaf_refs(struct lgfs2_inode *ip, uint64_t block,
 				 uint64_t parent, struct gfs2_buffer_head **bh,
 				 void *private)
 {
@@ -781,7 +781,7 @@ static int check_eattr_leaf_refs(struct gfs2_inode *ip, uint64_t block,
 	return error;
 }
 
-static int check_eattr_entry_refs(struct gfs2_inode *ip,
+static int check_eattr_entry_refs(struct lgfs2_inode *ip,
 				  struct gfs2_buffer_head *leaf_bh,
 				  struct gfs2_ea_header *ea_hdr,
 				  struct gfs2_ea_header *ea_hdr_prev,
@@ -790,7 +790,7 @@ static int check_eattr_entry_refs(struct gfs2_inode *ip,
 	return 0;
 }
 
-static int check_eattr_extentry_refs(struct gfs2_inode *ip, int i,
+static int check_eattr_extentry_refs(struct lgfs2_inode *ip, int i,
 				     __be64 *ea_data_ptr,
 				     struct gfs2_buffer_head *leaf_bh,
 				     uint32_t tot_ealen,
@@ -813,7 +813,7 @@ static int check_eattr_extentry_refs(struct gfs2_inode *ip, int i,
 /* Finds all references to duplicate blocks in the metadata */
 static int find_block_ref(struct gfs2_sbd *sdp, uint64_t inode)
 {
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	int error = 0;
 	struct metawalk_fxns find_refs = {
 		.private = NULL,
diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index d394f6bf..7e0957ae 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -95,14 +95,14 @@ static int set_dotdot_dir(struct gfs2_sbd *sdp, uint64_t childblock, struct lgfs
 	return 0;
 }
 
-static int check_eattr_indir(struct gfs2_inode *ip, uint64_t block,
+static int check_eattr_indir(struct lgfs2_inode *ip, uint64_t block,
 			     uint64_t parent, struct gfs2_buffer_head **bh,
 			     void *private)
 {
 	*bh = lgfs2_bread(ip->i_sbd, block);
 	return 0;
 }
-static int check_eattr_leaf(struct gfs2_inode *ip, uint64_t block,
+static int check_eattr_leaf(struct lgfs2_inode *ip, uint64_t block,
 			    uint64_t parent, struct gfs2_buffer_head **bh,
 			    void *private)
 {
@@ -160,14 +160,14 @@ static struct metawalk_fxns pass2_fxns_delete = {
  * Returns: 0 if the dirent was repaired
  *          1 if the caller should delete the dirent
  */
-static int bad_formal_ino(struct gfs2_inode *ip, struct gfs2_dirent *dent,
+static int bad_formal_ino(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			  struct lgfs2_inum entry, const char *tmp_name,
 			  int q, struct lgfs2_dirent *d,
 			  struct gfs2_buffer_head *bh)
 {
 	struct inode_info *ii;
 	struct dir_info *di = NULL;
-	struct gfs2_inode *child_ip;
+	struct lgfs2_inode *child_ip;
 	struct lgfs2_inum childs_dotdot;
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	int error;
@@ -181,7 +181,7 @@ static int bad_formal_ino(struct gfs2_inode *ip, struct gfs2_dirent *dent,
 		if (di)
 			inum = di->dinode;
 		else if (link1_type(&clink1map, entry.in_addr) == 1) {
-			struct gfs2_inode *dent_ip;
+			struct lgfs2_inode *dent_ip;
 
 			dent_ip = fsck_load_inode(ip->i_sbd, entry.in_addr);
 			inum.in_addr = dent_ip->i_num.in_addr;
@@ -232,12 +232,12 @@ static int bad_formal_ino(struct gfs2_inode *ip, struct gfs2_dirent *dent,
 	return 0;
 }
 
-static int hash_table_index(uint32_t hash, struct gfs2_inode *ip)
+static int hash_table_index(uint32_t hash, struct lgfs2_inode *ip)
 {
 	return hash >> (32 - ip->i_depth);
 }
 
-static int hash_table_max(int lindex, struct gfs2_inode *ip,
+static int hash_table_max(int lindex, struct lgfs2_inode *ip,
 		   struct gfs2_buffer_head *bh)
 {
 	struct gfs2_leaf *leaf = (struct gfs2_leaf *)bh->b_data;
@@ -245,7 +245,7 @@ static int hash_table_max(int lindex, struct gfs2_inode *ip,
 		lindex - 1;
 }
 
-static int check_leaf_depth(struct gfs2_inode *ip, uint64_t leaf_no,
+static int check_leaf_depth(struct lgfs2_inode *ip, uint64_t leaf_no,
 			    int ref_count, struct gfs2_buffer_head *lbh)
 {
 	struct gfs2_leaf *leaf = (struct gfs2_leaf *)lbh->b_data;
@@ -290,7 +290,7 @@ static int check_leaf_depth(struct gfs2_inode *ip, uint64_t leaf_no,
  * Returns: 1 if the dirent is to be removed, 0 if it needs to be kept,
  *          or -1 on error
  */
-static int wrong_leaf(struct gfs2_inode *ip, struct lgfs2_inum *entry,
+static int wrong_leaf(struct lgfs2_inode *ip, struct lgfs2_inum *entry,
 		      const char *tmp_name, int *lindex, int lindex_max,
 		      int hash_index, struct gfs2_buffer_head *bh,
 		      struct dir_status *ds, struct gfs2_dirent *dent,
@@ -420,7 +420,7 @@ static int wrong_leaf(struct gfs2_inode *ip, struct lgfs2_inum *entry,
  *
  * Returns: 1 means corruption, nuke the dentry, 0 means checks pass
  */
-static int basic_dentry_checks(struct gfs2_inode *ip, struct gfs2_dirent *dent,
+static int basic_dentry_checks(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			       struct lgfs2_inum *entry, const char *tmp_name,
 			       uint32_t *count, struct lgfs2_dirent *d,
 			       struct dir_status *ds, int *q,
@@ -428,7 +428,7 @@ static int basic_dentry_checks(struct gfs2_inode *ip, struct gfs2_dirent *dent,
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	uint32_t calculated_hash;
-	struct gfs2_inode *entry_ip = NULL;
+	struct lgfs2_inode *entry_ip = NULL;
 	int error;
 	struct inode_info *ii;
 	struct dir_info *di = NULL;
@@ -614,7 +614,7 @@ static int basic_dentry_checks(struct gfs2_inode *ip, struct gfs2_dirent *dent,
 	return 0;
 }
 
-static int dirref_find(struct gfs2_inode *ip, struct gfs2_dirent *dent,
+static int dirref_find(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 		       struct gfs2_dirent *prev, struct gfs2_buffer_head *bh,
 		       char *filename, uint32_t *count, int *lindex,
 		       void *private)
@@ -683,7 +683,7 @@ static int check_suspicious_dirref(struct gfs2_sbd *sdp,
 {
 	struct osi_node *tmp, *next = NULL;
 	struct dir_info *dt;
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	uint64_t dirblk;
 	int error = FSCK_OK;
 	struct metawalk_fxns dirref_hunt = {
@@ -718,7 +718,7 @@ static int check_suspicious_dirref(struct gfs2_sbd *sdp,
 
 /* FIXME: should maybe refactor this a bit - but need to deal with
  * FIXMEs internally first */
-static int check_dentry(struct gfs2_inode *ip, struct gfs2_dirent *dent,
+static int check_dentry(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			struct gfs2_dirent *prev_de,
 			struct gfs2_buffer_head *bh, char *filename,
 			uint32_t *count, int *lindex, void *priv)
@@ -729,7 +729,7 @@ static int check_dentry(struct gfs2_inode *ip, struct gfs2_dirent *dent,
 	struct lgfs2_inum entry;
 	struct dir_status *ds = (struct dir_status *) priv;
 	int error;
-	struct gfs2_inode *entry_ip = NULL;
+	struct lgfs2_inode *entry_ip = NULL;
 	struct lgfs2_dirent d;
 	int hash_index; /* index into the hash table based on the hash */
 	int lindex_max; /* largest acceptable hash table index for hash */
@@ -927,7 +927,7 @@ nuke_dentry:
  * @before_or_after: desc. of whether this is being added before/after/etc.
  * @bn: pointer to return the newly allocated leaf's block number
  */
-static int write_new_leaf(struct gfs2_inode *dip, int start_lindex,
+static int write_new_leaf(struct lgfs2_inode *dip, int start_lindex,
 			  int num_copies, const char *before_or_after,
 			  uint64_t *bn)
 {
@@ -1021,7 +1021,7 @@ static int write_new_leaf(struct gfs2_inode *dip, int start_lindex,
  * @lindex: index location within the hash table to pad
  * @len: number of pointers to be padded
  */
-static void pad_with_leafblks(struct gfs2_inode *ip, __be64 *tbl,
+static void pad_with_leafblks(struct lgfs2_inode *ip, __be64 *tbl,
 			      int lindex, int len)
 {
 	int new_len, i;
@@ -1070,7 +1070,7 @@ static void pad_with_leafblks(struct gfs2_inode *ip, __be64 *tbl,
  * directory entries to lost+found so we don't overwrite the good leaf. Then
  * we need to pad the gap we leave.
  */
-static int lost_leaf(struct gfs2_inode *ip, __be64 *tbl, uint64_t leafno,
+static int lost_leaf(struct lgfs2_inode *ip, __be64 *tbl, uint64_t leafno,
 		     int ref_count, int lindex, struct gfs2_buffer_head *bh)
 {
 	char *filename;
@@ -1164,7 +1164,7 @@ static int lost_leaf(struct gfs2_inode *ip, __be64 *tbl, uint64_t leafno,
 	return 1;
 }
 
-static int basic_check_dentry(struct gfs2_inode *ip, struct gfs2_dirent *dent,
+static int basic_check_dentry(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			      struct gfs2_dirent *prev_de,
 			      struct gfs2_buffer_head *bh, char *filename,
 			      uint32_t *count, int *lindex, void *priv)
@@ -1209,7 +1209,7 @@ static int basic_check_dentry(struct gfs2_inode *ip, struct gfs2_dirent *dent,
  * so that they replace the bad ones.  We have to hack up the old
  * leaf a bit, but it's better than deleting the whole directory,
  * which is what used to happen before. */
-static int pass2_repair_leaf(struct gfs2_inode *ip, uint64_t *leaf_no,
+static int pass2_repair_leaf(struct lgfs2_inode *ip, uint64_t *leaf_no,
 			     int lindex, int ref_count, const char *msg)
 {
 	int new_leaf_blks = 0, error, refs;
@@ -1287,7 +1287,7 @@ static struct metawalk_fxns leafck_fxns = {
  *
  * Returns: 0 - no changes made, or X if changes were made
  */
-static int fix_hashtable(struct gfs2_inode *ip, __be64 *tbl, unsigned hsize,
+static int fix_hashtable(struct lgfs2_inode *ip, __be64 *tbl, unsigned hsize,
 			 uint64_t leafblk, int lindex, uint32_t proper_start,
 			 int len, int *proper_len, int factor)
 {
@@ -1462,7 +1462,7 @@ static int fix_hashtable(struct gfs2_inode *ip, __be64 *tbl, unsigned hsize,
 }
 
 /* check_hash_tbl_dups - check for the same leaf in multiple places */
-static int check_hash_tbl_dups(struct gfs2_inode *ip, __be64 *tbl,
+static int check_hash_tbl_dups(struct lgfs2_inode *ip, __be64 *tbl,
 			       unsigned hsize, int lindex, int len)
 {
 	int l, len2;
@@ -1579,7 +1579,7 @@ static int check_hash_tbl_dups(struct gfs2_inode *ip, __be64 *tbl,
  *       we may need to reference leaf blocks to fix it, which means we need
  *       to check and/or fix a leaf block along the way.
  */
-static int check_hash_tbl(struct gfs2_inode *ip, __be64 *tbl,
+static int check_hash_tbl(struct lgfs2_inode *ip, __be64 *tbl,
 			  unsigned hsize, void *private)
 {
 	int error = 0;
@@ -1766,7 +1766,7 @@ static struct metawalk_fxns pass2_fxns = {
 static int check_metalist_qc(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
                              int *is_valid, int *was_duplicate, void *private)
 {
-	struct gfs2_inode *ip = iptr.ipt_ip;
+	struct lgfs2_inode *ip = iptr.ipt_ip;
 	uint64_t block = iptr_block(iptr);
 
 	*was_duplicate = 0;
@@ -1775,7 +1775,7 @@ static int check_metalist_qc(struct iptr iptr, struct gfs2_buffer_head **bh, int
 	return META_IS_GOOD;
 }
 
-static int check_data_qc(struct gfs2_inode *ip, uint64_t metablock,
+static int check_data_qc(struct lgfs2_inode *ip, uint64_t metablock,
 			 uint64_t block, void *private,
 			 struct gfs2_buffer_head *bbh, __be64 *ptr)
 {
@@ -1813,13 +1813,13 @@ static struct metawalk_fxns quota_change_fxns = {
  * @builder - a rebuild function for the file
  *
  * Returns: 0 if all went well, else error. */
-static int check_pernode_for(int x, struct gfs2_inode *pernode, const char *fn,
+static int check_pernode_for(int x, struct lgfs2_inode *pernode, const char *fn,
 			     size_t filelen, int multiple,
 			     struct metawalk_fxns *pass,
-			     int builder(struct gfs2_inode *per_node,
+			     int builder(struct lgfs2_inode *per_node,
 					 unsigned int j))
 {
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	int error, valid_size = 1;
 
 	log_debug(_("Checking system file %s\n"), fn);
@@ -1875,9 +1875,9 @@ build_it:
 	goto out_good;
 }
 
-static int build_inum_range(struct gfs2_inode *per_node, unsigned int n)
+static int build_inum_range(struct lgfs2_inode *per_node, unsigned int n)
 {
-	struct gfs2_inode *ip = lgfs2_build_inum_range(per_node, n);
+	struct lgfs2_inode *ip = lgfs2_build_inum_range(per_node, n);
 
 	if (ip == NULL)
 		return 1;
@@ -1885,9 +1885,9 @@ static int build_inum_range(struct gfs2_inode *per_node, unsigned int n)
 	return 0;
 }
 
-static int build_statfs_change(struct gfs2_inode *per_node, unsigned int n)
+static int build_statfs_change(struct lgfs2_inode *per_node, unsigned int n)
 {
-	struct gfs2_inode *ip = lgfs2_build_statfs_change(per_node, n);
+	struct lgfs2_inode *ip = lgfs2_build_statfs_change(per_node, n);
 
 	if (ip == NULL)
 		return 1;
@@ -1895,9 +1895,9 @@ static int build_statfs_change(struct gfs2_inode *per_node, unsigned int n)
 	return 0;
 }
 
-static int build_quota_change(struct gfs2_inode *per_node, unsigned int n)
+static int build_quota_change(struct lgfs2_inode *per_node, unsigned int n)
 {
-	struct gfs2_inode *ip = lgfs2_build_quota_change(per_node, n);
+	struct lgfs2_inode *ip = lgfs2_build_quota_change(per_node, n);
 
 	if (ip == NULL)
 		return 1;
@@ -1907,7 +1907,7 @@ static int build_quota_change(struct gfs2_inode *per_node, unsigned int n)
 
 /* Check system directory inode                                           */
 /* Should work for all system directories: root, master, jindex, per_node */
-static int check_system_dir(struct gfs2_inode *sysinode, const char *dirname,
+static int check_system_dir(struct lgfs2_inode *sysinode, const char *dirname,
 		     int builder(struct gfs2_sbd *sdp))
 {
 	uint64_t iblock = 0;
@@ -2018,7 +2018,7 @@ static inline int is_system_dir(struct gfs2_sbd *sdp, uint64_t block)
 	return 0;
 }
 
-static int pass2_check_dir(struct gfs2_sbd *sdp, struct gfs2_inode *ip)
+static int pass2_check_dir(struct gfs2_sbd *sdp, struct lgfs2_inode *ip)
 {
 	uint64_t dirblk = ip->i_num.in_addr;
 	struct dir_status ds = {0};
@@ -2109,7 +2109,7 @@ static int pass2_check_dir(struct gfs2_sbd *sdp, struct gfs2_inode *ip)
 int pass2(struct gfs2_sbd *sdp)
 {
 	struct osi_node *tmp, *next = NULL;
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	struct dir_info *dt;
 	uint64_t dirblk;
 	int error;
diff --git a/gfs2/fsck/pass3.c b/gfs2/fsck/pass3.c
index e2e20483..a85c4975 100644
--- a/gfs2/fsck/pass3.c
+++ b/gfs2/fsck/pass3.c
@@ -24,7 +24,7 @@ static int attach_dotdot_to(struct gfs2_sbd *sdp, uint64_t newdotdot,
 	const char *filename = "..";
 	int filename_len = 2;
 	int err;
-	struct gfs2_inode *ip, *pip;
+	struct lgfs2_inode *ip, *pip;
 	struct lgfs2_inum no;
 
 	ip = fsck_load_inode(sdp, block);
@@ -160,7 +160,7 @@ int pass3(struct gfs2_sbd *sdp)
 {
 	struct osi_node *tmp, *next = NULL;
 	struct dir_info *di, *tdi;
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	int q;
 
 	di = dirtree_find(sdp->md.rooti->i_num.in_addr);
diff --git a/gfs2/fsck/pass4.c b/gfs2/fsck/pass4.c
index 25d756d9..6acd9a65 100644
--- a/gfs2/fsck/pass4.c
+++ b/gfs2/fsck/pass4.c
@@ -26,7 +26,7 @@ static struct metawalk_fxns pass4_fxns_delete = {
 
 /* Updates the link count of an inode to what the fsck has seen for
  * link count */
-static int fix_link_count(uint32_t counted_links, struct gfs2_inode *ip)
+static int fix_link_count(uint32_t counted_links, struct lgfs2_inode *ip)
 {
 	log_info(_("Fixing inode link count (%d->%d) for %"PRIu64" (0x%"PRIx64") \n"),
 	         ip->i_nlink, counted_links, ip->i_num.in_addr, ip->i_num.in_addr);
@@ -52,7 +52,7 @@ static int fix_link_count(uint32_t counted_links, struct gfs2_inode *ip)
 static int handle_unlinked(struct gfs2_sbd *sdp, uint64_t no_addr,
 			   uint32_t *counted_links, int *lf_addition)
 {
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	int q;
 
 	log_err(_("Found unlinked inode at %"PRIu64" (0x%"PRIx64")\n"),
@@ -126,7 +126,7 @@ static void handle_inconsist(struct gfs2_sbd *sdp, uint64_t no_addr,
 	/* Read in the inode, adjust the link count, and write it back out */
 	if (query(_("Update link count for inode %"PRIu64" (0x%"PRIx64")? (y/n) "),
 	          no_addr, no_addr)) {
-		struct gfs2_inode *ip;
+		struct lgfs2_inode *ip;
 
 		ip = fsck_load_inode(sdp, no_addr); /* lgfs2_bread, inode_get */
 		fix_link_count(counted_links, ip);
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index 37d20aed..14b1d56a 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -52,7 +52,7 @@ static void find_journaled_rgs(struct gfs2_sbd *sdp)
 	int j, new = 0;
 	unsigned int jblocks;
 	uint64_t b, dblock;
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	struct gfs2_buffer_head *bh;
 	int false_count;
 
diff --git a/gfs2/fsck/util.c b/gfs2/fsck/util.c
index 549c087b..b4e25c8b 100644
--- a/gfs2/fsck/util.c
+++ b/gfs2/fsck/util.c
@@ -21,7 +21,7 @@ const char *reftypes[REF_TYPES + 1] = {"data", "metadata",
 				       "an extended attribute", "an inode",
 				       "unimportant"};
 
-void big_file_comfort(struct gfs2_inode *ip, uint64_t blks_checked)
+void big_file_comfort(struct lgfs2_inode *ip, uint64_t blks_checked)
 {
 	static struct timeval tv;
 	static uint32_t seconds = 0;
@@ -267,7 +267,7 @@ static struct duptree *gfs2_dup_set(uint64_t dblock, int create)
  * find_dup_ref_inode - find a duplicate reference inode entry for an inode
  */
 struct inode_with_dups *find_dup_ref_inode(struct duptree *dt,
-					   struct gfs2_inode *ip)
+					   struct lgfs2_inode *ip)
 {
 	osi_list_t *ref;
 	struct inode_with_dups *id;
@@ -323,7 +323,7 @@ int count_dup_meta_refs(struct duptree *dt)
  *         called from pass1, which is the second reference, which determined
  *         it was a duplicate..
  */
-int add_duplicate_ref(struct gfs2_inode *ip, uint64_t block,
+int add_duplicate_ref(struct lgfs2_inode *ip, uint64_t block,
 		      enum dup_ref_type reftype, int first, int inode_valid)
 {
 	struct inode_with_dups *id;
@@ -569,7 +569,7 @@ uint64_t find_free_blk(struct gfs2_sbd *sdp)
 	return 0;
 }
 
-__be64 *get_dir_hash(struct gfs2_inode *ip)
+__be64 *get_dir_hash(struct lgfs2_inode *ip)
 {
 	unsigned hsize = (1 << ip->i_depth) * sizeof(uint64_t);
 	int ret;
@@ -587,7 +587,7 @@ __be64 *get_dir_hash(struct gfs2_inode *ip)
 	return tbl;
 }
 
-void delete_all_dups(struct gfs2_inode *ip)
+void delete_all_dups(struct lgfs2_inode *ip)
 {
 	struct osi_node *n, *next;
 	struct duptree *dt;
diff --git a/gfs2/fsck/util.h b/gfs2/fsck/util.h
index 278ac139..4f3ce5a7 100644
--- a/gfs2/fsck/util.h
+++ b/gfs2/fsck/util.h
@@ -10,12 +10,12 @@
 #define INODE_INVALID 0
 
 struct di_info *search_list(osi_list_t *list, uint64_t addr);
-void big_file_comfort(struct gfs2_inode *ip, uint64_t blks_checked);
+void big_file_comfort(struct lgfs2_inode *ip, uint64_t blks_checked);
 void display_progress(uint64_t block);
-int add_duplicate_ref(struct gfs2_inode *ip, uint64_t block,
+int add_duplicate_ref(struct lgfs2_inode *ip, uint64_t block,
 		      enum dup_ref_type reftype, int first, int inode_valid);
 extern struct inode_with_dups *find_dup_ref_inode(struct duptree *dt,
-						  struct gfs2_inode *ip);
+						  struct lgfs2_inode *ip);
 extern void dup_listent_delete(struct duptree *dt, struct inode_with_dups *id);
 extern int count_dup_meta_refs(struct duptree *dt);
 extern const char *reftypes[REF_TYPES + 1];
@@ -80,7 +80,7 @@ static const inline char *block_type_string(int q)
 	return blktyp[4];
 }
 
-static inline int is_dir(struct gfs2_inode *ip, int gfs1)
+static inline int is_dir(struct lgfs2_inode *ip, int gfs1)
 {
 	if (gfs1 && lgfs2_is_gfs_dir(ip))
 		return 1;
@@ -90,7 +90,7 @@ static inline int is_dir(struct gfs2_inode *ip, int gfs1)
 	return 0;
 }
 
-static inline uint32_t gfs_to_gfs2_mode(struct gfs2_inode *ip)
+static inline uint32_t gfs_to_gfs2_mode(struct lgfs2_inode *ip)
 {
 	uint16_t gfs1mode = ip->i_di_type;
 
@@ -125,8 +125,8 @@ extern char generic_interrupt(const char *caller, const char *where,
                        const char *answers);
 extern char gfs2_getch(void);
 extern uint64_t find_free_blk(struct gfs2_sbd *sdp);
-extern __be64 *get_dir_hash(struct gfs2_inode *ip);
-extern void delete_all_dups(struct gfs2_inode *ip);
+extern __be64 *get_dir_hash(struct lgfs2_inode *ip);
+extern void delete_all_dups(struct lgfs2_inode *ip);
 extern void print_pass_duration(const char *name, struct timeval *start);
 
 #define stack log_debug("<backtrace> - %s()\n", __func__)
diff --git a/gfs2/glocktop/glocktop.c b/gfs2/glocktop/glocktop.c
index 130cc8a9..369638a2 100644
--- a/gfs2/glocktop/glocktop.c
+++ b/gfs2/glocktop/glocktop.c
@@ -615,13 +615,13 @@ static void display_filename(int fd, uint64_t block, uint64_t *dirarray, int sub
 
 static const char *show_inode(const char *id, int fd, uint64_t block)
 {
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	const char *inode_type = NULL;
 	struct gfs2_sbd sbd = { .device_fd = fd, .sd_bsize = bsize };
 
 	ip = lgfs2_inode_read(&sbd, block);
 	if (S_ISDIR(ip->i_mode)) {
-		struct gfs2_inode *parent;
+		struct lgfs2_inode *parent;
 		uint64_t dirarray[256];
 		int subdepth = 0, error;
 
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index 4e3736ca..2566fafd 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -25,16 +25,16 @@ static __inline__ __be64 *metapointer(char *buf,
 }
 
 /* Detect directory is a stuffed inode */
-static int inode_is_stuffed(const struct gfs2_inode *ip)
+static int inode_is_stuffed(const struct lgfs2_inode *ip)
 {
 	return !ip->i_height;
 }
 
-struct gfs2_inode *lgfs2_inode_get(struct gfs2_sbd *sdp, struct gfs2_buffer_head *bh)
+struct lgfs2_inode *lgfs2_inode_get(struct gfs2_sbd *sdp, struct gfs2_buffer_head *bh)
 {
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 
-	ip = calloc(1, sizeof(struct gfs2_inode));
+	ip = calloc(1, sizeof(struct lgfs2_inode));
 	if (ip == NULL) {
 		return NULL;
 	}
@@ -44,9 +44,9 @@ struct gfs2_inode *lgfs2_inode_get(struct gfs2_sbd *sdp, struct gfs2_buffer_head
 	return ip;
 }
 
-struct gfs2_inode *lgfs2_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr)
+struct lgfs2_inode *lgfs2_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr)
 {
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	struct gfs2_buffer_head *bh = lgfs2_bread(sdp, di_addr);
 	if (bh == NULL) {
 		return NULL;
@@ -60,7 +60,7 @@ struct gfs2_inode *lgfs2_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr)
 	return ip;
 }
 
-struct gfs2_inode *lgfs2_is_system_inode(struct gfs2_sbd *sdp, uint64_t block)
+struct lgfs2_inode *lgfs2_is_system_inode(struct gfs2_sbd *sdp, uint64_t block)
 {
 	int j;
 
@@ -87,9 +87,9 @@ struct gfs2_inode *lgfs2_is_system_inode(struct gfs2_sbd *sdp, uint64_t block)
 	return NULL;
 }
 
-void lgfs2_inode_put(struct gfs2_inode **ip_in)
+void lgfs2_inode_put(struct lgfs2_inode **ip_in)
 {
-	struct gfs2_inode *ip = *ip_in;
+	struct lgfs2_inode *ip = *ip_in;
 	uint64_t block = ip->i_num.in_addr;
 	struct gfs2_sbd *sdp = ip->i_sbd;
 
@@ -199,7 +199,7 @@ int lgfs2_dinode_alloc(struct gfs2_sbd *sdp, const uint64_t blksreq, uint64_t *b
 	return ret;
 }
 
-int lgfs2_meta_alloc(struct gfs2_inode *ip, uint64_t *blkno)
+int lgfs2_meta_alloc(struct lgfs2_inode *ip, uint64_t *blkno)
 {
 	int ret = block_alloc(ip->i_sbd, 1,
 			      ip->i_sbd->gfs1 ? GFS2_BLKST_DINODE :
@@ -230,7 +230,7 @@ buffer_copy_tail(struct gfs2_sbd *sdp,
 	lgfs2_bmodified(to_bh);
 }
 
-void lgfs2_unstuff_dinode(struct gfs2_inode *ip)
+void lgfs2_unstuff_dinode(struct lgfs2_inode *ip)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	struct gfs2_buffer_head *bh;
@@ -306,7 +306,7 @@ uint64_t lgfs2_space_for_data(const struct gfs2_sbd *sdp, const unsigned bsize,
  * with errno set on error. If errno is ENOSPC then rg does not contain a
  * large enough free extent for the given di_size.
  */
-int lgfs2_file_alloc(lgfs2_rgrp_t rg, uint64_t di_size, struct gfs2_inode *ip, uint32_t flags, unsigned mode)
+int lgfs2_file_alloc(lgfs2_rgrp_t rg, uint64_t di_size, struct lgfs2_inode *ip, uint32_t flags, unsigned mode)
 {
 	unsigned extlen;
 	struct gfs2_sbd *sdp = rg->rgrps->sdp;
@@ -352,7 +352,7 @@ int lgfs2_file_alloc(lgfs2_rgrp_t rg, uint64_t di_size, struct gfs2_inode *ip, u
 	return 0;
 }
 
-unsigned int lgfs2_calc_tree_height(struct gfs2_inode *ip, uint64_t size)
+unsigned int lgfs2_calc_tree_height(struct lgfs2_inode *ip, uint64_t size)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	uint64_t *arr;
@@ -376,7 +376,7 @@ unsigned int lgfs2_calc_tree_height(struct gfs2_inode *ip, uint64_t size)
 	return height;
 }
 
-void lgfs2_build_height(struct gfs2_inode *ip, int height)
+void lgfs2_build_height(struct lgfs2_inode *ip, int height)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	struct gfs2_buffer_head *bh;
@@ -423,7 +423,7 @@ void lgfs2_build_height(struct gfs2_inode *ip, int height)
 	}
 }
 
-void lgfs2_find_metapath(struct gfs2_inode *ip, uint64_t block, struct metapath *mp)
+void lgfs2_find_metapath(struct lgfs2_inode *ip, uint64_t block, struct metapath *mp)
 {
 	const uint32_t inptrs = ip->i_sbd->sd_inptrs;
 	unsigned int i = ip->i_height;
@@ -435,7 +435,7 @@ void lgfs2_find_metapath(struct gfs2_inode *ip, uint64_t block, struct metapath
 	}
 }
 
-void lgfs2_lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
+void lgfs2_lookup_block(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
                         unsigned int height, struct metapath *mp,
                         int create, int *new, uint64_t *block)
 {
@@ -461,7 +461,7 @@ void lgfs2_lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
 	*new = 1;
 }
 
-void lgfs2_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
+void lgfs2_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *new,
                      uint64_t *dblock, uint32_t *extlen, int prealloc)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -569,7 +569,7 @@ copy2mem(struct gfs2_buffer_head *bh, void **buf, unsigned int offset,
 	*p += size;
 }
 
-int lgfs2_readi(struct gfs2_inode *ip, void *buf, uint64_t offset, unsigned int size)
+int lgfs2_readi(struct lgfs2_inode *ip, void *buf, uint64_t offset, unsigned int size)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	struct gfs2_buffer_head *bh;
@@ -655,7 +655,7 @@ static void copy_from_mem(struct gfs2_buffer_head *bh, void **buf,
 	*p += size;
 }
 
-int __lgfs2_writei(struct gfs2_inode *ip, void *buf,
+int __lgfs2_writei(struct lgfs2_inode *ip, void *buf,
 		  uint64_t offset, unsigned int size, int resize)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -737,7 +737,7 @@ int __lgfs2_writei(struct gfs2_inode *ip, void *buf,
 	return copied;
 }
 
-int lgfs2_dirent_first(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
+int lgfs2_dirent_first(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh,
 					  struct gfs2_dirent **dent)
 {
 	struct gfs2_meta_header *h = (struct gfs2_meta_header *)bh->b_data;
@@ -751,7 +751,7 @@ int lgfs2_dirent_first(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 	}
 }
 
-int lgfs2_dirent_next(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
+int lgfs2_dirent_next(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh,
 					 struct gfs2_dirent **dent)
 {
 	char *bh_end;
@@ -773,7 +773,7 @@ int lgfs2_dirent_next(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
  * Returns 0 on success, with *dent_out pointing to the new dirent,
  * or -1 on failure, with errno set
  */
-static int dirent_alloc(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
+static int dirent_alloc(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh,
 			int name_len, struct gfs2_dirent **dent_out)
 {
 	struct gfs2_dirent *dent, *new;
@@ -847,7 +847,7 @@ static int dirent_alloc(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 	return -1;
 }
 
-void lgfs2_dirent2_del(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
+void lgfs2_dirent2_del(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh,
                        struct gfs2_dirent *prev, struct gfs2_dirent *cur)
 {
 	uint16_t cur_rec_len, prev_rec_len;
@@ -878,7 +878,7 @@ void lgfs2_dirent2_del(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 	prev->de_rec_len = cpu_to_be16(prev_rec_len);
 }
 
-int lgfs2_get_leaf_ptr(struct gfs2_inode *dip, const uint32_t lindex, uint64_t *ptr)
+int lgfs2_get_leaf_ptr(struct lgfs2_inode *dip, const uint32_t lindex, uint64_t *ptr)
 {
 	__be64 leaf_no;
 	int count = lgfs2_readi(dip, (char *)&leaf_no, lindex * sizeof(__be64), sizeof(__be64));
@@ -889,7 +889,7 @@ int lgfs2_get_leaf_ptr(struct gfs2_inode *dip, const uint32_t lindex, uint64_t *
 	return 0;
 }
 
-void lgfs2_dir_split_leaf(struct gfs2_inode *dip, uint32_t start, uint64_t leaf_no,
+void lgfs2_dir_split_leaf(struct lgfs2_inode *dip, uint32_t start, uint64_t leaf_no,
 		    struct gfs2_buffer_head *obh)
 {
 	struct gfs2_buffer_head *nbh;
@@ -1010,7 +1010,7 @@ void lgfs2_dir_split_leaf(struct gfs2_inode *dip, uint32_t start, uint64_t leaf_
 	lgfs2_brelse(nbh);
 }
 
-static void dir_double_exhash(struct gfs2_inode *dip)
+static void dir_double_exhash(struct lgfs2_inode *dip)
 {
 	struct gfs2_sbd *sdp = dip->i_sbd;
 	uint64_t *buf;
@@ -1071,7 +1071,7 @@ static void dir_double_exhash(struct gfs2_inode *dip)
  * Returns: 0 on success, error code otherwise
  */
 
-int lgfs2_get_leaf(struct gfs2_inode *dip, uint64_t leaf_no,
+int lgfs2_get_leaf(struct lgfs2_inode *dip, uint64_t leaf_no,
 				  struct gfs2_buffer_head **bhp)
 {
 	int error = 0;
@@ -1092,7 +1092,7 @@ int lgfs2_get_leaf(struct gfs2_inode *dip, uint64_t leaf_no,
  * Returns: 0 on success, error code otherwise
  */
 
-static int get_first_leaf(struct gfs2_inode *dip, uint32_t lindex, struct gfs2_buffer_head **bh_out)
+static int get_first_leaf(struct lgfs2_inode *dip, uint32_t lindex, struct gfs2_buffer_head **bh_out)
 {
 	uint64_t leaf_no;
 
@@ -1113,7 +1113,7 @@ static int get_first_leaf(struct gfs2_inode *dip, uint32_t lindex, struct gfs2_b
  * Returns: 0 on success, error code otherwise
  */
 
-static int get_next_leaf(struct gfs2_inode *dip,struct gfs2_buffer_head *bh_in,
+static int get_next_leaf(struct lgfs2_inode *dip,struct gfs2_buffer_head *bh_in,
 						 struct gfs2_buffer_head **bh_out)
 {
 	struct gfs2_leaf *leaf;
@@ -1137,7 +1137,7 @@ static int get_next_leaf(struct gfs2_inode *dip,struct gfs2_buffer_head *bh_in,
 	return 0;
 }
 
-static int dir_e_add(struct gfs2_inode *dip, const char *filename, int len,
+static int dir_e_add(struct lgfs2_inode *dip, const char *filename, int len,
 		      struct lgfs2_inum *inum, unsigned int type)
 {
 	struct gfs2_buffer_head *bh, *nbh;
@@ -1230,7 +1230,7 @@ restart:
 	}
 }
 
-static void dir_make_exhash(struct gfs2_inode *dip)
+static void dir_make_exhash(struct lgfs2_inode *dip)
 {
 	struct gfs2_sbd *sdp = dip->i_sbd;
 	struct gfs2_dirent *dent;
@@ -1299,7 +1299,7 @@ static void dir_make_exhash(struct gfs2_inode *dip)
 	lgfs2_bwrite(dip->i_bh);
 }
 
-static int dir_l_add(struct gfs2_inode *dip, const char *filename, int len,
+static int dir_l_add(struct lgfs2_inode *dip, const char *filename, int len,
 		      struct lgfs2_inum *inum, unsigned int type)
 {
 	struct gfs2_dirent *dent;
@@ -1321,7 +1321,7 @@ static int dir_l_add(struct gfs2_inode *dip, const char *filename, int len,
 	return err;
 }
 
-int lgfs2_dir_add(struct gfs2_inode *dip, const char *filename, int len,
+int lgfs2_dir_add(struct lgfs2_inode *dip, const char *filename, int len,
                   struct lgfs2_inum *inum, unsigned int type)
 {
 	int err = 0;
@@ -1434,7 +1434,7 @@ static void lgfs2_fill_indir(char *start, char *end, uint64_t ptr0, unsigned n,
  *     appropriately (see lgfs2_file_alloc).
  * Returns 0 on success or non-zero with errno set on failure.
  */
-int lgfs2_write_filemeta(struct gfs2_inode *ip)
+int lgfs2_write_filemeta(struct lgfs2_inode *ip)
 {
 	unsigned height = 0;
 	struct metapath mp;
@@ -1485,7 +1485,7 @@ int lgfs2_write_filemeta(struct gfs2_inode *ip)
 	return 0;
 }
 
-static struct gfs2_inode *__createi(struct gfs2_inode *dip,
+static struct lgfs2_inode *__createi(struct lgfs2_inode *dip,
 				    const char *filename, unsigned int mode,
 				    uint32_t flags, int if_gfs1)
 {
@@ -1493,7 +1493,7 @@ static struct gfs2_inode *__createi(struct gfs2_inode *dip,
 	uint64_t bn;
 	struct lgfs2_inum inum;
 	struct gfs2_buffer_head *bh = NULL;
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	int err = 0;
 	int is_dir;
 
@@ -1537,13 +1537,13 @@ static struct gfs2_inode *__createi(struct gfs2_inode *dip,
 	return ip;
 }
 
-struct gfs2_inode *lgfs2_createi(struct gfs2_inode *dip, const char *filename,
+struct lgfs2_inode *lgfs2_createi(struct lgfs2_inode *dip, const char *filename,
                                  unsigned int mode, uint32_t flags)
 {
 	return __createi(dip, filename, mode, flags, 0);
 }
 
-struct gfs2_inode *lgfs2_gfs_createi(struct gfs2_inode *dip, const char *filename,
+struct lgfs2_inode *lgfs2_gfs_createi(struct lgfs2_inode *dip, const char *filename,
                                      unsigned int mode, uint32_t flags)
 {
 	return __createi(dip, filename, mode, flags, 1);
@@ -1578,7 +1578,7 @@ static int gfs2_filecmp(const char *file1, const char *file2, int len_of_file2)
  *
  * Returns:
  */
-static int leaf_search(struct gfs2_inode *dip, struct gfs2_buffer_head *bh, 
+static int leaf_search(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh, 
 		       const char *filename, int len,
 		       struct gfs2_dirent **dent_out,
 		       struct gfs2_dirent **dent_prev)
@@ -1635,7 +1635,7 @@ static int leaf_search(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
  * Returns: 0 on sucess, error code otherwise
  */
 
-static int linked_leaf_search(struct gfs2_inode *dip, const char *filename,
+static int linked_leaf_search(struct lgfs2_inode *dip, const char *filename,
 			      int len, struct gfs2_dirent **dent_out,
 			      struct gfs2_buffer_head **bh_out)
 {
@@ -1698,7 +1698,7 @@ static int linked_leaf_search(struct gfs2_inode *dip, const char *filename,
  *
  * Returns:
  */
-static int dir_e_search(struct gfs2_inode *dip, const char *filename,
+static int dir_e_search(struct lgfs2_inode *dip, const char *filename,
 			int len, unsigned int *type, struct lgfs2_inum *inum)
 {
 	struct gfs2_buffer_head *bh = NULL;
@@ -1727,7 +1727,7 @@ static int dir_e_search(struct gfs2_inode *dip, const char *filename,
  *
  * Returns:
  */
-static int dir_l_search(struct gfs2_inode *dip, const char *filename,
+static int dir_l_search(struct lgfs2_inode *dip, const char *filename,
 			int len, unsigned int *type, struct lgfs2_inum *inum)
 {
 	struct gfs2_dirent *dent;
@@ -1758,7 +1758,7 @@ static int dir_l_search(struct gfs2_inode *dip, const char *filename,
  *
  * Returns: 0 if found, -1 on failure, -ENOENT if not found.
  */
-int lgfs2_dir_search(struct gfs2_inode *dip, const char *filename, int len,
+int lgfs2_dir_search(struct lgfs2_inode *dip, const char *filename, int len,
                      unsigned int *type, struct lgfs2_inum *inum)
 {
 	int error;
@@ -1774,7 +1774,7 @@ int lgfs2_dir_search(struct gfs2_inode *dip, const char *filename, int len,
 	return error;
 }
 
-static int dir_e_del(struct gfs2_inode *dip, const char *filename, int len)
+static int dir_e_del(struct lgfs2_inode *dip, const char *filename, int len)
 {
 	int lindex;
 	int error;
@@ -1815,7 +1815,7 @@ static int dir_e_del(struct gfs2_inode *dip, const char *filename, int len)
 	return 0;
 }
 
-static int dir_l_del(struct gfs2_inode *dip, const char *filename, int len)
+static int dir_l_del(struct lgfs2_inode *dip, const char *filename, int len)
 {
 	int error=0;
 	struct gfs2_dirent *cur, *prev;
@@ -1847,7 +1847,7 @@ static int dir_l_del(struct gfs2_inode *dip, const char *filename, int len)
  *
  * Returns: 0 on success (or if it doesn't already exist), -1 on failure
  */
-int lgfs2_dirent_del(struct gfs2_inode *dip, const char *filename, int len)
+int lgfs2_dirent_del(struct lgfs2_inode *dip, const char *filename, int len)
 {
 	int error;
 
@@ -1870,8 +1870,8 @@ int lgfs2_dirent_del(struct gfs2_inode *dip, const char *filename, int len)
  *
  * Returns: 0 on success, -EXXXX on failure
  */
-int lgfs2_lookupi(struct gfs2_inode *dip, const char *filename, int len,
-                  struct gfs2_inode **ipp)
+int lgfs2_lookupi(struct lgfs2_inode *dip, const char *filename, int len,
+                  struct lgfs2_inode **ipp)
 {
 	struct gfs2_sbd *sdp = dip->i_sbd;
 	int error = 0;
@@ -1919,7 +1919,7 @@ void lgfs2_free_block(struct gfs2_sbd *sdp, uint64_t block)
  */
 int lgfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
 {
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	struct gfs2_buffer_head *bh, *nbh;
 	int h, head_size;
 	uint64_t block;
diff --git a/gfs2/libgfs2/gfs1.c b/gfs2/libgfs2/gfs1.c
index 2b864137..1fe366e1 100644
--- a/gfs2/libgfs2/gfs1.c
+++ b/gfs2/libgfs2/gfs1.c
@@ -17,7 +17,7 @@
 /* GFS1 compatibility functions - so that programs like gfs2_convert
    and gfs2_edit can examine/manipulate GFS1 file systems. */
 
-static __inline__ int fs_is_jdata(struct gfs2_inode *ip)
+static __inline__ int fs_is_jdata(struct lgfs2_inode *ip)
 {
         return ip->i_flags & GFS2_DIF_JDATA;
 }
@@ -31,14 +31,14 @@ gfs1_metapointer(char *buf, unsigned int height, struct metapath *mp)
 	return ((__be64 *)(buf + head_size)) + mp->mp_list[height];
 }
 
-int lgfs2_is_gfs_dir(struct gfs2_inode *ip)
+int lgfs2_is_gfs_dir(struct lgfs2_inode *ip)
 {
 	if (ip->i_di_type == GFS_FILE_DIR)
 		return 1;
 	return 0;
 }
 
-void lgfs2_gfs1_lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
+void lgfs2_gfs1_lookup_block(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
 		  unsigned int height, struct metapath *mp,
 		  int create, int *new, uint64_t *block)
 {
@@ -67,7 +67,7 @@ void lgfs2_gfs1_lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
 	*new = 1;
 }
 
-void lgfs2_gfs1_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
+void lgfs2_gfs1_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *new,
 		    uint64_t *dblock, uint32_t *extlen, int prealloc)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -163,7 +163,7 @@ void lgfs2_gfs1_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 		lgfs2_brelse(bh);
 }
 
-int lgfs2_gfs1_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
+int lgfs2_gfs1_writei(struct lgfs2_inode *ip, void *buf, uint64_t offset,
 		unsigned int size)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -245,12 +245,12 @@ int lgfs2_gfs1_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
 	return copied;
 }
 
-static struct gfs2_inode *__gfs_inode_get(struct gfs2_sbd *sdp, char *buf)
+static struct lgfs2_inode *__gfs_inode_get(struct gfs2_sbd *sdp, char *buf)
 {
 	struct gfs_dinode *di;
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 
-	ip = calloc(1, sizeof(struct gfs2_inode));
+	ip = calloc(1, sizeof(struct lgfs2_inode));
 	if (ip == NULL) {
 		return NULL;
 	}
@@ -284,15 +284,15 @@ static struct gfs2_inode *__gfs_inode_get(struct gfs2_sbd *sdp, char *buf)
 	return ip;
 }
 
-struct gfs2_inode *lgfs2_gfs_inode_get(struct gfs2_sbd *sdp, char *buf)
+struct lgfs2_inode *lgfs2_gfs_inode_get(struct gfs2_sbd *sdp, char *buf)
 {
 	return __gfs_inode_get(sdp, buf);
 }
 
-struct gfs2_inode *lgfs2_gfs_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr)
+struct lgfs2_inode *lgfs2_gfs_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr)
 {
 	struct gfs2_buffer_head *bh;
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 
 	bh = lgfs2_bget(sdp, di_addr);
 	if (bh == NULL)
diff --git a/gfs2/libgfs2/lang.c b/gfs2/libgfs2/lang.c
index e1c5aba0..0c869d07 100644
--- a/gfs2/libgfs2/lang.c
+++ b/gfs2/libgfs2/lang.c
@@ -153,7 +153,7 @@ static uint64_t ast_lookup_path(char *path, struct gfs2_sbd *sbd)
 {
 	int err = 0;
 	char *c = NULL;
-	struct gfs2_inode *ip, *iptmp;
+	struct lgfs2_inode *ip, *iptmp;
 	char *segment;
 	uint64_t bn = 0;
 
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 39097e68..ec14f75e 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -170,7 +170,7 @@ struct gfs2_bitmap
 };
 
 struct gfs2_sbd;
-struct gfs2_inode;
+struct lgfs2_inode;
 typedef struct _lgfs2_rgrps *lgfs2_rgrps_t;
 
 struct rgrp_tree {
@@ -217,7 +217,7 @@ extern lgfs2_rgrps_t lgfs2_rgrps_init(struct gfs2_sbd *sdp, uint64_t align, uint
 extern void lgfs2_rgrps_free(lgfs2_rgrps_t *rgs);
 extern uint64_t lgfs2_rindex_entry_new(lgfs2_rgrps_t rgs, struct gfs2_rindex *entry, uint64_t addr, uint32_t len);
 extern unsigned lgfs2_rindex_read_fd(int fd, lgfs2_rgrps_t rgs);
-extern lgfs2_rgrp_t lgfs2_rindex_read_one(struct gfs2_inode *rip, lgfs2_rgrps_t rgs, unsigned i);
+extern lgfs2_rgrp_t lgfs2_rindex_read_one(struct lgfs2_inode *rip, lgfs2_rgrps_t rgs, unsigned i);
 extern uint64_t lgfs2_rgrp_align_addr(const lgfs2_rgrps_t rgs, uint64_t addr);
 extern uint32_t lgfs2_rgrp_align_len(const lgfs2_rgrps_t rgs, uint32_t len);
 extern unsigned lgfs2_rgsize_for_data(uint64_t blksreq, unsigned bsize);
@@ -250,7 +250,7 @@ struct lgfs2_inum {
 	uint64_t in_addr;
 };
 
-struct gfs2_inode {
+struct lgfs2_inode {
 	struct gfs2_buffer_head *i_bh;
 	struct gfs2_sbd *i_sbd;
 	struct rgrp_tree *i_rgd; /* performance hint */
@@ -302,17 +302,17 @@ struct gfs2_inode {
 
 struct master_dir
 {
-	struct gfs2_inode *inum;
+	struct lgfs2_inode *inum;
 	uint64_t next_inum;
-	struct gfs2_inode *statfs;
-	struct gfs2_inode *qinode;
+	struct lgfs2_inode *statfs;
+	struct lgfs2_inode *qinode;
 
-	struct gfs2_inode       *jiinode;
-	struct gfs2_inode       *riinode;
-	struct gfs2_inode       *rooti;
-	struct gfs2_inode       *pinode;
+	struct lgfs2_inode       *jiinode;
+	struct lgfs2_inode       *riinode;
+	struct lgfs2_inode       *rooti;
+	struct lgfs2_inode       *pinode;
 
-	struct gfs2_inode **journal;      /* Array of journals */
+	struct lgfs2_inode **journal;      /* Array of journals */
 	uint32_t journals;                /* Journal count */
 };
 
@@ -374,7 +374,7 @@ struct gfs2_sbd {
 	uint64_t rgrps;
 	struct osi_root rgtree;
 
-	struct gfs2_inode *master_dir;
+	struct lgfs2_inode *master_dir;
 	struct master_dir md;
 
 	unsigned int gfs1:1;
@@ -494,61 +494,61 @@ extern int lgfs2_set_bitmap(lgfs2_rgrp_t rg, uint64_t blkno, int state);
 #define IS_LEAF     (1)
 #define IS_DINODE   (2)
 
-extern void lgfs2_find_metapath(struct gfs2_inode *ip, uint64_t block, struct metapath *mp);
-extern void lgfs2_lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
+extern void lgfs2_find_metapath(struct lgfs2_inode *ip, uint64_t block, struct metapath *mp);
+extern void lgfs2_lookup_block(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
 			 unsigned int height, struct metapath *mp,
 			 int create, int *new, uint64_t *block);
-extern struct gfs2_inode *lgfs2_inode_get(struct gfs2_sbd *sdp,
+extern struct lgfs2_inode *lgfs2_inode_get(struct gfs2_sbd *sdp,
 				    struct gfs2_buffer_head *bh);
-extern struct gfs2_inode *lgfs2_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr);
-extern struct gfs2_inode *lgfs2_is_system_inode(struct gfs2_sbd *sdp,
+extern struct lgfs2_inode *lgfs2_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr);
+extern struct lgfs2_inode *lgfs2_is_system_inode(struct gfs2_sbd *sdp,
 					  uint64_t block);
-extern void lgfs2_inode_put(struct gfs2_inode **ip);
-extern uint64_t lgfs2_data_alloc(struct gfs2_inode *ip);
-extern int lgfs2_meta_alloc(struct gfs2_inode *ip, uint64_t *blkno);
+extern void lgfs2_inode_put(struct lgfs2_inode **ip);
+extern uint64_t lgfs2_data_alloc(struct lgfs2_inode *ip);
+extern int lgfs2_meta_alloc(struct lgfs2_inode *ip, uint64_t *blkno);
 extern int lgfs2_dinode_alloc(struct gfs2_sbd *sdp, const uint64_t blksreq, uint64_t *blkno);
 extern uint64_t lgfs2_space_for_data(const struct gfs2_sbd *sdp, unsigned bsize, uint64_t bytes);
-extern int lgfs2_file_alloc(lgfs2_rgrp_t rg, uint64_t di_size, struct gfs2_inode *ip, uint32_t flags, unsigned mode);
+extern int lgfs2_file_alloc(lgfs2_rgrp_t rg, uint64_t di_size, struct lgfs2_inode *ip, uint32_t flags, unsigned mode);
 
-extern int lgfs2_readi(struct gfs2_inode *ip, void *buf, uint64_t offset,
+extern int lgfs2_readi(struct lgfs2_inode *ip, void *buf, uint64_t offset,
 		      unsigned int size);
 #define lgfs2_writei(ip, buf, offset, size) \
 	__lgfs2_writei(ip, buf, offset, size, 1)
-extern int __lgfs2_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
+extern int __lgfs2_writei(struct lgfs2_inode *ip, void *buf, uint64_t offset,
 			 unsigned int size, int resize);
 extern int lgfs2_init_dinode(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhp, struct lgfs2_inum *inum,
                        unsigned int mode, uint32_t flags, struct lgfs2_inum *parent);
-extern struct gfs2_inode *lgfs2_createi(struct gfs2_inode *dip, const char *filename,
+extern struct lgfs2_inode *lgfs2_createi(struct lgfs2_inode *dip, const char *filename,
 				  unsigned int mode, uint32_t flags);
-extern struct gfs2_inode *lgfs2_gfs_createi(struct gfs2_inode *dip,
+extern struct lgfs2_inode *lgfs2_gfs_createi(struct lgfs2_inode *dip,
 				      const char *filename, unsigned int mode,
 				      uint32_t flags);
-extern void lgfs2_dirent2_del(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
+extern void lgfs2_dirent2_del(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh,
 			struct gfs2_dirent *prev, struct gfs2_dirent *cur);
-extern int lgfs2_dir_search(struct gfs2_inode *dip, const char *filename, int len,
+extern int lgfs2_dir_search(struct lgfs2_inode *dip, const char *filename, int len,
 		      unsigned int *type, struct lgfs2_inum *inum);
-extern int lgfs2_lookupi(struct gfs2_inode *dip, const char *filename, int len,
-			struct gfs2_inode **ipp);
-extern int lgfs2_dir_add(struct gfs2_inode *dip, const char *filename, int len,
+extern int lgfs2_lookupi(struct lgfs2_inode *dip, const char *filename, int len,
+			struct lgfs2_inode **ipp);
+extern int lgfs2_dir_add(struct lgfs2_inode *dip, const char *filename, int len,
 		    struct lgfs2_inum *inum, unsigned int type);
-extern int lgfs2_dirent_del(struct gfs2_inode *dip, const char *filename, int name_len);
-extern void lgfs2_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
+extern int lgfs2_dirent_del(struct lgfs2_inode *dip, const char *filename, int name_len);
+extern void lgfs2_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *new,
 		      uint64_t *dblock, uint32_t *extlen, int prealloc);
-extern int lgfs2_get_leaf_ptr(struct gfs2_inode *dip, uint32_t index, uint64_t *ptr) __attribute__((warn_unused_result));
-extern void lgfs2_dir_split_leaf(struct gfs2_inode *dip, uint32_t start,
+extern int lgfs2_get_leaf_ptr(struct lgfs2_inode *dip, uint32_t index, uint64_t *ptr) __attribute__((warn_unused_result));
+extern void lgfs2_dir_split_leaf(struct lgfs2_inode *dip, uint32_t start,
 			   uint64_t leaf_no, struct gfs2_buffer_head *obh);
 extern void lgfs2_free_block(struct gfs2_sbd *sdp, uint64_t block);
 extern int lgfs2_freedi(struct gfs2_sbd *sdp, uint64_t block);
-extern int lgfs2_get_leaf(struct gfs2_inode *dip, uint64_t leaf_no,
+extern int lgfs2_get_leaf(struct lgfs2_inode *dip, uint64_t leaf_no,
 			 struct gfs2_buffer_head **bhp);
-extern int lgfs2_dirent_first(struct gfs2_inode *dip,
+extern int lgfs2_dirent_first(struct lgfs2_inode *dip,
 			     struct gfs2_buffer_head *bh,
 			     struct gfs2_dirent **dent);
-extern int lgfs2_dirent_next(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
+extern int lgfs2_dirent_next(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh,
 			    struct gfs2_dirent **dent);
-extern void lgfs2_build_height(struct gfs2_inode *ip, int height);
-extern void lgfs2_unstuff_dinode(struct gfs2_inode *ip);
-extern unsigned int lgfs2_calc_tree_height(struct gfs2_inode *ip, uint64_t size);
+extern void lgfs2_build_height(struct lgfs2_inode *ip, int height);
+extern void lgfs2_unstuff_dinode(struct lgfs2_inode *ip);
+extern unsigned int lgfs2_calc_tree_height(struct lgfs2_inode *ip, uint64_t size);
 extern uint32_t lgfs2_log_header_hash(char *buf);
 extern uint32_t lgfs2_log_header_crc(char *buf, unsigned bsize);
 
@@ -707,17 +707,17 @@ struct gfs_log_descriptor {
 	uint8_t ld_reserved[64];
 };
 
-extern int lgfs2_is_gfs_dir(struct gfs2_inode *ip);
-extern void lgfs2_gfs1_lookup_block(struct gfs2_inode *ip,
+extern int lgfs2_is_gfs_dir(struct lgfs2_inode *ip);
+extern void lgfs2_gfs1_lookup_block(struct lgfs2_inode *ip,
 			      struct gfs2_buffer_head *bh,
 			      unsigned int height, struct metapath *mp,
 			      int create, int *new, uint64_t *block);
-extern void lgfs2_gfs1_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
+extern void lgfs2_gfs1_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *new,
 			   uint64_t *dblock, uint32_t *extlen, int prealloc);
-extern int lgfs2_gfs1_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
+extern int lgfs2_gfs1_writei(struct lgfs2_inode *ip, void *buf, uint64_t offset,
 		       unsigned int size);
-extern struct gfs2_inode *lgfs2_gfs_inode_get(struct gfs2_sbd *sdp, char *buf);
-extern struct gfs2_inode *lgfs2_gfs_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr);
+extern struct lgfs2_inode *lgfs2_gfs_inode_get(struct gfs2_sbd *sdp, char *buf);
+extern struct lgfs2_inode *lgfs2_gfs_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr);
 extern void lgfs2_gfs_rgrp_in(const lgfs2_rgrp_t rg, void *buf);
 extern void lgfs2_gfs_rgrp_out(const lgfs2_rgrp_t rg, void *buf);
 
@@ -730,13 +730,13 @@ extern int lgfs2_open_mnt_dev(const char *path, int flags, struct mntent **mnt);
 extern int lgfs2_open_mnt_dir(const char *path, int flags, struct mntent **mnt);
 
 /* recovery.c */
-extern void lgfs2_replay_incr_blk(struct gfs2_inode *ip, unsigned int *blk);
-extern int lgfs2_replay_read_block(struct gfs2_inode *ip, unsigned int blk,
+extern void lgfs2_replay_incr_blk(struct lgfs2_inode *ip, unsigned int *blk);
+extern int lgfs2_replay_read_block(struct lgfs2_inode *ip, unsigned int blk,
 				  struct gfs2_buffer_head **bh);
-extern int lgfs2_get_log_header(struct gfs2_inode *ip, unsigned int blk,
+extern int lgfs2_get_log_header(struct lgfs2_inode *ip, unsigned int blk,
                                 struct lgfs2_log_header *head);
-extern int lgfs2_find_jhead(struct gfs2_inode *ip, struct lgfs2_log_header *head);
-extern int lgfs2_clean_journal(struct gfs2_inode *ip, struct lgfs2_log_header *head);
+extern int lgfs2_find_jhead(struct lgfs2_inode *ip, struct lgfs2_log_header *head);
+extern int lgfs2_clean_journal(struct lgfs2_inode *ip, struct lgfs2_log_header *head);
 
 /* rgrp.c */
 extern uint32_t lgfs2_rgblocks2bitblocks(const unsigned int bsize, const uint32_t rgblocks,
@@ -754,24 +754,24 @@ extern void lgfs2_rgrp_free(struct gfs2_sbd *sdp, struct osi_root *rgrp_tree);
 /* structures.c */
 extern int lgfs2_build_master(struct gfs2_sbd *sdp);
 extern int lgfs2_sb_write(const struct gfs2_sbd *sdp, int fd);
-extern int lgfs2_build_journal(struct gfs2_sbd *sdp, int j, struct gfs2_inode *jindex);
-extern int lgfs2_write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned blocks);
-extern int lgfs2_write_journal_data(struct gfs2_inode *ip);
-extern int lgfs2_write_filemeta(struct gfs2_inode *ip);
-extern struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *metafs, struct lgfs2_inum *jnls, size_t nmemb);
-extern struct gfs2_inode *lgfs2_build_inum(struct gfs2_sbd *sdp);
-extern struct gfs2_inode *lgfs2_build_statfs(struct gfs2_sbd *sdp);
-extern struct gfs2_inode *lgfs2_build_rindex(struct gfs2_sbd *sdp);
-extern struct gfs2_inode *lgfs2_build_quota(struct gfs2_sbd *sdp);
+extern int lgfs2_build_journal(struct gfs2_sbd *sdp, int j, struct lgfs2_inode *jindex);
+extern int lgfs2_write_journal(struct lgfs2_inode *jnl, unsigned bsize, unsigned blocks);
+extern int lgfs2_write_journal_data(struct lgfs2_inode *ip);
+extern int lgfs2_write_filemeta(struct lgfs2_inode *ip);
+extern struct lgfs2_inode *lgfs2_build_jindex(struct lgfs2_inode *metafs, struct lgfs2_inum *jnls, size_t nmemb);
+extern struct lgfs2_inode *lgfs2_build_inum(struct gfs2_sbd *sdp);
+extern struct lgfs2_inode *lgfs2_build_statfs(struct gfs2_sbd *sdp);
+extern struct lgfs2_inode *lgfs2_build_rindex(struct gfs2_sbd *sdp);
+extern struct lgfs2_inode *lgfs2_build_quota(struct gfs2_sbd *sdp);
 extern int lgfs2_build_root(struct gfs2_sbd *sdp);
 extern int lgfs2_init_inum(struct gfs2_sbd *sdp);
 extern int lgfs2_init_statfs(struct gfs2_sbd *sdp, struct gfs2_statfs_change *res);
 extern int lgfs2_check_meta(const char *buf, int type);
 extern unsigned lgfs2_bm_scan(struct rgrp_tree *rgd, unsigned idx,
 			      uint64_t *buf, uint8_t state);
-extern struct gfs2_inode *lgfs2_build_inum_range(struct gfs2_inode *per_node, unsigned int n);
-extern struct gfs2_inode *lgfs2_build_statfs_change(struct gfs2_inode *per_node, unsigned int j);
-extern struct gfs2_inode *lgfs2_build_quota_change(struct gfs2_inode *per_node, unsigned int j);
+extern struct lgfs2_inode *lgfs2_build_inum_range(struct lgfs2_inode *per_node, unsigned int n);
+extern struct lgfs2_inode *lgfs2_build_statfs_change(struct lgfs2_inode *per_node, unsigned int j);
+extern struct lgfs2_inode *lgfs2_build_quota_change(struct lgfs2_inode *per_node, unsigned int j);
 
 /* super.c */
 extern int lgfs2_check_sb(void *sbp);
@@ -791,8 +791,8 @@ extern void lgfs2_rindex_in(lgfs2_rgrp_t rg, void *buf);
 extern void lgfs2_rindex_out(const lgfs2_rgrp_t rg, void *buf);
 extern void lgfs2_rgrp_in(lgfs2_rgrp_t rg, void *buf);
 extern void lgfs2_rgrp_out(const lgfs2_rgrp_t rg, void *buf);
-extern void lgfs2_dinode_in(struct gfs2_inode *ip, char *buf);
-extern void lgfs2_dinode_out(struct gfs2_inode *ip, char *buf);
+extern void lgfs2_dinode_in(struct lgfs2_inode *ip, char *buf);
+extern void lgfs2_dinode_out(struct lgfs2_inode *ip, char *buf);
 extern void lgfs2_dirent_in(struct lgfs2_dirent *d, void *dep);
 extern void lgfs2_dirent_out(struct lgfs2_dirent *d, void *dep);
 extern void lgfs2_leaf_in(struct lgfs2_leaf *lf, void *lfp);
diff --git a/gfs2/libgfs2/ondisk.c b/gfs2/libgfs2/ondisk.c
index 8cddfec9..9d06443c 100644
--- a/gfs2/libgfs2/ondisk.c
+++ b/gfs2/libgfs2/ondisk.c
@@ -124,7 +124,7 @@ void lgfs2_rgrp_out(const lgfs2_rgrp_t rg, void *buf)
 	lgfs2_rgrp_crc_set(buf);
 }
 
-void lgfs2_dinode_in(struct gfs2_inode *ip, char *buf)
+void lgfs2_dinode_in(struct lgfs2_inode *ip, char *buf)
 {
 	struct gfs2_dinode *di = (struct gfs2_dinode *)buf;
 
@@ -157,7 +157,7 @@ void lgfs2_dinode_in(struct gfs2_inode *ip, char *buf)
 	ip->i_ctime_nsec = be32_to_cpu(di->di_ctime_nsec);
 }
 
-void lgfs2_dinode_out(struct gfs2_inode *ip, char *buf)
+void lgfs2_dinode_out(struct lgfs2_inode *ip, char *buf)
 {
 	struct gfs2_dinode *di = (struct gfs2_dinode *)buf;
 
diff --git a/gfs2/libgfs2/recovery.c b/gfs2/libgfs2/recovery.c
index 483661e4..b88d913d 100644
--- a/gfs2/libgfs2/recovery.c
+++ b/gfs2/libgfs2/recovery.c
@@ -14,7 +14,7 @@
 #include <string.h>
 #include "libgfs2.h"
 
-void lgfs2_replay_incr_blk(struct gfs2_inode *ip, unsigned int *blk)
+void lgfs2_replay_incr_blk(struct lgfs2_inode *ip, unsigned int *blk)
 {
 	uint32_t jd_blocks = ip->i_size / ip->i_sbd->sd_bsize;
 
@@ -22,7 +22,7 @@ void lgfs2_replay_incr_blk(struct gfs2_inode *ip, unsigned int *blk)
                 *blk = 0;
 }
 
-int lgfs2_replay_read_block(struct gfs2_inode *ip, unsigned int blk,
+int lgfs2_replay_read_block(struct lgfs2_inode *ip, unsigned int blk,
 			   struct gfs2_buffer_head **bh)
 {
 	int new = 0;
@@ -65,7 +65,7 @@ static void log_header_in(struct lgfs2_log_header *lh, char *buf)
  *          errno on error
  */
 
-int lgfs2_get_log_header(struct gfs2_inode *ip, unsigned int blk,
+int lgfs2_get_log_header(struct lgfs2_inode *ip, unsigned int blk,
                          struct lgfs2_log_header *head)
 {
 	struct gfs2_buffer_head *bh;
@@ -113,7 +113,7 @@ int lgfs2_get_log_header(struct gfs2_inode *ip, unsigned int blk,
  *
  * Returns: errno
  */
-static int find_good_lh(struct gfs2_inode *ip, unsigned int *blk, struct lgfs2_log_header *head)
+static int find_good_lh(struct lgfs2_inode *ip, unsigned int *blk, struct lgfs2_log_header *head)
 {
 	unsigned int orig_blk = *blk;
 	int error;
@@ -143,7 +143,7 @@ static int find_good_lh(struct gfs2_inode *ip, unsigned int *blk, struct lgfs2_l
  * Returns: errno
  */
 
-static int jhead_scan(struct gfs2_inode *ip, struct lgfs2_log_header *head)
+static int jhead_scan(struct lgfs2_inode *ip, struct lgfs2_log_header *head)
 {
 	unsigned int blk = head->lh_blkno;
 	uint32_t jd_blocks = ip->i_size / ip->i_sbd->sd_bsize;
@@ -182,7 +182,7 @@ static int jhead_scan(struct gfs2_inode *ip, struct lgfs2_log_header *head)
  * Returns: errno
  */
 
-int lgfs2_find_jhead(struct gfs2_inode *ip, struct lgfs2_log_header *head)
+int lgfs2_find_jhead(struct lgfs2_inode *ip, struct lgfs2_log_header *head)
 {
 	struct lgfs2_log_header lh_1, lh_m;
 	uint32_t blk_1, blk_2, blk_m;
@@ -230,7 +230,7 @@ int lgfs2_find_jhead(struct gfs2_inode *ip, struct lgfs2_log_header *head)
  * Returns: errno
  */
 
-int lgfs2_clean_journal(struct gfs2_inode *ip, struct lgfs2_log_header *head)
+int lgfs2_clean_journal(struct lgfs2_inode *ip, struct lgfs2_log_header *head)
 {
 	unsigned int lblock;
 	struct gfs2_log_header *lh;
diff --git a/gfs2/libgfs2/rgrp.c b/gfs2/libgfs2/rgrp.c
index 78b6812a..e3f2e268 100644
--- a/gfs2/libgfs2/rgrp.c
+++ b/gfs2/libgfs2/rgrp.c
@@ -472,7 +472,7 @@ unsigned lgfs2_rindex_read_fd(int fd, lgfs2_rgrps_t rgs)
  * Returns the new rindex entry added to the set or NULL on error with errno
  * set.
  */
-lgfs2_rgrp_t lgfs2_rindex_read_one(struct gfs2_inode *rip, lgfs2_rgrps_t rgs, unsigned i)
+lgfs2_rgrp_t lgfs2_rindex_read_one(struct lgfs2_inode *rip, lgfs2_rgrps_t rgs, unsigned i)
 {
 	uint64_t off = i * sizeof(struct gfs2_rindex);
 	struct gfs2_rindex ri;
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index a0de2477..b48c9bcc 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -101,7 +101,7 @@ uint32_t lgfs2_log_header_crc(char *buf, unsigned bsize)
  * ip: The journal's inode
  * Returns 0 on success or -1 with errno set on error.
  */
-int lgfs2_write_journal_data(struct gfs2_inode *ip)
+int lgfs2_write_journal_data(struct lgfs2_inode *ip)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	unsigned blocks = (ip->i_size + sdp->sd_bsize - 1) / sdp->sd_bsize;
@@ -151,7 +151,7 @@ int lgfs2_write_journal_data(struct gfs2_inode *ip)
 	return 0;
 }
 
-static struct gfs2_buffer_head *lgfs2_get_file_buf(struct gfs2_inode *ip, uint64_t lbn, int prealloc)
+static struct gfs2_buffer_head *lgfs2_get_file_buf(struct lgfs2_inode *ip, uint64_t lbn, int prealloc)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	uint64_t dbn;
@@ -175,7 +175,7 @@ static struct gfs2_buffer_head *lgfs2_get_file_buf(struct gfs2_inode *ip, uint64
 		return lgfs2_bread(sdp, dbn);
 }
 
-int lgfs2_write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned int blocks)
+int lgfs2_write_journal(struct lgfs2_inode *jnl, unsigned bsize, unsigned int blocks)
 {
 	struct gfs2_log_header *lh;
 	uint32_t x;
@@ -227,7 +227,7 @@ int lgfs2_write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned int blo
 	return 0;
 }
 
-int lgfs2_build_journal(struct gfs2_sbd *sdp, int j, struct gfs2_inode *jindex)
+int lgfs2_build_journal(struct gfs2_sbd *sdp, int j, struct lgfs2_inode *jindex)
 {
 	char name[256];
 	int ret;
@@ -250,10 +250,10 @@ int lgfs2_build_journal(struct gfs2_sbd *sdp, int j, struct gfs2_inode *jindex)
  * nmemb: The number of entries in the list (number of journals).
  * Returns 0 on success or non-zero on error with errno set.
  */
-struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *master, struct lgfs2_inum *jnls, size_t nmemb)
+struct lgfs2_inode *lgfs2_build_jindex(struct lgfs2_inode *master, struct lgfs2_inum *jnls, size_t nmemb)
 {
 	char fname[GFS2_FNAMESIZE + 1];
-	struct gfs2_inode *jindex;
+	struct lgfs2_inode *jindex;
 
 	if (nmemb == 0 || jnls == NULL) {
 		errno = EINVAL;
@@ -278,10 +278,10 @@ struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *master, struct lgfs2_in
 	return jindex;
 }
 
-struct gfs2_inode *lgfs2_build_inum_range(struct gfs2_inode *per_node, unsigned int j)
+struct lgfs2_inode *lgfs2_build_inum_range(struct lgfs2_inode *per_node, unsigned int j)
 {
 	char name[256];
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 
 	sprintf(name, "inum_range%u", j);
 	ip = lgfs2_createi(per_node, name, S_IFREG | 0600,
@@ -295,10 +295,10 @@ struct gfs2_inode *lgfs2_build_inum_range(struct gfs2_inode *per_node, unsigned
 	return ip;
 }
 
-struct gfs2_inode *lgfs2_build_statfs_change(struct gfs2_inode *per_node, unsigned int j)
+struct lgfs2_inode *lgfs2_build_statfs_change(struct lgfs2_inode *per_node, unsigned int j)
 {
 	char name[256];
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 
 	sprintf(name, "statfs_change%u", j);
 	ip = lgfs2_createi(per_node, name, S_IFREG | 0600,
@@ -312,12 +312,12 @@ struct gfs2_inode *lgfs2_build_statfs_change(struct gfs2_inode *per_node, unsign
 	return ip;
 }
 
-struct gfs2_inode *lgfs2_build_quota_change(struct gfs2_inode *per_node, unsigned int j)
+struct lgfs2_inode *lgfs2_build_quota_change(struct lgfs2_inode *per_node, unsigned int j)
 {
 	struct gfs2_sbd *sdp = per_node->i_sbd;
 	struct gfs2_meta_header mh;
 	char name[256];
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	unsigned int blocks = sdp->qcsize << (20 - sdp->sd_bsize_shift);
 	unsigned int x;
 	unsigned int hgt;
@@ -349,27 +349,27 @@ struct gfs2_inode *lgfs2_build_quota_change(struct gfs2_inode *per_node, unsigne
 	return ip;
 }
 
-struct gfs2_inode *lgfs2_build_inum(struct gfs2_sbd *sdp)
+struct lgfs2_inode *lgfs2_build_inum(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 
 	ip = lgfs2_createi(sdp->master_dir, "inum", S_IFREG | 0600,
 		     GFS2_DIF_SYSTEM | GFS2_DIF_JDATA);
 	return ip;
 }
 
-struct gfs2_inode *lgfs2_build_statfs(struct gfs2_sbd *sdp)
+struct lgfs2_inode *lgfs2_build_statfs(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 
 	ip = lgfs2_createi(sdp->master_dir, "statfs", S_IFREG | 0600,
 		     GFS2_DIF_SYSTEM | GFS2_DIF_JDATA);
 	return ip;
 }
 
-struct gfs2_inode *lgfs2_build_rindex(struct gfs2_sbd *sdp)
+struct lgfs2_inode *lgfs2_build_rindex(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	struct osi_node *n, *next = NULL;
 	struct rgrp_tree *rl;
 	char buf[sizeof(struct gfs2_rindex)];
@@ -401,9 +401,9 @@ struct gfs2_inode *lgfs2_build_rindex(struct gfs2_sbd *sdp)
 	return ip;
 }
 
-struct gfs2_inode *lgfs2_build_quota(struct gfs2_sbd *sdp)
+struct lgfs2_inode *lgfs2_build_quota(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	struct gfs2_quota qu;
 	int count;
 
@@ -455,7 +455,7 @@ int lgfs2_build_root(struct gfs2_sbd *sdp)
 
 int lgfs2_init_inum(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip = sdp->md.inum;
+	struct lgfs2_inode *ip = sdp->md.inum;
 	__be64 buf;
 	int count;
 
@@ -469,7 +469,7 @@ int lgfs2_init_inum(struct gfs2_sbd *sdp)
 
 int lgfs2_init_statfs(struct gfs2_sbd *sdp, struct gfs2_statfs_change *res)
 {
-	struct gfs2_inode *ip = sdp->md.statfs;
+	struct lgfs2_inode *ip = sdp->md.statfs;
 	struct gfs2_statfs_change sc;
 	int count;
 
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 5a8ede04..7c4700dc 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -683,7 +683,7 @@ static int warn_of_destruction(const char *path)
 
 static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 {
-	struct gfs2_inode *per_node;
+	struct lgfs2_inode *per_node;
 	unsigned int j;
 
 	per_node = lgfs2_createi(sdp->master_dir, "per_node", S_IFDIR | 0700,
@@ -693,7 +693,7 @@ static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 		return -1;
 	}
 	for (j = 0; j < sdp->md.journals; j++) {
-		struct gfs2_inode *ip;
+		struct lgfs2_inode *ip;
 
 		ip = lgfs2_build_inum_range(per_node, j);
 		if (ip == NULL) {
@@ -910,7 +910,7 @@ static int place_journals(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs, struct mkfs_o
 	for (j = 0; j < opts->journals; j++) {
 		int result;
 		lgfs2_rgrp_t rg;
-		struct gfs2_inode in = {0};
+		struct lgfs2_inode in = {0};
 		struct gfs2_rindex ri;
 
 		gfs2_progress_update(&progress, (j + 1));
@@ -1001,7 +1001,7 @@ static int place_rgrps(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs, uint64_t *rgaddr
 
 static int create_jindex(struct gfs2_sbd *sdp, struct mkfs_opts *opts, struct lgfs2_inum *jnls)
 {
-	struct gfs2_inode *jindex;
+	struct lgfs2_inode *jindex;
 
 	jindex = lgfs2_build_jindex(sdp->master_dir, jnls, opts->journals);
 	if (jindex == NULL) {
@@ -1199,7 +1199,7 @@ int main(int argc, char *argv[])
 	struct gfs2_statfs_change sc;
 	struct gfs2_sbd sbd;
 	struct mkfs_opts opts;
-	struct gfs2_inode *ip;
+	struct lgfs2_inode *ip;
 	lgfs2_rgrps_t rgs;
 	uint64_t rgaddr;
 	int error;
-- 
2.34.1

