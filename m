Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DFA4938C6
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:44:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589078;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4uImT4i8HYMCUpLWRFKbMRyepqUexi5Td7g05A/8IUs=;
	b=cfepnyTo1PmEcfejQ8c17wOfH1MP7d9cNxPMePj4+8s5q4APKQg9oI3mEBIQLcDcA8WHFK
	GRcIiY7qFoQ6PuGiMDLfnuoYANmqKZekVwFF+Olwd4uezbTVhnGncD1oP/Kc3VmhLmTLud
	k/4fM43SYWFqLJCfIvlChtz36V3CgH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-UN4vKkvdMUi0qJrDBWgE7A-1; Wed, 19 Jan 2022 05:44:35 -0500
X-MC-Unique: UN4vKkvdMUi0qJrDBWgE7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBFDD83DD2B;
	Wed, 19 Jan 2022 10:44:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC5A3105914F;
	Wed, 19 Jan 2022 10:44:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B99FD4A700;
	Wed, 19 Jan 2022 10:44:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAiVW1024552 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:44:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2C59578B18; Wed, 19 Jan 2022 10:44:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75F5278B10
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:44:30 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:11 +0000
Message-Id: <20220119104316.2489995-17-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 16/21] libgfs2: Namespace improvements -
	struct metapath
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

Rename to struct lgfs2_metapath.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/convert/gfs2_convert.c | 14 +++++++-------
 gfs2/edit/extended.c        |  4 ++--
 gfs2/edit/hexedit.c         |  4 ++--
 gfs2/edit/hexedit.h         |  4 ++--
 gfs2/libgfs2/fs_ops.c       | 12 ++++++------
 gfs2/libgfs2/gfs1.c         |  6 +++---
 gfs2/libgfs2/libgfs2.h      |  8 ++++----
 7 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/gfs2/convert/gfs2_convert.c b/gfs2/convert/gfs2_convert.c
index e1c6a3c6..f6c7d3a7 100644
--- a/gfs2/convert/gfs2_convert.c
+++ b/gfs2/convert/gfs2_convert.c
@@ -82,7 +82,7 @@ struct inode_block {
 struct blocklist {
 	osi_list_t list;
 	uint64_t block;
-	struct metapath mp;
+	struct lgfs2_metapath mp;
 	int height;
 	char *ptrbuf;
 };
@@ -219,7 +219,7 @@ static unsigned int calc_gfs2_tree_height(struct lgfs2_inode *ip, uint64_t size)
 /* mp_gfs1_to_gfs2 - convert a gfs1 metapath to a gfs2 metapath.             */
 /* ------------------------------------------------------------------------- */
 static void mp_gfs1_to_gfs2(struct lgfs2_sbd *sbp, int gfs1_h, int gfs2_h,
-		     struct metapath *gfs1mp, struct metapath *gfs2mp)
+		     struct lgfs2_metapath *gfs1mp, struct lgfs2_metapath *gfs2mp)
 {
 	uint64_t lblock;
 	int h;
@@ -378,7 +378,7 @@ static void fix_metatree(struct lgfs2_sbd *sbp, struct lgfs2_inode *ip,
 /* ------------------------------------------------------------------------- */
 
 static void jdata_mp_gfs1_to_gfs2(struct lgfs2_sbd *sbp, int gfs1_h, int gfs2_h,
-			   struct metapath *gfs1mp, struct metapath *gfs2mp,
+			   struct lgfs2_metapath *gfs1mp, struct lgfs2_metapath *gfs2mp,
 			   unsigned int *len, uint64_t dinode_size)
 {
 	uint64_t offset;
@@ -575,7 +575,7 @@ static int fix_ind_reg_or_dir(struct lgfs2_sbd *sbp, struct lgfs2_inode *ip, uin
 	unsigned int len, bufsize;
 	__be64 *ptr1, *ptr2;
 	int ptrnum;
-	struct metapath gfs2mp;
+	struct lgfs2_metapath gfs2mp;
 
 	bufsize = sbp->sd_bsize - sizeof(struct gfs_indirect);
 	len = bufsize;
@@ -601,7 +601,7 @@ static int fix_ind_reg_or_dir(struct lgfs2_sbd *sbp, struct lgfs2_inode *ip, uin
 	}
 	blk->mp.mp_list[di_height - 1] = ptrnum;
 	mp_gfs1_to_gfs2(sbp, di_height, gfs2_hgt, &blk->mp, &gfs2mp);
-	memcpy(&blk->mp, &gfs2mp, sizeof(struct metapath));
+	memcpy(&blk->mp, &gfs2mp, sizeof(struct lgfs2_metapath));
 	blk->height -= di_height - gfs2_hgt;
 	if (len) {
 		fix_metatree(sbp, ip, blk, ptr1, len);
@@ -621,7 +621,7 @@ static int fix_ind_jdata(struct lgfs2_sbd *sbp, struct lgfs2_inode *ip, uint32_t
 	uint64_t block;
 	__be64 *ptr1;
 	int ptrnum, h;
-	struct metapath gfs2mp;
+	struct lgfs2_metapath gfs2mp;
 	struct lgfs2_buffer_head *bh;
 
 	bufsize = sbp->sd_bsize - sizeof(struct gfs2_meta_header);
@@ -670,7 +670,7 @@ static int fix_ind_jdata(struct lgfs2_sbd *sbp, struct lgfs2_inode *ip, uint32_t
 		len = bufsize;
 		jdata_mp_gfs1_to_gfs2(sbp, di_height, gfs2_hgt, &newblk->mp, &gfs2mp,
 				      &len, dinode_size);
-		memcpy(&newblk->mp, &gfs2mp, sizeof(struct metapath));
+		memcpy(&newblk->mp, &gfs2mp, sizeof(struct lgfs2_metapath));
 		newblk->height -= di_height - gfs2_hgt;
 		if (len)
 			ip->i_goal_meta = fix_jdatatree(sbp, ip, newblk,
diff --git a/gfs2/edit/extended.c b/gfs2/edit/extended.c
index 98c0dfce..81548939 100644
--- a/gfs2/edit/extended.c
+++ b/gfs2/edit/extended.c
@@ -97,7 +97,7 @@ static int dinode_valid(void)
 	return 0;
 }
 
-static uint64_t metapath_to_lblock(struct metapath *mp, int hgt)
+static uint64_t metapath_to_lblock(struct lgfs2_metapath *mp, int hgt)
 {
 	int h;
 	uint64_t lblock = 0;
@@ -401,7 +401,7 @@ static void print_block_details(struct iinfo *ind, int level, int cur_height,
 			for (x = 0; x < 512; x++) {
 				memcpy(&more_indir->ii[x].mp,
 				       &ind->ii[pndx].mp,
-				       sizeof(struct metapath));
+				       sizeof(struct lgfs2_metapath));
 				more_indir->ii[x].mp.mp_list[cur_height+1] = x;
 			}
 			more_ind = _do_indirect_extended(tmpbuf, more_indir,
diff --git a/gfs2/edit/hexedit.c b/gfs2/edit/hexedit.c
index 4eb1a839..17ed5062 100644
--- a/gfs2/edit/hexedit.c
+++ b/gfs2/edit/hexedit.c
@@ -1032,7 +1032,7 @@ int display(int identify_only, int trunc_zeros, uint64_t flagref,
 			for (i = 0; i < 512; i++)
 				memcpy(&indirect->ii[i].mp,
 				       &blockstack[blockhist - 1].mp,
-				       sizeof(struct metapath));
+				       sizeof(struct lgfs2_metapath));
 		}
 		indirect_blocks = do_indirect_extended(bh->b_data, indirect);
 	}
@@ -1091,7 +1091,7 @@ static void push_block(uint64_t blk)
 		if (edit_row[dmode] >= 0 && !block_is_rindex(block))
 			memcpy(&blockstack[bhst].mp,
 			       &indirect->ii[edit_row[dmode]].mp,
-			       sizeof(struct metapath));
+			       sizeof(struct lgfs2_metapath));
 		blockhist++;
 		blockstack[blockhist % BLOCK_STACK_SIZE].block = blk;
 	}
diff --git a/gfs2/edit/hexedit.h b/gfs2/edit/hexedit.h
index d45fae2b..6b7e66e1 100644
--- a/gfs2/edit/hexedit.h
+++ b/gfs2/edit/hexedit.h
@@ -78,7 +78,7 @@ struct indirect_info {
 	uint64_t block;
 	uint32_t dirents;
 	struct gfs2_leaf lf;
-	struct metapath mp;
+	struct lgfs2_metapath mp;
 	struct idirent dirent[64];
 	uint64_t ptroff;
 };
@@ -96,7 +96,7 @@ struct blkstack_info {
 	int edit_col[DMODES];
 	enum dsp_mode dmode;
 	int gfs2_struct_type;
-	struct metapath mp;
+	struct lgfs2_metapath mp;
 };
 
 extern struct blkstack_info blockstack[BLOCK_STACK_SIZE];
diff --git a/gfs2/libgfs2/fs_ops.c b/gfs2/libgfs2/fs_ops.c
index f485860a..0f94c09b 100644
--- a/gfs2/libgfs2/fs_ops.c
+++ b/gfs2/libgfs2/fs_ops.c
@@ -16,7 +16,7 @@
 
 static __inline__ __be64 *metapointer(char *buf,
 					unsigned int height,
-					struct metapath *mp)
+					struct lgfs2_metapath *mp)
 {
 	unsigned int head_size = (height > 0) ?
 		sizeof(struct gfs2_meta_header) : sizeof(struct gfs2_dinode);
@@ -423,12 +423,12 @@ void lgfs2_build_height(struct lgfs2_inode *ip, int height)
 	}
 }
 
-void lgfs2_find_metapath(struct lgfs2_inode *ip, uint64_t block, struct metapath *mp)
+void lgfs2_find_metapath(struct lgfs2_inode *ip, uint64_t block, struct lgfs2_metapath *mp)
 {
 	const uint32_t inptrs = ip->i_sbd->sd_inptrs;
 	unsigned int i = ip->i_height;
 
-	memset(mp, 0, sizeof(struct metapath));
+	memset(mp, 0, sizeof(struct lgfs2_metapath));
 	while (i--) {
 		mp->mp_list[i] = block % inptrs;
 		block /= inptrs;
@@ -436,7 +436,7 @@ void lgfs2_find_metapath(struct lgfs2_inode *ip, uint64_t block, struct metapath
 }
 
 void lgfs2_lookup_block(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
-                        unsigned int height, struct metapath *mp,
+                        unsigned int height, struct lgfs2_metapath *mp,
                         int create, int *new, uint64_t *block)
 {
 	__be64 *ptr = metapointer(bh->b_data, height, mp);
@@ -466,7 +466,7 @@ void lgfs2_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *new,
 {
 	struct lgfs2_sbd *sdp = ip->i_sbd;
 	struct lgfs2_buffer_head *bh;
-	struct metapath mp;
+	struct lgfs2_metapath mp;
 	int create = *new;
 	unsigned int bsize;
 	unsigned int height;
@@ -1437,7 +1437,7 @@ static void lgfs2_fill_indir(char *start, char *end, uint64_t ptr0, unsigned n,
 int lgfs2_write_filemeta(struct lgfs2_inode *ip)
 {
 	unsigned height = 0;
-	struct metapath mp;
+	struct lgfs2_metapath mp;
 	struct lgfs2_sbd *sdp = ip->i_sbd;
 	uint64_t dblocks = (ip->i_size + sdp->sd_bsize - 1) / sdp->sd_bsize;
 	uint64_t ptr0 = ip->i_num.in_addr + 1;
diff --git a/gfs2/libgfs2/gfs1.c b/gfs2/libgfs2/gfs1.c
index 0079021b..c6ad8dbe 100644
--- a/gfs2/libgfs2/gfs1.c
+++ b/gfs2/libgfs2/gfs1.c
@@ -23,7 +23,7 @@ static __inline__ int fs_is_jdata(struct lgfs2_inode *ip)
 }
 
 static __inline__ __be64 *
-gfs1_metapointer(char *buf, unsigned int height, struct metapath *mp)
+gfs1_metapointer(char *buf, unsigned int height, struct lgfs2_metapath *mp)
 {
 	unsigned int head_size = (height > 0) ?
 		sizeof(struct gfs_indirect) : sizeof(struct gfs_dinode);
@@ -39,7 +39,7 @@ int lgfs2_is_gfs_dir(struct lgfs2_inode *ip)
 }
 
 void lgfs2_gfs1_lookup_block(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
-		  unsigned int height, struct metapath *mp,
+		  unsigned int height, struct lgfs2_metapath *mp,
 		  int create, int *new, uint64_t *block)
 {
 	__be64 *ptr = gfs1_metapointer(bh->b_data, height, mp);
@@ -72,7 +72,7 @@ void lgfs2_gfs1_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *new,
 {
 	struct lgfs2_sbd *sdp = ip->i_sbd;
 	struct lgfs2_buffer_head *bh;
-	struct metapath mp;
+	struct lgfs2_metapath mp;
 	int create = *new;
 	unsigned int bsize;
 	unsigned int height;
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 98e8b8ce..00deb455 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -412,7 +412,7 @@ struct lgfs2_leaf {
 	uint64_t lf_sec;
 };
 
-struct metapath {
+struct lgfs2_metapath {
 	unsigned int mp_list[GFS2_MAX_META_HEIGHT];
 };
 
@@ -494,9 +494,9 @@ extern int lgfs2_set_bitmap(lgfs2_rgrp_t rg, uint64_t blkno, int state);
 #define IS_LEAF     (1)
 #define IS_DINODE   (2)
 
-extern void lgfs2_find_metapath(struct lgfs2_inode *ip, uint64_t block, struct metapath *mp);
+extern void lgfs2_find_metapath(struct lgfs2_inode *ip, uint64_t block, struct lgfs2_metapath *mp);
 extern void lgfs2_lookup_block(struct lgfs2_inode *ip, struct lgfs2_buffer_head *bh,
-			 unsigned int height, struct metapath *mp,
+			 unsigned int height, struct lgfs2_metapath *mp,
 			 int create, int *new, uint64_t *block);
 extern struct lgfs2_inode *lgfs2_inode_get(struct lgfs2_sbd *sdp,
 				    struct lgfs2_buffer_head *bh);
@@ -710,7 +710,7 @@ struct gfs_log_descriptor {
 extern int lgfs2_is_gfs_dir(struct lgfs2_inode *ip);
 extern void lgfs2_gfs1_lookup_block(struct lgfs2_inode *ip,
 			      struct lgfs2_buffer_head *bh,
-			      unsigned int height, struct metapath *mp,
+			      unsigned int height, struct lgfs2_metapath *mp,
 			      int create, int *new, uint64_t *block);
 extern void lgfs2_gfs1_block_map(struct lgfs2_inode *ip, uint64_t lblock, int *new,
 			   uint64_t *dblock, uint32_t *extlen, int prealloc);
-- 
2.34.1

