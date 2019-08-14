Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8358D8BC
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Aug 2019 19:01:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34772308A968;
	Wed, 14 Aug 2019 17:01:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B9138BE39;
	Wed, 14 Aug 2019 17:01:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF03F24F31;
	Wed, 14 Aug 2019 17:01:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7EH1GE3028900 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 13:01:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5DB4183090; Wed, 14 Aug 2019 17:01:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EAC783078
	for <cluster-devel@redhat.com>; Wed, 14 Aug 2019 17:01:15 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Aug 2019 18:01:02 +0100
Message-Id: <20190814170105.8775-3-anprice@redhat.com>
In-Reply-To: <20190814170105.8775-1-anprice@redhat.com>
References: <20190814170105.8775-1-anprice@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 2/5] gfs2_convert: Use the new list.h
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 14 Aug 2019 17:01:56 +0000 (UTC)

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c | 80 ++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index 17217ce5..34e47271 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -31,7 +31,7 @@
 #include <linux/types.h>
 #include <linux/gfs2_ondisk.h>
 #include <logging.h>
-#include "osi_list.h"
+#include <list.h>
 #include "copyright.cf"
 #include "libgfs2.h"
 
@@ -71,18 +71,18 @@
 #define DIV_RU(x, y) (((x) + (y) - 1) / (y))
 
 struct inode_dir_block {
-	osi_list_t list;
+	struct list_head list;
 	uint64_t di_addr;
 	uint64_t di_paddr; /* Parent dir inode addr */
 };
 
 struct inode_block {
-	osi_list_t list;
+	struct list_head list;
 	uint64_t di_addr;
 };
 
 struct blocklist {
-	osi_list_t list;
+	struct list_head list;
 	uint64_t block;
 	struct metapath mp;
 	int height;
@@ -510,7 +510,7 @@ static int get_inode_metablocks(struct gfs2_sbd *sbp, struct gfs2_inode *ip, str
 {
 	struct blocklist *blk, *newblk;
 	struct gfs2_buffer_head *bh, *dibh = ip->i_bh;
-	osi_list_t *tmp;
+	struct list_head *tmp;
 	uint64_t *ptr1, block;
 	int h, ptrnum;
 	int bufsize = sbp->bsize - sizeof(struct gfs_indirect);
@@ -537,11 +537,11 @@ static int get_inode_metablocks(struct gfs2_sbd *sbp, struct gfs2_inode *ip, str
 	/* Zero out the pointers so we can fill them in later. */
 	memset(dibh->b_data + sizeof(struct gfs_dinode), 0,
 	       sbp->bsize - sizeof(struct gfs_dinode));
-	osi_list_add_prev(&blk->list, &blocks->list);
+	list_add_tail(&blk->list, &blocks->list);
 
 	/* Now run the metadata chain and build lists of all metadata blocks */
-	osi_list_foreach(tmp, &blocks->list) {
-		blk = osi_list_entry(tmp, struct blocklist, list);
+	list_for_each(tmp, &blocks->list) {
+		blk = list_entry(tmp, struct blocklist, list);
 
 		if (blk->height >= ip->i_di.di_height - 1)
 			continue;
@@ -572,7 +572,7 @@ static int get_inode_metablocks(struct gfs2_sbd *sbp, struct gfs2_inode *ip, str
 				newblk->mp.mp_list[h] = blk->mp.mp_list[h];
 			newblk->mp.mp_list[h] = ptrnum;
 			/* Queue it to be processed later on in the loop. */
-			osi_list_add_prev(&newblk->list, &blocks->list);
+			list_add_tail(&newblk->list, &blocks->list);
 			/* read the new metadata block's pointers */
 			bh = bread(sbp, block);
 			memcpy(newblk->ptrbuf, bh->b_data + sizeof(struct gfs_indirect), bufsize);
@@ -704,7 +704,7 @@ static int adjust_indirect_blocks(struct gfs2_sbd *sbp, struct gfs2_inode *ip)
 {
 	uint64_t dinode_size;
 	uint32_t gfs2_hgt, di_height;
-	osi_list_t *tmp=NULL, *x;
+	struct list_head *tmp=NULL, *x;
 	struct blocklist blocks, *blk;
 	int error = 0;
 
@@ -722,7 +722,7 @@ static int adjust_indirect_blocks(struct gfs2_sbd *sbp, struct gfs2_inode *ip)
 		return 0; /* nothing to do */
 	}
 
-	osi_list_init(&blocks.list);
+	INIT_LIST_HEAD(&blocks.list);
 
 	error = get_inode_metablocks(sbp, ip, &blocks);
 	if (error)
@@ -740,13 +740,13 @@ static int adjust_indirect_blocks(struct gfs2_sbd *sbp, struct gfs2_inode *ip)
 
 	/* Now run through the block list a second time.  If the block
 	   is a data block, rewrite the data to the gfs2 offset. */
-	osi_list_foreach_safe(tmp, &blocks.list, x) {
+	list_for_each_safe(tmp, x, &blocks.list) {
 
-		blk = osi_list_entry(tmp, struct blocklist, list);
+		blk = list_entry(tmp, struct blocklist, list);
 		/* If it's not metadata that holds data block pointers
 		   (i.e. metadata pointing to other metadata) */
 		if (blk->height != di_height - 1) {
-			osi_list_del(tmp);
+			list_del(tmp);
 			free(blk->ptrbuf);
 			free(blk);
 			continue;
@@ -760,7 +760,7 @@ static int adjust_indirect_blocks(struct gfs2_sbd *sbp, struct gfs2_inode *ip)
 		if (error)
 			goto out;
 
-		osi_list_del(tmp);
+		list_del(tmp);
 		free(blk->ptrbuf);
 		free(blk);
 	}
@@ -773,9 +773,9 @@ static int adjust_indirect_blocks(struct gfs2_sbd *sbp, struct gfs2_inode *ip)
 	return error;
 
 out:
-	while (!osi_list_empty(&blocks.list)) {
-		blk = osi_list_entry(tmp, struct blocklist, list);
-		osi_list_del(&blocks.list);
+	while (!list_empty(&blocks.list)) {
+		blk = list_entry(tmp, struct blocklist, list);
+		list_del(&blocks.list);
 		free(blk->ptrbuf);
 		free(blk);
 	}
@@ -811,8 +811,8 @@ static int fix_cdpn_symlink(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh, s
 		}
 		memset(fix, 0, sizeof(struct inode_dir_block));
 		fix->di_addr = ip->i_di.di_num.no_addr;
-		osi_list_add_prev((osi_list_t *)&fix->list,
-				  (osi_list_t *)&cdpns_to_fix);
+		list_add_tail((struct list_head *)&fix->list,
+				  (struct list_head *)&cdpns_to_fix);
 	}
 
 	return 0;
@@ -893,8 +893,8 @@ static int adjust_inode(struct gfs2_sbd *sbp, struct gfs2_buffer_head *bh)
 		}
 		memset(fixdir, 0, sizeof(struct inode_block));
 		fixdir->di_addr = inode->i_di.di_num.no_addr;
-		osi_list_add_prev((osi_list_t *)&fixdir->list,
-						  (osi_list_t *)&dirs_to_fix);
+		list_add_tail((struct list_head *)&fixdir->list,
+						  (struct list_head *)&dirs_to_fix);
 		break;
 	case GFS_FILE_REG:           /* regular file     */
 		inode->i_di.di_mode |= S_IFREG;
@@ -1025,7 +1025,7 @@ static int next_rg_metatype(struct gfs2_sbd *sdp, struct rgrp_tree *rgd,
 /*                                                                           */
 /* Returns: 0 on success, -1 on failure                                      */
 /* ------------------------------------------------------------------------- */
-static int inode_renumber(struct gfs2_sbd *sbp, uint64_t root_inode_addr, osi_list_t *cdpn_to_fix)
+static int inode_renumber(struct gfs2_sbd *sbp, uint64_t root_inode_addr, struct list_head *cdpn_to_fix)
 {
 	struct rgrp_tree *rgd;
 	struct osi_node *n, *next = NULL;
@@ -1237,10 +1237,10 @@ static int process_dirent_info(struct gfs2_inode *dip, struct gfs2_sbd *sbp,
 		 * a cdpn symlink's parent. If so add it to the list element
 		 */
 		if (dent->de_type == cpu_to_be16(DT_LNK)) {
-			osi_list_t *tmp;
+			struct list_head *tmp;
 			struct inode_dir_block *fix;
-			osi_list_foreach(tmp, &cdpns_to_fix.list) {
-				fix = osi_list_entry(tmp, struct inode_dir_block, list);
+			list_for_each(tmp, &cdpns_to_fix.list) {
+				fix = list_entry(tmp, struct inode_dir_block, list);
 				if (fix->di_addr == inum.no_addr)
 					fix->di_paddr = dip->i_di.di_num.no_addr;
 			}
@@ -1349,9 +1349,9 @@ static int process_directory(struct gfs2_sbd *sbp, uint64_t dirblock, uint64_t d
 /* fix_directory_info - sync new inode numbers with directory info           */
 /* Returns: 0 on success, -1 on failure                                      */
 /* ------------------------------------------------------------------------- */
-static int fix_directory_info(struct gfs2_sbd *sbp, osi_list_t *dir_to_fix)
+static int fix_directory_info(struct gfs2_sbd *sbp, struct list_head *dir_to_fix)
 {
-	osi_list_t *tmp, *fix;
+	struct list_head *tmp, *fix;
 	struct inode_block *dir_iblk;
 	uint64_t dirblock;
 	uint32_t gfs1_inptrs = sbp->sd_inptrs;
@@ -1369,7 +1369,7 @@ static int fix_directory_info(struct gfs2_sbd *sbp, osi_list_t *dir_to_fix)
 	/* for every directory in the list */
 	for (fix = dir_to_fix->next; fix != dir_to_fix; fix = fix->next) {
 		if (tmp) {
-			osi_list_del(tmp);
+			list_del(tmp);
 			free(tmp);
 		}
 		tmp = fix; /* remember the addr to free next time */
@@ -1384,7 +1384,7 @@ static int fix_directory_info(struct gfs2_sbd *sbp, osi_list_t *dir_to_fix)
 	}
 	/* Free the last entry in memory: */
 	if (tmp) {
-		osi_list_del(tmp);
+		list_del(tmp);
 		free(tmp);
 	}
 	sbp->sd_inptrs = gfs1_inptrs;
@@ -1395,21 +1395,21 @@ static int fix_directory_info(struct gfs2_sbd *sbp, osi_list_t *dir_to_fix)
 /* fix_cdpn_symlinks - convert cdpn symlinks to empty directories            */
 /* Returns: 0 on success, -1 on failure                                      */
 /* ------------------------------------------------------------------------- */
-static int fix_cdpn_symlinks(struct gfs2_sbd *sbp, osi_list_t *cdpn_to_fix)
+static int fix_cdpn_symlinks(struct gfs2_sbd *sbp, struct list_head *cdpn_to_fix)
 {
-	osi_list_t *tmp, *x;
+	struct list_head *tmp, *x;
 	int error = 0;
 
 	cdpns_fixed = 0;
-	osi_list_foreach_safe(tmp, cdpn_to_fix, x) {
+	list_for_each_safe(tmp, x, cdpn_to_fix) {
 		struct gfs2_inum fix, dir;
 		struct inode_dir_block *l_fix;
 		struct gfs2_buffer_head *bh = NULL;
 		struct gfs2_inode *fix_inode;
 		uint64_t eablk;
 
-		l_fix = osi_list_entry(tmp, struct inode_dir_block, list);
-		osi_list_del(tmp);
+		l_fix = list_entry(tmp, struct inode_dir_block, list);
+		list_del(tmp);
 
 		/* convert symlink to empty dir */
 		error = fetch_inum(sbp, l_fix->di_addr, &fix, &eablk);
@@ -1565,8 +1565,8 @@ static int init(struct gfs2_sbd *sbp, struct gfs2_options *opts)
 	sbp->sd_sb.sb_header.mh_type = GFS2_METATYPE_SB;
 	sbp->sd_sb.sb_header.mh_format = GFS2_FORMAT_SB;
 
-	osi_list_init((osi_list_t *)&dirs_to_fix);
-	osi_list_init((osi_list_t *)&cdpns_to_fix);
+	INIT_LIST_HEAD((struct list_head *)&dirs_to_fix);
+	INIT_LIST_HEAD((struct list_head *)&cdpns_to_fix);
 	/* ---------------------------------------------- */
 	/* Initialize lists and read in the superblock.   */
 	/* ---------------------------------------------- */
@@ -2210,7 +2210,7 @@ int main(int argc, char **argv)
 	if (!error) {
 		/* Add a string notifying inode converstion start? */
 		error = inode_renumber(&sb2, sb2.sd_sb.sb_root_dir.no_addr,
-				       (osi_list_t *)&cdpns_to_fix);
+				       (struct list_head *)&cdpns_to_fix);
 		if (error)
 			log_crit(_("\n%s: Error renumbering inodes.\n"), opts.device);
 		fsync(sb2.device_fd); /* write the buffers to disk */
@@ -2219,7 +2219,7 @@ int main(int argc, char **argv)
 	/* Fix the directories to match the new numbers.  */
 	/* ---------------------------------------------- */
 	if (!error) {
-		error = fix_directory_info(&sb2, (osi_list_t *)&dirs_to_fix);
+		error = fix_directory_info(&sb2, (struct list_head *)&dirs_to_fix);
 		log_notice(_("\r%llu directories, %llu dirents fixed."),
 			   (unsigned long long)dirs_fixed,
 			   (unsigned long long)dirents_fixed);
@@ -2231,7 +2231,7 @@ int main(int argc, char **argv)
 	/* Convert cdpn symlinks to empty dirs            */
 	/* ---------------------------------------------- */
 	if (!error) {
-		error = fix_cdpn_symlinks(&sb2, (osi_list_t *)&cdpns_to_fix);
+		error = fix_cdpn_symlinks(&sb2, (struct list_head *)&cdpns_to_fix);
 		log_notice(_("\r%llu cdpn symlinks moved to empty directories."),
 			   (unsigned long long)cdpns_fixed);
 		fflush(stdout);
-- 
2.21.0

