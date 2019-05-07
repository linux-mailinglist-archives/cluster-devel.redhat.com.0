Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D47E516C39
	for <lists+cluster-devel@lfdr.de>; Tue,  7 May 2019 22:32:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 65426C057F9C;
	Tue,  7 May 2019 20:32:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07149174B3;
	Tue,  7 May 2019 20:32:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5135C18089CB;
	Tue,  7 May 2019 20:32:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x47KW9La018787 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 16:32:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6A53618EE2; Tue,  7 May 2019 20:32:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CA362E038;
	Tue,  7 May 2019 20:32:06 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  7 May 2019 22:31:53 +0200
Message-Id: <20190507203204.26008-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 01/12] gfs2: Fix loop in gfs2_rbm_find
	(v2)
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 07 May 2019 20:32:13 +0000 (UTC)

Fix the resource group wrap-around logic in gfs2_rbm_find that commit
e579ed4f44 broke.  The bug can lead to unnecessary repeated scanning of the
same bitmaps; there is a risk that future changes will turn this into an
endless loop.

This is an updated version of commit 2d29f6b96d ("gfs2: Fix loop in
gfs2_rbm_find") which ended up being reverted because it introduced a
performance regression in iozone (see commit e74c98ca2d).  Changes since v1:

 - Simplify the wrap-around logic.

 - Handle the case where each resource group only has a single bitmap block
   (small filesystem).

 - Update rd_extfail_pt whenever we scan the entire bitmap, even when we don't
   start the scan at the very beginning of the bitmap.

Fixes: e579ed4f446e ("GFS2: Introduce rbm field bii")
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/rgrp.c | 54 +++++++++++++++++++++++---------------------------
 1 file changed, 25 insertions(+), 29 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 17a8d3b43990..52a4f340a867 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1729,25 +1729,22 @@ static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
 static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
 			 const struct gfs2_inode *ip, bool nowrap)
 {
+	bool scan_from_start = rbm->bii == 0 && rbm->offset == 0;
 	struct buffer_head *bh;
-	int initial_bii;
-	u32 initial_offset;
-	int first_bii = rbm->bii;
-	u32 first_offset = rbm->offset;
+	int last_bii;
 	u32 offset;
 	u8 *buffer;
-	int n = 0;
-	int iters = rbm->rgd->rd_length;
+	bool wrapped = false;
 	int ret;
 	struct gfs2_bitmap *bi;
 	struct gfs2_extent maxext = { .rbm.rgd = rbm->rgd, };
 
-	/* If we are not starting at the beginning of a bitmap, then we
-	 * need to add one to the bitmap count to ensure that we search
-	 * the starting bitmap twice.
+	/*
+	 * Determine the last bitmap to search.  If we're not starting at the
+	 * beginning of a bitmap, we need to search that bitmap twice to scan
+	 * the entire resource group.
 	 */
-	if (rbm->offset != 0)
-		iters++;
+	last_bii = rbm->bii - (rbm->offset == 0);
 
 	while(1) {
 		bi = rbm_bi(rbm);
@@ -1761,47 +1758,46 @@ static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
 		WARN_ON(!buffer_uptodate(bh));
 		if (state != GFS2_BLKST_UNLINKED && bi->bi_clone)
 			buffer = bi->bi_clone + bi->bi_offset;
-		initial_offset = rbm->offset;
 		offset = gfs2_bitfit(buffer, bi->bi_bytes, rbm->offset, state);
-		if (offset == BFITNOENT)
-			goto bitmap_full;
+		if (offset == BFITNOENT) {
+			if (state == GFS2_BLKST_FREE && rbm->offset == 0)
+				set_bit(GBF_FULL, &bi->bi_flags);
+			goto next_bitmap;
+		}
 		rbm->offset = offset;
 		if (ip == NULL)
 			return 0;
 
-		initial_bii = rbm->bii;
 		ret = gfs2_reservation_check_and_update(rbm, ip,
 							minext ? *minext : 0,
 							&maxext);
 		if (ret == 0)
 			return 0;
-		if (ret > 0) {
-			n += (rbm->bii - initial_bii);
+		if (ret > 0)
 			goto next_iter;
-		}
 		if (ret == -E2BIG) {
 			rbm->bii = 0;
 			rbm->offset = 0;
-			n += (rbm->bii - initial_bii);
 			goto res_covered_end_of_rgrp;
 		}
 		return ret;
 
-bitmap_full:	/* Mark bitmap as full and fall through */
-		if ((state == GFS2_BLKST_FREE) && initial_offset == 0)
-			set_bit(GBF_FULL, &bi->bi_flags);
-
 next_bitmap:	/* Find next bitmap in the rgrp */
 		rbm->offset = 0;
 		rbm->bii++;
 		if (rbm->bii == rbm->rgd->rd_length)
 			rbm->bii = 0;
 res_covered_end_of_rgrp:
-		if ((rbm->bii == 0) && nowrap)
-			break;
-		n++;
+		if (rbm->bii == 0) {
+			if (wrapped)
+				break;
+			wrapped = true;
+			if (nowrap)
+				break;
+		}
 next_iter:
-		if (n >= iters)
+		/* Have we scanned the entire resource group? */
+		if (wrapped && rbm->bii > last_bii)
 			break;
 	}
 
@@ -1811,8 +1807,8 @@ static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
 	/* If the extent was too small, and it's smaller than the smallest
 	   to have failed before, remember for future reference that it's
 	   useless to search this rgrp again for this amount or more. */
-	if ((first_offset == 0) && (first_bii == 0) &&
-	    (*minext < rbm->rgd->rd_extfail_pt))
+	if (wrapped && (scan_from_start || rbm->bii > last_bii) &&
+	    *minext < rbm->rgd->rd_extfail_pt)
 		rbm->rgd->rd_extfail_pt = *minext;
 
 	/* If the maximum extent we found is big enough to fulfill the
-- 
2.20.1

