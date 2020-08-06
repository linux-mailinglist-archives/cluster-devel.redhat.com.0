Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C746D23DAE5
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721135;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VvdIIRIPEPbPmuGiDox6ZDkatmAxBTYbtOwhK1LWeFc=;
	b=Nbzt3veSrMKi6T4fdUVflvlYpVXf1O+zL4CTbNUK0BTAQsKY8JDolJ+ksNTWweo3mGpNtg
	tJTUXw7IF20ArVzh/RgUixjfYu9JREMlDmW/scG0WSvIPh5fytTHoDxGjBZd7haMg+VEdp
	42dqNRD6OpUjB28qnBwcoD8wjgqZd6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-9fSzOLi9OC6kId4LEPvd_g-1; Thu, 06 Aug 2020 09:38:54 -0400
X-MC-Unique: 9fSzOLi9OC6kId4LEPvd_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAE8D1923769;
	Thu,  6 Aug 2020 13:38:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCD356179B;
	Thu,  6 Aug 2020 13:38:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C63FC1809554;
	Thu,  6 Aug 2020 13:38:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcoY9030951 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF67160BF1; Thu,  6 Aug 2020 13:38:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0447C70596
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:46 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:58 +0100
Message-Id: <20200806133807.111280-24-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 23/32] savemeta: Split block reading from
	saving
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

We lose a lot of control by not having access to the block data at the
point where we decide it needs to be saved, so split save_buf() out of
save_block() (which is renamed to check_read_block()) and add the
minimum required buffer propagation at the call points.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 93 +++++++++++++++++++++++++++++++-------------
 1 file changed, 65 insertions(+), 28 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 8afa8e60..cbead772 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -570,31 +570,25 @@ static int save_buf(struct metafd *mfd, const char *buf, uint64_t addr, uint64_t
 	return do_save_buf(mfd, buf, addr, blklen);
 }
 
-static int save_block(int fd, struct metafd *mfd, uint64_t blk, uint64_t owner, int *blktype)
+static char *check_read_block(int fd, uint64_t blk)
 {
-	char *buf;
-	int err;
-
-	buf = calloc(1, sbd.bsize);
+	char *buf = calloc(1, sbd.bsize);
 	if (buf == NULL) {
-		fprintf(stderr, "Failed to read block 0x%"PRIx64" (in 0x%"PRIx64"): %s\n",
-		        blk, owner, strerror(errno));
-		return 1;
+		perror("Failed to read block");
+		return NULL;
 	}
 	if (gfs2_check_range(&sbd, blk) && blk != LGFS2_SB_ADDR(&sbd)) {
-		fprintf(stderr, "Warning: bad pointer 0x%"PRIx64" ignored in block 0x%"PRIx64"\n",
-		        blk, owner);
-		return 0;
+		fprintf(stderr, "Warning: bad pointer 0x%"PRIx64" ignored.\n", blk);
+		free(buf);
+		return NULL;
 	}
 	if (pread(sbd.device_fd, buf, sbd.bsize, sbd.bsize * blk) != sbd.bsize) {
-		fprintf(stderr, "Failed to read block 0x%"PRIx64" (in 0x%"PRIx64"): %s\n",
-		        blk, owner, strerror(errno));
+		fprintf(stderr, "Failed to read block 0x%"PRIx64": %s\n",
+		        blk, strerror(errno));
 		free(buf);
-		return 1;
+		return NULL;
 	}
-	err = save_buf(mfd, buf, blk, owner, blktype);
-	free(buf);
-	return err;
+	return buf;
 }
 
 /*
@@ -611,6 +605,8 @@ static void save_ea_block(struct metafd *mfd, char *buf, uint64_t owner)
 
 		gfs2_ea_header_in(&ea, buf + e);
 		for (i = 0; i < ea.ea_num_ptrs; i++) {
+			char *_buf;
+
 			charoff = e + ea.ea_name_len +
 				sizeof(struct gfs2_ea_header) +
 				sizeof(uint64_t) - 1;
@@ -618,7 +614,11 @@ static void save_ea_block(struct metafd *mfd, char *buf, uint64_t owner)
 			b = (uint64_t *)buf;
 			b += charoff + i;
 			blk = be64_to_cpu(*b);
-			save_block(sbd.device_fd, mfd, blk, owner, NULL);
+			_buf = check_read_block(sbd.device_fd, blk);
+			if (_buf != NULL) {
+				save_buf(mfd, _buf, blk, owner, NULL);
+				free(_buf);
+			}
 		}
 		if (!ea.ea_rec_len)
 			break;
@@ -642,13 +642,21 @@ static void save_indirect_blocks(struct metafd *mfd, osi_list_t *cur_list,
 
 	for (ptr = (uint64_t *)(mybh->b_data + head_size);
 	     (char *)ptr < (mybh->b_data + sbd.bsize); ptr++) {
+		char *buf;
+
 		if (!*ptr)
 			continue;
 		indir_block = be64_to_cpu(*ptr);
 		if (indir_block == old_block)
 			continue;
 		old_block = indir_block;
-		save_block(sbd.device_fd, mfd, indir_block, owner, &blktype);
+
+		buf = check_read_block(sbd.device_fd, indir_block);
+		if (buf != NULL) {
+			save_buf(mfd, buf, indir_block, owner, &blktype);
+			free(buf);
+		}
+
 		if (blktype == GFS2_METATYPE_EA) {
 			nbh = bread(&sbd, indir_block);
 			save_ea_block(mfd, nbh->b_data, owner);
@@ -799,9 +807,14 @@ static void save_inode_data(struct metafd *mfd, uint64_t iblk)
 	if (inode->i_di.di_eattr) { /* if this inode has extended attributes */
 		struct gfs2_buffer_head *lbh;
 		int mhtype;
+		char *buf;
 
 		lbh = bread(&sbd, inode->i_di.di_eattr);
-		save_block(sbd.device_fd, mfd, inode->i_di.di_eattr, iblk, &mhtype);
+		buf = check_read_block(sbd.device_fd, inode->i_di.di_eattr);
+		if (buf != NULL) {
+			save_buf(mfd, buf, inode->i_di.di_eattr, iblk, &mhtype);
+			free(buf);
+		}
 		if (mhtype == GFS2_METATYPE_EA)
 			save_ea_block(mfd, lbh->b_data, iblk);
 		else if (mhtype == GFS2_METATYPE_IN)
@@ -871,9 +884,15 @@ static void save_allocated(struct rgrp_tree *rgd, struct metafd *mfd)
 		m = lgfs2_bm_scan(rgd, i, ibuf, GFS2_BLKST_DINODE);
 
 		for (j = 0; j < m; j++) {
+			char *buf;
+
 			blk = ibuf[j];
 			warm_fuzzy_stuff(blk, FALSE);
-			save_block(sbd.device_fd, mfd, blk, blk, &blktype);
+			buf = check_read_block(sbd.device_fd, blk);
+			if (buf != NULL) {
+				save_buf(mfd, buf, blk, blk, &blktype);
+				free(buf);
+			}
 			if (blktype == GFS2_METATYPE_DI)
 				save_inode_data(mfd, blk);
 		}
@@ -884,7 +903,11 @@ static void save_allocated(struct rgrp_tree *rgd, struct metafd *mfd)
 		 * If we don't, we may run into metadata allocation issues. */
 		m = lgfs2_bm_scan(rgd, i, ibuf, GFS2_BLKST_UNLINKED);
 		for (j = 0; j < m; j++) {
-			save_block(sbd.device_fd, mfd, blk, blk, NULL);
+			char *buf = check_read_block(sbd.device_fd, blk);
+			if (buf != NULL) {
+				save_buf(mfd, buf, blk, blk, &blktype);
+				free(buf);
+			}
 		}
 	}
 	free(ibuf);
@@ -984,6 +1007,7 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 	struct metafd mfd;
 	struct osi_node *n;
 	int err = 0;
+	char *buf;
 
 	sbd.md.journals = 1;
 
@@ -1018,7 +1042,11 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 		exit(1);
 	}
 	/* Save off the superblock */
-	save_block(sbd.device_fd, &mfd, GFS2_SB_ADDR * GFS2_BASIC_BLOCK / sbd.bsize, 0, NULL);
+	buf = check_read_block(sbd.device_fd, GFS2_SB_ADDR * GFS2_BASIC_BLOCK / sbd.bsize);
+	if (buf != NULL) {
+		save_buf(&mfd, buf, GFS2_SB_ADDR * GFS2_BASIC_BLOCK / sbd.bsize, 0, NULL);
+		free(buf);
+	}
 	/* If this is gfs1, save off the rindex because it's not
 	   part of the file system as it is in gfs2. */
 	if (sbd.gfs1) {
@@ -1026,15 +1054,24 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 		int j;
 
 		blk = sbd1->sb_rindex_di.no_addr;
-		save_block(sbd.device_fd, &mfd, blk, blk, NULL);
+		buf = check_read_block(sbd.device_fd, blk);
+		if (buf != NULL) {
+			save_buf(&mfd, buf, blk, blk, NULL);
+			free(buf);
+		}
 		save_inode_data(&mfd, blk);
 		/* In GFS1, journals aren't part of the RG space */
 		for (j = 0; j < journals_found; j++) {
+			uint64_t jb = journal_blocks[j];
+
 			log_debug("Saving journal #%d\n", j + 1);
-			for (blk = journal_blocks[j];
-			     blk < journal_blocks[j] + gfs1_journal_size;
-			     blk++)
-				save_block(sbd.device_fd, &mfd, blk, blk, NULL);
+			for (blk = jb; blk < (jb + gfs1_journal_size); blk++) {
+				buf = check_read_block(sbd.device_fd, blk);
+				if (buf != NULL) {
+					save_buf(&mfd, buf, blk, blk, NULL);
+					free(buf);
+				}
+			}
 		}
 	}
 	/* Walk through the resource groups saving everything within */
-- 
2.26.2

