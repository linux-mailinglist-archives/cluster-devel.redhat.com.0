Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF333065B1
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Jan 2021 22:11:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611781916;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MoBBY/9g0tHVLnxrPC8FGKdLrv39eVh+ZkwNBz1qnOA=;
	b=TXsGSMIqXAGafXg3UlCQ92aCDDmzRwOHceQfaL32rI4HA+ktzfWQoZ3ozlbbp5WV4/4z68
	jnnp5agUXtj2K7ZP8ze/2uMspqy6IK6J1zH/8EJyDQM56yJ8ClqY/PaELP1/sod5Dwh2RV
	zz67vqDiQC/y5VjkXkJTnFWK1cCYC7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-UPld5jyOPxOLgsdH8BIA3g-1; Wed, 27 Jan 2021 16:11:54 -0500
X-MC-Unique: UPld5jyOPxOLgsdH8BIA3g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1435C8066EE;
	Wed, 27 Jan 2021 21:11:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 034885D9C6;
	Wed, 27 Jan 2021 21:11:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E33BB50038;
	Wed, 27 Jan 2021 21:11:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RL8GOZ013899 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 16:08:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3892C6F923; Wed, 27 Jan 2021 21:08:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7278C6F451;
	Wed, 27 Jan 2021 21:08:15 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 27 Jan 2021 22:07:45 +0100
Message-Id: <20210127210746.16958-20-agruenba@redhat.com>
In-Reply-To: <20210127210746.16958-1-agruenba@redhat.com>
References: <20210127210746.16958-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v3 19/20] gfs2: Rework the log space
	allocation logic
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

The current log space allocation logic is hard to understand or extend.
The principle it that when the log is flushed, we may or may not have a
transaction active that has space allocated in the log.  To deal with
that, we set aside a magical number of blocks to be used in case we
don't have an active transaction.  This pool of blocks is managed in a
haphazard way, and it's not clear that the pool will always be big
enough, though.  We can't easily return unused log space at the end of a
transaction; instead, the number of blocks allocated must match the
number of blocks used.

Simplify this as follows:
 * When transactions are allocated or merged, always reserve enough
   blocks to flush the transaction (err on the safe side).
 * In gfs2_log_flush, return any allocated blocks that haven't been used.
 * Maintain a pool of spare of blocks big enough to do one log flush, as
   before.
 * In gfs2_log_flush, when we have no active transaction, allocate a
   suitable number of blocks locally.  For that, use the spare pool when
   called from logd, and leave the pool alone otherwise.  This means
   that when the log is almost full, logd will still be able to do one
   more log flush, which will result in more log space becoming
   available.

This makes the log space allocator code much easier to work with in the
future.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c   | 152 ++++++++++++++++++++++++++++--------------------
 fs/gfs2/log.h   |   9 ++-
 fs/gfs2/lops.c  |   2 +-
 fs/gfs2/trans.c |   6 +-
 4 files changed, 100 insertions(+), 69 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 34c8291c9131..c32c8d2d97e5 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -465,15 +465,42 @@ void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks)
 }
 
 /**
- * gfs2_log_reserve - Make a log reservation
+ * __gfs2_log_try_reserve - Try to make a log reservation
  * @sdp: The GFS2 superblock
  * @blks: The number of blocks to reserve
+ * @taboo_blks: The number of blocks to leave free
  *
- * Note that we never give out the last few blocks of the journal. Thats
- * due to the fact that there is a small number of header blocks
- * associated with each log flush. The exact number can't be known until
- * flush time, so we ensure that we have just enough free blocks at all
- * times to avoid running out during a log flush.
+ * Try to do the same as __gfs2_log_reserve(), but fail if no more log
+ * space is immediately available.
+ */
+static bool __gfs2_log_try_reserve(struct gfs2_sbd *sdp, unsigned int blks,
+				   unsigned int taboo_blks)
+{
+	unsigned wanted = blks + taboo_blks;
+	unsigned int free_blocks;
+
+	free_blocks = atomic_read(&sdp->sd_log_blks_free);
+	while (free_blocks >= wanted) {
+		if (atomic_try_cmpxchg(&sdp->sd_log_blks_free, &free_blocks,
+				       free_blocks - blks)) {
+			trace_gfs2_log_blocks(sdp, -blks);
+			return true;
+		}
+	}
+	return false;
+}
+
+/**
+ * __gfs2_log_reserve - Make a log reservation
+ * @sdp: The GFS2 superblock
+ * @blks: The number of blocks to reserve
+ * @taboo_blks: The number of blocks to leave free
+ *
+ * @taboo_blks is set to 0 for logd, and to GFS2_LOG_FLUSH_MIN_BLOCKS
+ * for all other processes.  This ensures that when the log is almost full,
+ * logd will still be able to call gfs2_log_flush one more time  without
+ * blocking, which will advance the tail and make some more log space
+ * available.
  *
  * We no longer flush the log here, instead we wake up logd to do that
  * for us. To avoid the thundering herd and to ensure that we deal fairly
@@ -482,19 +509,12 @@ void gfs2_log_release(struct gfs2_sbd *sdp, unsigned int blks)
  * wake the next waiter on the list.
  */
 
-void gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
+static void __gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks,
+			       unsigned int taboo_blks)
 {
-	unsigned reserved_blks = 7 * (4096 / sdp->sd_vfs->s_blocksize);
-	unsigned wanted = blks + reserved_blks;
+	unsigned wanted = blks + taboo_blks;
 	unsigned int free_blocks;
 
-	free_blocks = atomic_read(&sdp->sd_log_blks_free);
-	while (free_blocks >= wanted) {
-		if (atomic_try_cmpxchg(&sdp->sd_log_blks_free, &free_blocks,
-				       free_blocks - blks))
-			return;
-	}
-
 	atomic_add(blks, &sdp->sd_log_blks_needed);
 	for (;;) {
 		if (current != sdp->sd_logd_process)
@@ -516,6 +536,19 @@ void gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
 		wake_up(&sdp->sd_log_waitq);
 }
 
+/**
+ * gfs2_log_reserve - Make a log reservation
+ * @sdp: The GFS2 superblock
+ * @blks: The number of blocks to reserve
+ */
+
+void gfs2_log_reserve(struct gfs2_sbd *sdp, unsigned int blks)
+{
+	if (__gfs2_log_try_reserve(sdp, blks, GFS2_LOG_FLUSH_MIN_BLOCKS))
+		return;
+	__gfs2_log_reserve(sdp, blks, GFS2_LOG_FLUSH_MIN_BLOCKS);
+}
+
 /**
  * log_distance - Compute distance between two journal blocks
  * @sdp: The GFS2 superblock
@@ -563,7 +596,7 @@ static inline unsigned int log_distance(struct gfs2_sbd *sdp, unsigned int newer
  */
 static unsigned int calc_reserved(struct gfs2_sbd *sdp)
 {
-	unsigned int reserved = 0;
+	unsigned int reserved = GFS2_LOG_FLUSH_MIN_BLOCKS;
 	unsigned int blocks;
 	struct gfs2_trans *tr = sdp->sd_log_tr;
 
@@ -572,10 +605,7 @@ static unsigned int calc_reserved(struct gfs2_sbd *sdp)
 	blocks = tr->tr_num_databuf_new - tr->tr_num_databuf_rm;
 	reserved += blocks + DIV_ROUND_UP(blocks, databuf_limit(sdp));
 	if (tr->tr_num_revoke - tr->tr_num_revoke_rm)
-		reserved += gfs2_struct2blk(sdp, tr->tr_num_revoke - tr->tr_num_revoke_rm);
-	/* One for the overall header */
-	if (reserved)
-		reserved++;
+		reserved += gfs2_struct2blk(sdp, tr->tr_num_revoke - tr->tr_num_revoke_rm) - 1;
 	return reserved;
 }
 
@@ -703,7 +733,6 @@ void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
 /**
  * gfs2_flush_revokes - Add as many revokes to the system transaction as we can
  * @sdp: The GFS2 superblock
- * @tr: The transaction
  *
  * Our usual strategy is to defer writing revokes as much as we can in the hope
  * that we'll eventually overwrite the journal, which will make those revokes
@@ -713,7 +742,7 @@ void gfs2_glock_remove_revoke(struct gfs2_glock *gl)
  * been written back.  This will basically come at no cost now, and will save
  * us from having to keep track of those blocks on the AIL2 list later.
  */
-void gfs2_flush_revokes(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
+void gfs2_flush_revokes(struct gfs2_sbd *sdp)
 {
 	/* number of revokes we still have room for */
 	unsigned int max_revokes;
@@ -724,29 +753,8 @@ void gfs2_flush_revokes(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 		max_revokes += roundup(sdp->sd_log_num_revoke - sdp->sd_ldptrs,
 				       sdp->sd_inptrs);
 	max_revokes -= sdp->sd_log_num_revoke;
-	if (!sdp->sd_log_num_revoke) {
-		atomic_dec(&sdp->sd_log_blks_free);
-		/* If no blocks have been reserved, we need to also
-		 * reserve a block for the header */
-		if (!tr) {
-			atomic_dec(&sdp->sd_log_blks_free);
-			trace_gfs2_log_blocks(sdp, -2);
-		} else {
-			trace_gfs2_log_blocks(sdp, -1);
-		}
-	}
 	gfs2_ail1_empty(sdp, max_revokes);
 	gfs2_log_unlock(sdp);
-
-	if (!sdp->sd_log_num_revoke) {
-		atomic_inc(&sdp->sd_log_blks_free);
-		if (!tr) {
-			atomic_inc(&sdp->sd_log_blks_free);
-			trace_gfs2_log_blocks(sdp, 2);
-		} else {
-			trace_gfs2_log_blocks(sdp, 1);
-		}
-	}
 }
 
 /**
@@ -859,6 +867,7 @@ static void log_write_header(struct gfs2_sbd *sdp, u32 flags)
 	gfs2_log_incr_head(sdp);
 	log_flush_wait(sdp);
 	log_pull_tail(sdp);
+	gfs2_log_update_head(sdp);
 }
 
 /**
@@ -958,10 +967,14 @@ static void trans_drain(struct gfs2_trans *tr)
 void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 {
 	struct gfs2_trans *tr = NULL;
+	unsigned int reserved_blocks = 0, used_blocks = 0;
 	enum gfs2_freeze_state state = atomic_read(&sdp->sd_freeze_state);
+	unsigned int first_log_head;
 
 	down_write(&sdp->sd_log_flush_lock);
+	trace_gfs2_log_flush(sdp, 1, flags);
 
+repeat:
 	/*
 	 * Do this check while holding the log_flush_lock to prevent new
 	 * buffers from being added to the ail via gfs2_pin()
@@ -972,22 +985,39 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	/* Log might have been flushed while we waited for the flush lock */
 	if (gl && !test_bit(GLF_LFLUSH, &gl->gl_flags))
 		goto out;
-	trace_gfs2_log_flush(sdp, 1, flags);
 
-	if (flags & GFS2_LOG_HEAD_FLUSH_SHUTDOWN)
-		clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
+	first_log_head = sdp->sd_log_head;
+	sdp->sd_log_flush_head = first_log_head;
 
-	sdp->sd_log_flush_head = sdp->sd_log_head;
 	tr = sdp->sd_log_tr;
 	if (tr) {
+		if (reserved_blocks)
+			gfs2_log_release(sdp, reserved_blocks);
+		reserved_blocks = tr->tr_reserved;
 		sdp->sd_log_tr = NULL;
-		tr->tr_first = sdp->sd_log_flush_head;
+		tr->tr_first = first_log_head;
 		if (unlikely (state == SFS_FROZEN))
 			if (gfs2_assert_withdraw_delayed(sdp,
 			       !tr->tr_num_buf_new && !tr->tr_num_databuf_new))
 				goto out_withdraw;
+	} else if (!reserved_blocks) {
+		unsigned int taboo_blocks = GFS2_LOG_FLUSH_MIN_BLOCKS;
+
+		reserved_blocks = GFS2_LOG_FLUSH_MIN_BLOCKS;
+		if (current == sdp->sd_logd_process)
+			taboo_blocks = 0;
+
+		if (!__gfs2_log_try_reserve(sdp, reserved_blocks, taboo_blocks)) {
+			up_write(&sdp->sd_log_flush_lock);
+			__gfs2_log_reserve(sdp, reserved_blocks, taboo_blocks);
+			down_write(&sdp->sd_log_flush_lock);
+			goto repeat;
+		}
 	}
 
+	if (flags & GFS2_LOG_HEAD_FLUSH_SHUTDOWN)
+		clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
+
 	if (unlikely(state == SFS_FROZEN))
 		if (gfs2_assert_withdraw_delayed(sdp, !sdp->sd_log_num_revoke))
 			goto out_withdraw;
@@ -1010,8 +1040,6 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 		log_flush_wait(sdp);
 		log_write_header(sdp, flags);
 	} else if (sdp->sd_log_tail != sdp->sd_log_flush_tail && !sdp->sd_log_idle) {
-		atomic_dec(&sdp->sd_log_blks_free); /* Adjust for unreserved buffer */
-		trace_gfs2_log_blocks(sdp, -1);
 		log_write_header(sdp, flags);
 	}
 	if (gfs2_withdrawn(sdp))
@@ -1019,8 +1047,6 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	lops_after_commit(sdp, tr);
 
 	gfs2_log_lock(sdp);
-	gfs2_log_update_head(sdp);
-
 	spin_lock(&sdp->sd_ail_lock);
 	if (tr && !list_empty(&tr->tr_ail1_list)) {
 		list_add(&tr->tr_list, &sdp->sd_ail1_list);
@@ -1034,10 +1060,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 			empty_ail1_list(sdp);
 			if (gfs2_withdrawn(sdp))
 				goto out_withdraw;
-			atomic_dec(&sdp->sd_log_blks_free); /* Adjust for unreserved buffer */
-			trace_gfs2_log_blocks(sdp, -1);
 			log_write_header(sdp, flags);
-			gfs2_log_update_head(sdp);
 		}
 		if (flags & (GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
 			     GFS2_LOG_HEAD_FLUSH_FREEZE))
@@ -1047,12 +1070,17 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	}
 
 out_end:
-	trace_gfs2_log_flush(sdp, 0, flags);
+	used_blocks = log_distance(sdp, sdp->sd_log_flush_head, first_log_head);
+	if (gfs2_assert_withdraw_delayed(sdp, used_blocks <= reserved_blocks))
+		goto out;
 out:
+	if (used_blocks != reserved_blocks)
+		gfs2_log_release(sdp, reserved_blocks - used_blocks);
 	up_write(&sdp->sd_log_flush_lock);
 	gfs2_trans_free(sdp, tr);
 	if (gfs2_withdrawing(sdp))
 		gfs2_withdraw(sdp);
+	trace_gfs2_log_flush(sdp, 0, flags);
 	return;
 
 out_withdraw:
@@ -1162,15 +1190,11 @@ static void gfs2_log_shutdown(struct gfs2_sbd *sdp)
 	gfs2_assert_withdraw(sdp, !sdp->sd_log_num_revoke);
 	gfs2_assert_withdraw(sdp, list_empty(&sdp->sd_ail1_list));
 
-	sdp->sd_log_flush_head = sdp->sd_log_head;
-
 	log_write_header(sdp, GFS2_LOG_HEAD_UNMOUNT | GFS2_LFC_SHUTDOWN);
+	log_pull_tail(sdp);
 
 	gfs2_assert_warn(sdp, sdp->sd_log_head == sdp->sd_log_tail);
 	gfs2_assert_warn(sdp, list_empty(&sdp->sd_ail2_list));
-
-	gfs2_log_update_head(sdp);
-	sdp->sd_log_tail = sdp->sd_log_head;
 }
 
 static inline int gfs2_jrnl_flush_reqd(struct gfs2_sbd *sdp)
@@ -1225,7 +1249,7 @@ int gfs2_logd(void *data)
 		if (gfs2_jrnl_flush_reqd(sdp) || t == 0) {
 			gfs2_ail1_empty(sdp, 0);
 			gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
-				       GFS2_LFC_LOGD_JFLUSH_REQD);
+						  GFS2_LFC_LOGD_JFLUSH_REQD);
 		}
 
 		if (gfs2_ail_flush_reqd(sdp)) {
@@ -1233,7 +1257,7 @@ int gfs2_logd(void *data)
 			gfs2_ail1_wait(sdp);
 			gfs2_ail1_empty(sdp, 0);
 			gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
-				       GFS2_LFC_LOGD_AIL_FLUSH_REQD);
+						  GFS2_LFC_LOGD_AIL_FLUSH_REQD);
 		}
 
 		t = gfs2_tune_get(sdp, gt_logd_secs) * HZ;
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index f3c8e4285ec9..e7f4a8d6be64 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -13,6 +13,13 @@
 #include "incore.h"
 #include "inode.h"
 
+/*
+ * The minimum amount of log space required for a log flush is one block for
+ * revokes and one block for the log header.  Log flushes other than
+ * GFS2_LOG_HEAD_FLUSH_NORMAL may write one or two more log headers.
+ */
+#define GFS2_LOG_FLUSH_MIN_BLOCKS 4
+
 /**
  * gfs2_log_lock - acquire the right to mess with the log manager
  * @sdp: the filesystem
@@ -81,6 +88,6 @@ extern void log_flush_wait(struct gfs2_sbd *sdp);
 extern int gfs2_logd(void *data);
 extern void gfs2_add_revoke(struct gfs2_sbd *sdp, struct gfs2_bufdata *bd);
 extern void gfs2_glock_remove_revoke(struct gfs2_glock *gl);
-extern void gfs2_flush_revokes(struct gfs2_sbd *sdp, struct gfs2_trans *tr);
+extern void gfs2_flush_revokes(struct gfs2_sbd *sdp);
 
 #endif /* __LOG_DOT_H__ */
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index db554f7623ec..8658ebbcb4a9 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -845,7 +845,7 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 	struct page *page;
 	unsigned int length;
 
-	gfs2_flush_revokes(sdp, tr);
+	gfs2_flush_revokes(sdp);
 	if (!sdp->sd_log_num_revoke)
 		return;
 
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 3675e92f2857..0f936e3bcd90 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -59,7 +59,7 @@ int __gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 	tr->tr_ip = _RET_IP_;
 	tr->tr_blocks = blocks;
 	tr->tr_revokes = revokes;
-	tr->tr_reserved = 1;
+	tr->tr_reserved = GFS2_LOG_FLUSH_MIN_BLOCKS;
 	if (blocks) {
 		/*
 		 * The reserved blocks are either used for data or metadata.
@@ -69,7 +69,7 @@ int __gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int blocks,
 		tr->tr_reserved += blocks + 1 + DIV_ROUND_UP(blocks - 1, databuf_limit(sdp));
 	}
 	if (revokes)
-		tr->tr_reserved += gfs2_struct2blk(sdp, revokes);
+		tr->tr_reserved += gfs2_struct2blk(sdp, revokes) - 1;
 	INIT_LIST_HEAD(&tr->tr_databuf);
 	INIT_LIST_HEAD(&tr->tr_buf);
 	INIT_LIST_HEAD(&tr->tr_list);
@@ -117,8 +117,8 @@ void gfs2_trans_end(struct gfs2_sbd *sdp)
 	current->journal_info = NULL;
 
 	if (!test_bit(TR_TOUCHED, &tr->tr_flags)) {
-		gfs2_log_release(sdp, tr->tr_reserved);
 		up_read(&sdp->sd_log_flush_lock);
+		gfs2_log_release(sdp, tr->tr_reserved);
 		sb_end_intwrite(sdp->sd_vfs);
 		gfs2_trans_free(sdp, tr);
 		return;
-- 
2.26.2

