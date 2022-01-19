Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8714938D4
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:46:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589204;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vLMFqi+JOjQjBwmIDUEZRI3Q+ofUos+z29Y9EZJgJ8M=;
	b=UmwnH6lfgNLaDAspXfA4PEjxr2PPOwH/+q64Wr3AcvSlzG7jjDrAHnJc4DTFjmryQmaavn
	JOOzn2bhvvq5PP0XLtSYtIQkorGjiX6Yx5uZHLSHSbJzUcMOcmh0U7wJ883/OztYTZos7H
	G4e+Svj5aVidRUwIwJ7GEMPQpOSiU/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-zY6tmlnmMLKajMQg6m2wrA-1; Wed, 19 Jan 2022 05:46:41 -0500
X-MC-Unique: zY6tmlnmMLKajMQg6m2wrA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBCB51B2C981;
	Wed, 19 Jan 2022 10:46:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC46B752B7;
	Wed, 19 Jan 2022 10:46:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3ABC1806D2B;
	Wed, 19 Jan 2022 10:46:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAhY9P024181 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:43:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 319137A221; Wed, 19 Jan 2022 10:43:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32E05795B7
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:43:33 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:42:58 +0000
Message-Id: <20220119104316.2489995-4-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 03/21] libgfs2: Namespace improvements -
	fs_ops.c
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

Use the lgfs2_ prefix in libgfs2 interface names.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c   | 100 ++++++++++-----------
 gfs2/edit/extended.c          |  24 ++---
 gfs2/edit/hexedit.c           |   8 +-
 gfs2/edit/journal.c           |  10 +--
 gfs2/edit/savemeta.c          |   6 +-
 gfs2/fsck/afterpass1_common.c |   2 +-
 gfs2/fsck/fs_recovery.c       |  24 ++---
 gfs2/fsck/initialize.c        |  82 ++++++++---------
 gfs2/fsck/lost_n_found.c      |  14 +--
 gfs2/fsck/main.c              |  22 ++---
 gfs2/fsck/metawalk.c          |   6 +-
 gfs2/fsck/pass1.c             |  28 +++---
 gfs2/fsck/pass2.c             |  46 +++++-----
 gfs2/fsck/pass3.c             |   4 +-
 gfs2/fsck/rgrepair.c          |  10 +--
 gfs2/fsck/util.c              |   2 +-
 gfs2/glocktop/glocktop.c      |   8 +-
 gfs2/libgfs2/fs_ops.c         | 161 +++++++++++++++++-----------------
 gfs2/libgfs2/gfs1.c           |   8 +-
 gfs2/libgfs2/gfs2l.c          |   6 +-
 gfs2/libgfs2/lang.c           |   6 +-
 gfs2/libgfs2/libgfs2.h        |  55 ++++++------
 gfs2/libgfs2/recovery.c       |   4 +-
 gfs2/libgfs2/rgrp.c           |   2 +-
 gfs2/libgfs2/structures.c     |  52 +++++------
 gfs2/libgfs2/super.c          |   2 +-
 gfs2/mkfs/main_mkfs.c         |  24 ++---
 tests/nukerg.c                |   8 +-
 28 files changed, 361 insertions(+), 363 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 5bfe8acd..bef0cf6f 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -183,7 +183,7 @@ static int convert_rgs(struct gfs2_sbd *sbp)
 /* ------------------------------------------------------------------------- */
 /* calc_gfs2_tree_height - calculate new dinode height as if this is gfs2    */
 /*                                                                           */
-/* This is similar to calc_tree_height in libgfs2 but at the point this      */
+/* This is similar to lgfs2_calc_tree_height in libgfs2 but at the point this      */
 /* function is called, I have the wrong (gfs1 not gfs2) constants in place.  */
 /* ------------------------------------------------------------------------- */
 static unsigned int calc_gfs2_tree_height(struct gfs2_inode *ip, uint64_t size)
@@ -254,7 +254,7 @@ static void mp_gfs1_to_gfs2(struct gfs2_sbd *sbp, int gfs1_h, int gfs2_h,
 
 /* ------------------------------------------------------------------------- */
 /* fix_metatree - Fix up the metatree to match the gfs2 metapath info        */
-/*                Similar to gfs2_writei in libgfs2 but we're only           */
+/*                Similar to lgfs2_writei in libgfs2 but we're only           */
 /*                interested in rearranging the metadata while leaving the   */
 /*                actual data blocks intact.                                 */
 /* ------------------------------------------------------------------------- */
@@ -273,7 +273,7 @@ static void fix_metatree(struct gfs2_sbd *sbp, struct gfs2_inode *ip,
 	mh.mh_type = cpu_to_be32(GFS2_METATYPE_IN);
 	mh.mh_format = cpu_to_be32(GFS2_FORMAT_IN);
 	if (!ip->i_height)
-		unstuff_dinode(ip);
+		lgfs2_unstuff_dinode(ip);
 
 	ptramt = blk->mp.mp_list[blk->height] * sizeof(uint64_t);
 	amount = size;
@@ -283,7 +283,7 @@ static void fix_metatree(struct gfs2_sbd *sbp, struct gfs2_inode *ip,
 		/* First, build up the metatree */
 		for (h = 0; h < blk->height; h++) {
 			new = 0;
-			lookup_block(ip, bh, h, &blk->mp, 1, &new, &block);
+			lgfs2_lookup_block(ip, bh, h, &blk->mp, 1, &new, &block);
 			if (bh != ip->i_bh)
 				lgfs2_brelse(bh);
 			if (!block)
@@ -431,7 +431,7 @@ static uint64_t fix_jdatatree(struct gfs2_sbd *sbp, struct gfs2_inode *ip,
 	mh.mh_format = cpu_to_be32(GFS2_FORMAT_IN);
 
 	if (!ip->i_height)
-		unstuff_dinode(ip);
+		lgfs2_unstuff_dinode(ip);
 
 	ptramt = blk->mp.mp_list[blk->height];
 	amount = size;
@@ -441,7 +441,7 @@ static uint64_t fix_jdatatree(struct gfs2_sbd *sbp, struct gfs2_inode *ip,
 		/* First, build up the metatree */
 		for (h = 0; h < blk->height; h++) {
 			new = 0;
-			lookup_block(ip, bh, h, &blk->mp, 1, &new, &block);
+			lgfs2_lookup_block(ip, bh, h, &blk->mp, 1, &new, &block);
 			if (bh != ip->i_bh)
 				lgfs2_brelse(bh);
 			if (!block)
@@ -563,7 +563,7 @@ static int get_inode_metablocks(struct gfs2_sbd *sbp, struct gfs2_inode *ip, str
 			/* Free the block so we can reuse it. This allows us to
 			   convert a "full" file system. */
 			ip->i_blocks--;
-			gfs2_free_block(sbp, block);
+			lgfs2_free_block(sbp, block);
 		}
 	}
 	return 0;
@@ -665,7 +665,7 @@ static int fix_ind_jdata(struct gfs2_sbd *sbp, struct gfs2_inode *ip, uint32_t d
 		/* Free the block so we can reuse it. This allows us to
 		   convert a "full" file system */
 		ip->i_blocks--;
-		gfs2_free_block(sbp, block);
+		lgfs2_free_block(sbp, block);
 
 		len = bufsize;
 		jdata_mp_gfs1_to_gfs2(sbp, di_height, gfs2_hgt, &newblk->mp, &gfs2mp,
@@ -941,11 +941,11 @@ static int adjust_inode(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh)
 	}
 
 	lgfs2_bmodified(inode->i_bh);
-	inode_put(&inode); /* does gfs2_dinode_out if modified */
+	lgfs2_inode_put(&inode); /* does gfs2_dinode_out if modified */
 	sbp->md.next_inum++; /* update inode count */
 	return 0;
 err_freei:
-	inode_put(&inode);
+	lgfs2_inode_put(&inode);
 	return -1;
 } /* adjust_inode */
 
@@ -1112,7 +1112,7 @@ static int fetch_inum(struct gfs2_sbd *sbp, uint64_t iblock,
 	if (eablk)
 		*eablk = fix_inode->i_eattr;
 
-	inode_put(&fix_inode);
+	lgfs2_inode_put(&fix_inode);
 	return 0;
 }/* fetch_inum */
 
@@ -1131,7 +1131,7 @@ static int process_dirent_info(struct gfs2_inode *dip, struct gfs2_sbd *sbp,
 	struct gfs2_dirent *dent;
 	int de; /* directory entry index */
 	
-	error = gfs2_dirent_first(dip, bh, &dent);
+	error = lgfs2_dirent_first(dip, bh, &dent);
 	if (error != IS_LEAF && error != IS_DINODE) {
 		log_crit(_("Error retrieving directory.\n"));
 		return -1;
@@ -1226,7 +1226,7 @@ static int process_dirent_info(struct gfs2_inode *dip, struct gfs2_sbd *sbp,
 		}
 
 	skip_next:
-		error = gfs2_dirent_next(dip, bh, &dent);
+		error = lgfs2_dirent_next(dip, bh, &dent);
 		if (error) {
 			if (error == -ENOENT) /* beyond the end of this bh */
 				error = 0;
@@ -1257,7 +1257,7 @@ static int fix_one_directory_exhash(struct gfs2_sbd *sbp, struct gfs2_inode *dip
 		struct gfs2_leaf *leaf;
 		__be64 buf;
 
-		error = gfs2_readi(dip, (char *)&buf, leaf_num * sizeof(uint64_t),
+		error = lgfs2_readi(dip, (char *)&buf, leaf_num * sizeof(uint64_t),
 						   sizeof(uint64_t));
 		if (!error) /* end of file */
 			return 0; /* success */
@@ -1276,7 +1276,7 @@ static int fix_one_directory_exhash(struct gfs2_sbd *sbp, struct gfs2_inode *dip
 
 		prev_leaf_block = leaf_block;
 		/* read the leaf buffer in */
-		error = gfs2_get_leaf(dip, leaf_block, &bh_leaf);
+		error = lgfs2_get_leaf(dip, leaf_block, &bh_leaf);
 		if (error) {
 			log_crit(_("Error reading leaf %"PRIu64"\n"), leaf_block);
 			break;
@@ -1308,19 +1308,19 @@ static int process_directory(struct gfs2_sbd *sbp, uint64_t dirblock, uint64_t d
 	if (dip->i_flags & GFS2_DIF_EXHASH) {
 		if (fix_one_directory_exhash(sbp, dip, dentmod)) {
 			log_crit(_("Error fixing exhash directory.\n"));
-			inode_put(&dip);
+			lgfs2_inode_put(&dip);
 			return -1;
 		}
 	} else {
 		error = process_dirent_info(dip, sbp, dip->i_bh, dip->i_entries, dentmod);
 		if (error && error != -EISDIR) {
 			log_crit(_("Error fixing linear directory.\n"));
-			inode_put(&dip);
+			lgfs2_inode_put(&dip);
 			return -1;
 		}
 	}
 	lgfs2_bmodified(dip->i_bh);
-	inode_put(&dip);
+	lgfs2_inode_put(&dip);
 	return 0;
 }
 /* ------------------------------------------------------------------------- */
@@ -1404,7 +1404,7 @@ static int fix_cdpn_symlinks(struct gfs2_sbd *sbp, osi_list_t *cdpn_to_fix)
 		}
 
 		/* initialize the symlink inode to be a directory */
-		error = init_dinode(sbp, &bh, &fix, S_IFDIR | 0755, 0, &dir);
+		error = lgfs2_init_dinode(sbp, &bh, &fix, S_IFDIR | 0755, 0, &dir);
 		if (error != 0)
 			return -1;
 
@@ -1412,7 +1412,7 @@ static int fix_cdpn_symlinks(struct gfs2_sbd *sbp, osi_list_t *cdpn_to_fix)
 		if (fix_inode == NULL)
 			return -1;
 		fix_inode->i_eattr = eablk; /*fix extended attribute */
-		inode_put(&fix_inode);
+		lgfs2_inode_put(&fix_inode);
 		lgfs2_bmodified(bh);
 		lgfs2_brelse(bh);
 
@@ -1455,7 +1455,7 @@ static int read_gfs1_jiindex(struct gfs2_sbd *sdp)
 		return -1;
 	}
 	/* ugly hack
-	 * Faking the gfs1_jindex inode as a directory to gfs2_readi
+	 * Faking the gfs1_jindex inode as a directory to lgfs2_readi
 	 * so it skips the metaheader struct in the data blocks
 	 * in the inode. gfs2_jindex inode doesn't have metaheaders
 	 * in the data blocks */
@@ -1465,7 +1465,7 @@ static int read_gfs1_jiindex(struct gfs2_sbd *sdp)
 	for (j = 0; ; j++) {
 		uint32_t nseg;
 
-		error = gfs2_readi(ip, buf, j * sizeof(struct gfs_jindex),
+		error = lgfs2_readi(ip, buf, j * sizeof(struct gfs_jindex),
 						   sizeof(struct gfs_jindex));
 		if(!error)
 			break;
@@ -1674,8 +1674,8 @@ static int init(struct gfs2_sbd *sbp, struct gfs2_options *opts)
 	}
 	printf("\n");
 	fflush(stdout);
-	inode_put(&sbp->md.riinode);
-	inode_put(&sbp->md.jiinode);
+	lgfs2_inode_put(&sbp->md.riinode);
+	lgfs2_inode_put(&sbp->md.jiinode);
 	log_debug(_("%d rgs found.\n"), rgcount);
 	return 0;
 }/* fill_super_block */
@@ -1901,7 +1901,7 @@ static void update_inode_file(struct gfs2_sbd *sdp)
 	int count;
 
 	buf = cpu_to_be64(sdp->md.next_inum);
-	count = gfs2_writei(ip, &buf, 0, sizeof(uint64_t));
+	count = lgfs2_writei(ip, &buf, 0, sizeof(uint64_t));
 	if (count != sizeof(uint64_t)) {
 		fprintf(stderr, "update_inode_file\n");
 		exit(1);
@@ -1923,7 +1923,7 @@ static void write_statfs_file(struct gfs2_sbd *sdp)
 	sc.sc_free = cpu_to_be64(sdp->blks_total - sdp->blks_alloced);
 	sc.sc_dinodes = cpu_to_be64(sdp->dinodes_alloced);
 
-	count = gfs2_writei(ip, &sc, 0, sizeof(sc));
+	count = lgfs2_writei(ip, &sc, 0, sizeof(sc));
 	if (count != sizeof(sc)) {
 		fprintf(stderr, "Failed to write statfs file\n");
 		exit(1);
@@ -1941,19 +1941,19 @@ static void remove_obsolete_gfs1(struct gfs2_sbd *sbp)
 	fflush(stdout);
 	/* Delete the old gfs1 Journal index: */
 	lgfs2_inum_in(&inum, &gfs1_sb.sb_jindex_di);
-	gfs2_freedi(sbp, inum.in_addr);
+	lgfs2_freedi(sbp, inum.in_addr);
 
 	/* Delete the old gfs1 rgindex: */
 	lgfs2_inum_in(&inum, &gfs1_sb.sb_rindex_di);
-	gfs2_freedi(sbp, inum.in_addr);
+	lgfs2_freedi(sbp, inum.in_addr);
 
 	/* Delete the old gfs1 Quota file: */
 	lgfs2_inum_in(&inum, &gfs1_sb.sb_quota_di);
-	gfs2_freedi(sbp, inum.in_addr);
+	lgfs2_freedi(sbp, inum.in_addr);
 
 	/* Delete the old gfs1 License file: */
 	lgfs2_inum_in(&inum, &gfs1_sb.sb_license_di);
-	gfs2_freedi(sbp, inum.in_addr);
+	lgfs2_freedi(sbp, inum.in_addr);
 }
 
 /* ------------------------------------------------------------------------- */
@@ -1963,7 +1963,7 @@ static int conv_build_jindex(struct gfs2_sbd *sdp)
 {
 	unsigned int j;
 
-	sdp->md.jiinode = createi(sdp->master_dir, "jindex", S_IFDIR | 0700,
+	sdp->md.jiinode = lgfs2_createi(sdp->master_dir, "jindex", S_IFDIR | 0700,
 				  GFS2_DIF_SYSTEM);
 	if (sdp->md.jiinode == NULL) {
 		return errno;
@@ -1980,17 +1980,17 @@ static int conv_build_jindex(struct gfs2_sbd *sdp)
 		printf(_("Writing journal #%d..."), j + 1);
 		fflush(stdout);
 		sprintf(name, "journal%u", j);
-		sdp->md.journal[j] = createi(sdp->md.jiinode, name, S_IFREG |
+		sdp->md.journal[j] = lgfs2_createi(sdp->md.jiinode, name, S_IFREG |
 					     0600, GFS2_DIF_SYSTEM);
 		lgfs2_write_journal(sdp->md.journal[j], sdp->sd_bsize,
 		                    sdp->jsize << 20 >> sdp->sd_bsize_shift);
-		inode_put(&sdp->md.journal[j]);
+		lgfs2_inode_put(&sdp->md.journal[j]);
 		printf(_("done.\n"));
 		fflush(stdout);
 	}
 
 	free(sdp->md.journal);
-	inode_put(&sdp->md.jiinode);
+	lgfs2_inode_put(&sdp->md.jiinode);
 	return 0;
 }
 
@@ -2091,7 +2091,7 @@ static int build_per_node(struct gfs2_sbd *sdp)
 	struct gfs2_inode *per_node;
 	unsigned int j;
 
-	per_node = createi(sdp->master_dir, "per_node", S_IFDIR | 0700,
+	per_node = lgfs2_createi(sdp->master_dir, "per_node", S_IFDIR | 0700,
 			   GFS2_DIF_SYSTEM);
 	if (per_node == NULL) {
 		log_crit(_("Error building '%s': %s\n"), "per_node", strerror(errno));
@@ -2106,7 +2106,7 @@ static int build_per_node(struct gfs2_sbd *sdp)
 			         strerror(errno));
 			return 1;
 		}
-		inode_put(&ip);
+		lgfs2_inode_put(&ip);
 
 		ip = lgfs2_build_statfs_change(per_node, j);
 		if (ip == NULL) {
@@ -2114,7 +2114,7 @@ static int build_per_node(struct gfs2_sbd *sdp)
 			         strerror(errno));
 			return 1;
 		}
-		inode_put(&ip);
+		lgfs2_inode_put(&ip);
 
 		ip = lgfs2_build_quota_change(per_node, j);
 		if (ip == NULL) {
@@ -2122,9 +2122,9 @@ static int build_per_node(struct gfs2_sbd *sdp)
 			         strerror(errno));
 			return 1;
 		}
-		inode_put(&ip);
+		lgfs2_inode_put(&ip);
 	}
-	inode_put(&per_node);
+	lgfs2_inode_put(&per_node);
 	return 0;
 }
 
@@ -2139,7 +2139,7 @@ static void copy_quotas(struct gfs2_sbd *sdp)
 	struct gfs2_inode *oq_ip, *nq_ip;
 	int err;
 
-	err = gfs2_lookupi(sdp->master_dir, "quota", 5, &nq_ip);
+	err = lgfs2_lookupi(sdp->master_dir, "quota", 5, &nq_ip);
 	if (err) {
 		fprintf(stderr, _("Couldn't lookup new quota file: %d\n"), err);
 		exit(1);
@@ -2163,10 +2163,10 @@ static void copy_quotas(struct gfs2_sbd *sdp)
 	oq_ip->i_size = 0;
 
 	lgfs2_bmodified(nq_ip->i_bh);
-	inode_put(&nq_ip);
+	lgfs2_inode_put(&nq_ip);
 
 	lgfs2_bmodified(oq_ip->i_bh);
-	inode_put(&oq_ip);
+	lgfs2_inode_put(&oq_ip);
 }
 
 static int gfs2_query(struct gfs2_options *opts, const char *dev)
@@ -2314,7 +2314,7 @@ int main(int argc, char **argv)
 			log_notice(_("Reduced journal size to %u MB to accommodate "
 				   "GFS2 file system structures.\n"), sb2.jsize);
 		/* Build the master subdirectory. */
-		lgfs2_build_master(&sb2); /* Does not do inode_put */
+		lgfs2_build_master(&sb2); /* Does not do lgfs2_inode_put */
 		sb2.sd_meta_dir = sb2.master_dir->i_num;
 		/* Build empty journal index file. */
 		error = conv_build_jindex(&sb2);
@@ -2331,14 +2331,14 @@ int main(int argc, char **argv)
 			exit(-1);
 		}
 		/* Create the empty inode number file */
-		sb2.md.inum = lgfs2_build_inum(&sb2); /* Does not do inode_put */
+		sb2.md.inum = lgfs2_build_inum(&sb2); /* Does not do lgfs2_inode_put */
 		if (sb2.md.inum == NULL) {
 			log_crit(_("Error building inum inode: %s\n"),
 			         strerror(error));
 			exit(-1);
 		}
 		/* Create the statfs file */
-		sb2.md.statfs = lgfs2_build_statfs(&sb2); /* Does not do inode_put */
+		sb2.md.statfs = lgfs2_build_statfs(&sb2); /* Does not do lgfs2_inode_put */
 		if (sb2.md.statfs == NULL) {
 			log_crit(_("Error building statfs inode: %s\n"),
 			         strerror(error));
@@ -2353,7 +2353,7 @@ int main(int argc, char **argv)
 			         strerror(errno));
 			exit(-1);
 		}
-		inode_put(&ip);
+		lgfs2_inode_put(&ip);
 		/* Create the quota file */
 		ip = lgfs2_build_quota(&sb2);
 		if (ip == NULL) {
@@ -2361,7 +2361,7 @@ int main(int argc, char **argv)
 			         strerror(error));
 			exit(-1);
 		}
-		inode_put(&ip);
+		lgfs2_inode_put(&ip);
 
 		/* Copy out the master dinode */
 		if (sb2.master_dir->i_bh->b_modified)
@@ -2375,9 +2375,9 @@ int main(int argc, char **argv)
 
 		write_statfs_file(&sb2);
 
-		inode_put(&sb2.master_dir);
-		inode_put(&sb2.md.inum);
-		inode_put(&sb2.md.statfs);
+		lgfs2_inode_put(&sb2.master_dir);
+		lgfs2_inode_put(&sb2.md.inum);
+		lgfs2_inode_put(&sb2.md.statfs);
 
 		fsync(sb2.device_fd); /* write the buffers to disk */
 
diff --git a/gfs2/edit/extended.c b/gfs2/edit/extended.c
index 89720a53..ee410220 100644
--- a/gfs2/edit/extended.c
+++ b/gfs2/edit/extended.c
@@ -433,7 +433,7 @@ static int print_gfs_jindex(struct gfs2_inode *dij)
 	eol(0);
 	lines_per_row[dmode] = 4;
 	for (print_entry_ndx=0; ; print_entry_ndx++) {
-		error = gfs2_readi(dij, (void *)&jbuf,
+		error = lgfs2_readi(dij, (void *)&jbuf,
 				   print_entry_ndx*sizeof(struct gfs_jindex),
 				   sizeof(struct gfs_jindex));
 		ji = (struct gfs_jindex *)jbuf;
@@ -484,7 +484,7 @@ static int print_gfs2_jindex(void)
 				print_gfs2("dirty.");
 		}
 		eol(0);
-		inode_put(&ip);
+		lgfs2_inode_put(&ip);
 	}
 	return 0;
 }
@@ -508,7 +508,7 @@ static int parse_rindex(struct gfs2_inode *dip, int print_rindex)
 
 		roff = print_entry_ndx * sizeof(struct gfs2_rindex);
 
-		error = gfs2_readi(dip, &ri, roff, sizeof(struct gfs2_rindex));
+		error = lgfs2_readi(dip, &ri, roff, sizeof(struct gfs2_rindex));
 		if (!error) /* end of file */
 			break;
 		lgfs2_rindex_in(&rg, &ri);
@@ -556,7 +556,7 @@ static int print_inum(struct gfs2_inode *dii)
 	__be64 inum;
 	int rc;
 	
-	rc = gfs2_readi(dii, (void *)&inum, 0, sizeof(inum));
+	rc = lgfs2_readi(dii, (void *)&inum, 0, sizeof(inum));
 	if (!rc) {
 		print_gfs2("The inum file is empty.");
 		eol(0);
@@ -578,7 +578,7 @@ static int print_statfs(struct gfs2_inode *dis)
 	struct gfs2_statfs_change sc;
 	int rc;
 
-	rc = gfs2_readi(dis, (void *)&sc, 0, sizeof(sc));
+	rc = lgfs2_readi(dis, (void *)&sc, 0, sizeof(sc));
 	if (!rc) {
 		print_gfs2("The statfs file is empty.");
 		eol(0);
@@ -605,7 +605,7 @@ static int print_quota(struct gfs2_inode *diq)
 	print_gfs2("quota entries found: %"PRIu64".", diq->i_size / sizeof(q));
 	eol(0);
 	for (i=0; ; i++) {
-		error = gfs2_readi(diq, &q, i * sizeof(q), sizeof(q));
+		error = lgfs2_readi(diq, &q, i * sizeof(q), sizeof(q));
 		if (!error)
 			break;
 		if (error != sizeof(q)) {
@@ -633,7 +633,7 @@ int display_extended(void)
 		if (tmp_inode == NULL)
 			return -1;
 		parse_rindex(tmp_inode, TRUE);
-		inode_put(&tmp_inode);
+		lgfs2_inode_put(&tmp_inode);
 		lgfs2_brelse(tmp_bh);
 	} else if (block_is_journals(block)) {
 		if (sbd.gfs1)
@@ -655,7 +655,7 @@ int display_extended(void)
 		if (tmp_inode == NULL)
 			return -1;
 		parse_rindex(tmp_inode, FALSE);
-		inode_put(&tmp_inode);
+		lgfs2_inode_put(&tmp_inode);
 		lgfs2_brelse(tmp_bh);
 	} else if (block_is_jindex(block)) {
 		tmp_bh = lgfs2_bread(&sbd, block);
@@ -663,7 +663,7 @@ int display_extended(void)
 		if (tmp_inode == NULL)
 			return -1;
 		print_gfs_jindex(tmp_inode);
-		inode_put(&tmp_inode);
+		lgfs2_inode_put(&tmp_inode);
 		lgfs2_brelse(tmp_bh);
 	}
 	else if (block_is_inum_file(block)) {
@@ -672,7 +672,7 @@ int display_extended(void)
 		if (tmp_inode == NULL)
 			return -1;
 		print_inum(tmp_inode);
-		inode_put(&tmp_inode);
+		lgfs2_inode_put(&tmp_inode);
 		lgfs2_brelse(tmp_bh);
 	}
 	else if (block_is_statfs_file(block)) {
@@ -681,7 +681,7 @@ int display_extended(void)
 		if (tmp_inode == NULL)
 			return -1;
 		print_statfs(tmp_inode);
-		inode_put(&tmp_inode);
+		lgfs2_inode_put(&tmp_inode);
 		lgfs2_brelse(tmp_bh);
 	}
 	else if (block_is_quota_file(block)) {
@@ -690,7 +690,7 @@ int display_extended(void)
 		if (tmp_inode == NULL)
 			return -1;
 		print_quota(tmp_inode);
-		inode_put(&tmp_inode);
+		lgfs2_inode_put(&tmp_inode);
 		lgfs2_brelse(tmp_bh);
 	}
 	return 0;
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index 5521bf30..22e70830 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -692,7 +692,7 @@ static void rgcount(void)
 {
 	printf("%"PRId64" RGs in this file system.\n",
 	       sbd.md.riinode->i_size / sizeof(struct gfs2_rindex));
-	inode_put(&sbd.md.riinode);
+	lgfs2_inode_put(&sbd.md.riinode);
 	gfs2_rgrp_free(&sbd, &sbd.rgtree);
 	exit(EXIT_SUCCESS);
 }
@@ -715,7 +715,7 @@ static uint64_t find_rgrp_block(struct gfs2_inode *dif, int rg)
 			sizeof(struct gfs2_meta_header);
 		gfs1_adj += sizeof(struct gfs2_meta_header);
 	}
-	amt = gfs2_readi(dif, &ri, foffset + gfs1_adj, sizeof(ri));
+	amt = lgfs2_readi(dif, &ri, foffset + gfs1_adj, sizeof(ri));
 	if (!amt) /* end of file */
 		return 0;
 	return be64_to_cpu(ri.ri_addr);
@@ -741,7 +741,7 @@ static uint64_t get_rg_addr(int rgnum)
 	else
 		fprintf(stderr, "Error: File system only has %"PRId64" RGs.\n",
 			riinode->i_size / sizeof(struct gfs2_rindex));
-	inode_put(&riinode);
+	lgfs2_inode_put(&riinode);
 	return rgblk;
 }
 
@@ -925,7 +925,7 @@ static void read_superblock(int fd)
 		if (sbd.master_dir == NULL) {
 			sbd.md.riinode = NULL;
 		} else {
-			gfs2_lookupi(sbd.master_dir, "rindex", 6, &sbd.md.riinode);
+			lgfs2_lookupi(sbd.master_dir, "rindex", 6, &sbd.md.riinode);
 		}
 	}
 	lgfs2_brelse(bh);
diff --git a/gfs2/edit/journal.c b/gfs2/edit/journal.c
index 29986c3e..91d0a925 100644
--- a/gfs2/edit/journal.c
+++ b/gfs2/edit/journal.c
@@ -60,14 +60,14 @@ uint64_t find_journal_block(const char *journal, uint64_t *j_size)
 		jiinode = lgfs2_inode_get(&sbd, jindex_bh);
 		if (jiinode == NULL)
 			return 0;
-		amtread = gfs2_readi(jiinode, &jidx,
+		amtread = lgfs2_readi(jiinode, &jidx,
 				   journal_num * sizeof(struct gfs_jindex),
 				   sizeof(struct gfs_jindex));
 		if (amtread) {
 			jblock = be64_to_cpu(jidx.ji_addr);
 			*j_size = (uint64_t)be32_to_cpu(jidx.ji_nsegment) * 0x10;
 		}
-		inode_put(&jiinode);
+		lgfs2_inode_put(&jiinode);
 	} else {
 		struct gfs2_dinode *jdi;
 
@@ -99,7 +99,7 @@ static void check_journal_wrap(uint64_t seq, uint64_t *highest_seq)
 }
 
 /**
- * fsck_readi - same as libgfs2's gfs2_readi, but sets absolute block #
+ * fsck_readi - same as libgfs2's lgfs2_readi, but sets absolute block #
  *              of the first bit of data read.
  */
 static int fsck_readi(struct gfs2_inode *ip, void *rbuf, uint64_t roffset,
@@ -144,7 +144,7 @@ static int fsck_readi(struct gfs2_inode *ip, void *rbuf, uint64_t roffset,
 		if (amount > sdp->sd_bsize - o)
 			amount = sdp->sd_bsize - o;
 		if (!extlen)
-			block_map(ip, lblock, &not_new, &dblock, &extlen,
+			lgfs2_block_map(ip, lblock, &not_new, &dblock, &extlen,
 				  FALSE);
 		if (dblock) {
 			lbh = lgfs2_bread(sdp, dblock);
@@ -643,7 +643,7 @@ void dump_journal(const char *journal, uint64_t tblk)
 		}
 	}
 	if (j_inode != NULL)
-		inode_put(&j_inode);
+		lgfs2_inode_put(&j_inode);
 	lgfs2_brelse(j_bh);
 	blockhist = -1; /* So we don't print anything else */
 	free(jbuf);
diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 941472aa..3b2152df 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -278,7 +278,7 @@ static int init_per_node_lookup(void)
 	}
 
 	do_dinode_extended(per_node_di->i_bh->b_data);
-	inode_put(&per_node_di);
+	lgfs2_inode_put(&per_node_di);
 
 	for (i = 0; i < indirect_blocks; i++) {
 		int d;
@@ -956,10 +956,10 @@ static void get_journal_inode_blocks(void)
 				fprintf(stderr, "Error reading journal inode: %s\n", strerror(errno));
 				return;
 			}
-			amt = gfs2_readi(j_inode, (void *)&jbuf,
+			amt = lgfs2_readi(j_inode, (void *)&jbuf,
 					 journal * sizeof(struct gfs_jindex),
 					 sizeof(struct gfs_jindex));
-			inode_put(&j_inode);
+			lgfs2_inode_put(&j_inode);
 			if (!amt)
 				break;
 			ji = (struct gfs_jindex *)jbuf;
diff --git a/gfs2/fsck/afterpass1_common.c b/gfs2/fsck/afterpass1_common.c
index 952275a0..04249e10 100644
--- a/gfs2/fsck/afterpass1_common.c
+++ b/gfs2/fsck/afterpass1_common.c
@@ -123,7 +123,7 @@ static int remove_dentry(struct gfs2_inode *ip, struct gfs2_dirent *dent,
 	lgfs2_dirent_in(&d, dent);
 
 	if (d.dr_inum.in_addr == *dentryblock)
-		dirent2_del(ip, bh, prev_de, dent);
+		lgfs2_dirent2_del(ip, bh, prev_de, dent);
 	else
 		(*count)++;
 
diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index f8e4403e..6f186c92 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -427,7 +427,7 @@ static int check_journal_seq_no(struct gfs2_inode *ip, int fix)
 		highest_seq++;
 		prev_seq = highest_seq;
 		log_warn(_("Renumbering it as 0x%"PRIx64"\n"), highest_seq);
-		block_map(ip, blk, &new, &dblock, NULL, 0);
+		lgfs2_block_map(ip, blk, &new, &dblock, NULL, 0);
 		bh = lgfs2_bread(ip->i_sbd, dblock);
 		((struct gfs2_log_header *)bh->b_data)->lh_sequence = cpu_to_be64(highest_seq);
 		lgfs2_bmodified(bh);
@@ -692,7 +692,7 @@ int replay_journals(struct gfs2_sbd *sdp, int preen, int force_check,
 			if (error)
 				/* Don't use fsck_inode_put here because it's a
 				   system file and we need to dismantle it. */
-				inode_put(&sdp->md.journal[i]);
+				lgfs2_inode_put(&sdp->md.journal[i]);
 			error = 0; /* bad journal is non-fatal */
 		}
 		if (!sdp->md.journal[i]) {
@@ -768,7 +768,7 @@ int ji_update(struct gfs2_sbd *sdp)
 		if (sdp->gfs1) {
 			struct gfs_jindex *ji;
 
-			error = gfs2_readi(ip,
+			error = lgfs2_readi(ip,
 					   buf, i * sizeof(struct gfs_jindex),
 					   sizeof(struct gfs_jindex));
 			if (!error)
@@ -786,7 +786,7 @@ int ji_update(struct gfs2_sbd *sdp)
 			/* FIXME check snprintf return code */
 			snprintf(journal_name, JOURNAL_NAME_SIZE,
 				 "journal%u", i);
-			gfs2_lookupi(sdp->md.jiinode, journal_name,
+			lgfs2_lookupi(sdp->md.jiinode, journal_name,
 				     strlen(journal_name), &jip);
 			sdp->md.journal[i] = jip;
 		}
@@ -852,7 +852,7 @@ int build_jindex(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *jindex;
 
-	jindex = createi(sdp->master_dir, "jindex", S_IFDIR | 0700,
+	jindex = lgfs2_createi(sdp->master_dir, "jindex", S_IFDIR | 0700,
 			 GFS2_DIF_SYSTEM);
 	if (jindex == NULL) {
 		return errno;
@@ -862,10 +862,10 @@ int build_jindex(struct gfs2_sbd *sdp)
 		int ret = lgfs2_build_journal(sdp, j, jindex);
 		if (ret)
 			return ret;
-		inode_put(&sdp->md.journal[j]);
+		lgfs2_inode_put(&sdp->md.journal[j]);
 	}
 	free(sdp->md.journal);
-	inode_put(&jindex);
+	lgfs2_inode_put(&jindex);
 	return 0;
 }
 
@@ -884,7 +884,7 @@ int init_jindex(struct gfs2_sbd *sdp, int allow_ji_rebuild)
 	if (sdp->gfs1)
 		sdp->md.jiinode = lgfs2_inode_read(sdp, sdp->sd_jindex_di.in_addr);
 	else
-		gfs2_lookupi(sdp->master_dir, "jindex", 6, &sdp->md.jiinode);
+		lgfs2_lookupi(sdp->master_dir, "jindex", 6, &sdp->md.jiinode);
 
 	if (!sdp->md.jiinode) {
 		int err;
@@ -906,7 +906,7 @@ int init_jindex(struct gfs2_sbd *sdp, int allow_ji_rebuild)
 			log_crit(_("Error %d rebuilding jindex\n"), err);
 			return err;
 		}
-		gfs2_lookupi(sdp->master_dir, "jindex", 6, &sdp->md.jiinode);
+		lgfs2_lookupi(sdp->master_dir, "jindex", 6, &sdp->md.jiinode);
 	}
 
 	/* check for irrelevant entries in jindex. Can't use check_dir because
@@ -929,8 +929,8 @@ int init_jindex(struct gfs2_sbd *sdp, int allow_ji_rebuild)
 					   "valid jindex file.\n"));
 				return -1;
 			}
-			inode_put(&sdp->md.jiinode);
-			gfs2_dirent_del(sdp->master_dir, "jindex", 6);
+			lgfs2_inode_put(&sdp->md.jiinode);
+			lgfs2_dirent_del(sdp->master_dir, "jindex", 6);
 			log_err(_("Corrupt journal index was removed.\n"));
 			error = build_jindex(sdp);
 			if (error) {
@@ -938,7 +938,7 @@ int init_jindex(struct gfs2_sbd *sdp, int allow_ji_rebuild)
 					  "index: Cannot continue.\n"));
 				return error;
 			}
-			gfs2_lookupi(sdp->master_dir, "jindex", 6,
+			lgfs2_lookupi(sdp->master_dir, "jindex", 6,
 				     &sdp->md.jiinode);
 		}
 	}
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index e65ec619..63024a87 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -446,7 +446,7 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 	log_err(_("Trying to rebuild the master directory.\n"));
 	inum.in_formal_ino = sdp->md.next_inum++;
 	inum.in_addr = sdp->sd_meta_dir.in_addr;
-	err = init_dinode(sdp, &bh, &inum, S_IFDIR | 0755, GFS2_DIF_SYSTEM, &inum);
+	err = lgfs2_init_dinode(sdp, &bh, &inum, S_IFDIR | 0755, GFS2_DIF_SYSTEM, &inum);
 	if (err != 0)
 		return -1;
 	sdp->master_dir = lgfs2_inode_get(sdp, bh);
@@ -459,7 +459,7 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 	if (fix_md.jiinode) {
 		inum.in_formal_ino = sdp->md.next_inum++;
 		inum.in_addr = fix_md.jiinode->i_num.in_addr;
-		err = dir_add(sdp->master_dir, "jindex", 6, &inum,
+		err = lgfs2_dir_add(sdp->master_dir, "jindex", 6, &inum,
 		              IF2DT(S_IFDIR | 0700));
 		if (err) {
 			log_crit(_("Error %d adding jindex directory\n"), errno);
@@ -477,7 +477,7 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 	if (fix_md.pinode) {
 		inum.in_formal_ino = sdp->md.next_inum++;
 		inum.in_addr = fix_md.pinode->i_num.in_addr;
-		err = dir_add(sdp->master_dir, "per_node", 8, &inum,
+		err = lgfs2_dir_add(sdp->master_dir, "per_node", 8, &inum,
 			IF2DT(S_IFDIR | 0700));
 		if (err) {
 			log_crit(_("Error %d adding per_node directory\n"),
@@ -497,7 +497,7 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 	if (fix_md.inum) {
 		inum.in_formal_ino = sdp->md.next_inum++;
 		inum.in_addr = fix_md.inum->i_num.in_addr;
-		err = dir_add(sdp->master_dir, "inum", 4, &inum,
+		err = lgfs2_dir_add(sdp->master_dir, "inum", 4, &inum,
 			IF2DT(S_IFREG | 0600));
 		if (err) {
 			log_crit(_("Error %d adding inum inode\n"), errno);
@@ -517,7 +517,7 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 	if (fix_md.statfs) {
 		inum.in_formal_ino = sdp->md.next_inum++;
 		inum.in_addr = fix_md.statfs->i_num.in_addr;
-		err = dir_add(sdp->master_dir, "statfs", 6, &inum,
+		err = lgfs2_dir_add(sdp->master_dir, "statfs", 6, &inum,
 			      IF2DT(S_IFREG | 0600));
 		if (err) {
 			log_crit(_("Error %d adding statfs inode\n"), errno);
@@ -537,7 +537,7 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 	if (fix_md.riinode) {
 		inum.in_formal_ino = sdp->md.next_inum++;
 		inum.in_addr = fix_md.riinode->i_num.in_addr;
-		err = dir_add(sdp->master_dir, "rindex", 6, &inum,
+		err = lgfs2_dir_add(sdp->master_dir, "rindex", 6, &inum,
 			IF2DT(S_IFREG | 0600));
 		if (err) {
 			log_crit(_("Error %d adding rindex inode\n"), errno);
@@ -549,13 +549,13 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 			log_crit(_("Error building rindex inode: %s\n"), strerror(errno));
 			exit(FSCK_ERROR);
 		}
-		inode_put(&rip);
+		lgfs2_inode_put(&rip);
 	}
 
 	if (fix_md.qinode) {
 		inum.in_formal_ino = sdp->md.next_inum++;
 		inum.in_addr = fix_md.qinode->i_num.in_addr;
-		err = dir_add(sdp->master_dir, "quota", 5, &inum,
+		err = lgfs2_dir_add(sdp->master_dir, "quota", 5, &inum,
 			IF2DT(S_IFREG | 0600));
 		if (err) {
 			log_crit(_("Error %d adding quota inode\n"), errno);
@@ -567,13 +567,13 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 			log_crit(_("Error building quota inode: %s\n"), strerror(errno));
 			exit(FSCK_ERROR);
 		}
-		inode_put(&qip);
+		lgfs2_inode_put(&qip);
 	}
 
 	log_err(_("Master directory rebuilt.\n"));
-	inode_put(&sdp->md.inum);
-	inode_put(&sdp->md.statfs);
-	inode_put(&sdp->master_dir);
+	lgfs2_inode_put(&sdp->md.inum);
+	lgfs2_inode_put(&sdp->md.statfs);
+	lgfs2_inode_put(&sdp->master_dir);
 	return 0;
 }
 
@@ -595,7 +595,7 @@ static void lookup_per_node(struct gfs2_sbd *sdp, int allow_rebuild)
 	if (sdp->md.pinode)
 		return;
 
-	gfs2_lookupi(sdp->master_dir, "per_node", 8, &sdp->md.pinode);
+	lgfs2_lookupi(sdp->master_dir, "per_node", 8, &sdp->md.pinode);
 	if (sdp->md.pinode)
 		return;
 	if (!allow_rebuild) {
@@ -616,7 +616,7 @@ static void lookup_per_node(struct gfs2_sbd *sdp, int allow_rebuild)
 			exit(FSCK_ERROR);
 		}
 	}
-	gfs2_lookupi(sdp->master_dir, "per_node", 8, &sdp->md.pinode);
+	lgfs2_lookupi(sdp->master_dir, "per_node", 8, &sdp->md.pinode);
 	if (!sdp->md.pinode) {
 		log_err( _("Unable to rebuild per_node; aborting.\n"));
 		exit(FSCK_ERROR);
@@ -796,7 +796,7 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
 	 *******************************************************************/
 	if (!sdp->gfs1) {
 		/* Look for "inum" entry in master dinode */
-		gfs2_lookupi(sdp->master_dir, "inum", 4, &sdp->md.inum);
+		lgfs2_lookupi(sdp->master_dir, "inum", 4, &sdp->md.inum);
 		if (!sdp->md.inum) {
 			if (!query( _("The gfs2 system inum inode is missing. "
 				      "Okay to rebuild it? (y/n) "))) {
@@ -816,7 +816,7 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
 			}
 		}
 		/* Read inum entry into buffer */
-		err = gfs2_readi(sdp->md.inum, &inumbuf, 0,
+		err = lgfs2_readi(sdp->md.inum, &inumbuf, 0,
 				 sdp->md.inum->i_size);
 		if (err != sdp->md.inum->i_size) {
 			log_crit(_("Error %d reading system inum inode. "
@@ -847,7 +847,7 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
 			goto fail;
 		}
 	} else
-		gfs2_lookupi(sdp->master_dir, "statfs", 6, &sdp->md.statfs);
+		lgfs2_lookupi(sdp->master_dir, "statfs", 6, &sdp->md.statfs);
 	if (!sdp->gfs1 && !sdp->md.statfs) {
 		if (!query( _("The gfs2 system statfs inode is missing. "
 			      "Okay to rebuild it? (y/n) "))) {
@@ -872,7 +872,7 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
 	if (sdp->md.statfs->i_size) {
 		buf = malloc(sdp->md.statfs->i_size);
 		if (buf) {
-			err = gfs2_readi(sdp->md.statfs, buf, 0,
+			err = lgfs2_readi(sdp->md.statfs, buf, 0,
 					 sdp->md.statfs->i_size);
 			if (err != sdp->md.statfs->i_size) {
 				log_crit(_("Error %d reading statfs file. "
@@ -904,7 +904,7 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
 			goto fail;
 		}
 	} else
-		gfs2_lookupi(sdp->master_dir, "quota", 5, &sdp->md.qinode);
+		lgfs2_lookupi(sdp->master_dir, "quota", 5, &sdp->md.qinode);
 	if (!sdp->gfs1 && !sdp->md.qinode) {
 		if (!query( _("The gfs2 system quota inode is missing. "
 			      "Okay to rebuild it? (y/n) "))) {
@@ -992,10 +992,10 @@ static void peruse_system_dinode(struct gfs2_sbd *sdp, struct gfs2_inode *ip)
 	} else if (!sdp->gfs1 && is_dir(ip, sdp->gfs1)) {
 		/* Check for a jindex dir entry. Only one system dir has a
 		   jindex: master */
-		gfs2_lookupi(ip, "jindex", 6, &child_ip);
+		lgfs2_lookupi(ip, "jindex", 6, &child_ip);
 		if (child_ip) {
 			if (fix_md.jiinode || is_journal_copy(ip)) {
-				inode_put(&child_ip);
+				lgfs2_inode_put(&child_ip);
 				goto out_discard_ip;
 			}
 			fix_md.jiinode = child_ip;
@@ -1007,15 +1007,15 @@ static void peruse_system_dinode(struct gfs2_sbd *sdp, struct gfs2_inode *ip)
 
 		/* Check for a statfs_change0 dir entry. Only one system dir
 		   has a statfs_change: per_node, and its .. will be master. */
-		gfs2_lookupi(ip, "statfs_change0", 14, &child_ip);
+		lgfs2_lookupi(ip, "statfs_change0", 14, &child_ip);
 		if (child_ip) {
-			inode_put(&child_ip);
+			lgfs2_inode_put(&child_ip);
 			if (fix_md.pinode || is_journal_copy(ip))
 				goto out_discard_ip;
 			log_warn(_("Found system per_node directory at: 0x%"PRIx64"\n"),
 			         ip->i_num.in_addr);
 			fix_md.pinode = ip;
-			error = dir_search(ip, "..", 2, NULL, &inum);
+			error = lgfs2_dir_search(ip, "..", 2, NULL, &inum);
 			if (!error && inum.in_addr) {
 				sdp->sd_meta_dir.in_addr = inum.in_addr;
 				log_warn(_("From per_node's '..' master directory backtracked to: "
@@ -1049,7 +1049,7 @@ static void peruse_system_dinode(struct gfs2_sbd *sdp, struct gfs2_inode *ip)
 		log_warn(_("Found system quota file at: 0x%"PRIx64"\n"), ip->i_num.in_addr);
 	} else {
 out_discard_ip:
-		inode_put(&ip);
+		lgfs2_inode_put(&ip);
 	}
 }
 
@@ -1095,27 +1095,27 @@ static void peruse_user_dinode(struct gfs2_sbd *sdp, struct gfs2_inode *ip)
 		return;
 	}
 	while (ip) {
-		gfs2_lookupi(ip, "..", 2, &parent_ip);
+		lgfs2_lookupi(ip, "..", 2, &parent_ip);
 		if (parent_ip && parent_ip->i_num.in_addr == ip->i_num.in_addr) {
 			log_warn(_("Found the root directory at: 0x%"PRIx64"\n"),
 				 ip->i_num.in_addr);
 			sdp->sd_root_dir.in_addr = ip->i_num.in_addr;
-			inode_put(&parent_ip);
-			inode_put(&ip);
+			lgfs2_inode_put(&parent_ip);
+			lgfs2_inode_put(&ip);
 			return;
 		}
 		if (!parent_ip)
 			break;
-		inode_put(&ip);
+		lgfs2_inode_put(&ip);
 		ip = parent_ip;
 	}
-	error = dir_search(ip, "..", 2, NULL, &inum);
+	error = lgfs2_dir_search(ip, "..", 2, NULL, &inum);
 	if (!error && inum.in_addr && inum.in_addr < possible_root) {
 			possible_root = inum.in_addr;
 			log_debug(_("Found a possible root at: 0x%"PRIx64"\n"),
 				  possible_root);
 	}
-	inode_put(&ip);
+	lgfs2_inode_put(&ip);
 }
 
 /**
@@ -1205,7 +1205,7 @@ static int peruse_metadata(struct gfs2_sbd *sdp, uint64_t startblock)
 			continue;
 		}
 		ip = lgfs2_inode_get(sdp, bh);
-		ip->bh_owned = 1; /* inode_put() will free the bh */
+		ip->bh_owned = 1; /* lgfs2_inode_put() will free the bh */
 		if (ip->i_flags & GFS2_DIF_SYSTEM)
 			peruse_system_dinode(sdp, ip);
 		else
@@ -1289,7 +1289,7 @@ static int sb_repair(struct gfs2_sbd *sdp)
 			}
 			inum.in_formal_ino = 1;
 			inum.in_addr = possible_root;
-			error = init_dinode(sdp, &bh, &inum, S_IFDIR | 0755, 0, &inum);
+			error = lgfs2_init_dinode(sdp, &bh, &inum, S_IFDIR | 0755, 0, &inum);
 			if (error != 0)
 				return -1;
 			lgfs2_brelse(bh);
@@ -1314,8 +1314,8 @@ static int sb_repair(struct gfs2_sbd *sdp)
 		}
 		sdp->sd_fs_format = GFS2_FORMAT_FS;
 		lgfs2_sb_write(sdp, sdp->device_fd);
-		inode_put(&sdp->md.rooti);
-		inode_put(&sdp->master_dir);
+		lgfs2_inode_put(&sdp->md.rooti);
+		lgfs2_inode_put(&sdp->master_dir);
 		sb_fixed = 1;
 	} else {
 		log_crit(_("GFS2 superblock not fixed; fsck cannot proceed "
@@ -1436,7 +1436,7 @@ static int correct_journal_seg_size(struct gfs2_sbd *sdp)
 	char buf[sizeof(struct gfs_jindex)];
 	unsigned int jsize = GFS2_DEFAULT_JSIZE * 1024 * 1024;
 
-	count = gfs2_readi(sdp->md.jiinode, buf, 0, sizeof(struct gfs_jindex));
+	count = lgfs2_readi(sdp->md.jiinode, buf, 0, sizeof(struct gfs_jindex));
 	if (count != sizeof(struct gfs_jindex)) {
 		log_crit(_("Error %d reading system journal index inode. "
 			   "Aborting\n"), count);
@@ -1462,7 +1462,7 @@ static int correct_journal_seg_size(struct gfs2_sbd *sdp)
 		return 0;
 	}
 
-	count = gfs2_readi(sdp->md.jiinode, buf, sizeof(struct gfs_jindex),
+	count = lgfs2_readi(sdp->md.jiinode, buf, sizeof(struct gfs_jindex),
 			   sizeof(struct gfs_jindex));
 	if (count != sizeof(struct gfs_jindex)) {
 		log_crit(_("Error %d reading system journal index inode. "
@@ -1496,7 +1496,7 @@ static int reconstruct_journals(struct gfs2_sbd *sdp)
 
 	log_err(_("Clearing GFS journals (this may take a while)\n"));
 	for (i = 0; i < sdp->md.journals; i++) {
-		count = gfs2_readi(sdp->md.jiinode, buf,
+		count = lgfs2_readi(sdp->md.jiinode, buf,
 				   i * sizeof(struct gfs_jindex),
 				   sizeof(struct gfs_jindex));
 		if (count != sizeof(struct gfs_jindex))
@@ -1521,7 +1521,7 @@ static int init_rindex(struct gfs2_sbd *sdp)
 	if (sdp->gfs1)
 		sdp->md.riinode = lgfs2_inode_read(sdp, sdp->sd_rindex_di.in_addr);
 	else
-		gfs2_lookupi(sdp->master_dir, "rindex", 6, &sdp->md.riinode);
+		lgfs2_lookupi(sdp->master_dir, "rindex", 6, &sdp->md.riinode);
 
 	if (sdp->md.riinode)
 		return 0;
@@ -1536,7 +1536,7 @@ static int init_rindex(struct gfs2_sbd *sdp)
 		log_crit(_("Error rebuilding rindex: %s\n"), strerror(errno));
 		return -1;
 	}
-	inode_put(&ip);
+	lgfs2_inode_put(&ip);
 	return 0;
 }
 
@@ -1615,7 +1615,7 @@ int initialize(struct gfs2_sbd *sdp, int force_check, int preen,
 	    (sdp->master_dir->i_magic != GFS2_MAGIC ||
 	     sdp->master_dir->i_mh_type != GFS2_METATYPE_DI ||
 	     !sdp->master_dir->i_size)) {
-		inode_put(&sdp->master_dir);
+		lgfs2_inode_put(&sdp->master_dir);
 		rebuild_master(sdp);
 		sdp->master_dir = lgfs2_inode_read(sdp, sdp->sd_meta_dir.in_addr);
 		if (sdp->master_dir == NULL) {
diff --git a/gfs2/fsck/lost_n_found.c b/gfs2/fsck/lost_n_found.c
index 65e13125..8c66bea8 100644
--- a/gfs2/fsck/lost_n_found.c
+++ b/gfs2/fsck/lost_n_found.c
@@ -77,12 +77,12 @@ static void add_dotdot(struct gfs2_inode *ip)
 				    "in directory tree.\n"),
 			          ip->i_num.in_addr);
 	}
-	if (gfs2_dirent_del(ip, "..", 2))
+	if (lgfs2_dirent_del(ip, "..", 2))
 		log_warn( _("add_inode_to_lf:  Unable to remove "
 			    "\"..\" directory entry.\n"));
 
 	no = lf_dip->i_num;
-	err = dir_add(ip, "..", 2, &no, (sdp->gfs1 ? GFS_FILE_DIR : DT_DIR));
+	err = lgfs2_dir_add(ip, "..", 2, &no, (sdp->gfs1 ? GFS_FILE_DIR : DT_DIR));
 	if (err) {
 		log_crit(_("Error adding .. directory: %s\n"),
 			 strerror(errno));
@@ -103,16 +103,16 @@ void make_sure_lf_exists(struct gfs2_inode *ip)
 	root_entries = sdp->md.rooti->i_entries;
 	log_info( _("Locating/Creating lost+found directory\n"));
 
-	/* if this is gfs1, we have to trick createi into using
+	/* if this is gfs1, we have to trick lgfs2_createi into using
 	   no_formal_ino = no_addr, so we set next_inum to the
 	   free block we're about to allocate. */
 	if (sdp->gfs1)
 		sdp->md.next_inum = find_free_blk(sdp);
 	mode = (sdp->gfs1 ? DT2IF(GFS_FILE_DIR) : S_IFDIR) | 0700;
 	if (sdp->gfs1)
-		lf_dip = gfs_createi(sdp->md.rooti, "lost+found", mode, 0);
+		lf_dip = lgfs2_gfs_createi(sdp->md.rooti, "lost+found", mode, 0);
 	else
-		lf_dip = createi(sdp->md.rooti, "lost+found",
+		lf_dip = lgfs2_createi(sdp->md.rooti, "lost+found",
 				 S_IFDIR | 0700, 0);
 	if (lf_dip == NULL) {
 		log_crit(_("Error creating lost+found: %s\n"),
@@ -120,7 +120,7 @@ void make_sure_lf_exists(struct gfs2_inode *ip)
 		exit(FSCK_ERROR);
 	}
 
-	/* createi will have incremented the di_nlink link count for the root
+	/* lgfs2_createi will have incremented the di_nlink link count for the root
 	   directory.  We must set the nlink value in the hash table to keep
 	   them in sync so that pass4 can detect and fix any descrepancies. */
 	set_di_nlink(sdp->md.rooti);
@@ -226,7 +226,7 @@ int add_inode_to_lf(struct gfs2_inode *ip){
 	}
 
 	no = ip->i_num;
-	err = dir_add(lf_dip, tmp_name, strlen(tmp_name), &no, inode_type);
+	err = lgfs2_dir_add(lf_dip, tmp_name, strlen(tmp_name), &no, inode_type);
 	if (err) {
 		log_crit(_("Error adding directory %s: %s\n"),
 			 tmp_name, strerror(errno));
diff --git a/gfs2/fsck/main.c b/gfs2/fsck/main.c
index 446f4f85..3c432be8 100644
--- a/gfs2/fsck/main.c
+++ b/gfs2/fsck/main.c
@@ -167,7 +167,7 @@ static int check_statfs(struct gfs2_sbd *sdp)
 		return 0;
 	}
 	/* Read the current statfs values */
-	count = gfs2_readi(sdp->md.statfs, &sc, 0, sdp->md.statfs->i_size);
+	count = lgfs2_readi(sdp->md.statfs, &sc, 0, sdp->md.statfs->i_size);
 	if (count != sizeof(struct gfs2_statfs_change)) {
 		log_err(_("Failed to read statfs values (%d of %"PRIu64" read)\n"),
 		        count, sdp->md.statfs->i_size);
@@ -328,22 +328,22 @@ int main(int argc, char **argv)
 
 	/* Free up our system inodes */
 	if (!sdp->gfs1)
-		inode_put(&sdp->md.inum);
-	inode_put(&sdp->md.statfs);
+		lgfs2_inode_put(&sdp->md.inum);
+	lgfs2_inode_put(&sdp->md.statfs);
 	for (j = 0; j < sdp->md.journals; j++)
-		inode_put(&sdp->md.journal[j]);
+		lgfs2_inode_put(&sdp->md.journal[j]);
 	free(sdp->md.journal);
 	sdp->md.journal = NULL;
-	inode_put(&sdp->md.jiinode);
-	inode_put(&sdp->md.riinode);
-	inode_put(&sdp->md.qinode);
+	lgfs2_inode_put(&sdp->md.jiinode);
+	lgfs2_inode_put(&sdp->md.riinode);
+	lgfs2_inode_put(&sdp->md.qinode);
 	if (!sdp->gfs1)
-		inode_put(&sdp->md.pinode);
-	inode_put(&sdp->md.rooti);
+		lgfs2_inode_put(&sdp->md.pinode);
+	lgfs2_inode_put(&sdp->md.rooti);
 	if (!sdp->gfs1)
-		inode_put(&sdp->master_dir);
+		lgfs2_inode_put(&sdp->master_dir);
 	if (lf_dip)
-		inode_put(&lf_dip);
+		lgfs2_inode_put(&lf_dip);
 
 	if (!opts.no && errors_corrected)
 		log_notice( _("Writing changes to disk\n"));
diff --git a/gfs2/fsck/metawalk.c b/gfs2/fsck/metawalk.c
index 2f0ba6c2..a5b3fe36 100644
--- a/gfs2/fsck/metawalk.c
+++ b/gfs2/fsck/metawalk.c
@@ -231,7 +231,7 @@ struct gfs2_inode *fsck_system_inode(struct gfs2_sbd *sdp, uint64_t block)
 	if (lf_dip && lf_dip->i_num.in_addr == block)
 		return lf_dip;
 	if (!sdp->gfs1)
-		return is_system_inode(sdp, block);
+		return lgfs2_is_system_inode(sdp, block);
 
 	if (sdp->md.statfs && block == sdp->md.statfs->i_num.in_addr)
 		return sdp->md.statfs;
@@ -287,7 +287,7 @@ struct gfs2_inode *fsck_inode_get(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 	return ip;
 }
 
-/* fsck_inode_put - same as inode_put() in libgfs2 but system inodes
+/* fsck_inode_put - same as lgfs2_inode_put() in libgfs2 but system inodes
    get special treatment. */
 void fsck_inode_put(struct gfs2_inode **ip_in)
 {
@@ -296,7 +296,7 @@ void fsck_inode_put(struct gfs2_inode **ip_in)
 
 	sysip = fsck_system_inode(ip->i_sbd, ip->i_num.in_addr);
 	if (!sysip)
-		inode_put(ip_in);
+		lgfs2_inode_put(ip_in);
 }
 
 /**
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index 0e67ee35..c2d6cae4 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -154,7 +154,7 @@ static int pass1_repair_leaf(struct gfs2_inode *ip, uint64_t *leaf_no,
 	if (ip->i_sbd->gfs1)
 		gfs1_writei(ip, padbuf, lindex * sizeof(uint64_t), pad_size);
 	else
-		gfs2_writei(ip, padbuf, lindex * sizeof(uint64_t), pad_size);
+		lgfs2_writei(ip, padbuf, lindex * sizeof(uint64_t), pad_size);
 	free(padbuf);
 	log_err(_("Directory Inode %"PRIu64" (0x%"PRIx64") patched.\n"),
 	        ip->i_num.in_addr, ip->i_num.in_addr);
@@ -1463,7 +1463,7 @@ static int check_system_inode(struct gfs2_sbd *sdp,
 			gfs2_blockmap_set(bl, iblock, GFS2_BLKST_FREE);
 			check_n_fix_bitmap(sdp, (*sysinode)->i_rgd, iblock, 0,
 					   GFS2_BLKST_FREE);
-			inode_put(sysinode);
+			lgfs2_inode_put(sysinode);
 		}
 	}
 	if (*sysinode) {
@@ -1490,8 +1490,8 @@ static int check_system_inode(struct gfs2_sbd *sdp,
 				   "flag. It should be rebuilt.\n"), filename);
 			if (sysdir && query(_("Delete the corrupt %s system "
 					      "inode? (y/n) "), filename)) {
-				inode_put(sysinode);
-				gfs2_dirent_del(sysdir, filename,
+				lgfs2_inode_put(sysinode);
+				lgfs2_dirent_del(sysdir, filename,
 						strlen(filename));
 				/* Set the blockmap (but not bitmap) back to
 				   'free' so that it gets checked like any
@@ -1567,7 +1567,7 @@ static int build_a_journal(struct gfs2_sbd *sdp)
 
 	/* First, try to delete the journal if it's in jindex */
 	sprintf(name, "journal%u", sdp->md.journals);
-	gfs2_dirent_del(sdp->md.jiinode, name, strlen(name));
+	lgfs2_dirent_del(sdp->md.jiinode, name, strlen(name));
 	/* Now rebuild it */
 	err = lgfs2_build_journal(sdp, sdp->md.journals, sdp->md.jiinode);
 	if (err) {
@@ -1582,7 +1582,7 @@ int build_per_node(struct gfs2_sbd *sdp)
 	struct gfs2_inode *per_node;
 	unsigned int j;
 
-	per_node = createi(sdp->master_dir, "per_node", S_IFDIR | 0700,
+	per_node = lgfs2_createi(sdp->master_dir, "per_node", S_IFDIR | 0700,
 			   GFS2_DIF_SYSTEM);
 	if (per_node == NULL) {
 		log_err(_("Error building '%s': %s\n"), "per_node", strerror(errno));
@@ -1597,7 +1597,7 @@ int build_per_node(struct gfs2_sbd *sdp)
 			        strerror(errno));
 			return 1;
 		}
-		inode_put(&ip);
+		lgfs2_inode_put(&ip);
 
 		ip = lgfs2_build_statfs_change(per_node, j);
 		if (ip == NULL) {
@@ -1605,7 +1605,7 @@ int build_per_node(struct gfs2_sbd *sdp)
 			        strerror(errno));
 			return 1;
 		}
-		inode_put(&ip);
+		lgfs2_inode_put(&ip);
 
 		ip = lgfs2_build_quota_change(per_node, j);
 		if (ip == NULL) {
@@ -1613,9 +1613,9 @@ int build_per_node(struct gfs2_sbd *sdp)
 			        strerror(errno));
 			return 1;
 		}
-		inode_put(&ip);
+		lgfs2_inode_put(&ip);
 	}
-	inode_put(&per_node);
+	lgfs2_inode_put(&per_node);
 	return 0;
 }
 
@@ -1624,7 +1624,7 @@ static int build_inum(struct gfs2_sbd *sdp)
 	struct gfs2_inode *ip = lgfs2_build_inum(sdp);
 	if (ip == NULL)
 		return -1;
-	inode_put(&ip);
+	lgfs2_inode_put(&ip);
 	return 0;
 }
 
@@ -1633,7 +1633,7 @@ static int build_statfs(struct gfs2_sbd *sdp)
 	struct gfs2_inode *ip = lgfs2_build_statfs(sdp);
 	if (ip == NULL)
 		return -1;
-	inode_put(&ip);
+	lgfs2_inode_put(&ip);
 	return 0;
 }
 
@@ -1642,7 +1642,7 @@ static int build_rindex(struct gfs2_sbd *sdp)
 	struct gfs2_inode *ip = lgfs2_build_rindex(sdp);
 	if (ip == NULL)
 		return -1;
-	inode_put(&ip);
+	lgfs2_inode_put(&ip);
 	return 0;
 }
 
@@ -1651,7 +1651,7 @@ static int build_quota(struct gfs2_sbd *sdp)
 	struct gfs2_inode *ip = lgfs2_build_quota(sdp);
 	if (ip == NULL)
 		return -1;
-	inode_put(&ip);
+	lgfs2_inode_put(&ip);
 	return 0;
 }
 
diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index 92c816ce..71e10e96 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -206,7 +206,7 @@ static int bad_formal_ino(struct gfs2_inode *ip, struct gfs2_dirent *dent,
 	   formal inode number still doesn't match. If that directory
 	   has a '..' pointing back, just fix up the no_formal_ino. */
 	child_ip = lgfs2_inode_read(sdp, entry.in_addr);
-	error = dir_search(child_ip, "..", 2, NULL, &childs_dotdot);
+	error = lgfs2_dir_search(child_ip, "..", 2, NULL, &childs_dotdot);
 	if (!error && childs_dotdot.in_addr == ip->i_num.in_addr) {
 		log_err( _("The entry points to another directory with intact "
 			   "linkage.\n"));
@@ -223,12 +223,12 @@ static int bad_formal_ino(struct gfs2_inode *ip, struct gfs2_dirent *dent,
 		}
 	} else {
 		if (query( _("Remove the corrupt directory entry? (y/n) "))) {
-			inode_put(&child_ip);
+			lgfs2_inode_put(&child_ip);
 			return 1;
 		}
 		log_err( _("Corrupt directory entry not removed.\n"));
 	}
-	inode_put(&child_ip);
+	lgfs2_inode_put(&child_ip);
 	return 0;
 }
 
@@ -337,7 +337,7 @@ static int wrong_leaf(struct gfs2_inode *ip, struct lgfs2_inum *entry,
 	free(tbl);
 
 	/* check if it's already on the correct leaf block */
-	error = dir_search(ip, tmp_name, d->dr_name_len, NULL, &d->dr_inum);
+	error = lgfs2_dir_search(ip, tmp_name, d->dr_name_len, NULL, &d->dr_inum);
 	if (!error) {
 		log_err(_("The misplaced directory entry already appears on "
 			  "the correct leaf block.\n"));
@@ -347,7 +347,7 @@ static int wrong_leaf(struct gfs2_inode *ip, struct lgfs2_inum *entry,
 	}
 
 	di_depth = ip->i_depth;
-	if (dir_add(ip, tmp_name, d->dr_name_len, &d->dr_inum, d->dr_type) == 0) {
+	if (lgfs2_dir_add(ip, tmp_name, d->dr_name_len, &d->dr_inum, d->dr_type) == 0) {
 		log_err(_("The misplaced directory entry was moved to a "
 			  "valid leaf block.\n"));
 		if (ip->i_depth > di_depth) {
@@ -400,7 +400,7 @@ static int wrong_leaf(struct gfs2_inode *ip, struct lgfs2_inum *entry,
 		   The reason is: *count is the count of dentries on the leaf,
 		   and we moved the dentry to a previous leaf within the same
 		   directory dinode. So the directory counts still get
-		   incremented, but not leaf entries. When we called dir_add
+		   incremented, but not leaf entries. When we called lgfs2_dir_add
 		   above, it should have fixed that prev leaf's lf_entries. */
 		ds->entry_count++;
 		return 1;
@@ -656,7 +656,7 @@ static int dirref_find(struct gfs2_inode *ip, struct gfs2_dirent *dent,
 	}
 	decr_link_count(entry->in_addr, ip->i_num.in_addr, ip->i_sbd->gfs1,
 	                _("bad original reference"));
-	dirent2_del(ip, bh, prev, dent);
+	lgfs2_dirent2_del(ip, bh, prev, dent);
 	log_err(_("The corrupt directory entry '%s' was deleted.\n"), fn);
 out:
 	return -1; /* force check_dir to stop; don't waste time. */
@@ -914,7 +914,7 @@ dentry_is_valid:
 	return 0;
 
 nuke_dentry:
-	dirent2_del(ip, bh, prev_de, dent);
+	lgfs2_dirent2_del(ip, bh, prev_de, dent);
 	log_err( _("Bad directory entry '%s' cleared.\n"), tmp_name);
 	return 1;
 }
@@ -1003,7 +1003,7 @@ static int write_new_leaf(struct gfs2_inode *dip, int start_lindex,
 		count = gfs1_writei(dip, padbuf, start_lindex *
 				    sizeof(uint64_t), pad_size);
 	else
-		count = gfs2_writei(dip, padbuf, start_lindex *
+		count = lgfs2_writei(dip, padbuf, start_lindex *
 				    sizeof(uint64_t), pad_size);
 	free(padbuf);
 	if (count != pad_size) {
@@ -1123,7 +1123,7 @@ static int lost_leaf(struct gfs2_inode *ip, __be64 *tbl, uint64_t leafno,
 					  "\"%s\".\n"), tmp_name);
 			} else {
 
-				error = dir_add(lf_dip, filename,
+				error = lgfs2_dir_add(lf_dip, filename,
 						de.dr_name_len, &de.dr_inum,
 						de.dr_type);
 				if (error && error != -EEXIST) {
@@ -1194,7 +1194,7 @@ static int basic_check_dentry(struct gfs2_inode *ip, struct gfs2_dirent *dent,
 	error = basic_dentry_checks(ip, dent, &entry, tmp_name, count, de,
 				    ds, &q, bh, &isdir);
 	if (error) {
-		dirent2_del(ip, bh, prev_de, dent);
+		lgfs2_dirent2_del(ip, bh, prev_de, dent);
 		log_err( _("Bad directory entry '%s' cleared.\n"), tmp_name);
 		return 1;
 	} else {
@@ -1336,7 +1336,7 @@ static int fix_hashtable(struct gfs2_inode *ip, __be64 *tbl, unsigned hsize,
 	if ((dentry.dr_rec_len == ip->i_sbd->sd_bsize - sizeof(struct gfs2_leaf)) &&
 	    (dentry.dr_inum.in_formal_ino == 0)) {
 		lgfs2_brelse(lbh);
-		gfs2_free_block(ip->i_sbd, leafblk);
+		lgfs2_free_block(ip->i_sbd, leafblk);
 		log_err(_("Out of place leaf block %"PRIu64" (0x%"PRIx64") had no "
 			"entries, so it was deleted.\n"),
 		        leafblk, leafblk);
@@ -1401,8 +1401,8 @@ static int fix_hashtable(struct gfs2_inode *ip, __be64 *tbl, unsigned hsize,
 			  "0x%x.\n"), factor, len, proper_start);
 		changes++;
 		new_leaf_blk = find_free_blk(ip->i_sbd);
-		dir_split_leaf(ip, lindex, leafblk, lbh);
-		/* re-read the leaf to pick up dir_split_leaf's changes */
+		lgfs2_dir_split_leaf(ip, lindex, leafblk, lbh);
+		/* re-read the leaf to pick up lgfs2_dir_split_leaf's changes */
 		lgfs2_leaf_in(&leaf, lbh->b_data);
 		*proper_len = 1 << (ip->i_depth - leaf.lf_depth);
 		log_err(_("Leaf block %"PRIu64" (0x%"PRIx64") was split from length %d to %d\n"),
@@ -1654,7 +1654,7 @@ static int check_hash_tbl(struct gfs2_inode *ip, __be64 *tbl,
 			continue;
 
 		/* Make sure they call on proper leaf-split boundaries. This
-		   is the calculation used by the kernel, and dir_split_leaf */
+		   is the calculation used by the kernel, and lgfs2_dir_split_leaf */
 		proper_start = (lindex & ~(proper_len - 1));
 		if (lindex != proper_start) {
 			log_debug(_("lindex 0x%x is not a proper starting "
@@ -1823,7 +1823,7 @@ static int check_pernode_for(int x, struct gfs2_inode *pernode, const char *fn,
 	int error, valid_size = 1;
 
 	log_debug(_("Checking system file %s\n"), fn);
-	error = gfs2_lookupi(pernode, fn, strlen(fn), &ip);
+	error = lgfs2_lookupi(pernode, fn, strlen(fn), &ip);
 	if (error) {
 		log_err(_("System file %s is missing.\n"), fn);
 		if (!query( _("Rebuild the system file? (y/n) ")))
@@ -1853,7 +1853,7 @@ static int check_pernode_for(int x, struct gfs2_inode *pernode, const char *fn,
 			goto out_good;
 		check_metatree(ip, &pass2_fxns_delete);
 		fsck_inode_put(&ip);
-		gfs2_dirent_del(pernode, fn, strlen(fn));
+		lgfs2_dirent_del(pernode, fn, strlen(fn));
 		goto build_it;
 	}
 out_good:
@@ -1865,7 +1865,7 @@ build_it:
 		log_err(_("Error building %s\n"), fn);
 		return -1;
 	}
-	error = gfs2_lookupi(pernode, fn, strlen(fn), &ip);
+	error = lgfs2_lookupi(pernode, fn, strlen(fn), &ip);
 	if (error) {
 		log_err(_("Error rebuilding %s.\n"), fn);
 		return -1;
@@ -1881,7 +1881,7 @@ static int build_inum_range(struct gfs2_inode *per_node, unsigned int n)
 
 	if (ip == NULL)
 		return 1;
-	inode_put(&ip);
+	lgfs2_inode_put(&ip);
 	return 0;
 }
 
@@ -1891,7 +1891,7 @@ static int build_statfs_change(struct gfs2_inode *per_node, unsigned int n)
 
 	if (ip == NULL)
 		return 1;
-	inode_put(&ip);
+	lgfs2_inode_put(&ip);
 	return 0;
 }
 
@@ -1901,7 +1901,7 @@ static int build_quota_change(struct gfs2_inode *per_node, unsigned int n)
 
 	if (ip == NULL)
 		return 1;
-	inode_put(&ip);
+	lgfs2_inode_put(&ip);
 	return 0;
 }
 
@@ -1953,7 +1953,7 @@ static int check_system_dir(struct gfs2_inode *sysinode, const char *dirname,
 		if (query( _("Is it okay to add '.' entry? (y/n) "))) {
 			struct lgfs2_inum no = sysinode->i_num;
 			log_warn( _("Adding '.' entry\n"));
-			error = dir_add(sysinode, ".", 1, &no,
+			error = lgfs2_dir_add(sysinode, ".", 1, &no,
 			                (sysinode->i_sbd->gfs1 ? GFS_FILE_DIR : DT_DIR));
 			if (error) {
 				log_err(_("Error adding directory %s: %s\n"), "'.'",
@@ -2066,7 +2066,7 @@ static int pass2_check_dir(struct gfs2_sbd *sdp, struct gfs2_inode *ip)
 
 		if (query( _("Is it okay to add '.' entry? (y/n) "))) {
 			struct lgfs2_inum no = ip->i_num;
-			error = dir_add(ip, ".", 1, &no,
+			error = lgfs2_dir_add(ip, ".", 1, &no,
 					(sdp->gfs1 ? GFS_FILE_DIR : DT_DIR));
 			if (error) {
 				log_err(_("Error adding directory %s: %s\n"), "'.'",
diff --git a/gfs2/fsck/pass3.c b/gfs2/fsck/pass3.c
index fce3c7f9..e2e20483 100644
--- a/gfs2/fsck/pass3.c
+++ b/gfs2/fsck/pass3.c
@@ -36,12 +36,12 @@ static int attach_dotdot_to(struct gfs2_sbd *sdp, uint64_t newdotdot,
 	 * '..' entry for this directory in
 	 * this case? */
 
-	if (gfs2_dirent_del(ip, filename, filename_len))
+	if (lgfs2_dirent_del(ip, filename, filename_len))
 		log_warn( _("Unable to remove \"..\" directory entry.\n"));
 	else
 		decr_link_count(olddotdot, block, sdp->gfs1, _("old \"..\""));
 	no = pip->i_num;
-	err = dir_add(ip, filename, filename_len, &no,
+	err = lgfs2_dir_add(ip, filename, filename_len, &no,
 		      (sdp->gfs1 ? GFS_FILE_DIR : DT_DIR));
 	if (err) {
 		log_err(_("Error adding directory %s: %s\n"),
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index 5dddaefb..825a6398 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -64,7 +64,7 @@ static void find_journaled_rgs(struct gfs2_sbd *sdp)
 		jblocks = ip->i_size / sdp->sd_bsize;
 		false_count = 0;
 		for (b = 0; b < jblocks; b++) {
-			block_map(ip, b, &new, &dblock, NULL, 0);
+			lgfs2_block_map(ip, b, &new, &dblock, NULL, 0);
 			if (!dblock)
 				break;
 			bh = lgfs2_bread(sdp, dblock);
@@ -234,7 +234,7 @@ static int find_shortest_rgdist(struct gfs2_sbd *sdp, uint64_t *dist_array,
 		struct gfs2_rindex ri;
 
 		/* read in the second RG index entry for this subd. */
-		gfs2_readi(sdp->md.riinode, &ri, sizeof(ri), sizeof(ri));
+		lgfs2_readi(sdp->md.riinode, &ri, sizeof(ri), sizeof(ri));
 
 		if (be64_to_cpu(ri.ri_addr) > LGFS2_SB_ADDR(sdp) + 1) { /* sanity check */
 			log_warn( _("rgrp 2 is damaged: getting dist from index: "));
@@ -681,8 +681,8 @@ static int rindex_rebuild(struct gfs2_sbd *sdp, int *num_rgs, int gfs_grow)
 	error = 0;
 out:
 	for (j = 0; j < sdp->md.journals; j++)
-		inode_put(&sdp->md.journal[j]);
-	inode_put(&sdp->md.jiinode);
+		lgfs2_inode_put(&sdp->md.journal[j]);
+	lgfs2_inode_put(&sdp->md.jiinode);
 	free(sdp->md.journal);
 	return error;
 }
@@ -1143,7 +1143,7 @@ int rindex_repair(struct gfs2_sbd *sdp, int trust_lvl, int *ok)
 		if (rindex_modified) {
 			if (query( _("Fix the index? (y/n)"))) {
 				lgfs2_rindex_out(expected, (char *)&buf);
-				gfs2_writei(sdp->md.riinode, (char *)&buf,
+				lgfs2_writei(sdp->md.riinode, (char *)&buf,
 					    rg * sizeof(struct gfs2_rindex),
 					    sizeof(struct gfs2_rindex));
 				actual->rt_addr = expected->rt_addr;
diff --git a/gfs2/fsck/util.c b/gfs2/fsck/util.c
index f4d137ed..549c087b 100644
--- a/gfs2/fsck/util.c
+++ b/gfs2/fsck/util.c
@@ -578,7 +578,7 @@ __be64 *get_dir_hash(struct gfs2_inode *ip)
 	if (tbl == NULL)
 		return NULL;
 
-	ret = gfs2_readi(ip, tbl, 0, hsize);
+	ret = lgfs2_readi(ip, tbl, 0, hsize);
 	if (ret != hsize) {
 		free(tbl);
 		return NULL;
diff --git a/gfs2/glocktop/glocktop.c b/gfs2/glocktop/glocktop.c
index 9fc7bc64..130cc8a9 100644
--- a/gfs2/glocktop/glocktop.c
+++ b/gfs2/glocktop/glocktop.c
@@ -630,15 +630,15 @@ static const char *show_inode(const char *id, int fd, uint64_t block)
 		subdepth++;
 		/* Backtrack the directory to its source */
 		while (1) {
-			error = gfs2_lookupi(ip, "..", 2, &parent);
+			error = lgfs2_lookupi(ip, "..", 2, &parent);
 			if (error)
 				break;
 			/* Stop at the root inode */
 			if (ip->i_num.in_addr == parent->i_num.in_addr) {
-				inode_put(&parent);
+				lgfs2_inode_put(&parent);
 				break;
 			}
-			inode_put(&ip);
+			lgfs2_inode_put(&ip);
 			ip = parent;
 			dirarray[subdepth++] = parent->i_num.in_addr;
 		}
@@ -657,7 +657,7 @@ static const char *show_inode(const char *id, int fd, uint64_t block)
 		inode_type = "socket ";
 	} else
 		inode_type = "file? ";
-	inode_put(&ip);
+	lgfs2_inode_put(&ip);
 	return inode_type;
 }
 
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index a79c2d2e..432031e1 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -60,7 +60,7 @@ struct gfs2_inode *lgfs2_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr)
 	return ip;
 }
 
-struct gfs2_inode *is_system_inode(struct gfs2_sbd *sdp, uint64_t block)
+struct gfs2_inode *lgfs2_is_system_inode(struct gfs2_sbd *sdp, uint64_t block)
 {
 	int j;
 
@@ -87,7 +87,7 @@ struct gfs2_inode *is_system_inode(struct gfs2_sbd *sdp, uint64_t block)
 	return NULL;
 }
 
-void inode_put(struct gfs2_inode **ip_in)
+void lgfs2_inode_put(struct gfs2_inode **ip_in)
 {
 	struct gfs2_inode *ip = *ip_in;
 	uint64_t block = ip->i_num.in_addr;
@@ -96,7 +96,7 @@ void inode_put(struct gfs2_inode **ip_in)
 	if (ip->i_bh != NULL) {
 		if (ip->i_bh->b_modified) {
 			lgfs2_dinode_out(ip, ip->i_bh->b_data);
-			if (!ip->bh_owned && is_system_inode(sdp, block))
+			if (!ip->bh_owned && lgfs2_is_system_inode(sdp, block))
 				fprintf(stderr, "Warning: Changes made to inode were discarded.\n");
 		}
 		if (ip->bh_owned)
@@ -230,7 +230,7 @@ buffer_copy_tail(struct gfs2_sbd *sdp,
 	lgfs2_bmodified(to_bh);
 }
 
-void unstuff_dinode(struct gfs2_inode *ip)
+void lgfs2_unstuff_dinode(struct gfs2_inode *ip)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	struct gfs2_buffer_head *bh;
@@ -340,7 +340,7 @@ int lgfs2_file_alloc(lgfs2_rgrp_t rg, uint64_t di_size, struct gfs2_inode *ip, u
 	ip->i_atime = ip->i_mtime = ip->i_ctime = sdp->sd_time;
 	ip->i_goal_data = ip->i_num.in_addr + ip->i_blocks - 1;
 	ip->i_goal_meta = ip->i_goal_data - ((di_size + sdp->sd_bsize - 1) / sdp->sd_bsize);
-	ip->i_height = calc_tree_height(ip, di_size);
+	ip->i_height = lgfs2_calc_tree_height(ip, di_size);
 	ip->i_flags = flags;
 
 	rg->rt_free -= blocks;
@@ -352,7 +352,7 @@ int lgfs2_file_alloc(lgfs2_rgrp_t rg, uint64_t di_size, struct gfs2_inode *ip, u
 	return 0;
 }
 
-unsigned int calc_tree_height(struct gfs2_inode *ip, uint64_t size)
+unsigned int lgfs2_calc_tree_height(struct gfs2_inode *ip, uint64_t size)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	uint64_t *arr;
@@ -376,7 +376,7 @@ unsigned int calc_tree_height(struct gfs2_inode *ip, uint64_t size)
 	return height;
 }
 
-void build_height(struct gfs2_inode *ip, int height)
+void lgfs2_build_height(struct gfs2_inode *ip, int height)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	struct gfs2_buffer_head *bh;
@@ -423,7 +423,7 @@ void build_height(struct gfs2_inode *ip, int height)
 	}
 }
 
-void find_metapath(struct gfs2_inode *ip, uint64_t block, struct metapath *mp)
+void lgfs2_find_metapath(struct gfs2_inode *ip, uint64_t block, struct metapath *mp)
 {
 	const uint32_t inptrs = ip->i_sbd->sd_inptrs;
 	unsigned int i = ip->i_height;
@@ -435,9 +435,9 @@ void find_metapath(struct gfs2_inode *ip, uint64_t block, struct metapath *mp)
 	}
 }
 
-void lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
-		  unsigned int height, struct metapath *mp,
-		  int create, int *new, uint64_t *block)
+void lgfs2_lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
+                        unsigned int height, struct metapath *mp,
+                        int create, int *new, uint64_t *block)
 {
 	__be64 *ptr = metapointer(bh->b_data, height, mp);
 
@@ -461,8 +461,8 @@ void lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
 	*new = 1;
 }
 
-void block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
-	       uint64_t *dblock, uint32_t *extlen, int prealloc)
+void lgfs2_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
+                     uint64_t *dblock, uint32_t *extlen, int prealloc)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	struct gfs2_buffer_head *bh;
@@ -489,21 +489,21 @@ void block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 
 	bsize = (S_ISDIR(ip->i_mode)) ? sdp->sd_jbsize : sdp->sd_bsize;
 
-	height = calc_tree_height(ip, (lblock + 1) * bsize);
+	height = lgfs2_calc_tree_height(ip, (lblock + 1) * bsize);
 	if (ip->i_height < height) {
 		if (!create)
 			return;
 
-		build_height(ip, height);
+		lgfs2_build_height(ip, height);
 	}
 
-	find_metapath(ip, lblock, &mp);
+	lgfs2_find_metapath(ip, lblock, &mp);
 	end_of_metadata = ip->i_height - 1;
 
 	bh = ip->i_bh;
 
 	for (x = 0; x < end_of_metadata; x++) {
-		lookup_block(ip, bh, x, &mp, create, new, dblock);
+		lgfs2_lookup_block(ip, bh, x, &mp, create, new, dblock);
 		if (bh != ip->i_bh)
 			lgfs2_brelse(bh);
 		if (!*dblock)
@@ -527,7 +527,7 @@ void block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 	}
 
 	if (!prealloc)
-		lookup_block(ip, bh, end_of_metadata, &mp, create, new, dblock);
+		lgfs2_lookup_block(ip, bh, end_of_metadata, &mp, create, new, dblock);
 
 	if (extlen && *dblock) {
 		*extlen = 1;
@@ -540,7 +540,7 @@ void block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 			nptrs = (end_of_metadata) ? sdp->sd_inptrs : sdp->sd_diptrs;
 
 			while (++mp.mp_list[end_of_metadata] < nptrs) {
-				lookup_block(ip, bh, end_of_metadata, &mp, 0, &tmp_new,
+				lgfs2_lookup_block(ip, bh, end_of_metadata, &mp, 0, &tmp_new,
 							 &tmp_dblock);
 
 				if (*dblock + *extlen != tmp_dblock)
@@ -569,8 +569,7 @@ copy2mem(struct gfs2_buffer_head *bh, void **buf, unsigned int offset,
 	*p += size;
 }
 
-int gfs2_readi(struct gfs2_inode *ip, void *buf,
-			   uint64_t offset, unsigned int size)
+int lgfs2_readi(struct gfs2_inode *ip, void *buf, uint64_t offset, unsigned int size)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	struct gfs2_buffer_head *bh;
@@ -616,7 +615,7 @@ int gfs2_readi(struct gfs2_inode *ip, void *buf,
 				gfs1_block_map(ip, lblock, &not_new, &dblock,
 					       &extlen, 0);
 			else
-				block_map(ip, lblock, &not_new, &dblock,
+				lgfs2_block_map(ip, lblock, &not_new, &dblock,
 					  &extlen, 0);
 		}
 
@@ -656,7 +655,7 @@ static void copy_from_mem(struct gfs2_buffer_head *bh, void **buf,
 	*p += size;
 }
 
-int __gfs2_writei(struct gfs2_inode *ip, void *buf,
+int __lgfs2_writei(struct gfs2_inode *ip, void *buf,
 		  uint64_t offset, unsigned int size, int resize)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
@@ -675,7 +674,7 @@ int __gfs2_writei(struct gfs2_inode *ip, void *buf,
 
 	if (inode_is_stuffed(ip) &&
 	    ((start + size) > (sdp->sd_bsize - sizeof(struct gfs2_dinode))))
-		unstuff_dinode(ip);
+		lgfs2_unstuff_dinode(ip);
 
 	if (isdir) {
 		lblock = offset;
@@ -698,7 +697,7 @@ int __gfs2_writei(struct gfs2_inode *ip, void *buf,
 
 		if (!extlen) {
 			new = 1;
-			block_map(ip, lblock, &new, &dblock, &extlen, 0);
+			lgfs2_block_map(ip, lblock, &new, &dblock, &extlen, 0);
 		}
 
 		if (new) {
@@ -738,7 +737,7 @@ int __gfs2_writei(struct gfs2_inode *ip, void *buf,
 	return copied;
 }
 
-int gfs2_dirent_first(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
+int lgfs2_dirent_first(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 					  struct gfs2_dirent **dent)
 {
 	struct gfs2_meta_header *h = (struct gfs2_meta_header *)bh->b_data;
@@ -752,7 +751,7 @@ int gfs2_dirent_first(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 	}
 }
 
-int gfs2_dirent_next(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
+int lgfs2_dirent_next(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 					 struct gfs2_dirent **dent)
 {
 	char *bh_end;
@@ -782,7 +781,7 @@ static int dirent_alloc(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 	unsigned int entries = 0, offset = 0;
 	int type;
 
-	type = gfs2_dirent_first(dip, bh, &dent);
+	type = lgfs2_dirent_first(dip, bh, &dent);
 
 	if (type == IS_LEAF) {
 		struct gfs2_leaf *leaf = (struct gfs2_leaf *)bh->b_data;
@@ -842,14 +841,14 @@ static int dirent_alloc(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 			lgfs2_bmodified(dip->i_bh);
 			return 0;
 		}
-	} while (gfs2_dirent_next(dip, bh, &dent) == 0);
+	} while (lgfs2_dirent_next(dip, bh, &dent) == 0);
 
 	errno = ENOSPC;
 	return -1;
 }
 
-void dirent2_del(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
-		 struct gfs2_dirent *prev, struct gfs2_dirent *cur)
+void lgfs2_dirent2_del(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
+                       struct gfs2_dirent *prev, struct gfs2_dirent *cur)
 {
 	uint16_t cur_rec_len, prev_rec_len;
 
@@ -882,7 +881,7 @@ void dirent2_del(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 int lgfs2_get_leaf_ptr(struct gfs2_inode *dip, const uint32_t lindex, uint64_t *ptr)
 {
 	__be64 leaf_no;
-	int count = gfs2_readi(dip, (char *)&leaf_no, lindex * sizeof(__be64), sizeof(__be64));
+	int count = lgfs2_readi(dip, (char *)&leaf_no, lindex * sizeof(__be64), sizeof(__be64));
 	if (count != sizeof(__be64))
 		return -1;
 
@@ -890,7 +889,7 @@ int lgfs2_get_leaf_ptr(struct gfs2_inode *dip, const uint32_t lindex, uint64_t *
 	return 0;
 }
 
-void dir_split_leaf(struct gfs2_inode *dip, uint32_t start, uint64_t leaf_no,
+void lgfs2_dir_split_leaf(struct gfs2_inode *dip, uint32_t start, uint64_t leaf_no,
 		    struct gfs2_buffer_head *obh)
 {
 	struct gfs2_buffer_head *nbh;
@@ -939,10 +938,10 @@ void dir_split_leaf(struct gfs2_inode *dip, uint32_t start, uint64_t leaf_no,
 		count = gfs1_writei(dip, (char *)lp, start * sizeof(uint64_t),
 				    half_len * sizeof(uint64_t));
 	else
-		count = gfs2_writei(dip, (char *)lp, start * sizeof(uint64_t),
+		count = lgfs2_writei(dip, (char *)lp, start * sizeof(uint64_t),
 				    half_len * sizeof(uint64_t));
 	if (count != half_len * sizeof(uint64_t)) {
-		fprintf(stderr, "dir_split_leaf (2)\n");
+		fprintf(stderr, "lgfs2_dir_split_leaf (2)\n");
 		exit(1);
 	}
 
@@ -950,11 +949,11 @@ void dir_split_leaf(struct gfs2_inode *dip, uint32_t start, uint64_t leaf_no,
 
 	divider = (start + half_len) << (32 - dip->i_depth);
 
-	gfs2_dirent_first(dip, obh, &dent);
+	lgfs2_dirent_first(dip, obh, &dent);
 
 	do {
 		next = dent;
-		if (gfs2_dirent_next(dip, obh, &next))
+		if (lgfs2_dirent_next(dip, obh, &next))
 			next = NULL;
 
 		if (dent->de_inum.no_formal_ino &&
@@ -964,7 +963,7 @@ void dir_split_leaf(struct gfs2_inode *dip, uint32_t start, uint64_t leaf_no,
 			name_len = be16_to_cpu(dent->de_name_len);
 
 			if (dirent_alloc(dip, nbh, name_len, &new)) {
-				fprintf(stderr, "dir_split_leaf (3)\n");
+				fprintf(stderr, "lgfs2_dir_split_leaf (3)\n");
 				exit(1);
 			}
 
@@ -976,7 +975,7 @@ void dir_split_leaf(struct gfs2_inode *dip, uint32_t start, uint64_t leaf_no,
 			entries = be16_to_cpu(nleaf->lf_entries) + 1;
 			nleaf->lf_entries = cpu_to_be16(entries);
 
-			dirent2_del(dip, obh, prev, dent);
+			lgfs2_dirent2_del(dip, obh, prev, dent);
 
 			if (!prev)
 				prev = dent;
@@ -990,7 +989,7 @@ void dir_split_leaf(struct gfs2_inode *dip, uint32_t start, uint64_t leaf_no,
 
 	if (!moved) {
 		if (dirent_alloc(dip, nbh, 0, &new)) {
-			fprintf(stderr, "dir_split_leaf (4)\n");
+			fprintf(stderr, "lgfs2_dir_split_leaf (4)\n");
 			exit(1);
 		}
 		new->de_inum.no_formal_ino = 0;
@@ -1027,7 +1026,7 @@ static void dir_double_exhash(struct gfs2_inode *dip)
 	}
 
 	for (block = dip->i_size >> sdp->sd_hash_bsize_shift; block--;) {
-		count = gfs2_readi(dip, (char *)buf,
+		count = lgfs2_readi(dip, (char *)buf,
 			      block * sdp->sd_hash_bsize,
 			      sdp->sd_hash_bsize);
 		if (count != sdp->sd_hash_bsize) {
@@ -1048,7 +1047,7 @@ static void dir_double_exhash(struct gfs2_inode *dip)
 					    sdp->sd_hash_bsize,
 					    block * sdp->sd_bsize, sdp->sd_bsize);
 		else
-			count = gfs2_writei(dip, (char *)buf +
+			count = lgfs2_writei(dip, (char *)buf +
 					    sdp->sd_hash_bsize,
 					    block * sdp->sd_bsize, sdp->sd_bsize);
 		if (count != sdp->sd_bsize) {
@@ -1072,7 +1071,7 @@ static void dir_double_exhash(struct gfs2_inode *dip)
  * Returns: 0 on success, error code otherwise
  */
 
-int gfs2_get_leaf(struct gfs2_inode *dip, uint64_t leaf_no,
+int lgfs2_get_leaf(struct gfs2_inode *dip, uint64_t leaf_no,
 				  struct gfs2_buffer_head **bhp)
 {
 	int error = 0;
@@ -1172,7 +1171,7 @@ restart:
 			if (be16_to_cpu(leaf->lf_depth) < dip->i_depth) {
 				llen = 1 << (dip->i_depth -
 					     be16_to_cpu(leaf->lf_depth));
-				dir_split_leaf(dip, lindex & ~(llen - 1),
+				lgfs2_dir_split_leaf(dip, lindex & ~(llen - 1),
 					       leaf_no, bh);
 				lgfs2_brelse(bh);
 				goto restart;
@@ -1264,14 +1263,14 @@ static void dir_make_exhash(struct gfs2_inode *dip)
 			 dip->i_bh, sizeof(struct gfs2_dinode));
 
 	x = 0;
-	gfs2_dirent_first(dip, bh, &dent);
+	lgfs2_dirent_first(dip, bh, &dent);
 
 	do {
 		if (!dent->de_inum.no_formal_ino)
 			continue;
 		if (++x == dip->i_entries)
 			break;
-	} while (gfs2_dirent_next(dip, bh, &dent) == 0);
+	} while (lgfs2_dirent_next(dip, bh, &dent) == 0);
 
 	rec_len = be16_to_cpu(dent->de_rec_len) +
 		sizeof(struct gfs2_dinode) - sizeof(struct gfs2_leaf);
@@ -1322,8 +1321,8 @@ static int dir_l_add(struct gfs2_inode *dip, const char *filename, int len,
 	return err;
 }
 
-int dir_add(struct gfs2_inode *dip, const char *filename, int len,
-	     struct lgfs2_inum *inum, unsigned int type)
+int lgfs2_dir_add(struct gfs2_inode *dip, const char *filename, int len,
+                  struct lgfs2_inum *inum, unsigned int type)
 {
 	int err = 0;
 	if (dip->i_flags & GFS2_DIF_EXHASH)
@@ -1411,8 +1410,8 @@ static int __init_dinode(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhp, st
 	return 0;
 }
 
-int init_dinode(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhp, struct lgfs2_inum *inum,
-                unsigned int mode, uint32_t flags, struct lgfs2_inum *parent)
+int lgfs2_init_dinode(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhp, struct lgfs2_inum *inum,
+                      unsigned int mode, uint32_t flags, struct lgfs2_inum *parent)
 {
 	return __init_dinode(sdp, bhp, inum, mode, flags, parent, 0);
 }
@@ -1452,17 +1451,17 @@ int lgfs2_write_filemeta(struct gfs2_inode *ip)
 	if (bh == NULL)
 		return 1;
 
-	/* Using find_metapath() to find the last data block in the file will
+	/* Using lgfs2_find_metapath() to find the last data block in the file will
 	   effectively give a remainder for the number of pointers at each
 	   height. Just need to add 1 to convert ptr index to quantity later. */
-	find_metapath(ip, dblocks - 1, &mp);
+	lgfs2_find_metapath(ip, dblocks - 1, &mp);
 
 	for (height = 0; height < ip->i_height; height++) {
 		unsigned p;
 		/* The number of pointers in this height will be the number of
 		   full indirect blocks pointed to by the previous height
 		   multiplied by the pointer capacity of an indirect block,
-		   plus the remainder which find_metapath() gave us. */
+		   plus the remainder which lgfs2_find_metapath() gave us. */
 		ptrs = ((ptrs - 1) * sdp->sd_inptrs) + mp.mp_list[height] + 1;
 
 		for (p = 0; p < ptrs; bh->b_blocknr++) {
@@ -1498,7 +1497,7 @@ static struct gfs2_inode *__createi(struct gfs2_inode *dip,
 	int err = 0;
 	int is_dir;
 
-	gfs2_lookupi(dip, filename, strlen(filename), &ip);
+	lgfs2_lookupi(dip, filename, strlen(filename), &ip);
 	if (!ip) {
 		struct lgfs2_inum parent = dip->i_num;
 
@@ -1512,7 +1511,7 @@ static struct gfs2_inode *__createi(struct gfs2_inode *dip,
 			inum.in_formal_ino = sdp->md.next_inum++;
 		inum.in_addr = bn;
 
-		err = dir_add(dip, filename, strlen(filename), &inum, IF2DT(mode));
+		err = lgfs2_dir_add(dip, filename, strlen(filename), &inum, IF2DT(mode));
 		if (err)
 			return NULL;
 
@@ -1538,14 +1537,14 @@ static struct gfs2_inode *__createi(struct gfs2_inode *dip,
 	return ip;
 }
 
-struct gfs2_inode *createi(struct gfs2_inode *dip, const char *filename,
-			   unsigned int mode, uint32_t flags)
+struct gfs2_inode *lgfs2_createi(struct gfs2_inode *dip, const char *filename,
+                                 unsigned int mode, uint32_t flags)
 {
 	return __createi(dip, filename, mode, flags, 0);
 }
 
-struct gfs2_inode *gfs_createi(struct gfs2_inode *dip, const char *filename,
-			   unsigned int mode, uint32_t flags)
+struct gfs2_inode *lgfs2_gfs_createi(struct gfs2_inode *dip, const char *filename,
+                                     unsigned int mode, uint32_t flags)
 {
 	return __createi(dip, filename, mode, flags, 1);
 }
@@ -1589,7 +1588,7 @@ static int leaf_search(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 	unsigned int entries = 0, x = 0;
 	int type;
 
-	type = gfs2_dirent_first(dip, bh, &dent);
+	type = lgfs2_dirent_first(dip, bh, &dent);
 
 	if (type == IS_LEAF){
 		struct gfs2_leaf *leaf = (struct gfs2_leaf *)bh->b_data;
@@ -1606,7 +1605,7 @@ static int leaf_search(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 			prev = dent;
 			continue;
 		}
-		
+
 		if (be32_to_cpu(dent->de_hash) == hash &&
 			gfs2_filecmp(filename, (char *)(dent + 1),
 				     be16_to_cpu(dent->de_name_len))) {
@@ -1615,12 +1614,12 @@ static int leaf_search(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 				*dent_prev = prev;
 			return 0;
 		}
-		
+
 		if(x >= entries)
 			return -1;
 		x++;
 		prev = dent;
-	} while (gfs2_dirent_next(dip, bh, &dent) == 0);
+	} while (lgfs2_dirent_next(dip, bh, &dent) == 0);
 
 	return -ENOENT;
 }
@@ -1747,7 +1746,7 @@ static int dir_l_search(struct gfs2_inode *dip, const char *filename,
 }
 
 /**
- * dir_search - Search a directory
+ * lgfs2_dir_search - Search a directory
  * @dip: The GFS inode
  * @id
  * @type:
@@ -1759,8 +1758,8 @@ static int dir_l_search(struct gfs2_inode *dip, const char *filename,
  *
  * Returns: 0 if found, -1 on failure, -ENOENT if not found.
  */
-int dir_search(struct gfs2_inode *dip, const char *filename, int len,
-		      unsigned int *type, struct lgfs2_inum *inum)
+int lgfs2_dir_search(struct gfs2_inode *dip, const char *filename, int len,
+                     unsigned int *type, struct lgfs2_inum *inum)
 {
 	int error;
 
@@ -1810,7 +1809,7 @@ static int dir_e_del(struct gfs2_inode *dip, const char *filename, int len)
 		return 1;
 
 	if (bh) {
-		dirent2_del(dip, bh, prev, cur);
+		lgfs2_dirent2_del(dip, bh, prev, cur);
 		lgfs2_brelse(bh);
 	}
 	return 0;
@@ -1832,13 +1831,13 @@ static int dir_l_del(struct gfs2_inode *dip, const char *filename, int len)
 			return -1;
 	}
 
-	dirent2_del(dip, dip->i_bh, prev, cur);
+	lgfs2_dirent2_del(dip, dip->i_bh, prev, cur);
 	return 0;
 }
 
 
 /*
- * gfs2_dirent_del
+ * lgfs2_dirent_del
  * @dip
  * filename
  *
@@ -1848,7 +1847,7 @@ static int dir_l_del(struct gfs2_inode *dip, const char *filename, int len)
  *
  * Returns: 0 on success (or if it doesn't already exist), -1 on failure
  */
-int gfs2_dirent_del(struct gfs2_inode *dip, const char *filename, int len)
+int lgfs2_dirent_del(struct gfs2_inode *dip, const char *filename, int len)
 {
 	int error;
 
@@ -1864,15 +1863,15 @@ int gfs2_dirent_del(struct gfs2_inode *dip, const char *filename, int len)
 }
 
 /**
- * gfs2_lookupi - Look up a filename in a directory and return its inode
+ * lgfs2_lookupi - Look up a filename in a directory and return its inode
  * @dip: The directory to search
  * @name: The name of the inode to look for
  * @ipp: Used to return the found inode if any
  *
  * Returns: 0 on success, -EXXXX on failure
  */
-int gfs2_lookupi(struct gfs2_inode *dip, const char *filename, int len,
-		 struct gfs2_inode **ipp)
+int lgfs2_lookupi(struct gfs2_inode *dip, const char *filename, int len,
+                  struct gfs2_inode **ipp)
 {
 	struct gfs2_sbd *sdp = dip->i_sbd;
 	int error = 0;
@@ -1886,7 +1885,7 @@ int gfs2_lookupi(struct gfs2_inode *dip, const char *filename, int len,
 		*ipp = dip;
 		return 0;
 	}
-	error = dir_search(dip, filename, len, NULL, &inum);
+	error = lgfs2_dir_search(dip, filename, len, NULL, &inum);
 	if (!error)
 		*ipp = lgfs2_inode_read(sdp, inum.in_addr);
 
@@ -1894,9 +1893,9 @@ int gfs2_lookupi(struct gfs2_inode *dip, const char *filename, int len,
 }
 
 /**
- * gfs2_free_block - free up a block given its block number
+ * lgfs2_free_block - free up a block given its block number
  */
-void gfs2_free_block(struct gfs2_sbd *sdp, uint64_t block)
+void lgfs2_free_block(struct gfs2_sbd *sdp, uint64_t block)
 {
 	struct rgrp_tree *rgd;
 
@@ -1915,10 +1914,10 @@ void gfs2_free_block(struct gfs2_sbd *sdp, uint64_t block)
 }
 
 /**
- * gfs2_freedi - unlink a disk inode by block number.
+ * lgfs2_freedi - unlink a disk inode by block number.
  * Note: currently only works for regular files.
  */
-int gfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
+int lgfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
 {
 	struct gfs2_inode *ip;
 	struct gfs2_buffer_head *bh, *nbh;
@@ -1958,7 +1957,7 @@ int gfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
 					continue;
 
 				block = be64_to_cpu(*ptr);
-				gfs2_free_block(sdp, block);
+				lgfs2_free_block(sdp, block);
 				if (h == height - 1) /* if not metadata */
 					continue; /* don't queue it up */
 				/* Read the next metadata block in the chain */
@@ -1970,8 +1969,8 @@ int gfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
 	}
 	rgd = gfs2_blk2rgrpd(sdp, diblock);
 	gfs2_set_bitmap(rgd, diblock, GFS2_BLKST_FREE);
-	inode_put(&ip);
-	/* inode_put deallocated the extra block used by the disk inode, */
+	lgfs2_inode_put(&ip);
+	/* lgfs2_inode_put deallocated the extra block used by the disk inode, */
 	/* so adjust it in the superblock struct */
 	sdp->blks_alloced--;
 	rgd->rt_free++;
diff --git a/gfs2/libgfs2/gfs1.c b/gfs2/libgfs2/gfs1.c
index 79da01a4..5cee3df8 100644
--- a/gfs2/libgfs2/gfs1.c
+++ b/gfs2/libgfs2/gfs1.c
@@ -95,15 +95,15 @@ void gfs1_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 
 	bsize = (fs_is_jdata(ip)) ? sdp->sd_jbsize : sdp->sd_bsize;
 
-	height = calc_tree_height(ip, (lblock + 1) * bsize);
+	height = lgfs2_calc_tree_height(ip, (lblock + 1) * bsize);
 	if (ip->i_height < height) {
 		if (!create)
 			return;
 
-		build_height(ip, height);
+		lgfs2_build_height(ip, height);
 	}
 
-	find_metapath(ip, lblock, &mp);
+	lgfs2_find_metapath(ip, lblock, &mp);
 	end_of_metadata = ip->i_height - 1;
 
 	bh = ip->i_bh;
@@ -181,7 +181,7 @@ int gfs1_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
 
 	if (!ip->i_height && /* stuffed */
 	    ((start + size) > (sdp->sd_bsize - sizeof(struct gfs_dinode))))
-		unstuff_dinode(ip);
+		lgfs2_unstuff_dinode(ip);
 
 	if (journaled) {
 		lblock = offset / sdp->sd_jbsize;
diff --git a/gfs2/libgfs2/gfs2l.c b/gfs2/libgfs2/gfs2l.c
index cc4f94fc..12862507 100644
--- a/gfs2/libgfs2/gfs2l.c
+++ b/gfs2/libgfs2/gfs2l.c
@@ -139,7 +139,7 @@ static int openfs(const char *path, struct gfs2_sbd *sdp)
 	}
 
 	sdp->master_dir = lgfs2_inode_read(sdp, sdp->sd_meta_dir.in_addr);
-	gfs2_lookupi(sdp->master_dir, "rindex", 6, &sdp->md.riinode);
+	lgfs2_lookupi(sdp->master_dir, "rindex", 6, &sdp->md.riinode);
 	sdp->fssize = sdp->device.length;
 	if (sdp->md.riinode) {
 		rindex_read(sdp, &count, &ok);
@@ -191,8 +191,8 @@ int main(int argc, char *argv[])
 	}
 
 	gfs2_rgrp_free(&sbd, &sbd.rgtree);
-	inode_put(&sbd.md.riinode);
-	inode_put(&sbd.master_dir);
+	lgfs2_inode_put(&sbd.md.riinode);
+	lgfs2_inode_put(&sbd.master_dir);
 	lgfs2_lang_free(&state);
 	free(opts.fspath);
 	return 0;
diff --git a/gfs2/libgfs2/lang.c b/gfs2/libgfs2/lang.c
index dd46cd21..6b5d4449 100644
--- a/gfs2/libgfs2/lang.c
+++ b/gfs2/libgfs2/lang.c
@@ -163,12 +163,12 @@ static uint64_t ast_lookup_path(char *path, struct gfs2_sbd *sbd)
 	while (ip != NULL) {
 		if (segment == NULL) { // No more segments
 			bn = ip->i_num.in_addr;
-			inode_put(&ip);
+			lgfs2_inode_put(&ip);
 			return bn;
 		}
 		ast_string_unescape(segment);
-		err = gfs2_lookupi(ip, segment, strlen(segment), &iptmp);
-		inode_put(&ip);
+		err = lgfs2_lookupi(ip, segment, strlen(segment), &iptmp);
+		lgfs2_inode_put(&ip);
 		if (err != 0) {
 			errno = -err;
 			break;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 05a90900..d4f232ce 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -500,62 +500,61 @@ extern uint32_t rgblocks2bitblocks(const unsigned int bsize, const uint32_t rgbl
 #define IS_LEAF     (1)
 #define IS_DINODE   (2)
 
-extern void find_metapath(struct gfs2_inode *ip, uint64_t block, struct metapath *mp);
-extern void lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
+extern void lgfs2_find_metapath(struct gfs2_inode *ip, uint64_t block, struct metapath *mp);
+extern void lgfs2_lookup_block(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
 			 unsigned int height, struct metapath *mp,
 			 int create, int *new, uint64_t *block);
 extern struct gfs2_inode *lgfs2_inode_get(struct gfs2_sbd *sdp,
 				    struct gfs2_buffer_head *bh);
 extern struct gfs2_inode *lgfs2_inode_read(struct gfs2_sbd *sdp, uint64_t di_addr);
-extern struct gfs2_inode *is_system_inode(struct gfs2_sbd *sdp,
+extern struct gfs2_inode *lgfs2_is_system_inode(struct gfs2_sbd *sdp,
 					  uint64_t block);
-extern void inode_put(struct gfs2_inode **ip);
-extern uint64_t data_alloc(struct gfs2_inode *ip);
+extern void lgfs2_inode_put(struct gfs2_inode **ip);
+extern uint64_t lgfs2_data_alloc(struct gfs2_inode *ip);
 extern int lgfs2_meta_alloc(struct gfs2_inode *ip, uint64_t *blkno);
 extern int lgfs2_dinode_alloc(struct gfs2_sbd *sdp, const uint64_t blksreq, uint64_t *blkno);
 extern uint64_t lgfs2_space_for_data(const struct gfs2_sbd *sdp, unsigned bsize, uint64_t bytes);
 extern int lgfs2_file_alloc(lgfs2_rgrp_t rg, uint64_t di_size, struct gfs2_inode *ip, uint32_t flags, unsigned mode);
 
-extern int gfs2_readi(struct gfs2_inode *ip, void *buf, uint64_t offset,
+extern int lgfs2_readi(struct gfs2_inode *ip, void *buf, uint64_t offset,
 		      unsigned int size);
-#define gfs2_writei(ip, buf, offset, size) \
-	__gfs2_writei(ip, buf, offset, size, 1)
-extern int __gfs2_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
+#define lgfs2_writei(ip, buf, offset, size) \
+	__lgfs2_writei(ip, buf, offset, size, 1)
+extern int __lgfs2_writei(struct gfs2_inode *ip, void *buf, uint64_t offset,
 			 unsigned int size, int resize);
-extern int init_dinode(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhp, struct lgfs2_inum *inum,
+extern int lgfs2_init_dinode(struct gfs2_sbd *sdp, struct gfs2_buffer_head **bhp, struct lgfs2_inum *inum,
                        unsigned int mode, uint32_t flags, struct lgfs2_inum *parent);
-extern struct gfs2_inode *createi(struct gfs2_inode *dip, const char *filename,
+extern struct gfs2_inode *lgfs2_createi(struct gfs2_inode *dip, const char *filename,
 				  unsigned int mode, uint32_t flags);
-extern struct gfs2_inode *gfs_createi(struct gfs2_inode *dip,
+extern struct gfs2_inode *lgfs2_gfs_createi(struct gfs2_inode *dip,
 				      const char *filename, unsigned int mode,
 				      uint32_t flags);
-extern void dirent2_del(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
+extern void lgfs2_dirent2_del(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 			struct gfs2_dirent *prev, struct gfs2_dirent *cur);
-extern int dir_search(struct gfs2_inode *dip, const char *filename, int len,
+extern int lgfs2_dir_search(struct gfs2_inode *dip, const char *filename, int len,
 		      unsigned int *type, struct lgfs2_inum *inum);
-extern int gfs2_lookupi(struct gfs2_inode *dip, const char *filename, int len,
+extern int lgfs2_lookupi(struct gfs2_inode *dip, const char *filename, int len,
 			struct gfs2_inode **ipp);
-extern int dir_add(struct gfs2_inode *dip, const char *filename, int len,
+extern int lgfs2_dir_add(struct gfs2_inode *dip, const char *filename, int len,
 		    struct lgfs2_inum *inum, unsigned int type);
-extern int gfs2_dirent_del(struct gfs2_inode *dip, const char *filename,
-			   int filename_len);
-extern void block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
+extern int lgfs2_dirent_del(struct gfs2_inode *dip, const char *filename, int name_len);
+extern void lgfs2_block_map(struct gfs2_inode *ip, uint64_t lblock, int *new,
 		      uint64_t *dblock, uint32_t *extlen, int prealloc);
 extern int lgfs2_get_leaf_ptr(struct gfs2_inode *dip, uint32_t index, uint64_t *ptr) __attribute__((warn_unused_result));
-extern void dir_split_leaf(struct gfs2_inode *dip, uint32_t start,
+extern void lgfs2_dir_split_leaf(struct gfs2_inode *dip, uint32_t start,
 			   uint64_t leaf_no, struct gfs2_buffer_head *obh);
-extern void gfs2_free_block(struct gfs2_sbd *sdp, uint64_t block);
-extern int gfs2_freedi(struct gfs2_sbd *sdp, uint64_t block);
-extern int gfs2_get_leaf(struct gfs2_inode *dip, uint64_t leaf_no,
+extern void lgfs2_free_block(struct gfs2_sbd *sdp, uint64_t block);
+extern int lgfs2_freedi(struct gfs2_sbd *sdp, uint64_t block);
+extern int lgfs2_get_leaf(struct gfs2_inode *dip, uint64_t leaf_no,
 			 struct gfs2_buffer_head **bhp);
-extern int gfs2_dirent_first(struct gfs2_inode *dip,
+extern int lgfs2_dirent_first(struct gfs2_inode *dip,
 			     struct gfs2_buffer_head *bh,
 			     struct gfs2_dirent **dent);
-extern int gfs2_dirent_next(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
+extern int lgfs2_dirent_next(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 			    struct gfs2_dirent **dent);
-extern void build_height(struct gfs2_inode *ip, int height);
-extern void unstuff_dinode(struct gfs2_inode *ip);
-extern unsigned int calc_tree_height(struct gfs2_inode *ip, uint64_t size);
+extern void lgfs2_build_height(struct gfs2_inode *ip, int height);
+extern void lgfs2_unstuff_dinode(struct gfs2_inode *ip);
+extern unsigned int lgfs2_calc_tree_height(struct gfs2_inode *ip, uint64_t size);
 extern uint32_t lgfs2_log_header_hash(char *buf);
 extern uint32_t lgfs2_log_header_crc(char *buf, unsigned bsize);
 
diff --git a/gfs2/libgfs2/recovery.c b/gfs2/libgfs2/recovery.c
index 2edfe120..3984e1e3 100644
--- a/gfs2/libgfs2/recovery.c
+++ b/gfs2/libgfs2/recovery.c
@@ -28,7 +28,7 @@ int gfs2_replay_read_block(struct gfs2_inode *ip, unsigned int blk,
 	int new = 0;
 	uint64_t dblock;
 
-	block_map(ip, blk, &new, &dblock, NULL, 0);
+	lgfs2_block_map(ip, blk, &new, &dblock, NULL, 0);
 	if (!dblock)
 		return -EIO;
 
@@ -241,7 +241,7 @@ int lgfs2_clean_journal(struct gfs2_inode *ip, struct lgfs2_log_header *head)
 
 	lblock = head->lh_blkno;
 	gfs2_replay_incr_blk(ip, &lblock);
-	block_map(ip, lblock, &new, &dblock, NULL, 0);
+	lgfs2_block_map(ip, lblock, &new, &dblock, NULL, 0);
 	if (!dblock)
 		return -EIO;
 
diff --git a/gfs2/libgfs2/rgrp.c b/gfs2/libgfs2/rgrp.c
index c6dfb228..4a522546 100644
--- a/gfs2/libgfs2/rgrp.c
+++ b/gfs2/libgfs2/rgrp.c
@@ -483,7 +483,7 @@ lgfs2_rgrp_t lgfs2_rindex_read_one(struct gfs2_inode *rip, lgfs2_rgrps_t rgs, un
 	if (rip == NULL || rgs == NULL)
 		return NULL;
 
-	ret = gfs2_readi(rip, &ri, off, sizeof(struct gfs2_rindex));
+	ret = lgfs2_readi(rip, &ri, off, sizeof(struct gfs2_rindex));
 	if (ret != sizeof(struct gfs2_rindex))
 		return NULL;
 
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index 3bf876ea..ff4c5522 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -29,7 +29,7 @@ int lgfs2_build_master(struct gfs2_sbd *sdp)
 	inum.in_formal_ino = sdp->md.next_inum++;
 	inum.in_addr = bn;
 
-	err = init_dinode(sdp, &bh, &inum, S_IFDIR | 0755, GFS2_DIF_SYSTEM, &inum);
+	err = lgfs2_init_dinode(sdp, &bh, &inum, S_IFDIR | 0755, GFS2_DIF_SYSTEM, &inum);
 	if (err != 0)
 		return -1;
 
@@ -158,9 +158,9 @@ static struct gfs2_buffer_head *lgfs2_get_file_buf(struct gfs2_inode *ip, uint64
 	int new = 1;
 
 	if (ip->i_height == 0)
-		unstuff_dinode(ip);
+		lgfs2_unstuff_dinode(ip);
 
-	block_map(ip, lbn, &new, &dbn, NULL, prealloc);
+	lgfs2_block_map(ip, lbn, &new, &dbn, NULL, prealloc);
 	if (!dbn)
 		return NULL;
 
@@ -185,8 +185,8 @@ int lgfs2_write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned int blo
 
 	/* Build the height up so our journal blocks will be contiguous and */
 	/* not broken up by indirect block pages.                           */
-	height = calc_tree_height(jnl, (blocks + 1) * bsize);
-	build_height(jnl, height);
+	height = lgfs2_calc_tree_height(jnl, (blocks + 1) * bsize);
+	lgfs2_build_height(jnl, height);
 
 	for (x = 0; x < blocks; x++) {
 		struct gfs2_buffer_head *bh = lgfs2_get_file_buf(jnl, x, 1);
@@ -233,8 +233,8 @@ int lgfs2_build_journal(struct gfs2_sbd *sdp, int j, struct gfs2_inode *jindex)
 	int ret;
 
 	sprintf(name, "journal%u", j);
-	sdp->md.journal[j] = createi(jindex, name, S_IFREG | 0600,
-				     GFS2_DIF_SYSTEM);
+	sdp->md.journal[j] = lgfs2_createi(jindex, name, S_IFREG | 0600,
+	                                   GFS2_DIF_SYSTEM);
 	if (sdp->md.journal[j] == NULL) {
 		return errno;
 	}
@@ -259,7 +259,7 @@ struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *master, struct lgfs2_in
 		errno = EINVAL;
 		return NULL;
 	}
-	jindex = createi(master, "jindex", S_IFDIR | 0700, GFS2_DIF_SYSTEM);
+	jindex = lgfs2_createi(master, "jindex", S_IFDIR | 0700, GFS2_DIF_SYSTEM);
 	if (jindex == NULL)
 		return NULL;
 
@@ -269,9 +269,9 @@ struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *master, struct lgfs2_in
 		int ret;
 
 		snprintf(fname, GFS2_FNAMESIZE, "journal%u", j);
-		ret = dir_add(jindex, fname, strlen(fname), &jnls[j], IF2DT(S_IFREG | 0600));
+		ret = lgfs2_dir_add(jindex, fname, strlen(fname), &jnls[j], IF2DT(S_IFREG | 0600));
 		if (ret) {
-			inode_put(&jindex);
+			lgfs2_inode_put(&jindex);
 			return NULL;
 		}
 	}
@@ -284,7 +284,7 @@ struct gfs2_inode *lgfs2_build_inum_range(struct gfs2_inode *per_node, unsigned
 	struct gfs2_inode *ip;
 
 	sprintf(name, "inum_range%u", j);
-	ip = createi(per_node, name, S_IFREG | 0600,
+	ip = lgfs2_createi(per_node, name, S_IFREG | 0600,
 		     GFS2_DIF_SYSTEM | GFS2_DIF_JDATA);
 	if (ip == NULL)
 		return NULL;
@@ -301,7 +301,7 @@ struct gfs2_inode *lgfs2_build_statfs_change(struct gfs2_inode *per_node, unsign
 	struct gfs2_inode *ip;
 
 	sprintf(name, "statfs_change%u", j);
-	ip = createi(per_node, name, S_IFREG | 0600,
+	ip = lgfs2_createi(per_node, name, S_IFREG | 0600,
 		     GFS2_DIF_SYSTEM | GFS2_DIF_JDATA);
 	if (ip == NULL)
 		return NULL;
@@ -329,12 +329,12 @@ struct gfs2_inode *lgfs2_build_quota_change(struct gfs2_inode *per_node, unsigne
 	mh.mh_format = cpu_to_be32(GFS2_FORMAT_QC);
 
 	sprintf(name, "quota_change%u", j);
-	ip = createi(per_node, name, S_IFREG | 0600, GFS2_DIF_SYSTEM);
+	ip = lgfs2_createi(per_node, name, S_IFREG | 0600, GFS2_DIF_SYSTEM);
 	if (ip == NULL)
 		return NULL;
 
-	hgt = calc_tree_height(ip, (blocks + 1) * sdp->sd_bsize);
-	build_height(ip, hgt);
+	hgt = lgfs2_calc_tree_height(ip, (blocks + 1) * sdp->sd_bsize);
+	lgfs2_build_height(ip, hgt);
 
 	for (x = 0; x < blocks; x++) {
 		bh = lgfs2_get_file_buf(ip, x, 0);
@@ -353,7 +353,7 @@ struct gfs2_inode *lgfs2_build_inum(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *ip;
 
-	ip = createi(sdp->master_dir, "inum", S_IFREG | 0600,
+	ip = lgfs2_createi(sdp->master_dir, "inum", S_IFREG | 0600,
 		     GFS2_DIF_SYSTEM | GFS2_DIF_JDATA);
 	return ip;
 }
@@ -362,7 +362,7 @@ struct gfs2_inode *lgfs2_build_statfs(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *ip;
 
-	ip = createi(sdp->master_dir, "statfs", S_IFREG | 0600,
+	ip = lgfs2_createi(sdp->master_dir, "statfs", S_IFREG | 0600,
 		     GFS2_DIF_SYSTEM | GFS2_DIF_JDATA);
 	return ip;
 }
@@ -375,7 +375,7 @@ struct gfs2_inode *lgfs2_build_rindex(struct gfs2_sbd *sdp)
 	char buf[sizeof(struct gfs2_rindex)];
 	int count;
 
-	ip = createi(sdp->master_dir, "rindex", S_IFREG | 0600,
+	ip = lgfs2_createi(sdp->master_dir, "rindex", S_IFREG | 0600,
 		     GFS2_DIF_SYSTEM | GFS2_DIF_JDATA);
 	if (ip == NULL)
 		return NULL;
@@ -389,12 +389,12 @@ struct gfs2_inode *lgfs2_build_rindex(struct gfs2_sbd *sdp)
 
 		lgfs2_rindex_out(rl, buf);
 
-		count = gfs2_writei(ip, buf, ip->i_size, sizeof(struct gfs2_rindex));
+		count = lgfs2_writei(ip, buf, ip->i_size, sizeof(struct gfs2_rindex));
 		if (count != sizeof(struct gfs2_rindex))
 			return NULL;
 	}
 	memset(buf, 0, sizeof(struct gfs2_rindex));
-	count = __gfs2_writei(ip, buf, ip->i_size, sizeof(struct gfs2_rindex), 0);
+	count = __lgfs2_writei(ip, buf, ip->i_size, sizeof(struct gfs2_rindex), 0);
 	if (count != sizeof(struct gfs2_rindex))
 		return NULL;
 
@@ -407,7 +407,7 @@ struct gfs2_inode *lgfs2_build_quota(struct gfs2_sbd *sdp)
 	struct gfs2_quota qu;
 	int count;
 
-	ip = createi(sdp->master_dir, "quota", S_IFREG | 0600,
+	ip = lgfs2_createi(sdp->master_dir, "quota", S_IFREG | 0600,
 		     GFS2_DIF_SYSTEM | GFS2_DIF_JDATA);
 	if (ip == NULL)
 		return NULL;
@@ -418,10 +418,10 @@ struct gfs2_inode *lgfs2_build_quota(struct gfs2_sbd *sdp)
 	memset(&qu, 0, sizeof(struct gfs2_quota));
 	qu.qu_value = cpu_to_be64(1);
 
-	count = gfs2_writei(ip, &qu, ip->i_size, sizeof(struct gfs2_quota));
+	count = lgfs2_writei(ip, &qu, ip->i_size, sizeof(struct gfs2_quota));
 	if (count != sizeof(struct gfs2_quota))
 		return NULL;
-	count = gfs2_writei(ip, &qu, ip->i_size, sizeof(struct gfs2_quota));
+	count = lgfs2_writei(ip, &qu, ip->i_size, sizeof(struct gfs2_quota));
 	if (count != sizeof(struct gfs2_quota))
 		return NULL;
 
@@ -441,7 +441,7 @@ int lgfs2_build_root(struct gfs2_sbd *sdp)
 	inum.in_formal_ino = sdp->md.next_inum++;
 	inum.in_addr = bn;
 
-	err = init_dinode(sdp, &bh, &inum, S_IFDIR | 0755, 0, &inum);
+	err = lgfs2_init_dinode(sdp, &bh, &inum, S_IFDIR | 0755, 0, &inum);
 	if (err != 0)
 		return -1;
 
@@ -460,7 +460,7 @@ int lgfs2_init_inum(struct gfs2_sbd *sdp)
 	int count;
 
 	buf = cpu_to_be64(sdp->md.next_inum);
-	count = gfs2_writei(ip, &buf, 0, sizeof(uint64_t));
+	count = lgfs2_writei(ip, &buf, 0, sizeof(uint64_t));
 	if (count != sizeof(uint64_t))
 		return -1;
 
@@ -477,7 +477,7 @@ int lgfs2_init_statfs(struct gfs2_sbd *sdp, struct gfs2_statfs_change *res)
 	sc.sc_free = cpu_to_be64(sdp->blks_total - sdp->blks_alloced);
 	sc.sc_dinodes = cpu_to_be64(sdp->dinodes_alloced);
 
-	count = gfs2_writei(ip, &sc, 0, sizeof(sc));
+	count = lgfs2_writei(ip, &sc, 0, sizeof(sc));
 	if (count != sizeof(sc))
 		return -1;
 
diff --git a/gfs2/libgfs2/super.c b/gfs2/libgfs2/super.c
index 119f1cd0..b32c89c9 100644
--- a/gfs2/libgfs2/super.c
+++ b/gfs2/libgfs2/super.c
@@ -213,7 +213,7 @@ int rindex_read(struct gfs2_sbd *sdp, uint64_t *rgcount, int *ok)
 		struct gfs2_rindex ri;
 		uint64_t addr;
 
-		error = gfs2_readi(sdp->md.riinode, &ri,
+		error = lgfs2_readi(sdp->md.riinode, &ri,
 		                   rg * sizeof(struct gfs2_rindex),
 		                   sizeof(struct gfs2_rindex));
 		if (!error)
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 318c24f2..3b0f5b4e 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -686,7 +686,7 @@ static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 	struct gfs2_inode *per_node;
 	unsigned int j;
 
-	per_node = createi(sdp->master_dir, "per_node", S_IFDIR | 0700,
+	per_node = lgfs2_createi(sdp->master_dir, "per_node", S_IFDIR | 0700,
 			   GFS2_DIF_SYSTEM);
 	if (per_node == NULL) {
 		fprintf(stderr, _("Error building '%s': %s\n"), "per_node", strerror(errno));
@@ -705,7 +705,7 @@ static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 			printf("\nInum Range %u:\n", j);
 			dinode_print(ip->i_bh->b_data);
 		}
-		inode_put(&ip);
+		lgfs2_inode_put(&ip);
 
 		ip = lgfs2_build_statfs_change(per_node, j);
 		if (ip == NULL) {
@@ -717,7 +717,7 @@ static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 			printf("\nStatFS Change %u:\n", j);
 			dinode_print(ip->i_bh->b_data);
 		}
-		inode_put(&ip);
+		lgfs2_inode_put(&ip);
 
 		ip = lgfs2_build_quota_change(per_node, j);
 		if (ip == NULL) {
@@ -729,13 +729,13 @@ static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 			printf("\nQuota Change %u:\n", j);
 			dinode_print(ip->i_bh->b_data);
 		}
-		inode_put(&ip);
+		lgfs2_inode_put(&ip);
 	}
 	if (opts->debug) {
 		printf("\nper_node:\n");
 		dinode_print(per_node->i_bh->b_data);
 	}
-	inode_put(&per_node);
+	lgfs2_inode_put(&per_node);
 	return 0;
 }
 
@@ -1012,7 +1012,7 @@ static int create_jindex(struct gfs2_sbd *sdp, struct mkfs_opts *opts, struct lg
 		printf("Jindex:\n");
 		dinode_print(jindex->i_bh->b_data);
 	}
-	inode_put(&jindex);
+	lgfs2_inode_put(&jindex);
 	return 0;
 }
 
@@ -1325,7 +1325,7 @@ int main(int argc, char *argv[])
 		printf("\nResource Index:\n");
 		dinode_print(ip->i_bh->b_data);
 	}
-	inode_put(&ip);
+	lgfs2_inode_put(&ip);
 	if (!opts.quiet) {
 		printf("%s", _("Creating quota file: "));
 		fflush(stdout);
@@ -1339,7 +1339,7 @@ int main(int argc, char *argv[])
 		printf("\nQuota:\n");
 		dinode_print(ip->i_bh->b_data);
 	}
-	inode_put(&ip);
+	lgfs2_inode_put(&ip);
 	if (!opts.quiet)
 		printf("%s", _("Done\n"));
 
@@ -1364,10 +1364,10 @@ int main(int argc, char *argv[])
 		printf("\nStatfs:\n");
 		statfs_change_print(&sc);
 	}
-	inode_put(&sbd.md.rooti);
-	inode_put(&sbd.master_dir);
-	inode_put(&sbd.md.inum);
-	inode_put(&sbd.md.statfs);
+	lgfs2_inode_put(&sbd.md.rooti);
+	lgfs2_inode_put(&sbd.master_dir);
+	lgfs2_inode_put(&sbd.md.inum);
+	lgfs2_inode_put(&sbd.md.statfs);
 
 	lgfs2_rgrps_free(&rgs);
 
diff --git a/tests/nukerg.c b/tests/nukerg.c
index a831e459..81424e17 100644
--- a/tests/nukerg.c
+++ b/tests/nukerg.c
@@ -232,7 +232,7 @@ static int nuke_ris(struct gfs2_sbd *sdp, lgfs2_rgrps_t rgs, unsigned *rinums, s
 			printf("Nuking rindex entry %u.\n", i);
 
 			off = i * sizeof(struct gfs2_rindex);
-			bytes = gfs2_writei(sdp->md.riinode, &blankri, off,
+			bytes = lgfs2_writei(sdp->md.riinode, &blankri, off,
 						sizeof(struct gfs2_rindex));
 			if (bytes != sizeof(struct gfs2_rindex)) {
 				fprintf(stderr, "Write failed (%d bytes): %s",
@@ -250,7 +250,7 @@ static lgfs2_rgrps_t read_rindex(struct gfs2_sbd *sdp)
 	unsigned rgcount;
 	unsigned i;
 
-	gfs2_lookupi(sdp->master_dir, "rindex", 6, &sdp->md.riinode);
+	lgfs2_lookupi(sdp->master_dir, "rindex", 6, &sdp->md.riinode);
 	if (sdp->md.riinode == NULL) {
 		perror("Failed to look up rindex");
 		return NULL;
@@ -336,8 +336,8 @@ int main(int argc, char **argv)
 	if (opts.got_rinums && nuke_ris(&sbd, rgs, opts.rinums, opts.rinum_count) != 0)
 		exit(1);
 
-	inode_put(&sbd.md.riinode);
-	inode_put(&sbd.master_dir);
+	lgfs2_inode_put(&sbd.md.riinode);
+	lgfs2_inode_put(&sbd.master_dir);
 	lgfs2_rgrps_free(&rgs);
 	fsync(sbd.device_fd);
 	close(sbd.device_fd);
-- 
2.34.1

