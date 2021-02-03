Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id ED24D30E1F7
	for <lists+cluster-devel@lfdr.de>; Wed,  3 Feb 2021 19:08:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612375702;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WNhRf84Jh4pfFsbshkCMhJl6poCfzK0YjyPI5/LGxs8=;
	b=YCsgTejSdVoTww3i1LF3eZA/UtOnGqUbU85MrXfyrxbyyToF2jl2KEEvIMQ1ZOVPHEmqPk
	PpurohHyuJXr8polsTIQqNU8qrv0rmCORuOWvmtcjvPE3J8zgV5YW2d/QI1NGfOTkTJkAx
	+btLMfwtgKt2FAwYWsU8lvVKJWP0Zt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-wsebHQkbPB6dILcruGqbyw-1; Wed, 03 Feb 2021 13:08:20 -0500
X-MC-Unique: wsebHQkbPB6dILcruGqbyw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7C1A804042;
	Wed,  3 Feb 2021 18:08:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A67EE5D6A8;
	Wed,  3 Feb 2021 18:08:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9079657DF9;
	Wed,  3 Feb 2021 18:08:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113I8GpL028657 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 13:08:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 61FE36F97A; Wed,  3 Feb 2021 18:08:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-112-155.ams2.redhat.com [10.36.112.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9F8E60D07;
	Wed,  3 Feb 2021 18:08:15 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed,  3 Feb 2021 19:07:50 +0100
Message-Id: <20210203180755.246596-16-agruenba@redhat.com>
In-Reply-To: <20210203180755.246596-1-agruenba@redhat.com>
References: <20210203180755.246596-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v4 15/20] gfs2: Get rid of current_tail()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Keep the current value of the updated log tail in the super block as
sb_log_flush_tail instead of computing it on the fly.  This avoids
unnecessary sd_ail_lock taking and cleans up the code.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/incore.h |  5 ++--
 fs/gfs2/log.c    | 72 +++++++++++++++++++++++++-----------------------
 fs/gfs2/log.h    |  4 ++-
 3 files changed, 44 insertions(+), 37 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 8f8676cf72ed..51656b053170 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -838,8 +838,6 @@ struct gfs2_sbd {
 	wait_queue_head_t sd_logd_waitq;
 
 	u64 sd_log_sequence;
-	unsigned int sd_log_head;
-	unsigned int sd_log_tail;
 	int sd_log_idle;
 
 	struct rw_semaphore sd_log_flush_lock;
@@ -849,6 +847,9 @@ struct gfs2_sbd {
 	int sd_log_error; /* First log error */
 	wait_queue_head_t sd_withdraw_wait;
 
+	unsigned int sd_log_tail;
+	unsigned int sd_log_flush_tail;
+	unsigned int sd_log_head;
 	unsigned int sd_log_flush_head;
 
 	spinlock_t sd_ail_lock;
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index ca9fa481913d..6b5584fd8ff7 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -242,6 +242,28 @@ static void gfs2_ail1_start(struct gfs2_sbd *sdp)
 	return gfs2_ail1_flush(sdp, &wbc);
 }
 
+static void gfs2_log_update_flush_tail(struct gfs2_sbd *sdp)
+{
+	unsigned int new_flush_tail = sdp->sd_log_head;
+	struct gfs2_trans *tr;
+
+	if (!list_empty(&sdp->sd_ail1_list)) {
+		tr = list_last_entry(&sdp->sd_ail1_list,
+				     struct gfs2_trans, tr_list);
+		new_flush_tail = tr->tr_first;
+	}
+	sdp->sd_log_flush_tail = new_flush_tail;
+}
+
+static void gfs2_log_update_head(struct gfs2_sbd *sdp)
+{
+	unsigned int new_head = sdp->sd_log_flush_head;
+
+	if (sdp->sd_log_flush_tail == sdp->sd_log_head)
+		sdp->sd_log_flush_tail = new_head;
+	sdp->sd_log_head = new_head;
+}
+
 /**
  * gfs2_ail1_empty_one - Check whether or not a trans in the AIL has been synced
  * @sdp: the filesystem
@@ -317,6 +339,7 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp, int max_revokes)
 		else
 			oldest_tr = 0;
 	}
+	gfs2_log_update_flush_tail(sdp);
 	ret = list_empty(&sdp->sd_ail1_list);
 	spin_unlock(&sdp->sd_ail_lock);
 
@@ -544,30 +567,14 @@ static unsigned int calc_reserved(struct gfs2_sbd *sdp)
 	return reserved;
 }
 
-static unsigned int current_tail(struct gfs2_sbd *sdp)
-{
-	struct gfs2_trans *tr;
-	unsigned int tail;
-
-	spin_lock(&sdp->sd_ail_lock);
-
-	if (list_empty(&sdp->sd_ail1_list)) {
-		tail = sdp->sd_log_head;
-	} else {
-		tr = list_last_entry(&sdp->sd_ail1_list, struct gfs2_trans,
-				tr_list);
-		tail = tr->tr_first;
-	}
-
-	spin_unlock(&sdp->sd_ail_lock);
-
-	return tail;
-}
-
-static void log_pull_tail(struct gfs2_sbd *sdp, unsigned int new_tail)
+static void log_pull_tail(struct gfs2_sbd *sdp)
 {
-	unsigned int dist = log_distance(sdp, new_tail, sdp->sd_log_tail);
+	unsigned int new_tail = sdp->sd_log_flush_tail;
+	unsigned int dist;
 
+	if (new_tail == sdp->sd_log_tail)
+		return;
+	dist = log_distance(sdp, new_tail, sdp->sd_log_tail);
 	ail2_empty(sdp, new_tail);
 	gfs2_log_release(sdp, dist);
 	sdp->sd_log_tail = new_tail;
@@ -822,26 +829,23 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 
 static void log_write_header(struct gfs2_sbd *sdp, u32 flags)
 {
-	unsigned int tail;
 	int op_flags = REQ_PREFLUSH | REQ_FUA | REQ_META | REQ_SYNC;
 	enum gfs2_freeze_state state = atomic_read(&sdp->sd_freeze_state);
 
 	gfs2_assert_withdraw(sdp, (state != SFS_FROZEN));
-	tail = current_tail(sdp);
 
 	if (test_bit(SDF_NOBARRIERS, &sdp->sd_flags)) {
 		gfs2_ordered_wait(sdp);
 		log_flush_wait(sdp);
 		op_flags = REQ_SYNC | REQ_META | REQ_PRIO;
 	}
-	sdp->sd_log_idle = (tail == sdp->sd_log_flush_head);
-	gfs2_write_log_header(sdp, sdp->sd_jdesc, sdp->sd_log_sequence++, tail,
-			      sdp->sd_log_flush_head, flags, op_flags);
+	sdp->sd_log_idle = (sdp->sd_log_flush_tail == sdp->sd_log_flush_head);
+	gfs2_write_log_header(sdp, sdp->sd_jdesc, sdp->sd_log_sequence++,
+			      sdp->sd_log_flush_tail, sdp->sd_log_flush_head,
+			      flags, op_flags);
 	gfs2_log_incr_head(sdp);
 	log_flush_wait(sdp);
-
-	if (sdp->sd_log_tail != tail)
-		log_pull_tail(sdp, tail);
+	log_pull_tail(sdp);
 }
 
 /**
@@ -991,7 +995,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	if (sdp->sd_log_head != sdp->sd_log_flush_head) {
 		log_flush_wait(sdp);
 		log_write_header(sdp, flags);
-	} else if (sdp->sd_log_tail != current_tail(sdp) && !sdp->sd_log_idle) {
+	} else if (sdp->sd_log_tail != sdp->sd_log_flush_tail && !sdp->sd_log_idle) {
 		atomic_dec(&sdp->sd_log_blks_free); /* Adjust for unreserved buffer */
 		trace_gfs2_log_blocks(sdp, -1);
 		log_write_header(sdp, flags);
@@ -1001,7 +1005,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	lops_after_commit(sdp, tr);
 
 	gfs2_log_lock(sdp);
-	sdp->sd_log_head = sdp->sd_log_flush_head;
+	gfs2_log_update_head(sdp);
 	sdp->sd_log_blks_reserved = 0;
 	sdp->sd_log_committed_revoke = 0;
 
@@ -1021,7 +1025,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 			atomic_dec(&sdp->sd_log_blks_free); /* Adjust for unreserved buffer */
 			trace_gfs2_log_blocks(sdp, -1);
 			log_write_header(sdp, flags);
-			sdp->sd_log_head = sdp->sd_log_flush_head;
+			gfs2_log_update_head(sdp);
 		}
 		if (flags & (GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
 			     GFS2_LOG_HEAD_FLUSH_FREEZE))
@@ -1156,7 +1160,7 @@ static void gfs2_log_shutdown(struct gfs2_sbd *sdp)
 	gfs2_assert_warn(sdp, sdp->sd_log_head == sdp->sd_log_tail);
 	gfs2_assert_warn(sdp, list_empty(&sdp->sd_ail2_list));
 
-	sdp->sd_log_head = sdp->sd_log_flush_head;
+	gfs2_log_update_head(sdp);
 	sdp->sd_log_tail = sdp->sd_log_head;
 }
 
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index cbc097ca9244..b36a3539f352 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -43,7 +43,9 @@ static inline void gfs2_log_pointers_init(struct gfs2_sbd *sdp,
 	if (++value == sdp->sd_jdesc->jd_blocks) {
 		value = 0;
 	}
-	sdp->sd_log_head = sdp->sd_log_tail = value;
+	sdp->sd_log_tail = value;
+	sdp->sd_log_flush_tail = value;
+	sdp->sd_log_head = value;
 }
 
 static inline void gfs2_ordered_add_inode(struct gfs2_inode *ip)
-- 
2.26.2

