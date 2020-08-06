Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5066723DAE6
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:39:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721139;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W0V8cC9gHsY461fGBMga/39Ap513E7jlDGmTixCxsCY=;
	b=K3gV9hjRrPi3g7k9c0Vj4d/0xN3poYiesGj2sXavmCyJIom4OSH07ZySC0o9C9h8SVStYS
	B19Rc25k+GEdOaGF1FuQsd88O2bgCrworrEgdb+gfIw18A/ezbRO5yK1ghINC1m/z0Nbq7
	AA60sMs3ViOgl/N5r/15RicODfEpIps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-KheqoZ3WNUSmJpv7z0Wm2w-1; Thu, 06 Aug 2020 09:38:56 -0400
X-MC-Unique: KheqoZ3WNUSmJpv7z0Wm2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 552258017FB;
	Thu,  6 Aug 2020 13:38:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40E821A7D0;
	Thu,  6 Aug 2020 13:38:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D1511809554;
	Thu,  6 Aug 2020 13:38:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcqjH030967 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1951760BF1; Thu,  6 Aug 2020 13:38:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65A7E70110
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:51 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:59 +0100
Message-Id: <20200806133807.111280-25-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 24/32] savemeta: Call get_struct_info() in
	the read path
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Makes no sense to figure out the block type and length in save_buf(),
it's too late to do much with it at that point. Move the
get_gfs_struct_info() call and other checks into check_read_block().
Which means save_buf() can now be merged with do_save_buf().

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 89 +++++++++++++++++++++++---------------------
 1 file changed, 47 insertions(+), 42 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index cbead772..0de7dbf9 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -335,7 +335,9 @@ static int get_gfs_struct_info(const char *buf, uint64_t owner, int *block_type,
 
 	if (block_type != NULL)
 		*block_type = 0;
-	*gstruct_len = sbd.bsize;
+
+	if (gstruct_len != NULL)
+		*gstruct_len = sbd.bsize;
 
 	gfs2_meta_header_in(&mh, buf);
 	if (mh.mh_magic != GFS2_MAGIC)
@@ -344,6 +346,9 @@ static int get_gfs_struct_info(const char *buf, uint64_t owner, int *block_type,
 	if (block_type != NULL)
 		*block_type = mh.mh_type;
 
+	if (gstruct_len == NULL)
+		return 0;
+
 	switch (mh.mh_type) {
 	case GFS2_METATYPE_SB:   /* 1 (superblock) */
 		*gstruct_len = sizeof(struct gfs_sb);
@@ -522,7 +527,7 @@ static int savemetaclose(struct metafd *mfd)
 	return close(mfd->fd);
 }
 
-static int do_save_buf(struct metafd *mfd, const char *buf, uint64_t addr, unsigned blklen)
+static int save_buf(struct metafd *mfd, const char *buf, uint64_t addr, unsigned blklen)
 {
 	struct saved_metablock *savedata;
 	size_t outsz;
@@ -554,23 +559,7 @@ static int do_save_buf(struct metafd *mfd, const char *buf, uint64_t addr, unsig
 	return 0;
 }
 
-static int save_buf(struct metafd *mfd, const char *buf, uint64_t addr, uint64_t owner, int *blktype)
-{
-	size_t blklen;
-
-	/* If this isn't metadata and isn't a system file, we don't want it.
-	   Note that we're checking "owner" here rather than blk.  That's
-	   because we want to know if the source inode is a system inode
-	   not the block within the inode "blk". They may or may not
-	   be the same thing. */
-	if (get_gfs_struct_info(buf, owner, blktype, &blklen) &&
-	    !block_is_systemfile(owner) && owner != 0)
-		return 0; /* Not metadata, and not system file, so skip it */
-
-	return do_save_buf(mfd, buf, addr, blklen);
-}
-
-static char *check_read_block(int fd, uint64_t blk)
+static char *check_read_block(int fd, uint64_t blk, uint64_t owner, int *blktype, size_t *blklen)
 {
 	char *buf = calloc(1, sbd.bsize);
 	if (buf == NULL) {
@@ -588,6 +577,11 @@ static char *check_read_block(int fd, uint64_t blk)
 		free(buf);
 		return NULL;
 	}
+	if (get_gfs_struct_info(buf, owner, blktype, blklen) &&
+	    !block_is_systemfile(owner) && owner != 0) {
+		free(buf);
+		return NULL;
+	}
 	return buf;
 }
 
@@ -614,9 +608,9 @@ static void save_ea_block(struct metafd *mfd, char *buf, uint64_t owner)
 			b = (uint64_t *)buf;
 			b += charoff + i;
 			blk = be64_to_cpu(*b);
-			_buf = check_read_block(sbd.device_fd, blk);
+			_buf = check_read_block(sbd.device_fd, blk, owner, NULL, NULL);
 			if (_buf != NULL) {
-				save_buf(mfd, _buf, blk, owner, NULL);
+				save_buf(mfd, _buf, blk, sbd.bsize);
 				free(_buf);
 			}
 		}
@@ -633,7 +627,7 @@ static void save_indirect_blocks(struct metafd *mfd, osi_list_t *cur_list,
 {
 	uint64_t old_block = 0, indir_block;
 	uint64_t *ptr;
-	int head_size, blktype;
+	int head_size;
 	struct gfs2_buffer_head *nbh;
 
 	head_size = (hgt > 1 ?
@@ -642,6 +636,8 @@ static void save_indirect_blocks(struct metafd *mfd, osi_list_t *cur_list,
 
 	for (ptr = (uint64_t *)(mybh->b_data + head_size);
 	     (char *)ptr < (mybh->b_data + sbd.bsize); ptr++) {
+		size_t blklen;
+		int blktype;
 		char *buf;
 
 		if (!*ptr)
@@ -651,9 +647,9 @@ static void save_indirect_blocks(struct metafd *mfd, osi_list_t *cur_list,
 			continue;
 		old_block = indir_block;
 
-		buf = check_read_block(sbd.device_fd, indir_block);
+		buf = check_read_block(sbd.device_fd, indir_block, owner, &blktype, &blklen);
 		if (buf != NULL) {
-			save_buf(mfd, buf, indir_block, owner, &blktype);
+			save_buf(mfd, buf, indir_block, blklen);
 			free(buf);
 		}
 
@@ -698,7 +694,7 @@ static int save_leaf_chain(struct metafd *mfd, struct gfs2_sbd *sdp, uint64_t bl
 		}
 		warm_fuzzy_stuff(blk, FALSE);
 		if (gfs2_check_meta(buf, GFS2_METATYPE_LF) == 0) {
-			int ret = save_buf(mfd, buf, blk, blk, NULL);
+			int ret = save_buf(mfd, buf, blk, sdp->bsize);
 			if (ret != 0) {
 				free(buf);
 				return ret;
@@ -806,13 +802,16 @@ static void save_inode_data(struct metafd *mfd, uint64_t iblk)
 	}
 	if (inode->i_di.di_eattr) { /* if this inode has extended attributes */
 		struct gfs2_buffer_head *lbh;
+		size_t blklen;
+		uint64_t blk;
 		int mhtype;
 		char *buf;
 
-		lbh = bread(&sbd, inode->i_di.di_eattr);
-		buf = check_read_block(sbd.device_fd, inode->i_di.di_eattr);
+		blk = inode->i_di.di_eattr;
+		lbh = bread(&sbd, blk);
+		buf = check_read_block(sbd.device_fd, blk, iblk, &mhtype, &blklen);
 		if (buf != NULL) {
-			save_buf(mfd, buf, inode->i_di.di_eattr, iblk, &mhtype);
+			save_buf(mfd, buf, blk, blklen);
 			free(buf);
 		}
 		if (mhtype == GFS2_METATYPE_EA)
@@ -875,12 +874,14 @@ static void get_journal_inode_blocks(void)
 
 static void save_allocated(struct rgrp_tree *rgd, struct metafd *mfd)
 {
-	int blktype;
 	uint64_t blk = 0;
 	unsigned i, j, m;
 	uint64_t *ibuf = malloc(sbd.bsize * GFS2_NBBY * sizeof(uint64_t));
 
 	for (i = 0; i < rgd->ri.ri_length; i++) {
+		size_t blen;
+		int btype;
+
 		m = lgfs2_bm_scan(rgd, i, ibuf, GFS2_BLKST_DINODE);
 
 		for (j = 0; j < m; j++) {
@@ -888,13 +889,13 @@ static void save_allocated(struct rgrp_tree *rgd, struct metafd *mfd)
 
 			blk = ibuf[j];
 			warm_fuzzy_stuff(blk, FALSE);
-			buf = check_read_block(sbd.device_fd, blk);
+			buf = check_read_block(sbd.device_fd, blk, blk, &btype, &blen);
 			if (buf != NULL) {
-				save_buf(mfd, buf, blk, blk, &blktype);
+				save_buf(mfd, buf, blk, blen);
 				free(buf);
+				if (btype == GFS2_METATYPE_DI)
+					save_inode_data(mfd, blk);
 			}
-			if (blktype == GFS2_METATYPE_DI)
-				save_inode_data(mfd, blk);
 		}
 		if (!sbd.gfs1)
 			continue;
@@ -903,9 +904,9 @@ static void save_allocated(struct rgrp_tree *rgd, struct metafd *mfd)
 		 * If we don't, we may run into metadata allocation issues. */
 		m = lgfs2_bm_scan(rgd, i, ibuf, GFS2_BLKST_UNLINKED);
 		for (j = 0; j < m; j++) {
-			char *buf = check_read_block(sbd.device_fd, blk);
+			char *buf = check_read_block(sbd.device_fd, blk, blk, &btype, &blen);
 			if (buf != NULL) {
-				save_buf(mfd, buf, blk, blk, &blktype);
+				save_buf(mfd, buf, blk, blen);
 				free(buf);
 			}
 		}
@@ -954,7 +955,7 @@ static void save_rgrp(struct gfs2_sbd *sdp, struct metafd *mfd, struct rgrp_tree
 	/* Save the rg and bitmaps */
 	for (unsigned i = 0; i < rgd->ri.ri_length; i++) {
 		warm_fuzzy_stuff(rgd->ri.ri_addr + i, FALSE);
-		do_save_buf(mfd, buf + (i * sdp->bsize), rgd->ri.ri_addr + i, sdp->bsize);
+		save_buf(mfd, buf + (i * sdp->bsize), rgd->ri.ri_addr + i, sdp->bsize);
 	}
 	/* Save the other metadata: inodes, etc. if mode is not 'savergs' */
 	if (withcontents)
@@ -1006,6 +1007,7 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 	struct gfs2_buffer_head *lbh;
 	struct metafd mfd;
 	struct osi_node *n;
+	uint64_t sb_addr;
 	int err = 0;
 	char *buf;
 
@@ -1042,9 +1044,10 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 		exit(1);
 	}
 	/* Save off the superblock */
-	buf = check_read_block(sbd.device_fd, GFS2_SB_ADDR * GFS2_BASIC_BLOCK / sbd.bsize);
+	sb_addr = GFS2_SB_ADDR * GFS2_BASIC_BLOCK / sbd.bsize;
+	buf = check_read_block(sbd.device_fd, sb_addr, 0, NULL, NULL);
 	if (buf != NULL) {
-		save_buf(&mfd, buf, GFS2_SB_ADDR * GFS2_BASIC_BLOCK / sbd.bsize, 0, NULL);
+		save_buf(&mfd, buf, sb_addr, sizeof(struct gfs_sb));
 		free(buf);
 	}
 	/* If this is gfs1, save off the rindex because it's not
@@ -1054,9 +1057,9 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 		int j;
 
 		blk = sbd1->sb_rindex_di.no_addr;
-		buf = check_read_block(sbd.device_fd, blk);
+		buf = check_read_block(sbd.device_fd, blk, blk, NULL, NULL);
 		if (buf != NULL) {
-			save_buf(&mfd, buf, blk, blk, NULL);
+			save_buf(&mfd, buf, blk, sbd.bsize);
 			free(buf);
 		}
 		save_inode_data(&mfd, blk);
@@ -1066,9 +1069,11 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 
 			log_debug("Saving journal #%d\n", j + 1);
 			for (blk = jb; blk < (jb + gfs1_journal_size); blk++) {
-				buf = check_read_block(sbd.device_fd, blk);
+				size_t blen;
+
+				buf = check_read_block(sbd.device_fd, blk, blk, NULL, &blen);
 				if (buf != NULL) {
-					save_buf(&mfd, buf, blk, blk, NULL);
+					save_buf(&mfd, buf, blk, blen);
 					free(buf);
 				}
 			}
-- 
2.26.2

