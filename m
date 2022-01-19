Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C51494938CD
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:44:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589097;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JPhv+PqRNm1NP65RrB73ROsUcvkNkt1zn9hCFXk64OE=;
	b=I2WrXtN+YnPHL8D2bLNqIhRKUFlv2jVr0YmK/Ok837IMchKqGrs83dy8nj9s0WY6fXwB+b
	GOv1CsHg+R8hEmjUurb+xMGYK8M5DS/Xp0bYacSpWmbbryivkpjcCYO7DQ//jK0Ogha5Ud
	O3aNM7pIM2Jj5cw0ekreIwy842T/He4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-QF-CnfiDNIm6dArCdtEluQ-1; Wed, 19 Jan 2022 05:44:34 -0500
X-MC-Unique: QF-CnfiDNIm6dArCdtEluQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BE1893925;
	Wed, 19 Jan 2022 10:44:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A68B1059580;
	Wed, 19 Jan 2022 10:44:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 041741806D03;
	Wed, 19 Jan 2022 10:44:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAiUHr024545 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:44:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2A6A778B10; Wed, 19 Jan 2022 10:44:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6649D7AB40
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:44:29 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:10 +0000
Message-Id: <20220119104316.2489995-16-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 15/21] libgfs2: Namespace improvements -
	struct gfs2_sbd
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Rename to struct lgfs2_sbd.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c    | 76 +++++++++++++++---------------
 gfs2/edit/gfs2hex.c            |  2 +-
 gfs2/edit/hexedit.c            |  2 +-
 gfs2/edit/hexedit.h            |  2 +-
 gfs2/edit/journal.c            |  2 +-
 gfs2/edit/savemeta.c           |  6 +--
 gfs2/fsck/afterpass1_common.c  |  4 +-
 gfs2/fsck/afterpass1_common.h  |  2 +-
 gfs2/fsck/fs_recovery.c        | 26 +++++------
 gfs2/fsck/fs_recovery.h        | 10 ++--
 gfs2/fsck/fsck.h               | 30 ++++++------
 gfs2/fsck/initialize.c         | 50 ++++++++++----------
 gfs2/fsck/lost_n_found.c       |  6 +--
 gfs2/fsck/main.c               |  8 ++--
 gfs2/fsck/metawalk.c           | 22 ++++-----
 gfs2/fsck/metawalk.h           |  6 +--
 gfs2/fsck/pass1.c              | 50 ++++++++++----------
 gfs2/fsck/pass1b.c             | 16 +++----
 gfs2/fsck/pass2.c              | 22 ++++-----
 gfs2/fsck/pass3.c              |  6 +--
 gfs2/fsck/pass4.c              | 12 ++---
 gfs2/fsck/pass5.c              |  6 +--
 gfs2/fsck/rgrepair.c           | 26 +++++------
 gfs2/fsck/util.c               |  2 +-
 gfs2/fsck/util.h               |  6 +--
 gfs2/glocktop/glocktop.c       |  6 +--
 gfs2/libgfs2/buf.c             |  8 ++--
 gfs2/libgfs2/check_ondisk.c    |  6 +--
 gfs2/libgfs2/check_rgrp.c      |  4 +-
 gfs2/libgfs2/device_geometry.c |  2 +-
 gfs2/libgfs2/fs_bits.c         |  4 +-
 gfs2/libgfs2/fs_ops.c          | 52 ++++++++++-----------
 gfs2/libgfs2/gfs1.c            | 10 ++--
 gfs2/libgfs2/gfs2l.c           |  4 +-
 gfs2/libgfs2/lang.c            | 22 ++++-----
 gfs2/libgfs2/lang.h            |  2 +-
 gfs2/libgfs2/libgfs2.h         | 84 +++++++++++++++++-----------------
 gfs2/libgfs2/misc.c            |  2 +-
 gfs2/libgfs2/ondisk.c          |  4 +-
 gfs2/libgfs2/rgrp.c            | 20 ++++----
 gfs2/libgfs2/rgrp.h            |  2 +-
 gfs2/libgfs2/structures.c      | 26 +++++------
 gfs2/libgfs2/super.c           |  8 ++--
 gfs2/mkfs/main_grow.c          | 16 +++----
 gfs2/mkfs/main_jadd.c          | 18 ++++----
 gfs2/mkfs/main_mkfs.c          | 22 ++++-----
 tests/nukerg.c                 | 10 ++--
 47 files changed, 366 insertions(+), 366 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 06815380..e1c6a3c6 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -95,7 +95,7 @@ struct gfs2_options {
 };
 
 static struct gfs_sb gfs1_sb;
-static struct gfs2_sbd sb2;
+static struct lgfs2_sbd sb2;
 static struct inode_block dirs_to_fix;  /* linked list of directories to fix */
 static struct inode_dir_block cdpns_to_fix; /* linked list of cdpn symlinks */
 static int seconds;
@@ -119,7 +119,7 @@ int print_level = MSG_NOTICE;
 /*                   Fixes all unallocated metadata bitmap states (which are */
 /*                   valid in gfs1 but invalid in gfs2).                     */
 /* ------------------------------------------------------------------------- */
-static void convert_bitmaps(struct gfs2_sbd *sdp, struct rgrp_tree *rg)
+static void convert_bitmaps(struct lgfs2_sbd *sdp, struct rgrp_tree *rg)
 {
 	uint32_t blk;
 	int x, y;
@@ -146,7 +146,7 @@ static void convert_bitmaps(struct gfs2_sbd *sdp, struct rgrp_tree *rg)
 /* convert_rgs - Convert gfs1 resource groups to gfs2.                       */
 /* Returns: 0 on success, -1 on failure                                      */
 /* ------------------------------------------------------------------------- */
-static int convert_rgs(struct gfs2_sbd *sbp)
+static int convert_rgs(struct lgfs2_sbd *sbp)
 {
 	struct rgrp_tree *rgd;
 	struct osi_node *n, *next = NULL;
@@ -218,7 +218,7 @@ static unsigned int calc_gfs2_tree_height(struct lgfs2_inode *ip, uint64_t size)
 /* ------------------------------------------------------------------------- */
 /* mp_gfs1_to_gfs2 - convert a gfs1 metapath to a gfs2 metapath.             */
 /* ------------------------------------------------------------------------- */
-static void mp_gfs1_to_gfs2(struct gfs2_sbd *sbp, int gfs1_h, int gfs2_h,
+static void mp_gfs1_to_gfs2(struct lgfs2_sbd *sbp, int gfs1_h, int gfs2_h,
 		     struct metapath *gfs1mp, struct metapath *gfs2mp)
 {
 	uint64_t lblock;
@@ -258,7 +258,7 @@ static void mp_gfs1_to_gfs2(struct gfs2_sbd *sbp, int gfs1_h, int gfs2_h,
 /*                interested in rearranging the metadata while leaving the   */
 /*                actual data blocks intact.                                 */
 /* ------------------------------------------------------------------------- */
-static void fix_metatree(struct gfs2_sbd *sbp, struct lgfs2_inode *ip,
+static void fix_metatree(struct lgfs2_sbd *sbp, struct lgfs2_inode *ip,
 		  struct blocklist *blk, __be64 *first_nonzero_ptr,
 		  unsigned int size)
 {
@@ -377,7 +377,7 @@ static void fix_metatree(struct gfs2_sbd *sbp, struct lgfs2_inode *ip,
 /* Adapted from fsck.gfs2 metawalk.c's build_and_check_metalist              */
 /* ------------------------------------------------------------------------- */
 
-static void jdata_mp_gfs1_to_gfs2(struct gfs2_sbd *sbp, int gfs1_h, int gfs2_h,
+static void jdata_mp_gfs1_to_gfs2(struct lgfs2_sbd *sbp, int gfs1_h, int gfs2_h,
 			   struct metapath *gfs1mp, struct metapath *gfs2mp,
 			   unsigned int *len, uint64_t dinode_size)
 {
@@ -416,7 +416,7 @@ static void jdata_mp_gfs1_to_gfs2(struct gfs2_sbd *sbp, int gfs1_h, int gfs2_h,
 	}
 }
 
-static uint64_t fix_jdatatree(struct gfs2_sbd *sbp, struct lgfs2_inode *ip,
+static uint64_t fix_jdatatree(struct lgfs2_sbd *sbp, struct lgfs2_inode *ip,
 			      struct blocklist *blk, char *srcptr,
 			      unsigned int size)
 {
@@ -485,7 +485,7 @@ static uint64_t fix_jdatatree(struct gfs2_sbd *sbp, struct lgfs2_inode *ip,
 	return block;
 }
 
-static int get_inode_metablocks(struct gfs2_sbd *sbp, struct lgfs2_inode *ip, struct blocklist *blocks)
+static int get_inode_metablocks(struct lgfs2_sbd *sbp, struct lgfs2_inode *ip, struct blocklist *blocks)
 {
 	struct blocklist *blk, *newblk;
 	struct lgfs2_buffer_head *bh, *dibh = ip->i_bh;
@@ -569,7 +569,7 @@ static int get_inode_metablocks(struct gfs2_sbd *sbp, struct lgfs2_inode *ip, st
 	return 0;
 }
 
-static int fix_ind_reg_or_dir(struct gfs2_sbd *sbp, struct lgfs2_inode *ip, uint32_t di_height,
+static int fix_ind_reg_or_dir(struct lgfs2_sbd *sbp, struct lgfs2_inode *ip, uint32_t di_height,
 		       uint32_t gfs2_hgt, struct blocklist *blk, struct blocklist *blocks)
 {
 	unsigned int len, bufsize;
@@ -611,8 +611,8 @@ static int fix_ind_reg_or_dir(struct gfs2_sbd *sbp, struct lgfs2_inode *ip, uint
 	return 0;
 }
 
-static int fix_ind_jdata(struct gfs2_sbd *sbp, struct lgfs2_inode *ip, uint32_t di_height, 
-		  uint32_t gfs2_hgt, uint64_t dinode_size, struct blocklist *blk, 
+static int fix_ind_jdata(struct lgfs2_sbd *sbp, struct lgfs2_inode *ip, uint32_t di_height,
+		  uint32_t gfs2_hgt, uint64_t dinode_size, struct blocklist *blk,
 		  struct blocklist *blocks)
 {
 	/*FIXME: Messages here should be different, to not conflit with messages in get_inode_metablocks */
@@ -681,7 +681,7 @@ static int fix_ind_jdata(struct gfs2_sbd *sbp, struct lgfs2_inode *ip, uint32_t
 	return 0;
 }
 
-static int adjust_indirect_blocks(struct gfs2_sbd *sbp, struct lgfs2_inode *ip)
+static int adjust_indirect_blocks(struct lgfs2_sbd *sbp, struct lgfs2_inode *ip)
 {
 	uint64_t dinode_size;
 	uint32_t gfs2_hgt, di_height;
@@ -774,7 +774,7 @@ static int has_cdpn(const char *str)
 	return 0;
 }
 
-static int fix_cdpn_symlink(struct gfs2_sbd *sbp, struct lgfs2_buffer_head *bh, struct lgfs2_inode *ip)
+static int fix_cdpn_symlink(struct lgfs2_sbd *sbp, struct lgfs2_buffer_head *bh, struct lgfs2_inode *ip)
 {
 	char *linkptr = NULL;
 
@@ -809,7 +809,7 @@ static int fix_cdpn_symlink(struct gfs2_sbd *sbp, struct lgfs2_buffer_head *bh,
  * to fix the header. gfs1 uses gfs_indirect as the header which is 64 bytes
  * bigger than gfs2_meta_header that gfs2 uses.
  */
-static int fix_xattr(struct gfs2_sbd *sbp, struct lgfs2_buffer_head *bh, struct lgfs2_inode *ip)
+static int fix_xattr(struct lgfs2_sbd *sbp, struct lgfs2_buffer_head *bh, struct lgfs2_inode *ip)
 {
 	int len, old_hdr_sz, new_hdr_sz;
 	struct lgfs2_buffer_head *eabh;
@@ -843,7 +843,7 @@ static int fix_xattr(struct gfs2_sbd *sbp, struct lgfs2_buffer_head *bh, struct
 /*                                                                           */
 /* Returns: 0 on success, -1 on failure                                      */
 /* ------------------------------------------------------------------------- */
-static int adjust_inode(struct gfs2_sbd *sbp, struct lgfs2_buffer_head *bh)
+static int adjust_inode(struct lgfs2_sbd *sbp, struct lgfs2_buffer_head *bh)
 {
 	struct lgfs2_inode *inode;
 	struct inode_block *fixdir;
@@ -981,7 +981,7 @@ static int next_rg_meta(struct rgrp_tree *rgd, uint64_t *block, int first)
 	return 0;
 }
 
-static int next_rg_metatype(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
+static int next_rg_metatype(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd,
                             uint64_t *block, uint32_t type, int first)
 {
 	struct lgfs2_buffer_head *bh = NULL;
@@ -1006,7 +1006,7 @@ static int next_rg_metatype(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 /*                                                                           */
 /* Returns: 0 on success, -1 on failure                                      */
 /* ------------------------------------------------------------------------- */
-static int inode_renumber(struct gfs2_sbd *sbp, uint64_t root_inode_addr, osi_list_t *cdpn_to_fix)
+static int inode_renumber(struct lgfs2_sbd *sbp, uint64_t root_inode_addr, osi_list_t *cdpn_to_fix)
 {
 	struct rgrp_tree *rgd;
 	struct osi_node *n, *next = NULL;
@@ -1099,7 +1099,7 @@ static int inode_renumber(struct gfs2_sbd *sbp, uint64_t root_inode_addr, osi_li
 /**
  * fetch_inum - fetch an inum entry from disk, given its block
  */
-static int fetch_inum(struct gfs2_sbd *sbp, uint64_t iblock,
+static int fetch_inum(struct lgfs2_sbd *sbp, uint64_t iblock,
 		      struct lgfs2_inum *inum, uint64_t *eablk)
 {
 	struct lgfs2_inode *fix_inode;
@@ -1124,7 +1124,7 @@ static int fetch_inum(struct gfs2_sbd *sbp, uint64_t iblock,
 /*                                                                           */
 /* Returns: 0 on success, -1 on failure, -EISDIR when dentmod marked DT_DIR  */
 /* ------------------------------------------------------------------------- */
-static int process_dirent_info(struct lgfs2_inode *dip, struct gfs2_sbd *sbp,
+static int process_dirent_info(struct lgfs2_inode *dip, struct lgfs2_sbd *sbp,
 			       struct lgfs2_buffer_head *bh, int dir_entries, uint64_t dentmod)
 {
 	int error = 0;
@@ -1244,7 +1244,7 @@ static int process_dirent_info(struct lgfs2_inode *dip, struct gfs2_sbd *sbp,
 /*                                                                           */
 /* Returns: 0 on success, -1 on failure                                      */
 /* ------------------------------------------------------------------------- */
-static int fix_one_directory_exhash(struct gfs2_sbd *sbp, struct lgfs2_inode *dip, uint64_t dentmod)
+static int fix_one_directory_exhash(struct lgfs2_sbd *sbp, struct lgfs2_inode *dip, uint64_t dentmod)
 {
 	struct lgfs2_buffer_head *bh_leaf;
 	int error;
@@ -1296,7 +1296,7 @@ static int fix_one_directory_exhash(struct gfs2_sbd *sbp, struct lgfs2_inode *di
 	return 0;
 }/* fix_one_directory_exhash */
 
-static int process_directory(struct gfs2_sbd *sbp, uint64_t dirblock, uint64_t dentmod)
+static int process_directory(struct lgfs2_sbd *sbp, uint64_t dirblock, uint64_t dentmod)
 {
 	struct lgfs2_inode *dip;
 	int error = 0;
@@ -1327,7 +1327,7 @@ static int process_directory(struct gfs2_sbd *sbp, uint64_t dirblock, uint64_t d
 /* fix_directory_info - sync new inode numbers with directory info           */
 /* Returns: 0 on success, -1 on failure                                      */
 /* ------------------------------------------------------------------------- */
-static int fix_directory_info(struct gfs2_sbd *sbp, osi_list_t *dir_to_fix)
+static int fix_directory_info(struct lgfs2_sbd *sbp, osi_list_t *dir_to_fix)
 {
 	osi_list_t *tmp, *fix;
 	struct inode_block *dir_iblk;
@@ -1373,7 +1373,7 @@ static int fix_directory_info(struct gfs2_sbd *sbp, osi_list_t *dir_to_fix)
 /* fix_cdpn_symlinks - convert cdpn symlinks to empty directories            */
 /* Returns: 0 on success, -1 on failure                                      */
 /* ------------------------------------------------------------------------- */
-static int fix_cdpn_symlinks(struct gfs2_sbd *sbp, osi_list_t *cdpn_to_fix)
+static int fix_cdpn_symlinks(struct lgfs2_sbd *sbp, osi_list_t *cdpn_to_fix)
 {
 	osi_list_t *tmp, *x;
 	int error = 0;
@@ -1432,7 +1432,7 @@ static int fix_cdpn_symlinks(struct gfs2_sbd *sbp, osi_list_t *cdpn_to_fix)
 /* read_gfs1_jiindex - read the gfs1 jindex file.                            */
 /* Returns: 0 on success, -1 on failure                                      */
 /* ------------------------------------------------------------------------- */
-static int read_gfs1_jiindex(struct gfs2_sbd *sdp)
+static int read_gfs1_jiindex(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *ip = sdp->md.jiinode;
 	char buf[sizeof(struct gfs_jindex)];
@@ -1491,7 +1491,7 @@ static int read_gfs1_jiindex(struct gfs2_sbd *sdp)
 	return -1;
 }
 
-static int sanity_check(struct gfs2_sbd *sdp)
+static int sanity_check(struct lgfs2_sbd *sdp)
 {
 	int error = 0;
 	if (!gfs1_sb.sb_quota_di.no_addr) {
@@ -1517,7 +1517,7 @@ static int sanity_check(struct gfs2_sbd *sdp)
  *
  * Returns: 0 on success, -1 on failure.
  */
-static int gfs1_ri_update(struct gfs2_sbd *sdp, int *rgcount, int quiet)
+static int gfs1_ri_update(struct lgfs2_sbd *sdp, int *rgcount, int quiet)
 {
 	struct rgrp_tree *rgd;
 	uint64_t count1 = 0, count2 = 0;
@@ -1560,13 +1560,13 @@ static int gfs1_ri_update(struct gfs2_sbd *sdp, int *rgcount, int quiet)
 /* init - initialization code                                                */
 /* Returns: 0 on success, -1 on failure                                      */
 /* ------------------------------------------------------------------------- */
-static int init(struct gfs2_sbd *sbp, struct gfs2_options *opts)
+static int init(struct lgfs2_sbd *sbp, struct gfs2_options *opts)
 {
 	struct lgfs2_buffer_head *bh;
 	int rgcount;
 	struct lgfs2_inum inum;
 
-	memset(sbp, 0, sizeof(struct gfs2_sbd));
+	memset(sbp, 0, sizeof(struct lgfs2_sbd));
 	if ((sbp->device_fd = open(opts->device, O_RDWR)) < 0) {
 		perror(opts->device);
 		exit(-1);
@@ -1775,7 +1775,7 @@ static void process_parameters(int argc, char **argv, struct gfs2_options *opts)
 /* rgrp_length - Calculate the length of a resource group                    */
 /* @size: The total size of the resource group                               */
 /* ------------------------------------------------------------------------- */
-static uint64_t rgrp_length(uint64_t size, struct gfs2_sbd *sdp)
+static uint64_t rgrp_length(uint64_t size, struct lgfs2_sbd *sdp)
 {
 	uint64_t bitbytes = RGRP_BITMAP_BLKS(sdp->sd_bsize) + 1;
 	uint64_t stuff = RGRP_STUFFED_BLKS(sdp->sd_bsize) + 1;
@@ -1804,7 +1804,7 @@ static uint64_t rgrp_length(uint64_t size, struct gfs2_sbd *sdp)
 /*                                                                           */
 /* Returns: 0 on success, -1 on failure                                      */
 /* ------------------------------------------------------------------------- */
-static int journ_space_to_rg(struct gfs2_sbd *sdp)
+static int journ_space_to_rg(struct lgfs2_sbd *sdp)
 {
 	int error = 0;
 	int j;
@@ -1894,7 +1894,7 @@ static int journ_space_to_rg(struct gfs2_sbd *sdp)
 /* ------------------------------------------------------------------------- */
 /* update_inode_file - update the inode file with the new next_inum          */
 /* ------------------------------------------------------------------------- */
-static void update_inode_file(struct gfs2_sbd *sdp)
+static void update_inode_file(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *ip = sdp->md.inum;
 	__be64 buf;
@@ -1913,7 +1913,7 @@ static void update_inode_file(struct gfs2_sbd *sdp)
 /**
  * write_statfs_file - write the statfs file
  */
-static void write_statfs_file(struct gfs2_sbd *sdp)
+static void write_statfs_file(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *ip = sdp->md.statfs;
 	struct gfs2_statfs_change sc;
@@ -1933,7 +1933,7 @@ static void write_statfs_file(struct gfs2_sbd *sdp)
 /* ------------------------------------------------------------------------- */
 /* remove_obsolete_gfs1 - remove obsolete gfs1 inodes.                       */
 /* ------------------------------------------------------------------------- */
-static void remove_obsolete_gfs1(struct gfs2_sbd *sbp)
+static void remove_obsolete_gfs1(struct lgfs2_sbd *sbp)
 {
 	struct lgfs2_inum inum;
 
@@ -1959,7 +1959,7 @@ static void remove_obsolete_gfs1(struct gfs2_sbd *sbp)
 /* ------------------------------------------------------------------------- */
 /* lifted from libgfs2/structures.c                                          */
 /* ------------------------------------------------------------------------- */
-static int conv_build_jindex(struct gfs2_sbd *sdp)
+static int conv_build_jindex(struct lgfs2_sbd *sdp)
 {
 	unsigned int j;
 
@@ -1994,7 +1994,7 @@ static int conv_build_jindex(struct gfs2_sbd *sdp)
 	return 0;
 }
 
-static unsigned int total_file_blocks(struct gfs2_sbd *sdp, 
+static unsigned int total_file_blocks(struct lgfs2_sbd *sdp, 
 				      uint64_t filesize, int journaled)
 {
 	unsigned int data_blks = 0, meta_blks = 0;
@@ -2032,7 +2032,7 @@ out:
 /* We check if the GFS2 filesystem files/structures created after the call to 
  * check_fit() in main() will fit in the currently available free blocks
  */
-static int check_fit(struct gfs2_sbd *sdp)
+static int check_fit(struct lgfs2_sbd *sdp)
 {
 	unsigned int blks_need = 0, blks_avail = sdp->blks_total - sdp->blks_alloced;
 
@@ -2086,7 +2086,7 @@ static int check_fit(struct gfs2_sbd *sdp)
 	return blks_avail > blks_need;
 }
 
-static int build_per_node(struct gfs2_sbd *sdp)
+static int build_per_node(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *per_node;
 	unsigned int j;
@@ -2133,7 +2133,7 @@ static int build_per_node(struct gfs2_sbd *sdp)
  * inode height/size of the new quota file to that of the old one and set the 
  * old quota inode height/size to zero, so only the inode block gets freed.
  */
-static void copy_quotas(struct gfs2_sbd *sdp)
+static void copy_quotas(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inum inum;
 	struct lgfs2_inode *oq_ip, *nq_ip;
diff --git a/gfs2/edit/gfs2hex.c b/gfs2/edit/gfs2hex.c
index d167bdb4..73b45f2e 100644
--- a/gfs2/edit/gfs2hex.c
+++ b/gfs2/edit/gfs2hex.c
@@ -31,7 +31,7 @@ uint64_t block = 0;
 int blockhist = 0;
 struct iinfo *indirect;
 int indirect_blocks;
-struct gfs2_sbd sbd;
+struct lgfs2_sbd sbd;
 uint64_t starting_blk;
 struct blkstack_info blockstack[BLOCK_STACK_SIZE];
 int identify = FALSE;
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index 3b8f1b48..4eb1a839 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -873,7 +873,7 @@ static void read_superblock(int fd)
 	struct gfs2_meta_header *mh;
 
 	ioctl(fd, BLKFLSBUF, 0);
-	memset(&sbd, 0, sizeof(struct gfs2_sbd));
+	memset(&sbd, 0, sizeof(struct lgfs2_sbd));
 	sbd.sd_bsize = GFS2_DEFAULT_BSIZE;
 	sbd.device_fd = fd;
 	bh = lgfs2_bread(&sbd, 0x10);
diff --git a/gfs2/edit/hexedit.h b/gfs2/edit/hexedit.h
index 543cc3ab..d45fae2b 100644
--- a/gfs2/edit/hexedit.h
+++ b/gfs2/edit/hexedit.h
@@ -43,7 +43,7 @@ extern int edit_row[DMODES], edit_col[DMODES], print_entry_ndx;
 extern int start_row[DMODES], end_row[DMODES], lines_per_row[DMODES];
 extern int edit_size[DMODES], last_entry_onscreen[DMODES];
 extern char edit_fmt[80];
-extern struct gfs2_sbd sbd;
+extern struct lgfs2_sbd sbd;
 extern struct gfs2_dinode *di;
 extern int screen_chunk_size; /* how much of the 4K can fit on screen */
 extern int gfs2_struct_type;
diff --git a/gfs2/edit/journal.c b/gfs2/edit/journal.c
index 492f539c..c977ef7f 100644
--- a/gfs2/edit/journal.c
+++ b/gfs2/edit/journal.c
@@ -105,7 +105,7 @@ static void check_journal_wrap(uint64_t seq, uint64_t *highest_seq)
 static int fsck_readi(struct lgfs2_inode *ip, void *rbuf, uint64_t roffset,
 	       unsigned int size, uint64_t *abs_block)
 {
-	struct gfs2_sbd *sdp;
+	struct lgfs2_sbd *sdp;
 	struct lgfs2_buffer_head *lbh;
 	uint64_t lblock, dblock;
 	unsigned int o;
diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index aa4c1296..4ab4f4a1 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -796,7 +796,7 @@ new_range:
 	free(br);
 }
 
-static int save_leaf_chain(struct metafd *mfd, struct gfs2_sbd *sdp, char *buf)
+static int save_leaf_chain(struct metafd *mfd, struct lgfs2_sbd *sdp, char *buf)
 {
 	struct gfs2_leaf *leaf = (struct gfs2_leaf *)buf;
 
@@ -1035,7 +1035,7 @@ static void save_allocated(struct rgrp_tree *rgd, struct metafd *mfd)
 	free(ibuf);
 }
 
-static char *rgrp_read(struct gfs2_sbd *sdp, uint64_t addr, unsigned blocks)
+static char *rgrp_read(struct lgfs2_sbd *sdp, uint64_t addr, unsigned blocks)
 {
 	size_t len = blocks * sdp->sd_bsize;
 	off_t off = addr * sdp->sd_bsize;
@@ -1055,7 +1055,7 @@ static char *rgrp_read(struct gfs2_sbd *sdp, uint64_t addr, unsigned blocks)
 	return buf;
 }
 
-static void save_rgrp(struct gfs2_sbd *sdp, struct metafd *mfd, struct rgrp_tree *rgd, int withcontents)
+static void save_rgrp(struct lgfs2_sbd *sdp, struct metafd *mfd, struct rgrp_tree *rgd, int withcontents)
 {
 	uint64_t addr = rgd->rt_addr;
 	char *buf;
diff --git a/gfs2/fsck/afterpass1_common.c b/gfs2/fsck/afterpass1_common.c
index 9b0788b9..b41f216e 100644
--- a/gfs2/fsck/afterpass1_common.c
+++ b/gfs2/fsck/afterpass1_common.c
@@ -131,7 +131,7 @@ static int remove_dentry(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 
 }
 
-int remove_dentry_from_dir(struct gfs2_sbd *sdp, uint64_t dir,
+int remove_dentry_from_dir(struct lgfs2_sbd *sdp, uint64_t dir,
 			   uint64_t dentryblock)
 {
 	struct metawalk_fxns remove_dentry_fxns = {0};
@@ -241,7 +241,7 @@ int delete_eattr_entry(struct lgfs2_inode *ip, struct lgfs2_buffer_head *leaf_bh
 		       struct gfs2_ea_header *ea_hdr,
 		       struct gfs2_ea_header *ea_hdr_prev, void *private)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	char ea_name[256];
 	uint32_t avail_size;
 	int max_ptrs;
diff --git a/gfs2/fsck/afterpass1_common.h b/gfs2/fsck/afterpass1_common.h
index b0057be4..055816b4 100644
--- a/gfs2/fsck/afterpass1_common.h
+++ b/gfs2/fsck/afterpass1_common.h
@@ -26,6 +26,6 @@ extern int delete_eattr_extentry(struct lgfs2_inode *ip, int i,
 				 struct gfs2_ea_header *ea_hdr,
 				 struct gfs2_ea_header *ea_hdr_prev,
 				 void *private);
-extern int remove_dentry_from_dir(struct gfs2_sbd *sdp, uint64_t dir,
+extern int remove_dentry_from_dir(struct lgfs2_sbd *sdp, uint64_t dir,
 						   uint64_t dentryblock);
 #endif
diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index 11dc4792..45bd213a 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -33,7 +33,7 @@ struct gfs2_revoke_replay {
 	unsigned int rr_where;
 };
 
-static int revoke_add(struct gfs2_sbd *sdp, uint64_t blkno, unsigned int where)
+static int revoke_add(struct lgfs2_sbd *sdp, uint64_t blkno, unsigned int where)
 {
 	osi_list_t *tmp, *head = &sd_revoke_list;
 	struct gfs2_revoke_replay *rr;
@@ -62,7 +62,7 @@ static int revoke_add(struct gfs2_sbd *sdp, uint64_t blkno, unsigned int where)
 	return 1;
 }
 
-static int revoke_check(struct gfs2_sbd *sdp, uint64_t blkno, unsigned int where)
+static int revoke_check(struct lgfs2_sbd *sdp, uint64_t blkno, unsigned int where)
 {
 	osi_list_t *tmp;
 	struct gfs2_revoke_replay *rr;
@@ -86,7 +86,7 @@ static int revoke_check(struct gfs2_sbd *sdp, uint64_t blkno, unsigned int where
 	return (wrap) ? (a || b) : (a && b);
 }
 
-static void revoke_clean(struct gfs2_sbd *sdp)
+static void revoke_clean(struct lgfs2_sbd *sdp)
 {
 	osi_list_t *head = &sd_revoke_list;
 	struct gfs2_revoke_replay *rr;
@@ -98,7 +98,7 @@ static void revoke_clean(struct gfs2_sbd *sdp)
 	}
 }
 
-static void refresh_rgrp(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
+static void refresh_rgrp(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd,
 			 struct lgfs2_buffer_head *bh, uint64_t blkno)
 {
 	int i;
@@ -125,7 +125,7 @@ static int buf_lo_scan_elements(struct lgfs2_inode *ip, unsigned int start,
 				struct gfs2_log_descriptor *ld, __be64 *ptr,
 				int pass)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	unsigned int blks = be32_to_cpu(ld->ld_data1);
 	struct lgfs2_buffer_head *bh_log, *bh_ip;
 	uint64_t blkno;
@@ -186,7 +186,7 @@ static int revoke_lo_scan_elements(struct lgfs2_inode *ip, unsigned int start,
 				   struct gfs2_log_descriptor *ld, __be64 *ptr,
 				   int pass)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	unsigned int blks = be32_to_cpu(ld->ld_length);
 	unsigned int revokes = be32_to_cpu(ld->ld_data1);
 	struct lgfs2_buffer_head *bh;
@@ -236,7 +236,7 @@ static int databuf_lo_scan_elements(struct lgfs2_inode *ip, unsigned int start,
 				    struct gfs2_log_descriptor *ld,
 				    __be64 *ptr, int pass)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	unsigned int blks = be32_to_cpu(ld->ld_data1);
 	struct lgfs2_buffer_head *bh_log, *bh_ip;
 	uint64_t blkno;
@@ -450,7 +450,7 @@ static int check_journal_seq_no(struct lgfs2_inode *ip, int fix)
  * mounted by other nodes in the cluster, which is dangerous and therefore,
  * we should warn the user to run fsck.gfs2 manually when it's safe.
  */
-int preen_is_safe(struct gfs2_sbd *sdp, int preen, int force_check)
+int preen_is_safe(struct lgfs2_sbd *sdp, int preen, int force_check)
 {
 	if (!preen)       /* If preen was not specified */
 		return 1; /* not called by rc.sysinit--we're okay to preen */
@@ -479,7 +479,7 @@ int preen_is_safe(struct gfs2_sbd *sdp, int preen, int force_check)
 static int gfs2_recover_journal(struct lgfs2_inode *ip, int j, int preen,
 				int force_check, int *was_clean)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	struct lgfs2_log_header head;
 	unsigned int pass;
 	int error;
@@ -675,7 +675,7 @@ static struct metawalk_fxns rangecheck_journal = {
  *
  * Returns: 0 on success, -1 on failure
  */
-int replay_journals(struct gfs2_sbd *sdp, int preen, int force_check,
+int replay_journals(struct lgfs2_sbd *sdp, int preen, int force_check,
 		    int *clean_journals)
 {
 	int i;
@@ -735,7 +735,7 @@ int replay_journals(struct gfs2_sbd *sdp, int preen, int force_check,
  *
  * Returns: 0 on success, -1 on failure
  */
-int ji_update(struct gfs2_sbd *sdp)
+int ji_update(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *jip, *ip = sdp->md.jiinode;
 	char journal_name[JOURNAL_NAME_SIZE];
@@ -848,7 +848,7 @@ static struct metawalk_fxns jindex_check_fxns = {
 	.check_dentry = check_jindex_dent,
 };
 
-int build_jindex(struct gfs2_sbd *sdp)
+int build_jindex(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *jindex;
 
@@ -872,7 +872,7 @@ int build_jindex(struct gfs2_sbd *sdp)
 /**
  * init_jindex - read in the rindex file
  */
-int init_jindex(struct gfs2_sbd *sdp, int allow_ji_rebuild)
+int init_jindex(struct lgfs2_sbd *sdp, int allow_ji_rebuild)
 {
 	/*******************************************************************
 	 ******************  Fill in journal information  ******************
diff --git a/gfs2/fsck/fs_recovery.h b/gfs2/fsck/fs_recovery.h
index 884d3c43..0d5a785d 100644
--- a/gfs2/fsck/fs_recovery.h
+++ b/gfs2/fsck/fs_recovery.h
@@ -3,12 +3,12 @@
 
 #include "libgfs2.h"
 
-extern int replay_journals(struct gfs2_sbd *sdp, int preen, int force_check,
+extern int replay_journals(struct lgfs2_sbd *sdp, int preen, int force_check,
 			   int *clean_journals);
-extern int preen_is_safe(struct gfs2_sbd *sdp, int preen, int force_check);
+extern int preen_is_safe(struct lgfs2_sbd *sdp, int preen, int force_check);
 
-extern int ji_update(struct gfs2_sbd *sdp);
-extern int build_jindex(struct gfs2_sbd *sdp);
-extern int init_jindex(struct gfs2_sbd *sdp, int allow_ji_rebuild);
+extern int ji_update(struct lgfs2_sbd *sdp);
+extern int build_jindex(struct lgfs2_sbd *sdp);
+extern int init_jindex(struct lgfs2_sbd *sdp, int allow_ji_rebuild);
 #endif /* __FS_RECOVERY_H__ */
 
diff --git a/gfs2/fsck/fsck.h b/gfs2/fsck/fsck.h
index 1645b853..baf7c926 100644
--- a/gfs2/fsck/fsck.h
+++ b/gfs2/fsck/fsck.h
@@ -108,23 +108,23 @@ enum rgindex_trust_level { /* how far can we trust our RG index? */
 			   must have been converted from gfs2_convert. */
 };
 
-extern struct lgfs2_inode *fsck_load_inode(struct gfs2_sbd *sdp, uint64_t block);
-extern struct lgfs2_inode *fsck_inode_get(struct gfs2_sbd *sdp,
+extern struct lgfs2_inode *fsck_load_inode(struct lgfs2_sbd *sdp, uint64_t block);
+extern struct lgfs2_inode *fsck_inode_get(struct lgfs2_sbd *sdp,
 					 struct rgrp_tree *rgd,
 					 struct lgfs2_buffer_head *bh);
 extern void fsck_inode_put(struct lgfs2_inode **ip);
 
-extern int initialize(struct gfs2_sbd *sdp, int force_check, int preen,
+extern int initialize(struct lgfs2_sbd *sdp, int force_check, int preen,
 		      int *all_clean);
-extern void destroy(struct gfs2_sbd *sdp);
-extern int pass1(struct gfs2_sbd *sdp);
-extern int pass1b(struct gfs2_sbd *sdp);
-extern int pass1c(struct gfs2_sbd *sdp);
-extern int pass2(struct gfs2_sbd *sdp);
-extern int pass3(struct gfs2_sbd *sdp);
-extern int pass4(struct gfs2_sbd *sdp);
-extern int pass5(struct gfs2_sbd *sdp, struct gfs2_bmap *bl);
-extern int rindex_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok);
+extern void destroy(struct lgfs2_sbd *sdp);
+extern int pass1(struct lgfs2_sbd *sdp);
+extern int pass1b(struct lgfs2_sbd *sdp);
+extern int pass1c(struct lgfs2_sbd *sdp);
+extern int pass2(struct lgfs2_sbd *sdp);
+extern int pass3(struct lgfs2_sbd *sdp);
+extern int pass4(struct lgfs2_sbd *sdp);
+extern int pass5(struct lgfs2_sbd *sdp, struct gfs2_bmap *bl);
+extern int rindex_repair(struct lgfs2_sbd *sdp, int trust_lvl, int *ok);
 extern int fsck_query(const char *format, ...)
 	__attribute__((format(printf,1,2)));
 extern struct dir_info *dirtree_find(uint64_t block);
@@ -158,7 +158,7 @@ extern int dups_found; /* How many duplicate references have we found? */
 extern int dups_found_first; /* How many duplicates have we found the original
 				reference for? */
 
-static inline int valid_block(struct gfs2_sbd *sdp, uint64_t blkno)
+static inline int valid_block(struct lgfs2_sbd *sdp, uint64_t blkno)
 {
 	return !((blkno > sdp->fssize) || (blkno <= LGFS2_SB_ADDR(sdp)) ||
 	         (lgfs2_get_bitmap(sdp, blkno, NULL) < 0));
@@ -175,7 +175,7 @@ static inline int rgrp_contains_block(struct rgrp_tree *rgd, uint64_t blk)
 
 static inline int valid_block_ip(struct lgfs2_inode *ip, uint64_t blk)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	struct rgrp_tree *rgd = ip->i_rgd;
 
 	if (blk > sdp->fssize)
@@ -200,6 +200,6 @@ extern struct special_blocks *blockfind(struct special_blocks *blist, uint64_t n
 extern void gfs2_special_set(struct special_blocks *blocklist, uint64_t block);
 extern void gfs2_special_free(struct special_blocks *blist);
 extern int sb_fixed;
-extern int build_per_node(struct gfs2_sbd *sdp);
+extern int build_per_node(struct lgfs2_sbd *sdp);
 
 #endif /* _FSCK_H */
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index 8ccfda3e..2bde52ab 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -41,7 +41,7 @@ static uint64_t blks_2free = 0;
  * Change the lock protocol so nobody can mount the fs
  *
  */
-static int block_mounters(struct gfs2_sbd *sdp, int block_em)
+static int block_mounters(struct lgfs2_sbd *sdp, int block_em)
 {
 	if (block_em) {
 		/* verify it starts with lock_ */
@@ -109,7 +109,7 @@ static void gfs2_inodetree_free(void)
  *
  * Returns: Nothing
  */
-static void empty_super_block(struct gfs2_sbd *sdp)
+static void empty_super_block(struct lgfs2_sbd *sdp)
 {
 	log_info( _("Freeing buffers.\n"));
 	lgfs2_rgrp_free(sdp, &sdp->rgtree);
@@ -129,7 +129,7 @@ static void empty_super_block(struct gfs2_sbd *sdp)
  *
  * Returns: 0 on success, -1 on failure
  */
-static int set_block_ranges(struct gfs2_sbd *sdp)
+static int set_block_ranges(struct lgfs2_sbd *sdp)
 {
 	struct osi_node *n, *next = NULL;
 	struct rgrp_tree *rgd;
@@ -185,7 +185,7 @@ static int set_block_ranges(struct gfs2_sbd *sdp)
 /**
  * check_rgrp_integrity - verify a rgrp free block count against the bitmap
  */
-static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
+static void check_rgrp_integrity(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd,
 				 int *fixit, int *this_rg_fixed,
 				 int *this_rg_bad, int *this_rg_cleaned)
 {
@@ -392,7 +392,7 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
  *
  * Returns: 0 on success, 1 if errors were detected
  */
-static void check_rgrps_integrity(struct gfs2_sbd *sdp)
+static void check_rgrps_integrity(struct lgfs2_sbd *sdp)
 {
 	struct osi_node *n, *next = NULL;
 	int rgs_good = 0, rgs_bad = 0, rgs_fixed = 0, rgs_cleaned = 0;
@@ -432,7 +432,7 @@ static void check_rgrps_integrity(struct gfs2_sbd *sdp)
 /**
  * rebuild_master - rebuild a destroyed master directory
  */
-static int rebuild_master(struct gfs2_sbd *sdp)
+static int rebuild_master(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inum inum;
 	struct lgfs2_buffer_head *bh = NULL;
@@ -590,7 +590,7 @@ static int rebuild_master(struct gfs2_sbd *sdp)
  * allow_rebuild: 0 if rebuilds are not allowed
  *                1 if rebuilds are allowed
  */
-static void lookup_per_node(struct gfs2_sbd *sdp, int allow_rebuild)
+static void lookup_per_node(struct lgfs2_sbd *sdp, int allow_rebuild)
 {
 	if (sdp->md.pinode)
 		return;
@@ -625,7 +625,7 @@ static void lookup_per_node(struct gfs2_sbd *sdp, int allow_rebuild)
 
 #define RA_WINDOW 32
 
-static unsigned gfs2_rgrp_reada(struct gfs2_sbd *sdp, unsigned cur_window,
+static unsigned gfs2_rgrp_reada(struct lgfs2_sbd *sdp, unsigned cur_window,
 				struct osi_node *n)
 {
 	struct rgrp_tree *rgd;
@@ -656,7 +656,7 @@ static unsigned gfs2_rgrp_reada(struct gfs2_sbd *sdp, unsigned cur_window,
  *
  * Returns: 0 on success, -1 on failure.
  */
-static int read_rgrps(struct gfs2_sbd *sdp, uint64_t expected)
+static int read_rgrps(struct lgfs2_sbd *sdp, uint64_t expected)
 {
 	struct rgrp_tree *rgd;
 	uint64_t count = 0;
@@ -697,7 +697,7 @@ static int read_rgrps(struct gfs2_sbd *sdp, uint64_t expected)
 	return -1;
 }
 
-static int fetch_rgrps_level(struct gfs2_sbd *sdp, enum rgindex_trust_level lvl, uint64_t *count, int *ok)
+static int fetch_rgrps_level(struct lgfs2_sbd *sdp, enum rgindex_trust_level lvl, uint64_t *count, int *ok)
 {
 	int ret = 1;
 
@@ -742,7 +742,7 @@ fail:
 /**
  * fetch_rgrps - fetch the resource groups from disk, and check their integrity
  */
-static int fetch_rgrps(struct gfs2_sbd *sdp)
+static int fetch_rgrps(struct lgfs2_sbd *sdp)
 {
 	enum rgindex_trust_level trust_lvl;
 	uint64_t rgcount;
@@ -774,7 +774,7 @@ static int fetch_rgrps(struct gfs2_sbd *sdp)
  *
  * Returns: 0 on success, -1 on failure
  */
-static int init_system_inodes(struct gfs2_sbd *sdp)
+static int init_system_inodes(struct lgfs2_sbd *sdp)
 {
 	__be64 inumbuf = 0;
 	char *buf;
@@ -968,7 +968,7 @@ static int is_journal_copy(struct lgfs2_inode *ip)
  * the per_node directory will have a ".." entry that will lead us to
  * the master dinode if it's been destroyed.
  */
-static void peruse_system_dinode(struct gfs2_sbd *sdp, struct lgfs2_inode *ip)
+static void peruse_system_dinode(struct lgfs2_sbd *sdp, struct lgfs2_inode *ip)
 {
 	struct lgfs2_inode *child_ip;
 	struct lgfs2_inum inum;
@@ -1057,7 +1057,7 @@ out_discard_ip:
  * peruse_user_dinode - process a user dinode trying to find the root directory
  *
  */
-static void peruse_user_dinode(struct gfs2_sbd *sdp, struct lgfs2_inode *ip)
+static void peruse_user_dinode(struct lgfs2_sbd *sdp, struct lgfs2_inode *ip)
 {
 	struct lgfs2_inode *parent_ip;
 	struct lgfs2_inum inum;
@@ -1122,7 +1122,7 @@ static void peruse_user_dinode(struct gfs2_sbd *sdp, struct lgfs2_inode *ip)
  * find_rgs_for_bsize - check a range of blocks for rgrps to determine bsize.
  * Assumes: device is open.
  */
-static int find_rgs_for_bsize(struct gfs2_sbd *sdp, uint64_t startblock,
+static int find_rgs_for_bsize(struct lgfs2_sbd *sdp, uint64_t startblock,
 			      uint32_t *known_bsize)
 {
 	uint64_t blk, max_rg_size, rb_addr;
@@ -1190,7 +1190,7 @@ static int find_rgs_for_bsize(struct gfs2_sbd *sdp, uint64_t startblock,
  * peruse_metadata - check a range of blocks for metadata
  * Assumes: device is open.
  */
-static int peruse_metadata(struct gfs2_sbd *sdp, uint64_t startblock)
+static int peruse_metadata(struct lgfs2_sbd *sdp, uint64_t startblock)
 {
 	uint64_t blk, max_rg_size;
 	struct lgfs2_buffer_head *bh;
@@ -1219,7 +1219,7 @@ static int peruse_metadata(struct gfs2_sbd *sdp, uint64_t startblock)
  * Assumes: device is open.
  *          The biggest RG size is 2GB
  */
-static int sb_repair(struct gfs2_sbd *sdp)
+static int sb_repair(struct lgfs2_sbd *sdp)
 {
 	uint64_t half;
 	uint32_t known_bsize = 0;
@@ -1331,7 +1331,7 @@ static int sb_repair(struct gfs2_sbd *sdp)
  *
  * Returns: 0 on success, -1 on failure
  */
-static int fill_super_block(struct gfs2_sbd *sdp)
+static int fill_super_block(struct lgfs2_sbd *sdp)
 {
 	int ret;
 
@@ -1373,7 +1373,7 @@ static int fill_super_block(struct gfs2_sbd *sdp)
  *
  * Returns: -1 on error, 0 otherwise
  */
-static int reconstruct_single_journal(struct gfs2_sbd *sdp, int jnum,
+static int reconstruct_single_journal(struct lgfs2_sbd *sdp, int jnum,
 				      uint32_t ji_nsegment)
 {
 	uint64_t first = sdp->md.journal[jnum]->i_num.in_addr;
@@ -1411,7 +1411,7 @@ static int reconstruct_single_journal(struct gfs2_sbd *sdp, int jnum,
 	return 0;
 }
 
-static int reset_journal_seg_size(struct gfs2_sbd *sdp, unsigned int jsize, unsigned int nsegs)
+static int reset_journal_seg_size(struct lgfs2_sbd *sdp, unsigned int jsize, unsigned int nsegs)
 {
 	unsigned int seg_size = jsize / (nsegs * sdp->sd_bsize);
 	if (!seg_size)
@@ -1429,7 +1429,7 @@ static int reset_journal_seg_size(struct gfs2_sbd *sdp, unsigned int jsize, unsi
 	return 0;
 }
 
-static int correct_journal_seg_size(struct gfs2_sbd *sdp)
+static int correct_journal_seg_size(struct lgfs2_sbd *sdp)
 {
 	int count;
 	struct gfs_jindex *ji_0, *ji_1;
@@ -1482,7 +1482,7 @@ out:
  *
  * Returns: 0 on success, -1 on failure
  */
-static int reconstruct_journals(struct gfs2_sbd *sdp)
+static int reconstruct_journals(struct lgfs2_sbd *sdp)
 {
 	int i, count;
 	struct gfs_jindex *ji;
@@ -1514,7 +1514,7 @@ static int reconstruct_journals(struct gfs2_sbd *sdp)
 /**
  * init_rindex - read in the rindex file
  */
-static int init_rindex(struct gfs2_sbd *sdp)
+static int init_rindex(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *ip;
 
@@ -1544,7 +1544,7 @@ static int init_rindex(struct gfs2_sbd *sdp)
  * initialize - initialize superblock pointer
  *
  */
-int initialize(struct gfs2_sbd *sdp, int force_check, int preen,
+int initialize(struct lgfs2_sbd *sdp, int force_check, int preen,
 	       int *all_clean)
 {
 	int clean_journals = 0, open_flag;
@@ -1679,7 +1679,7 @@ mount_fail:
 	return FSCK_USAGE;
 }
 
-void destroy(struct gfs2_sbd *sdp)
+void destroy(struct lgfs2_sbd *sdp)
 {
 	if (!opts.no) {
 		if (block_mounters(sdp, 0)) {
diff --git a/gfs2/fsck/lost_n_found.c b/gfs2/fsck/lost_n_found.c
index 9e5fae6f..d2064268 100644
--- a/gfs2/fsck/lost_n_found.c
+++ b/gfs2/fsck/lost_n_found.c
@@ -20,7 +20,7 @@
 
 static void add_dotdot(struct lgfs2_inode *ip)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	struct dir_info *di;
 	struct lgfs2_inum no;
 	int err;
@@ -93,7 +93,7 @@ static void add_dotdot(struct lgfs2_inode *ip)
 void make_sure_lf_exists(struct lgfs2_inode *ip)
 {
 	struct dir_info *di;
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	uint32_t mode;
 	int root_entries;
 
@@ -173,7 +173,7 @@ void make_sure_lf_exists(struct lgfs2_inode *ip)
 int add_inode_to_lf(struct lgfs2_inode *ip){
 	char tmp_name[256];
 	unsigned inode_type;
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	struct lgfs2_inum no;
 	int err = 0;
 	uint32_t mode;
diff --git a/gfs2/fsck/main.c b/gfs2/fsck/main.c
index 2c78f2d7..e86ef792 100644
--- a/gfs2/fsck/main.c
+++ b/gfs2/fsck/main.c
@@ -152,7 +152,7 @@ static void interrupt(int sig)
 	}
 }
 
-static int check_statfs(struct gfs2_sbd *sdp)
+static int check_statfs(struct lgfs2_sbd *sdp)
 {
 	struct osi_node *n, *next = NULL;
 	struct rgrp_tree *rgd;
@@ -233,7 +233,7 @@ static const struct fsck_pass passes[] = {
 	{ .name = NULL, }
 };
 
-static int fsck_pass(const struct fsck_pass *p, struct gfs2_sbd *sdp)
+static int fsck_pass(const struct fsck_pass *p, struct lgfs2_sbd *sdp)
 {
 	int ret;
 	struct timeval timer;
@@ -291,8 +291,8 @@ static void startlog(int argc, char **argv)
 #ifndef UNITTESTS
 int main(int argc, char **argv)
 {
-	struct gfs2_sbd sb;
-	struct gfs2_sbd *sdp = &sb;
+	struct lgfs2_sbd sb;
+	struct lgfs2_sbd *sdp = &sb;
 	int j;
 	int i;
 	int error = 0;
diff --git a/gfs2/fsck/metawalk.c b/gfs2/fsck/metawalk.c
index 575bb01b..035f0765 100644
--- a/gfs2/fsck/metawalk.c
+++ b/gfs2/fsck/metawalk.c
@@ -29,7 +29,7 @@
    is used to set the latter.  The two must be kept in sync, otherwise
    you'll get bitmap mismatches.  This function checks the status of the
    bitmap whenever the blockmap changes, and fixes it accordingly. */
-int check_n_fix_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
+int check_n_fix_bitmap(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd,
 		       uint64_t blk, int error_on_dinode, int new_state)
 {
 	int old_state;
@@ -224,7 +224,7 @@ struct duptree *dupfind(uint64_t block)
 	return NULL;
 }
 
-struct lgfs2_inode *fsck_system_inode(struct gfs2_sbd *sdp, uint64_t block)
+struct lgfs2_inode *fsck_system_inode(struct lgfs2_sbd *sdp, uint64_t block)
 {
 	int j;
 
@@ -252,7 +252,7 @@ struct lgfs2_inode *fsck_system_inode(struct gfs2_sbd *sdp, uint64_t block)
 
 /* fsck_load_inode - same as gfs2_load_inode() in libgfs2 but system inodes
    get special treatment. */
-struct lgfs2_inode *fsck_load_inode(struct gfs2_sbd *sdp, uint64_t block)
+struct lgfs2_inode *fsck_load_inode(struct lgfs2_sbd *sdp, uint64_t block)
 {
 	struct lgfs2_inode *ip = NULL;
 
@@ -266,7 +266,7 @@ struct lgfs2_inode *fsck_load_inode(struct gfs2_sbd *sdp, uint64_t block)
 
 /* fsck_inode_get - same as inode_get() in libgfs2 but system inodes
    get special treatment. */
-struct lgfs2_inode *fsck_inode_get(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
+struct lgfs2_inode *fsck_inode_get(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd,
 				  struct lgfs2_buffer_head *bh)
 {
 	struct lgfs2_inode *sysip;
@@ -518,7 +518,7 @@ int check_leaf(struct lgfs2_inode *ip, int lindex, struct metawalk_fxns *pass,
 	struct lgfs2_buffer_head *lbh = NULL;
 	struct gfs2_leaf *lfp;
 	uint32_t count = 0;
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	const char *msg;
 	int di_depth = ip->i_depth;
 
@@ -663,7 +663,7 @@ static void dir_leaf_reada(struct lgfs2_inode *ip, __be64 *tbl, unsigned hsize)
 {
 	uint64_t *t = alloca(hsize * sizeof(uint64_t));
 	uint64_t leaf_no;
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	unsigned n = 0;
 	unsigned i;
 
@@ -686,7 +686,7 @@ int check_leaf_blks(struct lgfs2_inode *ip, struct metawalk_fxns *pass)
 	uint64_t first_ok_leaf, orig_di_blocks;
 	struct lgfs2_buffer_head *lbh;
 	int lindex;
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	int ref_count, orig_ref_count, orig_di_depth, orig_di_height;
 	__be64 *tbl;
 	int chained_leaf, tbl_valid;
@@ -866,7 +866,7 @@ static int check_eattr_entries(struct lgfs2_inode *ip,
 		if (error == 0 && pass->check_eattr_extentry &&
 		   ea_hdr->ea_num_ptrs) {
 			uint32_t tot_ealen = 0;
-			struct gfs2_sbd *sdp = ip->i_sbd;
+			struct lgfs2_sbd *sdp = ip->i_sbd;
 
 			ea_data_ptr = ((__be64 *)((char *)ea_hdr +
 						    sizeof(struct gfs2_ea_header) +
@@ -959,7 +959,7 @@ static int check_indirect_eattr(struct lgfs2_inode *ip, uint64_t indirect,
 	int error = 0, err;
 	__be64 *ea_leaf_ptr, *end;
 	uint64_t block;
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	int first_ea_is_bad = 0;
 	uint64_t di_eattr_save = ip->i_eattr;
 	uint64_t offset = ip->i_sbd->gfs1 ? sizeof(struct gfs_indirect) : sizeof(struct gfs2_meta_header);
@@ -1098,7 +1098,7 @@ static void free_metalist(struct lgfs2_inode *ip, osi_list_t *mlp)
 static void file_ra(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
 		    int head_size, int maxptrs, int h)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	uint64_t sblock = 0, block;
 	int extlen = 0;
 	__be64 *p;
@@ -1639,7 +1639,7 @@ int check_linear_dir(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
 	return error;
 }
 
-int check_dir(struct gfs2_sbd *sdp, struct lgfs2_inode *ip, struct metawalk_fxns *pass)
+int check_dir(struct lgfs2_sbd *sdp, struct lgfs2_inode *ip, struct metawalk_fxns *pass)
 {
 	int error = 0;
 
diff --git a/gfs2/fsck/metawalk.h b/gfs2/fsck/metawalk.h
index 76190685..f82f24bb 100644
--- a/gfs2/fsck/metawalk.h
+++ b/gfs2/fsck/metawalk.h
@@ -12,7 +12,7 @@ extern int check_inode_eattr(struct lgfs2_inode *ip,
 			     struct metawalk_fxns *pass);
 extern int check_metatree(struct lgfs2_inode *ip, struct metawalk_fxns *pass);
 extern int check_leaf_blks(struct lgfs2_inode *ip, struct metawalk_fxns *pass);
-extern int check_dir(struct gfs2_sbd *sdp, struct lgfs2_inode *ip,
+extern int check_dir(struct lgfs2_sbd *sdp, struct lgfs2_inode *ip,
 		     struct metawalk_fxns *pass);
 extern int check_linear_dir(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
 			    struct metawalk_fxns *pass);
@@ -22,11 +22,11 @@ extern int check_leaf(struct lgfs2_inode *ip, int lindex,
 extern int _fsck_bitmap_set(struct lgfs2_inode *ip, uint64_t bblock,
 			    const char *btype, int mark, int error_on_dinode,
 			    const char *caller, int line);
-extern int check_n_fix_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
+extern int check_n_fix_bitmap(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd,
 			      uint64_t blk, int error_on_dinode,
 			      int new_state);
 extern struct duptree *dupfind(uint64_t block);
-extern struct lgfs2_inode *fsck_system_inode(struct gfs2_sbd *sdp,
+extern struct lgfs2_inode *fsck_system_inode(struct lgfs2_sbd *sdp,
 					    uint64_t block);
 
 #define is_duplicate(dblock) ((dupfind(dblock)) ? 1 : 0)
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index a0c6394a..578de609 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -68,7 +68,7 @@ static int check_extended_leaf_eattr(struct lgfs2_inode *ip, int i,
 				     void *private);
 static int finish_eattr_indir(struct lgfs2_inode *ip, int leaf_pointers,
 			      int leaf_pointer_errors, void *private);
-static int handle_ip(struct gfs2_sbd *sdp, struct lgfs2_inode *ip);
+static int handle_ip(struct lgfs2_sbd *sdp, struct lgfs2_inode *ip);
 static int delete_block(struct lgfs2_inode *ip, uint64_t block,
 			struct lgfs2_buffer_head **bh, const char *btype,
 			void *private);
@@ -230,7 +230,7 @@ static int resuscitate_dentry(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			      struct lgfs2_buffer_head *bh, char *filename,
 			      uint32_t *count, int *lindex, void *priv)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	struct lgfs2_dirent d;
 	char tmp_name[PATH_MAX];
 	uint64_t block;
@@ -624,7 +624,7 @@ static int undo_eattr_indir_or_leaf(struct lgfs2_inode *ip, uint64_t block,
 				    struct lgfs2_buffer_head **bh,
 				    void *private)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	int q;
 	int error;
 	struct block_count *bc = (struct block_count *) private;
@@ -668,7 +668,7 @@ static int check_eattr_indir(struct lgfs2_inode *ip, uint64_t indirect,
 			     uint64_t parent, struct lgfs2_buffer_head **bh,
 			     void *private)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	int ret = 0;
 	int q;
 	struct block_count *bc = (struct block_count *) private;
@@ -752,7 +752,7 @@ static int check_ealeaf_block(struct lgfs2_inode *ip, uint64_t block, int btype,
 			      struct lgfs2_buffer_head **bh, void *private)
 {
 	struct lgfs2_buffer_head *leaf_bh = NULL;
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	int q;
 	struct block_count *bc = (struct block_count *) private;
 
@@ -821,7 +821,7 @@ static int check_extended_leaf_eattr(struct lgfs2_inode *ip, int i,
 				     void *private)
 {
 	uint64_t el_blk = be64_to_cpu(*data_ptr);
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	struct lgfs2_buffer_head *bh = NULL;
 	int error = 0;
 
@@ -879,7 +879,7 @@ static int check_eattr_leaf(struct lgfs2_inode *ip, uint64_t block,
 	return check_ealeaf_block(ip, block, GFS2_METATYPE_EA, bh, private);
 }
 
-static int ask_remove_eattr_entry(struct gfs2_sbd *sdp,
+static int ask_remove_eattr_entry(struct lgfs2_sbd *sdp,
 				  struct lgfs2_buffer_head *leaf_bh,
 				  struct gfs2_ea_header *curr,
 				  struct gfs2_ea_header *prev,
@@ -926,7 +926,7 @@ static int check_eattr_entries(struct lgfs2_inode *ip,
 			       struct gfs2_ea_header *ea_hdr_prev,
 			       void *private)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	char ea_name[256];
 	uint32_t offset = (uint32_t)(((unsigned long)ea_hdr) -
 				     ((unsigned long)leaf_bh->b_data));
@@ -1273,7 +1273,7 @@ static void reprocess_inode(struct lgfs2_inode *ip, const char *desc)
 /*
  * handle_ip - process an incore structure representing a dinode.
  */
-static int handle_ip(struct gfs2_sbd *sdp, struct lgfs2_inode *ip)
+static int handle_ip(struct lgfs2_sbd *sdp, struct lgfs2_inode *ip)
 {
 	int error;
 	struct block_count bc = {0};
@@ -1372,7 +1372,7 @@ bad_dinode:
 	return -1;
 }
 
-static void check_i_goal(struct gfs2_sbd *sdp, struct lgfs2_inode *ip)
+static void check_i_goal(struct lgfs2_sbd *sdp, struct lgfs2_inode *ip)
 {
 	if (sdp->gfs1 || ip->i_flags & GFS2_DIF_SYSTEM)
 		return;
@@ -1397,7 +1397,7 @@ static void check_i_goal(struct gfs2_sbd *sdp, struct lgfs2_inode *ip)
  * handle_di - This is now a wrapper function that takes a lgfs2_buffer_head
  *             and calls handle_ip, which takes an in-code dinode structure.
  */
-static int handle_di(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
+static int handle_di(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd,
 		     struct lgfs2_buffer_head *bh)
 {
 	int error = 0;
@@ -1440,10 +1440,10 @@ static int handle_di(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 /* Should work for all system inodes: root, master, jindex, per_node, etc. */
 /* We have to pass the sysinode as ** because the pointer may change out from
    under the reference by way of the builder() function.  */
-static int check_system_inode(struct gfs2_sbd *sdp,
+static int check_system_inode(struct lgfs2_sbd *sdp,
 			      struct lgfs2_inode **sysinode,
 			      const char *filename,
-			      int builder(struct gfs2_sbd *sdp), int isdir,
+			      int builder(struct lgfs2_sbd *sdp), int isdir,
 			      struct lgfs2_inode *sysdir, int needs_sysbit)
 {
 	uint64_t iblock = 0;
@@ -1560,7 +1560,7 @@ static int check_system_inode(struct gfs2_sbd *sdp,
 	return error ? error : err;
 }
 
-static int build_a_journal(struct gfs2_sbd *sdp)
+static int build_a_journal(struct lgfs2_sbd *sdp)
 {
 	char name[256];
 	int err = 0;
@@ -1577,7 +1577,7 @@ static int build_a_journal(struct gfs2_sbd *sdp)
 	return 0;
 }
 
-int build_per_node(struct gfs2_sbd *sdp)
+int build_per_node(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *per_node;
 	unsigned int j;
@@ -1619,7 +1619,7 @@ int build_per_node(struct gfs2_sbd *sdp)
 	return 0;
 }
 
-static int build_inum(struct gfs2_sbd *sdp)
+static int build_inum(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *ip = lgfs2_build_inum(sdp);
 	if (ip == NULL)
@@ -1628,7 +1628,7 @@ static int build_inum(struct gfs2_sbd *sdp)
 	return 0;
 }
 
-static int build_statfs(struct gfs2_sbd *sdp)
+static int build_statfs(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *ip = lgfs2_build_statfs(sdp);
 	if (ip == NULL)
@@ -1637,7 +1637,7 @@ static int build_statfs(struct gfs2_sbd *sdp)
 	return 0;
 }
 
-static int build_rindex(struct gfs2_sbd *sdp)
+static int build_rindex(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *ip = lgfs2_build_rindex(sdp);
 	if (ip == NULL)
@@ -1646,7 +1646,7 @@ static int build_rindex(struct gfs2_sbd *sdp)
 	return 0;
 }
 
-static int build_quota(struct gfs2_sbd *sdp)
+static int build_quota(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *ip = lgfs2_build_quota(sdp);
 	if (ip == NULL)
@@ -1655,7 +1655,7 @@ static int build_quota(struct gfs2_sbd *sdp)
 	return 0;
 }
 
-static int check_system_inodes(struct gfs2_sbd *sdp)
+static int check_system_inodes(struct lgfs2_sbd *sdp)
 {
 	int journal_count;
 
@@ -1751,7 +1751,7 @@ static int check_system_inodes(struct gfs2_sbd *sdp)
 	return 0;
 }
 
-static int pass1_process_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd, uint64_t *ibuf, unsigned n)
+static int pass1_process_bitmap(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd, uint64_t *ibuf, unsigned n)
 {
 	struct lgfs2_buffer_head *bh;
 	unsigned i;
@@ -1874,7 +1874,7 @@ static int pass1_process_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd, uin
 	return 0;
 }
 
-static int pass1_process_rgrp(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
+static int pass1_process_rgrp(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd)
 {
 	unsigned k, n, i;
 	uint64_t *ibuf = malloc(sdp->sd_bsize * GFS2_NBBY * sizeof(uint64_t));
@@ -1942,7 +1942,7 @@ static int link1_create(struct gfs2_bmap *bmap, uint64_t size)
 	return 0;
 }
 
-static struct gfs2_bmap *gfs2_bmap_create(struct gfs2_sbd *sdp, uint64_t size,
+static struct gfs2_bmap *gfs2_bmap_create(struct lgfs2_sbd *sdp, uint64_t size,
 					  uint64_t *addl_mem_needed)
 {
 	struct gfs2_bmap *il;
@@ -1968,7 +1968,7 @@ static void gfs2_blockmap_destroy(struct gfs2_bmap *bmap)
 	bmap->mapsize = 0;
 }
 
-static void *gfs2_bmap_destroy(struct gfs2_sbd *sdp, struct gfs2_bmap *il)
+static void *gfs2_bmap_destroy(struct lgfs2_sbd *sdp, struct gfs2_bmap *il)
 {
 	if (il) {
 		gfs2_blockmap_destroy(il);
@@ -1999,7 +1999,7 @@ static void enomem(uint64_t addl_mem_needed)
  * inodes size
  * dir info
  */
-int pass1(struct gfs2_sbd *sdp)
+int pass1(struct lgfs2_sbd *sdp)
 {
 	struct osi_node *n, *next = NULL;
 	struct rgrp_tree *rgd;
diff --git a/gfs2/fsck/pass1b.c b/gfs2/fsck/pass1b.c
index 11c722d2..d1e1050a 100644
--- a/gfs2/fsck/pass1b.c
+++ b/gfs2/fsck/pass1b.c
@@ -89,7 +89,7 @@ static int findref_data(struct lgfs2_inode *ip, uint64_t metablock,
 	return META_IS_GOOD;
 }
 
-static void clone_data_block(struct gfs2_sbd *sdp, struct duptree *dt,
+static void clone_data_block(struct lgfs2_sbd *sdp, struct duptree *dt,
 			     struct inode_with_dups *id)
 {
 	struct meta_blk_ref metaref = { .block = dt->block, };
@@ -175,7 +175,7 @@ static void revise_dup_handler(uint64_t dup_blk, struct dup_handler *dh)
  * acceptable_ref - Delete dinodes that reference the given block as anything
  *                  _but_ this type.  Try to save references as this type.
  */
-static void resolve_dup_references(struct gfs2_sbd *sdp, struct duptree *dt,
+static void resolve_dup_references(struct lgfs2_sbd *sdp, struct duptree *dt,
 				   osi_list_t *ref_list,
 				   struct dup_handler *dh,
 				   int inval, int acceptable_ref)
@@ -512,7 +512,7 @@ static int set_ip_bitmap(struct lgfs2_inode *ip)
 	return 0;
 }
 
-static void resolve_last_reference(struct gfs2_sbd *sdp, struct duptree *dt,
+static void resolve_last_reference(struct lgfs2_sbd *sdp, struct duptree *dt,
 				   enum dup_ref_type acceptable_ref)
 {
 	struct lgfs2_inode *ip;
@@ -601,7 +601,7 @@ static void resolve_last_reference(struct gfs2_sbd *sdp, struct duptree *dt,
  * This function should resolve and delete the duplicate block reference given,
  * iow dt.
  */
-static int handle_dup_blk(struct gfs2_sbd *sdp, struct duptree *dt)
+static int handle_dup_blk(struct lgfs2_sbd *sdp, struct duptree *dt)
 {
 	osi_list_t *tmp;
 	struct dup_handler dh = {0};
@@ -758,7 +758,7 @@ static int check_eattr_indir_refs(struct lgfs2_inode *ip, uint64_t block,
 				  uint64_t parent,
 				  struct lgfs2_buffer_head **bh, void *private)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	int error;
 
 	error = add_duplicate_ref(ip, block, REF_AS_EA, 1, INODE_VALID);
@@ -772,7 +772,7 @@ static int check_eattr_leaf_refs(struct lgfs2_inode *ip, uint64_t block,
 				 uint64_t parent, struct lgfs2_buffer_head **bh,
 				 void *private)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	int error;
 
 	error = add_duplicate_ref(ip, block, REF_AS_EA, 1, INODE_VALID);
@@ -811,7 +811,7 @@ static int check_eattr_extentry_refs(struct lgfs2_inode *ip, int i,
 
 /* Finds all references to duplicate blocks in the metadata */
 /* Finds all references to duplicate blocks in the metadata */
-static int find_block_ref(struct gfs2_sbd *sdp, uint64_t inode)
+static int find_block_ref(struct lgfs2_sbd *sdp, uint64_t inode)
 {
 	struct lgfs2_inode *ip;
 	int error = 0;
@@ -857,7 +857,7 @@ out:
 /* Pass 1b handles finding the previous inode for a duplicate block
  * When found, store the inodes pointing to the duplicate block for
  * use in pass2 */
-int pass1b(struct gfs2_sbd *sdp)
+int pass1b(struct lgfs2_sbd *sdp)
 {
 	struct duptree *dt;
 	uint64_t i;
diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index 6c13cce9..25da1091 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -33,7 +33,7 @@ static struct metawalk_fxns delete_eattrs = {
 
 /* Set children's parent inode in dir_info structure - ext2 does not set
  * dotdot inode here, but instead in pass3 - should we? */
-static int set_parent_dir(struct gfs2_sbd *sdp, struct lgfs2_inum child, struct lgfs2_inum parent)
+static int set_parent_dir(struct lgfs2_sbd *sdp, struct lgfs2_inum child, struct lgfs2_inum parent)
 {
 	struct dir_info *di;
 
@@ -63,7 +63,7 @@ static int set_parent_dir(struct gfs2_sbd *sdp, struct lgfs2_inum child, struct
 }
 
 /* Set's the child's '..' directory inode number in dir_info structure */
-static int set_dotdot_dir(struct gfs2_sbd *sdp, uint64_t childblock, struct lgfs2_inum parent)
+static int set_dotdot_dir(struct lgfs2_sbd *sdp, uint64_t childblock, struct lgfs2_inum parent)
 {
 	struct dir_info *di;
 
@@ -169,7 +169,7 @@ static int bad_formal_ino(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 	struct dir_info *di = NULL;
 	struct lgfs2_inode *child_ip;
 	struct lgfs2_inum childs_dotdot;
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	int error;
 	struct lgfs2_inum inum = {0};
 
@@ -297,7 +297,7 @@ static int wrong_leaf(struct lgfs2_inode *ip, struct lgfs2_inum *entry,
 		      struct lgfs2_dirent *d, struct gfs2_dirent *prev_de,
 		      uint32_t *count, int q)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	struct lgfs2_buffer_head *dest_lbh;
 	uint64_t planned_leaf, real_leaf;
 	int li, dest_ref, error;
@@ -426,7 +426,7 @@ static int basic_dentry_checks(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			       struct dir_status *ds, int *q,
 			       struct lgfs2_buffer_head *bh, int *isdir)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	uint32_t calculated_hash;
 	struct lgfs2_inode *entry_ip = NULL;
 	int error;
@@ -678,7 +678,7 @@ out:
  * the same, that's an error, and we need to delete the damaged original
  * dentry, since we failed to detect the problem earlier.
  */
-static int check_suspicious_dirref(struct gfs2_sbd *sdp,
+static int check_suspicious_dirref(struct lgfs2_sbd *sdp,
 				   struct lgfs2_inum *entry)
 {
 	struct osi_node *tmp, *next = NULL;
@@ -723,7 +723,7 @@ static int check_dentry(struct lgfs2_inode *ip, struct gfs2_dirent *dent,
 			struct lgfs2_buffer_head *bh, char *filename,
 			uint32_t *count, int *lindex, void *priv)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	int q = 0;
 	char tmp_name[MAX_FILENAME];
 	struct lgfs2_inum entry;
@@ -1908,7 +1908,7 @@ static int build_quota_change(struct lgfs2_inode *per_node, unsigned int n)
 /* Check system directory inode                                           */
 /* Should work for all system directories: root, master, jindex, per_node */
 static int check_system_dir(struct lgfs2_inode *sysinode, const char *dirname,
-		     int builder(struct gfs2_sbd *sdp))
+		     int builder(struct lgfs2_sbd *sdp))
 {
 	uint64_t iblock = 0;
 	struct dir_status ds = {0};
@@ -2005,7 +2005,7 @@ static int check_system_dir(struct lgfs2_inode *sysinode, const char *dirname,
 /**
  * is_system_dir - determine if a given block is for a system directory.
  */
-static inline int is_system_dir(struct gfs2_sbd *sdp, uint64_t block)
+static inline int is_system_dir(struct lgfs2_sbd *sdp, uint64_t block)
 {
 	if (block == sdp->md.rooti->i_num.in_addr)
 		return 1;
@@ -2018,7 +2018,7 @@ static inline int is_system_dir(struct gfs2_sbd *sdp, uint64_t block)
 	return 0;
 }
 
-static int pass2_check_dir(struct gfs2_sbd *sdp, struct lgfs2_inode *ip)
+static int pass2_check_dir(struct lgfs2_sbd *sdp, struct lgfs2_inode *ip)
 {
 	uint64_t dirblk = ip->i_num.in_addr;
 	struct dir_status ds = {0};
@@ -2106,7 +2106,7 @@ static int pass2_check_dir(struct gfs2_sbd *sdp, struct lgfs2_inode *ip)
  * directory name length
  * entries in range
  */
-int pass2(struct gfs2_sbd *sdp)
+int pass2(struct lgfs2_sbd *sdp)
 {
 	struct osi_node *tmp, *next = NULL;
 	struct lgfs2_inode *ip;
diff --git a/gfs2/fsck/pass3.c b/gfs2/fsck/pass3.c
index a85c4975..4fa826e7 100644
--- a/gfs2/fsck/pass3.c
+++ b/gfs2/fsck/pass3.c
@@ -18,7 +18,7 @@
 #include "util.h"
 #include "afterpass1_common.h"
 
-static int attach_dotdot_to(struct gfs2_sbd *sdp, uint64_t newdotdot,
+static int attach_dotdot_to(struct lgfs2_sbd *sdp, uint64_t newdotdot,
 			    uint64_t olddotdot, uint64_t block)
 {
 	const char *filename = "..";
@@ -54,7 +54,7 @@ static int attach_dotdot_to(struct gfs2_sbd *sdp, uint64_t newdotdot,
 	return 0;
 }
 
-static struct dir_info *mark_and_return_parent(struct gfs2_sbd *sdp,
+static struct dir_info *mark_and_return_parent(struct lgfs2_sbd *sdp,
 					       struct dir_info *di)
 {
 	struct dir_info *pdi;
@@ -156,7 +156,7 @@ out:
  * handle disconnected directories
  * handle lost+found directory errors (missing, not a directory, no space)
  */
-int pass3(struct gfs2_sbd *sdp)
+int pass3(struct lgfs2_sbd *sdp)
 {
 	struct osi_node *tmp, *next = NULL;
 	struct dir_info *di, *tdi;
diff --git a/gfs2/fsck/pass4.c b/gfs2/fsck/pass4.c
index 6acd9a65..651c7752 100644
--- a/gfs2/fsck/pass4.c
+++ b/gfs2/fsck/pass4.c
@@ -49,7 +49,7 @@ static int fix_link_count(uint32_t counted_links, struct lgfs2_inode *ip)
  *
  * Returns: 1 if caller should do "continue", 0 if not.
  */
-static int handle_unlinked(struct gfs2_sbd *sdp, uint64_t no_addr,
+static int handle_unlinked(struct lgfs2_sbd *sdp, uint64_t no_addr,
 			   uint32_t *counted_links, int *lf_addition)
 {
 	struct lgfs2_inode *ip;
@@ -118,7 +118,7 @@ static int handle_unlinked(struct gfs2_sbd *sdp, uint64_t no_addr,
 	return 0;
 }
 
-static void handle_inconsist(struct gfs2_sbd *sdp, uint64_t no_addr,
+static void handle_inconsist(struct lgfs2_sbd *sdp, uint64_t no_addr,
 			     uint32_t *di_nlink, uint32_t counted_links)
 {
 	log_err(_("Link count inconsistent for inode %"PRIu64" (0x%"PRIx64") has %u but fsck found %u.\n"),
@@ -160,7 +160,7 @@ static int adjust_lf_links(int lf_addition)
 	return 0;
 }
 
-static int scan_inode_list(struct gfs2_sbd *sdp)
+static int scan_inode_list(struct lgfs2_sbd *sdp)
 {
 	struct osi_node *tmp, *next = NULL;
 	struct inode_info *ii;
@@ -195,7 +195,7 @@ static int scan_inode_list(struct gfs2_sbd *sdp)
 	return adjust_lf_links(lf_addition);
 }
 
-static int scan_dir_list(struct gfs2_sbd *sdp)
+static int scan_dir_list(struct lgfs2_sbd *sdp)
 {
 	struct osi_node *tmp, *next = NULL;
 	struct dir_info *di;
@@ -227,7 +227,7 @@ static int scan_dir_list(struct gfs2_sbd *sdp)
 	return adjust_lf_links(lf_addition);
 }
 
-static int scan_nlink1_list(struct gfs2_sbd *sdp)
+static int scan_nlink1_list(struct lgfs2_sbd *sdp)
 {
 	uint64_t blk;
 	uint32_t counted_links;
@@ -262,7 +262,7 @@ static int scan_nlink1_list(struct gfs2_sbd *sdp)
  * handle unreferenced inodes of other types
  * handle bad blocks
  */
-int pass4(struct gfs2_sbd *sdp)
+int pass4(struct lgfs2_sbd *sdp)
 {
 	if (lf_dip)
 		log_debug( _("At beginning of pass4, lost+found entries is %u\n"),
diff --git a/gfs2/fsck/pass5.c b/gfs2/fsck/pass5.c
index df8233a4..55ede8db 100644
--- a/gfs2/fsck/pass5.c
+++ b/gfs2/fsck/pass5.c
@@ -14,7 +14,7 @@
 
 #define GFS1_BLKST_USEDMETA 4
 
-static int check_block_status(struct gfs2_sbd *sdp,  struct gfs2_bmap *bl,
+static int check_block_status(struct lgfs2_sbd *sdp,  struct gfs2_bmap *bl,
 			      char *buffer, unsigned int buflen,
 			      uint64_t *rg_block, uint64_t rg_data,
 			      uint32_t *count)
@@ -113,7 +113,7 @@ static int check_block_status(struct gfs2_sbd *sdp,  struct gfs2_bmap *bl,
 	return 0;
 }
 
-static void update_rgrp(struct gfs2_sbd *sdp, struct rgrp_tree *rgp,
+static void update_rgrp(struct lgfs2_sbd *sdp, struct rgrp_tree *rgp,
 			struct gfs2_bmap *bl, uint32_t *count)
 {
 	uint32_t i;
@@ -194,7 +194,7 @@ static void update_rgrp(struct gfs2_sbd *sdp, struct rgrp_tree *rgp,
  * fix free block maps
  * fix used inode maps
  */
-int pass5(struct gfs2_sbd *sdp, struct gfs2_bmap *bl)
+int pass5(struct lgfs2_sbd *sdp, struct gfs2_bmap *bl)
 {
 	struct osi_node *n, *next = NULL;
 	struct rgrp_tree *rgp = NULL;
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index 5c9c5d78..5bfbb7da 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -47,7 +47,7 @@ static struct osi_root rgcalc;
  *       which isn't often the case. Normally the rindex needs to be read in
  *       first. If the rindex is damaged, that's not an option.
  */
-static void find_journaled_rgs(struct gfs2_sbd *sdp)
+static void find_journaled_rgs(struct lgfs2_sbd *sdp)
 {
 	int j, new = 0;
 	unsigned int jblocks;
@@ -97,7 +97,7 @@ static int is_false_rg(uint64_t block)
  * This function was revised to return the number of segments, usually 2.
  * The shortest distance is now returned in the highest entry in rg_dist
  */
-static int find_shortest_rgdist(struct gfs2_sbd *sdp, uint64_t *dist_array,
+static int find_shortest_rgdist(struct lgfs2_sbd *sdp, uint64_t *dist_array,
 				int *dist_cnt)
 {
 	uint64_t blk, block_last_rg, shortest_dist_btwn_rgs;
@@ -256,7 +256,7 @@ static int find_shortest_rgdist(struct gfs2_sbd *sdp, uint64_t *dist_array,
 /*
  * count_usedspace - count the used bits in a rgrp bitmap buffer
  */
-static uint64_t count_usedspace(struct gfs2_sbd *sdp, int first,
+static uint64_t count_usedspace(struct lgfs2_sbd *sdp, int first,
 				struct lgfs2_buffer_head *bh)
 {
 	int off, x, y, bytes_to_check;
@@ -307,7 +307,7 @@ static uint64_t count_usedspace(struct gfs2_sbd *sdp, int first,
  *
  * This function finds the distance to the next rgrp for these cases.
  */
-static uint64_t find_next_rgrp_dist(struct gfs2_sbd *sdp, uint64_t blk,
+static uint64_t find_next_rgrp_dist(struct lgfs2_sbd *sdp, uint64_t blk,
 				    struct rgrp_tree *prevrgd)
 {
 	struct osi_node *n, *next = NULL;
@@ -419,7 +419,7 @@ static uint64_t find_next_rgrp_dist(struct gfs2_sbd *sdp, uint64_t blk,
  * This function is only called if the rgrps are determined to be on uneven
  * boundaries, and also corrupt.  So we have to go out searching for one.
  */
-static uint64_t hunt_and_peck(struct gfs2_sbd *sdp, uint64_t blk,
+static uint64_t hunt_and_peck(struct lgfs2_sbd *sdp, uint64_t blk,
 			      struct rgrp_tree *prevrgd, uint64_t last_bump)
 {
 	uint64_t rgrp_dist = 0, block, twogigs, last_block, last_meg;
@@ -510,7 +510,7 @@ static uint64_t hunt_and_peck(struct gfs2_sbd *sdp, uint64_t blk,
  * from gfs1 to gfs2 after a gfs_grow operation.  In that case, the rgrps
  * will not be on predictable boundaries.
  */
-static int rindex_rebuild(struct gfs2_sbd *sdp, int *num_rgs, int gfs_grow)
+static int rindex_rebuild(struct lgfs2_sbd *sdp, int *num_rgs, int gfs_grow)
 {
 	struct osi_node *n, *next = NULL;
 	struct lgfs2_buffer_head *bh;
@@ -696,7 +696,7 @@ out:
  *
  * Returns: the number of RGs
  */
-static uint64_t how_many_rgrps(struct gfs2_sbd *sdp, struct device *dev)
+static uint64_t how_many_rgrps(struct lgfs2_sbd *sdp, struct device *dev)
 {
 	uint64_t nrgrp;
 	uint32_t rgblocks1, rgblocksn, bitblocks1, bitblocksn;
@@ -730,7 +730,7 @@ static uint64_t how_many_rgrps(struct gfs2_sbd *sdp, struct device *dev)
 /**
  * compute_rgrp_layout - figure out where the RG in a FS are
  */
-static struct osi_root compute_rgrp_layout(struct gfs2_sbd *sdp)
+static struct osi_root compute_rgrp_layout(struct lgfs2_sbd *sdp)
 {
 	struct device *dev;
 	struct rgrp_tree *rl, *rlast = NULL;
@@ -764,7 +764,7 @@ static struct osi_root compute_rgrp_layout(struct gfs2_sbd *sdp)
 	return rgtree;
 }
 
-static int calc_rgrps(struct gfs2_sbd *sdp)
+static int calc_rgrps(struct lgfs2_sbd *sdp)
 {
 	struct osi_node *n, *next = NULL;
 	struct rgrp_tree *rl;
@@ -804,7 +804,7 @@ static int calc_rgrps(struct gfs2_sbd *sdp)
  * Sets:    sdp->rglist to a linked list of fsck_rgrp structs representing
  *          what we think the rindex should really look like.
  */
-static int gfs2_rindex_calculate(struct gfs2_sbd *sdp, int *num_rgs)
+static int gfs2_rindex_calculate(struct lgfs2_sbd *sdp, int *num_rgs)
 {
 	uint64_t num_rgrps = 0;
 
@@ -845,7 +845,7 @@ static int gfs2_rindex_calculate(struct gfs2_sbd *sdp, int *num_rgs)
  * rewrite_rg_block - rewrite ("fix") a buffer with rg or bitmap data
  * returns: 0 if the rg was repaired, otherwise 1
  */
-static int rewrite_rg_block(struct gfs2_sbd *sdp, struct rgrp_tree *rg,
+static int rewrite_rg_block(struct lgfs2_sbd *sdp, struct rgrp_tree *rg,
 			    uint64_t errblock)
 {
 	int x = errblock - rg->rt_addr;
@@ -902,7 +902,7 @@ static int rewrite_rg_block(struct gfs2_sbd *sdp, struct rgrp_tree *rg,
  *                        values as our expected values and assume the
  *                        damage is only to the rgrps themselves.
  */
-static int expect_rindex_sanity(struct gfs2_sbd *sdp, int *num_rgs)
+static int expect_rindex_sanity(struct lgfs2_sbd *sdp, int *num_rgs)
 {
 	struct osi_node *n, *next = NULL;
 	struct rgrp_tree *rgd, *exp;
@@ -943,7 +943,7 @@ static int expect_rindex_sanity(struct gfs2_sbd *sdp, int *num_rgs)
  *             was converted from GFS via gfs2_convert, and its rgrps are
  *             not on nice boundaries thanks to previous gfs_grow ops. Lovely.
  */
-int rindex_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
+int rindex_repair(struct lgfs2_sbd *sdp, int trust_lvl, int *ok)
 {
 	struct osi_node *n, *next = NULL, *e, *enext;
 	int error, discrepancies, percent;
diff --git a/gfs2/fsck/util.c b/gfs2/fsck/util.c
index b4e25c8b..ba5f1f22 100644
--- a/gfs2/fsck/util.c
+++ b/gfs2/fsck/util.c
@@ -535,7 +535,7 @@ void dirtree_delete(struct dir_info *b)
 	free(b);
 }
 
-uint64_t find_free_blk(struct gfs2_sbd *sdp)
+uint64_t find_free_blk(struct lgfs2_sbd *sdp)
 {
 	struct osi_node *n, *next = NULL;
 	struct rgrp_tree *rl = NULL;
diff --git a/gfs2/fsck/util.h b/gfs2/fsck/util.h
index 4f3ce5a7..84e15e40 100644
--- a/gfs2/fsck/util.h
+++ b/gfs2/fsck/util.h
@@ -29,7 +29,7 @@ extern const char *reftypes[REF_TYPES + 1];
 
 struct fsck_pass {
 	const char *name;
-	int (*f)(struct gfs2_sbd *sdp);
+	int (*f)(struct lgfs2_sbd *sdp);
 };
 
 static inline int block_type(struct gfs2_bmap *bl, uint64_t bblock)
@@ -64,7 +64,7 @@ static inline void link1_destroy(struct gfs2_bmap *bmap)
 	bmap->mapsize = 0;
 }
 
-static inline int bitmap_type(struct gfs2_sbd *sdp, uint64_t bblock)
+static inline int bitmap_type(struct lgfs2_sbd *sdp, uint64_t bblock)
 {
 	struct rgrp_tree *rgd;
 
@@ -124,7 +124,7 @@ extern char generic_interrupt(const char *caller, const char *where,
                        const char *progress, const char *question,
                        const char *answers);
 extern char gfs2_getch(void);
-extern uint64_t find_free_blk(struct gfs2_sbd *sdp);
+extern uint64_t find_free_blk(struct lgfs2_sbd *sdp);
 extern __be64 *get_dir_hash(struct lgfs2_inode *ip);
 extern void delete_all_dups(struct lgfs2_inode *ip);
 extern void print_pass_duration(const char *name, struct timeval *start);
diff --git a/gfs2/glocktop/glocktop.c b/gfs2/glocktop/glocktop.c
index 369638a2..f0053853 100644
--- a/gfs2/glocktop/glocktop.c
+++ b/gfs2/glocktop/glocktop.c
@@ -156,7 +156,7 @@ struct mount_point {
 	char *device;
 	char *dir;
 	int fd;
-	struct gfs2_sbd sb;
+	struct lgfs2_sbd sb;
 };
 static struct mount_point *mounts;
 static char dlmwlines[MAX_LINES][96]; /* waiters lines */
@@ -222,7 +222,7 @@ static void UpdateSize(int sig)
 	signal(SIGWINCH, UpdateSize);
 }
 
-static int read_superblock(int fd, struct gfs2_sbd *sdp)
+static int read_superblock(int fd, struct lgfs2_sbd *sdp)
 {
 	ssize_t r;
 	char *buf;
@@ -617,7 +617,7 @@ static const char *show_inode(const char *id, int fd, uint64_t block)
 {
 	struct lgfs2_inode *ip;
 	const char *inode_type = NULL;
-	struct gfs2_sbd sbd = { .device_fd = fd, .sd_bsize = bsize };
+	struct lgfs2_sbd sbd = { .device_fd = fd, .sd_bsize = bsize };
 
 	ip = lgfs2_inode_read(&sbd, block);
 	if (S_ISDIR(ip->i_mode)) {
diff --git a/gfs2/libgfs2/buf.c b/gfs2/libgfs2/buf.c
index bd1ba6c1..cb5a3ea4 100644
--- a/gfs2/libgfs2/buf.c
+++ b/gfs2/libgfs2/buf.c
@@ -22,7 +22,7 @@
   #endif
 #endif
 
-struct lgfs2_buffer_head *lgfs2_bget(struct gfs2_sbd *sdp, uint64_t num)
+struct lgfs2_buffer_head *lgfs2_bget(struct lgfs2_sbd *sdp, uint64_t num)
 {
 	struct lgfs2_buffer_head *bh;
 
@@ -38,7 +38,7 @@ struct lgfs2_buffer_head *lgfs2_bget(struct gfs2_sbd *sdp, uint64_t num)
 	return bh;
 }
 
-int __lgfs2_breadm(struct gfs2_sbd *sdp, struct lgfs2_buffer_head **bhs, size_t n,
+int __lgfs2_breadm(struct lgfs2_sbd *sdp, struct lgfs2_buffer_head **bhs, size_t n,
                    uint64_t block, int line, const char *caller)
 {
 	size_t v = (n < IOV_MAX) ? n : IOV_MAX;
@@ -71,7 +71,7 @@ int __lgfs2_breadm(struct gfs2_sbd *sdp, struct lgfs2_buffer_head **bhs, size_t
 	return 0;
 }
 
-struct lgfs2_buffer_head *__lgfs2_bread(struct gfs2_sbd *sdp, uint64_t num, int line,
+struct lgfs2_buffer_head *__lgfs2_bread(struct lgfs2_sbd *sdp, uint64_t num, int line,
 				 const char *caller)
 {
 	struct lgfs2_buffer_head *bh;
@@ -93,7 +93,7 @@ struct lgfs2_buffer_head *__lgfs2_bread(struct gfs2_sbd *sdp, uint64_t num, int
 
 int lgfs2_bwrite(struct lgfs2_buffer_head *bh)
 {
-	struct gfs2_sbd *sdp = bh->sdp;
+	struct lgfs2_sbd *sdp = bh->sdp;
 
 	if (pwritev(sdp->device_fd, &bh->iov, 1, bh->b_blocknr * sdp->sd_bsize) != bh->iov.iov_len)
 		return -1;
diff --git a/gfs2/libgfs2/check_ondisk.c b/gfs2/libgfs2/check_ondisk.c
index 6c8dd065..940a6b0c 100644
--- a/gfs2/libgfs2/check_ondisk.c
+++ b/gfs2/libgfs2/check_ondisk.c
@@ -7,7 +7,7 @@ START_TEST(check_sb_in)
 {
 	char buf[sizeof(struct gfs2_sb)];
 	char namechk[GFS2_LOCKNAME_LEN];
-	struct gfs2_sbd sbd;
+	struct lgfs2_sbd sbd;
 	char uuidchk[sizeof(sbd.sd_uuid)];
 
 	memset(buf, 0x5a, sizeof(buf));
@@ -45,7 +45,7 @@ START_TEST(check_sb1_out)
 {
 	char namechk[GFS2_LOCKNAME_LEN];
 	char buf[sizeof(struct gfs_sb)];
-	struct gfs2_sbd sbd;
+	struct lgfs2_sbd sbd;
 	struct gfs_sb *sb;
 
 	memset(namechk, 0x5a, GFS2_LOCKNAME_LEN);
@@ -101,7 +101,7 @@ START_TEST(check_sb2_out)
 {
 	char buf[sizeof(struct gfs2_sb)];
 	char namechk[GFS2_LOCKNAME_LEN];
-	struct gfs2_sbd sbd;
+	struct lgfs2_sbd sbd;
 	struct gfs2_sb *sb;
 	char uuidchk[sizeof(sbd.sd_uuid)];
 
diff --git a/gfs2/libgfs2/check_rgrp.c b/gfs2/libgfs2/check_rgrp.c
index d2e7b4fb..1b3b1878 100644
--- a/gfs2/libgfs2/check_rgrp.c
+++ b/gfs2/libgfs2/check_rgrp.c
@@ -15,7 +15,7 @@ lgfs2_rgrps_t tc_rgrps;
 
 static void mockup_rgrps(void)
 {
-	struct gfs2_sbd *sdp;
+	struct lgfs2_sbd *sdp;
 	lgfs2_rgrps_t rgs;
 	uint64_t addr;
 	struct gfs2_rindex ri = {0};
@@ -132,7 +132,7 @@ END_TEST
 START_TEST(test_rgrps_write_final)
 {
 	lgfs2_rgrp_t rg = lgfs2_rgrp_last(tc_rgrps);
-	struct gfs2_sbd *sdp = tc_rgrps->sdp;
+	struct lgfs2_sbd *sdp = tc_rgrps->sdp;
 	struct gfs2_rindex ri;
 	struct gfs2_rgrp rgrp;
 	uint64_t addr;
diff --git a/gfs2/libgfs2/device_geometry.c b/gfs2/libgfs2/device_geometry.c
index 86ad84bd..c6c00c95 100644
--- a/gfs2/libgfs2/device_geometry.c
+++ b/gfs2/libgfs2/device_geometry.c
@@ -92,7 +92,7 @@ size_check:
  *
  */
 
-void lgfs2_fix_device_geometry(struct gfs2_sbd *sdp)
+void lgfs2_fix_device_geometry(struct lgfs2_sbd *sdp)
 {
 	struct device *device = &sdp->device;
 
diff --git a/gfs2/libgfs2/fs_bits.c b/gfs2/libgfs2/fs_bits.c
index db5e2772..b95732ef 100644
--- a/gfs2/libgfs2/fs_bits.c
+++ b/gfs2/libgfs2/fs_bits.c
@@ -105,7 +105,7 @@ unsigned long lgfs2_bitfit(const unsigned char *buf, const unsigned int len,
  *
  * Returns: 0 if ok, -1 if out of bounds
  */
-int lgfs2_check_range(struct gfs2_sbd *sdp, uint64_t blkno)
+int lgfs2_check_range(struct lgfs2_sbd *sdp, uint64_t blkno)
 {
 	if((blkno > sdp->fssize) || (blkno <= LGFS2_SB_ADDR(sdp)))
 		return -1;
@@ -174,7 +174,7 @@ int lgfs2_set_bitmap(lgfs2_rgrp_t rgd, uint64_t blkno, int state)
  *
  * Returns: state on success, -1 on error
  */
-int lgfs2_get_bitmap(struct gfs2_sbd *sdp, uint64_t blkno, struct rgrp_tree *rgd)
+int lgfs2_get_bitmap(struct lgfs2_sbd *sdp, uint64_t blkno, struct rgrp_tree *rgd)
 {
 	uint64_t offset;
 	uint32_t i = 0;
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index a0462f14..f485860a 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -30,7 +30,7 @@ static int inode_is_stuffed(const struct lgfs2_inode *ip)
 	return !ip->i_height;
 }
 
-struct lgfs2_inode *lgfs2_inode_get(struct gfs2_sbd *sdp, struct lgfs2_buffer_head *bh)
+struct lgfs2_inode *lgfs2_inode_get(struct lgfs2_sbd *sdp, struct lgfs2_buffer_head *bh)
 {
 	struct lgfs2_inode *ip;
 
@@ -44,7 +44,7 @@ struct lgfs2_inode *lgfs2_inode_get(struct gfs2_sbd *sdp, struct lgfs2_buffer_he
 	return ip;
 }
 
-struct lgfs2_inode *lgfs2_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr)
+struct lgfs2_inode *lgfs2_inode_read(struct lgfs2_sbd *sdp, uint64_t di_addr)
 {
 	struct lgfs2_inode *ip;
 	struct lgfs2_buffer_head *bh = lgfs2_bread(sdp, di_addr);
@@ -60,7 +60,7 @@ struct lgfs2_inode *lgfs2_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr)
 	return ip;
 }
 
-struct lgfs2_inode *lgfs2_is_system_inode(struct gfs2_sbd *sdp, uint64_t block)
+struct lgfs2_inode *lgfs2_is_system_inode(struct lgfs2_sbd *sdp, uint64_t block)
 {
 	int j;
 
@@ -91,7 +91,7 @@ void lgfs2_inode_put(struct lgfs2_inode **ip_in)
 {
 	struct lgfs2_inode *ip = *ip_in;
 	uint64_t block = ip->i_num.in_addr;
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 
 	if (ip->i_bh != NULL) {
 		if (ip->i_bh->b_modified) {
@@ -131,7 +131,7 @@ static uint64_t find_free_block(struct rgrp_tree *rgd)
 	return blkno;
 }
 
-static int blk_alloc_in_rg(struct gfs2_sbd *sdp, unsigned state, struct rgrp_tree *rgd, uint64_t blkno, int dinode)
+static int blk_alloc_in_rg(struct lgfs2_sbd *sdp, unsigned state, struct rgrp_tree *rgd, uint64_t blkno, int dinode)
 {
 	if (blkno == 0)
 		return -1;
@@ -161,7 +161,7 @@ static int blk_alloc_in_rg(struct gfs2_sbd *sdp, unsigned state, struct rgrp_tre
  * resource group with blksreq free blocks but only allocate the one block.
  * Returns 0 on success with the allocated block number in *blkno or non-zero otherwise.
  */
-static int block_alloc(struct gfs2_sbd *sdp, const uint64_t blksreq, int state, uint64_t *blkno, int dinode)
+static int block_alloc(struct lgfs2_sbd *sdp, const uint64_t blksreq, int state, uint64_t *blkno, int dinode)
 {
 	int ret;
 	int release = 0;
@@ -191,7 +191,7 @@ static int block_alloc(struct gfs2_sbd *sdp, const uint64_t blksreq, int state,
 	return ret;
 }
 
-int lgfs2_dinode_alloc(struct gfs2_sbd *sdp, const uint64_t blksreq, uint64_t *blkno)
+int lgfs2_dinode_alloc(struct lgfs2_sbd *sdp, const uint64_t blksreq, uint64_t *blkno)
 {
 	int ret = block_alloc(sdp, blksreq, GFS2_BLKST_DINODE, blkno, 1);
 	if (ret == 0)
@@ -211,7 +211,7 @@ int lgfs2_meta_alloc(struct lgfs2_inode *ip, uint64_t *blkno)
 	return ret;
 }
 
-static __inline__ void buffer_clear_tail(struct gfs2_sbd *sdp,
+static __inline__ void buffer_clear_tail(struct lgfs2_sbd *sdp,
 					 struct lgfs2_buffer_head *bh, int head)
 {
 	memset(bh->b_data + head, 0, sdp->sd_bsize - head);
@@ -219,7 +219,7 @@ static __inline__ void buffer_clear_tail(struct gfs2_sbd *sdp,
 }
 
 static __inline__ void
-buffer_copy_tail(struct gfs2_sbd *sdp,
+buffer_copy_tail(struct lgfs2_sbd *sdp,
 		 struct lgfs2_buffer_head *to_bh, int to_head,
 		 struct lgfs2_buffer_head *from_bh, int from_head)
 {
@@ -232,7 +232,7 @@ buffer_copy_tail(struct gfs2_sbd *sdp,
 
 void lgfs2_unstuff_dinode(struct lgfs2_inode *ip)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	struct lgfs2_buffer_head *bh;
 	uint64_t block = 0;
 	int isdir = S_ISDIR(ip->i_mode) || lgfs2_is_gfs_dir(ip);
@@ -278,7 +278,7 @@ void lgfs2_unstuff_dinode(struct lgfs2_inode *ip)
 /**
  * Calculate the total number of blocks required by a file containing 'bytes' bytes of data.
  */
-uint64_t lgfs2_space_for_data(const struct gfs2_sbd *sdp, const unsigned bsize, const uint64_t bytes)
+uint64_t lgfs2_space_for_data(const struct lgfs2_sbd *sdp, const unsigned bsize, const uint64_t bytes)
 {
 	uint64_t blks = (bytes + bsize - 1) / bsize;
 	uint64_t ptrs = blks;
@@ -309,7 +309,7 @@ uint64_t lgfs2_space_for_data(const struct gfs2_sbd *sdp, const unsigned bsize,
 int lgfs2_file_alloc(lgfs2_rgrp_t rg, uint64_t di_size, struct lgfs2_inode *ip, uint32_t flags, unsigned mode)
 {
 	unsigned extlen;
-	struct gfs2_sbd *sdp = rg->rgrps->sdp;
+	struct lgfs2_sbd *sdp = rg->rgrps->sdp;
 	struct lgfs2_rbm rbm = { .rgd = rg, .offset = 0, .bii = 0 };
 	uint32_t blocks = lgfs2_space_for_data(sdp, sdp->sd_bsize, di_size);
 
@@ -354,7 +354,7 @@ int lgfs2_file_alloc(lgfs2_rgrp_t rg, uint64_t di_size, struct lgfs2_inode *ip,
 
 unsigned int lgfs2_calc_tree_height(struct lgfs2_inode *ip, uint64_t size)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	uint64_t *arr;
 	unsigned int max, height;
 
@@ -378,7 +378,7 @@ unsigned int lgfs2_calc_tree_height(struct lgfs2_inode *ip, uint64_t size)
 
 void lgfs2_build_height(struct lgfs2_inode *ip, int height)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	struct lgfs2_buffer_head *bh;
 	uint64_t block = 0, *bp;
 	unsigned int x;
@@ -464,7 +464,7 @@ void lgfs2_lookup_block(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
 void lgfs2_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *new,
                      uint64_t *dblock, uint32_t *extlen, int prealloc)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	struct lgfs2_buffer_head *bh;
 	struct metapath mp;
 	int create = *new;
@@ -571,7 +571,7 @@ copy2mem(struct lgfs2_buffer_head *bh, void **buf, unsigned int offset,
 
 int lgfs2_readi(struct lgfs2_inode *ip, void *buf, uint64_t offset, unsigned int size)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	struct lgfs2_buffer_head *bh;
 	uint64_t lblock, dblock;
 	unsigned int o;
@@ -658,7 +658,7 @@ static void copy_from_mem(struct lgfs2_buffer_head *bh, void **buf,
 int __lgfs2_writei(struct lgfs2_inode *ip, void *buf,
 		  uint64_t offset, unsigned int size, int resize)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	struct lgfs2_buffer_head *bh;
 	uint64_t lblock, dblock;
 	unsigned int o;
@@ -1012,7 +1012,7 @@ void lgfs2_dir_split_leaf(struct lgfs2_inode *dip, uint32_t start, uint64_t leaf
 
 static void dir_double_exhash(struct lgfs2_inode *dip)
 {
-	struct gfs2_sbd *sdp = dip->i_sbd;
+	struct lgfs2_sbd *sdp = dip->i_sbd;
 	uint64_t *buf;
 	uint64_t *from, *to;
 	uint64_t block;
@@ -1232,7 +1232,7 @@ restart:
 
 static void dir_make_exhash(struct lgfs2_inode *dip)
 {
-	struct gfs2_sbd *sdp = dip->i_sbd;
+	struct lgfs2_sbd *sdp = dip->i_sbd;
 	struct gfs2_dirent *dent;
 	struct lgfs2_buffer_head *bh;
 	struct gfs2_leaf *leaf;
@@ -1332,7 +1332,7 @@ int lgfs2_dir_add(struct lgfs2_inode *dip, const char *filename, int len,
 	return err;
 }
 
-static int __init_dinode(struct gfs2_sbd *sdp, struct lgfs2_buffer_head **bhp, struct lgfs2_inum *inum,
+static int __init_dinode(struct lgfs2_sbd *sdp, struct lgfs2_buffer_head **bhp, struct lgfs2_inum *inum,
                          unsigned int mode, uint32_t flags, struct lgfs2_inum *parent, int gfs1)
 {
 	struct lgfs2_buffer_head *bh;
@@ -1410,7 +1410,7 @@ static int __init_dinode(struct gfs2_sbd *sdp, struct lgfs2_buffer_head **bhp, s
 	return 0;
 }
 
-int lgfs2_init_dinode(struct gfs2_sbd *sdp, struct lgfs2_buffer_head **bhp, struct lgfs2_inum *inum,
+int lgfs2_init_dinode(struct lgfs2_sbd *sdp, struct lgfs2_buffer_head **bhp, struct lgfs2_inum *inum,
                       unsigned int mode, uint32_t flags, struct lgfs2_inum *parent)
 {
 	return __init_dinode(sdp, bhp, inum, mode, flags, parent, 0);
@@ -1438,7 +1438,7 @@ int lgfs2_write_filemeta(struct lgfs2_inode *ip)
 {
 	unsigned height = 0;
 	struct metapath mp;
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	uint64_t dblocks = (ip->i_size + sdp->sd_bsize - 1) / sdp->sd_bsize;
 	uint64_t ptr0 = ip->i_num.in_addr + 1;
 	unsigned ptrs = 1;
@@ -1489,7 +1489,7 @@ static struct lgfs2_inode *__createi(struct lgfs2_inode *dip,
 				    const char *filename, unsigned int mode,
 				    uint32_t flags, int if_gfs1)
 {
-	struct gfs2_sbd *sdp = dip->i_sbd;
+	struct lgfs2_sbd *sdp = dip->i_sbd;
 	uint64_t bn;
 	struct lgfs2_inum inum;
 	struct lgfs2_buffer_head *bh = NULL;
@@ -1873,7 +1873,7 @@ int lgfs2_dirent_del(struct lgfs2_inode *dip, const char *filename, int len)
 int lgfs2_lookupi(struct lgfs2_inode *dip, const char *filename, int len,
                   struct lgfs2_inode **ipp)
 {
-	struct gfs2_sbd *sdp = dip->i_sbd;
+	struct lgfs2_sbd *sdp = dip->i_sbd;
 	int error = 0;
 	struct lgfs2_inum inum;
 
@@ -1895,7 +1895,7 @@ int lgfs2_lookupi(struct lgfs2_inode *dip, const char *filename, int len,
 /**
  * lgfs2_free_block - free up a block given its block number
  */
-void lgfs2_free_block(struct gfs2_sbd *sdp, uint64_t block)
+void lgfs2_free_block(struct lgfs2_sbd *sdp, uint64_t block)
 {
 	struct rgrp_tree *rgd;
 
@@ -1917,7 +1917,7 @@ void lgfs2_free_block(struct gfs2_sbd *sdp, uint64_t block)
  * lgfs2_freedi - unlink a disk inode by block number.
  * Note: currently only works for regular files.
  */
-int lgfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
+int lgfs2_freedi(struct lgfs2_sbd *sdp, uint64_t diblock)
 {
 	struct lgfs2_inode *ip;
 	struct lgfs2_buffer_head *bh, *nbh;
diff --git a/gfs2/libgfs2/gfs1.c b/gfs2/libgfs2/gfs1.c
index 440b8918..0079021b 100644
--- a/gfs2/libgfs2/gfs1.c
+++ b/gfs2/libgfs2/gfs1.c
@@ -70,7 +70,7 @@ void lgfs2_gfs1_lookup_block(struct lgfs2_inode *ip, struct lgfs2_buffer_head *b
 void lgfs2_gfs1_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *new,
 		    uint64_t *dblock, uint32_t *extlen, int prealloc)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	struct lgfs2_buffer_head *bh;
 	struct metapath mp;
 	int create = *new;
@@ -166,7 +166,7 @@ void lgfs2_gfs1_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *new,
 int lgfs2_gfs1_writei(struct lgfs2_inode *ip, void *buf, uint64_t offset,
 		unsigned int size)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	struct lgfs2_buffer_head *bh;
 	uint64_t lblock, dblock;
 	uint32_t extlen = 0;
@@ -245,7 +245,7 @@ int lgfs2_gfs1_writei(struct lgfs2_inode *ip, void *buf, uint64_t offset,
 	return copied;
 }
 
-static struct lgfs2_inode *__gfs_inode_get(struct gfs2_sbd *sdp, char *buf)
+static struct lgfs2_inode *__gfs_inode_get(struct lgfs2_sbd *sdp, char *buf)
 {
 	struct gfs_dinode *di;
 	struct lgfs2_inode *ip;
@@ -284,12 +284,12 @@ static struct lgfs2_inode *__gfs_inode_get(struct gfs2_sbd *sdp, char *buf)
 	return ip;
 }
 
-struct lgfs2_inode *lgfs2_gfs_inode_get(struct gfs2_sbd *sdp, char *buf)
+struct lgfs2_inode *lgfs2_gfs_inode_get(struct lgfs2_sbd *sdp, char *buf)
 {
 	return __gfs_inode_get(sdp, buf);
 }
 
-struct lgfs2_inode *lgfs2_gfs_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr)
+struct lgfs2_inode *lgfs2_gfs_inode_read(struct lgfs2_sbd *sdp, uint64_t di_addr)
 {
 	struct lgfs2_buffer_head *bh;
 	struct lgfs2_inode *ip;
diff --git a/gfs2/libgfs2/gfs2l.c b/gfs2/libgfs2/gfs2l.c
index b8c4ca41..3694a3d0 100644
--- a/gfs2/libgfs2/gfs2l.c
+++ b/gfs2/libgfs2/gfs2l.c
@@ -104,7 +104,7 @@ static int getopts(int argc, char *argv[], struct cmdopts *opts)
 	return 0;
 }
 
-static int openfs(const char *path, struct gfs2_sbd *sdp)
+static int openfs(const char *path, struct lgfs2_sbd *sdp)
 {
 	int fd;
 	int ret;
@@ -154,7 +154,7 @@ int main(int argc, char *argv[])
 {
 	int ret;
 	struct cmdopts opts = {NULL, NULL};
-	struct gfs2_sbd sbd;
+	struct lgfs2_sbd sbd;
 	struct lgfs2_lang_result *result;
 	struct lgfs2_lang_state *state;
 
diff --git a/gfs2/libgfs2/lang.c b/gfs2/libgfs2/lang.c
index 0c869d07..2ac59796 100644
--- a/gfs2/libgfs2/lang.c
+++ b/gfs2/libgfs2/lang.c
@@ -149,7 +149,7 @@ static void ast_string_unescape(char *str)
 	str[tail] = '\0';
 }
 
-static uint64_t ast_lookup_path(char *path, struct gfs2_sbd *sbd)
+static uint64_t ast_lookup_path(char *path, struct lgfs2_sbd *sbd)
 {
 	int err = 0;
 	char *c = NULL;
@@ -201,7 +201,7 @@ static const char *block_ids[] = {
 	[ID_END]	= NULL
 };
 
-static uint64_t ast_lookup_id(const char *id, struct gfs2_sbd *sbd)
+static uint64_t ast_lookup_id(const char *id, struct lgfs2_sbd *sbd)
 {
 	uint64_t bn = 0;
 	int i;
@@ -229,7 +229,7 @@ static uint64_t ast_lookup_id(const char *id, struct gfs2_sbd *sbd)
 	return bn;
 }
 
-static uint64_t ast_lookup_rgrp(uint64_t rgnum, struct gfs2_sbd *sbd)
+static uint64_t ast_lookup_rgrp(uint64_t rgnum, struct lgfs2_sbd *sbd)
 {
 	uint64_t i = rgnum;
 	struct osi_node *n;
@@ -242,7 +242,7 @@ static uint64_t ast_lookup_rgrp(uint64_t rgnum, struct gfs2_sbd *sbd)
 }
 
 static uint64_t ast_lookup_subscript(struct ast_node *id, struct ast_node *index,
-                                     struct gfs2_sbd *sbd)
+                                     struct lgfs2_sbd *sbd)
 {
 	uint64_t bn = 0;
 	const char *name = id->ast_str;
@@ -258,7 +258,7 @@ static uint64_t ast_lookup_subscript(struct ast_node *id, struct ast_node *index
  * Look up a block and return its number. The kind of lookup depends on the
  * type of the ast node.
  */
-static uint64_t ast_lookup_block_num(struct ast_node *ast, struct gfs2_sbd *sbd)
+static uint64_t ast_lookup_block_num(struct ast_node *ast, struct lgfs2_sbd *sbd)
 {
 	uint64_t bn = 0;
 	switch (ast->ast_type) {
@@ -285,7 +285,7 @@ static uint64_t ast_lookup_block_num(struct ast_node *ast, struct gfs2_sbd *sbd)
 	return bn;
 }
 
-static uint64_t ast_lookup_block(struct ast_node *node, struct gfs2_sbd *sbd)
+static uint64_t ast_lookup_block(struct ast_node *node, struct lgfs2_sbd *sbd)
 {
 	uint64_t bn = ast_lookup_block_num(node, sbd);
 	if (bn == 0) {
@@ -361,7 +361,7 @@ int lgfs2_lang_result_print(struct lgfs2_lang_result *result)
 	return 0;
 }
 
-static int ast_get_bitstate(uint64_t bn, struct gfs2_sbd *sbd)
+static int ast_get_bitstate(uint64_t bn, struct lgfs2_sbd *sbd)
 {
 	int ret = 0;
 	int state = 0;
@@ -424,7 +424,7 @@ static char *lang_read_block(int fd, unsigned bsize, uint64_t addr)
  * Interpret the get statement.
  */
 static struct lgfs2_lang_result *ast_interp_get(struct lgfs2_lang_state *state,
-                                     struct ast_node *ast, struct gfs2_sbd *sbd)
+                                     struct ast_node *ast, struct lgfs2_sbd *sbd)
 {
 	struct lgfs2_lang_result *result = calloc(1, sizeof(struct lgfs2_lang_result));
 	if (result == NULL) {
@@ -521,7 +521,7 @@ static int lang_write_result(int fd, unsigned bsize, struct lgfs2_lang_result *r
  * Interpret an assignment (set)
  */
 static struct lgfs2_lang_result *ast_interp_set(struct lgfs2_lang_state *state,
-                                    struct ast_node *ast, struct gfs2_sbd *sbd)
+                                    struct ast_node *ast, struct lgfs2_sbd *sbd)
 {
 	struct ast_node *lookup = ast->ast_right;
 	struct ast_node *fieldspec;
@@ -591,7 +591,7 @@ out_err:
 }
 
 static struct lgfs2_lang_result *ast_interpret_node(struct lgfs2_lang_state *state,
-                                        struct ast_node *ast, struct gfs2_sbd *sbd)
+                                        struct ast_node *ast, struct lgfs2_sbd *sbd)
 {
 	struct lgfs2_lang_result *result = NULL;
 
@@ -606,7 +606,7 @@ static struct lgfs2_lang_result *ast_interpret_node(struct lgfs2_lang_state *sta
 }
 
 struct lgfs2_lang_result *lgfs2_lang_result_next(struct lgfs2_lang_state *state,
-                                                           struct gfs2_sbd *sbd)
+                                                           struct lgfs2_sbd *sbd)
 {
 	struct lgfs2_lang_result *result;
 	if (state->ls_interp_curr == NULL) {
diff --git a/gfs2/libgfs2/lang.h b/gfs2/libgfs2/lang.h
index 211abd46..81d27445 100644
--- a/gfs2/libgfs2/lang.h
+++ b/gfs2/libgfs2/lang.h
@@ -22,7 +22,7 @@ struct lgfs2_lang_result {
 extern struct lgfs2_lang_state *lgfs2_lang_init(void);
 extern int lgfs2_lang_parsef(struct lgfs2_lang_state *state, FILE *script);
 extern int lgfs2_lang_parses(struct lgfs2_lang_state *state, const char *script);
-extern struct lgfs2_lang_result *lgfs2_lang_result_next(struct lgfs2_lang_state *state, struct gfs2_sbd *sbd);
+extern struct lgfs2_lang_result *lgfs2_lang_result_next(struct lgfs2_lang_state *state, struct lgfs2_sbd *sbd);
 extern int lgfs2_lang_result_print(struct lgfs2_lang_result *result);
 extern void lgfs2_lang_result_free(struct lgfs2_lang_result **result);
 extern void lgfs2_lang_free(struct lgfs2_lang_state **state);
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 273f07fd..98e8b8ce 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -169,7 +169,7 @@ struct gfs2_bitmap
 	unsigned bi_modified:1;
 };
 
-struct gfs2_sbd;
+struct lgfs2_sbd;
 struct lgfs2_inode;
 typedef struct _lgfs2_rgrps *lgfs2_rgrps_t;
 
@@ -213,7 +213,7 @@ struct rgrp_tree {
 
 typedef struct rgrp_tree *lgfs2_rgrp_t;
 
-extern lgfs2_rgrps_t lgfs2_rgrps_init(struct gfs2_sbd *sdp, uint64_t align, uint64_t offset);
+extern lgfs2_rgrps_t lgfs2_rgrps_init(struct lgfs2_sbd *sdp, uint64_t align, uint64_t offset);
 extern void lgfs2_rgrps_free(lgfs2_rgrps_t *rgs);
 extern uint64_t lgfs2_rindex_entry_new(lgfs2_rgrps_t rgs, struct gfs2_rindex *entry, uint64_t addr, uint32_t len);
 extern unsigned lgfs2_rindex_read_fd(int fd, lgfs2_rgrps_t rgs);
@@ -232,7 +232,7 @@ extern lgfs2_rgrp_t lgfs2_rgrp_last(lgfs2_rgrps_t rgs);
 extern lgfs2_rgrp_t lgfs2_rgrp_next(lgfs2_rgrp_t rg);
 extern lgfs2_rgrp_t lgfs2_rgrp_prev(lgfs2_rgrp_t rg);
 // Temporary function to aid API migration
-extern void lgfs2_attach_rgrps(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs);
+extern void lgfs2_attach_rgrps(struct lgfs2_sbd *sdp, lgfs2_rgrps_t rgs);
 
 struct lgfs2_buffer_head {
 	osi_list_t b_altlist; /* alternate list */
@@ -241,7 +241,7 @@ struct lgfs2_buffer_head {
 		char *b_data;
 		struct iovec iov;
 	};
-	struct gfs2_sbd *sdp;
+	struct lgfs2_sbd *sdp;
 	int b_modified;
 };
 
@@ -252,7 +252,7 @@ struct lgfs2_inum {
 
 struct lgfs2_inode {
 	struct lgfs2_buffer_head *i_bh;
-	struct gfs2_sbd *i_sbd;
+	struct lgfs2_sbd *i_sbd;
 	struct rgrp_tree *i_rgd; /* performance hint */
 	int bh_owned; /* Is this bh owned, iow, should we release it later? */
 
@@ -317,7 +317,7 @@ struct master_dir
 };
 
 #define LGFS2_SB_ADDR(sdp) (GFS2_SB_ADDR >> (sdp)->sd_fsb2bb_shift)
-struct gfs2_sbd {
+struct lgfs2_sbd {
 	/* CPU-endian counterparts to the on-disk superblock fields */
 	uint32_t sd_bsize;
 	uint32_t sd_fs_format;
@@ -458,10 +458,10 @@ extern int lgfs2_field_str(char *str, const size_t size, const char *blk, const
 extern int lgfs2_field_assign(char *blk, const struct lgfs2_metafield *field, const void *val);
 
 /* buf.c */
-extern struct lgfs2_buffer_head *lgfs2_bget(struct gfs2_sbd *sdp, uint64_t num);
-extern struct lgfs2_buffer_head *__lgfs2_bread(struct gfs2_sbd *sdp, uint64_t num,
+extern struct lgfs2_buffer_head *lgfs2_bget(struct lgfs2_sbd *sdp, uint64_t num);
+extern struct lgfs2_buffer_head *__lgfs2_bread(struct lgfs2_sbd *sdp, uint64_t num,
 					int line, const char *caller);
-extern int __lgfs2_breadm(struct gfs2_sbd *sdp, struct lgfs2_buffer_head **bhs, size_t n, uint64_t block, int line, const char *caller);
+extern int __lgfs2_breadm(struct lgfs2_sbd *sdp, struct lgfs2_buffer_head **bhs, size_t n, uint64_t block, int line, const char *caller);
 extern int lgfs2_bwrite(struct lgfs2_buffer_head *bh);
 extern int lgfs2_brelse(struct lgfs2_buffer_head *bh);
 extern uint32_t lgfs2_get_block_type(const char *buf);
@@ -473,7 +473,7 @@ extern uint32_t lgfs2_get_block_type(const char *buf);
 
 /* device_geometry.c */
 extern int lgfs2_get_dev_info(int fd, struct lgfs2_dev_info *i);
-extern void lgfs2_fix_device_geometry(struct gfs2_sbd *sdp);
+extern void lgfs2_fix_device_geometry(struct lgfs2_sbd *sdp);
 
 /* fs_bits.c */
 #define BFITNOENT (0xFFFFFFFF)
@@ -484,10 +484,10 @@ extern unsigned long lgfs2_bitfit(const unsigned char *buffer,
 				 unsigned long goal, unsigned char old_state);
 
 /* functions with blk #'s that are rgrp relative */
-extern int lgfs2_check_range(struct gfs2_sbd *sdp, uint64_t blkno);
+extern int lgfs2_check_range(struct lgfs2_sbd *sdp, uint64_t blkno);
 
 /* functions with blk #'s that are file system relative */
-extern int lgfs2_get_bitmap(struct gfs2_sbd *sdp, uint64_t blkno, struct rgrp_tree *rgd);
+extern int lgfs2_get_bitmap(struct lgfs2_sbd *sdp, uint64_t blkno, struct rgrp_tree *rgd);
 extern int lgfs2_set_bitmap(lgfs2_rgrp_t rg, uint64_t blkno, int state);
 
 /* fs_ops.c */
@@ -498,16 +498,16 @@ extern void lgfs2_find_metapath(struct lgfs2_inode *ip, uint64_t block, struct m
 extern void lgfs2_lookup_block(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
 			 unsigned int height, struct metapath *mp,
 			 int create, int *new, uint64_t *block);
-extern struct lgfs2_inode *lgfs2_inode_get(struct gfs2_sbd *sdp,
+extern struct lgfs2_inode *lgfs2_inode_get(struct lgfs2_sbd *sdp,
 				    struct lgfs2_buffer_head *bh);
-extern struct lgfs2_inode *lgfs2_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr);
-extern struct lgfs2_inode *lgfs2_is_system_inode(struct gfs2_sbd *sdp,
+extern struct lgfs2_inode *lgfs2_inode_read(struct lgfs2_sbd *sdp, uint64_t di_addr);
+extern struct lgfs2_inode *lgfs2_is_system_inode(struct lgfs2_sbd *sdp,
 					  uint64_t block);
 extern void lgfs2_inode_put(struct lgfs2_inode **ip);
 extern uint64_t lgfs2_data_alloc(struct lgfs2_inode *ip);
 extern int lgfs2_meta_alloc(struct lgfs2_inode *ip, uint64_t *blkno);
-extern int lgfs2_dinode_alloc(struct gfs2_sbd *sdp, const uint64_t blksreq, uint64_t *blkno);
-extern uint64_t lgfs2_space_for_data(const struct gfs2_sbd *sdp, unsigned bsize, uint64_t bytes);
+extern int lgfs2_dinode_alloc(struct lgfs2_sbd *sdp, const uint64_t blksreq, uint64_t *blkno);
+extern uint64_t lgfs2_space_for_data(const struct lgfs2_sbd *sdp, unsigned bsize, uint64_t bytes);
 extern int lgfs2_file_alloc(lgfs2_rgrp_t rg, uint64_t di_size, struct lgfs2_inode *ip, uint32_t flags, unsigned mode);
 
 extern int lgfs2_readi(struct lgfs2_inode *ip, void *buf, uint64_t offset,
@@ -516,7 +516,7 @@ extern int lgfs2_readi(struct lgfs2_inode *ip, void *buf, uint64_t offset,
 	__lgfs2_writei(ip, buf, offset, size, 1)
 extern int __lgfs2_writei(struct lgfs2_inode *ip, void *buf, uint64_t offset,
 			 unsigned int size, int resize);
-extern int lgfs2_init_dinode(struct gfs2_sbd *sdp, struct lgfs2_buffer_head **bhp, struct lgfs2_inum *inum,
+extern int lgfs2_init_dinode(struct lgfs2_sbd *sdp, struct lgfs2_buffer_head **bhp, struct lgfs2_inum *inum,
                        unsigned int mode, uint32_t flags, struct lgfs2_inum *parent);
 extern struct lgfs2_inode *lgfs2_createi(struct lgfs2_inode *dip, const char *filename,
 				  unsigned int mode, uint32_t flags);
@@ -537,8 +537,8 @@ extern void lgfs2_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *new,
 extern int lgfs2_get_leaf_ptr(struct lgfs2_inode *dip, uint32_t index, uint64_t *ptr) __attribute__((warn_unused_result));
 extern void lgfs2_dir_split_leaf(struct lgfs2_inode *dip, uint32_t start,
 			   uint64_t leaf_no, struct lgfs2_buffer_head *obh);
-extern void lgfs2_free_block(struct gfs2_sbd *sdp, uint64_t block);
-extern int lgfs2_freedi(struct gfs2_sbd *sdp, uint64_t block);
+extern void lgfs2_free_block(struct lgfs2_sbd *sdp, uint64_t block);
+extern int lgfs2_freedi(struct lgfs2_sbd *sdp, uint64_t block);
 extern int lgfs2_get_leaf(struct lgfs2_inode *dip, uint64_t leaf_no,
 			 struct lgfs2_buffer_head **bhp);
 extern int lgfs2_dirent_first(struct lgfs2_inode *dip,
@@ -716,15 +716,15 @@ extern void lgfs2_gfs1_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *n
 			   uint64_t *dblock, uint32_t *extlen, int prealloc);
 extern int lgfs2_gfs1_writei(struct lgfs2_inode *ip, void *buf, uint64_t offset,
 		       unsigned int size);
-extern struct lgfs2_inode *lgfs2_gfs_inode_get(struct gfs2_sbd *sdp, char *buf);
-extern struct lgfs2_inode *lgfs2_gfs_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr);
+extern struct lgfs2_inode *lgfs2_gfs_inode_get(struct lgfs2_sbd *sdp, char *buf);
+extern struct lgfs2_inode *lgfs2_gfs_inode_read(struct lgfs2_sbd *sdp, uint64_t di_addr);
 extern void lgfs2_gfs_rgrp_in(const lgfs2_rgrp_t rg, void *buf);
 extern void lgfs2_gfs_rgrp_out(const lgfs2_rgrp_t rg, void *buf);
 
 /* misc.c */
 extern int lgfs2_compute_heightsize(unsigned bsize, uint64_t *heightsize,
 		uint32_t *maxheight, uint32_t bsize1, int diptrs, int inptrs);
-extern int lgfs2_compute_constants(struct gfs2_sbd *sdp);
+extern int lgfs2_compute_constants(struct lgfs2_sbd *sdp);
 extern int lgfs2_open_mnt(const char *path, int dirflags, int *dirfd, int devflags, int *devfd, struct mntent **mnt);
 extern int lgfs2_open_mnt_dev(const char *path, int flags, struct mntent **mnt);
 extern int lgfs2_open_mnt_dir(const char *path, int flags, struct mntent **mnt);
@@ -742,30 +742,30 @@ extern int lgfs2_clean_journal(struct lgfs2_inode *ip, struct lgfs2_log_header *
 extern uint32_t lgfs2_rgblocks2bitblocks(const unsigned int bsize, const uint32_t rgblocks,
                                     uint32_t *ri_data) __attribute__((nonnull(3)));
 extern int lgfs2_compute_bitstructs(const uint32_t bsize, struct rgrp_tree *rgd);
-extern struct rgrp_tree *lgfs2_blk2rgrpd(struct gfs2_sbd *sdp, uint64_t blk);
+extern struct rgrp_tree *lgfs2_blk2rgrpd(struct lgfs2_sbd *sdp, uint64_t blk);
 extern int lgfs2_rgrp_crc_check(char *buf);
 extern void lgfs2_rgrp_crc_set(char *buf);
-extern uint64_t lgfs2_rgrp_read(struct gfs2_sbd *sdp, struct rgrp_tree *rgd);
-extern void lgfs2_rgrp_relse(struct gfs2_sbd *sdp, struct rgrp_tree *rgd);
+extern uint64_t lgfs2_rgrp_read(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd);
+extern void lgfs2_rgrp_relse(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd);
 extern struct rgrp_tree *lgfs2_rgrp_insert(struct osi_root *rgtree,
 				     uint64_t rgblock);
-extern void lgfs2_rgrp_free(struct gfs2_sbd *sdp, struct osi_root *rgrp_tree);
+extern void lgfs2_rgrp_free(struct lgfs2_sbd *sdp, struct osi_root *rgrp_tree);
 
 /* structures.c */
-extern int lgfs2_build_master(struct gfs2_sbd *sdp);
-extern int lgfs2_sb_write(const struct gfs2_sbd *sdp, int fd);
-extern int lgfs2_build_journal(struct gfs2_sbd *sdp, int j, struct lgfs2_inode *jindex);
+extern int lgfs2_build_master(struct lgfs2_sbd *sdp);
+extern int lgfs2_sb_write(const struct lgfs2_sbd *sdp, int fd);
+extern int lgfs2_build_journal(struct lgfs2_sbd *sdp, int j, struct lgfs2_inode *jindex);
 extern int lgfs2_write_journal(struct lgfs2_inode *jnl, unsigned bsize, unsigned blocks);
 extern int lgfs2_write_journal_data(struct lgfs2_inode *ip);
 extern int lgfs2_write_filemeta(struct lgfs2_inode *ip);
 extern struct lgfs2_inode *lgfs2_build_jindex(struct lgfs2_inode *metafs, struct lgfs2_inum *jnls, size_t nmemb);
-extern struct lgfs2_inode *lgfs2_build_inum(struct gfs2_sbd *sdp);
-extern struct lgfs2_inode *lgfs2_build_statfs(struct gfs2_sbd *sdp);
-extern struct lgfs2_inode *lgfs2_build_rindex(struct gfs2_sbd *sdp);
-extern struct lgfs2_inode *lgfs2_build_quota(struct gfs2_sbd *sdp);
-extern int lgfs2_build_root(struct gfs2_sbd *sdp);
-extern int lgfs2_init_inum(struct gfs2_sbd *sdp);
-extern int lgfs2_init_statfs(struct gfs2_sbd *sdp, struct gfs2_statfs_change *res);
+extern struct lgfs2_inode *lgfs2_build_inum(struct lgfs2_sbd *sdp);
+extern struct lgfs2_inode *lgfs2_build_statfs(struct lgfs2_sbd *sdp);
+extern struct lgfs2_inode *lgfs2_build_rindex(struct lgfs2_sbd *sdp);
+extern struct lgfs2_inode *lgfs2_build_quota(struct lgfs2_sbd *sdp);
+extern int lgfs2_build_root(struct lgfs2_sbd *sdp);
+extern int lgfs2_init_inum(struct lgfs2_sbd *sdp);
+extern int lgfs2_init_statfs(struct lgfs2_sbd *sdp, struct gfs2_statfs_change *res);
 extern int lgfs2_check_meta(const char *buf, int type);
 extern unsigned lgfs2_bm_scan(struct rgrp_tree *rgd, unsigned idx,
 			      uint64_t *buf, uint8_t state);
@@ -775,9 +775,9 @@ extern struct lgfs2_inode *lgfs2_build_quota_change(struct lgfs2_inode *per_node
 
 /* super.c */
 extern int lgfs2_check_sb(void *sbp);
-extern int lgfs2_read_sb(struct gfs2_sbd *sdp);
-extern int lgfs2_rindex_read(struct gfs2_sbd *sdp, uint64_t *rgcount, int *ok);
-extern int lgfs2_write_sb(struct gfs2_sbd *sdp);
+extern int lgfs2_read_sb(struct lgfs2_sbd *sdp);
+extern int lgfs2_rindex_read(struct lgfs2_sbd *sdp, uint64_t *rgcount, int *ok);
+extern int lgfs2_write_sb(struct lgfs2_sbd *sdp);
 
 /* gfs2_disk_hash.c */
 extern uint32_t lgfs2_disk_hash(const char *data, int len);
@@ -785,8 +785,8 @@ extern uint32_t lgfs2_disk_hash(const char *data, int len);
 /* ondisk.c */
 extern void lgfs2_inum_in(struct lgfs2_inum *i, void *inp);
 extern void lgfs2_inum_out(const struct lgfs2_inum *i, void *inp);
-extern void lgfs2_sb_in(struct gfs2_sbd *sdp, void *buf);
-extern void lgfs2_sb_out(const struct gfs2_sbd *sdp, void *buf);
+extern void lgfs2_sb_in(struct lgfs2_sbd *sdp, void *buf);
+extern void lgfs2_sb_out(const struct lgfs2_sbd *sdp, void *buf);
 extern void lgfs2_rindex_in(lgfs2_rgrp_t rg, void *buf);
 extern void lgfs2_rindex_out(const lgfs2_rgrp_t rg, void *buf);
 extern void lgfs2_rgrp_in(lgfs2_rgrp_t rg, void *buf);
diff --git a/gfs2/libgfs2/misc.c b/gfs2/libgfs2/misc.c
index 6092fa5c..80f098ab 100644
--- a/gfs2/libgfs2/misc.c
+++ b/gfs2/libgfs2/misc.c
@@ -36,7 +36,7 @@ int lgfs2_compute_heightsize(unsigned bsize, uint64_t *heightsize,
 	return 0;
 }
 
-int lgfs2_compute_constants(struct gfs2_sbd *sdp)
+int lgfs2_compute_constants(struct lgfs2_sbd *sdp)
 {
 	sdp->md.next_inum = 1;
 
diff --git a/gfs2/libgfs2/ondisk.c b/gfs2/libgfs2/ondisk.c
index 9d06443c..b6e6a867 100644
--- a/gfs2/libgfs2/ondisk.c
+++ b/gfs2/libgfs2/ondisk.c
@@ -25,7 +25,7 @@ void lgfs2_inum_out(const struct lgfs2_inum *i, void *inp)
 	in->no_addr = cpu_to_be64(i->in_addr);
 }
 
-void lgfs2_sb_in(struct gfs2_sbd *sdp, void *buf)
+void lgfs2_sb_in(struct lgfs2_sbd *sdp, void *buf)
 {
 	struct gfs2_sb *sb = buf;
 	struct gfs_sb *sb1 = buf;
@@ -46,7 +46,7 @@ void lgfs2_sb_in(struct gfs2_sbd *sdp, void *buf)
 	memcpy(sdp->sd_uuid, sb->sb_uuid, sizeof(sdp->sd_uuid));
 }
 
-void lgfs2_sb_out(const struct gfs2_sbd *sdp, void *buf)
+void lgfs2_sb_out(const struct lgfs2_sbd *sdp, void *buf)
 {
 	struct gfs2_sb *sb = buf;
 	struct gfs_sb *sb1 = buf;
diff --git a/gfs2/libgfs2/rgrp.c b/gfs2/libgfs2/rgrp.c
index e3f2e268..9ca92172 100644
--- a/gfs2/libgfs2/rgrp.c
+++ b/gfs2/libgfs2/rgrp.c
@@ -86,7 +86,7 @@ errbits:
  *
  * Returns: Ths resource group, or NULL if not found
  */
-struct rgrp_tree *lgfs2_blk2rgrpd(struct gfs2_sbd *sdp, uint64_t blk)
+struct rgrp_tree *lgfs2_blk2rgrpd(struct lgfs2_sbd *sdp, uint64_t blk)
 {
 	struct rgrp_tree *rgd = (struct rgrp_tree *)sdp->rgtree.osi_node;
 	while (rgd) {
@@ -108,7 +108,7 @@ struct rgrp_tree *lgfs2_blk2rgrpd(struct gfs2_sbd *sdp, uint64_t blk)
  */
 int lgfs2_rgrp_bitbuf_alloc(lgfs2_rgrp_t rg)
 {
-	struct gfs2_sbd *sdp = rg->rgrps->sdp;
+	struct lgfs2_sbd *sdp = rg->rgrps->sdp;
 	size_t len = rg->rt_length * sdp->sd_bsize;
 	unsigned long io_align = sdp->sd_bsize;
 	unsigned i;
@@ -187,7 +187,7 @@ void lgfs2_rgrp_crc_set(char *buf)
  * @rgd - resource group structure
  * returns: 0 if no error, otherwise the block number that failed
  */
-uint64_t lgfs2_rgrp_read(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
+uint64_t lgfs2_rgrp_read(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd)
 {
 	unsigned length = rgd->rt_length * sdp->sd_bsize;
 	off_t offset = rgd->rt_addr * sdp->sd_bsize;
@@ -227,7 +227,7 @@ uint64_t lgfs2_rgrp_read(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
 	return 0;
 }
 
-void lgfs2_rgrp_relse(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
+void lgfs2_rgrp_relse(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd)
 {
 	if (rgd->bits == NULL)
 		return;
@@ -279,7 +279,7 @@ struct rgrp_tree *lgfs2_rgrp_insert(struct osi_root *rgtree, uint64_t rgblock)
 	return data;
 }
 
-void lgfs2_rgrp_free(struct gfs2_sbd *sdp, struct osi_root *rgrp_tree)
+void lgfs2_rgrp_free(struct lgfs2_sbd *sdp, struct osi_root *rgrp_tree)
 {
 	struct rgrp_tree *rgd;
 	struct osi_node *n;
@@ -404,7 +404,7 @@ uint32_t lgfs2_rgrps_plan(const lgfs2_rgrps_t rgs, uint64_t space, uint32_t tgts
  * offset: The required stripe offset of the resource groups
  * Returns an initialised lgfs2_rgrps_t or NULL if unsuccessful with errno set
  */
-lgfs2_rgrps_t lgfs2_rgrps_init(struct gfs2_sbd *sdp, uint64_t align, uint64_t offset)
+lgfs2_rgrps_t lgfs2_rgrps_init(struct lgfs2_sbd *sdp, uint64_t align, uint64_t offset)
 {
 	lgfs2_rgrps_t rgs;
 
@@ -606,7 +606,7 @@ unsigned lgfs2_rgsize_for_data(uint64_t blksreq, unsigned bsize)
 }
 
 // Temporary function to aid in API migration
-void lgfs2_attach_rgrps(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs)
+void lgfs2_attach_rgrps(struct lgfs2_sbd *sdp, lgfs2_rgrps_t rgs)
 {
 	sdp->rgtree.osi_node = rgs->root.osi_node;
 }
@@ -665,7 +665,7 @@ lgfs2_rgrp_t lgfs2_rgrps_append(lgfs2_rgrps_t rgs, struct gfs2_rindex *entry, ui
  */
 int lgfs2_rgrp_write(int fd, const lgfs2_rgrp_t rg)
 {
-	struct gfs2_sbd *sdp = rg->rgrps->sdp;
+	struct lgfs2_sbd *sdp = rg->rgrps->sdp;
 	unsigned int i;
 	int freebufs = 0;
 	ssize_t ret;
@@ -749,7 +749,7 @@ lgfs2_rgrp_t lgfs2_rgrp_last(lgfs2_rgrps_t rgs)
 int lgfs2_rbm_from_block(struct lgfs2_rbm *rbm, uint64_t block)
 {
 	uint64_t rblock = block - rbm->rgd->rt_data0;
-	struct gfs2_sbd *sdp = rbm->rgd->rgrps->sdp;
+	struct lgfs2_sbd *sdp = rbm->rgd->rgrps->sdp;
 
 	if (rblock > UINT_MAX) {
 		errno = EINVAL;
@@ -880,7 +880,7 @@ static uint32_t lgfs2_free_extlen(const struct lgfs2_rbm *rrbm, uint32_t len)
 	uint8_t *ptr, *start, *end;
 	uint64_t block;
 	struct gfs2_bitmap *bi;
-	struct gfs2_sbd *sdp = rbm.rgd->rgrps->sdp;
+	struct lgfs2_sbd *sdp = rbm.rgd->rgrps->sdp;
 
 	if (n_unaligned &&
 	    lgfs2_unaligned_extlen(&rbm, 4 - n_unaligned, &len))
diff --git a/gfs2/libgfs2/rgrp.h b/gfs2/libgfs2/rgrp.h
index 386ade3d..423eaefc 100644
--- a/gfs2/libgfs2/rgrp.h
+++ b/gfs2/libgfs2/rgrp.h
@@ -23,7 +23,7 @@ struct rgs_plan {
 struct _lgfs2_rgrps {
 	struct osi_root root;
 	struct rgs_plan *plan;
-	struct gfs2_sbd *sdp;
+	struct lgfs2_sbd *sdp;
 	unsigned long align;
 	unsigned long align_off;
 };
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index f738259a..011fe8ac 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -16,7 +16,7 @@
 #include "libgfs2.h"
 #include "crc32c.h"
 
-int lgfs2_build_master(struct gfs2_sbd *sdp)
+int lgfs2_build_master(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inum inum;
 	uint64_t bn;
@@ -41,7 +41,7 @@ int lgfs2_build_master(struct gfs2_sbd *sdp)
 	return 0;
 }
 
-int lgfs2_sb_write(const struct gfs2_sbd *sdp, int fd)
+int lgfs2_sb_write(const struct lgfs2_sbd *sdp, int fd)
 {
 	int i, err = -1;
 	struct iovec *iov;
@@ -103,7 +103,7 @@ uint32_t lgfs2_log_header_crc(char *buf, unsigned bsize)
  */
 int lgfs2_write_journal_data(struct lgfs2_inode *ip)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	unsigned blocks = (ip->i_size + sdp->sd_bsize - 1) / sdp->sd_bsize;
 	uint64_t jext0 = ip->i_num.in_addr + ip->i_blocks - blocks;
 	uint64_t seq = ((blocks) * (random() / (RAND_MAX + 1.0)));
@@ -153,7 +153,7 @@ int lgfs2_write_journal_data(struct lgfs2_inode *ip)
 
 static struct lgfs2_buffer_head *lgfs2_get_file_buf(struct lgfs2_inode *ip, uint64_t lbn, int prealloc)
 {
-	struct gfs2_sbd *sdp = ip->i_sbd;
+	struct lgfs2_sbd *sdp = ip->i_sbd;
 	uint64_t dbn;
 	int new = 1;
 
@@ -227,7 +227,7 @@ int lgfs2_write_journal(struct lgfs2_inode *jnl, unsigned bsize, unsigned int bl
 	return 0;
 }
 
-int lgfs2_build_journal(struct gfs2_sbd *sdp, int j, struct lgfs2_inode *jindex)
+int lgfs2_build_journal(struct lgfs2_sbd *sdp, int j, struct lgfs2_inode *jindex)
 {
 	char name[256];
 	int ret;
@@ -314,7 +314,7 @@ struct lgfs2_inode *lgfs2_build_statfs_change(struct lgfs2_inode *per_node, unsi
 
 struct lgfs2_inode *lgfs2_build_quota_change(struct lgfs2_inode *per_node, unsigned int j)
 {
-	struct gfs2_sbd *sdp = per_node->i_sbd;
+	struct lgfs2_sbd *sdp = per_node->i_sbd;
 	struct gfs2_meta_header mh;
 	char name[256];
 	struct lgfs2_inode *ip;
@@ -349,7 +349,7 @@ struct lgfs2_inode *lgfs2_build_quota_change(struct lgfs2_inode *per_node, unsig
 	return ip;
 }
 
-struct lgfs2_inode *lgfs2_build_inum(struct gfs2_sbd *sdp)
+struct lgfs2_inode *lgfs2_build_inum(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *ip;
 
@@ -358,7 +358,7 @@ struct lgfs2_inode *lgfs2_build_inum(struct gfs2_sbd *sdp)
 	return ip;
 }
 
-struct lgfs2_inode *lgfs2_build_statfs(struct gfs2_sbd *sdp)
+struct lgfs2_inode *lgfs2_build_statfs(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *ip;
 
@@ -367,7 +367,7 @@ struct lgfs2_inode *lgfs2_build_statfs(struct gfs2_sbd *sdp)
 	return ip;
 }
 
-struct lgfs2_inode *lgfs2_build_rindex(struct gfs2_sbd *sdp)
+struct lgfs2_inode *lgfs2_build_rindex(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *ip;
 	struct osi_node *n, *next = NULL;
@@ -401,7 +401,7 @@ struct lgfs2_inode *lgfs2_build_rindex(struct gfs2_sbd *sdp)
 	return ip;
 }
 
-struct lgfs2_inode *lgfs2_build_quota(struct gfs2_sbd *sdp)
+struct lgfs2_inode *lgfs2_build_quota(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *ip;
 	struct gfs2_quota qu;
@@ -428,7 +428,7 @@ struct lgfs2_inode *lgfs2_build_quota(struct gfs2_sbd *sdp)
 	return ip;
 }
 
-int lgfs2_build_root(struct gfs2_sbd *sdp)
+int lgfs2_build_root(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inum inum;
 	uint64_t bn;
@@ -453,7 +453,7 @@ int lgfs2_build_root(struct gfs2_sbd *sdp)
 	return 0;
 }
 
-int lgfs2_init_inum(struct gfs2_sbd *sdp)
+int lgfs2_init_inum(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *ip = sdp->md.inum;
 	__be64 buf;
@@ -467,7 +467,7 @@ int lgfs2_init_inum(struct gfs2_sbd *sdp)
 	return 0;
 }
 
-int lgfs2_init_statfs(struct gfs2_sbd *sdp, struct gfs2_statfs_change *res)
+int lgfs2_init_statfs(struct lgfs2_sbd *sdp, struct gfs2_statfs_change *res)
 {
 	struct lgfs2_inode *ip = sdp->md.statfs;
 	struct gfs2_statfs_change sc;
diff --git a/gfs2/libgfs2/super.c b/gfs2/libgfs2/super.c
index 3535a0c7..6af366f7 100644
--- a/gfs2/libgfs2/super.c
+++ b/gfs2/libgfs2/super.c
@@ -58,7 +58,7 @@ int lgfs2_check_sb(void *sbp)
  * Returns: 0 on success, -1 on failure
  * sdp->gfs1 will be set if this is gfs (gfs1)
  */
-int lgfs2_read_sb(struct gfs2_sbd *sdp)
+int lgfs2_read_sb(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_buffer_head *bh;
 	uint64_t space = 0;
@@ -146,7 +146,7 @@ int lgfs2_read_sb(struct gfs2_sbd *sdp)
  *
  * Returns: 1 if the rgd seems relatively sane
  */
-static int rgd_seems_ok(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
+static int rgd_seems_ok(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd)
 {
 	uint32_t most_bitmaps_possible;
 
@@ -179,7 +179,7 @@ static int rgd_seems_ok(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
  * If not, we count it as not sane, and therefore, the whole rindex is not to
  * be trusted by fsck.gfs2.
  */
-static int good_on_disk(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
+static int good_on_disk(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd)
 {
 	struct lgfs2_buffer_head *bh;
 	int is_rgrp;
@@ -198,7 +198,7 @@ static int good_on_disk(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
  *
  * Returns: 0 on success, -1 on failure
  */
-int lgfs2_rindex_read(struct gfs2_sbd *sdp, uint64_t *rgcount, int *ok)
+int lgfs2_rindex_read(struct lgfs2_sbd *sdp, uint64_t *rgcount, int *ok)
 {
 	unsigned int rg;
 	int error;
diff --git a/gfs2/mkfs/main_grow.c b/gfs2/mkfs/main_grow.c
index b2959285..f3c6d0ba 100644
--- a/gfs2/mkfs/main_grow.c
+++ b/gfs2/mkfs/main_grow.c
@@ -33,8 +33,8 @@ static int test = 0;
 static uint64_t fssize = 0, fsgrowth;
 int print_level = MSG_NOTICE;
 
-extern int create_new_inode(struct gfs2_sbd *sdp);
-extern int rename2system(struct gfs2_sbd *sdp, char *new_dir, char *new_name);
+extern int create_new_inode(struct lgfs2_sbd *sdp);
+extern int rename2system(struct lgfs2_sbd *sdp, char *new_dir, char *new_name);
 
 #ifndef FALLOC_FL_KEEP_SIZE
 #define FALLOC_FL_KEEP_SIZE 0x01
@@ -88,7 +88,7 @@ static void usage(void)
 	}
 }
 
-static void decode_arguments(int argc, char *argv[], struct gfs2_sbd *sdp)
+static void decode_arguments(int argc, char *argv[], struct lgfs2_sbd *sdp)
 {
 	int opt;
 
@@ -135,7 +135,7 @@ static void decode_arguments(int argc, char *argv[], struct gfs2_sbd *sdp)
 	}
 }
 
-static lgfs2_rgrps_t rgrps_init(struct gfs2_sbd *sdp)
+static lgfs2_rgrps_t rgrps_init(struct lgfs2_sbd *sdp)
 {
 	int ret;
 	int error;
@@ -203,7 +203,7 @@ static uint64_t filesystem_size(lgfs2_rgrps_t rgs)
 /**
  * Write the new rg information to disk.
  */
-static unsigned initialize_new_portion(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs)
+static unsigned initialize_new_portion(struct lgfs2_sbd *sdp, lgfs2_rgrps_t rgs)
 {
 	unsigned rgcount = 0;
 	uint64_t rgaddr = fssize;
@@ -322,7 +322,7 @@ trunc:
 /**
  * print_info - Print out various bits of (interesting?) information
  */
-static void print_info(struct gfs2_sbd *sdp, char *device, char *mnt_path)
+static void print_info(struct lgfs2_sbd *sdp, char *device, char *mnt_path)
 {
 	log_notice(_("Mount point: %s\n"), mnt_path);
 	log_notice(_("Device: %s\n"), device);
@@ -353,7 +353,7 @@ static int open_rindex(char *metafs_path, int mode)
 #ifndef UNITTESTS
 int main(int argc, char *argv[])
 {
-	struct gfs2_sbd sbd, *sdp = &sbd;
+	struct lgfs2_sbd sbd, *sdp = &sbd;
 	int rindex_fd;
 	int error = EXIT_SUCCESS;
 	int devflags = (test ? O_RDONLY : O_RDWR) | O_CLOEXEC;
@@ -362,7 +362,7 @@ int main(int argc, char *argv[])
 	textdomain("gfs2-utils");
 	srandom(time(NULL) ^ getpid());
 
-	memset(sdp, 0, sizeof(struct gfs2_sbd));
+	memset(sdp, 0, sizeof(struct lgfs2_sbd));
 	sdp->sd_bsize = GFS2_DEFAULT_BSIZE;
 	sdp->rgsize = -1;
 	sdp->jsize = GFS2_DEFAULT_JSIZE;
diff --git a/gfs2/mkfs/main_jadd.c b/gfs2/mkfs/main_jadd.c
index e11b63f6..90a216bb 100644
--- a/gfs2/mkfs/main_jadd.c
+++ b/gfs2/mkfs/main_jadd.c
@@ -139,12 +139,12 @@ static void print_usage(const char *prog_name)
 }
 
 /**
- * Decode command line arguments and fill in the struct gfs2_sbd
+ * Decode command line arguments and fill in the struct lgfs2_sbd
  * @argc:
  * @argv:
  * @sdp: the decoded command line arguments
  */
-static int decode_arguments(int argc, char *argv[], struct gfs2_sbd *sdp, struct jadd_opts *opts)
+static int decode_arguments(int argc, char *argv[], struct lgfs2_sbd *sdp, struct jadd_opts *opts)
 {
 	int cont = 1;
 	int optchar;
@@ -211,7 +211,7 @@ static int decode_arguments(int argc, char *argv[], struct gfs2_sbd *sdp, struct
 	return 0;
 }
 
-static int verify_arguments(struct gfs2_sbd *sdp, struct jadd_opts *opts)
+static int verify_arguments(struct lgfs2_sbd *sdp, struct jadd_opts *opts)
 {
 	if (!opts->journals) {
 		fprintf(stderr, _("no journals specified\n"));
@@ -345,7 +345,7 @@ close_fd:
 	return close(fd) || error;
 }
 
-static int add_qc(struct gfs2_sbd *sdp, struct jadd_opts *opts)
+static int add_qc(struct lgfs2_sbd *sdp, struct jadd_opts *opts)
 {
 	int fd, error = 0;
 	char new_name[256], buf[sdp->sd_bsize];
@@ -402,7 +402,7 @@ close_fd:
 	return close(fd) || error;
 }
 
-static int gather_info(struct gfs2_sbd *sdp, struct jadd_opts *opts)
+static int gather_info(struct lgfs2_sbd *sdp, struct jadd_opts *opts)
 {
 	struct statfs statbuf;
 
@@ -512,7 +512,7 @@ out_errno:
 	return -1;
 }
 
-static int add_j(struct gfs2_sbd *sdp, struct jadd_opts *opts)
+static int add_j(struct lgfs2_sbd *sdp, struct jadd_opts *opts)
 {
 	int fd, error = 0;
 	char new_name[256], *buf;
@@ -596,7 +596,7 @@ close_fd:
 	return close(fd) || error;
 }
 
-static int check_fit(struct gfs2_sbd *sdp, struct jadd_opts *opts)
+static int check_fit(struct lgfs2_sbd *sdp, struct jadd_opts *opts)
 {
 	/* Compute how much space we'll need for the new journals
 	 * Number of blocks needed per added journal:
@@ -630,7 +630,7 @@ static int check_fit(struct gfs2_sbd *sdp, struct jadd_opts *opts)
 int main(int argc, char *argv[])
 {
 	struct jadd_opts opts = {0};
-	struct gfs2_sbd sbd, *sdp = &sbd;
+	struct lgfs2_sbd sbd, *sdp = &sbd;
 	struct metafs mfs = {0};
 	struct mntent *mnt;
 	unsigned int total, ret = 0;
@@ -639,7 +639,7 @@ int main(int argc, char *argv[])
 	textdomain("gfs2-utils");
 	srandom(time(NULL) ^ getpid());
 
-	memset(sdp, 0, sizeof(struct gfs2_sbd));
+	memset(sdp, 0, sizeof(struct lgfs2_sbd));
 	sdp->jsize = GFS2_DEFAULT_JSIZE;
 	sdp->qcsize = GFS2_DEFAULT_QCSIZE;
 	opts.journals = 1;
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 7c4700dc..c7712be8 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -634,7 +634,7 @@ static int opts_check(struct mkfs_opts *opts)
 	return 0;
 }
 
-static void print_results(struct gfs2_sbd *sb, struct mkfs_opts *opts)
+static void print_results(struct lgfs2_sbd *sb, struct mkfs_opts *opts)
 {
 	char readable_uuid[36+1];
 
@@ -681,7 +681,7 @@ static int warn_of_destruction(const char *path)
 	return 0;
 }
 
-static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
+static int build_per_node(struct lgfs2_sbd *sdp, struct mkfs_opts *opts)
 {
 	struct lgfs2_inode *per_node;
 	unsigned int j;
@@ -739,7 +739,7 @@ static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 	return 0;
 }
 
-static int zero_gap(struct gfs2_sbd *sdp, uint64_t addr, size_t blocks)
+static int zero_gap(struct lgfs2_sbd *sdp, uint64_t addr, size_t blocks)
 {
 	struct iovec *iov;
 	char *zerobuf;
@@ -775,7 +775,7 @@ static int zero_gap(struct gfs2_sbd *sdp, uint64_t addr, size_t blocks)
 	return 0;
 }
 
-static lgfs2_rgrps_t rgs_init(struct mkfs_opts *opts, struct gfs2_sbd *sdp)
+static lgfs2_rgrps_t rgs_init(struct mkfs_opts *opts, struct lgfs2_sbd *sdp)
 {
 	lgfs2_rgrps_t rgs;
 	uint64_t al_base = 0;
@@ -825,7 +825,7 @@ static lgfs2_rgrps_t rgs_init(struct mkfs_opts *opts, struct gfs2_sbd *sdp)
 	return rgs;
 }
 
-static int place_rgrp(struct gfs2_sbd *sdp, lgfs2_rgrp_t rg, int debug)
+static int place_rgrp(struct lgfs2_sbd *sdp, lgfs2_rgrp_t rg, int debug)
 {
 	uint64_t prev_end = (GFS2_SB_ADDR * GFS2_BASIC_BLOCK / sdp->sd_bsize) + 1;
 	lgfs2_rgrp_t prev = lgfs2_rgrp_prev(rg);
@@ -891,7 +891,7 @@ static int add_rgrp(lgfs2_rgrps_t rgs, uint64_t *addr, uint32_t len, lgfs2_rgrp_
 	return 0;
 }
 
-static int place_journals(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs, struct mkfs_opts *opts, uint64_t *rgaddr)
+static int place_journals(struct lgfs2_sbd *sdp, lgfs2_rgrps_t rgs, struct mkfs_opts *opts, uint64_t *rgaddr)
 {
 	struct gfs2_progress_bar progress;
 	uint64_t jfsize = lgfs2_space_for_data(sdp, sdp->sd_bsize, opts->jsize << 20);
@@ -965,7 +965,7 @@ static int place_journals(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs, struct mkfs_o
 	return 0;
 }
 
-static int place_rgrps(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs, uint64_t *rgaddr, struct mkfs_opts *opts)
+static int place_rgrps(struct lgfs2_sbd *sdp, lgfs2_rgrps_t rgs, uint64_t *rgaddr, struct mkfs_opts *opts)
 {
 	struct gfs2_progress_bar progress;
 	uint32_t rgblks = ((opts->rgsize << 20) / sdp->sd_bsize);
@@ -999,7 +999,7 @@ static int place_rgrps(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs, uint64_t *rgaddr
 	return 0;
 }
 
-static int create_jindex(struct gfs2_sbd *sdp, struct mkfs_opts *opts, struct lgfs2_inum *jnls)
+static int create_jindex(struct lgfs2_sbd *sdp, struct mkfs_opts *opts, struct lgfs2_inum *jnls)
 {
 	struct lgfs2_inode *jindex;
 
@@ -1047,9 +1047,9 @@ static int default_journal_size(unsigned bsize, uint64_t num_blocks)
 	return 262144;                          /*   1 GB */
 }
 
-static int sbd_init(struct gfs2_sbd *sdp, struct mkfs_opts *opts, unsigned bsize)
+static int sbd_init(struct lgfs2_sbd *sdp, struct mkfs_opts *opts, unsigned bsize)
 {
-	memset(sdp, 0, sizeof(struct gfs2_sbd));
+	memset(sdp, 0, sizeof(struct lgfs2_sbd));
 	sdp->sd_time = time(NULL);
 	sdp->rgtree.osi_node = NULL;
 	sdp->rgsize = opts->rgsize;
@@ -1197,7 +1197,7 @@ static int open_dev(struct mkfs_dev *dev, int withprobe)
 int main(int argc, char *argv[])
 {
 	struct gfs2_statfs_change sc;
-	struct gfs2_sbd sbd;
+	struct lgfs2_sbd sbd;
 	struct mkfs_opts opts;
 	struct lgfs2_inode *ip;
 	lgfs2_rgrps_t rgs;
diff --git a/tests/nukerg.c b/tests/nukerg.c
index e24151ef..a4c25a81 100644
--- a/tests/nukerg.c
+++ b/tests/nukerg.c
@@ -177,7 +177,7 @@ static int opts_get(int argc, char *argv[], struct opts *opts)
 	return 0;
 }
 
-static int nuke_rgs(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs, unsigned *rgnums, size_t count)
+static int nuke_rgs(struct lgfs2_sbd *sdp, lgfs2_rgrps_t rgs, unsigned *rgnums, size_t count)
 {
 	struct gfs2_rgrp blankrg;
 	lgfs2_rgrp_t rg;
@@ -211,7 +211,7 @@ static int nuke_rgs(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs, unsigned *rgnums, s
 	return 0;
 }
 
-static int nuke_ris(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs, unsigned *rinums, size_t count)
+static int nuke_ris(struct lgfs2_sbd *sdp, lgfs2_rgrps_t rgs, unsigned *rinums, size_t count)
 {
 	struct gfs2_rindex blankri;
 	lgfs2_rgrp_t rg;
@@ -244,7 +244,7 @@ static int nuke_ris(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs, unsigned *rinums, s
 	return 0;
 }
 
-static lgfs2_rgrps_t read_rindex(struct gfs2_sbd *sdp)
+static lgfs2_rgrps_t read_rindex(struct lgfs2_sbd *sdp)
 {
 	lgfs2_rgrps_t rgs;
 	unsigned rgcount;
@@ -276,7 +276,7 @@ static lgfs2_rgrps_t read_rindex(struct gfs2_sbd *sdp)
 	return rgs;
 }
 
-static int fill_super_block(struct gfs2_sbd *sdp)
+static int fill_super_block(struct lgfs2_sbd *sdp)
 {
 	sdp->sd_bsize = GFS2_BASIC_BLOCK;
 
@@ -298,7 +298,7 @@ static int fill_super_block(struct gfs2_sbd *sdp)
 
 int main(int argc, char **argv)
 {
-	struct gfs2_sbd sbd;
+	struct lgfs2_sbd sbd;
 	lgfs2_rgrps_t rgs;
 	struct opts opts;
 	int ret;
-- 
2.34.1

