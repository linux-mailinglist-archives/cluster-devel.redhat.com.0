Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2369E2DF1AD
	for <lists+cluster-devel@lfdr.de>; Sat, 19 Dec 2020 21:49:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608410985;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TJOwUQiWgIRulrD70TE+rvdGY+T4QbnDj3QZOV0s8ac=;
	b=dUI2FQt0g1Tw5Dk3UEenTFPFLq8ZpxJlN7Zmr7Z0Q3zXFd7evGVEh2Ihxs+QE1SUlnj5ri
	tZ2NyLXs7Ogg8eHjCnUju0BDMe+GN064f2i/DG6qxKJCoc5o6HJDLQD6TYsBvx0fA/doZn
	hujNfF14WOH89zTCNOSUqiBU0tEZ8z4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-x72PRY25MY6jTXpl_RwVYQ-1; Sat, 19 Dec 2020 15:49:43 -0500
X-MC-Unique: x72PRY25MY6jTXpl_RwVYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06A4D100558A;
	Sat, 19 Dec 2020 20:49:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC0EC5C1B4;
	Sat, 19 Dec 2020 20:49:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D97855002C;
	Sat, 19 Dec 2020 20:49:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BJKndjv020359 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 19 Dec 2020 15:49:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8BB7950C0A; Sat, 19 Dec 2020 20:49:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (ovpn-115-196.ams2.redhat.com [10.36.115.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5643F2DAD0;
	Sat, 19 Dec 2020 20:49:38 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat, 19 Dec 2020 21:48:48 +0100
Message-Id: <20201219204848.285781-21-agruenba@redhat.com>
In-Reply-To: <20201219204848.285781-1-agruenba@redhat.com>
References: <20201219204848.285781-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2 20/20] gfs2: Hand out revokes to
	transactions one by one
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

In the log, revokes are stored as a revoke descriptor (struct
gfs2_log_descriptor), followed by zero or more additional revoke blocks
(struct gfs2_meta_header).  On filesystems with a blocksize of 4k, the
revoke descriptor contains up to 503 revokes, and the metadata blocks
contain up to 509 revokes each.  We've so far been reserving space for revokes
in transactions on a block granularity, so a lot more space than needed was
being allocated and then immediately released again.

This patch switches to assigning revokes to transactions individually instead.
Initially, space for the revoke descriptor is reserved and handed out to
transactions.  When more revokes than that are reserved, additional revoke
blocks are added.  When the log is flushed, the space for the additional revoke
blocks is released, but we never release the revoke descriptor block.

Transactions may still reserve more revokes than they will actually need in the
end, but now we won't overshoot the target as much, and by only returning the
space for excess revokes at log flush time, we further reduce the amount of
contention between processes.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/incore.h     |   2 +-
 fs/gfs2/log.c        | 108 ++++++++++++++++++++++++++++++++++++-------
 fs/gfs2/log.h        |   6 ++-
 fs/gfs2/lops.c       |   8 ++--
 fs/gfs2/ops_fstype.c |   7 +++
 fs/gfs2/trans.c      |  32 ++++++++++---
 6 files changed, 135 insertions(+), 28 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 4298df94768a..5988d2235046 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -506,7 +506,6 @@ struct gfs2_trans {
 	unsigned int tr_num_buf_rm;
 	unsigned int tr_num_databuf_rm;
 	unsigned int tr_num_revoke;
-	unsigned int tr_num_revoke_rm;
 
 	struct list_head tr_list;
 	struct list_head tr_databuf;
@@ -832,6 +831,7 @@ struct gfs2_sbd {
 	atomic_t sd_log_thresh2;
 	atomic_t sd_log_blks_free;
 	atomic_t sd_log_blks_needed;
+	atomic_t sd_log_revokes_available;
 	wait_queue_head_t sd_log_waitq;
 	wait_queue_head_t sd_logd_waitq;
 
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index b0980769890e..e93afd8ac9ea 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -272,13 +272,16 @@ static void gfs2_ail_empty_tr(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
 			      struct list_head *head)
 {
 	struct gfs2_bufdata *bd;
+	unsigned int revokes = 0;
 
 	while (!list_empty(head)) {
 		bd = list_first_entry(head, struct gfs2_bufdata,
 				      bd_ail_st_list);
 		gfs2_assert(sdp, bd->bd_tr == tr);
 		gfs2_remove_from_ail(bd);
+		revokes++;
 	}
+	gfs2_log_release_revokes(sdp, revokes);
 }
 
 /**
@@ -445,6 +448,39 @@ bool gfs2_log_is_empty(struct gfs2_sbd *sdp) {
 	return atomic_read(&sdp->sd_log_blks_free) == sdp->sd_jdesc->jd_blocks;
 }
 
+static void gfs2_log_shrink_revokes(struct gfs2_sbd *sdp)
+{
+	unsigned int revokes = atomic_read(&sdp->sd_log_revokes_available);
+
+	while (revokes > sdp->sd_inptrs &&
+	       !atomic_try_cmpxchg(&sdp->sd_log_revokes_available,
+				   &revokes, revokes % sdp->sd_inptrs))
+		/* do nothing */ ;
+	if (revokes > sdp->sd_inptrs) {
+		gfs2_log_release(sdp, revokes / sdp->sd_inptrs);
+		revokes = revokes % sdp->sd_inptrs;
+	}
+	gfs2_assert_withdraw(sdp, revokes == sdp->sd_ldptrs);
+}
+
+static bool __gfs2_log_try_reserve_revokes(struct gfs2_sbd *sdp, unsigned int revokes)
+{
+	unsigned int available;
+
+	available = atomic_read(&sdp->sd_log_revokes_available);
+	while (available >= revokes) {
+		if (atomic_try_cmpxchg(&sdp->sd_log_revokes_available,
+				       &available, available - revokes))
+			return true;
+	}
+	return false;
+}
+
+void gfs2_log_release_revokes(struct gfs2_sbd *sdp, unsigned int revokes)
+{
+	atomic_add(revokes, &sdp->sd_log_revokes_available);
+}
+
 /**
  * gfs2_log_release - Release a given number of log blocks
  * @sdp: The GFS2 superblock
@@ -535,17 +571,64 @@ static void __gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks,
 		wake_up(&sdp->sd_log_waitq);
 }
 
+/**
+ * gfs2_log_try_reserve - Try to make a log reservation
+ * @sdp: The GFS2 superblock
+ * @blks: The number of blocks to reserve
+ * @revokes: The number of revokes to reserve
+ * @extra_revokes: The number of additional revokes reserved (output)
+ *
+ * This is similar to gfs2_log_reserve, but can be called while holding
+ * sd_log_flush_lock.
+ */
+
+bool gfs2_log_try_reserve(struct gfs2_sbd *sdp, unsigned int blks,
+			  unsigned int revokes, unsigned int *extra_revokes)
+{
+	unsigned int revoke_blks = 0;
+
+	if (revokes && !__gfs2_log_try_reserve_revokes(sdp, revokes)) {
+		revoke_blks = DIV_ROUND_UP(revokes, sdp->sd_inptrs);
+		blks += revoke_blks;
+	}
+	if (!blks)
+		goto blocks_reserved;
+
+	if (__gfs2_log_try_reserve(sdp, blks, GFS2_LOG_FLUSH_MIN_BLOCKS))
+		goto blocks_reserved;
+	if (revokes && !revoke_blks)
+		gfs2_log_release_revokes(sdp, revokes);
+	return false;
+
+blocks_reserved:
+	*extra_revokes = revoke_blks * sdp->sd_inptrs - revokes;
+	return true;
+}
+
 /**
  * gfs2_log_reserve - Make a log reservation
  * @sdp: The GFS2 superblock
  * @blks: The number of blocks to reserve
+ * @revokes: The number of revokes to reserve
+ * @extra_revokes: The number of additional revokes reserved (output)
  */
 
-void gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
+void gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks,
+		      unsigned int revokes, unsigned int *extra_revokes)
 {
+	unsigned int revoke_blks = 0;
+
+	if (revokes) {
+		revoke_blks = DIV_ROUND_UP(revokes, sdp->sd_inptrs);
+		blks += revoke_blks;
+	}
+
 	if (__gfs2_log_try_reserve(sdp, blks, GFS2_LOG_FLUSH_MIN_BLOCKS))
-		return;
+		goto blocks_reserved;
 	__gfs2_log_reserve(sdp, blks, GFS2_LOG_FLUSH_MIN_BLOCKS);
+
+blocks_reserved:
+	*extra_revokes = revoke_blks * sdp->sd_inptrs - revokes;
 }
 
 /**
@@ -603,8 +686,6 @@ static unsigned int calc_reserved(struct gfs2_sbd *sdp)
 	reserved += blocks + DIV_ROUND_UP(blocks, buf_limit(sdp));
 	blocks = tr->tr_num_databuf_new - tr->tr_num_databuf_rm;
 	reserved += blocks + DIV_ROUND_UP(blocks, databuf_limit(sdp));
-	if (tr->tr_num_revoke - tr->tr_num_revoke_rm)
-		reserved += gfs2_struct2blk(sdp, tr->tr_num_revoke - tr->tr_num_revoke_rm) - 1;
 	return reserved;
 }
 
@@ -743,15 +824,9 @@ void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
  */
 void gfs2_add_aux_revokes(struct gfs2_sbd *sdp)
 {
-	/* number of revokes we still have room for */
-	unsigned int max_revokes;
+	unsigned int max_revokes = atomic_read(&sdp->sd_log_revokes_available);
 
 	gfs2_log_lock(sdp);
-	max_revokes = sdp->sd_ldptrs;
-	if (sdp->sd_log_num_revoke > sdp->sd_ldptrs)
-		max_revokes += roundup(sdp->sd_log_num_revoke - sdp->sd_ldptrs,
-				       sdp->sd_inptrs);
-	max_revokes -= sdp->sd_log_num_revoke;
 	gfs2_ail1_empty(sdp, max_revokes);
 	gfs2_log_unlock(sdp);
 }
@@ -1020,10 +1095,6 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	if (unlikely(state == SFS_FROZEN))
 		if (gfs2_assert_withdraw_delayed(sdp, !sdp->sd_log_num_revoke))
 			goto out_withdraw;
-	if (gfs2_assert_withdraw_delayed(sdp,
-			sdp->sd_log_num_revoke ==
-			(tr ? tr->tr_num_revoke - tr->tr_num_revoke_rm : 0)))
-		goto out_withdraw;
 
 	gfs2_ordered_write(sdp);
 	if (gfs2_withdrawn(sdp))
@@ -1080,6 +1151,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 		gfs2_assert_withdraw(sdp, atomic_read(&sdp->sd_log_blks_free) <=
 				     sdp->sd_jdesc->jd_blocks);
 	}
+	gfs2_log_shrink_revokes(sdp);
 out:
 	trace_gfs2_log_flush(sdp, 0, flags);
 	up_write(&sdp->sd_log_flush_lock);
@@ -1118,12 +1190,12 @@ static void gfs2_merge_trans(struct gfs2_sbd *sdp, struct gfs2_trans *new)
 	WARN_ON_ONCE(!test_bit(TR_ATTACHED, &old->tr_flags));
 
 	old->tr_reserved	+= new->tr_reserved;
+	old->tr_revokes		+= new->tr_revokes;
 	old->tr_num_buf_new	+= new->tr_num_buf_new;
 	old->tr_num_databuf_new	+= new->tr_num_databuf_new;
 	old->tr_num_buf_rm	+= new->tr_num_buf_rm;
 	old->tr_num_databuf_rm	+= new->tr_num_databuf_rm;
 	old->tr_num_revoke	+= new->tr_num_revoke;
-	old->tr_num_revoke_rm	+= new->tr_num_revoke_rm;
 
 	list_splice_tail_init(&new->tr_databuf, &old->tr_databuf);
 	list_splice_tail_init(&new->tr_buf, &old->tr_buf);
@@ -1141,6 +1213,10 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 
 	gfs2_log_lock(sdp);
 
+	unused = tr->tr_revokes - tr->tr_num_revoke;
+        if (unused)
+                gfs2_log_release_revokes(sdp, unused);
+
 	if (sdp->sd_log_tr) {
 		gfs2_merge_trans(sdp, tr);
 		tr = sdp->sd_log_tr;
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index bc910960ae6c..f1dbd8220a34 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -74,8 +74,12 @@ extern void gfs2_ordered_del_inode(struct gfs2_inode *ip);
 extern unsigned int gfs2_struct2blk(struct gfs2_sbd *sdp, unsigned int nstruct);
 extern void gfs2_remove_from_ail(struct gfs2_bufdata *bd);
 extern bool gfs2_log_is_empty(struct gfs2_sbd *sdp);
+extern void gfs2_log_release_revokes(struct gfs2_sbd *sdp, unsigned int revokes);
 extern void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks);
-extern void gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks);
+extern bool gfs2_log_try_reserve(struct gfs2_sbd *sdp, unsigned int blks,
+				 unsigned int revokes, unsigned int *extra_revokes);
+extern void gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks,
+			     unsigned int revokes, unsigned int *extra_revokes);
 extern void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 				  u64 seq, u32 tail, u32 lblock, u32 flags,
 				  int op_flags);
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 3b4e51089bbd..3eae7e4a4f5f 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -844,6 +844,7 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	struct gfs2_bufdata *bd;
 	struct page *page;
 	unsigned int length;
+	unsigned int revokes = 0;
 
 	gfs2_add_aux_revokes(sdp);
 	if (!sdp->sd_log_num_revoke)
@@ -854,10 +855,9 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	offset = sizeof(struct gfs2_log_descriptor);
 
 	list_for_each_entry(bd, head, bd_list) {
-		sdp->sd_log_num_revoke--;
+		revokes++;
 
 		if (offset + sizeof(u64) > sdp->sd_sb.sb_bsize) {
-
 			gfs2_log_write_page(sdp, page);
 			page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
 			mh = page_address(page);
@@ -871,7 +871,9 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 		*(__be64 *)(page_address(page) + offset) = cpu_to_be64(bd->bd_blkno);
 		offset += sizeof(u64);
 	}
-	gfs2_assert_withdraw(sdp, !sdp->sd_log_num_revoke);
+	gfs2_assert_withdraw(sdp, revokes == sdp->sd_log_num_revoke);
+	gfs2_log_release_revokes(sdp, revokes);
+	sdp->sd_log_num_revoke = 0;
 
 	gfs2_log_write_page(sdp, page);
 }
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 986dc2ebebf0..316ca5fc99e8 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -315,6 +315,13 @@ static int gfs2_read_sb(struct gfs2_sbd *sdp, int silent)
 				     sizeof(struct gfs2_meta_header))
 		* GFS2_NBBY; /* not the rgrp bitmap, subsequent bitmaps only */
 
+	/*
+	 * We always keep at least one block reserved for revokes in
+	 * transactions.  This greatly simplifies allocating additional
+	 * revoke blocks.
+	 */
+	atomic_set(&sdp->sd_log_revokes_available, sdp->sd_ldptrs);
+
 	/* Compute maximum reservation required to add a entry to a directory */
 
 	hash_blocks = DIV_ROUND_UP(sizeof(u64) * BIT(GFS2_DIR_MAX_DEPTH),
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index d11977340e74..2340e2120c97 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -31,10 +31,10 @@ static void gfs2_print_trans(struct gfs2_sbd *sdp, const struct gfs2_trans *tr)
 	fs_warn(sdp, "blocks=%u revokes=%u reserved=%u touched=%u\n",
 		tr->tr_blocks, tr->tr_revokes, tr->tr_reserved,
 		test_bit(TR_TOUCHED, &tr->tr_flags));
-	fs_warn(sdp, "Buf %u/%u Databuf %u/%u Revoke %u/%u\n",
+	fs_warn(sdp, "Buf %u/%u Databuf %u/%u Revoke %u\n",
 		tr->tr_num_buf_new, tr->tr_num_buf_rm,
 		tr->tr_num_databuf_new, tr->tr_num_databuf_rm,
-		tr->tr_num_revoke, tr->tr_num_revoke_rm);
+		tr->tr_num_revoke);
 }
 
 int __gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
@@ -68,8 +68,6 @@ int __gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 		 */
 		tr->tr_reserved += blocks + 1 + DIV_ROUND_UP(blocks - 1, databuf_limit(sdp));
 	}
-	if (revokes)
-		tr->tr_reserved += gfs2_struct2blk(sdp, revokes) - 1;
 	INIT_LIST_HEAD(&tr->tr_databuf);
 	INIT_LIST_HEAD(&tr->tr_buf);
 	INIT_LIST_HEAD(&tr->tr_list);
@@ -83,10 +81,27 @@ int __gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 
 	sb_start_intwrite(sdp->sd_vfs);
 
-	gfs2_log_reserve(sdp, tr->tr_reserved);
+	/*
+	 * Try the reservations under sd_log_flush_lock to prevent log flushes
+	 * from creating inconsistencies between the number of allocated and
+	 * reserved revokes.  If that fails, do a full-block allocation outside
+	 * of the lock to avoid stalling log flushes.  Then, allot the
+	 * appropriate number of blocks to revokes, use as many revokes locally
+	 * as needed, and "release" the surplus into the revokes pool.
+	 */
 
 	down_read(&sdp->sd_log_flush_lock);
+	if (gfs2_log_try_reserve(sdp, tr->tr_reserved, tr->tr_revokes, &revokes))
+		goto reserved;
+	up_read(&sdp->sd_log_flush_lock);
+	gfs2_log_reserve(sdp, tr->tr_reserved, tr->tr_revokes, &revokes);
+	down_read(&sdp->sd_log_flush_lock);
+
+reserved:
+	if (revokes)
+		gfs2_log_release_revokes(sdp, revokes);
 	if (unlikely(!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))) {
+		gfs2_log_release_revokes(sdp, tr->tr_revokes);
 		gfs2_log_release(sdp, tr->tr_reserved);
 		up_read(&sdp->sd_log_flush_lock);
 		sb_end_intwrite(sdp->sd_vfs);
@@ -118,6 +133,7 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 	current->journal_info = NULL;
 
 	if (!test_bit(TR_TOUCHED, &tr->tr_flags)) {
+		gfs2_log_release_revokes(sdp, tr->tr_revokes);
 		gfs2_log_release(sdp, tr->tr_reserved);
 		up_read(&sdp->sd_log_flush_lock);
 		sb_end_intwrite(sdp->sd_vfs);
@@ -125,6 +141,9 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 		return;
 	}
 
+	if (tr->tr_revokes - tr->tr_num_revoke)
+		gfs2_log_release_revokes(sdp, tr->tr_revokes - tr->tr_num_revoke);
+
 	nbuf = tr->tr_num_buf_new + tr->tr_num_databuf_new;
 	nbuf -= tr->tr_num_buf_rm;
 	nbuf -= tr->tr_num_databuf_rm;
@@ -281,7 +300,6 @@ void gfs2_trans_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd)
 void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len)
 {
 	struct gfs2_bufdata *bd, *tmp;
-	struct gfs2_trans *tr = current->journal_info;
 	unsigned int n = len;
 
 	gfs2_log_lock(sdp);
@@ -293,7 +311,7 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len)
 			if (bd->bd_gl)
 				gfs2_glock_remove_revoke(bd->bd_gl);
 			kmem_cache_free(gfs2_bufdata_cachep, bd);
-			tr->tr_num_revoke_rm++;
+			gfs2_log_release_revokes(sdp, 1);
 			if (--n == 0)
 				break;
 		}
-- 
2.26.2

