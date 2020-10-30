Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 77EE02A1091
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Oct 2020 22:52:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604094745;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dO80fdlc9qhUqWWFapp+NWpMcacF2Fd+hFTn+EbB0BM=;
	b=Q7JIgzu5ELjGfGLtKgrs4EPp7hjQT6oRLrR4Oy90d9M/tiHO+oEx1gxMkNB5DS2IDDKo3X
	xgT/2G0MLXyY+aKyInd1MlkYtQ3ehK9S2RVehB31ctEVMAGgApXox2eC6EhEOHibUy1Fjq
	W4PwFKw1c8ZZEK8FpEY7NxXPcYHP/lk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-g6Grz8nnM1a2R6Tt9k0c-A-1; Fri, 30 Oct 2020 17:52:23 -0400
X-MC-Unique: g6Grz8nnM1a2R6Tt9k0c-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5961A61181;
	Fri, 30 Oct 2020 21:52:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4807D7366C;
	Fri, 30 Oct 2020 21:52:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 34AB0181A86E;
	Fri, 30 Oct 2020 21:52:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ULqJTh024120 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 17:52:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 143646CE50; Fri, 30 Oct 2020 21:52:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 50C7768433;
	Fri, 30 Oct 2020 21:52:14 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 30 Oct 2020 22:51:45 +0100
Message-Id: <20201030215152.1567790-11-agruenba@redhat.com>
In-Reply-To: <20201030215152.1567790-1-agruenba@redhat.com>
References: <20201030215152.1567790-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 10/17] gfs2: Only pass reservation down to
	gfs2_rbm_find
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Only pass the current reservation down to gfs2_rbm_find rather than the entire
inode; we don't need any of the other information.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/rgrp.c | 26 +++++++++++++-------------
 fs/gfs2/rgrp.h |  2 +-
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 8ed72a8dbb94..4e0f8e2a59b1 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -79,7 +79,7 @@ static const char valid_change[16] = {
 };
 
 static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
-			 const struct gfs2_inode *ip, bool nowrap);
+			 struct gfs2_blkreserv *rs, bool nowrap);
 
 
 /**
@@ -1583,7 +1583,7 @@ static void rg_mblk_search(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip,
 	if (WARN_ON(gfs2_rbm_from_block(&rbm, goal)))
 		return;
 
-	ret = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &extlen, ip, true);
+	ret = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &extlen, &ip->i_res, true);
 	if (ret == 0) {
 		rs->rs_start = gfs2_rbm_to_block(&rbm);
 		rs->rs_free = extlen;
@@ -1599,7 +1599,7 @@ static void rg_mblk_search(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip,
  * @rgd: The resource group
  * @block: The starting block
  * @length: The required length
- * @ip: Ignore any reservations for this inode
+ * @ignore_rs: Reservation to ignore
  *
  * If the block does not appear in any reservation, then return the
  * block number unchanged. If it does appear in the reservation, then
@@ -1609,7 +1609,7 @@ static void rg_mblk_search(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip,
 
 static u64 gfs2_next_unreserved_block(struct gfs2_rgrpd *rgd, u64 block,
 				      u32 length,
-				      const struct gfs2_inode *ip)
+				      struct gfs2_blkreserv *ignore_rs)
 {
 	struct gfs2_blkreserv *rs;
 	struct rb_node *n;
@@ -1629,7 +1629,7 @@ static u64 gfs2_next_unreserved_block(struct gfs2_rgrpd *rgd, u64 block,
 	}
 
 	if (n) {
-		while ((rs_cmp(block, length, rs) == 0) && (&ip->i_res != rs)) {
+		while (rs_cmp(block, length, rs) == 0 && rs != ignore_rs) {
 			block = rs->rs_start + rs->rs_free;
 			n = n->rb_right;
 			if (n == NULL)
@@ -1645,7 +1645,7 @@ static u64 gfs2_next_unreserved_block(struct gfs2_rgrpd *rgd, u64 block,
 /**
  * gfs2_reservation_check_and_update - Check for reservations during block alloc
  * @rbm: The current position in the resource group
- * @ip: The inode for which we are searching for blocks
+ * @rs: Our own reservation
  * @minext: The minimum extent length
  * @maxext: A pointer to the maximum extent structure
  *
@@ -1659,7 +1659,7 @@ static u64 gfs2_next_unreserved_block(struct gfs2_rgrpd *rgd, u64 block,
  */
 
 static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
-					     const struct gfs2_inode *ip,
+					     struct gfs2_blkreserv *rs,
 					     u32 minext,
 					     struct gfs2_extent *maxext)
 {
@@ -1681,7 +1681,7 @@ static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
 	 * Check the extent which has been found against the reservations
 	 * and skip if parts of it are already reserved
 	 */
-	nblock = gfs2_next_unreserved_block(rbm->rgd, block, extlen, ip);
+	nblock = gfs2_next_unreserved_block(rbm->rgd, block, extlen, rs);
 	if (nblock == block) {
 		if (!minext || extlen >= minext)
 			return 0;
@@ -1708,7 +1708,7 @@ static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
  * @state: The state which we want to find
  * @minext: Pointer to the requested extent length
  *          This is updated to be the actual reservation size.
- * @ip: If set, check for reservations
+ * @rs: Our own reservation (NULL to skip checking for reservations)
  * @nowrap: Stop looking at the end of the rgrp, rather than wrapping
  *          around until we've reached the starting point.
  *
@@ -1722,7 +1722,7 @@ static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
  */
 
 static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
-			 const struct gfs2_inode *ip, bool nowrap)
+			 struct gfs2_blkreserv *rs, bool nowrap)
 {
 	bool scan_from_start = rbm->bii == 0 && rbm->offset == 0;
 	struct buffer_head *bh;
@@ -1759,10 +1759,10 @@ static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
 			goto next_bitmap;
 		}
 		rbm->offset = offset;
-		if (ip == NULL)
+		if (!rs)
 			return 0;
 
-		ret = gfs2_reservation_check_and_update(rbm, ip, *minext,
+		ret = gfs2_reservation_check_and_update(rbm, rs, *minext,
 							&maxext);
 		if (ret == 0)
 			return 0;
@@ -2380,7 +2380,7 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 	int error;
 
 	gfs2_set_alloc_start(&rbm, ip, dinode);
-	error = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &minext, ip, false);
+	error = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &minext, &ip->i_res, false);
 
 	if (error == -ENOSPC) {
 		gfs2_set_alloc_start(&rbm, ip, dinode);
diff --git a/fs/gfs2/rgrp.h b/fs/gfs2/rgrp.h
index 9a587ada51ed..be1b2034f5ee 100644
--- a/fs/gfs2/rgrp.h
+++ b/fs/gfs2/rgrp.h
@@ -77,7 +77,7 @@ extern int gfs2_fitrim(struct file *filp, void __user *argp);
 /* This is how to tell if a reservation is in the rgrp tree: */
 static inline bool gfs2_rs_active(const struct gfs2_blkreserv *rs)
 {
-	return rs && !RB_EMPTY_NODE(&rs->rs_node);
+	return !RB_EMPTY_NODE(&rs->rs_node);
 }
 
 static inline int rgrp_contains_block(struct gfs2_rgrpd *rgd, u64 block)
-- 
2.26.2

