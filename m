Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 735BF23DAE8
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:39:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721140;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o9ujhQ23cWDIVTPma1d4+Lm+1R4b35OvkO5yBaD8Ino=;
	b=QCk2WDoLIig3P4Dbqj23PcKchW/TaZZYdlt18lpV7TS04MI+scSNyh20fUKLB3gzijiqFz
	lV8+gc2ikR0XV+0GlYVfrfFdmgqWDpreC+bP3qkRX1B0lw5NMd/VIRJWrxdaZN+Zb1aTyX
	pB1gOBvmAnSyestgpmo9e/SAd9ACWGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-zB1j6BmdP-66hEwoAoTf6w-1; Thu, 06 Aug 2020 09:38:58 -0400
X-MC-Unique: zB1j6BmdP-66hEwoAoTf6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45B8979EC1;
	Thu,  6 Aug 2020 13:38:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33C7D10021B3;
	Thu,  6 Aug 2020 13:38:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2112696939;
	Thu,  6 Aug 2020 13:38:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcsQM030987 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8550660C47; Thu,  6 Aug 2020 13:38:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE9D960BF1
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:53 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:38:01 +0100
Message-Id: <20200806133807.111280-27-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 26/32] savemeta: Process indirect pointers
	in chunks
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Where indirect pointers point to consecutive blocks, use the new block
range structures to read them in one go. The largest read is bounded by
the number of pointers in a block, so just under 2MB for a 4K block
size. Replace the lists of buffer heads for each metadata tree height
with a simpler queue structure.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 192 ++++++++++++++++++++++++-------------------
 1 file changed, 107 insertions(+), 85 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 50d93b0b..76477b79 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -560,6 +560,7 @@ static int save_buf(struct metafd *mfd, const char *buf, uint64_t addr, unsigned
 }
 
 struct block_range {
+	struct block_range *next;
 	uint64_t start;
 	unsigned len;
 	unsigned *blktype;
@@ -567,6 +568,11 @@ struct block_range {
 	char *buf;
 };
 
+struct block_range_queue {
+	struct block_range *tail;
+	struct block_range **head;
+};
+
 static int save_range(struct metafd *mfd, struct block_range *br)
 {
 	for (unsigned i = 0; i < br->len; i++) {
@@ -668,54 +674,68 @@ static void save_ea_block(struct metafd *mfd, char *buf, uint64_t owner)
 	}
 }
 
-/*
- * save_indirect_blocks - save all indirect blocks for the given buffer
- */
-static void save_indirect_blocks(struct metafd *mfd, osi_list_t *cur_list,
-           struct gfs2_buffer_head *mybh, uint64_t owner, int height, int hgt)
+static void save_indirect_range(struct metafd *mfd, struct block_range **brp, uint64_t owner,
+                                struct block_range_queue *q)
 {
-	uint64_t old_block = 0, indir_block;
-	uint64_t *ptr;
-	int head_size;
-	struct gfs2_buffer_head *nbh;
+	struct block_range *br = *brp;
 
-	head_size = (hgt > 1 ?
-		     sizeof(struct gfs2_meta_header) :
-		     sizeof(struct gfs2_dinode));
+	if (check_read_range(sbd.device_fd, br, owner) != 0)
+		return;
 
-	for (ptr = (uint64_t *)(mybh->b_data + head_size);
-	     (char *)ptr < (mybh->b_data + sbd.bsize); ptr++) {
-		size_t blklen;
-		int blktype;
-		char *buf;
+	save_range(mfd, br);
+	for (unsigned i = 0; i < br->len; i++) {
+		if (br->blktype[i] == GFS2_METATYPE_EA)
+			save_ea_block(mfd, br->buf + (i * sbd.bsize), owner);
+	}
+	if (q) {
+		*q->head = br;
+		q->head = &br->next;
+		*brp = NULL; /* The list now has ownership of it */
+	} else {
+		free(br->buf);
+		br->buf = NULL;
+	}
+}
+
+static void save_indirect_blocks(struct metafd *mfd, char *buf, uint64_t owner,
+                                 struct block_range_queue *q, unsigned headsize)
+{
+	uint64_t old_block = 0, indir_block;
+	struct block_range *br = NULL;
+	uint64_t *ptr;
 
+	for (ptr = (uint64_t *)(buf + headsize);
+	     (char *)ptr < (buf + sbd.bsize); ptr++) {
 		if (!*ptr)
 			continue;
+
 		indir_block = be64_to_cpu(*ptr);
 		if (indir_block == old_block)
 			continue;
 		old_block = indir_block;
 
-		buf = check_read_block(sbd.device_fd, indir_block, owner, &blktype, &blklen);
-		if (buf != NULL) {
-			save_buf(mfd, buf, indir_block, blklen);
-			free(buf);
-		}
-
-		if (blktype == GFS2_METATYPE_EA) {
-			nbh = bread(&sbd, indir_block);
-			save_ea_block(mfd, nbh->b_data, owner);
-			brelse(nbh);
-		}
-		if (height != hgt && /* If not at max height and */
-		    (!gfs2_check_range(&sbd, indir_block))) {
-			nbh = bread(&sbd, indir_block);
-			osi_list_add_prev(&nbh->b_altlist, cur_list);
-			/* The buffer_head needs to be queued ahead, so
-			   don't release it!
-			   brelse(nbh);*/
+		if (br == NULL) {
+new_range:
+			br = calloc(1, sizeof(*br));
+			if (br == NULL) {
+				perror("Failed to save indirect blocks");
+				return;
+			}
+			br->start = indir_block;
+			br->len = 1;
+		} else if (indir_block == br->start + br->len) {
+			br->len++;
+		} else {
+			save_indirect_range(mfd, &br, owner, q);
+			if (br == NULL) /* This one was queued up for later */
+				goto new_range;
+			br->start = indir_block;
+			br->len = 1;
 		}
-	} /* for all data on the indirect block */
+	}
+	if (br != NULL && br->start != 0)
+		save_indirect_range(mfd, &br, owner, q);
+	free(br);
 }
 
 static int save_leaf_chain(struct metafd *mfd, struct gfs2_sbd *sdp, uint64_t blk)
@@ -761,6 +781,7 @@ static int save_leaf_chain(struct metafd *mfd, struct gfs2_sbd *sdp, uint64_t bl
  * save_inode_data - save off important data associated with an inode
  *
  * mfd - destination file descriptor
+ * buf - buffer containing the inode block
  * iblk - block number of the inode to save the data for
  *
  * For user files, we don't want anything except all the indirect block
@@ -772,17 +793,55 @@ static int save_leaf_chain(struct metafd *mfd, struct gfs2_sbd *sdp, uint64_t bl
  * For file system journals, the "data" is a mixture of metadata and
  * journaled data.  We want all the metadata and none of the user data.
  */
-static void save_inode_data(struct metafd *mfd, uint64_t iblk)
+static void save_inode_data(struct metafd *mfd, char *ibuf, uint64_t iblk)
 {
+	struct block_range_queue indq[GFS2_MAX_META_HEIGHT] = {{NULL}};
+	struct gfs2_buffer_head *metabh;
 	uint32_t height;
 	struct gfs2_inode *inode;
-	osi_list_t metalist[GFS2_MAX_META_HEIGHT];
-	osi_list_t *prev_list, *cur_list, *tmp;
-	struct gfs2_buffer_head *metabh, *mybh;
-	int i;
+	struct gfs2_dinode _di = {0};
+
+	for (unsigned i = 0; i < GFS2_MAX_META_HEIGHT; i++)
+		indq[i].head = &indq[i].tail;
+
+	gfs2_dinode_in(&_di, ibuf);
+	height = _di.di_height;
+
+	/* If this is a user inode, we don't follow to the file height.
+	   We stop one level less.  That way we save off the indirect
+	   pointer blocks but not the actual file contents. The exception
+	   is directories, where the height represents the level at which
+	   the hash table exists, and we have to save the directory data. */
+
+	if (_di.di_flags & GFS2_DIF_EXHASH && (S_ISDIR(_di.di_mode) ||
+	     (sbd.gfs1 && _di.__pad1 == GFS_FILE_DIR)))
+		height++;
+	else if (height > 0 && !(_di.di_flags & GFS2_DIF_SYSTEM) &&
+		 !block_is_systemfile(iblk) && !S_ISDIR(_di.di_mode))
+		height--;
+
+	if (height > 0)
+		save_indirect_blocks(mfd, ibuf, iblk, height == 1 ? NULL : &indq[0], sizeof(_di));
+	for (unsigned i = 1; i < height; i++) {
+		struct block_range_queue *nextq = &indq[i];
+
+		if (i == height - 1)
+			nextq = NULL;
+
+		while (indq[i - 1].tail != NULL) {
+			struct block_range *q = indq[i - 1].tail;
 
-	for (i = 0; i < GFS2_MAX_META_HEIGHT; i++)
-		osi_list_init(&metalist[i]);
+			for (unsigned j = 0; j < q->len; j++) {
+				char *_buf = q->buf + (j * sbd.bsize);
+
+				save_indirect_blocks(mfd, _buf, iblk, nextq, sizeof(_di.di_header));
+			}
+			warm_fuzzy_stuff(q->start + q->len, 0);
+			indq[i - 1].tail = q->next;
+			free(q->buf);
+			free(q);
+		}
+	}
 	metabh = bread(&sbd, iblk);
 	if (sbd.gfs1) {
 		inode = lgfs2_gfs_inode_get(&sbd, metabh->b_data);
@@ -793,45 +852,6 @@ static void save_inode_data(struct metafd *mfd, uint64_t iblk)
 		perror("Failed to read inode");
 		exit(-1);
 	}
-	height = inode->i_di.di_height;
-	/* If this is a user inode, we don't follow to the file height.
-	   We stop one level less.  That way we save off the indirect
-	   pointer blocks but not the actual file contents. The exception
-	   is directories, where the height represents the level at which
-	   the hash table exists, and we have to save the directory data. */
-	if (inode->i_di.di_flags & GFS2_DIF_EXHASH &&
-	    (S_ISDIR(inode->i_di.di_mode) ||
-	     (sbd.gfs1 && inode->i_di.__pad1 == GFS_FILE_DIR)))
-		height++;
-	else if (height && !(inode->i_di.di_flags & GFS2_DIF_SYSTEM) &&
-		 !block_is_systemfile(iblk) && !S_ISDIR(inode->i_di.di_mode))
-		height--;
-	osi_list_add(&metabh->b_altlist, &metalist[0]);
-        for (i = 1; i <= height; i++){
-		prev_list = &metalist[i - 1];
-		cur_list = &metalist[i];
-
-		for (tmp = prev_list->next; tmp != prev_list; tmp = tmp->next){
-			mybh = osi_list_entry(tmp, struct gfs2_buffer_head,
-					      b_altlist);
-			warm_fuzzy_stuff(iblk, FALSE);
-			save_indirect_blocks(mfd, cur_list, mybh, iblk,
-					     height, i);
-		} /* for blocks at that height */
-	} /* for height */
-	/* free metalists */
-	for (i = 0; i < GFS2_MAX_META_HEIGHT; i++) {
-		cur_list = &metalist[i];
-		while (!osi_list_empty(cur_list)) {
-			mybh = osi_list_entry(cur_list->next,
-					    struct gfs2_buffer_head,
-					    b_altlist);
-			if (mybh == inode->i_bh)
-				osi_list_del(&mybh->b_altlist);
-			else
-				brelse(mybh);
-		}
-	}
 	/* Process directory exhash inodes */
 	if (S_ISDIR(inode->i_di.di_mode) &&
 	    inode->i_di.di_flags & GFS2_DIF_EXHASH) {
@@ -866,7 +886,7 @@ static void save_inode_data(struct metafd *mfd, uint64_t iblk)
 		if (mhtype == GFS2_METATYPE_EA)
 			save_ea_block(mfd, lbh->b_data, iblk);
 		else if (mhtype == GFS2_METATYPE_IN)
-			save_indirect_blocks(mfd, cur_list, lbh, iblk, 2, 2);
+			save_indirect_blocks(mfd, lbh->b_data, iblk, NULL, sizeof(di.di_header));
 		brelse(lbh);
 	}
 	inode_put(&inode);
@@ -928,8 +948,10 @@ static void save_allocated_range(struct metafd *mfd, struct block_range *br)
 
 	save_range(mfd, br);
 	for (unsigned i = 0; i < br->len; i++) {
+		char *buf = br->buf + (i * sbd.bsize);
+
 		if (br->blktype[i] == GFS2_METATYPE_DI)
-			save_inode_data(mfd, br->start + i);
+			save_inode_data(mfd, buf, br->start + i);
 	}
 	free(br->buf);
 }
@@ -1126,9 +1148,9 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 		buf = check_read_block(sbd.device_fd, blk, blk, NULL, NULL);
 		if (buf != NULL) {
 			save_buf(&mfd, buf, blk, sbd.bsize);
+			save_inode_data(&mfd, buf, blk);
 			free(buf);
 		}
-		save_inode_data(&mfd, blk);
 		/* In GFS1, journals aren't part of the RG space */
 		for (j = 0; j < journals_found; j++) {
 			uint64_t jb = journal_blocks[j];
-- 
2.26.2

