Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B164938D1
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:46:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589203;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BBT2hYSANae5eRTNLN1nOykBLNfAQf7+nmgvTc7t8No=;
	b=ZwDtw7k80xZUCXosFtEaTj0aKxVzz6dCcxxwsXvdyI5v784Z5a9TMc/gwb6kzTQVXJIUMN
	ctngQv0Lz+Q5uawhTIE+d9DNgvISoRlJRA6tJ3ziC98W+ZHfdre/rcoX/uMb6mOnZvbjT2
	6XNPgGc2GvxcRrzuQ5neSZTxn6yyCnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-4LmKzqpVMTOz_X-nBsc4ng-1; Wed, 19 Jan 2022 05:46:40 -0500
X-MC-Unique: 4LmKzqpVMTOz_X-nBsc4ng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14F6B1B2C983;
	Wed, 19 Jan 2022 10:46:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0560D1059160;
	Wed, 19 Jan 2022 10:46:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E525B18095C9;
	Wed, 19 Jan 2022 10:46:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAhVSk024158 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:43:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 516E57A221; Wed, 19 Jan 2022 10:43:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5644C795B7
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:43:30 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:42:56 +0000
Message-Id: <20220119104316.2489995-2-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 01/21] libgfs2: Namespace improvements -
	structures.c
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

Use the lgfs2_ prefix in libgfs2 interface names.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c | 28 ++++++++++----------
 gfs2/edit/hexedit.c         |  6 ++---
 gfs2/edit/savemeta.c        |  2 +-
 gfs2/fsck/fs_recovery.c     | 10 +++----
 gfs2/fsck/initialize.c      | 24 ++++++++---------
 gfs2/fsck/main.c            |  2 +-
 gfs2/fsck/metawalk.c        |  8 +++---
 gfs2/fsck/pass1.c           | 52 ++++++++++++++++++-------------------
 gfs2/fsck/pass2.c           | 30 ++++++++++-----------
 gfs2/fsck/pass5.c           |  2 +-
 gfs2/fsck/rgrepair.c        | 10 +++----
 gfs2/libgfs2/fs_ops.c       |  6 ++---
 gfs2/libgfs2/libgfs2.h      | 33 ++++++++++++-----------
 gfs2/libgfs2/rgrp.c         |  2 +-
 gfs2/libgfs2/structures.c   | 40 ++++++++++++++--------------
 gfs2/libgfs2/super.c        |  2 +-
 gfs2/mkfs/main_mkfs.c       | 22 ++++++++--------
 17 files changed, 139 insertions(+), 140 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index dc011d05..07fa9a10 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -817,7 +817,7 @@ static int fix_xattr(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh, struct g
 
 	/* Read in the i_eattr block */
 	eabh = bread(sbp, ip->i_eattr);
-        if (!gfs2_check_meta(eabh->b_data, GFS_METATYPE_IN)) {/* if it is an indirect block */
+        if (!lgfs2_check_meta(eabh->b_data, GFS_METATYPE_IN)) {/* if it is an indirect block */
 		len = sbp->sd_bsize - sizeof(struct gfs_indirect);
 		buf = malloc(len);
 		if (!buf) {
@@ -993,7 +993,7 @@ static int next_rg_metatype(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 			return -1;
 		bh = bread(sdp, *block);
 		first = 0;
-	} while(gfs2_check_meta(bh->b_data, type));
+	} while(lgfs2_check_meta(bh->b_data, type));
 	brelse(bh);
 	return 0;
 }
@@ -1052,7 +1052,7 @@ static int inode_renumber(struct gfs2_sbd *sbp, uint64_t root_inode_addr, osi_li
 				sbp->sd_root_dir.in_formal_ino = sbp->md.next_inum;
 			}
 			bh = bread(sbp, block);
-			if (!gfs2_check_meta(bh->b_data, GFS_METATYPE_DI)) {/* if it is an dinode */
+			if (!lgfs2_check_meta(bh->b_data, GFS_METATYPE_DI)) {/* if it is an dinode */
 				/* Skip the rindex and jindex inodes for now. */
 				if (block != rindex_addr && block != jindex_addr) {
 					error = adjust_inode(sbp, bh);
@@ -1982,8 +1982,8 @@ static int conv_build_jindex(struct gfs2_sbd *sdp)
 		sprintf(name, "journal%u", j);
 		sdp->md.journal[j] = createi(sdp->md.jiinode, name, S_IFREG |
 					     0600, GFS2_DIF_SYSTEM);
-		write_journal(sdp->md.journal[j], sdp->sd_bsize,
-			      sdp->jsize << 20 >> sdp->sd_bsize_shift);
+		lgfs2_write_journal(sdp->md.journal[j], sdp->sd_bsize,
+		                    sdp->jsize << 20 >> sdp->sd_bsize_shift);
 		inode_put(&sdp->md.journal[j]);
 		printf(_("done.\n"));
 		fflush(stdout);
@@ -2100,7 +2100,7 @@ static int build_per_node(struct gfs2_sbd *sdp)
 	for (j = 0; j < sdp->md.journals; j++) {
 		struct gfs2_inode *ip;
 
-		ip = build_inum_range(per_node, j);
+		ip = lgfs2_build_inum_range(per_node, j);
 		if (ip == NULL) {
 			log_crit(_("Error building '%s': %s\n"), "inum_range",
 			         strerror(errno));
@@ -2108,7 +2108,7 @@ static int build_per_node(struct gfs2_sbd *sdp)
 		}
 		inode_put(&ip);
 
-		ip = build_statfs_change(per_node, j);
+		ip = lgfs2_build_statfs_change(per_node, j);
 		if (ip == NULL) {
 			log_crit(_("Error building '%s': %s\n"), "statfs_change",
 			         strerror(errno));
@@ -2116,7 +2116,7 @@ static int build_per_node(struct gfs2_sbd *sdp)
 		}
 		inode_put(&ip);
 
-		ip = build_quota_change(per_node, j);
+		ip = lgfs2_build_quota_change(per_node, j);
 		if (ip == NULL) {
 			log_crit(_("Error building '%s': %s\n"), "quota_change",
 			         strerror(errno));
@@ -2314,7 +2314,7 @@ int main(int argc, char **argv)
 			log_notice(_("Reduced journal size to %u MB to accommodate "
 				   "GFS2 file system structures.\n"), sb2.jsize);
 		/* Build the master subdirectory. */
-		build_master(&sb2); /* Does not do inode_put */
+		lgfs2_build_master(&sb2); /* Does not do inode_put */
 		sb2.sd_meta_dir = sb2.master_dir->i_num;
 		/* Build empty journal index file. */
 		error = conv_build_jindex(&sb2);
@@ -2331,23 +2331,23 @@ int main(int argc, char **argv)
 			exit(-1);
 		}
 		/* Create the empty inode number file */
-		sb2.md.inum = build_inum(&sb2); /* Does not do inode_put */
+		sb2.md.inum = lgfs2_build_inum(&sb2); /* Does not do inode_put */
 		if (sb2.md.inum == NULL) {
 			log_crit(_("Error building inum inode: %s\n"),
 			         strerror(error));
 			exit(-1);
 		}
 		/* Create the statfs file */
-		sb2.md.statfs = build_statfs(&sb2); /* Does not do inode_put */
+		sb2.md.statfs = lgfs2_build_statfs(&sb2); /* Does not do inode_put */
 		if (sb2.md.statfs == NULL) {
 			log_crit(_("Error building statfs inode: %s\n"),
 			         strerror(error));
 			exit(-1);
 		}
-		do_init_statfs(&sb2, NULL);
+		lgfs2_init_statfs(&sb2, NULL);
 
 		/* Create the resource group index file */
-		ip = build_rindex(&sb2);
+		ip = lgfs2_build_rindex(&sb2);
 		if (ip == NULL) {
 			log_crit(_("Error building rindex inode: %s\n"),
 			         strerror(errno));
@@ -2355,7 +2355,7 @@ int main(int argc, char **argv)
 		}
 		inode_put(&ip);
 		/* Create the quota file */
-		ip = build_quota(&sb2);
+		ip = lgfs2_build_quota(&sb2);
 		if (ip == NULL) {
 			log_crit(_("Error building quota inode: %s\n"),
 			         strerror(error));
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index 051f88c1..0809db85 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -1173,7 +1173,7 @@ static int find_rg_metatype(struct rgrp_tree *rgd, uint64_t *blk, uint64_t start
 		for (j = 0; j < m; j++) {
 			*blk = ibuf[j];
 			bhp = bread(&sbd, *blk);
-			found = (*blk > startblk) && !gfs2_check_meta(bhp->b_data, mtype);
+			found = (*blk > startblk) && !lgfs2_check_meta(bhp->b_data, mtype);
 			brelse(bhp);
 			if (found) {
 				free(ibuf);
@@ -2135,7 +2135,7 @@ static int count_dinode_blks(struct rgrp_tree *rgd, int bitmap,
 			    rgd->bits[bitmap].bi_start + b);
 		byte = rbh->b_data + off + (b / GFS2_NBBY);
 		bit = (b % GFS2_NBBY) * GFS2_BIT_SIZE;
-		if (gfs2_check_meta(tbh->b_data, GFS2_METATYPE_DI) == 0) {
+		if (lgfs2_check_meta(tbh->b_data, GFS2_METATYPE_DI) == 0) {
 			dinodes++;
 			new_state = GFS2_BLKST_DINODE;
 		} else {
@@ -2205,7 +2205,7 @@ static void rg_repair(void)
 
 			printf("Bitmap #%d:", b);
 			rbh = bread(&sbd, rgd->rt_addr + b);
-			if (gfs2_check_meta(rbh->b_data, mtype)) { /* wrong type */
+			if (lgfs2_check_meta(rbh->b_data, mtype)) { /* wrong type */
 				printf("Damaged. Repairing...");
 				/* Fix the meta header */
 				memset(rbh->b_data, 0, sbd.sd_bsize);
diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 8fde8c8a..941472aa 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -814,7 +814,7 @@ static int save_leaf_chain(struct metafd *mfd, struct gfs2_sbd *sdp, char *buf)
 			return 1;
 		}
 		report_progress(blk, 0);
-		if (gfs2_check_meta(buf, GFS2_METATYPE_LF) == 0) {
+		if (lgfs2_check_meta(buf, GFS2_METATYPE_LF) == 0) {
 			int ret = save_buf(mfd, buf, blk, sdp->sd_bsize);
 			if (ret != 0)
 				return ret;
diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index e5cde051..fdeb3c44 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -206,7 +206,7 @@ static int revoke_lo_scan_elements(struct gfs2_inode *ip, unsigned int start,
 			return error;
 
 		if (!first) {
-			if (gfs2_check_meta(bh->b_data, GFS2_METATYPE_LB))
+			if (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_LB))
 				continue;
 		}
 		while (offset + sizeof(uint64_t) <= sdp->sd_bsize) {
@@ -343,7 +343,7 @@ static int foreach_descriptor(struct gfs2_inode *ip, unsigned int start,
 			bmodified(bh);
 			brelse(bh);
 			return error;
-		} else if (gfs2_check_meta(bh->b_data, GFS2_METATYPE_LD)) {
+		} else if (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_LD)) {
 			bmodified(bh);
 			brelse(bh);
 			return -EIO;
@@ -597,7 +597,7 @@ out:
 	log_err( _("jid=%u: Failed\n"), j);
 reinit:
 	if (query( _("Do you want to clear the journal instead? (y/n)"))) {
-		error = write_journal(sdp->md.journal[j], sdp->sd_bsize,
+		error = lgfs2_write_journal(sdp->md.journal[j], sdp->sd_bsize,
 				      sdp->md.journal[j]->i_size /
 				      sdp->sd_bsize);
 		log_err(_("jid=%u: journal was cleared.\n"), j);
@@ -633,7 +633,7 @@ static int rangecheck_jmeta(struct iptr iptr, struct gfs2_buffer_head **bh, int
 	rc = rangecheck_jblock(ip, block);
 	if (rc == META_IS_GOOD) {
 		*bh = bread(ip->i_sbd, block);
-		*is_valid = (gfs2_check_meta((*bh)->b_data, GFS2_METATYPE_IN) == 0);
+		*is_valid = (lgfs2_check_meta((*bh)->b_data, GFS2_METATYPE_IN) == 0);
 		if (!(*is_valid)) {
 			log_err( _("Journal at block %"PRIu64" (0x%"PRIx64") has a bad "
 				   "indirect block pointer %"PRIu64" (0x%"PRIx64") "
@@ -859,7 +859,7 @@ int build_jindex(struct gfs2_sbd *sdp)
 	}
 	sdp->md.journal = malloc(sdp->md.journals * sizeof(struct gfs2_inode *));
 	for (unsigned j = 0; j < sdp->md.journals; j++) {
-		int ret = build_journal(sdp, j, jindex);
+		int ret = lgfs2_build_journal(sdp, j, jindex);
 		if (ret)
 			return ret;
 		inode_put(&sdp->md.journal[j]);
diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index fab9a1e7..7923e9c1 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -233,7 +233,7 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 				if (state == GFS2_BLKST_DINODE) {
 					if (sdp->gfs1) {
 						bh = bread(sdp, diblock);
-						if (!gfs2_check_meta(bh->b_data,
+						if (!lgfs2_check_meta(bh->b_data,
 							GFS2_METATYPE_DI))
 							rg_useddi++;
 						else
@@ -283,7 +283,7 @@ static void check_rgrp_integrity(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 				log_info(_("Free metadata block %"PRIu64" (0x%"PRIx64") reclaimed.\n"),
 				         diblock, diblock);
 				bh = bread(sdp, diblock);
-				if (!gfs2_check_meta(bh->b_data, GFS2_METATYPE_DI)) {
+				if (!lgfs2_check_meta(bh->b_data, GFS2_METATYPE_DI)) {
 					struct gfs2_inode *ip =
 						fsck_inode_get(sdp, rgd, bh);
 					if (ip->i_blocks > 1) {
@@ -504,7 +504,7 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 			exit(FSCK_ERROR);
 		}
 	} else {
-		sdp->md.inum = build_inum(sdp);
+		sdp->md.inum = lgfs2_build_inum(sdp);
 		if (sdp->md.inum == NULL) {
 			log_crit(_("Error building inum inode: %s\n"), strerror(errno));
 			exit(FSCK_ERROR);
@@ -524,7 +524,7 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 			exit(FSCK_ERROR);
 		}
 	} else {
-		sdp->md.statfs = build_statfs(sdp);
+		sdp->md.statfs = lgfs2_build_statfs(sdp);
 		if (sdp->md.statfs == NULL) {
 			log_crit(_("Error %d building statfs inode\n"), err);
 			exit(FSCK_ERROR);
@@ -544,7 +544,7 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 			exit(FSCK_ERROR);
 		}
 	} else {
-		struct gfs2_inode *rip = build_rindex(sdp);
+		struct gfs2_inode *rip = lgfs2_build_rindex(sdp);
 		if (rip == NULL) {
 			log_crit(_("Error building rindex inode: %s\n"), strerror(errno));
 			exit(FSCK_ERROR);
@@ -562,7 +562,7 @@ static int rebuild_master(struct gfs2_sbd *sdp)
 			exit(FSCK_ERROR);
 		}
 	} else {
-		struct gfs2_inode *qip = build_quota(sdp);
+		struct gfs2_inode *qip = lgfs2_build_quota(sdp);
 		if (qip == NULL) {
 			log_crit(_("Error building quota inode: %s\n"), strerror(errno));
 			exit(FSCK_ERROR);
@@ -804,7 +804,7 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
 					   "a valid inum file; aborting.\n"));
 				goto fail;
 			}
-			sdp->md.inum = build_inum(sdp);
+			sdp->md.inum = lgfs2_build_inum(sdp);
 			if (sdp->md.inum == NULL) {
 				log_crit(_("Error rebuilding inum inode: %s\n"), strerror(errno));
 				exit(FSCK_ERROR);
@@ -855,7 +855,7 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
 				   "statfs file; aborting.\n"));
 			goto fail;
 		}
-		sdp->md.statfs = build_statfs(sdp);
+		sdp->md.statfs = lgfs2_build_statfs(sdp);
 		if (sdp->md.statfs == NULL) {
 			log_crit(_("Error %d rebuilding statfs inode\n"), err);
 			exit(FSCK_ERROR);
@@ -867,7 +867,7 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
 				   "a valid statfs file; aborting.\n"));
 			goto fail;
 		}
-		do_init_statfs(sdp, NULL);
+		lgfs2_init_statfs(sdp, NULL);
 	}
 	if (sdp->md.statfs->i_size) {
 		buf = malloc(sdp->md.statfs->i_size);
@@ -912,7 +912,7 @@ static int init_system_inodes(struct gfs2_sbd *sdp)
 				   "rebuilt.  Aborting.\n"));
 			goto fail;
 		}
-		sdp->md.qinode = build_quota(sdp);
+		sdp->md.qinode = lgfs2_build_quota(sdp);
 		if (sdp->md.qinode == NULL) {
 			log_crit(_("Error rebuilding quota inode: %s\n"), strerror(errno));
 			exit(FSCK_ERROR);
@@ -1200,7 +1200,7 @@ static int peruse_metadata(struct gfs2_sbd *sdp, uint64_t startblock)
 	/* Max RG size is 2GB. 2G / bsize. */
 	for (blk = startblock; blk < startblock + max_rg_size; blk++) {
 		bh = bread(sdp, blk);
-		if (gfs2_check_meta(bh->b_data, GFS2_METATYPE_DI)) {
+		if (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_DI)) {
 			brelse(bh);
 			continue;
 		}
@@ -1531,7 +1531,7 @@ static int init_rindex(struct gfs2_sbd *sdp)
 		log_crit(_("Error: Cannot proceed without a valid rindex.\n"));
 		return -1;
 	}
-	ip = build_rindex(sdp);
+	ip = lgfs2_build_rindex(sdp);
 	if (ip == NULL) {
 		log_crit(_("Error rebuilding rindex: %s\n"), strerror(errno));
 		return -1;
diff --git a/gfs2/fsck/main.c b/gfs2/fsck/main.c
index 82408245..446f4f85 100644
--- a/gfs2/fsck/main.c
+++ b/gfs2/fsck/main.c
@@ -217,7 +217,7 @@ static int check_statfs(struct gfs2_sbd *sdp)
 		return 0;
 	}
 
-	do_init_statfs(sdp, NULL);
+	lgfs2_init_statfs(sdp, NULL);
 	log_err( _("The statfs file was fixed.\n"));
 	errors_corrected++;
 	return 0;
diff --git a/gfs2/fsck/metawalk.c b/gfs2/fsck/metawalk.c
index b5e7c865..4b783648 100644
--- a/gfs2/fsck/metawalk.c
+++ b/gfs2/fsck/metawalk.c
@@ -535,7 +535,7 @@ int check_leaf(struct gfs2_inode *ip, int lindex, struct metawalk_fxns *pass,
 	/* Try to read in the leaf block. */
 	lbh = bread(sdp, *leaf_no);
 	/* Make sure it's really a valid leaf block. */
-	if (gfs2_check_meta(lbh->b_data, GFS2_METATYPE_LF)) {
+	if (lgfs2_check_meta(lbh->b_data, GFS2_METATYPE_LF)) {
 		msg = _("that is not really a leaf");
 		goto bad_leaf;
 	}
@@ -734,7 +734,7 @@ int check_leaf_blks(struct gfs2_inode *ip, struct metawalk_fxns *pass)
 		if (valid_block_ip(ip, leaf_no)) {
 			lbh = bread(sdp, leaf_no);
 			/* Make sure it's really a valid leaf block. */
-			if (gfs2_check_meta(lbh->b_data, GFS2_METATYPE_LF) == 0) {
+			if (lgfs2_check_meta(lbh->b_data, GFS2_METATYPE_LF) == 0) {
 				brelse(lbh);
 				first_ok_leaf = leaf_no;
 				break;
@@ -1259,7 +1259,7 @@ static int build_and_check_metalist(struct gfs2_inode *ip, osi_list_t *mlp,
 			iptr.ipt_off = head_size;
 			iptr.ipt_bh = osi_list_entry(tmp, struct gfs2_buffer_head, b_altlist);
 
-			if (gfs2_check_meta(iptr_buf(iptr), iblk_type)) {
+			if (lgfs2_check_meta(iptr_buf(iptr), iblk_type)) {
 				if (pass->invalid_meta_is_fatal)
 					return META_ERROR;
 
@@ -1482,7 +1482,7 @@ static unsigned int should_check(struct gfs2_buffer_head *bh, unsigned int heigh
 {
 	int iblk_type = height > 1 ? GFS2_METATYPE_IN : GFS2_METATYPE_DI;
 
-	return gfs2_check_meta(bh->b_data, iblk_type) == 0;
+	return lgfs2_check_meta(bh->b_data, iblk_type) == 0;
 }
 
 /**
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index ad16971e..0a55c512 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -278,7 +278,7 @@ static int p1check_leaf(struct gfs2_inode *ip, uint64_t block, void *private)
 	int q;
 
 	/* Note if we've gotten this far, the block has already passed the
-	   check in metawalk: gfs2_check_meta(lbh, GFS2_METATYPE_LF).
+	   check in metawalk: lgfs2_check_meta(lbh, GFS2_METATYPE_LF).
 	   So we know it's a leaf block. */
 	bc->indir_count++;
 	q = block_type(bl, block);
@@ -347,7 +347,7 @@ static int pass1_check_metalist(struct iptr iptr, struct gfs2_buffer_head **bh,
 	}
 	nbh = bread(ip->i_sbd, block);
 
-	*is_valid = (gfs2_check_meta(nbh->b_data, iblk_type) == 0);
+	*is_valid = (lgfs2_check_meta(nbh->b_data, iblk_type) == 0);
 
 	if (!(*is_valid)) {
 		log_err(_("Inode %"PRIu64" (0x%"PRIx64") has a bad indirect block "
@@ -475,7 +475,7 @@ static int blockmap_set_as_data(struct gfs2_inode *ip, uint64_t block)
 	/* The bitmap says it's a dinode, but a block reference begs to differ.
 	   So which is it? */
 	bh = bread(ip->i_sbd, block);
-	if (gfs2_check_meta(bh->b_data, GFS2_METATYPE_DI) != 0)
+	if (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_DI) != 0)
 		goto out;
 
 	/* The meta header agrees it's a dinode. But it might be data in
@@ -687,7 +687,7 @@ static int check_eattr_indir(struct gfs2_inode *ip, uint64_t indirect,
 	   handling sort it out.  If it isn't, clear it but don't
 	   count it as a duplicate. */
 	*bh = bread(sdp, indirect);
-	if (gfs2_check_meta((*bh)->b_data, GFS2_METATYPE_IN)) {
+	if (lgfs2_check_meta((*bh)->b_data, GFS2_METATYPE_IN)) {
 		bc->ea_count++;
 		if (q != GFS2_BLKST_FREE) { /* Duplicate? */
 			add_duplicate_ref(ip, indirect, REF_AS_EA, 0,
@@ -761,7 +761,7 @@ static int check_ealeaf_block(struct gfs2_inode *ip, uint64_t block, int btype,
 	   really is an EA.  If it is, let duplicate handling sort it out.
 	   If it isn't, clear it but don't count it as a duplicate. */
 	leaf_bh = bread(sdp, block);
-	if (gfs2_check_meta(leaf_bh->b_data, btype)) {
+	if (lgfs2_check_meta(leaf_bh->b_data, btype)) {
 		bc->ea_count++;
 		if (q != GFS2_BLKST_FREE) { /* Duplicate? */
 			add_duplicate_ref(ip, block, REF_AS_EA, 0,
@@ -1457,7 +1457,7 @@ static int check_system_inode(struct gfs2_sbd *sdp,
 		iblock = (*sysinode)->i_num.in_addr;
 		log_info(_("System inode for '%s' is located at block %"PRIu64" (0x%"PRIx64")\n"),
 		         filename, iblock, iblock);
-		if (gfs2_check_meta((*sysinode)->i_bh->b_data, GFS2_METATYPE_DI)) {
+		if (lgfs2_check_meta((*sysinode)->i_bh->b_data, GFS2_METATYPE_DI)) {
 			log_err(_("Found invalid system dinode at block %"PRIu64" (0x%"PRIx64")\n"),
 			        iblock, iblock);
 			gfs2_blockmap_set(bl, iblock, GFS2_BLKST_FREE);
@@ -1569,7 +1569,7 @@ static int build_a_journal(struct gfs2_sbd *sdp)
 	sprintf(name, "journal%u", sdp->md.journals);
 	gfs2_dirent_del(sdp->md.jiinode, name, strlen(name));
 	/* Now rebuild it */
-	err = build_journal(sdp, sdp->md.journals, sdp->md.jiinode);
+	err = lgfs2_build_journal(sdp, sdp->md.journals, sdp->md.jiinode);
 	if (err) {
 		log_crit(_("Error %d building journal\n"), err);
 		exit(FSCK_ERROR);
@@ -1591,7 +1591,7 @@ int build_per_node(struct gfs2_sbd *sdp)
 	for (j = 0; j < sdp->md.journals; j++) {
 		struct gfs2_inode *ip;
 
-		ip = build_inum_range(per_node, j);
+		ip = lgfs2_build_inum_range(per_node, j);
 		if (ip == NULL) {
 			log_err(_("Error building '%s': %s\n"), "inum_range",
 			        strerror(errno));
@@ -1599,7 +1599,7 @@ int build_per_node(struct gfs2_sbd *sdp)
 		}
 		inode_put(&ip);
 
-		ip = build_statfs_change(per_node, j);
+		ip = lgfs2_build_statfs_change(per_node, j);
 		if (ip == NULL) {
 			log_err(_("Error building '%s': %s\n"), "statfs_change",
 			        strerror(errno));
@@ -1607,7 +1607,7 @@ int build_per_node(struct gfs2_sbd *sdp)
 		}
 		inode_put(&ip);
 
-		ip = build_quota_change(per_node, j);
+		ip = lgfs2_build_quota_change(per_node, j);
 		if (ip == NULL) {
 			log_err(_("Error building '%s': %s\n"), "quota_change",
 			        strerror(errno));
@@ -1619,36 +1619,36 @@ int build_per_node(struct gfs2_sbd *sdp)
 	return 0;
 }
 
-static int fsck_build_inum(struct gfs2_sbd *sdp)
+static int build_inum(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip = build_inum(sdp);
+	struct gfs2_inode *ip = lgfs2_build_inum(sdp);
 	if (ip == NULL)
 		return -1;
 	inode_put(&ip);
 	return 0;
 }
 
-static int fsck_build_statfs(struct gfs2_sbd *sdp)
+static int build_statfs(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip = build_statfs(sdp);
+	struct gfs2_inode *ip = lgfs2_build_statfs(sdp);
 	if (ip == NULL)
 		return -1;
 	inode_put(&ip);
 	return 0;
 }
 
-static int fsck_build_rindex(struct gfs2_sbd *sdp)
+static int build_rindex(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip = build_rindex(sdp);
+	struct gfs2_inode *ip = lgfs2_build_rindex(sdp);
 	if (ip == NULL)
 		return -1;
 	inode_put(&ip);
 	return 0;
 }
 
-static int fsck_build_quota(struct gfs2_sbd *sdp)
+static int build_quota(struct gfs2_sbd *sdp)
 {
-	struct gfs2_inode *ip = build_quota(sdp);
+	struct gfs2_inode *ip = lgfs2_build_quota(sdp);
 	if (ip == NULL)
 		return -1;
 	inode_put(&ip);
@@ -1669,7 +1669,7 @@ static int check_system_inodes(struct gfs2_sbd *sdp)
 		fsck_blockmap_set(sdp->master_dir, sdp->master_dir->i_num.in_addr,
 				  "master", GFS2_BLKST_DINODE);
 		if (check_system_inode(sdp, &sdp->master_dir, "master",
-				       build_master, 1, NULL, 1)) {
+				       lgfs2_build_master, 1, NULL, 1)) {
 			stack;
 			return -1;
 		}
@@ -1678,18 +1678,18 @@ static int check_system_inodes(struct gfs2_sbd *sdp)
 	   for master, since it has no parent. */
 	fsck_blockmap_set(sdp->md.rooti, sdp->md.rooti->i_num.in_addr,
 			  "root", GFS2_BLKST_DINODE);
-	if (check_system_inode(sdp, &sdp->md.rooti, "root", build_root, 1,
+	if (check_system_inode(sdp, &sdp->md.rooti, "root", lgfs2_build_root, 1,
 			       NULL, 0)) {
 		stack;
 		return -1;
 	}
 	if (!sdp->gfs1 &&
-	    check_system_inode(sdp, &sdp->md.inum, "inum", fsck_build_inum, 0,
+	    check_system_inode(sdp, &sdp->md.inum, "inum", build_inum, 0,
 			       sdp->master_dir, 1)) {
 		stack;
 		return -1;
 	}
-	if (check_system_inode(sdp, &sdp->md.statfs, "statfs", fsck_build_statfs, 0,
+	if (check_system_inode(sdp, &sdp->md.statfs, "statfs", build_statfs, 0,
 			       sdp->master_dir, !sdp->gfs1)) {
 		stack;
 		return -1;
@@ -1700,12 +1700,12 @@ static int check_system_inodes(struct gfs2_sbd *sdp)
 		stack;
 		return -1;
 	}
-	if (check_system_inode(sdp, &sdp->md.riinode, "rindex", fsck_build_rindex,
+	if (check_system_inode(sdp, &sdp->md.riinode, "rindex", build_rindex,
 			       0, sdp->master_dir, !sdp->gfs1)) {
 		stack;
 		return -1;
 	}
-	if (check_system_inode(sdp, &sdp->md.qinode, "quota", fsck_build_quota,
+	if (check_system_inode(sdp, &sdp->md.qinode, "quota", build_quota,
 			       0, sdp->master_dir, !sdp->gfs1)) {
 		stack;
 		return -1;
@@ -1716,7 +1716,7 @@ static int check_system_inodes(struct gfs2_sbd *sdp)
 		stack;
 		return -1;
 	}
-	/* We have to play a trick on build_journal:  We swap md.journals
+	/* We have to play a trick on lgfs2_build_journal:  We swap md.journals
 	   in order to keep a count of which journal we need to build. */
 	journal_count = sdp->md.journals;
 	/* gfs1's journals aren't dinode, they're just a bunch of blocks. */
@@ -1800,7 +1800,7 @@ static int pass1_process_bitmap(struct gfs2_sbd *sdp, struct rgrp_tree *rgd, uin
 		bh = bread(sdp, block);
 
 		is_inode = 0;
-		if (gfs2_check_meta(bh->b_data, GFS2_METATYPE_DI) == 0)
+		if (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_DI) == 0)
 			is_inode = 1;
 
 		check_magic = ((struct gfs2_meta_header *)
diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index d82380a1..a80aae2f 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -601,7 +601,7 @@ static int basic_dentry_checks(struct gfs2_inode *ip, struct gfs2_dirent *dent,
 		struct gfs2_buffer_head *tbh;
 
 		tbh = bread(sdp, entry->in_addr);
-		if (gfs2_check_meta(tbh->b_data, GFS2_METATYPE_DI)) { /* not dinode */
+		if (lgfs2_check_meta(tbh->b_data, GFS2_METATYPE_DI)) { /* not dinode */
 			log_err(_("Directory entry '%s' pointing to block %"PRIu64
 			          " (0x%"PRIx64") in directory %"PRIu64" (0x%"PRIx64") "
 				   "is not really a GFS1 dinode.\n"), tmp_name,
@@ -1502,7 +1502,7 @@ static int check_hash_tbl_dups(struct gfs2_inode *ip, __be64 *tbl,
 			continue;
 
 		lbh = bread(ip->i_sbd, leafblk);
-		if (gfs2_check_meta(lbh->b_data, GFS2_METATYPE_LF)) { /* Chked later */
+		if (lgfs2_check_meta(lbh->b_data, GFS2_METATYPE_LF)) { /* Chked later */
 			brelse(lbh);
 			continue;
 		}
@@ -1686,7 +1686,7 @@ static int check_hash_tbl(struct gfs2_inode *ip, __be64 *tbl,
 				leafblk, leafblk, proper_len, proper_len);
 			lbh = bread(ip->i_sbd, leafblk);
 			lgfs2_leaf_in(&leaf, lbh->b_data);
-			if (gfs2_check_meta(lbh->b_data, GFS2_METATYPE_LF) ||
+			if (lgfs2_check_meta(lbh->b_data, GFS2_METATYPE_LF) ||
 			    leaf.lf_depth > ip->i_depth)
 				leaf.lf_depth = factor;
 			brelse(lbh);
@@ -1787,7 +1787,7 @@ static int check_data_qc(struct gfs2_inode *ip, uint64_t metablock,
 		return -1;
 
 	bh = bread(ip->i_sbd, block);
-	if (gfs2_check_meta(bh->b_data, GFS2_METATYPE_QC) != 0) {
+	if (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_QC) != 0) {
 		log_crit(_("Error: quota_change block at %"PRIu64" (0x%"PRIx64") is "
 			   "the wrong metadata type.\n"),
 		         block, block);
@@ -1875,9 +1875,9 @@ build_it:
 	goto out_good;
 }
 
-static int fsck_build_inum_range(struct gfs2_inode *per_node, unsigned int n)
+static int build_inum_range(struct gfs2_inode *per_node, unsigned int n)
 {
-	struct gfs2_inode *ip = build_inum_range(per_node, n);
+	struct gfs2_inode *ip = lgfs2_build_inum_range(per_node, n);
 
 	if (ip == NULL)
 		return 1;
@@ -1885,9 +1885,9 @@ static int fsck_build_inum_range(struct gfs2_inode *per_node, unsigned int n)
 	return 0;
 }
 
-static int fsck_build_statfs_change(struct gfs2_inode *per_node, unsigned int n)
+static int build_statfs_change(struct gfs2_inode *per_node, unsigned int n)
 {
-	struct gfs2_inode *ip = build_statfs_change(per_node, n);
+	struct gfs2_inode *ip = lgfs2_build_statfs_change(per_node, n);
 
 	if (ip == NULL)
 		return 1;
@@ -1895,9 +1895,9 @@ static int fsck_build_statfs_change(struct gfs2_inode *per_node, unsigned int n)
 	return 0;
 }
 
-static int fsck_build_quota_change(struct gfs2_inode *per_node, unsigned int n)
+static int build_quota_change(struct gfs2_inode *per_node, unsigned int n)
 {
-	struct gfs2_inode *ip = build_quota_change(per_node, n);
+	struct gfs2_inode *ip = lgfs2_build_quota_change(per_node, n);
 
 	if (ip == NULL)
 		return 1;
@@ -1989,14 +1989,14 @@ static int check_system_dir(struct gfs2_inode *sysinode, const char *dirname,
 		for (j = 0; j < sysinode->i_sbd->md.journals; j++) {
 			sprintf(fn, "inum_range%d", j);
 			error += check_pernode_for(j, sysinode, fn, 16, 0,
-						   NULL, fsck_build_inum_range);
+						   NULL, build_inum_range);
 			sprintf(fn, "statfs_change%d", j);
 			error += check_pernode_for(j, sysinode, fn, 24, 0,
-						   NULL, fsck_build_statfs_change);
+						   NULL, build_statfs_change);
 			sprintf(fn, "quota_change%d", j);
 			error += check_pernode_for(j, sysinode, fn, 1048576, 1,
 						   &quota_change_fxns,
-						   fsck_build_quota_change);
+						   build_quota_change);
 		}
 	}
 	return error;
@@ -2130,13 +2130,13 @@ int pass2(struct gfs2_sbd *sdp)
 	if (skip_this_pass || fsck_abort) /* if asked to skip the rest */
 		return FSCK_OK;
 	if (!sdp->gfs1 &&
-	    check_system_dir(sdp->master_dir, "master", build_master)) {
+	    check_system_dir(sdp->master_dir, "master", lgfs2_build_master)) {
 		stack;
 		return FSCK_ERROR;
 	}
 	if (skip_this_pass || fsck_abort) /* if asked to skip the rest */
 		return FSCK_OK;
-	if (check_system_dir(sdp->md.rooti, "root", build_root)) {
+	if (check_system_dir(sdp->md.rooti, "root", lgfs2_build_root)) {
 		stack;
 		return FSCK_ERROR;
 	}
diff --git a/gfs2/fsck/pass5.c b/gfs2/fsck/pass5.c
index 9730aa06..7d2e309d 100644
--- a/gfs2/fsck/pass5.c
+++ b/gfs2/fsck/pass5.c
@@ -49,7 +49,7 @@ static int check_block_status(struct gfs2_sbd *sdp,  struct gfs2_bmap *bl,
 			struct gfs2_buffer_head *bh;
 
 			bh = bread(sdp, block);
-			if (gfs2_check_meta(bh->b_data, GFS2_METATYPE_DI) == 0)
+			if (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_DI) == 0)
 				count[GFS2_BLKST_DINODE]++;
 			else
 				count[GFS1_BLKST_USEDMETA]++;
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index 55e99143..b7bb8dd2 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -68,7 +68,7 @@ static void find_journaled_rgs(struct gfs2_sbd *sdp)
 			if (!dblock)
 				break;
 			bh = bread(sdp, dblock);
-			if (!gfs2_check_meta(bh->b_data, GFS2_METATYPE_RG)) {
+			if (!lgfs2_check_meta(bh->b_data, GFS2_METATYPE_RG)) {
 				/* False rgrp found at block dblock */
 				false_count++;
 				gfs2_special_set(&false_rgrps, dblock);
@@ -124,7 +124,7 @@ static int find_shortest_rgdist(struct gfs2_sbd *sdp, uint64_t *dist_array,
 			is_rgrp = 0;
 		else {
 			bh = bread(sdp, blk);
-			is_rgrp = (gfs2_check_meta(bh->b_data, GFS2_METATYPE_RG) == 0);
+			is_rgrp = (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_RG) == 0);
 			brelse(bh);
 		}
 		if (!is_rgrp) {
@@ -141,7 +141,7 @@ static int find_shortest_rgdist(struct gfs2_sbd *sdp, uint64_t *dist_array,
 					is_rgrp = 0;
 				} else {
 					bh = bread(sdp, nblk);
-					is_rgrp = (((gfs2_check_meta(bh->b_data,
+					is_rgrp = (((lgfs2_check_meta(bh->b_data,
 						GFS2_METATYPE_RG) == 0)));
 					brelse(bh);
 				}
@@ -554,7 +554,7 @@ static int rindex_rebuild(struct gfs2_sbd *sdp, int *num_rgs, int gfs_grow)
 	while (blk <= sdp->device.length) {
 		log_debug( _("Block 0x%"PRIx64"\n"), blk);
 		bh = bread(sdp, blk);
-		rg_was_fnd = (!gfs2_check_meta(bh->b_data, GFS2_METATYPE_RG));
+		rg_was_fnd = (!lgfs2_check_meta(bh->b_data, GFS2_METATYPE_RG));
 		brelse(bh);
 		/* Allocate a new RG and index. */
 		calc_rgd = rgrp_insert(&rgcalc, blk);
@@ -584,7 +584,7 @@ static int rindex_rebuild(struct gfs2_sbd *sdp, int *num_rgs, int gfs_grow)
 		for (fwd_block = blk + 1; fwd_block < sdp->device.length; fwd_block++) {
 			int bitmap_was_fnd;
 			bh = bread(sdp, fwd_block);
-			bitmap_was_fnd = !gfs2_check_meta(bh->b_data, GFS2_METATYPE_RB);
+			bitmap_was_fnd = !lgfs2_check_meta(bh->b_data, GFS2_METATYPE_RB);
 			brelse(bh);
 			if (bitmap_was_fnd) /* if a bitmap */
 				calc_rgd->rt_length++;
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index 6b54a9fd..0b127e26 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -854,7 +854,7 @@ void dirent2_del(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 	uint16_t cur_rec_len, prev_rec_len;
 
 	bmodified(bh);
-	if (gfs2_check_meta(bh->b_data, GFS2_METATYPE_LF) == 0) {
+	if (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_LF) == 0) {
 		struct gfs2_leaf *lf = (struct gfs2_leaf *)bh->b_data;
 		uint16_t entries;
 
@@ -1078,7 +1078,7 @@ int gfs2_get_leaf(struct gfs2_inode *dip, uint64_t leaf_no,
 	int error = 0;
 
 	*bhp = bread(dip->i_sbd, leaf_no);
-	error = gfs2_check_meta((*bhp)->b_data, GFS2_METATYPE_LF);
+	error = lgfs2_check_meta((*bhp)->b_data, GFS2_METATYPE_LF);
 	if(error)
 		brelse(*bhp);
 	return error;
@@ -1130,7 +1130,7 @@ static int get_next_leaf(struct gfs2_inode *dip,struct gfs2_buffer_head *bh_in,
 	if (*bh_out == NULL)
 		return -ENOENT;
 	/* Check for a leaf pointing to a non-leaf */
-	if (gfs2_check_meta((*bh_out)->b_data, GFS2_METATYPE_LF)) {
+	if (lgfs2_check_meta((*bh_out)->b_data, GFS2_METATYPE_LF)) {
 		brelse(*bh_out);
 		*bh_out = NULL;
 		return -ENOENT;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index cf7ecf3f..6aa97053 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -556,9 +556,6 @@ extern int gfs2_dirent_next(struct gfs2_inode *dip, struct gfs2_buffer_head *bh,
 extern void build_height(struct gfs2_inode *ip, int height);
 extern void unstuff_dinode(struct gfs2_inode *ip);
 extern unsigned int calc_tree_height(struct gfs2_inode *ip, uint64_t size);
-extern int write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned blocks);
-extern int lgfs2_write_journal_data(struct gfs2_inode *ip);
-extern int lgfs2_write_filemeta(struct gfs2_inode *ip);
 extern uint32_t lgfs2_log_header_hash(char *buf);
 extern uint32_t lgfs2_log_header_crc(char *buf, unsigned bsize);
 
@@ -769,24 +766,26 @@ static inline unsigned int rgrp_size(struct rgrp_tree *rgrp)
 }
 
 /* structures.c */
-extern int build_master(struct gfs2_sbd *sdp);
+extern int lgfs2_build_master(struct gfs2_sbd *sdp);
 extern int lgfs2_sb_write(const struct gfs2_sbd *sdp, int fd);
-extern int build_journal(struct gfs2_sbd *sdp, int j,
-			 struct gfs2_inode *jindex);
+extern int lgfs2_build_journal(struct gfs2_sbd *sdp, int j, struct gfs2_inode *jindex);
+extern int lgfs2_write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned blocks);
+extern int lgfs2_write_journal_data(struct gfs2_inode *ip);
+extern int lgfs2_write_filemeta(struct gfs2_inode *ip);
 extern struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *metafs, struct lgfs2_inum *jnls, size_t nmemb);
-extern struct gfs2_inode *build_inum(struct gfs2_sbd *sdp);
-extern struct gfs2_inode *build_statfs(struct gfs2_sbd *sdp);
-extern struct gfs2_inode *build_rindex(struct gfs2_sbd *sdp);
-extern struct gfs2_inode *build_quota(struct gfs2_sbd *sdp);
-extern int build_root(struct gfs2_sbd *sdp);
-extern int do_init_inum(struct gfs2_sbd *sdp);
-extern int do_init_statfs(struct gfs2_sbd *sdp, struct gfs2_statfs_change *res);
-extern int gfs2_check_meta(const char *buf, int type);
+extern struct gfs2_inode *lgfs2_build_inum(struct gfs2_sbd *sdp);
+extern struct gfs2_inode *lgfs2_build_statfs(struct gfs2_sbd *sdp);
+extern struct gfs2_inode *lgfs2_build_rindex(struct gfs2_sbd *sdp);
+extern struct gfs2_inode *lgfs2_build_quota(struct gfs2_sbd *sdp);
+extern int lgfs2_build_root(struct gfs2_sbd *sdp);
+extern int lgfs2_init_inum(struct gfs2_sbd *sdp);
+extern int lgfs2_init_statfs(struct gfs2_sbd *sdp, struct gfs2_statfs_change *res);
+extern int lgfs2_check_meta(const char *buf, int type);
 extern unsigned lgfs2_bm_scan(struct rgrp_tree *rgd, unsigned idx,
 			      uint64_t *buf, uint8_t state);
-extern struct gfs2_inode *build_inum_range(struct gfs2_inode *per_node, unsigned int n);
-extern struct gfs2_inode *build_statfs_change(struct gfs2_inode *per_node, unsigned int j);
-extern struct gfs2_inode *build_quota_change(struct gfs2_inode *per_node, unsigned int j);
+extern struct gfs2_inode *lgfs2_build_inum_range(struct gfs2_inode *per_node, unsigned int n);
+extern struct gfs2_inode *lgfs2_build_statfs_change(struct gfs2_inode *per_node, unsigned int j);
+extern struct gfs2_inode *lgfs2_build_quota_change(struct gfs2_inode *per_node, unsigned int j);
 
 /* super.c */
 extern int check_sb(void *sbp);
diff --git a/gfs2/libgfs2/rgrp.c b/gfs2/libgfs2/rgrp.c
index 94907c25..c6dfb228 100644
--- a/gfs2/libgfs2/rgrp.c
+++ b/gfs2/libgfs2/rgrp.c
@@ -209,7 +209,7 @@ uint64_t gfs2_rgrp_read(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
 		int mtype = (i ? GFS2_METATYPE_RB : GFS2_METATYPE_RG);
 
 		rgd->bits[i].bi_data = buf + (i * sdp->sd_bsize);
-		if (gfs2_check_meta(rgd->bits[i].bi_data, mtype)) {
+		if (lgfs2_check_meta(rgd->bits[i].bi_data, mtype)) {
 			free(buf);
 			rgd->bits[0].bi_data = NULL;
 			return rgd->rt_addr + i;
diff --git a/gfs2/libgfs2/structures.c b/gfs2/libgfs2/structures.c
index d7b7f4e1..4029df43 100644
--- a/gfs2/libgfs2/structures.c
+++ b/gfs2/libgfs2/structures.c
@@ -16,7 +16,7 @@
 #include "libgfs2.h"
 #include "crc32c.h"
 
-int build_master(struct gfs2_sbd *sdp)
+int lgfs2_build_master(struct gfs2_sbd *sdp)
 {
 	struct lgfs2_inum inum;
 	uint64_t bn;
@@ -151,7 +151,7 @@ int lgfs2_write_journal_data(struct gfs2_inode *ip)
 	return 0;
 }
 
-static struct gfs2_buffer_head *get_file_buf(struct gfs2_inode *ip, uint64_t lbn, int prealloc)
+static struct gfs2_buffer_head *lgfs2_get_file_buf(struct gfs2_inode *ip, uint64_t lbn, int prealloc)
 {
 	struct gfs2_sbd *sdp = ip->i_sbd;
 	uint64_t dbn;
@@ -175,7 +175,7 @@ static struct gfs2_buffer_head *get_file_buf(struct gfs2_inode *ip, uint64_t lbn
 		return bread(sdp, dbn);
 }
 
-int write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned int blocks)
+int lgfs2_write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned int blocks)
 {
 	struct gfs2_log_header *lh;
 	uint32_t x;
@@ -189,7 +189,7 @@ int write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned int blocks)
 	build_height(jnl, height);
 
 	for (x = 0; x < blocks; x++) {
-		struct gfs2_buffer_head *bh = get_file_buf(jnl, x, 1);
+		struct gfs2_buffer_head *bh = lgfs2_get_file_buf(jnl, x, 1);
 		if (!bh)
 			return -1;
 		bmodified(bh);
@@ -197,7 +197,7 @@ int write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned int blocks)
 	}
 	crc32c_optimization_init();
 	for (x = 0; x < blocks; x++) {
-		struct gfs2_buffer_head *bh = get_file_buf(jnl, x, 0);
+		struct gfs2_buffer_head *bh = lgfs2_get_file_buf(jnl, x, 0);
 		if (!bh)
 			return -1;
 
@@ -227,7 +227,7 @@ int write_journal(struct gfs2_inode *jnl, unsigned bsize, unsigned int blocks)
 	return 0;
 }
 
-int build_journal(struct gfs2_sbd *sdp, int j, struct gfs2_inode *jindex)
+int lgfs2_build_journal(struct gfs2_sbd *sdp, int j, struct gfs2_inode *jindex)
 {
 	char name[256];
 	int ret;
@@ -238,8 +238,8 @@ int build_journal(struct gfs2_sbd *sdp, int j, struct gfs2_inode *jindex)
 	if (sdp->md.journal[j] == NULL) {
 		return errno;
 	}
-	ret = write_journal(sdp->md.journal[j], sdp->sd_bsize,
-			    sdp->jsize << 20 >> sdp->sd_bsize_shift);
+	ret = lgfs2_write_journal(sdp->md.journal[j], sdp->sd_bsize,
+	                          sdp->jsize << 20 >> sdp->sd_bsize_shift);
 	return ret;
 }
 
@@ -278,7 +278,7 @@ struct gfs2_inode *lgfs2_build_jindex(struct gfs2_inode *master, struct lgfs2_in
 	return jindex;
 }
 
-struct gfs2_inode *build_inum_range(struct gfs2_inode *per_node, unsigned int j)
+struct gfs2_inode *lgfs2_build_inum_range(struct gfs2_inode *per_node, unsigned int j)
 {
 	char name[256];
 	struct gfs2_inode *ip;
@@ -295,7 +295,7 @@ struct gfs2_inode *build_inum_range(struct gfs2_inode *per_node, unsigned int j)
 	return ip;
 }
 
-struct gfs2_inode *build_statfs_change(struct gfs2_inode *per_node, unsigned int j)
+struct gfs2_inode *lgfs2_build_statfs_change(struct gfs2_inode *per_node, unsigned int j)
 {
 	char name[256];
 	struct gfs2_inode *ip;
@@ -312,7 +312,7 @@ struct gfs2_inode *build_statfs_change(struct gfs2_inode *per_node, unsigned int
 	return ip;
 }
 
-struct gfs2_inode *build_quota_change(struct gfs2_inode *per_node, unsigned int j)
+struct gfs2_inode *lgfs2_build_quota_change(struct gfs2_inode *per_node, unsigned int j)
 {
 	struct gfs2_sbd *sdp = per_node->i_sbd;
 	struct gfs2_meta_header mh;
@@ -337,7 +337,7 @@ struct gfs2_inode *build_quota_change(struct gfs2_inode *per_node, unsigned int
 	build_height(ip, hgt);
 
 	for (x = 0; x < blocks; x++) {
-		bh = get_file_buf(ip, x, 0);
+		bh = lgfs2_get_file_buf(ip, x, 0);
 		if (!bh)
 			return NULL;
 
@@ -349,7 +349,7 @@ struct gfs2_inode *build_quota_change(struct gfs2_inode *per_node, unsigned int
 	return ip;
 }
 
-struct gfs2_inode *build_inum(struct gfs2_sbd *sdp)
+struct gfs2_inode *lgfs2_build_inum(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *ip;
 
@@ -358,7 +358,7 @@ struct gfs2_inode *build_inum(struct gfs2_sbd *sdp)
 	return ip;
 }
 
-struct gfs2_inode *build_statfs(struct gfs2_sbd *sdp)
+struct gfs2_inode *lgfs2_build_statfs(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *ip;
 
@@ -367,7 +367,7 @@ struct gfs2_inode *build_statfs(struct gfs2_sbd *sdp)
 	return ip;
 }
 
-struct gfs2_inode *build_rindex(struct gfs2_sbd *sdp)
+struct gfs2_inode *lgfs2_build_rindex(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *ip;
 	struct osi_node *n, *next = NULL;
@@ -401,7 +401,7 @@ struct gfs2_inode *build_rindex(struct gfs2_sbd *sdp)
 	return ip;
 }
 
-struct gfs2_inode *build_quota(struct gfs2_sbd *sdp)
+struct gfs2_inode *lgfs2_build_quota(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *ip;
 	struct gfs2_quota qu;
@@ -428,7 +428,7 @@ struct gfs2_inode *build_quota(struct gfs2_sbd *sdp)
 	return ip;
 }
 
-int build_root(struct gfs2_sbd *sdp)
+int lgfs2_build_root(struct gfs2_sbd *sdp)
 {
 	struct lgfs2_inum inum;
 	uint64_t bn;
@@ -453,7 +453,7 @@ int build_root(struct gfs2_sbd *sdp)
 	return 0;
 }
 
-int do_init_inum(struct gfs2_sbd *sdp)
+int lgfs2_init_inum(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *ip = sdp->md.inum;
 	__be64 buf;
@@ -467,7 +467,7 @@ int do_init_inum(struct gfs2_sbd *sdp)
 	return 0;
 }
 
-int do_init_statfs(struct gfs2_sbd *sdp, struct gfs2_statfs_change *res)
+int lgfs2_init_statfs(struct gfs2_sbd *sdp, struct gfs2_statfs_change *res)
 {
 	struct gfs2_inode *ip = sdp->md.statfs;
 	struct gfs2_statfs_change sc;
@@ -486,7 +486,7 @@ int do_init_statfs(struct gfs2_sbd *sdp, struct gfs2_statfs_change *res)
 	return 0;
 }
 
-int gfs2_check_meta(const char *buf, int type)
+int lgfs2_check_meta(const char *buf, int type)
 {
 	struct gfs2_meta_header *mh = (struct gfs2_meta_header *)buf;
 	uint32_t check_magic = be32_to_cpu(mh->mh_magic);
diff --git a/gfs2/libgfs2/super.c b/gfs2/libgfs2/super.c
index c3c59e7e..8dfeee57 100644
--- a/gfs2/libgfs2/super.c
+++ b/gfs2/libgfs2/super.c
@@ -185,7 +185,7 @@ static int good_on_disk(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
 	int is_rgrp;
 
 	bh = bread(sdp, rgd->rt_addr);
-	is_rgrp = (gfs2_check_meta(bh->b_data, GFS2_METATYPE_RG) == 0);
+	is_rgrp = (lgfs2_check_meta(bh->b_data, GFS2_METATYPE_RG) == 0);
 	brelse(bh);
 	return is_rgrp;
 }
diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 435ea0a7..318c24f2 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -695,7 +695,7 @@ static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 	for (j = 0; j < sdp->md.journals; j++) {
 		struct gfs2_inode *ip;
 
-		ip = build_inum_range(per_node, j);
+		ip = lgfs2_build_inum_range(per_node, j);
 		if (ip == NULL) {
 			fprintf(stderr, _("Error building '%s': %s\n"), "inum_range",
 			        strerror(errno));
@@ -707,7 +707,7 @@ static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 		}
 		inode_put(&ip);
 
-		ip = build_statfs_change(per_node, j);
+		ip = lgfs2_build_statfs_change(per_node, j);
 		if (ip == NULL) {
 			fprintf(stderr, _("Error building '%s': %s\n"), "statfs_change",
 			        strerror(errno));
@@ -719,7 +719,7 @@ static int build_per_node(struct gfs2_sbd *sdp, struct mkfs_opts *opts)
 		}
 		inode_put(&ip);
 
-		ip = build_quota_change(per_node, j);
+		ip = lgfs2_build_quota_change(per_node, j);
 		if (ip == NULL) {
 			fprintf(stderr, _("Error building '%s': %s\n"), "quota_change",
 			        strerror(errno));
@@ -1278,7 +1278,7 @@ int main(int argc, char *argv[])
 	}
 	lgfs2_attach_rgrps(&sbd, rgs); // Temporary
 
-	error = build_master(&sbd);
+	error = lgfs2_build_master(&sbd);
 	if (error) {
 		fprintf(stderr, _("Error building '%s': %s\n"), "master", strerror(errno));
 		exit(EXIT_FAILURE);
@@ -1298,7 +1298,7 @@ int main(int argc, char *argv[])
 	if (error != 0)
 		exit(1);
 
-	sbd.md.inum = build_inum(&sbd);
+	sbd.md.inum = lgfs2_build_inum(&sbd);
 	if (sbd.md.inum == NULL) {
 		fprintf(stderr, _("Error building '%s': %s\n"), "inum", strerror(errno));
 		exit(EXIT_FAILURE);
@@ -1307,7 +1307,7 @@ int main(int argc, char *argv[])
 		printf("\nInum Inode:\n");
 		dinode_print(sbd.md.inum->i_bh->b_data);
 	}
-	sbd.md.statfs = build_statfs(&sbd);
+	sbd.md.statfs = lgfs2_build_statfs(&sbd);
 	if (sbd.md.statfs == NULL) {
 		fprintf(stderr, _("Error building '%s': %s\n"), "statfs", strerror(errno));
 		exit(EXIT_FAILURE);
@@ -1316,7 +1316,7 @@ int main(int argc, char *argv[])
 		printf("\nStatFS Inode:\n");
 		dinode_print(sbd.md.statfs->i_bh->b_data);
 	}
-	ip = build_rindex(&sbd);
+	ip = lgfs2_build_rindex(&sbd);
 	if (ip == NULL) {
 		fprintf(stderr, _("Error building '%s': %s\n"), "rindex", strerror(errno));
 		exit(EXIT_FAILURE);
@@ -1330,7 +1330,7 @@ int main(int argc, char *argv[])
 		printf("%s", _("Creating quota file: "));
 		fflush(stdout);
 	}
-	ip = build_quota(&sbd);
+	ip = lgfs2_build_quota(&sbd);
 	if (ip == NULL) {
 		fprintf(stderr, _("Error building '%s': %s\n"), "quota", strerror(errno));
 		exit(EXIT_FAILURE);
@@ -1343,7 +1343,7 @@ int main(int argc, char *argv[])
 	if (!opts.quiet)
 		printf("%s", _("Done\n"));
 
-	build_root(&sbd);
+	lgfs2_build_root(&sbd);
 	if (opts.debug) {
 		printf("\nRoot directory:\n");
 		dinode_print(sbd.md.rooti->i_bh->b_data);
@@ -1355,11 +1355,11 @@ int main(int argc, char *argv[])
 	sbd.sd_lockproto[GFS2_LOCKNAME_LEN - 1] = '\0';
 	sbd.sd_locktable[GFS2_LOCKNAME_LEN - 1] = '\0';
 
-	do_init_inum(&sbd);
+	lgfs2_init_inum(&sbd);
 	if (opts.debug)
 		printf("\nNext Inum: %"PRIu64"\n", sbd.md.next_inum);
 
-	do_init_statfs(&sbd, &sc);
+	lgfs2_init_statfs(&sbd, &sc);
 	if (opts.debug) {
 		printf("\nStatfs:\n");
 		statfs_change_print(&sc);
-- 
2.34.1

