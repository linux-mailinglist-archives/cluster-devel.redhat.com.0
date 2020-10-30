Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 59E2F2A1097
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Oct 2020 22:53:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604094819;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XkAh8h8Z5gYQ8M/l5Xm9xBFiuHaI0PK6u64CT7Kgdnk=;
	b=XOYQPTDNojzrOuHarlVoTqvrClFfAfXv5eMwJrcvkgKBiqVUCShk9SrLIJ+/ckU+mdgrvy
	Gd+D4CCq00TFPag9BYjnJ0Ws/WoDA0YjaTfetLr00yF+bNbaCcW3A5AEMIkvfNQgj5XqPm
	wLODv9dXOxwJGZJ1ENNMJz3zd0gPny8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-Dj3mbO5BPSKZD2Dr9G4O_w-1; Fri, 30 Oct 2020 17:53:37 -0400
X-MC-Unique: Dj3mbO5BPSKZD2Dr9G4O_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98514760F3;
	Fri, 30 Oct 2020 21:53:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86C6F19D61;
	Fri, 30 Oct 2020 21:53:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 448F458112;
	Fri, 30 Oct 2020 21:53:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ULrLLE024260 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 17:53:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B9616672C0; Fri, 30 Oct 2020 21:53:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.192.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D1DB68433;
	Fri, 30 Oct 2020 21:53:09 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri, 30 Oct 2020 22:51:50 +0100
Message-Id: <20201030215152.1567790-16-agruenba@redhat.com>
In-Reply-To: <20201030215152.1567790-1-agruenba@redhat.com>
References: <20201030215152.1567790-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 15/17] gfs2: Add local resource group locking
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Bob Peterson <rpeterso@redhat.com>

Prepare for treating resource group glocks as exclusive among nodes but
shared among all tasks running on a node: introduce another layer of
node-specific locking that the local tasks can use to coordinate their
accesses.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/incore.h |  2 ++
 fs/gfs2/lops.c   |  6 +++++-
 fs/gfs2/rgrp.c   | 53 ++++++++++++++++++++++++++++++++++++++++++------
 fs/gfs2/rgrp.h   |  4 ++++
 4 files changed, 58 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 22c000285804..7acfa60783e2 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -20,6 +20,7 @@
 #include <linux/percpu.h>
 #include <linux/lockref.h>
 #include <linux/rhashtable.h>
+#include <linux/mutex.h>
 
 #define DIO_WAIT	0x00000010
 #define DIO_METADATA	0x00000020
@@ -123,6 +124,7 @@ struct gfs2_rgrpd {
 #define GFS2_RDF_PREFERRED	0x80000000 /* This rgrp is preferred */
 #define GFS2_RDF_MASK		0xf0000000 /* mask for internal flags */
 	spinlock_t rd_rsspin;           /* protects reservation related vars */
+	struct mutex rd_mutex;
 	struct rb_root rd_rstree;       /* multi-block reservation tree */
 };
 
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index a0ef2b4019a9..d522f118152b 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -75,8 +75,9 @@ static void maybe_release_space(struct gfs2_bufdata *bd)
 	unsigned int index = bd->bd_bh->b_blocknr - gl->gl_name.ln_number;
 	struct gfs2_bitmap *bi = rgd->rd_bits + index;
 
+	rgrp_lock_local(rgd);
 	if (bi->bi_clone == NULL)
-		return;
+		goto out;
 	if (sdp->sd_args.ar_discard)
 		gfs2_rgrp_send_discards(sdp, rgd->rd_data0, bd->bd_bh, bi, 1, NULL);
 	memcpy(bi->bi_clone + bi->bi_offset,
@@ -85,6 +86,9 @@ static void maybe_release_space(struct gfs2_bufdata *bd)
 	rgd->rd_free_clone = rgd->rd_free;
 	BUG_ON(rgd->rd_free_clone < rgd->rd_reserved);
 	rgd->rd_extfail_pt = rgd->rd_free;
+
+out:
+	rgrp_unlock_local(rgd);
 }
 
 /**
diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index e503c00bd180..9e033cdb8096 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -920,6 +920,7 @@ static int read_rindex_entry(struct gfs2_inode *ip)
 	rgd->rd_data = be32_to_cpu(buf.ri_data);
 	rgd->rd_bitbytes = be32_to_cpu(buf.ri_bitbytes);
 	spin_lock_init(&rgd->rd_rsspin);
+	mutex_init(&rgd->rd_mutex);
 
 	error = compute_bitstructs(rgd);
 	if (error)
@@ -1442,9 +1443,11 @@ int gfs2_fitrim(struct file *filp, void __user *argp)
 			/* Trim each bitmap in the rgrp */
 			for (x = 0; x < rgd->rd_length; x++) {
 				struct gfs2_bitmap *bi = rgd->rd_bits + x;
+				rgrp_lock_local(rgd);
 				ret = gfs2_rgrp_send_discards(sdp,
 						rgd->rd_data0, NULL, bi, minlen,
 						&amt);
+				rgrp_unlock_local(rgd);
 				if (ret) {
 					gfs2_glock_dq_uninit(&gh);
 					goto out;
@@ -1456,9 +1459,11 @@ int gfs2_fitrim(struct file *filp, void __user *argp)
 			ret = gfs2_trans_begin(sdp, RES_RG_HDR, 0);
 			if (ret == 0) {
 				bh = rgd->rd_bits[0].bi_bh;
+				rgrp_lock_local(rgd);
 				rgd->rd_flags |= GFS2_RGF_TRIMMED;
 				gfs2_trans_add_meta(rgd->rd_gl, bh);
 				gfs2_rgrp_out(rgd, bh->b_data);
+				rgrp_unlock_local(rgd);
 				gfs2_trans_end(sdp);
 			}
 		}
@@ -2043,7 +2048,8 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 	struct gfs2_sbd *sdp = GFS2_SB(&ip->i_inode);
 	struct gfs2_rgrpd *begin = NULL;
 	struct gfs2_blkreserv *rs = &ip->i_res;
-	int error = 0, rg_locked, flags = 0;
+	int error = 0, flags = 0;
+	bool rg_locked;
 	u64 last_unlinked = NO_BLOCK;
 	u32 target = ap->target;
 	int loops = 0;
@@ -2072,10 +2078,10 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 	while (loops < 3) {
 		struct gfs2_rgrpd *rgd;
 
-		rg_locked = 1;
-
-		if (!gfs2_glock_is_locked_by_me(rs->rs_rgd->rd_gl)) {
-			rg_locked = 0;
+		rg_locked = gfs2_glock_is_locked_by_me(rs->rs_rgd->rd_gl);
+		if (rg_locked) {
+			rgrp_lock_local(rs->rs_rgd);
+		} else {
 			if (skip && skip--)
 				goto next_rgrp;
 			if (!gfs2_rs_active(rs)) {
@@ -2092,12 +2098,14 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 						   &ip->i_rgd_gh);
 			if (unlikely(error))
 				return error;
+			rgrp_lock_local(rs->rs_rgd);
 			if (!gfs2_rs_active(rs) && (loops < 2) &&
 			    gfs2_rgrp_congested(rs->rs_rgd, loops))
 				goto skip_rgrp;
 			if (sdp->sd_args.ar_rgrplvb) {
 				error = update_rgrp_lvb(rs->rs_rgd);
 				if (unlikely(error)) {
+					rgrp_unlock_local(rs->rs_rgd);
 					gfs2_glock_dq_uninit(&ip->i_rgd_gh);
 					return error;
 				}
@@ -2135,6 +2143,7 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 			rs->rs_reserved = blocks_available;
 		rgd->rd_reserved += rs->rs_reserved;
 		spin_unlock(&rgd->rd_rsspin);
+		rgrp_unlock_local(rs->rs_rgd);
 		return 0;
 check_rgrp:
 		/* Check for unlinked inodes which can be reclaimed */
@@ -2142,6 +2151,8 @@ int gfs2_inplace_reserve(struct gfs2_inode *ip, struct gfs2_alloc_parms *ap)
 			try_rgrp_unlink(rs->rs_rgd, &last_unlinked,
 					ip->i_no_addr);
 skip_rgrp:
+		rgrp_unlock_local(rs->rs_rgd);
+
 		/* Drop reservation, if we couldn't use reserved rgrp */
 		if (gfs2_rs_active(rs))
 			gfs2_rs_deltree(rs);
@@ -2286,6 +2297,7 @@ void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_rgrpd *rgd,
 	struct gfs2_blkreserv *trs;
 	const struct rb_node *n;
 
+	spin_lock(&rgd->rd_rsspin);
 	gfs2_print_dbg(seq, "%s R: n:%llu f:%02x b:%u/%u i:%u q:%u r:%u e:%u\n",
 		       fs_id_buf,
 		       (unsigned long long)rgd->rd_addr, rgd->rd_flags,
@@ -2299,7 +2311,6 @@ void gfs2_rgrp_dump(struct seq_file *seq, struct gfs2_rgrpd *rgd,
 			       be32_to_cpu(rgl->rl_free),
 			       be32_to_cpu(rgl->rl_dinodes));
 	}
-	spin_lock(&rgd->rd_rsspin);
 	for (n = rb_first(&rgd->rd_rstree); n; n = rb_next(&trs->rs_node)) {
 		trs = rb_entry(n, struct gfs2_blkreserv, rs_node);
 		dump_rs(seq, trs, fs_id_buf);
@@ -2414,6 +2425,7 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 
 	BUG_ON(ip->i_res.rs_reserved < *nblocks);
 
+	rgrp_lock_local(rbm.rgd);
 	if (gfs2_rs_active(&ip->i_res)) {
 		gfs2_set_alloc_start(&rbm, ip, dinode);
 		error = gfs2_rbm_find(&rbm, GFS2_BLKST_FREE, &minext, &ip->i_res, false);
@@ -2470,6 +2482,7 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 
 	gfs2_trans_add_meta(rbm.rgd->rd_gl, rbm.rgd->rd_bits[0].bi_bh);
 	gfs2_rgrp_out(rbm.rgd, rbm.rgd->rd_bits[0].bi_bh->b_data);
+	rgrp_unlock_local(rbm.rgd);
 
 	gfs2_statfs_change(sdp, 0, -(s64)*nblocks, dinode ? 1 : 0);
 	if (dinode)
@@ -2483,6 +2496,7 @@ int gfs2_alloc_blocks(struct gfs2_inode *ip, u64 *bn, unsigned int *nblocks,
 	return 0;
 
 rgrp_error:
+	rgrp_unlock_local(rbm.rgd);
 	gfs2_rgrp_error(rbm.rgd);
 	return -EIO;
 }
@@ -2502,12 +2516,14 @@ void __gfs2_free_blocks(struct gfs2_inode *ip, struct gfs2_rgrpd *rgd,
 {
 	struct gfs2_sbd *sdp = GFS2_SB(&ip->i_inode);
 
+	rgrp_lock_local(rgd);
 	rgblk_free(sdp, rgd, bstart, blen, GFS2_BLKST_FREE);
 	trace_gfs2_block_alloc(ip, rgd, bstart, blen, GFS2_BLKST_FREE);
 	rgd->rd_free += blen;
 	rgd->rd_flags &= ~GFS2_RGF_TRIMMED;
 	gfs2_trans_add_meta(rgd->rd_gl, rgd->rd_bits[0].bi_bh);
 	gfs2_rgrp_out(rgd, rgd->rd_bits[0].bi_bh->b_data);
+	rgrp_unlock_local(rgd);
 
 	/* Directories keep their data in the metadata address space */
 	if (meta || ip->i_depth || gfs2_is_jdata(ip))
@@ -2543,17 +2559,20 @@ void gfs2_unlink_di(struct inode *inode)
 	rgd = gfs2_blk2rgrpd(sdp, blkno, true);
 	if (!rgd)
 		return;
+	rgrp_lock_local(rgd);
 	rgblk_free(sdp, rgd, blkno, 1, GFS2_BLKST_UNLINKED);
 	trace_gfs2_block_alloc(ip, rgd, blkno, 1, GFS2_BLKST_UNLINKED);
 	gfs2_trans_add_meta(rgd->rd_gl, rgd->rd_bits[0].bi_bh);
 	gfs2_rgrp_out(rgd, rgd->rd_bits[0].bi_bh->b_data);
 	be32_add_cpu(&rgd->rd_rgl->rl_unlinked, 1);
+	rgrp_unlock_local(rgd);
 }
 
 void gfs2_free_di(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip)
 {
 	struct gfs2_sbd *sdp = rgd->rd_sbd;
 
+	rgrp_lock_local(rgd);
 	rgblk_free(sdp, rgd, ip->i_no_addr, 1, GFS2_BLKST_FREE);
 	if (!rgd->rd_dinodes)
 		gfs2_consist_rgrpd(rgd);
@@ -2562,6 +2581,7 @@ void gfs2_free_di(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip)
 
 	gfs2_trans_add_meta(rgd->rd_gl, rgd->rd_bits[0].bi_bh);
 	gfs2_rgrp_out(rgd, rgd->rd_bits[0].bi_bh->b_data);
+	rgrp_unlock_local(rgd);
 	be32_add_cpu(&rgd->rd_rgl->rl_unlinked, -1);
 
 	gfs2_statfs_change(sdp, 0, +1, -1);
@@ -2576,6 +2596,10 @@ void gfs2_free_di(struct gfs2_rgrpd *rgd, struct gfs2_inode *ip)
  * @no_addr: The block number to check
  * @type: The block type we are looking for
  *
+ * The inode glock of @no_addr must be held.  The @type to check for is either
+ * GFS2_BLKST_DINODE or GFS2_BLKST_UNLINKED; checking for type GFS2_BLKST_FREE
+ * or GFS2_BLKST_USED would make no sense.
+ *
  * Returns: 0 if the block type matches the expected type
  *          -ESTALE if it doesn't match
  *          or -ve errno if something went wrong while checking
@@ -2601,6 +2625,12 @@ int gfs2_check_blk_type(struct gfs2_sbd *sdp, u64 no_addr, unsigned int type)
 	if (WARN_ON_ONCE(error))
 		goto fail;
 
+	/*
+	 * No need to take the local resource group lock here; the inode glock
+	 * of @no_addr provides the necessary synchronization in case the block
+	 * is an inode.  (In case the block is not an inode, the block type
+	 * will not match the @type we are looking for.)
+	 */
 	if (gfs2_testbit(&rbm, false) != type)
 		error = -ESTALE;
 
@@ -2723,3 +2753,14 @@ void gfs2_rlist_free(struct gfs2_rgrp_list *rlist)
 	}
 }
 
+void rgrp_lock_local(struct gfs2_rgrpd *rgd)
+{
+	BUG_ON(!gfs2_glock_is_held_excl(rgd->rd_gl) &&
+	       !test_bit(SDF_NORECOVERY, &rgd->rd_sbd->sd_flags));
+	mutex_lock(&rgd->rd_mutex);
+}
+
+void rgrp_unlock_local(struct gfs2_rgrpd *rgd)
+{
+	mutex_unlock(&rgd->rd_mutex);
+}
diff --git a/fs/gfs2/rgrp.h b/fs/gfs2/rgrp.h
index be1b2034f5ee..a6855fd796e0 100644
--- a/fs/gfs2/rgrp.h
+++ b/fs/gfs2/rgrp.h
@@ -88,4 +88,8 @@ static inline int rgrp_contains_block(struct gfs2_rgrpd *rgd, u64 block)
 }
 
 extern void check_and_update_goal(struct gfs2_inode *ip);
+
+extern void rgrp_lock_local(struct gfs2_rgrpd *rgd);
+extern void rgrp_unlock_local(struct gfs2_rgrpd *rgd);
+
 #endif /* __RGRP_DOT_H__ */
-- 
2.26.2

