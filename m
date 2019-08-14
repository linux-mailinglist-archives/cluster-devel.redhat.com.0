Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1DF8D8BB
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Aug 2019 19:01:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 274D631752B2;
	Wed, 14 Aug 2019 17:01:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1199282086;
	Wed, 14 Aug 2019 17:01:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E92FF24F30;
	Wed, 14 Aug 2019 17:01:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7EH1LbS028925 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 13:01:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2A28783078; Wed, 14 Aug 2019 17:01:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58D3A8378A
	for <cluster-devel@redhat.com>; Wed, 14 Aug 2019 17:01:18 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Aug 2019 18:01:04 +0100
Message-Id: <20190814170105.8775-5-anprice@redhat.com>
In-Reply-To: <20190814170105.8775-1-anprice@redhat.com>
References: <20190814170105.8775-1-anprice@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 4/5] libgfs2: Use the new list.h
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 14 Aug 2019 17:01:56 +0000 (UTC)

Requires updates in the utils where they use osi_list_t exposed through
libgfs2 interfaces.

The new list.h's pointer poisoning found a double-release in savemeta
which is fixed.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c      | 25 ++++++++++---------------
 gfs2/fsck/metawalk.c      | 38 +++++++++++++++++---------------------
 gfs2/fsck/pass1.c         |  2 +-
 gfs2/fsck/pass1b.c        |  2 +-
 gfs2/fsck/pass4.c         |  4 ++--
 gfs2/fsck/rgrepair.c      |  2 +-
 gfs2/fsck/util.h          |  2 +-
 gfs2/libgfs2/block_list.c | 17 ++++++++---------
 gfs2/libgfs2/buf.c        |  4 ++--
 gfs2/libgfs2/fs_ops.c     | 13 ++++++-------
 gfs2/libgfs2/gfs1.c       |  1 -
 gfs2/libgfs2/lang.h       |  1 +
 gfs2/libgfs2/libgfs2.h    |  6 +++---
 gfs2/libgfs2/super.c      |  1 -
 gfs2/mkfs/gfs2_mkfs.h     |  1 -
 15 files changed, 53 insertions(+), 66 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 18432b7c..2e1aef36 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -22,7 +22,6 @@
 #include <time.h>
 
 #include <logging.h>
-#include "osi_list.h"
 #include "gfs2hex.h"
 #include "hexedit.h"
 #include "libgfs2.h"
@@ -516,7 +515,7 @@ static void save_ea_block(struct metafd *mfd, struct gfs2_buffer_head *metabh, u
 /*
  * save_indirect_blocks - save all indirect blocks for the given buffer
  */
-static void save_indirect_blocks(struct metafd *mfd, osi_list_t *cur_list,
+static void save_indirect_blocks(struct metafd *mfd, struct list_head *cur_list,
            struct gfs2_buffer_head *mybh, uint64_t owner, int height, int hgt)
 {
 	uint64_t old_block = 0, indir_block;
@@ -545,7 +544,7 @@ static void save_indirect_blocks(struct metafd *mfd, osi_list_t *cur_list,
 		if (height != hgt && /* If not at max height and */
 		    (!gfs2_check_range(&sbd, indir_block))) {
 			nbh = bread(&sbd, indir_block);
-			osi_list_add_prev(&nbh->b_altlist, cur_list);
+			list_add_tail(&nbh->b_list, cur_list);
 			/* The buffer_head needs to be queued ahead, so
 			   don't release it!
 			   brelse(nbh);*/
@@ -601,13 +600,13 @@ static void save_inode_data(struct metafd *mfd, uint64_t iblk)
 {
 	uint32_t height;
 	struct gfs2_inode *inode;
-	osi_list_t metalist[GFS2_MAX_META_HEIGHT];
-	osi_list_t *prev_list, *cur_list, *tmp;
+	struct list_head metalist[GFS2_MAX_META_HEIGHT];
+	struct list_head *prev_list, *cur_list, *tmp;
 	struct gfs2_buffer_head *metabh, *mybh;
 	int i;
 
 	for (i = 0; i < GFS2_MAX_META_HEIGHT; i++)
-		osi_list_init(&metalist[i]);
+		INIT_LIST_HEAD(&metalist[i]);
 	metabh = bread(&sbd, iblk);
 	if (sbd.gfs1) {
 		inode = lgfs2_gfs_inode_get(&sbd, metabh);
@@ -631,14 +630,13 @@ static void save_inode_data(struct metafd *mfd, uint64_t iblk)
 	else if (height && !(inode->i_di.di_flags & GFS2_DIF_SYSTEM) &&
 		 !block_is_systemfile(iblk) && !S_ISDIR(inode->i_di.di_mode))
 		height--;
-	osi_list_add(&metabh->b_altlist, &metalist[0]);
+	list_add(&metabh->b_list, &metalist[0]);
         for (i = 1; i <= height; i++){
 		prev_list = &metalist[i - 1];
 		cur_list = &metalist[i];
 
 		for (tmp = prev_list->next; tmp != prev_list; tmp = tmp->next){
-			mybh = osi_list_entry(tmp, struct gfs2_buffer_head,
-					      b_altlist);
+			mybh = list_entry(tmp, struct gfs2_buffer_head, b_list);
 			warm_fuzzy_stuff(iblk, FALSE);
 			save_indirect_blocks(mfd, cur_list, mybh, iblk,
 					     height, i);
@@ -647,12 +645,10 @@ static void save_inode_data(struct metafd *mfd, uint64_t iblk)
 	/* free metalists */
 	for (i = 0; i < GFS2_MAX_META_HEIGHT; i++) {
 		cur_list = &metalist[i];
-		while (!osi_list_empty(cur_list)) {
-			mybh = osi_list_entry(cur_list->next,
-					    struct gfs2_buffer_head,
-					    b_altlist);
+		while (!list_empty(cur_list)) {
+			mybh = list_entry(cur_list->next, struct gfs2_buffer_head, b_list);
 			if (mybh == inode->i_bh)
-				osi_list_del(&mybh->b_altlist);
+				list_del(&mybh->b_list);
 			else
 				brelse(mybh);
 		}
@@ -703,7 +699,6 @@ static void save_inode_data(struct metafd *mfd, uint64_t iblk)
 		brelse(lbh);
 	}
 	inode_put(&inode);
-	brelse(metabh);
 }
 
 static void get_journal_inode_blocks(void)
diff --git a/gfs2/fsck/metawalk.c b/gfs2/fsck/metawalk.c
index 3b8fefab..5176828e 100644
--- a/gfs2/fsck/metawalk.c
+++ b/gfs2/fsck/metawalk.c
@@ -1137,20 +1137,19 @@ int check_inode_eattr(struct gfs2_inode *ip, struct metawalk_fxns *pass)
 /**
  * free_metalist - free all metadata on a multi-level metadata list
  */
-static void free_metalist(struct gfs2_inode *ip, osi_list_t *mlp)
+static void free_metalist(struct gfs2_inode *ip, struct list_head *mlp)
 {
 	int i;
 	struct gfs2_buffer_head *nbh;
 
 	for (i = 0; i < GFS2_MAX_META_HEIGHT; i++) {
-		osi_list_t *list;
+		struct list_head *list;
 
 		list = &mlp[i];
-		while (!osi_list_empty(list)) {
-			nbh = osi_list_entry(list->next,
-					     struct gfs2_buffer_head, b_altlist);
+		while (!list_empty(list)) {
+			nbh = list_entry(list->next, struct gfs2_buffer_head, b_list);
 			if (nbh == ip->i_bh)
-				osi_list_del_init(&nbh->b_altlist);
+				list_del_init(&nbh->b_list);
 			else
 				brelse(nbh);
 		}
@@ -1221,18 +1220,18 @@ static void file_ra(struct gfs2_inode *ip, struct gfs2_buffer_head *bh,
  * @ip:
  * @mlp:
  */
-static int build_and_check_metalist(struct gfs2_inode *ip, osi_list_t *mlp,
+static int build_and_check_metalist(struct gfs2_inode *ip, struct list_head *mlp,
 				    struct metawalk_fxns *pass)
 {
 	uint32_t height = ip->i_di.di_height;
 	struct gfs2_buffer_head *bh, *nbh, *metabh = ip->i_bh;
-	osi_list_t *prev_list, *cur_list, *tmp;
+	struct list_head *prev_list, *cur_list, *tmp;
 	int h, head_size, iblk_type;
 	uint64_t *ptr, block, *undoptr;
 	int error, was_duplicate, is_valid;
 	int maxptrs;
 
-	osi_list_add(&metabh->b_altlist, &mlp[0]);
+	list_add(&metabh->b_list, &mlp[0]);
 
 	/* Directories are special.  Their 'data' is the hash table, which is
 	   basically an indirect block list. Their height is not important
@@ -1269,8 +1268,7 @@ static int build_and_check_metalist(struct gfs2_inode *ip, osi_list_t *mlp,
 		cur_list = &mlp[h];
 
 		for (tmp = prev_list->next; tmp != prev_list; tmp = tmp->next){
-			bh = osi_list_entry(tmp, struct gfs2_buffer_head,
-					    b_altlist);
+			bh = list_entry(tmp, struct gfs2_buffer_head, b_list);
 			if (gfs2_check_meta(bh->b_data, iblk_type)) {
 				if (pass->invalid_meta_is_fatal)
 					return meta_error;
@@ -1355,7 +1353,7 @@ static int build_and_check_metalist(struct gfs2_inode *ip, osi_list_t *mlp,
 				}
 				if (!nbh)
 					nbh = bread(ip->i_sbd, block);
-				osi_list_add_prev(&nbh->b_altlist, cur_list);
+				list_add_tail(&nbh->b_list, cur_list);
 			} /* for all data on the indirect block */
 		} /* for blocks at that height */
 	} /* for height */
@@ -1537,8 +1535,8 @@ static int hdr_size(struct gfs2_buffer_head *bh, int height)
  */
 int check_metatree(struct gfs2_inode *ip, struct metawalk_fxns *pass)
 {
-	osi_list_t metalist[GFS2_MAX_META_HEIGHT];
-	osi_list_t *list, *tmp;
+	struct list_head metalist[GFS2_MAX_META_HEIGHT];
+	struct list_head *list, *tmp;
 	struct gfs2_buffer_head *bh;
 	uint32_t height = ip->i_di.di_height;
 	int  i, head_size;
@@ -1552,7 +1550,7 @@ int check_metatree(struct gfs2_inode *ip, struct metawalk_fxns *pass)
 		return 0;
 
 	for (i = 0; i < GFS2_MAX_META_HEIGHT; i++)
-		osi_list_init(&metalist[i]);
+		INIT_LIST_HEAD(&metalist[i]);
 
 	/* create and check the metadata list for each height */
 	error = build_and_check_metalist(ip, &metalist[0], pass);
@@ -1585,7 +1583,7 @@ int check_metatree(struct gfs2_inode *ip, struct metawalk_fxns *pass)
 			free_metalist(ip, &metalist[0]);
 			return 0;
 		}
-		bh = list_entry(tmp, struct gfs2_buffer_head, b_altlist);
+		bh = list_entry(tmp, struct gfs2_buffer_head, b_list);
 		head_size = hdr_size(bh, height);
 		if (!head_size)
 			continue;
@@ -1623,11 +1621,9 @@ undo_metalist:
 		return error;
 	}
 	for (i = 0; pass->undo_check_meta && i < height; i++) {
-		while (!osi_list_empty(&metalist[i])) {
+		while (!list_empty(&metalist[i])) {
 			list = &metalist[i];
-			bh = list_entry(list->next,
-					    struct gfs2_buffer_head,
-					    b_altlist);
+			bh = list_entry(list->next, struct gfs2_buffer_head, b_list);
 			log_err(_("Undoing metadata work for block %llu "
 				  "(0x%llx)\n"),
 				(unsigned long long)bh->b_blocknr,
@@ -1661,7 +1657,7 @@ undo_metalist:
 				}
 			}
 			if (bh == ip->i_bh)
-				osi_list_del(&bh->b_altlist);
+				list_del(&bh->b_list);
 			else
 				brelse(bh);
 		}
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index 442734ba..357b4fd8 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -2167,7 +2167,7 @@ int pass1(struct gfs2_sbd *sdp)
 		gfs2_bmap_destroy(sdp, bl);
 		return FSCK_ERROR;
 	}
-	osi_list_init(&gfs1_rindex_blks.list);
+	INIT_LIST_HEAD(&gfs1_rindex_blks.list);
 
 	/* FIXME: In the gfs fsck, we had to mark things like the
 	 * journals and indices and such as 'other_meta' - in gfs2,
diff --git a/gfs2/fsck/pass1b.c b/gfs2/fsck/pass1b.c
index a6dbf887..76d577b2 100644
--- a/gfs2/fsck/pass1b.c
+++ b/gfs2/fsck/pass1b.c
@@ -758,7 +758,7 @@ static int handle_dup_blk(struct gfs2_sbd *sdp, struct duptree *dt)
 	/* If there's still a last remaining reference, and it's a valid
 	   reference, use it to determine the correct block type for our
 	   blockmap and bitmap. */
-	if (dh.ref_inode_count == 1 && !osi_list_empty(&dt->ref_inode_list)) {
+	if (dh.ref_inode_count == 1 && !list_empty(&dt->ref_inode_list)) {
 		resolve_last_reference(sdp, dt, acceptable_ref);
 	} else {
 		/* They may have answered no and not fixed all references. */
diff --git a/gfs2/fsck/pass4.c b/gfs2/fsck/pass4.c
index 313ff0fb..1f097972 100644
--- a/gfs2/fsck/pass4.c
+++ b/gfs2/fsck/pass4.c
@@ -205,7 +205,7 @@ static int scan_inode_list(struct gfs2_sbd *sdp)
 		log_debug( _("block %llu (0x%llx) has link count %d\n"),
 			 (unsigned long long)ii->di_num.no_addr,
 			 (unsigned long long)ii->di_num.no_addr, ii->di_nlink);
-	} /* osi_list_foreach(tmp, list) */
+	}
 
 	return adjust_lf_links(lf_addition);
 }
@@ -238,7 +238,7 @@ static int scan_dir_list(struct gfs2_sbd *sdp)
 		log_debug( _("block %llu (0x%llx) has link count %d\n"),
 			 (unsigned long long)di->dinode.no_addr,
 			 (unsigned long long)di->dinode.no_addr, di->di_nlink);
-	} /* osi_list_foreach(tmp, list) */
+	}
 
 	return adjust_lf_links(lf_addition);
 }
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index 76dd0eba..17325eb4 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -56,7 +56,7 @@ static void find_journaled_rgs(struct gfs2_sbd *sdp)
 	struct gfs2_buffer_head *bh;
 	int false_count;
 
-	osi_list_init(&false_rgrps.list);
+	INIT_LIST_HEAD(&false_rgrps.list);
 	for (j = 0; j < sdp->md.journals; j++) {
 		ip = sdp->md.journal[j];
 		log_debug(_("Checking for rgrps in journal%d which starts "
diff --git a/gfs2/fsck/util.h b/gfs2/fsck/util.h
index d93b65d3..842c4202 100644
--- a/gfs2/fsck/util.h
+++ b/gfs2/fsck/util.h
@@ -12,7 +12,7 @@
 #define INODE_VALID 1
 #define INODE_INVALID 0
 
-struct di_info *search_list(osi_list_t *list, uint64_t addr);
+struct di_info *search_list(struct list_head *list, uint64_t addr);
 void big_file_comfort(struct gfs2_inode *ip, uint64_t blks_checked);
 void warm_fuzzy_stuff(uint64_t block);
 int add_duplicate_ref(struct gfs2_inode *ip, uint64_t block,
diff --git a/gfs2/libgfs2/block_list.c b/gfs2/libgfs2/block_list.c
index 9d998459..780f635d 100644
--- a/gfs2/libgfs2/block_list.c
+++ b/gfs2/libgfs2/block_list.c
@@ -14,22 +14,21 @@ void gfs2_special_free(struct special_blocks *blist)
 {
 	struct special_blocks *f;
 
-	while(!osi_list_empty(&blist->list)) {
-		f = osi_list_entry(blist->list.next, struct special_blocks,
-				   list);
-		osi_list_del(&f->list);
+	while(!list_empty(&blist->list)) {
+		f = list_entry(blist->list.next, struct special_blocks, list);
+		list_del(&f->list);
 		free(f);
 	}
 }
 
 struct special_blocks *blockfind(struct special_blocks *blist, uint64_t num)
 {
-	osi_list_t *head = &blist->list;
-	osi_list_t *tmp;
+	struct list_head *head = &blist->list;
+	struct list_head *tmp;
 	struct special_blocks *b;
 
 	for (tmp = head->next; tmp != head; tmp = tmp->next) {
-		b = osi_list_entry(tmp, struct special_blocks, list);
+		b = list_entry(tmp, struct special_blocks, list);
 		if (b->block == num)
 			return b;
 	}
@@ -44,7 +43,7 @@ void gfs2_special_add(struct special_blocks *blocklist, uint64_t block)
 	if (b) {
 		memset(b, 0, sizeof(*b));
 		b->block = block;
-		osi_list_add_prev(&b->list, &blocklist->list);
+		list_add_tail(&b->list, &blocklist->list);
 	}
 }
 
@@ -61,7 +60,7 @@ void gfs2_special_clear(struct special_blocks *blocklist, uint64_t block)
 
 	b = blockfind(blocklist, block);
 	if (b) {
-		osi_list_del(&b->list);
+		list_del(&b->list);
 		free(b);
 	}
 }
diff --git a/gfs2/libgfs2/buf.c b/gfs2/libgfs2/buf.c
index 097ac33b..7c2324fe 100644
--- a/gfs2/libgfs2/buf.c
+++ b/gfs2/libgfs2/buf.c
@@ -112,8 +112,8 @@ int brelse(struct gfs2_buffer_head *bh)
 	if (bh->b_modified)
 		error = bwrite(bh);
 	bh->b_blocknr = -1;
-	if (bh->b_altlist.next && !osi_list_empty(&bh->b_altlist))
-		osi_list_del(&bh->b_altlist);
+	if (bh->b_list.next && !list_empty(&bh->b_list))
+		list_del(&bh->b_list);
 	free(bh);
 	return error;
 }
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index 0acd59bf..dbddb493 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -1948,11 +1948,11 @@ int gfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
 	uint64_t *ptr, block;
 	struct rgrp_tree *rgd;
 	uint32_t height;
-	osi_list_t metalist[GFS2_MAX_META_HEIGHT];
-	osi_list_t *cur_list, *next_list, *tmp;
+	struct list_head metalist[GFS2_MAX_META_HEIGHT];
+	struct list_head *cur_list, *next_list, *tmp;
 
 	for (h = 0; h < GFS2_MAX_META_HEIGHT; h++)
-		osi_list_init(&metalist[h]);
+		INIT_LIST_HEAD(&metalist[h]);
 
 	bh = bread(sdp, diblock);
 	if (bh == NULL)
@@ -1961,7 +1961,7 @@ int gfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
 	if (ip == NULL)
 		return -1;
 	height = ip->i_di.di_height;
-	osi_list_add(&bh->b_altlist, &metalist[0]);
+	list_add(&bh->b_list, &metalist[0]);
 
 	for (h = 0; h < height; h++){
 		cur_list = &metalist[h];
@@ -1970,8 +1970,7 @@ int gfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
 			     sizeof(struct gfs2_dinode));
 
 		for (tmp = cur_list->next; tmp != cur_list; tmp = tmp->next){
-			bh = osi_list_entry(tmp, struct gfs2_buffer_head,
-					    b_altlist);
+			bh = list_entry(tmp, struct gfs2_buffer_head, b_list);
 
 			for (ptr = (uint64_t *)(bh->b_data + head_size);
 			     (char *)ptr < (bh->b_data + sdp->bsize); ptr++) {
@@ -1984,7 +1983,7 @@ int gfs2_freedi(struct gfs2_sbd *sdp, uint64_t diblock)
 					continue; /* don't queue it up */
 				/* Read the next metadata block in the chain */
 				nbh = bread(sdp, block);
-				osi_list_add(&nbh->b_altlist, next_list);
+				list_add(&nbh->b_list, next_list);
 				brelse(nbh);
 			}
 		}
diff --git a/gfs2/libgfs2/gfs1.c b/gfs2/libgfs2/gfs1.c
index b91cce5e..9bcab17b 100644
--- a/gfs2/libgfs2/gfs1.c
+++ b/gfs2/libgfs2/gfs1.c
@@ -13,7 +13,6 @@
 #include <linux/types.h>
 #include <linux/gfs2_ondisk.h>
 
-#include "osi_list.h"
 #include "libgfs2.h"
 
 /* GFS1 compatibility functions - so that programs like gfs2_convert
diff --git a/gfs2/libgfs2/lang.h b/gfs2/libgfs2/lang.h
index 7d9a6e98..c8845973 100644
--- a/gfs2/libgfs2/lang.h
+++ b/gfs2/libgfs2/lang.h
@@ -1,6 +1,7 @@
 #ifndef LANG_H
 #define LANG_H
 #include <stdint.h>
+#undef LIST_HEAD
 #include "libgfs2.h"
 
 struct lgfs2_lang_state {
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index fc0afed0..1c82ebe3 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -15,7 +15,7 @@
 #include <mntent.h>
 
 #include <linux/gfs2_ondisk.h>
-#include "osi_list.h"
+#include <list.h>
 #include "osi_tree.h"
 
 __BEGIN_DECLS
@@ -217,7 +217,7 @@ extern lgfs2_rgrp_t lgfs2_rgrp_prev(lgfs2_rgrp_t rg);
 extern struct osi_node *lgfs2_rgrps_root(lgfs2_rgrps_t rgs) __attribute__((deprecated));
 
 struct gfs2_buffer_head {
-	osi_list_t b_altlist; /* alternate list */
+	struct list_head b_list;
 	uint64_t b_blocknr;
 	union {
 		char *b_data;
@@ -228,7 +228,7 @@ struct gfs2_buffer_head {
 };
 
 struct special_blocks {
-	osi_list_t list;
+	struct list_head list;
 	uint64_t block;
 };
 
diff --git a/gfs2/libgfs2/super.c b/gfs2/libgfs2/super.c
index 6fe29add..97f82f07 100644
--- a/gfs2/libgfs2/super.c
+++ b/gfs2/libgfs2/super.c
@@ -10,7 +10,6 @@
 #include <fcntl.h>
 
 #include "libgfs2.h"
-#include "osi_list.h"
 
 /**
  * check_sb - Check superblock
diff --git a/gfs2/mkfs/gfs2_mkfs.h b/gfs2/mkfs/gfs2_mkfs.h
index 75f70e6a..b9ec7acd 100644
--- a/gfs2/mkfs/gfs2_mkfs.h
+++ b/gfs2/mkfs/gfs2_mkfs.h
@@ -3,7 +3,6 @@
 
 #include <stdarg.h>
 #include <linux/gfs2_ondisk.h>
-#include "osi_list.h"
 #include "copyright.cf"
 
 /* die() used to be in libgfs2.h */
-- 
2.21.0

