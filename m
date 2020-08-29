Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9C717256675
	for <lists+cluster-devel@lfdr.de>; Sat, 29 Aug 2020 11:27:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598693239;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IMclwz3FDFLEXCV0HuWWgXmQ0qZFGsbjM6s5/M34Yr8=;
	b=ccn4BI87OpP9ykMVh0mqqvNcgF2H95C5J5TcwUJG61sDEGeXByd9dBZnveCi72fPlIthFq
	9AZD19IvM79vUmnEA6EECBvlfILjuBax7dmtdjOjglMQ/2EiZ2xzOAG4vMnPPyXMwmfEn/
	ZYx2YJCIvZw9lrGaT7JrrpGutVpjksw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-EpvElk3sOq6imQkY2r3G3g-1; Sat, 29 Aug 2020 05:27:18 -0400
X-MC-Unique: EpvElk3sOq6imQkY2r3G3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60DE9107465D;
	Sat, 29 Aug 2020 09:27:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 773FF7BE6F;
	Sat, 29 Aug 2020 09:27:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2571B79861;
	Sat, 29 Aug 2020 09:27:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07T9R7sR026335 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 29 Aug 2020 05:27:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4DFB41A340; Sat, 29 Aug 2020 09:27:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.194.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A7CC1A268;
	Sat, 29 Aug 2020 09:27:03 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Sat, 29 Aug 2020 11:26:56 +0200
Message-Id: <20200829092656.1173430-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: stable@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: Make sure we don't miss any delayed
	withdraws
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Commit ca399c96e96e changes gfs2_log_flush to not withdraw the
filesystem while holding the log flush lock, but it fails to check if
the filesystem needs to be withdrawn once the log flush lock has been
released.  Likewise, commit f05b86db314d depends on gfs2_log_flush to
trigger for delayed withdraws.  Add that and clean up the code flow
somewhat.

In gfs2_put_super, add a check for delayed withdraws that have been
missed to prevent these kinds of bugs in the future.

Fixes: ca399c96e96e ("gfs2: flesh out delayed withdraw for gfs2_log_flush")
Fixes: f05b86db314d ("gfs2: Prepare to withdraw as soon as an IO error occurs in log write")
Cc: stable@vger.kernel.org # v5.7+
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c   | 61 +++++++++++++++++++++++++------------------------
 fs/gfs2/super.c |  2 ++
 fs/gfs2/util.h  | 10 ++++++++
 3 files changed, 43 insertions(+), 30 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 3763c9ff1406..93032feb5159 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -954,10 +954,8 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 		goto out;
 
 	/* Log might have been flushed while we waited for the flush lock */
-	if (gl && !test_bit(GLF_LFLUSH, &gl->gl_flags)) {
-		up_write(&sdp->sd_log_flush_lock);
-		return;
-	}
+	if (gl && !test_bit(GLF_LFLUSH, &gl->gl_flags))
+		goto out;
 	trace_gfs2_log_flush(sdp, 1, flags);
 
 	if (flags & GFS2_LOG_HEAD_FLUSH_SHUTDOWN)
@@ -971,25 +969,25 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 		if (unlikely (state == SFS_FROZEN))
 			if (gfs2_assert_withdraw_delayed(sdp,
 			       !tr->tr_num_buf_new && !tr->tr_num_databuf_new))
-				goto out;
+				goto out_withdraw;
 	}
 
 	if (unlikely(state == SFS_FROZEN))
 		if (gfs2_assert_withdraw_delayed(sdp, !sdp->sd_log_num_revoke))
-			goto out;
+			goto out_withdraw;
 	if (gfs2_assert_withdraw_delayed(sdp,
 			sdp->sd_log_num_revoke == sdp->sd_log_committed_revoke))
-		goto out;
+		goto out_withdraw;
 
 	gfs2_ordered_write(sdp);
 	if (gfs2_withdrawn(sdp))
-		goto out;
+		goto out_withdraw;
 	lops_before_commit(sdp, tr);
 	if (gfs2_withdrawn(sdp))
-		goto out;
+		goto out_withdraw;
 	gfs2_log_submit_bio(&sdp->sd_log_bio, REQ_OP_WRITE);
 	if (gfs2_withdrawn(sdp))
-		goto out;
+		goto out_withdraw;
 
 	if (sdp->sd_log_head != sdp->sd_log_flush_head) {
 		log_flush_wait(sdp);
@@ -1000,7 +998,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 		log_write_header(sdp, flags);
 	}
 	if (gfs2_withdrawn(sdp))
-		goto out;
+		goto out_withdraw;
 	lops_after_commit(sdp, tr);
 
 	gfs2_log_lock(sdp);
@@ -1020,7 +1018,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 		if (!sdp->sd_log_idle) {
 			empty_ail1_list(sdp);
 			if (gfs2_withdrawn(sdp))
-				goto out;
+				goto out_withdraw;
 			atomic_dec(&sdp->sd_log_blks_free); /* Adjust for unreserved buffer */
 			trace_gfs2_log_blocks(sdp, -1);
 			log_write_header(sdp, flags);
@@ -1033,27 +1031,30 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 			atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
 	}
 
-out:
-	if (gfs2_withdrawn(sdp)) {
-		trans_drain(tr);
-		/**
-		 * If the tr_list is empty, we're withdrawing during a log
-		 * flush that targets a transaction, but the transaction was
-		 * never queued onto any of the ail lists. Here we add it to
-		 * ail1 just so that ail_drain() will find and free it.
-		 */
-		spin_lock(&sdp->sd_ail_lock);
-		if (tr && list_empty(&tr->tr_list))
-			list_add(&tr->tr_list, &sdp->sd_ail1_list);
-		spin_unlock(&sdp->sd_ail_lock);
-		ail_drain(sdp); /* frees all transactions */
-		tr = NULL;
-	}
-
+out_end:
 	trace_gfs2_log_flush(sdp, 0, flags);
+out:
 	up_write(&sdp->sd_log_flush_lock);
-
 	gfs2_trans_free(sdp, tr);
+	if (gfs2_withdrawing(sdp))
+		gfs2_withdraw(sdp);
+	return;
+
+out_withdraw:
+	trans_drain(tr);
+	/**
+	 * If the tr_list is empty, we're withdrawing during a log
+	 * flush that targets a transaction, but the transaction was
+	 * never queued onto any of the ail lists. Here we add it to
+	 * ail1 just so that ail_drain() will find and free it.
+	 */
+	spin_lock(&sdp->sd_ail_lock);
+	if (tr && list_empty(&tr->tr_list))
+		list_add(&tr->tr_list, &sdp->sd_ail1_list);
+	spin_unlock(&sdp->sd_ail_lock);
+	ail_drain(sdp); /* frees all transactions */
+	tr = NULL;
+	goto out_end;
 }
 
 /**
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 9f4d9e7be839..19add2da1013 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -702,6 +702,8 @@ static void gfs2_put_super(struct super_block *sb)
 		if (error)
 			gfs2_io_error(sdp);
 	}
+	WARN_ON(gfs2_withdrawing(sdp));
+
 	/*  At this point, we're through modifying the disk  */
 
 	/*  Release stuff  */
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index 6d9157efe16c..d7562981b3a0 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -205,6 +205,16 @@ static inline bool gfs2_withdrawn(struct gfs2_sbd *sdp)
 		test_bit(SDF_WITHDRAWING, &sdp->sd_flags);
 }
 
+/**
+ * gfs2_withdrawing - check if a withdraw is pending
+ * @sdp: the superblock
+ */
+static inline bool gfs2_withdrawing(struct gfs2_sbd *sdp)
+{
+	return test_bit(SDF_WITHDRAWING, &sdp->sd_flags) &&
+	       !test_bit(SDF_WITHDRAWN, &sdp->sd_flags);
+}
+
 #define gfs2_tune_get(sdp, field) \
 gfs2_tune_get_i(&(sdp)->sd_tune, &(sdp)->sd_tune.field)
 
-- 
2.26.2

