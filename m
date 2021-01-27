Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 648753065BB
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jan 2021 22:12:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611781921;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YDTjGXbU94okEK37U9/clUhM2cFFpgrBZMOGltGej2U=;
	b=NFwmkAHaoF+A7YMfvvhwtmI5NX9JiIHhFqL0uxZqK+3xd9t9T8pK2HZYd18yh30aKlx83t
	0O3PNFc8ofRa4LqJLgBLKekFpx8QRpAWTKCSfjzIcLYS8ZUn6RvMkz2GmFmKz5FKrtzXVf
	axidME73A08MJ0OsaCNR6UAIJvXEQqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-4mpmnjjOMu6Gb80ivuXKAg-1; Wed, 27 Jan 2021 16:11:56 -0500
X-MC-Unique: 4mpmnjjOMu6Gb80ivuXKAg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5143911FC;
	Wed, 27 Jan 2021 21:11:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B390D104C47A;
	Wed, 27 Jan 2021 21:11:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92D5E1809CAD;
	Wed, 27 Jan 2021 21:11:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RL8H1u013905 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 16:08:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 853A76F923; Wed, 27 Jan 2021 21:08:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 931446F451;
	Wed, 27 Jan 2021 21:08:16 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 27 Jan 2021 22:07:46 +0100
Message-Id: <20210127210746.16958-21-agruenba@redhat.com>
In-Reply-To: <20210127210746.16958-1-agruenba@redhat.com>
References: <20210127210746.16958-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v3 20/20] gfs2: Per-revoke accounting in
	transactions
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

In the log, revokes are stored as a revoke descriptor (struct
gfs2_log_descriptor), followed by zero or more additional revoke blocks
(struct gfs2_meta_header).  On filesystems with a blocksize of 4k, the
revoke descriptor contains up to 503 revokes, and the metadata blocks
contain up to 509 revokes each.  We've so far been reserving space for revokes
in transactions in block granularity, so a lot more space than needed was
being allocated and then released again.

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
 fs/gfs2/glops.c      |   8 +---
 fs/gfs2/incore.h     |   2 +-
 fs/gfs2/log.c        | 112 ++++++++++++++++++++++++++++++++++---------
 fs/gfs2/log.h        |   6 ++-
 fs/gfs2/lops.c       |   1 -
 fs/gfs2/ops_fstype.c |   7 +++
 fs/gfs2/trans.c      |  31 +++++++++---
 7 files changed, 129 insertions(+), 38 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 853e590ccc15..daafe9d781a3 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -131,19 +131,15 @@ void gfs2_ail_flush(struct gfs2_glock *gl, bool fsync)
 {
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	unsigned int revokes = atomic_read(&gl->gl_ail_count);
-	unsigned int max_revokes = (sdp->sd_sb.sb_bsize - sizeof(struct gfs2_log_descriptor)) / sizeof(u64);
 	int ret;
 
 	if (!revokes)
 		return;
 
-	while (revokes > max_revokes)
-		max_revokes += (sdp->sd_sb.sb_bsize - sizeof(struct gfs2_meta_header)) / sizeof(u64);
-
-	ret = gfs2_trans_begin(sdp, 0, max_revokes);
+	ret = gfs2_trans_begin(sdp, 0, revokes);
 	if (ret)
 		return;
-	__gfs2_ail_flush(gl, fsync, max_revokes);
+	__gfs2_ail_flush(gl, fsync, revokes);
 	gfs2_trans_end(sdp);
 	gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
 		       GFS2_LFC_AIL_FLUSH);
diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 5d50c3695f17..a045e6ffecf0 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -505,7 +505,6 @@ struct gfs2_trans {
 	unsigned int tr_num_buf_rm;
 	unsigned int tr_num_databuf_rm;
 	unsigned int tr_num_revoke;
-	unsigned int tr_num_revoke_rm;
 
 	struct list_head tr_list;
 	struct list_head tr_databuf;
@@ -831,6 +830,7 @@ struct gfs2_sbd {
 	atomic_t sd_log_thresh2;
 	atomic_t sd_log_blks_free;
 	atomic_t sd_log_blks_needed;
+	atomic_t sd_log_revokes_available;
 	wait_queue_head_t sd_log_waitq;
 	wait_queue_head_t sd_logd_waitq;
 
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index c32c8d2d97e5..c68e05508435 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -447,6 +447,32 @@ bool gfs2_log_is_empty(struct gfs2_sbd *sdp) {
 	return atomic_read(&sdp->sd_log_blks_free) == sdp->sd_jdesc->jd_blocks;
 }
 
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
+/**
+ * gfs2_log_release_revokes - Release a given number of revokes
+ * @sdp: The GFS2 superblock
+ * @revokes: The number of revokes to release
+ *
+ * sdp->sd_log_flush_lock must be held.
+ */
+void gfs2_log_release_revokes(struct gfs2_sbd *sdp, unsigned int revokes)
+{
+	if (revokes)
+		atomic_add(revokes, &sdp->sd_log_revokes_available);
+}
+
 /**
  * gfs2_log_release - Release a given number of log blocks
  * @sdp: The GFS2 superblock
@@ -537,15 +563,59 @@ static void __gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks,
 }
 
 /**
- * gfs2_log_reserve - Make a log reservation
+ * gfs2_log_try_reserve - Try to make a log reservation
  * @sdp: The GFS2 superblock
- * @blks: The number of blocks to reserve
+ * @tr: The transaction
+ * @extra_revokes: The number of additional revokes reserved (output)
+ *
+ * This is similar to gfs2_log_reserve, but sdp->sd_log_flush_lock must be
+ * held for correct revoke accounting.
  */
 
-void gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
+bool gfs2_log_try_reserve(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
+			  unsigned int *extra_revokes)
 {
+	unsigned int blks = tr->tr_reserved;
+	unsigned int revokes = tr->tr_revokes;
+	unsigned int revoke_blks = 0;
+
+	*extra_revokes = 0;
+	if (revokes && !__gfs2_log_try_reserve_revokes(sdp, revokes)) {
+		revoke_blks = DIV_ROUND_UP(revokes, sdp->sd_inptrs);
+		*extra_revokes = revoke_blks * sdp->sd_inptrs - revokes;
+		blks += revoke_blks;
+	}
+	if (!blks)
+		return true;
 	if (__gfs2_log_try_reserve(sdp, blks, GFS2_LOG_FLUSH_MIN_BLOCKS))
-		return;
+		return true;
+	if (!revoke_blks)
+		gfs2_log_release_revokes(sdp, revokes);
+	return false;
+}
+
+/**
+ * gfs2_log_reserve - Make a log reservation
+ * @sdp: The GFS2 superblock
+ * @tr: The transaction
+ * @extra_revokes: The number of additional revokes reserved (output)
+ *
+ * sdp->sd_log_flush_lock must not be held.
+ */
+
+void gfs2_log_reserve(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
+		      unsigned int *extra_revokes)
+{
+	unsigned int blks = tr->tr_reserved;
+	unsigned int revokes = tr->tr_revokes;
+	unsigned int revoke_blks = 0;
+
+	*extra_revokes = 0;
+	if (revokes) {
+		revoke_blks = DIV_ROUND_UP(revokes, sdp->sd_inptrs);
+		*extra_revokes = revoke_blks * sdp->sd_inptrs - revokes;
+		blks += revoke_blks;
+	}
 	__gfs2_log_reserve(sdp, blks, GFS2_LOG_FLUSH_MIN_BLOCKS);
 }
 
@@ -604,8 +674,6 @@ static unsigned int calc_reserved(struct gfs2_sbd *sdp)
 	reserved += blocks + DIV_ROUND_UP(blocks, buf_limit(sdp));
 	blocks = tr->tr_num_databuf_new - tr->tr_num_databuf_rm;
 	reserved += blocks + DIV_ROUND_UP(blocks, databuf_limit(sdp));
-	if (tr->tr_num_revoke - tr->tr_num_revoke_rm)
-		reserved += gfs2_struct2blk(sdp, tr->tr_num_revoke - tr->tr_num_revoke_rm) - 1;
 	return reserved;
 }
 
@@ -745,14 +813,9 @@ void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
 void gfs2_flush_revokes(struct gfs2_sbd *sdp)
 {
 	/* number of revokes we still have room for */
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
@@ -970,6 +1033,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	unsigned int reserved_blocks = 0, used_blocks = 0;
 	enum gfs2_freeze_state state = atomic_read(&sdp->sd_freeze_state);
 	unsigned int first_log_head;
+	unsigned int reserved_revokes = 0;
 
 	down_write(&sdp->sd_log_flush_lock);
 	trace_gfs2_log_flush(sdp, 1, flags);
@@ -996,10 +1060,12 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 		reserved_blocks = tr->tr_reserved;
 		sdp->sd_log_tr = NULL;
 		tr->tr_first = first_log_head;
-		if (unlikely (state == SFS_FROZEN))
+		if (unlikely (state == SFS_FROZEN)) {
 			if (gfs2_assert_withdraw_delayed(sdp,
 			       !tr->tr_num_buf_new && !tr->tr_num_databuf_new))
 				goto out_withdraw;
+		}
+		reserved_revokes = sdp->sd_log_num_revoke;
 	} else if (!reserved_blocks) {
 		unsigned int taboo_blocks = GFS2_LOG_FLUSH_MIN_BLOCKS;
 
@@ -1013,18 +1079,15 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 			down_write(&sdp->sd_log_flush_lock);
 			goto repeat;
 		}
+		BUG_ON(sdp->sd_log_num_revoke);
 	}
 
 	if (flags & GFS2_LOG_HEAD_FLUSH_SHUTDOWN)
 		clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
 
 	if (unlikely(state == SFS_FROZEN))
-		if (gfs2_assert_withdraw_delayed(sdp, !sdp->sd_log_num_revoke))
+		if (gfs2_assert_withdraw_delayed(sdp, !reserved_revokes))
 			goto out_withdraw;
-	if (gfs2_assert_withdraw_delayed(sdp,
-			sdp->sd_log_num_revoke ==
-			(tr ? tr->tr_num_revoke - tr->tr_num_revoke_rm : 0)))
-		goto out_withdraw;
 
 	gfs2_ordered_write(sdp);
 	if (gfs2_withdrawn(sdp))
@@ -1071,11 +1134,16 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 
 out_end:
 	used_blocks = log_distance(sdp, sdp->sd_log_flush_head, first_log_head);
-	if (gfs2_assert_withdraw_delayed(sdp, used_blocks <= reserved_blocks))
-		goto out;
+	reserved_revokes += atomic_read(&sdp->sd_log_revokes_available);
+	atomic_set(&sdp->sd_log_revokes_available, sdp->sd_ldptrs);
+	gfs2_assert_withdraw(sdp, reserved_revokes % sdp->sd_inptrs == sdp->sd_ldptrs);
+	if (reserved_revokes > sdp->sd_ldptrs)
+		reserved_blocks += (reserved_revokes - sdp->sd_ldptrs) / sdp->sd_inptrs;
 out:
-	if (used_blocks != reserved_blocks)
+	if (used_blocks != reserved_blocks) {
+		gfs2_assert_withdraw_delayed(sdp, used_blocks < reserved_blocks);
 		gfs2_log_release(sdp, reserved_blocks - used_blocks);
+	}
 	up_write(&sdp->sd_log_flush_lock);
 	gfs2_trans_free(sdp, tr);
 	if (gfs2_withdrawing(sdp))
@@ -1117,8 +1185,8 @@ static void gfs2_merge_trans(struct gfs2_sbd *sdp, struct gfs2_trans *new)
 	old->tr_num_databuf_new	+= new->tr_num_databuf_new;
 	old->tr_num_buf_rm	+= new->tr_num_buf_rm;
 	old->tr_num_databuf_rm	+= new->tr_num_databuf_rm;
+	old->tr_revokes		+= new->tr_revokes;
 	old->tr_num_revoke	+= new->tr_num_revoke;
-	old->tr_num_revoke_rm	+= new->tr_num_revoke_rm;
 
 	list_splice_tail_init(&new->tr_databuf, &old->tr_databuf);
 	list_splice_tail_init(&new->tr_buf, &old->tr_buf);
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index e7f4a8d6be64..eea58015710e 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -74,8 +74,12 @@ extern void gfs2_ordered_del_inode(struct gfs2_inode *ip);
 extern unsigned int gfs2_struct2blk(struct gfs2_sbd *sdp, unsigned int nstruct);
 extern void gfs2_remove_from_ail(struct gfs2_bufdata *bd);
 extern bool gfs2_log_is_empty(struct gfs2_sbd *sdp);
+extern void gfs2_log_release_revokes(struct gfs2_sbd *sdp, unsigned int revokes);
 extern void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks);
-extern void gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks);
+extern bool gfs2_log_try_reserve(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
+				 unsigned int *extra_revokes);
+extern void gfs2_log_reserve(struct gfs2_sbd *sdp, struct gfs2_trans *tr,
+			     unsigned int *extra_revokes);
 extern void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 				  u64 seq, u32 tail, u32 lblock, u32 flags,
 				  int op_flags);
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 8658ebbcb4a9..dfe8537cb88e 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -857,7 +857,6 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 		sdp->sd_log_num_revoke--;
 
 		if (offset + sizeof(u64) > sdp->sd_sb.sb_bsize) {
-
 			gfs2_log_write_page(sdp, page);
 			page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
 			mh = page_address(page);
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
index 0f936e3bcd90..c7aa1c1d795d 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -31,15 +31,16 @@ static void gfs2_print_trans(struct gfs2_sbd *sdp, const struct gfs2_trans *tr)
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
 		       unsigned int revokes, gfp_t gfp_mask)
 {
+	unsigned int extra_revokes;
 	struct gfs2_trans *tr;
 	int error;
 
@@ -68,8 +69,6 @@ int __gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 		 */
 		tr->tr_reserved += blocks + 1 + DIV_ROUND_UP(blocks - 1, databuf_limit(sdp));
 	}
-	if (revokes)
-		tr->tr_reserved += gfs2_struct2blk(sdp, revokes) - 1;
 	INIT_LIST_HEAD(&tr->tr_databuf);
 	INIT_LIST_HEAD(&tr->tr_buf);
 	INIT_LIST_HEAD(&tr->tr_list);
@@ -83,10 +82,26 @@ int __gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 
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
+	if (gfs2_log_try_reserve(sdp, tr, &extra_revokes))
+		goto reserved;
+	up_read(&sdp->sd_log_flush_lock);
+	gfs2_log_reserve(sdp, tr, &extra_revokes);
+	down_read(&sdp->sd_log_flush_lock);
+
+reserved:
+	gfs2_log_release_revokes(sdp, extra_revokes);
 	if (unlikely(!test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))) {
+		gfs2_log_release_revokes(sdp, tr->tr_revokes);
 		up_read(&sdp->sd_log_flush_lock);
 		gfs2_log_release(sdp, tr->tr_reserved);
 		sb_end_intwrite(sdp->sd_vfs);
@@ -117,6 +132,7 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 	current->journal_info = NULL;
 
 	if (!test_bit(TR_TOUCHED, &tr->tr_flags)) {
+		gfs2_log_release_revokes(sdp, tr->tr_revokes);
 		up_read(&sdp->sd_log_flush_lock);
 		gfs2_log_release(sdp, tr->tr_reserved);
 		sb_end_intwrite(sdp->sd_vfs);
@@ -124,6 +140,8 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 		return;
 	}
 
+	gfs2_log_release_revokes(sdp, tr->tr_revokes - tr->tr_num_revoke);
+
 	nbuf = tr->tr_num_buf_new + tr->tr_num_databuf_new;
 	nbuf -= tr->tr_num_buf_rm;
 	nbuf -= tr->tr_num_databuf_rm;
@@ -280,7 +298,6 @@ void gfs2_trans_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd)
 void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len)
 {
 	struct gfs2_bufdata *bd, *tmp;
-	struct gfs2_trans *tr = current->journal_info;
 	unsigned int n = len;
 
 	gfs2_log_lock(sdp);
@@ -292,7 +309,7 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len)
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

