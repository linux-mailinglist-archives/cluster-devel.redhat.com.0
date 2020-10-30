Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EC28F2A108F
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Oct 2020 22:52:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604094740;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jilINlb9D1PWsmqwF7mjn8sHEb1ul3wwcTXB2zgpdXw=;
	b=iWvSbUtO8x9fX1gSAM7syViXP9Wvp78ObD/mzKGB35l3uKtDiLxtaLffn/o9p3f0lBCPw4
	qkY4CVK61qjvoA31RkLSPHY9WBiAqj+VAtLsikYLGbJ8OtHiYJYSb5OiipvGiLDXh/3d3W
	cItYy4ZOrsTsim9K+DlLd6/1IXbp6nw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-Mda0gWGnNyaWACgDybQ-hA-1; Fri, 30 Oct 2020 17:52:18 -0400
X-MC-Unique: Mda0gWGnNyaWACgDybQ-hA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D63A1100670B;
	Fri, 30 Oct 2020 21:52:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C731B672C0;
	Fri, 30 Oct 2020 21:52:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B42E25811C;
	Fri, 30 Oct 2020 21:52:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ULqEr9024098 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 17:52:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B316B4149; Fri, 30 Oct 2020 21:52:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E832B60BE2;
	Fri, 30 Oct 2020 21:52:10 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 30 Oct 2020 22:51:44 +0100
Message-Id: <20201030215152.1567790-10-agruenba@redhat.com>
In-Reply-To: <20201030215152.1567790-1-agruenba@redhat.com>
References: <20201030215152.1567790-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 09/17] gfs2: Also reflect single-block
	allocations in rgd->rd_extfail_pt
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Pass a non-NULL minext to gfs2_rbm_find even for single-block allocations.  In
gfs2_rbm_find, also set rgd->rd_extfail_pt when a single-block allocation
fails in a resource group: there is no reason for treating that case
differently.  In gfs2_reservation_check_and_update, only check how many free
blocks we have if more than one block is requested; we already know there's at
least one free block.

In addition, when allocating N blocks fails in gfs2_rbm_find, we need to set
rd_extfail_pt to N - 1 rather than N:  rd_extfail_pt defines the biggest
allocation that might still succeed.

Finally, reset rd_extfail_pt when updating the resource group statistics in
update_rgrp_lvb, as we already do in gfs2_rgrp_bh_get.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/rgrp.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 5f72ae9677a7..8ed72a8dbb94 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1274,6 +1274,8 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
 	rgd->rd_free = be32_to_cpu(rgd->rd_rgl->rl_free);
 	rgrp_set_bitmap_flags(rgd);
 	rgd->rd_free_clone = rgd->rd_free;
+	/* max out the rgrp allocation failure point */
+	rgd->rd_extfail_pt = rgd->rd_free;
 	rgd->rd_dinodes = be32_to_cpu(rgd->rd_rgl->rl_dinodes);
 	rgd->rd_igeneration = be64_to_cpu(rgd->rd_rgl->rl_igeneration);
 	return 0;
@@ -1669,7 +1671,7 @@ static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
 	 * If we have a minimum extent length, then skip over any extent
 	 * which is less than the min extent length in size.
 	 */
-	if (minext) {
+	if (minext > 1) {
 		extlen = gfs2_free_extlen(rbm, minext);
 		if (extlen <= maxext->len)
 			goto fail;
@@ -1704,7 +1706,7 @@ static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
  * gfs2_rbm_find - Look for blocks of a particular state
  * @rbm: Value/result starting position and final position
  * @state: The state which we want to find
- * @minext: Pointer to the requested extent length (NULL for a single block)
+ * @minext: Pointer to the requested extent length
  *          This is updated to be the actual reservation size.
  * @ip: If set, check for reservations
  * @nowrap: Stop looking at the end of the rgrp, rather than wrapping
@@ -1760,8 +1762,7 @@ static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
 		if (ip == NULL)
 			return 0;
 
-		ret = gfs2_reservation_check_and_update(rbm, ip,
-							minext ? *minext : 0,
+		ret = gfs2_reservation_check_and_update(rbm, ip, *minext,
 							&maxext);
 		if (ret == 0)
 			return 0;
@@ -1793,7 +1794,7 @@ static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
 			break;
 	}
 
-	if (minext == NULL || state != GFS2_BLKST_FREE)
+	if (state != GFS2_BLKST_FREE)
 		return -ENOSPC;
 
 	/* If the extent was too small, and it's smaller than the smallest
@@ -1801,7 +1802,7 @@ static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
 	   useless to search this rgrp again for this amount or more. */
 	if (wrapped && (scan_from_start || rbm->bii > last_bii) &&
 	    *minext < rbm->rgd->rd_extfail_pt)
-		rbm->rgd->rd_extfail_pt = *minext;
+		rbm->rgd->rd_extfail_pt = *minext - 1;
 
 	/* If the maximum extent we found is big enough to fulfill the
 	   minimum requirements, use it anyway. */
@@ -2375,14 +2376,15 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 	struct buffer_head *dibh;
 	struct gfs2_rbm rbm = { .rgd = ip->i_res.rs_rgd, };
 	u64 block; /* block, within the file system scope */
+	u32 minext = 1;
 	int error;
 
 	gfs2_set_alloc_start(&rbm, ip, dinode);
-	error = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, NULL, ip, false);
+	error = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &minext, ip, false);
 
 	if (error == -ENOSPC) {
 		gfs2_set_alloc_start(&rbm, ip, dinode);
-		error = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, NULL, NULL, false);
+		error = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &minext, NULL, false);
 	}
 
 	/* Since all blocks are reserved in advance, this shouldn't happen */
-- 
2.26.2

