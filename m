Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 528914938C9
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:44:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589081;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gYhZyNw5Os8aYoWP+U4+DiGu+dJQs8/F+0eBR1JXR+s=;
	b=Td8okkgVk1pZ5JQc1a6UaFVX+xruWYAZCfoIg6uNoCZsAwdE7/+C9JyfITrgdpghGMEGyq
	CR3t3y0Pp/gBFeCyJ/Qx9oPzXeITt4qMHIAwqDp+y0S+H1vK2COXBRs0mNy/v2AuXDmmrp
	rn2KK1fMELzwwcsL5mwyarV1SXcTp0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-I_ryCsZ1NxCYFwXh2taObw-1; Wed, 19 Jan 2022 05:44:32 -0500
X-MC-Unique: I_ryCsZ1NxCYFwXh2taObw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 889591091DB7;
	Wed, 19 Jan 2022 10:44:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 776714F85E;
	Wed, 19 Jan 2022 10:44:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 637FC4A700;
	Wed, 19 Jan 2022 10:44:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAiSp9024535 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:44:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DA04878B18; Wed, 19 Jan 2022 10:44:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A17778B10
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:44:27 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:09 +0000
Message-Id: <20220119104316.2489995-15-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 14/21] libgfs2: Namespace improvements -
	struct gfs2_buffer_head
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

Rename to struct lgfs2_buffer_head.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c   | 30 +++++++-------
 gfs2/edit/extended.c          |  2 +-
 gfs2/edit/gfs2hex.c           |  2 +-
 gfs2/edit/hexedit.c           | 20 +++++-----
 gfs2/edit/journal.c           | 14 +++----
 gfs2/fsck/afterpass1_common.c | 18 ++++-----
 gfs2/fsck/afterpass1_common.h | 12 +++---
 gfs2/fsck/fs_recovery.c       | 18 ++++-----
 gfs2/fsck/fsck.h              |  2 +-
 gfs2/fsck/initialize.c        | 14 +++----
 gfs2/fsck/metawalk.c          | 50 +++++++++++------------
 gfs2/fsck/metawalk.h          | 22 +++++------
 gfs2/fsck/pass1.c             | 68 ++++++++++++++++----------------
 gfs2/fsck/pass1b.c            | 28 ++++++-------
 gfs2/fsck/pass2.c             | 40 +++++++++----------
 gfs2/fsck/pass5.c             |  2 +-
 gfs2/fsck/rgrepair.c          | 12 +++---
 gfs2/libgfs2/buf.c            | 18 ++++-----
 gfs2/libgfs2/fs_ops.c         | 74 +++++++++++++++++------------------
 gfs2/libgfs2/gfs1.c           |  8 ++--
 gfs2/libgfs2/libgfs2.h        | 34 ++++++++--------
 gfs2/libgfs2/recovery.c       |  6 +--
 gfs2/libgfs2/structures.c     | 12 +++---
 gfs2/libgfs2/super.c          |  4 +-
 24 files changed, 255 insertions(+), 255 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 21611b1a..06815380 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -263,7 +263,7 @@ static void fix_metatree(struct gfs2_sbd *sbp, struct lgfs2_inode *ip,
 		  unsigned int size)
 {
 	uint64_t block;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	unsigned int amount, ptramt;
 	int hdrsize, h, copied = 0, new;
 	struct gfs2_meta_header mh = {0};
@@ -421,7 +421,7 @@ static uint64_t fix_jdatatree(struct gfs2_sbd *sbp, struct lgfs2_inode *ip,
 			      unsigned int size)
 {
 	uint64_t block;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	unsigned int amount, ptramt;
 	int h, copied = 0, new = 0;
 	struct gfs2_meta_header mh = {0};
@@ -488,7 +488,7 @@ static uint64_t fix_jdatatree(struct gfs2_sbd *sbp, struct lgfs2_inode *ip,
 static int get_inode_metablocks(struct gfs2_sbd *sbp, struct lgfs2_inode *ip, struct blocklist *blocks)
 {
 	struct blocklist *blk, *newblk;
-	struct gfs2_buffer_head *bh, *dibh = ip->i_bh;
+	struct lgfs2_buffer_head *bh, *dibh = ip->i_bh;
 	osi_list_t *tmp;
 	uint64_t block;
 	__be64 *ptr1;
@@ -622,7 +622,7 @@ static int fix_ind_jdata(struct gfs2_sbd *sbp, struct lgfs2_inode *ip, uint32_t
 	__be64 *ptr1;
 	int ptrnum, h;
 	struct metapath gfs2mp;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 
 	bufsize = sbp->sd_bsize - sizeof(struct gfs2_meta_header);
 	/*
@@ -774,7 +774,7 @@ static int has_cdpn(const char *str)
 	return 0;
 }
 
-static int fix_cdpn_symlink(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh, struct lgfs2_inode *ip)
+static int fix_cdpn_symlink(struct gfs2_sbd *sbp, struct lgfs2_buffer_head *bh, struct lgfs2_inode *ip)
 {
 	char *linkptr = NULL;
 
@@ -809,10 +809,10 @@ static int fix_cdpn_symlink(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh, s
  * to fix the header. gfs1 uses gfs_indirect as the header which is 64 bytes
  * bigger than gfs2_meta_header that gfs2 uses.
  */
-static int fix_xattr(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh, struct lgfs2_inode *ip)
+static int fix_xattr(struct gfs2_sbd *sbp, struct lgfs2_buffer_head *bh, struct lgfs2_inode *ip)
 {
 	int len, old_hdr_sz, new_hdr_sz;
-	struct gfs2_buffer_head *eabh;
+	struct lgfs2_buffer_head *eabh;
 	char *buf;
 
 	/* Read in the i_eattr block */
@@ -843,7 +843,7 @@ static int fix_xattr(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh, struct l
 /*                                                                           */
 /* Returns: 0 on success, -1 on failure                                      */
 /* ------------------------------------------------------------------------- */
-static int adjust_inode(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh)
+static int adjust_inode(struct gfs2_sbd *sbp, struct lgfs2_buffer_head *bh)
 {
 	struct lgfs2_inode *inode;
 	struct inode_block *fixdir;
@@ -984,7 +984,7 @@ static int next_rg_meta(struct rgrp_tree *rgd, uint64_t *block, int first)
 static int next_rg_metatype(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
                             uint64_t *block, uint32_t type, int first)
 {
-	struct gfs2_buffer_head *bh = NULL;
+	struct lgfs2_buffer_head *bh = NULL;
 
 	do{
 		if (bh)
@@ -1011,7 +1011,7 @@ static int inode_renumber(struct gfs2_sbd *sbp, uint64_t root_inode_addr, osi_li
 	struct rgrp_tree *rgd;
 	struct osi_node *n, *next = NULL;
 	uint64_t block = 0;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	int first;
 	int error = 0;
 	int rgs_processed = 0;
@@ -1125,7 +1125,7 @@ static int fetch_inum(struct gfs2_sbd *sbp, uint64_t iblock,
 /* Returns: 0 on success, -1 on failure, -EISDIR when dentmod marked DT_DIR  */
 /* ------------------------------------------------------------------------- */
 static int process_dirent_info(struct lgfs2_inode *dip, struct gfs2_sbd *sbp,
-			       struct gfs2_buffer_head *bh, int dir_entries, uint64_t dentmod)
+			       struct lgfs2_buffer_head *bh, int dir_entries, uint64_t dentmod)
 {
 	int error = 0;
 	struct gfs2_dirent *dent;
@@ -1246,7 +1246,7 @@ static int process_dirent_info(struct lgfs2_inode *dip, struct gfs2_sbd *sbp,
 /* ------------------------------------------------------------------------- */
 static int fix_one_directory_exhash(struct gfs2_sbd *sbp, struct lgfs2_inode *dip, uint64_t dentmod)
 {
-	struct gfs2_buffer_head *bh_leaf;
+	struct lgfs2_buffer_head *bh_leaf;
 	int error;
 	uint64_t leaf_block, prev_leaf_block;
 	uint32_t leaf_num;
@@ -1382,7 +1382,7 @@ static int fix_cdpn_symlinks(struct gfs2_sbd *sbp, osi_list_t *cdpn_to_fix)
 	osi_list_foreach_safe(tmp, cdpn_to_fix, x) {
 		struct lgfs2_inum fix, dir;
 		struct inode_dir_block *l_fix;
-		struct gfs2_buffer_head *bh = NULL;
+		struct lgfs2_buffer_head *bh = NULL;
 		struct lgfs2_inode *fix_inode;
 		uint64_t eablk;
 
@@ -1562,7 +1562,7 @@ static int gfs1_ri_update(struct gfs2_sbd *sdp, int *rgcount, int quiet)
 /* ------------------------------------------------------------------------- */
 static int init(struct gfs2_sbd *sbp, struct gfs2_options *opts)
 {
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	int rgcount;
 	struct lgfs2_inum inum;
 
@@ -2203,7 +2203,7 @@ static int gfs2_query(struct gfs2_options *opts, const char *dev)
 int main(int argc, char **argv)
 {
 	int error;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	struct gfs2_options opts;
 
 	/* Set i18n support to gfs2_convert */
diff --git a/gfs2/edit/extended.c b/gfs2/edit/extended.c
index 8aed9fa9..98c0dfce 100644
--- a/gfs2/edit/extended.c
+++ b/gfs2/edit/extended.c
@@ -623,7 +623,7 @@ static int print_quota(struct lgfs2_inode *diq)
 int display_extended(void)
 {
 	struct lgfs2_inode *tmp_inode;
-	struct gfs2_buffer_head *tmp_bh;
+	struct lgfs2_buffer_head *tmp_bh;
 
 	dsplines = termlines - line - 1;
 	/* Display any indirect pointers that we have. */
diff --git a/gfs2/edit/gfs2hex.c b/gfs2/edit/gfs2hex.c
index cdf22042..d167bdb4 100644
--- a/gfs2/edit/gfs2hex.c
+++ b/gfs2/edit/gfs2hex.c
@@ -186,7 +186,7 @@ void do_dinode_extended(char *buf)
 			p = be64_to_cpu(*(__be64 *)(buf + x));
 
 			if (p != last || ((y + 1) * sizeof(uint64_t) == be64_to_cpu(dip->di_size))) {
-				struct gfs2_buffer_head *tmp_bh;
+				struct lgfs2_buffer_head *tmp_bh;
 				int skip = 0, direntcount = 0;
 				unsigned int bufoffset;
 
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index f2c54b04..3b8f1b48 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -33,7 +33,7 @@ const char *allocdesc[2][5] = {
 	{"Free ", "Data ", "Unlnk", "Meta ", "Resrv"},
 	{"Free ", "Data ", "FreeM", "Meta ", "Resrv"},};
 
-static struct gfs2_buffer_head *bh;
+static struct lgfs2_buffer_head *bh;
 static int pgnum;
 static long int gziplevel = 9;
 static int termcols;
@@ -754,7 +754,7 @@ static uint64_t get_rg_addr(int rgnum)
 /* ------------------------------------------------------------------------ */
 static void set_rgrp_flags(int rgnum, uint32_t new_flags, int modify, int full)
 {
-	struct gfs2_buffer_head *rbh;
+	struct lgfs2_buffer_head *rbh;
 	struct gfs2_rgrp *rg;
 	uint64_t rgblk;
 
@@ -1130,7 +1130,7 @@ static uint64_t find_metablockoftype_slow(uint64_t startblk, int metatype, int p
 {
 	uint64_t blk, last_fs_block;
 	int found = 0;
-	struct gfs2_buffer_head *lbh;
+	struct lgfs2_buffer_head *lbh;
 
 	last_fs_block = lseek(sbd.device_fd, 0, SEEK_END) / sbd.sd_bsize;
 	for (blk = startblk + 1; blk < last_fs_block; blk++) {
@@ -1164,7 +1164,7 @@ static int find_rg_metatype(struct rgrp_tree *rgd, uint64_t *blk, uint64_t start
 {
 	int found;
 	unsigned i, j, m;
-	struct gfs2_buffer_head *bhp = NULL;
+	struct lgfs2_buffer_head *bhp = NULL;
 	uint64_t *ibuf = malloc(sbd.sd_bsize * GFS2_NBBY * sizeof(uint64_t));
 
 	for (i = 0; i < rgd->rt_length; i++) {
@@ -1581,7 +1581,7 @@ static void print_block_type(uint64_t tblock, const struct lgfs2_metadata *type)
 static void find_print_block_type(void)
 {
 	uint64_t tblock;
-	struct gfs2_buffer_head *lbh;
+	struct lgfs2_buffer_head *lbh;
 	const struct lgfs2_metadata *type;
 
 	tblock = blockstack[blockhist % BLOCK_STACK_SIZE].block;
@@ -1696,7 +1696,7 @@ static void find_change_block_alloc(int *newval)
 static void process_field(const char *field, const char *nstr)
 {
 	uint64_t fblock;
-	struct gfs2_buffer_head *rbh;
+	struct lgfs2_buffer_head *rbh;
 	const struct lgfs2_metadata *mtype;
 	const struct lgfs2_metafield *mfield;
 
@@ -2117,9 +2117,9 @@ static void getgziplevel(char *argv[], int *i)
 }
 
 static int count_dinode_blks(struct rgrp_tree *rgd, int bitmap,
-			     struct gfs2_buffer_head *rbh)
+			     struct lgfs2_buffer_head *rbh)
 {
-	struct gfs2_buffer_head *tbh;
+	struct lgfs2_buffer_head *tbh;
 	uint64_t b;
 	int dinodes = 0;
 	char *byte, cur_state, new_state;
@@ -2150,7 +2150,7 @@ static int count_dinode_blks(struct rgrp_tree *rgd, int bitmap,
 	return dinodes;
 }
 
-static int count_dinode_bits(struct gfs2_buffer_head *rbh)
+static int count_dinode_bits(struct lgfs2_buffer_head *rbh)
 {
 	uint64_t blk;
 	struct gfs2_meta_header *mh = (struct gfs2_meta_header *)rbh->b_data;
@@ -2174,7 +2174,7 @@ static int count_dinode_bits(struct gfs2_buffer_head *rbh)
 
 static void rg_repair(void)
 {
-	struct gfs2_buffer_head *rbh;
+	struct lgfs2_buffer_head *rbh;
 	struct rgrp_tree *rgd;
 	struct osi_node *n;
 	int b;
diff --git a/gfs2/edit/journal.c b/gfs2/edit/journal.c
index b083e6dd..492f539c 100644
--- a/gfs2/edit/journal.c
+++ b/gfs2/edit/journal.c
@@ -35,7 +35,7 @@ uint64_t find_journal_block(const char *journal, uint64_t *j_size)
 	int journal_num;
 	uint64_t jindex_block, jblock = 0;
 	int amtread;
-	struct gfs2_buffer_head *jindex_bh, *j_bh;
+	struct lgfs2_buffer_head *jindex_bh, *j_bh;
 
 	journal_num = atoi(journal + 7);
 	if (journal_num < 0)
@@ -106,7 +106,7 @@ static int fsck_readi(struct lgfs2_inode *ip, void *rbuf, uint64_t roffset,
 	       unsigned int size, uint64_t *abs_block)
 {
 	struct gfs2_sbd *sdp;
-	struct gfs2_buffer_head *lbh;
+	struct lgfs2_buffer_head *lbh;
 	uint64_t lblock, dblock;
 	unsigned int o;
 	uint32_t extlen = 0;
@@ -202,7 +202,7 @@ static int print_ld_blks(const __be64 *b, const char *end, int start_line,
 {
 	int bcount = 0, found_tblk = 0, found_bblk = 0;
 	static char str[256];
-	struct gfs2_buffer_head *j_bmap_bh;
+	struct lgfs2_buffer_head *j_bmap_bh;
 
 	if (tblk_off)
 		*tblk_off = 0;
@@ -326,7 +326,7 @@ static uint64_t find_wrap_pt(struct lgfs2_inode *ji, char *jbuf, uint64_t jblock
 		int found = 0;
 
 		if (sbd.gfs1) {
-			struct gfs2_buffer_head *j_bh;
+			struct lgfs2_buffer_head *j_bh;
 
 			j_bh = lgfs2_bread(&sbd, jblock + jb);
 			found = is_wrap_pt(j_bh->b_data, &highest_seq);
@@ -410,7 +410,7 @@ static int process_ld(uint64_t abs_block, uint64_t wrappt, uint64_t j_size,
 static int meta_has_ref(uint64_t abs_block, int tblk)
 {
 	const struct lgfs2_metadata *mtype;
-	struct gfs2_buffer_head *mbh;
+	struct lgfs2_buffer_head *mbh;
 	int structlen = 0, has_ref = 0;
 	__be64 *b;
 	struct gfs2_dinode *dinode;
@@ -445,7 +445,7 @@ static int meta_has_ref(uint64_t abs_block, int tblk)
  */
 static uint64_t get_ldref(uint64_t abs_ld, int offset_from_ld)
 {
-	struct gfs2_buffer_head *jbh;
+	struct lgfs2_buffer_head *jbh;
 	uint64_t refblk;
 	__be64 *b;
 
@@ -502,7 +502,7 @@ static void display_log_header(void *buf, uint64_t *highest_seq, uint64_t abs_bl
 void dump_journal(const char *journal, uint64_t tblk)
 {
 	const struct lgfs2_metadata *mtype;
-	struct gfs2_buffer_head *j_bh = NULL;
+	struct lgfs2_buffer_head *j_bh = NULL;
 	uint64_t jblock, j_size, jb, abs_block, saveblk, wrappt = 0;
 	int start_line, journal_num;
 	struct lgfs2_inode *j_inode = NULL;
diff --git a/gfs2/fsck/afterpass1_common.c b/gfs2/fsck/afterpass1_common.c
index 6ce2dfd2..9b0788b9 100644
--- a/gfs2/fsck/afterpass1_common.c
+++ b/gfs2/fsck/afterpass1_common.c
@@ -74,7 +74,7 @@ more_refs:
  * If all duplicate references have been removed, delete the block.
  */
 static int delete_block_if_notdup(struct lgfs2_inode *ip, uint64_t block,
-				  struct gfs2_buffer_head **bh,
+				  struct lgfs2_buffer_head **bh,
 				  const char *btype, int *was_duplicate,
 				  void *private)
 {
@@ -111,7 +111,7 @@ static int delete_block_if_notdup(struct lgfs2_inode *ip, uint64_t block,
 
 static int remove_dentry(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			 struct gfs2_dirent *prev_de,
-			 struct gfs2_buffer_head *bh,
+			 struct lgfs2_buffer_head *bh,
 			 char *filename, uint32_t *count, int *lindex,
 			 void *private)
 {
@@ -166,7 +166,7 @@ int remove_dentry_from_dir(struct gfs2_sbd *sdp, uint64_t dir,
 	return error;
 }
 
-int delete_metadata(struct iptr iptr, struct gfs2_buffer_head **bh, int h, int *is_valid,
+int delete_metadata(struct iptr iptr, struct lgfs2_buffer_head **bh, int h, int *is_valid,
 		    int *was_duplicate, void *private)
 {
 	struct lgfs2_inode *ip = iptr.ipt_ip;
@@ -185,7 +185,7 @@ int delete_leaf(struct lgfs2_inode *ip, uint64_t block, void *private)
 }
 
 int delete_data(struct lgfs2_inode *ip, uint64_t metablock,
-		uint64_t block, void *private, struct gfs2_buffer_head *bh,
+		uint64_t block, void *private, struct lgfs2_buffer_head *bh,
 		__be64 *ptr)
 {
 	return delete_block_if_notdup(ip, block, NULL, _("data"), NULL,
@@ -193,7 +193,7 @@ int delete_data(struct lgfs2_inode *ip, uint64_t metablock,
 }
 
 static int del_eattr_generic(struct lgfs2_inode *ip, uint64_t block,
-			     uint64_t parent, struct gfs2_buffer_head **bh,
+			     uint64_t parent, struct lgfs2_buffer_head **bh,
 			     void *private, const char *eatype)
 {
 	int ret = 0;
@@ -224,20 +224,20 @@ static int del_eattr_generic(struct lgfs2_inode *ip, uint64_t block,
 }
 
 int delete_eattr_indir(struct lgfs2_inode *ip, uint64_t block, uint64_t parent,
-		       struct gfs2_buffer_head **bh, void *private)
+		       struct lgfs2_buffer_head **bh, void *private)
 {
 	return del_eattr_generic(ip, block, parent, bh, private,
 				 _("extended attribute"));
 }
 
 int delete_eattr_leaf(struct lgfs2_inode *ip, uint64_t block, uint64_t parent,
-		      struct gfs2_buffer_head **bh, void *private)
+		      struct lgfs2_buffer_head **bh, void *private)
 {
 	return del_eattr_generic(ip, block, parent, bh, private,
 				 _("indirect extended attribute"));
 }
 
-int delete_eattr_entry(struct lgfs2_inode *ip, struct gfs2_buffer_head *leaf_bh,
+int delete_eattr_entry(struct lgfs2_inode *ip, struct lgfs2_buffer_head *leaf_bh,
 		       struct gfs2_ea_header *ea_hdr,
 		       struct gfs2_ea_header *ea_hdr_prev, void *private)
 {
@@ -278,7 +278,7 @@ int delete_eattr_entry(struct lgfs2_inode *ip, struct gfs2_buffer_head *leaf_bh,
 }
 
 int delete_eattr_extentry(struct lgfs2_inode *ip, int i, __be64 *ea_data_ptr,
-			  struct gfs2_buffer_head *leaf_bh, uint32_t tot_ealen,
+			  struct lgfs2_buffer_head *leaf_bh, uint32_t tot_ealen,
 			  struct gfs2_ea_header *ea_hdr,
 			  struct gfs2_ea_header *ea_hdr_prev, void *private)
 {
diff --git a/gfs2/fsck/afterpass1_common.h b/gfs2/fsck/afterpass1_common.h
index 7b5fda25..b0057be4 100644
--- a/gfs2/fsck/afterpass1_common.h
+++ b/gfs2/fsck/afterpass1_common.h
@@ -4,24 +4,24 @@
 #include "util.h"
 #include "metawalk.h"
 
-extern int delete_metadata(struct iptr iptr, struct gfs2_buffer_head **bh, int h, int *is_valid,
+extern int delete_metadata(struct iptr iptr, struct lgfs2_buffer_head **bh, int h, int *is_valid,
 			   int *was_duplicate, void *private);
 extern int delete_leaf(struct lgfs2_inode *ip, uint64_t block, void *private);
 extern int delete_data(struct lgfs2_inode *ip, uint64_t metablock,
 		       uint64_t block, void *private,
-		       struct gfs2_buffer_head *bh, __be64 *ptr);
+		       struct lgfs2_buffer_head *bh, __be64 *ptr);
 extern int delete_eattr_indir(struct lgfs2_inode *ip, uint64_t block, uint64_t parent,
-		       struct gfs2_buffer_head **bh, void *private);
+		       struct lgfs2_buffer_head **bh, void *private);
 extern int delete_eattr_leaf(struct lgfs2_inode *ip, uint64_t block, uint64_t parent,
-		      struct gfs2_buffer_head **bh, void *private);
+		      struct lgfs2_buffer_head **bh, void *private);
 extern int delete_eattr_entry(struct lgfs2_inode *ip,
-			      struct gfs2_buffer_head *leaf_bh,
+			      struct lgfs2_buffer_head *leaf_bh,
 			      struct gfs2_ea_header *ea_hdr,
 			      struct gfs2_ea_header *ea_hdr_prev,
 			      void *private);
 extern int delete_eattr_extentry(struct lgfs2_inode *ip, int i,
 				 __be64 *ea_data_ptr,
-				 struct gfs2_buffer_head *leaf_bh,
+				 struct lgfs2_buffer_head *leaf_bh,
 				 uint32_t tot_ealen,
 				 struct gfs2_ea_header *ea_hdr,
 				 struct gfs2_ea_header *ea_hdr_prev,
diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index c5f82e47..11dc4792 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -99,7 +99,7 @@ static void revoke_clean(struct gfs2_sbd *sdp)
 }
 
 static void refresh_rgrp(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
-			 struct gfs2_buffer_head *bh, uint64_t blkno)
+			 struct lgfs2_buffer_head *bh, uint64_t blkno)
 {
 	int i;
 
@@ -127,7 +127,7 @@ static int buf_lo_scan_elements(struct lgfs2_inode *ip, unsigned int start,
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	unsigned int blks = be32_to_cpu(ld->ld_data1);
-	struct gfs2_buffer_head *bh_log, *bh_ip;
+	struct lgfs2_buffer_head *bh_log, *bh_ip;
 	uint64_t blkno;
 	int error = 0;
 	struct rgrp_tree *rgd;
@@ -189,7 +189,7 @@ static int revoke_lo_scan_elements(struct lgfs2_inode *ip, unsigned int start,
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	unsigned int blks = be32_to_cpu(ld->ld_length);
 	unsigned int revokes = be32_to_cpu(ld->ld_data1);
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	unsigned int offset;
 	uint64_t blkno;
 	int first = 1;
@@ -238,7 +238,7 @@ static int databuf_lo_scan_elements(struct lgfs2_inode *ip, unsigned int start,
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	unsigned int blks = be32_to_cpu(ld->ld_data1);
-	struct gfs2_buffer_head *bh_log, *bh_ip;
+	struct lgfs2_buffer_head *bh_log, *bh_ip;
 	uint64_t blkno;
 	uint64_t esc;
 	int error = 0;
@@ -301,7 +301,7 @@ static int databuf_lo_scan_elements(struct lgfs2_inode *ip, unsigned int start,
 static int foreach_descriptor(struct lgfs2_inode *ip, unsigned int start,
 		       unsigned int end, int pass)
 {
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	struct gfs2_log_descriptor *ld;
 	int error = 0;
 	uint32_t length;
@@ -394,7 +394,7 @@ static int check_journal_seq_no(struct lgfs2_inode *ip, int fix)
 	uint64_t highest_seq = 0, lowest_seq = 0, prev_seq = 0;
 	int new = 0;
 	uint64_t dblock;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	int seq_errors = 0;
 
 	memset(&lh, 0, sizeof(lh));
@@ -620,7 +620,7 @@ static int rangecheck_jblock(struct lgfs2_inode *ip, uint64_t block)
 	return META_IS_GOOD;
 }
 
-static int rangecheck_jmeta(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
+static int rangecheck_jmeta(struct iptr iptr, struct lgfs2_buffer_head **bh, int h,
                             int *is_valid, int *was_duplicate, void *private)
 {
 	struct lgfs2_inode *ip = iptr.ipt_ip;
@@ -650,7 +650,7 @@ static int rangecheck_jmeta(struct iptr iptr, struct gfs2_buffer_head **bh, int
 
 static int rangecheck_jdata(struct lgfs2_inode *ip, uint64_t metablock,
 			    uint64_t block, void *private,
-			    struct gfs2_buffer_head *bh, __be64 *ptr)
+			    struct lgfs2_buffer_head *bh, __be64 *ptr)
 {
 	return rangecheck_jblock(ip, block);
 }
@@ -810,7 +810,7 @@ static void bad_journalname(const char *filename, int len)
  */
 static int check_jindex_dent(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			     struct gfs2_dirent *prev_de,
-			     struct gfs2_buffer_head *bh, char *filename,
+			     struct lgfs2_buffer_head *bh, char *filename,
 			     uint32_t *count, int *lindex, void *priv)
 {
 	struct lgfs2_dirent d;
diff --git a/gfs2/fsck/fsck.h b/gfs2/fsck/fsck.h
index 6bfb6321..1645b853 100644
--- a/gfs2/fsck/fsck.h
+++ b/gfs2/fsck/fsck.h
@@ -111,7 +111,7 @@ enum rgindex_trust_level { /* how far can we trust our RG index? */
 extern struct lgfs2_inode *fsck_load_inode(struct gfs2_sbd *sdp, uint64_t block);
 extern struct lgfs2_inode *fsck_inode_get(struct gfs2_sbd *sdp,
 					 struct rgrp_tree *rgd,
-					 struct gfs2_buffer_head *bh);
+					 struct lgfs2_buffer_head *bh);
 extern void fsck_inode_put(struct lgfs2_inode **ip);
 
 extern int initialize(struct gfs2_sbd *sdp, int force_check, int preen,
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index 16e7f065..8ccfda3e 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -193,7 +193,7 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 	int rgb, x, y, off, bytes_to_check, total_bytes_to_check, asked = 0;
 	unsigned int state;
 	uint64_t diblock;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 
 	rg_free = rg_reclaimed = rg_unlinked = rg_usedmeta = rg_useddi = 0;
 	total_bytes_to_check = rgd->rt_bitbytes;
@@ -435,7 +435,7 @@ static void check_rgrps_integrity(struct gfs2_sbd *sdp)
 static int rebuild_master(struct gfs2_sbd *sdp)
 {
 	struct lgfs2_inum inum;
-	struct gfs2_buffer_head *bh = NULL;
+	struct lgfs2_buffer_head *bh = NULL;
 	int err = 0;
 
 	log_err(_("The system master directory seems to be destroyed.\n"));
@@ -1069,7 +1069,7 @@ static void peruse_user_dinode(struct gfs2_sbd *sdp, struct lgfs2_inode *ip)
 		return;             /* it can't lead us to the root anyway */
 
 	if (ip->i_num.in_formal_ino == 1) {
-		struct gfs2_buffer_head *root_bh;
+		struct lgfs2_buffer_head *root_bh;
 
 		if (ip->i_num.in_addr == ip->i_bh->b_blocknr) {
 			log_warn(_("Found the root directory at: 0x%"PRIx64".\n"),
@@ -1126,7 +1126,7 @@ static int find_rgs_for_bsize(struct gfs2_sbd *sdp, uint64_t startblock,
 			      uint32_t *known_bsize)
 {
 	uint64_t blk, max_rg_size, rb_addr;
-	struct gfs2_buffer_head *bh, *rb_bh;
+	struct lgfs2_buffer_head *bh, *rb_bh;
 	uint32_t bsize, bsize2;
 	int found_rg;
 
@@ -1193,7 +1193,7 @@ static int find_rgs_for_bsize(struct gfs2_sbd *sdp, uint64_t startblock,
 static int peruse_metadata(struct gfs2_sbd *sdp, uint64_t startblock)
 {
 	uint64_t blk, max_rg_size;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	struct lgfs2_inode *ip;
 
 	max_rg_size = 2147483648ull / sdp->sd_bsize;
@@ -1273,7 +1273,7 @@ static int sb_repair(struct gfs2_sbd *sdp)
 		sdp->sd_root_dir.in_addr = possible_root;
 		sdp->md.rooti = lgfs2_inode_read(sdp, possible_root);
 		if (!sdp->md.rooti || sdp->md.rooti->i_magic != GFS2_MAGIC) {
-			struct gfs2_buffer_head *bh = NULL;
+			struct lgfs2_buffer_head *bh = NULL;
 			struct lgfs2_inum inum;
 
 			log_err(_("The root dinode block is destroyed.\n"));
@@ -1377,7 +1377,7 @@ static int reconstruct_single_journal(struct gfs2_sbd *sdp, int jnum,
 				      uint32_t ji_nsegment)
 {
 	uint64_t first = sdp->md.journal[jnum]->i_num.in_addr;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	uint64_t sequence;
 
 	srandom(time(NULL));
diff --git a/gfs2/fsck/metawalk.c b/gfs2/fsck/metawalk.c
index 70e182bd..575bb01b 100644
--- a/gfs2/fsck/metawalk.c
+++ b/gfs2/fsck/metawalk.c
@@ -267,7 +267,7 @@ struct lgfs2_inode *fsck_load_inode(struct gfs2_sbd *sdp, uint64_t block)
 /* fsck_inode_get - same as inode_get() in libgfs2 but system inodes
    get special treatment. */
 struct lgfs2_inode *fsck_inode_get(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
-				  struct gfs2_buffer_head *bh)
+				  struct lgfs2_buffer_head *bh)
 {
 	struct lgfs2_inode *sysip;
 	struct lgfs2_inode *ip;
@@ -310,7 +310,7 @@ void fsck_inode_put(struct lgfs2_inode **ip_in)
  * This function tries to repair a corrupt directory entry.  All we
  * know at this point is that the length field is wrong.
  */
-static int dirent_repair(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
+static int dirent_repair(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
 		  struct lgfs2_dirent *d, struct gfs2_dirent *dent,
 		  int type, int first)
 {
@@ -354,7 +354,7 @@ static int dirent_repair(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
  * dirblk_truncate - truncate a directory block
  */
 static void dirblk_truncate(struct lgfs2_inode *ip, struct gfs2_dirent *fixb,
-			    struct gfs2_buffer_head *bh)
+			    struct lgfs2_buffer_head *bh)
 {
 	char *bh_end;
 	struct lgfs2_dirent d;
@@ -381,7 +381,7 @@ static void dirblk_truncate(struct lgfs2_inode *ip, struct gfs2_dirent *fixb,
  * returns: 0 - good block or it was repaired to be good
  *         -1 - error occurred
  */
-static int check_entries(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
+static int check_entries(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
 			 int type, uint32_t *count, int lindex,
 			 struct metawalk_fxns *pass)
 {
@@ -515,7 +515,7 @@ int check_leaf(struct lgfs2_inode *ip, int lindex, struct metawalk_fxns *pass,
 	       uint64_t *leaf_no, struct lgfs2_leaf *leaf, int *ref_count)
 {
 	int error = 0, fix;
-	struct gfs2_buffer_head *lbh = NULL;
+	struct lgfs2_buffer_head *lbh = NULL;
 	struct gfs2_leaf *lfp;
 	uint32_t count = 0;
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -684,7 +684,7 @@ int check_leaf_blks(struct lgfs2_inode *ip, struct metawalk_fxns *pass)
 	unsigned hsize = (1 << ip->i_depth);
 	uint64_t leaf_no, leaf_next;
 	uint64_t first_ok_leaf, orig_di_blocks;
-	struct gfs2_buffer_head *lbh;
+	struct lgfs2_buffer_head *lbh;
 	int lindex;
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	int ref_count, orig_ref_count, orig_di_depth, orig_di_height;
@@ -837,7 +837,7 @@ int check_leaf_blks(struct lgfs2_inode *ip, struct metawalk_fxns *pass)
 }
 
 static int check_eattr_entries(struct lgfs2_inode *ip,
-			       struct gfs2_buffer_head *bh,
+			       struct lgfs2_buffer_head *bh,
 			       struct metawalk_fxns *pass)
 {
 	struct gfs2_ea_header *ea_hdr, *ea_hdr_prev = NULL;
@@ -915,7 +915,7 @@ static int check_eattr_entries(struct lgfs2_inode *ip,
 static int check_leaf_eattr(struct lgfs2_inode *ip, uint64_t block,
 			    uint64_t parent, struct metawalk_fxns *pass)
 {
-	struct gfs2_buffer_head *bh = NULL;
+	struct lgfs2_buffer_head *bh = NULL;
 
 	if (pass->check_eattr_leaf) {
 		int error = 0;
@@ -953,7 +953,7 @@ static int check_leaf_eattr(struct lgfs2_inode *ip, uint64_t block,
  * Returns: 0 on success -1 on error
  */
 static int check_indirect_eattr(struct lgfs2_inode *ip, uint64_t indirect,
-				struct gfs2_buffer_head *indirect_buf,
+				struct lgfs2_buffer_head *indirect_buf,
 				struct metawalk_fxns *pass)
 {
 	int error = 0, err;
@@ -1040,7 +1040,7 @@ static int check_indirect_eattr(struct lgfs2_inode *ip, uint64_t indirect,
 int check_inode_eattr(struct lgfs2_inode *ip, struct metawalk_fxns *pass)
 {
 	int error = 0;
-	struct gfs2_buffer_head *indirect_buf = NULL;
+	struct lgfs2_buffer_head *indirect_buf = NULL;
 
 	if (!ip->i_eattr)
 		return 0;
@@ -1078,7 +1078,7 @@ static void free_metalist(struct lgfs2_inode *ip, osi_list_t *mlp)
 {
 	unsigned int height = ip->i_height;
 	unsigned int i;
-	struct gfs2_buffer_head *nbh;
+	struct lgfs2_buffer_head *nbh;
 
 	for (i = 0; i <= height; i++) {
 		osi_list_t *list;
@@ -1086,7 +1086,7 @@ static void free_metalist(struct lgfs2_inode *ip, osi_list_t *mlp)
 		list = &mlp[i];
 		while (!osi_list_empty(list)) {
 			nbh = osi_list_entry(list->next,
-					     struct gfs2_buffer_head, b_altlist);
+					     struct lgfs2_buffer_head, b_altlist);
 			if (nbh == ip->i_bh)
 				osi_list_del_init(&nbh->b_altlist);
 			else
@@ -1095,7 +1095,7 @@ static void free_metalist(struct lgfs2_inode *ip, osi_list_t *mlp)
 	}
 }
 
-static void file_ra(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
+static void file_ra(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
 		    int head_size, int maxptrs, int h)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -1149,7 +1149,7 @@ static void file_ra(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
 			      extlen * sdp->sd_bsize, POSIX_FADV_WILLNEED);
 }
 
-static int do_check_metalist(struct iptr iptr, int height, struct gfs2_buffer_head **bhp,
+static int do_check_metalist(struct iptr iptr, int height, struct lgfs2_buffer_head **bhp,
                              struct metawalk_fxns *pass)
 {
 	struct lgfs2_inode *ip = iptr.ipt_ip;
@@ -1211,7 +1211,7 @@ static int build_and_check_metalist(struct lgfs2_inode *ip, osi_list_t *mlp,
 				    struct metawalk_fxns *pass)
 {
 	uint32_t height = ip->i_height;
-	struct gfs2_buffer_head *metabh = ip->i_bh;
+	struct lgfs2_buffer_head *metabh = ip->i_bh;
 	osi_list_t *prev_list, *cur_list, *tmp;
 	struct iptr iptr = { .ipt_ip = ip, NULL, 0};
 	int h, head_size, iblk_type;
@@ -1257,7 +1257,7 @@ static int build_and_check_metalist(struct lgfs2_inode *ip, osi_list_t *mlp,
 
 		for (tmp = prev_list->next; tmp != prev_list; tmp = tmp->next) {
 			iptr.ipt_off = head_size;
-			iptr.ipt_bh = osi_list_entry(tmp, struct gfs2_buffer_head, b_altlist);
+			iptr.ipt_bh = osi_list_entry(tmp, struct lgfs2_buffer_head, b_altlist);
 
 			if (lgfs2_check_meta(iptr_buf(iptr), iblk_type)) {
 				if (pass->invalid_meta_is_fatal)
@@ -1270,7 +1270,7 @@ static int build_and_check_metalist(struct lgfs2_inode *ip, osi_list_t *mlp,
 
 			/* Now check the metadata itself */
 			for (; iptr.ipt_off < ip->i_sbd->sd_bsize; iptr.ipt_off += sizeof(uint64_t)) {
-				struct gfs2_buffer_head *nbh = NULL;
+				struct lgfs2_buffer_head *nbh = NULL;
 
 				if (skip_this_pass || fsck_abort)
 					return META_IS_GOOD;
@@ -1309,7 +1309,7 @@ error_undo: /* undo what we've done so far for this block */
 	return error;
 }
 
-static unsigned int hdr_size(struct gfs2_buffer_head *bh, unsigned int height)
+static unsigned int hdr_size(struct lgfs2_buffer_head *bh, unsigned int height)
 {
 	if (height > 1) {
 		if (bh->sdp->gfs1)
@@ -1381,7 +1381,7 @@ static void report_data_error(uint64_t metablock, int offset, uint64_t block,
  *          2 (ENOENT) is there were too many bad pointers
  */
 static int metawalk_check_data(struct lgfs2_inode *ip, struct metawalk_fxns *pass,
-		      struct gfs2_buffer_head *bh, unsigned int height,
+		      struct lgfs2_buffer_head *bh, unsigned int height,
 		      uint64_t *blks_checked, struct error_block *error_blk)
 {
 	int error = 0, rc = 0;
@@ -1449,7 +1449,7 @@ static int report_undo_data_error(uint64_t metablock, int offset, uint64_t block
 }
 
 static int undo_check_data(struct lgfs2_inode *ip, struct metawalk_fxns *pass,
-			   struct gfs2_buffer_head *bh, unsigned int height,
+			   struct lgfs2_buffer_head *bh, unsigned int height,
 			   struct error_block *error_blk, int error)
 {
 	__be64 *ptr_start = (__be64 *)(bh->b_data + hdr_size(bh, height));
@@ -1478,7 +1478,7 @@ static int undo_check_data(struct lgfs2_inode *ip, struct metawalk_fxns *pass,
 	return found_error_blk;
 }
 
-static unsigned int should_check(struct gfs2_buffer_head *bh, unsigned int height)
+static unsigned int should_check(struct lgfs2_buffer_head *bh, unsigned int height)
 {
 	int iblk_type = height > 1 ? GFS2_METATYPE_IN : GFS2_METATYPE_DI;
 
@@ -1496,7 +1496,7 @@ int check_metatree(struct lgfs2_inode *ip, struct metawalk_fxns *pass)
 	unsigned int height = ip->i_height;
 	osi_list_t *metalist = alloca((height + 1) * sizeof(*metalist));
 	osi_list_t *list, *tmp;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	unsigned int i;
 	uint64_t blks_checked = 0;
 	int error, rc;
@@ -1542,7 +1542,7 @@ int check_metatree(struct lgfs2_inode *ip, struct metawalk_fxns *pass)
 			free_metalist(ip, metalist);
 			return 0;
 		}
-		bh = osi_list_entry(tmp, struct gfs2_buffer_head, b_altlist);
+		bh = osi_list_entry(tmp, struct lgfs2_buffer_head, b_altlist);
 		if (!should_check(bh, height))
 			continue;
 
@@ -1576,7 +1576,7 @@ undo_metalist:
 		while (!osi_list_empty(&metalist[i])) {
 			list = &metalist[i];
 			bh = osi_list_entry(list->next,
-					    struct gfs2_buffer_head,
+					    struct lgfs2_buffer_head,
 					    b_altlist);
 			log_err(_("Undoing metadata work for block %"PRIu64" (0x%"PRIx64")\n"),
 			        bh->b_blocknr, bh->b_blocknr);
@@ -1624,7 +1624,7 @@ out:
 }
 
 /* Checks stuffed inode directories */
-int check_linear_dir(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
+int check_linear_dir(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
 		     struct metawalk_fxns *pass)
 {
 	int error = 0;
diff --git a/gfs2/fsck/metawalk.h b/gfs2/fsck/metawalk.h
index ce2e8efd..76190685 100644
--- a/gfs2/fsck/metawalk.h
+++ b/gfs2/fsck/metawalk.h
@@ -14,7 +14,7 @@ extern int check_metatree(struct lgfs2_inode *ip, struct metawalk_fxns *pass);
 extern int check_leaf_blks(struct lgfs2_inode *ip, struct metawalk_fxns *pass);
 extern int check_dir(struct gfs2_sbd *sdp, struct lgfs2_inode *ip,
 		     struct metawalk_fxns *pass);
-extern int check_linear_dir(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
+extern int check_linear_dir(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
 			    struct metawalk_fxns *pass);
 extern int check_leaf(struct lgfs2_inode *ip, int lindex,
 		      struct metawalk_fxns *pass, uint64_t *leaf_no,
@@ -44,7 +44,7 @@ enum meta_check_rc {
 
 struct iptr {
 	struct lgfs2_inode *ipt_ip;
-	struct gfs2_buffer_head *ipt_bh;
+	struct lgfs2_buffer_head *ipt_bh;
 	unsigned ipt_off;
 };
 
@@ -73,7 +73,7 @@ struct metawalk_fxns {
 	int invalid_meta_is_fatal;
 	int readahead;
 	int (*check_leaf_depth) (struct lgfs2_inode *ip, uint64_t leaf_no,
-				 int ref_count, struct gfs2_buffer_head *lbh);
+				 int ref_count, struct lgfs2_buffer_head *lbh);
 	int (*check_leaf) (struct lgfs2_inode *ip, uint64_t block,
 			   void *private);
 	/* parameters to the check_metalist sub-functions:
@@ -91,31 +91,31 @@ struct metawalk_fxns {
 	            1 - skip further processing
 	*/
 	int (*check_metalist) (struct iptr iptr,
-			       struct gfs2_buffer_head **bh, int h,
+			       struct lgfs2_buffer_head **bh, int h,
 			       int *is_valid, int *was_duplicate,
 			       void *private);
 	int (*check_data) (struct lgfs2_inode *ip, uint64_t metablock,
 			   uint64_t block, void *private,
-			   struct gfs2_buffer_head *bh, __be64 *ptr);
+			   struct lgfs2_buffer_head *bh, __be64 *ptr);
 	int (*check_eattr_indir) (struct lgfs2_inode *ip, uint64_t block,
 				  uint64_t parent,
-				  struct gfs2_buffer_head **bh, void *private);
+				  struct lgfs2_buffer_head **bh, void *private);
 	int (*check_eattr_leaf) (struct lgfs2_inode *ip, uint64_t block,
-				 uint64_t parent, struct gfs2_buffer_head **bh,
+				 uint64_t parent, struct lgfs2_buffer_head **bh,
 				 void *private);
 	int (*check_dentry) (struct lgfs2_inode *ip, struct gfs2_dirent *de,
 			     struct gfs2_dirent *prev,
-			     struct gfs2_buffer_head *bh,
+			     struct lgfs2_buffer_head *bh,
 			     char *filename, uint32_t *count,
 			     int *lindex, void *private);
 	int (*check_eattr_entry) (struct lgfs2_inode *ip,
-				  struct gfs2_buffer_head *leaf_bh,
+				  struct lgfs2_buffer_head *leaf_bh,
 				  struct gfs2_ea_header *ea_hdr,
 				  struct gfs2_ea_header *ea_hdr_prev,
 				  void *private);
 	int (*check_eattr_extentry) (struct lgfs2_inode *ip, int i,
 				     __be64 *ea_data_ptr,
-				     struct gfs2_buffer_head *leaf_bh,
+				     struct lgfs2_buffer_head *leaf_bh,
 				     uint32_t tot_ealen,
 				     struct gfs2_ea_header *ea_hdr,
 				     struct gfs2_ea_header *ea_hdr_prev,
@@ -132,7 +132,7 @@ struct metawalk_fxns {
 	int (*undo_check_data) (struct lgfs2_inode *ip, uint64_t block,
 				void *private);
 	int (*delete_block) (struct lgfs2_inode *ip, uint64_t block,
-			     struct gfs2_buffer_head **bh, const char *btype,
+			     struct lgfs2_buffer_head **bh, const char *btype,
 			     void *private);
 };
 
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index a8e0fa47..a0c6394a 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -39,29 +39,29 @@ struct block_count {
 };
 
 static int p1check_leaf(struct lgfs2_inode *ip, uint64_t block, void *private);
-static int pass1_check_metalist(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
+static int pass1_check_metalist(struct iptr iptr, struct lgfs2_buffer_head **bh, int h,
                                 int *is_valid, int *was_duplicate, void *private);
 static int undo_check_metalist(struct lgfs2_inode *ip, uint64_t block,
 			       int h, void *private);
 static int pass1_check_data(struct lgfs2_inode *ip, uint64_t metablock,
 		      uint64_t block, void *private,
-		      struct gfs2_buffer_head *bh, __be64 *ptr);
+		      struct lgfs2_buffer_head *bh, __be64 *ptr);
 static int undo_check_data(struct lgfs2_inode *ip, uint64_t block,
 			   void *private);
 static int check_eattr_indir(struct lgfs2_inode *ip, uint64_t indirect,
-			     uint64_t parent, struct gfs2_buffer_head **bh,
+			     uint64_t parent, struct lgfs2_buffer_head **bh,
 			     void *private);
 static int check_eattr_leaf(struct lgfs2_inode *ip, uint64_t block,
-			    uint64_t parent, struct gfs2_buffer_head **bh,
+			    uint64_t parent, struct lgfs2_buffer_head **bh,
 			    void *private);
 static int check_eattr_entries(struct lgfs2_inode *ip,
-			       struct gfs2_buffer_head *leaf_bh,
+			       struct lgfs2_buffer_head *leaf_bh,
 			       struct gfs2_ea_header *ea_hdr,
 			       struct gfs2_ea_header *ea_hdr_prev,
 			       void *private);
 static int check_extended_leaf_eattr(struct lgfs2_inode *ip, int i,
 				     __be64 *data_ptr,
-				     struct gfs2_buffer_head *leaf_bh,
+				     struct lgfs2_buffer_head *leaf_bh,
 				     uint32_t tot_ealen,
 				     struct gfs2_ea_header *ea_hdr,
 				     struct gfs2_ea_header *ea_hdr_prev,
@@ -70,7 +70,7 @@ static int finish_eattr_indir(struct lgfs2_inode *ip, int leaf_pointers,
 			      int leaf_pointer_errors, void *private);
 static int handle_ip(struct gfs2_sbd *sdp, struct lgfs2_inode *ip);
 static int delete_block(struct lgfs2_inode *ip, uint64_t block,
-			struct gfs2_buffer_head **bh, const char *btype,
+			struct lgfs2_buffer_head **bh, const char *btype,
 			void *private);
 
 static int gfs2_blockmap_set(struct gfs2_bmap *bmap, uint64_t bblock, int mark)
@@ -115,7 +115,7 @@ static int _fsck_blockmap_set(struct lgfs2_inode *ip, uint64_t bblock,
  * delete_block - delete a block associated with an inode
  */
 static int delete_block(struct lgfs2_inode *ip, uint64_t block,
-			struct gfs2_buffer_head **bh, const char *btype,
+			struct lgfs2_buffer_head **bh, const char *btype,
 			void *private)
 {
 	if (valid_block_ip(ip, block)) {
@@ -189,7 +189,7 @@ static struct metawalk_fxns pass1_fxns = {
  * marked "in use" by the bitmap.  You don't want root's indirect blocks
  * deleted, do you? Or worse, reused for lost+found.
  */
-static int resuscitate_metalist(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
+static int resuscitate_metalist(struct iptr iptr, struct lgfs2_buffer_head **bh, int h,
                                 int *is_valid, int *was_duplicate, void *private)
 {
 	struct block_count *bc = (struct block_count *)private;
@@ -227,7 +227,7 @@ static int resuscitate_metalist(struct iptr iptr, struct gfs2_buffer_head **bh,
  */
 static int resuscitate_dentry(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			      struct gfs2_dirent *prev_de,
-			      struct gfs2_buffer_head *bh, char *filename,
+			      struct lgfs2_buffer_head *bh, char *filename,
 			      uint32_t *count, int *lindex, void *priv)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -301,13 +301,13 @@ static int p1check_leaf(struct lgfs2_inode *ip, uint64_t block, void *private)
 	return 0;
 }
 
-static int pass1_check_metalist(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
+static int pass1_check_metalist(struct iptr iptr, struct lgfs2_buffer_head **bh, int h,
                                 int *is_valid, int *was_duplicate, void *private)
 {
 	struct block_count *bc = (struct block_count *)private;
 	struct lgfs2_inode *ip = iptr.ipt_ip;
 	uint64_t block = iptr_block(iptr);
-	struct gfs2_buffer_head *nbh;
+	struct lgfs2_buffer_head *nbh;
 	const char *blktypedesc;
 	int iblk_type;
 	int q;
@@ -464,7 +464,7 @@ static int undo_check_data(struct lgfs2_inode *ip, uint64_t block,
 static int blockmap_set_as_data(struct lgfs2_inode *ip, uint64_t block)
 {
 	int error;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	struct gfs2_dinode *di;
 
 	error = fsck_blkmap_set_noino(ip, block, "data", GFS2_BLKST_USED);
@@ -497,7 +497,7 @@ out:
 
 static int pass1_check_data(struct lgfs2_inode *ip, uint64_t metablock,
 		      uint64_t block, void *private,
-		      struct gfs2_buffer_head *bbh, __be64 *ptr)
+		      struct lgfs2_buffer_head *bbh, __be64 *ptr)
 {
 	int q;
 	struct block_count *bc = (struct block_count *) private;
@@ -520,7 +520,7 @@ static int pass1_check_data(struct lgfs2_inode *ip, uint64_t metablock,
 	bc->data_count++; /* keep the count sane anyway */
 	q = block_type(bl, block);
 	if (q != GFS2_BLKST_FREE) {
-		struct gfs2_buffer_head *bh;
+		struct lgfs2_buffer_head *bh;
 		struct gfs2_meta_header *mh;
 		uint32_t mh_type;
 
@@ -621,7 +621,7 @@ static int ask_remove_inode_eattr(struct lgfs2_inode *ip,
 
 static int undo_eattr_indir_or_leaf(struct lgfs2_inode *ip, uint64_t block,
 				    uint64_t parent,
-				    struct gfs2_buffer_head **bh,
+				    struct lgfs2_buffer_head **bh,
 				    void *private)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -665,7 +665,7 @@ static void complain_eas(struct lgfs2_inode *ip, uint64_t block,
 }
 
 static int check_eattr_indir(struct lgfs2_inode *ip, uint64_t indirect,
-			     uint64_t parent, struct gfs2_buffer_head **bh,
+			     uint64_t parent, struct lgfs2_buffer_head **bh,
 			     void *private)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -749,9 +749,9 @@ static int finish_eattr_indir(struct lgfs2_inode *ip, int leaf_pointers,
  *      checks an extended attribute (not directory) leaf block
  */
 static int check_ealeaf_block(struct lgfs2_inode *ip, uint64_t block, int btype,
-			      struct gfs2_buffer_head **bh, void *private)
+			      struct lgfs2_buffer_head **bh, void *private)
 {
-	struct gfs2_buffer_head *leaf_bh = NULL;
+	struct lgfs2_buffer_head *leaf_bh = NULL;
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	int q;
 	struct block_count *bc = (struct block_count *) private;
@@ -814,7 +814,7 @@ static int check_ealeaf_block(struct lgfs2_inode *ip, uint64_t block, int btype,
  */
 static int check_extended_leaf_eattr(struct lgfs2_inode *ip, int i,
 				     __be64 *data_ptr,
-				     struct gfs2_buffer_head *leaf_bh,
+				     struct lgfs2_buffer_head *leaf_bh,
 				     uint32_t tot_ealen,
 				     struct gfs2_ea_header *ea_hdr,
 				     struct gfs2_ea_header *ea_hdr_prev,
@@ -822,7 +822,7 @@ static int check_extended_leaf_eattr(struct lgfs2_inode *ip, int i,
 {
 	uint64_t el_blk = be64_to_cpu(*data_ptr);
 	struct gfs2_sbd *sdp = ip->i_sbd;
-	struct gfs2_buffer_head *bh = NULL;
+	struct lgfs2_buffer_head *bh = NULL;
 	int error = 0;
 
 	if (!valid_block_ip(ip, el_blk)) {
@@ -864,7 +864,7 @@ static int check_extended_leaf_eattr(struct lgfs2_inode *ip, int i,
 }
 
 static int check_eattr_leaf(struct lgfs2_inode *ip, uint64_t block,
-			    uint64_t parent, struct gfs2_buffer_head **bh,
+			    uint64_t parent, struct lgfs2_buffer_head **bh,
 			    void *private)
 {
 	if (!valid_block_ip(ip, block)) {
@@ -880,7 +880,7 @@ static int check_eattr_leaf(struct lgfs2_inode *ip, uint64_t block,
 }
 
 static int ask_remove_eattr_entry(struct gfs2_sbd *sdp,
-				  struct gfs2_buffer_head *leaf_bh,
+				  struct lgfs2_buffer_head *leaf_bh,
 				  struct gfs2_ea_header *curr,
 				  struct gfs2_ea_header *prev,
 				  int fix_curr, int fix_curr_len)
@@ -921,7 +921,7 @@ static int eatype_max(unsigned fs_format)
 }
 
 static int check_eattr_entries(struct lgfs2_inode *ip,
-			       struct gfs2_buffer_head *leaf_bh,
+			       struct lgfs2_buffer_head *leaf_bh,
 			       struct gfs2_ea_header *ea_hdr,
 			       struct gfs2_ea_header *ea_hdr_prev,
 			       void *private)
@@ -1007,7 +1007,7 @@ static const char *btypes[5] = {
 	"extended attribute" };
 
 static int rangecheck_block(struct lgfs2_inode *ip, uint64_t block,
-			    struct gfs2_buffer_head **bh, enum b_types btype,
+			    struct lgfs2_buffer_head **bh, enum b_types btype,
 			    void *private)
 {
 	long *bad_pointers = (long *)private;
@@ -1042,7 +1042,7 @@ static int rangecheck_block(struct lgfs2_inode *ip, uint64_t block,
 	return META_IS_GOOD;
 }
 
-static int rangecheck_metadata(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
+static int rangecheck_metadata(struct iptr iptr, struct lgfs2_buffer_head **bh, int h,
                                int *is_valid, int *was_duplicate, void *private)
 {
 	struct lgfs2_inode *ip = iptr.ipt_ip;
@@ -1061,20 +1061,20 @@ static int rangecheck_leaf(struct lgfs2_inode *ip, uint64_t block,
 
 static int rangecheck_data(struct lgfs2_inode *ip, uint64_t metablock,
 			   uint64_t block, void *private,
-			   struct gfs2_buffer_head *bh, __be64 *ptr)
+			   struct lgfs2_buffer_head *bh, __be64 *ptr)
 {
 	return rangecheck_block(ip, block, NULL, BTYPE_DATA, private);
 }
 
 static int rangecheck_eattr_indir(struct lgfs2_inode *ip, uint64_t block,
 				  uint64_t parent,
-				  struct gfs2_buffer_head **bh, void *private)
+				  struct lgfs2_buffer_head **bh, void *private)
 {
 	return rangecheck_block(ip, block, NULL, BTYPE_IEATTR, private);
 }
 
 static int rangecheck_eattr_leaf(struct lgfs2_inode *ip, uint64_t block,
-				 uint64_t parent, struct gfs2_buffer_head **bh,
+				 uint64_t parent, struct lgfs2_buffer_head **bh,
 				 void *private)
 {
 	return rangecheck_block(ip, block, NULL, BTYPE_EATTR, private);
@@ -1148,7 +1148,7 @@ static int set_ip_blockmap(struct lgfs2_inode *ip)
 	return 0;
 }
 
-static int alloc_metalist(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
+static int alloc_metalist(struct iptr iptr, struct lgfs2_buffer_head **bh, int h,
                           int *is_valid, int *was_duplicate, void *private)
 {
 	const char *desc = (const char *)private;
@@ -1174,7 +1174,7 @@ static int alloc_metalist(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
 
 static int alloc_data(struct lgfs2_inode *ip, uint64_t metablock,
 		      uint64_t block, void *private,
-		      struct gfs2_buffer_head *bh, __be64 *ptr)
+		      struct lgfs2_buffer_head *bh, __be64 *ptr)
 {
 	int q;
 	const char *desc = (const char *)private;
@@ -1394,11 +1394,11 @@ static void check_i_goal(struct gfs2_sbd *sdp, struct lgfs2_inode *ip)
 }
 
 /*
- * handle_di - This is now a wrapper function that takes a gfs2_buffer_head
+ * handle_di - This is now a wrapper function that takes a lgfs2_buffer_head
  *             and calls handle_ip, which takes an in-code dinode structure.
  */
 static int handle_di(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
-		     struct gfs2_buffer_head *bh)
+		     struct lgfs2_buffer_head *bh)
 {
 	int error = 0;
 	uint64_t block = bh->b_blocknr;
@@ -1753,7 +1753,7 @@ static int check_system_inodes(struct gfs2_sbd *sdp)
 
 static int pass1_process_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd, uint64_t *ibuf, unsigned n)
 {
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	unsigned i;
 	uint64_t block;
 	struct lgfs2_inode *ip;
diff --git a/gfs2/fsck/pass1b.c b/gfs2/fsck/pass1b.c
index 6add4562..11c722d2 100644
--- a/gfs2/fsck/pass1b.c
+++ b/gfs2/fsck/pass1b.c
@@ -43,7 +43,7 @@ struct meta_blk_ref {
 
 static int clone_data(struct lgfs2_inode *ip, uint64_t metablock,
 		      uint64_t block, void *private,
-		      struct gfs2_buffer_head *bh, __be64 *ptr);
+		      struct lgfs2_buffer_head *bh, __be64 *ptr);
 
 static void log_inode_reference(struct duptree *dt, osi_list_t *tmp, int inval)
 {
@@ -66,7 +66,7 @@ static void log_inode_reference(struct duptree *dt, osi_list_t *tmp, int inval)
 	         reftypestring);
 }
 
-static int findref_meta(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
+static int findref_meta(struct iptr iptr, struct lgfs2_buffer_head **bh, int h,
                         int *is_valid, int *was_duplicate, void *private)
 {
 	*is_valid = 1;
@@ -76,7 +76,7 @@ static int findref_meta(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
 
 static int findref_data(struct lgfs2_inode *ip, uint64_t metablock,
 			uint64_t block, void *private,
-			struct gfs2_buffer_head *bh, __be64 *ptr)
+			struct lgfs2_buffer_head *bh, __be64 *ptr)
 {
 	struct meta_blk_ref *mbr = (struct meta_blk_ref *)private;
 
@@ -100,7 +100,7 @@ static void clone_data_block(struct gfs2_sbd *sdp, struct duptree *dt,
 	};
 	struct clone_target clone = {.dup_block = dt->block,};
 	struct lgfs2_inode *ip;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	__be64 *ptr;
 
 	if (!(query(_("Okay to clone data block %"PRIu64" (0x%"PRIx64") for inode %"PRIu64" (0x%"PRIx64")? (y/n) "),
@@ -370,7 +370,7 @@ static void resolve_dup_references(struct gfs2_sbd *sdp, struct duptree *dt,
 	return;
 }
 
-static int clone_check_meta(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
+static int clone_check_meta(struct iptr iptr, struct lgfs2_buffer_head **bh, int h,
                             int *is_valid, int *was_duplicate, void *private)
 {
 	struct lgfs2_inode *ip = iptr.ipt_ip;
@@ -389,10 +389,10 @@ static int clone_check_meta(struct iptr iptr, struct gfs2_buffer_head **bh, int
  */
 static int clone_data(struct lgfs2_inode *ip, uint64_t metablock,
 		      uint64_t block, void *private,
-		      struct gfs2_buffer_head *bh, __be64 *ptr)
+		      struct lgfs2_buffer_head *bh, __be64 *ptr)
 {
 	struct clone_target *clonet = (struct clone_target *)private;
-	struct gfs2_buffer_head *clone_bh;
+	struct lgfs2_buffer_head *clone_bh;
 	uint64_t cloneblock;
 	int error;
 
@@ -605,7 +605,7 @@ static int handle_dup_blk(struct gfs2_sbd *sdp, struct duptree *dt)
 {
 	osi_list_t *tmp;
 	struct dup_handler dh = {0};
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	__be32 cmagic, ctype;
 	enum dup_ref_type acceptable_ref;
 	uint64_t dup_blk;
@@ -736,7 +736,7 @@ static int check_leaf_refs(struct lgfs2_inode *ip, uint64_t block,
 	return add_duplicate_ref(ip, block, REF_AS_META, 1, INODE_VALID);
 }
 
-static int check_metalist_refs(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
+static int check_metalist_refs(struct iptr iptr, struct lgfs2_buffer_head **bh, int h,
                                int *is_valid, int *was_duplicate, void *private)
 {
 	struct lgfs2_inode *ip = iptr.ipt_ip;
@@ -749,14 +749,14 @@ static int check_metalist_refs(struct iptr iptr, struct gfs2_buffer_head **bh, i
 
 static int check_data_refs(struct lgfs2_inode *ip, uint64_t metablock,
 			   uint64_t block, void *private,
-			   struct gfs2_buffer_head *bh, __be64 *ptr)
+			   struct lgfs2_buffer_head *bh, __be64 *ptr)
 {
 	return add_duplicate_ref(ip, block, REF_AS_DATA, 1, INODE_VALID);
 }
 
 static int check_eattr_indir_refs(struct lgfs2_inode *ip, uint64_t block,
 				  uint64_t parent,
-				  struct gfs2_buffer_head **bh, void *private)
+				  struct lgfs2_buffer_head **bh, void *private)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	int error;
@@ -769,7 +769,7 @@ static int check_eattr_indir_refs(struct lgfs2_inode *ip, uint64_t block,
 }
 
 static int check_eattr_leaf_refs(struct lgfs2_inode *ip, uint64_t block,
-				 uint64_t parent, struct gfs2_buffer_head **bh,
+				 uint64_t parent, struct lgfs2_buffer_head **bh,
 				 void *private)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -782,7 +782,7 @@ static int check_eattr_leaf_refs(struct lgfs2_inode *ip, uint64_t block,
 }
 
 static int check_eattr_entry_refs(struct lgfs2_inode *ip,
-				  struct gfs2_buffer_head *leaf_bh,
+				  struct lgfs2_buffer_head *leaf_bh,
 				  struct gfs2_ea_header *ea_hdr,
 				  struct gfs2_ea_header *ea_hdr_prev,
 				  void *private)
@@ -792,7 +792,7 @@ static int check_eattr_entry_refs(struct lgfs2_inode *ip,
 
 static int check_eattr_extentry_refs(struct lgfs2_inode *ip, int i,
 				     __be64 *ea_data_ptr,
-				     struct gfs2_buffer_head *leaf_bh,
+				     struct lgfs2_buffer_head *leaf_bh,
 				     uint32_t tot_ealen,
 				     struct gfs2_ea_header *ea_hdr,
 				     struct gfs2_ea_header *ea_hdr_prev,
diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index 7e0957ae..6c13cce9 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -96,14 +96,14 @@ static int set_dotdot_dir(struct gfs2_sbd *sdp, uint64_t childblock, struct lgfs
 }
 
 static int check_eattr_indir(struct lgfs2_inode *ip, uint64_t block,
-			     uint64_t parent, struct gfs2_buffer_head **bh,
+			     uint64_t parent, struct lgfs2_buffer_head **bh,
 			     void *private)
 {
 	*bh = lgfs2_bread(ip->i_sbd, block);
 	return 0;
 }
 static int check_eattr_leaf(struct lgfs2_inode *ip, uint64_t block,
-			    uint64_t parent, struct gfs2_buffer_head **bh,
+			    uint64_t parent, struct lgfs2_buffer_head **bh,
 			    void *private)
 {
 	*bh = lgfs2_bread(ip->i_sbd, block);
@@ -163,7 +163,7 @@ static struct metawalk_fxns pass2_fxns_delete = {
 static int bad_formal_ino(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			  struct lgfs2_inum entry, const char *tmp_name,
 			  int q, struct lgfs2_dirent *d,
-			  struct gfs2_buffer_head *bh)
+			  struct lgfs2_buffer_head *bh)
 {
 	struct inode_info *ii;
 	struct dir_info *di = NULL;
@@ -238,7 +238,7 @@ static int hash_table_index(uint32_t hash, struct lgfs2_inode *ip)
 }
 
 static int hash_table_max(int lindex, struct lgfs2_inode *ip,
-		   struct gfs2_buffer_head *bh)
+		   struct lgfs2_buffer_head *bh)
 {
 	struct gfs2_leaf *leaf = (struct gfs2_leaf *)bh->b_data;
 	return (1 << (ip->i_depth - be16_to_cpu(leaf->lf_depth))) +
@@ -246,7 +246,7 @@ static int hash_table_max(int lindex, struct lgfs2_inode *ip,
 }
 
 static int check_leaf_depth(struct lgfs2_inode *ip, uint64_t leaf_no,
-			    int ref_count, struct gfs2_buffer_head *lbh)
+			    int ref_count, struct lgfs2_buffer_head *lbh)
 {
 	struct gfs2_leaf *leaf = (struct gfs2_leaf *)lbh->b_data;
 	int cur_depth = be16_to_cpu(leaf->lf_depth);
@@ -292,13 +292,13 @@ static int check_leaf_depth(struct lgfs2_inode *ip, uint64_t leaf_no,
  */
 static int wrong_leaf(struct lgfs2_inode *ip, struct lgfs2_inum *entry,
 		      const char *tmp_name, int *lindex, int lindex_max,
-		      int hash_index, struct gfs2_buffer_head *bh,
+		      int hash_index, struct lgfs2_buffer_head *bh,
 		      struct dir_status *ds, struct gfs2_dirent *dent,
 		      struct lgfs2_dirent *d, struct gfs2_dirent *prev_de,
 		      uint32_t *count, int q)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
-	struct gfs2_buffer_head *dest_lbh;
+	struct lgfs2_buffer_head *dest_lbh;
 	uint64_t planned_leaf, real_leaf;
 	int li, dest_ref, error;
 	__be64 *tbl;
@@ -424,7 +424,7 @@ static int basic_dentry_checks(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			       struct lgfs2_inum *entry, const char *tmp_name,
 			       uint32_t *count, struct lgfs2_dirent *d,
 			       struct dir_status *ds, int *q,
-			       struct gfs2_buffer_head *bh, int *isdir)
+			       struct lgfs2_buffer_head *bh, int *isdir)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	uint32_t calculated_hash;
@@ -598,7 +598,7 @@ static int basic_dentry_checks(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 	 * eattr or indirect block, but marked "dinode" in the bitmap because
 	 * gfs1 marked all gfs1 metadata that way. */
 	if (ii == NULL && di == NULL && sdp->gfs1) {
-		struct gfs2_buffer_head *tbh;
+		struct lgfs2_buffer_head *tbh;
 
 		tbh = lgfs2_bread(sdp, entry->in_addr);
 		if (lgfs2_check_meta(tbh->b_data, GFS2_METATYPE_DI)) { /* not dinode */
@@ -615,7 +615,7 @@ static int basic_dentry_checks(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 }
 
 static int dirref_find(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
-		       struct gfs2_dirent *prev, struct gfs2_buffer_head *bh,
+		       struct gfs2_dirent *prev, struct lgfs2_buffer_head *bh,
 		       char *filename, uint32_t *count, int *lindex,
 		       void *private)
 {
@@ -720,7 +720,7 @@ static int check_suspicious_dirref(struct gfs2_sbd *sdp,
  * FIXMEs internally first */
 static int check_dentry(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			struct gfs2_dirent *prev_de,
-			struct gfs2_buffer_head *bh, char *filename,
+			struct lgfs2_buffer_head *bh, char *filename,
 			uint32_t *count, int *lindex, void *priv)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -931,7 +931,7 @@ static int write_new_leaf(struct lgfs2_inode *dip, int start_lindex,
 			  int num_copies, const char *before_or_after,
 			  uint64_t *bn)
 {
-	struct gfs2_buffer_head *nbh;
+	struct lgfs2_buffer_head *nbh;
 	struct gfs2_leaf *leaf;
 	struct gfs2_dirent *dent;
 	int count, i;
@@ -1071,7 +1071,7 @@ static void pad_with_leafblks(struct lgfs2_inode *ip, __be64 *tbl,
  * we need to pad the gap we leave.
  */
 static int lost_leaf(struct lgfs2_inode *ip, __be64 *tbl, uint64_t leafno,
-		     int ref_count, int lindex, struct gfs2_buffer_head *bh)
+		     int ref_count, int lindex, struct lgfs2_buffer_head *bh)
 {
 	char *filename;
 	char *bh_end = bh->b_data + ip->i_sbd->sd_bsize;
@@ -1166,7 +1166,7 @@ static int lost_leaf(struct lgfs2_inode *ip, __be64 *tbl, uint64_t leafno,
 
 static int basic_check_dentry(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			      struct gfs2_dirent *prev_de,
-			      struct gfs2_buffer_head *bh, char *filename,
+			      struct lgfs2_buffer_head *bh, char *filename,
 			      uint32_t *count, int *lindex, void *priv)
 {
 	int q = 0;
@@ -1291,7 +1291,7 @@ static int fix_hashtable(struct lgfs2_inode *ip, __be64 *tbl, unsigned hsize,
 			 uint64_t leafblk, int lindex, uint32_t proper_start,
 			 int len, int *proper_len, int factor)
 {
-	struct gfs2_buffer_head *lbh;
+	struct lgfs2_buffer_head *lbh;
 	struct lgfs2_dirent dentry;
 	struct lgfs2_leaf leaf;
 	struct gfs2_dirent *de;
@@ -1467,7 +1467,7 @@ static int check_hash_tbl_dups(struct lgfs2_inode *ip, __be64 *tbl,
 {
 	int l, len2;
 	uint64_t leafblk, leaf_no;
-	struct gfs2_buffer_head *lbh;
+	struct lgfs2_buffer_head *lbh;
 	struct gfs2_leaf leaf;
 	struct lgfs2_dirent dentry;
 	struct gfs2_dirent *de;
@@ -1586,7 +1586,7 @@ static int check_hash_tbl(struct lgfs2_inode *ip, __be64 *tbl,
 	int lindex, len, proper_len, i, changes = 0;
 	uint64_t leafblk;
 	struct lgfs2_leaf leaf;
-	struct gfs2_buffer_head *lbh;
+	struct lgfs2_buffer_head *lbh;
 	int factor;
 	uint32_t proper_start;
 	int anomaly;
@@ -1763,7 +1763,7 @@ static struct metawalk_fxns pass2_fxns = {
 	.repair_leaf = pass2_repair_leaf,
 };
 
-static int check_metalist_qc(struct iptr iptr, struct gfs2_buffer_head **bh, int h,
+static int check_metalist_qc(struct iptr iptr, struct lgfs2_buffer_head **bh, int h,
                              int *is_valid, int *was_duplicate, void *private)
 {
 	struct lgfs2_inode *ip = iptr.ipt_ip;
@@ -1777,9 +1777,9 @@ static int check_metalist_qc(struct iptr iptr, struct gfs2_buffer_head **bh, int
 
 static int check_data_qc(struct lgfs2_inode *ip, uint64_t metablock,
 			 uint64_t block, void *private,
-			 struct gfs2_buffer_head *bbh, __be64 *ptr)
+			 struct lgfs2_buffer_head *bbh, __be64 *ptr)
 {
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 
 	/* At this point, basic data block checks have already been done,
 	   so we only need to make sure they're QC blocks. */
diff --git a/gfs2/fsck/pass5.c b/gfs2/fsck/pass5.c
index 9aba38e6..df8233a4 100644
--- a/gfs2/fsck/pass5.c
+++ b/gfs2/fsck/pass5.c
@@ -46,7 +46,7 @@ static int check_block_status(struct gfs2_sbd *sdp,  struct gfs2_bmap *bl,
 		 * we must determine whether it's really a dinode or other
 		 * metadata by reading it in. */
 		if (sdp->gfs1 && q == GFS2_BLKST_DINODE) {
-			struct gfs2_buffer_head *bh;
+			struct lgfs2_buffer_head *bh;
 
 			bh = lgfs2_bread(sdp, block);
 			if (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_DI) == 0)
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index 14b1d56a..5c9c5d78 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -53,7 +53,7 @@ static void find_journaled_rgs(struct gfs2_sbd *sdp)
 	unsigned int jblocks;
 	uint64_t b, dblock;
 	struct lgfs2_inode *ip;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	int false_count;
 
 	osi_list_init(&false_rgrps.list);
@@ -101,7 +101,7 @@ static int find_shortest_rgdist(struct gfs2_sbd *sdp, uint64_t *dist_array,
 				int *dist_cnt)
 {
 	uint64_t blk, block_last_rg, shortest_dist_btwn_rgs;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	int rgs_sampled = 0;
 	uint64_t initial_first_rg_dist;
 	int gsegment = 0;
@@ -257,7 +257,7 @@ static int find_shortest_rgdist(struct gfs2_sbd *sdp, uint64_t *dist_array,
  * count_usedspace - count the used bits in a rgrp bitmap buffer
  */
 static uint64_t count_usedspace(struct gfs2_sbd *sdp, int first,
-				struct gfs2_buffer_head *bh)
+				struct lgfs2_buffer_head *bh)
 {
 	int off, x, y, bytes_to_check;
 	uint32_t rg_used = 0;
@@ -313,7 +313,7 @@ static uint64_t find_next_rgrp_dist(struct gfs2_sbd *sdp, uint64_t blk,
 	struct osi_node *n, *next = NULL;
 	uint64_t rgrp_dist = 0, used_blocks, block, next_block, twogigs;
 	struct rgrp_tree *rgd = NULL, *next_rgd;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	int first, length, b, found;
 	uint64_t mega_in_blocks;
 	uint32_t free_blocks;
@@ -423,7 +423,7 @@ static uint64_t hunt_and_peck(struct gfs2_sbd *sdp, uint64_t blk,
 			      struct rgrp_tree *prevrgd, uint64_t last_bump)
 {
 	uint64_t rgrp_dist = 0, block, twogigs, last_block, last_meg;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	struct gfs2_meta_header *mh;
 	int b, mega_in_blocks;
 
@@ -513,7 +513,7 @@ static uint64_t hunt_and_peck(struct gfs2_sbd *sdp, uint64_t blk,
 static int rindex_rebuild(struct gfs2_sbd *sdp, int *num_rgs, int gfs_grow)
 {
 	struct osi_node *n, *next = NULL;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	uint64_t rg_dist[MAX_RGSEGMENTS] = {0, };
 	int rg_dcnt[MAX_RGSEGMENTS] = {0, };
 	uint64_t blk;
diff --git a/gfs2/libgfs2/buf.c b/gfs2/libgfs2/buf.c
index c2cb7461..bd1ba6c1 100644
--- a/gfs2/libgfs2/buf.c
+++ b/gfs2/libgfs2/buf.c
@@ -22,23 +22,23 @@
   #endif
 #endif
 
-struct gfs2_buffer_head *lgfs2_bget(struct gfs2_sbd *sdp, uint64_t num)
+struct lgfs2_buffer_head *lgfs2_bget(struct gfs2_sbd *sdp, uint64_t num)
 {
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 
-	bh = calloc(1, sizeof(struct gfs2_buffer_head) + sdp->sd_bsize);
+	bh = calloc(1, sizeof(struct lgfs2_buffer_head) + sdp->sd_bsize);
 	if (bh == NULL)
 		return NULL;
 
 	bh->b_blocknr = num;
 	bh->sdp = sdp;
-	bh->iov.iov_base = (char *)bh + sizeof(struct gfs2_buffer_head);
+	bh->iov.iov_base = (char *)bh + sizeof(struct lgfs2_buffer_head);
 	bh->iov.iov_len = sdp->sd_bsize;
 
 	return bh;
 }
 
-int __lgfs2_breadm(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhs, size_t n,
+int __lgfs2_breadm(struct gfs2_sbd *sdp, struct lgfs2_buffer_head **bhs, size_t n,
                    uint64_t block, int line, const char *caller)
 {
 	size_t v = (n < IOV_MAX) ? n : IOV_MAX;
@@ -71,10 +71,10 @@ int __lgfs2_breadm(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhs, size_t n
 	return 0;
 }
 
-struct gfs2_buffer_head *__lgfs2_bread(struct gfs2_sbd *sdp, uint64_t num, int line,
+struct lgfs2_buffer_head *__lgfs2_bread(struct gfs2_sbd *sdp, uint64_t num, int line,
 				 const char *caller)
 {
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	ssize_t ret;
 
 	bh = lgfs2_bget(sdp, num);
@@ -91,7 +91,7 @@ struct gfs2_buffer_head *__lgfs2_bread(struct gfs2_sbd *sdp, uint64_t num, int l
 	return bh;
 }
 
-int lgfs2_bwrite(struct gfs2_buffer_head *bh)
+int lgfs2_bwrite(struct lgfs2_buffer_head *bh)
 {
 	struct gfs2_sbd *sdp = bh->sdp;
 
@@ -101,7 +101,7 @@ int lgfs2_bwrite(struct gfs2_buffer_head *bh)
 	return 0;
 }
 
-int lgfs2_brelse(struct gfs2_buffer_head *bh)
+int lgfs2_brelse(struct lgfs2_buffer_head *bh)
 {
 	int error = 0;
 
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index 2566fafd..a0462f14 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -30,7 +30,7 @@ static int inode_is_stuffed(const struct lgfs2_inode *ip)
 	return !ip->i_height;
 }
 
-struct lgfs2_inode *lgfs2_inode_get(struct gfs2_sbd *sdp, struct gfs2_buffer_head *bh)
+struct lgfs2_inode *lgfs2_inode_get(struct gfs2_sbd *sdp, struct lgfs2_buffer_head *bh)
 {
 	struct lgfs2_inode *ip;
 
@@ -47,7 +47,7 @@ struct lgfs2_inode *lgfs2_inode_get(struct gfs2_sbd *sdp, struct gfs2_buffer_hea
 struct lgfs2_inode *lgfs2_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr)
 {
 	struct lgfs2_inode *ip;
-	struct gfs2_buffer_head *bh = lgfs2_bread(sdp, di_addr);
+	struct lgfs2_buffer_head *bh = lgfs2_bread(sdp, di_addr);
 	if (bh == NULL) {
 		return NULL;
 	}
@@ -212,7 +212,7 @@ int lgfs2_meta_alloc(struct lgfs2_inode *ip, uint64_t *blkno)
 }
 
 static __inline__ void buffer_clear_tail(struct gfs2_sbd *sdp,
-					 struct gfs2_buffer_head *bh, int head)
+					 struct lgfs2_buffer_head *bh, int head)
 {
 	memset(bh->b_data + head, 0, sdp->sd_bsize - head);
 	lgfs2_bmodified(bh);
@@ -220,8 +220,8 @@ static __inline__ void buffer_clear_tail(struct gfs2_sbd *sdp,
 
 static __inline__ void
 buffer_copy_tail(struct gfs2_sbd *sdp,
-		 struct gfs2_buffer_head *to_bh, int to_head,
-		 struct gfs2_buffer_head *from_bh, int from_head)
+		 struct lgfs2_buffer_head *to_bh, int to_head,
+		 struct lgfs2_buffer_head *from_bh, int from_head)
 {
 	memcpy(to_bh->b_data + to_head, from_bh->b_data + from_head,
 	       sdp->sd_bsize - from_head);
@@ -233,7 +233,7 @@ buffer_copy_tail(struct gfs2_sbd *sdp,
 void lgfs2_unstuff_dinode(struct lgfs2_inode *ip)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	uint64_t block = 0;
 	int isdir = S_ISDIR(ip->i_mode) || lgfs2_is_gfs_dir(ip);
 
@@ -379,7 +379,7 @@ unsigned int lgfs2_calc_tree_height(struct lgfs2_inode *ip, uint64_t size)
 void lgfs2_build_height(struct lgfs2_inode *ip, int height)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	uint64_t block = 0, *bp;
 	unsigned int x;
 	int new_block;
@@ -435,7 +435,7 @@ void lgfs2_find_metapath(struct lgfs2_inode *ip, uint64_t block, struct metapath
 	}
 }
 
-void lgfs2_lookup_block(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
+void lgfs2_lookup_block(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
                         unsigned int height, struct metapath *mp,
                         int create, int *new, uint64_t *block)
 {
@@ -465,7 +465,7 @@ void lgfs2_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *new,
                      uint64_t *dblock, uint32_t *extlen, int prealloc)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	struct metapath mp;
 	int create = *new;
 	unsigned int bsize;
@@ -556,7 +556,7 @@ void lgfs2_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *new,
 }
 
 static void
-copy2mem(struct gfs2_buffer_head *bh, void **buf, unsigned int offset,
+copy2mem(struct lgfs2_buffer_head *bh, void **buf, unsigned int offset,
 	 unsigned int size)
 {
 	char **p = (char **)buf;
@@ -572,7 +572,7 @@ copy2mem(struct gfs2_buffer_head *bh, void **buf, unsigned int offset,
 int lgfs2_readi(struct lgfs2_inode *ip, void *buf, uint64_t offset, unsigned int size)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	uint64_t lblock, dblock;
 	unsigned int o;
 	uint32_t extlen = 0;
@@ -645,7 +645,7 @@ int lgfs2_readi(struct lgfs2_inode *ip, void *buf, uint64_t offset, unsigned int
 	return copied;
 }
 
-static void copy_from_mem(struct gfs2_buffer_head *bh, void **buf,
+static void copy_from_mem(struct lgfs2_buffer_head *bh, void **buf,
 			  unsigned int offset, unsigned int size)
 {
 	char **p = (char **)buf;
@@ -659,7 +659,7 @@ int __lgfs2_writei(struct lgfs2_inode *ip, void *buf,
 		  uint64_t offset, unsigned int size, int resize)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	uint64_t lblock, dblock;
 	unsigned int o;
 	uint32_t extlen = 0;
@@ -737,7 +737,7 @@ int __lgfs2_writei(struct lgfs2_inode *ip, void *buf,
 	return copied;
 }
 
-int lgfs2_dirent_first(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh,
+int lgfs2_dirent_first(struct lgfs2_inode *dip, struct lgfs2_buffer_head *bh,
 					  struct gfs2_dirent **dent)
 {
 	struct gfs2_meta_header *h = (struct gfs2_meta_header *)bh->b_data;
@@ -751,7 +751,7 @@ int lgfs2_dirent_first(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh,
 	}
 }
 
-int lgfs2_dirent_next(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh,
+int lgfs2_dirent_next(struct lgfs2_inode *dip, struct lgfs2_buffer_head *bh,
 					 struct gfs2_dirent **dent)
 {
 	char *bh_end;
@@ -773,7 +773,7 @@ int lgfs2_dirent_next(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh,
  * Returns 0 on success, with *dent_out pointing to the new dirent,
  * or -1 on failure, with errno set
  */
-static int dirent_alloc(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh,
+static int dirent_alloc(struct lgfs2_inode *dip, struct lgfs2_buffer_head *bh,
 			int name_len, struct gfs2_dirent **dent_out)
 {
 	struct gfs2_dirent *dent, *new;
@@ -847,7 +847,7 @@ static int dirent_alloc(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh,
 	return -1;
 }
 
-void lgfs2_dirent2_del(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh,
+void lgfs2_dirent2_del(struct lgfs2_inode *dip, struct lgfs2_buffer_head *bh,
                        struct gfs2_dirent *prev, struct gfs2_dirent *cur)
 {
 	uint16_t cur_rec_len, prev_rec_len;
@@ -890,9 +890,9 @@ int lgfs2_get_leaf_ptr(struct lgfs2_inode *dip, const uint32_t lindex, uint64_t
 }
 
 void lgfs2_dir_split_leaf(struct lgfs2_inode *dip, uint32_t start, uint64_t leaf_no,
-		    struct gfs2_buffer_head *obh)
+		    struct lgfs2_buffer_head *obh)
 {
-	struct gfs2_buffer_head *nbh;
+	struct lgfs2_buffer_head *nbh;
 	struct gfs2_leaf *nleaf, *oleaf;
 	struct gfs2_dirent *dent, *prev = NULL, *next = NULL, *new;
 	uint32_t len, half_len, divider;
@@ -1072,7 +1072,7 @@ static void dir_double_exhash(struct lgfs2_inode *dip)
  */
 
 int lgfs2_get_leaf(struct lgfs2_inode *dip, uint64_t leaf_no,
-				  struct gfs2_buffer_head **bhp)
+				  struct lgfs2_buffer_head **bhp)
 {
 	int error = 0;
 
@@ -1092,7 +1092,7 @@ int lgfs2_get_leaf(struct lgfs2_inode *dip, uint64_t leaf_no,
  * Returns: 0 on success, error code otherwise
  */
 
-static int get_first_leaf(struct lgfs2_inode *dip, uint32_t lindex, struct gfs2_buffer_head **bh_out)
+static int get_first_leaf(struct lgfs2_inode *dip, uint32_t lindex, struct lgfs2_buffer_head **bh_out)
 {
 	uint64_t leaf_no;
 
@@ -1113,8 +1113,8 @@ static int get_first_leaf(struct lgfs2_inode *dip, uint32_t lindex, struct gfs2_
  * Returns: 0 on success, error code otherwise
  */
 
-static int get_next_leaf(struct lgfs2_inode *dip,struct gfs2_buffer_head *bh_in,
-						 struct gfs2_buffer_head **bh_out)
+static int get_next_leaf(struct lgfs2_inode *dip,struct lgfs2_buffer_head *bh_in,
+						 struct lgfs2_buffer_head **bh_out)
 {
 	struct gfs2_leaf *leaf;
 
@@ -1140,7 +1140,7 @@ static int get_next_leaf(struct lgfs2_inode *dip,struct gfs2_buffer_head *bh_in,
 static int dir_e_add(struct lgfs2_inode *dip, const char *filename, int len,
 		      struct lgfs2_inum *inum, unsigned int type)
 {
-	struct gfs2_buffer_head *bh, *nbh;
+	struct lgfs2_buffer_head *bh, *nbh;
 	struct gfs2_leaf *leaf, *nleaf;
 	struct gfs2_dirent *dent;
 	uint32_t lindex, llen;
@@ -1234,7 +1234,7 @@ static void dir_make_exhash(struct lgfs2_inode *dip)
 {
 	struct gfs2_sbd *sdp = dip->i_sbd;
 	struct gfs2_dirent *dent;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	struct gfs2_leaf *leaf;
 	uint16_t rec_len;
 	int y;
@@ -1332,10 +1332,10 @@ int lgfs2_dir_add(struct lgfs2_inode *dip, const char *filename, int len,
 	return err;
 }
 
-static int __init_dinode(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhp, struct lgfs2_inum *inum,
+static int __init_dinode(struct gfs2_sbd *sdp, struct lgfs2_buffer_head **bhp, struct lgfs2_inum *inum,
                          unsigned int mode, uint32_t flags, struct lgfs2_inum *parent, int gfs1)
 {
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	struct gfs2_dinode *di;
 	int is_dir;
 
@@ -1410,7 +1410,7 @@ static int __init_dinode(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhp, st
 	return 0;
 }
 
-int lgfs2_init_dinode(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhp, struct lgfs2_inum *inum,
+int lgfs2_init_dinode(struct gfs2_sbd *sdp, struct lgfs2_buffer_head **bhp, struct lgfs2_inum *inum,
                       unsigned int mode, uint32_t flags, struct lgfs2_inum *parent)
 {
 	return __init_dinode(sdp, bhp, inum, mode, flags, parent, 0);
@@ -1447,7 +1447,7 @@ int lgfs2_write_filemeta(struct lgfs2_inode *ip)
 		.mh_type = cpu_to_be32(GFS2_METATYPE_IN),
 		.mh_format = cpu_to_be32(GFS2_FORMAT_IN)
 	};
-	struct gfs2_buffer_head *bh = lgfs2_bget(sdp, ip->i_num.in_addr);
+	struct lgfs2_buffer_head *bh = lgfs2_bget(sdp, ip->i_num.in_addr);
 	if (bh == NULL)
 		return 1;
 
@@ -1492,7 +1492,7 @@ static struct lgfs2_inode *__createi(struct lgfs2_inode *dip,
 	struct gfs2_sbd *sdp = dip->i_sbd;
 	uint64_t bn;
 	struct lgfs2_inum inum;
-	struct gfs2_buffer_head *bh = NULL;
+	struct lgfs2_buffer_head *bh = NULL;
 	struct lgfs2_inode *ip;
 	int err = 0;
 	int is_dir;
@@ -1578,7 +1578,7 @@ static int gfs2_filecmp(const char *file1, const char *file2, int len_of_file2)
  *
  * Returns:
  */
-static int leaf_search(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh, 
+static int leaf_search(struct lgfs2_inode *dip, struct lgfs2_buffer_head *bh,
 		       const char *filename, int len,
 		       struct gfs2_dirent **dent_out,
 		       struct gfs2_dirent **dent_prev)
@@ -1637,9 +1637,9 @@ static int leaf_search(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh,
 
 static int linked_leaf_search(struct lgfs2_inode *dip, const char *filename,
 			      int len, struct gfs2_dirent **dent_out,
-			      struct gfs2_buffer_head **bh_out)
+			      struct lgfs2_buffer_head **bh_out)
 {
-	struct gfs2_buffer_head *bh = NULL, *bh_next;
+	struct lgfs2_buffer_head *bh = NULL, *bh_next;
 	uint32_t hsize, lindex;
 	uint32_t hash;
 	int error = 0;
@@ -1701,7 +1701,7 @@ static int linked_leaf_search(struct lgfs2_inode *dip, const char *filename,
 static int dir_e_search(struct lgfs2_inode *dip, const char *filename,
 			int len, unsigned int *type, struct lgfs2_inum *inum)
 {
-	struct gfs2_buffer_head *bh = NULL;
+	struct lgfs2_buffer_head *bh = NULL;
 	struct gfs2_dirent *dent;
 	int error;
 
@@ -1780,7 +1780,7 @@ static int dir_e_del(struct lgfs2_inode *dip, const char *filename, int len)
 	int error;
 	int found = 0;
 	uint64_t leaf_no;
-	struct gfs2_buffer_head *bh = NULL;
+	struct lgfs2_buffer_head *bh = NULL;
 	struct gfs2_dirent *cur, *prev;
 
 	lindex = (1 << (dip->i_depth))-1;
@@ -1920,7 +1920,7 @@ void lgfs2_free_block(struct gfs2_sbd *sdp, uint64_t block)
 int lgfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
 {
 	struct lgfs2_inode *ip;
-	struct gfs2_buffer_head *bh, *nbh;
+	struct lgfs2_buffer_head *bh, *nbh;
 	int h, head_size;
 	uint64_t block;
 	struct rgrp_tree *rgd;
@@ -1948,7 +1948,7 @@ int lgfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
 			     sizeof(struct gfs2_dinode));
 
 		for (tmp = cur_list->next; tmp != cur_list; tmp = tmp->next){
-			bh = osi_list_entry(tmp, struct gfs2_buffer_head,
+			bh = osi_list_entry(tmp, struct lgfs2_buffer_head,
 					    b_altlist);
 
 			for (ptr = (__be64 *)(bh->b_data + head_size);
diff --git a/gfs2/libgfs2/gfs1.c b/gfs2/libgfs2/gfs1.c
index 1fe366e1..440b8918 100644
--- a/gfs2/libgfs2/gfs1.c
+++ b/gfs2/libgfs2/gfs1.c
@@ -38,7 +38,7 @@ int lgfs2_is_gfs_dir(struct lgfs2_inode *ip)
 	return 0;
 }
 
-void lgfs2_gfs1_lookup_block(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
+void lgfs2_gfs1_lookup_block(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
 		  unsigned int height, struct metapath *mp,
 		  int create, int *new, uint64_t *block)
 {
@@ -71,7 +71,7 @@ void lgfs2_gfs1_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *new,
 		    uint64_t *dblock, uint32_t *extlen, int prealloc)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	struct metapath mp;
 	int create = *new;
 	unsigned int bsize;
@@ -167,7 +167,7 @@ int lgfs2_gfs1_writei(struct lgfs2_inode *ip, void *buf, uint64_t offset,
 		unsigned int size)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	uint64_t lblock, dblock;
 	uint32_t extlen = 0;
 	unsigned int amount;
@@ -291,7 +291,7 @@ struct lgfs2_inode *lgfs2_gfs_inode_get(struct gfs2_sbd *sdp, char *buf)
 
 struct lgfs2_inode *lgfs2_gfs_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr)
 {
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	struct lgfs2_inode *ip;
 
 	bh = lgfs2_bget(sdp, di_addr);
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index ec14f75e..273f07fd 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -234,7 +234,7 @@ extern lgfs2_rgrp_t lgfs2_rgrp_prev(lgfs2_rgrp_t rg);
 // Temporary function to aid API migration
 extern void lgfs2_attach_rgrps(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs);
 
-struct gfs2_buffer_head {
+struct lgfs2_buffer_head {
 	osi_list_t b_altlist; /* alternate list */
 	uint64_t b_blocknr;
 	union {
@@ -251,7 +251,7 @@ struct lgfs2_inum {
 };
 
 struct lgfs2_inode {
-	struct gfs2_buffer_head *i_bh;
+	struct lgfs2_buffer_head *i_bh;
 	struct gfs2_sbd *i_sbd;
 	struct rgrp_tree *i_rgd; /* performance hint */
 	int bh_owned; /* Is this bh owned, iow, should we release it later? */
@@ -458,12 +458,12 @@ extern int lgfs2_field_str(char *str, const size_t size, const char *blk, const
 extern int lgfs2_field_assign(char *blk, const struct lgfs2_metafield *field, const void *val);
 
 /* buf.c */
-extern struct gfs2_buffer_head *lgfs2_bget(struct gfs2_sbd *sdp, uint64_t num);
-extern struct gfs2_buffer_head *__lgfs2_bread(struct gfs2_sbd *sdp, uint64_t num,
+extern struct lgfs2_buffer_head *lgfs2_bget(struct gfs2_sbd *sdp, uint64_t num);
+extern struct lgfs2_buffer_head *__lgfs2_bread(struct gfs2_sbd *sdp, uint64_t num,
 					int line, const char *caller);
-extern int __lgfs2_breadm(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhs, size_t n, uint64_t block, int line, const char *caller);
-extern int lgfs2_bwrite(struct gfs2_buffer_head *bh);
-extern int lgfs2_brelse(struct gfs2_buffer_head *bh);
+extern int __lgfs2_breadm(struct gfs2_sbd *sdp, struct lgfs2_buffer_head **bhs, size_t n, uint64_t block, int line, const char *caller);
+extern int lgfs2_bwrite(struct lgfs2_buffer_head *bh);
+extern int lgfs2_brelse(struct lgfs2_buffer_head *bh);
 extern uint32_t lgfs2_get_block_type(const char *buf);
 
 #define lgfs2_bmodified(bh) do { bh->b_modified = 1; } while(0)
@@ -495,11 +495,11 @@ extern int lgfs2_set_bitmap(lgfs2_rgrp_t rg, uint64_t blkno, int state);
 #define IS_DINODE   (2)
 
 extern void lgfs2_find_metapath(struct lgfs2_inode *ip, uint64_t block, struct metapath *mp);
-extern void lgfs2_lookup_block(struct lgfs2_inode *ip, struct gfs2_buffer_head *bh,
+extern void lgfs2_lookup_block(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
 			 unsigned int height, struct metapath *mp,
 			 int create, int *new, uint64_t *block);
 extern struct lgfs2_inode *lgfs2_inode_get(struct gfs2_sbd *sdp,
-				    struct gfs2_buffer_head *bh);
+				    struct lgfs2_buffer_head *bh);
 extern struct lgfs2_inode *lgfs2_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr);
 extern struct lgfs2_inode *lgfs2_is_system_inode(struct gfs2_sbd *sdp,
 					  uint64_t block);
@@ -516,14 +516,14 @@ extern int lgfs2_readi(struct lgfs2_inode *ip, void *buf, uint64_t offset,
 	__lgfs2_writei(ip, buf, offset, size, 1)
 extern int __lgfs2_writei(struct lgfs2_inode *ip, void *buf, uint64_t offset,
 			 unsigned int size, int resize);
-extern int lgfs2_init_dinode(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhp, struct lgfs2_inum *inum,
+extern int lgfs2_init_dinode(struct gfs2_sbd *sdp, struct lgfs2_buffer_head **bhp, struct lgfs2_inum *inum,
                        unsigned int mode, uint32_t flags, struct lgfs2_inum *parent);
 extern struct lgfs2_inode *lgfs2_createi(struct lgfs2_inode *dip, const char *filename,
 				  unsigned int mode, uint32_t flags);
 extern struct lgfs2_inode *lgfs2_gfs_createi(struct lgfs2_inode *dip,
 				      const char *filename, unsigned int mode,
 				      uint32_t flags);
-extern void lgfs2_dirent2_del(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh,
+extern void lgfs2_dirent2_del(struct lgfs2_inode *dip, struct lgfs2_buffer_head *bh,
 			struct gfs2_dirent *prev, struct gfs2_dirent *cur);
 extern int lgfs2_dir_search(struct lgfs2_inode *dip, const char *filename, int len,
 		      unsigned int *type, struct lgfs2_inum *inum);
@@ -536,15 +536,15 @@ extern void lgfs2_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *new,
 		      uint64_t *dblock, uint32_t *extlen, int prealloc);
 extern int lgfs2_get_leaf_ptr(struct lgfs2_inode *dip, uint32_t index, uint64_t *ptr) __attribute__((warn_unused_result));
 extern void lgfs2_dir_split_leaf(struct lgfs2_inode *dip, uint32_t start,
-			   uint64_t leaf_no, struct gfs2_buffer_head *obh);
+			   uint64_t leaf_no, struct lgfs2_buffer_head *obh);
 extern void lgfs2_free_block(struct gfs2_sbd *sdp, uint64_t block);
 extern int lgfs2_freedi(struct gfs2_sbd *sdp, uint64_t block);
 extern int lgfs2_get_leaf(struct lgfs2_inode *dip, uint64_t leaf_no,
-			 struct gfs2_buffer_head **bhp);
+			 struct lgfs2_buffer_head **bhp);
 extern int lgfs2_dirent_first(struct lgfs2_inode *dip,
-			     struct gfs2_buffer_head *bh,
+			     struct lgfs2_buffer_head *bh,
 			     struct gfs2_dirent **dent);
-extern int lgfs2_dirent_next(struct lgfs2_inode *dip, struct gfs2_buffer_head *bh,
+extern int lgfs2_dirent_next(struct lgfs2_inode *dip, struct lgfs2_buffer_head *bh,
 			    struct gfs2_dirent **dent);
 extern void lgfs2_build_height(struct lgfs2_inode *ip, int height);
 extern void lgfs2_unstuff_dinode(struct lgfs2_inode *ip);
@@ -709,7 +709,7 @@ struct gfs_log_descriptor {
 
 extern int lgfs2_is_gfs_dir(struct lgfs2_inode *ip);
 extern void lgfs2_gfs1_lookup_block(struct lgfs2_inode *ip,
-			      struct gfs2_buffer_head *bh,
+			      struct lgfs2_buffer_head *bh,
 			      unsigned int height, struct metapath *mp,
 			      int create, int *new, uint64_t *block);
 extern void lgfs2_gfs1_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *new,
@@ -732,7 +732,7 @@ extern int lgfs2_open_mnt_dir(const char *path, int flags, struct mntent **mnt);
 /* recovery.c */
 extern void lgfs2_replay_incr_blk(struct lgfs2_inode *ip, unsigned int *blk);
 extern int lgfs2_replay_read_block(struct lgfs2_inode *ip, unsigned int blk,
-				  struct gfs2_buffer_head **bh);
+				  struct lgfs2_buffer_head **bh);
 extern int lgfs2_get_log_header(struct lgfs2_inode *ip, unsigned int blk,
                                 struct lgfs2_log_header *head);
 extern int lgfs2_find_jhead(struct lgfs2_inode *ip, struct lgfs2_log_header *head);
diff --git a/gfs2/libgfs2/recovery.c b/gfs2/libgfs2/recovery.c
index b88d913d..56aa2478 100644
--- a/gfs2/libgfs2/recovery.c
+++ b/gfs2/libgfs2/recovery.c
@@ -23,7 +23,7 @@ void lgfs2_replay_incr_blk(struct lgfs2_inode *ip, unsigned int *blk)
 }
 
 int lgfs2_replay_read_block(struct lgfs2_inode *ip, unsigned int blk,
-			   struct gfs2_buffer_head **bh)
+			   struct lgfs2_buffer_head **bh)
 {
 	int new = 0;
 	uint64_t dblock;
@@ -68,7 +68,7 @@ static void log_header_in(struct lgfs2_log_header *lh, char *buf)
 int lgfs2_get_log_header(struct lgfs2_inode *ip, unsigned int blk,
                          struct lgfs2_log_header *head)
 {
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	struct lgfs2_log_header lh;
 	struct gfs2_log_header *tmp;
 	__be32 saved_hash;
@@ -235,7 +235,7 @@ int lgfs2_clean_journal(struct lgfs2_inode *ip, struct lgfs2_log_header *head)
 	unsigned int lblock;
 	struct gfs2_log_header *lh;
 	uint32_t hash;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	int new = 0;
 	uint64_t dblock;
 
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index b48c9bcc..f738259a 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -20,7 +20,7 @@ int lgfs2_build_master(struct gfs2_sbd *sdp)
 {
 	struct lgfs2_inum inum;
 	uint64_t bn;
-	struct gfs2_buffer_head *bh = NULL;
+	struct lgfs2_buffer_head *bh = NULL;
 	int err = lgfs2_dinode_alloc(sdp, 1, &bn);
 
 	if (err != 0)
@@ -151,7 +151,7 @@ int lgfs2_write_journal_data(struct lgfs2_inode *ip)
 	return 0;
 }
 
-static struct gfs2_buffer_head *lgfs2_get_file_buf(struct lgfs2_inode *ip, uint64_t lbn, int prealloc)
+static struct lgfs2_buffer_head *lgfs2_get_file_buf(struct lgfs2_inode *ip, uint64_t lbn, int prealloc)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	uint64_t dbn;
@@ -189,7 +189,7 @@ int lgfs2_write_journal(struct lgfs2_inode *jnl, unsigned bsize, unsigned int bl
 	lgfs2_build_height(jnl, height);
 
 	for (x = 0; x < blocks; x++) {
-		struct gfs2_buffer_head *bh = lgfs2_get_file_buf(jnl, x, 1);
+		struct lgfs2_buffer_head *bh = lgfs2_get_file_buf(jnl, x, 1);
 		if (!bh)
 			return -1;
 		lgfs2_bmodified(bh);
@@ -197,7 +197,7 @@ int lgfs2_write_journal(struct lgfs2_inode *jnl, unsigned bsize, unsigned int bl
 	}
 	crc32c_optimization_init();
 	for (x = 0; x < blocks; x++) {
-		struct gfs2_buffer_head *bh = lgfs2_get_file_buf(jnl, x, 0);
+		struct lgfs2_buffer_head *bh = lgfs2_get_file_buf(jnl, x, 0);
 		if (!bh)
 			return -1;
 
@@ -321,7 +321,7 @@ struct lgfs2_inode *lgfs2_build_quota_change(struct lgfs2_inode *per_node, unsig
 	unsigned int blocks = sdp->qcsize << (20 - sdp->sd_bsize_shift);
 	unsigned int x;
 	unsigned int hgt;
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 
 	memset(&mh, 0, sizeof(struct gfs2_meta_header));
 	mh.mh_magic = cpu_to_be32(GFS2_MAGIC);
@@ -432,7 +432,7 @@ int lgfs2_build_root(struct gfs2_sbd *sdp)
 {
 	struct lgfs2_inum inum;
 	uint64_t bn;
-	struct gfs2_buffer_head *bh = NULL;
+	struct lgfs2_buffer_head *bh = NULL;
 	int err = lgfs2_dinode_alloc(sdp, 1, &bn);
 
 	if (err != 0)
diff --git a/gfs2/libgfs2/super.c b/gfs2/libgfs2/super.c
index c8186b20..3535a0c7 100644
--- a/gfs2/libgfs2/super.c
+++ b/gfs2/libgfs2/super.c
@@ -60,7 +60,7 @@ int lgfs2_check_sb(void *sbp)
  */
 int lgfs2_read_sb(struct gfs2_sbd *sdp)
 {
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	uint64_t space = 0;
 	unsigned int x;
 	int ret;
@@ -181,7 +181,7 @@ static int rgd_seems_ok(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
  */
 static int good_on_disk(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
 {
-	struct gfs2_buffer_head *bh;
+	struct lgfs2_buffer_head *bh;
 	int is_rgrp;
 
 	bh = lgfs2_bread(sdp, rgd->rt_addr);
-- 
2.34.1

