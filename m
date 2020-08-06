Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7079A23DAED
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721147;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/LKcDY5luNYFoNwcAQ/nlk/ohamws61fgvAbJRuOtP0=;
	b=JUk8jP95bCLJXJgF7c/ixa0177daf8gxI6AHxaXy66bNzENiZI9TJTpHeRQ0NmfBaiN7bY
	g0OS7+AuZ0UPrLWMTjP/r5n93+qKX9d5Rplrk4y/jEKX+y21z3dYulraUUvbxQLjVxkmfi
	E9P635S5p91sKxyJZxZFu2jSN10tWpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-18ExaHdlOTewKI_wNsYgfQ-1; Thu, 06 Aug 2020 09:39:03 -0400
X-MC-Unique: 18ExaHdlOTewKI_wNsYgfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63FB180048B;
	Thu,  6 Aug 2020 13:39:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 557B365C68;
	Thu,  6 Aug 2020 13:39:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40EFD1809554;
	Thu,  6 Aug 2020 13:39:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076Dculg031013 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AD98260C47; Thu,  6 Aug 2020 13:38:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05E5E60BF1
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:55 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:38:03 +0100
Message-Id: <20200806133807.111280-29-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 28/32] savemeta: Leaf block processing
	improvements
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

We've already walked the indirect pointer tree and read the leaf blocks
earlier, so hold onto those and use them to read down the leaf chains,
instead of doing a gfs2_readi() for every leaf block.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 59 +++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 31 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 55f64922..ea09d2bf 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -740,17 +740,14 @@ new_range:
 	free(br);
 }
 
-static int save_leaf_chain(struct metafd *mfd, struct gfs2_sbd *sdp, uint64_t blk)
+static int save_leaf_chain(struct metafd *mfd, struct gfs2_sbd *sdp, char *buf)
 {
 	struct gfs2_leaf leaf;
-	char *buf = calloc(1, sdp->bsize);
 
-	if (buf == NULL) {
-		perror("Failed to save leaf blocks");
-		return 1;
-	}
+	gfs2_leaf_in(&leaf, buf);
 
-	do {
+	while (leaf.lf_next != 0) {
+		uint64_t blk = leaf.lf_next;
 		ssize_t r;
 
 		if (gfs2_check_range(sdp, blk) != 0)
@@ -772,13 +769,26 @@ static int save_leaf_chain(struct metafd *mfd, struct gfs2_sbd *sdp, uint64_t bl
 			}
 		}
 		gfs2_leaf_in(&leaf, buf);
-		blk = leaf.lf_next;
-	} while (leaf.lf_next != 0);
-
-	free(buf);
+	}
 	return 0;
 }
 
+static void save_leaf_blocks(struct metafd *mfd, struct block_range_queue *q)
+{
+	while (q->tail != NULL) {
+		struct block_range *br = q->tail;
+
+		for (unsigned i = 0; i < br->len; i++) {
+			char *buf = br->buf + (i * sbd.bsize);
+
+			save_leaf_chain(mfd, &sbd, buf);
+		}
+		q->tail = br->next;
+		free(br->buf);
+		free(br);
+	}
+}
+
 /*
  * save_inode_data - save off important data associated with an inode
  *
@@ -802,6 +812,7 @@ static void save_inode_data(struct metafd *mfd, char *ibuf, uint64_t iblk)
 	uint32_t height;
 	struct gfs2_inode *inode;
 	struct gfs2_dinode _di = {0};
+	int is_exhash;
 
 	for (unsigned i = 0; i < GFS2_MAX_META_HEIGHT; i++)
 		indq[i].head = &indq[i].tail;
@@ -815,8 +826,9 @@ static void save_inode_data(struct metafd *mfd, char *ibuf, uint64_t iblk)
 	   is directories, where the height represents the level at which
 	   the hash table exists, and we have to save the directory data. */
 
-	if (_di.di_flags & GFS2_DIF_EXHASH && (S_ISDIR(_di.di_mode) ||
-	     (sbd.gfs1 && _di.__pad1 == GFS_FILE_DIR)))
+	is_exhash = (S_ISDIR(_di.di_mode) || (sbd.gfs1 && _di.__pad1 == GFS_FILE_DIR)) &&
+	             _di.di_flags & GFS2_DIF_EXHASH;
+	if (is_exhash)
 		height++;
 	else if (height > 0 && !(_di.di_flags & GFS2_DIF_SYSTEM) &&
 		 !block_is_systemfile(iblk) && !S_ISDIR(_di.di_mode))
@@ -827,7 +839,7 @@ static void save_inode_data(struct metafd *mfd, char *ibuf, uint64_t iblk)
 	for (unsigned i = 1; i < height; i++) {
 		struct block_range_queue *nextq = &indq[i];
 
-		if (i == height - 1)
+		if (!is_exhash && i == height - 1)
 			nextq = NULL;
 
 		while (indq[i - 1].tail != NULL) {
@@ -844,6 +856,8 @@ static void save_inode_data(struct metafd *mfd, char *ibuf, uint64_t iblk)
 			free(q);
 		}
 	}
+	if (is_exhash)
+		save_leaf_blocks(mfd, &indq[height - 1]);
 	metabh = bread(&sbd, iblk);
 	if (sbd.gfs1) {
 		inode = lgfs2_gfs_inode_get(&sbd, metabh->b_data);
@@ -854,23 +868,6 @@ static void save_inode_data(struct metafd *mfd, char *ibuf, uint64_t iblk)
 		perror("Failed to read inode");
 		exit(-1);
 	}
-	/* Process directory exhash inodes */
-	if (S_ISDIR(inode->i_di.di_mode) &&
-	    inode->i_di.di_flags & GFS2_DIF_EXHASH) {
-		uint64_t  leaf_no, old_leaf = -1;
-		int li;
-
-		for (li = 0; li < (1 << inode->i_di.di_depth); li++) {
-			if (lgfs2_get_leaf_ptr(inode, li, &leaf_no)) {
-				fprintf(stderr, "Could not read leaf index %d in dinode %"PRIu64"\n", li,
-				        (uint64_t)inode->i_di.di_num.no_addr);
-				exit(-1);
-			}
-			if (leaf_no != old_leaf && save_leaf_chain(mfd, &sbd, leaf_no) != 0)
-				exit(-1);
-			old_leaf = leaf_no;
-		}
-	}
 	if (inode->i_di.di_eattr) { /* if this inode has extended attributes */
 		struct gfs2_buffer_head *lbh;
 		size_t blklen;
-- 
2.26.2

