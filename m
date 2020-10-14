Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 71BE928DE29
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 11:58:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602669538;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lef6dMkMi4Gcy8gLEPxoOXWJ93R4gT2giwEhP3lAchQ=;
	b=cUUB0/63JHI6QjJfP/f+Ilpe4OBi8Vl1HEa11d2R/y8ql4m05aVAFAgFIxv3G2NlgwEEfM
	jJT4vCU+I0giPeDFQlV6987vM435WEJlP5kD7VrSZE2rRJWNmIAMkaBOqbLoYHy+/gomSs
	aNuztlawCPG+4IXtPRFGFmaveSz+qyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-u4DyrMSKPSSelEa9-fdiZw-1; Wed, 14 Oct 2020 05:58:56 -0400
X-MC-Unique: u4DyrMSKPSSelEa9-fdiZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B741100746B;
	Wed, 14 Oct 2020 09:58:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47B1E100239A;
	Wed, 14 Oct 2020 09:58:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3285318095FF;
	Wed, 14 Oct 2020 09:58:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09E9wrFu001442 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 05:58:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 129F076669; Wed, 14 Oct 2020 09:58:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F23050B44;
	Wed, 14 Oct 2020 09:58:52 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Oct 2020 11:58:25 +0200
Message-Id: <20201014095833.1035870-10-agruenba@redhat.com>
In-Reply-To: <20201014095833.1035870-1-agruenba@redhat.com>
References: <20201014095833.1035870-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC 09/17] gfs2: Also reflect single-block
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Pass a non-NULL minext to gfs2_rbm_find even for single-block allocations.  In
gfs2_rbm_find, set rgd->rd_extfail_pt to 1 also when a single-block allocation
fails in a resource group: there is no reason for treating that case
differently.  In gfs2_reservation_check_and_update, only check how many free
blocks we have if more than one block is requested; we already know there's at
least one free block.

In addition, when allocating N blocks fails in gfs2_rbm_find, we need to set
rd_extfail_pt to N - 1 rather than N:  rd_extfail_pt defines the biggest
allocation that might still succeed.

Finally, reset rd_extfail_pt when updating the resource group statistics in
update_rgrp_lvb, as already done in gfs2_rgrp_bh_get.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/rgrp.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index dba15d25ff96..05c97f8a078a 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1278,6 +1278,8 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
 	rgd->rd_free = be32_to_cpu(rgd->rd_rgl->rl_free);
 	rgrp_set_bitmap_flags(rgd);
 	rgd->rd_free_clone = rgd->rd_free;
+	/* max out the rgrp allocation failure point */
+	rgd->rd_extfail_pt = rgd->rd_free;
 	rgd->rd_dinodes = be32_to_cpu(rgd->rd_rgl->rl_dinodes);
 	rgd->rd_igeneration = be64_to_cpu(rgd->rd_rgl->rl_igeneration);
 	return 0;
@@ -1673,7 +1675,7 @@ static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
 	 * If we have a minimum extent length, then skip over any extent
 	 * which is less than the min extent length in size.
 	 */
-	if (minext) {
+	if (minext > 1) {
 		extlen = gfs2_free_extlen(rbm, minext);
 		if (extlen <= maxext->len)
 			goto fail;
@@ -1708,7 +1710,7 @@ static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
  * gfs2_rbm_find - Look for blocks of a particular state
  * @rbm: Value/result starting position and final position
  * @state: The state which we want to find
- * @minext: Pointer to the requested extent length (NULL for a single block)
+ * @minext: Pointer to the requested extent length
  *          This is updated to be the actual reservation size.
  * @ip: If set, check for reservations
  * @nowrap: Stop looking at the end of the rgrp, rather than wrapping
@@ -1764,8 +1766,7 @@ static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
 		if (ip == NULL)
 			return 0;
 
-		ret = gfs2_reservation_check_and_update(rbm, ip,
-							minext ? *minext : 0,
+		ret = gfs2_reservation_check_and_update(rbm, ip, *minext,
 							&maxext);
 		if (ret == 0)
 			return 0;
@@ -1797,7 +1798,7 @@ static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
 			break;
 	}
 
-	if (minext == NULL || state != GFS2_BLKST_FREE)
+	if (state != GFS2_BLKST_FREE)
 		return -ENOSPC;
 
 	/* If the extent was too small, and it's smaller than the smallest
@@ -1805,7 +1806,7 @@ static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
 	   useless to search this rgrp again for this amount or more. */
 	if (wrapped && (scan_from_start || rbm->bii > last_bii) &&
 	    *minext < rbm->rgd->rd_extfail_pt)
-		rbm->rgd->rd_extfail_pt = *minext;
+		rbm->rgd->rd_extfail_pt = *minext - 1;
 
 	/* If the maximum extent we found is big enough to fulfill the
 	   minimum requirements, use it anyway. */
@@ -2382,14 +2383,15 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
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

