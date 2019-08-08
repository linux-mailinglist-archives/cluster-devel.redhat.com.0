Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B2F86757
	for <lists+cluster-devel@lfdr.de>; Thu,  8 Aug 2019 18:44:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04455127A4;
	Thu,  8 Aug 2019 16:44:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7350E600CC;
	Thu,  8 Aug 2019 16:44:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EBAC218005A4;
	Thu,  8 Aug 2019 16:44:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x78GelDD012877 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 8 Aug 2019 12:40:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA19960BF1; Thu,  8 Aug 2019 16:40:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3FF660BE1;
	Thu,  8 Aug 2019 16:40:44 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  8 Aug 2019 18:40:41 +0200
Message-Id: <20190808164041.5386-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2] gfs2: gfs2_walk_metadata fix
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Thu, 08 Aug 2019 16:44:29 +0000 (UTC)

It turns out that the current version of gfs2_metadata_walker suffers
from multiple problems that can lead to incorrect gfs2_hole_size
results.  To fix that, change gfs2_hole_walker to compute the metapath
to the first data block after the hole (if any), and compute the hole
size based on that.

(This obsoletes the previous version of this patch as well as "gfs2:
gfs2_walk_metadata cleanup".)

Fixes fstest generic/490.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Reviewed-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/bmap.c | 164 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 101 insertions(+), 63 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 4df26ef2b2b1..4f8b5fd6c81f 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -390,6 +390,19 @@ static int fillup_metapath(struct gfs2_inode *ip, struct metapath *mp, int h)
 	return mp->mp_aheight - x - 1;
 }
 
+static sector_t metapath_to_block(struct gfs2_sbd *sdp, struct metapath *mp)
+{
+	sector_t factor = 1, block = 0;
+	int hgt;
+
+	for (hgt = mp->mp_fheight - 1; hgt >= 0; hgt--) {
+		if (hgt < mp->mp_aheight)
+			block += mp->mp_list[hgt] * factor;
+		factor *= sdp->sd_inptrs;
+	}
+	return block;
+}
+
 static void release_metapath(struct metapath *mp)
 {
 	int i;
@@ -430,60 +443,84 @@ static inline unsigned int gfs2_extent_length(struct buffer_head *bh, __be64 *pt
 	return ptr - first;
 }
 
-typedef const __be64 *(*gfs2_metadata_walker)(
-		struct metapath *mp,
-		const __be64 *start, const __be64 *end,
-		u64 factor, void *data);
+enum walker_status { WALK_STOP, WALK_FOLLOW, WALK_CONTINUE };
 
-#define WALK_STOP ((__be64 *)0)
-#define WALK_NEXT ((__be64 *)1)
+/*
+ * gfs2_metadata_walker - walk an indirect block
+ * @mp: Metapath to indirect block
+ * @ptrs: Number of pointers to look at
+ *
+ * When returning WALK_FOLLOW, the walker must update @mp to point at the right
+ * indirect block to follow.
+ */
+typedef enum walker_status (*gfs2_metadata_walker)(struct metapath *mp,
+						   unsigned int ptrs);
 
-static int gfs2_walk_metadata(struct inode *inode, sector_t lblock,
-		u64 len, struct metapath *mp, gfs2_metadata_walker walker,
-		void *data)
+/*
+ * gfs2_walk_metadata - walk a tree of indirect blocks
+ * @inode: The inode
+ * @mp: Starting point of walk
+ * @max_len: Maximum number of blocks to walk
+ * @walker: Called during the walk
+ *
+ * Returns 1 if the walk was stopped by @walker, 0 if we went past @max_len or
+ * past the end of metadata, and a negative error code otherwise.
+ */
+
+static int gfs2_walk_metadata(struct inode *inode, struct metapath *mp,
+		u64 max_len, gfs2_metadata_walker walker)
 {
-	struct metapath clone;
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
-	const __be64 *start, *end, *ptr;
 	u64 factor = 1;
 	unsigned int hgt;
-	int ret = 0;
+	int ret;
 
-	for (hgt = ip->i_height - 1; hgt >= mp->mp_aheight; hgt--)
+	/*
+	 * The walk starts in the lowest allocated indirect block, which may be
+	 * before the position indicated by @mp.  Adjust @max_len accordingly
+	 * to avoid a short walk.
+	 */
+	for (hgt = mp->mp_fheight - 1; hgt >= mp->mp_aheight; hgt--) {
+		max_len += mp->mp_list[hgt] * factor;
+		mp->mp_list[hgt] = 0;
 		factor *= sdp->sd_inptrs;
+	}
 
 	for (;;) {
-		u64 step;
+		u16 start = mp->mp_list[hgt];
+		enum walker_status status;
+		unsigned int ptrs;
+		u64 len;
 
 		/* Walk indirect block. */
-		start = metapointer(hgt, mp);
-		end = metaend(hgt, mp);
-
-		step = (end - start) * factor;
-		if (step > len)
-			end = start + DIV_ROUND_UP_ULL(len, factor);
-
-		ptr = walker(mp, start, end, factor, data);
-		if (ptr == WALK_STOP)
+		ptrs = (hgt >= 1 ? sdp->sd_inptrs : sdp->sd_diptrs) - start;
+		len = ptrs * factor;
+		if (len > max_len)
+			ptrs = DIV_ROUND_UP_ULL(max_len, factor);
+		status = walker(mp, ptrs);
+		switch (status) {
+		case WALK_STOP:
+			return 1;
+		case WALK_FOLLOW:
+			BUG_ON(mp->mp_aheight == mp->mp_fheight);
+			ptrs = mp->mp_list[hgt] - start;
+			len = ptrs * factor;
 			break;
-		if (step >= len)
+		case WALK_CONTINUE:
 			break;
-		len -= step;
-		if (ptr != WALK_NEXT) {
-			BUG_ON(!*ptr);
-			mp->mp_list[hgt] += ptr - start;
-			goto fill_up_metapath;
 		}
+		if (len >= max_len)
+			break;
+		max_len -= len;
+		if (status == WALK_FOLLOW)
+			goto fill_up_metapath;
 
 lower_metapath:
 		/* Decrease height of metapath. */
-		if (mp != &clone) {
-			clone_metapath(&clone, mp);
-			mp = &clone;
-		}
 		brelse(mp->mp_bh[hgt]);
 		mp->mp_bh[hgt] = NULL;
+		mp->mp_list[hgt] = 0;
 		if (!hgt)
 			break;
 		hgt--;
@@ -491,10 +528,7 @@ static int gfs2_walk_metadata(struct inode *inode, sector_t lblock,
 
 		/* Advance in metadata tree. */
 		(mp->mp_list[hgt])++;
-		start = metapointer(hgt, mp);
-		end = metaend(hgt, mp);
-		if (start >= end) {
-			mp->mp_list[hgt] = 0;
+		if (mp->mp_list[hgt] >= sdp->sd_inptrs) {
 			if (!hgt)
 				break;
 			goto lower_metapath;
@@ -502,44 +536,36 @@ static int gfs2_walk_metadata(struct inode *inode, sector_t lblock,
 
 fill_up_metapath:
 		/* Increase height of metapath. */
-		if (mp != &clone) {
-			clone_metapath(&clone, mp);
-			mp = &clone;
-		}
 		ret = fillup_metapath(ip, mp, ip->i_height - 1);
 		if (ret < 0)
-			break;
+			return ret;
 		hgt += ret;
 		for (; ret; ret--)
 			do_div(factor, sdp->sd_inptrs);
 		mp->mp_aheight = hgt + 1;
 	}
-	if (mp == &clone)
-		release_metapath(mp);
-	return ret;
+	return 0;
 }
 
-struct gfs2_hole_walker_args {
-	u64 blocks;
-};
-
-static const __be64 *gfs2_hole_walker(struct metapath *mp,
-		const __be64 *start, const __be64 *end,
-		u64 factor, void *data)
+static enum walker_status gfs2_hole_walker(struct metapath *mp,
+					   unsigned int ptrs)
 {
-	struct gfs2_hole_walker_args *args = data;
-	const __be64 *ptr;
+	const __be64 *start, *ptr, *end;
+	unsigned int hgt;
+
+	hgt = mp->mp_aheight - 1;
+	start = metapointer(hgt, mp);
+	end = start + ptrs;
 
 	for (ptr = start; ptr < end; ptr++) {
 		if (*ptr) {
-			args->blocks += (ptr - start) * factor;
+			mp->mp_list[hgt] += ptr - start;
 			if (mp->mp_aheight == mp->mp_fheight)
 				return WALK_STOP;
-			return ptr;  /* increase height */
+			return WALK_FOLLOW;
 		}
 	}
-	args->blocks += (end - start) * factor;
-	return WALK_NEXT;
+	return WALK_CONTINUE;
 }
 
 /**
@@ -557,12 +583,24 @@ static const __be64 *gfs2_hole_walker(struct metapath *mp,
 static int gfs2_hole_size(struct inode *inode, sector_t lblock, u64 len,
 			  struct metapath *mp, struct iomap *iomap)
 {
-	struct gfs2_hole_walker_args args = { };
-	int ret = 0;
+	struct metapath clone;
+	u64 hole_size;
+	int ret;
 
-	ret = gfs2_walk_metadata(inode, lblock, len, mp, gfs2_hole_walker, &args);
-	if (!ret)
-		iomap->length = args.blocks << inode->i_blkbits;
+	clone_metapath(&clone, mp);
+	ret = gfs2_walk_metadata(inode, &clone, len, gfs2_hole_walker);
+	if (ret < 0)
+		goto out;
+
+	if (ret == 1)
+		hole_size = metapath_to_block(GFS2_SB(inode), &clone) - lblock;
+	else
+		hole_size = len;
+	iomap->length = hole_size << inode->i_blkbits;
+	ret = 0;
+
+out:
+	release_metapath(&clone);
 	return ret;
 }
 
-- 
2.20.1

