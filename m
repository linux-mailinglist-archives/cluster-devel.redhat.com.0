Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 79BA328DE2B
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 11:59:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602669540;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dWMenG/+QZtfpbYwo9SsqAItofsQ3MZLWgyoDRx2+fg=;
	b=WEku8dQYCxwRq4SXnVjvSeUIq5JvQGG8r1lG6R61kbomNtE0hZ7o9choSNpp22ALldzIlq
	Rnw40uEL80Md+AIarPLBuSTpU1Dvi+x0f31xWiO/jIU6oghTuN+2kDQYbaX/hR58tH3iqm
	M5sBrBmcgx4WvtmXF6tkxfdF7oeUCOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-pJoCmkhqMZ2rJcjV_6gWQA-1; Wed, 14 Oct 2020 05:58:58 -0400
X-MC-Unique: pJoCmkhqMZ2rJcjV_6gWQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03EA5800597;
	Wed, 14 Oct 2020 09:58:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E68A51002391;
	Wed, 14 Oct 2020 09:58:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D07B0181A06B;
	Wed, 14 Oct 2020 09:58:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09E9ws7m001454 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 05:58:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3188376669; Wed, 14 Oct 2020 09:58:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CD8C50B44;
	Wed, 14 Oct 2020 09:58:53 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Oct 2020 11:58:26 +0200
Message-Id: <20201014095833.1035870-11-agruenba@redhat.com>
In-Reply-To: <20201014095833.1035870-1-agruenba@redhat.com>
References: <20201014095833.1035870-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC 10/17] gfs2: Only pass reservation down to
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 05c97f8a078a..227a24eb83bf 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -79,7 +79,7 @@ static const char valid_change[16] = {
 };
 
 static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
-			 const struct gfs2_inode *ip, bool nowrap);
+			 struct gfs2_blkreserv *rs, bool nowrap);
 
 
 /**
@@ -1587,7 +1587,7 @@ static void rg_mblk_search(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip,
 	if (WARN_ON(gfs2_rbm_from_block(&rbm, goal)))
 		return;
 
-	ret = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &extlen, ip, true);
+	ret = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &extlen, &ip->i_res, true);
 	if (ret == 0) {
 		rs->rs_start = gfs2_rbm_to_block(&rbm);
 		rs->rs_free = extlen;
@@ -1603,7 +1603,7 @@ static void rg_mblk_search(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip,
  * @rgd: The resource group
  * @block: The starting block
  * @length: The required length
- * @ip: Ignore any reservations for this inode
+ * @ignore_rs: Reservation to ignore
  *
  * If the block does not appear in any reservation, then return the
  * block number unchanged. If it does appear in the reservation, then
@@ -1613,7 +1613,7 @@ static void rg_mblk_search(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip,
 
 static u64 gfs2_next_unreserved_block(struct gfs2_rgrpd *rgd, u64 block,
 				      u32 length,
-				      const struct gfs2_inode *ip)
+				      struct gfs2_blkreserv *ignore_rs)
 {
 	struct gfs2_blkreserv *rs;
 	struct rb_node *n;
@@ -1633,7 +1633,7 @@ static u64 gfs2_next_unreserved_block(struct gfs2_rgrpd *rgd, u64 block,
 	}
 
 	if (n) {
-		while ((rs_cmp(block, length, rs) == 0) && (&ip->i_res != rs)) {
+		while (rs_cmp(block, length, rs) == 0 && rs != ignore_rs) {
 			block = rs->rs_start + rs->rs_free;
 			n = n->rb_right;
 			if (n == NULL)
@@ -1649,7 +1649,7 @@ static u64 gfs2_next_unreserved_block(struct gfs2_rgrpd *rgd, u64 block,
 /**
  * gfs2_reservation_check_and_update - Check for reservations during block alloc
  * @rbm: The current position in the resource group
- * @ip: The inode for which we are searching for blocks
+ * @rs: Our own reservation
  * @minext: The minimum extent length
  * @maxext: A pointer to the maximum extent structure
  *
@@ -1663,7 +1663,7 @@ static u64 gfs2_next_unreserved_block(struct gfs2_rgrpd *rgd, u64 block,
  */
 
 static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
-					     const struct gfs2_inode *ip,
+					     struct gfs2_blkreserv *rs,
 					     u32 minext,
 					     struct gfs2_extent *maxext)
 {
@@ -1685,7 +1685,7 @@ static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
 	 * Check the extent which has been found against the reservations
 	 * and skip if parts of it are already reserved
 	 */
-	nblock = gfs2_next_unreserved_block(rbm->rgd, block, extlen, ip);
+	nblock = gfs2_next_unreserved_block(rbm->rgd, block, extlen, rs);
 	if (nblock == block) {
 		if (!minext || extlen >= minext)
 			return 0;
@@ -1712,7 +1712,7 @@ static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
  * @state: The state which we want to find
  * @minext: Pointer to the requested extent length
  *          This is updated to be the actual reservation size.
- * @ip: If set, check for reservations
+ * @rs: Our own reservation (NULL to skip checking reservations)
  * @nowrap: Stop looking at the end of the rgrp, rather than wrapping
  *          around until we've reached the starting point.
  *
@@ -1726,7 +1726,7 @@ static int gfs2_reservation_check_and_update(struct gfs2_rbm *rbm,
  */
 
 static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
-			 const struct gfs2_inode *ip, bool nowrap)
+			 struct gfs2_blkreserv *rs, bool nowrap)
 {
 	bool scan_from_start = rbm->bii == 0 && rbm->offset == 0;
 	struct buffer_head *bh;
@@ -1763,10 +1763,10 @@ static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
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
@@ -2387,7 +2387,7 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 	int error;
 
 	gfs2_set_alloc_start(&rbm, ip, dinode);
-	error = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &minext, ip, false);
+	error = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &minext, &ip->i_res, false);
 
 	if (error == -ENOSPC) {
 		gfs2_set_alloc_start(&rbm, ip, dinode);
-- 
2.26.2

