Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 13D151CDD6E
	for <lists+cluster-devel@lfdr.de>; Mon, 11 May 2020 16:41:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589208105;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dW0r5Mvw0bNFpoeO3O86kRhXZZMghEfGDuKKp+X0UkE=;
	b=YIYZfUZ9f4VDIqKom9oedzlDq3q4v0nCpZ2WpMt6CJHAp8pxkwPGKH84KWpYj5Ev+Yn+QV
	shEd+mFG8OCKI1b1dQR9muwvGQaF74rX0Z+Ba4UCyy46bEzBHse7NmSmb1hcrpXrA+T5nH
	oaAHJMOj3DxGIH5QCHHjP8T+2y7tsQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-o9jaLJNUOCqSDIbMu66wug-1; Mon, 11 May 2020 10:41:43 -0400
X-MC-Unique: o9jaLJNUOCqSDIbMu66wug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBD6A1054F9B;
	Mon, 11 May 2020 14:41:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C994325277;
	Mon, 11 May 2020 14:41:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3C741809543;
	Mon, 11 May 2020 14:41:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BEfcim005607 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 10:41:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DB2EF60BF4; Mon, 11 May 2020 14:41:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.212])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC5A760CD1
	for <cluster-devel@redhat.com>; Mon, 11 May 2020 14:41:36 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 11 May 2020 15:41:23 +0100
Message-Id: <20200511144125.350891-4-anprice@redhat.com>
In-Reply-To: <20200511144125.350891-1-anprice@redhat.com>
References: <20200511144125.350891-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 3/5] savemeta: Save rgrps without using
	gfs2_buffer_heads
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Separate the block saving code from save_bh out into save_buf so that
the resource groups can be dumped without using a temporary
gfs2_buffer_head. The rgrp saving code has also been tidied up.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 123 +++++++++++++++++++++----------------------
 1 file changed, 61 insertions(+), 62 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 11c83553..f8f3312c 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -527,23 +527,13 @@ static int savemetaclose(struct metafd *mfd)
 	return close(mfd->fd);
 }
 
-static int save_bh(struct metafd *mfd, struct gfs2_buffer_head *savebh, uint64_t owner, int *blktype)
+static int save_buf(struct metafd *mfd, char *buf, uint64_t addr, unsigned blklen)
 {
 	struct saved_metablock *savedata;
-	size_t blklen;
 	size_t outsz;
 
-	/* If this isn't metadata and isn't a system file, we don't want it.
-	   Note that we're checking "owner" here rather than blk.  That's
-	   because we want to know if the source inode is a system inode
-	   not the block within the inode "blk". They may or may not
-	   be the same thing. */
-	if (get_gfs_struct_info(savebh, owner, blktype, &blklen) &&
-	    !block_is_systemfile(owner) && owner != 0)
-		return 0; /* Not metadata, and not system file, so skip it */
-
 	/* No need to save trailing zeroes */
-	for (; blklen > 0 && savebh->b_data[blklen - 1] == '\0'; blklen--);
+	for (; blklen > 0 && buf[blklen - 1] == '\0'; blklen--);
 
 	if (blklen == 0) /* No significant data; skip. */
 		return 0;
@@ -554,34 +544,45 @@ static int save_bh(struct metafd *mfd, struct gfs2_buffer_head *savebh, uint64_t
 		perror("Failed to save block");
 		exit(1);
 	}
-	savedata->blk = cpu_to_be64(savebh->b_blocknr);
+	savedata->blk = cpu_to_be64(addr);
 	savedata->siglen = cpu_to_be16(blklen);
-	memcpy(savedata + 1, savebh->b_data, blklen);
+	memcpy(savedata + 1, buf, blklen);
 
 	if (savemetawrite(mfd, savedata, outsz) != outsz) {
-		fprintf(stderr, "write error: %s from %s:%d: block %lld (0x%llx)\n",
-		        strerror(errno), __FUNCTION__, __LINE__,
-			(unsigned long long)savedata->blk,
-			(unsigned long long)savedata->blk);
+		fprintf(stderr, "write error: %s from %s:%d: block %"PRIu64"\n",
+		        strerror(errno), __FUNCTION__, __LINE__, addr);
 		free(savedata);
 		exit(-1);
 	}
-
 	blks_saved++;
 	free(savedata);
 	return 0;
 }
 
+static int save_bh(struct metafd *mfd, struct gfs2_buffer_head *savebh, uint64_t owner, int *blktype)
+{
+	size_t blklen;
+
+	/* If this isn't metadata and isn't a system file, we don't want it.
+	   Note that we're checking "owner" here rather than blk.  That's
+	   because we want to know if the source inode is a system inode
+	   not the block within the inode "blk". They may or may not
+	   be the same thing. */
+	if (get_gfs_struct_info(savebh, owner, blktype, &blklen) &&
+	    !block_is_systemfile(owner) && owner != 0)
+		return 0; /* Not metadata, and not system file, so skip it */
+
+	return save_buf(mfd, savebh->b_data, savebh->b_blocknr, blklen);
+}
+
 static int save_block(int fd, struct metafd *mfd, uint64_t blk, uint64_t owner, int *blktype)
 {
 	struct gfs2_buffer_head *savebh;
 	int err;
 
 	if (gfs2_check_range(&sbd, blk) && blk != LGFS2_SB_ADDR(&sbd)) {
-		fprintf(stderr, "\nWarning: bad block pointer '0x%llx' "
-			"ignored in block (block %llu (0x%llx))",
-			(unsigned long long)blk,
-			(unsigned long long)owner, (unsigned long long)owner);
+		fprintf(stderr, "Warning: bad pointer 0x%"PRIx64" ignored in block 0x%"PRIx64"\n",
+		        blk, owner);
 		return 0;
 	}
 	savebh = bread(&sbd, blk);
@@ -595,7 +596,7 @@ static int save_block(int fd, struct metafd *mfd, uint64_t blk, uint64_t owner,
 /*
  * save_ea_block - save off an extended attribute block
  */
-static void save_ea_block(struct metafd *mfd, struct gfs2_buffer_head *metabh, uint64_t owner)
+static void save_ea_block(struct metafd *mfd, char *buf, uint64_t owner)
 {
 	int e;
 	struct gfs2_ea_header ea;
@@ -604,13 +605,13 @@ static void save_ea_block(struct metafd *mfd, struct gfs2_buffer_head *metabh, u
 		uint64_t blk, *b;
 		int charoff, i;
 
-		gfs2_ea_header_in(&ea, metabh->b_data + e);
+		gfs2_ea_header_in(&ea, buf + e);
 		for (i = 0; i < ea.ea_num_ptrs; i++) {
 			charoff = e + ea.ea_name_len +
 				sizeof(struct gfs2_ea_header) +
 				sizeof(uint64_t) - 1;
 			charoff /= sizeof(uint64_t);
-			b = (uint64_t *)(metabh->b_data);
+			b = (uint64_t *)buf;
 			b += charoff + i;
 			blk = be64_to_cpu(*b);
 			save_block(sbd.device_fd, mfd, blk, owner, NULL);
@@ -646,7 +647,7 @@ static void save_indirect_blocks(struct metafd *mfd, osi_list_t *cur_list,
 		save_block(sbd.device_fd, mfd, indir_block, owner, &blktype);
 		if (blktype == GFS2_METATYPE_EA) {
 			nbh = bread(&sbd, indir_block);
-			save_ea_block(mfd, nbh, owner);
+			save_ea_block(mfd, nbh->b_data, owner);
 			brelse(nbh);
 		}
 		if (height != hgt && /* If not at max height and */
@@ -790,7 +791,7 @@ static void save_inode_data(struct metafd *mfd, uint64_t iblk)
 		gfs2_meta_header_in(&mh, lbh->b_data);
 		if (mh.mh_magic == GFS2_MAGIC &&
 		    mh.mh_type == GFS2_METATYPE_EA)
-			save_ea_block(mfd, lbh, iblk);
+			save_ea_block(mfd, lbh->b_data, iblk);
 		else if (mh.mh_magic == GFS2_MAGIC &&
 			 mh.mh_type == GFS2_METATYPE_IN)
 			save_indirect_blocks(mfd, cur_list, lbh, iblk, 2, 2);
@@ -853,7 +854,7 @@ static void get_journal_inode_blocks(void)
 			jblock = ji.ji_addr;
 			gfs1_journal_size = (uint64_t)ji.ji_nsegment * 16;
 		} else {
-			if (journal > indirect->ii[0].dirents - 3)
+			if (journal + 3 > indirect->ii[0].dirents)
 				break;
 			jblock = indirect->ii[0].dirent[journal + 2].block;
 		}
@@ -878,7 +879,6 @@ static void save_allocated(struct rgrp_tree *rgd, struct metafd *mfd)
 			if (blktype == GFS2_METATYPE_DI)
 				save_inode_data(mfd, blk);
 		}
-
 		if (!sbd.gfs1)
 			continue;
 
@@ -892,57 +892,56 @@ static void save_allocated(struct rgrp_tree *rgd, struct metafd *mfd)
 	free(ibuf);
 }
 
-/* We don't use gfs2_rgrp_read() here as it checks for metadata sanity and we
-   want to save rgrp headers even if they're corrupt. */
-static int rgrp_read(struct gfs2_sbd *sdp, struct rgrp_tree *rgd)
+static char *rgrp_read(struct gfs2_sbd *sdp, uint64_t addr, unsigned blocks)
 {
-	unsigned length = rgd->ri.ri_length * sdp->bsize;
-	off_t off = rgd->ri.ri_addr * sdp->bsize;
+	size_t len = blocks * sdp->bsize;
+	off_t off = addr * sdp->bsize;
 	char *buf;
 
-	if (length == 0 || gfs2_check_range(sdp, rgd->ri.ri_addr))
-		return -1;
+	if (blocks == 0 || gfs2_check_range(sdp, addr))
+		return NULL;
 
-	buf = calloc(1, length);
+	buf = calloc(1, len);
 	if (buf == NULL)
-		return -1;
+		return NULL;
 
-	if (pread(sdp->device_fd, buf, length, off) != length) {
+	if (pread(sdp->device_fd, buf, len, off) != len) {
 		free(buf);
-		return -1;
+		return NULL;
 	}
-	for (unsigned i = 0; i < rgd->ri.ri_length; i++)
-		rgd->bits[i].bi_data = buf + (i * sdp->bsize);
-
-	if (sdp->gfs1)
-		gfs_rgrp_in((struct gfs_rgrp *)&rgd->rg, rgd->bits[0].bi_data);
-	else
-		gfs2_rgrp_in(&rgd->rg, rgd->bits[0].bi_data);
-	return 0;
+	return buf;
 }
 
-static void save_rgrp(struct metafd *mfd, struct rgrp_tree *rgd, int withcontents)
+static void save_rgrp(struct gfs2_sbd *sdp, struct metafd *mfd, struct rgrp_tree *rgd, int withcontents)
 {
 	uint64_t addr = rgd->ri.ri_addr;
-	uint32_t i;
+	char *buf;
 
-	if (rgrp_read(&sbd, rgd))
+	buf = rgrp_read(sdp, rgd->ri.ri_addr, rgd->ri.ri_length);
+	if (buf == NULL)
 		return;
-	log_debug("RG at %"PRIu64" (0x%"PRIx64") is %u long\n",
-		  addr, addr, rgd->ri.ri_length);
+
+	if (sdp->gfs1)
+		gfs_rgrp_in((struct gfs_rgrp *)&rgd->rg, buf);
+	else
+		gfs2_rgrp_in(&rgd->rg, buf);
+
+	for (unsigned i = 0; i < rgd->ri.ri_length; i++)
+		rgd->bits[i].bi_data = buf + (i * sdp->bsize);
+
+	log_debug("RG at %"PRIu64" is %"PRIu32" long\n", addr, (uint32_t)rgd->ri.ri_length);
 	/* Save the rg and bitmaps */
-	for (i = 0; i < rgd->ri.ri_length; i++) {
-		struct gfs2_buffer_head tmpbh = {
-			.b_data = rgd->bits[i].bi_data,
-			.b_blocknr = rgd->ri.ri_addr + i
-		};
+	for (unsigned i = 0; i < rgd->ri.ri_length; i++) {
 		warm_fuzzy_stuff(rgd->ri.ri_addr + i, FALSE);
-		save_bh(mfd, &tmpbh, 0, NULL);
+		save_buf(mfd, buf + (i * sdp->bsize), rgd->ri.ri_addr + i, sdp->bsize);
 	}
 	/* Save the other metadata: inodes, etc. if mode is not 'savergs' */
 	if (withcontents)
 		save_allocated(rgd, mfd);
-	gfs2_rgrp_relse(&sbd, rgd);
+
+	free(buf);
+	for (unsigned i = 0; i < rgd->ri.ri_length; i++)
+		rgd->bits[i].bi_data = NULL;
 }
 
 static int save_header(struct metafd *mfd, uint64_t fsbytes)
@@ -1042,7 +1041,7 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 		struct rgrp_tree *rgd;
 
 		rgd = (struct rgrp_tree *)n;
-		save_rgrp(&mfd, rgd, (saveoption != 2));
+		save_rgrp(&sbd, &mfd, rgd, (saveoption != 2));
 	}
 	/* Clean up */
 	/* There may be a gap between end of file system and end of device */
-- 
2.26.2

