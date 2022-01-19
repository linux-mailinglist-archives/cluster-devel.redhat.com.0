Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFB44938D7
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:46:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589206;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z9uWQareoGn7yNfpzlqYC1wYQEsza0FQ1rsjm0hrkM8=;
	b=fT5Z7BpKlreGsAqNX+M8ALYuWR5JL+KeNg2b2h/4OKgABNOoRxzGY1qd154StaybFs8RCb
	TVEeEFaTi1Uvyqpdsc8V6GQt45t4xO28O9lAYI3WNnylq2bFPgx+ptQHq6nQC2cS7I4JKs
	izojt9WxH5YipRnRUMA8o6n5Xv1CsYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-nd1pM_xSNuWvR1t5xDJRkg-1; Wed, 19 Jan 2022 05:46:42 -0500
X-MC-Unique: nd1pM_xSNuWvR1t5xDJRkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C94B1091DA4;
	Wed, 19 Jan 2022 10:46:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88C247A8D7;
	Wed, 19 Jan 2022 10:46:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7578F1806D2D;
	Wed, 19 Jan 2022 10:46:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAihgT024613 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:44:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1B46178B10; Wed, 19 Jan 2022 10:44:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53C7C7958B
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:44:41 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:16 +0000
Message-Id: <20220119104316.2489995-22-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 21/21] libgfs2: Namespace improvements -
	struct rgrp_tree
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

Rename to struct lgfs2_rgrp_tree.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c | 22 +++++++++----------
 gfs2/edit/extended.c        |  2 +-
 gfs2/edit/hexedit.c         | 24 ++++++++++-----------
 gfs2/edit/journal.c         |  8 +++----
 gfs2/edit/savemeta.c        |  8 +++----
 gfs2/fsck/fs_recovery.c     |  4 ++--
 gfs2/fsck/fsck.h            |  6 +++---
 gfs2/fsck/initialize.c      | 18 ++++++++--------
 gfs2/fsck/main.c            |  4 ++--
 gfs2/fsck/metawalk.c        |  6 +++---
 gfs2/fsck/metawalk.h        |  2 +-
 gfs2/fsck/pass1.c           | 12 +++++------
 gfs2/fsck/pass5.c           |  6 +++---
 gfs2/fsck/rgrepair.c        | 42 ++++++++++++++++++-------------------
 gfs2/fsck/util.c            |  4 ++--
 gfs2/fsck/util.h            |  2 +-
 gfs2/libgfs2/fs_bits.c      |  2 +-
 gfs2/libgfs2/fs_ops.c       | 12 +++++------
 gfs2/libgfs2/lang.c         |  4 ++--
 gfs2/libgfs2/libgfs2.h      | 20 +++++++++---------
 gfs2/libgfs2/rgrp.c         | 28 ++++++++++++-------------
 gfs2/libgfs2/structures.c   |  6 +++---
 gfs2/libgfs2/super.c        |  6 +++---
 23 files changed, 124 insertions(+), 124 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 104f9812..3eb1bf24 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -119,7 +119,7 @@ int print_level = MSG_NOTICE;
 /*                   Fixes all unallocated metadata bitmap states (which are */
 /*                   valid in gfs1 but invalid in gfs2).                     */
 /* ------------------------------------------------------------------------- */
-static void convert_bitmaps(struct lgfs2_sbd *sdp, struct rgrp_tree *rg)
+static void convert_bitmaps(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rg)
 {
 	uint32_t blk;
 	int x, y;
@@ -148,7 +148,7 @@ static void convert_bitmaps(struct lgfs2_sbd *sdp, struct rgrp_tree *rg)
 /* ------------------------------------------------------------------------- */
 static int convert_rgs(struct lgfs2_sbd *sbp)
 {
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 	struct osi_node *n, *next = NULL;
 	int rgs = 0;
 
@@ -157,7 +157,7 @@ static int convert_rgs(struct lgfs2_sbd *sbp)
 	/* --------------------------------- */
 	for (n = osi_first(&sbp->rgtree); n; n = next) {
 		next = osi_next(n);
-		rgd = (struct rgrp_tree *)n;
+		rgd = (struct lgfs2_rgrp_tree *)n;
 
 		rgd->rt_free = rgd->rt_free + rgd->rt_freemeta;
 		/* Zero it out so we don't add it again in case something breaks */
@@ -949,7 +949,7 @@ err_freei:
 	return -1;
 } /* adjust_inode */
 
-static int next_rg_meta(struct rgrp_tree *rgd, uint64_t *block, int first)
+static int next_rg_meta(struct lgfs2_rgrp_tree *rgd, uint64_t *block, int first)
 {
 	struct lgfs2_bitmap *bits = NULL;
 	uint32_t length = rgd->rt_length;
@@ -981,7 +981,7 @@ static int next_rg_meta(struct rgrp_tree *rgd, uint64_t *block, int first)
 	return 0;
 }
 
-static int next_rg_metatype(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd,
+static int next_rg_metatype(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rgd,
                             uint64_t *block, uint32_t type, int first)
 {
 	struct lgfs2_buffer_head *bh = NULL;
@@ -1008,7 +1008,7 @@ static int next_rg_metatype(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd,
 /* ------------------------------------------------------------------------- */
 static int inode_renumber(struct lgfs2_sbd *sbp, uint64_t root_inode_addr, osi_list_t *cdpn_to_fix)
 {
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 	struct osi_node *n, *next = NULL;
 	uint64_t block = 0;
 	struct lgfs2_buffer_head *bh;
@@ -1026,7 +1026,7 @@ static int inode_renumber(struct lgfs2_sbd *sbp, uint64_t root_inode_addr, osi_l
 	/* ---------------------------------------------------------------- */
 	for (n = osi_first(&sbp->rgtree); n; n = next) {
 		next = osi_next(n);
-		rgd = (struct rgrp_tree *)n;
+		rgd = (struct lgfs2_rgrp_tree *)n;
 		rgs_processed++;
 		first = 1;
 		while (1) {    /* for all inodes in the resource group */
@@ -1519,7 +1519,7 @@ static int sanity_check(struct lgfs2_sbd *sdp)
  */
 static int gfs1_ri_update(struct lgfs2_sbd *sdp, int *rgcount, int quiet)
 {
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 	uint64_t count1 = 0, count2 = 0;
 	uint64_t errblock = 0;
 	uint64_t rmax = 0;
@@ -1530,7 +1530,7 @@ static int gfs1_ri_update(struct lgfs2_sbd *sdp, int *rgcount, int quiet)
 		goto fail;
 	for (n = osi_first(&sdp->rgtree); n; n = next) {
 		next = osi_next(n);
-		rgd = (struct rgrp_tree *)n;
+		rgd = (struct lgfs2_rgrp_tree *)n;
 		/* Read resource group header */
 		errblock = lgfs2_rgrp_read(sdp, rgd);
 		if (errblock)
@@ -1808,7 +1808,7 @@ static int journ_space_to_rg(struct lgfs2_sbd *sdp)
 {
 	int error = 0;
 	int j;
-	struct rgrp_tree *rgd, *rgdhigh;
+	struct lgfs2_rgrp_tree *rgd, *rgdhigh;
 	struct osi_node *n, *next = NULL;
 	struct gfs2_meta_header mh = {0};
 	uint64_t ri_addr;
@@ -1834,7 +1834,7 @@ static int journ_space_to_rg(struct lgfs2_sbd *sdp)
 		rgdhigh = NULL;
 		for (n = osi_first(&sdp->rgtree); n; n = next) {
 			next = osi_next(n);
-			rgd = (struct rgrp_tree *)n;
+			rgd = (struct lgfs2_rgrp_tree *)n;
 			if (rgd->rt_addr < ji_addr &&
 				((rgdhigh == NULL) ||
 				 (rgd->rt_addr > rgdhigh->rt_addr)))
diff --git a/gfs2/edit/extended.c b/gfs2/edit/extended.c
index 81548939..aec8cbdc 100644
--- a/gfs2/edit/extended.c
+++ b/gfs2/edit/extended.c
@@ -494,7 +494,7 @@ static int parse_rindex(struct lgfs2_inode *dip, int print_rindex)
 	int error, start_line;
 	struct gfs2_rindex ri;
 	char highlighted_addr[32];
-	struct rgrp_tree rg = {0};
+	struct lgfs2_rgrp_tree rg = {0};
 
 	start_line = line;
 	print_gfs2("RG index entries found: %"PRIu64".",
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index 9a90587f..af17e720 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -348,7 +348,7 @@ int display_block_type(char *buf, uint64_t addr, int from_restore)
 		return ret_type;
 	if (termlines && dmode == HEX_MODE) {
 		int type;
-		struct rgrp_tree *rgd;
+		struct lgfs2_rgrp_tree *rgd;
 
 		rgd = lgfs2_blk2rgrpd(&sbd, block);
 		if (rgd) {
@@ -942,7 +942,7 @@ static int read_rindex(void)
 		lgfs2_rindex_read(&sbd, &count, &ok);
 
 	if (!OSI_EMPTY_ROOT(&sbd.rgtree)) {
-		struct rgrp_tree *rg = (struct rgrp_tree *)osi_last(&sbd.rgtree);
+		struct lgfs2_rgrp_tree *rg = (struct lgfs2_rgrp_tree *)osi_last(&sbd.rgtree);
 		sbd.fssize = rg->rt_data0 + rg->rt_data;
 	}
 	return 0;
@@ -1160,7 +1160,7 @@ static uint64_t find_metablockoftype_slow(uint64_t startblk, int metatype, int p
 	return blk;
 }
 
-static int find_rg_metatype(struct rgrp_tree *rgd, uint64_t *blk, uint64_t startblk, int mtype)
+static int find_rg_metatype(struct lgfs2_rgrp_tree *rgd, uint64_t *blk, uint64_t startblk, int mtype)
 {
 	int found;
 	unsigned i, j, m;
@@ -1197,12 +1197,12 @@ static uint64_t find_metablockoftype_rg(uint64_t startblk, int metatype, int pri
 	struct osi_node *next = NULL;
 	uint64_t blk, errblk;
 	int first = 1, found = 0;
-	struct rgrp_tree *rgd = NULL;
+	struct lgfs2_rgrp_tree *rgd = NULL;
 
 	blk = 0;
 	/* Skip the rgs prior to the block we've been given */
 	for (next = osi_first(&sbd.rgtree); next; next = osi_next(next)) {
-		rgd = (struct rgrp_tree *)next;
+		rgd = (struct lgfs2_rgrp_tree *)next;
 		if (first && startblk <= rgd->rt_data0) {
 			startblk = rgd->rt_data0;
 			break;
@@ -1221,7 +1221,7 @@ static uint64_t find_metablockoftype_rg(uint64_t startblk, int metatype, int pri
 			exit(-1);
 	}
 	for (; !found && next; next = osi_next(next)){
-		rgd = (struct rgrp_tree *)next;
+		rgd = (struct lgfs2_rgrp_tree *)next;
 		errblk = lgfs2_rgrp_read(&sbd, rgd);
 		if (errblk)
 			continue;
@@ -1600,7 +1600,7 @@ static void find_print_block_rg(int bitmap)
 {
 	uint64_t rblock, rgblock;
 	int i;
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 
 	rblock = blockstack[blockhist % BLOCK_STACK_SIZE].block;
 	if (rblock == LGFS2_SB_ADDR(&sbd))
@@ -1643,7 +1643,7 @@ static void find_change_block_alloc(int *newval)
 {
 	uint64_t ablock;
 	int type;
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 
 	if (newval &&
 	    (*newval < GFS2_BLKST_FREE || *newval > GFS2_BLKST_DINODE)) {
@@ -2116,7 +2116,7 @@ static void getgziplevel(char *argv[], int *i)
 	(*i)++;
 }
 
-static int count_dinode_blks(struct rgrp_tree *rgd, int bitmap,
+static int count_dinode_blks(struct lgfs2_rgrp_tree *rgd, int bitmap,
 			     struct lgfs2_buffer_head *rbh)
 {
 	struct lgfs2_buffer_head *tbh;
@@ -2175,7 +2175,7 @@ static int count_dinode_bits(struct lgfs2_buffer_head *rbh)
 static void rg_repair(void)
 {
 	struct lgfs2_buffer_head *rbh;
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 	struct osi_node *n;
 	int b;
 	int rgs_fixed = 0;
@@ -2183,7 +2183,7 @@ static void rg_repair(void)
 
 	/* Walk through the resource groups saving everything within */
 	for (n = osi_first(&sbd.rgtree); n; n = osi_next(n)) {
-		rgd = (struct rgrp_tree *)n;
+		rgd = (struct lgfs2_rgrp_tree *)n;
 		if (lgfs2_rgrp_read(&sbd, rgd) == 0) { /* was read in okay */
 			lgfs2_rgrp_relse(&sbd, rgd);
 			continue; /* ignore it */
@@ -2448,7 +2448,7 @@ static void process_parameters(int argc, char *argv[], int pass)
 		} else if (!strcmp(argv[i], "rgbitmaps")) {
 			int rg, bmap;
 			uint64_t rgblk;
-			struct rgrp_tree *rgd;
+			struct lgfs2_rgrp_tree *rgd;
 
 			i++;
 			if (i >= argc - 1) {
diff --git a/gfs2/edit/journal.c b/gfs2/edit/journal.c
index c977ef7f..f5dc0518 100644
--- a/gfs2/edit/journal.c
+++ b/gfs2/edit/journal.c
@@ -174,7 +174,7 @@ static int fsck_readi(struct lgfs2_inode *ip, void *rbuf, uint64_t roffset,
  * references to a given traced block, or its rgrp bitmap block.
  */
 static int ld_is_pertinent(const __be64 *b, const char *end, uint64_t tblk,
-			   struct rgrp_tree *rgd, uint64_t bitblk)
+			   struct lgfs2_rgrp_tree *rgd, uint64_t bitblk)
 {
 	const __be64 *blk = b;
 
@@ -197,7 +197,7 @@ static int ld_is_pertinent(const __be64 *b, const char *end, uint64_t tblk,
  */
 static int print_ld_blks(const __be64 *b, const char *end, int start_line,
 			 uint64_t tblk, uint64_t *tblk_off, uint64_t bitblk,
-			 struct rgrp_tree *rgd, uint64_t abs_block, int prnt,
+			 struct lgfs2_rgrp_tree *rgd, uint64_t abs_block, int prnt,
 			 uint64_t *bblk_off, int is_meta_ld)
 {
 	int bcount = 0, found_tblk = 0, found_bblk = 0;
@@ -352,7 +352,7 @@ static uint64_t find_wrap_pt(struct lgfs2_inode *ji, char *jbuf, uint64_t jblock
 static int process_ld(uint64_t abs_block, uint64_t wrappt, uint64_t j_size,
 		      uint64_t jb, char *buf, int tblk,
 		      uint64_t *tblk_off, uint64_t bitblk,
-		      struct rgrp_tree *rgd, int *prnt, uint64_t *bblk_off)
+		      struct lgfs2_rgrp_tree *rgd, int *prnt, uint64_t *bblk_off)
 {
 	__be64 *b;
 	struct gfs2_log_descriptor *ld = (void *)buf;
@@ -511,7 +511,7 @@ void dump_journal(const char *journal, uint64_t tblk)
 	uint64_t highest_seq = 0;
 	char *jbuf = NULL;
 	char *buf = NULL;
-	struct rgrp_tree *rgd = NULL;
+	struct lgfs2_rgrp_tree *rgd = NULL;
 	uint64_t abs_ld = 0;
 
 	mtype = lgfs2_find_mtype(GFS2_METATYPE_LH, sbd.gfs1 ? LGFS2_MD_GFS1 : LGFS2_MD_GFS2);
diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 4ab4f4a1..05c3f295 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -989,7 +989,7 @@ static void save_allocated_range(struct metafd *mfd, struct block_range *br)
 	free(br->buf);
 }
 
-static void save_allocated(struct rgrp_tree *rgd, struct metafd *mfd)
+static void save_allocated(struct lgfs2_rgrp_tree *rgd, struct metafd *mfd)
 {
 	uint64_t blk = 0;
 	unsigned i, j, m;
@@ -1055,7 +1055,7 @@ static char *rgrp_read(struct lgfs2_sbd *sdp, uint64_t addr, unsigned blocks)
 	return buf;
 }
 
-static void save_rgrp(struct lgfs2_sbd *sdp, struct metafd *mfd, struct rgrp_tree *rgd, int withcontents)
+static void save_rgrp(struct lgfs2_sbd *sdp, struct metafd *mfd, struct lgfs2_rgrp_tree *rgd, int withcontents)
 {
 	uint64_t addr = rgd->rt_addr;
 	char *buf;
@@ -1188,9 +1188,9 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 	}
 	/* Walk through the resource groups saving everything within */
 	for (n = osi_first(&sbd.rgtree); n; n = osi_next(n)) {
-		struct rgrp_tree *rgd;
+		struct lgfs2_rgrp_tree *rgd;
 
-		rgd = (struct rgrp_tree *)n;
+		rgd = (struct lgfs2_rgrp_tree *)n;
 		save_rgrp(&sbd, &mfd, rgd, (saveoption != 2));
 	}
 	/* Clean up */
diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index f65c4a33..97c42e4d 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -98,7 +98,7 @@ static void revoke_clean(struct lgfs2_sbd *sdp)
 	}
 }
 
-static void refresh_rgrp(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd,
+static void refresh_rgrp(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rgd,
 			 struct lgfs2_buffer_head *bh, uint64_t blkno)
 {
 	int i;
@@ -130,7 +130,7 @@ static int buf_lo_scan_elements(struct lgfs2_inode *ip, unsigned int start,
 	struct lgfs2_buffer_head *bh_log, *bh_ip;
 	uint64_t blkno;
 	int error = 0;
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 
 	if (pass != 1 || be32_to_cpu(ld->ld_type) != GFS2_LOG_DESC_METADATA)
 		return 0;
diff --git a/gfs2/fsck/fsck.h b/gfs2/fsck/fsck.h
index baf7c926..94b8620c 100644
--- a/gfs2/fsck/fsck.h
+++ b/gfs2/fsck/fsck.h
@@ -110,7 +110,7 @@ enum rgindex_trust_level { /* how far can we trust our RG index? */
 
 extern struct lgfs2_inode *fsck_load_inode(struct lgfs2_sbd *sdp, uint64_t block);
 extern struct lgfs2_inode *fsck_inode_get(struct lgfs2_sbd *sdp,
-					 struct rgrp_tree *rgd,
+					 struct lgfs2_rgrp_tree *rgd,
 					 struct lgfs2_buffer_head *bh);
 extern void fsck_inode_put(struct lgfs2_inode **ip);
 
@@ -164,7 +164,7 @@ static inline int valid_block(struct lgfs2_sbd *sdp, uint64_t blkno)
 	         (lgfs2_get_bitmap(sdp, blkno, NULL) < 0));
 }
 
-static inline int rgrp_contains_block(struct rgrp_tree *rgd, uint64_t blk)
+static inline int rgrp_contains_block(struct lgfs2_rgrp_tree *rgd, uint64_t blk)
 {
 	if (blk < rgd->rt_addr)
 		return 0;
@@ -176,7 +176,7 @@ static inline int rgrp_contains_block(struct rgrp_tree *rgd, uint64_t blk)
 static inline int valid_block_ip(struct lgfs2_inode *ip, uint64_t blk)
 {
 	struct lgfs2_sbd *sdp = ip->i_sbd;
-	struct rgrp_tree *rgd = ip->i_rgd;
+	struct lgfs2_rgrp_tree *rgd = ip->i_rgd;
 
 	if (blk > sdp->fssize)
 		return 0;
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index 8957ddf9..942a2de8 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -132,7 +132,7 @@ static void empty_super_block(struct lgfs2_sbd *sdp)
 static int set_block_ranges(struct lgfs2_sbd *sdp)
 {
 	struct osi_node *n, *next = NULL;
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 	uint64_t rmax = 0;
 	uint64_t rmin = 0;
 	ssize_t count;
@@ -142,7 +142,7 @@ static int set_block_ranges(struct lgfs2_sbd *sdp)
 
 	for (n = osi_first(&sdp->rgtree); n; n = next) {
 		next = osi_next(n);
-		rgd = (struct rgrp_tree *)n;
+		rgd = (struct lgfs2_rgrp_tree *)n;
 		if (rgd->rt_data0 + rgd->rt_data &&
 		    rgd->rt_data0 + rgd->rt_data - 1 > rmax)
 			rmax = rgd->rt_data0 + rgd->rt_data - 1;
@@ -185,7 +185,7 @@ static int set_block_ranges(struct lgfs2_sbd *sdp)
 /**
  * check_rgrp_integrity - verify a rgrp free block count against the bitmap
  */
-static void check_rgrp_integrity(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd,
+static void check_rgrp_integrity(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rgd,
 				 int *fixit, int *this_rg_fixed,
 				 int *this_rg_bad, int *this_rg_cleaned)
 {
@@ -397,13 +397,13 @@ static void check_rgrps_integrity(struct lgfs2_sbd *sdp)
 	struct osi_node *n, *next = NULL;
 	int rgs_good = 0, rgs_bad = 0, rgs_fixed = 0, rgs_cleaned = 0;
 	int was_bad = 0, was_fixed = 0, was_cleaned = 0;
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 	int reclaim_unlinked = 0;
 
 	log_info( _("Checking the integrity of all resource groups.\n"));
 	for (n = osi_first(&sdp->rgtree); n; n = next) {
 		next = osi_next(n);
-		rgd = (struct rgrp_tree *)n;
+		rgd = (struct lgfs2_rgrp_tree *)n;
 		if (fsck_abort)
 			return;
 		check_rgrp_integrity(sdp, rgd, &reclaim_unlinked,
@@ -628,7 +628,7 @@ static void lookup_per_node(struct lgfs2_sbd *sdp, int allow_rebuild)
 static unsigned gfs2_rgrp_reada(struct lgfs2_sbd *sdp, unsigned cur_window,
 				struct osi_node *n)
 {
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 	unsigned i;
 	off_t start, len;
 
@@ -637,7 +637,7 @@ static unsigned gfs2_rgrp_reada(struct lgfs2_sbd *sdp, unsigned cur_window,
 			return i;
 		if (i < cur_window)
 			continue;
-		rgd = (struct rgrp_tree *)n;
+		rgd = (struct lgfs2_rgrp_tree *)n;
 		start = rgd->rt_addr * sdp->sd_bsize;
 		len = rgd->rt_length * sdp->sd_bsize;
 		posix_fadvise(sdp->device_fd, start, len, POSIX_FADV_WILLNEED);
@@ -658,7 +658,7 @@ static unsigned gfs2_rgrp_reada(struct lgfs2_sbd *sdp, unsigned cur_window,
  */
 static int read_rgrps(struct lgfs2_sbd *sdp, uint64_t expected)
 {
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 	uint64_t count = 0;
 	uint64_t errblock = 0;
 	uint64_t rmax = 0;
@@ -670,7 +670,7 @@ static int read_rgrps(struct lgfs2_sbd *sdp, uint64_t expected)
 
 	for (n = osi_first(&sdp->rgtree); n; n = next) {
 		next = osi_next(n);
-		rgd = (struct rgrp_tree *)n;
+		rgd = (struct lgfs2_rgrp_tree *)n;
 		/* Readahead resource group headers */
 		if (ra_window < RA_WINDOW/2)
 			ra_window = gfs2_rgrp_reada(sdp, ra_window, n);
diff --git a/gfs2/fsck/main.c b/gfs2/fsck/main.c
index e86ef792..ed61449e 100644
--- a/gfs2/fsck/main.c
+++ b/gfs2/fsck/main.c
@@ -155,7 +155,7 @@ static void interrupt(int sig)
 static int check_statfs(struct lgfs2_sbd *sdp)
 {
 	struct osi_node *n, *next = NULL;
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 	struct gfs2_statfs_change sc;
 	uint64_t sc_total;
 	uint64_t sc_free;
@@ -184,7 +184,7 @@ static int check_statfs(struct lgfs2_sbd *sdp)
 
 	for (n = osi_first(&sdp->rgtree); n; n = next) {
 		next = osi_next(n);
-		rgd = (struct rgrp_tree *)n;
+		rgd = (struct lgfs2_rgrp_tree *)n;
 		sdp->blks_total += rgd->rt_data;
 		sdp->blks_alloced += (rgd->rt_data - rgd->rt_free);
 		sdp->dinodes_alloced += rgd->rt_dinodes;
diff --git a/gfs2/fsck/metawalk.c b/gfs2/fsck/metawalk.c
index 035f0765..cdbeec9d 100644
--- a/gfs2/fsck/metawalk.c
+++ b/gfs2/fsck/metawalk.c
@@ -29,7 +29,7 @@
    is used to set the latter.  The two must be kept in sync, otherwise
    you'll get bitmap mismatches.  This function checks the status of the
    bitmap whenever the blockmap changes, and fixes it accordingly. */
-int check_n_fix_bitmap(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd,
+int check_n_fix_bitmap(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rgd,
 		       uint64_t blk, int error_on_dinode, int new_state)
 {
 	int old_state;
@@ -39,7 +39,7 @@ int check_n_fix_bitmap(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd,
 		{"free", "data", "unlinked", "inode", "reserved"},
 		/* gfs1 descriptions: */
 		{"free", "data", "free meta", "metadata", "reserved"}};
-	static struct rgrp_tree *prevrgd = NULL;
+	static struct lgfs2_rgrp_tree *prevrgd = NULL;
 
 	if (prevrgd && rgrp_contains_block(prevrgd, blk)) {
 		rgd = prevrgd;
@@ -266,7 +266,7 @@ struct lgfs2_inode *fsck_load_inode(struct lgfs2_sbd *sdp, uint64_t block)
 
 /* fsck_inode_get - same as inode_get() in libgfs2 but system inodes
    get special treatment. */
-struct lgfs2_inode *fsck_inode_get(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd,
+struct lgfs2_inode *fsck_inode_get(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rgd,
 				  struct lgfs2_buffer_head *bh)
 {
 	struct lgfs2_inode *sysip;
diff --git a/gfs2/fsck/metawalk.h b/gfs2/fsck/metawalk.h
index f82f24bb..eeff431d 100644
--- a/gfs2/fsck/metawalk.h
+++ b/gfs2/fsck/metawalk.h
@@ -22,7 +22,7 @@ extern int check_leaf(struct lgfs2_inode *ip, int lindex,
 extern int _fsck_bitmap_set(struct lgfs2_inode *ip, uint64_t bblock,
 			    const char *btype, int mark, int error_on_dinode,
 			    const char *caller, int line);
-extern int check_n_fix_bitmap(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd,
+extern int check_n_fix_bitmap(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rgd,
 			      uint64_t blk, int error_on_dinode,
 			      int new_state);
 extern struct duptree *dupfind(uint64_t block);
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index 578de609..5aaff951 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -397,7 +397,7 @@ static int undo_reference(struct lgfs2_inode *ip, uint64_t block, int meta,
 	struct duptree *dt;
 	struct inode_with_dups *id;
 	int old_bitmap_state = 0;
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 
 	if (!valid_block_ip(ip, block)) { /* blk outside of FS */
 		fsck_blockmap_set(ip, ip->i_num.in_addr, _("bad block referencing"), GFS2_BLKST_FREE);
@@ -1397,7 +1397,7 @@ static void check_i_goal(struct lgfs2_sbd *sdp, struct lgfs2_inode *ip)
  * handle_di - This is now a wrapper function that takes a lgfs2_buffer_head
  *             and calls handle_ip, which takes an in-code dinode structure.
  */
-static int handle_di(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd,
+static int handle_di(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rgd,
 		     struct lgfs2_buffer_head *bh)
 {
 	int error = 0;
@@ -1751,7 +1751,7 @@ static int check_system_inodes(struct lgfs2_sbd *sdp)
 	return 0;
 }
 
-static int pass1_process_bitmap(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd, uint64_t *ibuf, unsigned n)
+static int pass1_process_bitmap(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rgd, uint64_t *ibuf, unsigned n)
 {
 	struct lgfs2_buffer_head *bh;
 	unsigned i;
@@ -1874,7 +1874,7 @@ static int pass1_process_bitmap(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd, ui
 	return 0;
 }
 
-static int pass1_process_rgrp(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd)
+static int pass1_process_rgrp(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rgd)
 {
 	unsigned k, n, i;
 	uint64_t *ibuf = malloc(sdp->sd_bsize * GFS2_NBBY * sizeof(uint64_t));
@@ -2002,7 +2002,7 @@ static void enomem(uint64_t addl_mem_needed)
 int pass1(struct lgfs2_sbd *sdp)
 {
 	struct osi_node *n, *next = NULL;
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 	uint64_t i;
 	uint64_t rg_count = 0;
 	struct timeval timer;
@@ -2054,7 +2054,7 @@ int pass1(struct lgfs2_sbd *sdp)
 		}
 		next = osi_next(n);
 		log_debug("Checking metadata in resource group #%"PRIu64"\n", rg_count);
-		rgd = (struct rgrp_tree *)n;
+		rgd = (struct lgfs2_rgrp_tree *)n;
 		for (i = 0; i < rgd->rt_length; i++) {
 			log_debug("rgrp block %"PRIu64" (0x%"PRIx64") is now marked as 'rgrp data'\n",
 				   rgd->rt_addr + i, rgd->rt_addr + i);
diff --git a/gfs2/fsck/pass5.c b/gfs2/fsck/pass5.c
index 302ebaf2..e412a4d0 100644
--- a/gfs2/fsck/pass5.c
+++ b/gfs2/fsck/pass5.c
@@ -113,7 +113,7 @@ static int check_block_status(struct lgfs2_sbd *sdp,  struct gfs2_bmap *bl,
 	return 0;
 }
 
-static void update_rgrp(struct lgfs2_sbd *sdp, struct rgrp_tree *rgp,
+static void update_rgrp(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rgp,
 			struct gfs2_bmap *bl, uint32_t *count)
 {
 	uint32_t i;
@@ -197,7 +197,7 @@ static void update_rgrp(struct lgfs2_sbd *sdp, struct rgrp_tree *rgp,
 int pass5(struct lgfs2_sbd *sdp, struct gfs2_bmap *bl)
 {
 	struct osi_node *n, *next = NULL;
-	struct rgrp_tree *rgp = NULL;
+	struct lgfs2_rgrp_tree *rgp = NULL;
 	uint32_t count[5]; /* we need 5 because of GFS1 usedmeta */
 	uint64_t rg_count = 0;
 
@@ -208,7 +208,7 @@ int pass5(struct lgfs2_sbd *sdp, struct gfs2_bmap *bl)
 			return FSCK_OK;
 		log_info(_("Verifying resource group %"PRIu64"\n"), rg_count);
 		memset(count, 0, sizeof(count));
-		rgp = (struct rgrp_tree *)n;
+		rgp = (struct lgfs2_rgrp_tree *)n;
 
 		rg_count++;
 		/* Compare the bitmaps and report the differences */
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index 2cfc3f5b..2a8c0eaa 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -308,11 +308,11 @@ static uint64_t count_usedspace(struct lgfs2_sbd *sdp, int first,
  * This function finds the distance to the next rgrp for these cases.
  */
 static uint64_t find_next_rgrp_dist(struct lgfs2_sbd *sdp, uint64_t blk,
-				    struct rgrp_tree *prevrgd)
+				    struct lgfs2_rgrp_tree *prevrgd)
 {
 	struct osi_node *n, *next = NULL;
 	uint64_t rgrp_dist = 0, used_blocks, block, next_block, twogigs;
-	struct rgrp_tree *rgd = NULL, *next_rgd;
+	struct lgfs2_rgrp_tree *rgd = NULL, *next_rgd;
 	struct lgfs2_buffer_head *bh;
 	int first, length, b, found;
 	uint64_t mega_in_blocks;
@@ -320,13 +320,13 @@ static uint64_t find_next_rgrp_dist(struct lgfs2_sbd *sdp, uint64_t blk,
 
 	for (n = osi_first(&sdp->rgtree); n; n = next) {
 		next = osi_next(n);
-		rgd = (struct rgrp_tree *)n;
+		rgd = (struct lgfs2_rgrp_tree *)n;
 		if (rgd->rt_addr == blk)
 			break;
 	}
 	if (rgd && n && osi_next(n) && rgd->rt_addr == blk) {
 		n = osi_next(n);
-		next_rgd = (struct rgrp_tree *)n;
+		next_rgd = (struct lgfs2_rgrp_tree *)n;
 		rgrp_dist = next_rgd->rt_addr - rgd->rt_addr;
 		return rgrp_dist;
 	}
@@ -420,7 +420,7 @@ static uint64_t find_next_rgrp_dist(struct lgfs2_sbd *sdp, uint64_t blk,
  * boundaries, and also corrupt.  So we have to go out searching for one.
  */
 static uint64_t hunt_and_peck(struct lgfs2_sbd *sdp, uint64_t blk,
-			      struct rgrp_tree *prevrgd, uint64_t last_bump)
+			      struct lgfs2_rgrp_tree *prevrgd, uint64_t last_bump)
 {
 	uint64_t rgrp_dist = 0, block, twogigs, last_block, last_meg;
 	struct lgfs2_buffer_head *bh;
@@ -518,7 +518,7 @@ static int rindex_rebuild(struct lgfs2_sbd *sdp, int *num_rgs, int gfs_grow)
 	int rg_dcnt[MAX_RGSEGMENTS] = {0, };
 	uint64_t blk;
 	uint64_t fwd_block, block_bump;
-	struct rgrp_tree *calc_rgd, *prev_rgd;
+	struct lgfs2_rgrp_tree *calc_rgd, *prev_rgd;
 	int number_of_rgs, rgi, segment_rgs;
 	int rg_was_fnd = 0, corrupt_rgs = 0;
 	int error = -1, j, i;
@@ -671,7 +671,7 @@ static int rindex_rebuild(struct lgfs2_sbd *sdp, int *num_rgs, int gfs_grow)
         log_debug( _("rindex rebuilt as follows:\n"));
 	for (n = osi_first(&rgcalc), rgi = 0; n; n = next, rgi++) {
 		next = osi_next(n);
-		calc_rgd = (struct rgrp_tree *)n;
+		calc_rgd = (struct lgfs2_rgrp_tree *)n;
                 log_debug("%d: 0x%"PRIx64"/%"PRIx32"/0x%"PRIx64"/0x%"PRIx32"/0x%"PRIx32"\n",
 		          rgi + 1, calc_rgd->rt_addr, calc_rgd->rt_length,
 			  calc_rgd->rt_data0, calc_rgd->rt_data,
@@ -733,7 +733,7 @@ static uint64_t how_many_rgrps(struct lgfs2_sbd *sdp, struct lgfs2_device *dev)
 static struct osi_root compute_rgrp_layout(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_device *dev;
-	struct rgrp_tree *rl, *rlast = NULL;
+	struct lgfs2_rgrp_tree *rl, *rlast = NULL;
 	unsigned int rgrp = 0, nrgrp, rglength;
 	struct osi_root rgtree = {NULL};
 	uint64_t rgaddr;
@@ -767,12 +767,12 @@ static struct osi_root compute_rgrp_layout(struct lgfs2_sbd *sdp)
 static int calc_rgrps(struct lgfs2_sbd *sdp)
 {
 	struct osi_node *n, *next = NULL;
-	struct rgrp_tree *rl;
+	struct lgfs2_rgrp_tree *rl;
 	uint32_t rgblocks, bitblocks;
 
 	for (n = osi_first(&rgcalc); n; n = next) {
 		next = osi_next(n);
-		rl = (struct rgrp_tree *)n;
+		rl = (struct lgfs2_rgrp_tree *)n;
 
 		bitblocks = lgfs2_rgblocks2bitblocks(sdp->sd_bsize, rl->rt_skip, &rgblocks);
 
@@ -845,7 +845,7 @@ static int gfs2_rindex_calculate(struct lgfs2_sbd *sdp, int *num_rgs)
  * rewrite_rg_block - rewrite ("fix") a buffer with rg or bitmap data
  * returns: 0 if the rg was repaired, otherwise 1
  */
-static int rewrite_rg_block(struct lgfs2_sbd *sdp, struct rgrp_tree *rg,
+static int rewrite_rg_block(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rg,
 			    uint64_t errblock)
 {
 	int x = errblock - rg->rt_addr;
@@ -905,12 +905,12 @@ static int rewrite_rg_block(struct lgfs2_sbd *sdp, struct rgrp_tree *rg,
 static int expect_rindex_sanity(struct lgfs2_sbd *sdp, int *num_rgs)
 {
 	struct osi_node *n, *next = NULL;
-	struct rgrp_tree *rgd, *exp;
+	struct lgfs2_rgrp_tree *rgd, *exp;
 
 	*num_rgs = sdp->md.riinode->i_size / sizeof(struct gfs2_rindex) ;
 	for (n = osi_first(&sdp->rgtree); n; n = next) {
 		next = osi_next(n);
-		rgd = (struct rgrp_tree *)n;
+		rgd = (struct lgfs2_rgrp_tree *)n;
 		exp = lgfs2_rgrp_insert(&rgcalc, rgd->rt_addr);
 		if (exp == NULL) {
 			fprintf(stderr, "Out of memory in %s\n", __FUNCTION__);
@@ -1054,13 +1054,13 @@ int rindex_repair(struct lgfs2_sbd *sdp, int trust_lvl, int *ok)
 	discrepancies = 0;
 	for (rg = 0, n = osi_first(&sdp->rgtree), e = osi_first(&rgcalc);
 	     n && e && !fsck_abort && rg < calc_rg_count; rg++) {
-		struct rgrp_tree *expected, *actual;
+		struct lgfs2_rgrp_tree *expected, *actual;
 
 		next = osi_next(n);
 		enext = osi_next(e);
 
-		expected = (struct rgrp_tree *)e;
-		actual = (struct rgrp_tree *)n;
+		expected = (struct lgfs2_rgrp_tree *)e;
+		actual = (struct lgfs2_rgrp_tree *)n;
 		if (actual->rt_addr < expected->rt_addr) {
 			n = next;
 			discrepancies++;
@@ -1108,13 +1108,13 @@ int rindex_repair(struct lgfs2_sbd *sdp, int trust_lvl, int *ok)
 	/* ------------------------------------------------------------- */
 	for (rg = 0, n = osi_first(&sdp->rgtree), e = osi_first(&rgcalc);
 	     e && !fsck_abort && rg < calc_rg_count; rg++) {
-		struct rgrp_tree *expected, *actual;
+		struct lgfs2_rgrp_tree *expected, *actual;
 
 		if (n)
 			next = osi_next(n);
 		enext = osi_next(e);
-		expected = (struct rgrp_tree *)e;
-		actual = (struct rgrp_tree *)n;
+		expected = (struct lgfs2_rgrp_tree *)e;
+		actual = (struct lgfs2_rgrp_tree *)n;
 
 		/* If the next "actual" rgrp in memory is too far away,
 		   fill in a new one with the expected value. -or-
@@ -1176,7 +1176,7 @@ int rindex_repair(struct lgfs2_sbd *sdp, int trust_lvl, int *ok)
 	/* ------------------------------------------------------------- */
 	for (rg = 0, n = osi_first(&sdp->rgtree); n && !fsck_abort &&
 		     rg < calc_rg_count; n = next, rg++) {
-		struct rgrp_tree *rgd;
+		struct lgfs2_rgrp_tree *rgd;
 		uint64_t prev_err = 0, errblock;
 		int i;
 
@@ -1185,7 +1185,7 @@ int rindex_repair(struct lgfs2_sbd *sdp, int trust_lvl, int *ok)
 		/* we encounter that has errors, repair it and try again.    */
 		i = 0;
 		do {
-			rgd = (struct rgrp_tree *)n;
+			rgd = (struct lgfs2_rgrp_tree *)n;
 			errblock = lgfs2_rgrp_read(sdp, rgd);
 			if (errblock) {
 				if (errblock == prev_err)
diff --git a/gfs2/fsck/util.c b/gfs2/fsck/util.c
index ba5f1f22..9e5608a3 100644
--- a/gfs2/fsck/util.c
+++ b/gfs2/fsck/util.c
@@ -538,7 +538,7 @@ void dirtree_delete(struct dir_info *b)
 uint64_t find_free_blk(struct lgfs2_sbd *sdp)
 {
 	struct osi_node *n, *next = NULL;
-	struct rgrp_tree *rl = NULL;
+	struct lgfs2_rgrp_tree *rl = NULL;
 	struct gfs2_rgrp *rg;
 	unsigned int block, bn = 0, x = 0, y = 0;
 	unsigned int state;
@@ -546,7 +546,7 @@ uint64_t find_free_blk(struct lgfs2_sbd *sdp)
 	memset(&rg, 0, sizeof(rg));
 	for (n = osi_first(&sdp->rgtree); n; n = next) {
 		next = osi_next(n);
-		rl = (struct rgrp_tree *)n;
+		rl = (struct lgfs2_rgrp_tree *)n;
 		if (rl->rt_free)
 			break;
 	}
diff --git a/gfs2/fsck/util.h b/gfs2/fsck/util.h
index 84e15e40..daef0b86 100644
--- a/gfs2/fsck/util.h
+++ b/gfs2/fsck/util.h
@@ -66,7 +66,7 @@ static inline void link1_destroy(struct gfs2_bmap *bmap)
 
 static inline int bitmap_type(struct lgfs2_sbd *sdp, uint64_t bblock)
 {
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 
 	rgd = lgfs2_blk2rgrpd(sdp, bblock);
 	return lgfs2_get_bitmap(sdp, bblock, rgd);
diff --git a/gfs2/libgfs2/fs_bits.c b/gfs2/libgfs2/fs_bits.c
index 7bcd34b9..3d2ccfe5 100644
--- a/gfs2/libgfs2/fs_bits.c
+++ b/gfs2/libgfs2/fs_bits.c
@@ -174,7 +174,7 @@ int lgfs2_set_bitmap(lgfs2_rgrp_t rgd, uint64_t blkno, int state)
  *
  * Returns: state on success, -1 on error
  */
-int lgfs2_get_bitmap(struct lgfs2_sbd *sdp, uint64_t blkno, struct rgrp_tree *rgd)
+int lgfs2_get_bitmap(struct lgfs2_sbd *sdp, uint64_t blkno, struct lgfs2_rgrp_tree *rgd)
 {
 	uint64_t offset;
 	uint32_t i = 0;
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index 788509f3..f2d178a1 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -107,7 +107,7 @@ void lgfs2_inode_put(struct lgfs2_inode **ip_in)
 	*ip_in = NULL; /* make sure the memory isn't accessed again */
 }
 
-static uint64_t find_free_block(struct rgrp_tree *rgd)
+static uint64_t find_free_block(struct lgfs2_rgrp_tree *rgd)
 {
 	unsigned bm;
 	uint64_t blkno = 0;
@@ -131,7 +131,7 @@ static uint64_t find_free_block(struct rgrp_tree *rgd)
 	return blkno;
 }
 
-static int blk_alloc_in_rg(struct lgfs2_sbd *sdp, unsigned state, struct rgrp_tree *rgd, uint64_t blkno, int dinode)
+static int blk_alloc_in_rg(struct lgfs2_sbd *sdp, unsigned state, struct lgfs2_rgrp_tree *rgd, uint64_t blkno, int dinode)
 {
 	if (blkno == 0)
 		return -1;
@@ -165,12 +165,12 @@ static int block_alloc(struct lgfs2_sbd *sdp, const uint64_t blksreq, int state,
 {
 	int ret;
 	int release = 0;
-	struct rgrp_tree *rgt = NULL;
+	struct lgfs2_rgrp_tree *rgt = NULL;
 	struct osi_node *n = NULL;
 	uint64_t bn = 0;
 
 	for (n = osi_first(&sdp->rgtree); n; n = osi_next(n)) {
-		rgt = (struct rgrp_tree *)n;
+		rgt = (struct lgfs2_rgrp_tree *)n;
 		if (rgt->rt_free >= blksreq)
 			break;
 	}
@@ -1897,7 +1897,7 @@ int lgfs2_lookupi(struct lgfs2_inode *dip, const char *filename, int len,
  */
 void lgfs2_free_block(struct lgfs2_sbd *sdp, uint64_t block)
 {
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 
 	/* Adjust the free space count for the freed block */
 	rgd = lgfs2_blk2rgrpd(sdp, block); /* find the rg for indir block */
@@ -1923,7 +1923,7 @@ int lgfs2_freedi(struct lgfs2_sbd *sdp, uint64_t diblock)
 	struct lgfs2_buffer_head *bh, *nbh;
 	int h, head_size;
 	uint64_t block;
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 	uint32_t height;
 	__be64 *ptr;
 	osi_list_t metalist[GFS2_MAX_META_HEIGHT];
diff --git a/gfs2/libgfs2/lang.c b/gfs2/libgfs2/lang.c
index 2ac59796..0570d8d9 100644
--- a/gfs2/libgfs2/lang.c
+++ b/gfs2/libgfs2/lang.c
@@ -236,7 +236,7 @@ static uint64_t ast_lookup_rgrp(uint64_t rgnum, struct lgfs2_sbd *sbd)
 
 	for (n = osi_first(&sbd->rgtree); n != NULL && i > 0; n = osi_next(n), i--);
 	if (n != NULL && i == 0)
-		return ((struct rgrp_tree *)n)->rt_addr;
+		return ((struct lgfs2_rgrp_tree *)n)->rt_addr;
 	fprintf(stderr, "Resource group number out of range: %"PRIu64"\n", rgnum);
 	return 0;
 }
@@ -365,7 +365,7 @@ static int ast_get_bitstate(uint64_t bn, struct lgfs2_sbd *sbd)
 {
 	int ret = 0;
 	int state = 0;
-	struct rgrp_tree *rgd = lgfs2_blk2rgrpd(sbd, bn);
+	struct lgfs2_rgrp_tree *rgd = lgfs2_blk2rgrpd(sbd, bn);
 	if (rgd == NULL) {
 		fprintf(stderr, "Could not find resource group for block %"PRIu64"\n", bn);
 		return -1;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 625fc017..fc1b273e 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -173,7 +173,7 @@ struct lgfs2_sbd;
 struct lgfs2_inode;
 typedef struct _lgfs2_rgrps *lgfs2_rgrps_t;
 
-struct rgrp_tree {
+struct lgfs2_rgrp_tree {
 	struct osi_node node;
 	struct lgfs2_bitmap *bits;
 	lgfs2_rgrps_t rgrps;
@@ -211,7 +211,7 @@ struct rgrp_tree {
 	};
 };
 
-typedef struct rgrp_tree *lgfs2_rgrp_t;
+typedef struct lgfs2_rgrp_tree *lgfs2_rgrp_t;
 
 extern lgfs2_rgrps_t lgfs2_rgrps_init(struct lgfs2_sbd *sdp, uint64_t align, uint64_t offset);
 extern void lgfs2_rgrps_free(lgfs2_rgrps_t *rgs);
@@ -253,7 +253,7 @@ struct lgfs2_inum {
 struct lgfs2_inode {
 	struct lgfs2_buffer_head *i_bh;
 	struct lgfs2_sbd *i_sbd;
-	struct rgrp_tree *i_rgd; /* performance hint */
+	struct lgfs2_rgrp_tree *i_rgd; /* performance hint */
 	int bh_owned; /* Is this bh owned, iow, should we release it later? */
 
 	/* Native-endian versions of the dinode fields */
@@ -484,7 +484,7 @@ extern unsigned long lgfs2_bitfit(const unsigned char *buffer,
 extern int lgfs2_check_range(struct lgfs2_sbd *sdp, uint64_t blkno);
 
 /* functions with blk #'s that are file system relative */
-extern int lgfs2_get_bitmap(struct lgfs2_sbd *sdp, uint64_t blkno, struct rgrp_tree *rgd);
+extern int lgfs2_get_bitmap(struct lgfs2_sbd *sdp, uint64_t blkno, struct lgfs2_rgrp_tree *rgd);
 extern int lgfs2_set_bitmap(lgfs2_rgrp_t rg, uint64_t blkno, int state);
 
 /* fs_ops.c */
@@ -738,13 +738,13 @@ extern int lgfs2_clean_journal(struct lgfs2_inode *ip, struct lgfs2_log_header *
 /* rgrp.c */
 extern uint32_t lgfs2_rgblocks2bitblocks(const unsigned int bsize, const uint32_t rgblocks,
                                     uint32_t *ri_data) __attribute__((nonnull(3)));
-extern int lgfs2_compute_bitstructs(const uint32_t bsize, struct rgrp_tree *rgd);
-extern struct rgrp_tree *lgfs2_blk2rgrpd(struct lgfs2_sbd *sdp, uint64_t blk);
+extern int lgfs2_compute_bitstructs(const uint32_t bsize, struct lgfs2_rgrp_tree *rgd);
+extern struct lgfs2_rgrp_tree *lgfs2_blk2rgrpd(struct lgfs2_sbd *sdp, uint64_t blk);
 extern int lgfs2_rgrp_crc_check(char *buf);
 extern void lgfs2_rgrp_crc_set(char *buf);
-extern uint64_t lgfs2_rgrp_read(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd);
-extern void lgfs2_rgrp_relse(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd);
-extern struct rgrp_tree *lgfs2_rgrp_insert(struct osi_root *rgtree,
+extern uint64_t lgfs2_rgrp_read(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rgd);
+extern void lgfs2_rgrp_relse(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rgd);
+extern struct lgfs2_rgrp_tree *lgfs2_rgrp_insert(struct osi_root *rgtree,
 				     uint64_t rgblock);
 extern void lgfs2_rgrp_free(struct lgfs2_sbd *sdp, struct osi_root *rgrp_tree);
 
@@ -764,7 +764,7 @@ extern int lgfs2_build_root(struct lgfs2_sbd *sdp);
 extern int lgfs2_init_inum(struct lgfs2_sbd *sdp);
 extern int lgfs2_init_statfs(struct lgfs2_sbd *sdp, struct gfs2_statfs_change *res);
 extern int lgfs2_check_meta(const char *buf, int type);
-extern unsigned lgfs2_bm_scan(struct rgrp_tree *rgd, unsigned idx,
+extern unsigned lgfs2_bm_scan(struct lgfs2_rgrp_tree *rgd, unsigned idx,
 			      uint64_t *buf, uint8_t state);
 extern struct lgfs2_inode *lgfs2_build_inum_range(struct lgfs2_inode *per_node, unsigned int n);
 extern struct lgfs2_inode *lgfs2_build_statfs_change(struct lgfs2_inode *per_node, unsigned int j);
diff --git a/gfs2/libgfs2/rgrp.c b/gfs2/libgfs2/rgrp.c
index 3ec56f08..56ee571a 100644
--- a/gfs2/libgfs2/rgrp.c
+++ b/gfs2/libgfs2/rgrp.c
@@ -35,7 +35,7 @@ static void compute_bitmaps(lgfs2_rgrp_t rg, const unsigned bsize)
  * rgd: The resource group descriptor
  * Returns: 0 on success, -1 on error
  */
-int lgfs2_compute_bitstructs(const uint32_t bsize, struct rgrp_tree *rgd)
+int lgfs2_compute_bitstructs(const uint32_t bsize, struct lgfs2_rgrp_tree *rgd)
 {
 	uint32_t length = rgd->rt_length;
 	uint32_t bytes_left;
@@ -86,14 +86,14 @@ errbits:
  *
  * Returns: Ths resource group, or NULL if not found
  */
-struct rgrp_tree *lgfs2_blk2rgrpd(struct lgfs2_sbd *sdp, uint64_t blk)
+struct lgfs2_rgrp_tree *lgfs2_blk2rgrpd(struct lgfs2_sbd *sdp, uint64_t blk)
 {
-	struct rgrp_tree *rgd = (struct rgrp_tree *)sdp->rgtree.osi_node;
+	struct lgfs2_rgrp_tree *rgd = (struct lgfs2_rgrp_tree *)sdp->rgtree.osi_node;
 	while (rgd) {
 		if (blk < rgd->rt_addr)
-			rgd = (struct rgrp_tree *)rgd->node.osi_left;
+			rgd = (struct lgfs2_rgrp_tree *)rgd->node.osi_left;
 		else if (blk >= rgd->rt_data0 + rgd->rt_data)
-			rgd = (struct rgrp_tree *)rgd->node.osi_right;
+			rgd = (struct lgfs2_rgrp_tree *)rgd->node.osi_right;
 		else
 			return rgd;
 	}
@@ -187,7 +187,7 @@ void lgfs2_rgrp_crc_set(char *buf)
  * @rgd - resource group structure
  * returns: 0 if no error, otherwise the block number that failed
  */
-uint64_t lgfs2_rgrp_read(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd)
+uint64_t lgfs2_rgrp_read(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rgd)
 {
 	unsigned length = rgd->rt_length * sdp->sd_bsize;
 	off_t offset = rgd->rt_addr * sdp->sd_bsize;
@@ -227,7 +227,7 @@ uint64_t lgfs2_rgrp_read(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd)
 	return 0;
 }
 
-void lgfs2_rgrp_relse(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd)
+void lgfs2_rgrp_relse(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rgd)
 {
 	if (rgd->bits == NULL)
 		return;
@@ -250,14 +250,14 @@ void lgfs2_rgrp_relse(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd)
 		rgd->bits[i].bi_data = NULL;
 }
 
-struct rgrp_tree *lgfs2_rgrp_insert(struct osi_root *rgtree, uint64_t rgblock)
+struct lgfs2_rgrp_tree *lgfs2_rgrp_insert(struct osi_root *rgtree, uint64_t rgblock)
 {
 	struct osi_node **newn = &rgtree->osi_node, *parent = NULL;
-	struct rgrp_tree *data;
+	struct lgfs2_rgrp_tree *data;
 
 	/* Figure out where to put new node */
 	while (*newn) {
-		struct rgrp_tree *cur = (struct rgrp_tree *)*newn;
+		struct lgfs2_rgrp_tree *cur = (struct lgfs2_rgrp_tree *)*newn;
 
 		parent = *newn;
 		if (rgblock < cur->rt_addr)
@@ -268,7 +268,7 @@ struct rgrp_tree *lgfs2_rgrp_insert(struct osi_root *rgtree, uint64_t rgblock)
 			return cur;
 	}
 
-	data = calloc(1, sizeof(struct rgrp_tree));
+	data = calloc(1, sizeof(struct lgfs2_rgrp_tree));
 	if (!data)
 		return NULL;
 	/* Add new node and rebalance tree. */
@@ -281,13 +281,13 @@ struct rgrp_tree *lgfs2_rgrp_insert(struct osi_root *rgtree, uint64_t rgblock)
 
 void lgfs2_rgrp_free(struct lgfs2_sbd *sdp, struct osi_root *rgrp_tree)
 {
-	struct rgrp_tree *rgd;
+	struct lgfs2_rgrp_tree *rgd;
 	struct osi_node *n;
 
 	if (OSI_EMPTY_ROOT(rgrp_tree))
 		return;
 	while ((n = osi_first(rgrp_tree))) {
-		rgd = (struct rgrp_tree *)n;
+		rgd = (struct lgfs2_rgrp_tree *)n;
 
 		lgfs2_rgrp_relse(sdp, rgd);
 		free(rgd->bits);
@@ -504,7 +504,7 @@ void lgfs2_rgrps_free(lgfs2_rgrps_t *rgs)
 	lgfs2_rgrp_t rg;
 	struct osi_root *tree = &(*rgs)->root;
 
-	while ((rg = (struct rgrp_tree *)osi_first(tree))) {
+	while ((rg = (struct lgfs2_rgrp_tree *)osi_first(tree))) {
 		int i;
 		free(rg->bits[0].bi_data);
 		for (i = 0; i < rg->rt_length; i++) {
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index d13f67a4..5a1b46d4 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -371,7 +371,7 @@ struct lgfs2_inode *lgfs2_build_rindex(struct lgfs2_sbd *sdp)
 {
 	struct lgfs2_inode *ip;
 	struct osi_node *n, *next = NULL;
-	struct rgrp_tree *rl;
+	struct lgfs2_rgrp_tree *rl;
 	char buf[sizeof(struct gfs2_rindex)];
 	int count;
 
@@ -385,7 +385,7 @@ struct lgfs2_inode *lgfs2_build_rindex(struct lgfs2_sbd *sdp)
 
 	for (n = osi_first(&sdp->rgtree); n; n = next) {
 		next = osi_next(n);
-		rl = (struct rgrp_tree *)n;
+		rl = (struct lgfs2_rgrp_tree *)n;
 
 		lgfs2_rindex_out(rl, buf);
 
@@ -497,7 +497,7 @@ int lgfs2_check_meta(const char *buf, int type)
 	return 0;
 }
 
-unsigned lgfs2_bm_scan(struct rgrp_tree *rgd, unsigned idx, uint64_t *buf, uint8_t state)
+unsigned lgfs2_bm_scan(struct lgfs2_rgrp_tree *rgd, unsigned idx, uint64_t *buf, uint8_t state)
 {
 	struct lgfs2_bitmap *bi = &rgd->bits[idx];
 	unsigned n = 0;
diff --git a/gfs2/libgfs2/super.c b/gfs2/libgfs2/super.c
index d42bdb03..5da262c3 100644
--- a/gfs2/libgfs2/super.c
+++ b/gfs2/libgfs2/super.c
@@ -146,7 +146,7 @@ int lgfs2_read_sb(struct lgfs2_sbd *sdp)
  *
  * Returns: 1 if the rgd seems relatively sane
  */
-static int rgd_seems_ok(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd)
+static int rgd_seems_ok(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rgd)
 {
 	uint32_t most_bitmaps_possible;
 
@@ -179,7 +179,7 @@ static int rgd_seems_ok(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd)
  * If not, we count it as not sane, and therefore, the whole rindex is not to
  * be trusted by fsck.gfs2.
  */
-static int good_on_disk(struct lgfs2_sbd *sdp, struct rgrp_tree *rgd)
+static int good_on_disk(struct lgfs2_sbd *sdp, struct lgfs2_rgrp_tree *rgd)
 {
 	struct lgfs2_buffer_head *bh;
 	int is_rgrp;
@@ -202,7 +202,7 @@ int lgfs2_rindex_read(struct lgfs2_sbd *sdp, uint64_t *rgcount, int *ok)
 {
 	unsigned int rg;
 	int error;
-	struct rgrp_tree *rgd = NULL, *prev_rgd = NULL;
+	struct lgfs2_rgrp_tree *rgd = NULL, *prev_rgd = NULL;
 	uint64_t prev_length = 0;
 
 	*ok = 1;
-- 
2.34.1

