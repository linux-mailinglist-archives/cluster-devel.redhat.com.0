Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 09E1935ADCA
	for <lists+cluster-devel@lfdr.de>; Sat, 10 Apr 2021 15:49:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618062564;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=lb5zlHrvTZly7L6yf73VMjWUjBuv+ZeTC/BqBxlr4jQ=;
	b=cdrIZwClskNrbb/yd7cobXB9GH4ndVrP5rOUxAQuk6necKmxIRq3YU9mwkPLUNEArP2Ume
	KgsLWnex7iOPttl+ge7Mpw4MaryI10Pw1pb+VKf0m0haDEFuUX0bnQJYWSIMJXxq2iYd8Z
	SquxIFDPpvm30Bqddw4pr4y54EbMjGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-B5kVkz1qPG-NoZ2blXStFg-1; Sat, 10 Apr 2021 09:49:23 -0400
X-MC-Unique: B5kVkz1qPG-NoZ2blXStFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B442F1856A63;
	Sat, 10 Apr 2021 13:49:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95F315D6D5;
	Sat, 10 Apr 2021 13:49:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B259E44A5B;
	Sat, 10 Apr 2021 13:49:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13ADn5Ib009969 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 10 Apr 2021 09:49:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 71A623A47; Sat, 10 Apr 2021 13:49:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C4595D736
	for <cluster-devel@redhat.com>; Sat, 10 Apr 2021 13:49:01 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5AD851C98
	for <cluster-devel@redhat.com>; Sat, 10 Apr 2021 13:49:01 +0000 (UTC)
Date: Sat, 10 Apr 2021 09:49:01 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <344305871.6577253.1618062541261.JavaMail.zimbra@redhat.com>
In-Reply-To: <1528588397.6568321.1618062440748.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.10.120.209, 10.4.195.15]
Thread-Topic: gfs2: allocate pages for clone bitmaps
Thread-Index: mIQB1KSEdUqH02qEEVvfxNL9NPRBwA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [gfs2 PATCH] gfs2: allocate pages for clone bitmaps
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Resource group (rgrp) bitmaps have in-core-only "clone" bitmaps that
ensure freed fs space from deletes are not reused until the transaction
is complete. Before this patch, these clone bitmaps were allocated with
kmalloc, but with the default 4K block size, kmalloc is wasteful because
of the way slab keeps track of them. As a matter of fact, kernel docs
only recommend slab for allocations "less than page size." See:
https://www.kernel.org/doc/html/v5.0/core-api/mm-api.html#mm-api-gfp-flags
In fact, if you turn on kernel slab debugging options, slab will give
you warnings that gfs2 should not do this.

This patch switches the clone bitmap allocations to alloc_page, which
has much less overhead and uses less memory. The down side is: if we
allocate a whole page for block sizes smaller than page size, we will
use more memory and it will be wasteful. But in general, we've always
recommended using block size = page size for efficiency and performance.

In a recent test I did with 24 simultaneous recursive file deletes,
on a large dataset (each working to delete a separate directory), this
patch yielded a 16 percent increase in speed. Total accumulated real
(clock) time of the test went from 41310 seconds (11.5 hours) down to
just 34742 seconds (9.65 hours) (This was lock_nolock on a single node).

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/incore.h |  2 +-
 fs/gfs2/lops.c   |  2 +-
 fs/gfs2/rgrp.c   | 25 +++++++++++++++----------
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index e6f820f146cb..a708094381ce 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -90,7 +90,7 @@ struct gfs2_log_operations {
  */
 struct gfs2_bitmap {
 	struct buffer_head *bi_bh;
-	char *bi_clone;
+	struct page *bi_clone;
 	unsigned long bi_flags;
 	u32 bi_offset;
 	u32 bi_start;
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index a82f4747aa8d..cf037f74e86f 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -81,7 +81,7 @@ static void maybe_release_space(struct gfs2_bufdata *bd)
 		goto out;
 	if (sdp->sd_args.ar_discard)
 		gfs2_rgrp_send_discards(sdp, rgd->rd_data0, bd->bd_bh, bi, 1, NULL);
-	memcpy(bi->bi_clone + bi->bi_offset,
+	memcpy(page_address(bi->bi_clone) + bi->bi_offset,
 	       bd->bd_bh->b_data + bi->bi_offset, bi->bi_bytes);
 	clear_bit(GBF_FULL, &bi->bi_flags);
 	rgd->rd_free_clone = rgd->rd_free;
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 2dab313442a7..e64aea44d02d 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -123,7 +123,8 @@ static inline void gfs2_setbit(const struct gfs2_rbm *rbm, bool do_clone,
 	*byte1 ^= (cur_state ^ new_state) << bit;
 
 	if (do_clone && bi->bi_clone) {
-		byte2 = bi->bi_clone + bi->bi_offset + (rbm->offset / GFS2_NBBY);
+		byte2 = page_address(bi->bi_clone) + bi->bi_offset +
+			(rbm->offset / GFS2_NBBY);
 		cur_state = (*byte2 >> bit) & GFS2_BIT_MASK;
 		*byte2 ^= (cur_state ^ new_state) << bit;
 	}
@@ -148,7 +149,7 @@ static inline u8 gfs2_testbit(const struct gfs2_rbm *rbm, bool use_clone)
 	unsigned int bit;
 
 	if (use_clone && bi->bi_clone)
-		buffer = bi->bi_clone;
+		buffer = page_address(bi->bi_clone);
 	else
 		buffer = bi->bi_bh->b_data;
 	buffer += bi->bi_offset;
@@ -392,7 +393,7 @@ static u32 gfs2_free_extlen(const struct gfs2_rbm *rrbm, u32 len)
 		bi = rbm_bi(&rbm);
 		start = bi->bi_bh->b_data;
 		if (bi->bi_clone)
-			start = bi->bi_clone;
+			start = page_address(bi->bi_clone);
 		start += bi->bi_offset;
 		end = start + bi->bi_bytes;
 		BUG_ON(rbm.offset & 3);
@@ -611,8 +612,10 @@ void gfs2_free_clones(struct gfs2_rgrpd *rgd)
 
 	for (x = 0; x < rgd->rd_length; x++) {
 		struct gfs2_bitmap *bi = rgd->rd_bits + x;
-		kfree(bi->bi_clone);
-		bi->bi_clone = NULL;
+		if (bi->bi_clone) {
+			__free_page(bi->bi_clone);
+			bi->bi_clone = NULL;
+		}
 	}
 }
 
@@ -1331,7 +1334,8 @@ int gfs2_rgrp_send_discards(struct gfs2_sbd *sdp, u64 offset,
 	u8 diff;
 
 	for (x = 0; x < bi->bi_bytes; x++) {
-		const u8 *clone = bi->bi_clone ? bi->bi_clone : bi->bi_bh->b_data;
+		const u8 *clone = bi->bi_clone ? page_address(bi->bi_clone) :
+			bi->bi_bh->b_data;
 		clone += bi->bi_offset;
 		clone += x;
 		if (bh) {
@@ -1775,7 +1779,7 @@ static int gfs2_rbm_find(struct gfs2_rbm *rbm, u8 state, u32 *minext,
 		buffer = bh->b_data + bi->bi_offset;
 		WARN_ON(!buffer_uptodate(bh));
 		if (state != GFS2_BLKST_UNLINKED && bi->bi_clone)
-			buffer = bi->bi_clone + bi->bi_offset;
+			buffer = page_address(bi->bi_clone) + bi->bi_offset;
 		offset = gfs2_bitfit(buffer, bi->bi_bytes, rbm->offset, state);
 		if (offset == BFITNOENT) {
 			if (state == GFS2_BLKST_FREE && rbm->offset == 0)
@@ -2277,9 +2281,10 @@ static void rgblk_free(struct gfs2_sbd *sdp, struct gfs2_rgrpd *rgd,
 		bi = rbm_bi(&rbm);
 		if (bi != bi_prev) {
 			if (!bi->bi_clone) {
-				bi->bi_clone = kmalloc(bi->bi_bh->b_size,
-						      GFP_NOFS | __GFP_NOFAIL);
-				memcpy(bi->bi_clone + bi->bi_offset,
+				bi->bi_clone = alloc_page(GFP_NOFS |
+							  __GFP_NOFAIL);
+				memcpy(page_address(bi->bi_clone) +
+				       bi->bi_offset,
 				       bi->bi_bh->b_data + bi->bi_offset,
 				       bi->bi_bytes);
 			}

